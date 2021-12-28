#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0740_T01R0301_0104 ; 000
	scrdef scr_seq_0740_T01R0301_0590 ; 001
	scrdef scr_seq_0740_T01R0301_05A3 ; 002
	scrdef scr_seq_0740_T01R0301_05B9 ; 003
	scrdef scr_seq_0740_T01R0301_05CF ; 004
	scrdef scr_seq_0740_T01R0301_05E0 ; 005
	scrdef scr_seq_0740_T01R0301_006B ; 006
	scrdef scr_seq_0740_T01R0301_05F7 ; 007
	scrdef scr_seq_0740_T01R0301_06A5 ; 008
	scrdef scr_seq_0740_T01R0301_0753 ; 009
	scrdef scr_seq_0740_T01R0301_002E ; 010
	scrdef_end

scr_seq_0740_T01R0301_002E:
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_0740_T01R0301_0057
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_0740_T01R0301_0057
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_0740_T01R0301_0057
	end

scr_seq_0740_T01R0301_0057:
	setflag FLAG_UNK_2FE
	setflag FLAG_UNK_2FF
	setflag FLAG_UNK_300
	setvar VAR_UNK_4131, 6
	end

scr_seq_0740_T01R0301_006B:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0740_T01R0301_00C8
	wait_movement
	buffer_players_name 0
	gender_msgbox 39, 40
	closemsg
	apply_movement 0, scr_seq_0740_T01R0301_00E0
	wait_movement
	npc_msg 41
	closemsg
	apply_movement 0, scr_seq_0740_T01R0301_00F4
	apply_movement 255, scr_seq_0740_T01R0301_00D0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 42
	waitbutton
	closemsg
	setvar VAR_UNK_4131, 2
	releaseall
	end


scr_seq_0740_T01R0301_00C8:
	.short 12, 5
	.short 254, 0

scr_seq_0740_T01R0301_00D0:
	.short 63, 2
	.short 12, 3
	.short 14, 2
	.short 254, 0

scr_seq_0740_T01R0301_00E0:
	.short 0, 1
	.short 63, 4
	.short 1, 1
	.short 63, 3
	.short 254, 0

scr_seq_0740_T01R0301_00F4:
	.short 12, 1
	.short 14, 3
	.short 3, 1
	.short 254, 0
scr_seq_0740_T01R0301_0104:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4096, 2
	gotoif eq, scr_seq_0740_T01R0301_0282
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_0740_T01R0301_0277
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_0740_T01R0301_0277
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_0740_T01R0301_0277
	comparevartovalue VAR_UNK_4131, 2
	gotoif eq, scr_seq_0740_T01R0301_026C
	comparevartovalue VAR_UNK_40F9, 7
	gotoif eq, scr_seq_0740_T01R0301_04B1
	comparevartovalue VAR_UNK_40F9, 5
	gotoif eq, scr_seq_0740_T01R0301_04A6
	comparevartovalue VAR_UNK_40F9, 4
	gotoif eq, scr_seq_0740_T01R0301_02CB
	checkflag FLAG_UNK_185
	gotoif TRUE, scr_seq_0740_T01R0301_01B2
	checkflag FLAG_UNK_12A
	gotoif TRUE, scr_seq_0740_T01R0301_0195
	buffer_players_name 0
	gender_msgbox 0, 1
	setflag FLAG_UNK_12A
scr_seq_0740_T01R0301_0195:
	comparevartovalue VAR_UNK_4135, 0
	gotoif ne, scr_seq_0740_T01R0301_01AB
	npc_msg 8
	goto scr_seq_0740_T01R0301_01B2

scr_seq_0740_T01R0301_01AB:
	buffer_players_name 0
	gender_msgbox 9, 10
scr_seq_0740_T01R0301_01B2:
	checkflag FLAG_UNK_988
	gotoif TRUE, scr_seq_0740_T01R0301_01F2
	callstd 9951
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0740_T01R0301_01EC
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0740_T01R0301_01EC
	scrcmd_424 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0740_T01R0301_01F0
scr_seq_0740_T01R0301_01EC:
	releaseall
	end

scr_seq_0740_T01R0301_01F0:
	scrcmd_049
scr_seq_0740_T01R0301_01F2:
	setflag FLAG_UNK_988
	buffer_players_name 0
	gender_msgbox 4, 5
	npc_msg 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0740_T01R0301_0256
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0740_T01R0301_0261
	npc_msg 29
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 90
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_0256:
	npc_msg 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_0261:
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_026C:
	npc_msg 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_0277:
	npc_msg 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_0282:
	checkflag FLAG_UNK_185
	gotoif TRUE, scr_seq_0740_T01R0301_02C0
	npc_msg 55
	setvar VAR_SPECIAL_x8004, 427
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 56
	buffer_players_name 0
	gender_msgbox 6, 7
	setvar VAR_UNK_4110, 2
	setflag FLAG_UNK_12B
	waitbutton
	closemsg
	setflag FLAG_UNK_185
	releaseall
	end

