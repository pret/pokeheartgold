#ifndef GUARD_OPTIONS_H
#define GUARD_OPTIONS_H

#include <string>
#include "RelocElfReader.h"

using namespace std;

class command_error : public exception {
    const char *_what;
public:
    explicit command_error(const char *s) {_what = s;}
    explicit command_error(const string &s) {_what = s.c_str();}
    const char *what() const noexcept override { return _what; }
};

class Options {
    vector<string> posargs;
    bool flatten = false;
    bool naix = false;
    char padval = '\xFF';
    Elf objfile;
    ofstream narcfile;

    void ReadObjectFile(vector<unsigned char> &rodata, vector<uint32_t> &sizes);
    void OverwritePadding(vector<unsigned char> &rodata, vector<uint32_t> &sizes) const;
    void WriteNarc(vector<unsigned char> &rodata, vector<uint32_t> &sizes);
    void WriteNaix(vector<uint32_t> &sizes);
public:
    Options(int argc, char ** argv);
    int main();
};

#endif //GUARD_OPTIONS_H
