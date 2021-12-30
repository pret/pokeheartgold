#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0054_D24R0217_006D ; 000
	scrdef scr_seq_0054_D24R0217_007E ; 001
	scrdef scr_seq_0054_D24R0217_0012 ; 002
	scrdef scr_seq_0054_D24R0217_0080 ; 003
	scrdef_end

scr_seq_0054_D24R0217_0012:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0054_D24R0217_0023
	clearflag FLAG_UNK_189
	end

scr_seq_0054_D24R0217_0023:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0054_D24R0217_0061
	get_weekday VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0054_D24R0217_0067
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_0054_D24R0217_0067
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif eq, scr_seq_0054_D24R0217_0067
scr_seq_0054_D24R0217_0061:
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0054_D24R0217_0067:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0054_D24R0217_006D:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0054_D24R0217_007E:
	end

scr_seq_0054_D24R0217_0080:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0054_D24R0217_0197
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0054_D24R0217_01AB
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0054_D24R0217_00F9
	apply_movement 255, scr_seq_0054_D24R0217_01C0
	apply_movement 0, scr_seq_0054_D24R0217_020C
	goto scr_seq_0054_D24R0217_0147

scr_seq_0054_D24R0217_00F9:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0054_D24R0217_0114
	apply_movement 255, scr_seq_0054_D24R0217_01D8
	goto scr_seq_0054_D24R0217_0147

scr_seq_0054_D24R0217_0114:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0054_D24R0217_0137
	apply_movement 255, scr_seq_0054_D24R0217_01F8
	apply_movement 0, scr_seq_0054_D24R0217_020C
	goto scr_seq_0054_D24R0217_0147

scr_seq_0054_D24R0217_0137:
	apply_movement 255, scr_seq_0054_D24R0217_01E4
	apply_movement 0, scr_seq_0054_D24R0217_020C
scr_seq_0054_D24R0217_0147:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_0054_D24R0217_0218
	wait_movement
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 4
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

scr_seq_0054_D24R0217_0197:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0054_D24R0217_01AB:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0054_D24R0217_01BF:
	.byte 0x00

scr_seq_0054_D24R0217_01C0:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0054_D24R0217_01D8:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0054_D24R0217_01E4:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0054_D24R0217_01F8:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0054_D24R0217_020C:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0054_D24R0217_0218:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
