#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000151_0000009C ; 000
	scrdef scr_seq_00000151_000000B3 ; 001
	scrdef scr_seq_00000151_000000CA ; 002
	scrdef scr_seq_00000151_000000CC ; 003
	scrdef scr_seq_00000151_000000CE ; 004
	scrdef scr_seq_00000151_000000FD ; 005
	scrdef scr_seq_00000151_00000307 ; 006
	scrdef scr_seq_00000151_00000340 ; 007
	scrdef scr_seq_00000151_0000054C ; 008
	scrdef scr_seq_00000151_0000055F ; 009
	scrdef scr_seq_00000151_00000594 ; 010
	scrdef scr_seq_00000151_000005A7 ; 011
	scrdef scr_seq_00000151_000005DC ; 012
	scrdef scr_seq_00000151_000005EF ; 013
	scrdef scr_seq_00000151_00000624 ; 014
	scrdef scr_seq_00000151_00000637 ; 015
	scrdef scr_seq_00000151_0000066C ; 016
	scrdef scr_seq_00000151_0000067F ; 017
	scrdef scr_seq_00000151_000006B4 ; 018
	scrdef scr_seq_00000151_000006C7 ; 019
	scrdef scr_seq_00000151_000006FC ; 020
	scrdef scr_seq_00000151_0000070F ; 021
	scrdef scr_seq_00000151_00000744 ; 022
	scrdef scr_seq_00000151_00000757 ; 023
	scrdef scr_seq_00000151_0000078C ; 024
	scrdef scr_seq_00000151_0000079F ; 025
	scrdef scr_seq_00000151_000007D4 ; 026
	scrdef scr_seq_00000151_000007E7 ; 027
	scrdef scr_seq_00000151_0000081C ; 028
	scrdef_end

scr_seq_00000151_00000076:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 96, 0, 46, 50, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	return

scr_seq_00000151_0000009C:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	msgbox 0
	closemsg
	call scr_seq_00000151_00000076
	releaseall
	end

scr_seq_00000151_000000B3:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	msgbox 1
	closemsg
	call scr_seq_00000151_00000076
	releaseall
	end

scr_seq_00000151_000000CA:
	end

scr_seq_00000151_000000CC:
	end

scr_seq_00000151_000000CE:
	scrcmd_609
	lockall
	scrcmd_789 0
	msgbox 3
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000151_000000F9
	call scr_seq_00000151_00000076
	releaseall
	end

scr_seq_00000151_000000F9:
	releaseall
	end

scr_seq_00000151_000000FD:
	comparevartovalue VAR_UNK_4058, 0
	gotoif eq, scr_seq_00000151_00000114
	call scr_seq_00000151_000002BC
	restartcurrentscript
	end

scr_seq_00000151_00000114:
	checkflag FLAG_UNK_AA7
	gotoif eq, scr_seq_00000151_000002A6
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000151_00000139
	msgbox 4
	goto scr_seq_00000151_0000016E

scr_seq_00000151_00000139:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000151_0000014F
	msgbox 5
	goto scr_seq_00000151_0000016E

scr_seq_00000151_0000014F:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000151_00000165
	msgbox 6
	goto scr_seq_00000151_0000016E

scr_seq_00000151_00000165:
	msgbox 7
	goto scr_seq_00000151_00000260

scr_seq_00000151_0000016E:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000151_0000018E
	msgbox 17
	goto scr_seq_00000151_00000260

scr_seq_00000151_0000018C:
	.byte 0x02, 0x00
scr_seq_00000151_0000018E:
	scrcmd_507 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000151_000001B0
	scrcmd_332 32772
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_00000151_000002B1
scr_seq_00000151_000001B0:
	scrcmd_357 32773, 6
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ne, scr_seq_00000151_000001D4
	scrcmd_332 32772
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_00000151_0000021A
scr_seq_00000151_000001D4:
	scrcmd_529 32780
	scrcmd_199 0, VAR_SPECIAL_x800C
	msgbox 10
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000151_00000200
	msgbox 28
	goto scr_seq_00000151_00000260

scr_seq_00000151_000001FE:
	.byte 0x02, 0x00
scr_seq_00000151_00000200:
	scrcmd_084 0, 10
	scrcmd_080 1090
	scrcmd_190 0
	msgbox 13
	setflag FLAG_UNK_15F
	goto scr_seq_00000151_00000224

