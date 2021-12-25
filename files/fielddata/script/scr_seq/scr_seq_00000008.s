#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000008_00000006 ; 000
	scrdef_end

scr_seq_00000008_00000006:
	checkflag FLAG_UNK_AB5
	gotoif eq, scr_seq_00000008_0000004D
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000008_0000002E
	goto scr_seq_00000008_0000004F

scr_seq_00000008_00000028:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000008_0000002E:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000008_00000047
	goto scr_seq_00000008_0000008E

scr_seq_00000008_00000041:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000008_00000047:
	goto scr_seq_00000008_0000004D

scr_seq_00000008_0000004D:
	end

scr_seq_00000008_0000004F:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_00000008_00000086
	scrcmd_342 1, 1, 7
	scrcmd_342 4, 5, 6
	scrcmd_342 2, 1, 26
	scrcmd_342 5, 5, 25
	goto scr_seq_00000008_0000008C

scr_seq_00000008_00000086:
	goto scr_seq_00000008_0000004D

scr_seq_00000008_0000008C:
	end

scr_seq_00000008_0000008E:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_00000008_000000C5
	scrcmd_342 1, 1, 7
	scrcmd_342 4, 5, 6
	scrcmd_342 2, 1, 26
	scrcmd_342 5, 5, 25
	goto scr_seq_00000008_000000CB

scr_seq_00000008_000000C5:
	goto scr_seq_00000008_0000004D

scr_seq_00000008_000000CB:
	end

scr_seq_00000008_000000CD:
	.byte 0x02, 0x00, 0x00
	.balign 4, 0
