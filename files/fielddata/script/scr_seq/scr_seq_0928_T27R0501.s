#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0928_T27R0501_0580 ; 000
	scrdef scr_seq_0928_T27R0501_05FC ; 001
	scrdef scr_seq_0928_T27R0501_0617 ; 002
	scrdef scr_seq_0928_T27R0501_02FC ; 003
	scrdef scr_seq_0928_T27R0501_0488 ; 004
	scrdef scr_seq_0928_T27R0501_06FB ; 005
	scrdef scr_seq_0928_T27R0501_072F ; 006
	scrdef scr_seq_0928_T27R0501_0763 ; 007
	scrdef scr_seq_0928_T27R0501_087A ; 008
	scrdef scr_seq_0928_T27R0501_08AE ; 009
	scrdef scr_seq_0928_T27R0501_06E8 ; 010
	scrdef scr_seq_0928_T27R0501_04CE ; 011
	scrdef scr_seq_0928_T27R0501_0527 ; 012
	scrdef scr_seq_0928_T27R0501_0046 ; 013
	scrdef scr_seq_0928_T27R0501_06A5 ; 014
	scrdef scr_seq_0928_T27R0501_0138 ; 015
	scrdef scr_seq_0928_T27R0501_08E2 ; 016
	scrdef_end

scr_seq_0928_T27R0501_0046:
	comparevartovalue VAR_UNK_410C, 1
	gotoif gt, scr_seq_0928_T27R0501_0057
	scrcmd_375 12
scr_seq_0928_T27R0501_0057:
	comparevartovalue VAR_UNK_410C, 0
	gotoif ne, scr_seq_0928_T27R0501_007C
	move_person 9, 6, 0, 6, 3
	move_person 6, 8, 0, 6, 2
scr_seq_0928_T27R0501_007C:
	comparevartovalue VAR_TEMP_x4009, 222
	gotoif ne, scr_seq_0928_T27R0501_0110
	move_person 9, 29, 0, 29, 1
	scrcmd_375 9
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0928_T27R0501_00BC
	move_person 12, 7, 0, 6, 1
	goto scr_seq_0928_T27R0501_0106

scr_seq_0928_T27R0501_00BC:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0928_T27R0501_00DB
	move_person 12, 7, 0, 6, 0
	goto scr_seq_0928_T27R0501_0106

scr_seq_0928_T27R0501_00DB:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0928_T27R0501_00FA
	move_person 12, 7, 0, 6, 3
	goto scr_seq_0928_T27R0501_0106

scr_seq_0928_T27R0501_00FA:
	move_person 12, 7, 0, 6, 2
scr_seq_0928_T27R0501_0106:
	scrcmd_374 12
	setvar VAR_TEMP_x4009, 0
scr_seq_0928_T27R0501_0110:
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, scr_seq_0928_T27R0501_0136
	comparevartovalue VAR_UNK_410C, 3
	gotoif ne, scr_seq_0928_T27R0501_0136
	move_person 6, 7, 0, 6, 1
scr_seq_0928_T27R0501_0136:
	end

scr_seq_0928_T27R0501_0138:
	scrcmd_609
	lockall
	npc_msg 0
	closemsg
	apply_movement 9, scr_seq_0928_T27R0501_01CC
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_0928_T27R0501_01D4
	wait_movement
	wait 10, VAR_SPECIAL_x800C
	apply_movement 9, scr_seq_0928_T27R0501_01F0
	wait_movement
	npc_msg 1
	closemsg
	apply_movement 6, scr_seq_0928_T27R0501_01F8
	wait_movement
	npc_msg 2
	closemsg
	apply_movement 9, scr_seq_0928_T27R0501_0200
	wait_movement
	npc_msg 3
	closemsg
	apply_movement 6, scr_seq_0928_T27R0501_0208
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 9, scr_seq_0928_T27R0501_0218
	wait_movement
	apply_movement 9, scr_seq_0928_T27R0501_0220
	apply_movement 241, scr_seq_0928_T27R0501_01DC
	wait_movement
	scrcmd_103
	releaseall
	setvar VAR_UNK_410C, 1
	end

