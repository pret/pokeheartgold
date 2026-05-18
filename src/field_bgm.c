#include "field_bgm.h"

#include "constants/sndseq.h"
#include "constants/trainer_class.h"

#include "gf_rtc.h"
#include "map_header.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "sys_flags.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "trainer_data.h"

#include "overlay_01_021E6880.h"

// functions still in asm:
void Sound_Stop();
void Sound_ClearBGMPauseFlags();
void Sound_SetScene(int);
BOOL GF_SND_BGM_DisableCheck();
void GF_FadeStartMusicId(int, int, int, int, int, void*);
void GF_NowStartMusicId(int, int, int, int, void*);
void Sound_SetFieldBGM(u16);
void sub_02005CF4(BOOL);
BOOL sub_02004EB4(u16);

// clang-format off
// Class, Eyes meet theme
const static u16 sTrainerEncounterMusicParam[][3] = {
    { TRAINERCLASS_YOUNGSTER, SEQ_GS_EYE_J_SHOUNEN, SEQ_GS_EYE_J_SHOUNEN },
	{ TRAINERCLASS_LASS, SEQ_GS_EYE_K_SHOUJO, SEQ_GS_EYE_K_SHOUJO },
	{ TRAINERCLASS_CAMPER, SEQ_GS_EYE_J_SHOUNEN, SEQ_GS_EYE_J_SHOUNEN },
	{ TRAINERCLASS_PICNICKER, SEQ_GS_EYE_K_SHOUJO, SEQ_GS_EYE_K_SHOUJO },
	{ TRAINERCLASS_BUG_CATCHER, SEQ_GS_EYE_J_SHOUNEN, SEQ_GS_EYE_J_SHOUNEN },
	{ TRAINERCLASS_TWINS, SEQ_GS_EYE_K_SHOUJO, SEQ_GS_EYE_K_SHOUJO },
	{ TRAINERCLASS_HIKER, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_FISHERMAN, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_BLACK_BELT, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_POKEFAN_M, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_POKEFAN, SEQ_GS_EYE_J_SHOUJO, SEQ_GS_EYE_J_SHOUJO },
	{ TRAINERCLASS_ACE_TRAINER_M, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_ACE_TRAINER_F, SEQ_GS_EYE_J_SHOUJO, SEQ_GS_EYE_J_SHOUJO },
	{ TRAINERCLASS_BIRD_KEEPER_GS, SEQ_GS_EYE_J_SHOUNEN, SEQ_GS_EYE_J_SHOUNEN },
	{ TRAINERCLASS_JUGGLER, SEQ_GS_EYE_J_AYASHII, SEQ_GS_EYE_J_AYASHII },
	{ TRAINERCLASS_GENTLEMAN, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_BEAUTY, SEQ_GS_EYE_J_SHOUJO, SEQ_GS_EYE_J_SHOUJO },
	{ TRAINERCLASS_POLICEMAN, SEQ_GS_EYE_K_SHOUNEN, SEQ_GS_EYE_K_SHOUNEN },
	{ TRAINERCLASS_SWIMMER_M, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_SWIMMER_F, SEQ_GS_EYE_J_SHOUJO, SEQ_GS_EYE_J_SHOUJO },
	{ TRAINERCLASS_SAILOR, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_KIMONO_GIRL, SEQ_GS_EYE_MAIKO, SEQ_GS_EYE_MAIKO },
	{ TRAINERCLASS_PSYCHIC_M, SEQ_GS_EYE_J_SHOUNEN, SEQ_GS_EYE_J_SHOUNEN },
	{ TRAINERCLASS_GUITARIST, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_TEAM_ROCKET, SEQ_GS_EYE_ROCKET, SEQ_GS_EYE_ROCKET },
	{ TRAINERCLASS_SKIER, SEQ_GS_EYE_J_SHOUJO, SEQ_GS_EYE_J_SHOUJO },
	{ TRAINERCLASS_SCHOOL_KID_M, SEQ_GS_EYE_J_SHOUNEN, SEQ_GS_EYE_J_SHOUNEN },
	{ TRAINERCLASS_TEAM_ROCKET_F, SEQ_GS_EYE_ROCKET, SEQ_GS_EYE_ROCKET },
	{ TRAINERCLASS_BURGLAR, SEQ_GS_EYE_J_AYASHII, SEQ_GS_EYE_J_AYASHII },
	{ TRAINERCLASS_FIREBREATHER, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_BIKER, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_POKE_MANIAC, SEQ_GS_EYE_J_AYASHII, SEQ_GS_EYE_J_AYASHII },
	{ TRAINERCLASS_TEACHER, SEQ_GS_EYE_J_SHOUJO, SEQ_GS_EYE_J_SHOUJO },
	{ TRAINERCLASS_SUPER_NERD, SEQ_GS_EYE_J_AYASHII, SEQ_GS_EYE_J_AYASHII },
	{ TRAINERCLASS_SAGE, SEQ_GS_EYE_BOUZU, SEQ_GS_EYE_BOUZU },
	{ TRAINERCLASS_MEDIUM, SEQ_GS_EYE_BOUZU, SEQ_GS_EYE_BOUZU },
	{ TRAINERCLASS_SCIENTIST_GS, SEQ_GS_EYE_ROCKET, SEQ_GS_EYE_J_AYASHII },
	{ TRAINERCLASS_BOARDER, SEQ_GS_EYE_K_AYASHII, SEQ_GS_EYE_K_AYASHII },
	{ TRAINERCLASS_DOUBLE_TEAM, SEQ_GS_EYE_K_SHOUNEN, SEQ_GS_EYE_K_SHOUNEN },
	{ TRAINERCLASS_YOUNG_COUPLE, SEQ_GS_EYE_J_SHOUJO, SEQ_GS_EYE_J_SHOUJO },
	{ TRAINERCLASS_EXECUTIVE_ARCHER, SEQ_GS_EYE_ROCKET, SEQ_GS_EYE_ROCKET },
	{ TRAINERCLASS_EXECUTIVE_ARIANA, SEQ_GS_EYE_ROCKET, SEQ_GS_EYE_ROCKET },
	{ TRAINERCLASS_EXECUTIVE_PROTON, SEQ_GS_EYE_ROCKET, SEQ_GS_EYE_ROCKET },
	{ TRAINERCLASS_EXECUTIVE_PETREL, SEQ_GS_EYE_ROCKET, SEQ_GS_EYE_ROCKET }
};
// clang-format on

