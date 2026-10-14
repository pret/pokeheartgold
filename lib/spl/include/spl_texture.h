#ifndef SPL_TEXTURE_H
#define SPL_TEXTURE_H

#include <nitro/types.h>

typedef union SPLTextureParam {
    u32 all;
    struct {
        u32 format : 4; // Maps to GXTexFmt
        u32 s : 4; // Maps to GXTexSizeS
        u32 t : 4; // Maps to GXTexSizeT
        u32 repeat : 2; // Maps to GXTexRepeat
        u32 flip : 2; // Maps to GXTexFlip
        u32 palColor0 : 1; // Maps to GXTexPlttColor0
        u32 useSharedTexture : 1;
        u32 sharedTexID : 8;
        u32 : 6;
    };
} SPLTextureParam;

typedef struct SPLTextureResource {
    u32 id;
    SPLTextureParam param;
    u32 textureSize; // size of the texture data
    u32 paletteOffset; // offset to the palette data from the start of the header
    u32 paletteSize; // size of the palette data
    u32 unused0;
    u32 unused1;
    u32 resourceSize; // total size of the resource (header + data)
} SPLTextureResource;

static inline const void *SPLTextureResource_GetTexData(const SPLTextureResource *resource)
{
    return (const void *)(resource + 1);
}

typedef struct SPLTexture {
    const void *resource;
    u32 texAddr; // VRAM address of the texture
    u32 palAddr; // VRAM address of the palette
    SPLTextureParam param;
    u16 width;
    u16 height;
} SPLTexture;

#endif // SPL_TEXTURE_H
