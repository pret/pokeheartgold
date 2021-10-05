#include "Options.h"

bool Options::TranslateExecMode(const char * value) {
    if (strcmp(value, "decry") == 0) {
        mode = EXEC_DECRY;
    } else if (strcmp(value, "encry") == 0) {
        mode = EXEC_ENCRY;
    } else {
        throw std::invalid_argument(std::string("invalid ExecMode value: expected 'encry' or 'decry'; got ") + value);
    }
    return true;
}

Options::Options(int argc, char ** argv) {
    // MODE must be either "encry" or "decry"
    TranslateExecMode(argv[1]);

    switch (mode) {
    case EXEC_DECRY:
        // All positional args must be present
        if (argc < 5) {
            throw std::invalid_argument("missing required argument: " +
                                        ((std::string[]) {"", "mode", "infile", "outfile", "baserom", "ovy_id"})[argc]);
        }

        decrypt = new DecryptOptions;
        decrypt->baserom = new NtrRom(argv[2], std::ios::binary);
        decrypt->outfile = std::ofstream(argv[3], std::ios::binary);
        if (!decrypt->outfile.good()) {
            throw std::runtime_error(std::string("unable to open file '") + argv[3] + "' for reading");
        }

        // Translate module number
        decrypt->ovy_id = std::strtoul(argv[4], nullptr, 10);
        break;
    case EXEC_ENCRY:
        break;
    }
}

Options::~Options() {
    switch (mode) {
    case EXEC_DECRY:
        decrypt->outfile.close();
        delete decrypt;
        break;
    case EXEC_ENCRY:
        delete encrypt;
        break;
    }
}

int Options::main() {
    switch (mode) {
    case EXEC_DECRY:
        return decrypt->main();
    case EXEC_ENCRY:
        std::cerr << "encryption not implemented" << std::endl;
        return 1;
    }
    return -1;
}
