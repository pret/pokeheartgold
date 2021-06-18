/*
 * MSGENC: Encodes a Pokemon DP message file to binary
 *
 * Usage:
 *     msgenc TXTFILE KEYFILE CHARMAP OUTFILE
 */

#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <map>
#include <vector>
#include <algorithm>

struct MsgArcHeader
{
    uint16_t count;
    uint16_t key;
};

struct MsgAlloc
{
    uint32_t offset;
    uint32_t length;
};

using namespace std;

string ReadTextFile(string filename) {
    fstream file(filename);
    if (!file.good()) {
        stringstream s;
        s << "unable to open file \"" << filename << "\" for reading";
        throw runtime_error(s.str());
    }
    stringstream ss;
    ss << file.rdbuf();
    file.close();
    return ss.str();
}

static map<string, uint16_t> charmap;

void read_charmap(string filename) {
    string raw = ReadTextFile(filename);
    size_t pos, eqpos, last_pos = 0;
    while (last_pos != string::npos && (pos = raw.find_first_of("\r\n", last_pos)) != string::npos) {
        eqpos = raw.find('=', last_pos);
        if (eqpos == string::npos)
        {
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

static MsgArcHeader header;
vector<MsgAlloc> alloc_table;
static vector<string> files;
static vector<u16string> outfiles;

void read_key(string keyfname) {
    fstream keyfile(keyfname, ios_base::in | ios_base::binary);
    if (!keyfile.good()) {
        stringstream s;
        s << "unable to open file \"" << keyfname << "\" for reading";
        throw runtime_error(s.str());
    }
    keyfile.read((char *)&header.key, 2);
}

void read_msgs(string fname) {
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

uint16_t enc_short(uint16_t value, uint16_t & seed) {
    value ^= seed;
    seed += 18749;
    return value;
}

static map<string, uint16_t> cmdmap = {
    {"STRVAR", 0x0100},
    {"YESNO", 0x200},
    {"PAUSE", 0x201},
    {"WAIT", 0x202},
    {"CURSOR_X", 0x203},
    {"CURSOR_Y", 0x204},
    {"COLOR", 0xFF00},
    {"SIZE", 0xFF01}
};

void encode_messages() {
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
                    encoded += enc_short(0xFFFE, seed);
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
                    encoded += enc_short(command_i, seed);
                    encoded += enc_short(args.size(), seed);
                    for (auto num_i : args) {
                        encoded += enc_short(num_i, seed);
                    }
                } else if (command == "TRNAME") {
                    is_trname = true;
                    encoded += enc_short(0xF100, seed);
                } else {
                    encoded += enc_short(stoi(enclosed, nullptr, 16), seed);
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
                        encoded += enc_short(trnamebuf & 0x7FFF, seed);
                        trnamebuf >>= 15;
                    }
                } else {
                    encoded += enc_short(code, seed);
                }
                j += k;
            }
        }
        if (is_trname && bit > 1) {
            trnamebuf |= 0xFFFF << bit;
            encoded += enc_short(trnamebuf & 0x7FFF, seed);
        }
        encoded += enc_short(0xFFFF, seed);
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

void write_messages(string filename) {
    ofstream outfile(filename, ios_base::binary);
    outfile.write((char *)&header, sizeof(header));
    outfile.write((char *)alloc_table.data(), sizeof(MsgAlloc) * alloc_table.size());
    for (auto m : outfiles) {
        outfile.write((char *)m.c_str(), m.size() * 2);
    }
    outfile.close();
}

int main(int argc, char ** argv) {
    // msgenc TXTFILE KEYFILE CHARMAP OUTFILE
    if (argc < 5)
        throw invalid_argument("usage: msgenc TXTFILE KEYFILE CHARMAP OUTFILE");
    read_msgs(argv[1]);
    read_key(argv[2]);
    read_charmap(argv[3]);
    encode_messages();
    write_messages(argv[4]);
    return 0;
}
