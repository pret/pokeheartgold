#ifndef GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H
#define GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H

#include "bg_window.h"
#include "msgdata.h"
#include "options.h"
#include "overlay_manager.h"
#include "unk_0200CF18.h"
#include "unk_020163E0.h"
#include "unk_02082908.h"

typedef struct OakSpeechData_Sub160 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7;
} OakSpeechData_Sub160;

typedef struct OaksSpeechData_Sub178 {
    HeapID heapId;
} OaksSpeechData_Sub178;

typedef struct OaksSpeechData {
    HeapID heapId;      // 0x000
    SaveData *saveData; // 0x004
    Options *options;   // 0x008
    int state;
    int unk_010;
    OVY_MANAGER *overlayManager;
    BgConfig *bgConfig; // 0x018
    Window window_0;
    Window window_1;
    Window windows_2thru6[4];
    int unk_07C;
    int unk_080;
    u8 filler_084[0x50];
    SpriteGfxHandler *unk_0D4;
    int unk_0D8;
    u8 filler_0DC[0xC];
    Sprite *sprites[6];
    MsgData *msgData;
    int unk_104;
    int unk_108;
    u32 textPrinter;
    String *string; // 0x110
    UnkStruct_020163E0 *unk_114;
    MessageFormat *msgFormat;
    u8 filler_11C[0x4];
    NamingScreenArgs *namingScreenArgs_Player; // 0x120
    NamingScreenArgs *namingScreenArgs_Rival;  // 0x124
    int unk_128;
    int unk_12C;
    int unk_130;
    u16 playerGender; // 0x134
    u16 unk_136;
    u8 filler_138[0x4];
    int unk_13C;
    int unk_140;
    int unk_144;
    u8 filler_148[0x18];
    OakSpeechData_Sub160 unk_160;
    int unk_168;
    int unk_16C;
    int queuedMsgId;
    u16 unk_174;
    s16 unk_176;
    OaksSpeechData_Sub178 *unk_178;
    int unk_17C;
} OaksSpeechData; // size: 0x180

void ov53_021E7E08(OaksSpeechData *data, int a1);
void ov53_021E7ECC(OaksSpeechData *data);
void ov53_021E7F24(OaksSpeechData *data);
void ov53_021E7FEC(OaksSpeechData *data);
void ov53_021E8014(OaksSpeechData *data);
void ov53_021E80B8(OaksSpeechData *a0, int a1);

OaksSpeechData_Sub178 *ov53_021E80F4(BgConfig *bgConfig, Sprite *a1, int a2, int a3, int a4, HeapID heapId);
void ov53_021E814C(OaksSpeechData_Sub178 *a0);
void ov53_021E816C(OaksSpeechData_Sub178 *a0, int a1);
void ov53_021E81F4(OaksSpeechData_Sub178 *a0, int msgBank, int msgId_Yes, int msgId_No);
int ov53_021E8248(OaksSpeechData_Sub178 *a0);

#endif // GUARD_POKEHEARTGOLD_OAKS_SPEECH_INTERNAL_H
