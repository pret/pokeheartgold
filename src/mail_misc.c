#include "global.h"
#include "event_data.h"
#include "item.h"
#include "mail.h"
#include "mail_misc.h"
#include "options.h"
#include "player_data.h"
#include "sys_flags.h"
#include "unk_020183F0.h"
#include "constants/items.h"
#include "constants/mail.h"
#include "constants/pokemon.h"

Unk02090C94 *sub_02090C94(u8 a0, u8 a1, SaveData *saveData, u32 *a3, HeapID heapId) {
    Unk02090C94 *ptr = AllocFromHeap(heapId, sizeof(Unk02090C94));
    ptr->unk0 = a0;
    ptr->unk1 = a1;
    ptr->pokedex = Save_Pokedex_Get(saveData);
    ptr->easyChat = Save_EasyChat_Get(saveData);
    ptr->gameCleared = CheckGameClearFlag(Save_VarsFlags_Get(saveData));
    ptr->unk5 = 0;
    ptr->unk2 = 1;
    ptr->unk3 = 0;
    ptr->frame = Options_GetFrame(Save_PlayerData_GetOptionsAddr(saveData));
    ptr->unk24 = a3;

    if (a0 == 2) {
        MailMsg_Init_WithBank(&ptr->mailMessage, 3);
    } else {
        for (int i = 0; i < 2; i++) {
            ptr->unk1C[i] = -1;
        }
    }
    return ptr;
}

void sub_02090D0C(Unk02090C94 *a0) {
    FreeToHeap(a0);
}

void sub_02090D14(Unk02090C94 *a0, u16 a1) {
    a0->unk1C[0] = a1;
}

void sub_02090D18(Unk02090C94 *a0, u16 a1, u16 a2) {
    a0->unk1C[0] = a1;
    a0->unk1C[1] = a2;
}

void sub_02090D20(Unk02090C94 *a0, MAIL_MESSAGE *mailMessage) {
    a0->mailMessage = *mailMessage;
}

void sub_02090D34(Unk02090C94 *a0) {
    a0->unk2 = 1;
    a0->unk3 = 0;
}

void sub_02090D40(Unk02090C94 *a0) {
    a0->unk5 = 1;
}

BOOL sub_02090D48(Unk02090C94 *a0) {
    return a0->unk2;
}

BOOL sub_02090D4C(Unk02090C94 *a0) {
    return a0->unk3;
}

u16 sub_02090D50(Unk02090C94 *a0) {
    return a0->unk1C[0];
}

void sub_02090D54(Unk02090C94 *a0, MAIL_MESSAGE *mailMessage) {
    mailMessage->msg_bank = a0->unk1C[0];
    mailMessage->msg_no = a0->unk1C[1];
}

void sub_02090D60(Unk02090C94 *a0, MAIL_MESSAGE *mailMessage) {
    MailMsg_Copy(mailMessage, &a0->mailMessage);
}

u8 sub_02090D70(Unk02090C94 *a0) {
    return a0->unk0;
}

u8 sub_02090D74(Unk02090C94 *a0) {
    return a0->unk1;
}

u32 sub_02090D78(Unk02090C94 *a0) {
    return a0->frame;
}

Pokedex *sub_02090D7C(Unk02090C94 *a0) {
    return a0->pokedex;
}

SaveEasyChat *sub_02090D80(Unk02090C94 *a0) {
    return a0->easyChat;
}

u8 sub_02090D84(Unk02090C94 *a0) {
    return a0->gameCleared;
}

u8 sub_02090D88(Unk02090C94 *a0) {
    return a0->unk5;
}

void sub_02090D8C(Unk02090C94 *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2) {
    switch (a0->unk0) {
    case 0:
        msg1->msg_bank = a0->unk1C[0];
        return;
    case 1:
        msg1->msg_bank = a0->unk1C[0];
        msg1->msg_no = a0->unk1C[1];
        return;
    case 2:
        *msg2 = a0->mailMessage;
        return;
    }
}

BOOL sub_02090DC0(Unk02090C94 *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2) {
    switch (a0->unk0) {
    case 0:
        return msg1->msg_bank == a0->unk1C[0];
    case 1:
        return msg1->msg_bank == a0->unk1C[0] && msg1->msg_no == a0->unk1C[1];
    case 2:
    default:
        return MailMsg_Compare(&a0->mailMessage, msg2);
    }
}

