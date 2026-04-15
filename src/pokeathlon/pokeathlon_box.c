#include "pokeathlon/pokeathlon_box.h"

#include "font.h"
#include "heap.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "system.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"

// functions in asm:
int sub_020935E0(int);
void sub_02093A40(u32);
void sub_02093354(u32);

BOOL ov97_0221E5C0() {
    if (ov97_0221E6DC() != 0) {
        return TRUE;
    }
    return FALSE;
}

BOOL ov97_0221E5D4(OverlayManager *manager) {
    PokeathlonBox* data = OverlayManager_GetData(manager);
    
    switch (data->unk4) {
        case 0:
            data->unk4 = 1;
            break;

        case 1:
            BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, HEAP_ID_POKEATHLON);
            data->unk4 = 2;
            break;

        case 2:
            if (IsPaletteFadeFinished()) {
                data->unk4 = 3;
            }
            break;

        case 3:
            int res = sub_020935E0(data->unk8);
            if (res == 2) {
                data->unk28 = FALSE;
                data->unk4 = 4;
            } else if (res == 3) {
                data->unk28 = TRUE;
                data->unk4 = 4;
            }
            break;

        case 4:
            BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_POKEATHLON);
            data->unk4 = 5;
            break;

        case 5:
            if (IsPaletteFadeFinished()) {
                void* args = OverlayManager_GetArgs(manager);
                ov97_0221E98C(data, args);
                return TRUE;
            }
            break;
    }

    sub_02093A40(data->unk8);
    ov97_0221F010(data->unkC);
    return FALSE;
}

BOOL ov97_0221E69C(OverlayManager *manager) {
    PokeathlonBox* data = OverlayManager_GetData(manager);
    Main_SetVBlankIntrCB(NULL, NULL);
    ov97_0221F020(data->unkC);
    sub_02093354(data->unk8);
    FontID_Release(2);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    Heap_Free(data->unk0);
    Heap_Free(data);
    return TRUE;
}
