#include <algorithm>
#include "MessagesDecoder.h"

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
    alloc_table.resize(header.count);
    infile.read((char*)alloc_table.data(), (streamsize)(sizeof(MsgAlloc) * header.count));
    int i = 1;
    for (auto & alloc : alloc_table) {
        alloc.decrypt(header.key, i);
        debug_printf("msg %d: at 0x%08X, count %d\n", i, alloc.offset, alloc.length);
        u16string str;
        str.resize(alloc.length);
        infile.read((char*)str.data(), (2 * alloc.length));
        DecryptU16String(str, i);
        outfiles.push_back(str);
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

        if (charmap_dec.find(code) != charmap_dec.end()) {
            decoded += charmap_dec[code];
        }
        else if (code == (is_trname ? 0x01FF : 0xFFFF)) {
            break;
        }
        else if (code == 0xFFFE) {
            decoded += '{';
            j++;
            code = message[j++];
            string command;
            bool is_strvar = false;
            if (find(strvar_codes.cbegin(), strvar_codes.cend(), code & 0xFF00) != strvar_codes.cend()) {
                is_strvar = true;
                command = "STRVAR_" + ConvertIntToHexStringN((code >> 8), STR_CONV_MODE_LEFT_ALIGN, 2);
            }
            else if (cmdmap_dec.find(code) != cmdmap_dec.end()) {
                command = cmdmap_dec[code];
            } else {
                throw runtime_error("Invalid control code in " + binfilename + ": " + ConvertIntToHexStringN(code, STR_CONV_MODE_LEADING_ZEROS, 4) + " at line " + to_string(i) + ":" + to_string(j));
            }
            decoded += command;
            int nargs = message[j++];
            for (int k = 0; k < nargs; k++) {
                decoded += ' ';
                if (is_strvar) {
                    decoded += ConvertIntToHexStringN(code & 0xFF, STR_CONV_MODE_LEADING_ZEROS, 2) + ", ";
                    is_strvar = false;
                }
                decoded += ConvertIntToHexStringN(message[j + k], STR_CONV_MODE_LEADING_ZEROS, 4);
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
    return decoded;
}

void MessagesDecoder::WriteBinaryFile(string& filename, void* data, streamsize size)
{
    ofstream outfile(filename, ios_base::binary);
    if (!outfile.good()) {
        throw ofstream::failure("Unable to open file \"" + filename + "\" for writing");
    }
    outfile.write((const char *)data, size);
    outfile.close();
}

void MessagesDecoder::WriteMessagesToText(string& filename) {
    stringstream ss;
    for (string& text : files) {
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
    for (int i = 0; i < (int)outfiles.size(); i++) {
        u16string message = outfiles[i];
        string decoded = DecodeMessage(message, i);
        files.push_back(decoded);
    }
}

void MessagesDecoder::WriteOutput()
{
    WriteBinaryFile(keyfilename, &header.key, sizeof(header.key));
    WriteMessagesToText(textfilename);
}
