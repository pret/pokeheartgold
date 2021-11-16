#include "Options.h"

template <typename V>
V& to_upper(V& vec) {
    std::for_each(vec.begin(), vec.end(), [](typename V::value_type &x) { x = std::toupper(x); });
    return vec;
}

void Options::short_usage(std::ostream &strm) {
    strm << "Usage: csv2bin [OPTIONS] MODE CSV BIN MANIFEST" << std::endl;
}

void Options::usage(std::ostream &strm) {
    short_usage(strm);
    strm << std::endl;
    strm << R"(  MODE                 Either "compile" or "disasm", controls)" << std::endl;
    strm << "                       the mode of execution." << std::endl;
    strm << "  CSV                  Path to the CSV file. If compiling, the file" << std::endl;
    strm << "                       must exist." << std::endl;
    strm << "  BIN                  Path to the compiled binary. If disassembling," << std::endl;
    strm << "                       the file must exist." << std::endl;
    strm << "  MANIFEST             Column specification for the CSV file. Not all" << std::endl;
    strm << "                       columns need to be specified, but missing columns" << std::endl;
    strm << "                       are presumed to be u32." << std::endl;
    strm << "  -i PATH              Add header search paths. Can repeat as much as you want." << std::endl;
    strm << "  --include PATH       Alias for -i" << std::endl;
    strm << "  --narc               Output a NARC file" << std::endl;
    strm << "  --naix               Output a NAIX file. Implies --narc" << std::endl;
    strm << "  --pad PADVAL         Pads with PADVAL between rows (default: 0)" << std::endl;
    strm << "  -h                   Prints this message and exits" << std::endl;
    strm << std::endl;
    strm << "Note: Manifest file format declares each column on a separate line." << std::endl;
    strm << "Columns must be declared in the same order as they would appear in" << std::endl;
    strm << "both the CSV and the corresponding field in the compiled binary" << std::endl;
    strm << "Each line shall have the following format:" << std::endl;
    strm << std::endl;
    strm << "column_name:width[.bits][:path/to/c/header.h[:const-prefix]]" << std::endl;
    strm << std::endl;
    strm << "column_name must match the CSV header line." << std::endl;
    strm << "width must be a valid Nitro type name - either 'u' or 's'," << std::endl;
    strm << "  followed by either 8, 16, 32, or 64." << std::endl;
    strm << "  To designate a column as an index column, use 'skip'." << std::endl;
    strm << "  To designate a column as binary padding, use 'pad' followed by" << std::endl;
    strm << "  the number of padding bytes." << std::endl;
    strm << "  To designate a bitfield to a typed or padded field, add a period (.) followed" << std::endl;
    strm << "  by the number of bits. For example, 'can_cycle:u8.1'" << std::endl;
    strm << "the optional header file path should be relative to" << std::endl;
    strm << "  the directory of execution, or you can pass a different" << std::endl;
    strm << R"(  root using "-i".)" << std::endl;
    strm << "  This spec supports the special header type 'bool', which maps" << std::endl;
    strm << "  the strings 'true' and 'false'." << std::endl;
    strm << "the optional const-prefix restricts the header parsing to only those" << std::endl;
    strm << "  constants beginning with the specified prefix. Default behavior is to" << std::endl;
    strm << "  consider all constants defined in that header." << std::endl;
    strm << std::endl;
    strm << "Note 2: In disasm mode, the manifest must define all columns." << std::endl;
    strm << "In compile mode, missing columns will be assumed to be u32." << std::endl;
    strm << "The corresponding field will be inserted after the previous named" << std::endl;
    strm << "column from the CSV." << std::endl;
}

