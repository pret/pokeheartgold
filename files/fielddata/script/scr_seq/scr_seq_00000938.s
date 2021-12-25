#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000938_0000004E ; 000
	scrdef scr_seq_00000938_000003C3 ; 001
	scrdef scr_seq_00000938_000001B3 ; 002
	scrdef scr_seq_00000938_0000047C ; 003
	scrdef scr_seq_00000938_0000054C ; 004
	scrdef scr_seq_00000938_00000275 ; 005
	scrdef scr_seq_00000938_00000577 ; 006
	scrdef scr_seq_00000938_000006FB ; 007
	scrdef scr_seq_00000938_00000723 ; 008
	scrdef scr_seq_00000938_00000736 ; 009
	scrdef scr_seq_00000938_0000075C ; 010
	scrdef scr_seq_00000938_0000076F ; 011
	scrdef scr_seq_00000938_00000782 ; 012
	scrdef scr_seq_00000938_00000795 ; 013
	scrdef scr_seq_00000938_000005CD ; 014
	scrdef scr_seq_00000938_000005E7 ; 015
	scrdef scr_seq_00000938_00000601 ; 016
	scrdef scr_seq_00000938_000001DA ; 017
	scrdef scr_seq_00000938_000006E2 ; 018
	scrdef_end

scr_seq_00000938_0000004E:
	checkflag FLAG_UNK_0C9
	gotoif eq, scr_seq_00000938_0000007F
	setflag FLAG_UNK_1FC
	setflag FLAG_UNK_1FE
	setflag FLAG_UNK_011
	setflag FLAG_UNK_013
	setflag FLAG_UNK_014
	setflag FLAG_UNK_015
	setflag FLAG_UNK_289
	setflag FLAG_UNK_28B
	setflag FLAG_UNK_28C
	end

scr_seq_00000938_0000007F:
	goto scr_seq_00000938_00000115

scr_seq_00000938_00000085:
	comparevartovalue VAR_UNK_4037, 61993
	gotoif eq, scr_seq_00000938_000000BC
	setflag FLAG_UNK_1FC
	setflag FLAG_UNK_1FE
	clearflag FLAG_UNK_1FF
	setflag FLAG_UNK_011
	setflag FLAG_UNK_013
	setflag FLAG_UNK_014
	setflag FLAG_UNK_015
	setflag FLAG_UNK_289
	setflag FLAG_UNK_28B
	setflag FLAG_UNK_28C
	end

scr_seq_00000938_000000BC:
	clearflag FLAG_UNK_1FC
	clearflag FLAG_UNK_1FE
	setflag FLAG_UNK_1FF
	clearflag FLAG_UNK_289
	clearflag FLAG_UNK_28B
	clearflag FLAG_UNK_28C
	checkflag FLAG_UNK_146
	gotoif eq, scr_seq_00000938_000000E5
	goto scr_seq_00000938_000000E9

scr_seq_00000938_000000E5:
	setflag FLAG_UNK_289
scr_seq_00000938_000000E9:
	checkflag FLAG_UNK_147
	gotoif eq, scr_seq_00000938_000000FA
	goto scr_seq_00000938_000000FE

scr_seq_00000938_000000FA:
	setflag FLAG_UNK_28B
scr_seq_00000938_000000FE:
	checkflag FLAG_UNK_148
	gotoif eq, scr_seq_00000938_0000010F
	goto scr_seq_00000938_00000113

scr_seq_00000938_0000010F:
	setflag FLAG_UNK_28C
scr_seq_00000938_00000113:
	end

scr_seq_00000938_00000115:
	scrcmd_147 39, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000938_000001A7
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000938_00000139
	goto scr_seq_00000938_000001A7

scr_seq_00000938_00000139:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000938_00000154
	clearflag FLAG_UNK_2CC
	goto scr_seq_00000938_0000019F

scr_seq_00000938_00000154:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000938_0000016B
	clearflag FLAG_UNK_2CC
	goto scr_seq_00000938_0000019F