void sub_02090E04(Unk02090C94 *a0, MAIL_MESSAGE *msg1, MAIL_MESSAGE *msg2) {
    a0->unk3 = !sub_02090DC0(a0, msg1, msg2);
    a0->unk2 = 0;

    u16 *src = (u16 *)&msg1->msg_bank;
    for (int i = 0; i < 2; i++) {
        a0->unk1C[i] = src[i];
    }

    a0->mailMessage = *msg2;
}

int sub_02090E44(Unk02090C94 *a0) {
    if (a0 == NULL || a0->unk24 == 0) {
        return 0;
    }

    return sub_020183F0(a0->unk24);
}

void sub_02090E5C(Unk02090C94 *a0) {
    sub_02018410(a0->unk24);
}

Unk02090E68 *sub_02090E68(SaveData *saveData, u16 a1, u8 partyIdx, u8 a3, HeapID heapId) {
    MAILBOX *mailbox = Save_Mailbox_Get(saveData);
    Unk02090E68 *ptr = AllocFromHeapAtEnd(heapId, sizeof(Unk02090E68));
    MI_CpuFill8(ptr, 0, sizeof(Unk02090E68));

    ptr->unkF = a3;
    ptr->partyIdx = partyIdx;
    ptr->mailbox = mailbox;
    ptr->unk0[0] = 1;
    ptr->unk8 = a1;
    ptr->unkC = 0;
    ptr->saveData = saveData;

    Mail *mail = Mail_New(heapId);
    ptr->mail = mail;
    Mail_Init(mail);
    Mail_SetNewMessageDetails(ptr->mail, MAIL_NONE, partyIdx, saveData);

    return ptr;
}

Unk02090E68 *sub_02090EC0(SaveData *saveData, int n, u16 i, HeapID heapId) {
    Unk02090E68 *ptr = AllocFromHeapAtEnd(heapId, sizeof(Unk02090E68));
    MI_CpuFill8(ptr, 0, sizeof(Unk02090E68));

    ptr->unk0[0] = 0;
    ptr->unk8 = n;
    ptr->unkC = i;
    ptr->saveData = saveData;

    MAILBOX *mailbox = Save_Mailbox_Get(saveData);
    ptr->mailbox = mailbox;
    ptr->mail = Mailbox_AllocAndFetchMailI(&mailbox->msgs[0], n, i, heapId);

    return ptr;
}

Unk02090E68 *sub_02090F00(SaveData *saveData, Pokemon *mon, HeapID heapId) {
    Unk02090E68 *ptr = AllocFromHeapAtEnd(heapId, sizeof(Unk02090E68));
    MI_CpuFill8(ptr, 0, sizeof(Unk02090E68));

    ptr->unk0[0] = 0;
    ptr->saveData = saveData;

    Mail *mail = Mail_New(heapId);
    ptr->mail = mail;
    GetMonData(mon, MON_DATA_MAIL_STRUCT, ptr->mail);

    return ptr;
}

Unk02090E68 *sub_02090F38(SaveData *saveData, u8 mailType, HeapID heapId) {
    Unk02090E68 *ptr = AllocFromHeapAtEnd(heapId, sizeof(Unk02090E68));
    MI_CpuFill8(ptr, 0, sizeof(Unk02090E68));

    ptr->unk0[0] = 0;
    ptr->saveData = saveData;

    Mail *mail = Mail_New(heapId);
    ptr->mail = mail;
    Mail_SetType(mail, mailType);

    return ptr;
}

u32 sub_02090F6C(Unk02090E68 *a0) {
    return a0->unk4;
}

BOOL sub_02090F70(Unk02090E68 *a0, Pokemon *mon) {
    if (sub_02090F6C(a0) == 0) {
        return FALSE;
    }
    SetMonData(mon, MON_DATA_MAIL_STRUCT, a0->mail);
    return TRUE;
}

void sub_02090F90(Unk02090E68 *a0) {
    if (a0->mail != NULL) {
        FreeToHeap(a0->mail);
    }
    FreeToHeap(a0);
}

int sub_02090FA8(MAILBOX *mailbox, Pokemon *mon, HeapID heapId) {
    int item = ITEM_NONE;
    int idx = Mailbox_GetFirstEmptySlotIdx(mailbox);

    if (idx != -1) {
        Mail *mail = Mail_New(heapId);

        GetMonData(mon, MON_DATA_MAIL_STRUCT, mail);
        Mailbox_CopyMailToSlotI(&mailbox->msgs[0], 0, idx, mail);
        Mail_Init(mail);
        SetMonData(mon, MON_DATA_MAIL_STRUCT, mail);
        SetMonData(mon, MON_DATA_HELD_ITEM, &item);
        FreeToHeap(mail);
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
    FreeToHeap(mail);

    return i;
}
