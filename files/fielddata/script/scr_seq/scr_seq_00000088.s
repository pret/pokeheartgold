#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000088_000002F0 ; 000
	scrdef scr_seq_00000088_0000002A ; 001
	scrdef scr_seq_00000088_000002F4 ; 002
	scrdef scr_seq_00000088_00000327 ; 003
	scrdef scr_seq_00000088_0000035C ; 004
	scrdef scr_seq_00000088_0000035A ; 005
	scrdef scr_seq_00000088_00000119 ; 006
	scrdef scr_seq_00000088_000002F2 ; 007
	scrdef scr_seq_00000088_000000E9 ; 008
	scrdef scr_seq_00000088_0000037F ; 009
	scrdef_end

scr_seq_00000088_0000002A:
	scrcmd_375 1
	scrcmd_375 2
	scrcmd_375 3
	comparevartovalue VAR_UNK_40AC, 9
	gotoif ge, scr_seq_00000088_000000B7
	comparevartovalue VAR_UNK_40A8, 2
	gotoif ge, scr_seq_00000088_0000006D
	comparevartovalue VAR_UNK_40A8, 1
	gotoif eq, scr_seq_00000088_0000005F
	end

scr_seq_00000088_0000005F:
	show_person_at 4, 8, 0, 7, 2
	end

scr_seq_00000088_0000006D:
	show_person_at 4, 10, 0, 7, 2
	show_person_at 5, 4, 0, 3, 1
	show_person_at 0, 9, 0, 3, 1
	show_person_at 1, 8, 0, 3, 1
	show_person_at 2, 9, 0, 4, 1
	show_person_at 3, 8, 0, 4, 1
	end

scr_seq_00000088_000000B7:
	show_person_at 0, 9, 0, 3, 1
	show_person_at 1, 8, 0, 3, 1
	show_person_at 2, 9, 0, 4, 1
	show_person_at 3, 8, 0, 4, 1
	end

scr_seq_00000088_000000E9:
	comparevartovalue VAR_UNK_40AC, 3
	gotoif eq, scr_seq_00000088_0000010F
	comparevartovalue VAR_UNK_40AC, 8
	gotoif eq, scr_seq_00000088_00000105
	end

scr_seq_00000088_00000105:
	setflag FLAG_UNK_1E5
	setflag FLAG_UNK_1F3
	end

scr_seq_00000088_0000010F:
	clearflag FLAG_UNK_280
	setflag FLAG_UNK_1F4
	end

scr_seq_00000088_00000119:
	scrcmd_081 0
	play_bgm SEQ_GS_D_AJITO
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000088_00000214
	wait_movement
	msgbox 4
	closemsg
	play_se SEQ_SE_GS_ZUTUKI
	apply_movement 8, scr_seq_00000088_000002AC
	wait_se SEQ_SE_GS_PRESSHIT
	apply_movement 4, scr_seq_00000088_0000021C
	wait_movement
	apply_movement 7, scr_seq_00000088_0000022C
	apply_movement 8, scr_seq_00000088_000002C0
	wait_movement
	buffer_players_name 0
	gender_msgbox 5, 6
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 7, scr_seq_00000088_00000240
	apply_movement 255, scr_seq_00000088_0000025C
	apply_movement 8, scr_seq_00000088_000002CC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 5, scr_seq_00000088_00000268
	wait_movement
	apply_movement 7, scr_seq_00000088_00000280
	wait_movement
	msgbox 7
	closemsg
	apply_movement 5, scr_seq_00000088_00000290
	wait_movement
	play_se SEQ_SE_DP_UG_023
	apply_movement 0, scr_seq_00000088_0000029C
	apply_movement 1, scr_seq_00000088_0000029C
	apply_movement 2, scr_seq_00000088_0000029C
	apply_movement 3, scr_seq_00000088_0000029C
	wait_movement
	buffer_players_name 0
	gender_msgbox 8, 9
	closemsg
	apply_movement 7, scr_seq_00000088_000002A4
	wait_movement
	hide_person 7
	apply_movement 8, scr_seq_00000088_000002DC
	wait_movement
	hide_person 8
	setflag FLAG_UNK_1F8
	setvar VAR_UNK_40A8, 2
	releaseall
	end

scr_seq_00000088_00000213:
	.byte 0x00

scr_seq_00000088_00000214:
	.short 75, 1
	.short 254, 0

scr_seq_00000088_0000021C:
	.short 71, 1
	.short 23, 2
	.short 72, 1
	.short 254, 0

scr_seq_00000088_0000022C:
	.short 63, 3
	.short 1, 2
	.short 13, 1
	.short 63, 5
	.short 254, 0

scr_seq_00000088_00000240:
	.short 0, 2
	.short 12, 4
	.short 3, 2
	.short 15, 1
	.short 0, 2
	.short 63, 5
	.short 254, 0

