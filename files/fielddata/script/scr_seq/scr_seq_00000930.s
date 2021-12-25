#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000930_00000065 ; 000
	scrdef scr_seq_00000930_00000152 ; 001
	scrdef scr_seq_00000930_000002DC ; 002
	scrdef scr_seq_00000930_00000305 ; 003
	scrdef scr_seq_00000930_00000318 ; 004
	scrdef scr_seq_00000930_00000026 ; 005
	scrdef scr_seq_00000930_0000032B ; 006
	scrdef scr_seq_00000930_00000342 ; 007
	scrdef scr_seq_00000930_00000357 ; 008
	scrdef_end

scr_seq_00000930_00000026:
	setvar VAR_UNK_4077, 2
	setflag FLAG_UNK_0C5
	setflag FLAG_UNK_99B
	comparevartovalue VAR_UNK_40F8, 0
	gotoif ne, scr_seq_00000930_00000047
	setvar VAR_UNK_40F8, 2
scr_seq_00000930_00000047:
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 2
	callstd 2039
	setvar VAR_UNK_4134, 5
	end

scr_seq_00000930_00000065:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 5
	gotoif eq, scr_seq_00000930_00000117
	checkflag FLAG_UNK_163
	gotoif eq, scr_seq_00000930_0000010C
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000930_00000101
scr_seq_00000930_0000009D:
	hasenoughmoneyimmediate 32780, 200
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000930_000000EC
	setvar VAR_SPECIAL_x8004, 504
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000930_000000F7
	callstd 2033
	submoneyimmediate 200
	msgbox 5
	waitbutton
	setflag FLAG_UNK_163
	goto scr_seq_00000930_0000014C

scr_seq_00000930_000000EC:
	msgbox 7
	waitbutton
	goto scr_seq_00000930_0000014C

scr_seq_00000930_000000F7:
	callstd 2009
	goto scr_seq_00000930_0000014C

scr_seq_00000930_00000101:
	msgbox 9
	waitbutton
	goto scr_seq_00000930_0000014C

scr_seq_00000930_0000010C:
	msgbox 1
	waitbutton
	goto scr_seq_00000930_0000014C

scr_seq_00000930_00000117:
	checkflag FLAG_UNK_163
	gotoif eq, scr_seq_00000930_00000147
	msgbox 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000930_0000009D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000930_00000101
scr_seq_00000930_00000147:
	msgbox 4
	waitbutton
scr_seq_00000930_0000014C:
	closemsg
	releaseall
	end

scr_seq_00000930_00000152:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_00000930_00000278
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 176
	gotoif ne, scr_seq_00000930_00000193
	apply_movement 0, scr_seq_00000930_00000284
	apply_movement 255, scr_seq_00000930_00000294
	goto scr_seq_00000930_000001A3

scr_seq_00000930_00000193:
	apply_movement 0, scr_seq_00000930_000002A4
	apply_movement 255, scr_seq_00000930_000002B4
scr_seq_00000930_000001A3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	checkflag FLAG_UNK_163
	gotoif eq, scr_seq_00000930_0000026D
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000930_000001DF
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000930_00000257
scr_seq_00000930_000001DF:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000930_00000262
	setvar VAR_SPECIAL_x8004, 504
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000930_000000F7
	callstd 2033
	submoneyimmediate 300
	msgbox 6
	closemsg
	setflag FLAG_UNK_163
scr_seq_00000930_00000228:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 176
	gotoif ne, scr_seq_00000930_00000249
	apply_movement 0, scr_seq_00000930_000002C4
	goto scr_seq_00000930_00000251

scr_seq_00000930_00000249:
	apply_movement 0, scr_seq_00000930_000002D0
scr_seq_00000930_00000251:
	wait_movement
	releaseall
	end

scr_seq_00000930_00000257:
	msgbox 10
	closemsg
	goto scr_seq_00000930_00000228

scr_seq_00000930_00000262:
	msgbox 8
	closemsg
	goto scr_seq_00000930_00000228

scr_seq_00000930_0000026D:
	msgbox 2
	closemsg
	goto scr_seq_00000930_00000228


scr_seq_00000930_00000278:
	.short 1, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000930_00000284:
	.short 19, 1
	.short 17, 1
	.short 18, 1
	.short 254, 0

scr_seq_00000930_00000294:
	.short 62, 2
	.short 18, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000930_000002A4:
	.short 19, 1
	.short 17, 2
	.short 18, 1
	.short 254, 0

scr_seq_00000930_000002B4:
	.short 62, 3
	.short 18, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000930_000002C4:
	.short 12, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000930_000002D0:
	.short 12, 2
	.short 1, 1
	.short 254, 0
scr_seq_00000930_000002DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0C9
	gotoif eq, scr_seq_00000930_000002FA
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000930_000002FA:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000930_00000305:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000930_00000318:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000930_0000032B:
	scrcmd_055 17, 0, 19, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000930_00000342:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 18, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000930_00000357:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 19, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
