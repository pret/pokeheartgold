#include "pokedex.h"
#include "pokemon.h"
#include "constants/species.h"
#include "constants/johto_dex.h"

#define POKEDEX_MAGIC (0xBEEFCAFE)
#define ASSERT_POKEDEX(pokedex) do { GF_ASSERT((pokedex)->magic == POKEDEX_MAGIC);} while (0)

extern int sub_02091278(u32 a0);

void sub_020299CC(POKEDEX *pokedex);
u16 *LoadSpeciesToJohtoDexNoLUT(void);
void sub_0202A5DC(POKEDEX *pokedex);

u32 Save_Pokedex_sizeof(void) {
    return sizeof(POKEDEX);
}

POKEDEX *Pokedex_new(HeapID heapId) {
    POKEDEX *ret = AllocFromHeap(heapId, sizeof(POKEDEX));
    Save_Pokedex_init(ret);
    return ret;
}

void Pokedex_copy(const POKEDEX *src, POKEDEX *dest) {
    MI_CpuCopy8(src, dest, sizeof(POKEDEX));
}

BOOL DexSpeciesIsInvalid(u16 species) {
    if (species == SPECIES_NONE || species > SPECIES_ARCEUS) {
        GF_ASSERT(0);
        return TRUE;
    }

    return FALSE;
}

static inline BOOL CheckDexFlag(const u8 *array, u16 flagId) {
    flagId--;
    return (array[flagId >> 3] & (1 << (flagId & 7))) != 0;
}

static inline void SetDexFlag(u8 *array, u16 flagId) {
    flagId--;
    array[flagId >> 3] |= (1 << (flagId & 7));
}

static inline void SetDexFlagState(u8 *array, u8 state, u16 flagId) {
    GF_ASSERT(state < 2);
    flagId --;
    array[flagId >> 3] &= ~(1 << (flagId & 7));
    array[flagId >> 3] |= (state << (flagId & 7));
}

static inline int CheckDex2Flag(const u8 *array, u16 _2flagId) {
    return (array[_2flagId >> 2] >> (2 * (_2flagId % 4u))) & 3;
}

static inline void SetDex2FlagState(u8 *array, u8 state, u16 _2flagId) {
    GF_ASSERT(state < 4);
    array[_2flagId >> 2] &= ~(3 << (2 * (_2flagId % 4u)));
    array[_2flagId >> 2] |= (state << (2 * (_2flagId % 4u)));
}

static inline int CheckDex4Flag(u32 *a0, u8 a1) {
    return (a0[15] >> (24 + 4 * a1)) & 15;
}

static inline void SetDex4Flag(u32 *flags, u8 a1, u8 a2) {
    flags[15] &= ~(15 << (24 + 4 * a2));
    flags[15] |= (a1 << (24 + 4 * a2));
}

static inline int CheckDex3Flag(const u32 *arr, u32 idx) {
    return ((*arr) >> (3 * idx)) & 7;
}

static inline void SetDex3Flag(u32 *arr, u32 idx, u32 forme) {
    GF_ASSERT(forme < 7);
    *arr &= ~(7 << (3 * idx));
    *arr |= (forme << (3 * idx));
}

static inline u8 CheckDexGender(const u8 *arr, u16 species) {
    if (CheckDexFlag(arr, species)) {
        return MON_FEMALE;
    } else {
        return MON_MALE;
    }
}

void sub_02029424(POKEDEX *pokeDex, u8 state, u8 num, u16 flagId) {
    if (num == 0) {
        SetDexFlagState((u8 *)pokeDex->unk_084[1], state, flagId);
    }
    SetDexFlagState((u8 *)pokeDex->unk_084[num], state, flagId);
}

void sub_0202949C(POKEDEX *pokeDex, u8 state, u8 num, u16 flagId) {
    GF_ASSERT(state <= 2);
    if (state == 2) {
        state = 0;
    }
    sub_02029424(pokeDex, state, num, flagId);
}

