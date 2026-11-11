// Force global.h first
// clang-format off
#include "global.h"
// clang-format on

#include "unk_02097024.h"

#include "heap.h"
#include "launch_application.h"
#include "unk_02037C94.h"
#include "unk_02096C88.h"

typedef BOOL (*UnkFunc_02108EC0)(UnkStruct_0209707C *);

UnkStruct_02097024 *sub_02097024(const UnkStruct_0209707C_Sub8 *tmplate, enum HeapID heapID);
void sub_02097060(UnkStruct_02097024 *a0);
BOOL sub_02097078(UnkStruct_02097024 *a0);
BOOL sub_020970E4(UnkStruct_0209707C *a0);
BOOL sub_02097108(UnkStruct_0209707C *a0);
BOOL sub_02097148(UnkStruct_0209707C *a0);

extern const UnkFunc_02108EC0 _02108EC0[];
extern const OverlayManagerTemplate _02108EA0;
extern const OverlayManagerTemplate _02108EB0;

UnkStruct_02097024 *sub_02097024(const UnkStruct_0209707C_Sub8 *tmplate, enum HeapID heapID) {
    UnkStruct_02097024 *ret = Heap_Alloc(heapID, sizeof(UnkStruct_02097024));
    memset(ret, 0, sizeof(UnkStruct_02097024));
    ret->unk_14 = *tmplate;
    ret->unk_30 = sub_02096C88(ret, heapID);
    return ret;
}

void sub_02097060(UnkStruct_02097024 *a0) {
    sub_02096CF4(a0->unk_30);
    sub_02096CC8(a0->unk_30);
    Heap_Free(a0);
}

BOOL sub_02097078(UnkStruct_02097024 *a0) {
    return a0->unk_10;
}

UnkStruct_0209707C *sub_0209707C(FieldSystem *fieldSystem) {
    UnkStruct_0209707C *ret = Heap_Alloc(HEAP_ID_FIELD2, sizeof(UnkStruct_0209707C));
    memset(ret, 0, sizeof(UnkStruct_0209707C));
    ret->fieldSystem = fieldSystem;
    ret->unk_08.saveData = fieldSystem->saveData;
    ret->unk_08.unk_0C = fieldSystem->unk84;
    ret->unk_08.options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    ret->unk_08.gameStats = Save_GameStats_Get(fieldSystem->saveData);
    ret->unk_08.textFrame = Options_GetFrame(ret->unk_08.options);
    ret->unk_08.fieldSystem = fieldSystem;
    return ret;
}

BOOL sub_020970C0(UnkStruct_0209707C *a0) {
    if (_02108EC0[a0->unk_00](a0) == TRUE) {
        Heap_Free(a0);
        return TRUE;
    }

    return FALSE;
}

BOOL sub_020970E4(UnkStruct_0209707C *a0) {
    a0->unk_24 = sub_02097024(&a0->unk_08, HEAP_ID_FIELD2);
    a0->unk_00 = 1;
    FieldSystem_LaunchApplication(a0->fieldSystem, &_02108EA0, a0->unk_24);
    return FALSE;
}

BOOL sub_02097108(UnkStruct_0209707C *a0) {
    if (!FieldSystem_ApplicationIsRunning(a0->fieldSystem)) {
        if (!sub_02097078(a0->unk_24)) {
            a0->unk_00 = 5;
        } else {
            sub_020398D4(1, 1);
            a0->unk_2C = PartyMenu_LaunchApp_Unk5(a0->fieldSystem, a0->unk_04);
            a0->unk_24->unk_00 = 1;
            a0->unk_00 = 2;
        }
    }
    return FALSE;
}

BOOL sub_02097148(UnkStruct_0209707C *a0) {
    if (!FieldSystem_ApplicationIsRunning(a0->fieldSystem)) {
        u8 partySlot = a0->unk_2C->partySlot;
        Heap_Free(a0->unk_2C);
        if (a0->unk_2C->selectedAction == PARTY_MENU_ACTION_RETURN_1) {
            a0->unk_30 = PokemonSummary_CreateArgs(a0->fieldSystem, HEAP_ID_3, 0);
            a0->unk_04 = partySlot;
            a0->unk_30->partySlot = partySlot;
            PokemonSummary_LearnForget_LaunchApp(a0->fieldSystem, a0->unk_30);
            a0->unk_00 = 3;
        } else {
            a0->unk_24->unk_04 = partySlot;
            FieldSystem_LaunchApplication(a0->fieldSystem, &_02108EB0, a0->unk_24);
            a0->unk_24->unk_00 = 3;
            a0->unk_00 = 4;
        }
    }

    return FALSE;
}
