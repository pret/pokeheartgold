/*
 * nitroarc - an archiving utility for Nintendo's Nitro Archive format
 * Copyright (C) 2026 Rachel <rachel@lhea.me>
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "common.h"
#include "nitroarc.h"
#include "optparse.h"

enum {
    opmode_none = 0,
    opmode_metadata,
    opmode_list,
    opmode_extract,
    opmode_create,

    opmode_max,
};

static int (*opmode_funcs[opmode_max])(const options_t *opts);
static void  exit_help(const char *name, int exit_status);
static void  exit_version(void);
static int   parse_opts(const char **argv, options_t *opts);

int main(int argc, const char **argv) {
    options_t opts = { 0 };
    opts.name      = argv[0];
    opts.argc      = argc - parse_opts(argv, &opts);
    opts.argv      = argv + (argc - opts.argc);

    assert(opts.mode < opmode_max);
    assert(opmode_funcs[opts.mode] != NULL);

    if (opts.mode == opmode_none) {
        progerr("no operation mode specified");
        progerr(PROGRAM_HELP, opts.name);
        exit(EXIT_FAILURE);
    }

    int errc = set_logfile(opts.verbose)
            || set_workdir(opts.directory)
            || opmode_funcs[opts.mode](&opts);

    exit(errc);
}

extern int tool_metadata(const options_t *opts);
extern int tool_list(const options_t *opts);
extern int tool_extract(const options_t *opts);
extern int tool_create(const options_t *opts);

static int (*opmode_funcs[opmode_max])(const options_t *opts) = {
    [opmode_none]     = NULL,
    [opmode_metadata] = tool_metadata,
    [opmode_list]     = tool_list,
    [opmode_extract]  = tool_extract,
    [opmode_create]   = tool_create,
};

enum {
    metadata = 0,
    list,
    extract,
    create,

    directory,
    file,
    verbose,

    format,
    no_header,

    exclude,
    exclude_from,
    files_from,
    index,
    index_namespace,
    no_recurse,
    named,
    stripped,

    help,
    version,
};

static const option_cfg_t s_options[] = {
    [metadata] = { "metadata",  "meta", 'm', 0, false },
    [list]     = { "list",      NULL,   't', 0, false },
    [extract]  = { "extract",   NULL,   'x', 0, false },
    [create]   = { "create",    NULL,   'c', 0, false },

    [directory] = { "directory", NULL, 'C', 0, true  },
    [file]      = { "file",      NULL, 'f', 0, true  },
    [verbose]   = { "verbose",   NULL, 'v', 0, false },

    [format]    = { "format",    NULL, 'F', 0, true  },
    [no_header] = { "no-header", NULL, 'H', 0, false },

    [exclude]         = { "exclude",         NULL, 'E', 0, true  },
    [exclude_from]    = { "exclude-from",    NULL, 'X', 0, true  },
    [files_from]      = { "files-from",      NULL, 'T', 0, true  },
    [index]           = { "index",           NULL, 'I', 0, false },
    [index_namespace] = { "index-namespace", NULL, 'P', 0, false },
    [no_recurse]      = { "no-recursion",    NULL, 'R', 0, false },
    [named]           = { "named",           NULL, 'N', 0, false },
    [stripped]        = { "stripped",        NULL, 'S', 0, false },

    [help]    = { "help",    NULL, '?', 'h', false },
    [version] = { "version", NULL, 'V',  0,  false },

    { 0 },
};

#define target_optarg(__val) __val = parser.optarg; break
#define tryset_opmode(__mode)                         \
    if (opts->mode) {                                 \
        progerr("only one operation mode permitted"); \
        progerr(PROGRAM_HELP, opts->name);            \
        exit(EXIT_FAILURE);                           \
    }                                                 \
    else { opts->mode = __mode; }                     \
    break

int parse_opts(const char **argv, options_t *opts) {
    assert(argv);
    assert(opts->name);

    if (argv && argv[0] != NULL && argv[1] == NULL) {
        exit_help(opts->name, EXIT_FAILURE);
    }

    optparser_t parser = {
        .argv     = (char **)argv,
        .optind   = 1,
        .shortind = 1,
        .optarg   = NULL,
        .errmsg   = { 0 },
        .options  = s_options,
    };

    int match;
    while ((match = parseopt(&parser)) >= 0) {
        switch (match) {
        case metadata: tryset_opmode(opmode_metadata);
        case list:     tryset_opmode(opmode_list);
        case extract:  tryset_opmode(opmode_extract);
        case create:   tryset_opmode(opmode_create);

        case directory:    target_optarg(opts->directory);
        case file:         target_optarg(opts->file);
        case format:       target_optarg(opts->format);
        case files_from:   target_optarg(opts->files_from);
        case exclude_from: target_optarg(opts->exclude_from);
        case exclude:      target_optarg(opts->exclude_pat);

        case verbose:         opts->verbose = true; break;
        case no_header:       opts->no_header = true; break;
        case index:           opts->index = true; break;
        case index_namespace: opts->index = true; opts->index_ns = true; break;
        case no_recurse:      opts->no_recurse = true; break;
        case named:           opts->named = true; break;
        case stripped:        opts->stripped = true; break;

        case OPT_ERROR:
            progerr("%s", parser.errmsg);
            progerr(PROGRAM_HELP, opts->name);
            exit(EXIT_FAILURE);

        case help:    exit_help(opts->name, EXIT_SUCCESS); break;
        case version: exit_version(); break;
        }
    }

    return parser.optind;
}

#define putf printf // Only for nice alignment below

static void exit_help(const char *name, int exit_status) {
    putf("Usage: %s [OPTION]... [ARGS]...\n", name);
    puts("");
    puts("An archiving utility for Nintendo's Nitro Archive format.");
    puts("");
    puts("Examples:");
    putf("  %s -cf archive.narc  # Create archive.narc from files.\n", name);
    putf("  %s -mf archive.narc  # View metadata for archive.narc.\n", name);
    putf("  %s -tf archive.narc  # List member files in archive.narc.\n", name);
    putf("  %s -xf archive.narc  # Extract files from archive.narc.\n", name);
    puts("");
    puts("Operation modes:");
    puts("  -c, --create            create an archive from member files");
    puts("  -m, --meta, --metadata  view tabulated archive metadata");
    puts("  -t, --list              view tabulated archive member files");
    puts("  -x, --extract           extract archive member files");
    puts("");
    puts("Common options:");
    puts("  -C, --directory=DIR  change to directory DIR before operation");
    puts("  -f, --file=ARCHIVE   target the file ARCHIVE");
    puts("  -v, --verbose        be more talkative during execution");
    puts("");
    puts("Archive creation options:");
    puts("  -E, --exclude=PATTERN    exclude filenames matching PATTERN");
    puts("  -X, --exclude-from=FILE  read exclusion patterns from FILE");
    puts("  -T, --files-from=FILE    read ordered filenames from FILE");
    puts("  -I, --index              create a C-header index of member files");
    puts("  -P, --index-namespace    like --index, with namespace-prefixes");
    puts("  -N, --named              retain filenames in the archive");
    puts("  -R, --no-recursion       do not discover files in subdirectories");
    puts("  -S, --stripped           do not write the signed file-type header");
    puts("");
    puts("Tabulated data options:");
    puts("  -F, --format=FORMAT  output data in FORMAT (default: markdown)");
    puts("  -H, --no-header      do not output header row(s)");
    puts("");
    puts("Program information:");
    puts("  -?, -h, --help     output this help text and exit");
    puts("          --version  output version information and exit");
    puts("");
    puts("For detailed information on program operation and capabilities, try");
    puts("consulting 'man nitroarc.1', if you have it installed.");
    puts("");
    puts("Report bugs and submit patches to <rachel@lhea.me>.");

    exit(exit_status);
}

static void exit_version(void) {
    putf(
        "nitroarc v%d.%d.%d\n",
        NITROARC_VERSION_MAJOR,
        NITROARC_VERSION_MINOR,
        NITROARC_VERSION_PATCH
    );
    puts("");
    puts("Copyright (C) 2026 Rachel <rachel@lhea.me>");
    puts("");
    puts("License LGPLv3+: GNU LGPL version 3 or later. For full license");
    puts("details, see: <https://gnu.org/licenses/gpl.html>");
    puts("");
    puts("This is free software: you are free to change and redistribute it.");
    puts("There is NO WARRANTY, to the extent permitted by law.");

    exit(EXIT_SUCCESS);
}
