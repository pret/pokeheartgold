#include "MessagesConverter.h"

enum StrConvMode {
    STR_CONV_MODE_LEFT_ALIGN = 0,
    STR_CONV_MODE_RIGHT_ALIGN,
    STR_CONV_MODE_LEADING_ZEROS
};

static string ConvertIntToHexStringN(unsigned value, StrConvMode mode, int n) {
    string dest;
    bool printing_zeroes = mode == STR_CONV_MODE_LEADING_ZEROS;
    unsigned shift = 4 * (n - 1);

    for (int i = 0; i < n; i++) {
        unsigned nybble = (value >> shift) & 0xF;
        if (nybble == 0 && !printing_zeroes) {
            if (i == n - 1) printing_zeroes = true;
            else if (mode == STR_CONV_MODE_RIGHT_ALIGN) {
                dest.push_back(' ');
                continue;
            }
        }
        if (nybble != 0 || printing_zeroes) {
            if (nybble < 10) {
                dest.push_back((char)('0' + nybble));
            } else {
                dest.push_back((char)('A' + nybble - 10));
            }
        }
        shift -= 4;
    }

    return dest;
}

static uint16_t enc_short(uint16_t value, uint16_t & seed) {
    value ^= seed;
    seed += 18749;
    return value;
}

string MessagesConverter::ReadTextFile(string& filename) {
    ifstream file(filename);
    if (!file.good()) {
        throw ifstream::failure("unable to open file \"" + filename + "\" for reading");
    }
    stringstream ss;
    ss << file.rdbuf();
    file.close();
    return ss.str();
}

void MessagesConverter::WriteTextFile(string& filename, string const& contents) {
    ofstream file(filename);
    if (!file.good()) {
        throw ofstream::failure("unable to open file \"" + filename + "\" for writing");
    }
    file << contents;
    file.close();
}

void MessagesConverter::ReadCharmap(string& filename) {
    string raw = ReadTextFile(filename);
    size_t pos, eqpos, last_pos = 0;
    while (last_pos != string::npos && (pos = raw.find_first_of("\r\n", last_pos)) != string::npos) {
        eqpos = raw.find('=', last_pos);
        if (eqpos == string::npos) {
            stringstream s;
            s << "charmap syntax error at " << (charmap.size() + 1);
            throw(runtime_error(s.str()));
        }
        string value = raw.substr(last_pos, eqpos - last_pos);
        string code = raw.substr(eqpos + 1, pos - eqpos - 1);
        uint16_t value_i = stoi(value, nullptr, 16);
        charmap[code] = value_i;
        last_pos = raw.find_last_of("\r\n", pos + 1, 2) + 1;
    }
}

void MessagesConverter::ReadMessagesFromText(string& fname) {
    string text = ReadTextFile(fname);
    size_t pos = 0;
    do {
        text = text.substr(pos);
        if (text.empty())
            break;
        pos = text.find_first_of("\r\n");
        files.push_back(text.substr(0, pos));
        pos = text.find_last_of("\r\n", pos + 1, 2);
        if (pos == string::npos)
            break;
        pos++;
    } while (pos != string::npos);
    header.count = files.size();
}

void MessagesConverter::ReadKeyFile(string& keyfname) {
    ifstream keyfile(keyfname, ios_base::binary);
    if (!keyfile.good()) {
        throw ifstream::failure("unable to open file \"" + keyfname + "\" for reading");
    }
    keyfile.read((char *)&header.key, 2);
}

void MessagesConverter::ReadTextAndKey()
{
    ReadMessagesFromText(textfilename);
    ReadKeyFile(keyfilename);
}