scr_seq_0928_T27R0501_01CB:
	.byte 0x00

scr_seq_0928_T27R0501_01CC:
	step 3, 1
	step_end

scr_seq_0928_T27R0501_01D4:
	step 76, 9
	step_end

scr_seq_0928_T27R0501_01DC:
	step 66, 1
	step 77, 9
	step_end
	.byte 0x0c, 0x00, 0x03, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0928_T27R0501_01F0:
	step 15, 1
	step_end

scr_seq_0928_T27R0501_01F8:
	step 38, 1
	step_end

scr_seq_0928_T27R0501_0200:
	step 51, 2
	step_end

scr_seq_0928_T27R0501_0208:
	step 71, 1
	step 15, 2
	step 72, 1
	step_end

scr_seq_0928_T27R0501_0218:
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0220:
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step_end
scr_seq_0928_T27R0501_02FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_ROCKET
	npc_msg 5
	closemsg
	setvar VAR_TEMP_x4009, 222
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_26, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0928_T27R0501_040C
	npc_msg 6
	closemsg
	scrcmd_386 VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_0928_T27R0501_0354
	apply_movement 12, scr_seq_0928_T27R0501_0414
	goto scr_seq_0928_T27R0501_0392

scr_seq_0928_T27R0501_0354:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0928_T27R0501_036F
	apply_movement 12, scr_seq_0928_T27R0501_0424
	goto scr_seq_0928_T27R0501_0392

scr_seq_0928_T27R0501_036F:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_0928_T27R0501_038A
	apply_movement 12, scr_seq_0928_T27R0501_0434
	goto scr_seq_0928_T27R0501_0392

scr_seq_0928_T27R0501_038A:
	apply_movement 12, scr_seq_0928_T27R0501_0444
scr_seq_0928_T27R0501_0392:
	wait_movement
	npc_msg 7
	closemsg
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_0928_T27R0501_03B4
	apply_movement 12, scr_seq_0928_T27R0501_0454
	goto scr_seq_0928_T27R0501_03F2

scr_seq_0928_T27R0501_03B4:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0928_T27R0501_03CF
	apply_movement 12, scr_seq_0928_T27R0501_0460
	goto scr_seq_0928_T27R0501_03F2

scr_seq_0928_T27R0501_03CF:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_0928_T27R0501_03EA
	apply_movement 12, scr_seq_0928_T27R0501_046C
	goto scr_seq_0928_T27R0501_03F2

scr_seq_0928_T27R0501_03EA:
	apply_movement 12, scr_seq_0928_T27R0501_0478
scr_seq_0928_T27R0501_03F2:
	wait_movement
	hide_person 12
	setflag FLAG_UNK_23A
	releaseall
	setvar VAR_UNK_410C, 2
	setvar VAR_TEMP_x400A, 10
	end

scr_seq_0928_T27R0501_040C:
	white_out
	releaseall
	end

scr_seq_0928_T27R0501_0412:
	.byte 0x00, 0x00

scr_seq_0928_T27R0501_0414:
	step 71, 1
	step 12, 1
	step 72, 1
	step_end

scr_seq_0928_T27R0501_0424:
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

scr_seq_0928_T27R0501_0434:
	step 71, 1
	step 14, 1
	step 72, 1
	step_end

scr_seq_0928_T27R0501_0444:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

scr_seq_0928_T27R0501_0454:
	step 18, 4
	step 17, 12
	step_end

scr_seq_0928_T27R0501_0460:
	step 18, 4
	step 17, 10
	step_end

scr_seq_0928_T27R0501_046C:
	step 18, 3
	step 17, 10
	step_end

scr_seq_0928_T27R0501_0478:
	step 17, 1
	step 19, 3
	step 17, 9
	step_end
