#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000905_00000006 ; 000
	scrdef_end

scr_seq_00000905_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_241 16659
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000905_00000075
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000905_0000007F
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000905_00000089
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000905_00000093
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000905_0000009D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000905_000000A7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000905_000000B1
	end

scr_seq_00000905_00000075:
	scrcmd_852 0, 6
	goto scr_seq_00000905_000000BC

scr_seq_00000905_0000007F:
	scrcmd_852 0, 5
	goto scr_seq_00000905_000000BC

scr_seq_00000905_00000089:
	scrcmd_852 0, 4
	goto scr_seq_00000905_000000BC

scr_seq_00000905_00000093:
	scrcmd_852 0, 3
	goto scr_seq_00000905_000000BC

scr_seq_00000905_0000009D:
	scrcmd_852 0, 2
	goto scr_seq_00000905_000000BC

scr_seq_00000905_000000A7:
	scrcmd_852 0, 1
	goto scr_seq_00000905_000000BC

scr_seq_00000905_000000B1:
	scrcmd_198 0, 0
	goto scr_seq_00000905_000000BC

scr_seq_00000905_000000BC:
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
	scrcmd_751 122, 255, 5
	scrcmd_751 126, 255, 7
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000905_000005D7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000905_000004F8
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000905_00000419
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000905_0000033A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000905_0000025B
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000905_0000017C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000905_000006B6
	goto scr_seq_00000905_00000898

scr_seq_00000905_0000017C:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 191, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 1
	gotoif eq, scr_seq_00000905_00000881
	comparevartovalue VAR_UNK_4113, 1
	callif gt, scr_seq_00000905_000007A0
	comparevartovalue VAR_UNK_4113, 1
	callif lt, scr_seq_00000905_00000795
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000905_000001D2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_00000249

scr_seq_00000905_000001D2:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000905_000001EB
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_00000249

scr_seq_00000905_000001EB:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000905_00000204
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000905_00000249

scr_seq_00000905_00000204:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000905_0000021D
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000905_00000249

scr_seq_00000905_0000021D:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_00000905_00000236
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_00000905_00000249

scr_seq_00000905_00000236:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000905_00000249
	setvar VAR_SPECIAL_x8005, 1
scr_seq_00000905_00000249:
	call scr_seq_00000905_000007AB
	setvar VAR_UNK_4113, 1
	goto scr_seq_00000905_000007C9

scr_seq_00000905_0000025B:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 192, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 2
	gotoif eq, scr_seq_00000905_00000881
	comparevartovalue VAR_UNK_4113, 2
	callif gt, scr_seq_00000905_000007A0
	comparevartovalue VAR_UNK_4113, 2
	callif lt, scr_seq_00000905_00000795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000905_000002B1
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_00000328

scr_seq_00000905_000002B1:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000905_000002CA
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_00000328

scr_seq_00000905_000002CA:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000905_000002E3
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_00000328

scr_seq_00000905_000002E3:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000905_000002FC
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000905_00000328

scr_seq_00000905_000002FC:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_00000905_00000315
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000905_00000328

scr_seq_00000905_00000315:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000905_00000328
	setvar VAR_SPECIAL_x8005, 2
scr_seq_00000905_00000328:
	call scr_seq_00000905_000007AB
	setvar VAR_UNK_4113, 2
	goto scr_seq_00000905_000007C9

scr_seq_00000905_0000033A:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 193, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 3
	gotoif eq, scr_seq_00000905_00000881
	comparevartovalue VAR_UNK_4113, 3
	callif gt, scr_seq_00000905_000007A0
	comparevartovalue VAR_UNK_4113, 3
	callif lt, scr_seq_00000905_00000795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000905_00000390
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_00000407

scr_seq_00000905_00000390:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000905_000003A9
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_00000407

scr_seq_00000905_000003A9:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000905_000003C2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_00000407

scr_seq_00000905_000003C2:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000905_000003DB
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_00000407

scr_seq_00000905_000003DB:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_00000905_000003F4
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000905_00000407

scr_seq_00000905_000003F4:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000905_00000407
	setvar VAR_SPECIAL_x8005, 3
scr_seq_00000905_00000407:
	call scr_seq_00000905_000007AB
	setvar VAR_UNK_4113, 3
	goto scr_seq_00000905_000007C9

scr_seq_00000905_00000419:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 194, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 4
	gotoif eq, scr_seq_00000905_00000881
	comparevartovalue VAR_UNK_4113, 4
	callif gt, scr_seq_00000905_000007A0
	comparevartovalue VAR_UNK_4113, 4
	callif lt, scr_seq_00000905_00000795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000905_0000046F
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000905_000004E6

scr_seq_00000905_0000046F:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000905_00000488
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_000004E6

scr_seq_00000905_00000488:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000905_000004A1
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_000004E6

scr_seq_00000905_000004A1:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000905_000004BA
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_000004E6

scr_seq_00000905_000004BA:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_00000905_000004D3
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_000004E6

scr_seq_00000905_000004D3:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000905_000004E6
	setvar VAR_SPECIAL_x8005, 4
scr_seq_00000905_000004E6:
	call scr_seq_00000905_000007AB
	setvar VAR_UNK_4113, 4
	goto scr_seq_00000905_000007C9

scr_seq_00000905_000004F8:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 195, 2, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 5
	gotoif eq, scr_seq_00000905_00000881
	comparevartovalue VAR_UNK_4113, 5
	callif gt, scr_seq_00000905_000007A0
	comparevartovalue VAR_UNK_4113, 5
	callif lt, scr_seq_00000905_00000795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000905_0000054E
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000905_000005C5

scr_seq_00000905_0000054E:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000905_00000567
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000905_000005C5

