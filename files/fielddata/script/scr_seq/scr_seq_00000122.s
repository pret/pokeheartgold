#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000122_000000D6 ; 000
	scrdef scr_seq_00000122_000006EC ; 001
	scrdef scr_seq_00000122_0000071A ; 002
	scrdef scr_seq_00000122_00000748 ; 003
	scrdef scr_seq_00000122_000007FB ; 004
	scrdef scr_seq_00000122_00000829 ; 005
	scrdef scr_seq_00000122_00000857 ; 006
	scrdef scr_seq_00000122_000006FF ; 007
	scrdef scr_seq_00000122_0000072D ; 008
	scrdef scr_seq_00000122_000007E0 ; 009
	scrdef scr_seq_00000122_0000080E ; 010
	scrdef scr_seq_00000122_0000083C ; 011
	scrdef scr_seq_00000122_0000086A ; 012
	scrdef scr_seq_00000122_00000885 ; 013
	scrdef scr_seq_00000122_000008A0 ; 014
	scrdef scr_seq_00000122_000008BB ; 015
	scrdef scr_seq_00000122_00000BFC ; 016
	scrdef scr_seq_00000122_00000D24 ; 017
	scrdef scr_seq_00000122_00000062 ; 018
	scrdef scr_seq_00000122_00000A04 ; 019
	scrdef scr_seq_00000122_00000B97 ; 020
	scrdef scr_seq_00000122_00000BB8 ; 021
	scrdef scr_seq_00000122_00000BD9 ; 022
	scrdef scr_seq_00000122_00000ED4 ; 023
	scrdef_end

scr_seq_00000122_00000062:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000122_00000073
	clearflag FLAG_UNK_189
	end

scr_seq_00000122_00000073:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000122_000000C2
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000122_000000C2
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000122_000000C2
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000122_000000CC
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_00000122_000000CC
	setflag FLAG_UNK_27E
	clearflag FLAG_UNK_27F
	end

scr_seq_00000122_000000C2:
	clearflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	end

scr_seq_00000122_000000CC:
	setflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	end

scr_seq_00000122_000000D6:
	scrcmd_609
	lockall
	scrcmd_099 8
	scrcmd_099 2
	apply_movement 0, scr_seq_00000122_00000414
	wait_movement
	msgbox 0
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 40
	gotoif ne, scr_seq_00000122_0000011A
	apply_movement 0, scr_seq_00000122_0000043C
	apply_movement 1, scr_seq_00000122_000004A8
	goto scr_seq_00000122_000001D9

scr_seq_00000122_0000011A:
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_00000122_0000013D
	apply_movement 0, scr_seq_00000122_0000044C
	apply_movement 1, scr_seq_00000122_000004BC
	goto scr_seq_00000122_000001D9

scr_seq_00000122_0000013D:
	comparevartovalue VAR_TEMP_x4000, 42
	gotoif ne, scr_seq_00000122_00000160
	apply_movement 0, scr_seq_00000122_0000045C
	apply_movement 1, scr_seq_00000122_000004D0
	goto scr_seq_00000122_000001D9

scr_seq_00000122_00000160:
	comparevartovalue VAR_TEMP_x4000, 43
	gotoif ne, scr_seq_00000122_00000183
	apply_movement 0, scr_seq_00000122_00000464
	apply_movement 1, scr_seq_00000122_000004DC
	goto scr_seq_00000122_000001D9

scr_seq_00000122_00000183:
	comparevartovalue VAR_TEMP_x4000, 44
	gotoif ne, scr_seq_00000122_000001A6
	apply_movement 0, scr_seq_00000122_00000474
	apply_movement 1, scr_seq_00000122_000004F0
	goto scr_seq_00000122_000001D9

scr_seq_00000122_000001A6:
	comparevartovalue VAR_TEMP_x4000, 39
	gotoif ne, scr_seq_00000122_000001C9
	apply_movement 0, scr_seq_00000122_0000042C
	apply_movement 1, scr_seq_00000122_00000494
	goto scr_seq_00000122_000001D9

scr_seq_00000122_000001C9:
	apply_movement 0, scr_seq_00000122_00000484
	apply_movement 1, scr_seq_00000122_00000504
