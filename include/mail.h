#ifndef POKEHEARTGOLD_MAIL_H
#define POKEHEARTGOLD_MAIL_H

#include "mail_message.h"

union MailPatternData
{
    u16 raw;
    struct {
        u16 unk_0:12;
        u16 unk_C:4;
    } bits;
};

typedef struct Mail
{
    u32 author_otId; // author otid
    u8 author_gender; // author gender
    u8 author_language; // language
    u8 author_version; // version
    u8 mail_type; // mail type
    u16 author_name[OT_NAME_LENGTH + 1]; // author name
    union MailPatternData unk_18[3];
    u8 padding_1E[2];
    MAIL_MESSAGE unk_20[3];
} MAIL;

#endif //POKEHEARTGOLD_MAIL_H
