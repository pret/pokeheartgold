#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0824_T10R0601_005C ; 000
	scrdef scr_seq_0824_T10R0601_000E ; 001
	scrdef scr_seq_0824_T10R0601_0050 ; 002
	scrdef_end

scr_seq_0824_T10R0601_000E:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0824_T10R0601_0048
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_210
	show_person 3
	setvar VAR_UNK_40C8, 1
	releaseall
	end

scr_seq_0824_T10R0601_0046:
	.byte 0x00, 0x00

scr_seq_0824_T10R0601_0048:
	step 12, 6
	step_end
scr_seq_0824_T10R0601_0050:
	setflag FLAG_UNK_210
	setvar VAR_UNK_40C8, 0
	end

scr_seq_0824_T10R0601_005C:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0824_T10R0601_008B
	apply_movement 255, scr_seq_0824_T10R0601_0298
	goto scr_seq_0824_T10R0601_00AE

scr_seq_0824_T10R0601_008B:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0824_T10R0601_00A6
	apply_movement 255, scr_seq_0824_T10R0601_02A8
	goto scr_seq_0824_T10R0601_00AE

scr_seq_0824_T10R0601_00A6:
	apply_movement 255, scr_seq_0824_T10R0601_02B0
scr_seq_0824_T10R0601_00AE:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_0824_T10R0601_02C0
	wait_movement
	buffer_players_name 0
	gender_msgbox 0, 1
	closemsg
	comparevartovalue VAR_UNK_4135, 8
	gotoif lt, scr_seq_0824_T10R0601_00E8
	trainer_battle TRAINER_CHAMPION_LANCE_2, 0, 0, 0
	goto scr_seq_0824_T10R0601_00F0

scr_seq_0824_T10R0601_00E8:
	trainer_battle TRAINER_CHAMPION_LANCE, 0, 0, 0
scr_seq_0824_T10R0601_00F0:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0824_T10R0601_0290
	buffer_players_name 0
	gender_msgbox 2, 3
	closemsg
	wait 10, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_KI_GASYAN
	hide_person 4
	move_person 2, 6, 0, 20, 0
	move_person 1, 6, 0, 17, 0
	wait 30, VAR_SPECIAL_x8004
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	apply_movement 0, scr_seq_0824_T10R0601_02C8
	apply_movement 255, scr_seq_0824_T10R0601_02E0
	wait_movement
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0824_T10R0601_01A1
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0824_T10R0601_017C
	apply_movement 253, scr_seq_0824_T10R0601_02F8
	goto scr_seq_0824_T10R0601_019F

scr_seq_0824_T10R0601_017C:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0824_T10R0601_0197
	apply_movement 253, scr_seq_0824_T10R0601_0308
	goto scr_seq_0824_T10R0601_019F

scr_seq_0824_T10R0601_0197:
	apply_movement 253, scr_seq_0824_T10R0601_0320
scr_seq_0824_T10R0601_019F:
	wait_movement
scr_seq_0824_T10R0601_01A1:
	apply_movement 2, scr_seq_0824_T10R0601_0338
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 1, scr_seq_0824_T10R0601_0348
	apply_movement 2, scr_seq_0824_T10R0601_0350
	wait_movement
	buffer_players_name 0
	gender_msgbox 6, 7
	closemsg
	apply_movement 2, scr_seq_0824_T10R0601_0360
	wait_movement
	npc_msg 8
	apply_movement 0, scr_seq_0824_T10R0601_0368
	apply_movement 255, scr_seq_0824_T10R0601_0378
	wait_movement
	buffer_players_name 0
	gender_msgbox 9, 10
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0824_T10R0601_0384
	apply_movement 255, scr_seq_0824_T10R0601_0394
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0824_T10R0601_0234
	apply_movement 253, scr_seq_0824_T10R0601_03A4
	wait_movement
scr_seq_0824_T10R0601_0234:
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement 2, scr_seq_0824_T10R0601_03AC
	wait_movement
	npc_msg 11
	apply_movement 2, scr_seq_0824_T10R0601_03BC
	wait_movement
	scrcmd_049
	closemsg
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, scr_seq_0824_T10R0601_0268
	clearflag FLAG_UNK_251
	setvar VAR_UNK_411A, 1
scr_seq_0824_T10R0601_0268:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 306, 0, 6, 22, 0
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0824_T10R0601_0290:
	white_out
	releaseall
	end

scr_seq_0824_T10R0601_0296:
	.byte 0x00, 0x00

scr_seq_0824_T10R0601_0298:
	step 12, 2
	step 15, 1
	step 32, 1
	step_end

scr_seq_0824_T10R0601_02A8:
	step 12, 2
	step_end

scr_seq_0824_T10R0601_02B0:
	step 12, 2
	step 14, 1
	step 32, 1
	step_end

scr_seq_0824_T10R0601_02C0:
	step 33, 1
	step_end

scr_seq_0824_T10R0601_02C8:
	step 1, 1
	step 75, 0
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

scr_seq_0824_T10R0601_02E0:
	step 1, 1
	step 63, 4
	step 71, 1
	step 12, 2
	step 72, 1
	step_end

scr_seq_0824_T10R0601_02F8:
	step 16, 3
	step 19, 1
	step 33, 1
	step_end

scr_seq_0824_T10R0601_0308:
	step 16, 2
	step 18, 1
	step 16, 2
	step 19, 1
	step 33, 1
	step_end

scr_seq_0824_T10R0601_0320:
	step 16, 1
	step 19, 1
	step 16, 2
	step 18, 2
	step 33, 1
	step_end

scr_seq_0824_T10R0601_0338:
	step 16, 12
	step 1, 1
	step 37, 3
	step_end

scr_seq_0824_T10R0601_0348:
	step 12, 8
	step_end

scr_seq_0824_T10R0601_0350:
	step 63, 6
	step 14, 1
	step 0, 1
	step_end

scr_seq_0824_T10R0601_0360:
	step 36, 4
	step_end

scr_seq_0824_T10R0601_0368:
	step 12, 2
	step 14, 1
	step 1, 1
	step_end

scr_seq_0824_T10R0601_0378:
	step 63, 3
	step 0, 1
	step_end

scr_seq_0824_T10R0601_0384:
	step 62, 1
	step 12, 2
	step 69, 1
	step_end

scr_seq_0824_T10R0601_0394:
	step 12, 2
	step 12, 2
	step 69, 1
	step_end

scr_seq_0824_T10R0601_03A4:
	step 69, 1
	step_end

scr_seq_0824_T10R0601_03AC:
	step 16, 4
	step 75, 0
	step 63, 2
	step_end

scr_seq_0824_T10R0601_03BC:
	step 19, 1
	step 18, 2
	step 19, 2
	step 18, 1
	step 0, 1
	step_end
	.balign 4, 0
