#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0205.h"
#include "msgdata/msg/msg_0076_D24R0205.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0205_000
	scrdef scr_seq_D24R0205_001
	scrdef scr_seq_D24R0205_002
	scrdef scr_seq_D24R0205_003
	scrdef scr_seq_D24R0205_004
	scrdef scr_seq_D24R0205_005
	scrdef scr_seq_D24R0205_006
	scrdef scr_seq_D24R0205_007
	scrdef scr_seq_D24R0205_008
	scrdef scr_seq_D24R0205_009
	scrdef_end

scr_seq_D24R0205_008:
	compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	goto_if_eq _003D
	goto _009D

_003D:
	get_party_lead_alive VAR_TEMP_x4005
	compare VAR_UNK_4102, 1
	goto_if_eq _0061
	compare VAR_UNK_4102, 2
	goto_if_eq _007F
	goto _009D

_0061:
	follower_poke_is_event_trigger 1, VAR_TEMP_x4005, VAR_TEMP_x4007
	compare VAR_TEMP_x4007, 1
	call_if_eq _009F
	nop_var_490 VAR_TEMP_x4005
	nop_var_490 VAR_TEMP_x4007
	end

_007F:
	follower_poke_is_event_trigger 2, VAR_TEMP_x4005, VAR_TEMP_x4006
	compare VAR_TEMP_x4006, 1
	call_if_eq _009F
	nop_var_490 VAR_TEMP_x4005
	nop_var_490 VAR_TEMP_x4006
	end

_009D:
	end

_009F:
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 11
	return

scr_seq_D24R0205_000:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _018C
	scrcmd_374 obj_player
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	goto_if_set FLAG_UNK_111, _016F
	goto_if_set FLAG_GOT_UNOWN_REPORT, _016F
	wait 5, VAR_SPECIAL_RESULT
	apply_movement obj_D24R0205_gsassistantm, _0194
	apply_movement obj_D24R0205_gsassistantm_2, _0194
	apply_movement obj_D24R0205_gsassistantm_3, _01B8
	apply_movement obj_D24R0205_gsassistantm_4, _01B8
	wait_movement
	npc_msg msg_0076_D24R0205_00000
	giveitem_no_check ITEM_UNOWN_REPORT, 1
	closemsg
	apply_movement obj_D24R0205_gsassistantm, _01A8
	apply_movement obj_D24R0205_gsassistantm_2, _01B0
	apply_movement obj_D24R0205_gsassistantm_3, _01CC
	apply_movement obj_D24R0205_gsassistantm_4, _01CC
	wait_movement
	hide_person obj_D24R0205_gsassistantm
	hide_person obj_D24R0205_gsassistantm_2
	hide_person obj_D24R0205_gsassistantm_3
	hide_person obj_D24R0205_gsassistantm_4
	hide_person obj_D24R0205_gsbigman
	hide_person obj_D24R0205_gswoman1
	hide_person obj_D24R0205_gsoldman1
	setflag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	setflag FLAG_HIDE_RUINS_OF_ALPH_TOURISTS
	setflag FLAG_GOT_UNOWN_REPORT
	npc_msg msg_0076_D24R0205_00001
	wait_button_or_walk_away
	closemsg
_016F:
	setvar VAR_UNK_40CE, 0
	releaseall
	end

scr_seq_D24R0205_001:
	compare VAR_UNK_40CE, 1
	goto_if_ne _018A
	scrcmd_375 obj_player
_018A:
	end


_018C:
	step 68, 1
	step_end

_0194:
	step 3, 1
	step 75, 1
	step 15, 5
	step 13, 1
	step_end

_01A8:
	step 14, 10
	step_end

_01B0:
	step 12, 10
	step_end

_01B8:
	step 2, 1
	step 75, 1
	step 14, 5
	step 13, 1
	step_end

_01CC:
	step 15, 10
	step_end
scr_seq_D24R0205_006:
	scrcmd_609
	lockall
	apply_movement obj_D24R0205_suit, _02B0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _02FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0076_D24R0205_00006
	closemsg
	apply_movement obj_D24R0205_suit, _02BC
	wait_movement
	npc_msg msg_0076_D24R0205_00007
	closemsg
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, RGB_BLACK
	wait_fade
	wait 1, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_BLACK
	wait_fade
	stop_se SEQ_SE_GS_ZENIGAME_JOURO
	apply_movement obj_D24R0205_suit, _02E4
	wait_movement
	npc_msg msg_0076_D24R0205_00008
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
	.byte 0x00, 0x00, 0x00

_02B0:
	step 14, 4
	step 35, 1
	step_end

_02BC:
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

_02E4:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end

_02FC:
	step 14, 4
	step_end
scr_seq_D24R0205_007:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D24R0205_suit, _0368
	apply_movement obj_player, _0398
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_player, _0390
	wait_movement
	npc_msg msg_0076_D24R0205_00009
	closemsg
	apply_movement obj_D24R0205_suit, _0380
	wait_movement
	npc_msg msg_0076_D24R0205_00010
	closemsg
	apply_movement obj_D24R0205_suit, _0388
	wait_movement
	hide_person obj_D24R0205_suit
	setflag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	releaseall
	end


_0368:
	step 63, 1
	step 34, 1
	step 75, 1
	step 63, 1
	step 18, 3
	step_end

_0380:
	step 34, 1
	step_end

_0388:
	step 15, 10
	step_end

_0390:
	step 35, 1
	step_end

_0398:
	step 15, 1
	step_end
scr_seq_D24R0205_009:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _045C
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
	apply_movement obj_player, _0468
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


_045C:
	step 14, 1
	step 13, 1
	step_end

_0468:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end
scr_seq_D24R0205_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0076_D24R0205_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D24R0205_003:
	simple_npc_msg msg_0076_D24R0205_00002
	end

scr_seq_D24R0205_004:
	simple_npc_msg msg_0076_D24R0205_00003
	end

scr_seq_D24R0205_005:
	simple_npc_msg msg_0076_D24R0205_00004
	end
	.balign 4, 0
