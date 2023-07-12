#include "global.h"
#include "sav_chatot.h"
#include <nitro/mi/memory.h>

u32 Save_Chatot_sizeof(void) {
    return sizeof(SOUND_CHATOT);
}

void Save_Chatot_Init(SOUND_CHATOT *chatot) {
    MI_CpuClear32(chatot, sizeof(SOUND_CHATOT));
    chatot->exists = FALSE;
}

SOUND_CHATOT *Chatot_New(HeapID heapID) {
    SOUND_CHATOT *chatot = AllocFromHeap(heapID, sizeof(SOUND_CHATOT));
    Save_Chatot_Init(chatot);
    return chatot;
}

SOUND_CHATOT *Save_Chatot_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_CHATOT);
}

BOOL Chatot_Exists(SOUND_CHATOT *chatot) {
    return chatot->exists;
}

void Chatot_Invalidate(SOUND_CHATOT *chatot) {
    chatot->exists = FALSE;
}

s8 *Chatot_GetData(SOUND_CHATOT *chatot) {
    return chatot->data;
}

static inline s8 transform(u8 val) {
    return (s8)(val - 8);
}

void Chatot_Decode(s8 *dest, const s8 *data) {
    s32 i;
    s32 dest_i;
    u8 val;
    s8 val2;

    for (dest_i = 0, i = 0; i < 1000; i++, dest_i += 2) {
        val = (u8)(data[i] & 0xf);
        val2 = transform(val);
        dest[dest_i + 0] = (s8)(val2 << 4);
        val = (u8)(data[i] >> 4);
        val2 = transform(val);
        dest[dest_i + 1] = (s8)(val2 << 4);
    }
}

static inline u8 untransform(s8 val) {
    val /= 16;
    return (u8)(val + 8);
}

void Chatot_Encode(SOUND_CHATOT *chatot, const s8 *data) {
    s32 src_i;
    s32 i = 0;
    u8 val2;
    s8 val;
    chatot->exists = TRUE;

    for (src_i = 0; src_i < 2000; src_i += 2) {
        val = data[src_i + 0];
        val2 = untransform(val);
        chatot->data[i] = (s8)val2;

        val = data[src_i + 1];
        val2 = untransform(val);
        chatot->data[i] |= val2 << 4;

        i++;
    }
}

void Chatot_Copy(SOUND_CHATOT *dst, SOUND_CHATOT *src) {
    MI_CpuCopyFast(src, dst, sizeof(SOUND_CHATOT));
}
