// SPDX-License-Identifier: MIT

#include "libs/strings.h"

int space(int c)
{
    return (c >= '\t' && c <= '\r') || c == ' ';
}

strpair strcut(const string s, unsigned char c)
{
    strpair pair = {
        .head = s,
        .tail = stringZ,
    };

    for (long i = 0; i < pair.head.len; i++) {
        if (pair.head.s[i] == c) {
            pair.tail.s   = pair.head.s + i + 1;
            pair.tail.len = pair.head.len - i - 1;
            pair.head.len = i;
            break;
        }
    }

    return pair;
}

string strltrim(string s)
{
    while (s.len > 0 && space(s.s[0])) {
        s.s++;
        s.len--;
    }
    return s;
}

string strrtrim(string s)
{
    while (s.len > 0 && space(s.s[s.len - 1])) s.len--;
    return s;
}

static inline int _strnequ(const string a, const string b, long n) // NOLINT
{
    long i = 0;
    for (; i < n && a.s[i] == b.s[i]; i++);
    return i == n;
}

int strequ(const string a, const string b) // NOLINT
{
    return a.len == b.len && _strnequ(a, b, a.len);
}

#define min(__a, __b) ((__a) <= (__b) ? (__a) : (__b))

int strnequ(const string a, const string b, long n) // NOLINT
{
    n = n < a.len && n < b.len ? n : min(a.len, b.len);
    return _strnequ(a, b, n);
}

#define lower(__c) (((__c) >= 'A' && (__c) <= 'Z') ? (__c) + ('a' - 'A') : (__c))

int stricmp(const string a, const string b)
{
    long n = min(a.len, b.len);
    long i = 0;
    for (; i < n && lower(a.s[i]) == lower(b.s[i]); i++);

    unsigned char ac = lower(a.s[i]);
    unsigned char bc = lower(b.s[i]);

    // 0 if equal, -1 if a is lesser, 1 if b is lesser
    return i == n ? ac != bc : ac < bc ? -1 : 1;
}
