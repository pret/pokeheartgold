#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0081_D32R0102_007E ; 000
	scrdef scr_seq_0081_D32R0102_00A9 ; 001
	scrdef scr_seq_0081_D32R0102_0026 ; 002
	scrdef scr_seq_0081_D32R0102_023C ; 003
	scrdef scr_seq_0081_D32R0102_0043 ; 004
	scrdef scr_seq_0081_D32R0102_03F4 ; 005
	scrdef scr_seq_0081_D32R0102_044C ; 006
	scrdef scr_seq_0081_D32R0102_045F ; 007
	scrdef scr_seq_0081_D32R0102_0472 ; 008
	scrdef_end

scr_seq_0081_D32R0102_0026:
	comparevartovalue VAR_UNK_40E5, 2
	gotoif eq, scr_seq_0081_D32R0102_0035
	end

scr_seq_0081_D32R0102_0035:
	move_person 0, 17, 1, 25, 2
	end

scr_seq_0081_D32R0102_0043:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0081_D32R0102_0054
	clearflag FLAG_UNK_189
	end

scr_seq_0081_D32R0102_0054:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0081_D32R0102_0078
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0081_D32R0102_0078
	setflag FLAG_UNK_27E
	end

scr_seq_0081_D32R0102_0078:
	clearflag FLAG_UNK_27E
	end

scr_seq_0081_D32R0102_007E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40E5, 2
	gotoif eq, scr_seq_0081_D32R0102_009E
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0081_D32R0102_009E:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0081_D32R0102_00A9:
	scrcmd_609
	lockall
	npc_msg 0
	closemsg
	move_person 0, 14, 1, 36, 0
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8004, 12
	gotoif ne, scr_seq_0081_D32R0102_00E7
	apply_movement 0, scr_seq_0081_D32R0102_019C
	apply_movement 255, scr_seq_0081_D32R0102_0224
	goto scr_seq_0081_D32R0102_0183

scr_seq_0081_D32R0102_00E7:
	comparevartovalue VAR_SPECIAL_x8004, 13
	gotoif ne, scr_seq_0081_D32R0102_010A
	apply_movement 0, scr_seq_0081_D32R0102_01B4
	apply_movement 255, scr_seq_0081_D32R0102_0224
	goto scr_seq_0081_D32R0102_0183

scr_seq_0081_D32R0102_010A:
	comparevartovalue VAR_SPECIAL_x8004, 14
	gotoif ne, scr_seq_0081_D32R0102_012D
	apply_movement 0, scr_seq_0081_D32R0102_01C8
	apply_movement 255, scr_seq_0081_D32R0102_0224
	goto scr_seq_0081_D32R0102_0183

scr_seq_0081_D32R0102_012D:
	comparevartovalue VAR_SPECIAL_x8004, 15
	gotoif ne, scr_seq_0081_D32R0102_0150
	apply_movement 0, scr_seq_0081_D32R0102_01E0
	apply_movement 255, scr_seq_0081_D32R0102_0230
	goto scr_seq_0081_D32R0102_0183

scr_seq_0081_D32R0102_0150:
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif ne, scr_seq_0081_D32R0102_0173
	apply_movement 0, scr_seq_0081_D32R0102_01F4
	apply_movement 255, scr_seq_0081_D32R0102_0230
	goto scr_seq_0081_D32R0102_0183

scr_seq_0081_D32R0102_0173:
	apply_movement 0, scr_seq_0081_D32R0102_020C
	apply_movement 255, scr_seq_0081_D32R0102_0230
scr_seq_0081_D32R0102_0183:
	wait_movement
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_40E5, 1
	setflag FLAG_UNK_25B
	end

scr_seq_0081_D32R0102_019A:
	.byte 0x00, 0x00

scr_seq_0081_D32R0102_019C:
	.short 18, 1
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0081_D32R0102_01B4:
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0081_D32R0102_01C8:
	.short 15, 1
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0081_D32R0102_01E0:
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_0081_D32R0102_01F4:
	.short 15, 1
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_0081_D32R0102_020C:
	.short 19, 2
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_0081_D32R0102_0224:
	.short 63, 5
	.short 35, 1
	.short 254, 0

scr_seq_0081_D32R0102_0230:
	.short 63, 5
	.short 34, 1
	.short 254, 0
scr_seq_0081_D32R0102_023C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0081_D32R0102_0364
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0081_D32R0102_0378
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0081_D32R0102_02B5
	apply_movement 255, scr_seq_0081_D32R0102_038C
	apply_movement 1, scr_seq_0081_D32R0102_03D8
	goto scr_seq_0081_D32R0102_0303

scr_seq_0081_D32R0102_02B5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0081_D32R0102_02D0
	apply_movement 255, scr_seq_0081_D32R0102_03A4
	goto scr_seq_0081_D32R0102_0303

scr_seq_0081_D32R0102_02D0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0081_D32R0102_02F3
	apply_movement 255, scr_seq_0081_D32R0102_03C4
	apply_movement 1, scr_seq_0081_D32R0102_03D8
	goto scr_seq_0081_D32R0102_0303

scr_seq_0081_D32R0102_02F3:
	apply_movement 255, scr_seq_0081_D32R0102_03B0
	apply_movement 1, scr_seq_0081_D32R0102_03D8
scr_seq_0081_D32R0102_0303:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0081_D32R0102_032A
	apply_movement 253, scr_seq_0081_D32R0102_03E4
	wait_movement
scr_seq_0081_D32R0102_032A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 29
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0081_D32R0102_0364:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0081_D32R0102_0378:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0081_D32R0102_038C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0081_D32R0102_03A4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0081_D32R0102_03B0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0081_D32R0102_03C4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0081_D32R0102_03D8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0081_D32R0102_03E4:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0081_D32R0102_03F4:
	checkflag FLAG_UNK_150
	gotoif TRUE, scr_seq_0081_D32R0102_0421
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 4
	apply_movement 2, scr_seq_0081_D32R0102_043C
	wait_movement
	npc_msg 5
	closemsg
	setflag FLAG_UNK_150
	goto scr_seq_0081_D32R0102_042E

scr_seq_0081_D32R0102_0421:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	closemsg
scr_seq_0081_D32R0102_042E:
	apply_movement 2, scr_seq_0081_D32R0102_0444
	wait_movement
	releaseall
	end


scr_seq_0081_D32R0102_043C:
	.short 1, 1
	.short 254, 0

scr_seq_0081_D32R0102_0444:
	.short 0, 1
	.short 254, 0
scr_seq_0081_D32R0102_044C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0081_D32R0102_045F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0081_D32R0102_0472:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
