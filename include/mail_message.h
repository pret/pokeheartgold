#ifndef POKEHEARTGOLD_MAIL_MESSAGE_H
#define POKEHEARTGOLD_MAIL_MESSAGE_H

typedef struct MailMessage
{
    u16 msg_bank;
    u16 msg_no;
    u16 fields[2];
} MAIL_MESSAGE;

#endif //POKEHEARTGOLD_MAIL_MESSAGE_H
