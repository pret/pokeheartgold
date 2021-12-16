#include "mail.h"
#include "string_util.h"
#include "mail_message.h"
#include "party.h"
#include "player_data.h"
#include "pokemon.h"
#include "constants/mail.h"
#include "constants/easy_chat.h"

struct UnkStruct_020F67A4 {
    u16 unk_0;
    u16 unk_2;
    u16 unk_4;
    u8 unk_6;
    u8 dummy;
};

extern const struct UnkStruct_020F67A4 _020F67A4[7];

extern u16 sub_020741B0(POKEMON *pokemon);
extern u8 sub_02074364(u32 species, u32 forme, u32 isEgg);

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

void Mail_SetNewMessageDetails(MAIL *mail, u8 mailType, u8 mon_no, SAVEDATA *saveData) {
    u8 i, j, ip, k;
    u16 species;
    u32 r5, isEgg, forme;
    PLAYERPROFILE *profile;
    PARTY *party;
    POKEMON *pokemon;

    Mail_init(mail);
    mail->mail_type = mailType;
    party = SavArray_PlayerParty_get(saveData);
    profile = Sav2_PlayerData_GetProfileAddr(saveData);
    CopyU16StringArray(mail->author_name, PlayerProfile_GetNamePtr(profile));
    mail->author_gender = PlayerProfile_GetTrainerGender(profile);
    mail->author_otId = PlayerProfile_GetTrainerID(profile);

    mail->unk_1E = 0;
    for (i = mon_no, j = 0; i < GetPartyCount(party); i++) {
        pokemon = GetPartyMonByIndex(party, i);
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);
        forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
        r5 = sub_020741B0(pokemon);
        ip = sub_02074364(species, forme, isEgg);

        mail->unk_18[j].unk_0_0 = r5;
        mail->unk_18[j].unk_0_C = ip;
        for (k = 0; k < NELEMS(_020F67A4); k++) {
            if (_020F67A4[k].unk_2 == mail->unk_18[j].unk_0_0 && _020F67A4[k].unk_6 == forme) {
                mail->unk_18[j].unk_0_0 = _020F67A4[k].unk_0;
                mail->unk_18[j].unk_0_C = sub_02074364(species, 0, isEgg);
                mail->unk_1E |= _020F67A4[k].unk_6 << (5 * j);
                break;
            }
        }
        j++;
        if (j >= 3) {
            break;
        }
    }
}

MAIL *CreateKenyaMail(POKEMON *pokemon, u8 mailType, u8 gender, STRING *name, u8 otId) {
    u8 r0;
    u32 r5;
    u16 species;
    u32 isEgg, forme;
    MAIL *ret = Mail_new(3);
    Mail_init(ret);
    ret->mail_type = mailType;
    CopyStringToU16Array(name, ret->author_name, OT_NAME_LENGTH + 1);
    ret->author_gender = gender;
    ret->author_otId = otId;

    // LETTER! Thank you!
    MailMsg_SetMsgBankAndNum(&ret->unk_20[0], 1, 7);
    MailMsg_SetFieldI(&ret->unk_20[0], 0, EC_WORD_FEELINGS_LETTER);
    MailMsg_SetFieldI(&ret->unk_20[0], 1, EC_WORD_NULL);

    // ADVENTURE was fun, wasn't it?
    MailMsg_SetMsgBankAndNum(&ret->unk_20[1], 1, 15);
    MailMsg_SetFieldI(&ret->unk_20[1], 0, EC_WORD_FEELINGS_ADVENTURE);
    MailMsg_SetFieldI(&ret->unk_20[1], 1, EC_WORD_NULL);

    // ZUBAT was the one thing I wanted to avoid...
    MailMsg_SetMsgBankAndNum(&ret->unk_20[2], 2, 1);
    MailMsg_SetFieldI(&ret->unk_20[2], 0, EC_WORD_POKEMON(SPECIES_ZUBAT));
    MailMsg_SetFieldI(&ret->unk_20[2], 1, EC_WORD_NULL);

    ret->unk_1E = 0;

    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);
    forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
    r5 = sub_020741B0(pokemon);
    r0 = sub_02074364(species, forme, isEgg);
    ret->unk_18[0].unk_0_0 = r5;
    ret->unk_18[0].unk_0_C = r0;

    return ret;
}
