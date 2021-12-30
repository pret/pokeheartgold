#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0158_P01R0303_000A ; 000
	scrdef scr_seq_0158_P01R0303_01F0 ; 001
	scrdef_end

scr_seq_0158_P01R0303_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0ED
	gotoif FALSE, scr_seq_0158_P01R0303_0112
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0158_P01R0303_009D
	apply_movement 0, scr_seq_0158_P01R0303_0120
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0158_P01R0303_0144
	apply_movement 255, scr_seq_0158_P01R0303_01C8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 5
	closemsg
	trainer_battle TRAINER_SAILOR_STANLY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0158_P01R0303_010C
	npc_msg 6
	closemsg
	apply_movement 0, scr_seq_0158_P01R0303_0160
	wait_movement
	setvar VAR_UNK_40CB, 3
	hide_person 0
	setflag FLAG_UNK_21A
	releaseall
	end

scr_seq_0158_P01R0303_009D:
	apply_movement 0, scr_seq_0158_P01R0303_016C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0158_P01R0303_0190
	apply_movement 255, scr_seq_0158_P01R0303_01DC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 5
	closemsg
	trainer_battle TRAINER_SAILOR_STANLY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0158_P01R0303_010C
	npc_msg 6
	closemsg
	apply_movement 0, scr_seq_0158_P01R0303_01AC
	wait_movement
	setvar VAR_UNK_40CB, 3
	hide_person 0
	setflag FLAG_UNK_21A
	releaseall
	end

scr_seq_0158_P01R0303_010C:
	white_out
	releaseall
	end

scr_seq_0158_P01R0303_0112:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0158_P01R0303_011D:
	.byte 0x00, 0x00, 0x00

scr_seq_0158_P01R0303_0120:
	step 75, 1
	step 63, 1
	step 3, 2
	step 2, 2
	step 3, 2
	step 71, 1
	step 58, 1
	step 72, 1
	step_end

scr_seq_0158_P01R0303_0144:
	step 0, 2
	step 16, 2
	step 3, 2
	step 19, 4
	step 1, 2
	step 17, 1
	step_end

scr_seq_0158_P01R0303_0160:
	step 0, 2
	step 16, 7
	step_end

scr_seq_0158_P01R0303_016C:
	step 75, 1
	step 63, 1
	step 2, 2
	step 3, 2
	step 2, 2
	step 71, 1
	step 59, 1
	step 72, 1
	step_end

scr_seq_0158_P01R0303_0190:
	step 0, 2
	step 16, 2
	step 2, 2
	step 18, 4
	step 1, 2
	step 17, 1
	step_end

scr_seq_0158_P01R0303_01AC:
	step 0, 2
	step 16, 3
	step 3, 2
	step 19, 4
	step 0, 2
	step 16, 4
	step_end

scr_seq_0158_P01R0303_01C8:
	step 65, 1
	step 3, 2
	step 15, 1
	step 0, 2
	step_end

scr_seq_0158_P01R0303_01DC:
	step 65, 1
	step 2, 2
	step 14, 1
	step 0, 2
	step_end
scr_seq_0158_P01R0303_01F0:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0158_P01R0303_02B4
	wait_movement
	npc_msg 0
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 1
	closemsg
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0158_P01R0303_0247
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
scr_seq_0158_P01R0303_0247:
	apply_movement 255, scr_seq_0158_P01R0303_02C4
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0158_P01R0303_0268
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_0158_P01R0303_0268:
	comparevartovalue VAR_UNK_40CB, 7
	gotoif ge, scr_seq_0158_P01R0303_0279
	releaseall
	end

scr_seq_0158_P01R0303_0279:
	checkflag FLAG_UNK_0EB
	gotoif TRUE, scr_seq_0158_P01R0303_02AD
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	setflag FLAG_UNK_0EB
	comparevartovalue VAR_UNK_40E1, 1
	gotoif ne, scr_seq_0158_P01R0303_02A6
	npc_msg 3
	goto scr_seq_0158_P01R0303_02A9

scr_seq_0158_P01R0303_02A6:
	npc_msg 2
scr_seq_0158_P01R0303_02A9:
	waitbutton
	closemsg
scr_seq_0158_P01R0303_02AD:
	releaseall
	end

scr_seq_0158_P01R0303_02B1:
	.byte 0x00, 0x00, 0x00

scr_seq_0158_P01R0303_02B4:
	step 1, 2
	step 65, 1
	step 75, 1
	step_end

scr_seq_0158_P01R0303_02C4:
	step 3, 2
	step 55, 1
	step_end
	.balign 4, 0
