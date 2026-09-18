// SPDX-License-Identifier: MIT

/*
 * config - SAX-style parser for INI-like configuration files.
 * Copyright (C) 2025  <lhearachel@proton.me>
 *
 * This library implements a flavour of INI-like key-value stores, inspired largely by Python's
 * `configparser` module. It provides a basic interface for consuming parse-events SAX-style; the
 * caller has full control over how individual values are consumed, validated, and stored. In
 * particular, this library implements the following rules:
 *
 *   - Keys and values are always emitted as strings.
 *   - Keys and values are always included on the same line. Multi-line values are not accepted.
 *   - Keys are separated from their values by either an equals-sign ("=").
 *   - Neither keys nor values will contain any amount of leading or trailing whitespace when
 *     emitted to the caller.
 *   - Keys may be specified more than once; the implementation behavior is left to the caller.
 *   - Key-value pairs belong to named sections.
 *   - Sections are defined by lines with a leading "[" and a trailing "]". All content between
 *     these tokens is taken as the section-name.
 *   - Comments are defined by lines with leading ";" or "#"; inline comments are not accepted.
 *
 * # This line is a comment.
 * # The next line is a section-header.
 * [section]
 * this is a value = this is a key
 * this value uses a colon: and this is its key
 */

#ifndef CONFIG_H
#define CONFIG_H

#include "libs/strings.h"

enum cfgerror {
    E_config_none = 0,   // no error occurred during parsing
    E_config_nokey,      // encountered a key-value separator without a key
    E_config_nosec,      // encountered a key-value pair without a section
    E_config_untermsec,  // section-header was unterminated
    E_config_unknownsec, // section-name does not match any recognized handlers

    E_config_user = 128, // User-defined errors should start from here.
};

typedef struct cfgresult {
    int    code;
    char   msg[128];
    string pos;
} cfgresult;

// Basic interface for consuming parse-events. This handler should return a non-zero error code if
// the calling client cannot accept the parse-event.
typedef cfgresult (*cfghandler)(string sec, string key, string val, void *user, long line);

typedef struct cfgsection {
    string     section;
    cfghandler handler;
} cfgsection;

/*
 * Parse a string as a configuration file, consuming parse-events for key-value pairs according to
 * their corresponding section's handler as defined by `sections`.
 *
 * Optionally, a caller may provide `user` as additional context to handler functions; this may be
 * useful for, e.g., collecting the output of parse-events into a custom struct for convenience in
 * further processing.
 */
cfgresult cfgparse(string cfg, const cfgsection sections[], void *user);

#endif // CONFIG_H
