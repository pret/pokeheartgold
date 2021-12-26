#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000807_00000718 ; 000
	scrdef scr_seq_00000807_0000072B ; 001
	scrdef scr_seq_00000807_0000073E ; 002
	scrdef scr_seq_00000807_00000768 ; 003
	scrdef scr_seq_00000807_0000077D ; 004
	scrdef scr_seq_00000807_00000792 ; 005
	scrdef scr_seq_00000807_00000069 ; 006
	scrdef scr_seq_00000807_0000002A ; 007
	scrdef scr_seq_00000807_000001B0 ; 008
	scrdef scr_seq_00000807_00000751 ; 009
	scrdef_end

scr_seq_00000807_0000002A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000807_0000003B
	clearflag FLAG_UNK_189
	end

scr_seq_00000807_0000003B:
	clearflag FLAG_UNK_149
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000807_00000063
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000807_00000063
	setflag FLAG_UNK_27E
	end

scr_seq_00000807_00000063:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000807_00000069:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000807_0000014B
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000807_0000015F
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000807_000000DA
	apply_movement 255, scr_seq_00000807_00000174
	goto scr_seq_00000807_000000EA

scr_seq_00000807_000000DA:
	apply_movement 255, scr_seq_00000807_00000180
	apply_movement 5, scr_seq_00000807_00000194
scr_seq_00000807_000000EA:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000807_00000111
	apply_movement 253, scr_seq_00000807_000001A0
	wait_movement
scr_seq_00000807_00000111:
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

scr_seq_00000807_0000014B:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000807_0000015F:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000807_00000173:
	.byte 0x00

scr_seq_00000807_00000174:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000807_00000180:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000807_00000194:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000807_000001A0:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000807_000001B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call scr_seq_00000807_00000601
	call scr_seq_00000807_0000057B
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif eq, scr_seq_00000807_000001E0
	msgbox 7
	closemsg
	call scr_seq_00000807_00000601
	releaseall
	end

scr_seq_00000807_000001E0:
	msgbox 8
scr_seq_00000807_000001E3:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8000, 1
	gotoif ne, scr_seq_00000807_00000202
	scrcmd_751 205, 255, 0
scr_seq_00000807_00000202:
	comparevartovalue VAR_SPECIAL_x8001, 1
	gotoif ne, scr_seq_00000807_00000217
	scrcmd_751 206, 255, 1
scr_seq_00000807_00000217:
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif ne, scr_seq_00000807_0000022C
	scrcmd_751 207, 255, 2
scr_seq_00000807_0000022C:
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ne, scr_seq_00000807_00000241
	scrcmd_751 208, 255, 3
scr_seq_00000807_00000241:
	scrcmd_751 126, 255, 4
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000807_0000028D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000807_00000331
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000807_000003D5
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000807_00000479
	goto scr_seq_00000807_0000051D

scr_seq_00000807_0000028D:
	msgbox 11
	setvar VAR_SPECIAL_x8004, 156
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
	setvar VAR_SPECIAL_x8004, 164
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
	setvar VAR_SPECIAL_x8004, 169
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
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
	goto scr_seq_00000807_0000053B

scr_seq_00000807_00000331:
	msgbox 12
	setvar VAR_SPECIAL_x8004, 165
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
	setvar VAR_SPECIAL_x8004, 170
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
	setvar VAR_SPECIAL_x8004, 175
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
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
	goto scr_seq_00000807_0000053B

scr_seq_00000807_000003D5:
	msgbox 13
	setvar VAR_SPECIAL_x8004, 168
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
	setvar VAR_SPECIAL_x8004, 173
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
	setvar VAR_SPECIAL_x8004, 178
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
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
	goto scr_seq_00000807_0000053B

scr_seq_00000807_00000479:
	msgbox 14
	setvar VAR_SPECIAL_x8004, 167
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
	setvar VAR_SPECIAL_x8004, 172
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
	setvar VAR_SPECIAL_x8004, 182
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000807_0000052C
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
	goto scr_seq_00000807_0000053B

scr_seq_00000807_0000051D:
	msgbox 10
	closemsg
	call scr_seq_00000807_00000601
	releaseall
	end

scr_seq_00000807_0000052C:
	msgbox 15
	closemsg
	call scr_seq_00000807_00000601
	releaseall
	end

scr_seq_00000807_0000053B:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	setvar VAR_SPECIAL_x8002, 0
	setvar VAR_SPECIAL_x8003, 0
	setvar VAR_SPECIAL_x8006, 0
	call scr_seq_00000807_0000057B
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, scr_seq_00000807_00000575
	msgbox 9
	goto scr_seq_00000807_000001E3

scr_seq_00000807_00000575:
	goto scr_seq_00000807_0000051D

scr_seq_00000807_0000057B:
	hasitem ITEM_RED_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000807_0000059C
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_00000807_0000059C:
	hasitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000807_000005BD
	setvar VAR_SPECIAL_x8001, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_00000807_000005BD:
	hasitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000807_000005DE
	setvar VAR_SPECIAL_x8002, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_00000807_000005DE:
	hasitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000807_000005FF
	setvar VAR_SPECIAL_x8003, 1
	setvar VAR_SPECIAL_x8006, 1
scr_seq_00000807_000005FF:
	return

scr_seq_00000807_00000601:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000807_00000622
	apply_movement 6, scr_seq_00000807_0000064C
	wait_movement
	goto scr_seq_00000807_00000649

scr_seq_00000807_00000622:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000807_0000063F
	apply_movement 6, scr_seq_00000807_00000690
	wait_movement
	goto scr_seq_00000807_00000649

scr_seq_00000807_0000063F:
	apply_movement 6, scr_seq_00000807_000006D4
	wait_movement
scr_seq_00000807_00000649:
	return

scr_seq_00000807_0000064B:
	.byte 0x00

scr_seq_00000807_0000064C:
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

scr_seq_00000807_00000690:
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

scr_seq_00000807_000006D4:
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
scr_seq_00000807_00000718:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000807_0000072B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000807_0000073E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000807_00000751:
	scrcmd_055 3, 0, 8, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000807_00000768:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 4, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000807_0000077D:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 5, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000807_00000792:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 6, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
