#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000123_00000088 ; 000
	scrdef scr_seq_00000123_00000350 ; 001
	scrdef scr_seq_00000123_0000040B ; 002
	scrdef scr_seq_00000123_000005B9 ; 003
	scrdef scr_seq_00000123_000005BB ; 004
	scrdef scr_seq_00000123_000005CE ; 005
	scrdef scr_seq_00000123_000005E1 ; 006
	scrdef scr_seq_00000123_000005F4 ; 007
	scrdef scr_seq_00000123_00000607 ; 008
	scrdef scr_seq_00000123_0000061A ; 009
	scrdef scr_seq_00000123_0000062D ; 010
	scrdef scr_seq_00000123_00000640 ; 011
	scrdef scr_seq_00000123_00000653 ; 012
	scrdef scr_seq_00000123_00000666 ; 013
	scrdef scr_seq_00000123_000006D8 ; 014
	scrdef scr_seq_00000123_00000679 ; 015
	scrdef scr_seq_00000123_0000068C ; 016
	scrdef scr_seq_00000123_0000069F ; 017
	scrdef scr_seq_00000123_000006B2 ; 018
	scrdef scr_seq_00000123_000006C5 ; 019
	scrdef scr_seq_00000123_00000AE8 ; 020
	scrdef scr_seq_00000123_00000BB2 ; 021
	scrdef scr_seq_00000123_00000C57 ; 022
	scrdef scr_seq_00000123_00000062 ; 023
	scrdef_end

scr_seq_00000123_00000062:
	setflag FLAG_UNK_9D3
	end

scr_seq_00000123_00000068:
	.byte 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000123_00000070:
	.short 35, 1
	.short 254, 0

scr_seq_00000123_00000078:
	.short 33, 1
	.short 254, 0

scr_seq_00000123_00000080:
	.short 32, 1
	.short 254, 0
scr_seq_00000123_00000088:
	scrcmd_609
	lockall
	scrcmd_386 16394
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000123_000000AB
	apply_movement 255, scr_seq_00000123_00000230
	goto scr_seq_00000123_000000B3

scr_seq_00000123_000000AB:
	apply_movement 255, scr_seq_00000123_0000023C
scr_seq_00000123_000000B3:
	wait_movement
	clearflag FLAG_UNK_227
	scrcmd_100 1
	scrcmd_339 1, 23, 0, 20, 0
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000123_000000EC
	apply_movement 1, scr_seq_00000123_00000248
	apply_movement 255, scr_seq_00000123_00000260
	goto scr_seq_00000123_000000F4

scr_seq_00000123_000000EC:
	apply_movement 1, scr_seq_00000123_00000258
scr_seq_00000123_000000F4:
	wait_movement
	scrcmd_190 0
	msgbox 80
	closemsg
	wait 30, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000123_0000011F
	apply_movement 1, scr_seq_00000123_00000200
	goto scr_seq_00000123_00000127

scr_seq_00000123_0000011F:
	apply_movement 1, scr_seq_00000123_00000218
scr_seq_00000123_00000127:
	wait_movement
	msgbox 81
	closemsg
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000123_00000149
	apply_movement 1, scr_seq_00000123_00000270
	goto scr_seq_00000123_0000018E

scr_seq_00000123_00000149:
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif ne, scr_seq_00000123_0000016C
	apply_movement 1, scr_seq_00000123_000002AC
	apply_movement 255, scr_seq_00000123_00000070
	goto scr_seq_00000123_0000018E

scr_seq_00000123_0000016C:
	apply_movement 1, scr_seq_00000123_000002E8
	apply_movement 255, scr_seq_00000123_00000070
	wait_movement
	apply_movement 1, scr_seq_00000123_00000080
	apply_movement 255, scr_seq_00000123_00000078
scr_seq_00000123_0000018E:
	wait_movement
	msgbox 82
	closemsg
	msgbox 83
	scrcmd_078 1185
	scrcmd_079
	msgbox 84
	closemsg
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_00000123_000001BE
	apply_movement 1, scr_seq_00000123_00000328
	goto scr_seq_00000123_000001E1

