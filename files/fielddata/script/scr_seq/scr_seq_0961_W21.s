#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0961_W21_0045 ; 000
	scrdef scr_seq_0961_W21_000A ; 001
	scrdef_end

scr_seq_0961_W21_000A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0961_W21_001B
	clearflag FLAG_UNK_189
	end

scr_seq_0961_W21_001B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0961_W21_003F
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0961_W21_003F
	setflag FLAG_UNK_27E
	end

scr_seq_0961_W21_003F:
	clearflag FLAG_UNK_27E
	end

scr_seq_0961_W21_0045:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0961_W21_0152
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0961_W21_0166
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0961_W21_00BE
	apply_movement 255, scr_seq_0961_W21_017C
	apply_movement 12, scr_seq_0961_W21_01B0
	goto scr_seq_0961_W21_00F1

scr_seq_0961_W21_00BE:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0961_W21_00E1
	apply_movement 255, scr_seq_0961_W21_019C
	apply_movement 12, scr_seq_0961_W21_01B0
	goto scr_seq_0961_W21_00F1

scr_seq_0961_W21_00E1:
	apply_movement 255, scr_seq_0961_W21_0188
	apply_movement 12, scr_seq_0961_W21_01B0
scr_seq_0961_W21_00F1:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0961_W21_0118
	apply_movement 253, scr_seq_0961_W21_01BC
	wait_movement
scr_seq_0961_W21_0118:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 74
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

scr_seq_0961_W21_0152:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0961_W21_0166:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0961_W21_017A:
	.byte 0x00, 0x00

scr_seq_0961_W21_017C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0961_W21_0188:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0961_W21_019C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0961_W21_01B0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0961_W21_01BC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
