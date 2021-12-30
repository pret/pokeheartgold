#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0019_D17R0101_000E ; 000
	scrdef scr_seq_0019_D17R0101_0074 ; 001
	scrdef scr_seq_0019_D17R0101_02A1 ; 002
	scrdef_end

scr_seq_0019_D17R0101_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_116
	gotoif TRUE, scr_seq_0019_D17R0101_0053
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, scr_seq_0019_D17R0101_0048
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_0019_D17R0101_005E
	checkflag FLAG_UNK_105
	gotoif TRUE, scr_seq_0019_D17R0101_0069
scr_seq_0019_D17R0101_0048:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0019_D17R0101_0053:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0019_D17R0101_005E:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0019_D17R0101_0069:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0019_D17R0101_0074:
	scrcmd_609
	lockall
	scrcmd_386 VAR_TEMP_x400A
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0019_D17R0101_0097
	apply_movement 0, scr_seq_0019_D17R0101_02D8
	goto scr_seq_0019_D17R0101_009F

scr_seq_0019_D17R0101_0097:
	apply_movement 0, scr_seq_0019_D17R0101_02E0
scr_seq_0019_D17R0101_009F:
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_TEMP_x400A, 0
	callif eq, scr_seq_0019_D17R0101_0150
	comparevartovalue VAR_TEMP_x400A, 2
	callif eq, scr_seq_0019_D17R0101_0192
	checkflag FLAG_UNK_093
	gotoif TRUE, scr_seq_0019_D17R0101_028E
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0019_D17R0101_00F1
	apply_movement 255, scr_seq_0019_D17R0101_0344
	goto scr_seq_0019_D17R0101_0101

scr_seq_0019_D17R0101_00F1:
	apply_movement 0, scr_seq_0019_D17R0101_0354
	apply_movement 255, scr_seq_0019_D17R0101_0354
scr_seq_0019_D17R0101_0101:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0019_D17R0101_0127
	npc_msg 0
	goto scr_seq_0019_D17R0101_012A

scr_seq_0019_D17R0101_0127:
	npc_msg 1
scr_seq_0019_D17R0101_012A:
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_TEMP_x400A, 0
	callif eq, scr_seq_0019_D17R0101_01EF
	comparevartovalue VAR_TEMP_x400A, 2
	callif eq, scr_seq_0019_D17R0101_0231
	releaseall
	end

scr_seq_0019_D17R0101_0150:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_0019_D17R0101_016B
	apply_movement 0, scr_seq_0019_D17R0101_02EC
	goto scr_seq_0019_D17R0101_018E

scr_seq_0019_D17R0101_016B:
	comparevartovalue VAR_SPECIAL_x8004, 8
	gotoif ne, scr_seq_0019_D17R0101_0186
	apply_movement 0, scr_seq_0019_D17R0101_02FC
	goto scr_seq_0019_D17R0101_018E

scr_seq_0019_D17R0101_0186:
	apply_movement 0, scr_seq_0019_D17R0101_0304
scr_seq_0019_D17R0101_018E:
	wait_movement
	return

scr_seq_0019_D17R0101_0192:
	comparevartovalue VAR_SPECIAL_x8005, 7
	gotoif ne, scr_seq_0019_D17R0101_01AD
	apply_movement 0, scr_seq_0019_D17R0101_0314
	goto scr_seq_0019_D17R0101_01EB

scr_seq_0019_D17R0101_01AD:
	comparevartovalue VAR_SPECIAL_x8005, 8
	gotoif ne, scr_seq_0019_D17R0101_01C8
	apply_movement 0, scr_seq_0019_D17R0101_0324
	goto scr_seq_0019_D17R0101_01EB

scr_seq_0019_D17R0101_01C8:
	comparevartovalue VAR_SPECIAL_x8005, 9
	gotoif ne, scr_seq_0019_D17R0101_01E3
	apply_movement 0, scr_seq_0019_D17R0101_032C
	goto scr_seq_0019_D17R0101_01EB

scr_seq_0019_D17R0101_01E3:
	apply_movement 0, scr_seq_0019_D17R0101_0338
scr_seq_0019_D17R0101_01EB:
	wait_movement
	return

scr_seq_0019_D17R0101_01EF:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_0019_D17R0101_020A
	apply_movement 0, scr_seq_0019_D17R0101_0364
	goto scr_seq_0019_D17R0101_022D

