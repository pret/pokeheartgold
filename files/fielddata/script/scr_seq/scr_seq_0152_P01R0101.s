#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0101.h"
#include "msgdata/msg/msg_0255_P01R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_P01R0101_000
	scrdef scr_seq_P01R0101_001
	scrdef scr_seq_P01R0101_002
	scrdef scr_seq_P01R0101_003
	scrdef scr_seq_P01R0101_004
	scrdef_end

scr_seq_P01R0101_001:
	scrcmd_445 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 330
	goto_if_eq _0029
	end

_0029:
	set_object_facing obj_P01R0101_seaman_2, DIR_SOUTH
	end

scr_seq_P01R0101_002:
	scrcmd_609
	lockall
	apply_movement obj_P01R0101_ookido, _00E4
	wait_movement
	scrcmd_081 0
	play_bgm SEQ_GS_OHKIDO
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_P01R0101_ookido, _00EC
	apply_movement obj_player, _0100
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox msg_0255_P01R0101_00009, msg_0255_P01R0101_00010
	closemsg
	apply_movement obj_P01R0101_ookido, _0110
	wait_movement
	nat_dex_flag_action 1, VAR_SPECIAL_RESULT
	buffer_players_name 0
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0255_P01R0101_00011
	wait_fanfare
	enable_mass_outbreaks
	npc_msg msg_0255_P01R0101_00012
	closemsg
	apply_movement obj_P01R0101_ookido, _0120
	wait_movement
	npc_msg msg_0255_P01R0101_00013
	closemsg
	apply_movement obj_P01R0101_ookido, _0128
	wait_movement
	hide_person obj_P01R0101_ookido
	setflag FLAG_HIDE_OLIVINE_PORT_OAK
	setvar VAR_UNK_411A, 0
	fade_out_bgm 0, 30
	scrcmd_081 0
	reset_bgm
	releaseall
	compare VAR_UNK_40D3, 1
	call_if_eq _00DE
	enable_mass_outbreaks
	end

_00DE:
	clearflag FLAG_HIDE_POKEATHLON_SUPREME_CUP_RECEPTIONIST
	return


_00E4:
	step 75, 1
	step_end

_00EC:
	step 63, 1
	step 14, 3
	step 12, 1
	step 34, 1
	step_end

_0100:
	step 63, 3
	step 13, 3
	step 35, 1
	step_end

_0110:
	step 34, 1
	step 63, 2
	step 34, 1
	step_end

_0120:
	step 75, 1
	step_end

_0128:
	step 12, 2
	step 14, 1
	step 12, 1
	step_end
scr_seq_P01R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_unset FLAG_GAME_CLEAR, _0361
	compare VAR_TEMP_x4002, 1
	goto_if_ge _0356
	get_player_facing VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_eq _0320
	compare VAR_UNK_40CB, 7
	goto_if_ge _01FB
	npc_msg msg_0255_P01R0101_00001
	closemsg
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02F9
	apply_movement obj_player, _036C
	wait_movement
	buffer_players_name 0
	npc_msg msg_0255_P01R0101_00004
	closemsg
	apply_movement obj_P01R0101_seaman_2, _03F4
	wait_movement
	npc_msg msg_0255_P01R0101_00005
	closemsg
	apply_movement obj_P01R0101_seaman_2, _038C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _03AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_BOAT_DIRECTION, 1
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_BOAT_ARRIVED
	setflag FLAG_UNK_22C
	setflag FLAG_UNK_22B
	releaseall
	end

_01FB:
	get_weekday VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0218
	goto _02EE
	.byte 0x16, 0x00, 0x83, 0x00, 0x00, 0x00
_0218:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0231
	goto _029B
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00
	.byte 0x00
_0231:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _024A
	goto _02EE
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
_024A:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0263
	goto _02EE
	.byte 0x16, 0x00, 0x38
	.byte 0x00, 0x00, 0x00
_0263:
	compare VAR_SPECIAL_RESULT, 4
	goto_if_ne _027C
	goto _02EE
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_027C:
	compare VAR_SPECIAL_RESULT, 5
	goto_if_ne _0295
	goto _029B
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
_0295:
	goto _02EE

_029B:
	npc_msg msg_0255_P01R0101_00007
	closemsg
	apply_movement obj_P01R0101_seaman_2, _038C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _03AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_BOAT_DIRECTION, 1
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_BOAT_ARRIVED
	setflag FLAG_UNK_22A
	clearflag FLAG_UNK_22B
	setflag FLAG_UNK_22C
	releaseall
	end

_02EE:
	npc_msg msg_0255_P01R0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02F9:
	apply_movement obj_player, _0378
	wait_movement
	buffer_players_name 0
	npc_msg msg_0255_P01R0101_00002
	closemsg
	apply_movement obj_P01R0101_seaman_2, _03F4
	wait_movement
	npc_msg msg_0255_P01R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0320:
	apply_movement obj_P01R0101_seaman_2, _03B4
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _03D4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_P01R0101_seaman_2, _03E0
	wait_movement
	releaseall
	end

_0356:
	npc_msg msg_0255_P01R0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0361:
	npc_msg msg_0255_P01R0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_036C:
	step 35, 1
	step 1, 2
	step_end

_0378:
	step 50, 1
	step 51, 1
	step 1, 2
	step 75, 1
	step_end

_038C:
	step 71, 1
	step 13, 1
	step 72, 1
	step 2, 2
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_03AC:
	step 13, 2
	step_end

_03B4:
	step 71, 1
	step 12, 1
	step 72, 1
	step 2, 2
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_03D4:
	step 63, 1
	step 12, 4
	step_end

_03E0:
	step 14, 1
	step 1, 2
	step 13, 1
	step 32, 1
	step_end

_03F4:
	step 32, 1
	step_end
scr_seq_P01R0101_003:
	simple_npc_msg msg_0255_P01R0101_00014
	end

scr_seq_P01R0101_004:
	simple_npc_msg msg_0255_P01R0101_00015
	end
	.balign 4, 0
