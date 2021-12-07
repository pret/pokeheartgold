#ifndef POKEHEARTGOLD_MAIL_MESSAGE_H
#define POKEHEARTGOLD_MAIL_MESSAGE_H

#define MAILMSG_BANK_NONE           (0xFFFF)
#define MAILMSG_FIELDS_MAX          (2)

typedef struct MailMessage
{
    u16 msg_bank;
    u16 msg_no;
    u16 fields[MAILMSG_FIELDS_MAX];
} MAIL_MESSAGE;

#endif //POKEHEARTGOLD_MAIL_MESSAGE_H
