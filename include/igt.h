#ifndef POKEHEARTGOLD_IGT_H
#define POKEHEARTGOLD_IGT_H

#include "global.h"

typedef struct IGT {
    u16 hours;
    u8 minutes;
    u8 seconds;
} IGT;

void InitIGT(IGT *igt);
void AddIGTSeconds(IGT *igt, u32 seconds_to_add);
u16 GetIGTHours(IGT *igt);
u8 GetIGTMinutes(IGT *igt);
u8 GetIGTSeconds(IGT *igt);

#endif
