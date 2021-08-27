#include <algorithm>
#include "MessagesDecoder.h"

void MessagesDecoder::CmdmapRegisterCommand(string &command, uint16_t value)
{
    cmdmap[value] = command;
    if (command.rfind("STRVAR_", 0) == 0)
        strvar_codes.insert(value);
}

void MessagesDecoder::CharmapRegisterCharacter(string &code, uint16_t value)
{
    charmap[value] = code;
}

static string ConvertIntToHexStringN(unsigned value, StrConvMode mode, int n) {
    string dest;
    bool printing_zeroes = mode == STR_CONV_MODE_LEADING_ZEROS;
    unsigned shift = 4 * (n - 1);

    for (int i = 0; i < n; i++) {
        unsigned nybble = (value >> shift) & 0xF;
        if (nybble == 0 && !printing_zeroes) {
            if (i == n - 1) printing_zeroes = true;
            else if (mode == STR_CONV_MODE_RIGHT_ALIGN) {
                dest += ' ';
                continue;
            }
        }
        if (nybble != 0 || printing_zeroes) {
            if (nybble < 10) {
                dest += (char)('0' + nybble);
            } else {
                dest += (char)('A' + nybble - 10);
            }
        }
        shift -= 4;
    }

    return dest;
}

void MessagesDecoder::ReadMessagesFromBin(string& filename)
{
    ifstream infile(filename, ios_base::binary);
    if (!infile.good()) {
        throw ifstream::failure("Unable to open file \"" + filename + "\" for reading");
    }
    infile.read((char*)&header, sizeof(header));
    debug_printf("%d lines\n", header.count);
    alloc_table.resize(header.count);
    infile.read((char*)alloc_table.data(), (streamsize)(sizeof(MsgAlloc) * header.count));
    int i = 1;
    for (auto & alloc : alloc_table) {
        alloc.decrypt(header.key, i);
        u16string str;
        str.resize(alloc.length);
        infile.read((char*)str.data(), (2 * alloc.length));
        DecryptU16String(str, i);
        vec_encoded.push_back(str);
        i++;
    }
    infile.close();
}

u16string MessagesDecoder::DecodeTrainerNameMessage(u16string const &message)
{
    int bit = 0;
    u16string out = u"\uf100";
    auto src_p = message.cbegin() + 1;
    char16_t cur_char;
    do {
        cur_char = ((*src_p >> bit) & 0x1FF);
        bit += 9;
        if (bit >= 15) {
            src_p++;
            bit -= 15;
            if (bit != 0 && src_p < message.cend()) {
                cur_char |= (*src_p << (9 - bit)) & 0x1FF;
            }
        }
        out += cur_char;
    } while (src_p < message.cend() && cur_char != 0x1FF);
    return out;
}

string MessagesDecoder::DecodeMessage(u16string &message, int &i) {
    string decoded;
    bool is_trname = false;
    for (size_t j = 0; j < message.size(); j++) {
        uint16_t code = message[j];
        debug_printf("%04X ", code);

        if (charmap.find(code) != charmap.end()) {
            decoded += charmap[code];
        }
        else if (code == (is_trname ? 0x01FF : 0xFFFF)) {
            break;
        }
        else if (code == 0xFFFE) {
            decoded += '{';
            j++;
            code = message[j++];
            debug_printf("%04X ", code);
            string command;
            bool is_strvar = false;
            if (find(strvar_codes.cbegin(), strvar_codes.cend(), code & 0xFF00) != strvar_codes.cend()) {
                is_strvar = true;
                command = "STRVAR_" + ConvertIntToHexStringN((code >> 8), STR_CONV_MODE_LEFT_ALIGN, 2);
            }
            else if (cmdmap.find(code) != cmdmap.end()) {
                command = cmdmap[code];
            } else {
                throw runtime_error("Invalid control code in " + binfilename + ": " + ConvertIntToHexStringN(code, STR_CONV_MODE_LEADING_ZEROS, 4) + " at line " + to_string(i) + ":" + to_string(j));
            }
            decoded += command;
            int nargs = message[j++];
            debug_printf("%04X ", nargs);
            if (is_strvar) {
                decoded += ' ';
                decoded += to_string(code & 0xFF);
                if (nargs != 0)
                    decoded += ',';
            }
            for (int k = 0; k < nargs; k++) {
                decoded += ' ';
                decoded += to_string(message[j + k]);
                debug_printf("%04X ", message[j + k]);
                if (k != nargs - 1)
                    decoded += ',';
            }
            decoded += '}';
            j += nargs - 1;
        }
        else if (code == 0xF100) {
            decoded += "{TRNAME}";
            message = DecodeTrainerNameMessage(message);
            is_trname = true;
        }
        else {
            throw runtime_error("invalid character in " + binfilename + ": " + ConvertIntToHexStringN(code, STR_CONV_MODE_LEADING_ZEROS, 4) + " at " + to_string(i) + ":" + to_string(j));
        }
    }
    MsgAlloc & alloc = alloc_table[i];
    debug_printf("msg %d: at 0x%08X, count %d\n", i + 1, alloc.offset, alloc.length);
    return decoded;
}

template <typename T> void MessagesDecoder::WriteBinaryFile(string& filename, T& data) {
    ofstream outfile(filename, ios_base::binary);
    if (!outfile.good()) {
        throw ofstream::failure("Unable to open file \"" + filename + "\" for writing");
    }
    outfile.write((const char *)&data, sizeof(data));
    outfile.close();
}

void MessagesDecoder::WriteMessagesToText(string& filename) {
    stringstream ss;
    for (string& text : vec_decoded) {
        ss << text << "\r\n";
    }
    WriteTextFile(filename, ss.str());
}

// Public virtual functions

void MessagesDecoder::ReadInput()
{
    ReadMessagesFromBin(binfilename);
}

void MessagesDecoder::Convert()
{
    for (int i = 0; i < (int)vec_encoded.size(); i++) {
        u16string message = vec_encoded[i];
        string decoded = DecodeMessage(message, i);
        vec_decoded.push_back(decoded);
    }
}

void MessagesDecoder::WriteOutput()
{
    WriteMessagesToText(textfilename);
}