void FieldBGM_Stop() {
    Sound_Stop();
    Sound_ClearBGMPauseFlags();
    Sound_SetScene(SOUND_SCENE_NONE);
}

void FieldBGM_SetOverride(FieldSystem *fieldSystem, u16 seqNo) {
    u16 *bgm = LocalFieldData_GetMusicIdAddr(Save_LocalFieldData_Get(fieldSystem->saveData));
    *bgm = seqNo;
}

u16 FieldBGM_GetOverride(FieldSystem *fieldSystem) {
    u16 *bgm = LocalFieldData_GetMusicIdAddr(Save_LocalFieldData_Get(fieldSystem->saveData));
    return *bgm;
}

void FieldBGM_ClearOverride(FieldSystem *fieldSystem) {
    u16 *bgm = LocalFieldData_GetMusicIdAddr(Save_LocalFieldData_Get(fieldSystem->saveData));
    *bgm = SEQ_NONE;
}

u16 FieldBGM_GetEffective(FieldSystem *fieldSystem, u32 mapId) {
    PlayerAvatar *playerAvatar = fieldSystem->playerAvatar;
    int playerState = PlayerAvatar_GetState(playerAvatar);

    if (playerState == PLAYER_STATE_SURFING) {
        if (CheckFlag99A(Save_VarsFlags_Get(fieldSystem->saveData)) == 0) {
            return SEQ_GS_NAMINORI;
        }
    }

    u16 seqNo = FieldBGM_GetForMapHeader(fieldSystem, mapId);

    if (FieldBGM_GetOverride(fieldSystem) != SEQ_NONE) {
        seqNo = FieldBGM_GetOverride(fieldSystem);
    }

    return seqNo;
}

u16 FieldBGM_GetForMapHeader(FieldSystem *fieldSystem, int mapId) {
    u16 sdatID;

    if (IsNighttime() == FALSE) {
        sdatID = MapHeader_GetDayMusicId(mapId);
    } else {
        sdatID = MapHeader_GetNightMusicId(mapId);
    }

    u16 altSdatID = GetOverriddenMapMusic(Save_VarsFlags_Get(fieldSystem->saveData), mapId);

    if (altSdatID != SEQ_NONE) {
        sdatID = altSdatID;
    }

    return sdatID;
}