scr_seq_00000151_0000021A:
	scrcmd_084 0, 10
	scrcmd_080 1090
scr_seq_00000151_00000224:
	scrcmd_190 0
	msgbox 14
	msgbox 15
	setflag FLAG_UNK_993
	setflag FLAG_UNK_24E
	setvar VAR_UNK_4118, 1
	setvar VAR_UNK_40F7, 1
	scrcmd_784 1, 0
	scrcmd_785 0, 16384
	call scr_seq_00000151_00000268
	scrcmd_784 1, 1
	setflag FLAG_UNK_996
	goto scr_seq_00000151_00000262

scr_seq_00000151_0000025E:
	.byte 0x02, 0x00
scr_seq_00000151_00000260:
	waitbutton
scr_seq_00000151_00000262:
	closemsg
	restartcurrentscript
	end

scr_seq_00000151_00000268:
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 627
scr_seq_00000151_00000274:
	scrcmd_790 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000151_0000028B
	setflagvar VAR_SPECIAL_x8005
scr_seq_00000151_0000028B:
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	comparevartovalue VAR_SPECIAL_x8004, 10
	gotoif lt, scr_seq_00000151_00000274
	return

scr_seq_00000151_000002A6:
	msgbox 18
	goto scr_seq_00000151_00000260

scr_seq_00000151_000002AF:
	.byte 0x02
	.byte 0x00
scr_seq_00000151_000002B1:
	msgbox 16
	goto scr_seq_00000151_00000260

scr_seq_00000151_000002BA:
	.byte 0x02, 0x00
scr_seq_00000151_000002BC:
	scrcmd_190 0
	msgbox 20
	hasspaceforitem VAR_UNK_4058, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000151_000002F3
	copyvar VAR_SPECIAL_x8004, VAR_UNK_4058
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	setvar VAR_UNK_4058, 0
	goto scr_seq_00000151_000002F8

scr_seq_00000151_000002F3:
	msgbox 21
	waitbutton
scr_seq_00000151_000002F8:
	closemsg
	return

scr_seq_00000151_000002FC:
	.byte 0x2d, 0x00, 0x12, 0x16
	.byte 0x00, 0x5b, 0xff, 0xff, 0xff, 0x02, 0x00
scr_seq_00000151_00000307:
	scrcmd_789 0
	msgbox 23
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000151_0000032B
	msgbox 26
	closemsg
	restartcurrentscript
	end

scr_seq_00000151_0000032B:
	msgbox 27
	closemsg
	setvar VAR_UNK_4118, 2
	call scr_seq_00000151_00000076
	restartcurrentscript
	end

scr_seq_00000151_00000340:
	scrcmd_609
	lockall
	setvar VAR_UNK_4118, 0
	setvar VAR_UNK_40F7, 0
	scrcmd_784 1, 0
	scrcmd_787 16384, 16385, 16386
	scrcmd_105 32772, 32773
	scrcmd_102 32772, 32773
	apply_movement 241, scr_seq_00000151_0000053C
	wait_movement
	msgbox 29
	scrcmd_786 2
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000151_0000038E
	msgbox 30
	goto scr_seq_00000151_00000391

scr_seq_00000151_0000038E:
	msgbox 31
scr_seq_00000151_00000391:
	scrcmd_078 1203
	scrcmd_079
	msgbox 32
	scrcmd_786 1
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000151_000003B3
	msgbox 33
	goto scr_seq_00000151_000003B6

scr_seq_00000151_000003B3:
	msgbox 34
scr_seq_00000151_000003B6:
	scrcmd_078 1202
	scrcmd_079
	msgbox 32
	scrcmd_786 0
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000151_000003DC
	setflag FLAG_UNK_141
	msgbox 35
	goto scr_seq_00000151_000003E3

scr_seq_00000151_000003DC:
	clearflag FLAG_UNK_141
	msgbox 36
scr_seq_00000151_000003E3:
	scrcmd_078 1201
	scrcmd_079
	msgbox 32
	scrcmd_190 0
	scrcmd_194 3, 16385
	setvar VAR_SPECIAL_x8004, 37
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x4000
	scrcmd_046 VAR_SPECIAL_x8004
	copyvar VAR_SPECIAL_x8004, VAR_TEMP_x4001
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000151_0000042F
	callstd 2033
	goto scr_seq_00000151_0000043B

