#include <iostream>
#include <string>
#include <cstring>
#include <vector>
#include <algorithm>
#include "RelocElfReader.h"
#include "Narc.h"
#include "Options.h"

using namespace std;

static inline void usage() {
    cout << "Usage: o2narc [-f|--flatten] infile outfile" << endl;
    cout << endl;
    cout << "Arguments:" << endl;
    cout << "\tinfile\tELF object file with symbols __size and __data" << endl;
    cout << "\toutfile\tOutput NARC file" << endl;
    cout << "Options:" << endl;
    cout << "\t-f|--flatten\tDon't generate NARC headers" << endl;
    cout << "\t-n|--naix\tCreate a NARC index header" << endl;
    cout << "\t-p PAD|--padding PAD\tPad with byte value (default: 255)" << endl;
}

int main(int argc, char ** argv) {
    try {
        Options options(argc, argv);
        return options.main();
    } catch (const command_error &e) {
        usage();
        cerr << e.what() << endl;
        return 1;
    } catch (const elf_exception &e) {
        cerr << e.what() << endl;
        return 1;
    } catch (const exception &e) {
        cerr << "Unhandled exception: " << e.what() << endl;
        return 1;
    }
}
