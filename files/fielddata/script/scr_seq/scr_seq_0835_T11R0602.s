#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0602.h"
#include "msgdata/msg/msg_0536_T11R0602.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0602_000
	scrdef_end

scr_seq_T11R0602_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _0088
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_SAFFRON_MAGNET_TRAIN_STATION_1F, 0, 3, 3, DIR_EAST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_606
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0094
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0536_T11R0602_00000
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _00A0
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	releaseall
	end

	.balign 4, 0
_0088:
	step 13, 3
	step 15, 7
	step_end

	.balign 4, 0
_0094:
	step 15, 11
	step 13, 4
	step_end

	.balign 4, 0
_00A0:
	step 13, 2
	step_end

_00A8:
	end

	.balign 4, 0
