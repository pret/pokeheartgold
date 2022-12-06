#ifndef POKEHEARTGOLD_UNK_0203DE74_H
#define POKEHEARTGOLD_UNK_0203DE74_H

#include "overlay_manager.h"
#include "script.h"

typedef struct Unk_0203E15C {
    u8 unk0[6];
    u16 unk6;
    u16 unk8;
    u16 unkA;
} Unk_0203E15C;

BOOL Field_Continue_AppInit(OVY_MANAGER *man, int *unused);
BOOL Field_NewGame_AppInit(OVY_MANAGER *man, int *unused);
BOOL Field_AppExec(OVY_MANAGER *man, int *unused);
BOOL Field_AppExit(OVY_MANAGER *man, int *unused);
void sub_0203DEF0(FieldSystem *fsys);
void sub_0203DF34(FieldSystem *fsys);
u8 sub_0203DF3C(FieldSystem *fsys);
void sub_0203DF64(FieldSystem *fsys, int a1);
BOOL sub_0203DF7C(FieldSystem *fsys);
BOOL sub_0203DF8C(FieldSystem *fsys);
BOOL sub_0203DFA4(FieldSystem *fsys);
void Fsys_LaunchApplication(FieldSystem *fsys, const OVY_MGR_TEMPLATE *template, void *parentWork);
FieldSystem *FieldSystem_new(OVY_MANAGER *man);
void FieldSystem_delete(OVY_MANAGER *man);
BOOL sub_0203E13C(FieldSystem *fsys);
void sub_0203E15C(FieldSystem *fsys);
void sub_0203E2F4();
void sub_0203E30C();
int sub_0203E324();
void sub_0203E33C(FieldSystem *fsys, int a1);
BGCONFIG *Fsys_GetBgConfigPtr(FieldSystem *fsys);
SAVEDATA *Fsys_GetSaveDataPtr(FieldSystem *fsys);
void sub_0203E348();
void sub_0203E354();

extern const OVY_MGR_TEMPLATE gApplication_NewGameFieldsys;
extern const OVY_MGR_TEMPLATE gApplication_ContinueFieldsys;

#endif //POKEHEARTGOLD_UNK_0203DE74_H