Options::Options(int argc, char **argv) {
    std::vector<std::string> argvec(argv + 1, argv + argc);
    include_paths.insert(include_paths.begin(), ".");
    for (auto iarg = argvec.begin(); iarg != argvec.end(); iarg ++) {
        if (*iarg == "-i" || *iarg == "--include") {
            iarg++;
            if (iarg == argvec.end()) {
                throw argument_error("missing argument to " + iarg[-1]);
            }
            assert(fs::exists(*iarg));
            include_paths.emplace_back(*iarg);
        } else if (*iarg == "-h" || *iarg == "--help") {
            usage();
            std::exit(EXIT_SUCCESS);
        } else if (*iarg == "--narc") {
            narc_mode = true;
        } else if (*iarg == "--naix") {
            naix_mode = true;
            narc_mode = true;
        } else if (*iarg == "--pad") {
            iarg++;
            padval = std::stoi(*iarg, 0, 0);
        } else if ((*iarg)[0] == '-') {
            throw argument_error("caught invalid option flag: " + *iarg);
        } else {
            posargs.emplace_back(*iarg);
        }
    }
    if (posargs.size() < 4) {
        throw argument_error("missing required argument(s)");
    }
    assert(posargs.size() >= 4);
    if (posargs[0] == "compile") {
        execMode = EXEC_CSV2BIN;
    } else if (posargs[0] == "disasm") {
        if (naix_mode) {
            std::cerr << "csv2bin warning: --naix with disasm mode is equivalent to --narc" << std::endl;
        }
        execMode = EXEC_BIN2CSV;
    } else {
        throw argument_error(R"(first positional argument must be either "compile" or "disasm", not )" + posargs[0]);
    }
    switch (execMode) {
    case EXEC_CSV2BIN:
        binfile.out = new std::ofstream(posargs[2], std::ios::binary);
        break;
    case EXEC_BIN2CSV:
        binfile.in = new std::ifstream(posargs[2], narc_mode ? std::ios::binary : std::ios::binary | std::ios::ate);
        break;
    default:
        assert(0);
    }
    manifest.read(posargs[3], include_paths);
    if (execMode == EXEC_CSV2BIN) {
        csvFile.FromFile(posargs[1]);
    }
}

Options::~Options() {
    switch (execMode) {
    case EXEC_CSV2BIN:
        delete binfile.out;
        break;
    case EXEC_BIN2CSV:
        delete binfile.in;
        break;
    default:
        assert(0);
    }
}

int Options::main() {
    switch (execMode) {
    case EXEC_CSV2BIN:
        return main_compile();
    case EXEC_BIN2CSV:
        return main_disasm();
    default:
        return 1;
    }
}

int Options::main_compile() {
    for (auto name_i = csvFile.GetColnames().cbegin(); name_i != csvFile.GetColnames().cend(); name_i ++) {
        if (!manifest[*name_i].is_init()) {
            manifest[*name_i] = ColumnSpec(sizeof(unsigned int));
            if (name_i == csvFile.GetColnames().cbegin()) {
                manifest.colnames.insert(manifest.colnames.cbegin(), *name_i);
            } else {
                auto dest_i = std::find(manifest.colnames.cbegin(), manifest.colnames.cend(), name_i[-1]);
                manifest.colnames.insert(dest_i + 1, *name_i);
            }
        }
    }

    if (narc_mode) {
        fs::path naixfilename;
        fs::path narcfilename;
        std::ofstream naixfile;
        std::string guard, guard_sub;
        if (naix_mode) {
            static const char do_not_modify[] = "/*\n"
                                                " * THIS FILE WAS AUTOMATICALLY\n"
                                                " *  GENERATED BY tools/csv2bin\n"
                                                " *      DO NOT MODIFY!!!\n"
                                                " */\n";
            narcfilename = posargs[2];
            naixfilename = narcfilename.replace_extension("naix");
            naixfile.open(naixfilename, std::ios::out);
            naixfile << do_not_modify << std::endl;
            guard_sub = narcfilename.replace_extension().filename().string();
            guard = "NARC_" + guard_sub + "_NAIX_";
            to_upper(guard);
            naixfile << "#ifndef " << guard << std::endl;
            naixfile << "#define " << guard << std::endl;
            naixfile << std::endl;
            naixfile << "enum {" << std::endl;
        }
        unsigned gmif_size = manifest.size() * csvFile.nrow() + 8;
        unsigned btaf_size = 8 * csvFile.nrow() + 12;
        unsigned btnf_size = 16;
        auto *narc_header = new unsigned char[16];
        auto *gmif = new unsigned char[8];
        auto *btnf = new unsigned char[btnf_size];
        auto *btaf = new unsigned char[btaf_size];
        memcpy(narc_header, "NARC\xFE\xFF\x00\x01\x00\x00\x00\x00\x10\x00\x03\x00", 16);
        to_array<unsigned>(narc_header, gmif_size + btaf_size + btnf_size + 16, 8);
        memcpy(btaf, "BTAF", 4);
        to_array<unsigned>(btaf, btaf_size, 4);
        to_array<unsigned>(btaf, csvFile.nrow(), 8);
        for (int i = 0; i < csvFile.nrow(); i++) {
            to_array<unsigned>(btaf, i * manifest.size(), 12 + 8 * i);
            to_array<unsigned>(btaf, i * manifest.size() + manifest.size(0), 16 + 8 * i);
            if (naix_mode) {
                char num_buf[10] = {0};
                sprintf(num_buf, "%04d", i);
                naixfile << "    NARC_" << guard_sub << "_" << num_buf << "_bin = " << i << "," << std::endl;
            }
        }
        memcpy(btnf, "BTNF\x10\x00\x00\x00\x04\x00\x00\x00\x00\x00\x01\x00", 16);
        memcpy(gmif, "GMIF", 4);
        to_array<unsigned>(gmif, gmif_size, 4);
        binfile.out->write((const char *)narc_header, 16);
        binfile.out->write((const char *)btaf, btaf_size);
        binfile.out->write((const char *)btnf, btnf_size);
        binfile.out->write((const char *)gmif, 8);
        delete[] gmif;
        delete[] btnf;
        delete[] btaf;
        delete[] narc_header;
        if (naix_mode) {
            naixfile << "};" << std::endl;
            naixfile << std::endl;
            naixfile << "#endif // " << guard << std::endl;
            naixfile.close();
        }
    }

    BufferedRowConverter converter(manifest, csvFile, padval);
    for (const auto &row : csvFile) {
        *binfile.out << converter;
    }
    return 0;
}

