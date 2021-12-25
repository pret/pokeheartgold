#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000809_00000026 ; 000
	scrdef scr_seq_00000809_000006D4 ; 001
	scrdef scr_seq_00000809_0000079E ; 002
	scrdef scr_seq_00000809_00000178 ; 003
	scrdef scr_seq_00000809_00000290 ; 004
	scrdef scr_seq_00000809_000003A8 ; 005
	scrdef scr_seq_00000809_000004C5 ; 006
	scrdef scr_seq_00000809_000007CF ; 007
	scrdef scr_seq_00000809_000000F5 ; 008
	scrdef_end

scr_seq_00000809_00000026:
	scrcmd_330
	scrcmd_142 26, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000809_000000EF
	scrcmd_147 26, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000809_000000AF
	scrcmd_294 12, 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000809_0000006D
	goto scr_seq_00000809_000000E9

scr_seq_00000809_00000067:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000809_0000006D:
	goto scr_seq_00000809_00000075

scr_seq_00000809_00000073:
	.byte 0x02, 0x00
scr_seq_00000809_00000075:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000809_00000090
	setflag FLAG_UNK_2F3
	goto scr_seq_00000809_000000AD

scr_seq_00000809_00000090:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_00000809_000000A7
	setflag FLAG_UNK_2F3
	goto scr_seq_00000809_000000AD

scr_seq_00000809_000000A7:
	goto scr_seq_00000809_000000E9

scr_seq_00000809_000000AD:
	end

scr_seq_00000809_000000AF:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000809_000000CA
	setflag FLAG_UNK_2F3
	goto scr_seq_00000809_000000E7

scr_seq_00000809_000000CA:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_00000809_000000E1
	setflag FLAG_UNK_2F3
	goto scr_seq_00000809_000000E7

scr_seq_00000809_000000E1:
	goto scr_seq_00000809_000000E9

scr_seq_00000809_000000E7:
	end

scr_seq_00000809_000000E9:
	clearflag FLAG_UNK_2F3
	end

scr_seq_00000809_000000EF:
	setflag FLAG_UNK_2F3
	end

scr_seq_00000809_000000F5:
	comparevartovalue VAR_TEMP_x400B, 111
	gotoif ne, scr_seq_00000809_0000012E
	checktrainerflag 136
	callif lt, scr_seq_00000809_00000130
	checktrainerflag 84
	callif lt, scr_seq_00000809_00000142
	checktrainerflag 183
	callif lt, scr_seq_00000809_00000154
	checktrainerflag 83
	callif lt, scr_seq_00000809_00000166
scr_seq_00000809_0000012E:
	end

scr_seq_00000809_00000130:
	clearflag FLAG_UNK_266
	scrcmd_100 1
	setflag FLAG_UNK_26A
	scrcmd_101 8
	return

scr_seq_00000809_00000142:
	clearflag FLAG_UNK_267
	scrcmd_100 5
	setflag FLAG_UNK_26B
	scrcmd_101 7
	return

scr_seq_00000809_00000154:
	clearflag FLAG_UNK_268
	scrcmd_100 4
	setflag FLAG_UNK_26C
	scrcmd_101 9
	return

scr_seq_00000809_00000166:
	clearflag FLAG_UNK_269
	scrcmd_100 0
	setflag FLAG_UNK_26D
	scrcmd_101 6
	return

scr_seq_00000809_00000178:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 136
	gotoif eq, scr_seq_00000809_00000277
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_000001AA
	apply_movement 8, scr_seq_00000809_00000620
	goto scr_seq_00000809_000001E8

scr_seq_00000809_000001AA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000809_000001C5
	apply_movement 8, scr_seq_00000809_000005E4
	goto scr_seq_00000809_000001E8

scr_seq_00000809_000001C5:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000809_000001E0
	apply_movement 8, scr_seq_00000809_00000604
	goto scr_seq_00000809_000001E8

scr_seq_00000809_000001E0:
	apply_movement 8, scr_seq_00000809_00000638
