#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000926_0000002D ; 000
	scrdef scr_seq_00000926_00000114 ; 001
	scrdef scr_seq_00000926_0000016D ; 002
	scrdef scr_seq_00000926_00000012 ; 003
	scrdef_end

scr_seq_00000926_00000012:
	checkflag FLAG_UNK_108
	gotoif eq, scr_seq_00000926_0000001F
	end

scr_seq_00000926_0000001F:
	show_person_at 0, 16, 0, 8, 2
	end

scr_seq_00000926_0000002D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif eq, scr_seq_00000926_000000E8
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000926_000000C9
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000926_000000D4
	scrcmd_294 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000926_00000096
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000926_0000008B
	msgbox 0
	goto scr_seq_00000926_0000008E

scr_seq_00000926_0000008B:
	msgbox 1
scr_seq_00000926_0000008E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000926_00000096:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000926_000000B0
	msgbox 2
	goto scr_seq_00000926_000000B3

scr_seq_00000926_000000B0:
	msgbox 3
scr_seq_00000926_000000B3:
	closemsg
	apply_movement 0, scr_seq_00000926_000000F4
	wait_movement
	setvar VAR_TEMP_x4002, 1
	releaseall
	end

scr_seq_00000926_000000C9:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000926_000000D4:
	apply_movement 0, scr_seq_00000926_00000104
	wait_movement
	setvar VAR_TEMP_x4002, 1
	releaseall
	end

scr_seq_00000926_000000E8:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000926_000000F3:
	.byte 0x00

scr_seq_00000926_000000F4:
	.short 12, 1
	.short 15, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000926_00000104:
	.short 13, 1
	.short 15, 1
	.short 2, 1
	.short 254, 0
scr_seq_00000926_00000114:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif eq, scr_seq_00000926_00000162
	checkflag FLAG_UNK_103
	gotoif eq, scr_seq_00000926_00000157
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000926_0000014C
	msgbox 6
	goto scr_seq_00000926_0000014F

scr_seq_00000926_0000014C:
	msgbox 7
scr_seq_00000926_0000014F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000926_00000157:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000926_00000162:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000926_0000016D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
