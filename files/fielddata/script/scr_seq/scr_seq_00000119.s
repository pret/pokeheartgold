#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000119_00000690 ; 000
	scrdef scr_seq_00000119_000006F2 ; 001
	scrdef scr_seq_00000119_000008D8 ; 002
	scrdef scr_seq_00000119_000009E7 ; 003
	scrdef scr_seq_00000119_00000C37 ; 004
	scrdef scr_seq_00000119_00000E7E ; 005
	scrdef scr_seq_00000119_00000032 ; 006
	scrdef scr_seq_00000119_0000013F ; 007
	scrdef scr_seq_00000119_00000208 ; 008
	scrdef scr_seq_00000119_00000279 ; 009
	scrdef scr_seq_00000119_0000042C ; 010
	scrdef scr_seq_00000119_00000E13 ; 011
	scrdef_end

scr_seq_00000119_00000032:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_00000119_000001EC
	apply_movement 4, scr_seq_00000119_000001EC
	wait_movement
	msgbox 7
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000119_00000062
	scrcmd_447 1, 0
scr_seq_00000119_00000062:
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000119_000000BD
	apply_movement 255, scr_seq_00000119_000001B4
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 357, 0, 79, 100, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_098 253
	scrcmd_606
	apply_movement 253, scr_seq_00000119_00000200
	wait_movement
	scrcmd_099 253
	releaseall
	end

scr_seq_00000119_000000BD:
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000119_000000E2
	setvar VAR_TEMP_x4002, 5
	setvar VAR_TEMP_x4003, 5
	goto scr_seq_00000119_000000EE

scr_seq_00000119_000000E2:
	setvar VAR_TEMP_x4002, 19
	setvar VAR_TEMP_x4003, 5
scr_seq_00000119_000000EE:
	apply_movement 255, scr_seq_00000119_000001DC
	wait_movement
	scrcmd_307 0, 0, 16386, 16387, 77
	call scr_seq_00000119_000008AF
	apply_movement 255, scr_seq_00000119_000001BC
	apply_movement 2, scr_seq_00000119_000001F4
	apply_movement 4, scr_seq_00000119_000001F4
	wait_movement
	call scr_seq_00000119_000008B7
	setvar VAR_UNK_40E3, 0
	msgbox 8
	msgbox 9
	waitbutton
	closemsg
	scrcmd_606
	releaseall
	end

scr_seq_00000119_0000013F:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000119_000001E4
	wait_movement
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000119_00000172
	setvar VAR_TEMP_x4002, 5
	setvar VAR_TEMP_x4003, 5
	goto scr_seq_00000119_0000017E

scr_seq_00000119_00000172:
	setvar VAR_TEMP_x4002, 19
	setvar VAR_TEMP_x4003, 5
scr_seq_00000119_0000017E:
	scrcmd_307 0, 0, 16386, 16387, 77
	call scr_seq_00000119_000008AF
	apply_movement 255, scr_seq_00000119_000001BC
	wait_movement
	call scr_seq_00000119_000008B7
	setvar VAR_UNK_40E3, 0
	msgbox 9
	waitbutton
	closemsg
	scrcmd_606
	releaseall
	end

scr_seq_00000119_000001B2:
	.byte 0x00, 0x00

scr_seq_00000119_000001B4:
	.short 12, 1
	.short 254, 0

scr_seq_00000119_000001BC:
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0
	.byte 0x0d, 0x00, 0x04, 0x00
	.byte 0x0e, 0x00, 0x01, 0x00, 0x20, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000119_000001DC:
	.short 13, 1
	.short 254, 0

scr_seq_00000119_000001E4:
	.short 13, 2
	.short 254, 0

scr_seq_00000119_000001EC:
	.short 3, 1
	.short 254, 0

scr_seq_00000119_000001F4:
	.short 63, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000119_00000200:
	.short 0, 1
	.short 254, 0
scr_seq_00000119_00000208:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_00000119_00000310
	apply_movement 255, scr_seq_00000119_000003B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 29
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_0000025B
scr_seq_00000119_0000024A:
	msgbox 30
	waitbutton
	closemsg
	setvar VAR_UNK_4057, 2
	releaseall
	end

scr_seq_00000119_0000025B:
	msgbox 31
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_0000025B
	goto scr_seq_00000119_0000024A

