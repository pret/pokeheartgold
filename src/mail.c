#include "global.h"
#include "mail.h"
#include "string_util.h"
#include "mail_message.h"
#include "party.h"
#include "player_data.h"
#include "pokemon.h"
#include "pokemon_icon_idx.h"
#include "constants/mail.h"
#include "constants/easy_chat.h"

#include "msgdata/msg/msg_0294.h"
#include "msgdata/msg/msg_0296.h"
#include "msgdata/msg/msg_0292.h"
#include "msgdata/msg/msg_0293.h"
#include "msgdata/msg/msg_0295.h"

struct UnkStruct_020F67A4 {
    u16 base_icon;
    u16 formed_icon;
    u16 species;
    u8 form;
    u8 dummy;
};

static const struct UnkStruct_020F67A4 sFormOverrides[] = {
    { 0x1EE, 0x21C, SPECIES_GIRATINA, GIRATINA_ORIGIN },
    { 0x1F3, 0x21D, SPECIES_SHAYMIN, SHAYMIN_SKY },
    { 0x1E6, 0x21E, SPECIES_ROTOM, ROTOM_HEAT },
    { 0x1E6, 0x21F, SPECIES_ROTOM, ROTOM_WASH },
    { 0x1E6, 0x220, SPECIES_ROTOM, ROTOM_FROST },
    { 0x1E6, 0x221, SPECIES_ROTOM, ROTOM_FAN },
    { 0x1E6, 0x222, SPECIES_ROTOM, ROTOM_MOW },
};

int MailArray_GetFirstEmptySlotIdx(Mail* msgs, int nmsg);
Mail* Mailbox_GetPtrToSlotI(Mail *msgs, int n, int i);
u32 MailArray_CountMessages(Mail *msgs, int n);

void Mail_Init(Mail *mail) {
    int i;
    mail->author_otId = 0;
    mail->author_gender = PLAYER_GENDER_MALE;
    mail->author_language = gGameLanguage;
    mail->author_version = gGameVersion;
    mail->mail_type = MAIL_NONE;
    StringFillEOS(mail->author_name, PLAYER_NAME_LENGTH + 1);
    for (i = 0; i < 3; i++) {
        mail->mon_icons[i].raw = 0xFFFF;
    }
    mail->form_flags = 0;
    for (i = 0; i < 3; i++) {
        MailMsg_Init(&mail->unk_20[i]);
    }
}

BOOL Mail_TypeIsValid(Mail *mail) {
    return mail->mail_type <= NUM_MAIL - 1;
}

Mail *Mail_New(HeapID heapId) {
    Mail *ret = (Mail *)AllocFromHeapAtEnd(heapId, sizeof(Mail));
    Mail_Init(ret);
    return ret;
}

void Mail_Copy(const Mail *src, Mail *dst) {
    MI_CpuCopy8(src, dst, sizeof(Mail));
}

BOOL Mail_Compare(const Mail *a, const Mail *b) {
    int i;
    if (a->author_otId != b->author_otId
    || a->author_gender != b->author_gender
    || a->author_language != b->author_language
    || a->author_version != b->author_version
    || a->mail_type != b->mail_type
    || a->form_flags != b->form_flags) {
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
        if (!MailMsg_Compare(&a->unk_20[i], &b->unk_20[i])) {
            return FALSE;
        }
    }

    return TRUE;
}

