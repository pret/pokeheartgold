#ifndef DATAPROC_PRIVATE_H
#define DATAPROC_PRIVATE_H

#include <stddef.h>

#include "dataproc.h"

typedef struct span span_t;
struct span {
    size_t beg;
    size_t end;
};

struct diagnostic {
    span_t      span;
    const char *message;

    enum diaglevel level;
    diagnostic_t  *prev;
    diagnostic_t  *next;
};

#endif // DATAPROC_PRIVATE_H
