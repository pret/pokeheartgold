#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0065_D27R0106_0045 ; 000
	scrdef scr_seq_0065_D27R0106_000A ; 001
	scrdef_end

scr_seq_0065_D27R0106_000A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0065_D27R0106_001B
	clearflag FLAG_UNK_189
	end

scr_seq_0065_D27R0106_001B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0065_D27R0106_003F
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0065_D27R0106_003F
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0065_D27R0106_003F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0065_D27R0106_0045:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0065_D27R0106_0127
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0065_D27R0106_013B
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0065_D27R0106_00B6
	apply_movement 255, scr_seq_0065_D27R0106_0150
	goto scr_seq_0065_D27R0106_00C6

scr_seq_0065_D27R0106_00B6:
	apply_movement 255, scr_seq_0065_D27R0106_015C
	apply_movement 3, scr_seq_0065_D27R0106_0170
scr_seq_0065_D27R0106_00C6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0065_D27R0106_00ED
	apply_movement 253, scr_seq_0065_D27R0106_017C
	wait_movement
scr_seq_0065_D27R0106_00ED:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 27
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0065_D27R0106_0127:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0065_D27R0106_013B:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0065_D27R0106_014F:
	.byte 0x00

scr_seq_0065_D27R0106_0150:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0065_D27R0106_015C:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0065_D27R0106_0170:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0065_D27R0106_017C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
