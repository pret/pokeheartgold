#include "Options.h"

void Options::short_usage(std::ostream &strm) {
    strm << "Usage: csv2bin MODE CSV BIN [MANIFEST] [-i|--include PATH ...] [-h|--help]" << std::endl;
}

void Options::usage(std::ostream &strm) {
    short_usage(strm);
    strm << std::endl;
    strm << R"(  MODE         Either "compile" or "disasm", controls)" << std::endl;
    strm << "               the mode of execution." << std::endl;
    strm << "  CSV          Path to the CSV file. If compiling, the file" << std::endl;
    strm << "               must exist." << std::endl;
    strm << "  BIN          Path to the compiled binary. If disassembling," << std::endl;
    strm << "               the file must exist." << std::endl;
    strm << "  MANIFEST     Column specification for the CSV file. Not all" << std::endl;
    strm << "               columns need to be specified, but missing columns" << std::endl;
    strm << "               are presumed to be u32." << std::endl;
    strm << "  -i PATH      Add header search paths. Can repeat as much as you want." << std::endl;
    strm << "  -h           Prints this message and exits" << std::endl;
    strm << std::endl;
    strm << "Note: Manifest file format declares each column on a separate line." << std::endl;
    strm << "Each line shall have the following format:" << std::endl;
    strm << std::endl;
    strm << "column_name:width[:path/to/c/header.h]" << std::endl;
    strm << std::endl;
    strm << "column_name must match the CSV header line." << std::endl;
    strm << "width must be a valid Nitro type name - either 'u' or 's'," << std::endl;
    strm << "  followed by either 8, 16, 32, or 64." << std::endl;
    strm << "the optional header file path should be relative to" << std::endl;
    strm << "  the directory of execution, or you can pass a different" << std::endl;
    strm << R"(  root using "-i".)" << std::endl;
    strm << "Note 2: In disasm mode, the manifest must define all columns." << std::endl;
}

Options::Options(int argc, char **argv) {
    std::vector<std::string> argvec(argv + 1, argv + argc);
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
        execMode = EXEC_BIN2CSV;
    } else {
        throw argument_error(R"(first positional argument must be either "compile" or "disasm", not )" + posargs[0]);
    }
    binfile.open(posargs[2], std::ios::binary | (execMode == EXEC_CSV2BIN ? std::ios::out : std::ios::in | std::ios::ate));
    manifest.read(posargs[3], include_paths);
    if (execMode == EXEC_CSV2BIN) {
        csvFile.FromFile(posargs[1]);
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
    for (const auto &name : csvFile.GetColnames()) {
        if (!manifest[name].is_init()) {
            manifest[name] = ColumnSpec(sizeof(unsigned int));
        }
    }
    manifest.colnames = csvFile.GetColnames();
    for (const auto &row : csvFile) {
        for (int i = 0; i < csvFile.ncol(); i++) {
            ColumnSpec &spec = manifest[csvFile.GetColnames()[i]];
            spec.write((std::ofstream &)binfile, row[i]);
        }
        if ((binfile.tellp() & 3) != 0) {
            static const unsigned char padding[3] = {0};
            binfile.write((const char *)padding, (-binfile.tellp()) & 3);
        }
    }
    return 0;
}

int Options::main_disasm() {
    std::vector<std::string> colnames = manifest.colnames;
    size_t binfsize = binfile.tellg();
    assert(binfsize % manifest.size() == 0);
    binfile.seekg(0);
    csvFile.resize(binfsize / manifest.size(), colnames.size());
    csvFile.SetColnames(colnames.cbegin(), colnames.cend());
    for (int i = 0; i < csvFile.nrow(); i++) {
        for (int j = 0; j < csvFile.ncol(); j++) {
            csvFile[i][j] = manifest[colnames[j]].read((std::ifstream &)binfile, i);
        }
        if ((binfile.tellg() & 3) != 0) {
            binfile.seekg(((int)binfile.tellg() + 3) & ~3);
        }
    }
    csvFile.ToFile(posargs[1]);
    return 0;
}
