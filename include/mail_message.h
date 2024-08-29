#ifndef POKEHEARTGOLD_MAIL_MESSAGE_H
#define POKEHEARTGOLD_MAIL_MESSAGE_H

#include "pm_string.h"
#include "pokemon_types_def.h"

#define MAILMSG_BANK_0294_GMM 0
#define MAILMSG_BANK_0296_GMM 1
#define MAILMSG_BANK_0292_GMM 2
#define MAILMSG_BANK_0293_GMM 3
#define MAILMSG_BANK_0295_GMM 4

#include "pm_string.h"

#ifndef PM_ASM

typedef struct MailMessageTemplate {
    u8 msg_bank;
    u8 msg_no;
    s8 ec_groups[MAILMSG_FIELDS_MAX];
    u16 ec_words[MAILMSG_FIELDS_MAX];
} MailMessageTemplate;

void MailMsg_Init(MailMessage *msg);
BOOL MailMsg_Compare(const MailMessage *a, const MailMessage *b);
void MailMsg_SetMsgBankAndNum(MailMessage *mailMessage, u16 msg_bank, u16 msg_no);
void MailMsg_SetFieldI(MailMessage *mailMessage, u16 field_no, u16 ec_word);
void MailMsg_Copy(MailMessage *dst, const MailMessage *src);
void MailMsg_Init_WithBank(MailMessage *mailMessage, u16 msgBank);
void MailMsg_Init_Default(MailMessage *mailMessage);
void MailMsg_Init_FromTemplate(MailMessage *mailMessage, const MailMessageTemplate *template);
String *MailMsg_GetExpandedString(const MailMessage *mailMessage, HeapID heapId);
String *MailMsg_GetRawString(MailMessage *mailMessage, HeapID heapId);
BOOL MailMsg_IsInit(MailMessage *mailMessage);
BOOL MailMsg_AllFieldsAreInit(MailMessage *mailMessage);
u32 MailMsg_NumFields(u16 msg_bank, u16 msg_no);
u16 MailMsg_GetFieldI(const MailMessage *mailMessage, int field_no);
u16 MailMsg_GetMsgBank(const MailMessage *mailMessage);
u16 MailMsg_GetMsgNo(const MailMessage *mailMessage);
u32 MailMsg_NumMsgsInBank(u16 msg_bank);
void MailMsg_SetTrailingFieldsEmpty(MailMessage *mailMessage);
String *MailMsg_GetExpandedString(const MailMessage *mailMessage, HeapID heapId);

#endif // PM_ASM

#endif // POKEHEARTGOLD_MAIL_MESSAGE_H
