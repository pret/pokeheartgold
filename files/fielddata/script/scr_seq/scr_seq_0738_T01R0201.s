#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01R0201.h"
#include "msgdata/msg/msg_0449_T01R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T01R0201_000
	scrdef_end

scr_seq_T01R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_490 VAR_UNK_4122
	comparevartovalue VAR_UNK_4122, 7
	gotoif eq, _003B
_001F:
	scrcmd_522 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 15
	gotoif eq, _0056
	npc_msg msg_0449_T01R0201_00000
	waitbutton
	closemsg
	releaseall
	end

_003B:
	scrcmd_147 31, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _001F
	goto _015D
	.byte 0x02, 0x00
_0056:
	checkflag FLAG_UNK_AA8
	gotoif TRUE, _0152
	npc_msg msg_0449_T01R0201_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0147
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0099
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _00A7
	end

_0099:
	setvar VAR_SPECIAL_x8004, 0
	goto _00F0
	.byte 0x02, 0x00
_00A7:
	npc_msg msg_0449_T01R0201_00002
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32772
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_490 VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 255
	gotoif eq, _0147
	get_partymon_species VAR_SPECIAL_x8004, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _013C
_00F0:
	bufferpartymonnick 0, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_FW367
	npc_msg msg_0449_T01R0201_00003
	wait_se SEQ_SE_DP_FW367
	wait 15, VAR_SPECIAL_x800C
	scrcmd_383 10, 32772
	scrcmd_828 32772, 1, 32
	scrcmd_828 32772, 5, 22
	comparevartovalue VAR_UNK_4122, 7
	gotoif eq, _012D
	addvar VAR_UNK_4122, 1
_012D:
	setflag FLAG_UNK_AA8
	npc_msg msg_0449_T01R0201_00004
	waitbutton
	closemsg
	releaseall
	end

_013C:
	npc_msg msg_0449_T01R0201_00007
	waitbutton
	closemsg
	releaseall
	end

_0147:
	npc_msg msg_0449_T01R0201_00006
	waitbutton
	closemsg
	releaseall
	end

_0152:
	npc_msg msg_0449_T01R0201_00005
	waitbutton
	closemsg
	releaseall
	end

_015D:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, _01AE
	npc_msg msg_0449_T01R0201_00008
_016D:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _019D
	register_gear_number 31
	buffer_players_name 0
	npc_msg msg_0449_T01R0201_00009
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg msg_0449_T01R0201_00010
	waitbutton
	closemsg
	releaseall
	end

_019D:
	npc_msg msg_0449_T01R0201_00011
	waitbutton
	closemsg
	setvar VAR_TEMP_x4004, 1
	releaseall
	end

_01AE:
	npc_msg msg_0449_T01R0201_00012
	goto _016D
	.byte 0x02, 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