scr_seq_00000119_00000279:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_00000119_00000310
	apply_movement 255, scr_seq_00000119_000003B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 34
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_00000119_00000324
	apply_movement 255, scr_seq_00000119_000003C8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 35
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_00000119_00000334
	apply_movement 255, scr_seq_00000119_000003D8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 36
	waitbutton
	closemsg
	setvar VAR_UNK_4057, 5
	clearflag FLAG_UNK_319
	releaseall
	end

scr_seq_00000119_0000030E:
	.byte 0x00, 0x00

scr_seq_00000119_00000310:
	.short 1, 1
	.short 75, 1
	.short 65, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000119_00000324:
	.short 12, 2
	.short 15, 3
	.short 12, 1
	.short 254, 0

scr_seq_00000119_00000334:
	.short 13, 2
	.short 14, 2
	.short 13, 1
	.short 75, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000119_0000034C:
	.short 14, 2
	.short 12, 4
	.short 15, 4
	.short 1, 1
	.short 254, 0

scr_seq_00000119_00000360:
	.short 12, 4
	.short 15, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000119_00000370:
	.short 13, 2
	.short 15, 1
	.short 13, 2
	.short 2, 1
	.short 254, 0
	.byte 0x0f, 0x00, 0x01, 0x00, 0x41, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x41, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x4b, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000119_000003B8:
	.short 65, 1
	.short 12, 3
	.short 3, 1
	.short 254, 0

scr_seq_00000119_000003C8:
	.short 12, 2
	.short 15, 4
	.short 12, 1
	.short 254, 0

scr_seq_00000119_000003D8:
	.short 1, 1
	.short 254, 0

scr_seq_00000119_000003E0:
	.short 65, 1
	.short 0, 1
	.short 65, 1
	.short 13, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000119_000003F8:
	.short 15, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000119_00000404:
	.short 12, 1
	.short 254, 0

scr_seq_00000119_0000040C:
	.short 65, 3
	.short 3, 1
	.short 254, 0
	.byte 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x03, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000119_0000042C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_183
	gotoif eq, scr_seq_00000119_00000599
	comparevartovalue VAR_UNK_4057, 2
	gotoif eq, scr_seq_00000119_0000049D
	comparevartovalue VAR_UNK_4057, 3
	gotoif eq, scr_seq_00000119_0000048B
	comparevartovalue VAR_UNK_4057, 5
	gotoif eq, scr_seq_00000119_000004CB
	comparevartovalue VAR_UNK_4057, 6
	gotoif eq, scr_seq_00000119_00000494
	comparevartovalue VAR_UNK_4057, 7
	gotoif eq, scr_seq_00000119_0000058F
	msgbox 42
	goto scr_seq_00000119_00000587

scr_seq_00000119_00000489:
	.byte 0x02, 0x00
scr_seq_00000119_0000048B:
	msgbox 42
	goto scr_seq_00000119_00000587

scr_seq_00000119_00000494:
	msgbox 40
	goto scr_seq_00000119_00000587

scr_seq_00000119_0000049D:
	scrcmd_791 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000119_000004B8
	msgbox 33
	goto scr_seq_00000119_000004C3

scr_seq_00000119_000004B8:
	msgbox 32
	setvar VAR_UNK_4057, 3
	scrcmd_792
scr_seq_00000119_000004C3:
	goto scr_seq_00000119_00000587

scr_seq_00000119_000004C9:
	.byte 0x02, 0x00
scr_seq_00000119_000004CB:
	scrcmd_791 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000119_0000057E
	msgbox 37
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000119_00000515
	apply_movement 5, scr_seq_00000119_0000034C
	apply_movement 255, scr_seq_00000119_000003E0
	wait_movement
	goto scr_seq_00000119_0000054C

scr_seq_00000119_00000515:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000119_0000053A
	apply_movement 5, scr_seq_00000119_00000360
	apply_movement 255, scr_seq_00000119_000003F8
	wait_movement
	goto scr_seq_00000119_0000054C

scr_seq_00000119_0000053A:
	apply_movement 5, scr_seq_00000119_00000360
	apply_movement 255, scr_seq_00000119_00000404
	wait_movement
scr_seq_00000119_0000054C:
	msgbox 38
	closemsg
	apply_movement 5, scr_seq_00000119_00000370
	apply_movement 255, scr_seq_00000119_0000040C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 39
	setvar VAR_UNK_4057, 6
	scrcmd_792
	goto scr_seq_00000119_00000587

scr_seq_00000119_0000057E:
	msgbox 41
	goto scr_seq_00000119_00000587

