/*
 * nitroarc - an archiving utility for Nintendo's Nitro Archive format
 * Copyright (C) 2026 Rachel <rachel@lhea.me>
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#ifndef TOOL_OPTION_H
#define TOOL_OPTION_H

#include <stdbool.h>

#define OPT_DONE  -2
#define OPT_ERROR -1

#define OPT_ERRMSG_MAX 96

typedef struct option_cfg option_cfg_t;
struct option_cfg {
    const char *longopt;
    const char *longalias;
    char        shortopt;
    char        shortalias;
    bool        hasarg;
};

typedef struct optparser optparser_t;
struct optparser {
    char **argv;
    int    optind;
    int    shortind;
    char  *optarg;
    char   errmsg[OPT_ERRMSG_MAX];

    const option_cfg_t *options;
};

int parseopt(optparser_t *parser);

#endif // TOOL_OPTION_H