scr_seq_00000123_000001BE:
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif ne, scr_seq_00000123_000001D9
	apply_movement 1, scr_seq_00000123_00000338
	goto scr_seq_00000123_000001E1

scr_seq_00000123_000001D9:
	apply_movement 1, scr_seq_00000123_00000348
scr_seq_00000123_000001E1:
	apply_movement 255, scr_seq_00000123_00000078
	wait_movement
	scrcmd_101 1
	setflag FLAG_UNK_227
	releaseall
	setvar VAR_UNK_40E2, 1
	end

scr_seq_00000123_000001FD:
	.byte 0x00, 0x00, 0x00

scr_seq_00000123_00000200:
	.short 71, 1
	.short 55, 1
	.short 72, 1
	.short 65, 2
	.short 18, 1
	.short 254, 0

scr_seq_00000123_00000218:
	.short 71, 1
	.short 53, 1
	.short 72, 1
	.short 65, 2
	.short 16, 1
	.short 254, 0

scr_seq_00000123_00000230:
	.short 75, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000123_0000023C:
	.short 75, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000123_00000248:
	.short 23, 1
	.short 76, 10
	.short 34, 1
	.short 254, 0

scr_seq_00000123_00000258:
	.short 76, 9
	.short 254, 0

scr_seq_00000123_00000260:
	.short 61, 1
	.short 63, 8
	.short 35, 1
	.short 254, 0

scr_seq_00000123_00000270:
	.short 33, 1
	.short 63, 1
	.short 32, 1
	.short 63, 1
	.short 19, 6
	.short 16, 6
	.short 14, 1
	.short 69, 1
	.short 65, 2
	.short 3, 1
	.short 70, 1
	.short 15, 1
	.short 17, 6
	.short 18, 6
	.short 254, 0

scr_seq_00000123_000002AC:
	.short 19, 7
	.short 33, 1
	.short 63, 1
	.short 32, 1
	.short 63, 1
	.short 16, 7
	.short 14, 1
	.short 69, 1
	.short 65, 2
	.short 3, 1
	.short 70, 1
	.short 15, 1
	.short 17, 6
	.short 18, 6
	.short 254, 0

scr_seq_00000123_000002E8:
	.short 19, 7
	.short 33, 1
	.short 63, 1
	.short 32, 1
	.short 63, 1
	.short 16, 7
	.short 14, 1
	.short 69, 1
	.short 65, 2
	.short 3, 1
	.short 70, 1
	.short 15, 1
	.short 17, 7
	.short 18, 7
	.short 32, 1
	.short 254, 0

scr_seq_00000123_00000328:
	.short 77, 2
	.short 78, 1
	.short 77, 8
	.short 254, 0

scr_seq_00000123_00000338:
	.short 77, 1
	.short 78, 1
	.short 77, 9
	.short 254, 0

scr_seq_00000123_00000348:
	.short 77, 9
	.short 254, 0
scr_seq_00000123_00000350:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_114
	gotoif lt, scr_seq_00000123_000003F1
	scrcmd_834 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000123_00000400
	msgbox 49
scr_seq_00000123_00000377:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 325, 255, 0
	scrcmd_751 324, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000123_000003C7
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000123_000003D7
	goto scr_seq_00000123_000003E4

scr_seq_00000123_000003C1:
	.byte 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_00000123_000003C7:
	scrcmd_054
	scrcmd_815 0
	scrcmd_771
	goto scr_seq_00000123_000003E4

scr_seq_00000123_000003D5:
	.byte 0x02, 0x00
scr_seq_00000123_000003D7:
	scrcmd_747
	msgbox 52
	goto scr_seq_00000123_00000377

scr_seq_00000123_000003E2:
	.byte 0x02, 0x00
scr_seq_00000123_000003E4:
	scrcmd_747
	msgbox 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_000003F1:
	msgbox 48
	setflag FLAG_UNK_114
	goto scr_seq_00000123_00000377

scr_seq_00000123_000003FE:
	.byte 0x02, 0x00
scr_seq_00000123_00000400:
	msgbox 50
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_0000040B:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000123_000005B7
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_835 32780
	comparevartovalue VAR_SPECIAL_x800C, 27
	gotoif eq, scr_seq_00000123_000005A9
	checkflag FLAG_UNK_115
	gotoif lt, scr_seq_00000123_00000529
	msgbox 54