scr_seq_00000122_000001D9:
	wait_movement
	msgbox 6
	closemsg
	apply_movement 0, scr_seq_00000122_00000424
	apply_movement 1, scr_seq_00000122_00000424
	wait_movement
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000122_0000020C
	msgbox 5
	goto scr_seq_00000122_00000218

scr_seq_00000122_0000020C:
	get_lead_mon_index VAR_SPECIAL_x8000
	scrcmd_193 1, 32768
	msgbox 1
scr_seq_00000122_00000218:
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4000, 40
	gotoif ne, scr_seq_00000122_0000024F
	apply_movement 0, scr_seq_00000122_00000528
	apply_movement 1, scr_seq_00000122_000005A0
	apply_movement 255, scr_seq_00000122_00000658
	goto scr_seq_00000122_0000033E

scr_seq_00000122_0000024F:
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_00000122_0000027A
	apply_movement 0, scr_seq_00000122_00000538
	apply_movement 1, scr_seq_00000122_000005BC
	apply_movement 255, scr_seq_00000122_0000066C
	goto scr_seq_00000122_0000033E

scr_seq_00000122_0000027A:
	comparevartovalue VAR_TEMP_x4000, 42
	gotoif ne, scr_seq_00000122_000002A5
	apply_movement 0, scr_seq_00000122_00000548
	apply_movement 1, scr_seq_00000122_000005D8
	apply_movement 255, scr_seq_00000122_00000680
	goto scr_seq_00000122_0000033E

scr_seq_00000122_000002A5:
	comparevartovalue VAR_TEMP_x4000, 43
	gotoif ne, scr_seq_00000122_000002D0
	apply_movement 0, scr_seq_00000122_00000554
	apply_movement 1, scr_seq_00000122_000005F0
	apply_movement 255, scr_seq_00000122_0000068C
	goto scr_seq_00000122_0000033E

scr_seq_00000122_000002D0:
	comparevartovalue VAR_TEMP_x4000, 44
	gotoif ne, scr_seq_00000122_000002FB
	apply_movement 0, scr_seq_00000122_00000564
	apply_movement 1, scr_seq_00000122_0000060C
	apply_movement 255, scr_seq_00000122_000006A0
	goto scr_seq_00000122_0000033E

scr_seq_00000122_000002FB:
	comparevartovalue VAR_TEMP_x4000, 39
	gotoif ne, scr_seq_00000122_00000326
	apply_movement 0, scr_seq_00000122_00000518
	apply_movement 1, scr_seq_00000122_00000584
	apply_movement 255, scr_seq_00000122_00000644
	goto scr_seq_00000122_0000033E

scr_seq_00000122_00000326:
	apply_movement 0, scr_seq_00000122_00000574
	apply_movement 1, scr_seq_00000122_00000628
	apply_movement 255, scr_seq_00000122_000006B4
scr_seq_00000122_0000033E:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 2
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_00000122_00000400
	wait_movement
	msgbox 3
	closemsg
	apply_movement 241, scr_seq_00000122_00000408
	wait_movement
	scrcmd_103
	msgbox 4
	closemsg
	apply_movement 0, scr_seq_00000122_000006C8
	apply_movement 1, scr_seq_00000122_000006D0
	wait_movement
	scrcmd_307 1, 0, 10, 22, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 0, scr_seq_00000122_000006DC
	apply_movement 1, scr_seq_00000122_000006E4
	wait_movement
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 1, scr_seq_00000122_0000041C
	wait_movement
	scrcmd_076 62, 0
	scrcmd_077
	apply_movement 1, scr_seq_00000122_000006E4
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	releaseall
	setvar VAR_UNK_40DB, 1
	setflag FLAG_UNK_225
	setflag FLAG_UNK_982
	end

scr_seq_00000122_000003FF:
	.byte 0x00

scr_seq_00000122_00000400:
	.short 12, 10
	.short 254, 0

scr_seq_00000122_00000408:
	.short 66, 1
	.short 77, 10
	.short 254, 0

scr_seq_00000122_00000414:
	.short 75, 1
	.short 254, 0

scr_seq_00000122_0000041C:
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000424:
	.short 17, 1
	.short 254, 0

scr_seq_00000122_0000042C:
	.short 77, 2
	.short 78, 3
	.short 77, 1
	.short 254, 0

