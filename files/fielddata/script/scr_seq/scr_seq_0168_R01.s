#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0168_R01_0056 ; 000
	scrdef scr_seq_0168_R01_000E ; 001
	scrdef scr_seq_0168_R01_01EC ; 002
	scrdef_end

scr_seq_0168_R01_000E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0168_R01_001F
	clearflag FLAG_UNK_189
	end

scr_seq_0168_R01_001F:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0168_R01_0050
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0168_R01_0050
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0168_R01_0050
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0168_R01_0050:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0168_R01_0056:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0168_R01_015B
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0168_R01_016F
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0168_R01_00CF
	apply_movement 255, scr_seq_0168_R01_01BC
	apply_movement 5, scr_seq_0168_R01_01D0
	goto scr_seq_0168_R01_00FA

scr_seq_0168_R01_00CF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0168_R01_00EA
	apply_movement 255, scr_seq_0168_R01_019C
	goto scr_seq_0168_R01_00FA

scr_seq_0168_R01_00EA:
	apply_movement 255, scr_seq_0168_R01_01A8
	apply_movement 5, scr_seq_0168_R01_01D0
scr_seq_0168_R01_00FA:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0168_R01_0121
	apply_movement 253, scr_seq_0168_R01_01DC
	wait_movement
scr_seq_0168_R01_0121:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 72
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

scr_seq_0168_R01_015B:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0168_R01_016F:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0168_R01_0183:
	.byte 0x00, 0x0f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x0e, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x03, 0x00, 0x21, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0168_R01_019C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0168_R01_01A8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0168_R01_01BC:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0168_R01_01D0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0168_R01_01DC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0168_R01_01EC:
	scrcmd_055 0, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
