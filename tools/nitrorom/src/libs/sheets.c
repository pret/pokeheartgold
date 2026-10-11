// SPDX-License-Identifier: MIT

#include "libs/sheets.h"

#include "libs/strings.h"
#include <stdio.h>

#define NEWLINE string("\n")

#define returniferr(__expr)                            \
    {                                                  \
        sheetsresult __err = (__expr);                 \
        if (__err.code != E_sheets_none) return __err; \
    }

#define sheetsresult(__code, __pos, __msg)               \
    (sheetsresult)                                       \
    {                                                    \
        .code = (__code), .msg = (__msg), .pos = (__pos) \
    }

static inline int hasutf8bom(unsigned char *s)
{
    return s && s[0] == 0xEF && s[1] == 0xBB && s[2] == 0xBF;
}

static inline int endoffield(
    string        field,
    unsigned long offset,   // NOLINT bugprone-easily-swappable-parameters
    unsigned long tablelen, // NOLINT bugprone-easily-swappable-parameters
    unsigned char rdelim,   // NOLINT bugprone-easily-swappable-parameters
    unsigned char fdelim    // NOLINT bugprone-easily-swappable-parameters
)
{
    return (unsigned long)(field.len + offset) >= tablelen || field.s[field.len + offset] == rdelim
        || field.s[field.len + offset] == fdelim;
}

static sheetsresult takerecord(
    string       *table,
    unsigned char rdelim,   // NOLINT bugprone-easily-swappable-parameters
    unsigned char fdelim,   // NOLINT bugprone-easily-swappable-parameters
    unsigned char encloser, // NOLINT bugprone-easily-swappable-parameters
    sheetsrecord *record
)
{
    int finished = table->s && table->s[0] == rdelim;
    while (table->len > 0 && !finished && record->nfields < SHEETS_MAX_FIELDS) {
        long   enclosed = table->s[0] == encloser;
        long   unpaired = enclosed;
        long   tablelen = table->len - enclosed;
        string field    = string(table->s + enclosed, 0);

        while (!endoffield(field, 0, tablelen, rdelim, fdelim)) {
            if (field.s[field.len] == encloser) {
                // The encloser is not permitted unless the field is enclosed.
                if (!enclosed) {
                    return sheetsresult(
                        E_sheets_unenclosed,
                        field,
                        "unexpected encloser in unenclosed field"
                    );
                }

                // If the field is terminal, then we are done.
                if (endoffield(field, 1, tablelen, rdelim, fdelim)) {
                    unpaired  ^= 1;
                    field.len += 1;
                    continue;
                }

                // If the next character is also the encloser, iterate over both.
                if (field.len + 1 < tablelen && field.s[field.len + 1] == encloser) {
                    field.len += 2;
                    continue;
                }
            }

            field.len++;
        }

        if (unpaired) {
            return sheetsresult(
                E_sheets_unterminated,
                field,
                "expected paired encloser at end of the field, but found none"
            );
        }

        record->fields[record->nfields]  = string(field.s, field.len - enclosed);
        record->enclosed                |= (enclosed << record->nfields);
        record->nfields++;

        finished    = table->s[field.len + enclosed] == '\n';
        table->s   += field.len + enclosed + 1;
        table->len  = tablelen - field.len - 1;
    }

    return sheetsresult(E_sheets_none, stringZ, "");
}

sheetsresult dsvparse(
    string        table,
    sheetshandler headerfn, // NOLINT bugprone-easily-swappable-parameters
    sheetshandler recordfn, // NOLINT bugprone-easily-swappable-parameters
    unsigned char rdelim,   // NOLINT bugprone-easily-swappable-parameters
    unsigned char fdelim,   // NOLINT bugprone-easily-swappable-parameters
    unsigned char encloser, // NOLINT bugprone-easily-swappable-parameters
    void         *user
)
{
    // Check for a UTF-8 BOM
    if (hasutf8bom(table.s)) {
        table.s   += 3;
        table.len -= 3;
    }

    sheetsrecord record = { 0 };
    int          line   = 1;
    returniferr(takerecord(&table, rdelim, fdelim, encloser, &record));
    if (record.nfields >= SHEETS_MAX_FIELDS && table.s[0] != rdelim) {
        return sheetsresult(
            E_sheets_numfields,
            stringZ,
            "number of fields of first row exceeds maximum"
        );
    }

    if (headerfn) returniferr(headerfn(&record, user, line++));

    unsigned long mfields = record.nfields;
    while (table.len > 0) {
        record.nfields  = 0;
        record.enclosed = 0;

        returniferr(takerecord(&table, rdelim, fdelim, encloser, &record));
        if (record.nfields != mfields && table.s[0] != rdelim) {
            sheetsresult res = sheetsresult(E_sheets_numfields, stringZ, "");
            snprintf(
                res.msg,
                sizeof(res.msg),
                "record %d - expected %lu fields but found %lu",
                line,
                mfields,
                record.nfields
            );
            return res;
        }

        if (recordfn) returniferr(recordfn(&record, user, line++));
    }

    return sheetsresult(E_sheets_none, stringZ, "");
}

sheetsresult csvparse(string table, sheetshandler headerfn, sheetshandler recordfn, void *user)
{
    return dsvparse(table, headerfn, recordfn, '\n', ',', '"', user);
}

sheetsresult tsvparse(string table, sheetshandler headerfn, sheetshandler recordfn, void *user)
{
    return dsvparse(table, headerfn, recordfn, '\n', '\t', '"', user);
}
