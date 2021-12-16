#ifndef POKEHEARTGOLD_MAIL_MESSAGE_H
#define POKEHEARTGOLD_MAIL_MESSAGE_H

#define MAILMSG_BANK_NONE           (0xFFFF)
#define MAILMSG_FIELDS_MAX          (2)

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

#endif //POKEHEARTGOLD_MAIL_MESSAGE_H
