/*
 * CALCROM.CPP
 * © PikalaxALT 2020-2021
 *
 * Permission is granted to copy and/or modify this code under GPL 3.0.
 *
 * Simple C++ executable to measure the completion rate of Nintendo DS
 * reverse engineering (decompilation).
 * Similar in scope to calcrom.pl from pret-agb projects, but designed
 * to cope with restrictions imposed by the DS toolchain.
 *
 * Requirements:
 *  - Must have C++11 compliant compiler.
 *  - MacOS X: Must provide elf.h on the include (-I) path.
 *  - Must be placed in ".github/calcrom/".
 *
 * Changelog:
 *  - 0.1.0 (26 May 2020):
 *      Initial implementation
 *  - 0.1.1 (26 May 2020):
 *      Allow program to be run from wherever
 *  - 0.1.2 (27 May 2020):
 *      Extra security on ELF header
 *  - 0.1.3 (30 Jun 2020):
 *      Account for diamond/pearl split
 *  - 0.2.0 (30 Aug 2021):
 *      Support hgss
 *  - 0.2.1 (31 Aug 2021):
 *      Make calcrom more generic and configurable via command line
 *  - 0.2.2 (18 Sep 2021):
 *      Handle errors when paths are missing
 *  - 0.2.3 (10 Nov 2021):
 *      Refactor classes into separate objects to improve future maintainability
 *      Report hardcoded pointers
 */

#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <algorithm>
#include <filesystem>
#include "BuildAnalyzer.h"

using namespace std;
using namespace std::filesystem;

class missing_option : public invalid_argument {
public:
    missing_option(string& error) : invalid_argument{error.c_str()} {}
};

struct Options {
    path arm9subdir = "";
    path arm7subdir = "sub";
    path projectdir = ".";
    vector<string> romnames;
    Options(int argc, char ** argv) {
        for (int i = 1; i < argc; i++) {
            string arg = argv[i];
            if (arg == "-9") {
                if (++i == argc) throw missing_option(arg);
                arm9subdir = argv[i];
            } else if (arg == "-7") {
                if (++i == argc) throw missing_option(arg);
                arm7subdir = argv[i];
            } else if (arg == "-d") {
                if (++i == argc) throw missing_option(arg);
                projectdir = argv[i];
            } else if (arg[0] != '-') {
                romnames.push_back(arg);
            } else {
                throw invalid_argument(arg);
            }
        }
    }
    int main() {
        for (string &romname: romnames) {
            cout << BuildAnalyzer(projectdir, arm9subdir, romname)() << endl;
        }
        cout << BuildAnalyzer(projectdir, arm7subdir)();
        return 0;
    }
};

int main(int argc, char ** argv)
{
    try {
        Options options(argc, argv);
        return options.main();
    } catch (missing_option& e) {
        cerr << "Missing value for option " << e.what() << endl;
        return 1;
    } catch (invalid_argument& e) {
        cerr << "Unrecognized option flag: " << e.what() << endl;
        return 1;
    } catch (runtime_error& e) {
        cerr << e.what() << endl;
        return 1;
    } catch (exception& e) {
        cerr << "Unhandled exception: " << e.what() << endl;
        return 1;
    }
}
