#include <assert.h>
#include <errno.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "libenum.h"
#include "libexpr.h"

typedef struct strbuf strbuf_t;
struct strbuf {
    char  *data;
    size_t len;
};

strbuf_t slurp_file(const char *filename) {
    FILE *f = fopen(filename, "rb");
    if (f == NULL) {
        fprintf(stderr, "enumproc: error: cannot read file: %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }

    fseek(f, 0, SEEK_END);
    long fsize = ftell(f);
    fseek(f, 0, SEEK_SET);

    if (fsize < 0) {
        fprintf(stderr, "enumproc: error: cannot tell file: %s\n", strerror(errno));
        goto error;
    }

    char *buf = calloc(fsize + 1, sizeof(*buf));
    if (buf == NULL) {
        fprintf(stderr, "enumproc: error: cannot allocate for file-read: %s\n", strerror(errno));
        goto error;
    }

    if (fread(buf, sizeof(*buf), fsize, f) != (size_t)fsize) {
        fprintf(stderr, "enumproc: error: unexpected end-of-file during read: %s\n", strerror(errno));
        goto error;
    }

    fclose(f);
    return (strbuf_t){ .data = buf, .len = fsize };

error:
    fclose(f);
    exit(EXIT_FAILURE);
}

strbuf_t slurp_stdin(void) {
    char   *line   = NULL;
    size_t  size   = 0;
    ssize_t nread  = 0;
    size_t  cap    = 4096;
    char   *buf    = calloc(cap, sizeof(*buf));
    size_t  buflen = 0;

    while ((nread = getline(&line, &size, stdin)) != -1) {
        if (buflen + nread >= cap) {
            buf  = realloc(buf, cap * 2 * sizeof(*buf));
            cap *= 2;
        }

        memcpy(buf + buflen, line, nread);
        buflen     += nread;
        buf[buflen] = 0;
    }

    free(line);
    return (strbuf_t){ .data = buf, .len = buflen };
}

bool isws(char c) {
    return c == ' ' || c == '\t' || c == '\r' || c == '\n';
}

strbuf_t strbuf_dupe(strbuf_t *s) {
    strbuf_t r = {
        .data = calloc(s->len + 1, sizeof(*r.data)),
        .len  = s->len,
    };

    memcpy(r.data, s->data, s->len);
    return r;
}

#define MAX_PATH    4096
#define DEFAULT_CAP 256

typedef struct incentry incentry_t;
typedef struct incstack incstack_t;

struct incentry {
    char  *name;
    size_t line;
};

struct incstack {
    incentry_t *data;
    size_t      len;
    size_t      cap;
};

static inline void push(incstack_t *stack, char *s, char *e, size_t linenum) {
    if (stack->len + 1 >= stack->cap) {
        size_t      new = stack->cap * 2;
        incentry_t *tmp = realloc(stack->data, new * sizeof(*stack->data));
        if (tmp != NULL) {
            fputs("re-allocation failure\n", stderr);
            exit(EXIT_FAILURE);
        }

        stack->data = tmp;
        stack->cap  = new;
    }

    incentry_t entry = {
        .name = calloc(e - s + 1, sizeof(*entry.name)),
        .line = linenum,
    };

    memcpy(entry.name, s, e - s);
    entry.name[e - s] = 0;

    stack->data[stack->len++] = entry;
}

static inline incentry_t* pop(incstack_t *stack) {
    if (stack->len == 0) return NULL;

    return &stack->data[--stack->len];
}

// Process line-markers for diagnostics: '# linenum "filename" flags'
static size_t proc_linemark(const char *p, char **pend, incstack_t *stack) {
    char *endptr = NULL;

    size_t linenum = strtoul(p + 2, &endptr, 10); // endptr at space separator
    endptr        += 2;                           // skip space + leading quote

    char *s = endptr; // start of filename
    while (*endptr != '"') endptr++;
    char *e = endptr; // trailing-quote

    char *f = endptr + 1;
    if (*f == '\n') {
        if (linenum == 1) push(stack, s, e, linenum); // this is the input path
        goto early_exit; // no flags to process
    }

    switch (strtol(f, &endptr, 10)) {
    case 1:  push(stack, s, e, linenum);      break;
    case 2:  if (pop(stack) == NULL) abort(); // fall-through
    default: break;
    }

early_exit:
    if (pend) *pend = endptr;
    return linenum;
}

__attribute__((format(printf, 3, 4)))
static void report(strbuf_t content, size_t errpos, const char *fmt, ...) {
    incstack_t incs = {
        .data = calloc(DEFAULT_CAP, sizeof(*incs.data)),
        .cap  = DEFAULT_CAP,
        .len  = 0,
    };

    size_t line = 1;
    size_t col  = 1;
    char  *s    = content.data;
    char  *p    = content.data;
    char  *e    = content.data + content.len;

    // Find the line and column number for the error.
    while (p < e && (size_t)(p - s) < errpos) {
        switch (*p) {
        case '#' : line = proc_linemark(p, &p, &incs); col = 0; break;
        case '\n': col = 0; line++; break;
        }

        col++;
        p++;
    }

    incentry_t *entry = pop(&incs);
    assert(entry && "unexpected empty include-stack");

    va_list args;
    va_start(args, fmt);
    fputs("enumproc: error: ", stderr);
    vfprintf(stderr, fmt, args);
    fputc('\n', stderr);
    va_end(args);

    fprintf(stderr, "  in %s, on line %zu, col %zu\n", entry->name, line, col);
    while ((entry = pop(&incs)) != NULL) {
        fprintf(stderr, "  included by %s\n", entry->name);
    }
}

int main(int argc, char **argv) {
    strbuf_t content  = argc == 1 ? slurp_stdin() : slurp_file(argv[1]);
    strbuf_t pool     = strbuf_dupe(&content);
    size_t   scopecap = 256;
    scope_t  scope    = {
        .vars = calloc(scopecap, sizeof(*scope.vars)),
        .len  = 0,
    };

    char *p = pool.data;
    char *e = pool.data + pool.len;
    while (p < e) {
        char *endptr  = NULL;

        while (isws(*p)) { fputc(*p, stdout); p++; }
        if (strncmp(p, "enum", 4) == 0) {
            enum_seq_t parsed = libenum_load(p, e - p, &endptr);
            if (parsed.errc != 0) {
                report(content, (size_t)(endptr - pool.data), "%s", libenum_errs(parsed.errc));
                exit(EXIT_FAILURE);
            }

            long curr = 0;
            for (size_t i = 0; i < parsed.size; i++) {
                enum_member_t *member = &parsed.members[i];

                char *endptr = NULL;
                if (member->expr != NULL) curr = libexpr_eval(member->expr, &endptr, &scope);
                if (endptr && *endptr) {
                    report(content, (size_t)(endptr - pool.data), "invalid expression");
                    exit(EXIT_FAILURE);
                }

                if (scope.len + 1 >= scopecap) {
                    size_t newcap = scopecap * 2;
                    var_t *newarr = realloc(scope.vars, newcap);
                    if (newarr == NULL) {
                        fprintf(stderr, "enumproc: allocation failure: %s\n", strerror(errno));
                        exit(EXIT_FAILURE);
                    }

                    scopecap   = newcap;
                    scope.vars = newarr;
                }

                var_t *var = &scope.vars[scope.len++];
                var->value = curr++;
                var->name  = member->name;

                printf("#define %s %ld\n", var->name, var->value);
            }

            free(parsed.members);
            p = endptr;
            p = *p == ';'  ? p + 1 : p;
            p = *p == '\n' ? p + 1 : p;
        }
        else {
            if (*p == '\0') break;
            do { fputc(*p, stdout); p++; } while (*p && *p != '\n');
        }
    }

    free(content.data);
    free(pool.data);
    exit(EXIT_SUCCESS);
}
