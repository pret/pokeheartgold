#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0735_T01_023C ; 000
	scrdef scr_seq_0735_T01_024F ; 001
	scrdef scr_seq_0735_T01_0262 ; 002
	scrdef scr_seq_0735_T01_0279 ; 003
	scrdef scr_seq_0735_T01_028E ; 004
	scrdef scr_seq_0735_T01_02A3 ; 005
	scrdef scr_seq_0735_T01_0081 ; 006
	scrdef scr_seq_0735_T01_0022 ; 007
	scrdef_end

scr_seq_0735_T01_0022:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0735_T01_0033
	clearflag FLAG_UNK_189
	end

scr_seq_0735_T01_0033:
	checkflag FLAG_UNK_185
	gotoif TRUE, scr_seq_0735_T01_0044
	goto scr_seq_0735_T01_004A

scr_seq_0735_T01_0044:
	setvar VAR_UNK_4096, 0
scr_seq_0735_T01_004A:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0735_T01_007B
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0735_T01_007B
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0735_T01_007B
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0735_T01_007B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0735_T01_0081:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0735_T01_01A9
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0735_T01_01BD
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0735_T01_00FA
	apply_movement 255, scr_seq_0735_T01_01D4
	apply_movement 2, scr_seq_0735_T01_0220
	goto scr_seq_0735_T01_0148

scr_seq_0735_T01_00FA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0735_T01_0115
	apply_movement 255, scr_seq_0735_T01_01EC
	goto scr_seq_0735_T01_0148

scr_seq_0735_T01_0115:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0735_T01_0138
	apply_movement 255, scr_seq_0735_T01_020C
	apply_movement 2, scr_seq_0735_T01_0220
	goto scr_seq_0735_T01_0148

scr_seq_0735_T01_0138:
	apply_movement 255, scr_seq_0735_T01_01F8
	apply_movement 2, scr_seq_0735_T01_0220
scr_seq_0735_T01_0148:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0735_T01_016F
	apply_movement 253, scr_seq_0735_T01_022C
	wait_movement
scr_seq_0735_T01_016F:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 73
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

scr_seq_0735_T01_01A9:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0735_T01_01BD:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0735_T01_01D1:
	.byte 0x00, 0x00, 0x00

scr_seq_0735_T01_01D4:
	.short 14, 1
	.short 12, 2
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0735_T01_01EC:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0735_T01_01F8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0735_T01_020C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0735_T01_0220:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0735_T01_022C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0735_T01_023C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0735_T01_024F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0735_T01_0262:
	scrcmd_055 2, 0, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0735_T01_0279:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 3, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0735_T01_028E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 4, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0735_T01_02A3:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 5, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
