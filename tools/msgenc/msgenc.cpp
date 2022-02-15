/*
 * MSGENC: Encodes a Pokemon DP message file to binary
 *
 * Usage:
 *     msgenc TXTFILE KEYFILE CHARMAP OUTFILE
 */

#include <iostream>
#include "MessagesDecoder.h"
#include "MessagesEncoder.h"
#include "Options.h"

static const char* progname = "msgenc";
static const char* version = "2021.12.21";

static inline void usage() {
    cout << progname << " v" << version << endl;
    cout << "Usage: " << progname << " [-h] [-v] -d|-e [OPTIONS] -c CHARMAP INFILE OUTFILE" << endl;
    cout << endl;
    cout << "INFILE        Required: Path to the input file to convert (-e: plaintext; -d: binary)." << endl;
    cout << "OUTFILE       Required: Path to the output file (-e: binary; -d: plaintext)." << endl;
    cout << "-c CHARMAP    Required: Path to a text file with a character mapping, for example pokeheartgold/charmap.txt." << endl;
    cout << "-d            Decode from binary to text, also print the key" << endl;
    cout << "-e            Encode from text to binary using the provided key" << endl;
    cout << "--gmm         Text file is GMM (Gamefreak XML format)" << endl;
    cout << "-H HEADER     When operating in GMM mode, specify this header file to read/write C constant values" << endl;
    cout << "-k KEY        The 16-bit encryption key for this message bank. Default: computes it from the binary file name" << endl;
    cout << "-v            Print the program version and exit." << endl;
    cout << "-h            Print this message and exit." << endl;
    cout << "-D DUMPNAME   Dump the intermediate binary (after decryption or before encryption)." << endl;
}

int do_main(MessagesConverter* &converter, int argc, char ** argv) {
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

        if (options.mode == CONV_DECODE) {
            converter = new MessagesDecoder(options);
        } else {
            converter = new MessagesEncoder(options);
        }
        converter->ReadInput();
        converter->ReadCharmap();
        converter->Convert();
        if (!options.dumpBinary.empty()) {
            converter->WriteBinaryDecoded(options.dumpBinary);
        }
        converter->WriteOutput();
        if (options.mode == CONV_DECODE) {
            cout << "Key: " << hex << converter->GetKey() << endl;
        }
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

int main(int argc, char ** argv) {
    MessagesConverter *converter;
    int result = do_main(converter, argc, argv);
    delete converter;
    return result;
}
