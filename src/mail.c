#include "mail.h"
#include "string_util.h"
#include "mail_message.h"
#include "party.h"
#include "player_data.h"
#include "pokemon.h"
#include "pokemon_icon_idx.h"
#include "constants/mail.h"
#include "constants/easy_chat.h"

struct UnkStruct_020F67A4 {
    u16 base_icon;
    u16 formed_icon;
    u16 species;
    u8 forme;
    u8 dummy;
};

static const struct UnkStruct_020F67A4 sFormeOverrides[] = {
    { 0x1EE, 0x21C, SPECIES_GIRATINA, GIRATINA_ORIGIN },
    { 0x1F3, 0x21D, SPECIES_SHAYMIN, SHAYMIN_SKY },
    { 0x1E6, 0x21E, SPECIES_ROTOM, ROTOM_HEAT },
    { 0x1E6, 0x21F, SPECIES_ROTOM, ROTOM_WASH },
    { 0x1E6, 0x220, SPECIES_ROTOM, ROTOM_FROST },
    { 0x1E6, 0x221, SPECIES_ROTOM, ROTOM_FAN },
    { 0x1E6, 0x222, SPECIES_ROTOM, ROTOM_MOW },
};

int MailArray_GetFirstEmptySlotIdx(MAIL* msgs, int nmsg);
MAIL* Mailbox_GetPtrToSlotI(MAIL *msgs, int n, int i);
u32 MailArray_CountMessages(MAIL *msgs, int n);

