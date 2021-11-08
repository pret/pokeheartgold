#ifndef GUARD_MSGFMT_H
#define GUARD_MSGFMT_H

#include "sys/string.h"

typedef struct MSGFMT MSGFMT;

MSGFMT *ScrStrBufs_new(u32 heap_id);
void ScrStrBufs_delete(MSGFMT *msgFmt);
void StringExpandPlaceholders(MSGFMT *msgFmt, STRING *dest, const STRING *src);
void BufferIntegerAsString(MSGFMT *msgFmt, u32 idx, int num, u32 numDigits, int strconvmode, BOOL whichCharset);

#endif //GUARD_MSGFMT_H
