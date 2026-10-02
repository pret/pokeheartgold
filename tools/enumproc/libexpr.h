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

#ifndef LIBEXPR_H
#define LIBEXPR_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>

typedef struct var var_t;
struct var {
    long        value;
    const char *name;
};

typedef struct scope scope_t;
struct scope {
    var_t *vars;
    size_t len;
};

/**
 * Evaluate a integer-constant expression from a zero-terminated string `expr`.
 *
 * Variable-identifiers will be replaced with their corresponding value in
 * `scope`, if found. Otherwise, the result is an error.
 *
 * On return, if `endptr` is not `NULL`, the address of the last-processed
 * character will be stored in `*endptr`. That is, the expression is valid if
 * `*endptr` points to the zero-terminator for `expr`.
 */
long libexpr_eval(const char *expr, char **endptr, scope_t *scope);

#ifdef __cplusplus
}
#endif

#endif // LIBEXPR_H
