#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000019_0000000E ; 000
	scrdef scr_seq_00000019_00000074 ; 001
	scrdef scr_seq_00000019_000002A1 ; 002
	scrdef_end

scr_seq_00000019_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_116
	gotoif eq, scr_seq_00000019_00000053
	scrcmd_495 32780
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, scr_seq_00000019_00000048
	checkflag FLAG_UNK_108
	gotoif eq, scr_seq_00000019_0000005E
	checkflag FLAG_UNK_105
	gotoif eq, scr_seq_00000019_00000069
scr_seq_00000019_00000048:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000019_00000053:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000019_0000005E:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000019_00000069:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000019_00000074:
	scrcmd_609
	lockall
	scrcmd_386 16394
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000019_00000097
	apply_movement 0, scr_seq_00000019_000002D8
	goto scr_seq_00000019_0000009F

scr_seq_00000019_00000097:
	apply_movement 0, scr_seq_00000019_000002E0
scr_seq_00000019_0000009F:
	wait_movement
	scrcmd_105 32772, 32773
	comparevartovalue VAR_TEMP_x400A, 0
	callif eq, scr_seq_00000019_00000150
	comparevartovalue VAR_TEMP_x400A, 2
	callif eq, scr_seq_00000019_00000192
	checkflag FLAG_UNK_093
	gotoif eq, scr_seq_00000019_0000028E
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000019_000000F1
	apply_movement 255, scr_seq_00000019_00000344
	goto scr_seq_00000019_00000101

scr_seq_00000019_000000F1:
	apply_movement 0, scr_seq_00000019_00000354
	apply_movement 255, scr_seq_00000019_00000354
scr_seq_00000019_00000101:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_495 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000019_00000127
	msgbox 0
	goto scr_seq_00000019_0000012A

scr_seq_00000019_00000127:
	msgbox 1
scr_seq_00000019_0000012A:
	closemsg
	scrcmd_105 32772, 32773
	comparevartovalue VAR_TEMP_x400A, 0
	callif eq, scr_seq_00000019_000001EF
	comparevartovalue VAR_TEMP_x400A, 2
	callif eq, scr_seq_00000019_00000231
	releaseall
	end

scr_seq_00000019_00000150:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_00000019_0000016B
	apply_movement 0, scr_seq_00000019_000002EC
	goto scr_seq_00000019_0000018E

scr_seq_00000019_0000016B:
	comparevartovalue VAR_SPECIAL_x8004, 8
	gotoif ne, scr_seq_00000019_00000186
	apply_movement 0, scr_seq_00000019_000002FC
	goto scr_seq_00000019_0000018E

scr_seq_00000019_00000186:
	apply_movement 0, scr_seq_00000019_00000304
scr_seq_00000019_0000018E:
	wait_movement
	return

scr_seq_00000019_00000192:
	comparevartovalue VAR_SPECIAL_x8005, 7
	gotoif ne, scr_seq_00000019_000001AD
	apply_movement 0, scr_seq_00000019_00000314
	goto scr_seq_00000019_000001EB

scr_seq_00000019_000001AD:
	comparevartovalue VAR_SPECIAL_x8005, 8
	gotoif ne, scr_seq_00000019_000001C8
	apply_movement 0, scr_seq_00000019_00000324
	goto scr_seq_00000019_000001EB

scr_seq_00000019_000001C8:
	comparevartovalue VAR_SPECIAL_x8005, 9
	gotoif ne, scr_seq_00000019_000001E3
	apply_movement 0, scr_seq_00000019_0000032C
	goto scr_seq_00000019_000001EB

scr_seq_00000019_000001E3:
	apply_movement 0, scr_seq_00000019_00000338
scr_seq_00000019_000001EB:
	wait_movement
	return

scr_seq_00000019_000001EF:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_00000019_0000020A
	apply_movement 0, scr_seq_00000019_00000364
	goto scr_seq_00000019_0000022D

scr_seq_00000019_0000020A:
	comparevartovalue VAR_SPECIAL_x8004, 8
	gotoif ne, scr_seq_00000019_00000225
	apply_movement 0, scr_seq_00000019_00000378
	goto scr_seq_00000019_0000022D

scr_seq_00000019_00000225:
	apply_movement 0, scr_seq_00000019_00000384
scr_seq_00000019_0000022D:
	wait_movement
	return

scr_seq_00000019_00000231:
	comparevartovalue VAR_SPECIAL_x8005, 7
	gotoif ne, scr_seq_00000019_0000024C
	apply_movement 0, scr_seq_00000019_00000398
	goto scr_seq_00000019_0000028A

scr_seq_00000019_0000024C:
	comparevartovalue VAR_SPECIAL_x8005, 8
	gotoif ne, scr_seq_00000019_00000267
	apply_movement 0, scr_seq_00000019_000003A4
	goto scr_seq_00000019_0000028A

scr_seq_00000019_00000267:
	comparevartovalue VAR_SPECIAL_x8005, 9
	gotoif ne, scr_seq_00000019_00000282
	apply_movement 0, scr_seq_00000019_000003B0
	goto scr_seq_00000019_0000028A

scr_seq_00000019_00000282:
	apply_movement 0, scr_seq_00000019_000003C0
scr_seq_00000019_0000028A:
	wait_movement
	return

scr_seq_00000019_0000028E:
	msgbox 2
	closemsg
	scrcmd_774 0
	releaseall
	setvar VAR_UNK_40F3, 1
	end

scr_seq_00000019_000002A1:
	wait 30, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000019_000002C2
	apply_movement 0, scr_seq_00000019_000003D0
	goto scr_seq_00000019_000002CA

scr_seq_00000019_000002C2:
	apply_movement 0, scr_seq_00000019_000003E0
scr_seq_00000019_000002CA:
	wait_movement
	msgbox 3
	waitbutton
	closemsg
	end

scr_seq_00000019_000002D5:
	.byte 0x00, 0x00, 0x00

scr_seq_00000019_000002D8:
	.short 75, 1
	.short 254, 0

scr_seq_00000019_000002E0:
	.short 3, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000019_000002EC:
	.short 13, 2
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000019_000002FC:
	.short 13, 3
	.short 254, 0

scr_seq_00000019_00000304:
	.short 13, 2
	.short 15, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000019_00000314:
	.short 12, 1
	.short 15, 2
	.short 15, 1
	.short 254, 0

scr_seq_00000019_00000324:
	.short 15, 3
	.short 254, 0

scr_seq_00000019_0000032C:
	.short 13, 1
	.short 15, 3
	.short 254, 0

scr_seq_00000019_00000338:
	.short 13, 2
	.short 15, 3
	.short 254, 0

scr_seq_00000019_00000344:
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000019_00000354:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000019_00000364:
	.short 12, 1
	.short 15, 1
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000019_00000378:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000019_00000384:
	.short 12, 1
	.short 14, 1
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000019_00000398:
	.short 14, 4
	.short 13, 1
	.short 254, 0

scr_seq_00000019_000003A4:
	.short 14, 4
	.short 33, 1
	.short 254, 0

scr_seq_00000019_000003B0:
	.short 14, 4
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000019_000003C0:
	.short 14, 4
	.short 12, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000019_000003D0:
	.short 71, 1
	.short 4, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000019_000003E0:
	.short 71, 1
	.short 6, 1
	.short 72, 1
	.short 254, 0
	.balign 4, 0
