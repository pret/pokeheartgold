/*
 * #include <libenum.h> - A library for loading C enums into member-mappings
 * Copyright (C) 2026  <rachel@lhea.me>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include "libenum.h"

#include <assert.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

typedef struct enum_lex enum_lex_t;
struct enum_lex {
    const char *p; // cursor location
    const char *e; // end-marker
    const char *s; // pointer to the start of the token
    size_t      n; // size of the token
};

static unsigned init(enum_seq_t *seq, size_t size);
static int      lex(enum_lex_t *lexer);
static char*    skip(const char *str, int (*is_space)(char c));

static inline int is_hspace(char c) {
    return c == ' ' || c == '\t';
}

static inline int is_vspace(char c) {
    return c == '\r' || c == '\n';
}

static inline int is_wspace(char c) {
    return is_hspace(c) || is_vspace(c);
}

static inline int is_alpha(char c) {
    return ((c >= 'a') && (c <= 'z'))
        || ((c >= 'A') && (c <= 'Z'));
}

static inline int is_digit(char c) {
    return (c >= '0') && (c <= '9');
}

static inline int is_word(char c) {
    return is_alpha(c) || is_digit(c) || c == '_';
}

enum {
    T_EOS,
    T_RBRACE,
    T_KWENUM,
    T_LBRACE,
    T_COMMA,
    T_EQUALS,
    T_IDENTIFIER,
    T_EXPRESSION,

    T_INVALID = -1,
    T_INVALIDKW = -2,
};

#define return_error(code) do { result.errc = code; goto error; } while (0)

#define EXPECT_LBRACE (1 << 0)
#define EXPECT_COMMA  (1 << 1)
#define EXPECT_EQUALS (1 << 2)
#define EXPECT_NAME   (1 << 3)
#define EXPECT_MEMBER (1 << 4)

static inline char* poolpush(const char **target, char *dst, const char *src, size_t n) {
    assert(target);
    assert(dst);
    assert(src);

    *target = memcpy(dst, src, n);
    dst[n]  = 0;
    return dst + n + 1;
}

enum_seq_t libenum_load(const char *str, size_t size, char **endptr) {
    enum_lex_t lexer = {
        .p = str,
        .e = str + size,
        .s = NULL,
        .n = 0,
    };

    enum_seq_t result = { 0 };
    if (init(&result, size) != LIBENUM_E_OK) return_error(result.errc);

    char    *p_pool = result.pool;
    int      token  = 0;
    unsigned expect = 0;
    size_t   cap    = 256;

    while ((token = lex(&lexer)) > T_RBRACE) {
        switch (token) {
        case T_KWENUM:
            // `enum` is only valid at the start of the stream.
            if (result.members) return_error(LIBENUM_E_KEYWORD);

            result.members = calloc(cap, sizeof(*result.members));
            if (!result.members) return_error(LIBENUM_E_ALLOC);

            expect = EXPECT_LBRACE | EXPECT_NAME;
            break;

        case T_LBRACE:
            if ((expect & EXPECT_LBRACE) == 0) return_error(LIBENUM_E_TOKEN);
            expect = EXPECT_MEMBER;
            break;

        case T_COMMA:
            if ((expect & EXPECT_COMMA) == 0) return_error(LIBENUM_E_TOKEN);
            expect = EXPECT_MEMBER;
            result.size++;
            break;

        case T_EQUALS:
            if ((expect & EXPECT_EQUALS) == 0) return_error(LIBENUM_E_TOKEN);

            lexer.p = skip(lexer.p, is_wspace);
            lexer.s = lexer.p;

            for (
                lexer.p = skip(lexer.p, is_wspace), lexer.s = lexer.p;
                lexer.p < lexer.e && *lexer.p && *lexer.p != ',' && *lexer.p != '}';
                lexer.p++
            );

            p_pool = poolpush(&result.members[result.size].expr, p_pool,
                               lexer.s, lexer.p - lexer.s);
            expect = EXPECT_COMMA;
            break;

        case T_IDENTIFIER:
            if ((expect & EXPECT_NAME)) {
                p_pool = poolpush(&result.name, p_pool, lexer.s, lexer.n);
                expect = EXPECT_LBRACE;
                break;
            }

            if ((expect & EXPECT_MEMBER) == 0) return_error(LIBENUM_E_STRAYMEMB);
            if (result.size + 1 >= cap) {
                const size_t   new  = cap * 2;
                const size_t   size = new * sizeof(*result.members);
                enum_member_t *tmp  = realloc(result.members, size);
                if (!tmp) return_error(LIBENUM_E_ALLOC);

                memset(&tmp[result.size], 0, cap * sizeof(*tmp));
                result.members = tmp;
                cap            = new;
            }

            for (size_t i = 0; i < result.size; i++) {
                if (strncmp(result.members[i].name, lexer.s, lexer.n) == 0
                    && strlen(result.members[i].name) == lexer.n) {
                    return_error(LIBENUM_E_DUPLICATE);
                }
            }

            p_pool = poolpush(&result.members[result.size].name, p_pool,
                              lexer.s, lexer.n);
            expect = EXPECT_EQUALS | EXPECT_COMMA;
            break;

        default: assert(0 && "unexpected token type");
        }
    }

    switch (token) {
    case T_EOS:       return_error(LIBENUM_E_EOS);
    case T_INVALID:   return_error(LIBENUM_E_TOKEN);
    case T_INVALIDKW: return_error(LIBENUM_E_KEYWORD);

    case T_RBRACE:
        // Account for any member followed by a closing-brace
        if (expect & EXPECT_COMMA) result.size++;
        break;
    }

    if (result.size == 0) return_error(LIBENUM_E_EMPTY);

    lexer.p = skip(lexer.p, is_wspace);
    if (lexer.p >= lexer.e || *lexer.p != ';') return_error(LIBENUM_E_SEMICOLON);

    if (endptr) *endptr = (char *)lexer.p;
    return result;

error:
    free(result.members);
    free(result.pool);
    if (endptr) *endptr = (char *)(lexer.s ? lexer.s : lexer.p);

    result.members = NULL;
    result.pool    = NULL;
    result.name    = NULL;
    result.size    = 0;
    return result;
}

#define countof(a)  (sizeof(a) / sizeof(*(a)))
#define lengthof(s) (countof(s) - 1)

enum_seq_t libenum_find(const char *str, size_t size, const char *name,
                        char **endptr) {
    const char *p = str;
    const char *e = str + size;

    // skip over tokens / lines until we find an enum keyword which is followed
    // by an identifier matching 'name'
    for (; p < e; p++) {
        if (*p == '#') { // scan to end-of-line, then continue
            do { p++; } while (*p != '\n');
            continue;
        }

        if (!is_alpha(*p)) continue;

        const char *s = p;
        p             = skip(p, is_wspace);
        if ((size_t)(e - p) < lengthof("enum "))       continue; // too short
        if (strncmp(p, "enum", lengthof("enum")) != 0) continue; // not "enum"
        if (!is_wspace(p[lengthof("enum")]))           continue; // unnamed

        p += lengthof("enum");
        const char *sym_beg = skip(p, is_wspace);
        if (sym_beg < e && !is_alpha(*sym_beg) && *sym_beg != '_') {
            p = sym_beg;
            continue;
        }

        const char *sym_end = sym_beg;
        do { sym_end++; } while (sym_end < e && is_word(*sym_end));

        if (strncmp(name, sym_beg, sym_end - sym_beg) != 0) {
            p = sym_end;
            continue;
        }

        return libenum_load(s, e - s, endptr);
    }

    if (endptr) *endptr = (char *)p;
    return (enum_seq_t){ 0 };
}

// reference: https://cppreference.com/c/keyword
static const char *keywords[] = {
    "auto",
    "break",
    "case",
    "char",
    "const",
    "continue",
    "default",
    "do",
    "double",
    "else",
    // "enum" is allowed for obvious reasons
    "extern",
    "float",
    "for",
    "goto",
    "if",
    "int",
    "long",
    "register",
    "return",
    "short",
    "signed",
    "sizeof",
    "static",
    "struct",
    "switch",
    "typedef",
    "union",
    "unsigned",
    "void",
    "volatile",
    "while",

#if __STDC_VERSION__ >= 199901L
    "inline",
    "restrict",
    "_Bool",
    "_Complex",
    "_Imaginary",
#endif

#if __STDC_VERSION__ >= 201112L
    "_Alignas",
    "_Alignof",
    "_Atomic",
    "_Generic",
    "_Noreturn",
    "_Static_assert",
    "_Thread_local",
#endif

#if __STDC_VERSION__ >= 202311L
    "alignas",
    "alignof",
    "bool",
    "constexpr",
    "false",
    "nullptr",
    "static_assert",
    "thread_local",
    "true",
    "typeof",
    "typeof_unqual",
    "_BitInt",
    "_Decimal128",
    "_Decimal32",
    "_Decimal64",
#endif
};

static int is_keyword(const char *s, size_t n) {
    for (size_t i = 0; i < countof(keywords); i++) {
        if (strncmp(keywords[i], s, n) == 0) return 1;
    }

    return 0;
}

static int lex(enum_lex_t *lexer) {
    lexer->p = skip(lexer->p, is_wspace);
    lexer->s = NULL;

    if (*lexer->p == '\0' || lexer->p >= lexer->e) return T_EOS;

    if (is_alpha(*lexer->p) || *lexer->p == '_') {
        lexer->s = lexer->p;
        do { lexer->p++; } while (lexer->p < lexer->e && is_word(*lexer->p));

        lexer->n = lexer->p - lexer->s;
        if (strncmp(lexer->s, "enum", lexer->n) == 0) return T_KWENUM;
        if (is_keyword(lexer->s, lexer->n))           return T_INVALIDKW;
        return T_IDENTIFIER;
    }

    switch (*lexer->p) {
    case '{': lexer->p++; return T_LBRACE;
    case '}': lexer->p++; return T_RBRACE;
    case ',': lexer->p++; return T_COMMA;
    case '=': lexer->p++; return T_EQUALS;

    default: return T_INVALID;
    }
}

static unsigned init(enum_seq_t *seq, size_t size) {
    seq->pool = calloc(size + 1, sizeof(*seq->pool));
    if (!seq->pool) return (seq->errc = LIBENUM_E_ALLOC);

    seq->name = "";
    return LIBENUM_E_OK;
}

static char* skip(const char *str, int (*is_space)(char c)) {
    assert(str);

    for (;;) {
        while (is_space(*str)) str++;

        if (str[0] == '/' && str[1] == '/') {
            str += 2;
            while (str[0] && str[0] != '\r' && str[0] != '\n') str++;
            continue;
        }

        if (str[0] == '/' && str[1] == '*') {
            const char *start = str;

            str += 2;
            while (str[0] && str[1] && !(str[0] == '*' && str[1] == '/')) str++;
            if    (!str[0] || !str[1]) { str = start; break; } // unterminated
            str += 2;
            continue;
        }

        break;
    }

    return (char *)str;
}

enum_seq_t libenum_loadcpp(const char *str, size_t size, const char *prefix,
                           char **endptr) {
    const char *p      = str;
    const char *e      = str + size;
    enum_seq_t  result = { 0 };
    if (init(&result, size) != LIBENUM_E_OK) return_error(result.errc);

    char   *p_pool = result.pool;
    size_t  cap    = 256;

    result.members = calloc(cap, sizeof(*result.members));
    if (!result.members) return_error(LIBENUM_E_ALLOC);

    size_t prefix_len = 0;
    if (!prefix) prefix     = "";
    else         prefix_len = strlen(prefix);

    const char *s, *lf;
    for (p = skip(p, is_hspace); p < e; p++) {
        s  = p;
        lf = p;
        while (lf < e && *lf != '\n') lf++; // TODO: escaped new-lines?
        p = lf;

        if (lf[-1] == '\r') lf--;
        if (*s != '#') continue;
        if (strncmp(s + 1, "define", lengthof("define")) != 0) continue;

        // Parse out the symbol name
        const char *sym_beg = skip(s + lengthof("#define"), is_hspace);
        const char *sym_end = sym_beg;
        if (sym_beg >= lf || (!is_alpha(*sym_beg) && *sym_beg != '_')) {
            p = sym_beg;
            return_error(LIBENUM_E_MISSING);
        }

        do { sym_end++; } while (sym_end < e && is_word(*sym_end));
        if (is_vspace(*sym_end) || *sym_end == '(') continue;
        if (!is_hspace(*sym_end)) {
            p = sym_end;
            return_error(LIBENUM_E_TOKEN);
        }

        if (strncmp(prefix, sym_beg, prefix_len) != 0) continue;

        const char *expr_beg = skip(sym_end + 1, is_hspace);
        const char *expr_end = lf;

        if (result.size + 1 >= cap) {
            const size_t   new  = cap * 2;
            const size_t   size = new * sizeof(*result.members);
            enum_member_t *tmp  = realloc(result.members, size);
            if (!tmp) return_error(LIBENUM_E_ALLOC);

            memset(&tmp[result.size], 0, cap * sizeof(*tmp));
            result.members = tmp;
            cap            = new;
        }

        const size_t sym_len  = sym_end - sym_beg;
        const size_t expr_len = expr_end - expr_beg;
        for (size_t i = 0; i < result.size; i++) {
            if (strncmp(result.members[i].name, sym_beg, sym_len) == 0) {
                p = sym_beg;
                return_error(LIBENUM_E_DUPLICATE);
            }
        }

        enum_member_t *memb = &result.members[result.size++];
        p_pool = poolpush(&memb->name, p_pool, sym_beg, sym_len);
        p_pool = poolpush(&memb->expr, p_pool, expr_beg, expr_len);
    }

    if (result.size == 0) free(result.members); // unlike enums, this is valid
    if (endptr)           *endptr = (char *)p;
    return result;

error:
    free(result.members);
    free(result.pool);
    if (endptr) *endptr = (char *)p;

    result.members = NULL;
    result.pool    = NULL;
    result.name    = NULL;
    result.size    = 0;
    return result;
}

const char* libenum_errs(unsigned errc) {
    switch (errc) {
    case LIBENUM_E_OK:        return "(ok)";
    case LIBENUM_E_ALLOC:     return "allocation failure";
    case LIBENUM_E_EOS:       return "unexpected end-of-stream";
    case LIBENUM_E_TOKEN:     return "unexpected token in enum definition";
    case LIBENUM_E_KEYWORD:   return "stray keyword in enum definition";
    case LIBENUM_E_STRAYMEMB: return "unexpected member definition";
    case LIBENUM_E_DUPLICATE: return "duplicate member definition";
    case LIBENUM_E_EMPTY:     return "empty enum definition";
    case LIBENUM_E_SEMICOLON: return "missing semicolon after enum definition";
    case LIBENUM_E_MISSING:   return "missing preprocessor substitution";

    default: return "(unknown error code)";
    }
}