void MessagesConverter::ReadMessagesFromBin(string& filename)
{
    ifstream infile(filename, ios_base::binary);
    if (!infile.good()) {
        throw ifstream::failure("Unable to open file \"" + filename + "\" for reading");
    }
    infile.read((char*)&header, sizeof(header));
    alloc_table.resize(header.count);
    infile.read((char*)alloc_table.data(), (streamsize)(sizeof(MsgAlloc) * header.count));
    int i = 1;
    for (auto & x : alloc_table) {
        uint32_t alloc_key = (765 * i * header.key) & 0xFFFF;
        alloc_key |= alloc_key << 16;
        x.offset ^= alloc_key;
        x.length ^= alloc_key;
        uint16_t seed = i * 596947;
        u16string str;
        for (uint32_t j = 0; j < x.length; j++) {
            uint16_t code;
            infile.read((char*)&code, 2);
            code = enc_short(code, seed);
            str.push_back(code);
        }
        outfiles.push_back(str);
        i++;
    }
    infile.close();
}

void MessagesConverter::ReadBinary()
{
    ReadMessagesFromBin(binfilename);
}

void MessagesConverter::CreateInverseMaps()
{
    CreateInverseMap(charmap, charmap_dec);
    CreateInverseMap(cmdmap, cmdmap_dec);
}

void MessagesConverter::WriteMessagesToText(string& filename) {
    stringstream ss;
    for (string& text : files) {
        ss << text << "\r\n";
    }
    WriteTextFile(filename, ss.str());
}

void MessagesConverter::EncodeMessages() {
    int i = 1;
    for (auto message : files) {
        u16string encoded;
        uint16_t seed = i * 596947;
        bool is_trname = false;
        uint32_t trnamebuf = 0;
        int bit = 0;
        for (size_t j = 0; j < message.size(); j++) {
            if (message[j] == '{') {
                size_t k = message.find('}', j);
                string enclosed = message.substr(j + 1, k - j - 1);
                j = k;
                size_t pos = enclosed.find(' ');
                string command = enclosed.substr(0, pos);
                enclosed = enclosed.substr(pos + 1);
                if (cmdmap.find(command) != cmdmap.end()) {
                    uint16_t command_i = cmdmap[command];
                    encoded.push_back(enc_short(0xFFFE, seed));
                    vector<uint16_t> args;
                    do {
                        k = enclosed.find(',');
                        string num = enclosed.substr(0, k);
                        uint16_t num_i = stoi(num);
                        args.push_back(num_i);
                        enclosed = enclosed.substr(k + 1);
                    } while (k++ != string::npos);

                    if (command == "STRVAR") {
                        command_i |= args[0];
                        args.erase(args.begin());
                    }
                    encoded.push_back(enc_short(command_i, seed));
                    encoded.push_back(enc_short(args.size(), seed));
                    for (auto num_i : args) {
                        encoded.push_back(enc_short(num_i, seed));
                    }
                } else if (command == "TRNAME") {
                    is_trname = true;
                    encoded.push_back(enc_short(0xF100, seed));
                } else {
                    encoded.push_back(enc_short(stoi(enclosed, nullptr, 16), seed));
                }
            } else {
                uint16_t code = 0;
                size_t k;
                string substr;
                for (k = 0; k < message.size() - j; k++) {
                    substr = message.substr(j, k + 1);
                    code = charmap[substr];
                    if (code != 0 || substr == "\\x0000")
                        break;
                }
                if (code == 0 && substr != "\\x0000") {
                    stringstream ss;
                    ss << "unrecognized character: file " << i << " pos " << (j + 1);
                    throw runtime_error(ss.str());
                }
                if (is_trname) {
                    if (code & ~0x1FF) {
                        stringstream ss;
                        ss << "invalid character for bitpacked string: " << substr;
                        throw runtime_error(ss.str());
                    }
                    trnamebuf |= code << bit;
                    bit += 9;
                    if (bit >= 15) {
                        bit -= 15;
                        encoded.push_back(enc_short(trnamebuf & 0x7FFF, seed));
                        trnamebuf >>= 15;
                    }
                } else {
                    encoded.push_back(enc_short(code, seed));
                }
                j += k;
            }
        }
        if (is_trname && bit > 1) {
            trnamebuf |= 0xFFFF << bit;
            encoded.push_back(enc_short(trnamebuf & 0x7FFF, seed));
        }
        encoded.push_back(enc_short(0xFFFF, seed));
        MsgAlloc alloc {0, 0};
        if (i > 1) {
            alloc.offset = alloc_table[i - 2].offset + alloc_table[i - 2].length * 2;
        } else {
            alloc.offset = sizeof(header) + sizeof(MsgAlloc) * header.count;
        }
        alloc.length = encoded.size();
        outfiles.push_back(encoded);
        alloc_table.push_back(alloc);
        i++;
    }
    i = 1;
    for (auto & x : alloc_table) {
        uint32_t alloc_key = (765 * i * header.key) & 0xFFFF;
        alloc_key |= alloc_key << 16;
        x.offset ^= alloc_key;
        x.length ^= alloc_key;
        i++;
    }
}