scr_seq_00000809_000001E8:
	wait_movement
	clearflag FLAG_UNK_266
	scrcmd_100 1
	setflag FLAG_UNK_26A
	scrcmd_101 8
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_00000215
	apply_movement 1, scr_seq_00000809_00000698
	goto scr_seq_00000809_00000253

scr_seq_00000809_00000215:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000809_00000230
	apply_movement 1, scr_seq_00000809_0000065C
	goto scr_seq_00000809_00000253

scr_seq_00000809_00000230:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000809_0000024B
	apply_movement 1, scr_seq_00000809_00000680
	goto scr_seq_00000809_00000253

scr_seq_00000809_0000024B:
	apply_movement 1, scr_seq_00000809_000006B4
scr_seq_00000809_00000253:
	wait_movement
	msgbox 7
	closemsg
	scrcmd_213 136, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000809_00000282
	settrainerflag 136
scr_seq_00000809_00000277:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000809_00000282:
	scrcmd_219
	releaseall
	setflag FLAG_UNK_266
	clearflag FLAG_UNK_26A
	end

scr_seq_00000809_00000290:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 84
	gotoif eq, scr_seq_00000809_0000038F
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_000002C2
	apply_movement 7, scr_seq_00000809_00000620
	goto scr_seq_00000809_00000300

scr_seq_00000809_000002C2:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000809_000002DD
	apply_movement 7, scr_seq_00000809_000005E4
	goto scr_seq_00000809_00000300

scr_seq_00000809_000002DD:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000809_000002F8
	apply_movement 7, scr_seq_00000809_00000604
	goto scr_seq_00000809_00000300

scr_seq_00000809_000002F8:
	apply_movement 7, scr_seq_00000809_00000638
scr_seq_00000809_00000300:
	wait_movement
	clearflag FLAG_UNK_267
	scrcmd_100 5
	setflag FLAG_UNK_26B
	scrcmd_101 7
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_0000032D
	apply_movement 5, scr_seq_00000809_00000698
	goto scr_seq_00000809_0000036B

scr_seq_00000809_0000032D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000809_00000348
	apply_movement 5, scr_seq_00000809_0000065C
	goto scr_seq_00000809_0000036B

scr_seq_00000809_00000348:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000809_00000363
	apply_movement 5, scr_seq_00000809_00000680
	goto scr_seq_00000809_0000036B

scr_seq_00000809_00000363:
	apply_movement 5, scr_seq_00000809_000006B4
scr_seq_00000809_0000036B:
	wait_movement
	msgbox 9
	closemsg
	scrcmd_213 84, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000809_0000039A
	settrainerflag 84
scr_seq_00000809_0000038F:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000809_0000039A:
	scrcmd_219
	releaseall
	setflag FLAG_UNK_267
	clearflag FLAG_UNK_26B
	end

scr_seq_00000809_000003A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 183
	gotoif eq, scr_seq_00000809_000004AC
	msgbox 11
	closemsg
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_000003DF
	apply_movement 9, scr_seq_00000809_00000620
	goto scr_seq_00000809_0000041D

scr_seq_00000809_000003DF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000809_000003FA
	apply_movement 9, scr_seq_00000809_000005E4
	goto scr_seq_00000809_0000041D

scr_seq_00000809_000003FA:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000809_00000415
	apply_movement 9, scr_seq_00000809_00000604
	goto scr_seq_00000809_0000041D

scr_seq_00000809_00000415:
	apply_movement 9, scr_seq_00000809_00000638
scr_seq_00000809_0000041D:
	wait_movement
	clearflag FLAG_UNK_268
	scrcmd_100 4
	setflag FLAG_UNK_26C
	scrcmd_101 9
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_0000044A
	apply_movement 4, scr_seq_00000809_00000698
	goto scr_seq_00000809_00000488

scr_seq_00000809_0000044A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000809_00000465
	apply_movement 4, scr_seq_00000809_0000065C
	goto scr_seq_00000809_00000488

