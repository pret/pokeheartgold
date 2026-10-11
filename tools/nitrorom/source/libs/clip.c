// SPDX-License-Identifier: MIT

#include "libs/clip.h"

#include <stdio.h>
#include <stdlib.h>

#define CLIP_ERR_UNKNOWN_OPT "unrecognized option “%s%s”"
#define CLIP_ERR_MISSING_ARG "missing argument for option “%s%s”"
#define CLIP_ERR_MISSING_POS "missing positional argument “%s%s”"

static cliperr cliperror(cliperr err, clip *clip, const char *msg, char *dashes, const char *option)
{
    snprintf(clip->err, LEN_CLIP_ERR, msg, dashes, option);
    clip->err[LEN_CLIP_ERR - 1] = '\0';
    return err;
}

// Return -1 if inputs do not match, otherwise return the length of the option.
static long matchlong(const char *longopt, const char *option) // NOLINT
{
    if (longopt == 0) return -1;

    const char *o = option, *l = longopt;
    for (; *o && *l && *o != '='; o++, l++) {
        if (*o != *l) return -1;
    }

    return *l == '\0' && (*o == '\0' || *o == '=') ? o - option : -1;
}

static int handle(clip *clip, const clipopt *clipopt, void *user, const char *option)
{
    if (clipopt->handler) {
        int err = clipopt->handler(clip, clipopt, option, user);
        if (err) return err;
    } else if (clipopt->hasarg) {
        if (clipopt->starget) *clipopt->starget = clip->arg;
        else if (clipopt->ntarget) {
            char *endptr      = 0;
            *clipopt->ntarget = strtol(clip->arg, &endptr, 0);
            if (!*clip->arg && !*endptr) return E_clip_notanumber;
        } else return E_clip_notarget;
    } else if (clipopt->ntarget) {
        *clipopt->ntarget = 1;
    } else {
        return E_clip_notarget;
    }

    clip->arg = 0;
    return E_clip_none;
}

static int parseshort(clip *clip, const clipopt opts[], void *user, const char *option)
{
    option += 1;

    while (*option) {
        const clipopt *clipopt = &opts[0];
        for (; clipopt->longopt && clipopt->shortopt != *option; clipopt++);
        if (clipopt->longopt == 0) {
            return cliperror(E_clip_unknownopt, clip, CLIP_ERR_UNKNOWN_OPT, "-", option);
        }

        if (clipopt->hasarg) {
            clip->ind = *(option + 1) ? clip->ind : clip->ind + 1;
            clip->arg = *(option + 1) ? option + 1 : clip->argv[clip->ind];
            if (clip->arg == 0) {
                return cliperror(E_clip_missingarg, clip, CLIP_ERR_MISSING_ARG, "-", option);
            }
        }

        int err = handle(clip, clipopt, user, option);
        if (err) return err;
        if (clipopt->hasarg) break;
        option++;
    }

    return E_clip_none;
}

static int parselong(clip *clip, const clipopt opts[], void *user, const char *option)
{
    option += 2;

    const clipopt *clipopt = &opts[0];
    long           match   = 0;
    for (; clipopt->longopt && (match = matchlong(clipopt->longopt, option)) < 0; clipopt++);
    if (clipopt->longopt == 0 || match < 0) {
        return cliperror(E_clip_unknownopt, clip, CLIP_ERR_UNKNOWN_OPT, "--", option);
    }

    if (clipopt->hasarg) {
        clip->ind = *(option + match) ? clip->ind : clip->ind + 1;
        clip->arg = *(option + match) ? option + match + 1 : clip->argv[clip->ind];
        if (clip->arg == 0) {
            return cliperror(E_clip_missingarg, clip, CLIP_ERR_MISSING_ARG, "--", option);
        }
    }

    return handle(clip, clipopt, user, option);
}

typedef int (*parsefunc)(clip *clip, const clipopt opts[], void *user, const char *option);

static inline int isddash(const char *s)
{
    return s != 0 && s[0] == '-' && s[1] == '-' && s[2] == '\0';
}

static inline int isshortopt(const char *s)
{
    return s != 0 && s[0] == '-' && s[1] != '-' && s[1] != '\0';
}

static inline int isoption(const char *s)
{
    //                                             longopt        shortopt
    return s != 0 && s[0] == '-' && (s[1] == '-' ? s[2] != '\0' : s[1] != '\0');
}

int cliparse(clip *clip, const clipopt opts[], const clippos posargs[], void *user)
{
    const char *option;
    while ((option = clip->argv[clip->ind]) != 0) {
        if (isddash(option)) {
            clip->ind++;
            break;
        }
        if (!isoption(option)) break;

        parsefunc parse = isshortopt(option) ? parseshort : parselong;
        int       err   = parse(clip, opts, user, option);
        if (err) return err;

        clip->ind++;
    }

    const clippos *posarg = &posargs[0];
    for (; posarg->target && (option = clip->argv[clip->ind]) != 0; posarg++, clip->ind++) {
        *posarg->target = option;
    }

    if (posarg->target) {
        return cliperror(E_clip_missingpos, clip, CLIP_ERR_MISSING_POS, "", posarg->name);
    }

    return E_clip_none;
}