u16string MessagesConverter::DecodeTrainerNameMessage(u16string const &message)
{
    uint32_t trnamebuf = 0;
    int bit = 0;
    u16string out = u"\uf100";
    for (auto code_p = message.cbegin() + 1; code_p < message.cend(); code_p++) {
        trnamebuf = (trnamebuf << 15) | *code_p;
        bit += 15;
        while (bit >= 9) {
            out.push_back((char16_t)((trnamebuf >> bit) & 0x1FF));
            bit -= 9;
        }
    }
    return out;
}

void MessagesConverter::DecodeMessages()
{
    for (size_t i = 0; i < outfiles.size(); i++) {
        u16string message = outfiles[i];
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
                decoded.push_back('{');
                j++;
                code = message[j++];
                string command;
                bool is_strvar = false;
                if ((code & 0xFF00) == 0x0100) {
                    is_strvar = true;
                    command = "STRVAR";
                }
                else if (cmdmap_dec.find(code) != cmdmap_dec.end()) {
                    command = cmdmap_dec[code];
                } else command = ConvertIntToHexStringN(code, STR_CONV_MODE_LEADING_ZEROS, 4);
                decoded += command;
                int nargs = message[j++];
                for (int k = 0; k < nargs; k++) {
                    decoded.push_back(' ');
                    if (is_strvar) {
                        decoded += ConvertIntToHexStringN(code & 0xFF, STR_CONV_MODE_LEADING_ZEROS, 2);
                        nargs--;
                        k--;
                        is_strvar = false;
                    }
                    else
                        decoded += ConvertIntToHexStringN(message[j + k], STR_CONV_MODE_LEADING_ZEROS, 4);
                    if (k != nargs - 1)
                        decoded += ',';
                }
                decoded.push_back('}');
                j += nargs - !((code & 0xFF00) == 0x0100);
            }
            else if (code == 0xF100) {
                message = DecodeTrainerNameMessage(message);
                is_trname = true;
            }
            else {
                throw runtime_error("invalid character " + ConvertIntToHexStringN(code, STR_CONV_MODE_LEADING_ZEROS, 4) + " at " + to_string(i) + ":" + to_string(j));
            }
        }
        files.push_back(decoded);
    }
}

void MessagesConverter::WriteBinaryFile(string& filename, void* data, streamsize size)
{
    ofstream outfile(filename, ios_base::binary);
    if (!outfile.good()) {
        throw ofstream::failure("Unable to open file \"" + filename + "\" for writing");
    }
    outfile.write((const char *)data, size);
    outfile.close();
}

void MessagesConverter::WriteTextAndKey()
{
    WriteBinaryFile(keyfilename, &header.key, sizeof(header.key));
    WriteMessagesToText(textfilename);
}

void MessagesConverter::WriteMessagesToBin(string& filename) {
    ofstream outfile(filename, ios_base::binary);
    if (!outfile.good()) {
        throw ofstream::failure("Unable to open file \"" + filename + "\" for writing");
    }
    outfile.write((char *)&header, sizeof(header));
    outfile.write((char *)alloc_table.data(), (streamsize)(sizeof(MsgAlloc) * alloc_table.size()));
    for (const u16string & m : outfiles) {
        outfile.write((char *)m.c_str(), (streamsize)(m.size() * 2));
    }
    outfile.close();
}

void MessagesConverter::WriteBinary() {
    WriteMessagesToBin(binfilename);
}
