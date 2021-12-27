#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0922_001A ; 000
	scrdef scr_seq_0922_0138 ; 001
	scrdef scr_seq_0922_01F5 ; 002
	scrdef scr_seq_0922_0278 ; 003
	scrdef scr_seq_0922_00B2 ; 004
	scrdef scr_seq_0922_02AC ; 005
	scrdef_end

scr_seq_0922_001A:
	scrcmd_314
	scrcmd_142 37, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0922_00AC
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0922_00A6
	scrcmd_147 37, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0922_0085
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0922_0068
	setflag FLAG_UNK_2ED
	goto scr_seq_0922_0083

scr_seq_0922_0068:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0922_007F
	setflag FLAG_UNK_2ED
	goto scr_seq_0922_0083

scr_seq_0922_007F:
	clearflag FLAG_UNK_2ED
scr_seq_0922_0083:
	end

scr_seq_0922_0085:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0922_00A0
	setflag FLAG_UNK_2ED
	goto scr_seq_0922_00A4

scr_seq_0922_00A0:
	clearflag FLAG_UNK_2ED
scr_seq_0922_00A4:
	end

scr_seq_0922_00A6:
	clearflag FLAG_UNK_2ED
	end

scr_seq_0922_00AC:
	setflag FLAG_UNK_2ED
	end

scr_seq_0922_00B2:
	scrcmd_609
	lockall
	apply_movement 6, scr_seq_0922_0108
	wait_movement
	npc_msg 9
	closemsg
	apply_movement 6, scr_seq_0922_0118
	apply_movement 255, scr_seq_0922_0128
	wait_movement
	setvar VAR_UNK_4079, 1
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 78, 7, 376, 182, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0922_0105:
	.byte 0x00, 0x00, 0x00

scr_seq_0922_0108:
	.short 75, 1
	.short 13, 3
	.short 63, 1
	.short 254, 0

scr_seq_0922_0118:
	.short 9, 1
	.short 71, 1
	.short 12, 1
	.short 254, 0

scr_seq_0922_0128:
	.short 63, 1
	.short 13, 1
	.short 63, 1
	.short 254, 0
scr_seq_0922_0138:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0922_01D9
	npc_msg 0
	closemsg
	trainer_battle 31, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0922_01EF
	npc_msg 1
	scrcmd_295 3
	addvar VAR_UNK_4134, 1
	scrcmd_515 22
	setflag FLAG_UNK_998
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0922_019B

scr_seq_0922_019B:
	setvar VAR_SPECIAL_x8004, 357
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0922_01CF
	callstd 2033
	setflag FLAG_UNK_0A6
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0922_01CF:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0922_01D9:
	checkflag FLAG_UNK_0A6
	gotoif FALSE, scr_seq_0922_019B
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0922_01EF:
	scrcmd_219
	releaseall
	end

scr_seq_0922_01F5:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_GYURU
	apply_movement 255, scr_seq_0922_0230
	wait_movement
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 80, 0, 16, 49, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0922_022F:
	.byte 0x00

scr_seq_0922_0230:
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 1
	.short 69, 0
	.short 254, 0
scr_seq_0922_0278:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0922_029E
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0922_029E:
	buffer_players_name 0
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0922_02AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 3, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0922_02D3
	npc_msg 10
	goto scr_seq_0922_02D6

scr_seq_0922_02D3:
	npc_msg 11
scr_seq_0922_02D6:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
