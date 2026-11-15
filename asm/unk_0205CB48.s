#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/field_move_response.h"
	.include "macros.inc"
	.include "unk_0205CB48.inc"
	.include "global.inc"

	.text

	.rodata

	.public sTileMovementFunctions
sTileMovementFunctions:
	.word PlayerAvatar_TileMove_None
	.word PlayerAvatar_TileMove_Ice
	.word PlayerAvatar_TileMove_CyclingRoadDown

	.public sTileBehaviorCheckTable
sTileBehaviorCheckTable:
	.word MetatileBehavior_IsIce, 1 ; TILE_MOVE_ICE
	.word 0, 3 ; NULL, TILE_MOVE_MAX

	.public sWalkSounds
sWalkSounds:
	.short SEQ_SE_GS_ASHIOTO_A_WALK, 0 ; Footstep A Walk
	.short SEQ_SE_GS_ASHIOTO_A, 0 ; Footstep A
	.short SEQ_SE_GS_OCHIBA, 0 ; Fallen Leaves
	.short SEQ_SE_GS_EDAPAKI, 0 ; Branch Snap
	.short SEQ_SE_GS_KUSA2, 0 ; Grass 2
	.short SEQ_SE_GS_ASHIOTO_B, 1 ; Footstep B
	.short SEQ_SE_GS_ASHIOTO_D, 1 ; Footstep D
	.short SEQ_SE_GS_ASHIOTO_D_2, 0 ; Footstep D2
	.short SEQ_SE_GS_ASHIOTO_E, 0 ; Footstep E
	.short SEQ_SE_GS_ASHIOTO_B, 1 ; Footstep B
	.short SEQ_SE_GS_ASHIOTO_F, 1 ; Footstep F
	.short SEQ_SE_GS_ASHIOTO_D, 0 ; Footstep D
	.short SEQ_SE_GS_ASHIOTO_H, 0 ; Footstep H
	.short SEQ_SE_GS_ASHIOTO_G, 0 ; Footstep G
	.short SEQ_SE_DP_BOX02, 0
	.short SEQ_SE_DP_BOX01, 0