scr_seq_00000122_0000043C:
	.short 77, 2
	.short 78, 2
	.short 77, 1
	.short 254, 0

scr_seq_00000122_0000044C:
	.short 77, 2
	.short 78, 1
	.short 77, 1
	.short 254, 0

scr_seq_00000122_0000045C:
	.short 77, 3
	.short 254, 0

scr_seq_00000122_00000464:
	.short 77, 2
	.short 79, 1
	.short 77, 1
	.short 254, 0

scr_seq_00000122_00000474:
	.short 77, 2
	.short 79, 2
	.short 77, 1
	.short 254, 0

scr_seq_00000122_00000484:
	.short 77, 2
	.short 79, 3
	.short 77, 1
	.short 254, 0

scr_seq_00000122_00000494:
	.short 79, 1
	.short 77, 2
	.short 78, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000122_000004A8:
	.short 79, 1
	.short 77, 2
	.short 78, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000122_000004BC:
	.short 79, 1
	.short 77, 2
	.short 78, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_000004D0:
	.short 79, 1
	.short 77, 2
	.short 254, 0

scr_seq_00000122_000004DC:
	.short 79, 1
	.short 77, 2
	.short 79, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_000004F0:
	.short 79, 1
	.short 77, 2
	.short 79, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000504:
	.short 79, 1
	.short 77, 2
	.short 79, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000518:
	.short 15, 3
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000528:
	.short 15, 2
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000538:
	.short 15, 1
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000548:
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000554:
	.short 14, 1
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000564:
	.short 14, 2
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000574:
	.short 14, 3
	.short 12, 21
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000584:
	.short 13, 1
	.short 15, 3
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_000005A0:
	.short 13, 1
	.short 15, 2
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_000005BC:
	.short 13, 1
	.short 15, 1
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_000005D8:
	.short 13, 1
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_000005F0:
	.short 13, 1
	.short 14, 1
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_0000060C:
	.short 13, 1
	.short 14, 2
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000628:
	.short 13, 1
	.short 14, 3
	.short 12, 20
	.short 14, 1
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000644:
	.short 63, 2
	.short 12, 1
	.short 15, 3
	.short 12, 19
	.short 254, 0

scr_seq_00000122_00000658:
	.short 63, 2
	.short 12, 1
	.short 15, 2
	.short 12, 19
	.short 254, 0

scr_seq_00000122_0000066C:
	.short 63, 2
	.short 12, 1
	.short 15, 1
	.short 12, 19
	.short 254, 0

scr_seq_00000122_00000680:
	.short 63, 2
	.short 12, 20
	.short 254, 0

scr_seq_00000122_0000068C:
	.short 63, 2
	.short 12, 1
	.short 14, 1
	.short 12, 19
	.short 254, 0

scr_seq_00000122_000006A0:
	.short 63, 2
	.short 12, 1
	.short 14, 2
	.short 12, 19
	.short 254, 0

scr_seq_00000122_000006B4:
	.short 63, 2
	.short 12, 1
	.short 14, 3
	.short 12, 19
	.short 254, 0

scr_seq_00000122_000006C8:
	.short 12, 2
	.short 254, 0

scr_seq_00000122_000006D0:
	.short 15, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000122_000006DC:
	.short 12, 1
	.short 254, 0

scr_seq_00000122_000006E4:
	.short 12, 1
	.short 254, 0
scr_seq_00000122_000006EC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_000006FF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 43, 0
	msgbox 8
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_0000071A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_0000072D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 52, 0
	msgbox 10
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_00000748:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 12, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ge, scr_seq_00000122_0000076E
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_0000076E:
	checkflag FLAG_UNK_154
	gotoif TRUE, scr_seq_00000122_000007CB
	msgbox 12
	scrcmd_724 16, 16384
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif ge, scr_seq_00000122_0000079A
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_0000079A:
	msgbox 14
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000122_000007D6
	callstd 2033
	scrcmd_725 0, 100
	setflag FLAG_UNK_154
scr_seq_00000122_000007CB:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_000007D6:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000122_000007E0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 16, 0
	msgbox 16
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_000007FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_0000080E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 80, 0
	msgbox 18
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_00000829:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_0000083C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 66, 0
	msgbox 20
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_00000857:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_0000086A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 79, 0
	msgbox 22
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_00000885:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 83, 0
	msgbox 23
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_000008A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 54, 0
	msgbox 24
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_000008BB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_997
	gotoif FALSE, scr_seq_00000122_0000093E
	msgbox 25
