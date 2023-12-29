#ifndef POKEHEARTGOLD_MAIL_MISC_H
#define POKEHEARTGOLD_MAIL_MISC_H

#include "easy_chat.h"
#include "heap.h"
#include "mail.h"
#include "mail_message.h"
#include "pokedex.h"
#include "pokemon.h"
#include "save.h"

typedef struct MsgBankMsgNo {
    u16 msg_bank;
    u16 msg_no;
} MsgBankMsgNo;

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
} EasyChatArgs;

typedef struct UseMailWork {
    u16 unk0[0x2];
    u32 unk4;
    u32 unk8;
    u16 unkC;
    u8 partyIdx;
    u8 unkF;
    SaveData *saveData;
    Mail *mail;
    MAILBOX *mailbox;
    u32 *unk1C;
} UseMailWork;

EasyChatArgs *CreateEasyChatArgs(u8 a0, u8 a1, SaveData *saveData, u32 *a3, HeapID heapId);
void FreeEasyChatArgs(EasyChatArgs *a0);
void sub_02090D14(EasyChatArgs *a0, u16 a1);
void sub_02090D18(EasyChatArgs *a0, u16 a1, u16 a2);
void sub_02090D20(EasyChatArgs *a0, MAIL_MESSAGE *mailMessage);
void sub_02090D34(EasyChatArgs *a0);
void sub_02090D40(EasyChatArgs *a0);
BOOL sub_02090D48(EasyChatArgs *a0);
BOOL sub_02090D4C(EasyChatArgs *a0);
u16 sub_02090D50(EasyChatArgs *a0);
void sub_02090D54(EasyChatArgs *a0, MsgBankMsgNo *mailMessage);
void sub_02090D60(EasyChatArgs *a0, MAIL_MESSAGE *mailMessage);
u8 sub_02090D70(EasyChatArgs *a0);
u8 sub_02090D74(EasyChatArgs *a0);
u32 sub_02090D78(EasyChatArgs *a0);
Pokedex *sub_02090D7C(EasyChatArgs *a0);
SaveEasyChat *sub_02090D80(EasyChatArgs *a0);
u8 sub_02090D84(EasyChatArgs *a0);
u8 sub_02090D88(EasyChatArgs *a0);
void sub_02090D8C(EasyChatArgs *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2);
BOOL sub_02090DC0(EasyChatArgs *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2);
void sub_02090E04(EasyChatArgs *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2);
int sub_02090E44(EasyChatArgs *a0);
void sub_02090E5C(EasyChatArgs *a0, u32 a1);
UseMailWork *sub_02090E68(SaveData *saveData, u16 a1, u8 partyIdx, u8 a3, HeapID heapId);
UseMailWork *sub_02090EC0(SaveData *saveData, int n, u16 i, HeapID heapId);
UseMailWork *sub_02090F00(SaveData *saveData, Pokemon *mon, HeapID heapId);
UseMailWork *sub_02090F38(SaveData *saveData, u8 mailType, HeapID heapId);
u32 sub_02090F6C(UseMailWork *a0);
BOOL sub_02090F70(UseMailWork *a0, Pokemon *mon);
void sub_02090F90(UseMailWork *a0);
int sub_02090FA8(MAILBOX *mailbox, Pokemon *mon, HeapID heapId);
int sub_02091004(Mail *msgs, int i, Pokemon *mon, HeapID heapId);

#endif //POKEHEARTGOLD_MAIL_MISC_H
