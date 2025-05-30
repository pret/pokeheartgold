#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0412.h"

#include "math_util.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "sys_flags.h"
#include "unk_02005D10.h"

typedef enum CommercialUnlockFlag {
    COMM_UNLOCK_ALWAYS,
    COMM_UNLOCK_POKEDEX,  // effectively always
    COMM_UNLOCK_ECRUTEAK, // most of these are fly unlocks
    COMM_UNLOCK_CIANWOOD,
    COMM_UNLOCK_OLIVINE,
    COMM_UNLOCK_GAME_CLEAR,
    COMM_UNLOCK_VERMILION,
    COMM_UNLOCK_RESTORED_POWER,
} CommercialUnlockFlag;

typedef enum CommercialRegion {
    COMM_REGION_JOHTO_F = 1,
    COMM_REGION_KANTO_F = 2,
} CommercialRegion;

typedef struct CommercialsData {
    HeapID heapID;
    u16 state;
    u16 msgID;
    u8 commercialUnlockFlags[8];
    u8 unlockedCommercials[36];
} CommercialsData;

void RadioShow_Commercials_Init(RadioShow *radioShow);
void RadioShow_Commercials_Unload(RadioShow *radioShow);

// Byte 0: Event condition (see CommercialUnlockFlag)
// Byte 1: Whether the commercial plays in Johto (1), Kanto (2), or both (3)
// Byte 2: Which channel the commercial will play on (0xFF = any)
static const u8 sCommercialsData[][3] = {
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F,                       0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F,                       0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F,                       0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F,                       0xFF },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 2    },
    { COMM_UNLOCK_ALWAYS,         COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 2    },
    { COMM_UNLOCK_POKEDEX,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_POKEDEX,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_POKEDEX,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_POKEDEX,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 0xFF },
    { COMM_UNLOCK_ECRUTEAK,       COMM_REGION_JOHTO_F,                       3    },
    { COMM_UNLOCK_ECRUTEAK,       COMM_REGION_JOHTO_F,                       3    },
    { COMM_UNLOCK_ECRUTEAK,       COMM_REGION_JOHTO_F,                       3    },
    { COMM_UNLOCK_ECRUTEAK,       COMM_REGION_JOHTO_F,                       2    },
    { COMM_UNLOCK_ECRUTEAK,       COMM_REGION_JOHTO_F,                       2    },
    { COMM_UNLOCK_ECRUTEAK,       COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 2    },
    { COMM_UNLOCK_CIANWOOD,       COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 2    },
    { COMM_UNLOCK_CIANWOOD,       COMM_REGION_JOHTO_F,                       3    },
    { COMM_UNLOCK_OLIVINE,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 1    },
    { COMM_UNLOCK_OLIVINE,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 1    },
    { COMM_UNLOCK_OLIVINE,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 1    },
    { COMM_UNLOCK_OLIVINE,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 1    },
    { COMM_UNLOCK_OLIVINE,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 1    },
    { COMM_UNLOCK_OLIVINE,        COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 1    },
    { COMM_UNLOCK_GAME_CLEAR,     COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 3    },
    { COMM_UNLOCK_VERMILION,      COMM_REGION_KANTO_F,                       3    },
    { COMM_UNLOCK_VERMILION,      COMM_REGION_KANTO_F,                       3    },
    { COMM_UNLOCK_VERMILION,      COMM_REGION_KANTO_F,                       3    },
    { COMM_UNLOCK_VERMILION,      COMM_REGION_KANTO_F,                       3    },
    { COMM_UNLOCK_VERMILION,      COMM_REGION_KANTO_F,                       3    },
    { COMM_UNLOCK_RESTORED_POWER, COMM_REGION_JOHTO_F | COMM_REGION_KANTO_F, 3    },
};

BOOL RadioShow_Commercials_Setup(RadioShow *radioShow) {
    CommercialsData *data = AllocFromHeap(radioShow->heapID, sizeof(CommercialsData));
    MI_CpuClear8(data, sizeof(CommercialsData));
    // data->heapID = radioShow->heapID;
    radioShow->triggerCommercials = FALSE;
    radioShow->showData = data;
    RadioShow_Commercials_Init(radioShow);
    return FALSE;
}

BOOL RadioShow_Commercials_Teardown(RadioShow *radioShow) {
    RadioShow_Commercials_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(CommercialsData));
    FreeToHeap(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_Commercials_Print(RadioShow *radioShow) {
    CommercialsData *data = radioShow->showData;

    switch (data->state) {
    case 0:
        RadioPrintInit(radioShow, data->msgID, 1);
        ++data->state;
        break;
    case 1:
        if (Radio_RunTextPrinter(radioShow)) {
            ++data->state;
        }
        break;
    case 2:
        if (RadioShow_Delay(radioShow)) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void RadioShow_Commercials_Init(RadioShow *radioShow) {
    u8 num = 0;
    u8 i;
    u8 r0;
    CommercialsData *data = radioShow->showData;
    SaveVarsFlags *varsFlags;

    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0412_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0412_00000, radioShow->showTitle);
    String_SetEmpty(radioShow->showHost);
    MI_CpuClear8(data->commercialUnlockFlags, sizeof(data->commercialUnlockFlags));
    MI_CpuClear8(data->unlockedCommercials, sizeof(data->unlockedCommercials));

    varsFlags = Save_VarsFlags_Get(radioShow->saveData);
    data->commercialUnlockFlags[COMM_UNLOCK_ALWAYS] = 1;
    data->commercialUnlockFlags[COMM_UNLOCK_POKEDEX] = Save_VarsFlags_CheckFlagInArray(varsFlags, FLAG_GOT_POKEDEX);
    data->commercialUnlockFlags[COMM_UNLOCK_ECRUTEAK] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_ECRUTEAK);
    data->commercialUnlockFlags[COMM_UNLOCK_CIANWOOD] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_CIANWOOD);
    data->commercialUnlockFlags[COMM_UNLOCK_OLIVINE] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_OLIVINE);
    data->commercialUnlockFlags[COMM_UNLOCK_VERMILION] = Save_VarsFlags_FlypointFlagAction(varsFlags, FLAG_ACTION_CHECK, FLYPOINT_VERMILION);
    data->commercialUnlockFlags[COMM_UNLOCK_GAME_CLEAR] = Save_VarsFlags_CheckFlagInArray(varsFlags, FLAG_GAME_CLEAR);
    data->commercialUnlockFlags[COMM_UNLOCK_RESTORED_POWER] = Save_VarsFlags_CheckFlagInArray(varsFlags, FLAG_RESTORED_POWER);
    for (i = 0; i < NELEMS(sCommercialsData); ++i) {
        if (!data->commercialUnlockFlags[sCommercialsData[i][0]]) {
            continue;
        }
        // This is required to match
        r0 = sCommercialsData[i][2];
        if (r0 != 0xFF && r0 != radioShow->nextStation) {
            continue;
        }
        if (sCommercialsData[i][1] & (radioShow->inKanto + 1)) {
            data->unlockedCommercials[num++] = i;
        }
    }
    data->msgID = msg_0412_00002 + data->unlockedCommercials[LCRandom() % num];
}

void RadioShow_Commercials_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
