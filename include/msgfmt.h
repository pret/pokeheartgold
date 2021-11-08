#ifndef GUARD_MSGFMT_H
#define GUARD_MSGFMT_H

#include "sys/string.h"
#include "player_data.h"

typedef struct MSGFMT MSGFMT;

typedef enum STRCONVMODE {
    STRCONVMODE_LEFT_ALIGN,
    STRCONVMODE_RIGHT_ALIGN,
    STRCONVMODE_LEADING_ZEROS,
} STRCONVMODE;

MSGFMT *ScrStrBufs_new(u32 heap_id);
void ScrStrBufs_delete(MSGFMT *msgFmt);
void StringExpandPlaceholders(MSGFMT *msgFmt, STRING *dest, const STRING *src);
void BufferIntegerAsString(MSGFMT *msgFmt, u32 idx, int num, u32 numDigits, STRCONVMODE strconvmode, BOOL whichCharset);
void BufferPlayersName(MSGFMT *msgFmt, u32 idx, PLAYERDATA *playerData);

#endif //GUARD_MSGFMT_H
