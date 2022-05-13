#ifndef NITRO_MI_BYTEACCESS_H_
#define NITRO_MI_BYTEACCESS_H_

static inline u8 MI_ReadByte(const void *address) {
    return *(u8 *)address;
}

static inline void MI_WriteByte(void *address, u8 value) {
    *(u8 *)address = value;
}
#endif //NITRO_MI_BYTEACCESS_H_
