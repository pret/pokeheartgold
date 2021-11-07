#ifndef POKEHEARTGOLD_CAPSULE_H
#define POKEHEARTGOLD_CAPSULE_H

#include "save.h"

typedef struct SEALCASE SEALCASE;

#define CAPSULE_MIN  1u
#define CAPSULE_MAX 80u

SEALCASE *Sav2_SealCase_get(SAVEDATA *saveData);
int sub_0202CD94(SEALCASE *sealCase, int a1);

#endif //POKEHEARTGOLD_CAPSULE_H
