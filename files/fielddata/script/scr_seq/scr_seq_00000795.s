#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000795_00000006 ; 000
	scrdef_end

scr_seq_00000795_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000795_00000068
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000795_00000072
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000795_0000007C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000795_00000086
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000795_00000090
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000795_0000009A
	end

scr_seq_00000795_00000068:
	scrcmd_852 0, 6
	goto scr_seq_00000795_000000A4

scr_seq_00000795_00000072:
	scrcmd_852 0, 5
	goto scr_seq_00000795_000000A4

scr_seq_00000795_0000007C:
	scrcmd_852 0, 4
	goto scr_seq_00000795_000000A4

scr_seq_00000795_00000086:
	scrcmd_852 0, 3
	goto scr_seq_00000795_000000A4

scr_seq_00000795_00000090:
	scrcmd_852 0, 2
	goto scr_seq_00000795_000000A4

scr_seq_00000795_0000009A:
	scrcmd_852 0, 1
	goto scr_seq_00000795_000000A4

scr_seq_00000795_000000A4:
	scrcmd_242 20, 1, 16659, 16659
	msgbox 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 121, 255, 6
	scrcmd_751 120, 255, 0
	scrcmd_751 119, 255, 1
	scrcmd_751 118, 255, 2
	scrcmd_751 117, 255, 3
	scrcmd_751 116, 255, 4
	scrcmd_751 126, 255, 7
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000795_0000052D
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000795_00000467
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000795_000003A1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000795_000002DB
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000795_00000215
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000795_0000014F
	goto scr_seq_00000795_000006DE

scr_seq_00000795_0000014F:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 370, 2, 5, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_00000795_000006C7
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_00000795_000005FE
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_00000795_000005F3
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000795_000001A5
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000795_00000203

scr_seq_00000795_000001A5:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000795_000001BE
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000795_00000203

scr_seq_00000795_000001BE:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000795_000001D7
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000795_00000203

scr_seq_00000795_000001D7:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000795_000001F0
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000795_00000203

scr_seq_00000795_000001F0:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000795_00000203
	setvar VAR_SPECIAL_x8005, 5
scr_seq_00000795_00000203:
	call scr_seq_00000795_00000609
	setvar VAR_UNK_4113, 0
	goto scr_seq_00000795_00000627

scr_seq_00000795_00000215:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 371, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 1
	gotoif eq, scr_seq_00000795_000006C7
	comparevartovalue VAR_UNK_4113, 1
	callif gt, scr_seq_00000795_000005FE
	comparevartovalue VAR_UNK_4113, 1
	callif lt, scr_seq_00000795_000005F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000795_0000026B
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000795_000002C9

scr_seq_00000795_0000026B:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000795_00000284
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000795_000002C9

scr_seq_00000795_00000284:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000795_0000029D
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000795_000002C9

scr_seq_00000795_0000029D:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000795_000002B6
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000795_000002C9

scr_seq_00000795_000002B6:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000795_000002C9
	setvar VAR_SPECIAL_x8005, 4
scr_seq_00000795_000002C9:
	call scr_seq_00000795_00000609
	setvar VAR_UNK_4113, 1
	goto scr_seq_00000795_00000627

scr_seq_00000795_000002DB:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 372, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_00000795_000006C7
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_00000795_000005FE
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_00000795_000005F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000795_00000331
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000795_0000038F

scr_seq_00000795_00000331:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000795_0000034A
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000795_0000038F

scr_seq_00000795_0000034A:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000795_00000363
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000795_0000038F

scr_seq_00000795_00000363:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000795_0000037C
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000795_0000038F

scr_seq_00000795_0000037C:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000795_0000038F
	setvar VAR_SPECIAL_x8005, 3
scr_seq_00000795_0000038F:
	call scr_seq_00000795_00000609
	setvar VAR_UNK_4113, 2
	goto scr_seq_00000795_00000627

scr_seq_00000795_000003A1:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 373, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_00000795_000006C7
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_00000795_000005FE
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_00000795_000005F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000795_000003F7
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000795_00000455

