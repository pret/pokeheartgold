// SPDX-License-Identifier: MIT

/*
 * clip - Parse GNU-style program options and arguments.
 * Copyright (C) 2025  <lhearachel@proton.me>
 *
 * GNU-style program options are an extension of the POSIX recommendations:
 *
 *   - Arguments are options if they begin with a hyphen ('-').
 *   - Multiple options may follow a hyphen in a single token if the options do not take arguments.
 *     That is, '-abc' is equivalent to '-a -b -c'.
 *   - Option names are single alphanumeric characters.
 *   - Certain options require an argument.
 *   - An option and its argument may or may not appear as separate tokens. That is, '-o foo' is
 *     equivalent to '-ofoo'.
 *   - Options precede non-option arguments.
 *   - The argument '--' terminates all options, and any following arguments are treated as
 *     non-option arguments, even if they begin with a hyphen.
 *   - A token consisting of a single hyphen is interpreted as an ordinary non-option argument.
 *   - Options may be supplied in any order or appear multiple times.
 *   - Long options consist of '--' followed by a name made of alphanumeric characters and dashes.
 *   - Long options are separated from any argument value by '='.
 *
 * This library also enables the following further extensions to the above standard:
 *
 *   - Long options may be separated from their argument value by ' '. That is, '--name=value' is
 *     equivalent to '--name value'.
 *   - If multiple short options are included in a single token, the first which takes an argument
 *     is considered to be the final option of the token, and the remainder of the token will be
 *     taken as that option's argument. That is, '-abcofoo' is equivalent to '-a -b -c -o foo'.
 *
 * To use this library, define an array of clipopt structures declaring the shape of your program
 * options:
 *
 * static const clipopt options[] = {
 *     // Invoke a custom handler function.
 *     { .longopt = "handle", .shortopt = 'h', .hasarg = H_reqarg, .handler = handle  },
 *
 *     // Assign directly to existing string memory.
 *     { .longopt = "string", .shortopt = 's', .hasarg = H_reqarg, .starget = &string },
 *
 *     // Assign directly to existing numeric memory.
 *     { .longopt = "number", .shortopt = 'n', .hasarg = H_reqarg, .ntarget = &number },
 *
 *     // Mark a flag as set.
 *     { .longopt = "flag",   .shortopt = 'f', .hasarg = H_noarg,  .ntarget = &flag   },
 *
 *     // Terminate the array.
 *     { 0 },
 * };
 *
 * As well as an array of clippos structures declaring the expected positional arguments to your
 * program:
 *
 * static const clippos posargs[] = {
 *     { .name = "posarg", .target = &posarg },
 *     { 0 },
 * };
 *
 * Each of these arrays *must* be terminated with an entry of all-zeroes. Then, the following code
 * will process argv, populate declared targets, and report any processing errors.
 *
 * clip c   = clipinit(argv);
 * int  err = cliparse(&c, options, posargs, NULL);
 */

#ifndef CLIP_H
#define CLIP_H

#define LEN_CLIP_ERR 128

typedef enum hasarg {
    H_noarg = 0,
    H_reqarg,
} hasarg;

typedef enum cliperr {
    E_clip_none = 0,
    E_clip_unknownopt,
    E_clip_missingarg,
    E_clip_notanumber,
    E_clip_notarget,
    E_clip_missingpos,

    E_clip_user = 128, // user-defined errors can be specified starting from here
} cliperr;

typedef struct clip {
    const char **argv;
    int          ind;
    int          opt;
    const char  *arg;
    char         err[LEN_CLIP_ERR];
} clip;

typedef struct clipopt clipopt;

typedef int (*cliphandler)(clip *clip, const clipopt *opt, const char *option, void *user);

struct clipopt {
    char  *longopt;
    char   shortopt;
    hasarg hasarg;

    const char **starget;
    long        *ntarget;
    cliphandler  handler;
};

typedef struct clippos {
    const char  *name;
    const char **target;
} clippos;

#define clipinit(__argv)        \
    {                           \
        .argv = (__argv),       \
        .ind  = *(__argv) != 0, \
        .opt  = 0,              \
        .arg  = 0,              \
        .err  = "",             \
    }

int cliparse(clip *clip, const clipopt opts[], const clippos posargs[], void *user);

#endif // CLIP_H