scr_seq_00000123_00000443:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 325, 255, 0
	scrcmd_751 324, 255, 1
	scrcmd_751 323, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000123_00000493
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000123_000004E8
	goto scr_seq_00000123_0000051C

scr_seq_00000123_0000048D:
	.byte 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
scr_seq_00000123_00000493:
	scrcmd_054
	scrcmd_815 0
	scrcmd_772
	scrcmd_835 32773
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif eq, scr_seq_00000123_00000538
	comparevartovalue VAR_SPECIAL_x8005, 12
	gotoif eq, scr_seq_00000123_0000054B
	comparevartovalue VAR_SPECIAL_x8005, 18
	gotoif eq, scr_seq_00000123_0000055E
	comparevartovalue VAR_SPECIAL_x8005, 24
	gotoif eq, scr_seq_00000123_00000571
	comparevartovalue VAR_SPECIAL_x8005, 27
	gotoif eq, scr_seq_00000123_00000595
	goto scr_seq_00000123_0000051C

scr_seq_00000123_000004E6:
	.byte 0x02, 0x00
scr_seq_00000123_000004E8:
	scrcmd_747
	msgbox 55
	scrcmd_724 12, 32780
	comparevartovalue VAR_SPECIAL_x800C, 100
	gotoif lt, scr_seq_00000123_00000509
	msgbox 57
	goto scr_seq_00000123_00000511

scr_seq_00000123_00000509:
	scrcmd_198 0, 32780
	msgbox 56
scr_seq_00000123_00000511:
	msgbox 58
	goto scr_seq_00000123_00000443

scr_seq_00000123_0000051A:
	.byte 0x02, 0x00
scr_seq_00000123_0000051C:
	scrcmd_747
	msgbox 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000529:
	msgbox 53
	setflag FLAG_UNK_115
	goto scr_seq_00000123_00000443

scr_seq_00000123_00000536:
	.byte 0x02, 0x00
scr_seq_00000123_00000538:
	comparevartovalue VAR_UNK_4139, 0
	gotoif eq, scr_seq_00000123_00000584
	goto scr_seq_00000123_0000051C

scr_seq_00000123_0000054B:
	comparevartovalue VAR_UNK_4139, 1
	gotoif eq, scr_seq_00000123_00000584
	goto scr_seq_00000123_0000051C

scr_seq_00000123_0000055E:
	comparevartovalue VAR_UNK_4139, 2
	gotoif eq, scr_seq_00000123_00000584
	goto scr_seq_00000123_0000051C

scr_seq_00000123_00000571:
	comparevartovalue VAR_UNK_4139, 3
	gotoif eq, scr_seq_00000123_00000584
	goto scr_seq_00000123_0000051C

scr_seq_00000123_00000584:
	msgbox 61
	waitbutton
	closemsg
	releaseall
	addvar VAR_UNK_4139, 1
	end

scr_seq_00000123_00000595:
	scrcmd_190 0
	msgbox 62
	waitbutton
	closemsg
	releaseall
	addvar VAR_UNK_4139, 1
	end

scr_seq_00000123_000005A9:
	scrcmd_190 0
	msgbox 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_000005B7:
	end

scr_seq_00000123_000005B9:
	end

scr_seq_00000123_000005BB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 68
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_000005CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_000005E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 70
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_000005F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 71
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000607:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 72
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_0000061A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 73
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_0000062D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 74
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000640:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 75
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000653:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 76
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000666:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 77
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000679:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_0000068C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 64
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_0000069F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 65
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_000006B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_000006C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 67
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_000006D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_784 3, 0
	msgbox 85
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8000
	scrcmd_751 337, 255, 0
	scrcmd_751 338, 255, 1
	scrcmd_751 12, 255, 2
	scrcmd_752
	copyvar VAR_TEMP_x4005, VAR_SPECIAL_x8000
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_0000072E
	scrcmd_113 20, 2
	goto scr_seq_00000123_00000759

scr_seq_00000123_00000728:
	.byte 0x16, 0x00, 0x1a, 0x00, 0x00, 0x00
