#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0060_D26R0102_000E ; 000
	scrdef scr_seq_0060_D26R0102_0021 ; 001
	scrdef scr_seq_0060_D26R0102_0055 ; 002
	scrdef_end

scr_seq_0060_D26R0102_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0060_D26R0102_0021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0060_D26R0102_0047
	closemsg
	releaseall
	end

scr_seq_0060_D26R0102_0047:
	buffer_players_name 0
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0060_D26R0102_0055:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	closemsg
	trainer_battle TRAINER_EXECUTIVE_PROTON_PROTON, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0060_D26R0102_0193
	npc_msg 2
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	hide_person 1
	hide_person 2
	hide_person 3
	hide_person 4
	setflag FLAG_UNK_1A9
	wait 20, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	move_person 7, 36, 0, 7, 2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0060_D26R0102_00F7
	apply_movement 7, scr_seq_0060_D26R0102_019C
	apply_movement 255, scr_seq_0060_D26R0102_01C0
	goto scr_seq_0060_D26R0102_0107

scr_seq_0060_D26R0102_00F7:
	apply_movement 7, scr_seq_0060_D26R0102_019C
	apply_movement 255, scr_seq_0060_D26R0102_01DC
scr_seq_0060_D26R0102_0107:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	npc_msg 0
	closemsg
	clearflag FLAG_UNK_19E
	clearflag FLAG_UNK_1AB
	setflag FLAG_UNK_07B
	setvar VAR_UNK_4075, 1
	setvar VAR_UNK_4080, 2
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_409E, 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 164, 0, 4, 5, 0
	fade_screen 6, 1, 1, 0x00
	wait_fade
	setflag FLAG_UNK_1AA
	setflag FLAG_UNK_1D5
	setflag FLAG_UNK_1AC
	clearflag FLAG_UNK_1AD
	clearflag FLAG_UNK_1A7
	clearflag FLAG_UNK_1A8
	setvar VAR_UNK_40F4, 1
	releaseall
	end

scr_seq_0060_D26R0102_0193:
	white_out
	releaseall
	end

scr_seq_0060_D26R0102_0199:
	.byte 0x00, 0x00, 0x00

scr_seq_0060_D26R0102_019C:
	step 14, 2
	step 13, 2
	step 14, 3
	step 12, 2
	step 62, 4
	step 14, 1
	step 12, 3
	step 2, 1
	step_end

scr_seq_0060_D26R0102_01C0:
	step 15, 2
	step 0, 1
	step 63, 6
	step 1, 1
	step 63, 5
	step 3, 1
	step_end

scr_seq_0060_D26R0102_01DC:
	step 13, 1
	step 15, 1
	step 0, 1
	step 63, 6
	step 1, 1
	step 63, 5
	step 3, 1
	step_end
	.balign 4, 0
