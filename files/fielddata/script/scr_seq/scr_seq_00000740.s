#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000740_00000104 ; 000
	scrdef scr_seq_00000740_00000590 ; 001
	scrdef scr_seq_00000740_000005A3 ; 002
	scrdef scr_seq_00000740_000005B9 ; 003
	scrdef scr_seq_00000740_000005CF ; 004
	scrdef scr_seq_00000740_000005E0 ; 005
	scrdef scr_seq_00000740_0000006B ; 006
	scrdef scr_seq_00000740_000005F7 ; 007
	scrdef scr_seq_00000740_000006A5 ; 008
	scrdef scr_seq_00000740_00000753 ; 009
	scrdef scr_seq_00000740_0000002E ; 010
	scrdef_end

scr_seq_00000740_0000002E:
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_00000740_00000057
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_00000740_00000057
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_00000740_00000057
	end

scr_seq_00000740_00000057:
	setflag FLAG_UNK_2FE
	setflag FLAG_UNK_2FF
	setflag FLAG_UNK_300
	setvar VAR_UNK_4131, 6
	end

scr_seq_00000740_0000006B:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000740_000000C8
	wait_movement
	buffer_players_name 0
	gender_msgbox 39, 40
	closemsg
	apply_movement 0, scr_seq_00000740_000000E0
	wait_movement
	msgbox 41
	closemsg
	apply_movement 0, scr_seq_00000740_000000F4
	apply_movement 255, scr_seq_00000740_000000D0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 42
	waitbutton
	closemsg
	setvar VAR_UNK_4131, 2
	releaseall
	end


scr_seq_00000740_000000C8:
	.short 12, 5
	.short 254, 0

scr_seq_00000740_000000D0:
	.short 63, 2
	.short 12, 3
	.short 14, 2
	.short 254, 0

scr_seq_00000740_000000E0:
	.short 0, 1
	.short 63, 4
	.short 1, 1
	.short 63, 3
	.short 254, 0

scr_seq_00000740_000000F4:
	.short 12, 1
	.short 14, 3
	.short 3, 1
	.short 254, 0
scr_seq_00000740_00000104:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4096, 2
	gotoif eq, scr_seq_00000740_00000282
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_00000740_00000277
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_00000740_00000277
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_00000740_00000277
	comparevartovalue VAR_UNK_4131, 2
	gotoif eq, scr_seq_00000740_0000026C
	comparevartovalue VAR_UNK_40F9, 7
	gotoif eq, scr_seq_00000740_000004B1
	comparevartovalue VAR_UNK_40F9, 5
	gotoif eq, scr_seq_00000740_000004A6
	comparevartovalue VAR_UNK_40F9, 4
	gotoif eq, scr_seq_00000740_000002CB
	checkflag FLAG_UNK_185
	gotoif TRUE, scr_seq_00000740_000001B2
	checkflag FLAG_UNK_12A
	gotoif TRUE, scr_seq_00000740_00000195
	buffer_players_name 0
	gender_msgbox 0, 1
	setflag FLAG_UNK_12A
scr_seq_00000740_00000195:
	comparevartovalue VAR_UNK_4135, 0
	gotoif ne, scr_seq_00000740_000001AB
	msgbox 8
	goto scr_seq_00000740_000001B2

scr_seq_00000740_000001AB:
	buffer_players_name 0
	gender_msgbox 9, 10
scr_seq_00000740_000001B2:
	checkflag FLAG_UNK_988
	gotoif TRUE, scr_seq_00000740_000001F2
	callstd 9951
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000740_000001EC
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000740_000001EC
	scrcmd_424 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000740_000001F0
scr_seq_00000740_000001EC:
	releaseall
	end

scr_seq_00000740_000001F0:
	scrcmd_049
