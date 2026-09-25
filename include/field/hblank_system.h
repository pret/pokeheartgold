#ifndef POKEHEARTGOLD_FIELD_HBLANK_SYSTEM_H
#define POKEHEARTGOLD_FIELD_HBLANK_SYSTEM_H

typedef struct HBlankSystem HBlankSystem;

HBlankSystem *HBlankSystem_New(enum HeapID heapID);
void HBlankSystem_Delete(HBlankSystem *hBlankSystem);
void HBlankSystem_Start(HBlankSystem *hBlankSystem);
void HBlankSystem_Stop(HBlankSystem *hBlankSystem);

#endif // POKEHEARTGOLD_FIELD_HBLANK_SYSTEM_H
