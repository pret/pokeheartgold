#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000212_0000045C ; 000
	scrdef scr_seq_00000212_00000016 ; 001
	scrdef scr_seq_00000212_00000614 ; 002
	scrdef scr_seq_00000212_00000099 ; 003
	scrdef scr_seq_00000212_00000064 ; 004
	scrdef_end

scr_seq_00000212_00000016:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000212_00000027
	clearflag FLAG_UNK_189
	end

scr_seq_00000212_00000027:
	comparevartovalue VAR_UNK_40FE, 1
	gotoif eq, scr_seq_00000212_0000005E
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000212_00000058
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000212_00000058
	setflag FLAG_UNK_27E
	end

scr_seq_00000212_00000058:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000212_0000005E:
	setflag FLAG_UNK_27E
	end

scr_seq_00000212_00000064:
	comparevartovalue VAR_UNK_40FE, 1
	gotoif eq, scr_seq_00000212_00000073
	end

scr_seq_00000212_00000073:
	scrcmd_339 1, 947, 1, 266, 2
	scrcmd_339 2, 950, 1, 266, 2
	scrcmd_339 3, 952, 1, 280, 3
	end

scr_seq_00000212_00000099:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000212_0000037C
	wait_movement
	apply_movement 3, scr_seq_00000212_000002CC
	wait_movement
	scrcmd_132 12, 11
	closemsg
	apply_movement 3, scr_seq_00000212_000002E0
	wait_movement
	scrcmd_190 0
	scrcmd_132 14, 13
	closemsg
	apply_movement 3, scr_seq_00000212_000002FC
	wait_movement
	scrcmd_132 16, 15
	closemsg
	apply_movement 3, scr_seq_00000212_00000304
	apply_movement 255, scr_seq_00000212_000003D0
	wait_movement
	scrcmd_132 18, 17
	closemsg
	apply_movement 3, scr_seq_00000212_00000338
	wait_movement
	scrcmd_190 0
	scrcmd_132 20, 19
	closemsg
	apply_movement 255, scr_seq_00000212_000003A0
	apply_movement 3, scr_seq_00000212_00000310
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_105 32772, 32773
	scrcmd_102 32772, 32773
	apply_movement 241, scr_seq_00000212_000003DC
	wait_movement
	scrcmd_084 0, 30
	apply_movement 2, scr_seq_00000212_000003F4
	wait_movement
	scrcmd_191 0
	msgbox 2
	closemsg
	apply_movement 1, scr_seq_00000212_00000438
	wait_movement
	msgbox 8
	closemsg
	apply_movement 2, scr_seq_00000212_000003FC
	wait_movement
	scrcmd_191 0
	msgbox 3
	closemsg
	apply_movement 1, scr_seq_00000212_00000444
	wait_movement
	msgbox 9
	closemsg
	apply_movement 2, scr_seq_00000212_000003F4
	wait_movement
	scrcmd_191 0
	msgbox 4
	closemsg
	apply_movement 1, scr_seq_00000212_0000044C
	wait_movement
	msgbox 10
	closemsg
	apply_movement 1, scr_seq_00000212_00000454
	wait_movement
	apply_movement 2, scr_seq_00000212_000003F4
	wait_movement
	scrcmd_191 0
	msgbox 5
	closemsg
	apply_movement 2, scr_seq_00000212_000003F4
	wait_movement
	msgbox 6
	closemsg
	callstd 2031
	apply_movement 241, scr_seq_00000212_000003E8
	apply_movement 2, scr_seq_00000212_00000404
	wait_movement
	scrcmd_103
	scrcmd_191 0
	msgbox 7
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 2, scr_seq_00000212_00000420
	play_se SEQ_SE_DP_WALL_HIT2
	apply_movement 255, scr_seq_00000212_000003B0
	apply_movement 3, scr_seq_00000212_000003D0
	wait_movement
	apply_movement 2, scr_seq_00000212_0000042C
	apply_movement 255, scr_seq_00000212_000003D0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_101 1
	scrcmd_101 2
	setflag FLAG_UNK_301
	callstd 2032
	scrcmd_132 22, 21
	closemsg
	scrcmd_084 20, 30
	apply_movement 253, scr_seq_00000212_00000350
	wait_movement
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	scrcmd_174 6, 6, 0, 32767
	scrcmd_175
	wait 15, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 32767
	scrcmd_175
	apply_movement 255, scr_seq_00000212_000003C4
	apply_movement 3, scr_seq_00000212_00000320
	wait_movement
	scrcmd_132 24, 23
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setvar VAR_UNK_40FE, 2
	clearflag FLAG_UNK_303
	clearflag FLAG_UNK_311
	scrcmd_176 298, 0, 6, 8, 1
	scrcmd_174 6, 15, 1, 32767
	scrcmd_175
	releaseall
	end