scr_seq_00000740_000001F2:
	setflag FLAG_UNK_988
	buffer_players_name 0
	gender_msgbox 4, 5
	msgbox 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000740_00000256
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000740_00000261
	msgbox 29
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 90
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_00000256:
	msgbox 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_00000261:
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_0000026C:
	msgbox 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_00000277:
	msgbox 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_00000282:
	checkflag FLAG_UNK_185
	gotoif TRUE, scr_seq_00000740_000002C0
	msgbox 55
	setvar VAR_SPECIAL_x8004, 427
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 56
	buffer_players_name 0
	gender_msgbox 6, 7
	setvar VAR_UNK_4110, 2
	setflag FLAG_UNK_12B
	waitbutton
	closemsg
	setflag FLAG_UNK_185
	releaseall
	end

scr_seq_00000740_000002C0:
	msgbox 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_000002CB:
	scrcmd_836 32773
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif eq, scr_seq_00000740_0000040D
	checkflag FLAG_UNK_0BC
	gotoif TRUE, scr_seq_00000740_000003DE
	buffer_players_name 0
	gender_msgbox 11, 12
	closemsg
	apply_movement 0, scr_seq_00000740_000004D4
	wait_movement
	setflag FLAG_UNK_0BC
	msgbox 13
	closemsg
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000740_00000320
	goto scr_seq_00000740_0000035A

scr_seq_00000740_0000031A:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_00000740_00000320:
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_00000740_00000339
	goto scr_seq_00000740_0000037B

scr_seq_00000740_00000333:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000740_00000339:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_00000740_00000352
	goto scr_seq_00000740_0000039C

scr_seq_00000740_0000034C:
	.byte 0x16, 0x00, 0x06, 0x00
	.byte 0x00, 0x00
scr_seq_00000740_00000352:
	goto scr_seq_00000740_000003BD

scr_seq_00000740_00000358:
	.byte 0x5f, 0x00
scr_seq_00000740_0000035A:
	apply_movement 0, scr_seq_00000740_00000500
	wait_movement
	msgbox 14
	closemsg
	apply_movement 0, scr_seq_00000740_00000500
	wait_movement
	goto scr_seq_00000740_000003DE

scr_seq_00000740_00000379:
	.byte 0x02, 0x00
scr_seq_00000740_0000037B:
	apply_movement 0, scr_seq_00000740_0000052C
	wait_movement
	msgbox 14
	closemsg
	apply_movement 0, scr_seq_00000740_0000052C
	wait_movement
	goto scr_seq_00000740_000003DE

scr_seq_00000740_0000039A:
	.byte 0x02, 0x00
scr_seq_00000740_0000039C:
	apply_movement 0, scr_seq_00000740_00000558
	wait_movement
	msgbox 14
	closemsg
	apply_movement 0, scr_seq_00000740_00000558
	wait_movement
	goto scr_seq_00000740_000003DE

scr_seq_00000740_000003BB:
	.byte 0x02, 0x00
scr_seq_00000740_000003BD:
	apply_movement 0, scr_seq_00000740_00000584
	wait_movement
	msgbox 14
	closemsg
	apply_movement 0, scr_seq_00000740_00000584
	wait_movement
	goto scr_seq_00000740_000003DE

scr_seq_00000740_000003DC:
	.byte 0x02, 0x00
scr_seq_00000740_000003DE:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, scr_seq_00000740_000003FE
	buffer_players_name 0
	gender_msgbox 15, 16
	closemsg
	goto scr_seq_00000740_000001B2

scr_seq_00000740_000003FE:
	buffer_players_name 0
	gender_msgbox 17, 18
	closemsg
	goto scr_seq_00000740_000001B2

scr_seq_00000740_0000040D:
	checkflag FLAG_UNK_0BC
	gotoif FALSE, scr_seq_00000740_000004C2
	buffer_players_name 0
	gender_msgbox 19, 20
	closemsg
scr_seq_00000740_00000421:
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000740_00000440
	apply_movement 0, scr_seq_00000740_00000500
	goto scr_seq_00000740_0000047E

scr_seq_00000740_00000440:
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_00000740_0000045B
	apply_movement 0, scr_seq_00000740_0000052C
	goto scr_seq_00000740_0000047E