scr_seq_00000088_0000025C:
	.short 63, 1
	.short 12, 4
	.short 254, 0

scr_seq_00000088_00000268:
	.short 75, 1
	.short 63, 1
	.short 71, 1
	.short 22, 2
	.short 72, 1
	.short 254, 0

scr_seq_00000088_00000280:
	.short 12, 1
	.short 3, 2
	.short 63, 2
	.short 254, 0

scr_seq_00000088_00000290:
	.short 3, 2
	.short 75, 1
	.short 254, 0

scr_seq_00000088_0000029C:
	.short 15, 1
	.short 254, 0

scr_seq_00000088_000002A4:
	.short 15, 1
	.short 254, 0

scr_seq_00000088_000002AC:
	.short 23, 2
	.short 71, 1
	.short 22, 2
	.short 72, 1
	.short 254, 0

scr_seq_00000088_000002C0:
	.short 63, 3
	.short 1, 2
	.short 254, 0

scr_seq_00000088_000002CC:
	.short 63, 3
	.short 0, 2
	.short 12, 2
	.short 254, 0

scr_seq_00000088_000002DC:
	.short 63, 3
	.short 12, 2
	.short 3, 2
	.short 15, 1
	.short 254, 0
scr_seq_00000088_000002F0:
	end

scr_seq_00000088_000002F2:
	end

scr_seq_00000088_000002F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40A8, 2
	gotoif ge, scr_seq_00000088_0000031C
	msgbox 0
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 28
	callstd 2052
	releaseall
	end

scr_seq_00000088_0000031C:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000088_00000327:
	comparevartovalue VAR_UNK_40A8, 2
	gotoif ge, scr_seq_00000088_00000347
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000088_00000347:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000088_0000035A:
	end

scr_seq_00000088_0000035C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_171
	msgbox 10
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 29
	callstd 2052
	clearflag FLAG_UNK_171
	releaseall
	end

scr_seq_00000088_0000037F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40AC, 10
	gotoif ge, scr_seq_00000088_0000039D
	msgbox 15
	goto scr_seq_00000088_00000552

scr_seq_00000088_0000039D:
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_00000088_000003B3
	msgbox 14
	goto scr_seq_00000088_000003E5

scr_seq_00000088_000003B3:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000088_000003C9
	msgbox 14
	goto scr_seq_00000088_000003E5

scr_seq_00000088_000003C9:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000088_000003DF
	msgbox 14
	goto scr_seq_00000088_000003E5

scr_seq_00000088_000003DF:
	goto scr_seq_00000088_000003EB

scr_seq_00000088_000003E5:
	goto scr_seq_00000088_00000552

scr_seq_00000088_000003EB:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000088_00000405
	msgbox 11
	goto scr_seq_00000088_00000552

scr_seq_00000088_00000405:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000088_0000041B
	msgbox 12
	goto scr_seq_00000088_00000552

scr_seq_00000088_0000041B:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000088_00000431
	msgbox 11
	goto scr_seq_00000088_00000552

scr_seq_00000088_00000431:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000088_00000447
	msgbox 12
	goto scr_seq_00000088_00000552

scr_seq_00000088_00000447:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000088_0000045D
	msgbox 11
	goto scr_seq_00000088_00000552

scr_seq_00000088_0000045D:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000088_00000473
	msgbox 12
	goto scr_seq_00000088_00000552

scr_seq_00000088_00000473:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000088_00000489
	msgbox 11
	goto scr_seq_00000088_00000552

scr_seq_00000088_00000489:
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif ne, scr_seq_00000088_0000049F
	msgbox 12
	goto scr_seq_00000088_00000552

scr_seq_00000088_0000049F:
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000088_000004B5
	msgbox 11
	goto scr_seq_00000088_00000552

scr_seq_00000088_000004B5:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000088_000004CB
	msgbox 12
	goto scr_seq_00000088_00000552

scr_seq_00000088_000004CB:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_00000088_000004E1
	msgbox 11
	goto scr_seq_00000088_00000552

scr_seq_00000088_000004E1:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000088_000004F7
	msgbox 12
	goto scr_seq_00000088_00000552

scr_seq_00000088_000004F7:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000088_0000050D
	msgbox 11
	goto scr_seq_00000088_00000552

scr_seq_00000088_0000050D:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_00000088_00000523
	msgbox 12
	goto scr_seq_00000088_00000552

scr_seq_00000088_00000523:
	comparevartovalue VAR_TEMP_x4000, 21
	gotoif ne, scr_seq_00000088_00000539
	msgbox 11
	goto scr_seq_00000088_00000552

scr_seq_00000088_00000539:
	comparevartovalue VAR_TEMP_x4000, 22
	gotoif ne, scr_seq_00000088_0000054F
	msgbox 12
	goto scr_seq_00000088_00000552

scr_seq_00000088_0000054F:
	msgbox 13
scr_seq_00000088_00000552:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
