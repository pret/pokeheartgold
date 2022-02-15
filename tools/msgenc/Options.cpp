#include "Options.h"

Options::Options(int argc, char **argv) {
    for (int i = 1; i < argc; i++) {
        string arg(argv[i]);
        if (arg == "-d") {
            mode = CONV_DECODE;
        } else if (arg == "-e") {
            mode = CONV_ENCODE;
        } else if (arg == "-h") {
            printUsage = true;
            return;
        } else if (arg == "-H") {
            gmm_header = argv[++i];
        } else if (arg == "-v") {
            printVersion = true;
            return;
        } else if (arg == "-k") {
            key = stoi(argv[++i], nullptr, 0);
            // If the key is 0, ensure that it is not overridden by the CRC.
            key &= 0xFFFF;
            key |= 0x10000;
        } else if (arg == "-c") {
            charmap = argv[++i];
        } else if (arg == "-D") {
            dumpBinary = argv[++i];
        } else if (arg == "--gmm") {
            textFormat = GamefreakGMM;
        } else if (arg[0] != '-') {
            posargs.push_back(arg);
        } else {
            failReason = "unrecognized option: " + arg;
            break;
        }
    }
    if (posargs.size() < 2) {
        failReason = "missing required positional argument: " + (string[]){"INFILE", "OUTFILE"}[posargs.size()];
    }
    if (mode == CONV_INVALID) {
        failReason = "missing mode flag: -d or -e is required";
    }
    if (charmap.empty()) {
        failReason = "missing charmap file: -c CHARMAP is required";
    }
}
