#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000841_0000005C ; 000
	scrdef scr_seq_00000841_000003E0 ; 001
	scrdef scr_seq_00000841_000003F3 ; 002
	scrdef scr_seq_00000841_00000320 ; 003
	scrdef scr_seq_00000841_0000001E ; 004
	scrdef scr_seq_00000841_00000043 ; 005
	scrdef scr_seq_00000841_00000406 ; 006
	scrdef_end

scr_seq_00000841_0000001E:
	scrcmd_281 16393
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif ne, scr_seq_00000841_0000003B
	setvar VAR_OBJ_0, 0
	goto scr_seq_00000841_00000041

scr_seq_00000841_0000003B:
	setvar VAR_OBJ_0, 97
scr_seq_00000841_00000041:
	end

scr_seq_00000841_00000043:
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_00000841_0000005A
	scrcmd_101 3
	setvar VAR_TEMP_x400B, 1
scr_seq_00000841_0000005A:
	end

scr_seq_00000841_0000005C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 480, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000841_00000125
	getitemquantity 479, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000841_000000E9
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000841_000000BD
	call scr_seq_00000841_0000014D
	scrcmd_190 0
	scrcmd_132 0, 1
	closemsg
	call scr_seq_00000841_000001DB
	msgbox 2
	closemsg
	apply_movement 0, scr_seq_00000841_0000026C
	wait_movement
	releaseall
	end

scr_seq_00000841_000000BD:
	setflag FLAG_UNK_119
	call scr_seq_00000841_0000014D
	scrcmd_190 0
	scrcmd_132 3, 4
	closemsg
	call scr_seq_00000841_000001DB
	msgbox 5
	closemsg
	apply_movement 0, scr_seq_00000841_0000026C
	wait_movement
	releaseall
	end

scr_seq_00000841_000000E9:
	takeitem ITEM_LOST_ITEM, 1, VAR_SPECIAL_x800C
	msgbox 6
	clearflag FLAG_UNK_2FB
	scrcmd_100 1
	setvar VAR_SPECIAL_x8004, 480
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 8
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_087
	setflag FLAG_UNK_998
	setvar VAR_UNK_40FF, 2
	end

scr_seq_00000841_00000125:
	call scr_seq_00000841_0000014D
	scrcmd_190 0
	scrcmd_132 9, 10
	closemsg
	call scr_seq_00000841_000001DB
	msgbox 11
	closemsg
	apply_movement 0, scr_seq_00000841_0000026C
	wait_movement
	releaseall
	end

scr_seq_00000841_0000014D:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000841_0000016C
	apply_movement 0, scr_seq_00000841_000002B0
	goto scr_seq_00000841_0000018F

scr_seq_00000841_0000016C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000841_00000187
	apply_movement 0, scr_seq_00000841_00000274
	goto scr_seq_00000841_0000018F

scr_seq_00000841_00000187:
	apply_movement 0, scr_seq_00000841_00000294
scr_seq_00000841_0000018F:
	wait_movement
	scrcmd_100 3
	scrcmd_101 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000841_000001B4
	apply_movement 3, scr_seq_00000841_00000304
	goto scr_seq_00000841_000001D7

scr_seq_00000841_000001B4:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000841_000001CF
	apply_movement 3, scr_seq_00000841_000002C8
	goto scr_seq_00000841_000001D7

scr_seq_00000841_000001CF:
	apply_movement 3, scr_seq_00000841_000002EC
scr_seq_00000841_000001D7:
	wait_movement
	return

scr_seq_00000841_000001DB:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000841_000001FA
	apply_movement 3, scr_seq_00000841_000002B0
	goto scr_seq_00000841_0000021D

scr_seq_00000841_000001FA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000841_00000215
	apply_movement 3, scr_seq_00000841_00000274
	goto scr_seq_00000841_0000021D

scr_seq_00000841_00000215:
	apply_movement 3, scr_seq_00000841_00000294
scr_seq_00000841_0000021D:
	wait_movement
	scrcmd_100 0
	scrcmd_101 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000841_00000242
	apply_movement 0, scr_seq_00000841_00000304
	goto scr_seq_00000841_00000265

scr_seq_00000841_00000242:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000841_0000025D
	apply_movement 0, scr_seq_00000841_000002C8
	goto scr_seq_00000841_00000265

scr_seq_00000841_0000025D:
	apply_movement 0, scr_seq_00000841_000002EC
scr_seq_00000841_00000265:
	wait_movement
	return

scr_seq_00000841_00000269:
	.byte 0x00, 0x00, 0x00

scr_seq_00000841_0000026C:
	.short 34, 1
	.short 254, 0

scr_seq_00000841_00000274:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000841_00000294:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000841_000002B0:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000841_000002C8:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000841_000002EC:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000841_00000304:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000841_00000320:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000841_000003A3
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 12
	waitbutton
	closemsg
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000841_00000359
	apply_movement 2, scr_seq_00000841_000003C8
	goto scr_seq_00000841_00000397

scr_seq_00000841_00000359:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000841_00000374
	apply_movement 2, scr_seq_00000841_000003C0
	goto scr_seq_00000841_00000397

scr_seq_00000841_00000374:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000841_0000038F
	apply_movement 2, scr_seq_00000841_000003D8
	goto scr_seq_00000841_00000397

scr_seq_00000841_0000038F:
	apply_movement 2, scr_seq_00000841_000003D0
scr_seq_00000841_00000397:
	wait_movement
	setvar VAR_TEMP_x400A, 1
	releaseall
	end

scr_seq_00000841_000003A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 354, 0
	msgbox 13
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000841_000003BE:
	.byte 0x00, 0x00

scr_seq_00000841_000003C0:
	.short 0, 1
	.short 254, 0

scr_seq_00000841_000003C8:
	.short 1, 1
	.short 254, 0

scr_seq_00000841_000003D0:
	.short 2, 1
	.short 254, 0

scr_seq_00000841_000003D8:
	.short 3, 1
	.short 254, 0
scr_seq_00000841_000003E0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000841_000003F3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000841_00000406:
	checkflag FLAG_UNK_2FB
	gotoif eq, scr_seq_00000841_00000431
	comparevartovalue VAR_UNK_40FF, 2
	gotoif eq, scr_seq_00000841_00000433
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000841_00000431:
	end

scr_seq_00000841_00000433:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
