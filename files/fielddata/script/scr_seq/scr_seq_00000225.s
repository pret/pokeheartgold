#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000225_00000026 ; 000
	scrdef scr_seq_00000225_000001B2 ; 001
	scrdef scr_seq_00000225_00000954 ; 002
	scrdef scr_seq_00000225_00000064 ; 003
	scrdef scr_seq_00000225_000009AD ; 004
	scrdef scr_seq_00000225_000009C4 ; 005
	scrdef scr_seq_00000225_000009DB ; 006
	scrdef scr_seq_00000225_000009EE ; 007
	scrdef scr_seq_00000225_00000A01 ; 008
	scrdef_end

scr_seq_00000225_00000026:
	scrcmd_144 16417
	scrcmd_294 0, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000225_00000043
	setflag FLAG_UNK_207
	end

scr_seq_00000225_00000043:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000225_0000005E
	clearflag FLAG_UNK_207
	goto scr_seq_00000225_00000062

scr_seq_00000225_0000005E:
	setflag FLAG_UNK_207
scr_seq_00000225_00000062:
	end

scr_seq_00000225_00000064:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_529 VAR_SPECIAL_x8002
	scrcmd_480 32780, 32770, 60
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000225_0000018A
	checkflag FLAG_UNK_ABC
	gotoif eq, scr_seq_00000225_0000019E
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_00000225_00000138
	checkflag FLAG_UNK_0D8
	gotoif eq, scr_seq_00000225_0000011A
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000225_000000CB
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 7
	goto scr_seq_00000225_00000112

scr_seq_00000225_000000CB:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 4
	setvar VAR_SPECIAL_x8004, 248
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000225_0000012E
	callstd 2033
	setflag FLAG_UNK_0D8
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
scr_seq_00000225_00000112:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000225_0000011A:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000225_0000012E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000225_00000138:
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000225_0000015B
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 7
	goto scr_seq_00000225_00000112

scr_seq_00000225_0000015B:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 32
	scrcmd_193 0, 32770
	scrcmd_440 VAR_SPECIAL_x800C, 34
	scrcmd_481 32770, 60
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_ABC
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000225_0000018A:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000225_0000019E:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000225_000001B2:
	scrcmd_609
	lockall
	scrcmd_076 183, 0
	scrcmd_077
	apply_movement 7, scr_seq_00000225_000005C4
	wait_movement
	apply_movement 6, scr_seq_00000225_000005D8
	wait_movement
	callstd 2029
	scrcmd_132 17, 18
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_099 7
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_00000225_00000209
	apply_movement 6, scr_seq_00000225_00000660
	apply_movement 7, scr_seq_00000225_000006D4
	goto scr_seq_00000225_000002D5

scr_seq_00000225_00000209:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_00000225_0000022C
	apply_movement 6, scr_seq_00000225_0000067C
	apply_movement 7, scr_seq_00000225_000006F4
	goto scr_seq_00000225_000002D5

scr_seq_00000225_0000022C:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_00000225_0000024F
	apply_movement 6, scr_seq_00000225_0000068C
	apply_movement 7, scr_seq_00000225_00000708
	goto scr_seq_00000225_000002D5

scr_seq_00000225_0000024F:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_00000225_00000272
	apply_movement 6, scr_seq_00000225_0000069C
	apply_movement 7, scr_seq_00000225_0000071C
	goto scr_seq_00000225_000002D5

scr_seq_00000225_00000272:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_00000225_00000295
	apply_movement 6, scr_seq_00000225_000006AC
	apply_movement 7, scr_seq_00000225_00000730
	goto scr_seq_00000225_000002D5

scr_seq_00000225_00000295:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_00000225_000002B8
	apply_movement 6, scr_seq_00000225_000006B4
	apply_movement 7, scr_seq_00000225_0000073C
	goto scr_seq_00000225_000002D5

scr_seq_00000225_000002B8:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_00000225_000002D5
	apply_movement 6, scr_seq_00000225_000006C4
	apply_movement 7, scr_seq_00000225_00000750
