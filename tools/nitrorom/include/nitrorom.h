// SPDX-License-Identifier: MIT

#ifndef NITROROM_H
#define NITROROM_H

#define die(__msg, ...)                        \
    {                                          \
        fputs(PROGRAM_NAME ": ", stderr);      \
        fprintf(stderr, __msg, ##__VA_ARGS__); \
        fputc('\n', stderr);                   \
        exit(EXIT_FAILURE);                    \
    }

#define dieusage(__msg, ...)                 \
    {                                        \
        fputs(PROGRAM_NAME ": ", stderr);    \
        fprintf(stderr, __msg, __VA_ARGS__); \
        fputs("\n\n", stderr);               \
        showusage(stderr);                   \
        exit(EXIT_FAILURE);                  \
    }

#define dieiferr(__cond, __resT)                \
    {                                           \
        __resT __res = __cond;                  \
        if (__res.code != 0) {                  \
            fprintf(stderr, "%s\n", __res.msg); \
            exit(EXIT_FAILURE);                 \
        }                                       \
    }

#endif // NITROROM_H
