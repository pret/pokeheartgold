#include "global.h"
#include "math_util.h"
#include "game_stats.h"

struct GAME_STATS {
    u32 statsWords[NUM_GAME_STATS_WORD];
    u16 statsHalf[77];
    u16 dummy;
    u16 unk_1BC;
    u16 unk_1BE;
};

static void GameStats_Release(GAME_STATS *gameStats, int statIdx);
static void GameStats_Acquire(GAME_STATS *gameStats, int statIdx);
static u32 GameStats_GetValue(GAME_STATS *gameStats, int statIdx);
static u32 GameStats_SetValue(GAME_STATS *gameStats, int statIdx, u32 value);
static u32 GameStats_GetMaxValue(int statIdx);
static u16 GameStats_GetStdInc(int statIdx);

static u8 _0210F864[] = {
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    FALSE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    TRUE,
    FALSE,
    TRUE,
    TRUE,
    FALSE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
};

static const u16 _020F67DC[] = {
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        2,
        2,
        2,
        2,
        3,
        3,
        7,
        7,
        7,
       10,
       10,
       11,
       11,
       11,
       20,
       30,
       35,
       40,
      500,
    10000,
        7,
        7,
        7,
        7,
     1000,
       11,
       20,
       10,
       15,
       11,
       11,
       10,
       10,
};

u32 GameStats_sizeof(void) {
    return sizeof(GAME_STATS);
}

void GameStats_Init(GAME_STATS *gameStats) {
    MI_CpuClear32(gameStats, sizeof(GAME_STATS));
    gameStats->unk_1BE = OS_GetVBlankCount() | (OS_GetVBlankCount() << 8);
    GameStats_Release(gameStats, 2);
}

GAME_STATS *Save_GameStats_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_GAMESTATS);
}

static inline void *GameStats_GetSecureRegion(GAME_STATS *gameStats) {
    return (void *)((char *)gameStats + offsetof(GAME_STATS, statsWords) + 2 * sizeof(u32));
}

static inline u32 GameStats_GetSecureRegionSize(void) {
    return offsetof(GAME_STATS, unk_1BC) - (offsetof(GAME_STATS, statsWords) + 2 * sizeof(u32));
}

static void GameStats_Release(GAME_STATS *gameStats, int statIdx) {
    if (statIdx > 1) {
        gameStats->unk_1BC = Math_CalcArraySum(GameStats_GetSecureRegion(gameStats), GameStats_GetSecureRegionSize());
        _MonEncryptSegment(GameStats_GetSecureRegion(gameStats), GameStats_GetSecureRegionSize(), gameStats->unk_1BC + (gameStats->unk_1BE << 16));
    }
}

static void GameStats_Acquire(GAME_STATS *gameStats, int statIdx) {
    if (statIdx > 1) {
        _MonDecryptSegment(GameStats_GetSecureRegion(gameStats), GameStats_GetSecureRegionSize(), gameStats->unk_1BC + (gameStats->unk_1BE << 16));
    }
}

static u32 GameStats_GetValue(GAME_STATS *gameStats, int statIdx) {
    if (statIdx < NUM_GAME_STATS_WORD) {
        return gameStats->statsWords[statIdx];
    } else if (statIdx < NUM_GAME_STATS) {
        return gameStats->statsHalf[statIdx - NUM_GAME_STATS_WORD];
    } else {
        GF_ASSERT(FALSE);
        return 0;
    }
}

static u32 GameStats_SetValue(GAME_STATS *gameStats, int statIdx, u32 value) {
    if (statIdx < NUM_GAME_STATS_WORD) {
        gameStats->statsWords[statIdx] = value;
    } else if (statIdx < NUM_GAME_STATS) {
        gameStats->statsHalf[statIdx - NUM_GAME_STATS_WORD] = value;
    } else {
        GF_ASSERT(FALSE);
    }

    return GameStats_GetValue(gameStats, statIdx);
}

