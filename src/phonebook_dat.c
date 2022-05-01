#include "gear_phone.h"
#include "msgdata/msg.naix"
#include "phonebook_dat.h"

struct PhoneBook *AllocAndReadPhoneBook(HeapID heapId) {
    FSFile file;
    struct PhoneBook *ret;
    u32 flen;

    FS_InitFile(&file);
    if (!FS_OpenFile(&file, "tel/pmtel_book.dat")) {
        GF_ASSERT(0);
        return NULL;
    }

    // This is a waste of space
    // (flen - 4) bytes is allocated twice
    flen = FS_GetLength(&file);
    ret = AllocFromHeap(heapId, flen);
    MI_CpuClear8(ret, flen);

    FS_ReadFile(&file, &ret->count, sizeof(ret->count));
    ret->entries = AllocFromHeap(heapId, ret->count * sizeof(struct PhoneBookEntry));
    FS_ReadFile(&file, ret->entries, ret->count * sizeof(struct PhoneBookEntry));
    FS_CloseFile(&file);
    return ret;
}

void FreePhoneBook(struct PhoneBook *phoneBook) {
    MI_CpuClear8(phoneBook->entries, phoneBook->count * sizeof(struct PhoneBookEntry));
    FreeToHeap(phoneBook->entries);

    MI_CpuClear8(phoneBook, sizeof(struct PhoneBook));
    FreeToHeap(phoneBook);
}

u8 LoadPhoneBookEntryI(u16 idx, struct PhoneBookEntry *dest, HeapID heapId) {
    struct PhoneBook *phoneBook = AllocAndReadPhoneBook(heapId);
    int i;

    for (i = 0; i < phoneBook->count; i++) {
        if (idx == phoneBook->entries[i].trainerId) {
            MI_CpuCopy8(&phoneBook->entries[i], dest, sizeof(struct PhoneBookEntry));
            FreePhoneBook(phoneBook);
            return dest->unk0;
        }
    }
    FreePhoneBook(phoneBook);
    MI_CpuClear8(dest, sizeof(struct PhoneBookEntry));
    dest->unk0 = 0xFF;
    return 0xFF;
}