scr_seq_0740_T01R0301_02C0:
	npc_msg 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_02CB:
	scrcmd_836 32773
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif eq, scr_seq_0740_T01R0301_040D
	checkflag FLAG_UNK_0BC
	gotoif TRUE, scr_seq_0740_T01R0301_03DE
	buffer_players_name 0
	gender_msgbox 11, 12
	closemsg
	apply_movement 0, scr_seq_0740_T01R0301_04D4
	wait_movement
	setflag FLAG_UNK_0BC
	npc_msg 13
	closemsg
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0740_T01R0301_0320
	goto scr_seq_0740_T01R0301_035A

scr_seq_0740_T01R0301_031A:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_0740_T01R0301_0320:
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_0740_T01R0301_0339
	goto scr_seq_0740_T01R0301_037B

scr_seq_0740_T01R0301_0333:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0740_T01R0301_0339:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0740_T01R0301_0352
	goto scr_seq_0740_T01R0301_039C

scr_seq_0740_T01R0301_034C:
	.byte 0x16, 0x00, 0x06, 0x00
	.byte 0x00, 0x00
scr_seq_0740_T01R0301_0352:
	goto scr_seq_0740_T01R0301_03BD

scr_seq_0740_T01R0301_0358:
	.byte 0x5f, 0x00
scr_seq_0740_T01R0301_035A:
	apply_movement 0, scr_seq_0740_T01R0301_0500
	wait_movement
	npc_msg 14
	closemsg
	apply_movement 0, scr_seq_0740_T01R0301_0500
	wait_movement
	goto scr_seq_0740_T01R0301_03DE

scr_seq_0740_T01R0301_0379:
	.byte 0x02, 0x00
scr_seq_0740_T01R0301_037B:
	apply_movement 0, scr_seq_0740_T01R0301_052C
	wait_movement
	npc_msg 14
	closemsg
	apply_movement 0, scr_seq_0740_T01R0301_052C
	wait_movement
	goto scr_seq_0740_T01R0301_03DE

scr_seq_0740_T01R0301_039A:
	.byte 0x02, 0x00
scr_seq_0740_T01R0301_039C:
	apply_movement 0, scr_seq_0740_T01R0301_0558
	wait_movement
	npc_msg 14
	closemsg
	apply_movement 0, scr_seq_0740_T01R0301_0558
	wait_movement
	goto scr_seq_0740_T01R0301_03DE

scr_seq_0740_T01R0301_03BB:
	.byte 0x02, 0x00
scr_seq_0740_T01R0301_03BD:
	apply_movement 0, scr_seq_0740_T01R0301_0584
	wait_movement
	npc_msg 14
	closemsg
	apply_movement 0, scr_seq_0740_T01R0301_0584
	wait_movement
	goto scr_seq_0740_T01R0301_03DE

scr_seq_0740_T01R0301_03DC:
	.byte 0x02, 0x00
scr_seq_0740_T01R0301_03DE:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, scr_seq_0740_T01R0301_03FE
	buffer_players_name 0
	gender_msgbox 15, 16
	closemsg
	goto scr_seq_0740_T01R0301_01B2

scr_seq_0740_T01R0301_03FE:
	buffer_players_name 0
	gender_msgbox 17, 18
	closemsg
	goto scr_seq_0740_T01R0301_01B2

scr_seq_0740_T01R0301_040D:
	checkflag FLAG_UNK_0BC
	gotoif FALSE, scr_seq_0740_T01R0301_04C2
	buffer_players_name 0
	gender_msgbox 19, 20
	closemsg
scr_seq_0740_T01R0301_0421:
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0740_T01R0301_0440
	apply_movement 0, scr_seq_0740_T01R0301_0500
	goto scr_seq_0740_T01R0301_047E

scr_seq_0740_T01R0301_0440:
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_0740_T01R0301_045B
	apply_movement 0, scr_seq_0740_T01R0301_052C
	goto scr_seq_0740_T01R0301_047E

scr_seq_0740_T01R0301_045B:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0740_T01R0301_0476
	apply_movement 0, scr_seq_0740_T01R0301_0558
	goto scr_seq_0740_T01R0301_047E

