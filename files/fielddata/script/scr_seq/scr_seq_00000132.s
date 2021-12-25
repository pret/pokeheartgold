#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000132_00000012 ; 000
	scrdef scr_seq_00000132_00000234 ; 001
	scrdef scr_seq_00000132_00000279 ; 002
	scrdef scr_seq_00000132_0000038C ; 003
	scrdef_end

scr_seq_00000132_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_09E
	gotoif eq, scr_seq_00000132_0000002E
	msgbox 0
	closemsg
	setflag FLAG_UNK_09E
scr_seq_00000132_0000002E:
	scrcmd_389 32780, 493
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000132_0000004C
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000132_0000004C:
	apply_movement 0, scr_seq_00000132_00000188
	wait_movement
	msgbox 1
	closemsg
	scrcmd_386 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000132_00000078
	goto scr_seq_00000132_00000107

scr_seq_00000132_00000072:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000132_00000078:
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_00000132_00000091
	goto scr_seq_00000132_000000CF

scr_seq_00000132_0000008B:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00
	.byte 0x00
scr_seq_00000132_00000091:
	goto scr_seq_00000132_00000097

scr_seq_00000132_00000097:
	apply_movement 0, scr_seq_00000132_00000194
	wait_movement
	apply_movement 0, scr_seq_00000132_000001A0
	wait_movement
	msgbox 3
	closemsg
	apply_movement 0, scr_seq_00000132_000001A8
	wait_movement
	msgbox 4
	closemsg
	apply_movement 0, scr_seq_00000132_000001B4
	wait_movement
	goto scr_seq_00000132_00000167

scr_seq_00000132_000000CF:
	apply_movement 0, scr_seq_00000132_000001C4
	wait_movement
	apply_movement 0, scr_seq_00000132_000001D0
	wait_movement
	msgbox 3
	closemsg
	apply_movement 0, scr_seq_00000132_000001D8
	wait_movement
	msgbox 4
	closemsg
	apply_movement 0, scr_seq_00000132_000001E0
	wait_movement
	goto scr_seq_00000132_00000167

scr_seq_00000132_00000107:
	apply_movement 0, scr_seq_00000132_000001F0
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000132_000001FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_00000132_00000204
	wait_movement
	msgbox 3
	closemsg
	apply_movement 0, scr_seq_00000132_0000020C
	wait_movement
	apply_movement 255, scr_seq_00000132_0000022C
	wait_movement
	msgbox 4
	closemsg
	apply_movement 0, scr_seq_00000132_0000021C
	wait_movement
	goto scr_seq_00000132_00000167

scr_seq_00000132_00000167:
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2DD
	scrcmd_101 0
	clearflag FLAG_UNK_2DC
	wait_se SEQ_SE_DP_KAIDAN2
	setvar VAR_UNK_40FB, 7
	releaseall
	end

scr_seq_00000132_00000185:
	.byte 0x00, 0x00, 0x00

scr_seq_00000132_00000188:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000132_00000194:
	.short 32, 1
	.short 8, 2
	.short 254, 0

scr_seq_00000132_000001A0:
	.short 33, 1
	.short 254, 0

scr_seq_00000132_000001A8:
	.short 13, 2
	.short 35, 1
	.short 254, 0

scr_seq_00000132_000001B4:
	.short 13, 2
	.short 14, 4
	.short 33, 1
	.short 254, 0

scr_seq_00000132_000001C4:
	.short 33, 1
	.short 9, 1
	.short 254, 0

scr_seq_00000132_000001D0:
	.short 32, 1
	.short 254, 0

scr_seq_00000132_000001D8:
	.short 12, 1
	.short 254, 0

scr_seq_00000132_000001E0:
	.short 13, 2
	.short 14, 4
	.short 33, 1
	.short 254, 0

scr_seq_00000132_000001F0:
	.short 32, 1
	.short 8, 2
	.short 254, 0

scr_seq_00000132_000001FC:
	.short 8, 1
	.short 254, 0

scr_seq_00000132_00000204:
	.short 33, 1
	.short 254, 0

scr_seq_00000132_0000020C:
	.short 15, 1
	.short 13, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000132_0000021C:
	.short 13, 2
	.short 14, 5
	.short 33, 1
	.short 254, 0

scr_seq_00000132_0000022C:
	.short 35, 1
	.short 254, 0
scr_seq_00000132_00000234:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40FB, 13
	gotoif ge, scr_seq_00000132_0000026E
	checkflag FLAG_UNK_09D
	gotoif eq, scr_seq_00000132_00000263
	msgbox 7
	waitbutton
	closemsg
	setflag FLAG_UNK_09D
	releaseall
	end

scr_seq_00000132_00000263:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000132_0000026E:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000132_00000279:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000132_000002A6
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000132_0000030C
scr_seq_00000132_000002A6:
	msgbox 11
	closemsg
	play_se SEQ_SE_DP_TELE
	apply_movement 255, scr_seq_00000132_00000318
	wait_movement
	comparevartovalue VAR_UNK_40FB, 13
	gotoif ne, scr_seq_00000132_000002D2
	setvar VAR_UNK_40FB, 10
	goto scr_seq_00000132_000002E4

scr_seq_00000132_000002D2:
	setvar VAR_UNK_40FB, 1
	setflag FLAG_UNK_2DC
	clearflag FLAG_UNK_2DD
	clearflag FLAG_UNK_2DB
scr_seq_00000132_000002E4:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 60, 0, 695, 397, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000132_0000030C:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000132_00000317:
	.byte 0x00

scr_seq_00000132_00000318:
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 62, 1
	.short 2, 1
	.short 62, 1
	.short 0, 1
	.short 62, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0
scr_seq_00000132_0000038C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 63, 0
	msgbox 13
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
