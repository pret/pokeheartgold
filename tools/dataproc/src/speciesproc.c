#include <assert.h>
#include <math.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "common.h"
#include "dataproc.h"
#include "nitroarc.h"

#include "constants/items.h"
#include "generated/evolution_methods.h"
#include "generated/gender_ratios.h"
#include "generated/pokemon_body_shapes.h"
#include "generated/pokemon_types.h"
#include "generated/species.h"

#include "struct_defs/species.h"
#include "struct_defs/species_sprite_data.h"
#include "struct_defs/sprite_animation_frame.h"

typedef struct SpeciesLearnsetSized {
    SpeciesLearnset data;
    size_t          size;
} SpeciesLearnsetSized;

typedef struct SpeciesEvolutionList {
    SpeciesEvolution data[MAX_EVOLUTIONS] ALIGN_4;
} SpeciesEvolutionList;

typedef struct SpeciesHeights {
    u8   back_female;
    u8   back_male;
    u8   front_female;
    u8   front_male;
    bool has_female;
    bool has_male;
} SpeciesHeights;

typedef struct SpeciesDexIndex {
    enum Species species;
    const char  *name;

    u32 height;
    u32 weight;
} SpeciesDexIndex;

typedef struct SpeciesDexData {
    SpeciesDexIndex index;

    u8 body_shape;
    u8 type0;
    u8 type1;

    u16 tr_scale_f;
    u16 pk_scale_f;
    u16 tr_scale_m;
    u16 pk_scale_m;
    u16 tr_pos_f;
    u16 pk_pos_f;
    u16 tr_pos_m;
    u16 pk_pos_m;
} SpeciesDexData;

typedef struct Container {
    SpeciesData          personal;
    SpeciesEvolutionList evolutions;
    SpeciesLearnsetSized levelup_learnset;
    SpeciesPalPark       palpark;
    SpeciesHeights       heights;
    SpeciesSpriteData    spritedata;
    enum Species         offspring;
    SpeciesDexData       dexdata;
} Container;

static SpeciesData proc_personal(datafile_t *df);
static SpeciesEvolutionList proc_evolutions(datafile_t *df);
static SpeciesLearnsetSized proc_lvlearnset(datafile_t *df);
static SpeciesPalPark proc_palpark(datafile_t *df, size_t i);
static enum Species proc_offspring(datafile_t *df, size_t i);
static SpeciesHeights proc_heights(datafile_t *df, enum GenderRatio ratio);
static SpeciesSpriteData proc_spritedata(datafile_t *df);
static SpeciesDexData proc_dexdata(datafile_t *df, size_t i, const char *base_dir);

static void emit_tutorables(datafile_t *df, size_t i);
static void emit_eggmoves(datafile_t *df, const char *species_upper);
static void emit_footprints(datafile_t *df, size_t i, const char *species_upper);
static void emit_iconpalettes(datafile_t *df, size_t i, const char *species);
static void emit_textbanks(datafile_t *df, size_t i, const char *species, SpeciesDexIndex *index);
static void pack(Container *species, size_t i);

static void pre_init(void);
static void post_init(void);
static int  addl_done(void);
static void parse_args(int *pargc, char ***pargv);

static char  *program_name     = NULL;
static char  *base_dir         = NULL;
static char  *depfile_fpath    = "species_data.d";
static char  *tutorables_fpath = "move_tutors.json";
static char  *sinnohdex_fpath  = "sinnoh_pokedex.json";
static char  *output_dir       = ".";
static char **registry         = NULL;
static size_t len_registry     = 0;

static enum_template_t enums[] = {
    include_defs("constants/footstep_house.h",      "FOOTPRINT_TYPE"),
    include_enum("generated/abilities.h",           "enum Ability"),
    include_enum("generated/egg_groups.h",          "enum EggGroup"),
    include_enum("generated/exp_rates.h",           "enum ExpRate"),
    include_enum("generated/evolution_methods.h",   "enum EvolutionMethod"),
    include_enum("generated/footprint_sizes.h",     "enum FootprintSize"),
    include_enum("generated/gender_ratios.h",       "enum GenderRatio"),
    include_enum("generated/items.h",               "enum Item"),
    include_enum("generated/moves.h",               "enum Move"),
    include_enum("generated/pal_park_land_area.h",  "enum PalParkLandArea"),
    include_enum("generated/pal_park_water_area.h", "enum PalParkWaterArea"),
    include_enum("generated/pokemon_body_shapes.h", "enum PokemonBodyShape"),
    include_enum("generated/pokemon_colors.h",      "enum PokemonColor"),
    include_enum("generated/pokemon_types.h",       "enum PokemonType"),
    include_enum("generated/shadow_sizes.h",        "enum ShadowSize"),
    include_enum("generated/species.h",             "enum Species"),
    include_enum("generated/tutor_locations.h",     "enum TutorLocation"),
    { .from_file = NULL },
};

enum {
    A_PERSONAL,
    A_EVOLUTIONS,
    A_LEVEL_LEARNSETS,
    A_SPRITE_OFFSETS,
    A_POKEDEX_INDICES_GIRA_ALTERED,
    A_POKEDEX_INDICES_GIRA_ORIGIN,
};

static archive_template_t archives[] = {
    [A_PERSONAL]                     = { .out_filename = "pl_personal.narc"     },
    [A_EVOLUTIONS]                   = { .out_filename = "evo.narc"             },
    [A_LEVEL_LEARNSETS]              = { .out_filename = "wotbl.narc"           },
    [A_SPRITE_OFFSETS]               = { .out_filename = "height.narc"          },
    [A_POKEDEX_INDICES_GIRA_ALTERED] = { .out_filename = "zukan_data_gira.narc" },
    [A_POKEDEX_INDICES_GIRA_ORIGIN]  = { .out_filename = "zukan_data.narc"      },
    { .out_filename = NULL },
};

enum {
    H_TUTORABLE_MOVES,
    H_LEARNSETS_BY_TUTOR,
    H_EGG_MOVES,
    H_FOOTPRINT_SIZES,
    H_FOOTPRINT_TYPES,
    H_ICON_PALETTES,
};

static header_template_t headers[] = {
    [H_TUTORABLE_MOVES]    = { .out_filename = "tutorable_moves.h"            },
    [H_LEARNSETS_BY_TUTOR] = { .out_filename = "species_learnsets_by_tutor.h" },
    [H_EGG_MOVES]          = { .out_filename = "species_egg_moves.h"          },
    [H_FOOTPRINT_SIZES]    = { .out_filename = "species_footprint_sizes.h"    },
    [H_FOOTPRINT_TYPES]    = { .out_filename = "species_footprint_types.h"    },
    [H_ICON_PALETTES]      = { .out_filename = "species_icon_palettes.h"      },
    { .out_filename = NULL },
};

enum {
    T_NAMES,
    T_NAMES_WITH_ARTICLES,
    T_POKEDEX_ENTRY_EN,
    T_POKEDEX_ENTRY_FR,
    T_POKEDEX_ENTRY_DE,
    T_POKEDEX_ENTRY_IT,
    T_POKEDEX_ENTRY_ES,
    T_POKEDEX_ENTRY_JP,
    T_NAME_WITH_DEX_NUMBER_EN,
    T_NAME_WITH_DEX_NUMBER_FR,
    T_NAME_WITH_DEX_NUMBER_DE,
    T_NAME_WITH_DEX_NUMBER_IT,
    T_NAME_WITH_DEX_NUMBER_ES,
    T_NAME_WITH_DEX_NUMBER_JP,
    T_CATEGORY_EN,
    T_CATEGORY_FR,
    T_CATEGORY_DE,
    T_CATEGORY_IT,
    T_CATEGORY_ES,
    T_CATEGORY_JP,
    T_CATEGORY,
    T_WEIGHTS_WITH_GIRA_ALTERED,
    T_WEIGHTS_WITH_GIRA_ORIGIN,
    T_HEIGHTS_WITH_GIRA_ALTERED,
    T_HEIGHTS_WITH_GIRA_ORIGIN,
};