static u32 GameStats_GetMaxValue(int statIdx) {
    if (statIdx < NUM_GAME_STATS_WORD) {
        if (_0210F864[statIdx]) {
            return 999999999;
        } else {
            return 999999;
        }
    } else if (statIdx < NUM_GAME_STATS) {
        if (_0210F864[statIdx]) {
            return 65535;
        } else {
            return 9999;
        }
    } else {
        GF_ASSERT(FALSE);
        return 0;
    }
}

static u16 GameStats_GetStdInc(int statIdx) {
    return _020F67DC[statIdx];
}

u32 GameStats_SetCapped(GAME_STATS *gameStats, int statIdx, u32 value) {
    u32 limit = GameStats_GetMaxValue(statIdx);
    u32 ret;
    GameStats_Acquire(gameStats, statIdx);
    if (value < limit) {
        ret = GameStats_SetValue(gameStats, statIdx, value);
    } else {
        ret = GameStats_SetValue(gameStats, statIdx, limit);
    }
    GameStats_Release(gameStats, statIdx);
    return ret;
}

u32 GameStats_UpdateBounded(GAME_STATS *gameStats, int statIdx, u32 value) {
    u32 limit = GameStats_GetMaxValue(statIdx);
    u32 ret;
    GameStats_Acquire(gameStats, statIdx);
    ret = GameStats_GetValue(gameStats, statIdx);
    if (value > limit) {
        value = limit;
    }
    if (ret < value) {
        ret = GameStats_SetValue(gameStats, statIdx, value);
    } else if (ret > limit) {
        ret = GameStats_SetValue(gameStats, statIdx, limit);
    }
    GameStats_Release(gameStats, statIdx);
    return ret;
}

u32 GameStats_Inc(GAME_STATS *gameStats, int statIdx) {
    u32 limit = GameStats_GetMaxValue(statIdx);
    u32 ret;
    u32 value;
    GameStats_Acquire(gameStats, statIdx);
    value = GameStats_GetValue(gameStats, statIdx) + 1;
    if (value < limit) {
        ret = GameStats_SetValue(gameStats, statIdx, value);
    } else {
        ret = GameStats_SetValue(gameStats, statIdx, limit);
    }
    GameStats_Release(gameStats, statIdx);
    return ret;
}

u32 GameStats_Add(GAME_STATS *gameStats, int statIdx, u32 addend) {
    u32 limit = GameStats_GetMaxValue(statIdx);
    u32 ret;
    u32 value;
    GameStats_Acquire(gameStats, statIdx);
    value = GameStats_GetValue(gameStats, statIdx);
    if (value + addend < limit) {
        ret = GameStats_SetValue(gameStats, statIdx, value + addend);
    } else {
        ret = GameStats_SetValue(gameStats, statIdx, limit);
    }
    GameStats_Release(gameStats, statIdx);
    return ret;
}

u32 GameStats_GetCapped(GAME_STATS *gameStats, int statIdx) {
    u32 limit = GameStats_GetMaxValue(statIdx);
    u32 ret;
    GameStats_Acquire(gameStats, statIdx);
    ret = GameStats_GetValue(gameStats, statIdx);
    GameStats_Release(gameStats, statIdx);
    if (ret > limit) {
        return limit;
    } else {
        return ret;
    }
}

u32 GameStats_AddSpecial(GAME_STATS *gameStats, int statIdx) {
    GF_ASSERT(statIdx < 40);
    u32 value = GameStats_GetCapped(gameStats, GAME_STAT_UNK2);
    if (value + GameStats_GetStdInc(statIdx) > 99999999) {
        return GameStats_SetCapped(gameStats, GAME_STAT_UNK2, 99999999);
    } else {
        return GameStats_Add(gameStats, GAME_STAT_UNK2, GameStats_GetStdInc(statIdx));
    }
}

u32 GameStats_GetStat2(GAME_STATS *gameStats) {
    return GameStats_GetCapped(gameStats, GAME_STAT_UNK2);
}

void GameStats_IncSpeciesCaught(GAME_STATS *gameStats, const Pokedex *pokedex, u16 species) {
    if (!Pokedex_CheckMonCaughtFlag(pokedex, species)) {
        GameStats_AddSpecial(gameStats, 21);
    }
}
