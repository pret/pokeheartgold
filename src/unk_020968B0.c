#include "unk_020968B0.h"

#include "global.h"

#include "field_system.h"
#include "frontier/frontier.h"

FrontierLaunchParam *sub_020968B0(FieldSystem* fieldSystem, void* param1) {
	FrontierLaunchParam *param = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FrontierLaunchParam));
	MI_CpuFill8(param, 0, sizeof(FrontierLaunchParam));

    param->unk0 = param1;
    param->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    param->saveData = fieldSystem->saveData;
    param->bagCursor = fieldSystem->bagCursor;
	param->unk1C = fieldSystem->unkB0;
	param->unk10 = 0;
    param->unk14 = 0;
    param->mapId = fieldSystem->location->mapId;
    param->unk20 = 0xE;
    param->fieldSystem = fieldSystem;
    FieldSystem_LaunchApplication(fieldSystem, &gOverlayTemplate_Frontier, param);
    return param;
}
