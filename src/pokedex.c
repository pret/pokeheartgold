#include "pokedex.h"
#include "pokemon.h"
#include "unk_02091278.h"
#include "constants/species.h"
#include "constants/johto_dex.h"

#define POKEDEX_MAGIC (0xBEEFCAFE)
#define ASSERT_POKEDEX(pokedex) do { GF_ASSERT((pokedex)->magic == POKEDEX_MAGIC);} while (0)

void Pokedex_InitDeoxysFormeOrder(POKEDEX *pokedex);
u16 *LoadSpeciesToJohtoDexNoLUT(void);
void Pokedex_SetInternationalViewFlag(POKEDEX *pokedex);

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

static inline int CheckDex4Flag(u32 *flags, u8 idx) {
    return (flags[15] >> (24 + 4 * idx)) & 15;
}

static inline void SetDex4Flag(u32 *flags, u8 forme, u8 idx) {
    flags[15] &= ~(15 << (24 + 4 * idx));
    flags[15] |= (forme << (24 + 4 * idx));
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

static void Pokedex_SetSeenGenderFlagInternal(POKEDEX *pokeDex, u8 state, u8 num, u16 flagId) {
    if (num == 0) {
        SetDexFlagState((u8 *)pokeDex->seenGenders[1], state, flagId);
    }
    SetDexFlagState((u8 *)pokeDex->seenGenders[num], state, flagId);
}

static void Pokedex_SetSeenGenderFlag(POKEDEX *pokeDex, u8 state, u8 num, u16 flagId) {
    GF_ASSERT(state <= 2);
    if (state == 2) {
        state = 0;
    }
    Pokedex_SetSeenGenderFlagInternal(pokeDex, state, num, flagId);
}

static u8 *Pokedex_GetFormeOrderAddr(POKEDEX *pokedex, u32 species) {
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

static int Pokedex_CountRegisteredUnownLetters(const POKEDEX *pokedex, BOOL caught) {
    int i, j = 0;
    const u8 *arr;
    if (caught) {
        arr = pokedex->unownCaughtOrder;
    } else {
        arr = pokedex->unownSeenOrder;
    }
    for (i = 0; i < UNOWN_FORME_MAX; i++, j++) {
        if (arr[i] == 0xFF) {
            break;
        }
    }
    return j;
}

static BOOL Pokedex_HasAlreadyAddedUnownLetter(const POKEDEX *pokedex, u8 letter, BOOL caught) {
    int i;
    const u8 *arr;
    if (caught) {
        arr = pokedex->unownCaughtOrder;
    } else {
        arr = pokedex->unownSeenOrder;
    }
    for (i = 0; i < UNOWN_FORME_MAX; i++) {
        if (arr[i] == letter) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_TryAppendUnownLetter(POKEDEX *pokedex, int letter, BOOL caught) {
    u8 *arr;
    int idx;
    if (caught) {
        arr = pokedex->unownCaughtOrder;
    } else {
        arr = pokedex->unownSeenOrder;
    }
    if (!Pokedex_HasAlreadyAddedUnownLetter(pokedex, letter, caught)) {
        idx = Pokedex_CountRegisteredUnownLetters(pokedex, caught);
        if (idx < UNOWN_FORME_MAX) {
            arr[idx] = letter;
        }
    }
}

static int Pokedex_GetSeenFormeNum_2max(POKEDEX *pokedex, u32 species) {
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    flag_p = Pokedex_GetFormeOrderAddr(pokedex, species);
    if (CheckDexFlag(flag_p, 1) == CheckDexFlag(flag_p, 2)) {
        return 1;
    } else {
        return 2;
    }
}

static BOOL Pokedex_CheckSeenForme_2max(POKEDEX *pokedex, u32 species, u8 forme) {
    u8 *flag_p;
    u32 n;
    int i;
    BOOL flag;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return FALSE;
    }
    flag_p = Pokedex_GetFormeOrderAddr(pokedex, species);
    n = Pokedex_GetSeenFormeNum_2max(pokedex, species);
    for (i = 0; i < n; i++) {
        flag = CheckDexFlag(flag_p, i + 1);
        if (flag == forme) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_SetSeenForme_2max(POKEDEX *pokedex, u32 species, BOOL state) {
    int r4;
    u8 *r5;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!Pokedex_CheckSeenForme_2max(pokedex, species, state)) {
        r5 = Pokedex_GetFormeOrderAddr(pokedex, species);
        r4 = Pokedex_GetSeenFormeNum_2max(pokedex, species);
        if (r4 < 2) {
            SetDexFlagState(r5, state, r4 + 1);
            if (r4 == 0) {
                SetDexFlagState(r5, state, r4 + 2);
            }
        }
    }
}

static int Pokedex_CountSeenFormes_3max(POKEDEX *pokedex, u32 species) {
    int i;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    flag_p = Pokedex_GetFormeOrderAddr(pokedex, species);
    for (i = 0; i < 3; i++) {
        if (CheckDex2Flag(flag_p, i) == 3) {
            break;
        }
    }
    return i;
}

static BOOL Pokedex_CheckSeenForme_3max(POKEDEX *pokedex, u32 species, u8 state) {
    int i;
    u32 flag;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return FALSE;
    }
    flag_p = Pokedex_GetFormeOrderAddr(pokedex, species);
    for (i = 0; i < 3; i++) {
        flag = CheckDex2Flag(flag_p, i);
        if (flag == state) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_SetSeenForme_3max(POKEDEX *pokedex, u32 species, u32 state) {
    int n;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!Pokedex_CheckSeenForme_3max(pokedex, species, state)) {
        flag_p = Pokedex_GetFormeOrderAddr(pokedex, species);
        n = Pokedex_CountSeenFormes_3max(pokedex, species);
        if (n < 3) {
            SetDex2FlagState(flag_p, state, n);
        }
    }
}

static void Pokedex_DeoxysFormeFlagActionInternal(u32 *flags, u8 forme, u8 idx) {
    SetDex4Flag(flags, forme, idx);
}

static void Pokedex_DeoxysFormeFlagAction(POKEDEX *pokedex, u8 forme, u8 idx) {
    GF_ASSERT(idx < 4);
    GF_ASSERT(forme <= 15);
    if (idx < 2) {
        Pokedex_DeoxysFormeFlagActionInternal(pokedex->caughtSpecies, forme, idx);
    } else {
        Pokedex_DeoxysFormeFlagActionInternal(pokedex->seenSpecies, forme, idx - 2);
    }
}

static u32 Pokedex_GetSeenDeoxysFormeByIndex(POKEDEX *pokedex, u8 forme) {
    if (forme < 2) {
        return CheckDex4Flag(pokedex->caughtSpecies, forme);
    } else {
        return CheckDex4Flag(pokedex->seenSpecies, forme - 2);
    }
}

static int Pokedex_CountSeenDeoxysFormes(POKEDEX *pokedex) {
    int i;
    for (i = 0; i < 4; i++) {
        if (Pokedex_GetSeenDeoxysFormeByIndex(pokedex, i) == 15) {
            break;
        }
    }
    return i;
}

static BOOL Pokedex_CheckSeenDeoxysForme(POKEDEX *pokedex, u32 forme) {
    int i;
    u32 val;
    for (i = 0; i < 4; i++) {
        val = Pokedex_GetSeenDeoxysFormeByIndex(pokedex, i);
        if (forme == val) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_SetSeenDeoxysForme(POKEDEX *pokedex, u16 species, POKEMON *pokemon) {
    u8 forme;

    forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
    if (species == SPECIES_DEOXYS) {
        if (!Pokedex_CheckSeenDeoxysForme(pokedex, forme)) {
            Pokedex_DeoxysFormeFlagAction(pokedex, forme, Pokedex_CountSeenDeoxysFormes(pokedex));
        }
    }
}

static void Pokedex_InitDeoxysFormeOrder(POKEDEX *pokedex) {
    int i;
    for (i = 0; i < 4; i++) {
        Pokedex_DeoxysFormeFlagAction(pokedex, 15, i);
    }
}

static int Pokedex_GetSeenFormeNum_Rotom(const POKEDEX *pokedex, u32 species) {
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

static BOOL Pokedex_CheckSeenRotomForme(POKEDEX *pokedex, u32 species, u8 forme) {
    int i, val;
    u32 n;

    GF_ASSERT(species == SPECIES_ROTOM);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    n = Pokedex_GetSeenFormeNum_Rotom(pokedex, species);
    for (i = 0; i < n; i++) {
        val = CheckDex3Flag(&pokedex->rotomFormeOrder, i);
        if (val == forme) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_SetSeenRotomForme(POKEDEX *pokedex, u32 species, u32 forme) {
    int i;
    GF_ASSERT(species == SPECIES_ROTOM);
    if (!Pokedex_CheckSeenRotomForme(pokedex, species, forme)) {
        i = Pokedex_GetSeenFormeNum_Rotom(pokedex, species);
        if (i < 6) {
            SetDex3Flag(&pokedex->rotomFormeOrder, i, forme);
        }
    }
}

static void Pokedex_TryAppendSeenForme(POKEDEX *pokedex, u16 species, POKEMON *pokemon) {
    u32 forme;

    forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
    switch (species) {
    case SPECIES_UNOWN:
        Pokedex_TryAppendUnownLetter(pokedex, forme, FALSE);
        break;
    case SPECIES_BURMY:
    case SPECIES_WORMADAM:
        Pokedex_SetSeenForme_3max(pokedex, species, forme);
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
        Pokedex_SetSeenForme_3max(pokedex, species, forme);
        break;
    case SPECIES_SHELLOS:
    case SPECIES_GASTRODON:
        Pokedex_SetSeenForme_2max(pokedex, species, forme);
        break;
    case SPECIES_DEOXYS:
        Pokedex_SetSeenDeoxysForme(pokedex, species, pokemon);
        break;
    case SPECIES_SHAYMIN:
    case SPECIES_GIRATINA:
        Pokedex_SetSeenForme_2max(pokedex, species, forme);
        break;
    case SPECIES_ROTOM:
        Pokedex_SetSeenRotomForme(pokedex, species, forme);
        break;
    }
}

static void Pokedex_SetCaughtLanguage(POKEDEX *pokedex, u32 species, u32 language) {
    int shift;

    shift = LanguageToDexFlag(language);
    if (shift != 6) {
        pokedex->caughtLanguages[species] |= (1 << shift);
    }
}

static int Pokedex_SpeciesGetLastSeenGender_Internal(POKEDEX *pokedex, u16 species, u32 idx) {
    int ratio;
    u8 gender1, gender2;

    if (GetMonBaseStat(species, BASE_GENDER_RATIO) == MON_RATIO_UNKNOWN) {
        if (idx == 0) {
            return 2;
        } else {
            return -1;
        }
    }
    gender1 = CheckDexFlag((u8 *)pokedex->seenGenders[0], species);
    if (idx == 1) {
        gender2 = CheckDexFlag((u8 *)pokedex->seenGenders[1], species);
        if (gender2 == gender1) {
            return -1;
        }
        return gender2;
    }
    return gender1;
}

static BOOL Pokedex_GetSeenFormeByIdx_2max(POKEDEX *pokedex, u32 species, int idx) {
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    GF_ASSERT(idx < 2);
    return CheckDexFlag(Pokedex_GetFormeOrderAddr(pokedex, species), idx + 1);
}

static int Pokedex_GetSeenFormeByIdx_Rotom(POKEDEX *pokedex, u32 species, int idx) {
    GF_ASSERT(species == SPECIES_ROTOM);
    GF_ASSERT(idx < 6);
    return CheckDex3Flag(&pokedex->rotomFormeOrder, idx);
}

static int Pokedex_GetSeenFormeByIdx_3max(POKEDEX *pokedex, u32 species, int idx) {
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    GF_ASSERT(idx < 3);
    return CheckDex2Flag(Pokedex_GetFormeOrderAddr(pokedex, species), idx);
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

static BOOL SpeciesIsNotNationalMythical(u16 species) {
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

static BOOL SpeciesIsNotJohtoMythical(u16 species) {
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
    memset(pokedex->unownSeenOrder, 0xFF, 28);
    memset(pokedex->unownCaughtOrder, 0xFF, 28);
    pokedex->shellosFormeOrder = 0xFF;
    pokedex->gastrodonFormeOrder = 0xFF;
    pokedex->burmyFormeOrder = 0xFF;
    pokedex->wormadamFormeOrder = 0xFF;
    pokedex->rotomFormeOrder = -1;
    pokedex->shayminFormeOrder = 0xFF;
    pokedex->giratinaFormeOrder = 0xFF;
    pokedex->pichuFormeOrder = 0xFF;
    Pokedex_InitDeoxysFormeOrder(pokedex);
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

u16 Pokedex_CountDexOwned(POKEDEX *pokedex) {
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

int Pokedex_SpeciesGetLastSeenGender(POKEDEX *pokedex, u16 species, u32 a2) {
    ASSERT_POKEDEX(pokedex);
    if (DexSpeciesIsInvalid(species)) {
        return -1;
    }
    if (CheckDexFlag((u8 *)pokedex->seenSpecies, species)) {
        return Pokedex_SpeciesGetLastSeenGender_Internal(pokedex, species, a2);
    }
    return -1;
}

int Pokedex_GetSeenFormeByIdx_Unown(POKEDEX *pokedex, int idx, u32 caught) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_CountRegisteredUnownLetters(pokedex, caught) <= idx) {
        return -1;
    }
    if (caught) {
        return pokedex->unownCaughtOrder[idx];
    } else {
        return pokedex->unownSeenOrder[idx];
    }
}

u32 Pokedex_GetSeenFormeNum_Unown(POKEDEX *pokedex, BOOL caught) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountRegisteredUnownLetters(pokedex, caught);
}

int Pokedex_GetSeenFormeByIdx_Shellos(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_GetSeenFormeNum_2max(pokedex, SPECIES_SHELLOS) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormeByIdx_2max(pokedex, SPECIES_SHELLOS, a1);
}

static u32 Pokedex_GetSeenFormeNum_Shellos(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_GetSeenFormeNum_2max(pokedex, SPECIES_SHELLOS);
}

static int Pokedex_GetSeenFormeByIdx_Gastrodon(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_GetSeenFormeNum_2max(pokedex, SPECIES_GASTRODON) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormeByIdx_2max(pokedex, SPECIES_GASTRODON, a1);
}

static u32 Pokedex_GetSeenFormeNum_Gastrodon(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_GetSeenFormeNum_2max(pokedex, SPECIES_GASTRODON);
}

static int Pokedex_GetSeenFormeByIdx_Burmy(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_CountSeenFormes_3max(pokedex, SPECIES_BURMY) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormeByIdx_3max(pokedex, SPECIES_BURMY, a1);
}

static u32 Pokedex_GetSeenFormeNum_Burmy(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountSeenFormes_3max(pokedex, SPECIES_BURMY);
}

static int Pokedex_GetSeenFormeByIdx_Wormadam(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_CountSeenFormes_3max(pokedex, SPECIES_WORMADAM) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormeByIdx_3max(pokedex, SPECIES_WORMADAM, a1);
}

static u32 Pokedex_GetSeenFormeNum_Wormadam(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountSeenFormes_3max(pokedex, SPECIES_WORMADAM);
}

static int Pokedex_GetSeenFormeByIdx_Pichu(POKEDEX *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_CountSeenFormes_3max(pokedex, SPECIES_PICHU) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormeByIdx_3max(pokedex, SPECIES_PICHU, a1);
}

static u32 Pokedex_GetSeenFormeNum_Pichu(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountSeenFormes_3max(pokedex, SPECIES_PICHU);
}

static u32 Pokedex_GetSeenFormeByIdx_Deoxys(POKEDEX *pokedex, u32 a1) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_GetSeenDeoxysFormeByIndex(pokedex, a1);
}

static u32 Pokedex_GetSeenFormeNum_Deoxys(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountSeenDeoxysFormes(pokedex);
}

void Pokedex_SetMonSeenFlag(POKEDEX *pokedex, POKEMON *pokemon) {
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
            Pokedex_SetSeenGenderFlag(pokedex, gender, 0, species);
        } else {
            seenGender = CheckDexFlag((const u8 *)pokedex->seenGenders[0], species);
            if (seenGender != gender) {
                Pokedex_SetSeenGenderFlag(pokedex, gender, 1, species);
            }
        }
        Pokedex_TryAppendSeenForme(pokedex, species, pokemon);
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
            Pokedex_SetSeenGenderFlag(pokedex, gender, 0, species);
        } else {
            gender_ct = CheckDexGender((const u8 *)pokedex->seenGenders[0], species);
            if (gender_ct != gender) {
                Pokedex_SetSeenGenderFlag(pokedex, gender, 1, species);
            }
        }
        Pokedex_TryAppendSeenForme(pokedex, species, pokemon);
        if (species == SPECIES_UNOWN) {
            Pokedex_TryAppendUnownLetter(pokedex, GetMonUnownLetter(pokemon), TRUE);
        }
        Pokedex_SetCaughtLanguage(pokedex, species, language);
        if (language != GAME_LANGUAGE) {
            Pokedex_SetInternationalViewFlag(pokedex);
        }
        SetDexFlag((u8 *)pokedex->caughtSpecies, species);
        SetDexFlag((u8 *)pokedex->seenSpecies, species);
    }
}

void Pokedex_SetNatDexFlag(POKEDEX *pokedex) {
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

BOOL Pokedex_HasCaughtMonWithLanguage(POKEDEX *pokedex, u32 species, u32 language) {
    int shift;
    GF_ASSERT(language <= 8);
    ASSERT_POKEDEX(pokedex);
    shift = LanguageToDexFlag(language);
    if (pokedex->caughtLanguages[species] & (1 << shift)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void Pokedex_SetInternationalViewFlag(POKEDEX *pokedex) {
    pokedex->enabledInternational = TRUE;
}

BOOL Pokedex_GetInternationalViewFlag(const POKEDEX *pokedex) {
    return pokedex->enabledInternational;
}

BOOL Pokedex_IsEnabled(const POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return pokedex->dexEnabled;
}

void Pokedex_Enable(POKEDEX *pokedex) {
    ASSERT_POKEDEX(pokedex);
    pokedex->dexEnabled = TRUE;
}

POKEDEX *Sav2_Pokedex_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_POKEDEX);
}

int Pokedex_GetSeenFormeByIdx(POKEDEX *pokedex, int species, int idx) {
    ASSERT_POKEDEX(pokedex);
    switch (species) {
    case SPECIES_UNOWN:
        if (idx < Pokedex_GetSeenFormeNum_Unown(pokedex, 0)) {
            return Pokedex_GetSeenFormeByIdx_Unown(pokedex, idx, 0);
        }
        break;
    case SPECIES_SHELLOS:
        if (idx < Pokedex_GetSeenFormeNum_Shellos(pokedex)) {
            return Pokedex_GetSeenFormeByIdx_Shellos(pokedex, idx);
        }
        break;
    case SPECIES_GASTRODON:
        if (idx < Pokedex_GetSeenFormeNum_Gastrodon(pokedex)) {
            return Pokedex_GetSeenFormeByIdx_Gastrodon(pokedex, idx);
        }
        break;
    case SPECIES_BURMY:
        if (idx < Pokedex_GetSeenFormeNum_Burmy(pokedex)) {
            return Pokedex_GetSeenFormeByIdx_Burmy(pokedex, idx);
        }
        break;
    case SPECIES_WORMADAM:
        if (idx < Pokedex_GetSeenFormeNum_Wormadam(pokedex)) {
            return Pokedex_GetSeenFormeByIdx_Wormadam(pokedex, idx);
        }
        break;
    case SPECIES_PICHU:
        if (idx < Pokedex_GetSeenFormeNum_Pichu(pokedex)) {
            return Pokedex_GetSeenFormeByIdx_Pichu(pokedex, idx);
        }
        break;
    case SPECIES_DEOXYS:
        if (idx < Pokedex_GetSeenFormeNum_Deoxys(pokedex)) {
            return Pokedex_GetSeenFormeByIdx_Deoxys(pokedex, idx);
        }
        break;
    case SPECIES_SHAYMIN:
    case SPECIES_GIRATINA:
        if (idx < Pokedex_GetSeenFormeNum_2max(pokedex, species)) {
            return Pokedex_GetSeenFormeByIdx_2max(pokedex, species, idx);
        }
        break;
    case SPECIES_ROTOM:
        if (idx < Pokedex_GetSeenFormeNum_Rotom(pokedex, SPECIES_ROTOM)) {
            return Pokedex_GetSeenFormeByIdx_Rotom(pokedex, SPECIES_ROTOM, idx);
        }
        break;
    }
    return 0;
}

int Pokedex_GetSeenFormeNum(POKEDEX *pokedex, int species) {
    ASSERT_POKEDEX(pokedex);
    switch (species) {
    case SPECIES_UNOWN:
        return Pokedex_GetSeenFormeNum_Unown(pokedex, 0);
    case SPECIES_SHELLOS:
        return Pokedex_GetSeenFormeNum_Shellos(pokedex);
    case SPECIES_GASTRODON:
        return Pokedex_GetSeenFormeNum_Gastrodon(pokedex);
    case SPECIES_BURMY:
        return Pokedex_GetSeenFormeNum_Burmy(pokedex);
    case SPECIES_WORMADAM:
        return Pokedex_GetSeenFormeNum_Wormadam(pokedex);
    case SPECIES_PICHU:
        return Pokedex_GetSeenFormeNum_Pichu(pokedex);
    case SPECIES_DEOXYS:
        return Pokedex_GetSeenFormeNum_Deoxys(pokedex);
    case SPECIES_SHAYMIN:
        return Pokedex_GetSeenFormeNum_2max(pokedex, SPECIES_SHAYMIN);
    case SPECIES_GIRATINA:
        return Pokedex_GetSeenFormeNum_2max(pokedex, SPECIES_GIRATINA);
    case SPECIES_ROTOM:
        return Pokedex_GetSeenFormeNum_Rotom(pokedex, SPECIES_ROTOM);
    }
    return 1;
}
