#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0901.h"
#include "msgdata/msg/msg_0591_T25R0901.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0901_000
	scrdef_end

scr_seq_T25R0901_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0591_T25R0901_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _002E
	goto _00B3
	.byte 0x02, 0x00
_002E:
	npc_msg msg_0591_T25R0901_00001
	scrcmd_049
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	party_select_ui
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _00B3
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00BE
	partymon_is_mine VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00C9
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0591_T25R0901_00002
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00D9
	goto _00B3
	.byte 0x02, 0x00
_00B3:
	npc_msg msg_0591_T25R0901_00005
	waitbutton
	closemsg
	releaseall
	end

_00BE:
	npc_msg msg_0591_T25R0901_00008
	waitbutton
	closemsg
	releaseall
	end

_00C9:
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0591_T25R0901_00007
	waitbutton
	closemsg
	releaseall
	end

_00D9:
	npc_msg msg_0591_T25R0901_00003
	closemsg
	setvar VAR_SPECIAL_x800C, 0
	fade_screen 6, 1, 0, 0x00
	wait_fade
	nickname_input VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _011F
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0591_T25R0901_00004
	waitbutton
	closemsg
	releaseall
	end

_011F:
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0591_T25R0901_00006
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
