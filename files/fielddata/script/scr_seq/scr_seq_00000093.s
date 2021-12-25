#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000093_00000407 ; 000
	scrdef scr_seq_00000093_0000045C ; 001
	scrdef scr_seq_00000093_00000018 ; 002
	scrdef scr_seq_00000093_00000012 ; 003
	scrdef_end

scr_seq_00000093_00000012:
	scrcmd_144 16416
	end

scr_seq_00000093_00000018:
	scrcmd_609
	lockall
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_00000093_00000228
	clearflag FLAG_UNK_2C8
	scrcmd_100 3
	comparevartovalue VAR_TEMP_x4001, 30
	gotoif ne, scr_seq_00000093_00000050
	scrcmd_339 3, 9, 0, 25, 2
scr_seq_00000093_00000050:
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement 3, scr_seq_00000093_00000174
	wait_movement
	wait 8, VAR_SPECIAL_x800C
	scrcmd_076 183, 0
	scrcmd_077
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000093_000001BC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	clearflag FLAG_UNK_2C8
	scrcmd_100 2
	comparevartovalue VAR_TEMP_x4001, 30
	gotoif ne, scr_seq_00000093_000000AB
	scrcmd_339 2, 9, 0, 25, 2
scr_seq_00000093_000000AB:
	play_se SEQ_SE_DP_KAIDAN2
	callstd 2029
	apply_movement 2, scr_seq_00000093_000001C4
	wait_movement
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000093_000000EE
	apply_movement 3, scr_seq_00000093_00000218
	apply_movement 255, scr_seq_00000093_00000218
	apply_movement 253, scr_seq_00000093_00000218
	wait_movement
	goto scr_seq_00000093_00000100

scr_seq_00000093_000000EE:
	apply_movement 3, scr_seq_00000093_00000218
	apply_movement 255, scr_seq_00000093_00000218
	wait_movement
scr_seq_00000093_00000100:
	scrcmd_190 0
	scrcmd_132 6, 9
	closemsg
	apply_movement 2, scr_seq_00000093_000001D0
	apply_movement 3, scr_seq_00000093_000001E0
	wait_movement
	scrcmd_132 7, 10
	setvar VAR_SPECIAL_x8004, 435
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	call scr_seq_00000093_00000354
	scrcmd_132 8, 11
	closemsg
	apply_movement 2, scr_seq_00000093_000001F0
	apply_movement 3, scr_seq_00000093_00000204
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2C8
	scrcmd_101 2
	scrcmd_101 3
	wait_se SEQ_SE_DP_KAIDAN2
	callstd 2030
	setvar VAR_UNK_40F8, 1
	setflag FLAG_UNK_14C
	releaseall
	end

scr_seq_00000093_00000173:
	.byte 0x00

scr_seq_00000093_00000174:
	.short 78, 1
	.short 39, 1
	.short 50, 2
	.short 18, 3
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000093_000001BC:
	.short 12, 3
	.short 254, 0

scr_seq_00000093_000001C4:
	.short 14, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000093_000001D0:
	.short 14, 1
	.short 13, 2
	.short 14, 1
	.short 254, 0

scr_seq_00000093_000001E0:
	.short 63, 3
	.short 15, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000093_000001F0:
	.short 13, 2
	.short 14, 1
	.short 13, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000093_00000204:
	.short 13, 3
	.short 14, 1
	.short 13, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000093_00000218:
	.short 35, 1
	.short 254, 0

scr_seq_00000093_00000220:
	.short 33, 1
	.short 254, 0
scr_seq_00000093_00000228:
	clearflag FLAG_UNK_2C8
	scrcmd_100 2
	clearflag FLAG_UNK_2C8
	scrcmd_100 3
	scrcmd_098 3
	callstd 2029
	scrcmd_339 2, 25, 0, 9, 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 255, scr_seq_00000093_00000220
	apply_movement 2, scr_seq_00000093_00000308
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000093_00000310
	apply_movement 2, scr_seq_00000093_00000318
	wait 8, VAR_SPECIAL_x800C
	scrcmd_339 3, 25, 0, 9, 0
	apply_movement 3, scr_seq_00000093_00000320
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_190 0
	scrcmd_132 6, 9
	scrcmd_132 7, 10
	setvar VAR_SPECIAL_x8004, 435
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	call scr_seq_00000093_00000354
	scrcmd_132 8, 11
	closemsg
	apply_movement 2, scr_seq_00000093_00000328
	apply_movement 3, scr_seq_00000093_0000033C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2C8
	scrcmd_101 2
	scrcmd_101 3
	wait_se SEQ_SE_DP_KAIDAN2
	callstd 2030
	setvar VAR_UNK_40F8, 1
	setflag FLAG_UNK_14C
	releaseall
	end

scr_seq_00000093_00000305:
	.byte 0x00, 0x00, 0x00

scr_seq_00000093_00000308:
	.short 75, 1
	.short 254, 0

scr_seq_00000093_00000310:
	.short 13, 2
	.short 254, 0

scr_seq_00000093_00000318:
	.short 12, 2
	.short 254, 0

scr_seq_00000093_00000320:
	.short 12, 1
	.short 254, 0

scr_seq_00000093_00000328:
	.short 15, 1
	.short 12, 4
	.short 14, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000093_0000033C:
	.short 12, 1
	.short 15, 1
	.short 12, 4
	.short 14, 2
	.short 69, 1
	.short 254, 0
scr_seq_00000093_00000354:
	call scr_seq_00000093_000003A8
	call scr_seq_00000093_000003A8
	call scr_seq_00000093_000003A8
	call scr_seq_00000093_000003A8
	call scr_seq_00000093_000003A8
	call scr_seq_00000093_000003C2
	call scr_seq_00000093_000003C2
	call scr_seq_00000093_000003C2
	call scr_seq_00000093_000003C2
	call scr_seq_00000093_000003C2
	scrcmd_406 0
	setvar VAR_TEMP_x4001, 9999
	call scr_seq_00000093_000003DC
	call scr_seq_00000093_000003DC
	return

scr_seq_00000093_000003A8:
	scrcmd_380 32780, 6
	setvar VAR_SPECIAL_x8004, 0
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_403 32772, 1
	return

scr_seq_00000093_000003C2:
	scrcmd_380 32780, 6
	setvar VAR_SPECIAL_x8004, 18
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_403 32772, 1
	return

scr_seq_00000093_000003DC:
	scrcmd_380 32780, 8
	comparevartovar VAR_TEMP_x4001, VAR_SPECIAL_x800C
	gotoif eq, scr_seq_00000093_000003DC
	copyvar VAR_TEMP_x4001, VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_406 32772
	return

scr_seq_00000093_00000407:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_00000093_00000425
	msgbox 2
	goto scr_seq_00000093_00000454

scr_seq_00000093_00000425:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000093_0000043B
	msgbox 2
	goto scr_seq_00000093_00000454

scr_seq_00000093_0000043B:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000093_00000451
	msgbox 1
	goto scr_seq_00000093_00000454

scr_seq_00000093_00000451:
	msgbox 0
scr_seq_00000093_00000454:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000093_0000045C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_00000093_0000047A
	msgbox 5
	goto scr_seq_00000093_000004A9

scr_seq_00000093_0000047A:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000093_00000490
	msgbox 5
	goto scr_seq_00000093_000004A9

scr_seq_00000093_00000490:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000093_000004A6
	msgbox 4
	goto scr_seq_00000093_000004A9

scr_seq_00000093_000004A6:
	msgbox 3
scr_seq_00000093_000004A9:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
