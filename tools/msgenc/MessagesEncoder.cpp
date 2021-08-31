#include "MessagesEncoder.h"

void MessagesEncoder::CmdmapRegisterCommand(string &command, uint16_t value)
{
    cmdmap[command] = value;
}

void MessagesEncoder::CharmapRegisterCharacter(string &code, uint16_t value)
{
    charmap[code] = value;
}

void MessagesEncoder::ReadMessagesFromText(string& fname) {
    string text = ReadTextFile(fname);
    size_t pos = 0;
    do {
        text = text.substr(pos);
        if (text.empty())
            break;
        pos = text.find_first_of("\r\n");
        vec_decoded.push_back(text.substr(0, pos));
        pos = text.find_last_of("\r\n", pos + 1, 2);
        if (pos == string::npos)
            break;
        pos++;
    } while (pos != string::npos);
    header.count = vec_decoded.size();
    debug_printf("%d lines\n", header.count);
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
                debug_printf("%04X ", 0xFFFE);
                vector<uint16_t> args;
                if (pos != string::npos) {
                    do {
                        k = enclosed.find(',');
                        string num = enclosed.substr(0, k);
                        uint16_t num_i = stoi(num);
                        args.push_back(num_i);
                        enclosed = enclosed.substr(k + 1);
                    } while (k != string::npos);
                    if (command.rfind("STRVAR_", 0) == 0) {
                        command_i |= args[0];
                        args.erase(args.begin());
                    }
                }
                encoded += (char16_t)(command_i);
                debug_printf("%04X ", command_i);
                encoded += (char16_t)(args.size());
                debug_printf("%04X ", (unsigned)args.size());
                for (auto num_i : args) {
                    encoded += (char16_t)(num_i);
                    debug_printf("%04X ", num_i);
                }
            } else if (command == "TRNAME") {
                is_trname = true;
                encoded += (char16_t)(0xF100);
                debug_printf("%04X ", 0xF100);
            } else {
                encoded += (char16_t)(stoi(enclosed, nullptr, 16));
                debug_printf("%04X ", stoi(enclosed, nullptr, 16));
            }
        } else {
            uint16_t code = 0;
            size_t k;
            string substr;
            for (k = 0; k < message.size() - j; k++) {
                substr = message.substr(j, k + 1);
                try {
                    code = charmap.at(substr);
                    break;
                } catch (out_of_range& oor) { /* silently discard */}
            }
            if (code == 0 && substr != "\\x0000") {
                stringstream ss;
                ss << "unrecognized character in " << textfilename << ": line " << i << " pos " << (j + 1) << " value " << substr;
                throw runtime_error(ss.str());
            }
            debug_printf("%04X ", code);
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
        debug_printf("%04X ", trnamebuf & 0x7FFF);
    }
    encoded += (char16_t)(0xFFFF);
    debug_printf("%04X ", 0xFFFF);
    return encoded;
}

void MessagesEncoder::WriteMessagesToBin(string& filename) {
    ofstream outfile(filename, ios_base::binary);
    if (!outfile.good()) {
        throw ofstream::failure("Unable to open file \"" + filename + "\" for writing");
    }
    outfile.write((char *)&header, sizeof(header));
    for (int i = 1; i <= (int)alloc_table.size(); i++) {
        alloc_table[i - 1].encrypt(header.key, i);
        EncryptU16String(vec_encoded[i - 1], i);
    }
    outfile.write((char *)alloc_table.data(), (streamsize)(sizeof(MsgAlloc) * alloc_table.size()));
    for (const u16string & m : vec_encoded) {
        outfile.write((char *)m.c_str(), (streamsize)(m.size() * 2));
    }
    outfile.close();
}

// Public virtual functions

void MessagesEncoder::ReadInput()
{
    ReadMessagesFromText(textfilename);
}

void MessagesEncoder::Convert() {
    MsgAlloc alloc {(uint32_t)(sizeof(header) + sizeof(MsgAlloc) * header.count), 0};
    int i = 1;
    for (const auto& message : vec_decoded) {
        u16string encoded = EncodeMessage(message, i);
        alloc.length = encoded.size();
        vec_encoded.push_back(encoded);
        debug_printf("msg %d: at 0x%08X, count %d\n", i, alloc.offset, alloc.length);
        alloc_table.push_back(alloc);
        alloc.offset += alloc.length * 2;
        i++;
    }
}

void MessagesEncoder::WriteOutput() {
    WriteMessagesToBin(binfilename);
}
