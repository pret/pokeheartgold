#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0262.h"
#include "msgdata/msg/msg_0427.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0262_000
	scrdef scr_seq_0262_001
	scrdef scr_seq_0262_002
	scrdef scr_seq_0262_003
	scrdef scr_seq_0262_004
	scrdef scr_seq_0262_005
	scrdef scr_seq_0262_006
	scrdef_end

scr_seq_0262_000:
	scrcmd_609
	lockall
	scrcmd_721 VAR_SPECIAL_x800C
	compare VAR_SPECIAL_x800C, 0
	goto_if_eq _006A
	compare VAR_SPECIAL_x800C, 1
	goto_if_ne _0049
	npc_msg msg_0427_00008
	goto _0062

_0049:
	compare VAR_SPECIAL_x800C, 2
	goto_if_ne _005F
	npc_msg msg_0427_00009
	goto _0062

_005F:
	npc_msg msg_0427_00010
_0062:
	waitbutton
	goto _00B5

_006A:
	npc_msg msg_0427_00004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _00B5
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	closemsg
	scrcmd_717 VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	compare VAR_SPECIAL_x800C, 255
	goto_if_eq _00B7
	scrcmd_718 0, VAR_SPECIAL_x800C
	npc_msg msg_0427_00005
	waitbutton
_00B5:
	closemsg
_00B7:
	touchscreen_menu_show
	releaseall
	end

scr_seq_0262_001:
	scrcmd_609
	lockall
	scrcmd_719 VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	compare VAR_SPECIAL_x8000, 255
	goto_if_eq _0114
	scrcmd_718 0, VAR_SPECIAL_x8000
	npc_msg msg_0427_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _0112
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	closemsg
	scrcmd_720 VAR_SPECIAL_x8001
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	npc_msg msg_0427_00007
	waitbutton
_0112:
	closemsg
_0114:
	touchscreen_menu_show
	releaseall
	end

_011A:
	scrcmd_447 1, 0
	compare VAR_SCENE_SAFARI_ZONE_ENTRANCE, 3
	goto_if_ne _0155
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 173, 0, 19, 2, 1
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	goto _0179

_0155:
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 173, 0, 5, 2, 1
	fade_screen 6, 1, 1, 0x0000
	wait_fade
_0179:
	setvar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 2
	return

scr_seq_0262_002:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg msg_0427_00000
	closemsg
	call _011A
	releaseall
	end

scr_seq_0262_003:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg msg_0427_00001
	closemsg
	call _011A
	releaseall
	end

scr_seq_0262_004:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg msg_0427_00002
	closemsg
	call _011A
	releaseall
	end

scr_seq_0262_005:
	setvar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 2
	scrcmd_447 1, 0
	end

scr_seq_0262_006:
	scrcmd_609
	lockall
	npc_msg msg_0427_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	compare VAR_SPECIAL_x800C, 0
	goto_if_ne _01FA
	call _011A
	releaseall
	end

_01FA:
	releaseall
	end
	.balign 4, 0
