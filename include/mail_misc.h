#ifndef POKEHEARTGOLD_MAIL_MISC_H
#define POKEHEARTGOLD_MAIL_MISC_H

#include "easy_chat.h"
#include "heap.h"
#include "mail_message.h"
#include "pokedex.h"
#include "pokemon.h"
#include "save.h"

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 gameCleared; // TODO: bool8
    u8 unk5;
    u8 unk6[0x2];
    u32 frame;
    Pokedex *pokedex;
    SaveEasyChat *easyChat;
    MAIL_MESSAGE mailMessage;
    u16 unk1C[0x4];
    u32 *unk24;
} Unk02090C94;

typedef struct {
    u16 unk0[0x2];
    u32 unk4;
    u32 unk8;
    u16 unkC;
    u8 partyIdx;
    u8 unkF;
    SaveData *saveData;
    Mail *mail;
    MAILBOX *mailbox;
    u8 unk1C[0x4];
} Unk02090E68;

Unk02090C94 *sub_02090C94(u8 a0, u8 a1, SaveData *saveData, u32 *a3, HeapID heapId);
void sub_02090D0C(Unk02090C94 *a0);
void sub_02090D14(Unk02090C94 *a0, u16 a1);
void sub_02090D18(Unk02090C94 *a0, u16 a1, u16 a2);
void sub_02090D20(Unk02090C94 *a0, MAIL_MESSAGE *mailMessage);
void sub_02090D34(Unk02090C94 *a0);
void sub_02090D40(Unk02090C94 *a0);
BOOL sub_02090D48(Unk02090C94 *a0);
BOOL sub_02090D4C(Unk02090C94 *a0);
u16 sub_02090D50(Unk02090C94 *a0);
void sub_02090D54(Unk02090C94 *a0, MAIL_MESSAGE *mailMessage);
void sub_02090D60(Unk02090C94 *a0, MAIL_MESSAGE *mailMessage);
u8 sub_02090D70(Unk02090C94 *a0);
u8 sub_02090D74(Unk02090C94 *a0);
u32 sub_02090D78(Unk02090C94 *a0);
Pokedex *sub_02090D7C(Unk02090C94 *a0);
SaveEasyChat *sub_02090D80(Unk02090C94 *a0);
u8 sub_02090D84(Unk02090C94 *a0);
u8 sub_02090D88(Unk02090C94 *a0);
void sub_02090D8C(Unk02090C94 *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2);
BOOL sub_02090DC0(Unk02090C94 *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2);
void sub_02090E04(Unk02090C94 *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2);
int sub_02090E44(Unk02090C94 *a0);
void sub_02090E5C(Unk02090C94 *a0);
Unk02090E68 *sub_02090E68(SaveData *saveData, u16 a1, u8 partyIdx, u8 a3, HeapID heapId);
Unk02090E68 *sub_02090EC0(SaveData *saveData, int n, u16 i, HeapID heapId);
Unk02090E68 *sub_02090F00(SaveData *saveData, Pokemon *mon, HeapID heapId);
Unk02090E68 *sub_02090F38(SaveData *saveData, u8 mailType, HeapID heapId);
u32 sub_02090F6C(Unk02090E68 *a0);
BOOL sub_02090F70(Unk02090E68 *a0, Pokemon *mon);
void sub_02090F90(Unk02090E68 *a0);
int sub_02090FA8(MAILBOX *mailbox, Pokemon *mon, HeapID heapId);
int sub_02091004(Mail *msgs, int i, Pokemon *mon, HeapID heapId);

#endif //POKEHEARTGOLD_MAIL_MISC_H
