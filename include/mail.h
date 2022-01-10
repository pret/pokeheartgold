#ifndef POKEHEARTGOLD_MAIL_H
#define POKEHEARTGOLD_MAIL_H

#include "mail_message.h"
#include "heap.h"
#include "save.h"

union MailPatternData
{
    u16 raw;
    struct {
        u16 unk_0_0:12;
        u16 unk_0_C:4;
    };
};

typedef struct Mail
{
    u32 author_otId;
    u8 author_gender;
    u8 author_language;
    u8 author_version;
    u8 mail_type;
    u16 author_name[OT_NAME_LENGTH + 1];
    union MailPatternData unk_18[3];
    u16 unk_1E;
    MAIL_MESSAGE unk_20[3];
} MAIL;

#define MAILBOX_MSG_COUNT       (20)

typedef struct Mailbox {
    MAIL msgs[MAILBOX_MSG_COUNT];
} MAILBOX;

MAIL *Mail_new(HeapID heap_id);
void Mail_copy(const MAIL *src, MAIL *dest);
void Mail_init(MAIL *mail);
BOOL Mail_TypeIsValid(MAIL *mail);
BOOL Mail_compare(const MAIL *a, const MAIL *b);
void Mail_SetNewMessageDetails(MAIL *mail, u8 mailType, u8 mon_no, SAVEDATA *saveData);
u32 Mail_GetOTID(const MAIL *mail);
u8 Mail_GetAuthorGender(const MAIL *mail);
u8 Mail_GetType(const MAIL *mail);
void Mail_SetType(MAIL *mail, u8 mailType);
u8 Mail_GetLanguage(const MAIL *mail);
u8 Mail_GetVersion(const MAIL *mail);
u16 sub_0202B404(MAIL *mail, u8 r1, u8 r4, u16 r3);
u16 sub_0202B4E4(const MAIL *mail);
void Mail_CopyToUnk20Array(MAIL *mail, const MAIL_MESSAGE *src, int i);
u32 Sav2_Mailbox_sizeof(void);
void Sav2_Mailbox_init(MAILBOX *mailbox);
int Mailbox_GetFirstEmptySlotIdx(MAILBOX *mailbox);
void Mailbox_DeleteSlotI(MAIL *msgs, int n, int i);
void Mailbox_CopyMailToSlotI(MAIL *msgs, int n, int i, const MAIL *src);
u32 Mailbox_CountMessages(MAILBOX *mailbox);
void Mailbox_FetchMailToBuffer(MAIL *msgs, int n, int i, MAIL *dest);
int MailArray_GetFirstEmptySlotIdx(MAIL *msgs, int n);
u32 MailArray_CountMessages(MAIL *msgs, int n);

#endif //POKEHEARTGOLD_MAIL_H
