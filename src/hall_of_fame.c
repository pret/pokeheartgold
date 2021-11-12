#include "hall_of_fame.h"
#include "party.h"

#define ASSERT_HALL_OF_FAME(hof) ({                \
    GF_ASSERT(hof != NULL);                        \
    GF_ASSERT(hof->next_record < NUM_HOF_RECORDS); \
})

u32 Sav2_HOF_sizeof(void) {
    return sizeof(HALL_OF_FAME);
}

void Sav2_HOF_init(HALL_OF_FAME *hof) {
    MI_CpuClear32(hof, sizeof(HALL_OF_FAME));
}

void Sav2_HOF_RecordParty(HALL_OF_FAME *hof, SAVE_PARTY_T *party, RTCDate *date) {
    ASSERT_HALL_OF_FAME(hof);
    if (hof->num_total < 9999) {
        HOFTEAM *team = &hof->parties[hof->next_record];
        int npokes = GetPartyCount(party);
        STRING *string = String_ctor(POKEMON_NAME_LENGTH + 1, 0);
        int i, j;

        MI_CpuClear16(team->party, sizeof(team->party));

        for (i = 0, j = 0; i < npokes; i++) {
            POKEMON *pokemon = GetPartyMonByIndex(party, i);
            BOOL lock = AcquireMonLock(pokemon);
            if (!GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
                team->party[j].species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
                team->party[j].level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);
                team->party[j].forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
                team->party[j].personality = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
                team->party[j].otid = GetMonData(pokemon, MON_DATA_OTID, NULL);
                team->party[j].moves[0] = GetMonData(pokemon, MON_DATA_MOVE1, NULL);
                team->party[j].moves[1] = GetMonData(pokemon, MON_DATA_MOVE2, NULL);
                team->party[j].moves[2] = GetMonData(pokemon, MON_DATA_MOVE3, NULL);
                team->party[j].moves[3] = GetMonData(pokemon, MON_DATA_MOVE4, NULL);
                if (string != NULL) {
                    GetMonData(pokemon, MON_DATA_NICKNAME_3, string);
                    CopyStringToU16Array(string, team->party[j].nickname, POKEMON_NAME_LENGTH + 1);
                    GetMonData(pokemon, MON_DATA_OT_NAME_2, string);
                    CopyStringToU16Array(string, team->party[j].otname, OT_NAME_LENGTH + 1);
                } else {
                    team->party[j].nickname[0] = EOS;
                    team->party[j].otname[0] = EOS;
                }
                j++;
            }
            ReleaseMonLock(pokemon, lock);
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
            String_dtor(string);
        }
    }
}

u32 sub_0202E298(const HALL_OF_FAME *hallOfFame) {
    ASSERT_HALL_OF_FAME(hallOfFame);
    u32 ret = hallOfFame->num_total;
    if (ret >= NUM_HOF_RECORDS) {
        ret = NUM_HOF_RECORDS;
    }
    return ret;
}

int sub_0202E2C4(const HALL_OF_FAME *hallOfFame, int num) {
    ASSERT_HALL_OF_FAME(hallOfFame);
    GF_ASSERT(num < NUM_HOF_RECORDS);
    return hallOfFame->num_total - num;
}