scr_seq_0928_T27R0501_0488:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, scr_seq_0928_T27R0501_04B5
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, scr_seq_0928_T27R0501_04C0
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_04B5:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_04C0:
	buffer_players_name 0
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_04CE:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_0928_T27R0501_05B4
	wait_movement
	npc_msg 26
	setvar VAR_SPECIAL_x8004, 422
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0928_T27R0501_05A9
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A2
	setvar VAR_UNK_410C, 3
	setvar VAR_UNK_4090, 1
	npc_msg 28
	closemsg
	apply_movement 2, scr_seq_0928_T27R0501_05C4
	wait_movement
	releaseall
	end

scr_seq_0928_T27R0501_0527:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_0928_T27R0501_05D8
	wait_movement
	npc_msg 26
	setvar VAR_SPECIAL_x8004, 422
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0928_T27R0501_05A9
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A2
	setvar VAR_UNK_4090, 1
	setvar VAR_UNK_410C, 3
	npc_msg 28
	closemsg
	apply_movement 2, scr_seq_0928_T27R0501_05E8
	wait_movement
	releaseall
	end

scr_seq_0928_T27R0501_0580:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0A2
	gotoif TRUE, scr_seq_0928_T27R0501_059E
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_059E:
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_05A9:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_05B3:
	.byte 0x00

scr_seq_0928_T27R0501_05B4:
	step 12, 1
	step 14, 5
	step 12, 2
	step_end

scr_seq_0928_T27R0501_05C4:
	step 13, 2
	step 15, 5
	step 13, 1
	step 0, 1
	step_end

scr_seq_0928_T27R0501_05D8:
	step 12, 1
	step 15, 3
	step 12, 2
	step_end

scr_seq_0928_T27R0501_05E8:
	step 13, 2
	step 14, 3
	step 13, 1
	step 0, 1
	step_end
scr_seq_0928_T27R0501_05FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 54, 0
	npc_msg 30
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_0617:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, scr_seq_0928_T27R0501_0644
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, scr_seq_0928_T27R0501_064F
	npc_msg 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_0644:
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_064F:
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_0928_T27R0501_0665
	npc_msg 32
	goto scr_seq_0928_T27R0501_067E

scr_seq_0928_T27R0501_0665:
	comparevartovalue VAR_TEMP_x400B, 1
	gotoif ne, scr_seq_0928_T27R0501_067B
	npc_msg 34
	goto scr_seq_0928_T27R0501_067E

scr_seq_0928_T27R0501_067B:
	npc_msg 35
scr_seq_0928_T27R0501_067E:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_TEMP_x400B, 2
	gotoif ge, scr_seq_0928_T27R0501_069D
	addvar VAR_TEMP_x400B, 1
	goto scr_seq_0928_T27R0501_06A3

scr_seq_0928_T27R0501_069D:
	setvar VAR_TEMP_x400B, 0
scr_seq_0928_T27R0501_06A3:
	end

scr_seq_0928_T27R0501_06A5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, scr_seq_0928_T27R0501_06D2
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, scr_seq_0928_T27R0501_06DD
	npc_msg 36
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_06D2:
	npc_msg 38
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_06DD:
	npc_msg 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_06E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_06FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0928_T27R0501_0724
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0928_T27R0501_0724
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_0724:
	npc_msg 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_072F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0928_T27R0501_0758
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0928_T27R0501_0758
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_0758:
	npc_msg 41
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_0763:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 77
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0928_T27R0501_0868
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0928_T27R0501_0868
	npc_msg 13
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x8004
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_0928_T27R0501_0BD3
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, scr_seq_0928_T27R0501_07BA
	goto scr_seq_0928_T27R0501_0944

scr_seq_0928_T27R0501_07B8:
	.byte 0x02, 0x00
scr_seq_0928_T27R0501_07BA:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0928_T27R0501_07DF
	apply_movement 255, scr_seq_0928_T27R0501_0828
	goto scr_seq_0928_T27R0501_080F

scr_seq_0928_T27R0501_07DF:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0928_T27R0501_07FA
	apply_movement 255, scr_seq_0928_T27R0501_083C
	goto scr_seq_0928_T27R0501_080F

scr_seq_0928_T27R0501_07FA:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0928_T27R0501_080F
	apply_movement 255, scr_seq_0928_T27R0501_084C