static textbank_template_t textbanks[] = {
    [T_NAMES]                     = { .key = 30764, .out_filename = "species_name.json"                       },
    [T_NAMES_WITH_ARTICLES]       = { .key = 59681, .out_filename = "species_name_with_articles.json"         },
    [T_POKEDEX_ENTRY_EN]          = { .key = 63572, .out_filename = "species_pokedex_entry_en.json"           },
    [T_POKEDEX_ENTRY_FR]          = { .key = 30030, .out_filename = "species_pokedex_entry_fr.json"           },
    [T_POKEDEX_ENTRY_DE]          = { .key = 30034, .out_filename = "species_pokedex_entry_de.json"           },
    [T_POKEDEX_ENTRY_IT]          = { .key = 30038, .out_filename = "species_pokedex_entry_it.json"           },
    [T_POKEDEX_ENTRY_ES]          = { .key = 30042, .out_filename = "species_pokedex_entry_es.json"           },
    [T_POKEDEX_ENTRY_JP]          = { .key = 30046, .out_filename = "species_pokedex_entry_jp.json"           },
    [T_NAME_WITH_DEX_NUMBER_EN]   = { .key = 32249, .out_filename = "species_name_with_natdex_number_en.json" },
    [T_NAME_WITH_DEX_NUMBER_FR]   = { .key = 32242, .out_filename = "species_name_with_natdex_number_fr.json" },
    [T_NAME_WITH_DEX_NUMBER_DE]   = { .key = 32254, .out_filename = "species_name_with_natdex_number_de.json" },
    [T_NAME_WITH_DEX_NUMBER_IT]   = { .key = 32250, .out_filename = "species_name_with_natdex_number_it.json" },
    [T_NAME_WITH_DEX_NUMBER_ES]   = { .key = 32230, .out_filename = "species_name_with_natdex_number_es.json" },
    [T_NAME_WITH_DEX_NUMBER_JP]   = { .key = 32226, .out_filename = "species_name_with_natdex_number_jp.json" },
    [T_CATEGORY_EN]               = { .key = 22840, .out_filename = "species_category_en.json"                },
    [T_CATEGORY_FR]               = { .key = 46193, .out_filename = "species_category_fr.json"                },
    [T_CATEGORY_DE]               = { .key = 46205, .out_filename = "species_category_de.json"                },
    [T_CATEGORY_IT]               = { .key = 46201, .out_filename = "species_category_it.json"                },
    [T_CATEGORY_ES]               = { .key = 46181, .out_filename = "species_category_es.json"                },
    [T_CATEGORY_JP]               = { .key = 46177, .out_filename = "species_category_jp.json"                },
    [T_CATEGORY]                  = { .key = 48809, .out_filename = "species_category.json"                   },
    [T_WEIGHTS_WITH_GIRA_ALTERED] = { .key = 64639, .out_filename = "species_weight_gira.json"                },
    [T_WEIGHTS_WITH_GIRA_ORIGIN]  = { .key = 25297, .out_filename = "species_weight.json"                     },
    [T_HEIGHTS_WITH_GIRA_ALTERED] = { .key = 28660, .out_filename = "species_height_gira.json"                },
    [T_HEIGHTS_WITH_GIRA_ORIGIN]  = { .key =  5013, .out_filename = "species_height.json"                     },
    { .key = 0, .out_filename = NULL },
};

static const char *alt_forms_with_data[] = { // NOTE: also implicitly defines the ordering of these forms
    "deoxys/forms/attack",
    "deoxys/forms/defense",
    "deoxys/forms/speed",
    "wormadam/forms/sandy",
    "wormadam/forms/trash",
    "giratina/forms/origin",
    "shaymin/forms/sky",
    "rotom/forms/heat",
    "rotom/forms/wash",
    "rotom/forms/frost",
    "rotom/forms/fan",
    "rotom/forms/mow",
};

#define NATIONAL_DEX_MAX SPECIES_EGG // NOTE: This is distinct from NATIONAL_DEX_COUNT

int main(int argc, char **argv) {
    parse_args(&argc, &argv);

    splitenv("SPECIES", &registry, &len_registry, alt_forms_with_data, countof(alt_forms_with_data));
    archives[A_PERSONAL].num_files        = (u16)len_registry;
    archives[A_EVOLUTIONS].num_files      = (u16)len_registry;
    archives[A_LEVEL_LEARNSETS].num_files = (u16)len_registry;
    archives[A_SPRITE_OFFSETS].num_files  = (u16)(4 * NATIONAL_DEX_MAX);

    // NOTE: The Mystery type is not packed into these
    archives[A_POKEDEX_INDICES_GIRA_ALTERED].num_files = (u16)(27 + (NUM_POKEMON_TYPES - 1) + NUM_BODY_SHAPES);
    archives[A_POKEDEX_INDICES_GIRA_ORIGIN].num_files  = (u16)(27 + (NUM_POKEMON_TYPES - 1) + NUM_BODY_SHAPES);

    common_init(DATAPROC_F_JSON, enums, archives, headers, textbanks, __FILE__, depfile_fpath, output_dir, pre_init, post_init);

    datafile_t df_d = { 0 };
    datafile_t df_s = { 0 };
    unsigned   errc = EXIT_SUCCESS;

    for (size_t i = 0; i < len_registry; i++) {
        char *path_d = pathjoin(base_dir, registry[i], "data.json");
        char *path_s = pathjoin(base_dir, registry[i], "sprite_data.json");

        if (dp_load(&df_d, path_d) == 0) {
            char *capped = strupper(registry[i]);

            Container species = {
                .personal         = proc_personal(&df_d),
                .evolutions       = proc_evolutions(&df_d),
                .levelup_learnset = proc_lvlearnset(&df_d),
                .palpark          = proc_palpark(&df_d, i),
                .offspring        = proc_offspring(&df_d, i),
                .dexdata          = proc_dexdata(&df_d, i, base_dir),
            };

            if (i < NATIONAL_DEX_MAX && dp_load(&df_s, path_s) == 0) {
                enum GenderRatio ratio = species.personal.genderRatio;
                if (i == SPECIES_NONE) ratio = GENDER_RATIO_FEMALE_50;

                species.heights    = proc_heights(&df_s, ratio);
                species.spritedata = proc_spritedata(&df_s);
            }

            emit_tutorables(&df_d, i);
            emit_eggmoves(&df_d, capped);
            emit_footprints(&df_d, i, capped);
            emit_iconpalettes(&df_d, i, registry[i]);
            emit_textbanks(&df_d, i, registry[i], &species.dexdata.index);
            pack(&species, i);

            free(capped);
        }

        if (dp_report(&df_d) == DIAG_ERROR) errc = EXIT_FAILURE;
        if (dp_report(&df_s) == DIAG_ERROR) errc = EXIT_FAILURE;

        free(path_d);
        free(path_s);
        dp_free(&df_d);
        dp_free(&df_s);
    }

    return common_done(errc, addl_done);
}

static u8   *palpark          = NULL;
static u16  *offspring        = NULL;
static u8   *sprite_data      = NULL;
static u32  *dex_heights      = NULL; // file 0
static u32  *dex_weights      = NULL; // file 1
static u8   *body_shapes      = NULL; // file 2
static u16  *tr_scale_f       = NULL; // file 3
static u16  *pk_scale_f       = NULL; // file 4
static u16  *tr_scale_m       = NULL; // file 5
static u16  *pk_scale_m       = NULL; // file 6
static u16  *tr_pos_f         = NULL; // file 7
static u16  *pk_pos_f         = NULL; // file 8
static u16  *tr_pos_m         = NULL; // file 9
static u16  *pk_pos_m         = NULL; // file 10
static u16  *natdex_listing   = NULL; // file 11
static u16 **indexed_by_type  = NULL; // files 27 through 44
static u16  *count_by_type    = NULL;
static u16 **indexed_by_shape = NULL; // files 45 through 58 (the end)
static u16  *count_by_shape   = NULL;

static char **name_store = NULL;

static u16 *giratina_altered_type0_index = NULL;
static u16  giratina_altered_type0_count = 0;
static u16 *giratina_altered_type1_index = NULL;
static u16  giratina_altered_type1_count = 0;
static u16 *giratina_altered_shape_index = NULL;
static u16  giratina_altered_shape_count = 0;
static u16 *giratina_origin_type0_index  = NULL;
static u16  giratina_origin_type0_count  = 0;
static u16 *giratina_origin_type1_index  = NULL;
static u16  giratina_origin_type1_count  = 0;
static u16 *giratina_origin_shape_index  = NULL;
static u16  giratina_origin_shape_count  = 0;

static SpeciesDexIndex *sortables = NULL; // for sorting by name, height, weight

static void pre_init(void) {
    palpark        = calloc(NATIONAL_DEX_MAX - 1, sizeof(SpeciesPalPark)); // NOTE: SPECIES_NONE does not have an entry
    offspring      = calloc(len_registry, sizeof(*offspring));
    sprite_data    = calloc(NATIONAL_DEX_MAX, sizeof(SpeciesSpriteData));
    dex_heights    = calloc(NATIONAL_DEX_MAX, sizeof(*dex_heights));
    dex_weights    = calloc(NATIONAL_DEX_MAX, sizeof(*dex_weights));
    body_shapes    = calloc(NATIONAL_DEX_MAX, sizeof(*body_shapes));
    tr_scale_f     = calloc(NATIONAL_DEX_MAX, sizeof(*tr_scale_f));
    pk_scale_f     = calloc(NATIONAL_DEX_MAX, sizeof(*pk_scale_f));
    tr_scale_m     = calloc(NATIONAL_DEX_MAX, sizeof(*tr_scale_m));
    pk_scale_m     = calloc(NATIONAL_DEX_MAX, sizeof(*pk_scale_m));
    tr_pos_f       = calloc(NATIONAL_DEX_MAX, sizeof(*tr_pos_f));
    pk_pos_f       = calloc(NATIONAL_DEX_MAX, sizeof(*pk_pos_f));
    tr_pos_m       = calloc(NATIONAL_DEX_MAX, sizeof(*tr_pos_m));
    pk_pos_m       = calloc(NATIONAL_DEX_MAX, sizeof(*pk_pos_m));
    natdex_listing = calloc(NATIONAL_DEX_MAX - 1, sizeof(*natdex_listing));
    sortables      = calloc(NATIONAL_DEX_MAX - 1, sizeof(*sortables));

    name_store = calloc(NATIONAL_DEX_MAX, sizeof(*name_store));
    for (size_t i = 0; i < NATIONAL_DEX_MAX; i++) {
        name_store[i] = calloc(16, sizeof(**name_store));
    }

    // For the type and shape indices, we allocate the maximum possible size for
    // each type/shape: all species having the same type/shape. This removes the
    // need to check for reallocations while iterating.
    indexed_by_type = calloc(NUM_POKEMON_TYPES, sizeof(*indexed_by_type));
    count_by_type   = calloc(NUM_POKEMON_TYPES, sizeof(*count_by_type));
    for (u16 i = 0; i < NUM_POKEMON_TYPES; i++) {
        indexed_by_type[i] = calloc(NATIONAL_DEX_MAX - 1, sizeof(**indexed_by_type));
    }

    indexed_by_shape = calloc(NUM_BODY_SHAPES, sizeof(*indexed_by_shape));
    count_by_shape   = calloc(NUM_BODY_SHAPES, sizeof(*count_by_shape));
    for (u16 i = 0; i < NUM_BODY_SHAPES; i++) {
        indexed_by_shape[i] = calloc(NATIONAL_DEX_MAX - 1, sizeof(**indexed_by_shape));
    }

    giratina_altered_type0_index = calloc(NATIONAL_DEX_MAX - 1, sizeof(*giratina_altered_type0_index));
    giratina_altered_type1_index = calloc(NATIONAL_DEX_MAX - 1, sizeof(*giratina_altered_type1_index));
    giratina_altered_shape_index = calloc(NATIONAL_DEX_MAX - 1, sizeof(*giratina_altered_shape_index));
    giratina_origin_type0_index  = calloc(NATIONAL_DEX_MAX - 1, sizeof(*giratina_origin_type0_index));
    giratina_origin_type1_index  = calloc(NATIONAL_DEX_MAX - 1, sizeof(*giratina_origin_type1_index));
    giratina_origin_shape_index  = calloc(NATIONAL_DEX_MAX - 1, sizeof(*giratina_origin_shape_index));
}

