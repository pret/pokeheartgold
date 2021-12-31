#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0002.h"
#include "msgdata/msg/msg_0748.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0002_000
	scrdef scr_seq_0002_001
	scrdef scr_seq_0002_002
	scrdef_end

scr_seq_0002_000:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_TEMP_x400F, 0
	setvar VAR_SPECIAL_x8007, 0
	goto _005C
	.byte 0x02, 0x00
scr_seq_0002_001:
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_TEMP_x400F, 12
	setvar VAR_SPECIAL_x8007, 1
	goto _005C
	.byte 0x02, 0x00
scr_seq_0002_002:
	setvar VAR_SPECIAL_x8000, 2
	setvar VAR_TEMP_x400F, 24
	setvar VAR_SPECIAL_x8007, 2
	goto _005C
	.byte 0x02, 0x00
_005C:
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	setvar VAR_SPECIAL_x8004, 4
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0352
_008A:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_117
	scrcmd_349
	scrcmd_351 32769
	scrcmd_150
	scrcmd_116 1, 21, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8001, 255
	gotoif eq, _0352
	get_partymon_species VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, _0391
	scrcmd_652 32769, 32768, 32770
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, _00F0
	goto _0125

_00F0:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, _0106
	npc_msg msg_0748_00005
	goto _011F

_0106:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, _011C
	npc_msg msg_0748_00017
	goto _011F

_011C:
	npc_msg msg_0748_00029
_011F:
	goto _008A

_0125:
	setvar VAR_SPECIAL_x8004, 0
	touchscreen_menu_hide
	scrcmd_490 32768
	scrcmd_490 32769
	scrcmd_490 32770
	scrcmd_490 32771
_013D:
	scrcmd_653 32769, 32768, 32772, 32780
	scrcmd_490 32768
	scrcmd_490 32769
	scrcmd_490 32770
	scrcmd_490 32771
	copyvar VAR_SPECIAL_x8003, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8003, 65533
	gotoif ne, _018F
	addvar VAR_SPECIAL_x8004, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8002
	gotoif lt, _013D
	setvar VAR_SPECIAL_x8004, 0
	goto _013D
	.byte 0x16, 0x00, 0x41, 0x00, 0x00, 0x00
_018F:
	comparevartovalue VAR_SPECIAL_x8003, 65534
	gotoif ne, _01D0
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8004, 7
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0352
	setvar VAR_SPECIAL_x8004, 0
	closemsg
	goto _013D

_01D0:
	scrcmd_655 32771, 32773
	scrcmd_557 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01EF
	goto _0224

_01EF:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, _0205
	npc_msg msg_0748_00006
	goto _021E

_0205:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, _021B
	npc_msg msg_0748_00018
	goto _021E

_021B:
	npc_msg msg_0748_00030
_021E:
	goto _0352

_0224:
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	buffer_move_name 1, VAR_SPECIAL_x8003
	scrcmd_396 32774, 32769
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif lt, _0328
_0241:
	setvar VAR_SPECIAL_x8004, 8
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03A4
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_117
	scrcmd_352 1, 32769, 32771
	scrcmd_353 1, 32774
	scrcmd_490 32774
	scrcmd_150
	scrcmd_116 1, 21, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8006, 4
	gotoif eq, _03A4
	scrcmd_490 32774
	buffer_party_mon_move_name 2, VAR_SPECIAL_x8001, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8004, 9
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03A4
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, _02EA
	npc_msg msg_0748_00012
	goto _0303

_02EA:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, _0300
	npc_msg msg_0748_00024
	goto _0303

_0300:
	npc_msg msg_0748_00036
_0303:
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_x800C
	buffer_party_mon_move_name 1, VAR_SPECIAL_x8001, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8004, 13
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
_0328:
	buffer_move_name 1, VAR_SPECIAL_x8003
	setvar VAR_SPECIAL_x8004, 14
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	scrcmd_556 32773
	scrcmd_118 1
	scrcmd_654 32769, 32774, 32771
_0352:
	comparevartovalue VAR_SPECIAL_x8007, 0
	gotoif ne, _0368
	npc_msg msg_0748_00015
	goto _0381

_0368:
	comparevartovalue VAR_SPECIAL_x8007, 1
	gotoif ne, _037E
	npc_msg msg_0748_00027
	goto _0381

_037E:
	npc_msg msg_0748_00039
_0381:
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_117
	scrcmd_784 3, 1
	endstd
	end

_0391:
	npc_msg msg_0748_00040
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_117
	scrcmd_784 3, 1
	endstd
	end

_03A4:
	setvar VAR_SPECIAL_x8004, 10
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0241
	setvar VAR_SPECIAL_x8004, 11
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	goto _0352
	.byte 0x02
	.byte 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
