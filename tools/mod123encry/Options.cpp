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
                                        ((std::string[]) {"", "mode", "baserom", "outfile", "ovy_id"})[argc]);
        }

        decrypt = new DecryptOptions(argv);
        break;
    case EXEC_ENCRY:
        if (argc < 5) {
            throw std::invalid_argument("missing required argument: " +
                                        ((std::string[]) {"", "mode", "buildname", "outfile", "ovy_id"})[argc]);
        }

        encrypt = new EncryptOptions(argv);
        break;
    }
}

Options::~Options() {
    switch (mode) {
    case EXEC_DECRY:
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
        return encrypt->main();
    }
    return -1;
}
