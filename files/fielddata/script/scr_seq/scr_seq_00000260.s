#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000260_00000016 ; 000
	scrdef scr_seq_00000260_0000017C ; 001
	scrdef scr_seq_00000260_0000010C ; 002
	scrdef scr_seq_00000260_000001A9 ; 003
	scrdef scr_seq_00000260_0000024C ; 004
	scrdef_end

scr_seq_00000260_00000016:
	setvar VAR_UNK_40EB, 1
	setflag FLAG_UNK_9C9
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000260_0000004F
	scrcmd_342 4, 87, 385
	scrcmd_342 5, 87, 389
	scrcmd_342 6, 87, 385
	goto scr_seq_00000260_00000067

scr_seq_00000260_0000004F:
	scrcmd_342 4, 87, 389
	scrcmd_342 5, 87, 385
	scrcmd_342 6, 87, 385
scr_seq_00000260_00000067:
	comparevartovalue VAR_UNK_40F9, 2
	gotoif eq, scr_seq_00000260_000000E6
	comparevartovalue VAR_UNK_40F9, 3
	gotoif eq, scr_seq_00000260_000000E6
	comparevartovalue VAR_UNK_40F9, 5
	gotoif ge, scr_seq_00000260_000000EC
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000260_0000009F
	clearflag FLAG_UNK_189
	end

scr_seq_00000260_0000009F:
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_00000260_000000B2
	goto scr_seq_00000260_000000E6

scr_seq_00000260_000000B0:
	.byte 0x02, 0x00
scr_seq_00000260_000000B2:
	scrcmd_142 32, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000260_000000E6
	scrcmd_484 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000260_000000E0
	clearflag FLAG_UNK_304
	goto scr_seq_00000260_000000E4

scr_seq_00000260_000000E0:
	setflag FLAG_UNK_304
scr_seq_00000260_000000E4:
	end

scr_seq_00000260_000000E6:
	setflag FLAG_UNK_304
	end

scr_seq_00000260_000000EC:
	scrcmd_342 4, 87, 385
	scrcmd_342 5, 87, 385
	scrcmd_342 6, 87, 389
	goto scr_seq_00000260_000000E6

scr_seq_00000260_0000010A:
	.byte 0x02, 0x00
scr_seq_00000260_0000010C:
	comparevartovalue VAR_UNK_40F9, 5
	gotoif ge, scr_seq_00000260_00000162
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000260_00000148
	scrcmd_342 4, 87, 385
	scrcmd_342 5, 87, 389
	scrcmd_342 6, 87, 385
	goto scr_seq_00000260_00000160

scr_seq_00000260_00000148:
	scrcmd_342 4, 87, 389
	scrcmd_342 5, 87, 385
	scrcmd_342 6, 87, 385
scr_seq_00000260_00000160:
	end

scr_seq_00000260_00000162:
	scrcmd_342 4, 87, 385
	scrcmd_342 5, 87, 385
	scrcmd_342 6, 87, 389
	end

scr_seq_00000260_0000017C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_151
	gotoif TRUE, scr_seq_00000260_0000019E
	msgbox 0
	waitbutton
	closemsg
	setflag FLAG_UNK_151
	releaseall
	end

scr_seq_00000260_0000019E:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000260_000001A9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_157
	gotoif TRUE, scr_seq_00000260_00000210
	msgbox 2
	apply_movement 5, scr_seq_00000260_0000022C
	wait_movement
	msgbox 3
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000260_000001EB
	apply_movement 5, scr_seq_00000260_00000234
	goto scr_seq_00000260_0000020E

scr_seq_00000260_000001EB:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000260_00000206
	apply_movement 5, scr_seq_00000260_0000023C
	goto scr_seq_00000260_0000020E

scr_seq_00000260_00000206:
	apply_movement 5, scr_seq_00000260_00000244
scr_seq_00000260_0000020E:
	wait_movement
scr_seq_00000260_00000210:
	buffer_players_name 0
	msgbox 4
	closemsg
	apply_movement 5, scr_seq_00000260_0000022C
	wait_movement
	setflag FLAG_UNK_157
	releaseall
	end

scr_seq_00000260_0000022A:
	.byte 0x00, 0x00

scr_seq_00000260_0000022C:
	.short 32, 1
	.short 254, 0

scr_seq_00000260_00000234:
	.short 33, 1
	.short 254, 0

scr_seq_00000260_0000023C:
	.short 34, 1
	.short 254, 0

scr_seq_00000260_00000244:
	.short 35, 1
	.short 254, 0
scr_seq_00000260_0000024C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000260_000002B5
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000260_000002C0
	msgbox 6
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 91
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000260_000002B5:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000260_000002C0:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
