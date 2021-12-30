#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0018_D15R0103_000E ; 000
	scrdef scr_seq_0018_D15R0103_0025 ; 001
	scrdef scr_seq_0018_D15R0103_013C ; 002
	scrdef_end

scr_seq_0018_D15R0103_000E:
	clearflag FLAG_UNK_1A3
	checkflag FLAG_UNK_078
	gotoif TRUE, scr_seq_0018_D15R0103_001F
	end

scr_seq_0018_D15R0103_001F:
	setflag FLAG_UNK_1A3
	end

scr_seq_0018_D15R0103_0025:
	scrcmd_609
	lockall
	setvar VAR_UNK_40A4, 1
	apply_movement 255, scr_seq_0018_D15R0103_00B4
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_0018_D15R0103_00C0
	wait_movement
	apply_movement 3, scr_seq_0018_D15R0103_00D0
	wait_movement
	npc_msg 0
	closemsg
	wait 15, VAR_SPECIAL_x800C
	callstd std_play_rival_outro_music
	scrcmd_191 0
	apply_movement 6, scr_seq_0018_D15R0103_00D8
	wait_movement
	npc_msg 1
	closemsg
	wait 15, VAR_SPECIAL_x800C
	scrcmd_191 0
	npc_msg 2
	scrcmd_049
	closemsg
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement 6, scr_seq_0018_D15R0103_00E0
	wait_movement
	hide_person 6
	setflag FLAG_UNK_078
	callstd std_fade_end_rival_outro_music
	apply_movement 241, scr_seq_0018_D15R0103_00C8
	wait_movement
	scrcmd_103
	releaseall
	end


scr_seq_0018_D15R0103_00B4:
	step 75, 1
	step 63, 1
	step_end

scr_seq_0018_D15R0103_00C0:
	step 12, 5
	step_end

scr_seq_0018_D15R0103_00C8:
	step 13, 5
	step_end

scr_seq_0018_D15R0103_00D0:
	step 33, 2
	step_end

scr_seq_0018_D15R0103_00D8:
	step 13, 1
	step_end

scr_seq_0018_D15R0103_00E0:
	step 2, 4
	step 0, 4
	step 3, 4
	step 1, 4
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step_end
scr_seq_0018_D15R0103_013C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_076
	gotoif TRUE, scr_seq_0018_D15R0103_0197
	npc_msg 3
	closemsg
	trainer_battle TRAINER_ELDER_LI, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0018_D15R0103_01A2
	npc_msg 4
	setvar VAR_SPECIAL_x8004, 397
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_076
	setflag FLAG_UNK_2E3
	clearflag FLAG_UNK_2E4
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0018_D15R0103_0197:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0018_D15R0103_01A2:
	white_out
	releaseall
	end
	.balign 4, 0