scr_seq_0740_T01R0301_0476:
	apply_movement 0, scr_seq_0740_T01R0301_0584
scr_seq_0740_T01R0301_047E:
	wait_movement
	buffer_players_name 0
	setvar VAR_SPECIAL_x8004, 532
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	closemsg
	npc_msg 21
	closemsg
	setvar VAR_UNK_40F9, 5
	goto scr_seq_0740_T01R0301_01B2

scr_seq_0740_T01R0301_04A6:
	npc_msg 22
	closemsg
	goto scr_seq_0740_T01R0301_01B2

scr_seq_0740_T01R0301_04B1:
	npc_msg 23
	closemsg
	setvar VAR_UNK_40F9, 8
	goto scr_seq_0740_T01R0301_01B2

scr_seq_0740_T01R0301_04C2:
	buffer_players_name 0
	gender_msgbox 24, 25
	closemsg
	goto scr_seq_0740_T01R0301_0421

scr_seq_0740_T01R0301_04D1:
	.byte 0x00, 0x00, 0x00

scr_seq_0740_T01R0301_04D4:
	.short 75, 1
	.short 63, 1
	.short 254, 0
	.byte 0x20, 0x00, 0x01, 0x00, 0x08, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x04, 0x00, 0x21, 0x00, 0x01, 0x00
	.byte 0x3f, 0x00, 0x04, 0x00, 0x09, 0x00, 0x02, 0x00, 0x21, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0740_T01R0301_0500:
	.short 33, 1
	.short 63, 1
	.short 254, 0
	.byte 0x23, 0x00, 0x01, 0x00
	.byte 0x0b, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x04, 0x00, 0x22, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x04, 0x00
	.byte 0x0a, 0x00, 0x02, 0x00, 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0740_T01R0301_052C:
	.short 34, 1
	.short 63, 1
	.short 254, 0
	.byte 0x22, 0x00, 0x01, 0x00, 0x0a, 0x00, 0x02, 0x00
	.byte 0x3f, 0x00, 0x04, 0x00, 0x23, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x04, 0x00, 0x0b, 0x00, 0x02, 0x00
	.byte 0x23, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0740_T01R0301_0558:
	.short 35, 1
	.short 63, 1
	.short 254, 0
	.byte 0x21, 0x00, 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x04, 0x00
	.byte 0x20, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x04, 0x00, 0x08, 0x00, 0x02, 0x00, 0x20, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_0740_T01R0301_0584:
	.short 32, 1
	.short 63, 1
	.short 254, 0
scr_seq_0740_T01R0301_0590:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_05A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_05B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_05CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 36
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_05E0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	gender_msgbox 37, 38
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_05F7:
	comparevartovalue VAR_UNK_4131, 6
	gotoif eq, scr_seq_0740_T01R0301_0979
	comparevartovalue VAR_UNK_4131, 0
	gotoif eq, scr_seq_0740_T01R0301_097B
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_0740_T01R0301_097B
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_0740_T01R0301_097D
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_0740_T01R0301_097D
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0740_T01R0301_0663
	apply_movement 0, scr_seq_0740_T01R0301_09C4
	goto scr_seq_0740_T01R0301_066B

scr_seq_0740_T01R0301_0663:
	apply_movement 0, scr_seq_0740_T01R0301_09BC
scr_seq_0740_T01R0301_066B:
	wait_movement
	scrcmd_452 1, 0
	scrcmd_076 1, 0
	npc_msg 45
	scrcmd_077
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0740_T01R0301_096C
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8006, 3
	call scr_seq_0740_T01R0301_0801
	end

scr_seq_0740_T01R0301_06A5:
	comparevartovalue VAR_UNK_4131, 6
	gotoif eq, scr_seq_0740_T01R0301_0979
	comparevartovalue VAR_UNK_4131, 0
	gotoif eq, scr_seq_0740_T01R0301_097B
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_0740_T01R0301_097B
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_0740_T01R0301_097D
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_0740_T01R0301_097D
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0740_T01R0301_0711
	apply_movement 0, scr_seq_0740_T01R0301_09C4
	goto scr_seq_0740_T01R0301_0719

scr_seq_0740_T01R0301_0711:
	apply_movement 0, scr_seq_0740_T01R0301_09BC
scr_seq_0740_T01R0301_0719:
	wait_movement
	scrcmd_452 7, 0
	scrcmd_076 7, 0
	npc_msg 44
	scrcmd_077
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0740_T01R0301_096C
	setvar VAR_SPECIAL_x8004, 7
	setvar VAR_SPECIAL_x8006, 4
	call scr_seq_0740_T01R0301_0801
	end