static datafile_t   df_tutorables       = { 0 };
static const char **tutorable_moves     = NULL;
static size_t       len_tutorable_moves = 0;
static size_t       tutorset_size       = 0;
static u8          *tutorset            = NULL; // NOTE: shared and cleared between species

static datafile_t df_sinnohdex   = { 0 };
static u16       *sinnohdex      = NULL;
static size_t     sinnohdex_size = 0;
static size_t     sinnohdex_len  = 0;

static void free_tutorables(void) {
    free(tutorable_moves);
    free(tutorset);
    dp_free(&df_tutorables);
}

static void post_init(void) {
    static FILE **f_tutorables = &headers[H_TUTORABLE_MOVES].out_file;

    if (dp_load(&df_tutorables, tutorables_fpath) == 0) {
        datanode_t array    = dp_get(&df_tutorables, ".");
        len_tutorable_moves = dp_arrlen(array);
        tutorable_moves     = calloc(len_tutorable_moves, sizeof(*tutorable_moves));

        for (size_t i = 0; i < len_tutorable_moves; i++) {
            datanode_t elem = dp_arrelem(array, i);
            datanode_t move = dp_objmemb(elem, "move");
            if (dp_lookup(move, "enum Move").type == DATAPROC_T_ERR) continue;

            tutorable_moves[i] = dp_string(move);
            fprintf(*f_tutorables, "    { %s, %u, %u, %u, %u, %s },\n",
                    tutorable_moves[i],
                    dp_u8(dp_objmemb(elem, "redCost")),
                    dp_u8(dp_objmemb(elem, "blueCost")),
                    dp_u8(dp_objmemb(elem, "yellowCost")),
                    dp_u8(dp_objmemb(elem, "greenCost")),
                    dp_string(dp_lookup_s(dp_objmemb(elem, "location"), "enum TutorLocation")));
        }

        tutorset_size = (len_tutorable_moves + 7) / 8;
        tutorset      = calloc(tutorset_size, sizeof(*tutorset));
    }

    if (dp_load(&df_sinnohdex, sinnohdex_fpath) == 0) {
        datanode_t array = dp_get(&df_sinnohdex, ".");
        sinnohdex_size   = dp_arrlen(array);
        sinnohdex        = calloc(sinnohdex_size, sizeof(*sinnohdex));

        for (size_t i = 0; i < sinnohdex_size; i++) {
            u16 memb = dp_u16(dp_lookup(dp_arrelem(array, i), "enum Species"));
            switch (memb) {
            case SPECIES_NONE:
            case SPECIES_ARCEUS:
            case SPECIES_EGG:
            case SPECIES_BAD_EGG:
                break;

            default:
                sinnohdex[sinnohdex_len++] = memb;
                break;
            }
        }
    }

    if (dp_report(&df_tutorables) == DIAG_ERROR) exit(EXIT_FAILURE);
    if (dp_report(&df_sinnohdex) == DIAG_ERROR) exit(EXIT_FAILURE);

    atexit(free_tutorables);
}

static void proc_tmlearnset(datafile_t *df, SpeciesData *out);

static SpeciesData proc_personal(datafile_t *df) {
    SpeciesData personal = {
        .baseStats = {
            .hp        = u8(".base_stats.hp"),
            .attack    = u8(".base_stats.attack"),
            .defense   = u8(".base_stats.defense"),
            .speed     = u8(".base_stats.speed"),
            .spAttack  = u8(".base_stats.special_attack"),
            .spDefense = u8(".base_stats.special_defense"),
        },

        .types = {
            enum_u8(".types[0]", enum PokemonType),
            enum_u8(".types[1]", enum PokemonType),
        },

        .abilities = {
            enum_u8(".abilities[0]", enum Ability),
            enum_u8(".abilities[1]", enum Ability),
        },

        .evYields = {
            .hp        = u8_maxbits(".ev_yields.hp", 2),
            .attack    = u8_maxbits(".ev_yields.attack", 2),
            .defense   = u8_maxbits(".ev_yields.defense", 2),
            .speed     = u8_maxbits(".ev_yields.speed", 2),
            .spAttack  = u8_maxbits(".ev_yields.special_attack", 2),
            .spDefense = u8_maxbits(".ev_yields.special_defense", 2),
        },

        .wildHeldItems = {
            .common = enum_u16(".held_items.common", enum Item),
            .rare   = enum_u16(".held_items.rare", enum Item),
        },

        .eggGroups = {
            enum_u8(".egg_groups[0]", enum EggGroup),
            enum_u8(".egg_groups[1]", enum EggGroup),
        },

        .baseExpReward  = u8(".base_exp_reward"),
        .baseFriendship = u8(".base_friendship"),
        .bodyColor      = (u8)(enum_u8(".body_color", enum PokemonColor) & maxbit(7)),
        .catchRate      = u8(".catch_rate"),
        .expRate        = enum_u8(".exp_rate", enum ExpRate),
        .flipSprite     = boolean(".flip_sprite"),
        .genderRatio    = enum_u8(".gender_ratio", enum GenderRatio),
        .hatchCycles    = u8(".hatch_cycles"),
        .safariFleeRate = u8(".safari_flee_rate"),

        .tmLearnsetMasks = { 0 },
    };

    proc_tmlearnset(df, &personal);
    return personal;
}

static void proc_tmlearnset(datafile_t *df, SpeciesData *out) {
    datanode_t tm_learnset = dp_get(df, ".learnset.by_tm");
    for (size_t i = 0; i < dp_arrlen(tm_learnset); i++) {
        datanode_t  dn    = dp_arrelem(tm_learnset, i);
        const char *entry = dp_string(dn);

        long  value  = 0;
        char *endptr = NULL;
        if (entry == NULL) continue; // not a string, error is already recorded
        if ((entry[0] == 'T' || entry[0] == 'H') && entry[1] == 'M') {
            value = strtol(&entry[2], &endptr, 10);
            if (*endptr != 0 || value < 1) goto errmarker;
            if (entry[0] == 'T' && (size_t)value > NUM_TMS) goto errmarker;
            if (entry[0] == 'H' && (size_t)value > NUM_HMS) goto errmarker;

            value -= 1;
            value += NUM_TMS * (entry[0] == 'H');
        }
        else {
        errmarker:
            dp_error(&dn, "expected entry to be a valid TM or HM marker");
            continue;
        }

        size_t idx = value / 32;
        size_t bit = value % 32;
        out->tmLearnsetMasks[idx] |= ((unsigned)1 << bit); // NOTE: cast is required here to avoid SIGILL
    }
}

