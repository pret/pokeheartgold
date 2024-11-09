#ifndef POKEHEARTGOLD_MAIL_MISC_H
#define POKEHEARTGOLD_MAIL_MISC_H

#include "easy_chat.h"
#include "heap.h"
#include "mail.h"
#include "mail_message.h"
#include "menu_input_state.h"
#include "pokedex.h"
#include "pokemon.h"
#include "save.h"

typedef struct MsgBankMsgNo {
    u16 msgBank;
    u16 msgNo;
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
    MailMessage mailMessage;
    u16 unk1C[0x4];
    MenuInputStateMgr *menuInputPtr;
} EasyChatArgs;

typedef struct UseMailArgs {
    u16 unk0;
    u32 unk4;
    u32 unk8;
    u16 unkC;
    u8 partyIdx;
    u8 mailType;
    SaveData *saveData;
    Mail *mail;
    Mailbox *mailbox;
    MenuInputStateMgr *menuInputStatePtr;
} UseMailArgs;

EasyChatArgs *EasyChat_CreateArgs(u8 a0, u8 a1, SaveData *saveData, MenuInputStateMgr *menuInputStateMgr, HeapID heapId);
void EasyChat_FreeArgs(EasyChatArgs *args);
void sub_02090D14(EasyChatArgs *args, u16 a1);
void sub_02090D18(EasyChatArgs *args, u16 a1, u16 a2);
void sub_02090D20(EasyChatArgs *args, MailMessage *mailMessage);
void sub_02090D34(EasyChatArgs *args);
void sub_02090D40(EasyChatArgs *args);
BOOL sub_02090D48(EasyChatArgs *args);
BOOL sub_02090D4C(EasyChatArgs *args);
u16 sub_02090D50(EasyChatArgs *args);
void sub_02090D54(EasyChatArgs *args, MsgBankMsgNo *mailMessage);
void sub_02090D60(EasyChatArgs *args, MailMessage *mailMessage);
u8 sub_02090D70(EasyChatArgs *args);
u8 sub_02090D74(EasyChatArgs *args);
u32 sub_02090D78(EasyChatArgs *args);
Pokedex *sub_02090D7C(EasyChatArgs *args);
SaveEasyChat *sub_02090D80(EasyChatArgs *args);
u8 sub_02090D84(EasyChatArgs *args);
u8 sub_02090D88(EasyChatArgs *args);
void sub_02090D8C(EasyChatArgs *args, MailMessage *msg1, MailMessage *msg2);
BOOL sub_02090DC0(EasyChatArgs *args, MailMessage *msg1, MailMessage *msg2);
void sub_02090E04(EasyChatArgs *args, MailMessage *msg1, MailMessage *msg2);
int sub_02090E44(EasyChatArgs *args);
void sub_02090E5C(EasyChatArgs *args, MenuInputState menuInputState);
UseMailArgs *sub_02090E68(SaveData *saveData, u16 a1, u8 partyIdx, u8 mailType, HeapID heapId);
UseMailArgs *sub_02090EC0(SaveData *saveData, int n, u16 i, HeapID heapId);
UseMailArgs *sub_02090F00(SaveData *saveData, Pokemon *mon, HeapID heapId);
UseMailArgs *sub_02090F38(SaveData *saveData, u8 mailType, HeapID heapId);
u32 sub_02090F6C(UseMailArgs *args);
BOOL sub_02090F70(UseMailArgs *args, Pokemon *mon);
void sub_02090F90(UseMailArgs *args);
int Mailbox_MoveMessageFromMon(Mailbox *mailbox, Pokemon *mon, HeapID heapId);
int sub_02091004(Mail *msgs, int i, Pokemon *mon, HeapID heapId);

#endif // POKEHEARTGOLD_MAIL_MISC_H
