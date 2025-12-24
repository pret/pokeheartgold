#include "mac_owner.h"

static const u8 badMacAddr[MAC_ADDR_SIZE] = {
    0x00 ^ ENC_MAC_ADDR_BYTE,
    0x09 ^ ENC_MAC_ADDR_BYTE,
    0xBF ^ ENC_MAC_ADDR_BYTE,
    0x00 ^ ENC_MAC_ADDR_BYTE,
    0x00 ^ ENC_MAC_ADDR_BYTE,
    0x31 ^ ENC_MAC_ADDR_BYTE
};

static inline u32 testMACOwner(u32 passRet, u32 failRet) {
    u8 macAddr[MAC_ADDR_SIZE];
    OS_GetMacAddress(&macAddr[0]);

    s32 i;
    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (badMacAddr[i] != (macAddr[i] ^ ENC_MAC_ADDR_BYTE)) {
            break;
        }
    }

    OSOwnerInfo ownerInfo;
    OS_GetOwnerInfo(&ownerInfo);

    u32 ret;
    if (i == MAC_ADDR_SIZE && ownerInfo.birthday.month == 1 && ownerInfo.birthday.day == 1 && ownerInfo.nickNameLength == 0) {
        ret = failRet;
        goto EXIT;
    }

    for (i = 0; i < MAC_ADDR_SIZE; i++) {
        if (macAddr[i] != 0x00) {
            ret = passRet;
            goto EXIT;
        }
    }

    ret = failRet;

EXIT:
    return ret;
}

u32 MACOwner_IsBad(void) {
    return testMACOwner(0, 1);
}

u32 MACOwner_IsGood(void) {
    return testMACOwner(1, 0);
}
