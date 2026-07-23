// SPDX-License-Identifier: MIT

/*
 * sheets - SAX-style parser for tabulated data-files.
 * Copyright (C) 2025  <lhearachel@proton.me>
 *
 * This library implements a flavour of tabulated data files and provides a basic interface for
 * consuming individual records SAX-style using variadic-arguments. The parsing of input data is
 * kept to a minimum; the caller has full control over how individual fields within a record are
 * validated and stored.
 *
 * The following rules apply (adapted from RFC 4180):
 *
 *   - Records of data are delimited by a single-character token, hereafter referred to as the
 *     "record-delimiter." Usually, this is a line-break character ("\n").
 *   - The last record in the file may or may not have a terminating record-delimiter.
 *   - The first record may be interpreted as a "header" with the same format as ordinary records.
 *   - Records contain one or more fields separated by a single-character token, hereafter referred
 *     to as the "field-delimiter."
 *     - Each record must contain the same number of fields.
 *     - The field-delimiter must *not* be equivalent to the record-delimiter.
 *     - The last field of a record must *not* be followed by the field-delimiter.
 *   - Fields may or may not be enclosed in a single-character token, hereafter referred to as the
 *     "encloser."
 *     - Fields which contain the record-delimiter, the field-delimiter, or the encloser must be
 *       enclosed.
 *     - If a field is enclosed, then any enclosing-token appearing inside that field must be
 *       escaped by preceding it with another encloser. To illustrate, if the encloser is a
 *       double-quote ('"'):
 *       - '""' represents a field which is an empty string.
 *       - '""""' represents a field which contains a single occurrence of a double-quote.
 *       - '""""""' represents a field which contains a pair of double-quotes.
 *     - If a field is *not* enclosed, then the encloser may not otherwise appear inside the field.
 *
 * For simplicity, a maximum of 64 fields is permitted.
 */

#ifndef SHEETS_H
#define SHEETS_H

#include "libs/strings.h"

#define SHEETS_MAX_FIELDS 64

typedef enum sheetserr {
    E_sheets_none = 0,
    E_sheets_numfields,    // The number of fields for a record does not match the expected value.
    E_sheets_unenclosed,   // An encloser was encountered within an unenclosed field.
    E_sheets_unterminated, // An enclosed field was not terminated before the end of the stream.

    E_sheets_user = 128, // User-defined errors should start here.
} sheetserr;

typedef struct sheetsrecord {
    string        fields[SHEETS_MAX_FIELDS]; // The fields in the record.
    unsigned long nfields;                   // The number of fields in the record.
    unsigned long enclosed;                  // A bitmask denoting fields which are enclosed.
} sheetsrecord;

typedef struct sheetsresult {
    int    code;
    char   msg[128];
    string pos;
} sheetsresult;

/*
 * Basic interface for consuming parse-events. This handler should return a non-zero error code if
 * the calling client cannot accept the parse-event.
 */
typedef sheetsresult (*sheetshandler)(sheetsrecord *record, void *user, int line);

/*
 * Parse a string as tabulated data, consuming parse-events with handlers. Records within the data
 * are delimited by `rdelim`. Fields within a record are delimited by `fdelim`. Fields may or may
 * not be enclosed by `encloser`.
 *
 * If `headerfn` and `recordfn` are specified as NULL, then this routine effectively acts as a basic
 * validator for the tabulated data. Otherwise, `headerfn` will be invoked for the first record
 * taken from the data, and `recordfn` will be invoked for each subsequent record.
 *
 * As an implementation detail, the first record within the data will define the expected number of
 * fields to be emitted by successive records. Thus, the first record is permitted to be terminated
 * with any number of field-delimiters.
 */
sheetsresult dsvparse(
    string        table,
    sheetshandler headerfn,
    sheetshandler recordfn,
    unsigned char rdelim,
    unsigned char fdelim,
    unsigned char encloser,
    void         *user
);

/*
 * Wrapper around `dsvparse` for typical comma-separated values (CSV) data.
 *
 * - Records are delimited by `'\n'`.
 * - Fields are delimited by `','`.
 * - Fields may be enclosed by `'"'`.
 */
sheetsresult csvparse(string table, sheetshandler headerfn, sheetshandler recordfn, void *user);

/*
 * Wrapper around `dsvparse` for typical tab-separated values (TSV) data.
 *
 * - Records are delimited by `'\n'`.
 * - Fields are delimited by `'\t'`.
 * - Fields may be enclosed by `'"'`.
 */
sheetsresult tsvparse(string table, sheetshandler headerfn, sheetshandler recordfn, void *user);

#endif // SHEETS_H
