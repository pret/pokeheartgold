// SPDX-License-Identifier: MIT

#include "libs/config.h"

#include <stdio.h>

#include "libs/strings.h"

#define cfgresult(__code, __pos, __msg)                  \
    (cfgresult)                                          \
    {                                                    \
        .code = (__code), .msg = (__msg), .pos = (__pos) \
    }

typedef struct context {
    string     sec;
    long       line;
    cfghandler handler;
} context;

static inline int hasutf8bom(unsigned char *s)
{
    return s && s[0] == 0xEF && s[1] == 0xBB && s[2] == 0xBF;
}

cfgresult cfgparse(string cfg, const cfgsection sections[], void *user)
{
    if (hasutf8bom(cfg.s)) {
        cfg.s   += 3;
        cfg.len -= 3;
    }

    context context = { .sec = stringZ, .line = 1, .handler = 0 };
    strpair linecut = strcut(cfg, '\n');
    while (linecut.head.len > 0) {
        strpair innercut;
        string  stripped = strrtrim(linecut.head);
        if (stripped.len < 0) goto nextline;

        switch (stripped.s[0]) {
        case '\0': goto done;

        case '=': // fall-through
        case ':':
            return cfgresult(
                E_config_nokey,
                string(stripped.s, 1),
                "expected key before value-assignment, but found none"
            );

        case ']':
            return cfgresult(
                E_config_nosec,
                string(stripped.s, 1),
                "unexpected section-header terminator"
            );

        case '\t':
        case '\v':
        case '\f':
        case '\r':
        case ' ':
        case '#': // fall-through
        case ';':  break;

        case '[':
            if (stripped.s[stripped.len - 1] != ']') {
                cfgresult res
                    = cfgresult(E_config_untermsec, string(stripped.s, stripped.len - 1), "");
                snprintf(
                    res.msg,
                    sizeof(res.msg),
                    "expected section-header terminator, but found ‘%c’",
                    stripped.s[stripped.len - 1]
                );
                return res;
            }

            context.sec = string(stripped.s + 1, stripped.len - 2);

            const cfgsection *match = &sections[0];
            for (; match->handler != 0 && !strequ(context.sec, match->section); match++);
            if (match->handler == 0) {
                cfgresult res = cfgresult(E_config_unknownsec, context.sec, "");
                snprintf(
                    res.msg,
                    sizeof(res.msg),
                    "expected known section-header, but found “%.*s”",
                    fmtstring(context.sec)
                );
                return res;
            }

            context.handler = match->handler;
            break;

        default:
            if (context.handler == 0) {
                return cfgresult(
                    E_config_nosec,
                    stripped,
                    "expected section-header before first key-value pair"
                );
            }

            innercut      = strcut(stripped, '=');
            cfgresult res = context.handler(
                context.sec,
                strrtrim(innercut.head),
                strltrim(innercut.tail),
                user,
                context.line
            );
            if (res.code > E_config_none) return res;
            break;
        }

nextline:
        do {
            linecut = strcut(linecut.tail, '\n');
            context.line++;
        } while (linecut.head.len == 0 && linecut.tail.len > 0);
    }

done:
    return cfgresult(E_config_none, stringZ, "");
}
