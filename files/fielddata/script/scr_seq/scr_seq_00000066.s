#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000066_0000002F ; 000
	scrdef scr_seq_00000066_00000240 ; 001
	scrdef scr_seq_00000066_0000027C ; 002
	scrdef scr_seq_00000066_00000016 ; 003
	scrdef scr_seq_00000066_0000001E ; 004
	scrdef_end

scr_seq_00000066_00000016:
	setvar VAR_UNK_4125, 0
	end

scr_seq_00000066_0000001E:
	checkflag FLAG_UNK_1D8
	gotoif TRUE, scr_seq_00000066_0000002D
	scrcmd_375 4
scr_seq_00000066_0000002D:
	end

scr_seq_00000066_0000002F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0B9
	gotoif TRUE, scr_seq_00000066_000000B5
	comparevartovalue VAR_UNK_40A5, 0
	gotoif eq, scr_seq_00000066_00000062
	msgbox 1
	closemsg
	apply_movement 1, scr_seq_00000066_000001B0
	wait_movement
	releaseall
	end

scr_seq_00000066_00000062:
	msgbox 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 255, scr_seq_00000066_000001D0
	apply_movement 1, scr_seq_00000066_000001B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_DOOR
	hide_person 4
	hide_person 0
	wait_se SEQ_SE_DP_DOOR
	apply_movement 1, scr_seq_00000066_000001F0
	wait_movement
	releaseall
	setvar VAR_UNK_40A5, 1
	setflag FLAG_UNK_1D8
	end

scr_seq_00000066_000000B5:
	msgbox 2
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000066_0000017F
	takeitem ITEM_SECRETPOTION, 1, VAR_SPECIAL_x800C
	buffer_players_name 0
	msgbox 3
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	msgbox 4
	closemsg
	apply_movement 1, scr_seq_00000066_000001B0
	wait_movement
	msgbox 5
	closemsg
	apply_movement 2, scr_seq_00000066_000001A0
	wait_movement
	scrcmd_076 181, 0
	msgbox 6
	scrcmd_077
	closemsg
	scrcmd_459
	apply_movement 2, scr_seq_00000066_000001A8
	wait_movement
	scrcmd_076 181, 0
	scrcmd_077
	msgbox 7
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 255, scr_seq_00000066_00000218
	apply_movement 1, scr_seq_00000066_00000200
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 1
	releaseall
	setflag FLAG_UNK_96A
	setvar VAR_UNK_40A5, 2
	setvar VAR_UNK_410E, 1
	setflag FLAG_UNK_1D7
	clearflag FLAG_UNK_1D9
	setflag FLAG_UNK_1DA
	setflag FLAG_UNK_1DB
	clearflag FLAG_UNK_1DC
	clearflag FLAG_UNK_1DD
	setflag FLAG_UNK_998
	end

scr_seq_00000066_0000017F:
	msgbox 8
	closemsg
	apply_movement 1, scr_seq_00000066_000001B0
	wait_movement
	msgbox 9
	closemsg
	scrcmd_076 181, 12
	scrcmd_077
	releaseall
	end

scr_seq_00000066_0000019F:
	.byte 0x00

scr_seq_00000066_000001A0:
	.short 30, 1
	.short 254, 0

scr_seq_00000066_000001A8:
	.short 50, 3
	.short 254, 0

scr_seq_00000066_000001B0:
	.short 31, 1
	.short 254, 0

scr_seq_00000066_000001B8:
	.short 63, 1
	.short 13, 3
	.short 15, 1
	.short 33, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000066_000001D0:
	.short 2, 1
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 63, 3
	.short 62, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000066_000001F0:
	.short 14, 1
	.short 12, 3
	.short 35, 1
	.short 254, 0

scr_seq_00000066_00000200:
	.short 63, 1
	.short 13, 1
	.short 15, 2
	.short 33, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000066_00000218:
	.short 0, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 63, 2
	.short 62, 1
	.short 35, 1
	.short 254, 0
	.byte 0x0a, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000066_00000240:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40A5, 2
	gotoif lt, scr_seq_00000066_00000266
	scrcmd_076 181, 0
	msgbox 12
	scrcmd_077
	goto scr_seq_00000066_00000274

scr_seq_00000066_00000266:
	scrcmd_076 181, 12
	msgbox 10
	scrcmd_077
	msgbox 11
scr_seq_00000066_00000274:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000066_0000027C:
	end
	.balign 4, 0
