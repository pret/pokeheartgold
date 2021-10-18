#include <iostream>
#include <string>
#include "Decrypt.h"
#include "Encrypt.h"

int main(int argc, char ** argv) {
    // Usage:
    // mod123encry decry BASEROM OUTFILE OVY_ID
    // mod123encry encry BUILDNAME OUTFILE OVY_ID
    try {
        if (argc < 2) {
            throw std::invalid_argument("missing required argument: mode");
        }
        Options *options;
        switch (Options::TranslateExecMode(argv[1])) {
        case EXEC_DECRY:
            options = new DecryptOptions(argc, argv);
            break;
        case EXEC_ENCRY:
            options = new EncryptOptions(argc, argv);
            break;
        }

        int ret = options->main();
        delete options;
        return ret;
    } catch (std::exception &e) {
        std::cerr << "An exception has occurred: " << e.what() << std::endl;
        return 1;
    }
}
