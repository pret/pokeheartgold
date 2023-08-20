#include "global.h"
#include "hall_of_fame.h"
#include "pokemon.h"
#include "party.h"

#define ASSERT_HALL_OF_FAME(hof) ({                \
    GF_ASSERT(hof != NULL);                        \
    GF_ASSERT(hof->next_record < NUM_HOF_RECORDS); \
})

static inline HOFTEAM *HallOfFame_SeekBack(HALL_OF_FAME *hof, int num) {
    int ret = hof->next_record - 1 - num;
    if (ret < 0) {
        ret += NUM_HOF_RECORDS;
    }
    return &hof->parties[ret];
}

u32 Save_HOF_sizeof(void) {
    return sizeof(HALL_OF_FAME);
}

void Save_HOF_Init(HALL_OF_FAME *hof) {
    MI_CpuClear32(hof, sizeof(HALL_OF_FAME));
}

void Save_HOF_RecordParty(HALL_OF_FAME *hof, Party *party, RTCDate *date) {
    ASSERT_HALL_OF_FAME(hof);
    if (hof->num_total < 9999) {
        HOFTEAM *team = &hof->parties[hof->next_record];
        int npokes = Party_GetCount(party);
        String *string = String_New(POKEMON_NAME_LENGTH + 1, HEAP_ID_DEFAULT);
        int i, j;

        MI_CpuClear16(team->party, sizeof(team->party));

        for (i = 0, j = 0; i < npokes; i++) {
            Pokemon *mon = Party_GetMonByIndex(party, i);
            BOOL lock = AcquireMonLock(mon);
            if (!GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
                team->party[j].species = GetMonData(mon, MON_DATA_SPECIES, NULL);
                team->party[j].level = GetMonData(mon, MON_DATA_LEVEL, NULL);
                team->party[j].form = GetMonData(mon, MON_DATA_FORM, NULL);
                team->party[j].personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
                team->party[j].otid = GetMonData(mon, MON_DATA_OTID, NULL);
                team->party[j].moves[0] = GetMonData(mon, MON_DATA_MOVE1, NULL);
                team->party[j].moves[1] = GetMonData(mon, MON_DATA_MOVE2, NULL);
                team->party[j].moves[2] = GetMonData(mon, MON_DATA_MOVE3, NULL);
                team->party[j].moves[3] = GetMonData(mon, MON_DATA_MOVE4, NULL);
                if (string != NULL) {
                    GetMonData(mon, MON_DATA_NICKNAME_3, string);
                    CopyStringToU16Array(string, team->party[j].nickname, POKEMON_NAME_LENGTH + 1);
                    GetMonData(mon, MON_DATA_OT_NAME_2, string);
                    CopyStringToU16Array(string, team->party[j].otname, PLAYER_NAME_LENGTH + 1);
                } else {
                    team->party[j].nickname[0] = EOS;
                    team->party[j].otname[0] = EOS;
                }
                j++;
            }
            ReleaseMonLock(mon, lock);
        }
        team->year = date->year;
        team->month = date->month;
        team->day = date->day;
        hof->next_record++;
        if (hof->next_record >= NUM_HOF_RECORDS) {
            hof->next_record = 0;
        }
        hof->num_total++;
        if (string != NULL) {
            String_Delete(string);
        }
    }
}

u32 Save_HOF_GetNumRecords(const HALL_OF_FAME *hallOfFame) {
    ASSERT_HALL_OF_FAME(hallOfFame);
    u32 ret = hallOfFame->num_total;
    if (ret >= NUM_HOF_RECORDS) {
        ret = NUM_HOF_RECORDS;
    }
    return ret;
}

int Save_HOF_TranslateRecordIdx(const HALL_OF_FAME *hallOfFame, int num) {
    ASSERT_HALL_OF_FAME(hallOfFame);
    GF_ASSERT(num < NUM_HOF_RECORDS);
    return hallOfFame->num_total - num;
}

u32 Save_HOF_RecordCountMons(HALL_OF_FAME *hallOfFame, int num) {
    u32 i;
    HOFTEAM *team;

    ASSERT_HALL_OF_FAME(hallOfFame);
    GF_ASSERT(num < NUM_HOF_RECORDS);
    team = HallOfFame_SeekBack(hallOfFame, num);
    for (i = 0; i < PARTY_SIZE; i++) {
        if (team->party[i].species == SPECIES_NONE) {
            break;
        }
    }
    return i;
}

void Save_HOF_GetMonStatsByIndexPair(HALL_OF_FAME *hallOfFame, int teamNum, int monNum, SHOW_HOFMON *dest) {
    int i;
    const HOFTEAM *team;
    const HOFMON *mon;

    ASSERT_HALL_OF_FAME(hallOfFame);
    GF_ASSERT(teamNum < NUM_HOF_RECORDS);
    team = HallOfFame_SeekBack(hallOfFame, teamNum);
    mon = &team->party[monNum];

    dest->species = mon->species;
    dest->level = mon->level;
    dest->personality = mon->personality;
    dest->otid = mon->otid;
    dest->form = mon->form;
    CopyU16ArrayToString(dest->nickname, mon->nickname);
    CopyU16ArrayToString(dest->otname, mon->otname);
    for (i = 0; i < 4; i++) {
        dest->moves[i] = mon->moves[i];
    }
}

void Save_HOF_GetClearDate(HALL_OF_FAME * hof, int num, RTCDate * dest) {
    HOFTEAM *party;
    ASSERT_HALL_OF_FAME(hof);
    GF_ASSERT(num < NUM_HOF_RECORDS);
    party = HallOfFame_SeekBack(hof, num);
    dest->year = party->year;
    dest->month = party->month;
    dest->day = party->day;
    dest->week = RTC_WEEK_SUNDAY;
}
