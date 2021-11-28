#ifndef GUARD_MWERKSXMAPFILE_H
#define GUARD_MWERKSXMAPFILE_H

#ifndef NDEBUG

#include <string>
#include <filesystem>
#include <fstream>
#include <map>

using namespace std;
using namespace std::filesystem;

class MwerksXmapFile {
    map<pair<string, string>, size_t> _section_addrs;
public:
    MwerksXmapFile() = default;
    explicit MwerksXmapFile(path const &filename);
    void open(path const &filename);
    size_t &at(pair<string, string> const &key) {
        return _section_addrs.at(key);
    }
    size_t &operator[](pair<string, string> const &key) {
        return _section_addrs[key];
    }
};

#endif

#endif //GUARD_MWERKSXMAPFILE_H