scr_seq_00000225_000002D5:
	wait_movement
	scrcmd_098 7
	scrcmd_190 0
	scrcmd_132 0, 1
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	get_player_gender VAR_TEMP_x4002
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_00000225_0000033E
	apply_movement 6, scr_seq_00000225_00000764
	apply_movement 7, scr_seq_00000225_000007B4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000225_00000330
	apply_movement 255, scr_seq_00000225_00000820
	goto scr_seq_00000225_00000338

scr_seq_00000225_00000330:
	apply_movement 255, scr_seq_00000225_000008A4
scr_seq_00000225_00000338:
	goto scr_seq_00000225_000004DC

scr_seq_00000225_0000033E:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_00000225_00000384
	apply_movement 6, scr_seq_00000225_00000770
	apply_movement 7, scr_seq_00000225_000007C4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000225_00000376
	apply_movement 255, scr_seq_00000225_00000834
	goto scr_seq_00000225_0000037E

scr_seq_00000225_00000376:
	apply_movement 255, scr_seq_00000225_000008B8
scr_seq_00000225_0000037E:
	goto scr_seq_00000225_000004DC

scr_seq_00000225_00000384:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_00000225_000003CA
	apply_movement 6, scr_seq_00000225_0000077C
	apply_movement 7, scr_seq_00000225_000007D4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000225_000003BC
	apply_movement 255, scr_seq_00000225_00000848
	goto scr_seq_00000225_000003C4

scr_seq_00000225_000003BC:
	apply_movement 255, scr_seq_00000225_000008CC
scr_seq_00000225_000003C4:
	goto scr_seq_00000225_000004DC

scr_seq_00000225_000003CA:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_00000225_00000410
	apply_movement 6, scr_seq_00000225_00000788
	apply_movement 7, scr_seq_00000225_000007E4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000225_00000402
	apply_movement 255, scr_seq_00000225_0000085C
	goto scr_seq_00000225_0000040A

scr_seq_00000225_00000402:
	apply_movement 255, scr_seq_00000225_000008E0
scr_seq_00000225_0000040A:
	goto scr_seq_00000225_000004DC

scr_seq_00000225_00000410:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_00000225_00000456
	apply_movement 6, scr_seq_00000225_00000794
	apply_movement 7, scr_seq_00000225_000007F4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000225_00000448
	apply_movement 255, scr_seq_00000225_00000870
	goto scr_seq_00000225_00000450

scr_seq_00000225_00000448:
	apply_movement 255, scr_seq_00000225_000008F4
scr_seq_00000225_00000450:
	goto scr_seq_00000225_000004DC

scr_seq_00000225_00000456:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_00000225_0000049C
	apply_movement 6, scr_seq_00000225_000007A0
	apply_movement 7, scr_seq_00000225_00000804
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000225_0000048E
	apply_movement 255, scr_seq_00000225_00000884
	goto scr_seq_00000225_00000496

scr_seq_00000225_0000048E:
	apply_movement 255, scr_seq_00000225_00000908
scr_seq_00000225_00000496:
	goto scr_seq_00000225_000004DC

scr_seq_00000225_0000049C:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_00000225_000004DC
	apply_movement 6, scr_seq_00000225_000007AC
	apply_movement 7, scr_seq_00000225_00000814
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000225_000004D4
	apply_movement 255, scr_seq_00000225_00000898
	goto scr_seq_00000225_000004DC

scr_seq_00000225_000004D4:
	apply_movement 255, scr_seq_00000225_0000091C
scr_seq_00000225_000004DC:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4002, 0
	callif eq, scr_seq_00000225_00000559
	wait 10, VAR_SPECIAL_x800C
	scrcmd_251
	apply_movement 6, scr_seq_00000225_0000064C
	apply_movement 7, scr_seq_00000225_00000654
	wait_movement
	scrcmd_132 3, 4
	setvar VAR_SPECIAL_x8004, 4
	setvar VAR_SPECIAL_x8005, 5
	callstd 2033
	scrcmd_132 7, 8
	closemsg
	apply_movement 6, scr_seq_00000225_00000928
	apply_movement 7, scr_seq_00000225_0000093C
	wait_movement
	hide_person 6
	hide_person 7
	setflag FLAG_UNK_1A4
	setflag FLAG_UNK_1A5
	setvar VAR_UNK_408B, 0
	setflag FLAG_UNK_09A
	releaseall
	end

