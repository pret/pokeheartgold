#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0880_T24R0201_0006 ; 000
	scrdef_end

scr_seq_0880_T24R0201_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0C1
	gotoif TRUE, scr_seq_0880_T24R0201_0037
	checkflag FLAG_UNK_0BF
	gotoif FALSE, scr_seq_0880_T24R0201_0042
	checkflag FLAG_UNK_ABD
	gotoif TRUE, scr_seq_0880_T24R0201_00A2
	goto scr_seq_0880_T24R0201_00AD

scr_seq_0880_T24R0201_0035:
	.byte 0x02, 0x00
scr_seq_0880_T24R0201_0037:
	npc_msg 11
scr_seq_0880_T24R0201_003A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0880_T24R0201_0042:
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0880_T24R0201_0063
	npc_msg 4
	goto scr_seq_0880_T24R0201_003A

scr_seq_0880_T24R0201_0063:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, scr_seq_0880_T24R0201_007D
	npc_msg 3
	goto scr_seq_0880_T24R0201_003A

scr_seq_0880_T24R0201_007D:
	scrcmd_362 6, 20, 75
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_PT_SPECIAL
	wait_fanfare
	setflag FLAG_UNK_0BF
	setflag FLAG_UNK_ABD
	goto scr_seq_0880_T24R0201_003A

scr_seq_0880_T24R0201_00A0:
	.byte 0x02, 0x00
scr_seq_0880_T24R0201_00A2:
	npc_msg 6
	goto scr_seq_0880_T24R0201_003A

scr_seq_0880_T24R0201_00AB:
	.byte 0x02, 0x00
scr_seq_0880_T24R0201_00AD:
	npc_msg 5
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0880_T24R0201_01AA
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_349
	scrcmd_351 16384
	comparevartovalue VAR_TEMP_x4000, 255
	gotoif ne, scr_seq_0880_T24R0201_00F2
	call scr_seq_0880_T24R0201_019A
	goto scr_seq_0880_T24R0201_01AA

scr_seq_0880_T24R0201_00F2:
	scrcmd_363 6, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, scr_seq_0880_T24R0201_019A
	scrcmd_490 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0880_T24R0201_0120
	npc_msg 8
	goto scr_seq_0880_T24R0201_0192

scr_seq_0880_T24R0201_0120:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0880_T24R0201_0136
	npc_msg 12
	goto scr_seq_0880_T24R0201_0192

scr_seq_0880_T24R0201_0136:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0880_T24R0201_014C
	npc_msg 13
	goto scr_seq_0880_T24R0201_0192

scr_seq_0880_T24R0201_014C:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, scr_seq_0880_T24R0201_0162
	npc_msg 14
	goto scr_seq_0880_T24R0201_0192

scr_seq_0880_T24R0201_0162:
	scrcmd_382 VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 149
	gotoif le, scr_seq_0880_T24R0201_0181
	call scr_seq_0880_T24R0201_019A
	goto scr_seq_0880_T24R0201_01B5

scr_seq_0880_T24R0201_0181:
	scrcmd_364 16384
	call scr_seq_0880_T24R0201_019A
	npc_msg 7
	setflag FLAG_UNK_0C1
scr_seq_0880_T24R0201_0192:
	goto scr_seq_0880_T24R0201_003A

scr_seq_0880_T24R0201_0198:
	.byte 0x02, 0x00
scr_seq_0880_T24R0201_019A:
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	return

scr_seq_0880_T24R0201_01AA:
	npc_msg 10
	goto scr_seq_0880_T24R0201_003A

scr_seq_0880_T24R0201_01B3:
	.byte 0x02, 0x00
scr_seq_0880_T24R0201_01B5:
	npc_msg 9
	setflag FLAG_UNK_0C1
	goto scr_seq_0880_T24R0201_003A

scr_seq_0880_T24R0201_01C2:
	.byte 0x02, 0x00
	.balign 4, 0