scr_seq_00000151_0000042F:
	scrcmd_190 0
	msgbox 45
	copyvar VAR_UNK_4058, VAR_TEMP_x4001
scr_seq_00000151_0000043B:
	checkflag FLAG_UNK_15F
	callif eq, scr_seq_00000151_000004F6
	msgbox 42
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000151_0000045E
	closemsg
	goto scr_seq_00000151_000004B5

scr_seq_00000151_0000045E:
	scrcmd_202 1, 16386, 2, 1
	msgbox 43
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000151_0000049E
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_173 255, 32780
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000151_0000049E:
	scrcmd_788 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000151_000004B5
	msgbox 46
	closemsg
scr_seq_00000151_000004B5:
	apply_movement 241, scr_seq_00000151_00000544
	wait_movement
	scrcmd_084 0, 10
	scrcmd_080 1075
	scrcmd_103
	call scr_seq_00000151_000004FD
	setflag FLAG_UNK_AA7
	clearflag FLAG_UNK_993
	clearflag FLAG_UNK_24E
	clearflag FLAG_UNK_15F
	scrcmd_785 1, 0
	scrcmd_784 1, 1
	scrcmd_084 0, 30
	scrcmd_082
	releaseall
	end

scr_seq_00000151_000004F6:
	msgbox 47
	closemsg
	return

scr_seq_00000151_000004FD:
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 10
	setvar VAR_SPECIAL_x8006, 627
scr_seq_00000151_0000050F:
	scrcmd_109 32773, 2
	clearflagvar VAR_SPECIAL_x8006
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	addvar VAR_SPECIAL_x8006, 1
	comparevartovalue VAR_SPECIAL_x8004, 10
	gotoif lt, scr_seq_00000151_0000050F
	return

scr_seq_00000151_0000053A:
	.byte 0x00, 0x00

scr_seq_00000151_0000053C:
	.short 15, 5
	.short 254, 0

scr_seq_00000151_00000544:
	.short 14, 5
	.short 254, 0
scr_seq_00000151_0000054C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_0000055F:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_00000581
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 49
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_00000592

scr_seq_00000151_00000581:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 50
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_00000592:
	end

scr_seq_00000151_00000594:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_000005A7:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_000005C9
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 52
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_000005DA

scr_seq_00000151_000005C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 53
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_000005DA:
	end

scr_seq_00000151_000005DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_000005EF:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_00000611
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 55
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_00000622

scr_seq_00000151_00000611:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 56
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_00000622:
	end

scr_seq_00000151_00000624:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_00000637:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_00000659
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 58
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_0000066A

scr_seq_00000151_00000659:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 59
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_0000066A:
	end

scr_seq_00000151_0000066C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_0000067F:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_000006A1
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 61
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_000006B2

scr_seq_00000151_000006A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 62
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_000006B2:
	end

scr_seq_00000151_000006B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_000006C7:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_000006E9
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 64
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_000006FA

scr_seq_00000151_000006E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 65
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_000006FA:
	end

scr_seq_00000151_000006FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_0000070F:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_00000731
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 67
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_00000742

scr_seq_00000151_00000731:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 68
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_00000742:
	end

scr_seq_00000151_00000744:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_00000757:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_00000779
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 70
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_0000078A

scr_seq_00000151_00000779:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 71
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_0000078A:
	end

scr_seq_00000151_0000078C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 72
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_0000079F:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_000007C1
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 73
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_000007D2

scr_seq_00000151_000007C1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 74
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_000007D2:
	end

scr_seq_00000151_000007D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 75
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000151_000007E7:
	checkflag FLAG_UNK_141
	gotoif eq, scr_seq_00000151_00000809
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 76
	waitbutton
	closemsg
	releaseall
	goto scr_seq_00000151_0000081A

scr_seq_00000151_00000809:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 77
	waitbutton
	closemsg
	releaseall
scr_seq_00000151_0000081A:
	end

scr_seq_00000151_0000081C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4058, 0
	gotoif eq, scr_seq_00000151_0000083D
	call scr_seq_00000151_000002BC
	goto scr_seq_00000151_00000844

scr_seq_00000151_0000083D:
	msgbox 22
	waitbutton
	closemsg
scr_seq_00000151_00000844:
	releaseall
	end
	.balign 4, 0
