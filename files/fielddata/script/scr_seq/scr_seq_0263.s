#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0263.h"
#include "msgdata/msg/msg_0433.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0263_000
	scrdef_end

scr_seq_0263_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	checkflag FLAG_GOT_SCRATCH_CARD_INFO
	gotoif TRUE, _0038
	setflag FLAG_GOT_SCRATCH_CARD_INFO
	buffer_int 0, 1
	npc_msg msg_0433_00015
	goto _0048
	.byte 0x02, 0x00
_0038:
	buffer_int 0, 1
	npc_msg msg_0433_00000
	goto _0048
	.byte 0x02, 0x00
_0048:
	npc_msg msg_0433_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 2, 255, 0
	menu_item_add 3, 255, 1
	menu_item_add 4, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0097
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0178
	goto _016B
	.byte 0x02, 0x00
_0097:
	buffer_int 2, 1
	npc_msg msg_0433_00007
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _016B
	scrcmd_557 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _015E
	scrcmd_556 1
	scrcmd_118 1
	npc_msg msg_0433_00010
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_815 0
	scrcmd_117
	closemsg
	scratch_off_card
	get_scratch_off_prize 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	get_scratch_off_prize 1, VAR_TEMP_x4002, VAR_TEMP_x4003
	get_scratch_off_prize 2, VAR_TEMP_x4004, VAR_TEMP_x4005
	scratch_off_card_end
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	setvar VAR_SPECIAL_x8000, 0
	call _019D
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, _01CE
	buffer_int 0, VAR_SPECIAL_x8000
	npc_msg msg_0433_00011
	comparevartovalue VAR_TEMP_x4001, 0
	callif ne, _01D9
	comparevartovalue VAR_TEMP_x4003, 0
	callif ne, _0225
	comparevartovalue VAR_TEMP_x4005, 0
	callif ne, _0271
	npc_msg msg_0433_00005
	goto _0191
	.byte 0x02, 0x00
_015E:
	touchscreen_menu_show
	npc_msg msg_0433_00014
	goto _0183
	.byte 0x02, 0x00
_016B:
	touchscreen_menu_show
	npc_msg msg_0433_00005
	goto _0183
	.byte 0x02, 0x00
_0178:
	npc_msg msg_0433_00006
	goto _0048
	.byte 0x02, 0x00
_0183:
	waitbutton
	closemsg
	scrcmd_117
	scrcmd_784 3, 1
	releaseall
	end

_0191:
	waitbutton
	closemsg
	scrcmd_784 3, 1
	releaseall
	end

_019D:
	comparevartovalue VAR_TEMP_x4001, 0
	callif ne, _01C6
	comparevartovalue VAR_TEMP_x4003, 0
	callif ne, _01C6
	comparevartovalue VAR_TEMP_x4005, 0
	callif ne, _01C6
	return

_01C6:
	addvar VAR_SPECIAL_x8000, 1
	return

_01CE:
	npc_msg msg_0433_00005
	goto _0191
	.byte 0x02, 0x00
_01D9:
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif gt, _01F1
	buffer_item_name 0, VAR_TEMP_x4000
	goto _01F6

_01F1:
	buffer_item_name_plural 0, VAR_TEMP_x4000
_01F6:
	buffer_int 1, VAR_TEMP_x4001
	hasspaceforitem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0433_00013
	giveitem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

_0225:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif gt, _023D
	buffer_item_name 0, VAR_TEMP_x4002
	goto _0242

_023D:
	buffer_item_name_plural 0, VAR_TEMP_x4002
_0242:
	buffer_int 1, VAR_TEMP_x4003
	hasspaceforitem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0433_00013
	giveitem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

_0271:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif gt, _0289
	buffer_item_name 0, VAR_TEMP_x4004
	goto _028E

_0289:
	buffer_item_name_plural 0, VAR_TEMP_x4004
_028E:
	buffer_int 1, VAR_TEMP_x4005
	hasspaceforitem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0433_00013
	giveitem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

_02BD:
	npc_msg msg_0433_00012
	return
	.balign 4, 0