scr_seq_00000122_000008D1:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 326, 255, 0
	scrcmd_751 327, 255, 1
	scrcmd_751 157, 255, 2
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000122_0000091D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000122_00000928
	goto scr_seq_00000122_00000933

scr_seq_00000122_00000917:
	.byte 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_00000122_0000091D:
	msgbox 30
	goto scr_seq_00000122_000008D1

scr_seq_00000122_00000926:
	.byte 0x02, 0x00
scr_seq_00000122_00000928:
	msgbox 31
	goto scr_seq_00000122_000008D1

scr_seq_00000122_00000931:
	.byte 0x02, 0x00
scr_seq_00000122_00000933:
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_0000093E:
	msgbox 26
	buffer_players_name 0
	msgbox 27
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	msgbox 28
	setflag FLAG_UNK_997
	msgbox 29
	goto scr_seq_00000122_000008D1

scr_seq_00000122_0000095D:
	.byte 0x02, 0x00
scr_seq_00000122_0000095F:
	apply_movement 18, scr_seq_00000122_000009D4
	wait_movement
	msgbox 39
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_00000122_00000993
	apply_movement 255, scr_seq_00000122_000009E0
	goto scr_seq_00000122_000009B6

scr_seq_00000122_00000993:
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif ne, scr_seq_00000122_000009AE
	apply_movement 255, scr_seq_00000122_000009EC
	goto scr_seq_00000122_000009B6

scr_seq_00000122_000009AE:
	apply_movement 255, scr_seq_00000122_000009F8
scr_seq_00000122_000009B6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 18, scr_seq_00000122_00000BF4
	wait_movement
	goto scr_seq_00000122_0000093E

scr_seq_00000122_000009D2:
	.byte 0x02, 0x00

scr_seq_00000122_000009D4:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000122_000009E0:
	.short 15, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000122_000009EC:
	.short 15, 2
	.short 32, 1
	.short 254, 0

scr_seq_00000122_000009F8:
	.short 15, 1
	.short 32, 1
	.short 254, 0
scr_seq_00000122_00000A04:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4007, 0
	checkflag FLAG_UNK_997
	gotoif FALSE, scr_seq_00000122_0000095F
scr_seq_00000122_00000A1D:
	scrcmd_113 21, 1
	scrcmd_741 16391, 32768, 32769, 32770
	apply_movement 18, scr_seq_00000122_00000BEC
	wait_movement
	msgbox 33
scr_seq_00000122_00000A3A:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 328, 255, 0
	scrcmd_751 329, 255, 1
	scrcmd_751 44, 255, 2
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000122_00000AD6
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000122_00000AF6
	hasenoughmoneyvar 32780, 32769
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000122_00000AEB
	msgbox 34
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_114
	scrcmd_740 32768, 32771
	scrcmd_150
	scrcmd_113 21, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif ne, scr_seq_00000122_00000AD0
	msgbox 36
	goto scr_seq_00000122_00000AD9

scr_seq_00000122_00000AD0:
	submoneyvar 32769
	scrcmd_115
scr_seq_00000122_00000AD6:
	msgbox 35
scr_seq_00000122_00000AD9:
	closemsg
	scrcmd_114
	apply_movement 18, scr_seq_00000122_00000BF4
	wait_movement
	releaseall
	end

scr_seq_00000122_00000AEB:
	msgbox 37
	goto scr_seq_00000122_00000AD9

scr_seq_00000122_00000AF4:
	.byte 0x02, 0x00
scr_seq_00000122_00000AF6:
	comparevartovalue VAR_SPECIAL_x8002, 2000
	gotoif ge, scr_seq_00000122_00000B80
	comparevartovalue VAR_SPECIAL_x8002, 1000
	gotoif ge, scr_seq_00000122_00000B77
	comparevartovalue VAR_SPECIAL_x8002, 500
	gotoif ge, scr_seq_00000122_00000B6E
	comparevartovalue VAR_SPECIAL_x8002, 300
	gotoif ge, scr_seq_00000122_00000B65
	comparevartovalue VAR_SPECIAL_x8002, 200
	gotoif ge, scr_seq_00000122_00000B5C
	comparevartovalue VAR_SPECIAL_x8002, 100
	gotoif ge, scr_seq_00000122_00000B53
	goto scr_seq_00000122_00000B4A

