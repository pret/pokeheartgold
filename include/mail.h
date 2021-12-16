#ifndef POKEHEARTGOLD_MAIL_H
#define POKEHEARTGOLD_MAIL_H

#include "mail_message.h"
#include "heap.h"

union MailPatternData
{
    u16 raw;
    struct {
        u16 unk_0_0:12;
        u16 unk_0_C:4;
    };
};

typedef struct Mail
{
    u32 author_otId;
    u8 author_gender;
    u8 author_language;
    u8 author_version;
    u8 mail_type;
    u16 author_name[OT_NAME_LENGTH + 1];
    union MailPatternData unk_18[3];
    u16 unk_1E;
    MAIL_MESSAGE unk_20[3];
} MAIL;

MAIL *Mail_new(HeapID heap_id);
void Mail_copy(const MAIL *src, MAIL *dest);

#endif //POKEHEARTGOLD_MAIL_H
