#ifndef NITRO_GX_GX_LOAD_H_
#define NITRO_GX_GX_LOAD_H_

#include <nitro/types.h>

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

void GX_BeginLoadBGExtPltt(void);
void GX_EndLoadBGExtPltt(void);
void GXS_BeginLoadBGExtPltt(void);
void GXS_EndLoadBGExtPltt(void);
void GX_BeginLoadOBJExtPltt(void);
void GX_EndLoadOBJExtPltt(void);
void GXS_BeginLoadOBJExtPltt(void);
void GXS_EndLoadOBJExtPltt(void);

void GX_LoadBGPltt(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadOBJPltt(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadBGExtPltt(const void *pSrc, u32 offset, u32 szByte);
void GX_LoadOBJExtPltt(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBGPltt(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadOBJPltt(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadBGExtPltt(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadOBJExtPltt(const void *pSrc, u32 offset, u32 szByte);

void GX_LoadOBJ(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadOBJ(const void *pSrc, u32 offset, u32 szByte);

void GX_LoadOAM(const void *pSrc, u32 offset, u32 szByte);
void GXS_LoadOAM(const void *pSrc, u32 offset, u32 szByte);

#endif // NITRO_GX_GX_LOAD_H_