scr_seq_00000938_0000016B:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000938_00000182
	clearflag FLAG_UNK_2CC
	goto scr_seq_00000938_0000019F

scr_seq_00000938_00000182:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000938_00000199
	clearflag FLAG_UNK_2CC
	goto scr_seq_00000938_0000019F

scr_seq_00000938_00000199:
	goto scr_seq_00000938_000001A7

scr_seq_00000938_0000019F:
	goto scr_seq_00000938_00000085

scr_seq_00000938_000001A5:
	.byte 0x02, 0x00
scr_seq_00000938_000001A7:
	setflag FLAG_UNK_2CC
	goto scr_seq_00000938_00000085

scr_seq_00000938_000001B1:
	.byte 0x02, 0x00
scr_seq_00000938_000001B3:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000938_000001C0
	end

scr_seq_00000938_000001C0:
	setflag FLAG_UNK_1E3
	scrcmd_101 3
	clearflag FLAG_UNK_1E4
	scrcmd_100 8
	scrcmd_100 10
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000938_000001DA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_00000938_0000026A
	msgbox 13
scr_seq_00000938_000001F2:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000938_00000216
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000938_00000259
	end

scr_seq_00000938_00000216:
	scrcmd_190 0
	msgbox 14
	scrcmd_078 1206
	scrcmd_079
	scrcmd_146 39
	msgbox 15
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_2CC
	scrcmd_101 20
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000938_00000259:
	setvar VAR_TEMP_x4004, 1
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_0000026A:
	msgbox 17
	goto scr_seq_00000938_000001F2

scr_seq_00000938_00000273:
	.byte 0x02, 0x00
scr_seq_00000938_00000275:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_529 32770
	scrcmd_480 32780, 32770, 61
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000938_0000039B
	checkflag FLAG_UNK_ABC
	gotoif eq, scr_seq_00000938_000003AF
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_00000938_00000349
	checkflag FLAG_UNK_0D5
	gotoif eq, scr_seq_00000938_0000032B
	scrcmd_484 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000938_000002DC
	scrcmd_438 0, 32780
	scrcmd_440 32780, 11
	goto scr_seq_00000938_00000323

scr_seq_00000938_000002DC:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 8
	setvar VAR_SPECIAL_x8004, 241
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000938_0000033F
	callstd 2033
	setflag FLAG_UNK_0D5
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, 32780
	scrcmd_440 32780, 9
scr_seq_00000938_00000323:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_0000032B:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_0000033F:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000938_00000349:
	scrcmd_484 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000938_0000036C
	scrcmd_438 0, 32780
	scrcmd_440 32780, 11
	goto scr_seq_00000938_00000323

scr_seq_00000938_0000036C:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 36
	scrcmd_193 0, 32770
	scrcmd_440 32780, 38
	scrcmd_481 32770, 61
	scrcmd_078 1185
	scrcmd_079
	setflag FLAG_UNK_ABC
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_0000039B:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_000003AF:
	scrcmd_438 0, 32780
	scrcmd_440 32780, 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_000003C3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 130, 0
	msgbox 0
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 130, 30, 1
	clearflag FLAG_UNK_0A4
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000938_00000456
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_00000938_00000452
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_00000938_00000466
	checkflag FLAG_UNK_0C9
	gotoif eq, scr_seq_00000938_0000046C
	scrcmd_052
	setvar VAR_SPECIAL_x8004, 478
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000938_0000045C
	callstd 2033
	setflag FLAG_UNK_0C9
	clearflag FLAG_UNK_28A
	closemsg
scr_seq_00000938_00000452:
	releaseall
	end

scr_seq_00000938_00000456:
	scrcmd_219
	releaseall
	end

scr_seq_00000938_0000045C:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000938_00000466:
	setflag FLAG_UNK_16A
	return

