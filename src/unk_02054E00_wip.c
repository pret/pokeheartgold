#include "unk_02054E00.h"

#include "constants/sndseq.h"
#include "constants/trainer_class.h"

#include "gf_rtc.h"
#include "map_header.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "sys_flags.h"
#include "sound.h"
#include "sound_02004A44.h"

// functions still in asm:
void ov01_021F630C(int, FieldSystemUnkSub2C*, s32*);
int ov01_021F3B44(int, u8);
int ov01_021F3B30();
int ov01_021F3B34(int);
void ov01_021F3B2C(int, int);
void Sound_Stop();
void Sound_ClearBGMPauseFlags();
void Sound_SetScene(int);
BOOL GF_SND_BGM_DisableCheck();
void GF_FadeStartMusicId(int, int, int, int, int, void*);
void GF_NowStartMusicId(int, int, int, int, void*);

// clang-format off
// Class, Eyes meet theme
const /*static*/ u16 sTrainerEncounterMusicParam[][3] = {
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

BOOL MapModel_IsHeadbuttTree(u32 mapModelNo) {
    if (mapModelNo == 0xd0) {
        return TRUE;
    } 
    return FALSE;
}

u16 MapCoordToMatrixIndex(FieldSystem* fieldSystem, int coordX, int coordY) {
    if (coordX < 0 || coordY < 0) {
        GF_ASSERT(FALSE);
        return 0;
    }
    int width = MapMatrix_GetWidth(fieldSystem->mapMatrix);
    int height = MapMatrix_GetHeight(fieldSystem->mapMatrix);
    int posX = coordX / 32;
    int posY = coordY / 32;
    if (posX >= width && posY >= height) {
        GF_ASSERT(FALSE);
        return 0;
    }
    return (u16) (posX + (posY * width));
}

void sub_02054EB0(FieldSystem *fieldSystem, int a1, BOOL a2) {
    int val;
    for (u8 i = 0; i < 4U; i++) {
        ov01_021F630C(i, fieldSystem->unk2C, &val);
        if (val != 0) {
            for (u8 j = 0; j < 0x20U; j++) {
                int res = ov01_021F3B44(val, j);
                if (ov01_021F3B30() != 0) {
                    int res2 = ov01_021F3B34(res);
                    if (res2 == a1) {
                        ov01_021F3B2C(res, a2);
                    }
                }
            }
        }
    }
}

// From platinum: sub_020553DC
void sub_02054F14() {
    Sound_Stop();
    Sound_ClearBGMPauseFlags();
    Sound_SetScene(SOUND_SCENE_NONE);
}

// From platinum: Sound_SetSpecialBGM
void FieldSystem_SetSavedMusicId(FieldSystem *fieldSystem, u16 seqNo) {
    u16 *bgm = LocalFieldData_GetMusicIdAddr(Save_LocalFieldData_Get(fieldSystem->saveData));
    *bgm = seqNo;
}

// From platinum: Sound_GetSpecialBGM
u16 FieldSystem_GetSavedMusicId(FieldSystem *fieldSystem) {
    u16 *bgm = LocalFieldData_GetMusicIdAddr(Save_LocalFieldData_Get(fieldSystem->saveData));
    return *bgm;
}

// From platinum: Sound_ClearSpecialBGM
void FieldSystem_ClearSavedMusicId(FieldSystem *fieldSystem) {
    u16 *bgm = LocalFieldData_GetMusicIdAddr(Save_LocalFieldData_Get(fieldSystem->saveData));
    *bgm = 0;
}

// From platinum: Sound_GetOverrideBGM
u16 FieldSystem_GetOverriddenMusicId(FieldSystem *fieldSystem, u32 mapId) {
    PlayerAvatar *playerAvatar = fieldSystem->playerAvatar;
    int playerState = PlayerAvatar_GetState(playerAvatar);

    if (playerState == PLAYER_STATE_SURFING) {
        if (CheckFlag99A(Save_VarsFlags_Get(fieldSystem->saveData)) == 0) {
            return SEQ_GS_NAMINORI;
        }
    }

    u16 bgmID = GetMapMusic(fieldSystem, mapId);

    if (FieldSystem_GetSavedMusicId(fieldSystem) != SEQ_NONE) {
        bgmID = FieldSystem_GetSavedMusicId(fieldSystem);
    }

    return bgmID;
}

// From platinum: Sound_GetBGMByMapID
u16 GetMapMusic(FieldSystem *fieldSystem, int mapId) {
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

// From platinum: Sound_TryFadeOutToBGM
BOOL FieldSystem_PlayOrFadeToNewMusicId(FieldSystem *fieldSystem, u16 seqNo, int mode) {
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
    Sound_GetBGMFadeOutAndWaitFrames(fieldSystem, mode, &fadeOutFrames, &waitFrames);

    // Yes, it's checking bike twice. Maybe there was a point were Acro and Mach Bikes were still a thing?
    if ((playerState == PLAYER_STATE_CYCLING) || (playerState == PLAYER_STATE_CYCLING)) {
        GF_FadeStartMusicId(seqNo, fadeOutFrames, waitFrames, 30, 0, NULL);
    } else {
        GF_NowStartMusicId(seqNo, fadeOutFrames, waitFrames, 0, NULL);
    }

    return TRUE;
}