scr_seq_00000122_00000B4A:
	msgbox 41
	goto scr_seq_00000122_00000B89

scr_seq_00000122_00000B53:
	msgbox 42
	goto scr_seq_00000122_00000B89

scr_seq_00000122_00000B5C:
	msgbox 43
	goto scr_seq_00000122_00000B89

scr_seq_00000122_00000B65:
	msgbox 44
	goto scr_seq_00000122_00000B89

scr_seq_00000122_00000B6E:
	msgbox 45
	goto scr_seq_00000122_00000B89

scr_seq_00000122_00000B77:
	msgbox 46
	goto scr_seq_00000122_00000B89

scr_seq_00000122_00000B80:
	msgbox 47
	goto scr_seq_00000122_00000B89

scr_seq_00000122_00000B89:
	msgbox 40
	msgbox 38
	goto scr_seq_00000122_00000A3A

scr_seq_00000122_00000B95:
	.byte 0x02, 0x00
scr_seq_00000122_00000B97:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4007, 1
	checkflag FLAG_UNK_997
	gotoif FALSE, scr_seq_00000122_0000095F
	goto scr_seq_00000122_00000A1D

scr_seq_00000122_00000BB6:
	.byte 0x02, 0x00
scr_seq_00000122_00000BB8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4007, 2
	checkflag FLAG_UNK_997
	gotoif FALSE, scr_seq_00000122_0000095F
	goto scr_seq_00000122_00000A1D

scr_seq_00000122_00000BD7:
	.byte 0x02, 0x00
scr_seq_00000122_00000BD9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 48
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000122_00000BEC:
	.short 34, 1
	.short 254, 0

scr_seq_00000122_00000BF4:
	.short 33, 1
	.short 254, 0
scr_seq_00000122_00000BFC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000122_00000E44
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000122_00000E58
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000122_00000C75
	apply_movement 255, scr_seq_00000122_00000E6C
	apply_movement 16, scr_seq_00000122_00000EB8
	goto scr_seq_00000122_00000CC3

scr_seq_00000122_00000C75:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000122_00000C90
	apply_movement 255, scr_seq_00000122_00000E84
	goto scr_seq_00000122_00000CC3

scr_seq_00000122_00000C90:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000122_00000CB3
	apply_movement 255, scr_seq_00000122_00000EA4
	apply_movement 16, scr_seq_00000122_00000EB8
	goto scr_seq_00000122_00000CC3

scr_seq_00000122_00000CB3:
	apply_movement 255, scr_seq_00000122_00000E90
	apply_movement 16, scr_seq_00000122_00000EB8
scr_seq_00000122_00000CC3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000122_00000CEA
	apply_movement 253, scr_seq_00000122_00000EC4
	wait_movement
scr_seq_00000122_00000CEA:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 13
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_00000D24:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000122_00000E44
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000122_00000E58
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000122_00000D9D
	apply_movement 255, scr_seq_00000122_00000E6C
	apply_movement 17, scr_seq_00000122_00000EB8
	goto scr_seq_00000122_00000DEB

scr_seq_00000122_00000D9D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000122_00000DB8
	apply_movement 255, scr_seq_00000122_00000E84
	goto scr_seq_00000122_00000DEB

scr_seq_00000122_00000DB8:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000122_00000DDB
	apply_movement 255, scr_seq_00000122_00000EA4
	apply_movement 17, scr_seq_00000122_00000EB8
	goto scr_seq_00000122_00000DEB

scr_seq_00000122_00000DDB:
	apply_movement 255, scr_seq_00000122_00000E90
	apply_movement 17, scr_seq_00000122_00000EB8
scr_seq_00000122_00000DEB:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000122_00000E12
	apply_movement 253, scr_seq_00000122_00000EC4
	wait_movement
scr_seq_00000122_00000E12:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 14
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_00000E44:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000122_00000E58:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000122_00000E6C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000E84:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000E90:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000EA4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000122_00000EB8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000122_00000EC4:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000122_00000ED4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 49, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
