#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000152_00000138 ; 000
	scrdef scr_seq_00000152_00000016 ; 001
	scrdef scr_seq_00000152_00000031 ; 002
	scrdef scr_seq_00000152_000003FC ; 003
	scrdef scr_seq_00000152_0000040F ; 004
	scrdef_end

scr_seq_00000152_00000016:
	scrcmd_445 16384
	comparevartovalue VAR_TEMP_x4000, 330
	gotoif eq, scr_seq_00000152_00000029
	end

scr_seq_00000152_00000029:
	scrcmd_341 0, 1
	end

scr_seq_00000152_00000031:
	scrcmd_609
	lockall
	apply_movement 1, scr_seq_00000152_000000E4
	wait_movement
	scrcmd_081 0
	play_bgm SEQ_GS_OHKIDO
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 1, scr_seq_00000152_000000EC
	apply_movement 255, scr_seq_00000152_00000100
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_190 0
	scrcmd_132 9, 10
	closemsg
	apply_movement 1, scr_seq_00000152_00000110
	wait_movement
	scrcmd_477 1, 32780
	scrcmd_190 0
	play_fanfare SEQ_ME_ITEM
	msgbox 11
	wait_fanfare
	scrcmd_463
	msgbox 12
	closemsg
	apply_movement 1, scr_seq_00000152_00000120
	wait_movement
	msgbox 13
	closemsg
	apply_movement 1, scr_seq_00000152_00000128
	wait_movement
	hide_person 1
	setflag FLAG_UNK_251
	setvar VAR_UNK_411A, 0
	fade_out_bgm 0, 30
	scrcmd_081 0
	reset_bgm
	releaseall
	comparevartovalue VAR_UNK_40D3, 1
	callif eq, scr_seq_00000152_000000DE
	scrcmd_463
	end

scr_seq_00000152_000000DE:
	clearflag FLAG_UNK_2B3
	return


scr_seq_00000152_000000E4:
	.short 75, 1
	.short 254, 0

scr_seq_00000152_000000EC:
	.short 63, 1
	.short 14, 3
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000152_00000100:
	.short 63, 3
	.short 13, 3
	.short 35, 1
	.short 254, 0

scr_seq_00000152_00000110:
	.short 34, 1
	.short 63, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000152_00000120:
	.short 75, 1
	.short 254, 0

scr_seq_00000152_00000128:
	.short 12, 2
	.short 14, 1
	.short 12, 1
	.short 254, 0
scr_seq_00000152_00000138:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif lt, scr_seq_00000152_00000361
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000152_00000356
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_00000152_00000320
	comparevartovalue VAR_UNK_40CB, 7
	gotoif ge, scr_seq_00000152_000001FB
	msgbox 1
	closemsg
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000152_000002F9
	apply_movement 255, scr_seq_00000152_0000036C
	wait_movement
	scrcmd_190 0
	msgbox 4
	closemsg
	apply_movement 0, scr_seq_00000152_000003F4
	wait_movement
	msgbox 5
	closemsg
	apply_movement 0, scr_seq_00000152_0000038C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000152_000003AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_UNK_40E1, 1
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_UNK_0EB
	setflag FLAG_UNK_22C
	setflag FLAG_UNK_22B
	releaseall
	end

scr_seq_00000152_000001FB:
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000152_00000218
	goto scr_seq_00000152_000002EE

scr_seq_00000152_00000212:
	.byte 0x16, 0x00, 0x83, 0x00, 0x00, 0x00
scr_seq_00000152_00000218:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000152_00000231
	goto scr_seq_00000152_0000029B

scr_seq_00000152_0000022B:
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00
	.byte 0x00
scr_seq_00000152_00000231:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000152_0000024A
	goto scr_seq_00000152_000002EE

scr_seq_00000152_00000244:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_00000152_0000024A:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000152_00000263
	goto scr_seq_00000152_000002EE

scr_seq_00000152_0000025D:
	.byte 0x16, 0x00, 0x38
	.byte 0x00, 0x00, 0x00
scr_seq_00000152_00000263:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, scr_seq_00000152_0000027C
	goto scr_seq_00000152_000002EE

scr_seq_00000152_00000276:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000152_0000027C:
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif ne, scr_seq_00000152_00000295
	goto scr_seq_00000152_0000029B

scr_seq_00000152_0000028F:
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000152_00000295:
	goto scr_seq_00000152_000002EE

scr_seq_00000152_0000029B:
	msgbox 7
	closemsg
	apply_movement 0, scr_seq_00000152_0000038C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000152_000003AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_UNK_40E1, 1
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_UNK_0EB
	setflag FLAG_UNK_22A
	clearflag FLAG_UNK_22B
	setflag FLAG_UNK_22C
	releaseall
	end

scr_seq_00000152_000002EE:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000152_000002F9:
	apply_movement 255, scr_seq_00000152_00000378
	wait_movement
	scrcmd_190 0
	msgbox 2
	closemsg
	apply_movement 0, scr_seq_00000152_000003F4
	wait_movement
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000152_00000320:
	apply_movement 0, scr_seq_00000152_000003B4
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000152_000003D4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_00000152_000003E0
	wait_movement
	releaseall
	end

scr_seq_00000152_00000356:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000152_00000361:
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000152_0000036C:
	.short 35, 1
	.short 1, 2
	.short 254, 0

scr_seq_00000152_00000378:
	.short 50, 1
	.short 51, 1
	.short 1, 2
	.short 75, 1
	.short 254, 0

scr_seq_00000152_0000038C:
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 2, 2
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000152_000003AC:
	.short 13, 2
	.short 254, 0

scr_seq_00000152_000003B4:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 2, 2
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000152_000003D4:
	.short 63, 1
	.short 12, 4
	.short 254, 0

scr_seq_00000152_000003E0:
	.short 14, 1
	.short 1, 2
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000152_000003F4:
	.short 32, 1
	.short 254, 0
scr_seq_00000152_000003FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000152_0000040F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