scr_seq_00000809_00000465:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000809_00000480
	apply_movement 4, scr_seq_00000809_00000680
	goto scr_seq_00000809_00000488

scr_seq_00000809_00000480:
	apply_movement 4, scr_seq_00000809_000006B4
scr_seq_00000809_00000488:
	wait_movement
	msgbox 12
	closemsg
	scrcmd_213 183, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000809_000004B7
	settrainerflag 183
scr_seq_00000809_000004AC:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000809_000004B7:
	scrcmd_219
	releaseall
	setflag FLAG_UNK_268
	clearflag FLAG_UNK_26C
	end

scr_seq_00000809_000004C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 83
	gotoif eq, scr_seq_00000809_000005C9
	msgbox 14
	closemsg
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_000004FC
	apply_movement 6, scr_seq_00000809_00000620
	goto scr_seq_00000809_0000053A

scr_seq_00000809_000004FC:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000809_00000517
	apply_movement 6, scr_seq_00000809_000005E4
	goto scr_seq_00000809_0000053A

scr_seq_00000809_00000517:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000809_00000532
	apply_movement 6, scr_seq_00000809_00000604
	goto scr_seq_00000809_0000053A

scr_seq_00000809_00000532:
	apply_movement 6, scr_seq_00000809_00000638
scr_seq_00000809_0000053A:
	wait_movement
	clearflag FLAG_UNK_269
	scrcmd_100 0
	setflag FLAG_UNK_26D
	scrcmd_101 6
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_00000567
	apply_movement 0, scr_seq_00000809_00000698
	goto scr_seq_00000809_000005A5

scr_seq_00000809_00000567:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000809_00000582
	apply_movement 0, scr_seq_00000809_0000065C
	goto scr_seq_00000809_000005A5

scr_seq_00000809_00000582:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000809_0000059D
	apply_movement 0, scr_seq_00000809_00000680
	goto scr_seq_00000809_000005A5

scr_seq_00000809_0000059D:
	apply_movement 0, scr_seq_00000809_000006B4
scr_seq_00000809_000005A5:
	wait_movement
	msgbox 15
	closemsg
	scrcmd_213 83, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000809_000005D4
	settrainerflag 83
scr_seq_00000809_000005C9:
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000809_000005D4:
	scrcmd_219
	releaseall
	setflag FLAG_UNK_269
	clearflag FLAG_UNK_26D
	end

scr_seq_00000809_000005E2:
	.byte 0x00, 0x00

scr_seq_00000809_000005E4:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000809_00000604:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000809_00000620:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000809_00000638:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000809_0000065C:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000809_00000680:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000809_00000698:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000809_000006B4:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0
scr_seq_00000809_000006D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 12, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000809_00000778
	msgbox 0
	closemsg
	setvar VAR_TEMP_x400B, 111
	scrcmd_213 257, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000809_0000078E
	setvar VAR_TEMP_x400B, 0
	scrcmd_295 12
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	settrainerflag 83
	settrainerflag 84
	settrainerflag 136
	settrainerflag 183
	msgbox 1
	scrcmd_190 0
	msgbox 2
	scrcmd_078 1189
	scrcmd_079
	msgbox 3
	goto scr_seq_00000809_0000074F

scr_seq_00000809_0000074F:
	setvar VAR_SPECIAL_x8004, 411
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000809_00000794
	callstd 2033
	setflag FLAG_UNK_12D
scr_seq_00000809_00000778:
	checkflag FLAG_UNK_12D
	gotoif lt, scr_seq_00000809_0000074F
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000809_0000078E:
	scrcmd_219
	releaseall
	end

scr_seq_00000809_00000794:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000809_0000079E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 12, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000809_000007C4
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000809_000007C4:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000809_000007CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 12, 32780
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000809_000007F6
	msgbox 17
	goto scr_seq_00000809_000007F9

scr_seq_00000809_000007F6:
	msgbox 18
scr_seq_00000809_000007F9:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