scr_seq_0928_T27R0501_080F:
	apply_movement 10, scr_seq_0928_T27R0501_085C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_0928_T27R0501_0825:
	.byte 0x00, 0x00, 0x00

scr_seq_0928_T27R0501_0828:
	step 15, 1
	step 13, 2
	step 14, 1
	step 32, 1
	step_end

scr_seq_0928_T27R0501_083C:
	step 13, 1
	step 14, 1
	step 32, 1
	step_end

scr_seq_0928_T27R0501_084C:
	step 13, 1
	step 15, 1
	step 32, 1
	step_end

scr_seq_0928_T27R0501_085C:
	step 63, 2
	step 33, 1
	step_end
scr_seq_0928_T27R0501_0868:
	buffer_players_name 0
	npc_msg 42
	waitbutton
	closemsg
	setflag FLAG_UNK_107
	releaseall
	end

scr_seq_0928_T27R0501_087A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0928_T27R0501_08A3
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0928_T27R0501_08A3
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_08A3:
	npc_msg 43
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_08AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0928_T27R0501_08D7
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_0928_T27R0501_08D7
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_08D7:
	npc_msg 44
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0928_T27R0501_08E2:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x8000, 11
	setvar VAR_UNK_410C, 5
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0928_T27R0501_0BF4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0928_T27R0501_092A
	npc_msg 11
	goto scr_seq_0928_T27R0501_092D

scr_seq_0928_T27R0501_092A:
	npc_msg 12
scr_seq_0928_T27R0501_092D:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x8004
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_0928_T27R0501_0BD3
	closemsg
scr_seq_0928_T27R0501_0944:
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 10, scr_seq_0928_T27R0501_0D74
	wait_movement
	npc_msg 45
	closemsg
	wait 10, VAR_SPECIAL_x800C
	trainer_battle TRAINER_KIMONO_GIRL_ZUKI, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0928_T27R0501_0BC9
	apply_movement 10, scr_seq_0928_T27R0501_0C0C
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 4, scr_seq_0928_T27R0501_0C18
	wait_movement
	npc_msg 15
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_NAOKO, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0928_T27R0501_0BC9
	apply_movement 4, scr_seq_0928_T27R0501_0C48
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 8, scr_seq_0928_T27R0501_0C54
	wait_movement
	npc_msg 16
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_MIKI, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0928_T27R0501_0BC9
	apply_movement 8, scr_seq_0928_T27R0501_0C84
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 5, scr_seq_0928_T27R0501_0C90
	wait_movement
	npc_msg 17
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_SAYO, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0928_T27R0501_0BC9
	apply_movement 5, scr_seq_0928_T27R0501_0CBC
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 7, scr_seq_0928_T27R0501_0CCC
	wait_movement
	npc_msg 18
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_KUNI, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0928_T27R0501_0BC9
	apply_movement 7, scr_seq_0928_T27R0501_0CF8
	wait_movement
	apply_movement 10, scr_seq_0928_T27R0501_0D08
	wait_movement
	npc_msg 20
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0928_T27R0501_0AA4
	setvar VAR_SPECIAL_x8004, 474
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_103
	goto scr_seq_0928_T27R0501_0AB8

scr_seq_0928_T27R0501_0AA4:
	setvar VAR_SPECIAL_x8004, 503
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_104
scr_seq_0928_T27R0501_0AB8:
	closemsg
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 6
	wait_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_240
	show_person 11
	apply_movement 11, scr_seq_0928_T27R0501_0D10
	wait_movement
	apply_movement 10, scr_seq_0928_T27R0501_0BEC
	wait_movement
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0928_T27R0501_0B02
	npc_msg 21
	goto scr_seq_0928_T27R0501_0B05

scr_seq_0928_T27R0501_0B02:
	npc_msg 22
scr_seq_0928_T27R0501_0B05:
	closemsg
	apply_movement 10, scr_seq_0928_T27R0501_0BE4
	wait_movement
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0928_T27R0501_0B2A
	npc_msg 23
	goto scr_seq_0928_T27R0501_0B2D

