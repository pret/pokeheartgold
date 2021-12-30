#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0949_T31_0049 ; 000
	scrdef scr_seq_0949_T31_000E ; 001
	scrdef scr_seq_0949_T31_0204 ; 002
	scrdef_end

scr_seq_0949_T31_000E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0949_T31_001F
	clearflag FLAG_UNK_189
	end

scr_seq_0949_T31_001F:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0949_T31_0043
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0949_T31_0043
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0949_T31_0043:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0949_T31_0049:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0949_T31_0171
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0949_T31_0185
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0949_T31_00C2
	apply_movement 255, scr_seq_0949_T31_019C
	apply_movement 1, scr_seq_0949_T31_01E8
	goto scr_seq_0949_T31_0110

scr_seq_0949_T31_00C2:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0949_T31_00DD
	apply_movement 255, scr_seq_0949_T31_01B4
	goto scr_seq_0949_T31_0110

scr_seq_0949_T31_00DD:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0949_T31_0100
	apply_movement 255, scr_seq_0949_T31_01D4
	apply_movement 1, scr_seq_0949_T31_01E8
	goto scr_seq_0949_T31_0110

scr_seq_0949_T31_0100:
	apply_movement 255, scr_seq_0949_T31_01C0
	apply_movement 1, scr_seq_0949_T31_01E8
scr_seq_0949_T31_0110:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0949_T31_0137
	apply_movement 253, scr_seq_0949_T31_01F4
	wait_movement
scr_seq_0949_T31_0137:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 77
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

scr_seq_0949_T31_0171:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0949_T31_0185:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0949_T31_0199:
	.byte 0x00, 0x00, 0x00

scr_seq_0949_T31_019C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0949_T31_01B4:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0949_T31_01C0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0949_T31_01D4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0949_T31_01E8:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0949_T31_01F4:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0949_T31_0204:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