scr_seq_00000225_00000559:
	apply_movement 6, scr_seq_00000225_000005BC
	wait_movement
	apply_movement 6, scr_seq_00000225_000005E4
	apply_movement 7, scr_seq_00000225_00000600
	wait_movement
	apply_movement 6, scr_seq_00000225_0000061C
	apply_movement 7, scr_seq_00000225_00000624
	wait_movement
	msgbox 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 6, scr_seq_00000225_0000062C
	apply_movement 7, scr_seq_00000225_00000634
	apply_movement 255, scr_seq_00000225_00000640
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return


scr_seq_00000225_000005BC:
	.short 75, 1
	.short 254, 0

scr_seq_00000225_000005C4:
	.short 17, 1
	.short 19, 2
	.short 16, 1
	.short 50, 2
	.short 254, 0

scr_seq_00000225_000005D8:
	.short 35, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000225_000005E4:
	.short 50, 3
	.short 65, 1
	.short 50, 3
	.short 63, 3
	.short 50, 3
	.short 63, 3
	.short 254, 0

scr_seq_00000225_00000600:
	.short 63, 3
	.short 58, 1
	.short 63, 3
	.short 50, 3
	.short 63, 3
	.short 50, 3
	.short 254, 0

scr_seq_00000225_0000061C:
	.short 15, 3
	.short 254, 0

scr_seq_00000225_00000624:
	.short 15, 3
	.short 254, 0

scr_seq_00000225_0000062C:
	.short 14, 3
	.short 254, 0

scr_seq_00000225_00000634:
	.short 15, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000225_00000640:
	.short 63, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000225_0000064C:
	.short 15, 1
	.short 254, 0

scr_seq_00000225_00000654:
	.short 14, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000225_00000660:
	.short 16, 4
	.short 19, 2
	.short 17, 2
	.short 18, 2
	.short 16, 2
	.short 19, 4
	.short 254, 0

scr_seq_00000225_0000067C:
	.short 15, 2
	.short 12, 3
	.short 15, 2
	.short 254, 0

scr_seq_00000225_0000068C:
	.short 15, 2
	.short 12, 2
	.short 15, 2
	.short 254, 0

scr_seq_00000225_0000069C:
	.short 15, 2
	.short 12, 1
	.short 15, 2
	.short 254, 0

scr_seq_00000225_000006AC:
	.short 15, 4
	.short 254, 0

scr_seq_00000225_000006B4:
	.short 15, 2
	.short 13, 1
	.short 15, 2
	.short 254, 0

scr_seq_00000225_000006C4:
	.short 15, 2
	.short 13, 2
	.short 15, 2
	.short 254, 0

scr_seq_00000225_000006D4:
	.short 18, 1
	.short 16, 4
	.short 19, 2
	.short 17, 2
	.short 18, 2
	.short 16, 2
	.short 19, 3
	.short 254, 0

scr_seq_00000225_000006F4:
	.short 14, 1
	.short 15, 2
	.short 12, 3
	.short 15, 1
	.short 254, 0

scr_seq_00000225_00000708:
	.short 14, 1
	.short 15, 2
	.short 12, 2
	.short 15, 1
	.short 254, 0

scr_seq_00000225_0000071C:
	.short 14, 1
	.short 15, 2
	.short 12, 1
	.short 15, 1
	.short 254, 0

scr_seq_00000225_00000730:
	.short 14, 1
	.short 15, 3
	.short 254, 0

scr_seq_00000225_0000073C:
	.short 14, 1
	.short 15, 2
	.short 13, 1
	.short 15, 1
	.short 254, 0

scr_seq_00000225_00000750:
	.short 14, 1
	.short 15, 2
	.short 13, 2
	.short 15, 1
	.short 254, 0

scr_seq_00000225_00000764:
	.short 13, 6
	.short 14, 9
	.short 254, 0

scr_seq_00000225_00000770:
	.short 13, 5
	.short 14, 9
	.short 254, 0

scr_seq_00000225_0000077C:
	.short 13, 4
	.short 14, 9
	.short 254, 0

scr_seq_00000225_00000788:
	.short 13, 3
	.short 14, 9
	.short 254, 0

