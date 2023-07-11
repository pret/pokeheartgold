#include "global.h"
#include "pokedex.h"
#include "pokemon.h"
#include "unk_02091278.h"
#include "constants/species.h"
#include "constants/johto_dex.h"

#define POKEDEX_MAGIC (0xBEEFCAFE)
#define ASSERT_POKEDEX(pokedex) do { GF_ASSERT((pokedex)->magic == POKEDEX_MAGIC);} while (0)

void Pokedex_InitDeoxysFormOrder(Pokedex *pokedex);
u16 *LoadSpeciesToJohtoDexNoLUT(void);
void Pokedex_SetInternationalViewFlag(Pokedex *pokedex);

u32 Save_Pokedex_sizeof(void) {
    return sizeof(Pokedex);
}

Pokedex *Pokedex_New(HeapID heapId) {
    Pokedex *ret = AllocFromHeap(heapId, sizeof(Pokedex));
    Save_Pokedex_Init(ret);
    return ret;
}

void Pokedex_Copy(const Pokedex *src, Pokedex *dest) {
    MI_CpuCopy8(src, dest, sizeof(Pokedex));
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

static inline void SetDex4Flag(u32 *flags, u8 form, u8 idx) {
    flags[15] &= ~(15 << (24 + 4 * idx));
    flags[15] |= (form << (24 + 4 * idx));
}

static inline int CheckDex3Flag(const u32 *arr, u32 idx) {
    return ((*arr) >> (3 * idx)) & 7;
}

static inline void SetDex3Flag(u32 *arr, u32 idx, u32 form) {
    GF_ASSERT(form < 7);
    *arr &= ~(7 << (3 * idx));
    *arr |= (form << (3 * idx));
}

static inline u8 CheckDexGender(const u8 *arr, u16 species) {
    if (CheckDexFlag(arr, species)) {
        return MON_FEMALE;
    } else {
        return MON_MALE;
    }
}

static void Pokedex_SetSeenGenderFlagInternal(Pokedex *pokeDex, u8 state, u8 num, u16 flagId) {
    if (num == 0) {
        SetDexFlagState((u8 *)pokeDex->seenGenders[1], state, flagId);
    }
    SetDexFlagState((u8 *)pokeDex->seenGenders[num], state, flagId);
}

static void Pokedex_SetSeenGenderFlag(Pokedex *pokeDex, u8 state, u8 num, u16 flagId) {
    GF_ASSERT(state <= 2);
    if (state == 2) {
        state = 0;
    }
    Pokedex_SetSeenGenderFlagInternal(pokeDex, state, num, flagId);
}

static u8 *Pokedex_GetFormOrderAddr(Pokedex *pokedex, u32 species) {
    switch (species) {
    case SPECIES_SHELLOS:
        return &pokedex->shellosFormOrder; // + 264;
    case SPECIES_GASTRODON:
        return &pokedex->gastrodonFormOrder; // + 265;
    case SPECIES_SHAYMIN:
        return &pokedex->shayminFormOrder; // + 828;
    case SPECIES_GIRATINA:
        return &pokedex->giratinaFormOrder; // + 829;
    case SPECIES_BURMY:
        return &pokedex->burmyFormOrder; // + 266;
    case SPECIES_WORMADAM:
        return &pokedex->wormadamFormOrder; // + 267;
    case SPECIES_PICHU:
        return &pokedex->pichuFormOrder; // + 830;
    default:
        GF_ASSERT(0);
        return NULL;
    }
}

static int Pokedex_CountRegisteredUnownLetters(const Pokedex *pokedex, BOOL caught) {
    int i, j = 0;
    const u8 *arr;
    if (caught) {
        arr = pokedex->unownCaughtOrder;
    } else {
        arr = pokedex->unownSeenOrder;
    }
    for (i = 0; i < UNOWN_FORM_MAX; i++, j++) {
        if (arr[i] == 0xFF) {
            break;
        }
    }
    return j;
}

static BOOL Pokedex_HasAlreadyAddedUnownLetter(const Pokedex *pokedex, u8 letter, BOOL caught) {
    int i;
    const u8 *arr;
    if (caught) {
        arr = pokedex->unownCaughtOrder;
    } else {
        arr = pokedex->unownSeenOrder;
    }
    for (i = 0; i < UNOWN_FORM_MAX; i++) {
        if (arr[i] == letter) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_TryAppendUnownLetter(Pokedex *pokedex, int letter, BOOL caught) {
    u8 *arr;
    int idx;
    if (caught) {
        arr = pokedex->unownCaughtOrder;
    } else {
        arr = pokedex->unownSeenOrder;
    }
    if (!Pokedex_HasAlreadyAddedUnownLetter(pokedex, letter, caught)) {
        idx = Pokedex_CountRegisteredUnownLetters(pokedex, caught);
        if (idx < UNOWN_FORM_MAX) {
            arr[idx] = letter;
        }
    }
}

static int Pokedex_GetSeenFormNum_2max(Pokedex *pokedex, u32 species) {
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    flag_p = Pokedex_GetFormOrderAddr(pokedex, species);
    if (CheckDexFlag(flag_p, 1) == CheckDexFlag(flag_p, 2)) {
        return 1;
    } else {
        return 2;
    }
}

static BOOL Pokedex_CheckSeenForm_2max(Pokedex *pokedex, u32 species, u8 form) {
    u8 *flag_p;
    u32 n;
    int i;
    BOOL flag;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return FALSE;
    }
    flag_p = Pokedex_GetFormOrderAddr(pokedex, species);
    n = Pokedex_GetSeenFormNum_2max(pokedex, species);
    for (i = 0; i < n; i++) {
        flag = CheckDexFlag(flag_p, i + 1);
        if (flag == form) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_SetSeenForm_2max(Pokedex *pokedex, u32 species, BOOL state) {
    int r4;
    u8 *r5;
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    if (!Pokedex_CheckSeenForm_2max(pokedex, species, state)) {
        r5 = Pokedex_GetFormOrderAddr(pokedex, species);
        r4 = Pokedex_GetSeenFormNum_2max(pokedex, species);
        if (r4 < 2) {
            SetDexFlagState(r5, state, r4 + 1);
            if (r4 == 0) {
                SetDexFlagState(r5, state, r4 + 2);
            }
        }
    }
}

static int Pokedex_CountSeenForms_3max(Pokedex *pokedex, u32 species) {
    int i;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    flag_p = Pokedex_GetFormOrderAddr(pokedex, species);
    for (i = 0; i < 3; i++) {
        if (CheckDex2Flag(flag_p, i) == 3) {
            break;
        }
    }
    return i;
}

static BOOL Pokedex_CheckSeenForm_3max(Pokedex *pokedex, u32 species, u8 state) {
    int i;
    u32 flag;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return FALSE;
    }
    flag_p = Pokedex_GetFormOrderAddr(pokedex, species);
    for (i = 0; i < 3; i++) {
        flag = CheckDex2Flag(flag_p, i);
        if (flag == state) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_SetSeenForm_3max(Pokedex *pokedex, u32 species, u32 state) {
    int n;
    u8 *flag_p;
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    if (!Pokedex_CheckSeenForm_3max(pokedex, species, state)) {
        flag_p = Pokedex_GetFormOrderAddr(pokedex, species);
        n = Pokedex_CountSeenForms_3max(pokedex, species);
        if (n < 3) {
            SetDex2FlagState(flag_p, state, n);
        }
    }
}

static void Pokedex_DeoxysFormFlagActionInternal(u32 *flags, u8 form, u8 idx) {
    SetDex4Flag(flags, form, idx);
}

static void Pokedex_DeoxysFormFlagAction(Pokedex *pokedex, u8 form, u8 idx) {
    GF_ASSERT(idx < 4);
    GF_ASSERT(form <= 15);
    if (idx < 2) {
        Pokedex_DeoxysFormFlagActionInternal(pokedex->caughtSpecies, form, idx);
    } else {
        Pokedex_DeoxysFormFlagActionInternal(pokedex->seenSpecies, form, idx - 2);
    }
}

static u32 Pokedex_GetSeenDeoxysFormByIndex(Pokedex *pokedex, u8 form) {
    if (form < 2) {
        return CheckDex4Flag(pokedex->caughtSpecies, form);
    } else {
        return CheckDex4Flag(pokedex->seenSpecies, form - 2);
    }
}

static int Pokedex_CountSeenDeoxysForms(Pokedex *pokedex) {
    int i;
    for (i = 0; i < 4; i++) {
        if (Pokedex_GetSeenDeoxysFormByIndex(pokedex, i) == 15) {
            break;
        }
    }
    return i;
}

static BOOL Pokedex_CheckSeenDeoxysForm(Pokedex *pokedex, u32 form) {
    int i;
    u32 val;
    for (i = 0; i < 4; i++) {
        val = Pokedex_GetSeenDeoxysFormByIndex(pokedex, i);
        if (form == val) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_SetSeenDeoxysForm(Pokedex *pokedex, u16 species, Pokemon *mon) {
    u8 form;

    form = GetMonData(mon, MON_DATA_FORM, NULL);
    if (species == SPECIES_DEOXYS) {
        if (!Pokedex_CheckSeenDeoxysForm(pokedex, form)) {
            Pokedex_DeoxysFormFlagAction(pokedex, form, Pokedex_CountSeenDeoxysForms(pokedex));
        }
    }
}

static void Pokedex_InitDeoxysFormOrder(Pokedex *pokedex) {
    int i;
    for (i = 0; i < 4; i++) {
        Pokedex_DeoxysFormFlagAction(pokedex, 15, i);
    }
}

static int Pokedex_GetSeenFormNum_Rotom(const Pokedex *pokedex, u32 species) {
    int i, n;

    GF_ASSERT(species == SPECIES_ROTOM);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    n = 0;
    for (i = 0; i < 6; i++, n++) {
        if (CheckDex3Flag(&pokedex->rotomFormOrder, i) == 7) {
            break;
        }
    }
    return n;
}

static BOOL Pokedex_CheckSeenRotomForm(Pokedex *pokedex, u32 species, u8 form) {
    int i, val;
    u32 n;

    GF_ASSERT(species == SPECIES_ROTOM);
    if (!Pokedex_CheckMonSeenFlag(pokedex, species)) {
        return 0;
    }
    n = Pokedex_GetSeenFormNum_Rotom(pokedex, species);
    for (i = 0; i < n; i++) {
        val = CheckDex3Flag(&pokedex->rotomFormOrder, i);
        if (val == form) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Pokedex_SetSeenRotomForm(Pokedex *pokedex, u32 species, u32 form) {
    int i;
    GF_ASSERT(species == SPECIES_ROTOM);
    if (!Pokedex_CheckSeenRotomForm(pokedex, species, form)) {
        i = Pokedex_GetSeenFormNum_Rotom(pokedex, species);
        if (i < 6) {
            SetDex3Flag(&pokedex->rotomFormOrder, i, form);
        }
    }
}

static void Pokedex_TryAppendSeenForm(Pokedex *pokedex, u16 species, Pokemon *mon) {
    u32 form;

    form = GetMonData(mon, MON_DATA_FORM, NULL);
    switch (species) {
    case SPECIES_UNOWN:
        Pokedex_TryAppendUnownLetter(pokedex, form, FALSE);
        break;
    case SPECIES_BURMY:
    case SPECIES_WORMADAM:
        Pokedex_SetSeenForm_3max(pokedex, species, form);
        break;
    case SPECIES_PICHU:
        if (form == 0) {
            if (GetMonGender(mon) == MON_MALE) {
                form = 0;
            } else {
                form = 1;
            }
        } else {
            form = 2;
        }
        Pokedex_SetSeenForm_3max(pokedex, species, form);
        break;
    case SPECIES_SHELLOS:
    case SPECIES_GASTRODON:
        Pokedex_SetSeenForm_2max(pokedex, species, form);
        break;
    case SPECIES_DEOXYS:
        Pokedex_SetSeenDeoxysForm(pokedex, species, mon);
        break;
    case SPECIES_SHAYMIN:
    case SPECIES_GIRATINA:
        Pokedex_SetSeenForm_2max(pokedex, species, form);
        break;
    case SPECIES_ROTOM:
        Pokedex_SetSeenRotomForm(pokedex, species, form);
        break;
    }
}

static void Pokedex_SetCaughtLanguage(Pokedex *pokedex, u32 species, u32 language) {
    int shift;

    shift = LanguageToDexFlag(language);
    if (shift != 6) {
        pokedex->caughtLanguages[species] |= (1 << shift);
    }
}

static int Pokedex_SpeciesGetLastSeenGender_Internal(Pokedex *pokedex, u16 species, u32 idx) {
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

static BOOL Pokedex_GetSeenFormByIdx_2max(Pokedex *pokedex, u32 species, int idx) {
    GF_ASSERT(species == SPECIES_SHELLOS || species == SPECIES_GASTRODON || species == SPECIES_SHAYMIN || species == SPECIES_GIRATINA);
    GF_ASSERT(idx < 2);
    return CheckDexFlag(Pokedex_GetFormOrderAddr(pokedex, species), idx + 1);
}

static int Pokedex_GetSeenFormByIdx_Rotom(Pokedex *pokedex, u32 species, int idx) {
    GF_ASSERT(species == SPECIES_ROTOM);
    GF_ASSERT(idx < 6);
    return CheckDex3Flag(&pokedex->rotomFormOrder, idx);
}

static int Pokedex_GetSeenFormByIdx_3max(Pokedex *pokedex, u32 species, int idx) {
    GF_ASSERT(species == SPECIES_BURMY || species == SPECIES_WORMADAM || species == SPECIES_PICHU);
    GF_ASSERT(idx < 3);
    return CheckDex2Flag(Pokedex_GetFormOrderAddr(pokedex, species), idx);
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

void Save_Pokedex_Init(Pokedex *pokedex) {
    memset(pokedex, 0, sizeof(Pokedex));
    pokedex->magic = POKEDEX_MAGIC;
    pokedex->nationalDex = 0;
    memset(pokedex->unownSeenOrder, 0xFF, 28);
    memset(pokedex->unownCaughtOrder, 0xFF, 28);
    pokedex->shellosFormOrder = 0xFF;
    pokedex->gastrodonFormOrder = 0xFF;
    pokedex->burmyFormOrder = 0xFF;
    pokedex->wormadamFormOrder = 0xFF;
    pokedex->rotomFormOrder = -1;
    pokedex->shayminFormOrder = 0xFF;
    pokedex->giratinaFormOrder = 0xFF;
    pokedex->pichuFormOrder = 0xFF;
    Pokedex_InitDeoxysFormOrder(pokedex);
}

u16 Pokedex_CountNationalDexOwned(Pokedex *pokedex) {
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

u16 Pokedex_CountNationalDexSeen(Pokedex *pokedex) {
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

u16 Pokedex_CountDexOwned(Pokedex *pokedex) {
    if (Pokedex_GetNatDexFlag(pokedex)) {
        return Pokedex_CountNationalDexOwned(pokedex);
    } else {
        return Pokedex_CountJohtoDexOwned(pokedex);
    }
}

u16 Pokedex_CountJohtoDexOwned(Pokedex *pokedex) {
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

u16 Pokedex_CountJohtoDexSeen(Pokedex *pokedex) {
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

BOOL Pokedex_NationalDexIsComplete(Pokedex *pokedex) {
    return Pokedex_CountNationalOwned_ExcludeMythical(pokedex) >= (NATIONAL_DEX_COUNT - NELEMS(sNationalMythicals));
}

BOOL Pokedex_JohtoDexIsComplete(Pokedex *pokedex) {
    return Pokedex_CountJohtoOwned_ExcludeMythical(pokedex) >= (J_NUM_SPECIES - NELEMS(sJohtoMythicals));
}

u16 Pokedex_CountNationalOwned_ExcludeMythical(Pokedex *pokedex) {
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

u16 Pokedex_CountJohtoOwned_ExcludeMythical(Pokedex *pokedex) {
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

BOOL Pokedex_CheckMonCaughtFlag(const Pokedex *pokedex, const u16 species) {
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

BOOL Pokedex_CheckMonSeenFlag(const Pokedex *pokedex, const u16 species) {
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

u32 Pokedex_GetSeenSpindaPersonality(Pokedex *pokedex, u32 arg) {
    u32 personality;
    ASSERT_POKEDEX(pokedex);
    if (arg == 0) {
        personality = pokedex->spindaPersonality;
    } else {
        GF_ASSERT(0);
    }
    return personality;
}

int Pokedex_SpeciesGetLastSeenGender(Pokedex *pokedex, u16 species, u32 a2) {
    ASSERT_POKEDEX(pokedex);
    if (DexSpeciesIsInvalid(species)) {
        return -1;
    }
    if (CheckDexFlag((u8 *)pokedex->seenSpecies, species)) {
        return Pokedex_SpeciesGetLastSeenGender_Internal(pokedex, species, a2);
    }
    return -1;
}

int Pokedex_GetSeenFormByIdx_Unown(Pokedex *pokedex, int idx, u32 caught) {
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

u32 Pokedex_GetSeenFormNum_Unown(Pokedex *pokedex, BOOL caught) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountRegisteredUnownLetters(pokedex, caught);
}

int Pokedex_GetSeenFormByIdx_Shellos(Pokedex *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_GetSeenFormNum_2max(pokedex, SPECIES_SHELLOS) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormByIdx_2max(pokedex, SPECIES_SHELLOS, a1);
}

static u32 Pokedex_GetSeenFormNum_Shellos(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_GetSeenFormNum_2max(pokedex, SPECIES_SHELLOS);
}

static int Pokedex_GetSeenFormByIdx_Gastrodon(Pokedex *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_GetSeenFormNum_2max(pokedex, SPECIES_GASTRODON) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormByIdx_2max(pokedex, SPECIES_GASTRODON, a1);
}

static u32 Pokedex_GetSeenFormNum_Gastrodon(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_GetSeenFormNum_2max(pokedex, SPECIES_GASTRODON);
}

static int Pokedex_GetSeenFormByIdx_Burmy(Pokedex *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_CountSeenForms_3max(pokedex, SPECIES_BURMY) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormByIdx_3max(pokedex, SPECIES_BURMY, a1);
}

static u32 Pokedex_GetSeenFormNum_Burmy(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountSeenForms_3max(pokedex, SPECIES_BURMY);
}

static int Pokedex_GetSeenFormByIdx_Wormadam(Pokedex *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_CountSeenForms_3max(pokedex, SPECIES_WORMADAM) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormByIdx_3max(pokedex, SPECIES_WORMADAM, a1);
}

static u32 Pokedex_GetSeenFormNum_Wormadam(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountSeenForms_3max(pokedex, SPECIES_WORMADAM);
}

static int Pokedex_GetSeenFormByIdx_Pichu(Pokedex *pokedex, int a1) {
    ASSERT_POKEDEX(pokedex);
    if (Pokedex_CountSeenForms_3max(pokedex, SPECIES_PICHU) <= a1) {
        return -1;
    }
    return Pokedex_GetSeenFormByIdx_3max(pokedex, SPECIES_PICHU, a1);
}

static u32 Pokedex_GetSeenFormNum_Pichu(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountSeenForms_3max(pokedex, SPECIES_PICHU);
}

static u32 Pokedex_GetSeenFormByIdx_Deoxys(Pokedex *pokedex, u32 a1) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_GetSeenDeoxysFormByIndex(pokedex, a1);
}

static u32 Pokedex_GetSeenFormNum_Deoxys(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return Pokedex_CountSeenDeoxysForms(pokedex);
}

void Pokedex_SetMonSeenFlag(Pokedex *pokedex, Pokemon *mon) {
    u16 species;
    u32 personality;
    u32 gender;
    u8 seenGender;

    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    gender = GetMonGender(mon);

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
        Pokedex_TryAppendSeenForm(pokedex, species, mon);
        SetDexFlag((u8 *)pokedex->seenSpecies, species);
    }
}

void Pokedex_SetMonCaughtFlag(Pokedex *pokedex, Pokemon *mon) {
    u16 species;
    u32 language;
    u32 personality;
    u32 gender;
    u32 gender_ct;

    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    language = GetMonData(mon, MON_DATA_GAME_LANGUAGE, NULL);
    personality = GetMonData(mon, MON_DATA_PERSONALITY, NULL);
    gender = GetMonGender(mon);

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
        Pokedex_TryAppendSeenForm(pokedex, species, mon);
        if (species == SPECIES_UNOWN) {
            Pokedex_TryAppendUnownLetter(pokedex, GetMonUnownLetter(mon), TRUE);
        }
        Pokedex_SetCaughtLanguage(pokedex, species, language);
        if (language != GAME_LANGUAGE) {
            Pokedex_SetInternationalViewFlag(pokedex);
        }
        SetDexFlag((u8 *)pokedex->caughtSpecies, species);
        SetDexFlag((u8 *)pokedex->seenSpecies, species);
    }
}

void Pokedex_SetNatDexFlag(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    pokedex->nationalDex = TRUE;
}

BOOL Pokedex_GetNatDexFlag(const Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return pokedex->nationalDex;
}

void sub_0202A57C(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    pokedex->unk_334 = TRUE;
}

BOOL Pokedex_HasCaughtMonWithLanguage(Pokedex *pokedex, u32 species, u32 language) {
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

void Pokedex_SetInternationalViewFlag(Pokedex *pokedex) {
    pokedex->enabledInternational = TRUE;
}

BOOL Pokedex_GetInternationalViewFlag(const Pokedex *pokedex) {
    return pokedex->enabledInternational;
}

BOOL Pokedex_IsEnabled(const Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    return pokedex->dexEnabled;
}

void Pokedex_Enable(Pokedex *pokedex) {
    ASSERT_POKEDEX(pokedex);
    pokedex->dexEnabled = TRUE;
}

Pokedex *Save_Pokedex_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_POKEDEX);
}

int Pokedex_GetSeenFormByIdx(Pokedex *pokedex, int species, int idx) {
    ASSERT_POKEDEX(pokedex);
    switch (species) {
    case SPECIES_UNOWN:
        if (idx < Pokedex_GetSeenFormNum_Unown(pokedex, 0)) {
            return Pokedex_GetSeenFormByIdx_Unown(pokedex, idx, 0);
        }
        break;
    case SPECIES_SHELLOS:
        if (idx < Pokedex_GetSeenFormNum_Shellos(pokedex)) {
            return Pokedex_GetSeenFormByIdx_Shellos(pokedex, idx);
        }
        break;
    case SPECIES_GASTRODON:
        if (idx < Pokedex_GetSeenFormNum_Gastrodon(pokedex)) {
            return Pokedex_GetSeenFormByIdx_Gastrodon(pokedex, idx);
        }
        break;
    case SPECIES_BURMY:
        if (idx < Pokedex_GetSeenFormNum_Burmy(pokedex)) {
            return Pokedex_GetSeenFormByIdx_Burmy(pokedex, idx);
        }
        break;
    case SPECIES_WORMADAM:
        if (idx < Pokedex_GetSeenFormNum_Wormadam(pokedex)) {
            return Pokedex_GetSeenFormByIdx_Wormadam(pokedex, idx);
        }
        break;
    case SPECIES_PICHU:
        if (idx < Pokedex_GetSeenFormNum_Pichu(pokedex)) {
            return Pokedex_GetSeenFormByIdx_Pichu(pokedex, idx);
        }
        break;
    case SPECIES_DEOXYS:
        if (idx < Pokedex_GetSeenFormNum_Deoxys(pokedex)) {
            return Pokedex_GetSeenFormByIdx_Deoxys(pokedex, idx);
        }
        break;
    case SPECIES_SHAYMIN:
    case SPECIES_GIRATINA:
        if (idx < Pokedex_GetSeenFormNum_2max(pokedex, species)) {
            return Pokedex_GetSeenFormByIdx_2max(pokedex, species, idx);
        }
        break;
    case SPECIES_ROTOM:
        if (idx < Pokedex_GetSeenFormNum_Rotom(pokedex, SPECIES_ROTOM)) {
            return Pokedex_GetSeenFormByIdx_Rotom(pokedex, SPECIES_ROTOM, idx);
        }
        break;
    }
    return 0;
}

int Pokedex_GetSeenFormNum(Pokedex *pokedex, int species) {
    ASSERT_POKEDEX(pokedex);
    switch (species) {
    case SPECIES_UNOWN:
        return Pokedex_GetSeenFormNum_Unown(pokedex, 0);
    case SPECIES_SHELLOS:
        return Pokedex_GetSeenFormNum_Shellos(pokedex);
    case SPECIES_GASTRODON:
        return Pokedex_GetSeenFormNum_Gastrodon(pokedex);
    case SPECIES_BURMY:
        return Pokedex_GetSeenFormNum_Burmy(pokedex);
    case SPECIES_WORMADAM:
        return Pokedex_GetSeenFormNum_Wormadam(pokedex);
    case SPECIES_PICHU:
        return Pokedex_GetSeenFormNum_Pichu(pokedex);
    case SPECIES_DEOXYS:
        return Pokedex_GetSeenFormNum_Deoxys(pokedex);
    case SPECIES_SHAYMIN:
        return Pokedex_GetSeenFormNum_2max(pokedex, SPECIES_SHAYMIN);
    case SPECIES_GIRATINA:
        return Pokedex_GetSeenFormNum_2max(pokedex, SPECIES_GIRATINA);
    case SPECIES_ROTOM:
        return Pokedex_GetSeenFormNum_Rotom(pokedex, SPECIES_ROTOM);
    }
    return 1;
}
