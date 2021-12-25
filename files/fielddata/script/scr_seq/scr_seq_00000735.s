#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000735_0000023C ; 000
	scrdef scr_seq_00000735_0000024F ; 001
	scrdef scr_seq_00000735_00000262 ; 002
	scrdef scr_seq_00000735_00000279 ; 003
	scrdef scr_seq_00000735_0000028E ; 004
	scrdef scr_seq_00000735_000002A3 ; 005
	scrdef scr_seq_00000735_00000081 ; 006
	scrdef scr_seq_00000735_00000022 ; 007
	scrdef_end

scr_seq_00000735_00000022:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000735_00000033
	clearflag FLAG_UNK_189
	end

scr_seq_00000735_00000033:
	checkflag FLAG_UNK_185
	gotoif eq, scr_seq_00000735_00000044
	goto scr_seq_00000735_0000004A

scr_seq_00000735_00000044:
	setvar VAR_UNK_4096, 0
scr_seq_00000735_0000004A:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000735_0000007B
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000735_0000007B
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000735_0000007B
	setflag FLAG_UNK_27E
	end

scr_seq_00000735_0000007B:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000735_00000081:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000735_000001A9
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000735_000001BD
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000735_000000FA
	apply_movement 255, scr_seq_00000735_000001D4
	apply_movement 2, scr_seq_00000735_00000220
	goto scr_seq_00000735_00000148

scr_seq_00000735_000000FA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000735_00000115
	apply_movement 255, scr_seq_00000735_000001EC
	goto scr_seq_00000735_00000148

scr_seq_00000735_00000115:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000735_00000138
	apply_movement 255, scr_seq_00000735_0000020C
	apply_movement 2, scr_seq_00000735_00000220
	goto scr_seq_00000735_00000148

scr_seq_00000735_00000138:
	apply_movement 255, scr_seq_00000735_000001F8
	apply_movement 2, scr_seq_00000735_00000220
scr_seq_00000735_00000148:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000735_0000016F
	apply_movement 253, scr_seq_00000735_0000022C
	wait_movement
scr_seq_00000735_0000016F:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 73
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

scr_seq_00000735_000001A9:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000735_000001BD:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000735_000001D1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000735_000001D4:
	.short 14, 1
	.short 12, 2
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000735_000001EC:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000735_000001F8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000735_0000020C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000735_00000220:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000735_0000022C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000735_0000023C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000735_0000024F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000735_00000262:
	scrcmd_055 2, 0, 1, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000735_00000279:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 3, 32780
	callstd 2000
	end

scr_seq_00000735_0000028E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 4, 32780
	callstd 2000
	end

scr_seq_00000735_000002A3:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 5, 32780
	callstd 2000
	end
	.balign 4, 0