u8 *sub_020294C4(POKEDEX *pokedex, u32 species) {
    switch (species) {
    case SPECIES_SHELLOS:
        return &pokedex->shellosFormeOrder; // + 264;
    case SPECIES_GASTRODON:
        return &pokedex->gastrodonFormeOrder; // + 265;
    case SPECIES_SHAYMIN:
        return &pokedex->shayminFormeOrder; // + 828;
    case SPECIES_GIRATINA:
        return &pokedex->giratinaFormeOrder; // + 829;
    case SPECIES_BURMY:
        return &pokedex->burmyFormeOrder; // + 266;
    case SPECIES_WORMADAM:
        return &pokedex->wormadamFormeOrder; // + 267;
    case SPECIES_PICHU:
        return &pokedex->pichuFormeOrder; // + 830;
    default:
        GF_ASSERT(0);
        return NULL;
    }
}

int sub_02029558(const POKEDEX *pokedex, BOOL a1) {
    int i, j = 0;
    const u8 *arr;
    if (a1) {
        arr = pokedex->unk_128;
    } else {
        arr = pokedex->unk_10C;
    }
    for (i = 0; i < UNOWN_FORME_MAX; i++, j++) {
        if (arr[i] == 0xFF) {
            break;
        }
    }
    return j;
}

