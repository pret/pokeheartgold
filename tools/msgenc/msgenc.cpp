/*
 * MSGENC: Encodes a Pokemon DP message file to binary
 *
 * Usage:
 *     msgenc TXTFILE KEYFILE CHARMAP OUTFILE
 */

#include "MessagesDecoder.h"
#include "MessagesEncoder.h"

int main(int argc, char ** argv) {
    // msgenc TXTFILE KEYFILE CHARMAP OUTFILE
    if (argc < 6)
        throw invalid_argument("usage: msgenc -d|-e TXTFILE KEYFILE CHARMAP BINFILE");
    string mode_s(argv[1]);
    ConvertMode mode;
    if (mode_s == "-d")
        mode = CONV_DECODE;
    else if (mode_s == "-e")
        mode = CONV_ENCODE;
    else
        throw invalid_argument(string("invalid mode: ") + mode_s);
    string textfile(argv[2]);
    string keyfile(argv[3]);
    string charmapfile(argv[4]);
    string binfile(argv[5]);

    MessagesConverter * converter;
    if (mode == CONV_DECODE)
        converter = new MessagesDecoder(textfile, keyfile, charmapfile, binfile);
    else
        converter = new MessagesEncoder(textfile, keyfile, charmapfile, binfile);
    converter->ReadInput();
    converter->Convert();
    converter->WriteOutput();
    delete converter;

    return 0;
}
