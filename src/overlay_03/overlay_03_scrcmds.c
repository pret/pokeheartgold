#include "overlay_01.h"
#include "overlay_01_021F3610.h"
#include "overlay_01_021F4704.h"
#include "overlay_02.h"
#include "overlay_03.h"
#include "overlay_108.h"

#include "field_system.h"
#include "global.h"
#include "launch_application.h"
#include "safari_zone.h"
#include "scrcmd.h"
#include "unk_0205FD20.h"
#include "unk_02097268.h"
#include "unk_02097720.h"

BOOL ScrCmd_716(ScriptContext *ctx) {
    SafariAreaCustomizerArgs **safariAreaArgs = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *safariAreaArgs = SafariAreaCustomizer_LaunchApp(ctx->fieldSystem);
    SetupNativeScript(ctx, &ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_717(ScriptContext *ctx) {
    sub_02097720(ctx->taskman, GetVarPointer(ctx->fieldSystem, ScriptReadHalfword(ctx)));
    return TRUE;
}

BOOL ScrCmd_718(ScriptContext *ctx) {
    MessageFormat **messageFormat = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 fieldno = *ctx->script_ptr++;
    BufferSafariZoneObjectName(*messageFormat, fieldno, (u8)FieldSystem_VarGet(ctx->fieldSystem, ScriptReadHalfword(ctx)));
    return FALSE;
}

BOOL ScrCmd_719(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    *GetVarPointer(ctx->fieldSystem, ScriptReadHalfword(ctx)) = ov02_0224E754(fieldSystem, GetVarPointer(ctx->fieldSystem, ScriptReadHalfword(ctx)));
    return FALSE;
}

BOOL ScrCmd_720(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    
    u32 areaID;
    SafariZoneAreaSet *areaSet;
    u16 *sp8;
    u8 *sp4;
    
    u16 safariObjectID = FieldSystem_VarGet(ctx->fieldSystem, ScriptReadHalfword(ctx));
    u32 facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    u32 xCoord = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    int deltaX = GetDeltaXByFacingDirection(facingDirection);
    u32 zCoord = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    int deltaY = GetDeltaYByFacingDirection(facingDirection);
    
    int areaX = xCoord + deltaX - 32;
    int areaY = zCoord + deltaY - 32;
    areaID = areaX / 32 + (areaY / 32 * 3);
    
    areaSet = SafariZone_GetAreaSet(Save_SafariZone_Get(fieldSystem->saveData), 0);
    u32 temp_r0 = ov01_021F6320(fieldSystem->unk2C);

    int sp20;
    ov01_021F630C((u8)temp_r0, fieldSystem->unk2C, &sp20);
    sp8 = ov01_021F65E4(fieldSystem->unk2C, (u8)temp_r0);
    sp4 = ov01_021F65F0(fieldSystem->unk2C, (u8)temp_r0);
    
    SAFARIZONE_OBJECT *safariObject = &areaSet->areas[areaID].objects[safariObjectID];

    SafariObjectConfig objectConfig;
    GetSafariObjectConfig((void *)&objectConfig, safariObject->unk[0], (u8)PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(fieldSystem->saveData)));
    
    for (int unkHeightCounter = safariObject->unk[3]; unkHeightCounter > safariObject->unk[3] - objectConfig.height; unkHeightCounter--) {
        for (int unkWidthCounter = safariObject->unk[1]; unkWidthCounter < safariObject->unk[1] + objectConfig.width; unkWidthCounter++) {
            sp8[unkWidthCounter + unkHeightCounter * 32] = sp4[unkWidthCounter + unkHeightCounter * 32];
        }
    }
    
    for (int index = 0; index < 32; index++) {
        int sp18 = ov01_021F3B44(sp20, index);
        if (ov01_021F3B30()) {
            VecFx32 position;
            ov01_021F3B0C(&position, sp18);
            
            s16 localX = (s16)(((position.x >> 12) + 0xF8) / 16);
            s16 localZ = (s16)(((position.z >> 12) + 0xF8) / 16);
            
            if (localX >= safariObject->unk[1] 
                && localZ <= safariObject->unk[3] 
                && localX < safariObject->unk[1] + objectConfig.width 
                && localZ > safariObject->unk[3] - objectConfig.height) {
                ov01_021F3B2C(sp18, 1);
                break;
            }
        } 
    }
    SafariZone_RemoveObjectFromArea(areaSet, areaID, (u8)safariObjectID);
    return FALSE;
}

BOOL ScrCmd_721(ScriptContext *ctx) {
    u16* var = GetVarPointer(ctx->fieldSystem, ScriptReadHalfword(ctx));
    *var = ov02_0224E698(ctx->fieldSystem);
    return FALSE;
}

BOOL ScrCmd_CheckSafariZoneChallengeCompleted(ScriptContext *ctx) {
    u16 sChallengeSpecies[2] = {
        SPECIES_GEODUDE,
        SPECIES_SANDSHREW,
    };

    u32 trainerID;
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u8 challengeNo = *ctx->script_ptr++;
    Party *party;
    u16 *challengeCompleted = GetVarPointer(ctx->fieldSystem, ScriptReadHalfword(ctx));
    party = SaveArray_Party_Get(fieldSystem->saveData);
    int partyCount = Party_GetCount(party);
    trainerID = PlayerProfile_GetTrainerID(Save_PlayerData_GetProfile(fieldSystem->saveData));
    u16 mapSec = MapHeader_GetMapSec(MAP_SAFARI_ZONE_ENTRANCE_EXTERIOR);

    for (int index = 0; index < partyCount; index++) {
        Pokemon *mon = Party_GetMonByIndex(party, index);
        if (GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE 
        && trainerID == GetMonData(mon, MON_DATA_OT_ID, NULL)
        && sChallengeSpecies[challengeNo] == GetMonData(mon, MON_DATA_SPECIES, NULL)
        && GetMonData(mon, MON_DATA_EGG_LOCATION, NULL) == FALSE // Make sure the player didn't cheat by hatching an egg in the Safari Zone.
        && mapSec == GetMonData(mon, MON_DATA_MET_LOCATION, NULL)) {
            *challengeCompleted = TRUE;
            return FALSE;
        }
    }
    *challengeCompleted = FALSE;
    return FALSE;
}

// Likely used for Safari Zone time-gated upgrades.
BOOL ScrCmd_UpdateSafariZoneIGT(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    sub_0202F784(Save_SafariZone_Get(fieldSystem->saveData), Save_PlayerData_GetIGTAddr(fieldSystem->saveData));
    return FALSE;
}