void Mail_SetNewMessageDetails(Mail *mail, u8 mailType, u8 mon_no, SaveData *saveData) {
    u8 i, j, pal, k;
    u16 species;
    u32 icon, isEgg, form;
    PlayerProfile *profile;
    Party *party;
    Pokemon *mon;

    Mail_Init(mail);
    mail->mail_type = mailType;

    party = SaveArray_Party_Get(saveData);
    profile = Save_PlayerData_GetProfileAddr(saveData);

    CopyU16StringArray(mail->author_name, PlayerProfile_GetNamePtr(profile));
    mail->author_gender = PlayerProfile_GetTrainerGender(profile);
    mail->author_otId = PlayerProfile_GetTrainerID(profile);

    // Get the Pokemon icon data
    mail->form_flags = 0;
    for (i = mon_no, j = 0; i < Party_GetCount(party); i++) {
        mon = Party_GetMonByIndex(party, i);
        species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        isEgg = GetMonData(mon, MON_DATA_IS_EGG, NULL);
        form = GetMonData(mon, MON_DATA_FORM, NULL);
        icon = Pokemon_GetIconNaix(mon);
        pal = GetMonIconPaletteEx(species, form, isEgg);

        mail->mon_icons[j].icon = icon;
        mail->mon_icons[j].pal = pal;
        // Normal form conversion for icons added in Platinum or later.
        // Form numbers are saved to this buffer.
        for (k = 0; k < NELEMS(sFormOverrides); k++) {
            if (sFormOverrides[k].formed_icon == mail->mon_icons[j].icon && sFormOverrides[k].form == form) {
                mail->mon_icons[j].icon = sFormOverrides[k].base_icon;
                mail->mon_icons[j].pal = GetMonIconPaletteEx(species, 0, isEgg);
                mail->form_flags |= sFormOverrides[k].form << (j * 5);
                break;
            }
        }

        j++;
        if (j >= 3) {
            break;
        }
    }
}

Mail *CreateKenyaMail(Pokemon *mon, u8 mailType, u8 gender, String *name, u8 otId) {
    u8 r0;
    u32 r5;
    u16 species;
    u32 isEgg, form;
    Mail *ret = Mail_New(HEAP_ID_3);
    Mail_Init(ret);
    ret->mail_type = mailType;
    CopyStringToU16Array(name, ret->author_name, PLAYER_NAME_LENGTH + 1);
    ret->author_gender = gender;
    ret->author_otId = otId;

    // LETTER! Thank you!
    MailMsg_SetMsgBankAndNum(&ret->unk_20[0], 1, msg_0296_00007);
    MailMsg_SetFieldI(&ret->unk_20[0], 0, EC_WORD_LIFESTYLE_LETTER);
    MailMsg_SetFieldI(&ret->unk_20[0], 1, EC_WORD_NULL);

    // ADVENTURE was fun, wasn't it?
    MailMsg_SetMsgBankAndNum(&ret->unk_20[1], 1, msg_0296_00015);
    MailMsg_SetFieldI(&ret->unk_20[1], 0, EC_WORD_LIFESTYLE_ADVENTURE);
    MailMsg_SetFieldI(&ret->unk_20[1], 1, EC_WORD_NULL);

    // ZUBAT was the one thing I wanted to avoid...
    MailMsg_SetMsgBankAndNum(&ret->unk_20[2], 2, msg_0292_00001);
    MailMsg_SetFieldI(&ret->unk_20[2], 0, EC_WORD_POKEMON(SPECIES_ZUBAT));
    MailMsg_SetFieldI(&ret->unk_20[2], 1, EC_WORD_NULL);

    ret->form_flags = 0;

    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    isEgg = GetMonData(mon, MON_DATA_IS_EGG, NULL);
    form = GetMonData(mon, MON_DATA_FORM, NULL);
    r5 = Pokemon_GetIconNaix(mon);
    r0 = GetMonIconPaletteEx(species, form, isEgg);
    ret->mon_icons[0].icon = r5;
    ret->mon_icons[0].pal = r0;

    return ret;
}

u32 Mail_GetOTID(const Mail *mail) {
    return mail->author_otId;
}

u16 *Mail_GetAuthorNamePtr(Mail *mail) {
    return mail->author_name;
}

u8 Mail_GetAuthorGender(const Mail *mail) {
    return mail->author_gender;
}

u8 Mail_GetType(const Mail *mail) {
    return mail->mail_type;
}

void Mail_SetType(Mail *mail, u8 mailType) {
    if (mailType < NUM_MAIL) {
        mail->mail_type = mailType;
    }
}

u8 Mail_GetLanguage(const Mail *mail) {
    return mail->author_language;
}

u8 Mail_GetVersion(const Mail *mail) {
    return mail->author_version;
}

