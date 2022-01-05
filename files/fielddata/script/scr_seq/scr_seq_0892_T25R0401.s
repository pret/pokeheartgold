#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0401.h"
#include "msgdata/msg/msg_0586_T25R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0401_000
	scrdef scr_seq_T25R0401_001
	scrdef scr_seq_T25R0401_002
	scrdef_end

scr_seq_T25R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_GOT_EEVEE_FROM_BILL
	gotoif TRUE, _00E9
	buffer_players_name 0
	npc_msg msg_0586_T25R0401_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _004B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00D3
	end

_004B:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif eq, _00DE
	npc_msg msg_0586_T25R0401_00001
	give_mon SPECIES_EEVEE, 5, 0, 0, 0, VAR_SPECIAL_x800C
	setflag FLAG_GOT_EEVEE_FROM_BILL
	buffer_players_name 0
	npc_msg msg_0586_T25R0401_00002
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	npc_msg msg_0586_T25R0401_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00A0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _00C6
_00A0:
	closemsg
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	nickname_input VAR_SPECIAL_x8005, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0x0000
	wait_fade
_00C6:
	npc_msg msg_0586_T25R0401_00003
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_00D3:
	npc_msg msg_0586_T25R0401_00005
	waitbutton
	closemsg
	releaseall
	end

_00DE:
	npc_msg msg_0586_T25R0401_00004
	waitbutton
	closemsg
	releaseall
	end

_00E9:
	npc_msg msg_0586_T25R0401_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R0401_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_410D, 1
	gotoif eq, _0114
	npc_msg msg_0586_T25R0401_00009
	waitbutton
	closemsg
	releaseall
	end

_0114:
	npc_msg msg_0586_T25R0401_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R0401_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 9, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _019C
	comparevartovalue VAR_UNK_410D, 1
	gotoif eq, _0152
	npc_msg msg_0586_T25R0401_00011
	waitbutton
	closemsg
	releaseall
	end

_0152:
	npc_msg msg_0586_T25R0401_00012
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0179
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0191
	end

_0179:
	buffer_players_name 0
	npc_msg msg_0586_T25R0401_00013
	register_gear_number 9
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	waitbutton
	closemsg
	releaseall
	end

_0191:
	npc_msg msg_0586_T25R0401_00015
	waitbutton
	closemsg
	releaseall
	end

_019C:
	npc_msg msg_0586_T25R0401_00015
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