scr_seq_00000795_000003F7:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000795_00000410
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000795_00000455

scr_seq_00000795_00000410:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000795_00000429
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000795_00000455

scr_seq_00000795_00000429:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000795_00000442
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000795_00000455

scr_seq_00000795_00000442:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000795_00000455
	setvar VAR_SPECIAL_x8005, 2
scr_seq_00000795_00000455:
	call scr_seq_00000795_00000609
	setvar VAR_UNK_4113, 3
	goto scr_seq_00000795_00000627

scr_seq_00000795_00000467:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 374, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 4
	gotoif eq, scr_seq_00000795_000006C7
	comparevartovalue VAR_UNK_4113, 4
	callif gt, scr_seq_00000795_000005FE
	comparevartovalue VAR_UNK_4113, 4
	callif lt, scr_seq_00000795_000005F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000795_000004BD
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000795_0000051B

scr_seq_00000795_000004BD:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000795_000004D6
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000795_0000051B

scr_seq_00000795_000004D6:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000795_000004EF
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000795_0000051B

scr_seq_00000795_000004EF:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000795_00000508
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000795_0000051B

scr_seq_00000795_00000508:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000795_0000051B
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000795_0000051B:
	call scr_seq_00000795_00000609
	setvar VAR_UNK_4113, 4
	goto scr_seq_00000795_00000627

scr_seq_00000795_0000052D:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 375, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 5
	gotoif eq, scr_seq_00000795_000006C7
	comparevartovalue VAR_UNK_4113, 5
	callif gt, scr_seq_00000795_000005FE
	comparevartovalue VAR_UNK_4113, 5
	callif lt, scr_seq_00000795_000005F3
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000795_00000583
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_00000795_000005E1

scr_seq_00000795_00000583:
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000795_0000059C
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000795_000005E1

scr_seq_00000795_0000059C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000795_000005B5
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000795_000005E1

scr_seq_00000795_000005B5:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000795_000005CE
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000795_000005E1

scr_seq_00000795_000005CE:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000795_000005E1
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000795_000005E1:
	call scr_seq_00000795_00000609
	setvar VAR_UNK_4113, 5
	goto scr_seq_00000795_00000627

scr_seq_00000795_000005F3:
	msgbox 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_00000795_000005FE:
	msgbox 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_00000795_00000609:
	setvar VAR_UNK_4113, 65535
	closemsg
	apply_movement 0, scr_seq_00000795_000006F8
	wait_movement
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_00000795_00000627:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000795_0000067D
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000795_00000688
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000795_00000693
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000795_0000069E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000795_000006A9
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000795_000006B4
	end

scr_seq_00000795_0000067D:
	msgbox 10
	goto scr_seq_00000795_000006BF

scr_seq_00000795_00000686:
	.byte 0x02, 0x00
scr_seq_00000795_00000688:
	msgbox 9
	goto scr_seq_00000795_000006BF

scr_seq_00000795_00000691:
	.byte 0x02, 0x00
scr_seq_00000795_00000693:
	msgbox 8
	goto scr_seq_00000795_000006BF

scr_seq_00000795_0000069C:
	.byte 0x02, 0x00
scr_seq_00000795_0000069E:
	msgbox 7
	goto scr_seq_00000795_000006BF

scr_seq_00000795_000006A7:
	.byte 0x02, 0x00
scr_seq_00000795_000006A9:
	msgbox 6
	goto scr_seq_00000795_000006BF

scr_seq_00000795_000006B2:
	.byte 0x02, 0x00
scr_seq_00000795_000006B4:
	msgbox 5
	goto scr_seq_00000795_000006BF

scr_seq_00000795_000006BD:
	.byte 0x02, 0x00
scr_seq_00000795_000006BF:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000795_000006C7:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000795_000006DE:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000795_000006F5:
	.byte 0x00, 0x00, 0x00

scr_seq_00000795_000006F8:
	.short 33, 1
	.short 254, 0
	.balign 4, 0