scr_seq_00000119_00000587:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_0000058F:
	setflag FLAG_UNK_183
	msgbox 43
	msgbox 44
scr_seq_00000119_00000599:
	msgbox 45
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000683
scr_seq_00000119_000005AF:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 463, 255, 0
	scrcmd_751 464, 255, 1
	scrcmd_751 465, 255, 2
	scrcmd_751 466, 255, 3
	scrcmd_751 467, 255, 4
	scrcmd_751 468, 255, 5
	scrcmd_751 469, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000119_0000064D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000119_00000656
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000119_0000065F
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000119_00000668
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000119_00000671
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000119_0000067A
	goto scr_seq_00000119_00000683

scr_seq_00000119_0000064B:
	.byte 0x02, 0x00
scr_seq_00000119_0000064D:
	msgbox 47
	goto scr_seq_00000119_000005AF

scr_seq_00000119_00000656:
	msgbox 48
	goto scr_seq_00000119_000005AF

scr_seq_00000119_0000065F:
	msgbox 49
	goto scr_seq_00000119_000005AF

scr_seq_00000119_00000668:
	msgbox 50
	goto scr_seq_00000119_000005AF

scr_seq_00000119_00000671:
	msgbox 51
	goto scr_seq_00000119_000005AF

scr_seq_00000119_0000067A:
	msgbox 52
	goto scr_seq_00000119_000005AF

scr_seq_00000119_00000683:
	scrcmd_747
	msgbox 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000690:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_00000119_000006AE
	msgbox 15
	goto scr_seq_00000119_000006B1

scr_seq_00000119_000006AE:
	msgbox 14
scr_seq_00000119_000006B1:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_000006E7
	setvar VAR_SPECIAL_x8004, 30
	scrcmd_198 1, 32772
	setvar VAR_SPECIAL_x8005, 1000
	scrcmd_198 2, 32773
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_000006E7:
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_000006F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 7
	gotoif eq, scr_seq_00000119_00000899
scr_seq_00000119_00000707:
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_00000119_00000728
	setvar VAR_SPECIAL_x800C, 500
	scrcmd_198 1, 32780
	msgbox 1
	goto scr_seq_00000119_00000736

scr_seq_00000119_00000728:
	setvar VAR_SPECIAL_x800C, 500
	scrcmd_198 1, 32780
	msgbox 0
scr_seq_00000119_00000736:
	scrcmd_113 20, 2
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000846
	scrcmd_507 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000119_00000773
	scrcmd_332 32772
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_00000119_00000853
scr_seq_00000119_00000773:
	hasenoughmoneyimmediate 32780, 500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000119_00000876
	setvar VAR_SPECIAL_x800C, 500
	scrcmd_198 1, 32780
	msgbox 2
	play_se SEQ_SE_DP_REGI
	submoneyimmediate 500
	scrcmd_115
	msgbox 4
	scrcmd_190 0
	setvar VAR_SPECIAL_x800C, 30
	scrcmd_198 1, 32780
	msgbox 5
	scrcmd_078 1185
	scrcmd_079
	msgbox 6
	closemsg
	scrcmd_114
	scrcmd_600
	apply_movement 255, scr_seq_00000119_000008C4
	wait_movement
	scrcmd_307 0, 0, 5, 5, 77
	call scr_seq_00000119_000008AF
	apply_movement 255, scr_seq_00000119_000008D0
	wait_movement
	call scr_seq_00000119_000008B7
	setvar VAR_UNK_40E3, 1
	scrcmd_447 0, 0
	scrcmd_240 173, 1, 5, 2, 1
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 357, 0, 79, 100, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_098 253
	scrcmd_606
	apply_movement 253, scr_seq_00000119_00000200
	wait_movement
	scrcmd_099 253
	releaseall
	end

scr_seq_00000119_00000846:
	scrcmd_114
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000853:
	scrcmd_114
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_00000119_0000086B
	msgbox 13
	goto scr_seq_00000119_0000086E

scr_seq_00000119_0000086B:
	msgbox 12
scr_seq_00000119_0000086E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000876:
	scrcmd_114
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_00000119_0000088E
	msgbox 11
	goto scr_seq_00000119_00000891

scr_seq_00000119_0000088E:
	msgbox 10
scr_seq_00000119_00000891:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000899:
	checkflag FLAG_UNK_183
	gotoif eq, scr_seq_00000119_00000707
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_000008AF:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_00000119_000008B7:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_00000119_000008C2:
	.byte 0x00, 0x00

