#include "mail_message.h"
#include "constants/easy_chat.h"
#include "msgdata/msg.naix"

const u16 _020F60E0[] = {
    NARC_msg_msg_00000294_bin,
    NARC_msg_msg_00000296_bin,
    NARC_msg_msg_00000292_bin,
    NARC_msg_msg_00000293_bin,
    NARC_msg_msg_00000295_bin,
};

void MailMsg_init(MAIL_MESSAGE *mailMessage) {
    int i;
    mailMessage->msg_bank = MAILMSG_BANK_NONE;
    for (i = 0; i < MAILMSG_FIELDS_MAX; i++) {
        mailMessage->fields[i] = EC_WORD_NULL;
    }
}

void MailMsg_init_withBank(MAIL_MESSAGE *mailMessage, u16 msgBank) {
    int i;
    mailMessage->msg_bank = msgBank;
    mailMessage->msg_no = 0;
    for (i = 0; i < MAILMSG_FIELDS_MAX; i++) {
        mailMessage->fields[i] = EC_WORD_NULL;
    }
}

void MailMsg_init_default(MAIL_MESSAGE *mailMessage) {
    MailMsg_init_withBank(mailMessage, 4);
    mailMessage->msg_no = 5;
}