void Mail_init(MAIL *mail) {
    int i;
    mail->author_otId = 0;
    mail->author_gender = PLAYER_GENDER_MALE;
    mail->author_language = gGameLanguage;
    mail->author_version = gGameVersion;
    mail->mail_type = MAIL_NONE;
    StringFillEOS(mail->author_name, OT_NAME_LENGTH + 1);
    for (i = 0; i < 3; i++) {
        mail->mon_icons[i].raw = 0xFFFF;
    }
    mail->forme_flags = 0;
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
    || a->forme_flags != b->forme_flags) {
        return FALSE;
    }
    if (StringNotEqual(a->author_name, b->author_name)) {
        return FALSE;
    }
    for (i = 0; i < 3; i++) {
        if (a->mon_icons[i].raw != b->mon_icons[i].raw) {
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
    u8 i, j, pal, k;
    u16 species;
    u32 icon, isEgg, forme;
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

    // Get the Pokemon icon data
    mail->forme_flags = 0;
    for (i = mon_no, j = 0; i < GetPartyCount(party); i++) {
        pokemon = GetPartyMonByIndex(party, i);
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);
        forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
        icon = Pokemon_GetIconNaix(pokemon);
        pal = GetMonIconPaletteEx(species, forme, isEgg);

        mail->mon_icons[j].icon = icon;
        mail->mon_icons[j].pal = pal;
        // Normal forme conversion for icons added in Platinum or later.
        // Forme numbers are saved to this buffer.
        for (k = 0; k < NELEMS(sFormeOverrides); k++) {
            if (sFormeOverrides[k].formed_icon == mail->mon_icons[j].icon && sFormeOverrides[k].forme == forme) {
                mail->mon_icons[j].icon = sFormeOverrides[k].base_icon;
                mail->mon_icons[j].pal = GetMonIconPaletteEx(species, 0, isEgg);
                mail->forme_flags |= sFormeOverrides[k].forme << (j * 5);
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
    MailMsg_SetMsgBankAndNum(&ret->unk_20[0], 1, msg_0296_00007);
    MailMsg_SetFieldI(&ret->unk_20[0], 0, EC_WORD_FEELINGS_LETTER);
    MailMsg_SetFieldI(&ret->unk_20[0], 1, EC_WORD_NULL);

    // ADVENTURE was fun, wasn't it?
    MailMsg_SetMsgBankAndNum(&ret->unk_20[1], 1, msg_0296_00015);
    MailMsg_SetFieldI(&ret->unk_20[1], 0, EC_WORD_FEELINGS_ADVENTURE);
    MailMsg_SetFieldI(&ret->unk_20[1], 1, EC_WORD_NULL);

    // ZUBAT was the one thing I wanted to avoid...
    MailMsg_SetMsgBankAndNum(&ret->unk_20[2], 2, msg_0292_00001);
    MailMsg_SetFieldI(&ret->unk_20[2], 0, EC_WORD_POKEMON(SPECIES_ZUBAT));
    MailMsg_SetFieldI(&ret->unk_20[2], 1, EC_WORD_NULL);

    ret->forme_flags = 0;

    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    isEgg = GetMonData(pokemon, MON_DATA_IS_EGG, NULL);
    forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
    r5 = Pokemon_GetIconNaix(pokemon);
    r0 = GetMonIconPaletteEx(species, forme, isEgg);
    ret->mon_icons[0].icon = r5;
    ret->mon_icons[0].pal = r0;

    return ret;
}

u32 Mail_GetOTID(const MAIL *mail) {
    return mail->author_otId;
}

u16 *Mail_GetAuthorNamePtr(MAIL *mail) {
    return mail->author_name;
}

u8 Mail_GetAuthorGender(const MAIL *mail) {
    return mail->author_gender;
}

u8 Mail_GetType(const MAIL *mail) {
    return mail->mail_type;
}

void Mail_SetType(MAIL *mail, u8 mailType) {
    if (mailType < NUM_MAIL) {
        mail->mail_type = mailType;
    }
}

u8 Mail_GetLanguage(const MAIL *mail) {
    return mail->author_language;
}

u8 Mail_GetVersion(const MAIL *mail) {
    return mail->author_version;
}

u16 sub_0202B404(MAIL *mail, u8 r1, u8 r4, u16 r3) {
    int i;
    union MailPatternData sp0;
    if (r1 < NELEMS(mail->mon_icons)) {
        sp0 = mail->mon_icons[r1];
        for (i = 0; i < NELEMS(sFormeOverrides); i++) {
            if (sFormeOverrides[i].base_icon == sp0.icon && sFormeOverrides[i].forme == ((r3 >> (5 * r1)) & 31)) {
                sp0.icon = sFormeOverrides[i].formed_icon;
                sp0.pal = GetMonIconPaletteEx(sFormeOverrides[i].species, sFormeOverrides[i].forme, FALSE);
                break;
            }
        }
        if (sp0.icon > 546) {
            sp0.icon = 7;
            sp0.pal = 0;
        }
        switch (r4) {
        case 0:
            return sp0.icon;
        case 1:
            return sp0.pal;
        case 2:
        default:
            return sp0.raw;
        }
    }

    return 0;
}

u16 sub_0202B4E4(const MAIL *mail) {
    return mail->forme_flags;
}

MAIL_MESSAGE *Mail_GetUnk20Array(MAIL *mail, int i) {
    if (i < NELEMS(mail->unk_20)) {
        return &mail->unk_20[i];
    } else {
        return &mail->unk_20[0];
    }
}

void Mail_SetMessage(MAIL *mail, const MAIL_MESSAGE *src, int i) {
    if (i < NELEMS(mail->unk_20)) {
        MailMsg_copy(&mail->unk_20[i], src);
    }
}

MAILBOX *Sav2_Mailbox_get(SAVEDATA *saveData) {
    return (MAILBOX *)SavArray_get(saveData, SAVE_MAILBOX);
}

u32 Sav2_Mailbox_sizeof(void) {
    return sizeof(MAILBOX);
}

void Sav2_Mailbox_init(MAILBOX *mailbox) {
    int i;
    for (i = 0; i < MAILBOX_MSG_COUNT; i++) {
        Mail_init(&mailbox->msgs[i]);
    }
}

int Mailbox_GetFirstEmptySlotIdx(MAILBOX *mailbox) {
    return MailArray_GetFirstEmptySlotIdx(mailbox->msgs, MAILBOX_MSG_COUNT);
}

void Mailbox_DeleteSlotI(MAIL *msgs, int n, int i) {
    MAIL *mail = Mailbox_GetPtrToSlotI(msgs, n, i);
    if (mail != NULL) {
        Mail_init(mail);
    }
}

void Mailbox_CopyMailToSlotI(MAIL *msgs, int n, int i, const MAIL *src) {
    MAIL *dest = Mailbox_GetPtrToSlotI(msgs, n, i);
    if (dest != NULL) {
        Mail_copy(src, dest);
    }
}

u32 Mailbox_CountMessages(MAILBOX *mailbox, int unused) {
    return MailArray_CountMessages(mailbox->msgs, MAILBOX_MSG_COUNT);
}

MAIL *Mailbox_AllocAndFetchMailI(MAIL *msgs, int n, int i, HeapID heapId) {
    const MAIL *src = Mailbox_GetPtrToSlotI(msgs, n, i);
    MAIL *ret = Mail_new(heapId);
    if (src != NULL) {
        Mail_copy(src, ret);
    }
    return ret;
}

void Mailbox_FetchMailToBuffer(MAIL *msgs, int n, int i, MAIL *dest) {
    const MAIL *src = Mailbox_GetPtrToSlotI(msgs, n, i);
    if (src == NULL) {
        Mail_init(dest);
    } else {
        Mail_copy(src, dest);
    }
}

int MailArray_GetFirstEmptySlotIdx(MAIL *msgs, int n) {
    int i;
    for (i = 0; i < n; i++) {
        if (!Mail_TypeIsValid(&msgs[i])) {
            return i;
        }
    }
    return -1;
}

u32 MailArray_CountMessages(MAIL *msgs, int n) {
    int i;
    u32 ct = 0;
    for (i = 0; i < n; i++) {
        if (Mail_TypeIsValid(&msgs[i])) {
            ct++;
        }
    }

    return ct;
}

MAIL *Mailbox_GetPtrToSlotI(MAIL *msgs, int n, int i) {
#pragma unused(n)
    if (i < MAILBOX_MSG_COUNT) {
        return &msgs[i];
    } else {
        return NULL;
    }
}
