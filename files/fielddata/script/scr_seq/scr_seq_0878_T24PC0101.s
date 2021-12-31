#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24PC0101.h"
#include "msgdata/msg/msg_0575_T24PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24PC0101_000
	scrdef scr_seq_T24PC0101_001
	scrdef scr_seq_T24PC0101_002
	scrdef scr_seq_T24PC0101_003
	scrdef_end

scr_seq_T24PC0101_000:
	setvar VAR_SPECIAL_x8007, 3
	callstd std_nurse_joy
	end

scr_seq_T24PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0575_T24PC0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T24PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	count_pc_empty_space VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 540
	gotoif ne, _0056
	goto _005C
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0056:
	goto _00E4

_005C:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0079
	goto _007F
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0079:
	goto _00E4

_007F:
	npc_msg msg_0575_T24PC0101_00004
	buffer_players_name 0
	npc_msg msg_0575_T24PC0101_00005
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	give_mon SPECIES_TENTACOOL, 15, 0, 0, 0, VAR_SPECIAL_x800C
	npc_msg msg_0575_T24PC0101_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00BC
	touchscreen_menu_show
	closemsg
	goto _00E0

_00BC:
	closemsg
	scrcmd_815 0
	fade_screen 6, 1, 0, 0x00
	wait_fade
	nickname_input 1, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
_00E0:
	releaseall
	end

_00E4:
	npc_msg msg_0575_T24PC0101_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T24PC0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0115
	npc_msg msg_0575_T24PC0101_00002
	waitbutton
	closemsg
	releaseall
	end

_0115:
	buffer_players_name 0
	npc_msg msg_0575_T24PC0101_00003
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
