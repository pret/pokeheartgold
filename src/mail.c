#include "mail.h"
#include "string_util.h"
#include "mail_message.h"
#include "constants/mail.h"

void Mail_init(MAIL *mail) {
    int i;
    mail->author_otId = 0;
    mail->author_gender = PLAYER_GENDER_MALE;
    mail->author_language = gGameLanguage;
    mail->author_version = gGameVersion;
    mail->mail_type = MAIL_NONE;
    StringFillEOS(mail->author_name, OT_NAME_LENGTH + 1);
    for (i = 0; i < 3; i++) {
        mail->unk_18[i].raw = 0xFFFF;
    }
    mail->unk_1E = 0;
    for (i = 0; i < 3; i++) {
        MailMsg_init(&mail->unk_20[i]);
    }
}

BOOL Mail_TypeIsValid(MAIL *mail) {
    return mail->mail_type <= NUM_MAIL - 1;
}

MAIL *Mail_new(HeapID heapId) {
    MAIL *ret = (MAIL *)AllocFromHeapAtEnd(heapId, sizeof(MAIL));
    Mail_init(ret);
    return ret;
}

void Mail_copy(const MAIL *src, MAIL *dst) {
    MI_CpuCopy8(src, dst, sizeof(MAIL));
}

BOOL Mail_compare(const MAIL *a, const MAIL *b) {
    int i;
    if (a->author_otId != b->author_otId
    || a->author_gender != b->author_gender
    || a->author_language != b->author_language
    || a->author_version != b->author_version
    || a->mail_type != b->mail_type
    || a->unk_1E != b->unk_1E) {
        return FALSE;
    }
    if (StringNotEqual(a->author_name, b->author_name)) {
        return FALSE;
    }
    for (i = 0; i < 3; i++) {
        if (a->unk_18[i].raw != b->unk_18[i].raw) {
            return FALSE;
        }
    }
    for (i = 0; i < 3; i++) {
        if (!MailMsg_compare(&a->unk_20[i], &b->unk_20[i])) {
            return FALSE;
        }
    }

    return TRUE;
}
