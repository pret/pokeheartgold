#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0038_0020 ; 000
	scrdef scr_seq_0038_012C ; 001
	scrdef scr_seq_0038_036E ; 002
	scrdef scr_seq_0038_03B3 ; 003
	scrdef scr_seq_0038_03F4 ; 004
	scrdef scr_seq_0038_001A ; 005
	scrdef_end

scr_seq_0038_001A:
	clearflag FLAG_UNK_10F
	end

scr_seq_0038_0020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_545 32780
	comparevartovalue VAR_SPECIAL_x800C, 28
	gotoif eq, scr_seq_0038_0093
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_0038_008A
	checkflag FLAG_UNK_10F
	gotoif TRUE, scr_seq_0038_0081
	npc_msg 0
	setflag FLAG_UNK_10F
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0038_0077
	apply_movement 0, scr_seq_0038_009C
	goto scr_seq_0038_007F

scr_seq_0038_0077:
	apply_movement 0, scr_seq_0038_00E4
scr_seq_0038_007F:
	wait_movement
scr_seq_0038_0081:
	npc_msg 1
	goto scr_seq_0038_0366

scr_seq_0038_008A:
	npc_msg 2
	goto scr_seq_0038_0366

scr_seq_0038_0093:
	npc_msg 3
	goto scr_seq_0038_0366


scr_seq_0038_009C:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 75, 1
	.short 254, 0

scr_seq_0038_00E4:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 75, 1
	.short 254, 0
scr_seq_0038_012C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_403E, 8
	gotoif eq, scr_seq_0038_033C
	comparevartovalue VAR_UNK_403E, 7
	gotoif eq, scr_seq_0038_02C4
	comparevartovalue VAR_UNK_403E, 4
	gotoif ge, scr_seq_0038_0277
	scrcmd_545 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0038_02DB
	scrcmd_770 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0038_0223
	comparevartovalue VAR_UNK_40EC, 4
	gotoif eq, scr_seq_0038_01F6
	comparevartovalue VAR_UNK_40EC, 3
	gotoif eq, scr_seq_0038_01D6
	comparevartovalue VAR_UNK_40EC, 2
	gotoif eq, scr_seq_0038_01C3
	comparevartovalue VAR_UNK_40EC, 1
	gotoif eq, scr_seq_0038_01BA
scr_seq_0038_01B1:
	npc_msg 4
	goto scr_seq_0038_0366

scr_seq_0038_01BA:
	npc_msg 5
	goto scr_seq_0038_0366

scr_seq_0038_01C3:
	comparevartovalue VAR_UNK_403E, 1
	gotoif eq, scr_seq_0038_035D
	goto scr_seq_0038_02FA

scr_seq_0038_01D6:
	comparevartovalue VAR_UNK_403E, 2
	gotoif eq, scr_seq_0038_035D
	comparevartovalue VAR_UNK_403E, 1
	gotoif eq, scr_seq_0038_0303
	goto scr_seq_0038_02FA

scr_seq_0038_01F6:
	comparevartovalue VAR_UNK_403E, 3
	gotoif eq, scr_seq_0038_035D
	comparevartovalue VAR_UNK_403E, 2
	gotoif eq, scr_seq_0038_030C
	comparevartovalue VAR_UNK_403E, 1
	gotoif eq, scr_seq_0038_0303
	goto scr_seq_0038_02FA

scr_seq_0038_0223:
	comparevartovalue VAR_UNK_40EC, 0
	gotoif eq, scr_seq_0038_01B1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif eq, scr_seq_0038_01BA
	comparevartovalue VAR_UNK_403E, 4
	gotoif eq, scr_seq_0038_035D
	comparevartovalue VAR_UNK_403E, 3
	gotoif eq, scr_seq_0038_0315
	comparevartovalue VAR_UNK_403E, 2
	gotoif eq, scr_seq_0038_030C
	comparevartovalue VAR_UNK_403E, 1
	gotoif eq, scr_seq_0038_0303
	goto scr_seq_0038_02FA

scr_seq_0038_0277:
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_0038_035D
	comparevartovalue VAR_UNK_40F1, 4
	gotoif eq, scr_seq_0038_02B1
	comparevartovalue VAR_UNK_403E, 5
	gotoif eq, scr_seq_0038_035D
	comparevartovalue VAR_UNK_40F1, 1
	gotoif ge, scr_seq_0038_0321
	goto scr_seq_0038_035D

scr_seq_0038_02B1:
	comparevartovalue VAR_UNK_403E, 5
	gotoif eq, scr_seq_0038_032A
	goto scr_seq_0038_0321

scr_seq_0038_02C4:
	scrcmd_545 32780
	comparevartovalue VAR_SPECIAL_x800C, 28
	gotoif eq, scr_seq_0038_0333
	goto scr_seq_0038_035D

scr_seq_0038_02DB:
	comparevartovalue VAR_UNK_40EC, 1
	gotoif eq, scr_seq_0038_02F1
	npc_msg 4
	goto scr_seq_0038_0366

scr_seq_0038_02F1:
	npc_msg 9
	goto scr_seq_0038_0366

scr_seq_0038_02FA:
	npc_msg 6
	goto scr_seq_0038_0345

scr_seq_0038_0303:
	npc_msg 7
	goto scr_seq_0038_0345

scr_seq_0038_030C:
	npc_msg 8
	goto scr_seq_0038_0345

scr_seq_0038_0315:
	npc_msg 10
	npc_msg 11
	goto scr_seq_0038_0345

scr_seq_0038_0321:
	npc_msg 12
	goto scr_seq_0038_0345

scr_seq_0038_032A:
	npc_msg 13
	goto scr_seq_0038_0345

scr_seq_0038_0333:
	npc_msg 14
	goto scr_seq_0038_0345

scr_seq_0038_033C:
	npc_msg 17
	goto scr_seq_0038_0366

scr_seq_0038_0345:
	buffer_players_name 0
	npc_msg 16
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	addvar VAR_UNK_403E, 1
	goto scr_seq_0038_0366

scr_seq_0038_035D:
	npc_msg 15
	goto scr_seq_0038_0366

scr_seq_0038_0366:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0038_036E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_770 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0038_03AA
	scrcmd_545 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0038_03A1
	npc_msg 19
	goto scr_seq_0038_0366

scr_seq_0038_03A1:
	npc_msg 18
	goto scr_seq_0038_0366

scr_seq_0038_03AA:
	npc_msg 20
	goto scr_seq_0038_0366

scr_seq_0038_03B3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_0038_03EB
	scrcmd_770 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0038_03E2
	npc_msg 21
	goto scr_seq_0038_0366

scr_seq_0038_03E2:
	npc_msg 22
	goto scr_seq_0038_0366

scr_seq_0038_03EB:
	npc_msg 23
	goto scr_seq_0038_0366

scr_seq_0038_03F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	goto scr_seq_0038_0366
	.balign 4, 0