scr_seq_00000212_000002C9:
	.byte 0x00, 0x00, 0x00

scr_seq_00000212_000002CC:
	.short 75, 1
	.short 63, 1
	.short 35, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000212_000002E0:
	.short 16, 2
	.short 63, 1
	.short 34, 1
	.short 65, 1
	.short 35, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000212_000002FC:
	.short 13, 1
	.short 254, 0

scr_seq_00000212_00000304:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000212_00000310:
	.short 12, 2
	.short 14, 2
	.short 12, 1
	.short 254, 0

scr_seq_00000212_00000320:
	.short 34, 1
	.short 65, 1
	.short 35, 1
	.short 65, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000212_00000338:
	.short 75, 1
	.short 63, 1
	.short 12, 2
	.short 15, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000212_00000350:
	.short 1, 1
	.short 57, 1
	.short 71, 1
	.short 52, 1
	.short 71, 1
	.short 254, 0
	.byte 0x47, 0x00, 0x01, 0x00, 0x13, 0x00, 0x02, 0x00
	.byte 0x48, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000212_0000037C:
	.short 32, 1
	.short 12, 1
	.short 63, 1
	.short 34, 1
	.short 65, 1
	.short 35, 1
	.short 65, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000212_000003A0:
	.short 12, 5
	.short 14, 2
	.short 12, 2
	.short 254, 0

scr_seq_00000212_000003B0:
	.short 62, 1
	.short 71, 1
	.short 53, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000212_000003C4:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000212_000003D0:
	.short 65, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000212_000003DC:
	.short 12, 5
	.short 14, 2
	.short 254, 0

scr_seq_00000212_000003E8:
	.short 19, 2
	.short 17, 4
	.short 254, 0

scr_seq_00000212_000003F4:
	.short 14, 1
	.short 254, 0

scr_seq_00000212_000003FC:
	.short 34, 1
	.short 254, 0

scr_seq_00000212_00000404:
	.short 66, 1
	.short 19, 6
	.short 17, 4
	.short 63, 1
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000212_00000420:
	.short 17, 2
	.short 65, 1
	.short 254, 0

scr_seq_00000212_0000042C:
	.short 19, 1
	.short 17, 8
	.short 254, 0

scr_seq_00000212_00000438:
	.short 35, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000212_00000444:
	.short 35, 1
	.short 254, 0

scr_seq_00000212_0000044C:
	.short 34, 1
	.short 254, 0

scr_seq_00000212_00000454:
	.short 14, 6
	.short 254, 0
scr_seq_00000212_0000045C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000212_00000584
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000212_00000598
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000212_000004D5
	apply_movement 255, scr_seq_00000212_000005AC
	apply_movement 0, scr_seq_00000212_000005F8
	goto scr_seq_00000212_00000523

scr_seq_00000212_000004D5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000212_000004F0
	apply_movement 255, scr_seq_00000212_000005C4
	goto scr_seq_00000212_00000523

scr_seq_00000212_000004F0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000212_00000513
	apply_movement 255, scr_seq_00000212_000005E4
	apply_movement 0, scr_seq_00000212_000005F8
	goto scr_seq_00000212_00000523

scr_seq_00000212_00000513:
	apply_movement 255, scr_seq_00000212_000005D0
	apply_movement 0, scr_seq_00000212_000005F8
scr_seq_00000212_00000523:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000212_0000054A
	apply_movement 253, scr_seq_00000212_00000604
	wait_movement
scr_seq_00000212_0000054A:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 71
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

scr_seq_00000212_00000584:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000212_00000598:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000212_000005AC:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000212_000005C4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000212_000005D0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000212_000005E4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000212_000005F8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000212_00000604:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000212_00000614:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, 32780
	callstd 2000
	end
	.balign 4, 0