scr_seq_00000119_000008C4:
	.short 15, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000119_000008D0:
	.short 12, 4
	.short 254, 0
scr_seq_00000119_000008D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 0
	gotoif eq, scr_seq_00000119_000009DC
	comparevartovalue VAR_UNK_4057, 1
	gotoif eq, scr_seq_00000119_000009DC
	comparevartovalue VAR_UNK_4057, 2
	gotoif eq, scr_seq_00000119_000009DC
	comparevartovalue VAR_UNK_4057, 3
	gotoif eq, scr_seq_00000119_000009DC
	msgbox 19
	scrcmd_746
scr_seq_00000119_00000919:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 457, 255, 0
	scrcmd_751 458, 255, 1
	scrcmd_751 459, 255, 2
	scrcmd_751 460, 255, 3
	scrcmd_751 461, 255, 4
	scrcmd_751 462, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000119_000009A2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000119_000009AB
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000119_000009B4
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000119_000009BD
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000119_000009C6
	goto scr_seq_00000119_000009CF

scr_seq_00000119_000009A0:
	.byte 0x02, 0x00
scr_seq_00000119_000009A2:
	msgbox 20
	goto scr_seq_00000119_00000919

scr_seq_00000119_000009AB:
	msgbox 21
	goto scr_seq_00000119_00000919

scr_seq_00000119_000009B4:
	msgbox 22
	goto scr_seq_00000119_00000919

scr_seq_00000119_000009BD:
	msgbox 23
	goto scr_seq_00000119_00000919

scr_seq_00000119_000009C6:
	msgbox 24
	goto scr_seq_00000119_00000919

scr_seq_00000119_000009CF:
	scrcmd_747
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_000009DC:
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_000009E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 7
	gotoif eq, scr_seq_00000119_00000C21
scr_seq_00000119_000009FC:
	scrcmd_247
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000119_00000DF2
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_00000119_00000A26
	msgbox 65
	goto scr_seq_00000119_00000A29

scr_seq_00000119_00000A26:
	msgbox 66
scr_seq_00000119_00000A29:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000BFC
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000A5D
	goto scr_seq_00000119_00000C16

scr_seq_00000119_00000A5B:
	.byte 0x02, 0x00
scr_seq_00000119_00000A5D:
	scrcmd_746
	msgbox 71
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000119_00000AAC
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000119_00000B2F
	goto scr_seq_00000119_00000BFC

scr_seq_00000119_00000AAA:
	.byte 0x02, 0x00
scr_seq_00000119_00000AAC:
	msgbox 86
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000A5D
	setvar VAR_SPECIAL_x8004, 39
	setvar VAR_SPECIAL_x8005, 0
	scrcmd_226 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000B05
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000119_00000B11
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000119_00000B20
	goto scr_seq_00000119_00000BB2

scr_seq_00000119_00000B03:
	.byte 0x02, 0x00
scr_seq_00000119_00000B05:
	scrcmd_283
	scrcmd_746
	goto scr_seq_00000119_00000A5D

scr_seq_00000119_00000B0F:
	.byte 0x02
	.byte 0x00
scr_seq_00000119_00000B11:
	scrcmd_283
	scrcmd_747
	msgbox 87
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000B20:
	scrcmd_283
	msgbox 85
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000119_00000B2F:
	msgbox 86
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000A5D
	setvar VAR_SPECIAL_x8004, 39
	setvar VAR_SPECIAL_x8005, 0
	scrcmd_227 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000B88
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000119_00000B94
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000119_00000BA3
	goto scr_seq_00000119_00000BB2

scr_seq_00000119_00000B86:
	.byte 0x02, 0x00
scr_seq_00000119_00000B88:
	scrcmd_283
	scrcmd_746
	goto scr_seq_00000119_00000A5D

scr_seq_00000119_00000B92:
	.byte 0x02, 0x00
scr_seq_00000119_00000B94:
	scrcmd_283
	msgbox 87
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000119_00000BA3:
	scrcmd_283
	msgbox 85
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000119_00000BB2:
	setvar VAR_UNK_4133, 1
	msgbox 81
	scrcmd_257 96
	scrcmd_822
	scrcmd_283
	setvar VAR_TEMP_x4000, 0
	scrcmd_823 16384
	scrcmd_746
	msgbox 82
	msgbox 88
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	scrcmd_190 0
	msgbox 89
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	msgbox 83
	setvar VAR_UNK_4133, 0
	scrcmd_747
	closemsg
	releaseall
	end

