#include "mail_misc.h"

#include "global.h"

#include "constants/items.h"
#include "constants/mail.h"
#include "constants/pokemon.h"

#include "item.h"
#include "mail.h"
#include "menu_input_state.h"
#include "options.h"
#include "player_data.h"
#include "save_vars_flags.h"
#include "sys_flags.h"

EasyChatArgs *EasyChat_CreateArgs(u8 args, u8 a1, SaveData *saveData, MenuInputStateMgr *menuInputStateMgr, HeapID heapId) {
    EasyChatArgs *ptr = AllocFromHeap(heapId, sizeof(EasyChatArgs));
    ptr->unk0 = args;
    ptr->unk1 = a1;
    ptr->pokedex = Save_Pokedex_Get(saveData);
    ptr->easyChat = Save_EasyChat_Get(saveData);
    ptr->gameCleared = CheckGameClearFlag(Save_VarsFlags_Get(saveData));
    ptr->unk5 = 0;
    ptr->unk2 = 1;
    ptr->unk3 = 0;
    ptr->frame = Options_GetFrame(Save_PlayerData_GetOptionsAddr(saveData));
    ptr->menuInputPtr = menuInputStateMgr;

    if (args == 2) {
        MailMsg_Init_WithBank(&ptr->mailMessage, MAILMSG_BANK_0293_GMM);
    } else {
        for (int i = 0; i < 2; i++) {
            ptr->unk1C[i] = -1;
        }
    }
    return ptr;
}

void EasyChat_FreeArgs(EasyChatArgs *args) {
    Heap_Free(args);
}

void sub_02090D14(EasyChatArgs *args, u16 a1) {
    args->unk1C[0] = a1;
}

void sub_02090D18(EasyChatArgs *args, u16 a1, u16 a2) {
    args->unk1C[0] = a1;
    args->unk1C[1] = a2;
}

void sub_02090D20(EasyChatArgs *args, MailMessage *mailMessage) {
    args->mailMessage = *mailMessage;
}

void sub_02090D34(EasyChatArgs *args) {
    args->unk2 = 1;
    args->unk3 = 0;
}

void sub_02090D40(EasyChatArgs *args) {
    args->unk5 = 1;
}

BOOL sub_02090D48(EasyChatArgs *args) {
    return args->unk2;
}

BOOL sub_02090D4C(EasyChatArgs *args) {
    return args->unk3;
}

u16 sub_02090D50(EasyChatArgs *args) {
    return args->unk1C[0];
}

void sub_02090D54(EasyChatArgs *args, MsgBankMsgNo *msgBankMsgNo) {
    msgBankMsgNo->msgBank = args->unk1C[0];
    msgBankMsgNo->msgNo = args->unk1C[1];
}

void sub_02090D60(EasyChatArgs *args, MailMessage *mailMessage) {
    MailMsg_Copy(mailMessage, &args->mailMessage);
}

u8 sub_02090D70(EasyChatArgs *args) {
    return args->unk0;
}

u8 sub_02090D74(EasyChatArgs *args) {
    return args->unk1;
}

u32 sub_02090D78(EasyChatArgs *args) {
    return args->frame;
}

Pokedex *sub_02090D7C(EasyChatArgs *args) {
    return args->pokedex;
}

SaveEasyChat *sub_02090D80(EasyChatArgs *args) {
    return args->easyChat;
}

u8 sub_02090D84(EasyChatArgs *args) {
    return args->gameCleared;
}

u8 sub_02090D88(EasyChatArgs *args) {
    return args->unk5;
}

void sub_02090D8C(EasyChatArgs *args, MailMessage *msg1, MailMessage *msg2) {
    switch (args->unk0) {
    case 0:
        msg1->msg_bank = args->unk1C[0];
        return;
    case 1:
        msg1->msg_bank = args->unk1C[0];
        msg1->msg_no = args->unk1C[1];
        return;
    case 2:
        *msg2 = args->mailMessage;
        return;
    }
}

BOOL sub_02090DC0(EasyChatArgs *args, MailMessage *msg1, MailMessage *msg2) {
    switch (args->unk0) {
    case 0:
        return msg1->msg_bank == args->unk1C[0];
    case 1:
        return msg1->msg_bank == args->unk1C[0] && msg1->msg_no == args->unk1C[1];
    case 2:
    default:
        return MailMsg_Compare(&args->mailMessage, msg2);
    }
}

void sub_02090E04(EasyChatArgs *args, MailMessage *msg1, MailMessage *msg2) {
    args->unk3 = !sub_02090DC0(args, msg1, msg2);
    args->unk2 = 0;

    u16 *src = (u16 *)&msg1->msg_bank;
    for (int i = 0; i < 2; i++) {
        args->unk1C[i] = src[i];
    }

    args->mailMessage = *msg2;
}

