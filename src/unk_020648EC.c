#include "unk_020648EC.h"

#include "global.h"

#include "gymmick.h"
#include "overlay_04.h"
#include "save_misc_data.h"
#include "scrcmd.h"
#include "script.h"

typedef void (*FieldSystemFunc1)(FieldSystem *);
typedef BOOL (*FieldSystemFunc2)(FieldSystem *, u32, u32, u32, u32);

static const FieldSystemFunc1 sInitFuncs[];
static const FieldSystemFunc1 sFreeFuncs[];
static const FieldSystemFunc2 sCheckCollisionFuncs[];

void Gymmick_Init(FieldSystem *fieldSystem) {
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type != GYMMICK_NONE) {
        sInitFuncs[type](fieldSystem);
    }
}

void Gymmick_Free(FieldSystem *fieldSystem) {
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type != GYMMICK_NONE && sFreeFuncs[type] != NULL) {
        sFreeFuncs[type](fieldSystem);
    }
}

BOOL Gymmick_CheckCollision(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, u32 isColliding) {
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type == GYMMICK_NONE) {
        return FALSE;
    }

    if (sCheckCollisionFuncs[type] != NULL) {
        return sCheckCollisionFuncs[type](fieldSystem, tileX, tileZ, height, isColliding);
    }
    return FALSE;
}

static const FieldSystemFunc1 sInitFuncs[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = GymmickInit_Ecruteak,
    [GYMMICK_CIANWOOD] = GymmickInit_Cianwood,
    [GYMMICK_VERMILION] = GymmickInit_Vermilion,
    [GYMMICK_VIOLET] = GymmickInit_Violet,
    [GYMMICK_AZALEA] = GymmickInit_Azalea,
    [GYMMICK_BLACKTHORN] = GymmickInit_Blackthorn,
    [GYMMICK_FUCHSIA] = GymmickInit_Fuchsia,
    [GYMMICK_VIRIDIAN] = GymmickInit_Viridian,
    [GYMMICK_SINJOH] = GymmickInit_Sinjoh,
};

static const FieldSystemFunc1 sFreeFuncs[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = GymmickFree_Ecruteak,
    [GYMMICK_CIANWOOD] = GymmickFree_Cianwood,
    [GYMMICK_VERMILION] = GymmickFree_Vermilion,
    [GYMMICK_VIOLET] = NULL,
    [GYMMICK_AZALEA] = GymmickFree_Azalea,
    [GYMMICK_BLACKTHORN] = GymmickFree_Blackthorn,
    [GYMMICK_FUCHSIA] = GymmickFree_Fuchsia,
    [GYMMICK_VIRIDIAN] = GymmickFree_Viridian,
    [GYMMICK_SINJOH] = GymmickFree_Sinjoh,
};

static const FieldSystemFunc2 sCheckCollisionFuncs[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = NULL,
    [GYMMICK_CIANWOOD] = NULL,
    [GYMMICK_VERMILION] = NULL,
    [GYMMICK_VIOLET] = NULL,
    [GYMMICK_AZALEA] = NULL,
    [GYMMICK_BLACKTHORN] = GymmickCheckCollision_Blackthorn,
    [GYMMICK_FUCHSIA] = NULL,
    [GYMMICK_VIRIDIAN] = NULL,
    [GYMMICK_SINJOH] = NULL,
};