static const u16 sPhoneMessageGmm[] = {
    NARC_msg_msg_0664_bin, //PHONE_CONTACT_MOTHER
    NARC_msg_msg_0716_bin, //PHONE_CONTACT_PROF__ELM
    NARC_msg_msg_0666_bin, //PHONE_CONTACT_PROF__OAK
    NARC_msg_msg_0662_bin, //PHONE_CONTACT_ETHAN
    NARC_msg_msg_0663_bin, //PHONE_CONTACT_LYRA
    NARC_msg_msg_0643_bin, //PHONE_CONTACT_KURT
    NARC_msg_msg_0661_bin, //PHONE_CONTACT_DAY_C_MAN
    NARC_msg_msg_0660_bin, //PHONE_CONTACT_DAY_C_LADY
    NARC_msg_msg_0641_bin, //PHONE_CONTACT_BUENA
    NARC_msg_msg_0665_bin, //PHONE_CONTACT_BILL
    NARC_msg_msg_0675_bin, //PHONE_CONTACT_JOEY
    NARC_msg_msg_0712_bin, //PHONE_CONTACT_RALPH
    NARC_msg_msg_0680_bin, //PHONE_CONTACT_LIZ
    NARC_msg_msg_0684_bin, //PHONE_CONTACT_WADE
    NARC_msg_msg_0711_bin, //PHONE_CONTACT_ANTHONY
    NARC_msg_msg_0642_bin, //PHONE_CONTACT_BIKE_SHOP
    NARC_msg_msg_0706_bin, //PHONE_CONTACT_KENJI
    NARC_msg_msg_0644_bin, //PHONE_CONTACT_WHITNEY
    NARC_msg_msg_0648_bin, //PHONE_CONTACT_FALKNER
    NARC_msg_msg_0704_bin, //PHONE_CONTACT_JACK
    NARC_msg_msg_0685_bin, //PHONE_CONTACT_CHAD
    NARC_msg_msg_0688_bin, //PHONE_CONTACT_BRENT
    NARC_msg_msg_0713_bin, //PHONE_CONTACT_TODD
    NARC_msg_msg_0714_bin, //PHONE_CONTACT_ARNIE
    NARC_msg_msg_0667_bin, //PHONE_CONTACT_BAOBA
    NARC_msg_msg_0691_bin, //PHONE_CONTACT_IRWIN
    NARC_msg_msg_0645_bin, //PHONE_CONTACT_JANINE
    NARC_msg_msg_0649_bin, //PHONE_CONTACT_CLAIR
    NARC_msg_msg_0646_bin, //PHONE_CONTACT_ERIKA
    NARC_msg_msg_0650_bin, //PHONE_CONTACT_MISTY
    NARC_msg_msg_0651_bin, //PHONE_CONTACT_BLAINE
    NARC_msg_msg_0647_bin, //PHONE_CONTACT_BLUE
    NARC_msg_msg_0656_bin, //PHONE_CONTACT_CHUCK
    NARC_msg_msg_0657_bin, //PHONE_CONTACT_BROCK
    NARC_msg_msg_0658_bin, //PHONE_CONTACT_BUGSY
    NARC_msg_msg_0655_bin, //PHONE_CONTACT_SABRINA
    NARC_msg_msg_0652_bin, //PHONE_CONTACT_LT__SURGE
    NARC_msg_msg_0653_bin, //PHONE_CONTACT_MORTY
    NARC_msg_msg_0654_bin, //PHONE_CONTACT_JASMINE
    NARC_msg_msg_0659_bin, //PHONE_CONTACT_PRYCE
    NARC_msg_msg_0674_bin, //PHONE_CONTACT_HUEY
    NARC_msg_msg_0705_bin, //PHONE_CONTACT_GAVEN
    NARC_msg_msg_0677_bin, //PHONE_CONTACT_JAMIE
    NARC_msg_msg_0698_bin, //PHONE_CONTACT_REENA
    NARC_msg_msg_0696_bin, //PHONE_CONTACT_VANCE
    NARC_msg_msg_0708_bin, //PHONE_CONTACT_PARRY
    NARC_msg_msg_0672_bin, //PHONE_CONTACT_ERIN
    NARC_msg_msg_0690_bin, //PHONE_CONTACT_BEVERLY
    NARC_msg_msg_0671_bin, //PHONE_CONTACT_JOSE
    NARC_msg_msg_0695_bin, //PHONE_CONTACT_GINA
    NARC_msg_msg_0689_bin, //PHONE_CONTACT_ALAN
    NARC_msg_msg_0700_bin, //PHONE_CONTACT_DANA
    NARC_msg_msg_0693_bin, //PHONE_CONTACT_DEREK
    NARC_msg_msg_0694_bin, //PHONE_CONTACT_TULLY
    NARC_msg_msg_0669_bin, //PHONE_CONTACT_TIFFANY
    NARC_msg_msg_0676_bin, //PHONE_CONTACT_WILTON
    NARC_msg_msg_0715_bin, //PHONE_CONTACT_KRISE
    NARC_msg_msg_0703_bin, //PHONE_CONTACT_IAN
    NARC_msg_msg_0710_bin, //PHONE_CONTACT_WALT
    NARC_msg_msg_0670_bin, //PHONE_CONTACT_ALFRED
    NARC_msg_msg_0692_bin, //PHONE_CONTACT_DOUG
    NARC_msg_msg_0681_bin, //PHONE_CONTACT_ROB
    NARC_msg_msg_0697_bin, //PHONE_CONTACT_KYLE
    NARC_msg_msg_0687_bin, //PHONE_CONTACT_KYLER
    NARC_msg_msg_0702_bin, //PHONE_CONTACT_TIM_AND_SUE
    NARC_msg_msg_0699_bin, //PHONE_CONTACT_KENNY
    NARC_msg_msg_0707_bin, //PHONE_CONTACT_TANNER
    NARC_msg_msg_0682_bin, //PHONE_CONTACT_JOSH
    NARC_msg_msg_0673_bin, //PHONE_CONTACT_TORIN
    NARC_msg_msg_0686_bin, //PHONE_CONTACT_HILLARY
    NARC_msg_msg_0683_bin, //PHONE_CONTACT_BILLY
    NARC_msg_msg_0679_bin, //PHONE_CONTACT_KAY_AND_TIA
    NARC_msg_msg_0701_bin, //PHONE_CONTACT_REESE
    NARC_msg_msg_0709_bin, //PHONE_CONTACT_AIDEN
    NARC_msg_msg_0678_bin, //PHONE_CONTACT_ERNEST
};

int GetPhoneMessageGmm(int idx) {
    return sPhoneMessageGmm[idx];
}

BOOL sub_02095FF8(int x) {
    return (x % 3) == 2;
}
