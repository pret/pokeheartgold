#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0105_D41R0101_003C ; 000
	scrdef scr_seq_0105_D41R0101_000A ; 001
	scrdef_end

scr_seq_0105_D41R0101_000A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0105_D41R0101_001B
	clearflag FLAG_UNK_189
	end

scr_seq_0105_D41R0101_001B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0105_D41R0101_0036
	clearflag FLAG_HIDE_CAMERON
	goto scr_seq_0105_D41R0101_003A

scr_seq_0105_D41R0101_0036:
	setflag FLAG_HIDE_CAMERON
scr_seq_0105_D41R0101_003A:
	end

scr_seq_0105_D41R0101_003C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0105_D41R0101_0164
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0105_D41R0101_0178
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0105_D41R0101_00B5
	apply_movement 255, scr_seq_0105_D41R0101_018C
	apply_movement 1, scr_seq_0105_D41R0101_01D8
	goto scr_seq_0105_D41R0101_0103

scr_seq_0105_D41R0101_00B5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0105_D41R0101_00D0
	apply_movement 255, scr_seq_0105_D41R0101_01A4
	goto scr_seq_0105_D41R0101_0103

scr_seq_0105_D41R0101_00D0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0105_D41R0101_00F3
	apply_movement 255, scr_seq_0105_D41R0101_01C4
	apply_movement 1, scr_seq_0105_D41R0101_01D8
	goto scr_seq_0105_D41R0101_0103

scr_seq_0105_D41R0101_00F3:
	apply_movement 255, scr_seq_0105_D41R0101_01B0
	apply_movement 1, scr_seq_0105_D41R0101_01D8
scr_seq_0105_D41R0101_0103:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0105_D41R0101_012A
	apply_movement 253, scr_seq_0105_D41R0101_01E4
	wait_movement
scr_seq_0105_D41R0101_012A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 78
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

scr_seq_0105_D41R0101_0164:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0105_D41R0101_0178:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0105_D41R0101_018C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0105_D41R0101_01A4:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0105_D41R0101_01B0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0105_D41R0101_01C4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0105_D41R0101_01D8:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0105_D41R0101_01E4:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
