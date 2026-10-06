// SPDX-License-Identifier: MIT

#ifndef CFGPARSE_H
#define CFGPARSE_H

#include <stdio.h> // NOLINT

#include "packer.h"

#include "libs/config.h"
#include "libs/strings.h"

#define configerr(__msg, ...)                                        \
    {                                                                \
        cfgresult __res = { .code = E_config_user, .pos = stringZ }; \
        snprintf(                                                    \
            (__res).msg,                                             \
            sizeof(__res).msg,                                       \
            "rompacker:configuration:%ld: " __msg,                   \
            line,                                                    \
            ##__VA_ARGS__                                            \
        );                                                           \
        return __res;                                                \
    }

#define configok              \
    (cfgresult)               \
    {                         \
        .code = E_config_none \
    }

typedef cfgresult (*valueparser)(rompacker *packer, string val, long line);

typedef struct keyvalueparser {
    string      key;
    valueparser parser;
} keyvalueparser;

typedef struct strkeyval {
    string       smatch;
    unsigned int val;
} strkeyval;

#define varsub(__val, __packer)                                                                 \
    {                                                                                           \
        if ((__val).len > 3 && (__val).s[0] == '$' && (__val).s[1] == '{'                       \
            && (__val).s[(__val).len - 1] == '}') {                                             \
            string   varkey = string((__val).s + 2, (__val).len - 3);                           \
            strpair *match  = (__packer)->vardefs->data;                                        \
            int      i      = 0;                                                                \
                                                                                                \
            for (; i < (__packer)->vardefs->len && !strequ(match->head, varkey); i++, match++); \
            if (i == (__packer)->vardefs->len)                                                  \
                configerr("found unknown var “%.*s”", fmtstring(varkey));                       \
                                                                                                \
            (__val) = match->tail;                                                              \
        }                                                                                       \
    }

#endif // CFGPARSE_H