static SpeciesEvolutionList proc_evolutions(datafile_t *df) {
    SpeciesEvolutionList result = { 0 };

    datanode_t evolutions = dp_get(df, ".evolutions");
    size_t     len_evos   = dp_arrlen(evolutions);
    if (len_evos > MAX_EVOLUTIONS) {
        dp_error(&evolutions,
                 "expected at most %u entries, but found %zu",
                 MAX_LEARNSET_ENTRIES, len_evos);
        return result;
    }

    for (size_t i = 0; i < len_evos; i++) {
        datanode_t entry  = dp_arrelem(evolutions, i);
        datanode_t method = dp_lookup(dp_arrelem(entry, 0), "enum EvolutionMethod");
        if (method.type == DATAPROC_T_ERR) continue; // Don't bother if the evolution method is invalid

        datanode_t param   = { .type = DATAPROC_T_MAPPED, .mapped = 0 };
        datanode_t species = { 0 };
        switch ((enum EvolutionMethod)dp_u16(method)) {
        case EVO_NONE:
        case EVO_LEVEL_HAPPINESS:
        case EVO_LEVEL_HAPPINESS_DAY:
        case EVO_LEVEL_HAPPINESS_NIGHT:
        case EVO_TRADE:
        case EVO_LEVEL_MAGNETIC_FIELD:
        case EVO_LEVEL_MOSS_ROCK:
        case EVO_LEVEL_ICE_ROCK:
            species = dp_lookup(dp_arrelem(entry, 1), "enum Species");
            break;

        case EVO_LEVEL:
        case EVO_LEVEL_ATK_GT_DEF:
        case EVO_LEVEL_ATK_EQ_DEF:
        case EVO_LEVEL_ATK_LT_DEF:
        case EVO_LEVEL_PID_LOW:
        case EVO_LEVEL_PID_HIGH:
        case EVO_LEVEL_NINJASK:
        case EVO_LEVEL_SHEDINJA:
        case EVO_LEVEL_BEAUTY:
        case EVO_LEVEL_MALE:
        case EVO_LEVEL_FEMALE:
            param   = dp_arrelem(entry, 1);
            species = dp_lookup(dp_arrelem(entry, 2), "enum Species");
            break;

        case EVO_TRADE_WITH_HELD_ITEM:
        case EVO_USE_ITEM:
        case EVO_USE_ITEM_MALE:
        case EVO_USE_ITEM_FEMALE:
        case EVO_LEVEL_WITH_HELD_ITEM_DAY:
        case EVO_LEVEL_WITH_HELD_ITEM_NIGHT:
            param   = dp_lookup(dp_arrelem(entry, 1), "enum Item");
            species = dp_lookup(dp_arrelem(entry, 2), "enum Species");
            break;

        case EVO_LEVEL_KNOW_MOVE:
            param   = dp_lookup(dp_arrelem(entry, 1), "enum Move");
            species = dp_lookup(dp_arrelem(entry, 2), "enum Species");
            break;

        case EVO_LEVEL_SPECIES_IN_PARTY:
            param   = dp_lookup(dp_arrelem(entry, 1), "enum Species");
            species = dp_lookup(dp_arrelem(entry, 2), "enum Species");
            break;

        default:
            // NOTE: This is a sanity-check for users that add a new EvolutionMethod
            // but fail to add a case to this switch.
            dp_error(&method, "no handler implemented for EvolutionMethod member '%s'",
                     dp_string(dp_arrelem(entry, 0)));
            break;
        }

        result.data[i] = (SpeciesEvolution){
            .method        = dp_u16(method),
            .param         = dp_u16(param),
            .targetSpecies = dp_u16(species),
        };
    }

    return result;
}

static SpeciesLearnsetSized proc_lvlearnset(datafile_t *df) {
    SpeciesLearnsetSized result = { 0 };

    datanode_t lv_learnset  = dp_get(df, ".learnset.by_level");
    size_t     len_learnset = dp_arrlen(lv_learnset);
    if (len_learnset > MAX_LEARNSET_ENTRIES) {
        dp_error(&lv_learnset,
                 "expected at most %u entries, but found %zu",
                 MAX_LEARNSET_ENTRIES, len_learnset);
        return result;
    }

    for (size_t i = 0; i < len_learnset; i++) {
        datanode_t entry = dp_arrelem(lv_learnset, i);
        datanode_t level = dp_arrelem(entry, 0);
        datanode_t move  = dp_arrelem(entry, 1);

        result.data.entries[result.size].move  = (u16)(dp_u16(dp_lookup(move, "enum Move")) & maxbit(9));
        result.data.entries[result.size].level = (u16)(dp_u8(level) & maxbit(7));
        result.size++;
    }

    result.data.entries[result.size].move  = (u16)UINT16_MAX & maxbit(9);
    result.data.entries[result.size].level = (u16)UINT16_MAX & maxbit(7);
    result.size++;

    result.size *= sizeof(SpeciesLearnsetEntry);
    result.size += (-result.size & 3);
    return result;
}

static SpeciesPalPark proc_palpark(datafile_t *df, size_t i) {
    SpeciesPalPark result = { 0 };
    if (i == SPECIES_NONE || i >= NATIONAL_DEX_MAX) return result;

    datanode_t catching_show   = dp_get(df, ".catching_show");
    datanode_t land_area       = dp_lookup(dp_objmemb(catching_show, "pal_park_land_area"), "enum PalParkLandArea");
    datanode_t water_area      = dp_lookup(dp_objmemb(catching_show, "pal_park_water_area"), "enum PalParkWaterArea");
    datanode_t catching_points = dp_objmemb(catching_show, "catching_points");
    datanode_t rarity          = dp_objmemb(catching_show, "rarity");
    datanode_t unused_u16      = dp_objmemb(catching_show, "unused");

    result.landArea       = dp_u8(land_area);
    result.waterArea      = dp_u8(water_area);
    result.catchingPoints = dp_u8(catching_points);
    result.rarity         = dp_u8(rarity);
    result.unused.asU16   = dp_u16(unused_u16);

    return result;
}

static enum Species proc_offspring(datafile_t *df, size_t i) {
    return i <= SPECIES_BAD_EGG
        ? (enum Species)enum_u16(".offspring", enum Species)
        : (enum Species)i;
}

#define M_TO_IN(m)   (long)round((double)(m) * 39.37)
#define IN_TO_M(in)  (round((double)(in) / 3.937) / 10.0)
#define KG_TO_LB(kg) ((kg) / 0.45359237)
#define LB_TO_KG(lb) ((lb) * 0.45359237)

static inline double species_weight_rounding_override(enum Species species) {
    // The Generation 3 games used an inaccurate factor to convert from the
    // metric values stored in ROM to the imperial values displayed in the US
    // release's Pokedex. The species listed below thus had incorrect imperial
    // weights, and these incorrect weights propagated into Generation 4. The
    // incorrect values were not corrected until Generation 8 (Sword & Shield).
    switch (species) {
    case SPECIES_MR_MIME:
    case SPECIES_FURRET:
    case SPECIES_PORYGON2:
    case SPECIES_LINOONE:
    case SPECIES_LOMBRE:
    case SPECIES_TORKOAL:
    case SPECIES_RAYQUAZA:
        return -0.1;

    default: return 0.0;
    }
}

static u32 get_height_decimeters(datanode_t dexdata) {
    const bool metric = dp_hasmemb(dexdata, "height_meters");
    if (metric && dp_hasmemb(dexdata, "height_inches")) {
        datanode_t height_m = dp_objmemb(dexdata, "height_meters");
        datanode_t height_i = dp_objmemb(dexdata, "height_inches");

        dp_error(&dexdata, "conflicting unit-systems given for species height; remove one before rebuilding");
        dp_note(&height_m, "metric units defined here");
        dp_note(&height_i, "imperial units defined here");
    }

    double height = metric
                  ? dp_float(dp_objmemb(dexdata, "height_meters"))
                  : IN_TO_M(dp_u32(dp_objmemb(dexdata, "height_inches")));
    double decime = round(height * 10);
    return (u32)decime;
}

static u32 get_weight_hectograms(datanode_t dexdata, enum Species species) {
    const bool metric = dp_hasmemb(dexdata, "weight_kilograms");
    if (metric && dp_hasmemb(dexdata, "weight_pounds")) {
        datanode_t weight_m = dp_objmemb(dexdata, "weight_kilograms");
        datanode_t weight_i = dp_objmemb(dexdata, "weight_pounds");

        dp_error(&dexdata, "conflicting unit-systems given for species weight; remove one before rebuilding");
        dp_note(&weight_m, "metric units defined here");
        dp_note(&weight_i, "imperial units defined here");
    }

    double weight = metric
                  ? dp_float(dp_objmemb(dexdata, "weight_kilograms"))
                  : LB_TO_KG(dp_float(dp_objmemb(dexdata, "weight_pounds")) - species_weight_rounding_override(species));
    double hectog = round(weight * 10);
    return (u32)hectog;
}

static SpeciesDexData dexdata_giratina_origin = { 0 };
static u8             type0_cache_giratina_altered = 0;
static u8             type1_cache_giratina_altered = 0;
static u8             shape_cache_giratina_altered = 0;

static SpeciesDexData proc_dexdata(datafile_t *df, size_t i, const char *base_dir) {
    if (i >= SPECIES_EGG) return (SpeciesDexData) { 0 };

    datanode_t dexdata = dp_get(df, ".pokedex_data");

    if (i == SPECIES_GIRATINA) {
        datafile_t origin_df    = { 0 };
        char      *origin_fpath = pathjoin(base_dir, "giratina/forms/origin", "data.json");

        // Don't bother emitting errors here; they'll get reported later
        u8 type0 = 0, type1 = 0;
        if (dp_load(&origin_df, origin_fpath) == 0) {
            type0 = dp_u8(dp_lookup(dp_get(&origin_df, ".types[0]"), "enum PokemonType"));
            type1 = dp_u8(dp_lookup(dp_get(&origin_df, ".types[1]"), "enum PokemonType"));
        }

        datanode_t origin = dp_objmemb(dexdata, "origin_forme");
        dexdata_giratina_origin = (SpeciesDexData) {
            .index = {
                .species = (enum Species)i,
                .name    = NULL,
                .height  = get_height_decimeters(origin),
                .weight  = get_weight_hectograms(origin, (enum Species)i),
            },

            .body_shape = dp_u8(dp_lookup(dp_objmemb(origin, "body_shape"), "enum PokemonBodyShape")),
            .type0      = type0,
            .type1      = type1,
            .tr_scale_f = dp_u16(dp_objmemb(origin, "trainer_scale_f")),
            .pk_scale_f = dp_u16(dp_objmemb(origin, "pokemon_scale_f")),
            .tr_scale_m = dp_u16(dp_objmemb(origin, "trainer_scale_m")),
            .pk_scale_m = dp_u16(dp_objmemb(origin, "pokemon_scale_m")),
            .tr_pos_f   = dp_u16(dp_objmemb(origin, "trainer_pos_f")),
            .pk_pos_f   = dp_u16(dp_objmemb(origin, "pokemon_pos_f")),
            .tr_pos_m   = dp_u16(dp_objmemb(origin, "trainer_pos_m")),
            .pk_pos_m   = dp_u16(dp_objmemb(origin, "pokemon_pos_m")),
        };

        free(origin_fpath);
        dp_free(&origin_df);
    }

    const char *name = dp_string(dp_objmemb(dp_objmemb(dexdata, "en"), "name"));
    if (name) strcpy(name_store[i], name); // NOTE: This is an error later
    return (SpeciesDexData) {
        .index = {
            .species = (enum Species)i,
            .name    = name_store[i],
            .height  = get_height_decimeters(dexdata),
            .weight  = get_weight_hectograms(dexdata, (enum Species)i),
        },

        .body_shape = dp_u8(dp_lookup(dp_objmemb(dexdata, "body_shape"), "enum PokemonBodyShape")),
        .type0      = dp_u8(dp_lookup(dp_get(df, ".types[0]"), "enum PokemonType")),
        .type1      = dp_u8(dp_lookup(dp_get(df, ".types[1]"), "enum PokemonType")),
        .tr_scale_f = dp_u16(dp_objmemb(dexdata, "trainer_scale_f")),
        .pk_scale_f = dp_u16(dp_objmemb(dexdata, "pokemon_scale_f")),
        .tr_scale_m = dp_u16(dp_objmemb(dexdata, "trainer_scale_m")),
        .pk_scale_m = dp_u16(dp_objmemb(dexdata, "pokemon_scale_m")),
        .tr_pos_f   = dp_u16(dp_objmemb(dexdata, "trainer_pos_f")),
        .pk_pos_f   = dp_u16(dp_objmemb(dexdata, "pokemon_pos_f")),
        .tr_pos_m   = dp_u16(dp_objmemb(dexdata, "trainer_pos_m")),
        .pk_pos_m   = dp_u16(dp_objmemb(dexdata, "pokemon_pos_m")),
    };
}

