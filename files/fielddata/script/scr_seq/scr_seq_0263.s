#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0263_0006 ; 000
	scrdef_end

scr_seq_0263_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	checkflag FLAG_UNK_0FF
	gotoif TRUE, scr_seq_0263_0038
	setflag FLAG_UNK_0FF
	buffer_int 0, 1
	npc_msg 15
	goto scr_seq_0263_0048

scr_seq_0263_0036:
	.byte 0x02, 0x00
scr_seq_0263_0038:
	buffer_int 0, 1
	npc_msg 0
	goto scr_seq_0263_0048

scr_seq_0263_0046:
	.byte 0x02, 0x00
scr_seq_0263_0048:
	npc_msg 1
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 2, 255, 0
	menu_item_add 3, 255, 1
	menu_item_add 4, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0263_0097
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0263_0178
	goto scr_seq_0263_016B

scr_seq_0263_0095:
	.byte 0x02, 0x00
scr_seq_0263_0097:
	buffer_int 2, 1
	npc_msg 7
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0263_016B
	scrcmd_557 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0263_015E
	scrcmd_556 1
	scrcmd_118 1
	npc_msg 10
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_815 0
	scrcmd_117
	closemsg
	scrcmd_649
	scrcmd_651 0, 16384, 16385
	scrcmd_651 1, 16386, 16387
	scrcmd_651 2, 16388, 16389
	scrcmd_650
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_SPECIAL_x8000, 0
	call scr_seq_0263_019D
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_0263_01CE
	buffer_int 0, VAR_SPECIAL_x8000
	npc_msg 11
	comparevartovalue VAR_TEMP_x4001, 0
	callif ne, scr_seq_0263_01D9
	comparevartovalue VAR_TEMP_x4003, 0
	callif ne, scr_seq_0263_0225
	comparevartovalue VAR_TEMP_x4005, 0
	callif ne, scr_seq_0263_0271
	npc_msg 5
	goto scr_seq_0263_0191

scr_seq_0263_015C:
	.byte 0x02, 0x00
scr_seq_0263_015E:
	touchscreen_menu_show
	npc_msg 14
	goto scr_seq_0263_0183

scr_seq_0263_0169:
	.byte 0x02, 0x00
scr_seq_0263_016B:
	touchscreen_menu_show
	npc_msg 5
	goto scr_seq_0263_0183

scr_seq_0263_0176:
	.byte 0x02, 0x00
scr_seq_0263_0178:
	npc_msg 6
	goto scr_seq_0263_0048

scr_seq_0263_0181:
	.byte 0x02, 0x00
scr_seq_0263_0183:
	waitbutton
	closemsg
	scrcmd_117
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_0263_0191:
	waitbutton
	closemsg
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_0263_019D:
	comparevartovalue VAR_TEMP_x4001, 0
	callif ne, scr_seq_0263_01C6
	comparevartovalue VAR_TEMP_x4003, 0
	callif ne, scr_seq_0263_01C6
	comparevartovalue VAR_TEMP_x4005, 0
	callif ne, scr_seq_0263_01C6
	return

scr_seq_0263_01C6:
	addvar VAR_SPECIAL_x8000, 1
	return

scr_seq_0263_01CE:
	npc_msg 5
	goto scr_seq_0263_0191

scr_seq_0263_01D7:
	.byte 0x02, 0x00
scr_seq_0263_01D9:
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif gt, scr_seq_0263_01F1
	buffer_item_name 0, VAR_TEMP_x4000
	goto scr_seq_0263_01F6

scr_seq_0263_01F1:
	buffer_item_name_plural 0, VAR_TEMP_x4000
scr_seq_0263_01F6:
	buffer_int 1, VAR_TEMP_x4001
	hasspaceforitem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0263_02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg 13
	giveitem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

scr_seq_0263_0225:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif gt, scr_seq_0263_023D
	buffer_item_name 0, VAR_TEMP_x4002
	goto scr_seq_0263_0242

scr_seq_0263_023D:
	buffer_item_name_plural 0, VAR_TEMP_x4002
scr_seq_0263_0242:
	buffer_int 1, VAR_TEMP_x4003
	hasspaceforitem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0263_02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg 13
	giveitem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

scr_seq_0263_0271:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif gt, scr_seq_0263_0289
	buffer_item_name 0, VAR_TEMP_x4004
	goto scr_seq_0263_028E

scr_seq_0263_0289:
	buffer_item_name_plural 0, VAR_TEMP_x4004
scr_seq_0263_028E:
	buffer_int 1, VAR_TEMP_x4005
	hasspaceforitem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0263_02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg 13
	giveitem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

scr_seq_0263_02BD:
	npc_msg 12
	return
	.balign 4, 0