scr_seq_00000225_00000794:
	.short 13, 2
	.short 14, 9
	.short 254, 0

scr_seq_00000225_000007A0:
	.short 13, 1
	.short 14, 9
	.short 254, 0

scr_seq_00000225_000007AC:
	.short 14, 9
	.short 254, 0

scr_seq_00000225_000007B4:
	.short 15, 1
	.short 13, 6
	.short 14, 8
	.short 254, 0

scr_seq_00000225_000007C4:
	.short 15, 1
	.short 13, 5
	.short 14, 8
	.short 254, 0

scr_seq_00000225_000007D4:
	.short 15, 1
	.short 13, 4
	.short 14, 8
	.short 254, 0

scr_seq_00000225_000007E4:
	.short 15, 1
	.short 13, 3
	.short 14, 8
	.short 254, 0

scr_seq_00000225_000007F4:
	.short 15, 1
	.short 13, 2
	.short 14, 8
	.short 254, 0

scr_seq_00000225_00000804:
	.short 15, 1
	.short 13, 1
	.short 14, 8
	.short 254, 0

scr_seq_00000225_00000814:
	.short 15, 1
	.short 14, 8
	.short 254, 0

scr_seq_00000225_00000820:
	.short 63, 1
	.short 14, 1
	.short 13, 6
	.short 14, 5
	.short 254, 0

scr_seq_00000225_00000834:
	.short 63, 1
	.short 14, 1
	.short 13, 5
	.short 14, 5
	.short 254, 0

scr_seq_00000225_00000848:
	.short 63, 1
	.short 14, 1
	.short 13, 4
	.short 14, 5
	.short 254, 0

scr_seq_00000225_0000085C:
	.short 63, 1
	.short 14, 1
	.short 13, 3
	.short 14, 5
	.short 254, 0

scr_seq_00000225_00000870:
	.short 63, 1
	.short 14, 1
	.short 13, 2
	.short 14, 5
	.short 254, 0

scr_seq_00000225_00000884:
	.short 63, 1
	.short 14, 1
	.short 13, 1
	.short 14, 5
	.short 254, 0

scr_seq_00000225_00000898:
	.short 63, 1
	.short 14, 6
	.short 254, 0

scr_seq_00000225_000008A4:
	.short 63, 1
	.short 14, 1
	.short 13, 6
	.short 14, 7
	.short 254, 0

scr_seq_00000225_000008B8:
	.short 63, 1
	.short 14, 1
	.short 13, 5
	.short 14, 7
	.short 254, 0

scr_seq_00000225_000008CC:
	.short 63, 1
	.short 14, 1
	.short 13, 4
	.short 14, 7
	.short 254, 0

scr_seq_00000225_000008E0:
	.short 63, 1
	.short 14, 1
	.short 13, 3
	.short 14, 7
	.short 254, 0

scr_seq_00000225_000008F4:
	.short 63, 1
	.short 14, 1
	.short 13, 2
	.short 14, 7
	.short 254, 0

scr_seq_00000225_00000908:
	.short 63, 1
	.short 14, 1
	.short 13, 1
	.short 14, 7
	.short 254, 0

scr_seq_00000225_0000091C:
	.short 63, 1
	.short 14, 8
	.short 254, 0

scr_seq_00000225_00000928:
	.short 13, 2
	.short 14, 4
	.short 13, 4
	.short 14, 3
	.short 254, 0

scr_seq_00000225_0000093C:
	.short 15, 1
	.short 13, 2
	.short 14, 4
	.short 13, 4
	.short 14, 2
	.short 254, 0
scr_seq_00000225_00000954:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_379 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000225_00000976
	msgbox 12
	goto scr_seq_00000225_000009A5

scr_seq_00000225_00000976:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000225_0000098C
	msgbox 13
	goto scr_seq_00000225_000009A5

scr_seq_00000225_0000098C:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000225_000009A2
	msgbox 13
	goto scr_seq_00000225_000009A5

scr_seq_00000225_000009A2:
	msgbox 14
scr_seq_00000225_000009A5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000225_000009AD:
	scrcmd_055 16, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000225_000009C4:
	scrcmd_055 15, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000225_000009DB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000225_000009EE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000225_00000A01:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
