#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000242_0000032C ; 000
	scrdef scr_seq_00000242_0000033F ; 001
	scrdef scr_seq_00000242_0000046C ; 002
	scrdef scr_seq_00000242_00000638 ; 003
	scrdef scr_seq_00000242_0000064B ; 004
	scrdef scr_seq_00000242_0000065E ; 005
	scrdef scr_seq_00000242_00000671 ; 006
	scrdef scr_seq_00000242_00000684 ; 007
	scrdef scr_seq_00000242_000001A3 ; 008
	scrdef scr_seq_00000242_00000036 ; 009
	scrdef scr_seq_00000242_00000038 ; 010
	scrdef scr_seq_00000242_0000047F ; 011
	scrdef scr_seq_00000242_000000F0 ; 012
	scrdef_end

scr_seq_00000242_00000036:
	end

scr_seq_00000242_00000038:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000242_000000D8
	apply_movement 7, scr_seq_00000242_000000E0
	wait_movement
	callstd 10406
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_00000242_000000D2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000242_00000448
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 487, 0, 40, 86, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000242_000000C2
	scrcmd_606
	goto scr_seq_00000242_000000C4

scr_seq_00000242_000000C2:
	scrcmd_607
scr_seq_00000242_000000C4:
	apply_movement 253, scr_seq_00000242_000000E8
	wait_movement
	scrcmd_099 253
scr_seq_00000242_000000D2:
	releaseall
	end

scr_seq_00000242_000000D6:
	.byte 0x00, 0x00

scr_seq_00000242_000000D8:
	.short 2, 1
	.short 254, 0

scr_seq_00000242_000000E0:
	.short 3, 1
	.short 254, 0

scr_seq_00000242_000000E8:
	.short 0, 1
	.short 254, 0
scr_seq_00000242_000000F0:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_00000242_0000010F
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_00000242_00000168

scr_seq_00000242_0000010F:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000242_0000012A
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_00000242_00000168

scr_seq_00000242_0000012A:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000242_00000145
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_00000242_00000168

scr_seq_00000242_00000145:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000242_00000160
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_00000242_00000168

scr_seq_00000242_00000160:
	clearflag FLAG_UNK_1C3
	setflag FLAG_UNK_1C4
scr_seq_00000242_00000168:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000242_00000179
	clearflag FLAG_UNK_189
	end

scr_seq_00000242_00000179:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000242_0000019D
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000242_0000019D
	setflag FLAG_UNK_27E
	end

scr_seq_00000242_0000019D:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000242_000001A3:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_00000242_0000029C
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_00000242_000001D2
	apply_movement 2, scr_seq_00000242_000002A4
	goto scr_seq_00000242_00000210

scr_seq_00000242_000001D2:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000242_000001ED
	apply_movement 2, scr_seq_00000242_000002B4
	goto scr_seq_00000242_00000210

scr_seq_00000242_000001ED:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_00000242_00000208
	apply_movement 2, scr_seq_00000242_000002C4
	goto scr_seq_00000242_00000210

scr_seq_00000242_00000208:
	apply_movement 2, scr_seq_00000242_000002D4
scr_seq_00000242_00000210:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 2, scr_seq_00000242_000002E4
	apply_movement 255, scr_seq_00000242_000002EC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 10
	closemsg
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_00000242_00000258
	apply_movement 2, scr_seq_00000242_000002FC
	goto scr_seq_00000242_00000296

scr_seq_00000242_00000258:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000242_00000273
	apply_movement 2, scr_seq_00000242_00000308
	goto scr_seq_00000242_00000296

scr_seq_00000242_00000273:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_00000242_0000028E
	apply_movement 2, scr_seq_00000242_00000314
	goto scr_seq_00000242_00000296

scr_seq_00000242_0000028E:
	apply_movement 2, scr_seq_00000242_00000320
scr_seq_00000242_00000296:
	wait_movement
	releaseall
	end


scr_seq_00000242_0000029C:
	.short 75, 1
	.short 254, 0

scr_seq_00000242_000002A4:
	.short 18, 1
	.short 16, 2
	.short 39, 1
	.short 254, 0

scr_seq_00000242_000002B4:
	.short 18, 1
	.short 16, 1
	.short 39, 1
	.short 254, 0

scr_seq_00000242_000002C4:
	.short 18, 1
	.short 17, 1
	.short 39, 1
	.short 254, 0

scr_seq_00000242_000002D4:
	.short 18, 1
	.short 17, 2
	.short 39, 1
	.short 254, 0

scr_seq_00000242_000002E4:
	.short 15, 1
	.short 254, 0

scr_seq_00000242_000002EC:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000242_000002FC:
	.short 13, 2
	.short 35, 1
	.short 254, 0

scr_seq_00000242_00000308:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000242_00000314:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000242_00000320:
	.short 12, 2
	.short 35, 1
	.short 254, 0
scr_seq_00000242_0000032C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000242_0000033F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10405
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_00000242_00000438
	checkflag FLAG_UNK_1C4
	gotoif TRUE, scr_seq_00000242_000003C1
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000242_0000038C
	apply_movement 255, scr_seq_00000242_0000043C
	goto scr_seq_00000242_000003AF

scr_seq_00000242_0000038C:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000242_000003A7
	apply_movement 255, scr_seq_00000242_00000448
	goto scr_seq_00000242_000003AF

scr_seq_00000242_000003A7:
	apply_movement 255, scr_seq_00000242_00000450
scr_seq_00000242_000003AF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000242_000003E3

scr_seq_00000242_000003C1:
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000242_00000460
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_00000242_000003E3:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 487, 0, 40, 86, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000242_00000428
	scrcmd_606
	goto scr_seq_00000242_0000042A

scr_seq_00000242_00000428:
	scrcmd_607
scr_seq_00000242_0000042A:
	apply_movement 253, scr_seq_00000242_000000E8
	wait_movement
	scrcmd_099 253
scr_seq_00000242_00000438:
	releaseall
	end


scr_seq_00000242_0000043C:
	.short 15, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000242_00000448:
	.short 12, 1
	.short 254, 0

scr_seq_00000242_00000450:
	.short 13, 1
	.short 15, 2
	.short 12, 2
	.short 254, 0

scr_seq_00000242_00000460:
	.short 15, 2
	.short 12, 2
	.short 254, 0
scr_seq_00000242_0000046C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000242_0000047F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000242_000005A7
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000242_000005BB
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000242_000004F8
	apply_movement 255, scr_seq_00000242_000005D0
	apply_movement 6, scr_seq_00000242_0000061C
	goto scr_seq_00000242_00000546

scr_seq_00000242_000004F8:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000242_00000513
	apply_movement 255, scr_seq_00000242_000005E8
	goto scr_seq_00000242_00000546

scr_seq_00000242_00000513:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000242_00000536
	apply_movement 255, scr_seq_00000242_00000608
	apply_movement 6, scr_seq_00000242_0000061C
	goto scr_seq_00000242_00000546

scr_seq_00000242_00000536:
	apply_movement 255, scr_seq_00000242_000005F4
	apply_movement 6, scr_seq_00000242_0000061C
scr_seq_00000242_00000546:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000242_0000056D
	apply_movement 253, scr_seq_00000242_00000628
	wait_movement
scr_seq_00000242_0000056D:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 12
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

scr_seq_00000242_000005A7:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000242_000005BB:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000242_000005CF:
	.byte 0x00

scr_seq_00000242_000005D0:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000242_000005E8:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000242_000005F4:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000242_00000608:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000242_0000061C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000242_00000628:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000242_00000638:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000242_0000064B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000242_0000065E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000242_00000671:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000242_00000684:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
