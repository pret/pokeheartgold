#ifndef POKEHEARTGOLD_OVERLAY_03_H
#define POKEHEARTGOLD_OVERLAY_03_H

#include "script.h"

enum PokeathlonData {
    OVERALL_DATA,
    EVENT_DATA,
    ACTION_DATA
};

void ov03_02255BB0(FieldSystem *fieldSystem, u16 a1, u16 a2, u16 a3);
int ov03_02255BFC(void);
void ov03_02255C18(FieldSystem *fieldSystem, u16 a1, u16 a2, u16 a3);
int ov03_02255C64(void);
void ov03_022566B0(TaskManager *taskManager, u16 *p_var);
void ov03_022566D0(FieldSystem *fieldSystem, MessageFormat *msgFmt, u16 ruleset);
u16 ov03_02256A2C(FieldSystem *fieldSystem, MessageFormat *msgFmt, u16 a2);
void ov03_02256710(FieldSystem *fieldSystem, u16 a1);
void ov03_02258910(FieldSystem *fieldSystem);
void ov03_02258CFC(TaskManager *taskManager, enum PokeathlonData data);
u32 ov03_02256B40(int);

#endif // POKEHEARTGOLD_OVERLAY_03_H
