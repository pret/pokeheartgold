#include "mac_owner.h"

// Functions to be encrypted (cannot be called directly)
u32 MACOwner_IsBad(void);
u32 MACOwner_IsGood(void);

static const u8 bad_mac_addr[6] = {
    // 00:09:BF:00:00:31 after bit flipping
    0xFF, 0xF6, 0x40, 0xFF, 0xFF, 0xCE
};

#define MAC_ADDR_SIZE  (6)


u32 MACOwner_IsBad(void) {
    u8 mac_addr[MAC_ADDR_SIZE];
    OS_GetMacAddress(&mac_addr[0]);

    s32 i;
    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (bad_mac_addr[i] != (mac_addr[i] ^ 0xFF)) {
            break;
        }
    }

    OSOwnerInfo owner_info;
    OS_GetOwnerInfo(&owner_info);
    if (i == MAC_ADDR_SIZE && owner_info.birthday.month == 1 && owner_info.birthday.day == 1 && owner_info.nickNameLength == 0) {
        return 1;
    }

    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (mac_addr[i] != 0x00) {
            return 0;
        }
    }

    return 1;
}


u32 MACOwner_IsGood(void) {
    u8 mac_addr[MAC_ADDR_SIZE];
    OS_GetMacAddress(&mac_addr[0]);

    s32 i;
    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (bad_mac_addr[i] != (mac_addr[i] ^ 0xFF)) {
            break;
        }
    }

    OSOwnerInfo owner_info;
    OS_GetOwnerInfo(&owner_info);
    if (i == MAC_ADDR_SIZE && owner_info.birthday.month == 1 && owner_info.birthday.day == 1 && owner_info.nickNameLength == 0) {
        return 0;
    }

    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (mac_addr[i] != 0x00) {
            return 1;
        }
    }

    return 0;
}
