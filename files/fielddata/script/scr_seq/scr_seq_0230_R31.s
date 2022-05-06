#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R31.h"
#include "msgdata/msg/msg_0378_R31.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R31_000
	scrdef scr_seq_R31_001
	scrdef scr_seq_R31_002
	scrdef scr_seq_R31_003
	scrdef scr_seq_R31_004
	scrdef scr_seq_R31_005
	scrdef_end

scr_seq_R31_000:
	end

scr_seq_R31_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_LOAN_SPEAROW, 1
	goto_if_ne _003D
	goto _0098
	.byte 0x16, 0x00, 0x50, 0x00, 0x00, 0x00
_003D:
	compare VAR_LOAN_SPEAROW, 2
	goto_if_ne _0056
	goto _01AD
	.byte 0x16, 0x00, 0x37, 0x00, 0x00, 0x00
_0056:
	compare VAR_LOAN_SPEAROW, 4
	goto_if_ne _006F
	goto _01AD
	.byte 0x16, 0x00, 0x1e, 0x00, 0x00, 0x00
_006F:
	compare VAR_LOAN_SPEAROW, 6
	goto_if_ne _008D
	kenya_check_party_or_mailbox VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02AE
_008D:
	npc_msg msg_0378_R31_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0098:
	npc_msg msg_0378_R31_00001
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 255
	goto_if_eq _0206
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_eq _021F
	kenya_check VAR_SPECIAL_RESULT, VAR_TEMP_x4000, 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0238
	kenya_check VAR_SPECIAL_RESULT, VAR_TEMP_x4000, 1
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0251
	check_return_loan_mon 7, VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _026A
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0295
	return_loan_mon VAR_TEMP_x4000
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0149
	apply_movement obj_player, _02BC
	goto _0187

_0149:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0164
	apply_movement obj_player, _02C4
	goto _0187

_0164:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _017F
	apply_movement obj_player, _02CC
	goto _0187

_017F:
	apply_movement obj_player, _02D4
_0187:
	wait_movement
	buffer_players_name 0
	npc_msg msg_0378_R31_00005
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
_0195:
	npc_msg msg_0378_R31_00007
	setvar VAR_LOAN_SPEAROW, 2
	compare VAR_TEMP_x4000, VAR_TEMP_x4001
	goto_if_ne _01AD
	scrcmd_606
_01AD:
	goto_if_no_item_space ITEM_TM44, 1, _01FC
	callstd std_give_item_verbose
	compare VAR_LOAN_SPEAROW, 2
	goto_if_ne _01EB
	setvar VAR_LOAN_SPEAROW, 3
	goto _01F1

_01EB:
	setvar VAR_LOAN_SPEAROW, 5
_01F1:
	npc_msg msg_0378_R31_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01FC:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0206:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0378_R31_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_021F:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0378_R31_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0238:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0378_R31_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0251:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0378_R31_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_026A:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0378_R31_00004
	closemsg
	buffer_players_name 0
	npc_msg msg_0378_R31_00006
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	mon_give_mail VAR_TEMP_x4000
	goto _0195
	.byte 0x02, 0x00
_0295:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0378_R31_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02AE:
	setvar VAR_LOAN_SPEAROW, 1
	goto _0098
	.byte 0x02, 0x00

_02BC:
	step 32, 1
	step_end

_02C4:
	step 33, 1
	step_end

_02CC:
	step 34, 1
	step_end

_02D4:
	step 35, 1
	step_end
scr_seq_R31_002:
	direction_signpost msg_0378_R31_00013, 1, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R31_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0378_R31_00014, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R31_004:
	simple_npc_msg msg_0378_R31_00012
	end
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60
	.byte 0x00, 0x68, 0x00, 0x2d, 0x00, 0x01, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_R31_005:
	simple_npc_msg msg_0378_R31_00011
	end
	.balign 4, 0
