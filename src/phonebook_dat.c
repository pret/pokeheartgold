#include "phonebook_dat.h"

#include "global.h"

#include "constants/phone_contacts.h"

#include "msgdata/msg.naix"

#include "gear_phone.h"

struct PhoneBook *AllocAndReadPhoneBook(enum HeapID heapID) {
    FSFile file;
    struct PhoneBook *ret;
    u32 flen;

    FS_InitFile(&file);
    if (!FS_OpenFile(&file, "tel/pmtel_book.dat")) {
        GF_ASSERT(FALSE);
        return NULL;
    }

    // This is a waste of space
    // (flen - 4) bytes is allocated twice
    flen = FS_GetLength(&file);
    ret = Heap_Alloc(heapID, flen);
    MI_CpuClear8(ret, flen);

    FS_ReadFile(&file, &ret->count, sizeof(ret->count));
    ret->entries = Heap_Alloc(heapID, ret->count * sizeof(struct PhoneBookEntry));
    FS_ReadFile(&file, ret->entries, ret->count * sizeof(struct PhoneBookEntry));
    FS_CloseFile(&file);
    return ret;
}

void FreePhoneBook(struct PhoneBook *phoneBook) {
    MI_CpuClear8(phoneBook->entries, phoneBook->count * sizeof(struct PhoneBookEntry));
    Heap_Free(phoneBook->entries);

    MI_CpuClear8(phoneBook, sizeof(struct PhoneBook));
    Heap_Free(phoneBook);
}

u8 LoadPhoneBookEntryI(u16 idx, struct PhoneBookEntry *dest, enum HeapID heapID) {
    struct PhoneBook *phoneBook = AllocAndReadPhoneBook(heapID);
    int i;

    for (i = 0; i < phoneBook->count; i++) {
        if (idx == phoneBook->entries[i].trainerId) {
            MI_CpuCopy8(&phoneBook->entries[i], dest, sizeof(struct PhoneBookEntry));
            FreePhoneBook(phoneBook);
            return dest->id;
        }
    }
    FreePhoneBook(phoneBook);
    MI_CpuClear8(dest, sizeof(struct PhoneBookEntry));
    dest->id = PHONE_CONTACT_NONE;
    return 0xFF;
}

static const u16 sPhoneMessageGmm[] = {
    msg_0664, // PHONE_CONTACT_MOTHER
    msg_0716, // PHONE_CONTACT_PROF__ELM
    msg_0666, // PHONE_CONTACT_PROF__OAK
    msg_0662, // PHONE_CONTACT_ETHAN
    msg_0663, // PHONE_CONTACT_LYRA
    msg_0643, // PHONE_CONTACT_KURT
    msg_0661, // PHONE_CONTACT_DAY_C_MAN
    msg_0660, // PHONE_CONTACT_DAY_C_LADY
    msg_0641, // PHONE_CONTACT_BUENA
    msg_0665, // PHONE_CONTACT_BILL
    msg_0675, // PHONE_CONTACT_JOEY
    msg_0712, // PHONE_CONTACT_RALPH
    msg_0680, // PHONE_CONTACT_LIZ
    msg_0684, // PHONE_CONTACT_WADE
    msg_0711, // PHONE_CONTACT_ANTHONY
    msg_0642, // PHONE_CONTACT_BIKE_SHOP
    msg_0706, // PHONE_CONTACT_KENJI
    msg_0644, // PHONE_CONTACT_WHITNEY
    msg_0648, // PHONE_CONTACT_FALKNER
    msg_0704, // PHONE_CONTACT_JACK
    msg_0685, // PHONE_CONTACT_CHAD
    msg_0688, // PHONE_CONTACT_BRENT
    msg_0713, // PHONE_CONTACT_TODD
    msg_0714, // PHONE_CONTACT_ARNIE
    msg_0667, // PHONE_CONTACT_BAOBA
    msg_0691, // PHONE_CONTACT_IRWIN
    msg_0645, // PHONE_CONTACT_JANINE
    msg_0649, // PHONE_CONTACT_CLAIR
    msg_0646, // PHONE_CONTACT_ERIKA
    msg_0650, // PHONE_CONTACT_MISTY
    msg_0651, // PHONE_CONTACT_BLAINE
    msg_0647, // PHONE_CONTACT_BLUE
    msg_0656, // PHONE_CONTACT_CHUCK
    msg_0657, // PHONE_CONTACT_BROCK
    msg_0658, // PHONE_CONTACT_BUGSY
    msg_0655, // PHONE_CONTACT_SABRINA
    msg_0652, // PHONE_CONTACT_LT__SURGE
    msg_0653, // PHONE_CONTACT_MORTY
    msg_0654, // PHONE_CONTACT_JASMINE
    msg_0659, // PHONE_CONTACT_PRYCE
    msg_0674, // PHONE_CONTACT_HUEY
    msg_0705, // PHONE_CONTACT_GAVEN
    msg_0677, // PHONE_CONTACT_JAMIE
    msg_0698, // PHONE_CONTACT_REENA
    msg_0696, // PHONE_CONTACT_VANCE
    msg_0708, // PHONE_CONTACT_PARRY
    msg_0672, // PHONE_CONTACT_ERIN
    msg_0690, // PHONE_CONTACT_BEVERLY
    msg_0671, // PHONE_CONTACT_JOSE
    msg_0695, // PHONE_CONTACT_GINA
    msg_0689, // PHONE_CONTACT_ALAN
    msg_0700, // PHONE_CONTACT_DANA
    msg_0693, // PHONE_CONTACT_DEREK
    msg_0694, // PHONE_CONTACT_TULLY
    msg_0669, // PHONE_CONTACT_TIFFANY
    msg_0676, // PHONE_CONTACT_WILTON
    msg_0715, // PHONE_CONTACT_KRISE
    msg_0703, // PHONE_CONTACT_IAN
    msg_0710, // PHONE_CONTACT_WALT
    msg_0670, // PHONE_CONTACT_ALFRED
    msg_0692, // PHONE_CONTACT_DOUG
    msg_0681, // PHONE_CONTACT_ROB
    msg_0697, // PHONE_CONTACT_KYLE
    msg_0687, // PHONE_CONTACT_KYLER
    msg_0702, // PHONE_CONTACT_TIM_AND_SUE
    msg_0699, // PHONE_CONTACT_KENNY
    msg_0707, // PHONE_CONTACT_TANNER
    msg_0682, // PHONE_CONTACT_JOSH
    msg_0673, // PHONE_CONTACT_TORIN
    msg_0686, // PHONE_CONTACT_HILLARY
    msg_0683, // PHONE_CONTACT_BILLY
    msg_0679, // PHONE_CONTACT_KAY_AND_TIA
    msg_0701, // PHONE_CONTACT_REESE
    msg_0709, // PHONE_CONTACT_AIDEN
    msg_0678, // PHONE_CONTACT_ERNEST
};

int GetPhoneMessageGmm(int idx) {
    return sPhoneMessageGmm[idx];
}

BOOL sub_02095FF8(int x) {
    return (x % 3) == 2;
}
