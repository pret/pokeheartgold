#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000741_000000AE ; 000
	scrdef scr_seq_00000741_000000E2 ; 001
	scrdef scr_seq_00000741_00000108 ; 002
	scrdef scr_seq_00000741_00000314 ; 003
	scrdef scr_seq_00000741_00000327 ; 004
	scrdef scr_seq_00000741_0000033E ; 005
	scrdef scr_seq_00000741_00000353 ; 006
	scrdef scr_seq_00000741_00000368 ; 007
	scrdef scr_seq_00000741_00000032 ; 008
	scrdef scr_seq_00000741_0000015C ; 009
	scrdef scr_seq_00000741_000000F5 ; 010
	scrdef scr_seq_00000741_00000090 ; 011
	scrdef_end

scr_seq_00000741_00000032:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000741_00000043
	clearflag FLAG_UNK_189
	end

scr_seq_00000741_00000043:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000741_0000005E
	clearflag FLAG_UNK_27E
	goto scr_seq_00000741_00000079

scr_seq_00000741_0000005E:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000741_00000075
	clearflag FLAG_UNK_27E
	goto scr_seq_00000741_00000079

scr_seq_00000741_00000075:
	setflag FLAG_UNK_27E
scr_seq_00000741_00000079:
	checkflag FLAG_UNK_12C
	gotoif eq, scr_seq_00000741_0000008E
	setflag FLAG_UNK_12C
	setvar VAR_UNK_4121, 1
scr_seq_00000741_0000008E:
	end

scr_seq_00000741_00000090:
	setvar VAR_SPECIAL_x8004, 2
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd 2039
	setvar VAR_UNK_4096, 2
	end

scr_seq_00000741_000000AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000741_000000D7
	msgbox 1
	goto scr_seq_00000741_000000DA

scr_seq_00000741_000000D7:
	msgbox 2
scr_seq_00000741_000000DA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000741_000000E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000741_000000F5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000741_00000108:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_12E
	gotoif eq, scr_seq_00000741_00000147
	msgbox 5
	setvar VAR_SPECIAL_x8004, 412
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000741_00000152
	callstd 2033
	setflag FLAG_UNK_12E
scr_seq_00000741_00000147:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000741_00000152:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000741_0000015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000741_00000284
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000741_00000298
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000741_000001D5
	apply_movement 255, scr_seq_00000741_000002AC
	apply_movement 6, scr_seq_00000741_000002F8
	goto scr_seq_00000741_00000223

scr_seq_00000741_000001D5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000741_000001F0
	apply_movement 255, scr_seq_00000741_000002C4
	goto scr_seq_00000741_00000223

scr_seq_00000741_000001F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000741_00000213
	apply_movement 255, scr_seq_00000741_000002E4
	apply_movement 6, scr_seq_00000741_000002F8
	goto scr_seq_00000741_00000223

scr_seq_00000741_00000213:
	apply_movement 255, scr_seq_00000741_000002D0
	apply_movement 6, scr_seq_00000741_000002F8
scr_seq_00000741_00000223:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000741_0000024A
	apply_movement 253, scr_seq_00000741_00000304
	wait_movement
scr_seq_00000741_0000024A:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 69
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

scr_seq_00000741_00000284:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000741_00000298:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000741_000002AC:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000741_000002C4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000741_000002D0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000741_000002E4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000741_000002F8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000741_00000304:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000741_00000314:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000741_00000327:
	scrcmd_055 8, 0, 2, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000741_0000033E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, 32780
	callstd 2000
	end

scr_seq_00000741_00000353:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 10, 32780
	callstd 2000
	end

scr_seq_00000741_00000368:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, 32780
	callstd 2000
	end
	.balign 4, 0
