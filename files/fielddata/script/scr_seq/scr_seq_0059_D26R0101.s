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
	setflag FLAG_UNK_27E
	end

scr_seq_0059_D26R0101_0063:
	clearflag FLAG_UNK_27E
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
	scrcmd_618 VAR_SPECIAL_x800C
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
	scrcmd_615 6
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
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0059_D26R0101_01B8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0059_D26R0101_01CC:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0059_D26R0101_01E0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0059_D26R0101_01EC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
