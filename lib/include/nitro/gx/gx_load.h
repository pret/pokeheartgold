#ifndef NITRO_GX_GX_LOAD_H_
#define NITRO_GX_GX_LOAD_H_

void GX_LoadBG0Scr(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadBG1Scr(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadBG2Scr(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadBG3Scr(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBG0Scr(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBG1Scr(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBG2Scr(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBG3Scr(const void *pSrc, u32 offset, u32 szByte);

void GX_LoadBG0Char(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadBG1Char(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadBG2Char(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadBG3Char(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBG0Char(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBG1Char(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBG2Char(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBG3Char(const void *pSrc, u32 offset, u32 szByte);

void GX_LoadBGPltt(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBGPltt(const void *pSrc, u32 offset, u32 szByte);

#endif //NITRO_GX_GX_LOAD_H_