static SpeciesHeights proc_heights(datafile_t *df, enum GenderRatio ratio) {
    datanode_t back  = dp_get(df, ".back.y_offset");
    datanode_t front = dp_get(df, ".front.y_offset");

    SpeciesHeights result = { 0 };

    if (ratio != GENDER_RATIO_FEMALE_ONLY) {
        result.has_male   = true;
        result.back_male  = dp_u8(dp_objmemb(back, "male"));
        result.front_male = dp_u8(dp_objmemb(front, "male"));
    }

    if (ratio != GENDER_RATIO_MALE_ONLY && ratio != GENDER_RATIO_NO_GENDER) {
        result.has_female   = true;
        result.back_female  = dp_u8(dp_objmemb(back, "female"));
        result.front_female = dp_u8(dp_objmemb(front, "female"));
    }

    return result;
}

static SpeciesSpriteAnim proc_spriteanim(datanode_t dn) {
    SpeciesSpriteAnim result = {
        .animation  = dp_u8(dp_objmemb(dn, "animation")),
        .cryDelay   = dp_u8(dp_objmemb(dn, "cry_delay")),
        .startDelay = dp_u8(dp_objmemb(dn, "start_delay")),
    };

    datanode_t   frames     = dp_objmemb(dn, "frames");
    const size_t num_frames = dp_arrlen(frames);
    for (size_t i = 0; i < num_frames; i++) {
        datanode_t frame = dp_arrelem(frames, i);

        result.frames[i] = (SpriteAnimFrame){
            .spriteFrame = dp_s8(dp_objmemb(frame, "sprite_frame")),
            .frameDelay  = dp_u8(dp_objmemb(frame, "frame_delay")),
            .xOffset     = dp_s8(dp_objmemb(frame, "x_shift")),
            .yOffset     = dp_s8(dp_objmemb(frame, "y_shift")),
        };
    }

    return result;
}

static SpeciesSpriteData proc_spritedata(datafile_t *df) {
    return (SpeciesSpriteData){
        .yOffset       = s8(".front.addl_y_offset"),
        .xOffsetShadow = s8(".shadow.x_offset"),
        .shadowSize    = enum_u8(".shadow.size", enum ShadowSize),
        .faceAnims     = {
            [0] = proc_spriteanim(dp_get(df, ".front")),
            [1] = proc_spriteanim(dp_get(df, ".back")),
        },
    };
}

static FILE **f_tutor_sets      = &headers[H_LEARNSETS_BY_TUTOR].out_file;
static FILE **f_egg_moves       = &headers[H_EGG_MOVES].out_file;
static FILE **f_footprint_sizes = &headers[H_FOOTPRINT_SIZES].out_file;
static FILE **f_footprint_types = &headers[H_FOOTPRINT_TYPES].out_file;
static FILE **f_icon_palettes   = &headers[H_ICON_PALETTES].out_file;

static void emit_tutorables(datafile_t *df, size_t i) {
    // NOTE: none of these have any tutorable learnsets, but mechanically-distinct forms
    // (e.g., Giratina-Origin) do
    if (i == SPECIES_NONE || i == SPECIES_EGG || i == SPECIES_BAD_EGG) return;

    datanode_t dn = dp_get(df, ".learnset.by_tutor");
    memset(tutorset, 0, tutorset_size);
    fputs("    { ", *f_tutor_sets);

    for (size_t i = 0; i < dp_arrlen(dn); i++) {
        datanode_t  move   = dp_arrelem(dn, i);
        const char *move_s = dp_string(move);
        if (dp_lookup(move, "enum Move").type == DATAPROC_T_ERR) continue;

        const char *found = NULL;
        size_t      idx   = 0;
        for (size_t j = 0; j < len_tutorable_moves && !found; j++) {
            if (strcmp(tutorable_moves[j], move_s) == 0) { found = tutorable_moves[j]; idx = j; }
        }

        if (found) tutorset[idx / 8] |= (u8)(1 << (idx % 8));
        else dp_error(&move, "'%s' is not available from any move tutors", move_s);
    }

    for (size_t i = 0; i < tutorset_size; i++) fprintf(*f_tutor_sets, "0x%02X, ", tutorset[i]);
    fputs("},\n", *f_tutor_sets);
}

static void emit_eggmoves(datafile_t *df, const char *species_upper) {
    datanode_t dn = dp_try(df, ".learnset.egg_moves");
    if (dn.type == DATAPROC_T_ERR) return;

    fprintf(*f_egg_moves, "    SPECIES_%s + EGG_MOVES_SPECIES_OFFSET,\n", species_upper);
    for (size_t i = 0; i < dp_arrlen(dn); i++) {
        datanode_t  move   = dp_arrelem(dn, i);
        const char *move_s = dp_string(move);
        dp_lookup(move, "enum Move"); // only to verify that this is a move name

        fprintf(*f_egg_moves, "    %s,\n", move_s);
    }

    fputc('\n', *f_egg_moves);
}

static void emit_footprints(datafile_t *df, size_t i, const char *species_upper) {
    // NOTE: eggs and alternate-forms do not have any footprint data
    if (i >= NATIONAL_DEX_MAX) return;

    datanode_t  root = dp_get(df, ".footprint");
    const bool  has  = dp_bool(dp_objmemb(root, "has"));
    const char *size = dp_string(dp_lookup_s(dp_objmemb(root, "size"), "enum FootprintSize"));
    const char *type = dp_string(dp_lookup_s(dp_objmemb(root, "type"), "FOOTPRINT_TYPE"));

    fprintf(*f_footprint_sizes, "    { %s, %s },\n",
            has ? "TRUE" : "FALSE",
            size);
    fprintf(*f_footprint_types, "    [SPECIES_%s] = { %s, %s },\n",
            species_upper,
            type,
            has || i == SPECIES_SPIRITOMB ? "TRUE" : "FALSE");
}

static void emit_iconpalettes(datafile_t *df, size_t i, const char *species) {
    // We make a separate-copy to make this fool-proof, since the surrounding functions modify the string
    char *capped = strreplace(strremove(strupper(species), "/FORMS"), '/', '_');

    datanode_t palette = dp_get(df, ".icon_palette");
    if (palette.type == DATAPROC_T_INT) {
        long  idx  = dp_int(palette);

        switch (i) {
        default:
            fprintf(*f_icon_palettes, "    [%s_%s] = %ld,\n",
                    i > SPECIES_BAD_EGG ? "ICON" : "SPECIES", capped, idx);
            break;

        case SPECIES_EGG:     fprintf(*f_icon_palettes, "    [ICON_EGG] = %ld,\n", idx); break;
        case SPECIES_BAD_EGG: fprintf(*f_icon_palettes, "    [ICON_MANAPHY_EGG] = %ld,\n", idx); break;
        }

        goto cleanup;
    }

    // Must be an array of tuples like: [form_name, palette_index]
    for (size_t j = 0; j < dp_arrlen(palette); j++) {
        datanode_t elem = dp_arrelem(palette, j);
        datanode_t form = dp_arrelem(elem, 0);
        datanode_t pltt = dp_arrelem(elem, 1);

        if (form.type != DATAPROC_T_ERR && pltt.type != DATAPROC_T_ERR) {
            const char *form_s = dp_string(form);
            const long  pltt_i = dp_int(pltt);
            if (strcmp(form_s, "base") == 0) {
                fprintf(*f_icon_palettes, "    [SPECIES_%s] = %ld,\n", capped, pltt_i);
            }
            else {
                char *form_capped = strupper(form_s);
                fprintf(*f_icon_palettes, "    [ICON_%s_%s] = %ld,\n", capped, form_capped, pltt_i);
                free(form_capped);
            }
        }
    }

cleanup:
    free(capped);
}

