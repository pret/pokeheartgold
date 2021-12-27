#ifndef POKEHEARTGOLD_MAIL_MESSAGE_H
#define POKEHEARTGOLD_MAIL_MESSAGE_H

#define MAILMSG_BANK_NONE           (0xFFFF)
#define MAILMSG_FIELDS_MAX          (2)

#include "msgdata/msg/msg_0294.h"
#include "msgdata/msg/msg_0296.h"
#include "msgdata/msg/msg_0292.h"
#include "msgdata/msg/msg_0293.h"
#include "msgdata/msg/msg_0295.h"

typedef struct MailMessage {
    u16 msg_bank;
    u16 msg_no;
    u16 fields[MAILMSG_FIELDS_MAX];
} MAIL_MESSAGE;

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

#endif //POKEHEARTGOLD_MAIL_MESSAGE_H
