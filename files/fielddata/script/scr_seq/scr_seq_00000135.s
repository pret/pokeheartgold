#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000135_000000C0 ; 000
	scrdef scr_seq_00000135_0000003E ; 001
	scrdef scr_seq_00000135_00000012 ; 002
	scrdef scr_seq_00000135_00000029 ; 003
	scrdef_end

scr_seq_00000135_00000012:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_00000135_0000001F
	end

scr_seq_00000135_0000001F:
	setflag FLAG_UNK_2D2
	hide_person 0
	end

scr_seq_00000135_00000029:
	comparevartovalue VAR_UNK_40F9, 7
	gotoif ge, scr_seq_00000135_0000003C
	clearflag FLAG_UNK_2D2
	end

scr_seq_00000135_0000003C:
	end

scr_seq_00000135_0000003E:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000135_000000B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_076 384, 0
	scrcmd_077
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000135_000000B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_099 0
	scrcmd_523 0, 8, 90, 3, 0
	scrcmd_076 384, 0
	msgbox 0
	scrcmd_077
	scrcmd_098 0
	closemsg
	setvar VAR_UNK_40F9, 6
	releaseall
	end

scr_seq_00000135_000000B1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000135_000000B4:
	.short 12, 8
	.short 63, 2
	.short 254, 0
scr_seq_00000135_000000C0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_099 0
	scrcmd_523 0, 8, 90, 3, 0
	scrcmd_076 384, 0
	msgbox 0
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 384, 50, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000135_00000142
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_00000135_00000123
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif eq, scr_seq_00000135_00000134
scr_seq_00000135_00000123:
	msgbox 1
	waitbutton
	closemsg
	setvar VAR_UNK_40F9, 9
	releaseall
	end

scr_seq_00000135_00000134:
	setvar VAR_UNK_40F9, 7
	setflag FLAG_UNK_17B
	releaseall
	end

scr_seq_00000135_00000142:
	scrcmd_219
	releaseall
	end
	.balign 4, 0
