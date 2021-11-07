#ifndef POKEHEARTGOLD_SAVE_H
#define POKEHEARTGOLD_SAVE_H

typedef struct SaveBlock2 SAVEDATA;

void *SavArray_get(SAVEDATA *save, int idx);
const void *SavArray_const_get(const SAVEDATA *save, int idx);

#endif //POKEHEARTGOLD_SAVE_H
