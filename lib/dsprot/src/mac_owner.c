#include "mac_owner.h"

#include "nitro_os.h"

// Functions to be encrypted (cannot be called directly)
u32 MACOwner_IsBad(void);
u32 MACOwner_IsGood(void);

#define MAC_ADDR_SIZE (6)

#define ENC_MAC_ADDR_BYTE (0xFF)

static const u8 bad_mac_addr[MAC_ADDR_SIZE] = {
    0x00 ^ ENC_MAC_ADDR_BYTE,
    0x09 ^ ENC_MAC_ADDR_BYTE,
    0xBF ^ ENC_MAC_ADDR_BYTE,
    0x00 ^ ENC_MAC_ADDR_BYTE,
    0x00 ^ ENC_MAC_ADDR_BYTE,
    0x31 ^ ENC_MAC_ADDR_BYTE
};

u32 MACOwner_IsBad(void) {
    s32 i;

    u8 mac_addr[MAC_ADDR_SIZE];
    OS_GetMacAddress(&mac_addr[0]);
    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (bad_mac_addr[i] != (mac_addr[i] ^ ENC_MAC_ADDR_BYTE)) {
            break;
        }
    }

    OSOwnerInfo owner_info;
    OS_GetOwnerInfo(&owner_info);
    u32 ret;
    if (i == MAC_ADDR_SIZE && owner_info.birthday.month == 1 && owner_info.birthday.day == 1 && owner_info.nickNameLength == 0) {
        ret = 1;
        goto EXIT;
    }

    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (mac_addr[i] != 0x00) {
            ret = 0;
            goto EXIT;
        }
    }

    ret = 1;

EXIT:
    return ret;
}

u32 MACOwner_IsGood(void) {
    s32 i;

    u8 mac_addr[MAC_ADDR_SIZE];
    OS_GetMacAddress(&mac_addr[0]);
    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (bad_mac_addr[i] != (mac_addr[i] ^ ENC_MAC_ADDR_BYTE)) {
            break;
        }
    }

    OSOwnerInfo owner_info;
    OS_GetOwnerInfo(&owner_info);
    u32 ret;
    if (i == MAC_ADDR_SIZE && owner_info.birthday.month == 1 && owner_info.birthday.day == 1 && owner_info.nickNameLength == 0) {
        ret = 0;
        goto EXIT;
    }

    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (mac_addr[i] != 0x00) {
            ret = 1;
            goto EXIT;
        }
    }

    ret = 0;

EXIT:
    return ret;
}