scr_seq_00000740_0000045B:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_00000740_00000476
	apply_movement 0, scr_seq_00000740_00000558
	goto scr_seq_00000740_0000047E

scr_seq_00000740_00000476:
	apply_movement 0, scr_seq_00000740_00000584
scr_seq_00000740_0000047E:
	wait_movement
	buffer_players_name 0
	setvar VAR_SPECIAL_x8004, 532
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	closemsg
	msgbox 21
	closemsg
	setvar VAR_UNK_40F9, 5
	goto scr_seq_00000740_000001B2

scr_seq_00000740_000004A6:
	msgbox 22
	closemsg
	goto scr_seq_00000740_000001B2

scr_seq_00000740_000004B1:
	msgbox 23
	closemsg
	setvar VAR_UNK_40F9, 8
	goto scr_seq_00000740_000001B2

scr_seq_00000740_000004C2:
	buffer_players_name 0
	gender_msgbox 24, 25
	closemsg
	goto scr_seq_00000740_00000421

scr_seq_00000740_000004D1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000740_000004D4:
	.short 75, 1
	.short 63, 1
	.short 254, 0
	.byte 0x20, 0x00, 0x01, 0x00, 0x08, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x04, 0x00, 0x21, 0x00, 0x01, 0x00
	.byte 0x3f, 0x00, 0x04, 0x00, 0x09, 0x00, 0x02, 0x00, 0x21, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000740_00000500:
	.short 33, 1
	.short 63, 1
	.short 254, 0
	.byte 0x23, 0x00, 0x01, 0x00
	.byte 0x0b, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x04, 0x00, 0x22, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x04, 0x00
	.byte 0x0a, 0x00, 0x02, 0x00, 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000740_0000052C:
	.short 34, 1
	.short 63, 1
	.short 254, 0
	.byte 0x22, 0x00, 0x01, 0x00, 0x0a, 0x00, 0x02, 0x00
	.byte 0x3f, 0x00, 0x04, 0x00, 0x23, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x04, 0x00, 0x0b, 0x00, 0x02, 0x00
	.byte 0x23, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000740_00000558:
	.short 35, 1
	.short 63, 1
	.short 254, 0
	.byte 0x21, 0x00, 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x04, 0x00
	.byte 0x20, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x04, 0x00, 0x08, 0x00, 0x02, 0x00, 0x20, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_00000740_00000584:
	.short 32, 1
	.short 63, 1
	.short 254, 0
scr_seq_00000740_00000590:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_000005A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	msgbox 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_000005B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	msgbox 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_000005CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 36
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_000005E0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	gender_msgbox 37, 38
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_000005F7:
	comparevartovalue VAR_UNK_4131, 6
	gotoif eq, scr_seq_00000740_00000979
	comparevartovalue VAR_UNK_4131, 0
	gotoif eq, scr_seq_00000740_0000097B
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_00000740_0000097B
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_00000740_0000097D
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_00000740_0000097D
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000740_00000663
	apply_movement 0, scr_seq_00000740_000009C4
	goto scr_seq_00000740_0000066B

scr_seq_00000740_00000663:
	apply_movement 0, scr_seq_00000740_000009BC
scr_seq_00000740_0000066B:
	wait_movement
	scrcmd_452 1, 0
	scrcmd_076 1, 0
	msgbox 45
	scrcmd_077
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000740_0000096C
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8006, 3
	call scr_seq_00000740_00000801
	end

scr_seq_00000740_000006A5:
	comparevartovalue VAR_UNK_4131, 6
	gotoif eq, scr_seq_00000740_00000979
	comparevartovalue VAR_UNK_4131, 0
	gotoif eq, scr_seq_00000740_0000097B
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_00000740_0000097B
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_00000740_0000097D
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_00000740_0000097D
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000740_00000711
	apply_movement 0, scr_seq_00000740_000009C4
	goto scr_seq_00000740_00000719

scr_seq_00000740_00000711:
	apply_movement 0, scr_seq_00000740_000009BC
