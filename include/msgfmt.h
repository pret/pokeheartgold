#ifndef GUARD_MSGFMT_H
#define GUARD_MSGFMT_H

#include "pm_string.h"
#include "player_data.h"
#include "save_misc_data.h"

typedef struct MsgPlaceholderFieldAttrs {
    u8 data[4];
} MSGFMT_FIELD_ATTRS;

typedef struct PlaceholderField {
    MSGFMT_FIELD_ATTRS attrs;
    STRING *msg;
} MSGFMT_FIELD;

typedef struct MSGFMT {
    u32 nstr;
    HeapID heapId;
    MSGFMT_FIELD *fields;
    STRING *buffer;
} MSGFMT;

MSGFMT *ScrStrBufs_new(u32 heap_id);
MSGFMT *ScrStrBufs_new_custom(u32 nstr, u32 _strlen, HeapID heapId);
void ScrStrBufs_delete(MSGFMT *msgFmt);
void StringExpandPlaceholders(MSGFMT *msgFmt, STRING *dest, STRING *src);
void BufferIntegerAsString(MSGFMT *msgFmt, u32 idx, int num, u32 numDigits, STRCONVMODE strconvmode, BOOL whichCharset);
void BufferPlayersName(MSGFMT *msgFmt, u32 idx, PLAYERPROFILE *playerProfile);
void BufferECWord(MSGFMT *msgFmt, u32 idx, u16 wordno);
void BufferSpeciesNameWithArticle(MSGFMT *msgFmt, u32 idx, u32 species);

#endif //GUARD_MSGFMT_H
