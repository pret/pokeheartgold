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
	scrcmd_100 2
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
	trainer_battle 487, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
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
	scrcmd_219
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
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_0033_D23R0105_024C:
	.short 3, 1
	.short 75, 1
	.short 254, 0

scr_seq_0033_D23R0105_0258:
	.short 1, 1
	.short 75, 1
	.short 254, 0

scr_seq_0033_D23R0105_0264:
	.short 71, 1
	.short 19, 1
	.short 72, 1
	.short 254, 0

scr_seq_0033_D23R0105_0274:
	.short 71, 1
	.short 18, 1
	.short 72, 1
	.short 254, 0

scr_seq_0033_D23R0105_0284:
	.short 18, 1
	.short 254, 0

scr_seq_0033_D23R0105_028C:
	.short 19, 1
	.short 254, 0

scr_seq_0033_D23R0105_0294:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0033_D23R0105_02B0:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0033_D23R0105_02C8:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0
	.byte 0x03, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0033_D23R0105_0310:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_0033_D23R0105_0328:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0033_D23R0105_0344:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0
	.balign 4, 0
