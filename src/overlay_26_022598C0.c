#include "fieldmap.h"
#include "overlay_26.h"
#include "save.h"
#include "sys_flags.h"

static u16 GetRematchIdByBaseTrainerId(u16 trainer_no);
static u16 GetIndexOfFirstUnbeatenRematch(SaveData *saveData, u16 rematch_set_no);
static u32 CheckUnlockedRematchGroup(SaveData *saveData, u16 rematch_set_no, u16 rematch_no);
static u16 GetPreviousRematchIndexForTrainer(u32 rematch_set_no, u16 rematch_no);
static u16 GetRematchTrainerIdByIndexPair(u16 rematch_set_no, u32 rematch_no);

static const u16 sTrainerRematchSets[][6] = {
    { TRAINER_BIRD_KEEPER_GS_JOSE_2,     TRAINER_BIRD_KEEPER_GS_JOSE_2,     TRAINER_BIRD_KEEPER_GS_JOSE,         TRAINER_BIRD_KEEPER_GS_JOSE_3,      TRAINER_BIRD_KEEPER_GS_JOSE_4,      TRAINER_NONE },
    { TRAINER_PICNICKER_ERIN,            TRAINER_PICNICKER_ERIN,            TRAINER_PICNICKER_ERIN_2,            TRAINER_PICNICKER_ERIN_3,           TRAINER_PICNICKER_ERIN_4,           TRAINER_NONE },
    { TRAINER_PICNICKER_LIZ,             TRAINER_PICNICKER_LIZ,             TRAINER_PICNICKER_LIZ_2,             TRAINER_PICNICKER_LIZ_3,            TRAINER_PICNICKER_LIZ_4,            TRAINER_NONE },
    { TRAINER_SCHOOL_KID_M_CHAD,         TRAINER_SCHOOL_KID_M_CHAD,         TRAINER_SCHOOL_KID_M_CHAD_2,         TRAINER_SCHOOL_KID_M_CHAD_3,        TRAINER_SCHOOL_KID_M_CHAD_4,        TRAINER_NONE },
    { TRAINER_SAILOR_HUEY,               TRAINER_SAILOR_HUEY,               TRAINER_SAILOR_HUEY_2,               TRAINER_SAILOR_HUEY_3,              TRAINER_SAILOR_HUEY_4,              TRAINER_NONE },
    { TRAINER_BUG_CATCHER_WADE,          TRAINER_BUG_CATCHER_WADE,          TRAINER_BUG_CATCHER_WADE_3,          TRAINER_BUG_CATCHER_WADE_2,         TRAINER_BUG_CATCHER_WADE_4,         TRAINER_NONE },
    { TRAINER_YOUNGSTER_JOEY,            TRAINER_YOUNGSTER_JOEY,            TRAINER_YOUNGSTER_JOEY_2,            TRAINER_YOUNGSTER_JOEY_3,           TRAINER_YOUNGSTER_JOEY_4,           TRAINER_NONE },
    { TRAINER_SCHOOL_KID_M_JACK,         TRAINER_SCHOOL_KID_M_JACK,         TRAINER_SCHOOL_KID_M_JACK_2,         TRAINER_SCHOOL_KID_M_JACK_3,        TRAINER_SCHOOL_KID_M_JACK_4,        TRAINER_NONE },
    { TRAINER_ACE_TRAINER_M_GAVEN,       TRAINER_ACE_TRAINER_M_GAVEN,       TRAINER_ACE_TRAINER_M_GAVEN_2,       TRAINER_ACE_TRAINER_M_GAVEN_3,      TRAINER_ACE_TRAINER_M_GAVEN_4,      TRAINER_NONE },
    { TRAINER_BLACK_BELT_KENJI,          TRAINER_BLACK_BELT_KENJI,          TRAINER_BLACK_BELT_KENJI_2,          TRAINER_BLACK_BELT_KENJI_3,         TRAINER_BLACK_BELT_KENJI_4,         TRAINER_NONE },
    { TRAINER_HIKER_PARRY,               TRAINER_HIKER_PARRY,               TRAINER_HIKER_PARRY_2,               TRAINER_HIKER_PARRY_3,              TRAINER_HIKER_PARRY_4,              TRAINER_NONE },
    { TRAINER_PICNICKER_TIFFANY,         TRAINER_PICNICKER_TIFFANY,         TRAINER_PICNICKER_TIFFANY_2,         TRAINER_PICNICKER_TIFFANY_3,        TRAINER_PICNICKER_TIFFANY_4,        TRAINER_NONE },
    { TRAINER_HIKER_ANTHONY,             TRAINER_HIKER_ANTHONY,             TRAINER_HIKER_ANTHONY_2,             TRAINER_HIKER_ANTHONY_3,            TRAINER_HIKER_ANTHONY_4,            TRAINER_NONE },
    { TRAINER_ACE_TRAINER_F_REENA,       TRAINER_ACE_TRAINER_F_REENA,       TRAINER_ACE_TRAINER_F_REENA_2,       TRAINER_ACE_TRAINER_F_REENA_3,      TRAINER_ACE_TRAINER_F_REENA_4,      TRAINER_NONE },
    { TRAINER_FISHERMAN_WILTON,          TRAINER_FISHERMAN_WILTON,          TRAINER_FISHERMAN_WILTON_2,          TRAINER_FISHERMAN_WILTON_3,         TRAINER_FISHERMAN_WILTON_4,         TRAINER_NONE },
    { TRAINER_ACE_TRAINER_F_JAMIE,       TRAINER_ACE_TRAINER_F_JAMIE,       TRAINER_ACE_TRAINER_F_JAMIE_2,       TRAINER_ACE_TRAINER_F_JAMIE_3,      TRAINER_ACE_TRAINER_F_JAMIE_4,      TRAINER_NONE },
    { TRAINER_JUGGLER_IRWIN,             TRAINER_JUGGLER_IRWIN,             TRAINER_JUGGLER_IRWIN_2,             TRAINER_JUGGLER_IRWIN_3,            TRAINER_JUGGLER_IRWIN_4,            TRAINER_NONE },
    { TRAINER_POKE_MANIAC_BRENT,         TRAINER_POKE_MANIAC_BRENT,         TRAINER_POKE_MANIAC_BRENT_2,         TRAINER_POKE_MANIAC_BRENT_3,        TRAINER_POKE_MANIAC_BRENT_4,        TRAINER_NONE },
    { TRAINER_SCHOOL_KID_M_ALAN,         TRAINER_SCHOOL_KID_M_ALAN,         TRAINER_SCHOOL_KID_M_ALAN_2,         TRAINER_SCHOOL_KID_M_ALAN_3,        TRAINER_SCHOOL_KID_M_ALAN_4,        TRAINER_NONE },
    { TRAINER_POKEFAN_M_DEREK,           TRAINER_POKEFAN_M_DEREK,           TRAINER_POKEFAN_M_DEREK_2,           TRAINER_POKEFAN_M_DEREK_3,          TRAINER_POKEFAN_M_DEREK_4,          TRAINER_NONE },
    { TRAINER_PICNICKER_GINA,            TRAINER_PICNICKER_GINA,            TRAINER_PICNICKER_GINA_2,            TRAINER_PICNICKER_GINA_3,           TRAINER_PICNICKER_GINA_4,           TRAINER_NONE },
    { TRAINER_FISHERMAN_TULLY,           TRAINER_FISHERMAN_TULLY,           TRAINER_FISHERMAN_TULLY_2,           TRAINER_FISHERMAN_TULLY_3,          TRAINER_FISHERMAN_TULLY_4,          TRAINER_NONE },
    { TRAINER_POKEFAN_BEVERLY,           TRAINER_POKEFAN_BEVERLY,           TRAINER_POKEFAN_BEVERLY_2,           TRAINER_POKEFAN_BEVERLY_3,          TRAINER_POKEFAN_BEVERLY_4,          TRAINER_NONE },
    { TRAINER_BIRD_KEEPER_GS_VANCE,      TRAINER_BIRD_KEEPER_GS_VANCE,      TRAINER_BIRD_KEEPER_GS_VANCE_2,      TRAINER_BIRD_KEEPER_GS_VANCE_3,     TRAINER_BIRD_KEEPER_GS_VANCE_4,     TRAINER_NONE },
    { TRAINER_FISHERMAN_RALPH,           TRAINER_FISHERMAN_RALPH,           TRAINER_FISHERMAN_RALPH_2,           TRAINER_FISHERMAN_RALPH_3,          TRAINER_FISHERMAN_RALPH_4,          TRAINER_NONE },
    { TRAINER_CAMPER_TODD,               TRAINER_CAMPER_TODD,               TRAINER_CAMPER_TODD_2,               TRAINER_CAMPER_TODD_3,              TRAINER_CAMPER_TODD_4,              TRAINER_NONE },
    { TRAINER_BUG_CATCHER_ARNIE,         TRAINER_BUG_CATCHER_ARNIE,         TRAINER_BUG_CATCHER_ARNIE_2,         TRAINER_BUG_CATCHER_ARNIE_3,        TRAINER_BUG_CATCHER_ARNIE_4,        TRAINER_NONE },
    { TRAINER_LASS_DANA,                 TRAINER_LASS_DANA,                 TRAINER_LASS_DANA_2,                 TRAINER_LASS_DANA_3,                TRAINER_LASS_DANA_4,                TRAINER_NONE },
    { TRAINER_LASS_KRISE,                TRAINER_LASS_KRISE,                TRAINER_LASS_KRISE_2,                TRAINER_LASS_KRISE_3,               TRAINER_LASS_KRISE_4,               TRAINER_NONE },
    { TRAINER_YOUNGSTER_IAN,             TRAINER_YOUNGSTER_IAN,             TRAINER_YOUNGSTER_IAN_2,             TRAINER_YOUNGSTER_IAN_3,            TRAINER_YOUNGSTER_IAN_4,            TRAINER_NONE },
    { TRAINER_FIREBREATHER_WALT,         TRAINER_FIREBREATHER_WALT,         TRAINER_FIREBREATHER_WALT_2,         TRAINER_FIREBREATHER_WALT_3,        TRAINER_FIREBREATHER_WALT_4,        TRAINER_NONE },
    { TRAINER_BUG_CATCHER_DOUG,          TRAINER_BUG_CATCHER_DOUG,          TRAINER_BUG_CATCHER_DOUG_2,          TRAINER_BUG_CATCHER_DOUG_3,         TRAINER_BUG_CATCHER_DOUG_4,         TRAINER_NONE },
    { TRAINER_BUG_CATCHER_ROB,           TRAINER_BUG_CATCHER_ROB,           TRAINER_BUG_CATCHER_ROB_2,           TRAINER_BUG_CATCHER_ROB_3,          TRAINER_BUG_CATCHER_ROB_4,          TRAINER_NONE },
    { TRAINER_BIKER_REESE,               TRAINER_BIKER_REESE,               TRAINER_BIKER_REESE_2,               TRAINER_BIKER_REESE_3,              TRAINER_BIKER_REESE_4,              TRAINER_NONE },
    { TRAINER_BIKER_AIDEN,               TRAINER_BIKER_AIDEN,               TRAINER_BIKER_AIDEN_2,               TRAINER_BIKER_AIDEN_3,              TRAINER_BIKER_AIDEN_4,              TRAINER_NONE },
    { TRAINER_BIKER_ERNEST,              TRAINER_BIKER_ERNEST,              TRAINER_BIKER_ERNEST_2,              TRAINER_BIKER_ERNEST_3,             TRAINER_BIKER_ERNEST_4,             TRAINER_NONE },
    { TRAINER_TEACHER_HILLARY,           TRAINER_TEACHER_HILLARY,           TRAINER_TEACHER_HILLARY_2,           TRAINER_TEACHER_HILLARY_3,          TRAINER_TEACHER_HILLARY_4,          TRAINER_NONE },
    { TRAINER_SCHOOL_KID_M_BILLY,        TRAINER_SCHOOL_KID_M_BILLY,        TRAINER_SCHOOL_KID_M_BILLY_2,        TRAINER_SCHOOL_KID_M_BILLY_3,       TRAINER_SCHOOL_KID_M_BILLY_4,       TRAINER_NONE },
    { TRAINER_TWINS_KAY_AND_TIA,         TRAINER_TWINS_KAY_AND_TIA,         TRAINER_TWINS_KAY_AND_TIA_2,         TRAINER_TWINS_KAY_AND_TIA_3,        TRAINER_TWINS_KAY_AND_TIA_4,        TRAINER_NONE },
    { TRAINER_BIRD_KEEPER_GS_JOSH,       TRAINER_BIRD_KEEPER_GS_JOSH,       TRAINER_BIRD_KEEPER_GS_JOSH_2,       TRAINER_BIRD_KEEPER_GS_JOSH_3,      TRAINER_BIRD_KEEPER_GS_JOSH_4,      TRAINER_NONE },
    { TRAINER_SCHOOL_KID_M_TORIN,        TRAINER_SCHOOL_KID_M_TORIN,        TRAINER_SCHOOL_KID_M_TORIN_2,        TRAINER_SCHOOL_KID_M_TORIN_3,       TRAINER_SCHOOL_KID_M_TORIN_4,       TRAINER_NONE },
    { TRAINER_YOUNG_COUPLE_TIM_AND_SUE,  TRAINER_YOUNG_COUPLE_TIM_AND_SUE,  TRAINER_YOUNG_COUPLE_TIM_AND_SUE_2,  TRAINER_YOUNG_COUPLE_TIM_AND_SUE_3, TRAINER_YOUNG_COUPLE_TIM_AND_SUE_4, TRAINER_NONE },
    { TRAINER_HIKER_KENNY,               TRAINER_HIKER_KENNY,               TRAINER_HIKER_KENNY_2,               TRAINER_HIKER_KENNY_3,              TRAINER_HIKER_KENNY_4,              TRAINER_NONE },
    { TRAINER_CAMPER_TANNER,             TRAINER_CAMPER_TANNER,             TRAINER_CAMPER_TANNER_2,             TRAINER_CAMPER_TANNER_3,            TRAINER_CAMPER_TANNER_4,            TRAINER_NONE },
    { TRAINER_FISHERMAN_KYLE,            TRAINER_FISHERMAN_KYLE,            TRAINER_FISHERMAN_KYLE_2,            TRAINER_FISHERMAN_KYLE_3,           TRAINER_FISHERMAN_KYLE_4,           TRAINER_NONE },
    { TRAINER_FISHERMAN_KYLER,           TRAINER_FISHERMAN_KYLER,           TRAINER_FISHERMAN_KYLER_2,           TRAINER_FISHERMAN_KYLER_3,          TRAINER_FISHERMAN_KYLER_4,          TRAINER_NONE },
    { TRAINER_GENTLEMAN_ALFRED,          TRAINER_GENTLEMAN_ALFRED,          TRAINER_GENTLEMAN_ALFRED_2,          TRAINER_GENTLEMAN_ALFRED_3,         TRAINER_GENTLEMAN_ALFRED_4,         TRAINER_NONE },
    { TRAINER_LEADER_FALKNER_FALKNER,    TRAINER_LEADER_FALKNER_FALKNER,    TRAINER_LEADER_FALKNER_FALKNER_2,    TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_BUGSY_BUGSY,        TRAINER_LEADER_BUGSY_BUGSY,        TRAINER_LEADER_BUGSY_BUGSY_2,        TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_WHITNEY,            TRAINER_LEADER_WHITNEY,            TRAINER_LEADER_WHITNEY_2,            TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_MORTY_MORTY,        TRAINER_LEADER_MORTY_MORTY,        TRAINER_LEADER_MORTY_MORTY_2,        TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_JASMINE_JASMINE,    TRAINER_LEADER_JASMINE_JASMINE,    TRAINER_LEADER_JASMINE_JASMINE_2,    TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_CHUCK_CHUCK,        TRAINER_LEADER_CHUCK_CHUCK,        TRAINER_LEADER_CHUCK_CHUCK_2,        TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_PRYCE_PRYCE,        TRAINER_LEADER_PRYCE_PRYCE,        TRAINER_LEADER_PRYCE_PRYCE_2,        TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_CLAIR_CLAIR,        TRAINER_LEADER_CLAIR_CLAIR,        TRAINER_LEADER_CLAIR_CLAIR_2,        TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_BROCK_BROCK,        TRAINER_LEADER_BROCK_BROCK,        TRAINER_LEADER_BROCK_BROCK_2,        TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_MISTY_MISTY,        TRAINER_LEADER_MISTY_MISTY,        TRAINER_LEADER_MISTY_MISTY_2,        TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_LT_SURGE_LT__SURGE, TRAINER_LEADER_LT_SURGE_LT__SURGE, TRAINER_LEADER_LT_SURGE_LT__SURGE_2, TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_ERIKA_ERIKA,        TRAINER_LEADER_ERIKA_ERIKA,        TRAINER_LEADER_ERIKA_ERIKA_2,        TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_JANINE_JANINE,      TRAINER_LEADER_JANINE_JANINE,      TRAINER_LEADER_JANINE_JANINE_2,      TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_SABRINA_SABRINA,    TRAINER_LEADER_SABRINA_SABRINA,    TRAINER_LEADER_SABRINA_SABRINA_2,    TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_BLAINE_BLAINE,      TRAINER_LEADER_BLAINE_BLAINE,      TRAINER_LEADER_BLAINE_BLAINE_2,      TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
    { TRAINER_LEADER_BLUE_BLUE,          TRAINER_LEADER_BLUE_BLUE,          TRAINER_LEADER_BLUE_BLUE_2,          TRAINER_NONE,                       TRAINER_NONE,                       TRAINER_NONE },
};

u16 TryGetRematchTrainerIdByBaseTrainerId(SaveData *saveData, u16 trainer_id)
{
    u16 rematch_set_no = GetRematchIdByBaseTrainerId(trainer_id);
    if (rematch_set_no == 0xFF) {
        return 0;
    }

    u16 rematch_no = GetIndexOfFirstUnbeatenRematch(saveData, rematch_set_no);
    u32 checked_rematch_no = CheckUnlockedRematchGroup(saveData, rematch_set_no, rematch_no);
    return GetRematchTrainerIdByIndexPair(rematch_set_no, checked_rematch_no);
}

static u16 GetRematchIdByBaseTrainerId(u16 trainer_no)
{
    for (u32 i = 0; i < NELEMS(sTrainerRematchSets); i++) {
        if (trainer_no == sTrainerRematchSets[i][0]) {
            return i;
        }
    }

    return 0xFF;
}

static u16 GetIndexOfFirstUnbeatenRematch(SaveData *saveData, u16 rematch_set_no)
{
    int i;
    for (i = 1; i < 6; i++) {
        u16 trainer_no = sTrainerRematchSets[rematch_set_no][i];
        if (trainer_no == TRAINER_NONE) {
            return i - 1;
        }

        if (trainer_no != 0xFFFF && !TrainerFlagCheck(saveData, trainer_no)) {
            return i;
        }
    }

    return i - 1;
}

static u32 CheckUnlockedRematchGroup(SaveData *saveData, u16 rematch_set_no, u16 rematch_no)
{
    SaveVarsFlags *state = Save_VarsFlags_Get(saveData);

    if (rematch_no == 0) {
        return rematch_no;
    }

    if (!EventFlagCheck_RematchGroup(state, rematch_no)) {
        rematch_no = GetPreviousRematchIndexForTrainer(rematch_set_no, rematch_no);
    }

    return rematch_no;
}

static u16 GetPreviousRematchIndexForTrainer(u32 rematch_set_no, u16 rematch_no)
{
    const u16(*sets)[6] = sTrainerRematchSets;
    for (u16 i = rematch_no - 1; i > 0; i--) {
        if (sets[rematch_set_no][i] != 0xFFFF) {
            return i;
        }
    }

    return 0;
}

static u16 GetRematchTrainerIdByIndexPair(u16 rematch_set_no, u32 rematch_no)
{
    return sTrainerRematchSets[rematch_set_no][rematch_no];
}
