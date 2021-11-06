#include "global.h"
#include "EncDataCsv.h"
#include "version.h"

enum Mode {
    MODE_COMPILE,
    MODE_DUMP
};

struct Options {
    Mode mode = MODE_COMPILE;
    EncDataCsv csvfile;
    SpeciesMap species_h;
    SpeciesRevMap species_h_rev;
    fs::path bindir;
    std::vector<std::string> posargs;
    Options(int argc, char * argv[]);
    int main();
private:
    int main_compile();
    int main_dump();
};

static void usage() {
    std::cout << "Usage: encdata-gs [-h] [-v] [-d] CSV HEADER OUT" << std::endl;
    std::cout << std::endl;
    std::cout << "    CSV      CSV file containing a human-readable representation of the wild encounter data" << std::endl;
    std::cout << "    HEADER   C header file with the species constants" << std::endl;
    std::cout << "    OUT      Directory to write binary files" << std::endl;
    std::cout << "    -d       Run in dump mode (binary --> csv). Default: compile (csv --> binary)" << std::endl;
    std::cout << "    -v       Print the software version and exit" << std::endl;
    std::cout << "    -h       Print this message and exit" << std::endl;
}

Options::Options(int argc, char **argv) {
    for (int i = 1; i < argc; i++) {
        std::string arg(argv[i]);
        if (arg == "-h") {
            usage();
            std::exit(0);
        } else if (arg == "-v") {
            std::cout << "encdata-gs v" << VERSION_STRING << std::endl;
            std::exit(0);
        } else if (arg == "-d") {
            mode = MODE_DUMP;
        } else if (arg[0] == '-') {
            usage();
            std::cerr << "invalid flag: " << arg << std::endl;
            std::exit(1);
        } else {
            posargs.push_back(arg);
        }
    }
    if (posargs.size() < 3) {
        usage();
        std::cerr << "insufficient args" << std::endl;
        std::exit(1);
    }
    if (mode == MODE_COMPILE) {
        csvfile.FromFile(posargs[0]);
        ParseSpeciesHeader(posargs[1], species_h);
    } else {
        ParseSpeciesHeader(posargs[1], species_h_rev);
    }
    bindir = posargs[2];
}

int Options::main_compile() {
    int i = 0;
    fs::create_directories(bindir);
    for (const auto & row : csvfile) {
        char numbuf[4] {};
        sprintf(numbuf, "%03d", i);
        std::string filename = "bin_" + std::string(numbuf) + "_" + row[ENCDATA_MAPNAME] + ".bin";
        fs::path outfilename = bindir / filename;
        std::ofstream binfile(outfilename, std::ios::binary);
        ENC_DATA encData {};
        csvfile.to_struct(i, encData, species_h);
        i++;
        binfile.write((const char *)&encData, sizeof(ENC_DATA));
    }
    return 0;
}

int Options::main_dump() {
    std::vector<fs::path> contents;
    for (auto const & path : fs::directory_iterator(bindir)) {
        if (path.is_regular_file() && path.path().extension() == ".bin") {
            contents.push_back(path.path());
        }
    }
    std::sort(contents.begin(), contents.end());
    csvfile.resize(contents.size(), ENCDATA_NCOL);
    for (int i = 0; i < contents.size(); i++) {
        const fs::path &path = contents[i];
        std::ifstream binfile(path, std::ios::binary);
        ENC_DATA encData {};
        binfile.read((char *)&encData, sizeof(ENC_DATA));
        csvfile[i][ENCDATA_MAPNAME] = path.filename();
        csvfile.from_struct(i, encData, species_h_rev);
    }
    csvfile.ToFile(posargs[0]);
    return 0;
}

int Options::main() {
    return (mode == MODE_COMPILE) ? main_compile() : main_dump();
}

int main(int argc, char * argv[]) {
    Options options(argc, argv);
    options.main();
}
