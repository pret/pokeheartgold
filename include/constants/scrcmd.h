#ifndef POKEHEARTGOLD_CONSTANTS_SCRCMD_H
#define POKEHEARTGOLD_CONSTANTS_SCRCMD_H

#include <nitro/types.h>
#include "constants/global.h"
#include "constants/species.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/sndseq.h"
#include "constants/ribbon.h"
#include "constants/pokemon.h"
#include "constants/std_script.h"
#include "constants/trainers.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/phone_contacts.h"
#include "constants/spawns.h"
#include "constants/badge.h"
#include "constants/global.fieldmap.h"

#ifdef PM_ASM
#define lt    0
#define eq    1
#define gt    2
#define le    3
#define ge    4
#define ne    5
#endif

#define obj_daycare_poke_1         250
#define obj_daycare_poke_2         251
#define obj_apricorn               252
#define obj_partner_poke           253
#define obj_player                 255
#define SCRDEF_END              0xFD13

#ifndef PM_ASM

#endif //PM_ASM

#endif //POKEHEARTGOLD_CONSTANTS_SCRCMD_H
