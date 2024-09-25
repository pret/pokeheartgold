#include "battle/battle_hp_bar.h"

void ov12_02264824(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
void ov12_022648EC(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType);
UnkImageStruct *ov12_02264968(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, int barType);
const UnkTemplate_0200D748 *ov12_02265BB8(u8 barType);
const UnkTemplate_0200D748 *ov12_02265C1C(u8 barType);

void ov12_02264824(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType) {
    const UnkTemplate_0200D748 *pRes = ov12_02265BB8(barType);

    SpriteRenderer_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CHAR], TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, pRes->resIdList[GF_GFX_RES_TYPE_CHAR]);
    sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20006);
    SpriteRenderer_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CELL], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_CELL]);
    SpriteRenderer_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_ANIM], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_ANIM]);
    sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20007);
    if (barType == 6 || barType == 7) {
        sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 81, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20008);
    }
}

void ov12_022648EC(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, NARC *narc, PaletteData *plttData, int barType) {
    const UnkTemplate_0200D748 *pRes = ov12_02265C1C(barType);

    if (pRes != NULL) {
        SpriteRenderer_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CHAR], TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, pRes->resIdList[GF_GFX_RES_TYPE_CHAR]);
        sub_0200D68C(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, 71, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 20006);
        SpriteRenderer_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_CELL], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_CELL]);
        SpriteRenderer_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, pRes->resIdList[GF_GFX_RES_TYPE_ANIM], TRUE, pRes->resIdList[GF_GFX_RES_TYPE_ANIM]);
    }
}

UnkImageStruct *ov12_02264968(SpriteRenderer *renderer, SpriteGfxHandler *gfxHandler, int barType) {
    const UnkTemplate_0200D748 *pRes = ov12_02265BB8(barType);

    UnkImageStruct *ret = SpriteRenderer_LoadResourcesAndCreateSprite(renderer, gfxHandler, pRes);
    TickSpriteAnimation1Frame(ret->sprite);
    return ret;
}
