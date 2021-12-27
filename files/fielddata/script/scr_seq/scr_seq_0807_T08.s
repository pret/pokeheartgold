#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0807_0718 ; 000
	scrdef scr_seq_0807_072B ; 001
	scrdef scr_seq_0807_073E ; 002
	scrdef scr_seq_0807_0768 ; 003
	scrdef scr_seq_0807_077D ; 004
	scrdef scr_seq_0807_0792 ; 005
	scrdef scr_seq_0807_0069 ; 006
	scrdef scr_seq_0807_002A ; 007
	scrdef scr_seq_0807_01B0 ; 008
	scrdef scr_seq_0807_0751 ; 009
	scrdef_end

scr_seq_0807_002A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0807_003B
	clearflag FLAG_UNK_189
	end

scr_seq_0807_003B:
	clearflag FLAG_UNK_149
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0807_0063
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0807_0063
	setflag FLAG_UNK_27E
	end

scr_seq_0807_0063:
	clearflag FLAG_UNK_27E
	end

scr_seq_0807_0069:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0807_014B
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0807_015F
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0807_00DA
	apply_movement 255, scr_seq_0807_0174
	goto scr_seq_0807_00EA

scr_seq_0807_00DA:
	apply_movement 255, scr_seq_0807_0180
	apply_movement 5, scr_seq_0807_0194
scr_seq_0807_00EA:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0807_0111
	apply_movement 253, scr_seq_0807_01A0
	wait_movement
scr_seq_0807_0111:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 62
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0807_014B:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0807_015F:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0807_0173:
	.byte 0x00

scr_seq_0807_0174:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0807_0180:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0807_0194:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0807_01A0:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0807_01B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call scr_seq_0807_0601
	call scr_seq_0807_057B
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif eq, scr_seq_0807_01E0
	npc_msg 7
	closemsg
	call scr_seq_0807_0601
	releaseall
	end

scr_seq_0807_01E0:
	npc_msg 8
scr_seq_0807_01E3:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8000, 1
	gotoif ne, scr_seq_0807_0202
	scrcmd_751 205, 255, 0
scr_seq_0807_0202:
	comparevartovalue VAR_SPECIAL_x8001, 1
	gotoif ne, scr_seq_0807_0217
	scrcmd_751 206, 255, 1
scr_seq_0807_0217:
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif ne, scr_seq_0807_022C
	scrcmd_751 207, 255, 2
scr_seq_0807_022C:
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ne, scr_seq_0807_0241
	scrcmd_751 208, 255, 3
scr_seq_0807_0241:
	scrcmd_751 126, 255, 4
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0807_028D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0807_0331
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0807_03D5
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0807_0479
	goto scr_seq_0807_051D

scr_seq_0807_028D:
	npc_msg 11
	setvar VAR_SPECIAL_x8004, 156
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 164
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 169
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 156
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 164
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 169
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	takeitem ITEM_RED_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_0807_053B

scr_seq_0807_0331:
	npc_msg 12
	setvar VAR_SPECIAL_x8004, 165
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 170
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 175
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 165
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 170
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 175
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	takeitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_0807_053B

scr_seq_0807_03D5:
	npc_msg 13
	setvar VAR_SPECIAL_x8004, 168
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 173
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 178
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 168
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 173
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 178
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	takeitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_0807_053B

scr_seq_0807_0479:
	npc_msg 14
	setvar VAR_SPECIAL_x8004, 167
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 172
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 182
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0807_052C
	setvar VAR_SPECIAL_x8004, 167
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 172
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_SPECIAL_x8004, 182
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	takeitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_x800C
	goto scr_seq_0807_053B

scr_seq_0807_051D:
	npc_msg 10
	closemsg
	call scr_seq_0807_0601
	releaseall
	end

scr_seq_0807_052C:
	npc_msg 15
	closemsg
	call scr_seq_0807_0601
	releaseall
	end

scr_seq_0807_053B:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	setvar VAR_SPECIAL_x8002, 0
	setvar VAR_SPECIAL_x8003, 0
	setvar VAR_SPECIAL_x8006, 0
	call scr_seq_0807_057B
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_0807_0575
	npc_msg 9
	goto scr_seq_0807_01E3

scr_seq_0807_0575:
	goto scr_seq_0807_051D

scr_seq_0807_057B:
	hasitem ITEM_RED_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0807_059C
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_0807_059C:
	hasitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0807_05BD
	setvar VAR_SPECIAL_x8001, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_0807_05BD:
	hasitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0807_05DE
	setvar VAR_SPECIAL_x8002, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_0807_05DE:
	hasitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0807_05FF
	setvar VAR_SPECIAL_x8003, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_0807_05FF:
	return

scr_seq_0807_0601:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0807_0622
	apply_movement 6, scr_seq_0807_064C
	wait_movement
	goto scr_seq_0807_0649

scr_seq_0807_0622:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0807_063F
	apply_movement 6, scr_seq_0807_0690
	wait_movement
	goto scr_seq_0807_0649

scr_seq_0807_063F:
	apply_movement 6, scr_seq_0807_06D4
	wait_movement
scr_seq_0807_0649:
	return

scr_seq_0807_064B:
	.byte 0x00

scr_seq_0807_064C:
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 254, 0

scr_seq_0807_0690:
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 254, 0

scr_seq_0807_06D4:
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 1, 1
	.short 3, 1
	.short 0, 1
	.short 2, 1
	.short 254, 0
scr_seq_0807_0718:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0807_072B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0807_073E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0807_0751:
	scrcmd_055 3, 0, 8, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0807_0768:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 4, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0807_077D:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 5, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0807_0792:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 6, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
