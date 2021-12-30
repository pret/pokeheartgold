#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0240_R35_0210 ; 000
	scrdef scr_seq_0240_R35_0016 ; 001
	scrdef scr_seq_0240_R35_023E ; 002
	scrdef scr_seq_0240_R35_0092 ; 003
	scrdef scr_seq_0240_R35_0227 ; 004
	scrdef_end

scr_seq_0240_R35_0016:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0240_R35_0027
	clearflag FLAG_UNK_189
	end

scr_seq_0240_R35_0027:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0240_R35_005C
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0240_R35_005C
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0240_R35_005C
	setflag FLAG_HIDE_CAMERON
	goto scr_seq_0240_R35_0060

scr_seq_0240_R35_005C:
	clearflag FLAG_HIDE_CAMERON
scr_seq_0240_R35_0060:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0240_R35_0088
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0240_R35_0088
	clearflag FLAG_UNK_1CD
	setflag FLAG_UNK_1CE
	end

scr_seq_0240_R35_0088:
	clearflag FLAG_UNK_1CE
	setflag FLAG_UNK_1CD
	end

scr_seq_0240_R35_0092:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0240_R35_0197
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0240_R35_01AB
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0240_R35_010B
	apply_movement 255, scr_seq_0240_R35_01C0
	apply_movement 12, scr_seq_0240_R35_01F4
	goto scr_seq_0240_R35_0136

scr_seq_0240_R35_010B:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0240_R35_0126
	apply_movement 255, scr_seq_0240_R35_01D4
	goto scr_seq_0240_R35_0136

scr_seq_0240_R35_0126:
	apply_movement 255, scr_seq_0240_R35_01E0
	apply_movement 12, scr_seq_0240_R35_01F4
scr_seq_0240_R35_0136:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0240_R35_015D
	apply_movement 253, scr_seq_0240_R35_0200
	wait_movement
scr_seq_0240_R35_015D:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 11
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

scr_seq_0240_R35_0197:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0240_R35_01AB:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0240_R35_01BF:
	.byte 0x00

scr_seq_0240_R35_01C0:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0240_R35_01D4:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0240_R35_01E0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0240_R35_01F4:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0240_R35_0200:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0240_R35_0210:
	scrcmd_055 28, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0240_R35_0227:
	scrcmd_055 29, 1, 19, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0240_R35_023E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
