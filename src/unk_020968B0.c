#include "unk_020968B0.h"

#include "global.h"

#include "field_system.h"
#include "frontier/frontier.h"

FrontierLaunchArgs *sub_020968B0(FieldSystem* fieldSystem, void* param1) {
	FrontierLaunchArgs *args = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FrontierLaunchArgs));
	MI_CpuFill8(args, 0, sizeof(FrontierLaunchArgs));

    args->unk0 = param1;
    args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    args->saveData = fieldSystem->saveData;
    args->bagCursor = fieldSystem->bagCursor;
	args->unk1C = fieldSystem->unkB0;
	args->unk10 = 0;
    args->unk14 = 0;
    args->mapId = fieldSystem->location->mapId;
    args->unk20 = 14;
    args->fieldSystem = fieldSystem;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_Frontier, args);
    return args;
}
