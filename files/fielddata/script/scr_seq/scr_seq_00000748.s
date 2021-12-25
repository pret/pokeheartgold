#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000748_00000080 ; 000
	scrdef scr_seq_00000748_00000128 ; 001
	scrdef scr_seq_00000748_00000012 ; 002
	scrdef scr_seq_00000748_00000080 ; 003
	scrdef_end

scr_seq_00000748_00000012:
	scrcmd_609
	lockall
	setvar VAR_UNK_412E, 2
	msgbox 7
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000748_00000070
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 8
	checkflag FLAG_UNK_176
	gotoif eq, scr_seq_00000748_00000063
	msgbox 9
	setflag FLAG_UNK_25B
	dummy_486
	setvar VAR_UNK_40E5, 2
	msgbox 11
	setflag FLAG_UNK_176
scr_seq_00000748_00000063:
	msgbox 12
	goto scr_seq_00000748_00000091

scr_seq_00000748_0000006C:
	.byte 0x61, 0x00, 0x02, 0x00

scr_seq_00000748_00000070:
	.short 14, 2
	.short 13, 1
	.short 14, 2
	.short 254, 0
scr_seq_00000748_00000080:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000748_00000120
	wait_movement
	msgbox 0
scr_seq_00000748_00000091:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000748_000000ED
	scrcmd_783 1
	setvar VAR_UNK_412E, 5
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000748_000000ED
	scrcmd_747
	scrcmd_600
	scrcmd_282
	msgbox 2
	closemsg
	apply_movement 255, scr_seq_00000748_0000017C
	wait_movement
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_412E, 4
	releaseall
	end

scr_seq_00000748_000000ED:
	scrcmd_783 0
	msgbox 3
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000748_00000184
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_412E, 3
	releaseall
	end

scr_seq_00000748_0000011D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000748_00000120:
	.short 34, 1
	.short 254, 0
scr_seq_00000748_00000128:
	scrcmd_609
	lockall
	msgbox 4
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000748_00000168
	msgbox 5
	closemsg
	apply_movement 255, scr_seq_00000748_00000184
	wait_movement
	scrcmd_783 0
	scrcmd_606
	scrcmd_109 253, 48
	setvar VAR_UNK_412E, 3
	releaseall
	end

scr_seq_00000748_00000168:
	msgbox 6
	closemsg
	apply_movement 255, scr_seq_00000748_0000017C
	wait_movement
	releaseall
	end

scr_seq_00000748_0000017B:
	.byte 0x00

scr_seq_00000748_0000017C:
	.short 13, 3
	.short 254, 0

scr_seq_00000748_00000184:
	.short 15, 1
	.short 254, 0
	.balign 4, 0