scr_seq_0928_T27R0501_0B2A:
	npc_msg 24
scr_seq_0928_T27R0501_0B2D:
	closemsg
	apply_movement 4, scr_seq_0928_T27R0501_0D1C
	apply_movement 5, scr_seq_0928_T27R0501_0D28
	apply_movement 10, scr_seq_0928_T27R0501_0D38
	apply_movement 7, scr_seq_0928_T27R0501_0D48
	apply_movement 8, scr_seq_0928_T27R0501_0D58
	apply_movement 11, scr_seq_0928_T27R0501_0D64
	wait_movement
	hide_person 4
	hide_person 5
	hide_person 10
	hide_person 7
	hide_person 8
	hide_person 11
	setflag FLAG_UNK_23C
	setflag FLAG_UNK_240
	call scr_seq_0928_T27R0501_0BB0
	setvar VAR_UNK_410C, 6
	setvar VAR_UNK_40FA, 1
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0928_T27R0501_0BAA
	clearflag FLAG_UNK_244
	goto scr_seq_0928_T27R0501_0BAE

scr_seq_0928_T27R0501_0BAA:
	clearflag FLAG_UNK_245
scr_seq_0928_T27R0501_0BAE:
	end

scr_seq_0928_T27R0501_0BB0:
	comparevartovalue VAR_SPECIAL_x8000, 77
	gotoif ne, scr_seq_0928_T27R0501_0BC5
	releaseall
	goto scr_seq_0928_T27R0501_0BC7

scr_seq_0928_T27R0501_0BC5:
	releaseall
scr_seq_0928_T27R0501_0BC7:
	return

scr_seq_0928_T27R0501_0BC9:
	white_out
	call scr_seq_0928_T27R0501_0BB0
	end

scr_seq_0928_T27R0501_0BD3:
	npc_msg 14
	waitbutton
	closemsg
	call scr_seq_0928_T27R0501_0BB0
	end

scr_seq_0928_T27R0501_0BE2:
	.byte 0x00, 0x00

scr_seq_0928_T27R0501_0BE4:
	step 75, 1
	step_end

scr_seq_0928_T27R0501_0BEC:
	step 34, 1
	step_end

scr_seq_0928_T27R0501_0BF4:
	step 12, 5
	step 14, 4
	step 12, 5
	step 15, 4
	step 32, 1
	step_end

scr_seq_0928_T27R0501_0C0C:
	step 12, 1
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0C18:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 35, 1
	step 15, 5
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0C48:
	step 14, 5
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0C54:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 34, 1
	step 14, 5
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0C84:
	step 15, 5
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0C90:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 33, 1
	step 13, 1
	step 15, 3
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0CBC:
	step 14, 3
	step 12, 1
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0CCC:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 33, 1
	step 13, 1
	step 14, 3
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0CF8:
	step 15, 3
	step 12, 1
	step 33, 1
	step_end

scr_seq_0928_T27R0501_0D08:
	step 13, 1
	step_end

scr_seq_0928_T27R0501_0D10:
	step 16, 10
	step 19, 3
	step_end

scr_seq_0928_T27R0501_0D1C:
	step 15, 1
	step 13, 11
	step_end

scr_seq_0928_T27R0501_0D28:
	step 63, 1
	step 14, 1
	step 13, 12
	step_end

scr_seq_0928_T27R0501_0D38:
	step 63, 1
	step 15, 4
	step 13, 11
	step_end

scr_seq_0928_T27R0501_0D48:
	step 63, 1
	step 15, 1
	step 13, 12
	step_end

scr_seq_0928_T27R0501_0D58:
	step 14, 1
	step 13, 11
	step_end

scr_seq_0928_T27R0501_0D64:
	step 63, 2
	step 15, 5
	step 13, 11
	step_end

scr_seq_0928_T27R0501_0D74:
	step 2, 1
	step 62, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 62, 1
	step 2, 1
	step 62, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 33, 1
	step_end
	.balign 4, 0
