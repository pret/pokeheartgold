/*
 * #include <libexpr.h> - A library for evaluating integer-constant expressions
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

#include "libexpr.h"

#include <assert.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

static inline bool is_space(char c) {
    return c == ' ' || c == '\t' || c == '\r' || c == '\n';
}

static inline bool is_alpha(char c) {
    return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}

static inline bool is_digit(char c) {
    return (c >= '0' && c <= '9');
}

static inline bool is_word(char c) {
    return is_alpha(c) || is_digit(c) || c == '_';
}

static char* skip(const char *str) {
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

typedef struct evalstack evalstack_t;
struct evalstack {
    long   nums[16];
    size_t n_nums;

    int    opts[16];
    size_t n_opts;

    int    unas[16];
    size_t n_unas;
};

#define precedes(o1, o2)  opt_data[o2].prec < opt_data[o1].prec
#define congruent(o1, o2) opt_data[o2].prec == opt_data[o1].prec
#define is_left(opt)      opt_data[opt].left

#define top(stk, var)       stk.var[stk.n_##var - 1]
#define pop(stk, var)       stk.var[--stk.n_##var]
#define push(stk, var, val) stk.var[stk.n_##var++] = val

#define evalbinary(o)                                        \
    do {                                                     \
        assert(stk.n_nums >= 2);                             \
        stk.n_nums -= 2;                                     \
                                                             \
        long *p_args = &stk.nums[stk.n_nums];                \
        long  result = 0;                                    \
        switch (o) {                                         \
        case OP_MUL: result = p_args[0] *  p_args[1]; break; \
        case OP_DIV: result = p_args[0] /  p_args[1]; break; \
        case OP_MOD: result = p_args[0] %  p_args[1]; break; \
        case OP_ADD: result = p_args[0] +  p_args[1]; break; \
        case OP_SUB: result = p_args[0] -  p_args[1]; break; \
        case OP_LSH: result = p_args[0] << p_args[1]; break; \
        case OP_RSH: result = p_args[0] >> p_args[1]; break; \
        case OP_LST: result = p_args[0] <  p_args[1]; break; \
        case OP_LTE: result = p_args[0] <= p_args[1]; break; \
        case OP_GRT: result = p_args[0] >  p_args[1]; break; \
        case OP_GTE: result = p_args[0] >= p_args[1]; break; \
        case OP_DEQ: result = p_args[0] == p_args[1]; break; \
        case OP_NEQ: result = p_args[0] != p_args[1]; break; \
        case OP_BAN: result = p_args[0] &  p_args[1]; break; \
        case OP_XOR: result = p_args[0] ^  p_args[1]; break; \
        case OP_BOR: result = p_args[0] |  p_args[1]; break; \
        case OP_AND: result = p_args[0] && p_args[1]; break; \
        case OP_ORR: result = p_args[0] || p_args[1]; break; \
                                                             \
        default: assert(0 && "illegal op-type");             \
        }                                                    \
                                                             \
        push(stk, nums, result);                             \
    } while (0)

#define evalunary(o)                                         \
    do {                                                     \
        assert(stk.n_nums >= 1);                             \
                                                             \
        long res = pop(stk, nums);                           \
        switch (o) {                                         \
        case OP_POS: res = res < 0 ? -res : res; break;      \
        case OP_NEG: res = res > 0 ? -res : res; break;      \
        case OP_NOT: res = !res;                 break;      \
        case OP_BNT: res = ~res;                 break;      \
                                                             \
        default: assert(0 && "illegal op-type");             \
        }                                                    \
                                                             \
        push(stk, nums, res);                                \
    } while (0)

// ref: https://en.wikipedia.org/wiki/Shunting_yard_algorithm
long libexpr_eval(const char *expr, char **endptr, scope_t *scope) {
    enum op {
        OP_LPA,
        OP_RPA,
        OP_POS,
        OP_NEG,
        OP_NOT,
        OP_BNT,
        OP_MUL,
        OP_DIV,
        OP_MOD,
        OP_ADD,
        OP_SUB,
        OP_LSH,
        OP_RSH,
        OP_LST,
        OP_LTE,
        OP_GRT,
        OP_GTE,
        OP_DEQ,
        OP_NEQ,
        OP_BAN,
        OP_XOR,
        OP_BOR,
        OP_AND,
        OP_ORR,
    };

    // ref: https://en.cppreference.com/w/c/language/operator_precedence.html
    static const struct { int prec; bool left; } opt_data[] = {
        [OP_LPA] = { .prec = 1,  .left = true  },
        [OP_RPA] = { .prec = 1,  .left = true  },
        [OP_POS] = { .prec = 2,  .left = false },
        [OP_NEG] = { .prec = 2,  .left = false },
        [OP_NOT] = { .prec = 2,  .left = false },
        [OP_BNT] = { .prec = 2,  .left = false },
        [OP_MUL] = { .prec = 3,  .left = true  },
        [OP_DIV] = { .prec = 3,  .left = true  },
        [OP_MOD] = { .prec = 3,  .left = true  },
        [OP_ADD] = { .prec = 4,  .left = true  },
        [OP_SUB] = { .prec = 4,  .left = true  },
        [OP_LSH] = { .prec = 5,  .left = true  },
        [OP_RSH] = { .prec = 5,  .left = true  },
        [OP_LST] = { .prec = 6,  .left = true  },
        [OP_LTE] = { .prec = 6,  .left = true  },
        [OP_GRT] = { .prec = 6,  .left = true  },
        [OP_GTE] = { .prec = 6,  .left = true  },
        [OP_DEQ] = { .prec = 7,  .left = true  },
        [OP_NEQ] = { .prec = 7,  .left = true  },
        [OP_BAN] = { .prec = 8,  .left = true  },
        [OP_XOR] = { .prec = 9,  .left = true  },
        [OP_BOR] = { .prec = 10, .left = true  },
        [OP_AND] = { .prec = 11, .left = true  },
        [OP_ORR] = { .prec = 12, .left = true  },
    };

    int o1, o2;

    const char *p   = skip(expr);
    char       *e   = NULL;
    bool        u   = true,  n = true;
    long        m   = 1;
    evalstack_t stk = { 0 };

    while (*p) {
        if (is_alpha(*p) || *p == '_') {
            if (!n) goto early_exit;
            const char *var_beg = p;
            do { p++; } while (is_word(*p));

            const char  *var_end = p;
            const size_t var_len = var_end - var_beg;

            var_t *match = NULL;
            for (size_t i = 0; scope && i < scope->len && !match; i++) {
                if (strncmp(scope->vars[i].name, var_beg, var_len) == 0) {
                    match = &scope->vars[i];
                }
            }

            if (!match) {
                p = var_beg;
                goto early_exit; // undefined symbol
            }

            push(stk, nums, match->value);
            while (stk.n_unas > 0) {
                o1 = pop(stk, unas);
                evalunary(o1);
            }

            p = skip(p);
            n = false;
            u = false;
            continue;
        }

        switch (*p) {
        case '0': case '1': case '2': case '3': case '4':
        case '5': case '6': case '7': case '8': case '9':
            if (!n) goto early_exit;
            push(stk, nums, strtol(p, &e, 0));
            while (stk.n_unas > 0) {
                o1 = pop(stk, unas);
                evalunary(o1);
            }

            p = e;
            n = false;
            u = false;
            break;

#define prepunary(opt)       do { push(stk, unas, opt); p++; n = true; } while (0)
#define procbinary(opt, len) do { o1 = opt; p += len; goto handle_binary; } while (0)

        case '+':
            if (u) prepunary(OP_POS);
            else   procbinary(OP_ADD, 1);
            break;

        case '-':
            if (u) prepunary(OP_NEG);
            else   procbinary(OP_SUB, 1);
            break;

        case '!':
            if (u) prepunary(OP_NOT);
            else {
                assert(p[1] == '=' && "invalid operator (expected !=)");
                procbinary(OP_NEQ, 2);
            }
            break;

        case '=':
            assert(p[1] == '=' && "invalid operator (expected ==)");
            procbinary(OP_DEQ, 2);
            break;

        case '*': procbinary(OP_MUL, 1);
        case '/': procbinary(OP_DIV, 1);
        case '%': procbinary(OP_MOD, 1);
        case '^': procbinary(OP_XOR, 1);
        case '~': prepunary(OP_BNT); break;

        case '<':
            if (p[1] == '<') procbinary(OP_LSH, 2);
            if (p[1] == '=') procbinary(OP_LTE, 2);
            procbinary(OP_LST, 1);

        case '>':
            if (p[1] == '>') procbinary(OP_RSH, 2);
            if (p[1] == '=') procbinary(OP_GTE, 2);
            procbinary(OP_GRT, 1);

        case '&':
            if (p[1] == '&') procbinary(OP_AND, 2);
            procbinary(OP_BAN, 1);

        case '|':
            if (p[1] == '|') procbinary(OP_ORR, 2);
            procbinary(OP_BOR, 1);

        handle_binary:
            while (stk.n_opts > 0
                && (o2 = top(stk, opts)) != OP_LPA
                && (precedes(o1, o2) || (congruent(o1, o2) && is_left(o1)))) {
                o2 = pop(stk, opts);
                evalbinary(o2);
            }

            u = true;
            n = true;
            push(stk, opts, o1);
            break;

#undef procbinary
#undef prepunary

        case '(': push(stk, opts, OP_LPA); p++; u = true; n = true; break;
        case ')':
            o2 = -1;
            while (stk.n_opts > 0 && (o2 = pop(stk, opts)) != OP_LPA) {
                evalbinary(o2);
            }

            if (o2 != OP_LPA) goto early_exit;
            long v = pop(stk, nums) * m;
            push(stk, nums, v);

            while (stk.n_unas > 0) {
                o1 = pop(stk, unas);
                evalunary(o1);
            }

            n = false;
            u = false;
            p++;
            break;

        default: goto early_exit;
        }

        p = skip(p);
    }

early_exit:
    while (stk.n_opts > 0) {
        o2 = pop(stk, opts);
        assert(o2 != OP_LPA && "unclosed parentheses");
        evalbinary(o2);
    }

    while (stk.n_unas > 0) {
        o1 = pop(stk, unas);
        evalunary(o1);
    }

    if (endptr) *endptr = (char *)p;
    return stk.nums[0];
}
