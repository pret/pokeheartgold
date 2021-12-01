#ifndef NDEBUG

#include "MwerksXmapFile.h"
#include <regex>
#include <iostream>

MwerksXmapFile::MwerksXmapFile(path const &filename) {
    open(filename);
}

void MwerksXmapFile::open(path const &filename) {
    ifstream infile(filename);
    string line;
    while (getline(infile, line)) {
        // Search for declaration of section begin
        try {
            unsigned addr = stoi(line.substr(2, 8), nullptr, 16);
            stoi(line.substr(11, 8), nullptr, 16);
            line = line.substr(20);
            size_t space_pos = line.find(' ');
            string secname = line.substr(0, space_pos);
            line = line.substr(line.find('(') + 1, line.find(')') - line.find('(') - 1);
            size_t &pos = _section_addrs[{line, secname}];
            if (pos == 0 || pos > addr) {
                pos = addr;
            }
        } catch (const invalid_argument &e) {
            continue;
        } catch (const out_of_range &e) {
            continue;
        }
    }
}

#endif
