#ifndef POKEHEARTGOLD_SPL_TEXTURE_H
#define POKEHEARTGOLD_SPL_TEXTURE_H

typedef union {
    u32 all;
    struct {
        u32 fmt : 4;
        u32 s : 4;
        u32 t : 4;
        u32 rep : 2;
        u32 flp : 2;
        u32 plt0 : 1;
        u32 overlaped : 1;
        u32 sharedTexNo : 8;
        u32 reserved0 : 6;
    };
} SPLTexParam;

typedef struct SPLTexture {
    const void *p_obj;
    u32 tex_addr;
    u32 plt_addr;
    SPLTexParam tex_param;
    u16 wdt;
    u16 hgt;
} SPLTexture;

#endif // POKEHEARTGOLD_SPL_TEXTURE_H