static inline void emit_weight(size_t bank_id, const char *species, const char *weight, char *buf) {
    assert(bank_id == T_WEIGHTS_WITH_GIRA_ALTERED || bank_id == T_WEIGHTS_WITH_GIRA_ORIGIN);

    const char *id_fmt = bank_id == T_WEIGHTS_WITH_GIRA_ALTERED
        ? "species_weight_gira_%s"
        : "species_weight_%s";

    datanode_t entry = dp_arr_appobject(&textbanks[bank_id].root);
    dp_obj_putstring(&entry, "id", strfmt(id_fmt, species));
    dp_obj_putstring(&entry, "en_US", strfmt("%s lbs.", weight));
}

static inline void stringify_weight(char *buf, double weight) {
    char tmp[16] = { 0 };
    snprintf(tmp, 16, "%.1f", weight);

    const size_t   len = strlen(tmp);
    const size_t   pad = 6 - len;
    unsigned char *p   = (unsigned char *)buf;
    for (size_t j = 0; j < pad; j++) {
        p[0] = 0xE2;
        p[1] = 0x80;
        p[2] = 0x89;
        p   += 3;
    }

    memcpy(p, tmp, len);
}

static void emit_weights(SpeciesDexIndex *index, enum Species species, const char *species_name, char *buf) {
    char weight_str[32] = { 0 };
    if (species == SPECIES_NONE) {
        emit_weight(T_WEIGHTS_WITH_GIRA_ALTERED, species_name, "????.?", buf);
        emit_weight(T_WEIGHTS_WITH_GIRA_ORIGIN,  species_name, "????.?", buf);
        return;
    }

    double weight = KG_TO_LB(((double)index->weight / 10.0)) + species_weight_rounding_override(species);
    stringify_weight(weight_str, weight);
    emit_weight(T_WEIGHTS_WITH_GIRA_ALTERED, species_name, weight_str, buf);

    if (species == SPECIES_GIRATINA) {
        double weight = KG_TO_LB(((double)dexdata_giratina_origin.index.weight / 10.0)) + species_weight_rounding_override(species);
        stringify_weight(weight_str, weight);
    }

    emit_weight(T_WEIGHTS_WITH_GIRA_ORIGIN, species_name, weight_str, buf);
}

static inline void emit_height(size_t bank_id, const char *species, const char *height, char *buf) {
    assert(bank_id == T_HEIGHTS_WITH_GIRA_ALTERED || bank_id == T_HEIGHTS_WITH_GIRA_ORIGIN);

    const char *id_fmt = bank_id == T_HEIGHTS_WITH_GIRA_ALTERED
        ? "species_height_gira_%s"
        : "species_height_%s";

    datanode_t entry = dp_arr_appobject(&textbanks[bank_id].root);
    dp_obj_putstring(&entry, "id", strfmt(id_fmt, species));
    dp_obj_putstring(&entry, "en_US", height);
}

static inline void stringify_height(char *buf, long height) {
    char tmp[32] = { 0 };
    snprintf(tmp, 32, "%01ld’%02ld”", height / 12, height % 12);

    // ’ and ” are both 3-bytes wide in UTF-8, so the required length of the
    // stringified height is:
    //   - 3 ASCII digits for the feet-value
    //   - 2 ASCII digits for the inches-value
    //   - 3 bytes for each of the unit-markers
    const size_t   len = strlen(tmp);
    const size_t   pad = (3 + 2 + 3 + 3) - len;
    unsigned char *p   = (unsigned char *)buf;
    for (size_t j = 0; j < pad; j++) {
        p[0] = 0xE2;
        p[1] = 0x80;
        p[2] = 0x89;
        p   += 3;
    }

    memcpy(p, tmp, len);
}

static void emit_heights(SpeciesDexIndex *index, enum Species species, const char *species_name, char *buf) {
    if (species == SPECIES_NONE) {
        emit_height(T_HEIGHTS_WITH_GIRA_ALTERED, species_name, "???’??”", buf);
        emit_height(T_HEIGHTS_WITH_GIRA_ORIGIN,  species_name, "???’??”", buf);
        return;
    }

    char height_str[32] = { 0 };

    long height = M_TO_IN((double)index->height / 10.0);
    stringify_height(height_str, height);
    emit_height(T_HEIGHTS_WITH_GIRA_ALTERED, species_name, height_str, buf);

    if (species == SPECIES_GIRATINA) {
        long height = M_TO_IN((double)dexdata_giratina_origin.index.height / 10.0);
        stringify_height(height_str, height);
    }

    emit_height(T_HEIGHTS_WITH_GIRA_ORIGIN,  species_name, height_str, buf);
}

static void emit_textbanks(datafile_t *df, size_t i, const char *species, SpeciesDexIndex *index) {
    if (i > SPECIES_BAD_EGG) return;

    char buf[BUFSIZE] = { 0 };

    datanode_t  dexdata = dp_get(df, ".pokedex_data");
    const char *name    = dp_string(dp_objmemb(dp_objmemb(dexdata, "en"), "name"));

    datanode_t entry = dp_arr_appobject(&textbanks[T_NAMES].root);
    dp_obj_putstring(&entry, "id", strfmt("species_name_%s", species));
    dp_obj_putstring(&entry, "en_US", i != SPECIES_NONE ? name : "-----");

    entry = dp_arr_appobject(&textbanks[T_NAMES_WITH_ARTICLES].root);
    dp_obj_putstring(&entry, "id", strfmt("species_name_with_articles_%s", species));

    if (i == SPECIES_NONE) dp_obj_putint(&entry, "garbage", 0);
    else {
        const char *article = "a";
        switch (name[0]) {
        case 'A':
        case 'E':
        case 'I':
        case 'O':
        case 'U':
            article = "an";
            break;
        }
        dp_obj_putstring(&entry, "en_US", strfmt("%s {COLOR 255}%s{COLOR 0}", article, name));
    }

    if (i >= SPECIES_EGG) return;

#define emit_dexentry(bank_id, lang)                                                        \
    do {                                                                                    \
        entry = dp_arr_appobject(&textbanks[bank_id].root);                                 \
        dp_obj_putstring(&entry, "id", strfmt("species_pokedex_entry_" lang "_%s", species)); \
        if (i == SPECIES_NONE) dp_obj_putint(&entry, "garbage", 0);                         \
        else {                                                                              \
            datanode_t lines  = dp_objmemb(dp_objmemb(dexdata, lang), "entry_text");        \
            size_t     nlines = dp_arrlen(lines);                                           \
            char      *full   = NULL;                                                       \
            for (size_t j = 0; j < nlines; j++) {                                           \
                const char *line = dp_string(dp_arrelem(lines, j));                         \
                char       *escd = strreplstr(line, "\n", "\\n");                           \
                char       *join = strjoin(full, escd, NULL);                               \
                free(full);                                                                 \
                full = join;                                                                \
                free(escd);                                                                 \
            }                                                                               \
            dp_obj_putstring(&entry, "en_US", full);                                        \
            free(full);                                                                     \
        }                                                                                   \
    } while (0)

#define emit_dexnumber(bank_id, lang, wide)                                                           \
    do {                                                                                              \
        entry = dp_arr_appobject(&textbanks[bank_id].root);                                           \
        unsigned char numbuf[16] = { 0xEF, 0xBC, 0x90, 0xEF, 0xBC, 0x90, 0xEF, 0xBC, 0x90, 0 };       \
        if (wide) {                                                                                   \
            numbuf[2] += (unsigned char)(i / 100);                                                    \
            numbuf[5] += (unsigned char)(i % 100) / 10;                                               \
            numbuf[8] += (unsigned char)(i % 10);                                                     \
        }                                                                                             \
        const char *locname = dp_string(dp_objmemb(dp_objmemb(dexdata, lang), "name"));               \
        dp_obj_putstring(&entry, "id", strfmt("species_name_with_natdex_number_" lang "_%s", species)); \
        dp_obj_putstring(&entry, "en_US",                                                             \
                         i == SPECIES_NONE ? locname                                                  \
                         : wide == true ? strfmt("%s  %s", numbuf, locname)                             \
                         : strfmt("%03zu  %s", i, locname));                                            \
    } while (0)

#define emit_dexcategory(bank_id, lang) \
    do {                                                                                   \
        entry = dp_arr_appobject(&textbanks[bank_id].root);                                \
                                                                                           \
        const char *loccat = dp_string(dp_objmemb(dp_objmemb(dexdata, lang), "category")); \
        dp_obj_putstring(&entry, "id", strfmt("species_category_" lang "_%s", species));     \
        dp_obj_putstring(&entry, "en_US", loccat);                                         \
    } while (0)

#define NUM_LANGS 6

#define emit_dexbanks(base_bank_id, lang, wide)                 \
    do {                                                        \
        emit_dexentry(base_bank_id, lang);                      \
        emit_dexnumber(base_bank_id + NUM_LANGS, lang, wide);   \
        emit_dexcategory(base_bank_id + (2 * NUM_LANGS), lang); \
    } while (0)

    emit_dexbanks(T_POKEDEX_ENTRY_EN, "en", false);
    emit_dexbanks(T_POKEDEX_ENTRY_FR, "fr", false);
    emit_dexbanks(T_POKEDEX_ENTRY_DE, "de", false);
    emit_dexbanks(T_POKEDEX_ENTRY_IT, "it", false);
    emit_dexbanks(T_POKEDEX_ENTRY_ES, "es", false);
    emit_dexbanks(T_POKEDEX_ENTRY_JP, "jp", true);

    entry = dp_arr_appobject(&textbanks[T_CATEGORY].root);
    const char *category = dp_string(dp_objmemb(dp_objmemb(dexdata, "en"), "category"));
    dp_obj_putstring(&entry, "id", strfmt("species_category_%s", species));
    dp_obj_putstring(&entry, "en_US", category);

    emit_weights(index, (enum Species)i, species, buf);
    emit_heights(index, (enum Species)i, species, buf);
}

