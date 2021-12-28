#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0261_R48_0049 ; 000
	scrdef scr_seq_0261_R48_000E ; 001
	scrdef scr_seq_0261_R48_01CC ; 002
	scrdef_end

scr_seq_0261_R48_000E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0261_R48_001F
	clearflag FLAG_UNK_189
	end

scr_seq_0261_R48_001F:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0261_R48_0043
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0261_R48_0043
	setflag FLAG_UNK_27E
	end

scr_seq_0261_R48_0043:
	clearflag FLAG_UNK_27E
	end

scr_seq_0261_R48_0049:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0261_R48_014E
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0261_R48_0162
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0261_R48_00C2
	apply_movement 255, scr_seq_0261_R48_0178
	apply_movement 1, scr_seq_0261_R48_01B0
	goto scr_seq_0261_R48_00ED

scr_seq_0261_R48_00C2:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0261_R48_00DD
	apply_movement 255, scr_seq_0261_R48_0190
	goto scr_seq_0261_R48_00ED

scr_seq_0261_R48_00DD:
	apply_movement 255, scr_seq_0261_R48_019C
	apply_movement 1, scr_seq_0261_R48_01B0
scr_seq_0261_R48_00ED:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0261_R48_0114
	apply_movement 253, scr_seq_0261_R48_01BC
	wait_movement
scr_seq_0261_R48_0114:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 37
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

scr_seq_0261_R48_014E:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0261_R48_0162:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0261_R48_0176:
	.byte 0x00, 0x00

scr_seq_0261_R48_0178:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0261_R48_0190:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0261_R48_019C:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0261_R48_01B0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0261_R48_01BC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0261_R48_01CC:
	scrcmd_055 0, 1, 13, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
