#include <iostream>
#include <algorithm>
#include <cstring>
#include "BuildAnalyzer.h"
#include "Glob.h"

string default_version;

void BuildAnalyzer::AnalyzeObject(path fname_s) {
    string ext = fname_s.extension();
    SourceType sourceType = ext == ".s" ? SOURCE_ASM : SOURCE_C;
    fname_s = builddir / relative(fname_s, srcbase);
    fname_s = fname_s.replace_extension(".o");
    if (!exists(fname_s)) {
        throw runtime_error("No such file: " + fname_s.string());
    }

    Elf32File elf(fname_s);

    path fname_b = fname_s.filename();

    // Analyze sections
    for (Elf32_Shdr & hdr : elf.GetSectionHeaders()) {
        string shname = elf.GetSectionName(hdr);
        SectionType sectionType = GetSectionType(shname);
        if (sectionType != SECTION_OTHER) {
            sizes[sectionType][sourceType] += (hdr.sh_size + 3) & ~3;
            auto data = elf.ReadSectionData<unsigned>(hdr);
            for (const auto & word : data) {
                if (word == 0) {
                    continue; // might be a relocation
                }
                if (find_if(program.GetProgramHeaders().cbegin(), program.GetProgramHeaders().cend(), [&word](const auto & phdr) {
                    return phdr.p_vaddr <= word && word < phdr.p_vaddr + phdr.p_memsz;
                }) != program.GetProgramHeaders().cend() && word > 0x01000000) {
#ifndef NDEBUG
                    try {
                        unsigned addr = (&word - &*data.cbegin()) * 4 + xmap.at({fname_b.string(), shname});
                        fprintf(stderr, "%s\t%08X\t%08X\n", fname_b.c_str(), addr, word);
                    } catch (const out_of_range &e) {
                        fprintf(stderr, "Error: missing xmap reference to %s:%s\n", fname_b.c_str(), shname.c_str());
                        throw e;
                    }
#endif
                    n_hardcoded++;
                }
            }
        } else if (hdr.sh_type == SHT_RELA) {
            n_relocations += elf.GetSectionElementCount<Elf32_Rela>(hdr);
        } else if (hdr.sh_type == SHT_REL) {
            n_relocations += elf.GetSectionElementCount<Elf32_Rel>(hdr);
        }
    }
}

void BuildAnalyzer::reset() {
    memset(sizes, 0, sizeof(sizes));
    if (!version.empty()) {
        sizes[SECTION_TEXT][SOURCE_ASM] = 0x800; // libsyscall.a
    }
    n_hardcoded = 0;
    n_relocations = 0;
}

void BuildAnalyzer::LoadProgramElf() {
    string elfpat = builddir + "/*.elf";
    Glob globber(elfpat, GLOB_TILDE | GLOB_BRACE | GLOB_NOSORT);
    if (globber.empty()) {
        throw runtime_error("unable to find an ELF file with section data");
    }
    program.open(globber[0], Elf32File::sections | Elf32File::programs);
}

#ifndef NDEBUG
void BuildAnalyzer::LoadProgramXmap() {
    string xmappat = builddir + "/*.xMAP";
    Glob globber(xmappat, GLOB_TILDE | GLOB_BRACE | GLOB_NOSORT);
    if (globber.empty()) {
        throw runtime_error("unable to find an xMAP file with object load info");
    }
    xmap.open(globber[0]);
}
#endif

BuildAnalyzer::BuildAnalyzer(path &_basedir, path &_subdir, string &_version) :
    basedir(_basedir),
    subdir(_subdir),
    version(_version)
{
    reset();
    srcbase = basedir / subdir;
    builddir = srcbase / "build" / version;
    if (!exists(srcbase)) {
        throw runtime_error("No such directory: " + srcbase.string());
    }

    LoadProgramElf();
#ifndef NDEBUG
    LoadProgramXmap();
#endif
}

BuildAnalyzer &BuildAnalyzer::operator()() {
    if (analyzed) {
        reset();
    }
    string pattern = srcbase.string() + "/{src,asm,lib/{src,asm},lib/{NitroSDK,NitroDWC}/{src,asm}}/{,*/,*/*/}*.{c,s,cpp}";
    for (char const * & fname : Glob(pattern, GLOB_TILDE | GLOB_BRACE | GLOB_NOSORT)) {
        AnalyzeObject(fname);
    }
    analyzed = true;
    return *this;
}

ostream &operator<<(ostream &strm, BuildAnalyzer &_this) {
    if (!_this.analyzed) {
        strm << "Haven't analyzed this ROM, please call the BuildAnalyzer instance" << endl;
        return strm;
    }

    strm << "Analysis of " << (_this.version.empty() ? _this.subdir.string() : _this.version) << " binary:" << endl;
    // Report code
    unsigned total_text = _this.sizes[SECTION_TEXT][SOURCE_C] + _this.sizes[SECTION_TEXT][SOURCE_ASM];
    if (total_text != 0) {
        double total_text_d = total_text;
        double src_text_d = _this.sizes[SECTION_TEXT][SOURCE_C];
        double asm_text_d = _this.sizes[SECTION_TEXT][SOURCE_ASM];
        strm << "  " << total_text << " total bytes of code" << endl;
        strm << "    " << _this.sizes[SECTION_TEXT][SOURCE_C] << " bytes of code in src (" << (src_text_d / total_text_d * 100.0) << "%)" << endl;
        strm << "    " << _this.sizes[SECTION_TEXT][SOURCE_ASM] << " bytes of code in asm (" << (asm_text_d / total_text_d * 100.0) << "%)" << endl;
    }
    strm << endl;
    // Report data
    unsigned total_data = _this.sizes[SECTION_DATA][SOURCE_C] + _this.sizes[SECTION_DATA][SOURCE_ASM];
    if (total_data != 0) {
        double total_data_d = total_data;
        double src_data_d = _this.sizes[SECTION_DATA][SOURCE_C];
        double asm_data_d = _this.sizes[SECTION_DATA][SOURCE_ASM];
        strm << "  " << total_data << " total bytes of data" << endl;
        strm << "    " << _this.sizes[SECTION_DATA][SOURCE_C] << " bytes of data in src (" << (src_data_d / total_data_d * 100.0) << "%)" << endl;
        strm << "    " << _this.sizes[SECTION_DATA][SOURCE_ASM] << " bytes of data in asm (" << (asm_data_d / total_data_d * 100.0) << "%)" << endl;
    }
    strm << endl;
    // Report hardcoded pointers
    unsigned total_pointers = _this.n_hardcoded + _this.n_relocations;
    if (total_pointers != 0) {
        double total_pointers_d = total_pointers;
        double hardcoded_pointers_d = _this.n_hardcoded;
        double relocated_pointers_d = _this.n_relocations;
        strm << "  " << total_pointers << " total pointers" << endl;
        strm << "    " << _this.n_relocations << " properly-linked pointers (" << (relocated_pointers_d / total_pointers_d * 100.0) << "%)" << endl;
        strm << "    " << _this.n_hardcoded << " hard-coded pointers (" << (hardcoded_pointers_d / total_pointers_d * 100.0) << "%)" << endl;
    }
    return strm;
}
