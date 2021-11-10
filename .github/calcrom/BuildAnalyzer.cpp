#include <iostream>
#include "BuildAnalyzer.h"
#include "Glob.h"
#include "ElfFile.h"

string default_version("");

void BuildAnalyzer::AnalyzeObject(path fname_s) {
#ifndef NDEBUG
    cerr << fname_s;
#endif
    string ext = fname_s.extension();
    SourceType sourceType = ext == ".s" ? SOURCE_ASM : SOURCE_C;
    fname_s = builddir / relative(fname_s, srcbase);
    fname_s = fname_s.replace_extension(".o");
#ifndef NDEBUG
    cerr << " --> " << fname_s << endl;
#endif
    if (!exists(fname_s)) {
        throw runtime_error("No such file: " + fname_s.string());
    }

    Elf32File elf(fname_s);

    // Analyze sections
    for (Elf32_Shdr & hdr : elf.GetSectionHeaders()) {
        string shname = elf.GetSectionName(hdr);
        SectionType sectionType = GetSectionType(shname);
        if (sectionType != SECTION_OTHER) {
            sizes[sectionType][sourceType] += (hdr.sh_size + 3) & ~3;
        }
    }
}

BuildAnalyzer::BuildAnalyzer(path &_basedir, path &_subdir, string &_version) :
    basedir(_basedir),
    subdir(_subdir),
    version(_version)
{
    if (!version.empty()) {
        sizes[SECTION_TEXT][SOURCE_ASM] = 0x800; // libsyscall.a
    }
    srcbase = basedir / subdir;
    builddir = srcbase / "build" / version;
    if (!exists(srcbase)) {
        throw runtime_error("No such directory: " + srcbase.string());
    }
}

BuildAnalyzer &BuildAnalyzer::operator()() {
    string pattern = srcbase.string() + "/{src,asm,lib/{src,asm},lib/{!syscall}/{src,asm}}/*.{c,s,cpp}";
    for (char const * & fname : Glob(pattern, GLOB_TILDE | GLOB_BRACE | GLOB_NOSORT)) {
        AnalyzeObject(fname);
    }
    return *this;
}

ostream &operator<<(ostream &strm, BuildAnalyzer &_this) {

    strm << "Analysis of " << (_this.version.empty() ? _this.subdir.string() : _this.version) << " binary:" << endl;
    // Report code
    unsigned total_text = _this.sizes[SECTION_TEXT][SOURCE_C] + _this.sizes[SECTION_TEXT][SOURCE_ASM];
    double total_text_d = total_text;
    double src_text_d = _this.sizes[SECTION_TEXT][SOURCE_C];
    double asm_text_d = _this.sizes[SECTION_TEXT][SOURCE_ASM];
    strm << "  " << total_text << " total bytes of code" << endl;
    strm << "    " << _this.sizes[SECTION_TEXT][SOURCE_C] << " bytes of code in src (" << (src_text_d / total_text_d * 100.0) << "%)" << endl;
    strm << "    " << _this.sizes[SECTION_TEXT][SOURCE_ASM] << " bytes of code in asm (" << (asm_text_d / total_text_d * 100.0) << "%)" << endl;
    strm << endl;
    // Report data
    unsigned total_data = _this.sizes[SECTION_DATA][SOURCE_C] + _this.sizes[SECTION_DATA][SOURCE_ASM];
    double total_data_d = total_data;
    double src_data_d = _this.sizes[SECTION_DATA][SOURCE_C];
    double asm_data_d = _this.sizes[SECTION_DATA][SOURCE_ASM];
    strm << "  " << total_data << " total bytes of data" << endl;
    strm << "    " << _this.sizes[SECTION_DATA][SOURCE_C] << " bytes of data in src (" << (src_data_d / total_data_d * 100.0) << "%)" << endl;
    strm << "    " << _this.sizes[SECTION_DATA][SOURCE_ASM] << " bytes of data in asm (" << (asm_data_d / total_data_d * 100.0) << "%)" << endl;
    return strm;
}
