#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0218.h"
#include "msgdata/msg/msg_0086_D24R0218.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0218_000
	scrdef scr_seq_D24R0218_001
	scrdef scr_seq_D24R0218_002
	scrdef scr_seq_D24R0218_003
	scrdef scr_seq_D24R0218_004
	scrdef scr_seq_D24R0218_005
	scrdef scr_seq_D24R0218_006
	scrdef_end

scr_seq_D24R0218_004:
	nop_var_490 VAR_TEMP_x4004
	compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	goto_if_eq _0035
	goto _0095

_0035:
	get_party_lead_alive VAR_TEMP_x4005
	compare VAR_UNK_4102, 1
	goto_if_eq _0059
	compare VAR_UNK_4102, 2
	goto_if_eq _0077
	goto _0095

_0059:
	follower_poke_is_event_trigger 1, VAR_TEMP_x4005, VAR_TEMP_x4007
	compare VAR_TEMP_x4007, 1
	call_if_eq _0097
	nop_var_490 VAR_TEMP_x4005
	nop_var_490 VAR_TEMP_x4007
	end

_0077:
	follower_poke_is_event_trigger 2, VAR_TEMP_x4005, VAR_TEMP_x4006
	compare VAR_TEMP_x4006, 1
	call_if_eq _0097
	nop_var_490 VAR_TEMP_x4005
	nop_var_490 VAR_TEMP_x4006
	end

_0095:
	end

_0097:
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 11
	return

scr_seq_D24R0218_001:
	scrcmd_609
	lockall
	apply_movement obj_D24R0218_suit, _0178
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _01C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0086_D24R0218_00001
	closemsg
	apply_movement obj_D24R0218_suit, _0184
	wait_movement
	npc_msg msg_0086_D24R0218_00002
	closemsg
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, RGB_BLACK
	wait_fade
	wait 1, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_BLACK
	wait_fade
	stop_se SEQ_SE_GS_ZENIGAME_JOURO
	apply_movement obj_D24R0218_suit, _01AC
	wait_movement
	npc_msg msg_0086_D24R0218_00003
	closemsg
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, RGB_BLACK
	wait_fade
	wait 1, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_BLACK
	wait_fade
	stop_se SEQ_SE_GS_ZENIGAME_JOURO
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 3
	setflag FLAG_HIDE_ALPH_OUTSIDE_ARCEUS_EVENT_SUIT
	setflag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D51R0201, 0, 16, 24, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end


_0178:
	step 14, 4
	step 35, 1
	step_end

_0184:
	step 75, 1
	step 63, 1
	step 16, 3
	step 32, 1
	step 18, 2
	step 32, 1
	step 71, 1
	step 10, 1
	step 72, 1
	step_end

_01AC:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end

_01C4:
	step 14, 4
	step_end
scr_seq_D24R0218_002:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D24R0218_suit, _0230
	apply_movement obj_player, _0260
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_player, _0258
	wait_movement
	npc_msg msg_0086_D24R0218_00004
	closemsg
	apply_movement obj_D24R0218_suit, _0248
	wait_movement
	npc_msg msg_0086_D24R0218_00005
	closemsg
	apply_movement obj_D24R0218_suit, _0250
	wait_movement
	hide_person obj_D24R0218_suit
	setflag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	releaseall
	end


_0230:
	step 63, 1
	step 34, 1
	step 75, 1
	step 63, 1
	step 18, 3
	step_end

_0248:
	step 34, 1
	step_end

_0250:
	step 15, 10
	step_end

_0258:
	step 35, 1
	step_end

_0260:
	step 15, 1
	step_end
scr_seq_D24R0218_003:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0324
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, RGB_BLACK
	wait_fade
	wait 1, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_BLACK
	wait_fade
	stop_se SEQ_SE_GS_ZENIGAME_JOURO
	apply_movement obj_player, _0330
	wait_movement
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, RGB_BLACK
	wait_fade
	wait 1, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_BLACK
	wait_fade
	stop_se SEQ_SE_GS_ZENIGAME_JOURO
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 12
	setvar VAR_UNK_4104, 1
	setflag FLAG_HIDE_SINJOH_MYSTRI_SHRINE_CYNTHIA
	setflag FLAG_UNK_2DD
	setflag FLAG_UNK_2DB
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D51R0201, 0, 16, 24, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end


_0324:
	step 14, 1
	step 13, 1
	step_end

_0330:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end
scr_seq_D24R0218_006:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _038C
	scrcmd_374 obj_player
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40CE, 0
	releaseall
	end

scr_seq_D24R0218_005:
	compare VAR_UNK_40CE, 1
	goto_if_ne _0387
	scrcmd_375 obj_player
_0387:
	end
	.byte 0x00, 0x00, 0x00

_038C:
	step 68, 1
	step_end
scr_seq_D24R0218_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0086_D24R0218_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