u16 sub_0202B404(Mail *mail, u8 r1, u8 r4, u16 r3) {
    int i;
    union MailPatternData sp0;
    if (r1 < NELEMS(mail->mon_icons)) {
        sp0 = mail->mon_icons[r1];
        for (i = 0; i < NELEMS(sFormOverrides); i++) {
            if (sFormOverrides[i].base_icon == sp0.icon && sFormOverrides[i].form == ((r3 >> (5 * r1)) & 31)) {
                sp0.icon = sFormOverrides[i].formed_icon;
                sp0.pal = GetMonIconPaletteEx(sFormOverrides[i].species, sFormOverrides[i].form, FALSE);
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

u16 sub_0202B4E4(const Mail *mail) {
    return mail->form_flags;
}

MAIL_MESSAGE *Mail_GetUnk20Array(Mail *mail, int i) {
    if (i < NELEMS(mail->unk_20)) {
        return &mail->unk_20[i];
    } else {
        return &mail->unk_20[0];
    }
}

void Mail_SetMessage(Mail *mail, const MAIL_MESSAGE *src, int i) {
    if (i < NELEMS(mail->unk_20)) {
        MailMsg_Copy(&mail->unk_20[i], src);
    }
}

MAILBOX *Save_Mailbox_Get(SaveData *saveData) {
    return (MAILBOX *)SaveArray_Get(saveData, SAVE_MAILBOX);
}

u32 Save_Mailbox_sizeof(void) {
    return sizeof(MAILBOX);
}

void Save_Mailbox_Init(MAILBOX *mailbox) {
    int i;
    for (i = 0; i < MAILBOX_MSG_COUNT; i++) {
        Mail_Init(&mailbox->msgs[i]);
    }
}

int Mailbox_GetFirstEmptySlotIdx(MAILBOX *mailbox) {
    return MailArray_GetFirstEmptySlotIdx(mailbox->msgs, MAILBOX_MSG_COUNT);
}

void Mailbox_DeleteSlotI(Mail *msgs, int n, int i) {
    Mail *mail = Mailbox_GetPtrToSlotI(msgs, n, i);
    if (mail != NULL) {
        Mail_Init(mail);
    }
}

void Mailbox_CopyMailToSlotI(Mail *msgs, int n, int i, const Mail *src) {
    Mail *dest = Mailbox_GetPtrToSlotI(msgs, n, i);
    if (dest != NULL) {
        Mail_Copy(src, dest);
    }
}

u32 Mailbox_CountMessages(MAILBOX *mailbox, int unused) {
    return MailArray_CountMessages(mailbox->msgs, MAILBOX_MSG_COUNT);
}

Mail *Mailbox_AllocAndFetchMailI(Mail *msgs, int n, int i, HeapID heapId) {
    const Mail *src = Mailbox_GetPtrToSlotI(msgs, n, i);
    Mail *ret = Mail_New(heapId);
    if (src != NULL) {
        Mail_Copy(src, ret);
    }
    return ret;
}

void Mailbox_FetchMailToBuffer(Mail *msgs, int n, int i, Mail *dest) {
    const Mail *src = Mailbox_GetPtrToSlotI(msgs, n, i);
    if (src == NULL) {
        Mail_Init(dest);
    } else {
        Mail_Copy(src, dest);
    }
}

int MailArray_GetFirstEmptySlotIdx(Mail *msgs, int n) {
    int i;
    for (i = 0; i < n; i++) {
        if (!Mail_TypeIsValid(&msgs[i])) {
            return i;
        }
    }
    return -1;
}

u32 MailArray_CountMessages(Mail *msgs, int n) {
    int i;
    u32 ct = 0;
    for (i = 0; i < n; i++) {
        if (Mail_TypeIsValid(&msgs[i])) {
            ct++;
        }
    }

    return ct;
}

Mail *Mailbox_GetPtrToSlotI(Mail *msgs, int n, int i) {
#pragma unused(n)
    if (i < MAILBOX_MSG_COUNT) {
        return &msgs[i];
    } else {
        return NULL;
    }
}
