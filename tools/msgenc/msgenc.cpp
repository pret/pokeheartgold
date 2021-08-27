/*
 * MSGENC: Encodes a Pokemon DP message file to binary
 *
 * Usage:
 *     msgenc TXTFILE KEYFILE CHARMAP OUTFILE
 */

#include <iostream>
#include "MessagesDecoder.h"
#include "MessagesEncoder.h"

static const char* progname = "msgenc";
static const char* version = "2021.08.27";


static inline void usage() {
    cout << progname << " v" << version << endl;
    cout << "Usage: " << progname << " [-h] [-v] -d|-e [-k KEY] -c CHARMAP INFILE OUTFILE" << endl;
    cout << endl;
    cout << "INFILE        Required: Path to the input file to convert (-e: plaintext; -d: binary)." << endl;
    cout << "OUTFILE       Required: Path to the output file (-e: binary; -d: plaintext)." << endl;
    cout << "-c CHARMAP    Required: Path to a text file with a character mapping, for example pokeheartgold/charmap.txt." << endl;
    cout << "-d            Decode from binary to text, also print the key" << endl;
    cout << "-e            Encode from text to binary using the provided key" << endl;
    cout << "-k KEY        The 16-bit encryption key for this message bank. Default: computes it from the binary file name" << endl;
    cout << "-v            Print the program version and exit." << endl;
    cout << "-h            Print this message and exit." << endl;
    cout << "-D DUMPNAME   Dump the intermediate binary (after decryption or before encryption)." << endl;
}

struct Options {
    ConvertMode mode = CONV_INVALID;
    int key = 0;
    vector<string> posargs;
    string failReason;
    string charmap;
    bool printUsage = false;
    bool printVersion = false;
    string dumpBinary;
    Options(int argc, char ** argv) {
        for (int i = 1; i < argc; i++) {
            string arg(argv[i]);
            if (arg == "-d") {
                mode = CONV_DECODE;
            } else if (arg == "-e") {
                mode = CONV_ENCODE;
            } else if (arg == "-h") {
                printUsage = true;
                return;
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
};

int main(int argc, char ** argv) {
    try {
        Options options(argc, argv);
        if (options.printUsage || !options.failReason.empty()) {
            usage();
            if (!options.failReason.empty()) {
                throw invalid_argument(options.failReason);
            }
            return 0;
        } else if (options.printVersion) {
            cout << progname << " v" << version << endl;
            return 0;
        }

        MessagesConverter *converter;
        if (options.mode == CONV_DECODE)
        {
            converter = new MessagesDecoder(options.posargs[1], options.key, options.charmap, options.posargs[0]);
        }
        else
        {
            converter = new MessagesEncoder(options.posargs[0], options.key, options.charmap, options.posargs[1]);
        }
        converter->ReadInput();
        converter->ReadCharmap();
        converter->Convert();
        if (!options.dumpBinary.empty())
            converter->WriteBinaryDecoded(options.dumpBinary);
        converter->WriteOutput();
        if (options.mode == CONV_DECODE) {
            cout << "Key: " << hex << converter->GetKey() << endl;
        }
        delete converter;
    } catch (invalid_argument& ia) {
        cerr << "Invalid Argument: " << ia.what() << endl;
        return 1;
    } catch (ios_base::failure& iof) {
        cerr << "IO Failure: " << iof.what() << endl;
        return 1;
    } catch (runtime_error& exc) {
        cerr << "Runtime Error: " << exc.what() << endl;
        return 1;
    }
    return 0;
}
