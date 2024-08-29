#ifndef POKEHEARTGOLD_MAIL_H
#define POKEHEARTGOLD_MAIL_H

#include "heap.h"
#include "mail_message.h"
#include "pm_string.h"
#include "pokemon_types_def.h"
#include "save.h"

#define MAILBOX_MSG_COUNT (20)

typedef struct Mailbox {
    Mail msgs[MAILBOX_MSG_COUNT];
} Mailbox;

Mail *Mail_New(HeapID heapId);
void Mail_Copy(const Mail *src, Mail *dest);
void Mail_Init(Mail *mail);
BOOL Mail_TypeIsValid(Mail *mail);
BOOL Mail_Compare(const Mail *a, const Mail *b);
void Mail_SetNewMessageDetails(Mail *mail, u8 mailType, u8 mon_no, SaveData *saveData);
u32 Mail_GetOTID(const Mail *mail);
u16 *Mail_GetAuthorNamePtr(Mail *mail);
u8 Mail_GetAuthorGender(const Mail *mail);
u8 Mail_GetType(const Mail *mail);
void Mail_SetType(Mail *mail, u8 mailType);
u8 Mail_GetLanguage(const Mail *mail);
u8 Mail_GetVersion(const Mail *mail);
u16 sub_0202B404(Mail *mail, u8 r1, u8 r4, u16 r3);
u16 sub_0202B4E4(const Mail *mail);
MailMessage *Mail_GetUnk20Array(Mail *mail, int i);
void Mail_SetMessage(Mail *mail, const MailMessage *src, int i);
Mailbox *Save_Mailbox_Get(SaveData *saveData);
u32 Save_Mailbox_sizeof(void);
void Save_Mailbox_Init(Mailbox *mailbox);
Mail *Mailbox_AllocAndFetchMailI(Mail *msgs, int n, int i, HeapID heapId);
int Mailbox_GetFirstEmptySlotIdx(Mailbox *mailbox);
void Mailbox_DeleteSlotI(Mail *msgs, int n, int i);
void Mailbox_CopyMailToSlotI(Mail *msgs, int n, int i, const Mail *src);
u32 Mailbox_CountMessages(Mailbox *mailbox, int unused);
void Mailbox_FetchMailToBuffer(Mail *msgs, int n, int i, Mail *dest);
int MailArray_GetFirstEmptySlotIdx(Mail *msgs, int n);
u32 MailArray_CountMessages(Mail *msgs, int n);
Mail *CreateKenyaMail(Pokemon *mon, u8 mailType, u8 gender, String *name, u8 otId);

#endif // POKEHEARTGOLD_MAIL_H
