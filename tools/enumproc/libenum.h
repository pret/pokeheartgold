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

#ifndef LIBENUM_H
#define LIBENUM_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

#define LIBENUM_E_OK        0
#define LIBENUM_E_ALLOC     1
#define LIBENUM_E_EOS       2
#define LIBENUM_E_TOKEN     3
#define LIBENUM_E_KEYWORD   4
#define LIBENUM_E_STRAYMEMB 5
#define LIBENUM_E_DUPLICATE 6
#define LIBENUM_E_EMPTY     7
#define LIBENUM_E_SEMICOLON 8
#define LIBENUM_E_MISSING   9

typedef struct enum_member enum_member_t;
typedef struct enum_seq    enum_seq_t;

struct enum_member {
    const char *name;
    const char *expr;
};

struct enum_seq {
    const char    *name;
    enum_member_t *members;
    size_t         size;
    char          *pool;
    unsigned       errc;
};

/**
 * Load a C-style enum definition from `str` into a member-mapping.
 *
 * The resulting structure contains two allocations to be `free`d by the caller:
 *
 *   1. `members`, which contains the list of members.
 *   2. `pool`, which is contains all zero-terminated strings present in the
 *      member-mapping.
 *
 * Each member's `name` field points to a zero-terminated string. If the value
 * of a member is assigned by an integer-constant expression rather than as a
 * natural successor, then the member's `expr` field points to a zero-terminated
 * string for that expression. When natural succession is used, `expr` is set to
 * `NULL`.
 *
 * If `endptr` is not `NULL`, then this routine will store the address of the
 * semicolon which terminates the enum definition, if one is present. If the
 * terminating semicolon is missing, then it is treated as an error.
 *
 * Members within the returned mapping are guaranteed to be uniquely named
 * within the enum's scope. If parsing fails for any reason, then the returned
 * mapping's `errc` value will be set to an associated error code. Additionally,
 * if `endptr` is not `NULL`, the address of the first invalid character for the
 * last-processed token will be stored in `*endptr`.
 */
enum_seq_t libenum_load(const char *str, size_t size, char **endptr);

/**
 * Load all C preprocessor `#define` directives from `str`, as if they were
 * defined with a C-style enum using assignment expressions.
 *
 * Functional macros and macros without substitution-text are skipped. Macros
 * which escape new-lines in their substitution-text are not supported and are
 * treated as if those escapes do not exist.
 *
 * If `prefix` is not `NULL`, then only substitutions which begin with `prefix`
 * will be loaded into the resulting member-mapping.
 *
 * If `endptr` is not `NULL`, then this routine will store the address of the
 * last-processed character on return.
 *
 * Members within the returned mapping are guaranteed to be uniquely named
 * across all other mapped `#define` directives.
 */
enum_seq_t libenum_loadcpp(const char *str, size_t size, const char *prefix,
                           char **endptr);

/**
 * Find a C-style enum definition from `str` with a given `name` and load it
 * into a member-mapping, as in `libenum_load`. If no such instance is found,
 * then the returned mapping will be all zeroes.
 */
enum_seq_t libenum_find(const char *str, size_t size, const char *name,
                        char **endptr);

/**
 * Get a descriptive string for the provided error code. The returned string
 * is statically-allocated and does not need to be `free`d.
 */
const char* libenum_errs(unsigned errc);

#ifdef __cplusplus
}
#endif

#endif // LIBENUM_H
