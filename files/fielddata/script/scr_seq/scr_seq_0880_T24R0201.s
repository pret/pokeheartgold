#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0201.h"
#include "msgdata/msg/msg_0576_T24R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24R0201_000
	scrdef_end

scr_seq_T24R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_RETURNED_OR_INHERITED_LOAN_SHUCKLE, _0037
	goto_if_unset FLAG_GOT_LOAN_SHUCKLE, _0042
	goto_if_set FLAG_DAILY_GOT_LOAN_SHUCKLE_TODAY, _00A2
	goto _00AD
	.byte 0x02, 0x00
_0037:
	npc_msg msg_0576_T24R0201_00011
_003A:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0042:
	npc_msg msg_0576_T24R0201_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0063
	npc_msg msg_0576_T24R0201_00004
	goto _003A

_0063:
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_ne _007D
	npc_msg msg_0576_T24R0201_00003
	goto _003A

_007D:
	give_loan_mon 6, 20, 75
	npc_msg msg_0576_T24R0201_00001
	buffer_players_name 0
	npc_msg msg_0576_T24R0201_00002
	play_fanfare SEQ_ME_PT_SPECIAL
	wait_fanfare
	setflag FLAG_GOT_LOAN_SHUCKLE
	setflag FLAG_DAILY_GOT_LOAN_SHUCKLE_TODAY
	goto _003A
	.byte 0x02, 0x00
_00A2:
	npc_msg msg_0576_T24R0201_00006
	goto _003A
	.byte 0x02, 0x00
_00AD:
	npc_msg msg_0576_T24R0201_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01AA
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	closemsg
	party_select_ui
	get_party_selection VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 255
	goto_if_ne _00F2
	call _019A
	goto _01AA

_00F2:
	check_return_loan_mon 6, VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	call_if_ne _019A
	nop_var_490 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0120
	npc_msg msg_0576_T24R0201_00008
	goto _0192

_0120:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0136
	npc_msg msg_0576_T24R0201_00012
	goto _0192

_0136:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _014C
	npc_msg msg_0576_T24R0201_00013
	goto _0192

_014C:
	compare VAR_SPECIAL_RESULT, 4
	goto_if_ne _0162
	npc_msg msg_0576_T24R0201_00014
	goto _0192

_0162:
	mon_get_friendship VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 149
	goto_if_le _0181
	call _019A
	goto _01B5

_0181:
	return_loan_mon VAR_TEMP_x4000
	call _019A
	npc_msg msg_0576_T24R0201_00007
	setflag FLAG_RETURNED_OR_INHERITED_LOAN_SHUCKLE
_0192:
	goto _003A
	.byte 0x02, 0x00
_019A:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	return

_01AA:
	npc_msg msg_0576_T24R0201_00010
	goto _003A
	.byte 0x02, 0x00
_01B5:
	npc_msg msg_0576_T24R0201_00009
	setflag FLAG_RETURNED_OR_INHERITED_LOAN_SHUCKLE
	goto _003A
	.byte 0x02, 0x00
	.balign 4, 0