scr_seq_00000123_0000072E:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_00000748
	scrcmd_116 2, 20, 2
	goto scr_seq_00000123_00000A7F

scr_seq_00000123_00000748:
	scrcmd_747
	msgbox 91
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_00000123_00000759:
	msgbox 86
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8000
	scrcmd_751 209, 255, 0
	scrcmd_751 210, 255, 1
	scrcmd_751 211, 255, 2
	scrcmd_751 212, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000123_000007C0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000123_000007CC
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000123_000007D8
	scrcmd_747
	msgbox 91
	goto scr_seq_00000123_00000A5C

scr_seq_00000123_000007C0:
	setvar VAR_SPECIAL_x8001, 30
	goto scr_seq_00000123_000008F8

scr_seq_00000123_000007CC:
	setvar VAR_SPECIAL_x8001, 31
	goto scr_seq_00000123_000008F8

scr_seq_00000123_000007D8:
	setvar VAR_SPECIAL_x8001, 32
	goto scr_seq_00000123_000008F8

scr_seq_00000123_000007E4:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_000007FF
	hasenoughmoneyimmediate 32780, 200
	goto scr_seq_00000123_00000812

scr_seq_00000123_000007FF:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_00000812
	scrcmd_124 32780, 50
scr_seq_00000123_00000812:
	return

scr_seq_00000123_00000814:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_0000082F
	hasenoughmoneyimmediate 32780, 300
	goto scr_seq_00000123_00000842

scr_seq_00000123_0000082F:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_00000842
	scrcmd_124 32780, 80
scr_seq_00000123_00000842:
	return

scr_seq_00000123_00000844:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_0000085F
	hasenoughmoneyimmediate 32780, 350
	goto scr_seq_00000123_00000872

scr_seq_00000123_0000085F:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_00000872
	scrcmd_124 32780, 100
scr_seq_00000123_00000872:
	return

scr_seq_00000123_00000874:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_0000088D
	submoneyimmediate 200
	goto scr_seq_00000123_0000089E

scr_seq_00000123_0000088D:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_0000089E
	scrcmd_123 50
scr_seq_00000123_0000089E:
	return

scr_seq_00000123_000008A0:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_000008B9
	submoneyimmediate 300
	goto scr_seq_00000123_000008CA

scr_seq_00000123_000008B9:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_000008CA
	scrcmd_123 80
scr_seq_00000123_000008CA:
	return

scr_seq_00000123_000008CC:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_000008E5
	submoneyimmediate 350
	goto scr_seq_00000123_000008F6

scr_seq_00000123_000008E5:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_000008F6
	scrcmd_123 100
scr_seq_00000123_000008F6:
	return

scr_seq_00000123_000008F8:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_00000123_000007E4
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_00000123_00000814
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_00000123_00000844
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000123_00000A07
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000123_00000A35
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_00000123_00000874
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_00000123_000008A0
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_00000123_000008CC
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_0000097D
	scrcmd_115
	goto scr_seq_00000123_0000098D

scr_seq_00000123_0000097D:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_0000098D
	scrcmd_118 2
scr_seq_00000123_0000098D:
	scrcmd_194 0, 32769
	play_se SEQ_SE_DP_JIHANKI
	scrcmd_194 0, 32769
	msgbox 87
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	scrcmd_380 32780, 64
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000123_000009E6
	play_se SEQ_SE_DP_JIHANKI
	scrcmd_194 0, 32769
	msgbox 88
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000123_00000A35
	callstd 2033
scr_seq_00000123_000009E6:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_000009FF
	goto scr_seq_00000123_00000759

scr_seq_00000123_000009F9:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000123_000009FF:
	goto scr_seq_00000123_00000A7F

scr_seq_00000123_00000A05:
	.byte 0x02, 0x00
scr_seq_00000123_00000A07:
	scrcmd_747
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_00000A1F
	msgbox 89
	goto scr_seq_00000123_00000A2F

scr_seq_00000123_00000A1F:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000123_00000A2F
	msgbox 90
scr_seq_00000123_00000A2F:
	goto scr_seq_00000123_00000A5C

scr_seq_00000123_00000A35:
	scrcmd_747
	callstd 2009
	closemsg
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_00000A52
	scrcmd_114
	goto scr_seq_00000123_00000A54

