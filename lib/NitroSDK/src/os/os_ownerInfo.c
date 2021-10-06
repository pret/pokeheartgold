#include <nitro.h>

void OS_GetMacAddress(u8 *macAddr) {
    MI_CpuCopy8(OS_GetSystemWork()->nvramUserInfo + ((sizeof(NVRAMConfig) + 3) & ~3), macAddr, 6);
}

void OS_GetOwnerInfo(OSOwnerInfo *info) {
    NVRAMConfig *src = (NVRAMConfig *)OS_GetSystemWork()->nvramUserInfo;
    info->language = src->ncd.option.language;
    info->favoriteColor = src->ncd.owner.favouriteColour;
    info->birthday.month = src->ncd.owner.birthday.month;
    info->birthday.day = src->ncd.owner.birthday.day;
    info->nickNameLength = src->ncd.owner.nickname.length;
    info->commentLength = src->ncd.owner.comment.length;
    MI_CpuCopy16(src->ncd.owner.nickname.str, info->nickName, 20);
    MI_CpuCopy16(src->ncd.owner.comment.str, info->comment, 52);
    info->nickName[10] = 0;
    info->comment[26] = 0;
}

s64 OS_GetOwnerRtcOffset(void) {
    NVRAMConfig *cfg = (NVRAMConfig *)OS_GetSystemWork()->nvramUserInfo;
    return cfg->ncd.option.rtcOffset;
}