scr_seq_00000740_00000719:
	wait_movement
	scrcmd_452 7, 0
	scrcmd_076 7, 0
	msgbox 44
	scrcmd_077
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000740_0000096C
	setvar VAR_SPECIAL_x8004, 7
	setvar VAR_SPECIAL_x8006, 4
	call scr_seq_00000740_00000801
	end

scr_seq_00000740_00000753:
	comparevartovalue VAR_UNK_4131, 6
	gotoif eq, scr_seq_00000740_00000979
	comparevartovalue VAR_UNK_4131, 0
	gotoif eq, scr_seq_00000740_0000097B
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_00000740_0000097B
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_00000740_0000097D
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_00000740_0000097D
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000740_000007BF
	apply_movement 0, scr_seq_00000740_000009C4
	goto scr_seq_00000740_000007C7

scr_seq_00000740_000007BF:
	apply_movement 0, scr_seq_00000740_000009BC
scr_seq_00000740_000007C7:
	wait_movement
	scrcmd_452 4, 0
	scrcmd_076 4, 0
	msgbox 43
	scrcmd_077
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000740_0000096C
	setvar VAR_SPECIAL_x8004, 4
	setvar VAR_SPECIAL_x8006, 5
	call scr_seq_00000740_00000801
	end

scr_seq_00000740_00000801:
	scrcmd_453
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif eq, scr_seq_00000740_0000098B
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000740_0000082F
	hide_person 6
	setflag FLAG_UNK_2FE
	goto scr_seq_00000740_00000852

scr_seq_00000740_0000082F:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_00000740_0000084A
	hide_person 5
	setflag FLAG_UNK_2FF
	goto scr_seq_00000740_00000852

scr_seq_00000740_0000084A:
	hide_person 4
	setflag FLAG_UNK_300
scr_seq_00000740_00000852:
	buffer_players_name 0
	scrcmd_202 1, 32772, 0, 0
	msgbox 46
	msgbox 48
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	scrcmd_137 32772, 5, 0, 0, 0, 32780
	scrcmd_202 1, 32772, 0, 0
	msgbox 49
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_00000740_00000929
	scrcmd_747
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif eq, scr_seq_00000740_00000908
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000740_000008D3
	apply_movement 255, scr_seq_00000740_00000998
	goto scr_seq_00000740_000008F6

scr_seq_00000740_000008D3:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_00000740_000008EE
	apply_movement 255, scr_seq_00000740_000009A4
	goto scr_seq_00000740_000008F6

scr_seq_00000740_000008EE:
	apply_movement 255, scr_seq_00000740_000009B0
scr_seq_00000740_000008F6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000740_00000912

scr_seq_00000740_00000908:
	apply_movement 255, scr_seq_00000740_000009CC
	wait_movement
scr_seq_00000740_00000912:
	msgbox 52
	waitbutton
	closemsg
	releaseall
	copyvar VAR_UNK_4131, VAR_SPECIAL_x8006
	setvar VAR_UNK_40F9, 1
	return

scr_seq_00000740_00000929:
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_SPECIAL_x8005, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_746
	bufferpartymonnick 1, VAR_SPECIAL_x8005
	msgbox 50
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000740_00000929
	return

scr_seq_00000740_0000096C:
	scrcmd_453
	msgbox 47
	waitbutton
	closemsg
	scrcmd_747
	releaseall
scr_seq_00000740_00000979:
	end

scr_seq_00000740_0000097B:
	end

scr_seq_00000740_0000097D:
	scrcmd_191 1
	msgbox 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000740_0000098B:
	scrcmd_747
	msgbox 51
	waitbutton
	closemsg
	releaseall
	return


scr_seq_00000740_00000998:
	.short 13, 1
	.short 14, 3
	.short 254, 0

scr_seq_00000740_000009A4:
	.short 13, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000740_000009B0:
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000740_000009BC:
	.short 3, 1
	.short 254, 0

scr_seq_00000740_000009C4:
	.short 0, 1
	.short 254, 0

scr_seq_00000740_000009CC:
	.short 1, 1
	.short 254, 0
	.balign 4, 0