static void pack(Container *species, size_t i) {
    nitroarc_ppack(&archives[A_PERSONAL].packer, &species->personal, sizeof(SpeciesData), NULL);
    nitroarc_ppack(&archives[A_EVOLUTIONS].packer, &species->evolutions, sizeof(SpeciesEvolutionList), NULL);
    nitroarc_ppack(&archives[A_LEVEL_LEARNSETS].packer, &species->levelup_learnset.data, (u32)species->levelup_learnset.size, NULL);

    if (i < NATIONAL_DEX_MAX) {
        nitroarc_ppack(&archives[A_SPRITE_OFFSETS].packer, &species->heights.back_female,  species->heights.has_female ? 1 : 0, NULL);
        nitroarc_ppack(&archives[A_SPRITE_OFFSETS].packer, &species->heights.back_male,    species->heights.has_male   ? 1 : 0, NULL);
        nitroarc_ppack(&archives[A_SPRITE_OFFSETS].packer, &species->heights.front_female, species->heights.has_female ? 1 : 0, NULL);
        nitroarc_ppack(&archives[A_SPRITE_OFFSETS].packer, &species->heights.front_male,   species->heights.has_male   ? 1 : 0, NULL);

        size_t offset = sizeof(SpeciesSpriteData) * i;
        memcpy(sprite_data + offset, &species->spritedata, sizeof(SpeciesSpriteData));

        // All of these arrays can safely hotswap Giratina-Origin's data when it
        // comes time to build the archive.
        dex_heights[i] = species->dexdata.index.height;
        dex_weights[i] = species->dexdata.index.weight;
        body_shapes[i] = (u8)species->dexdata.body_shape;
        tr_scale_f[i]  = species->dexdata.tr_scale_f;
        pk_scale_f[i]  = species->dexdata.pk_scale_f;
        tr_scale_m[i]  = species->dexdata.tr_scale_m;
        pk_scale_m[i]  = species->dexdata.pk_scale_m;
        tr_pos_f[i]    = species->dexdata.tr_pos_f;
        pk_pos_f[i]    = species->dexdata.pk_pos_f;
        tr_pos_m[i]    = species->dexdata.tr_pos_m;
        pk_pos_m[i]    = species->dexdata.pk_pos_m;

        if (i > SPECIES_NONE) {
            offset = sizeof(SpeciesPalPark) * (i - 1);
            memcpy(palpark + offset, &species->palpark, sizeof(SpeciesPalPark));

            natdex_listing[i - 1] = (u16)i;
            memcpy(&sortables[i - 1], &species->dexdata.index, sizeof(SpeciesDexIndex));

            if (i == SPECIES_GIRATINA) {
                type0_cache_giratina_altered = species->dexdata.type0;
                type1_cache_giratina_altered = species->dexdata.type1;
                shape_cache_giratina_altered = species->dexdata.body_shape;

                // Stage the type and shape indices as they exist at this point without either
                // of Giratina's forms.
                memcpy(giratina_altered_type0_index,
                       indexed_by_type[type0_cache_giratina_altered],
                       sizeof(*giratina_altered_type0_index) * (NATIONAL_DEX_MAX - 1));
                memcpy(giratina_altered_type1_index,
                       indexed_by_type[type1_cache_giratina_altered],
                       sizeof(*giratina_altered_type1_index) * (NATIONAL_DEX_MAX - 1));
                memcpy(giratina_altered_shape_index,
                       indexed_by_shape[shape_cache_giratina_altered],
                       sizeof(*giratina_altered_shape_index) * (NATIONAL_DEX_MAX - 1));
                memcpy(giratina_origin_type0_index,
                       indexed_by_type[dexdata_giratina_origin.type0],
                       sizeof(*giratina_origin_type0_index) * (NATIONAL_DEX_MAX - 1));
                memcpy(giratina_origin_type1_index,
                       indexed_by_type[dexdata_giratina_origin.type1],
                       sizeof(*giratina_origin_type1_index) * (NATIONAL_DEX_MAX - 1));
                memcpy(giratina_origin_shape_index,
                       indexed_by_shape[dexdata_giratina_origin.body_shape],
                       sizeof(*giratina_origin_shape_index) * (NATIONAL_DEX_MAX - 1));
                giratina_altered_type0_count = count_by_type[type0_cache_giratina_altered];
                giratina_altered_type1_count = count_by_type[type1_cache_giratina_altered];
                giratina_altered_shape_count = count_by_shape[shape_cache_giratina_altered];
                giratina_origin_type0_count  = count_by_type[dexdata_giratina_origin.type0];
                giratina_origin_type1_count  = count_by_type[dexdata_giratina_origin.type1];
                giratina_origin_shape_count  = count_by_shape[dexdata_giratina_origin.body_shape];

                // Update the Giratina-Origin indices with Giratina.
                giratina_origin_type0_index[giratina_origin_type0_count++] = (u16)i;
                giratina_origin_type1_index[giratina_origin_type1_count++] = (u16)i;
                giratina_origin_shape_index[giratina_origin_shape_count++] = (u16)i;
            }

#define index_push(T, v) do { indexed_by_##T[v][count_by_##T[v]] = (u16)i; count_by_##T[v]++; } while (0)
            u8 type0 = species->personal.types[0];
            u8 type1 = species->personal.types[1];
            u8 shape = (u8)species->dexdata.body_shape;

            index_push(type, type0);
            index_push(shape, shape);
            if (type0 != type1) index_push(type, type1);
#undef index_push

            if (i > SPECIES_GIRATINA) {
                // Push into the staging-copies for Giratina, too.
                if (type0 == type0_cache_giratina_altered) {
                    giratina_altered_type0_index[giratina_altered_type0_count++] = (u16)i;
                }
                if (type1 == type1_cache_giratina_altered) {
                    giratina_altered_type1_index[giratina_altered_type1_count++] = (u16)i;
                }
                if (shape == shape_cache_giratina_altered) {
                    giratina_altered_shape_index[giratina_altered_shape_count++] = (u16)i;
                }
                if (type0 == dexdata_giratina_origin.type0) {
                    giratina_origin_type0_index[giratina_origin_type0_count++] = (u16)i;
                }
                if (type1 == dexdata_giratina_origin.type1) {
                    giratina_origin_type1_index[giratina_origin_type1_count++] = (u16)i;
                }
                if (shape == dexdata_giratina_origin.body_shape) {
                    giratina_origin_shape_index[giratina_origin_shape_count++] = (u16)i;
                }
            }
        }
    }

    offspring[i] = (u16)species->offspring;
}

static int sort_by_name(const void *l, const void *r) {
    const SpeciesDexIndex *lhs = l;
    const SpeciesDexIndex *rhs = r;
    return strcmp(lhs->name, rhs->name);
}

static inline int sort_by_species_asc(const void *l, const void *r) {
    const SpeciesDexIndex *lhs = l;
    const SpeciesDexIndex *rhs = r;
    if (lhs->species < rhs->species) return -1;
    if (lhs->species > rhs->species) return  1;
    return 0;
}

static int sort_by_weight_desc(const void *l, const void *r) {
    const SpeciesDexIndex *lhs = l;
    const SpeciesDexIndex *rhs = r;
    if (lhs->weight > rhs->weight) return -1;
    if (lhs->weight < rhs->weight) return  1;
    return sort_by_species_asc(lhs, rhs);
}

static int sort_by_weight_asc(const void *l, const void *r) {
    const SpeciesDexIndex *lhs = l;
    const SpeciesDexIndex *rhs = r;
    if (lhs->weight < rhs->weight) return -1;
    if (lhs->weight > rhs->weight) return  1;
    return sort_by_species_asc(lhs, rhs);
}

static int sort_by_height_desc(const void *l, const void *r) {
    const SpeciesDexIndex *lhs = l;
    const SpeciesDexIndex *rhs = r;
    if (lhs->height > rhs->height) return -1;
    if (lhs->height < rhs->height) return  1;
    return sort_by_species_asc(lhs, rhs);
}

static int sort_by_height_asc(const void *l, const void *r) {
    const SpeciesDexIndex *lhs = l;
    const SpeciesDexIndex *rhs = r;
    if (lhs->height < rhs->height) return -1;
    if (lhs->height > rhs->height) return  1;
    return sort_by_species_asc(lhs, rhs);
}

#define sort_dex_index(func)                                                                 \
    do {                                                                                     \
        memcpy(sortables_copy, sortables, (NATIONAL_DEX_MAX - 1) * sizeof(*sortables_copy)); \
        qsort(sortables_copy, NATIONAL_DEX_MAX - 1, sizeof(*sortables_copy), func);          \
    } while (0)

#define pack_dex_index(func)                                                                       \
    do {                                                                                           \
        sort_dex_index(func);                                                                      \
        for (size_t i = 0; i < NATIONAL_DEX_MAX - 1; i++) {                                        \
            sorted_species[i] = (u16)sortables_copy[i].species;                                    \
        }                                                                                          \
        nitroarc_ppack(p, sorted_species, sizeof(*sorted_species) * (NATIONAL_DEX_MAX - 1), NULL); \
    } while (0)

#define pack_name_triplets(c)                                                     \
    do {                                                                          \
        memset(sorted_species, 0, NATIONAL_DEX_MAX - 1);                          \
        u16 count = 0;                                                            \
        while (i < NATIONAL_DEX_MAX - 1 && sortables_copy[i].name[0] <= c) {      \
            sorted_species[count++] = (u16)sortables_copy[i].species;             \
            i++;                                                                  \
        }                                                                         \
        nitroarc_ppack(p, sorted_species, count * sizeof(*sorted_species), NULL); \
    } while (0)

