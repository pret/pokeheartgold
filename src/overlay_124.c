#include "overlay_124.h"

#include "global.h"

#include "dsprot.h"
#include "field_system.h"
#include "follow_mon.h"
#include "main.h"
#include "map_events.h"
#include "save_local_field_data.h"
#include "unk_02092BB8.h"
#include "unk_02092BE8.h"

FS_EXTERN_OVERLAY(ds_protect);

static void ov124_02260D1C(FieldSystem *fieldSystem);
static void ov124_02260D68(void);
static void ov124_02260D6C(void);
static void ov124_02260D58(void);

void FieldSystem_Init(OverlayManager *man, FieldSystem *fieldSystem) {
    u32 key = 2441 * 4073; // these are both prime
    FS_LoadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));
    key += 769 * (!DSProt_DetectNotFlashcart(ov124_02260D68)); // 769 is prime
    UnkStruct_02111868_sub *args = OverlayManager_GetArgs(man);
    fieldSystem->saveData = args->saveData;
    fieldSystem->taskman = NULL;
    key += 47 * (!DSProt_DetectNotDummy(ov124_02260D6C)); // 47 is prime
    fieldSystem->location = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fieldSystem->saveData));
    fieldSystem->mapMatrix = MapMatrix_New();
    u32 key2 = 929 * DSProt_DetectEmulator(ov124_02260D58); // 929 is prime
    Field_AllocateMapEvents(fieldSystem, HEAP_ID_FIELD2);
    fieldSystem->bagCursor = BagCursor_New(HEAP_ID_FIELD2);
    FS_UnloadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(ds_protect));

    // all combinations of the three prime multipliers above are coprime with 2441 and 4073
    if ((key + key2) % 2441) {
        ov124_02260D1C(fieldSystem);
    }
    fieldSystem->unkA8 = sub_02092BB8(HEAP_ID_FIELD2);
    fieldSystem->unk108 = FieldSystem_UnkSub108_Alloc(HEAP_ID_FIELD2);
    fieldSystem->phoneRingManager = GearPhoneRingManager_New(HEAP_ID_FIELD2, fieldSystem);
    fieldSystem->judgeStatPosition = 0;
    if ((key + key2) % 4073) {
        ov124_02260D1C(fieldSystem);
    }
}

// clobbers the heap worse if you have made more progress through the game
static void ov124_02260D1C(FieldSystem *fieldSystem) {
    int i = 0;
    int numBadges = 0;
    for (i = 0; i < 16; ++i) {
        if (PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfile(fieldSystem->saveData), i) == TRUE) {
            ++numBadges;
        }
    }
    Heap_AllocAtEnd(HEAP_ID_3, numBadges == 0 ? 20000 : (20000 * numBadges));
}

// you can have a little heap clobber, as a treat
static void ov124_02260D58(void) {
    Heap_AllocAtEnd(HEAP_ID_3, 1000);
}

static void ov124_02260D68(void) {
}
static void ov124_02260D6C(void) {
}