scr_seq_00000938_0000046C:
	clearflag FLAG_UNK_1E4
	scrcmd_101 8
	scrcmd_101 10
	releaseall
	end

scr_seq_00000938_0000047C:
	checkflag FLAG_UNK_0C3
	gotoif eq, scr_seq_00000938_00000509
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 2
	faceplayer
	scrcmd_190 0
	scrcmd_132 3, 4
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000938_000004BB
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000938_000004FA
scr_seq_00000938_000004BB:
	scrcmd_190 0
	scrcmd_132 5, 6
	waitbutton
	closemsg
	apply_movement 10, scr_seq_00000938_00000538
	wait_movement
	apply_movement 8, scr_seq_00000938_00000544
	wait_movement
	scrcmd_775 8, 10
	setflag FLAG_UNK_1E4
	scrcmd_101 8
	scrcmd_101 10
	clearflag FLAG_UNK_1F8
	setvar VAR_UNK_40A8, 1
	releaseall
	end

scr_seq_00000938_000004FA:
	setflag FLAG_UNK_0C3
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_00000509:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000938_000004BB
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000938_000004FA
	end


scr_seq_00000938_00000538:
	.short 34, 1
	.short 50, 2
	.short 254, 0

scr_seq_00000938_00000544:
	.short 33, 1
	.short 254, 0
scr_seq_00000938_0000054C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif eq, scr_seq_00000938_0000056A
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_0000056A:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_00000575:
	.byte 0x02, 0x00
scr_seq_00000938_00000577:
	checkflag FLAG_UNK_139
	gotoif eq, scr_seq_00000938_00000597
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 31, 32780
	callstd 2000
	end

scr_seq_00000938_00000597:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 0, 0
	scrcmd_393 0, 1, 129
	scrcmd_784 0, 1
	scrcmd_190 2
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 32, 32780
	callstd 2000
	dummy_486
	dummy_486
	releaseall
	end

scr_seq_00000938_000005CD:
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_00000938_0000061B

scr_seq_00000938_000005E5:
	.byte 0x02, 0x00
scr_seq_00000938_000005E7:
	setvar VAR_TEMP_x4001, 2
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_00000938_0000061B

scr_seq_00000938_000005FF:
	.byte 0x02
	.byte 0x00
scr_seq_00000938_00000601:
	setvar VAR_TEMP_x4001, 3
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_00000938_0000061B

scr_seq_00000938_00000619:
	.byte 0x02, 0x00
scr_seq_00000938_0000061B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000938_00000657
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000938_000006CA
	end

scr_seq_00000938_00000657:
	callstd 2001
	scrcmd_101 32781
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, scr_seq_00000938_00000676
	setflag FLAG_UNK_146
	goto scr_seq_00000938_00000691

scr_seq_00000938_00000676:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_00000938_0000068D
	setflag FLAG_UNK_147
	goto scr_seq_00000938_00000691

scr_seq_00000938_0000068D:
	setflag FLAG_UNK_148
scr_seq_00000938_00000691:
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	scrcmd_190 0
	scrcmd_194 1, 32772
	msgbox 33
	scrcmd_079
	scrcmd_190 0
	scrcmd_194 1, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	msgbox 34
	waitbutton
	setvar VAR_SPECIAL_x800C, 1
scr_seq_00000938_000006C4:
	closemsg
	releaseall
	end

scr_seq_00000938_000006CA:
	scrcmd_194 0, 32772
	msgbox 35
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	goto scr_seq_00000938_000006C4

scr_seq_00000938_000006E0:
	.byte 0x02, 0x00
scr_seq_00000938_000006E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 149, 0
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_000006FB:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 30, 32780
	callstd 2000
	end

scr_seq_00000938_00000710:
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d, 0x00, 0x09, 0x32, 0x00, 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
scr_seq_00000938_00000723:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_00000736:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_00000749:
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68
	.byte 0x00, 0x2d, 0x00, 0x00, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_00000938_0000075C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_0000076F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_00000782:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000938_00000795:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
