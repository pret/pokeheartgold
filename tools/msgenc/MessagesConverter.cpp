#include "MessagesConverter.h"

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

MessagesConverter::~MessagesConverter() {}
