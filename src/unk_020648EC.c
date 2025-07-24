#include "unk_020648EC.h"

#include "global.h"

#include "gymmick.h"
#include "overlay_04.h"
#include "save_misc_data.h"
#include "scrcmd.h"
#include "script.h"

typedef void (*FieldSystemFunc1)(FieldSystem *);
typedef BOOL (*FieldSystemFunc2)(FieldSystem *, u32, u32, u32, u32);

static const FieldSystemFunc1 _020FE214[];
static const FieldSystemFunc1 _020FE1EC[];
static const FieldSystemFunc2 _020FE23C[];

void sub_020648EC(FieldSystem *fieldSystem)
{
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type != GYMMICK_NONE) {
        _020FE214[type](fieldSystem);
    }
}

void sub_02064910(FieldSystem *fieldSystem)
{
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type != GYMMICK_NONE) {
        FieldSystemFunc1 func = _020FE1EC[type];
        if (func != NULL) {
            func(fieldSystem);
        }
    }
}

BOOL sub_02064938(FieldSystem *fieldSystem, u32 a1, u32 a2, u32 a3, u32 a4)
{
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type == GYMMICK_NONE) {
        return FALSE;
    }

    FieldSystemFunc2 func = _020FE23C[type];
    if (func != NULL) {
        return func(fieldSystem, a1, a2, a3, a4);
    }
    return FALSE;
}

static const FieldSystemFunc1 _020FE214[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = ov04_02254CBC,
    [GYMMICK_CIANWOOD] = ov04_02255FC0,
    [GYMMICK_VERMILION] = ov04_02256304,
    [GYMMICK_VIOLET] = ov04_02253E20,
    [GYMMICK_AZALEA] = ov04_02254190,
    [GYMMICK_BLACKTHORN] = ov04_02254F8C,
    [GYMMICK_FUCHSIA] = ov04_02256650,
    [GYMMICK_VIRIDIAN] = ov04_02256B64,
    [GYMMICK_SINJOH] = ov04_02256E60,
};

static const FieldSystemFunc1 _020FE1EC[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = ov04_02254D84,
    [GYMMICK_CIANWOOD] = ov04_02256044,
    [GYMMICK_VERMILION] = ov04_022563B0,
    [GYMMICK_VIOLET] = NULL,
    [GYMMICK_AZALEA] = ov04_02254710,
    [GYMMICK_BLACKTHORN] = ov04_0225507C,
    [GYMMICK_FUCHSIA] = ov04_022566A0,
    [GYMMICK_VIRIDIAN] = ov04_02256BA0,
    [GYMMICK_SINJOH] = ov04_02256EB0,
};

static const FieldSystemFunc2 _020FE23C[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = NULL,
    [GYMMICK_CIANWOOD] = NULL,
    [GYMMICK_VERMILION] = NULL,
    [GYMMICK_VIOLET] = NULL,
    [GYMMICK_AZALEA] = NULL,
    [GYMMICK_BLACKTHORN] = ov04_022550D4,
    [GYMMICK_FUCHSIA] = NULL,
    [GYMMICK_VIRIDIAN] = NULL,
    [GYMMICK_SINJOH] = NULL,
};
