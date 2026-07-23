// SPDX-License-Identifier: MIT

/*
 * strings - An extension library for strings of known size.
 * Copyright (C) 2025  <lhearachel@proton.me>
 */

#ifndef STRINGS_H
#define STRINGS_H

typedef struct {
    unsigned char *s;
    long           len;
} string;

typedef struct {
    string head;
    string tail;
} strpair;

// clang-format off
// constructor macros
#define string(...)           stringX(__VA_ARGS__, stringL, stringS)(__VA_ARGS__)
#define stringX(a, b, c, ...) c
#define stringZ               (string){ .s = 0,   .len = 0 }
#define stringS(__s)          (string){ .s = (unsigned char *)(__s), .len = sizeof(__s) / sizeof(*(__s)) - 1 }
#define stringL(__s, __len)   (string){ .s = (unsigned char *)(__s), .len = (__len) }

// unpacking macro for use by printf-esque functions
// the corresponding format-marker is “%.*s”
#define fmtstring(__str) (int)(__str).len, (__str).s
// clang-format on

/*
 * Cut a string into head and tail around the first occurrence of any delimiting token. If no such
 * token is found, then the returned head will be the input string, and the returned tail will have
 * length 0.
 */
strpair strcut(const string s, unsigned char c);

/*
 * Trim leading ASCII-whitespace characters from a string.
 */
string strltrim(string s);

/*
 * Trim trailing ASCII-whitespace characters from a string.
 */
string strrtrim(string s);

/*
 * Return 1 if the two strings are equal, else return 0.
 */
int strequ(const string a, const string b);

/*
 * Return 1 if up to the first `n` characters of both strings are equal, else return 0.
 * If either string contains fewer than `n` characters, then the smaller string defines the
 * comparison length.
 */
int strnequ(const string a, const string b, long n);

/*
 * Evaluate a case-insensitive comparison between two strings.
 */
int stricmp(const string a, const string b);

#endif // STRINGS_H
