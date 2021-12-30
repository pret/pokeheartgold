#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0059_D26R0101_0069 ; 000
	scrdef scr_seq_0059_D26R0101_007F ; 001
	scrdef scr_seq_0059_D26R0101_000E ; 002
	scrdef_end

scr_seq_0059_D26R0101_000E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0059_D26R0101_001F
	clearflag FLAG_UNK_189
	end

scr_seq_0059_D26R0101_001F:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0059_D26R0101_005D
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0059_D26R0101_0063
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0059_D26R0101_0063
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0059_D26R0101_0063
scr_seq_0059_D26R0101_005D:
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0059_D26R0101_0063:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0059_D26R0101_0069:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0059_D26R0101_007F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0059_D26R0101_0184
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0059_D26R0101_0198
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0059_D26R0101_00F0
	apply_movement 255, scr_seq_0059_D26R0101_01AC
	goto scr_seq_0059_D26R0101_0123

scr_seq_0059_D26R0101_00F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0059_D26R0101_0113
	apply_movement 255, scr_seq_0059_D26R0101_01CC
	apply_movement 1, scr_seq_0059_D26R0101_01E0
	goto scr_seq_0059_D26R0101_0123

scr_seq_0059_D26R0101_0113:
	apply_movement 255, scr_seq_0059_D26R0101_01B8
	apply_movement 1, scr_seq_0059_D26R0101_01E0
scr_seq_0059_D26R0101_0123:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0059_D26R0101_014A
	apply_movement 253, scr_seq_0059_D26R0101_01EC
	wait_movement
scr_seq_0059_D26R0101_014A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 6
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

scr_seq_0059_D26R0101_0184:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0059_D26R0101_0198:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0059_D26R0101_01AC:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0059_D26R0101_01B8:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0059_D26R0101_01CC:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0059_D26R0101_01E0:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0059_D26R0101_01EC:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
