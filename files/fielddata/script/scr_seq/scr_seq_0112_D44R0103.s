#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0112_D44R0103_0458 ; 000
	scrdef scr_seq_0112_D44R0103_0550 ; 001
	scrdef scr_seq_0112_D44R0103_0563 ; 002
	scrdef scr_seq_0112_D44R0103_007B ; 003
	scrdef scr_seq_0112_D44R0103_001A ; 004
	scrdef scr_seq_0112_D44R0103_0576 ; 005
	scrdef_end

scr_seq_0112_D44R0103_001A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0112_D44R0103_002B
	clearflag FLAG_UNK_189
	end

scr_seq_0112_D44R0103_002B:
	checkflag FLAG_UNK_0EA
	gotoif TRUE, scr_seq_0112_D44R0103_003C
	goto scr_seq_0112_D44R0103_005A

scr_seq_0112_D44R0103_003C:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0112_D44R0103_0064
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0112_D44R0103_0064
scr_seq_0112_D44R0103_005A:
	setflag FLAG_UNK_27E
	goto scr_seq_0112_D44R0103_0068

scr_seq_0112_D44R0103_0064:
	clearflag FLAG_UNK_27E
scr_seq_0112_D44R0103_0068:
	checkflag FLAG_UNK_0DC
	gotoif TRUE, scr_seq_0112_D44R0103_0075
	end

scr_seq_0112_D44R0103_0075:
	setflag FLAG_UNK_0DD
	end

scr_seq_0112_D44R0103_007B:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0112_D44R0103_0370
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 0
scr_seq_0112_D44R0103_00A0:
	setvar VAR_SPECIAL_x8004, 0
	npc_msg 1
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 280, 255, 0
	scrcmd_751 281, 255, 1
	scrcmd_751 282, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	npc_msg 9
scr_seq_0112_D44R0103_00DF:
	setvar VAR_SPECIAL_x8004, 1
	npc_msg 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 283, 255, 0
	scrcmd_751 284, 255, 0
	scrcmd_751 285, 255, 1
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	npc_msg 9
scr_seq_0112_D44R0103_011E:
	setvar VAR_SPECIAL_x8004, 2
	npc_msg 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 286, 255, 1
	scrcmd_751 287, 255, 0
	scrcmd_751 288, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	npc_msg 9
scr_seq_0112_D44R0103_015D:
	setvar VAR_SPECIAL_x8004, 3
	npc_msg 4
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 289, 255, 0
	scrcmd_751 290, 255, 1
	scrcmd_751 291, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	npc_msg 9
scr_seq_0112_D44R0103_019C:
	setvar VAR_SPECIAL_x8004, 4
	npc_msg 5
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 292, 255, 1
	scrcmd_751 293, 255, 0
	scrcmd_751 294, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	buffer_players_name 0
	npc_msg 6
	closemsg
	show_person_at 3, 6, 0, 21, 0
	wait 10, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_DOOR
	wait 5, VAR_SPECIAL_x8004
	callstd 2044
	apply_movement 255, scr_seq_0112_D44R0103_0390
	apply_movement 3, scr_seq_0112_D44R0103_03A8
	wait_movement
	npc_msg 10
	apply_movement 3, scr_seq_0112_D44R0103_03C0
	wait_movement
	npc_msg 11
	apply_movement 3, scr_seq_0112_D44R0103_03D0
	wait_movement
	npc_msg 12
	apply_movement 0, scr_seq_0112_D44R0103_03DC
	wait_movement
	npc_msg 13
	apply_movement 3, scr_seq_0112_D44R0103_03EC
	wait_movement
	npc_msg 14
	apply_movement 3, scr_seq_0112_D44R0103_03F4
	apply_movement 0, scr_seq_0112_D44R0103_03FC
	wait_movement
	npc_msg 15
	buffer_players_name 0
	npc_msg 16
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge 7
	npc_msg 17
	apply_movement 0, scr_seq_0112_D44R0103_0408
	apply_movement 255, scr_seq_0112_D44R0103_0418
	apply_movement 3, scr_seq_0112_D44R0103_0424
	wait_movement
	npc_msg 18
	closemsg
	wait 15, VAR_SPECIAL_x8005
	npc_msg 19
	closemsg
	apply_movement 3, scr_seq_0112_D44R0103_0434
	wait_movement
	hide_person 3
	callstd 2045
	wait_fanfare
	apply_movement 0, scr_seq_0112_D44R0103_0450
	wait_movement
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0112_D44R0103_02D3
	npc_msg 20
	goto scr_seq_0112_D44R0103_02D6

scr_seq_0112_D44R0103_02D3:
	npc_msg 21
scr_seq_0112_D44R0103_02D6:
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_998
	setflag FLAG_UNK_0EA
	clearflag FLAG_UNK_209
	setvar VAR_UNK_40C4, 1
	setflag FLAG_UNK_2E5
	setvar VAR_UNK_40C3, 1
	setvar VAR_UNK_407B, 1
	setvar VAR_UNK_4108, 8
	clearflag FLAG_UNK_1A6
	setvar VAR_UNK_4081, 1
	end