int Options::main_disasm() {
    std::vector<std::string> colnames;
    // pad cols are skipped from the csv but not the binary
    for (auto name_i = manifest.colnames.begin(); name_i != manifest.colnames.end(); name_i ++) {
        if (!manifest[*name_i].is_padding()) {
            colnames.emplace_back(*name_i);
        }
    }
    size_t binfsize;
    size_t manifest_size = manifest.size();
    if (narc_mode) {
        static unsigned char narc_header[16];
        static unsigned char btaf_header[12];
        binfile.in->read((char *)narc_header, 16);
        assert(memcmp(narc_header, "NARC\xfe\xff\x00\x01", 8) == 0);
        binfile.in->read((char *)btaf_header, 12);
        assert(memcmp(btaf_header, "BTAF", 4) == 0);
        size_t fatb_size = from_array<unsigned>(btaf_header, 4) - 12;
        size_t nrow = from_array<unsigned>(btaf_header, 8);
        binfile.in->seekg(fatb_size, std::ios::cur);
        static unsigned char btnf_header[8];
        binfile.in->read((char *)btnf_header, 8);
        assert(memcmp(btnf_header, "BTNF", 4) == 0);
        size_t fntb_size = from_array<unsigned>(btnf_header, 4) - 8;
        binfile.in->seekg(fntb_size, std::ios::cur);
        static unsigned char gmif_header[8];
        binfile.in->read((char *)gmif_header, 8);
        assert(memcmp(gmif_header, "GMIF", 4) == 0);
        binfsize = from_array<unsigned>(gmif_header, 4) - 8;
        assert(binfsize / manifest_size == nrow);
    } else {
        // binfile was opened at end (ios::ate)
        binfsize = binfile.in->tellg();
        // rewind
        binfile.in->seekg(0);
    }
    assert(binfsize % manifest_size == 0);
    csvFile.resize(binfsize / manifest_size, colnames.size());
    csvFile.SetColnames(colnames.cbegin(), colnames.cend());

    BufferedRowConverter converter(manifest, csvFile, padval);
    for (int i = 0; i < csvFile.nrow(); i++) {
        *binfile.in >> converter;
    }
    csvFile.ToFile(posargs[1]);
    return 0;
}
