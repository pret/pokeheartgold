#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0013_D11R0102_0045 ; 000
	scrdef scr_seq_0013_D11R0102_000A ; 001
	scrdef_end

scr_seq_0013_D11R0102_000A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0013_D11R0102_001B
	clearflag FLAG_UNK_189
	end

scr_seq_0013_D11R0102_001B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0013_D11R0102_003F
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0013_D11R0102_003F
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0013_D11R0102_003F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0013_D11R0102_0045:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0013_D11R0102_014A
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0013_D11R0102_015E
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0013_D11R0102_00BE
	apply_movement 255, scr_seq_0013_D11R0102_0174
	apply_movement 8, scr_seq_0013_D11R0102_01AC
	goto scr_seq_0013_D11R0102_00E9

scr_seq_0013_D11R0102_00BE:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0013_D11R0102_00D9
	apply_movement 255, scr_seq_0013_D11R0102_018C
	goto scr_seq_0013_D11R0102_00E9

scr_seq_0013_D11R0102_00D9:
	apply_movement 255, scr_seq_0013_D11R0102_0198
	apply_movement 8, scr_seq_0013_D11R0102_01AC
scr_seq_0013_D11R0102_00E9:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0013_D11R0102_0110
	apply_movement 253, scr_seq_0013_D11R0102_01B8
	wait_movement
scr_seq_0013_D11R0102_0110:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 75
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

scr_seq_0013_D11R0102_014A:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0013_D11R0102_015E:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0013_D11R0102_0172:
	.byte 0x00, 0x00

scr_seq_0013_D11R0102_0174:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0013_D11R0102_018C:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0013_D11R0102_0198:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0013_D11R0102_01AC:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0013_D11R0102_01B8:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