scr_seq_00000119_00000BFC:
	msgbox 85
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000119_00000C09:
	.byte 0x2d, 0x00, 0x55, 0x32, 0x00, 0x35, 0x00
	.byte 0xeb, 0x02, 0x61, 0x00, 0x02, 0x00
scr_seq_00000119_00000C16:
	msgbox 85
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000C21:
	checkflag FLAG_UNK_183
	gotoif eq, scr_seq_00000119_000009FC
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000C37:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 7
	gotoif eq, scr_seq_00000119_00000DFD
scr_seq_00000119_00000C4C:
	scrcmd_247
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000119_00000DF2
	scrcmd_824 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000119_00000C84
	setvar VAR_TEMP_x4000, 0
	scrcmd_823 16384
	msgbox 54
	goto scr_seq_00000119_00000C8F

scr_seq_00000119_00000C84:
	msgbox 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000C8F:
	scrcmd_113 20, 2
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000D9F
	scrcmd_507 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000119_00000CCC
	scrcmd_332 32772
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_00000119_00000DAC
scr_seq_00000119_00000CCC:
	hasenoughmoneyimmediate 32780, 500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000119_00000DCF
	setvar VAR_SPECIAL_x800C, 500
	scrcmd_198 1, 32780
	msgbox 55
	play_se SEQ_SE_DP_REGI
	submoneyimmediate 500
	scrcmd_115
	msgbox 57
	scrcmd_190 0
	setvar VAR_SPECIAL_x800C, 30
	scrcmd_198 1, 32780
	msgbox 58
	scrcmd_078 1185
	scrcmd_079
	msgbox 59
	closemsg
	scrcmd_114
	scrcmd_600
	apply_movement 255, scr_seq_00000119_000008C4
	wait_movement
	scrcmd_307 0, 0, 19, 5, 77
	call scr_seq_00000119_000008AF
	apply_movement 255, scr_seq_00000119_000008D0
	wait_movement
	call scr_seq_00000119_000008B7
	setvar VAR_UNK_40E3, 3
	scrcmd_447 0, 1
	scrcmd_240 173, 2, 19, 2, 1
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 357, 0, 79, 100, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_098 253
	scrcmd_606
	apply_movement 253, scr_seq_00000119_00000200
	wait_movement
	scrcmd_099 253
	releaseall
	end

scr_seq_00000119_00000D9F:
	scrcmd_114
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000DAC:
	scrcmd_114
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_00000119_00000DC4
	msgbox 13
	goto scr_seq_00000119_00000DC7

scr_seq_00000119_00000DC4:
	msgbox 12
scr_seq_00000119_00000DC7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000DCF:
	scrcmd_114
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_00000119_00000DE7
	msgbox 11
	goto scr_seq_00000119_00000DEA

scr_seq_00000119_00000DE7:
	msgbox 10
scr_seq_00000119_00000DEA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000DF2:
	msgbox 84
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000DFD:
	checkflag FLAG_UNK_183
	gotoif eq, scr_seq_00000119_00000C4C
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000E13:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_247
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000119_00000E73
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_00000119_00000E45
	msgbox 93
	goto scr_seq_00000119_00000E48

scr_seq_00000119_00000E45:
	msgbox 94
scr_seq_00000119_00000E48:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000119_00000E68
	msgbox 95
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000E68:
	msgbox 96
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000E73:
	msgbox 92
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000E7E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 0
	gotoif eq, scr_seq_00000119_00000EF1
	comparevartovalue VAR_UNK_4057, 1
	gotoif eq, scr_seq_00000119_00000EF1
	comparevartovalue VAR_UNK_4057, 2
	gotoif eq, scr_seq_00000119_00000EF1
	comparevartovalue VAR_UNK_4057, 3
	gotoif eq, scr_seq_00000119_00000EF1
	scrcmd_190 0
	msgbox 27
	closemsg
	clearflag FLAG_UNK_99D
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_716
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	checkflag FLAG_UNK_99D
	gotoif eq, scr_seq_00000119_00000EFC
	releaseall
	end

scr_seq_00000119_00000EF1:
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000119_00000EFC:
	scrcmd_561 0, 2, 10, 6
	play_se SEQ_SE_DP_KI_GASYAN
	msgbox 91
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