static int pack_dexdata(nitroarc_packer_t *p) {
    // Per-species Pokedex data
    nitroarc_ppack(p, dex_heights, sizeof(*dex_heights) * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, dex_weights, sizeof(*dex_weights) * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, body_shapes, sizeof(*body_shapes) * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, tr_scale_f,  sizeof(*tr_scale_f)  * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, pk_scale_f,  sizeof(*pk_scale_f)  * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, tr_scale_m,  sizeof(*tr_scale_m)  * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, pk_scale_m,  sizeof(*pk_scale_m)  * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, tr_pos_f,    sizeof(*tr_pos_f)    * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, pk_pos_f,    sizeof(*pk_pos_f)    * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, tr_pos_m,    sizeof(*tr_pos_m)    * NATIONAL_DEX_MAX, NULL);
    nitroarc_ppack(p, pk_pos_m,    sizeof(*pk_pos_m)    * NATIONAL_DEX_MAX, NULL);

    // Listings of the National and Sinnoh Pokedexes
    nitroarc_ppack(p, natdex_listing, sizeof(*natdex_listing) * (NATIONAL_DEX_MAX - 1), NULL);
    nitroarc_ppack(p, sinnohdex,      (u32)(sizeof(*sinnohdex) * sinnohdex_len), NULL);

    // Sorted indices by name, weight, and height
    SpeciesDexIndex *sortables_copy = calloc(NATIONAL_DEX_MAX - 1, sizeof(*sortables_copy));
    u16             *sorted_species = calloc(NATIONAL_DEX_MAX - 1, sizeof(*sorted_species));
    pack_dex_index(sort_by_name);
    pack_dex_index(sort_by_weight_desc);
    pack_dex_index(sort_by_weight_asc);
    pack_dex_index(sort_by_height_desc);
    pack_dex_index(sort_by_height_asc);

    // Indices of Species with names beginning with one of 3 letters (ABC, DEF, ...)
    sort_dex_index(sort_by_name);
    size_t i = 0;

    pack_name_triplets('C'); // ABC
    pack_name_triplets('F'); // DEF
    pack_name_triplets('I'); // GHI
    pack_name_triplets('L'); // JKL
    pack_name_triplets('O'); // MNO
    pack_name_triplets('R'); // PQR
    pack_name_triplets('U'); // STU
    pack_name_triplets('X'); // VWX
    pack_name_triplets('Z'); // YZ

    // Indices of species by their types
    for (size_t i = 0; i < NUM_POKEMON_TYPES; i++) {
        if (i == TYPE_MYSTERY) continue; // NOTE: The Mystery type is not packed
        nitroarc_ppack(p, indexed_by_type[i], count_by_type[i] * sizeof(**indexed_by_type), NULL);
    }

    // Indices of species by their body shapes
    for (size_t i = 0; i < NUM_BODY_SHAPES; i++) {
        nitroarc_ppack(p, indexed_by_shape[i], count_by_shape[i] * sizeof(**indexed_by_shape), NULL);
    }

    free(sortables_copy);
    free(sorted_species);
    return EXIT_SUCCESS;
}

static int pack_dexdata_giratina_altered(void) {
    return pack_dexdata(&archives[A_POKEDEX_INDICES_GIRA_ALTERED].packer);
}

#define swap(x, y) do { x ^= y; y ^= x; x ^= y; } while (0)
#define pswap(x, y) do { void *p = x; x = y; y = p; } while (0);

static void swap_giratina(void) {
    swap(dex_heights[SPECIES_GIRATINA], dexdata_giratina_origin.index.height);
    swap(dex_weights[SPECIES_GIRATINA], dexdata_giratina_origin.index.weight);
    swap(body_shapes[SPECIES_GIRATINA], dexdata_giratina_origin.body_shape);
    swap(tr_scale_f[SPECIES_GIRATINA],  dexdata_giratina_origin.tr_scale_f);
    swap(pk_scale_f[SPECIES_GIRATINA],  dexdata_giratina_origin.pk_scale_f);
    swap(tr_scale_m[SPECIES_GIRATINA],  dexdata_giratina_origin.tr_scale_m);
    swap(pk_scale_m[SPECIES_GIRATINA],  dexdata_giratina_origin.pk_scale_m);
    swap(tr_pos_f[SPECIES_GIRATINA],    dexdata_giratina_origin.tr_pos_f);
    swap(pk_pos_f[SPECIES_GIRATINA],    dexdata_giratina_origin.pk_pos_f);
    swap(tr_pos_m[SPECIES_GIRATINA],    dexdata_giratina_origin.tr_pos_m);
    swap(pk_pos_m[SPECIES_GIRATINA],    dexdata_giratina_origin.pk_pos_m);

    // We inject these directly, because the cache for Giratina currently has
    // the values which were previously in the indices above.
    sortables[SPECIES_GIRATINA - 1].height = dex_heights[SPECIES_GIRATINA];
    sortables[SPECIES_GIRATINA - 1].weight = dex_weights[SPECIES_GIRATINA];

    pswap(indexed_by_type[type0_cache_giratina_altered],        giratina_altered_type0_index);
    swap(count_by_type[type0_cache_giratina_altered],           giratina_altered_type0_count);
    pswap(indexed_by_type[type1_cache_giratina_altered],        giratina_altered_type1_index);
    swap(count_by_type[type1_cache_giratina_altered],           giratina_altered_type1_count);
    pswap(indexed_by_shape[dexdata_giratina_origin.body_shape], giratina_altered_shape_index);
    swap(count_by_shape[dexdata_giratina_origin.body_shape],    giratina_altered_shape_count);
    pswap(indexed_by_type[dexdata_giratina_origin.type0],       giratina_origin_type0_index);
    swap(count_by_type[dexdata_giratina_origin.type0],          giratina_origin_type0_count);
    pswap(indexed_by_type[dexdata_giratina_origin.type1],       giratina_origin_type1_index);
    swap(count_by_type[dexdata_giratina_origin.type1],          giratina_origin_type1_count);
    pswap(indexed_by_shape[body_shapes[SPECIES_GIRATINA]],      giratina_origin_shape_index);
    swap(count_by_shape[body_shapes[SPECIES_GIRATINA]],         giratina_origin_shape_count);
}

static int pack_dexdata_giratina_origin(void) {
    swap_giratina(); // swap-in
    int result = pack_dexdata(&archives[A_POKEDEX_INDICES_GIRA_ORIGIN].packer);
    swap_giratina(); // swap-out
    return result;
}

static int addl_done(void) {
    return pack_dexdata_giratina_altered()
        || pack_dexdata_giratina_origin()
        || fdump_blobnarc(palpark,     sizeof(SpeciesPalPark) * (NATIONAL_DEX_MAX - 1), "ppark.narc")
        || fdump_blobnarc(sprite_data, sizeof(SpeciesSpriteData) * NATIONAL_DEX_MAX,    "pl_poke_data.narc")
        || fdump_blob(offspring, sizeof(u16) * len_registry, "pms.narc")
        || EXIT_SUCCESS;
}

static void usage(const char *fmt, ...) __attribute__((format(printf, 1, 2)));

static void parse_args(int *pargc, char ***pargv) {
    program_name = (*pargv)[0];
    opterr       = 0;

    int c = 0;
    while ((c = getopt(*pargc, *pargv, ":o:t:s:M:h")) != -1) {
        switch (c) {
        case 'o': output_dir       = optarg; break;
        case 't': tutorables_fpath = optarg; break;
        case 's': sinnohdex_fpath  = optarg; break;
        case 'M': depfile_fpath    = optarg; break;

        case 'h': usage(NULL);                                 break;
        case ':': usage("missing argument for '-%c'", optopt); break;
        default:  usage("unknown option '-%c'", optopt);     break;
        }
    }

    *pargc -= optind;
    *pargv += optind;
    if (*pargc < 1) usage("missing required argument BASEDIR");

    base_dir = (*pargv)[0];
}

static void usage(const char *fmt, ...) {
    FILE *f = stdout;
    if (fmt != NULL) {
        f = stderr;

        va_list args;
        va_start(args, fmt);
        fputs(program_name, f);
        fputs(": ", f);
        vfprintf(f, fmt, args);
        fputc('\n', f);
        va_end(args);
    }

#define fputf(fmt, ...) fprintf(f, fmt, __VA_ARGS__)
    fputf("usage: %s [-M DEPFILE] [-t TUTORABLES_JSON] [-o OUTDIR] BASEDIR\n", program_name);
    fputs("\n", f);
    fputs("options:\n", f);
    fputs("  -o OUTDIR            Write output files to OUTDIR. Does not affect DEPFILE.\n", f);
    fputs("                       Defaults to the current working directory.\n", f);
    fputs("  -t TUTORABLES_JSON   Specify the full path to the tutorable-moves JSON file.\n", f);
    fputs("                       Defaults to 'move_tutors.json'.\n", f);
    fputs("  -s SINNOH_DEX_JSON   Specify the full path to the regional Sinnoh Pokedex\n", f);
    fputs("                       JSON file. Defaults to 'sinnoh_pokedex.json'.\n", f);
    fputs("  -M DEPFILE           Specify the full path to an output dependency file.\n", f);
    fputs("                       Defaults to 'species_data.d'.\n", f);
#undef fputf

    exit(f == stdout ? EXIT_SUCCESS : EXIT_FAILURE);
}
