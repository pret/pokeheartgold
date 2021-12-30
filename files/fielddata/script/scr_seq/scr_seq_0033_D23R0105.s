#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0033_D23R0105_0012 ; 000
	scrdef scr_seq_0033_D23R0105_002F ; 001
	scrdef scr_seq_0033_D23R0105_0055 ; 002
	scrdef scr_seq_0033_D23R0105_0042 ; 003
	scrdef_end

scr_seq_0033_D23R0105_0012:
	setflag FLAG_UNK_1B7
	setvar VAR_UNK_4125, 0
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0033_D23R0105_002D
	clearflag FLAG_UNK_1B7
scr_seq_0033_D23R0105_002D:
	end

scr_seq_0033_D23R0105_002F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0033_D23R0105_0042:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0033_D23R0105_0055:
	comparevartovalue VAR_UNK_4077, 4
	gotoif eq, scr_seq_0033_D23R0105_0075
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0033_D23R0105_0075:
	getitemquantity 476, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0033_D23R0105_022B
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	closemsg
	wait 16, VAR_SPECIAL_x800C
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0033_D23R0105_00B8
	apply_movement 0, scr_seq_0033_D23R0105_0258
	goto scr_seq_0033_D23R0105_00DB

scr_seq_0033_D23R0105_00B8:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0033_D23R0105_00D3
	apply_movement 0, scr_seq_0033_D23R0105_024C
	goto scr_seq_0033_D23R0105_00DB

scr_seq_0033_D23R0105_00D3:
	apply_movement 0, scr_seq_0033_D23R0105_0240
scr_seq_0033_D23R0105_00DB:
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0033_D23R0105_00F8
	apply_movement 0, scr_seq_0033_D23R0105_0264
	goto scr_seq_0033_D23R0105_010D

scr_seq_0033_D23R0105_00F8:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0033_D23R0105_010D
	apply_movement 0, scr_seq_0033_D23R0105_0274
scr_seq_0033_D23R0105_010D:
	wait_movement
	npc_msg 1
	closemsg
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0033_D23R0105_012F
	apply_movement 0, scr_seq_0033_D23R0105_0284
	goto scr_seq_0033_D23R0105_0144

scr_seq_0033_D23R0105_012F:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0033_D23R0105_0144
	apply_movement 0, scr_seq_0033_D23R0105_028C
scr_seq_0033_D23R0105_0144:
	wait_movement
	buffer_players_name 0
	npc_msg 2
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0033_D23R0105_0167
	apply_movement 0, scr_seq_0033_D23R0105_02B0
	goto scr_seq_0033_D23R0105_018A

scr_seq_0033_D23R0105_0167:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0033_D23R0105_0182
	apply_movement 0, scr_seq_0033_D23R0105_0294
	goto scr_seq_0033_D23R0105_018A

scr_seq_0033_D23R0105_0182:
	apply_movement 0, scr_seq_0033_D23R0105_02C8
scr_seq_0033_D23R0105_018A:
	wait_movement
	setflag FLAG_UNK_2C6
	clearflag FLAG_UNK_2C7
	show_person 2
	hide_person 0
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0033_D23R0105_01B7
	apply_movement 2, scr_seq_0033_D23R0105_0328
	goto scr_seq_0033_D23R0105_01DA

scr_seq_0033_D23R0105_01B7:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0033_D23R0105_01D2
	apply_movement 2, scr_seq_0033_D23R0105_0310
	goto scr_seq_0033_D23R0105_01DA

scr_seq_0033_D23R0105_01D2:
	apply_movement 2, scr_seq_0033_D23R0105_0344
scr_seq_0033_D23R0105_01DA:
	wait_movement
	npc_msg 3
	closemsg
	trainer_battle TRAINER_EXECUTIVE_PETREL_PETREL, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0033_D23R0105_021D
	npc_msg 4
	setvar VAR_SPECIAL_x8004, 476
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	closemsg
	releaseall
	setvar VAR_UNK_40E7, 2
	clearflag FLAG_UNK_237
	end

scr_seq_0033_D23R0105_021D:
	white_out
	clearflag FLAG_UNK_2C6
	setflag FLAG_UNK_2C7
	releaseall
	end

scr_seq_0033_D23R0105_022B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0033_D23R0105_023E:
	.byte 0x00, 0x00

scr_seq_0033_D23R0105_0240:
	step 2, 1
	step 75, 1
	step_end

scr_seq_0033_D23R0105_024C:
	step 3, 1
	step 75, 1
	step_end

scr_seq_0033_D23R0105_0258:
	step 1, 1
	step 75, 1
	step_end

scr_seq_0033_D23R0105_0264:
	step 71, 1
	step 19, 1
	step 72, 1
	step_end

scr_seq_0033_D23R0105_0274:
	step 71, 1
	step 18, 1
	step 72, 1
	step_end

scr_seq_0033_D23R0105_0284:
	step 18, 1
	step_end

scr_seq_0033_D23R0105_028C:
	step 19, 1
	step_end

scr_seq_0033_D23R0105_0294:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

scr_seq_0033_D23R0105_02B0:
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

scr_seq_0033_D23R0105_02C8:
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end
	.byte 0x03, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0033_D23R0105_0310:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end

scr_seq_0033_D23R0105_0328:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step_end

scr_seq_0033_D23R0105_0344:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end
	.balign 4, 0