int sub_02090E44(EasyChatArgs *args) {
    if (args == NULL || args->menuInputPtr == 0) {
        return 0;
    }

    return MenuInputStateMgr_GetState(args->menuInputPtr);
}

void sub_02090E5C(EasyChatArgs *args, MenuInputState a1) {
    MenuInputStateMgr_SetState(args->menuInputPtr, a1);
}

UseMailArgs *sub_02090E68(SaveData *saveData, u16 a1, u8 partyIdx, u8 mailType, HeapID heapId) {
    Mailbox *mailbox = Save_Mailbox_Get(saveData);
    UseMailArgs *ptr = AllocFromHeapAtEnd(heapId, sizeof(UseMailArgs));
    MI_CpuFill8(ptr, 0, sizeof(UseMailArgs));

    ptr->mailType = mailType;
    ptr->partyIdx = partyIdx;
    ptr->mailbox = mailbox;
    ptr->unk0 = 1;
    ptr->unk8 = a1;
    ptr->unkC = 0;
    ptr->saveData = saveData;

    Mail *mail = Mail_New(heapId);
    ptr->mail = mail;
    Mail_Init(mail);
    Mail_SetNewMessageDetails(ptr->mail, MAIL_NONE, partyIdx, saveData);

    return ptr;
}

UseMailArgs *sub_02090EC0(SaveData *saveData, int n, u16 i, HeapID heapId) {
    UseMailArgs *ptr = AllocFromHeapAtEnd(heapId, sizeof(UseMailArgs));
    MI_CpuFill8(ptr, 0, sizeof(UseMailArgs));

    ptr->unk0 = 0;
    ptr->unk8 = n;
    ptr->unkC = i;
    ptr->saveData = saveData;

    Mailbox *mailbox = Save_Mailbox_Get(saveData);
    ptr->mailbox = mailbox;
    ptr->mail = Mailbox_AllocAndFetchMailI(&mailbox->msgs[0], n, i, heapId);

    return ptr;
}

UseMailArgs *sub_02090F00(SaveData *saveData, Pokemon *mon, HeapID heapId) {
    UseMailArgs *ptr = AllocFromHeapAtEnd(heapId, sizeof(UseMailArgs));
    MI_CpuFill8(ptr, 0, sizeof(UseMailArgs));

    ptr->unk0 = 0;
    ptr->saveData = saveData;

    Mail *mail = Mail_New(heapId);
    ptr->mail = mail;
    GetMonData(mon, MON_DATA_MAIL_STRUCT, ptr->mail);

    return ptr;
}

UseMailArgs *sub_02090F38(SaveData *saveData, u8 mailType, HeapID heapId) {
    UseMailArgs *ptr = AllocFromHeapAtEnd(heapId, sizeof(UseMailArgs));
    MI_CpuFill8(ptr, 0, sizeof(UseMailArgs));

    ptr->unk0 = 0;
    ptr->saveData = saveData;

    Mail *mail = Mail_New(heapId);
    ptr->mail = mail;
    Mail_SetType(mail, mailType);

    return ptr;
}

u32 sub_02090F6C(UseMailArgs *args) {
    return args->unk4;
}

BOOL sub_02090F70(UseMailArgs *args, Pokemon *mon) {
    if (sub_02090F6C(args) == 0) {
        return FALSE;
    }
    SetMonData(mon, MON_DATA_MAIL_STRUCT, args->mail);
    return TRUE;
}

void sub_02090F90(UseMailArgs *args) {
    if (args->mail != NULL) {
        Heap_Free(args->mail);
    }
    Heap_Free(args);
}

int Mailbox_MoveMessageFromMon(Mailbox *mailbox, Pokemon *mon, HeapID heapId) {
    int item = ITEM_NONE;
    int idx = Mailbox_GetFirstEmptySlotIdx(mailbox);

    if (idx != -1) {
        Mail *mail = Mail_New(heapId);

        GetMonData(mon, MON_DATA_MAIL_STRUCT, mail);
        Mailbox_CopyMailToSlotI(&mailbox->msgs[0], 0, idx, mail);
        Mail_Init(mail);
        SetMonData(mon, MON_DATA_MAIL_STRUCT, mail);
        SetMonData(mon, MON_DATA_HELD_ITEM, &item);
        Heap_Free(mail);
        return idx;
    }
    return -1;
}

int sub_02091004(Mail *msgs, int i, Pokemon *mon, HeapID heapId) {
    int item = ITEM_NONE;

    Mail *mail = Mailbox_AllocAndFetchMailI(msgs, 0, i, heapId);
    if (mail == NULL) {
        return -1;
    }

    item = MailToItemId(Mail_GetType(mail));
    SetMonData(mon, MON_DATA_MAIL_STRUCT, mail);
    SetMonData(mon, MON_DATA_HELD_ITEM, &item);
    Mailbox_DeleteSlotI(msgs, 0, i);
    Heap_Free(mail);

    return i;
}