scr_seq_00000905_00000567:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000905_00000580
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_000005C5

scr_seq_00000905_00000580:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000905_00000599
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_000005C5

scr_seq_00000905_00000599:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_00000905_000005B2
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_000005C5

scr_seq_00000905_000005B2:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000905_000005C5
	setvar VAR_SPECIAL_x8005, 5
scr_seq_00000905_000005C5:
	call scr_seq_00000905_000007AB
	setvar VAR_UNK_4113, 5
	goto scr_seq_00000905_000007C9

scr_seq_00000905_000005D7:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 196, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 6
	gotoif eq, scr_seq_00000905_00000881
	comparevartovalue VAR_UNK_4113, 6
	callif gt, scr_seq_00000905_000007A0
	comparevartovalue VAR_UNK_4113, 6
	callif lt, scr_seq_00000905_00000795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000905_0000062D
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_00000905_000006A4

scr_seq_00000905_0000062D:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000905_00000646
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000905_000006A4

scr_seq_00000905_00000646:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000905_0000065F
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000905_000006A4

scr_seq_00000905_0000065F:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000905_00000678
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_000006A4

scr_seq_00000905_00000678:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000905_00000691
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_000006A4

scr_seq_00000905_00000691:
	comparevartovalue VAR_UNK_4113, 0
	gotoif ne, scr_seq_00000905_000006A4
	setvar VAR_SPECIAL_x8005, 6
scr_seq_00000905_000006A4:
	call scr_seq_00000905_000007AB
	setvar VAR_UNK_4113, 6
	goto scr_seq_00000905_000007C9

scr_seq_00000905_000006B6:
	wait 1, VAR_SPECIAL_x800C
	scrcmd_241 16659
	scrcmd_240 200, 1, 19, 3, 1
	comparevartovalue VAR_UNK_4113, 0
	gotoif eq, scr_seq_00000905_00000881
	comparevartovalue VAR_UNK_4113, 0
	callif gt, scr_seq_00000905_000007A0
	comparevartovalue VAR_UNK_4113, 0
	callif lt, scr_seq_00000905_00000795
	comparevartovalue VAR_UNK_4113, 1
	gotoif ne, scr_seq_00000905_0000070C
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000905_00000783

scr_seq_00000905_0000070C:
	comparevartovalue VAR_UNK_4113, 2
	gotoif ne, scr_seq_00000905_00000725
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_00000905_00000783

scr_seq_00000905_00000725:
	comparevartovalue VAR_UNK_4113, 3
	gotoif ne, scr_seq_00000905_0000073E
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000905_00000783

scr_seq_00000905_0000073E:
	comparevartovalue VAR_UNK_4113, 4
	gotoif ne, scr_seq_00000905_00000757
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000905_00000783

scr_seq_00000905_00000757:
	comparevartovalue VAR_UNK_4113, 5
	gotoif ne, scr_seq_00000905_00000770
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_00000905_00000783

scr_seq_00000905_00000770:
	comparevartovalue VAR_UNK_4113, 6
	gotoif ne, scr_seq_00000905_00000783
	setvar VAR_SPECIAL_x8005, 6
scr_seq_00000905_00000783:
	call scr_seq_00000905_000007AB
	setvar VAR_UNK_4113, 0
	goto scr_seq_00000905_000007C9

scr_seq_00000905_00000795:
	msgbox 2
	setvar VAR_SPECIAL_x8004, 0
	return

scr_seq_00000905_000007A0:
	msgbox 3
	setvar VAR_SPECIAL_x8004, 1
	return

scr_seq_00000905_000007AB:
	setvar VAR_UNK_4113, 65535
	closemsg
	apply_movement 0, scr_seq_00000905_000008B0
	wait_movement
	wait_se SEQ_SE_DP_SELECT
	scrcmd_488 32772, 32773
	return

scr_seq_00000905_000007C9:
	copyvar VAR_SPECIAL_x8008, VAR_UNK_4113
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000905_0000082C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000905_00000837
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000905_00000842
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000905_0000084D
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000905_00000858
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000905_00000863
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000905_0000086E
	end

scr_seq_00000905_0000082C:
	msgbox 10
	goto scr_seq_00000905_00000879

scr_seq_00000905_00000835:
	.byte 0x02, 0x00
scr_seq_00000905_00000837:
	msgbox 9
	goto scr_seq_00000905_00000879

scr_seq_00000905_00000840:
	.byte 0x02, 0x00
scr_seq_00000905_00000842:
	msgbox 8
	goto scr_seq_00000905_00000879

scr_seq_00000905_0000084B:
	.byte 0x02, 0x00
scr_seq_00000905_0000084D:
	msgbox 7
	goto scr_seq_00000905_00000879

scr_seq_00000905_00000856:
	.byte 0x02, 0x00
scr_seq_00000905_00000858:
	msgbox 6
	goto scr_seq_00000905_00000879

scr_seq_00000905_00000861:
	.byte 0x02, 0x00
scr_seq_00000905_00000863:
	msgbox 5
	goto scr_seq_00000905_00000879

scr_seq_00000905_0000086C:
	.byte 0x02, 0x00
scr_seq_00000905_0000086E:
	msgbox 11
	goto scr_seq_00000905_00000879

scr_seq_00000905_00000877:
	.byte 0x02, 0x00
scr_seq_00000905_00000879:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000905_00000881:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000905_00000898:
	setvar VAR_UNK_4113, 65535
	wait 1, VAR_SPECIAL_x800C
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000905_000008AF:
	.byte 0x00

scr_seq_00000905_000008B0:
	.short 33, 1
	.short 254, 0
	.balign 4, 0
