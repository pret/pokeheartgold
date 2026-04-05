#include "optparse.h"

#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#define errorf(fmt, ...) \
    snprintf(            \
        parser->errmsg,  \
        OPT_ERRMSG_MAX,  \
        fmt,             \
        __VA_ARGS__      \
    )

#define ERR_MISSING_ARG         "missing argument for option"
#define ERR_UNKNOWN_OPT         "unrecognized option"
#define ERR_UNEXPECTED_ARG      "unexpected argument '%s' for option"
#define ERR_MISSING_ARG_SHORT   ERR_MISSING_ARG " -%c"
#define ERR_UNKNOWN_OPT_SHORT   ERR_UNKNOWN_OPT " -%c"
#define ERR_MISSING_ARG_LONG    ERR_MISSING_ARG " --%s"
#define ERR_UNKNOWN_OPT_LONG    ERR_UNKNOWN_OPT " --%s"
#define ERR_UNEXPECTED_ARG_LONG ERR_UNEXPECTED_ARG " --%s"

static bool matchopt_short(
    const char *option,
    int shortind,
    const option_cfg_t *config
) {
    char c = option[shortind];
    return c != 0 && (c == config->shortopt || c == config->shortalias);
}

static int parseopt_short(optparser_t *parser, const char *option) {
    for (int i = 0; parser->options[i].longopt; i++) {
        const option_cfg_t *candidate = &parser->options[i];
        if (!matchopt_short(option, parser->shortind, candidate)) continue;

        if (candidate->hasarg) {
            if (option[parser->shortind + 1] != '\0') {
                parser->optarg   = (void *)&option[parser->shortind + 1];
                parser->shortind = 1; // reset for next short-option chain
                parser->optind++;     // prepare for the next option
                return i;
            }

            if (parser->argv[parser->optind + 1] == NULL) {
                errorf(ERR_MISSING_ARG_SHORT, option[parser->shortind]);
                return i;
            }

            parser->optarg   = parser->argv[parser->optind + 1];
            parser->shortind = 1; // reset for next short-option chain
            parser->optind  += 2; // prepare for the next option
            return i;
        }

        parser->shortind++;
        return i;
    }

    errorf(ERR_UNKNOWN_OPT_SHORT, option[parser->shortind]);
    return OPT_ERROR;
}

static bool matchopt_long(const char *option, const option_cfg_t *config) {
    return strcmp(option, config->longopt) == 0
        || (config->longalias && strcmp(option, config->longalias) == 0);
}

static int parseopt_long(optparser_t *parser, const char *option) {
    option += 2; // skip the leading '--'

    char *poseq = strchr(option, '=');
    if (poseq) *poseq = '\0';

    for (int i = 0; parser->options[i].longopt; i++) {
        const option_cfg_t *candidate = &parser->options[i];
        if (!matchopt_long(option, candidate)) continue;

        if (!candidate->hasarg) { // simple flag, no argument
            if (poseq) {
                errorf(ERR_UNEXPECTED_ARG_LONG, &poseq[1], option);
                return i;
            }

            parser->optind++;
            return i;
        }

        if (poseq == NULL) {
            if (parser->argv[parser->optind + 1] == NULL) {
                errorf(ERR_MISSING_ARG_LONG, option);
                return i;
            }

            parser->optarg  = parser->argv[parser->optind + 1];
            parser->optind += 2; // prepare for the next option
            return i;
        }

        if (poseq[1] == '\0') {
            errorf(ERR_MISSING_ARG_LONG, option);
            return i;
        }

        parser->optarg = poseq + 1;
        parser->optind++; // prepare for the next option
        return i;
    }

    errorf(ERR_UNKNOWN_OPT_LONG, option);
    return OPT_ERROR;
}

int parseopt(optparser_t *parser) {
    char *option = parser->argv[parser->optind];
    if (option == NULL)    return OPT_DONE; // no more options
    if (option[0] != '-')  return OPT_DONE; // no more options
    if (option[1] == '\0') return OPT_DONE; // literal '-' is an argument
    if (option[1] != '-')  return parseopt_short(parser, option);
    if (option[2] != '\0') return parseopt_long(parser, option);

    // option is '--'; no more options
    parser->optind++;
    return OPT_DONE;
}
