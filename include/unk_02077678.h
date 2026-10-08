#ifndef POKEHEARTGOLD_UNK_02077678_H
#define POKEHEARTGOLD_UNK_02077678_H

#include "sprite_system.h"

int GetTypeIconGfxCharFileId(int moveType);
int GetTypeIconGfxPlttOverride(u16 moveType);
NarcId GetTypeIconGfxNarcId(void);
void SpriteSystem_LoadMoveTypeAndCategoryIconsPlttToBuffer(PaletteData *paletteData, PaletteBufferId bufferId, SpriteSystem *spriteSystem, SpriteManager *spriteManager, int vram, int plttTag);
void SpriteSystem_LoadMoveTypeAndCategoryIconsCellAndAnim(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int cellTag, int animTag);
void SpriteSystem_LoadMoveTypeIconCharResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NNS_G2D_VRAM_TYPE vramType, int type, int resId); // load type icon graphics?
void SpriteSystem_LoadMoveTypeAndCategoryIconsPltt(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int vram, int resId);
void SpriteSystem_LoadMoveCategoryIconCharResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NNS_G2D_VRAM_TYPE vramType, int type, int resId); // load type icon graphics?
void SpriteManager_UnloadMoveTypeIconCharResObjByTag(SpriteManager *spriteManager, int a1);
void SpriteManager_UnloadMoveTypeAndCategoryIconPlttResObjByTag(SpriteManager *spriteManager, int a1);
void SpriteManager_UnloadMoveTypeAndCategoryIconCellAndAnimResObjsByTags(SpriteManager *spriteManager, int a1, int a2);
ManagedSprite *SpriteSystem_CreateMoveTypeIconSprite(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int type, ManagedSpriteTemplate *spriteTemplate);
void MoveTypeIconSprite_DeleteAndFreeResources(ManagedSprite *managedSprite);
NarcId GetMoveCategoryIconGfxNarcId(void);
int GetMoveCategoryIconGfxCharFileId(u16 moveCategory);
int GetMoveCategoryIconGfxPlttOverride(u16 moveCategory);
void MoveCategoryIconSprite_DeleteAndFreeResources(ManagedSprite *managedSprite);
void SpriteManager_UnloadMoveCategoryIconCharResObjByTag(SpriteManager *spriteManager, int a1);

#endif // POKEHEARTGOLD_UNK_02077678_H