BOOL FieldBGM_TryFadeOut(FieldSystem *fieldSystem, u16 seqNo, int mode) {
    int fadeOutFrames, waitFrames;

    PlayerAvatar *playerAvatar = fieldSystem->playerAvatar;
    int playerState = PlayerAvatar_GetState(playerAvatar);

    if (GF_SND_BGM_DisableCheck() == TRUE) {
        return FALSE;
    }
    if (seqNo == GF_GetCurrentPlayingBGM(fieldSystem)) {
        return FALSE;
    }

    Sound_ClearBGMPauseFlags();
    FieldBGM_GetFadeOutAndWaitFrames(fieldSystem, mode, &fadeOutFrames, &waitFrames);

    // Yes, it's checking bike twice. Maybe there was a point were Acro and Mach Bikes were still a thing?
    if ((playerState == PLAYER_STATE_CYCLING) || (playerState == PLAYER_STATE_CYCLING)) {
        GF_FadeStartMusicId(seqNo, fadeOutFrames, waitFrames, 30, 0, NULL);
    } else {
        GF_NowStartMusicId(seqNo, fadeOutFrames, waitFrames, 0, NULL);
    }

    return TRUE;
}

static void FieldBGM_GetFadeOutAndWaitFrames(FieldSystem *fieldSystem, int mode, int *fadeOutFrames, int *waitFrames) {
    switch (mode) {
    case 0:
        *fadeOutFrames = 30;
        *waitFrames = 0;
        break;
    case 1:
        *fadeOutFrames = 60;
        *waitFrames = 0;
        break;
    case 2:
        *fadeOutFrames = 60;
        *waitFrames = 15;
        break;
    case 4:
        *fadeOutFrames = 30;
        *waitFrames = 0;
        break;
    default:
        *fadeOutFrames = 60;
        *waitFrames = 0;
        break;
    }
}

int FieldBGM_GetEyesMeetForTrainer(u16 trainerID, int regionNo) {
    GF_ASSERT(regionNo < 2);

    u8 class = TrainerData_GetAttr(trainerID, TRATTR_CLASS);
    u16 i, seqNo = SEQ_GS_EYE_J_SHOUNEN;

    for (i = 0; i < NELEMS(sTrainerEncounterMusicParam); i++) {
        if (sTrainerEncounterMusicParam[i][0] == class) {
            seqNo = sTrainerEncounterMusicParam[i][regionNo + 1];
            break;
        }
    }

    return seqNo;
}

void FieldBGM_TryFadeIn(FieldSystem *fieldSystem, u32 mapId) {
    if (GF_SND_BGM_DisableCheck() == 1) {
        return;
    }

    if (GF_GetCurrentPlayingBGM() != FieldBGM_GetForMapHeader(fieldSystem, mapId)) {
        GF_SndStartFadeOutBGM(0, 40);
    }
}

void FieldBGM_PlayForMapHeader(FieldSystem *fieldSystem, u32 mapID, u32 a2) {
    u16 seqNo;

    if (GF_SND_BGM_DisableCheck() == 1) {
        return;
    }

    Sound_SetScene(SOUND_SCENE_NONE);

    seqNo = FieldBGM_GetForMapHeader(fieldSystem, mapID);

    Sound_SetFieldBGM(seqNo);

    sub_02005CF4(TRUE);

    fieldSystem->unkC4 = -3;

    if (a2 == 1) {
        sub_02055198(fieldSystem, seqNo);
    } else {
        sub_02055198(NULL, seqNo);
    }

    sub_02005CF4(FALSE);
}

BOOL FieldBGM_PlayEffectiveForMapHeader(FieldSystem *fieldSystem, u32 mapId) {
    u16 seqNo = FieldBGM_GetEffective(fieldSystem, mapId);
    Sound_SetFieldBGM(FieldBGM_GetForMapHeader(fieldSystem, mapId));

    sub_02005CF4(TRUE);
    u32 res = sub_02055198(NULL, seqNo);
    sub_02005CF4(FALSE);

    return res;
}

BOOL sub_02055198(FieldSystem *fieldSystem, u16 seqNo) {
    BOOL res = sub_02004EB4(seqNo);
    if (res == TRUE && fieldSystem != NULL) {
        ov01_021E7F00(fieldSystem, FALSE);
    }
    return res;
}
