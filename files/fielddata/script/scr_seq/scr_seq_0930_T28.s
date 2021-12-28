#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0930_T28_0065 ; 000
	scrdef scr_seq_0930_T28_0152 ; 001
	scrdef scr_seq_0930_T28_02DC ; 002
	scrdef scr_seq_0930_T28_0305 ; 003
	scrdef scr_seq_0930_T28_0318 ; 004
	scrdef scr_seq_0930_T28_0026 ; 005
	scrdef scr_seq_0930_T28_032B ; 006
	scrdef scr_seq_0930_T28_0342 ; 007
	scrdef scr_seq_0930_T28_0357 ; 008
	scrdef_end

scr_seq_0930_T28_0026:
	setvar VAR_UNK_4077, 2
	setflag FLAG_UNK_0C5
	setflag FLAG_UNK_99B
	comparevartovalue VAR_UNK_40F8, 0
	gotoif ne, scr_seq_0930_T28_0047
	setvar VAR_UNK_40F8, 2
scr_seq_0930_T28_0047:
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 2
	callstd 2039
	setvar VAR_UNK_4134, 5
	end

scr_seq_0930_T28_0065:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 5
	gotoif eq, scr_seq_0930_T28_0117
	checkflag FLAG_UNK_163
	gotoif TRUE, scr_seq_0930_T28_010C
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0930_T28_0101
scr_seq_0930_T28_009D:
	hasenoughmoneyimmediate 32780, 200
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0930_T28_00EC
	setvar VAR_SPECIAL_x8004, 504
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0930_T28_00F7
	callstd std_give_item_verbose
	submoneyimmediate 200
	npc_msg 5
	waitbutton
	setflag FLAG_UNK_163
	goto scr_seq_0930_T28_014C

scr_seq_0930_T28_00EC:
	npc_msg 7
	waitbutton
	goto scr_seq_0930_T28_014C

scr_seq_0930_T28_00F7:
	callstd std_bag_is_full
	goto scr_seq_0930_T28_014C

scr_seq_0930_T28_0101:
	npc_msg 9
	waitbutton
	goto scr_seq_0930_T28_014C

scr_seq_0930_T28_010C:
	npc_msg 1
	waitbutton
	goto scr_seq_0930_T28_014C

scr_seq_0930_T28_0117:
	checkflag FLAG_UNK_163
	gotoif TRUE, scr_seq_0930_T28_0147
	npc_msg 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0930_T28_009D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0930_T28_0101
scr_seq_0930_T28_0147:
	npc_msg 4
	waitbutton
scr_seq_0930_T28_014C:
	closemsg
	releaseall
	end

scr_seq_0930_T28_0152:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_0930_T28_0278
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 176
	gotoif ne, scr_seq_0930_T28_0193
	apply_movement 0, scr_seq_0930_T28_0284
	apply_movement 255, scr_seq_0930_T28_0294
	goto scr_seq_0930_T28_01A3

scr_seq_0930_T28_0193:
	apply_movement 0, scr_seq_0930_T28_02A4
	apply_movement 255, scr_seq_0930_T28_02B4
scr_seq_0930_T28_01A3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	checkflag FLAG_UNK_163
	gotoif TRUE, scr_seq_0930_T28_026D
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0930_T28_01DF
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0930_T28_0257
scr_seq_0930_T28_01DF:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0930_T28_0262
	setvar VAR_SPECIAL_x8004, 504
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0930_T28_00F7
	callstd std_give_item_verbose
	submoneyimmediate 300
	npc_msg 6
	closemsg
	setflag FLAG_UNK_163
scr_seq_0930_T28_0228:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 176
	gotoif ne, scr_seq_0930_T28_0249
	apply_movement 0, scr_seq_0930_T28_02C4
	goto scr_seq_0930_T28_0251

scr_seq_0930_T28_0249:
	apply_movement 0, scr_seq_0930_T28_02D0
scr_seq_0930_T28_0251:
	wait_movement
	releaseall
	end

scr_seq_0930_T28_0257:
	npc_msg 10
	closemsg
	goto scr_seq_0930_T28_0228

scr_seq_0930_T28_0262:
	npc_msg 8
	closemsg
	goto scr_seq_0930_T28_0228

scr_seq_0930_T28_026D:
	npc_msg 2
	closemsg
	goto scr_seq_0930_T28_0228


scr_seq_0930_T28_0278:
	.short 1, 1
	.short 75, 1
	.short 254, 0

scr_seq_0930_T28_0284:
	.short 19, 1
	.short 17, 1
	.short 18, 1
	.short 254, 0

scr_seq_0930_T28_0294:
	.short 62, 2
	.short 18, 1
	.short 3, 1
	.short 254, 0

scr_seq_0930_T28_02A4:
	.short 19, 1
	.short 17, 2
	.short 18, 1
	.short 254, 0

scr_seq_0930_T28_02B4:
	.short 62, 3
	.short 18, 1
	.short 3, 1
	.short 254, 0

scr_seq_0930_T28_02C4:
	.short 12, 1
	.short 1, 1
	.short 254, 0

scr_seq_0930_T28_02D0:
	.short 12, 2
	.short 1, 1
	.short 254, 0
scr_seq_0930_T28_02DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0C9
	gotoif TRUE, scr_seq_0930_T28_02FA
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0930_T28_02FA:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0930_T28_0305:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0930_T28_0318:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0930_T28_032B:
	scrcmd_055 17, 0, 19, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0930_T28_0342:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 18, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0930_T28_0357:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 19, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
