#ifndef CALCROM_BUILDANALYZER_H
#define CALCROM_BUILDANALYZER_H

#include <filesystem>
#include <utility>
#include <vector>
#include <unordered_set>
#include "ElfFile.h"

using namespace std;
using namespace std::filesystem;

extern string default_version;

enum SectionType {
    SECTION_DATA,
    SECTION_TEXT,
    SECTION_MAX,
    SECTION_OTHER = -1
};

enum SourceType {
    SOURCE_C,
    SOURCE_ASM,
    SOURCE_MAX
};

static enum SourceType GetSourceType(const path &fname) {
    string ext = fname.extension();
    return ext == ".s" ? SOURCE_ASM : SOURCE_C;
}

static enum SectionType GetSectionType(const string &shname) {
    if (shname == ".text" || shname == ".init" || shname == ".itcm") {
        return SECTION_TEXT;
    } else if (shname == ".data" || shname == ".rodata" || shname == ".sdata" || shname == ".dtcm") {
        return SECTION_DATA;
    } else {
        return SECTION_OTHER;
    }
}

class BuildAnalyzer {
    bool analyzed = false;
    path basedir;
    path subdir;
    string version = "";
    path srcbase;
    string builddir;
    Elf32File program;

    // Accumulate sizes
    //        src   asm
    // data  _____|_____
    // text       |
    unsigned sizes[SECTION_MAX][SOURCE_MAX] = {{0, 0}, {0, 0}};
    unsigned n_hardcoded = 0;
    unsigned n_relocations = 0;

    void reset();
    void AnalyzeObject(path fname_s);
public:
    BuildAnalyzer(path &_basedir, path &_subdir, string &_version = default_version);
    BuildAnalyzer &operator()();
    friend ostream &operator<<(ostream &strm, BuildAnalyzer &_this);
};

#endif //CALCROM_BUILDANALYZER_H