scr_seq_0740_T01R0301_0753:
	comparevartovalue VAR_UNK_4131, 6
	gotoif eq, scr_seq_0740_T01R0301_0979
	comparevartovalue VAR_UNK_4131, 0
	gotoif eq, scr_seq_0740_T01R0301_097B
	comparevartovalue VAR_UNK_4131, 5
	gotoif eq, scr_seq_0740_T01R0301_097B
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4131, 3
	gotoif eq, scr_seq_0740_T01R0301_097D
	comparevartovalue VAR_UNK_4131, 4
	gotoif eq, scr_seq_0740_T01R0301_097D
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0740_T01R0301_07BF
	apply_movement 0, scr_seq_0740_T01R0301_09C4
	goto scr_seq_0740_T01R0301_07C7

scr_seq_0740_T01R0301_07BF:
	apply_movement 0, scr_seq_0740_T01R0301_09BC
scr_seq_0740_T01R0301_07C7:
	wait_movement
	scrcmd_452 4, 0
	scrcmd_076 4, 0
	npc_msg 43
	scrcmd_077
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0740_T01R0301_096C
	setvar VAR_SPECIAL_x8004, 4
	setvar VAR_SPECIAL_x8006, 5
	call scr_seq_0740_T01R0301_0801
	end

scr_seq_0740_T01R0301_0801:
	scrcmd_453
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif eq, scr_seq_0740_T01R0301_098B
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0740_T01R0301_082F
	hide_person 6
	setflag FLAG_UNK_2FE
	goto scr_seq_0740_T01R0301_0852

scr_seq_0740_T01R0301_082F:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_0740_T01R0301_084A
	hide_person 5
	setflag FLAG_UNK_2FF
	goto scr_seq_0740_T01R0301_0852

scr_seq_0740_T01R0301_084A:
	hide_person 4
	setflag FLAG_UNK_300
scr_seq_0740_T01R0301_0852:
	buffer_players_name 0
	scrcmd_202 1, 32772, 0, 0
	npc_msg 46
	npc_msg 48
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	scrcmd_137 32772, 5, 0, 0, 0, 32780
	scrcmd_202 1, 32772, 0, 0
	npc_msg 49
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_0740_T01R0301_0929
	scrcmd_747
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif eq, scr_seq_0740_T01R0301_0908
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0740_T01R0301_08D3
	apply_movement 255, scr_seq_0740_T01R0301_0998
	goto scr_seq_0740_T01R0301_08F6

scr_seq_0740_T01R0301_08D3:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_0740_T01R0301_08EE
	apply_movement 255, scr_seq_0740_T01R0301_09A4
	goto scr_seq_0740_T01R0301_08F6

scr_seq_0740_T01R0301_08EE:
	apply_movement 255, scr_seq_0740_T01R0301_09B0
scr_seq_0740_T01R0301_08F6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0740_T01R0301_0912

scr_seq_0740_T01R0301_0908:
	apply_movement 255, scr_seq_0740_T01R0301_09CC
	wait_movement
scr_seq_0740_T01R0301_0912:
	npc_msg 52
	waitbutton
	closemsg
	releaseall
	copyvar VAR_UNK_4131, VAR_SPECIAL_x8006
	setvar VAR_UNK_40F9, 1
	return

scr_seq_0740_T01R0301_0929:
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_SPECIAL_x8005, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_746
	bufferpartymonnick 1, VAR_SPECIAL_x8005
	npc_msg 50
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0740_T01R0301_0929
	return

scr_seq_0740_T01R0301_096C:
	scrcmd_453
	npc_msg 47
	waitbutton
	closemsg
	scrcmd_747
	releaseall
scr_seq_0740_T01R0301_0979:
	end

scr_seq_0740_T01R0301_097B:
	end

scr_seq_0740_T01R0301_097D:
	scrcmd_191 1
	npc_msg 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0740_T01R0301_098B:
	scrcmd_747
	npc_msg 51
	waitbutton
	closemsg
	releaseall
	return


scr_seq_0740_T01R0301_0998:
	.short 13, 1
	.short 14, 3
	.short 254, 0

scr_seq_0740_T01R0301_09A4:
	.short 13, 1
	.short 14, 2
	.short 254, 0

scr_seq_0740_T01R0301_09B0:
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_0740_T01R0301_09BC:
	.short 3, 1
	.short 254, 0

scr_seq_0740_T01R0301_09C4:
	.short 0, 1
	.short 254, 0

scr_seq_0740_T01R0301_09CC:
	.short 1, 1
	.short 254, 0
	.balign 4, 0