BOOL sub_0202957C(const POKEDEX *pokedex, u8 letter, BOOL a2) {
    int i;
    const u8 *arr;
    if (a2) {
        arr = pokedex->unk_128;
    } else {
        arr = pokedex->unk_10C;
    }
    for (i = 0; i < UNOWN_FORME_MAX; i++) {
        if (arr[i] == letter) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_020295A0(POKEDEX *pokedex, int letter, BOOL a2) {
    u8 *arr;
    int idx;
    if (a2) {
        arr = pokedex->unk_128;
    } else {
        arr = pokedex->unk_10C;
    }
    if (!sub_0202957C(pokedex, letter, a2)) {
        idx = sub_02029558(pokedex, a2);
        if (idx < UNOWN_FORME_MAX) {
            arr[idx] = letter;
        }
    }
}

int sub_020295D4(POKEDEX *pokedex, u32 species) {
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    flag_p = sub_020294C4(pokedex, species);
    if (CheckDexFlag(flag_p, 1) == CheckDexFlag(flag_p, 2)) {
        return 1;
    } else {
        return 2;
    }
}

BOOL sub_0202963C(POKEDEX *pokedex, u32 species, u8 state) {
    u8 *flag_p;
    u32 n;
    int i;
    BOOL flag;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return FALSE;
    }
    flag_p = sub_020294C4(pokedex, species);
    n = sub_020295D4(pokedex, species);
    for (i = 0; i < n; i++) {
        flag = CheckDexFlag(flag_p, i + 1);
        if (flag == state) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_020296C8(POKEDEX *pokedex, u32 species, BOOL state) {
    int r4;
    u8 *r5;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!sub_0202963C(pokedex, species, state)) {
        r5 = sub_020294C4(pokedex, species);
        r4 = sub_020295D4(pokedex, species);
        if (r4 < 2) {
            SetDexFlagState(r5, state, r4 + 1);
            if (r4 == 0) {
                SetDexFlagState(r5, state, r4 + 2);
            }
        }
    }
}

int sub_02029790(POKEDEX *pokedex, u32 species) {
    int i;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    flag_p = sub_020294C4(pokedex, species);
    for (i = 0; i < 3; i++) {
        if (CheckDex2Flag(flag_p, i) == 3) {
            break;
        }
    }
    return i;
}

BOOL sub_020297EC(POKEDEX *pokedex, u32 species, u8 state) {
    int i;
    u32 flag;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return FALSE;
    }
    flag_p = sub_020294C4(pokedex, species);
    for (i = 0; i < 3; i++) {
        flag = CheckDex2Flag(flag_p, i);
        if (flag == state) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_0202984C(POKEDEX *pokedex, u32 species, u32 state) {
    int n;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!sub_020297EC(pokedex, species, state)) {
        flag_p = sub_020294C4(pokedex, species);
        n = sub_02029790(pokedex, species);
        if (n < 3) {
            SetDex2FlagState(flag_p, state, n);
        }
    }
}

void sub_020298C4(u32 *flags, u8 a1, u8 a2) {
    SetDex4Flag(flags, a1, a2);
}

void sub_020298E0(POKEDEX *pokedex, u8 a1, u8 a2) {
    GF_ASSERT(a2 < 4);
    GF_ASSERT(a1 <= 15);
    if (a2 < 2) {
        sub_020298C4(pokedex->caughtSpecies, a1, a2);
    } else {
        sub_020298C4(pokedex->seenSpecies, a1, a2 - 2);
    }
}

u32 sub_0202991C(POKEDEX *pokedex, u8 a1) {
    if (a1 < 2) {
        return CheckDex4Flag(pokedex->caughtSpecies, a1);
    } else {
        return CheckDex4Flag(pokedex->seenSpecies, a1 - 2);
    }
}

int sub_02029948(POKEDEX *pokedex) {
    int i;
    for (i = 0; i < 4; i++) {
        if (sub_0202991C(pokedex, i) == 15) {
            break;
        }
    }
    return i;
}

BOOL sub_02029968(POKEDEX *pokedex, u32 a1) {
    int i;
    u32 val;
    for (i = 0; i < 4; i++) {
        val = sub_0202991C(pokedex, i);
        if (a1 == val) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_0202998C(POKEDEX *pokedex, u16 species, POKEMON *pokemon) {
    u8 forme;

    forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
    if (species == SPECIES_DEOXYS) {
        if (!sub_02029968(pokedex, forme)) {
            sub_020298E0(pokedex, forme, sub_02029948(pokedex));
        }
    }
}

void sub_020299CC(POKEDEX *pokedex) {
    int i;
    for (i = 0; i < 4; i++) {
        sub_020298E0(pokedex, 15, i);
    }
}

int sub_020299E8(const POKEDEX *pokedex, u32 species) {
    int i, n;

    GF_ASSERT(species == SPECIES_ROTOM);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    n = 0;
    for (i = 0; i < 6; i++, n++) {
        if (CheckDex3Flag(&pokedex->rotomFormeOrder, i) == 7) {
            break;
        }
    }
    return n;
}

BOOL sub_02029A34(POKEDEX *pokedex, u32 species, u8 forme) {
    int i, val;
    u32 n;

    GF_ASSERT(species == SPECIES_ROTOM);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    n = sub_020299E8(pokedex, species);
    for (i = 0; i < n; i++) {
        val = CheckDex3Flag(&pokedex->rotomFormeOrder, i);
        if (val == forme) {
            return TRUE;
        }
    }
    return FALSE;
}

void sub_02029A90(POKEDEX *pokedex, u32 species, u32 forme) {
    int i;
    GF_ASSERT(species == SPECIES_ROTOM);
    if (!sub_02029A34(pokedex, species, forme)) {
        i = sub_020299E8(pokedex, species);
        if (i < 6) {
            SetDex3Flag(&pokedex->rotomFormeOrder, i, forme);
        }
    }
}

void sub_02029AF0(POKEDEX *pokedex, u16 species, POKEMON *pokemon) {
    u32 forme;

    forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
    switch (species) {
    case SPECIES_UNOWN:
        sub_020295A0(pokedex, forme, FALSE);
        break;
    case SPECIES_BURMY:
    case SPECIES_WORMADAM:
        sub_0202984C(pokedex, species, forme);
        break;
    case SPECIES_PICHU:
        if (forme == 0) {
            if (GetMonGender(pokemon) == MON_MALE) {
                forme = 0;
            } else {
                forme = 1;
            }
        } else {
            forme = 2;
        }
        sub_0202984C(pokedex, species, forme);
        break;
    case SPECIES_SHELLOS:
    case SPECIES_GASTRODON:
        sub_020296C8(pokedex, species, forme);
        break;
    case SPECIES_DEOXYS:
        sub_0202998C(pokedex, species, pokemon);
        break;
    case SPECIES_SHAYMIN:
    case SPECIES_GIRATINA:
        sub_020296C8(pokedex, species, forme);
        break;
    case SPECIES_ROTOM:
        sub_02029A90(pokedex, species, forme);
        break;
    }
}

void sub_02029BE0(POKEDEX *pokedex, u32 species, u32 a2) {
    int shift;

    shift = sub_02091278(a2);
    if (shift != 6) {
        pokedex->unk_144[species] |= (1 << shift);
    }
}

int sub_02029C04(POKEDEX *pokedex, u16 species, u32 a2) {
    int ratio;
    u8 r1, r0;

    if (GetMonBaseStat(species, BASE_GENDER_RATIO) == MON_RATIO_UNKNOWN) {
        if (a2 == 0) {
            return 2;
        } else {
            return -1;
        }
    }
    r1 = CheckDexFlag((u8 *)pokedex->unk_084[0], species);
    if (a2 == 1) {
        r0 = CheckDexFlag((u8 *)pokedex->unk_084[1], species);
        if (r0 == r1) {
            return -1;
        }
        return r0;
    }
    return r1;
}

BOOL sub_02029C7C(POKEDEX *pokedex, u32 species, int a2) {
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    GF_ASSERT(a2 < 2);
    return CheckDexFlag(sub_020294C4(pokedex, species), a2 + 1);
}

int sub_02029CDC(POKEDEX *pokedex, u32 species, int a2) {
    GF_ASSERT(species == SPECIES_ROTOM);
    GF_ASSERT(a2 < 6);
    return CheckDex3Flag(&pokedex->rotomFormeOrder, a2);
}

int sub_02029D0C(POKEDEX *pokedex, u32 species, int a2) {
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    GF_ASSERT(a2 < 3);
    return CheckDex2Flag(sub_020294C4(pokedex, species), a2);
}

static const u16 sNationalMythicals[] = {
    SPECIES_MEW,
    SPECIES_CELEBI,
    SPECIES_JIRACHI,
    SPECIES_DEOXYS,
    SPECIES_PHIONE,
    SPECIES_MANAPHY,
    SPECIES_DARKRAI,
    SPECIES_SHAYMIN,
    SPECIES_ARCEUS,
};

BOOL SpeciesIsNotNationalMythical(u16 species) {
    int i;
    BOOL result;

    for (i = 0, result = TRUE; i < (s32)NELEMS(sNationalMythicals); i++) {
        if (species == sNationalMythicals[i]) {
            result = FALSE;
        }
    }
    return result;
}

static const u16 sJohtoMythicals[] = {
    SPECIES_MEW,
    SPECIES_CELEBI,
};

BOOL SpeciesIsNotJohtoMythical(u16 species) {
    int i;
    BOOL result;

    for (i = 0, result = TRUE; i < (s32)NELEMS(sJohtoMythicals); i++) {
        if (species == sJohtoMythicals[i]) {
            result = FALSE;
        }
    }
    return result;
}

void Save_Pokedex_init(POKEDEX *pokedex) {
    memset(pokedex, 0, sizeof(POKEDEX));
    pokedex->magic = POKEDEX_MAGIC;
    pokedex->nationalDex = 0;
    memset(pokedex->unk_10C, 0xFF, 28);
    memset(pokedex->unk_128, 0xFF, 28);
    pokedex->shellosFormeOrder = 0xFF;
    pokedex->gastrodonFormeOrder = 0xFF;
    pokedex->burmyFormeOrder = 0xFF;
    pokedex->wormadamFormeOrder = 0xFF;
    pokedex->rotomFormeOrder = -1;
    pokedex->shayminFormeOrder = 0xFF;
    pokedex->giratinaFormeOrder = 0xFF;
    pokedex->pichuFormeOrder = 0xFF;
    sub_020299CC(pokedex);
}

u16 Pokedex_CountNationalDexOwned(POKEDEX *pokedex) {
    int i, n;
    ASSERT_POKEDEX(pokedex);
    n = 0;
    for (i = 1; i <= NATIONAL_DEX_COUNT; i++) {
        if (Pokedex_CheckMonCaughtFlag(pokedex, i) == TRUE) {
            n++;
        }
    }
    return n;
}

u16 Pokedex_CountNationalDexSeen(POKEDEX *pokedex) {
    int i, n;
    ASSERT_POKEDEX(pokedex);
    n = 0;
    for (i = 1; i <= NATIONAL_DEX_COUNT; i++) {
        if (Pokedex_CheckMonSeenFlag(pokedex, i) == TRUE) {
            n++;
        }
    }
    return n;
}

u16 sub_02029E84(POKEDEX *pokedex) {
    if (Pokedex_GetNatDexFlag(pokedex)) {
        return Pokedex_CountNationalDexOwned(pokedex);
    } else {
        return Pokedex_CountJohtoDexOwned(pokedex);
    }
}

u16 Pokedex_CountJohtoDexOwned(POKEDEX *pokedex) {
    u16 *johto_species;
    u16 i, n;
    ASSERT_POKEDEX(pokedex);
    johto_species = LoadSpeciesToJohtoDexNoLUT();
    n = 0;
    for (i = 1; i <= NATIONAL_DEX_COUNT; i++) {
        if (Pokedex_CheckMonCaughtFlag(pokedex, i) == TRUE && johto_species[i] != J_SPECIES_NONE) {
            n++;
        }
    }
    FreeToHeap(johto_species);
    return n;
}

u16 Pokedex_CountJohtoDexSeen(POKEDEX *pokedex) {
    u16 *johto_species;
    u16 i, n;
    ASSERT_POKEDEX(pokedex);
    johto_species = LoadSpeciesToJohtoDexNoLUT();
    n = 0;
    for (i = 1; i <= NATIONAL_DEX_COUNT; i++) {
        if (Pokedex_CheckMonSeenFlag(pokedex, i) == TRUE && johto_species[i] != J_SPECIES_NONE) {
            n++;
        }
    }
    FreeToHeap(johto_species);
    return n;
}

BOOL Pokedex_NationalDexIsComplete(POKEDEX *pokedex) {
    return Pokedex_CountNationalOwned_ExcludeMythical(pokedex) >= (NATIONAL_DEX_COUNT - NELEMS(sNationalMythicals));
}

BOOL Pokedex_JohtoDexIsComplete(POKEDEX *pokedex) {
    return Pokedex_CountJohtoOwned_ExcludeMythical(pokedex) >= (J_NUM_SPECIES - NELEMS(sJohtoMythicals));
}

u16 Pokedex_CountNationalOwned_ExcludeMythical(POKEDEX *pokedex) {
    int i;
    u16 n;

    n = 0;
    for (i = 1; i <= NATIONAL_DEX_COUNT; i++) {
        if (Pokedex_CheckMonCaughtFlag(pokedex, i) == TRUE && SpeciesIsNotNationalMythical(i) == TRUE) {
            n++;
        }
    }
    return n;
}

u16 Pokedex_CountJohtoOwned_ExcludeMythical(POKEDEX *pokedex) {
    u16 i;
    u16 n;
    u16 *johto_dex;

    johto_dex = LoadSpeciesToJohtoDexNoLUT();
    n = 0;
    for (i = 1; i <= NATIONAL_DEX_COUNT; i++) {
        if (Pokedex_CheckMonCaughtFlag(pokedex, i) == TRUE && johto_dex[i] != J_SPECIES_NONE && SpeciesIsNotJohtoMythical(i) == TRUE) {
            n++;
        }
    }
    FreeToHeap(johto_dex);
    return n;
}

BOOL Pokedex_CheckMonCaughtFlag(const POKEDEX *pokedex, const u16 species) {
    ASSERT_POKEDEX(pokedex);
    if (DexSpeciesIsInvalid(species)) {
        return FALSE;
    }
    if (CheckDexFlag((const u8 *)pokedex->caughtSpecies, species) && CheckDexFlag((const u8 *)pokedex->seenSpecies, species)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL Pokedex_CheckMonSeenFlag(const POKEDEX *pokedex, const u16 species) {
    ASSERT_POKEDEX(pokedex);
    if (DexSpeciesIsInvalid(species)) {
        return FALSE;
    }
    if (CheckDexFlag((const u8 *)pokedex->seenSpecies, species)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

u32 Pokedex_GetSeenSpindaPersonality(POKEDEX *pokedex, u32 arg) {
    u32 personality;
    ASSERT_POKEDEX(pokedex);
    if (arg == 0) {
        personality = pokedex->spindaPersonality;
    } else {
        GF_ASSERT(0);
    }
    return personality;
}

int sub_0202A0B4(POKEDEX *pokedex, u16 species, u32 a2) {
    ASSERT_POKEDEX(pokedex);
    if (DexSpeciesIsInvalid(species)) {
        return -1;
    }
    if (CheckDexFlag((u8 *)pokedex->seenSpecies, species)) {
        return sub_02029C04(pokedex, species, a2);
    }
    return -1;
}

int sub_0202A108(POKEDEX *pokedex, int a1, u32 a2) {
    ASSERT_POKEDEX(pokedex);
    if (sub_02029558(pokedex, a2) <= a1) {
        return -1;
    }
    if (a2) {
        return pokedex->unk_128[a1];
    } else {
        return pokedex->unk_10C[a1];
    }
}

u32 sub_0202A14C(POKEDEX *pokedex, u32 a1) {
    ASSERT_POKEDEX(pokedex);
    return sub_02029558(pokedex, a1);
}

int sub_0202A16C(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (sub_020295D4(pokedex, SPECIES_SHELLOS) <= a1) {
        return -1;
    }
    return sub_02029C7C(pokedex, SPECIES_SHELLOS, a1);
}

u32 sub_0202A1A4(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return sub_020295D4(pokedex, SPECIES_SHELLOS);
}

int sub_0202A1C8(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (sub_020295D4(pokedex, SPECIES_GASTRODON) <= a1) {
        return -1;
    }
    return sub_02029C7C(pokedex, SPECIES_GASTRODON, a1);
}

u32 sub_0202A200(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return sub_020295D4(pokedex, SPECIES_GASTRODON);
}

int sub_0202A224(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (sub_02029790(pokedex, SPECIES_BURMY) <= a1) {
        return -1;
    }
    return sub_02029D0C(pokedex, SPECIES_BURMY, a1);
}

u32 sub_0202A25C(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return sub_02029790(pokedex, SPECIES_BURMY);
}

int sub_0202A27C(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (sub_02029790(pokedex, SPECIES_WORMADAM) <= a1) {
        return -1;
    }
    return sub_02029D0C(pokedex, SPECIES_WORMADAM, a1);
}

u32 sub_0202A2B4(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return sub_02029790(pokedex, SPECIES_WORMADAM);
}

int sub_0202A2D8(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (sub_02029790(pokedex, SPECIES_PICHU) <= a1) {
        return -1;
    }
    return sub_02029D0C(pokedex, SPECIES_PICHU, a1);
}

u32 sub_0202A30C(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return sub_02029790(pokedex, SPECIES_PICHU);
}

u32 sub_0202A32C(POKEDEX *pokedex, u32 a1) {
    ASSERT_POKEDEX(pokedex);
    return sub_0202991C(pokedex, a1);
}

u32 sub_0202A350(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return sub_02029948(pokedex);
}

void sub_0202A36C(POKEDEX *pokedex, POKEMON *pokemon) {
    u16 species;
    u32 personality;
    u32 gender;
    u8 seenGender;

    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    personality = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
    gender = GetMonGender(pokemon);

    ASSERT_POKEDEX(pokedex);
    if (!DexSpeciesIsInvalid(species)) {
        if (!CheckDexFlag((const u8 *)pokedex->seenSpecies, species)) {
            if (species == SPECIES_SPINDA) {
                pokedex->spindaPersonality = personality;
            }
            sub_0202949C(pokedex, gender, 0, species);
        } else {
            seenGender = CheckDexFlag((const u8 *)pokedex->unk_084[0], species);
            if (seenGender != gender) {
                sub_0202949C(pokedex, gender, 1, species);
            }
        }
        sub_02029AF0(pokedex, species, pokemon);
        SetDexFlag((u8 *)pokedex->seenSpecies, species);
    }
}

void Pokedex_SetMonCaughtFlag(POKEDEX *pokedex, POKEMON *pokemon) {
    u16 species;
    u32 language;
    u32 personality;
    u32 gender;
    u32 gender_ct;

    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    language = GetMonData(pokemon, MON_DATA_GAME_LANGUAGE, NULL);
    personality = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
    gender = GetMonGender(pokemon);

    ASSERT_POKEDEX(pokedex);
    if (!DexSpeciesIsInvalid(species)) {
        if (!CheckDexFlag((const u8 *)pokedex->seenSpecies, species)) {
            if (species == SPECIES_SPINDA) {
                pokedex->spindaPersonality = personality;
            }
            sub_0202949C(pokedex, gender, 0, species);
        } else {
            gender_ct = CheckDexGender((const u8 *)pokedex->unk_084[0], species);
            if (gender_ct != gender) {
                sub_0202949C(pokedex, gender, 1, species);
            }
        }
        sub_02029AF0(pokedex, species, pokemon);
        if (species == SPECIES_UNOWN) {
            sub_020295A0(pokedex, GetMonUnownLetter(pokemon), 1);
        }
        sub_02029BE0(pokedex, species, language);
        if (language != GAME_LANGUAGE) {
            sub_0202A5DC(pokedex);
        }
        SetDexFlag((u8 *)pokedex->caughtSpecies, species);
        SetDexFlag((u8 *)pokedex->seenSpecies, species);
    }
}

void sub_0202A53C(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    pokedex->nationalDex = TRUE;
}

BOOL Pokedex_GetNatDexFlag(const POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return pokedex->nationalDex;
}

void sub_0202A57C(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    pokedex->unk_334 = TRUE;
}

BOOL sub_0202A59C(POKEDEX *pokedex, u32 a1, u32 a2) {
    int shift;
    GF_ASSERT(a2 <= 8);
    ASSERT_POKEDEX(pokedex);
    shift = sub_02091278(a2);
    if (pokedex->unk_144[a1] & (1 << shift)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void sub_0202A5DC(POKEDEX *pokedex) {
    pokedex->unk_335 = TRUE;
}

BOOL sub_0202A5E8(const POKEDEX *pokedex) {
    return pokedex->unk_335;
}

BOOL sub_0202A5F4(const POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return pokedex->unk_336;
}

void Pokedex_Enable(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    pokedex->unk_336 = TRUE;
}

POKEDEX *Sav2_Pokedex_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_POKEDEX);
}

int sub_0202A640(POKEDEX *pokedex, int species, int forme) {
    ASSERT_POKEDEX(pokedex);
    switch (species) {
    case SPECIES_UNOWN:
        if (forme < sub_0202A14C(pokedex, 0)) {
            return sub_0202A108(pokedex, forme, 0);
        }
        break;
    case SPECIES_SHELLOS:
        if (forme < sub_0202A1A4(pokedex)) {
            return sub_0202A16C(pokedex, forme);
        }
        break;
    case SPECIES_GASTRODON:
        if (forme < sub_0202A200(pokedex)) {
            return sub_0202A1C8(pokedex, forme);
        }
        break;
    case SPECIES_BURMY:
        if (forme < sub_0202A25C(pokedex)) {
            return sub_0202A224(pokedex, forme);
        }
        break;
    case SPECIES_WORMADAM:
        if (forme < sub_0202A2B4(pokedex)) {
            return sub_0202A27C(pokedex, forme);
        }
        break;
    case SPECIES_PICHU:
        if (forme < sub_0202A30C(pokedex)) {
            return sub_0202A2D8(pokedex, forme);
        }
        break;
    case SPECIES_DEOXYS:
        if (forme < sub_0202A350(pokedex)) {
            return sub_0202A32C(pokedex, forme);
        }
        break;
    case SPECIES_SHAYMIN:
    case SPECIES_GIRATINA:
        if (forme < sub_020295D4(pokedex, species)) {
            return sub_02029C7C(pokedex, species, forme);
        }
        break;
    case SPECIES_ROTOM:
        if (forme < sub_020299E8(pokedex, SPECIES_ROTOM)) {
            return sub_02029CDC(pokedex, SPECIES_ROTOM, forme);
        }
        break;
    }
    return 0;
}

int sub_0202A798(POKEDEX *pokedex, int species) {
    ASSERT_POKEDEX(pokedex);
    switch (species) {
    case SPECIES_UNOWN:
        return sub_0202A14C(pokedex, 0);
    case SPECIES_SHELLOS:
        return sub_0202A1A4(pokedex);
    case SPECIES_GASTRODON:
        return sub_0202A200(pokedex);
    case SPECIES_BURMY:
        return sub_0202A25C(pokedex);
    case SPECIES_WORMADAM:
        return sub_0202A2B4(pokedex);
    case SPECIES_PICHU:
        return sub_0202A30C(pokedex);
    case SPECIES_DEOXYS:
        return sub_0202A350(pokedex);
    case SPECIES_SHAYMIN:
        return sub_020295D4(pokedex, SPECIES_SHAYMIN);
    case SPECIES_GIRATINA:
        return sub_020295D4(pokedex, SPECIES_GIRATINA);
    case SPECIES_ROTOM:
        return sub_020299E8(pokedex, SPECIES_ROTOM);
    }
    return 1;
}
