#ifndef POKEHEARTGOLD_MAIL_MESSAGE_H
#define POKEHEARTGOLD_MAIL_MESSAGE_H

#include "pokemon_types_def.h"
#include "pm_string.h"

#define MAILMSG_BANK_0294_GMM        0
#define MAILMSG_BANK_0296_GMM        1
#define MAILMSG_BANK_0292_GMM        2
#define MAILMSG_BANK_0293_GMM        3
#define MAILMSG_BANK_0295_GMM        4

#include "msgdata/msg/msg_0294.h"
#include "msgdata/msg/msg_0296.h"
#include "msgdata/msg/msg_0292.h"
#include "msgdata/msg/msg_0293.h"
#include "msgdata/msg/msg_0295.h"

#ifndef PM_ASM

typedef struct MailMessageTemplate {
    u8 msg_bank;
    u8 msg_no;
    s8 ec_groups[MAILMSG_FIELDS_MAX];
    u16 ec_words[MAILMSG_FIELDS_MAX];
} MAIL_MSG_TEMPLATE;

void MailMsg_init(MAIL_MESSAGE *msg);
BOOL MailMsg_compare(const MAIL_MESSAGE *a, const MAIL_MESSAGE *b);
void MailMsg_SetMsgBankAndNum(MAIL_MESSAGE *mailMessage, u16 msg_bank, u16 msg_no);
void MailMsg_SetFieldI(MAIL_MESSAGE *mailMessage, u16 field_no, u16 ec_word);
void MailMsg_copy(MAIL_MESSAGE *dst, const MAIL_MESSAGE *src);
void MailMsg_init_withBank(MAIL_MESSAGE *mailMessage, u16 msgBank);
void MailMsg_init_default(MAIL_MESSAGE *mailMessage);
void MailMsg_init_fromTemplate(MAIL_MESSAGE *mailMessage, const MAIL_MSG_TEMPLATE *template);
BOOL MailMsg_IsInit(MAIL_MESSAGE *mailMessage);
BOOL MailMsg_AllFieldsAreInit(MAIL_MESSAGE *mailMessage);
u32 MailMsg_NumFields(u16 msg_bank, u16 msg_no);
u16 MailMsg_GetFieldI(const MAIL_MESSAGE *mailMessage, int field_no);
u16 MailMsg_GetMsgBank(const MAIL_MESSAGE *mailMessage);
u16 MailMsg_GetMsgNo(const MAIL_MESSAGE *mailMessage);
u32 MailMsg_NumMsgsInBank(u16 msg_bank);
void MailMsg_SetTrailingFieldsEmpty(MAIL_MESSAGE *mailMessage);
STRING *MailMsg_GetExpandedString(const MAIL_MESSAGE *mailMessage, HeapID heapId);

#endif //PM_ASM

#endif //POKEHEARTGOLD_MAIL_MESSAGE_H
