#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0218_R26_004D ; 000
	scrdef scr_seq_0218_R26_0012 ; 001
	scrdef scr_seq_0218_R26_01D0 ; 002
	scrdef scr_seq_0218_R26_01E5 ; 003
	scrdef_end

scr_seq_0218_R26_0012:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0218_R26_0023
	clearflag FLAG_UNK_189
	end

scr_seq_0218_R26_0023:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0218_R26_0047
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0218_R26_0047
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0218_R26_0047:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0218_R26_004D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0218_R26_0152
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0218_R26_0166
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0218_R26_00C6
	apply_movement 255, scr_seq_0218_R26_017C
	apply_movement 8, scr_seq_0218_R26_01B4
	goto scr_seq_0218_R26_00F1

scr_seq_0218_R26_00C6:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0218_R26_00E1
	apply_movement 255, scr_seq_0218_R26_0194
	goto scr_seq_0218_R26_00F1

scr_seq_0218_R26_00E1:
	apply_movement 255, scr_seq_0218_R26_01A0
	apply_movement 8, scr_seq_0218_R26_01B4
scr_seq_0218_R26_00F1:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0218_R26_0118
	apply_movement 253, scr_seq_0218_R26_01C0
	wait_movement
scr_seq_0218_R26_0118:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 48
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

scr_seq_0218_R26_0152:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0218_R26_0166:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0218_R26_017A:
	.byte 0x00, 0x00

scr_seq_0218_R26_017C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0218_R26_0194:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0218_R26_01A0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0218_R26_01B4:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0218_R26_01C0:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0218_R26_01D0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0218_R26_01E5:
	scrcmd_055 1, 1, 6, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
