#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000091_000001B0 ; 000
	scrdef scr_seq_00000091_0000007A ; 001
	scrdef scr_seq_00000091_000001C3 ; 002
	scrdef scr_seq_00000091_000002F0 ; 003
	scrdef scr_seq_00000091_00000514 ; 004
	scrdef scr_seq_00000091_00000574 ; 005
	scrdef scr_seq_00000091_00000026 ; 006
	scrdef scr_seq_00000091_0000013C ; 007
	scrdef scr_seq_00000091_00000051 ; 008
	scrdef_end

scr_seq_00000091_00000026:
	checktrainerflag 404
	gotoif lt, scr_seq_00000091_0000004F
	checktrainerflag 222
	gotoif lt, scr_seq_00000091_0000004F
	comparevartovalue VAR_UNK_40AC, 3
	gotoif ge, scr_seq_00000091_0000004F
	setvar VAR_UNK_40AC, 2
scr_seq_00000091_0000004F:
	end

scr_seq_00000091_00000051:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif ge, scr_seq_00000091_00000060
	end

scr_seq_00000091_00000060:
	scrcmd_339 10, 22, 0, 15, 0
	scrcmd_339 11, 22, 0, 15, 0
	end

scr_seq_00000091_0000007A:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000091_000000EC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 5, scr_seq_00000091_000000F4
	wait_movement
	apply_movement 5, scr_seq_00000091_000000FC
	apply_movement 6, scr_seq_00000091_0000010C
	wait_movement
	scrcmd_190 0
	scrcmd_132 0, 1
	closemsg
	apply_movement 5, scr_seq_00000091_00000124
	apply_movement 6, scr_seq_00000091_0000012C
	wait_movement
	scrcmd_101 5
	scrcmd_101 6
	setflag FLAG_UNK_1E6
	releaseall
	setvar VAR_UNK_40AC, 1
	end

scr_seq_00000091_000000E9:
	.byte 0x00, 0x00, 0x00

scr_seq_00000091_000000EC:
	.short 14, 1
	.short 254, 0

scr_seq_00000091_000000F4:
	.short 75, 1
	.short 254, 0

scr_seq_00000091_000000FC:
	.short 33, 1
	.short 13, 3
	.short 15, 3
	.short 254, 0

scr_seq_00000091_0000010C:
	.short 63, 1
	.short 61, 1
	.short 14, 1
	.short 13, 3
	.short 15, 2
	.short 254, 0

scr_seq_00000091_00000124:
	.short 14, 9
	.short 254, 0

scr_seq_00000091_0000012C:
	.short 61, 1
	.short 15, 1
	.short 14, 9
	.short 254, 0
scr_seq_00000091_0000013C:
	scrcmd_609
	lockall
	apply_movement 16, scr_seq_00000091_0000018C
	wait_movement
	msgbox 10
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 16, scr_seq_00000091_00000194
	apply_movement 255, scr_seq_00000091_000001A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 6
	scrcmd_101 16
	setflag FLAG_UNK_24C
	clearflag FLAG_UNK_24D
	releaseall
	end

scr_seq_00000091_0000018B:
	.byte 0x00

scr_seq_00000091_0000018C:
	.short 51, 2
	.short 254, 0

scr_seq_00000091_00000194:
	.short 1, 1
	.short 49, 1
	.short 17, 10
	.short 254, 0

scr_seq_00000091_000001A4:
	.short 63, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000091_000001B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000091_000001C3:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000091_000000F4
	wait_movement
	callstd 2031
	clearflag FLAG_UNK_1FD
	scrcmd_100 7
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 17
	gotoif ne, scr_seq_00000091_000001FE
	apply_movement 7, scr_seq_00000091_00000290
	goto scr_seq_00000091_00000221

scr_seq_00000091_000001FE:
	comparevartovalue VAR_TEMP_x4001, 18
	gotoif ne, scr_seq_00000091_00000219
	apply_movement 7, scr_seq_00000091_0000029C
	goto scr_seq_00000091_00000221

scr_seq_00000091_00000219:
	apply_movement 7, scr_seq_00000091_000002A8
scr_seq_00000091_00000221:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000091_000002B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_191 0
	msgbox 3
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 7, scr_seq_00000091_000002BC
	apply_movement 255, scr_seq_00000091_000002C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 7, scr_seq_00000091_000002D8
	wait_movement
	callstd 2032
	scrcmd_101 7
	setflag FLAG_UNK_1FD
	releaseall
	setvar VAR_UNK_40AC, 3
	end

