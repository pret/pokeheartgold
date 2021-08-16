#include "MessagesEncoder.h"

void MessagesEncoder::ReadMessagesFromText(string& fname) {
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

void MessagesEncoder::ReadKeyFile(string& keyfname) {
    ifstream keyfile(keyfname, ios_base::binary);
    if (!keyfile.good()) {
        throw ifstream::failure("unable to open file \"" + keyfname + "\" for reading");
    }
    keyfile.read((char *)&header.key, 2);
    keyfile.close();
}

u16string MessagesEncoder::EncodeMessage(const string & message, int & i) {
    u16string encoded;
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
                encoded += (char16_t)(0xFFFE);
                vector<uint16_t> args;
                if (pos != enclosed.npos) {
                    do {
                        k = enclosed.find(',');
                        string num = enclosed.substr(0, k);
                        uint16_t num_i = stoi(num);
                        args.push_back(num_i);
                        enclosed = enclosed.substr(k + 1);
                    } while (k++ != string::npos);
                    if (command.rfind("STRVAR_", 0) == 0) {
                        command_i |= args[0];
                        args.erase(args.begin());
                    }
                }
                encoded += (char16_t)(command_i);
                encoded += (char16_t)(args.size());
                for (auto num_i : args) {
                    encoded += (char16_t)(num_i);
                }
            } else if (command == "TRNAME") {
                is_trname = true;
                encoded += (char16_t)(0xF100);
            } else {
                encoded += (char16_t)(stoi(enclosed, nullptr, 16));
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
                ss << "unrecognized character in " << textfilename << ": line " << i << " pos " << (j + 1) << " value " << substr;
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
                    encoded += (char16_t)(trnamebuf & 0x7FFF);
                    trnamebuf >>= 15;
                }
            } else {
                encoded += (char16_t)(code);
            }
            j += k;
        }
    }
    if (is_trname && bit > 1) {
        trnamebuf |= 0xFFFF << bit;
        encoded += (char16_t)(trnamebuf & 0x7FFF);
    }
    encoded += (char16_t)(0xFFFF);
    return encoded;
}

void MessagesEncoder::WriteMessagesToBin(string& filename) {
    ofstream outfile(filename, ios_base::binary);
    if (!outfile.good()) {
        throw ofstream::failure("Unable to open file \"" + filename + "\" for writing");
    }
    outfile.write((char *)&header, sizeof(header));
    for (int i = 1; i <= alloc_table.size(); i++) {
        alloc_table[i - 1].encrypt(header.key, i);
        EncryptU16String(outfiles[i - 1], i);
    }
    outfile.write((char *)alloc_table.data(), (streamsize)(sizeof(MsgAlloc) * alloc_table.size()));
    for (const u16string & m : outfiles) {
        outfile.write((char *)m.c_str(), (streamsize)(m.size() * 2));
    }
    outfile.close();
}

// Public virtual functions

void MessagesEncoder::ReadInput()
{
    ReadMessagesFromText(textfilename);
    ReadKeyFile(keyfilename);
}

void MessagesEncoder::Convert() {
    MsgAlloc alloc {(uint32_t)(sizeof(header) + sizeof(MsgAlloc) * header.count), 0};
    int i = 1;
    for (auto message : files) {
        u16string encoded = EncodeMessage(message, i);
        alloc.length = encoded.size();
        outfiles.push_back(encoded);
        debug_printf("msg %d: at 0x%08X, count %d\n", i, alloc.offset, alloc.length);
        alloc_table.push_back(alloc);
        alloc.offset += alloc.length * 2;
        i++;
    }
}

void MessagesEncoder::WriteOutput() {
    WriteMessagesToBin(binfilename);
}
