#include "global.h"
#include "mail_message.h"
#include "constants/easy_chat.h"
#include "msgdata/msg.naix"
#include "easy_chat.h"
#include "message_format.h"
#include "msgdata.h"
#include "string_control_code.h"

#include "msgdata/msg/msg_0294.h"
#include "msgdata/msg/msg_0296.h"
#include "msgdata/msg/msg_0292.h"
#include "msgdata/msg/msg_0293.h"
#include "msgdata/msg/msg_0295.h"

static const u16 sMessageBanks[] = {
    NARC_msg_msg_0294_bin,
    NARC_msg_msg_0296_bin,
    NARC_msg_msg_0292_bin,
    NARC_msg_msg_0293_bin,
    NARC_msg_msg_0295_bin,
};

u32 MailMsg_NumFields(u16 msg_bank, u16 msg_no);
u32 MailMsg_NumMsgsInBank(u16 msg_bank);

void MailMsg_Init(MAIL_MESSAGE *mailMessage) {
    int i;
    mailMessage->msg_bank = MAILMSG_BANK_NONE;
    for (i = 0; i < MAILMSG_FIELDS_MAX; i++) {
        mailMessage->fields[i] = EC_WORD_NULL;
    }
}

void MailMsg_Init_WithBank(MAIL_MESSAGE *mailMessage, u16 msgBank) {
    int i;
    mailMessage->msg_bank = msgBank;
    mailMessage->msg_no = 0;
    for (i = 0; i < MAILMSG_FIELDS_MAX; i++) {
        mailMessage->fields[i] = EC_WORD_NULL;
    }
}

// I've entered the Union Room
void MailMsg_Init_Default(MAIL_MESSAGE *mailMessage) {
    MailMsg_Init_WithBank(mailMessage, MAILMSG_BANK_0295_GMM);
    mailMessage->msg_no = msg_0295_00005;
}

void MailMsg_Init_FromTemplate(MAIL_MESSAGE *mailMessage, const MAIL_MSG_TEMPLATE *template) {
    MailMsg_Init_WithBank(mailMessage, template->msg_bank);
    mailMessage->msg_no = template->msg_no;
    if (template->ec_groups[0] > 0) {
        mailMessage->fields[0] = GetECWordIndexByPair(EasyChat_GetMsgBankForGroup(template->ec_groups[0]), template->ec_words[0]);
    }
    if (template->ec_groups[1] > 0) {
        mailMessage->fields[1] = GetECWordIndexByPair(EasyChat_GetMsgBankForGroup(template->ec_groups[1]), template->ec_words[1]);
    }
}

String *MailMsg_GetExpandedString(const MAIL_MESSAGE *mailMessage, HeapID heapId) {
    MessageFormat *msgFmt;
    MsgData *msgData;
    String *string;
    int i;

    msgFmt = MessageFormat_New(heapId);
    for (i = 0; i < MAILMSG_FIELDS_MAX; i++) {
        if (mailMessage->fields[i] == EC_WORD_NULL) {
            break;
        }
        BufferECWord(msgFmt, i, mailMessage->fields[i]);
    }

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, sMessageBanks[mailMessage->msg_bank], heapId);
    string = ReadMsgData_ExpandPlaceholders(msgFmt, msgData, mailMessage->msg_no, heapId);
    DestroyMsgData(msgData);
    MessageFormat_Delete(msgFmt);
    return string;
}

String *MailMsg_GetRawString(MAIL_MESSAGE *mailMessage, HeapID heapId) {
    return ReadMsgData_NewNarc_NewString(NARC_msgdata_msg, sMessageBanks[mailMessage->msg_bank], mailMessage->msg_no, heapId);
}

BOOL MailMsg_IsInit(MAIL_MESSAGE *mailMessage) {
    return mailMessage->msg_bank != MAILMSG_BANK_NONE;
}

BOOL MailMsg_AllFieldsAreInit(MAIL_MESSAGE *mailMessage) {
    u32 nmsg = MailMsg_NumFields(mailMessage->msg_bank, mailMessage->msg_no);
    int i;

    for (i = 0; i < nmsg; i++) {
        if (mailMessage->fields[i] == EC_WORD_NULL) {
            return FALSE;
        }
    }

    return TRUE;
}

u32 MailMsg_NumFields(u16 msg_bank, u16 msg_no) {
    String *msg;
    const u16 *msg_cstr;
    u32 ret;

    GF_ASSERT(msg_bank < NELEMS(sMessageBanks));
    GF_ASSERT(msg_no < MailMsg_NumMsgsInBank(msg_bank));
    msg = ReadMsgData_NewNarc_NewString(NARC_msgdata_msg, sMessageBanks[msg_bank], msg_no, HEAP_ID_DEFAULT);
    msg_cstr = String_cstr(msg);
    ret = 0;
    while (*msg_cstr != EOS) {
        if (*msg_cstr == EXT_CTRL_CODE_BEGIN) {
            if (MsgArray_ControlCodeIsStrVar(msg_cstr)) {
                ret++;
            }
            msg_cstr = MsgArray_SkipControlCode(msg_cstr);
        } else {
            msg_cstr++;
        }
    }
    String_Delete(msg);
    return ret;
}

u16 MailMsg_GetFieldI(const MAIL_MESSAGE *mailMessage, int field_no) {
    // Potential UB: no bounds check
    return mailMessage->fields[field_no];
}

u16 MailMsg_GetMsgBank(const MAIL_MESSAGE *mailMessage) {
    return mailMessage->msg_bank;
}

u16 MailMsg_GetMsgNo(const MAIL_MESSAGE *mailMessage) {
    return mailMessage->msg_no;
}

BOOL MailMsg_Compare(const MAIL_MESSAGE *a, const MAIL_MESSAGE *b) {
    int i;
    if (a->msg_bank != b->msg_bank || a->msg_no != b->msg_no) {
        return FALSE;
    }
    for (i = 0; i < MAILMSG_FIELDS_MAX; i++) {
        if (a->fields[i] != b->fields[i]) {
            return FALSE;
        }
    }
    return TRUE;
}

void MailMsg_Copy(MAIL_MESSAGE *dst, const MAIL_MESSAGE *src) {
    *dst = *src;
}

u32 MailMsg_NumMsgsInBank(u16 msg_bank) {
    return (msg_bank < NELEMS(sMessageBanks)) ? 20 : 0;
}

void MailMsg_SetMsgBankAndNum(MAIL_MESSAGE *mailMessage, u16 msg_bank, u16 msg_no) {
    GF_ASSERT(msg_bank < NELEMS(sMessageBanks));
    mailMessage->msg_bank = msg_bank;
    mailMessage->msg_no = msg_no;
}

void MailMsg_SetFieldI(MAIL_MESSAGE *mailMessage, u16 field_no, u16 ec_word) {
    GF_ASSERT(field_no < MAILMSG_FIELDS_MAX);
    mailMessage->fields[field_no] = ec_word;
}

void MailMsg_SetTrailingFieldsEmpty(MAIL_MESSAGE *mailMessage) {
    u32 i;

    for (i = MailMsg_NumFields(mailMessage->msg_bank, mailMessage->msg_no); i < MAILMSG_FIELDS_MAX; i++) {
        mailMessage->fields[i] = EC_WORD_NULL;
    }
}