scr_seq_00000091_0000028D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000091_00000290:
	.short 13, 9
	.short 15, 2
	.short 254, 0

scr_seq_00000091_0000029C:
	.short 13, 10
	.short 15, 2
	.short 254, 0

scr_seq_00000091_000002A8:
	.short 13, 11
	.short 15, 2
	.short 254, 0

scr_seq_00000091_000002B4:
	.short 14, 2
	.short 254, 0

scr_seq_00000091_000002BC:
	.short 19, 1
	.short 254, 0

scr_seq_00000091_000002C4:
	.short 71, 1
	.short 19, 1
	.short 55, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000091_000002D8:
	.short 40, 1
	.short 42, 1
	.short 63, 1
	.short 14, 2
	.short 12, 9
	.short 254, 0
scr_seq_00000091_000002F0:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000091_000000F4
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4000, 23
	gotoif ne, scr_seq_00000091_00000329
	apply_movement 255, scr_seq_00000091_0000040C
	goto scr_seq_00000091_00000331

scr_seq_00000091_00000329:
	apply_movement 255, scr_seq_00000091_0000041C
scr_seq_00000091_00000331:
	apply_movement 18, scr_seq_00000091_00000440
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_190 0
	msgbox 4
	closemsg
	apply_movement 18, scr_seq_00000091_0000044C
	wait_movement
	msgbox 5
	closemsg
	apply_movement 18, scr_seq_00000091_00000458
	wait_movement
	clearflag FLAG_UNK_1F4
	scrcmd_100 8
	setflag FLAG_UNK_280
	scrcmd_101 18
	apply_movement 8, scr_seq_00000091_0000047C
	wait_movement
	msgbox 6
	closemsg
	scrcmd_213 488, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000091_00000405
	msgbox 7
	closemsg
	apply_movement 8, scr_seq_00000091_000004A8
	wait_movement
	scrcmd_101 8
	setflag FLAG_UNK_1F4
	apply_movement 9, scr_seq_00000091_000004E4
	wait_movement
	msgbox 8
	closemsg
	msgbox 9
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 9, scr_seq_00000091_000004F4
	apply_movement 255, scr_seq_00000091_0000042C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 4
	scrcmd_101 9
	setflag FLAG_UNK_24A
	clearflag FLAG_UNK_24B
	releaseall
	end

scr_seq_00000091_00000405:
	scrcmd_219
	releaseall
	end

scr_seq_00000091_0000040B:
	.byte 0x00

scr_seq_00000091_0000040C:
	.short 12, 5
	.short 14, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000091_0000041C:
	.short 12, 5
	.short 14, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000091_0000042C:
	.short 63, 3
	.short 1, 1
	.short 63, 3
	.short 13, 3
	.short 254, 0

scr_seq_00000091_00000440:
	.short 63, 4
	.short 35, 1
	.short 254, 0

scr_seq_00000091_0000044C:
	.short 75, 1
	.short 63, 2
	.short 254, 0

scr_seq_00000091_00000458:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000091_0000047C:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0
	.byte 0x0f, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000091_000004A8:
	.short 71, 1
	.short 10, 1
	.short 72, 1
	.short 63, 1
	.short 17, 5
	.short 71, 1
	.short 52, 1
	.short 72, 1
	.short 17, 1
	.short 19, 3
	.short 17, 5
	.short 18, 7
	.short 16, 12
	.short 18, 4
	.short 254, 0

scr_seq_00000091_000004E4:
	.short 13, 3
	.short 15, 2
	.short 51, 2
	.short 254, 0

scr_seq_00000091_000004F4:
	.short 1, 1
	.short 17, 1
	.short 19, 2
	.short 17, 9
	.short 18, 7
	.short 16, 13
	.short 18, 5
	.short 254, 0
scr_seq_00000091_00000514:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif ge, scr_seq_00000091_0000055F
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 404
	gotoif lt, scr_seq_00000091_00000561
	checktrainerflag 222
	gotoif lt, scr_seq_00000091_00000561
	scrcmd_190 0
	msgbox 12
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement 10, scr_seq_00000091_0000056C
	apply_movement 11, scr_seq_00000091_0000056C
	wait_movement
	releaseall
scr_seq_00000091_0000055F:
	end

scr_seq_00000091_00000561:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000091_0000056C:
	.short 14, 3
	.short 254, 0
scr_seq_00000091_00000574:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_0D3
	end
	.balign 4, 0