scr_seq_0019_D17R0101_020A:
	comparevartovalue VAR_SPECIAL_x8004, 8
	gotoif ne, scr_seq_0019_D17R0101_0225
	apply_movement 0, scr_seq_0019_D17R0101_0378
	goto scr_seq_0019_D17R0101_022D

scr_seq_0019_D17R0101_0225:
	apply_movement 0, scr_seq_0019_D17R0101_0384
scr_seq_0019_D17R0101_022D:
	wait_movement
	return

scr_seq_0019_D17R0101_0231:
	comparevartovalue VAR_SPECIAL_x8005, 7
	gotoif ne, scr_seq_0019_D17R0101_024C
	apply_movement 0, scr_seq_0019_D17R0101_0398
	goto scr_seq_0019_D17R0101_028A

scr_seq_0019_D17R0101_024C:
	comparevartovalue VAR_SPECIAL_x8005, 8
	gotoif ne, scr_seq_0019_D17R0101_0267
	apply_movement 0, scr_seq_0019_D17R0101_03A4
	goto scr_seq_0019_D17R0101_028A

scr_seq_0019_D17R0101_0267:
	comparevartovalue VAR_SPECIAL_x8005, 9
	gotoif ne, scr_seq_0019_D17R0101_0282
	apply_movement 0, scr_seq_0019_D17R0101_03B0
	goto scr_seq_0019_D17R0101_028A

scr_seq_0019_D17R0101_0282:
	apply_movement 0, scr_seq_0019_D17R0101_03C0
scr_seq_0019_D17R0101_028A:
	wait_movement
	return

scr_seq_0019_D17R0101_028E:
	npc_msg 2
	closemsg
	scrcmd_774 0
	releaseall
	setvar VAR_UNK_40F3, 1
	end

scr_seq_0019_D17R0101_02A1:
	wait 30, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0019_D17R0101_02C2
	apply_movement 0, scr_seq_0019_D17R0101_03D0
	goto scr_seq_0019_D17R0101_02CA

scr_seq_0019_D17R0101_02C2:
	apply_movement 0, scr_seq_0019_D17R0101_03E0
scr_seq_0019_D17R0101_02CA:
	wait_movement
	npc_msg 3
	waitbutton
	closemsg
	end

scr_seq_0019_D17R0101_02D5:
	.byte 0x00, 0x00, 0x00

scr_seq_0019_D17R0101_02D8:
	step 75, 1
	step_end

scr_seq_0019_D17R0101_02E0:
	step 3, 1
	step 75, 1
	step_end

scr_seq_0019_D17R0101_02EC:
	step 13, 2
	step 14, 1
	step 13, 1
	step_end

scr_seq_0019_D17R0101_02FC:
	step 13, 3
	step_end

scr_seq_0019_D17R0101_0304:
	step 13, 2
	step 15, 1
	step 13, 1
	step_end

scr_seq_0019_D17R0101_0314:
	step 12, 1
	step 15, 2
	step 15, 1
	step_end

scr_seq_0019_D17R0101_0324:
	step 15, 3
	step_end

scr_seq_0019_D17R0101_032C:
	step 13, 1
	step 15, 3
	step_end

scr_seq_0019_D17R0101_0338:
	step 13, 2
	step 15, 3
	step_end

scr_seq_0019_D17R0101_0344:
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

scr_seq_0019_D17R0101_0354:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

scr_seq_0019_D17R0101_0364:
	step 12, 1
	step 15, 1
	step 12, 2
	step 33, 1
	step_end

scr_seq_0019_D17R0101_0378:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0019_D17R0101_0384:
	step 12, 1
	step 14, 1
	step 12, 2
	step 33, 1
	step_end

scr_seq_0019_D17R0101_0398:
	step 14, 4
	step 13, 1
	step_end

scr_seq_0019_D17R0101_03A4:
	step 14, 4
	step 33, 1
	step_end

scr_seq_0019_D17R0101_03B0:
	step 14, 4
	step 12, 1
	step 33, 1
	step_end

scr_seq_0019_D17R0101_03C0:
	step 14, 4
	step 12, 2
	step 33, 1
	step_end

scr_seq_0019_D17R0101_03D0:
	step 71, 1
	step 4, 1
	step 72, 1
	step_end

scr_seq_0019_D17R0101_03E0:
	step 71, 1
	step 6, 1
	step 72, 1
	step_end
	.balign 4, 0
