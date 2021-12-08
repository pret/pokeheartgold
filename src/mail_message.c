#include "mail_message.h"
#include "constants/easy_chat.h"
#include "msgdata/msg.naix"
#include "easy_chat.h"
#include "msgfmt.h"
#include "msgdata.h"
#include "string_control_code.h"

const u16 _020F60E0[] = {
    NARC_msg_msg_00000294_bin,
    NARC_msg_msg_00000296_bin,
    NARC_msg_msg_00000292_bin,
    NARC_msg_msg_00000293_bin,
    NARC_msg_msg_00000295_bin,
};

u32 MailMsg_NumFields(u16 msg_bank, u16 msg_no);
u32 MailMsg_NumMsgsInBank(u16 msg_bank);

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

void MailMsg_init_fromTemplate(MAIL_MESSAGE *mailMessage, const MAIL_MSG_TEMPLATE *template) {
    MailMsg_init_withBank(mailMessage, template->msg_bank);
    mailMessage->msg_no = template->msg_no;
    if (template->ec_groups[0] > 0) {
        mailMessage->fields[0] = GetECWordIndexByPair(sub_02015DC8(template->ec_groups[0]), template->ec_words[0]);
    }
    if (template->ec_groups[1] > 0) {
        mailMessage->fields[1] = GetECWordIndexByPair(sub_02015DC8(template->ec_groups[1]), template->ec_words[1]);
    }
}

STRING *MailMsg_GetExpandedString(const MAIL_MESSAGE *mailMessage, HeapID heapId) {
    MSGFMT *msgFmt;
    MSGDATA *msgData;
    STRING *string;
    int i;

    msgFmt = ScrStrBufs_new(heapId);
    for (i = 0; i < MAILMSG_FIELDS_MAX; i++) {
        if (mailMessage->fields[i] == EC_WORD_NULL) {
            break;
        }
        BufferECWord(msgFmt, i, mailMessage->fields[i]);
    }

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, _020F60E0[mailMessage->msg_bank], heapId);
    string = ReadMsgData_ExpandPlaceholders(msgFmt, msgData, mailMessage->msg_no, heapId);
    DestroyMsgData(msgData);
    ScrStrBufs_delete(msgFmt);
    return string;
}

STRING *MailMsg_GetRawString(MAIL_MESSAGE *mailMessage, HeapID heapId) {
    return ReadMsgData_NewNarc_NewString(NARC_msgdata_msg, _020F60E0[mailMessage->msg_bank], mailMessage->msg_no, heapId);
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
    STRING *msg;
    const u16 *msg_cstr;
    u32 ret;

    GF_ASSERT(msg_bank < NELEMS(_020F60E0));
    GF_ASSERT(msg_no < MailMsg_NumMsgsInBank(msg_bank));
    msg = ReadMsgData_NewNarc_NewString(NARC_msgdata_msg, _020F60E0[msg_bank], msg_no, 0);
    msg_cstr = String_c_str(msg);
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
    String_dtor(msg);
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

BOOL MailMsg_compare(const MAIL_MESSAGE *a, const MAIL_MESSAGE *b) {
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

void MailMsg_copy(MAIL_MESSAGE *dst, const MAIL_MESSAGE *src) {
    *dst = *src;
}

u32 MailMsg_NumMsgsInBank(u16 msg_bank) {
    return (msg_bank < NELEMS(_020F60E0)) ? 20 : 0;
}

void MailMsg_SetMsgBankAndNum(MAIL_MESSAGE *mailMessage, u16 msg_bank, u16 msg_no) {
    GF_ASSERT(msg_bank < NELEMS(_020F60E0));
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
