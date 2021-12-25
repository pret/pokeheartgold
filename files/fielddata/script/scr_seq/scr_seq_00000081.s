#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000081_0000007E ; 000
	scrdef scr_seq_00000081_000000A9 ; 001
	scrdef scr_seq_00000081_00000026 ; 002
	scrdef scr_seq_00000081_0000023C ; 003
	scrdef scr_seq_00000081_00000043 ; 004
	scrdef scr_seq_00000081_000003F4 ; 005
	scrdef scr_seq_00000081_0000044C ; 006
	scrdef scr_seq_00000081_0000045F ; 007
	scrdef scr_seq_00000081_00000472 ; 008
	scrdef_end

scr_seq_00000081_00000026:
	comparevartovalue VAR_UNK_40E5, 2
	gotoif eq, scr_seq_00000081_00000035
	end

scr_seq_00000081_00000035:
	scrcmd_339 0, 17, 1, 25, 2
	end

scr_seq_00000081_00000043:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000081_00000054
	clearflag FLAG_UNK_189
	end

scr_seq_00000081_00000054:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000081_00000078
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000081_00000078
	setflag FLAG_UNK_27E
	end

scr_seq_00000081_00000078:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000081_0000007E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40E5, 2
	gotoif eq, scr_seq_00000081_0000009E
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000081_0000009E:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000081_000000A9:
	scrcmd_609
	lockall
	msgbox 0
	closemsg
	scrcmd_339 0, 14, 1, 36, 0
	scrcmd_105 32772, 32773
	comparevartovalue VAR_SPECIAL_x8004, 12
	gotoif ne, scr_seq_00000081_000000E7
	apply_movement 0, scr_seq_00000081_0000019C
	apply_movement 255, scr_seq_00000081_00000224
	goto scr_seq_00000081_00000183

scr_seq_00000081_000000E7:
	comparevartovalue VAR_SPECIAL_x8004, 13
	gotoif ne, scr_seq_00000081_0000010A
	apply_movement 0, scr_seq_00000081_000001B4
	apply_movement 255, scr_seq_00000081_00000224
	goto scr_seq_00000081_00000183

scr_seq_00000081_0000010A:
	comparevartovalue VAR_SPECIAL_x8004, 14
	gotoif ne, scr_seq_00000081_0000012D
	apply_movement 0, scr_seq_00000081_000001C8
	apply_movement 255, scr_seq_00000081_00000224
	goto scr_seq_00000081_00000183

scr_seq_00000081_0000012D:
	comparevartovalue VAR_SPECIAL_x8004, 15
	gotoif ne, scr_seq_00000081_00000150
	apply_movement 0, scr_seq_00000081_000001E0
	apply_movement 255, scr_seq_00000081_00000230
	goto scr_seq_00000081_00000183

scr_seq_00000081_00000150:
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif ne, scr_seq_00000081_00000173
	apply_movement 0, scr_seq_00000081_000001F4
	apply_movement 255, scr_seq_00000081_00000230
	goto scr_seq_00000081_00000183

scr_seq_00000081_00000173:
	apply_movement 0, scr_seq_00000081_0000020C
	apply_movement 255, scr_seq_00000081_00000230
scr_seq_00000081_00000183:
	wait_movement
	msgbox 1
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_40E5, 1
	setflag FLAG_UNK_25B
	end

scr_seq_00000081_0000019A:
	.byte 0x00, 0x00

scr_seq_00000081_0000019C:
	.short 18, 1
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000081_000001B4:
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000081_000001C8:
	.short 15, 1
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000081_000001E0:
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000081_000001F4:
	.short 15, 1
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000081_0000020C:
	.short 19, 2
	.short 16, 5
	.short 76, 2
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000081_00000224:
	.short 63, 5
	.short 35, 1
	.short 254, 0

scr_seq_00000081_00000230:
	.short 63, 5
	.short 34, 1
	.short 254, 0
scr_seq_00000081_0000023C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000081_00000364
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000081_00000378
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000081_000002B5
	apply_movement 255, scr_seq_00000081_0000038C
	apply_movement 1, scr_seq_00000081_000003D8
	goto scr_seq_00000081_00000303

scr_seq_00000081_000002B5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000081_000002D0
	apply_movement 255, scr_seq_00000081_000003A4
	goto scr_seq_00000081_00000303

scr_seq_00000081_000002D0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000081_000002F3
	apply_movement 255, scr_seq_00000081_000003C4
	apply_movement 1, scr_seq_00000081_000003D8
	goto scr_seq_00000081_00000303

scr_seq_00000081_000002F3:
	apply_movement 255, scr_seq_00000081_000003B0
	apply_movement 1, scr_seq_00000081_000003D8
scr_seq_00000081_00000303:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000081_0000032A
	apply_movement 253, scr_seq_00000081_000003E4
	wait_movement
scr_seq_00000081_0000032A:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 29
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, 32780
	scrcmd_440 32780, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000081_00000364:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000081_00000378:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000081_0000038C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000081_000003A4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000081_000003B0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000081_000003C4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000081_000003D8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000081_000003E4:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000081_000003F4:
	checkflag FLAG_UNK_150
	gotoif eq, scr_seq_00000081_00000421
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 4
	apply_movement 2, scr_seq_00000081_0000043C
	wait_movement
	msgbox 5
	closemsg
	setflag FLAG_UNK_150
	goto scr_seq_00000081_0000042E

scr_seq_00000081_00000421:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	closemsg
scr_seq_00000081_0000042E:
	apply_movement 2, scr_seq_00000081_00000444
	wait_movement
	releaseall
	end


scr_seq_00000081_0000043C:
	.short 1, 1
	.short 254, 0

scr_seq_00000081_00000444:
	.short 0, 1
	.short 254, 0
scr_seq_00000081_0000044C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000081_0000045F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000081_00000472:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, 32780
	callstd 2000
	end
	.balign 4, 0
