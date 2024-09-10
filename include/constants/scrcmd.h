#ifndef POKEHEARTGOLD_CONSTANTS_SCRCMD_H
#define POKEHEARTGOLD_CONSTANTS_SCRCMD_H

#include <nitro/types.h>

#include "constants/badge.h"
#include "constants/flags.h"
#include "constants/game_stats.h"
#include "constants/global.fieldmap.h"
#include "constants/global.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/movements.h"
#include "constants/moves.h"
#include "constants/phone_contacts.h"
#include "constants/pokemon.h"
#include "constants/ranking.h"
#include "constants/ribbon.h"
#include "constants/sndseq.h"
#include "constants/spawns.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/std_script.h"
#include "constants/trainers.h"
#include "constants/vars.h"

#define lt 0
#define eq 1
#define gt 2
#define le 3
#define ge 4
#define ne 5

#define obj_photo_subject  249
#define obj_daycare_poke_1 250
#define obj_daycare_poke_2 251
#define obj_apricorn       252
#define obj_partner_poke   253
#define obj_player         255
#define SCRDEF_END         0xFD13

#define MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT     0
#define MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT    1
#define MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT 2
#define MOVE_TUTOR_NPC_HEADBUTT              3

// mystery_gift
#define SCR_MG_BEGIN            0
#define SCR_MG_HAS_GIFT         1
#define SCR_MG_GET_TYPE         2
#define SCR_MG_CAN_RECEIVE      3
#define SCR_MG_RECEIVE          4
#define SCR_MG_MESSAGE_RECEIVED 5
#define SCR_MG_MESSAGE_FAILED   6
#define SCR_MG_END              7
#define SCR_MG_END2             8

#endif // POKEHEARTGOLD_CONSTANTS_SCRCMD_H