scr_seq_00000123_00000A52:
	scrcmd_117
scr_seq_00000123_00000A54:
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_00000123_00000A5C:
	waitbutton
	closemsg
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000123_00000A75
	scrcmd_114
	goto scr_seq_00000123_00000A77

scr_seq_00000123_00000A75:
	scrcmd_117
scr_seq_00000123_00000A77:
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_00000123_00000A7F:
	msgbox 86
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8000
	scrcmd_751 339, 255, 0
	scrcmd_751 340, 255, 1
	scrcmd_751 341, 255, 2
	scrcmd_751 212, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000123_000007C0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000123_000007CC
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000123_000007D8
	scrcmd_747
	msgbox 91
	goto scr_seq_00000123_00000A5C

scr_seq_00000123_00000AE6:
	.byte 0x02, 0x00
scr_seq_00000123_00000AE8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 92
scr_seq_00000123_00000AF3:
	msgbox 93
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 94, 255, 0
	scrcmd_751 95, 255, 1
	scrcmd_751 96, 255, 2
	scrcmd_751 97, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000123_00000B57
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000123_00000B65
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000123_00000B73
	goto scr_seq_00000123_00000BA5

scr_seq_00000123_00000B55:
	.byte 0x02, 0x00
scr_seq_00000123_00000B57:
	setvar VAR_TEMP_x4007, 0
	goto scr_seq_00000123_00000B81

scr_seq_00000123_00000B63:
	.byte 0x02, 0x00
scr_seq_00000123_00000B65:
	setvar VAR_TEMP_x4007, 1
	goto scr_seq_00000123_00000B81

scr_seq_00000123_00000B71:
	.byte 0x02, 0x00
scr_seq_00000123_00000B73:
	setvar VAR_TEMP_x4007, 2
	goto scr_seq_00000123_00000B81

scr_seq_00000123_00000B7F:
	.byte 0x02
	.byte 0x00
scr_seq_00000123_00000B81:
	msgbox 98
	wait 4, VAR_SPECIAL_x800C
	msgbox 99
	wait 4, VAR_SPECIAL_x800C
	closemsg
	play_se SEQ_SE_DP_DECIDE
	scrcmd_743 16391
	goto scr_seq_00000123_00000AF3

scr_seq_00000123_00000BA3:
	.byte 0x02, 0x00
scr_seq_00000123_00000BA5:
	scrcmd_747
	msgbox 101
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000BB2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_152
	gotoif eq, scr_seq_00000123_00000C4C
	msgbox 103
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000123_00000BFE
	msgbox 105
	scrcmd_724 14, 16384
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif ge, scr_seq_00000123_00000C09
	msgbox 106
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000BFE:
	msgbox 104
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000C09:
	msgbox 107
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000123_00000C42
	callstd 2033
	scrcmd_725 0, 100
	setflag FLAG_UNK_152
	goto scr_seq_00000123_00000C4C

scr_seq_00000123_00000C40:
	.byte 0x02, 0x00
scr_seq_00000123_00000C42:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000123_00000C4C:
	msgbox 108
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000C57:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_153
	gotoif eq, scr_seq_00000123_00000CF0
	scrcmd_724 15, 16384
	comparevartovalue VAR_TEMP_x4000, 500
	gotoif ge, scr_seq_00000123_00000C86
	msgbox 109
	goto scr_seq_00000123_00000C9F

scr_seq_00000123_00000C86:
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif ge, scr_seq_00000123_00000C9C
	msgbox 111
	goto scr_seq_00000123_00000C9F

scr_seq_00000123_00000C9C:
	msgbox 112
scr_seq_00000123_00000C9F:
	comparevartovalue VAR_TEMP_x4000, 2001
	gotoif ge, scr_seq_00000123_00000CB7
	msgbox 110
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000123_00000CB7:
	msgbox 113
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000123_00000C42
	callstd 2033
	scrcmd_725 0, 100
	setflag FLAG_UNK_153
	goto scr_seq_00000123_00000CF0

scr_seq_00000123_00000CEE:
	.byte 0x02, 0x00
scr_seq_00000123_00000CF0:
	msgbox 114
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