scr_seq_0112_D44R0103_0310:
	setflag FLAG_UNK_0DB
	apply_movement 0, scr_seq_0112_D44R0103_0378
	wait_movement
	npc_msg 7
	apply_movement 0, scr_seq_0112_D44R0103_0388
	wait_movement
	npc_msg 8
	scrcmd_049
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0112_D44R0103_00A0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0112_D44R0103_00DF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0112_D44R0103_011E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0112_D44R0103_015D
	goto scr_seq_0112_D44R0103_019C


scr_seq_0112_D44R0103_0370:
	.short 12, 8
	.short 254, 0

scr_seq_0112_D44R0103_0378:
	.short 63, 2
	.short 3, 1
	.short 63, 2
	.short 254, 0

scr_seq_0112_D44R0103_0388:
	.short 1, 1
	.short 254, 0

scr_seq_0112_D44R0103_0390:
	.short 63, 1
	.short 75, 1
	.short 1, 1
	.short 63, 8
	.short 2, 1
	.short 254, 0

scr_seq_0112_D44R0103_03A8:
	.short 63, 4
	.short 12, 8
	.short 14, 1
	.short 12, 2
	.short 3, 1
	.short 254, 0

scr_seq_0112_D44R0103_03C0:
	.short 63, 1
	.short 71, 1
	.short 18, 1
	.short 254, 0

scr_seq_0112_D44R0103_03D0:
	.short 63, 1
	.short 10, 1
	.short 254, 0

scr_seq_0112_D44R0103_03DC:
	.short 63, 1
	.short 9, 1
	.short 10, 1
	.short 254, 0

scr_seq_0112_D44R0103_03EC:
	.short 75, 1
	.short 254, 0

scr_seq_0112_D44R0103_03F4:
	.short 15, 2
	.short 254, 0

scr_seq_0112_D44R0103_03FC:
	.short 63, 2
	.short 3, 1
	.short 254, 0

scr_seq_0112_D44R0103_0408:
	.short 8, 1
	.short 11, 1
	.short 1, 1
	.short 254, 0

scr_seq_0112_D44R0103_0418:
	.short 65, 2
	.short 0, 1
	.short 254, 0

scr_seq_0112_D44R0103_0424:
	.short 72, 1
	.short 65, 2
	.short 0, 1
	.short 254, 0

scr_seq_0112_D44R0103_0434:
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 21, 3
	.short 23, 1
	.short 21, 4
	.short 254, 0

scr_seq_0112_D44R0103_0450:
	.short 33, 1
	.short 254, 0
scr_seq_0112_D44R0103_0458:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0DD
	gotoif TRUE, scr_seq_0112_D44R0103_053D
	checkflag FLAG_UNK_0DC
	gotoif TRUE, scr_seq_0112_D44R0103_052E
	checkflag FLAG_UNK_0DA
	gotoif TRUE, scr_seq_0112_D44R0103_04A6
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0112_D44R0103_049B
	npc_msg 20
	goto scr_seq_0112_D44R0103_049E

scr_seq_0112_D44R0103_049B:
	npc_msg 22
scr_seq_0112_D44R0103_049E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_04A6:
	npc_msg 26
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_0112_D44R0103_04C3
	npc_msg 28
	goto scr_seq_0112_D44R0103_0548

scr_seq_0112_D44R0103_04C3:
	buffer_players_name 0
	npc_msg 27
	play_fanfare SEQ_ME_SHINKAOME
	wait_fanfare
	scrcmd_137 147, 15, 0, 0, 0, 32780
	checkflag FLAG_UNK_0DB
	gotoif TRUE, scr_seq_0112_D44R0103_04F0
	scrcmd_139 32773, 0, 245
scr_seq_0112_D44R0103_04F0:
	npc_msg 32
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0112_D44R0103_050E
	goto scr_seq_0112_D44R0103_052E

scr_seq_0112_D44R0103_050E:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0112_D44R0103_052E:
	setflag FLAG_UNK_0DC
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_053D:
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_0548:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_0550:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_0563:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_0576:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_069E
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_06B2
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0112_D44R0103_05EF
	apply_movement 255, scr_seq_0112_D44R0103_06C8
	apply_movement 4, scr_seq_0112_D44R0103_0714
	goto scr_seq_0112_D44R0103_063D

scr_seq_0112_D44R0103_05EF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0112_D44R0103_060A
	apply_movement 255, scr_seq_0112_D44R0103_06E0
	goto scr_seq_0112_D44R0103_063D

scr_seq_0112_D44R0103_060A:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0112_D44R0103_062D
	apply_movement 255, scr_seq_0112_D44R0103_0700
	apply_movement 4, scr_seq_0112_D44R0103_0714
	goto scr_seq_0112_D44R0103_063D

scr_seq_0112_D44R0103_062D:
	apply_movement 255, scr_seq_0112_D44R0103_06EC
	apply_movement 4, scr_seq_0112_D44R0103_0714
scr_seq_0112_D44R0103_063D:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0112_D44R0103_0664
	apply_movement 253, scr_seq_0112_D44R0103_0720
	wait_movement
scr_seq_0112_D44R0103_0664:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 46
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_069E:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_06B2:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_06C6:
	.byte 0x00, 0x00

scr_seq_0112_D44R0103_06C8:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0112_D44R0103_06E0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0112_D44R0103_06EC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0112_D44R0103_0700:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0112_D44R0103_0714:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0112_D44R0103_0720:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
