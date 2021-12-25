#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000760_00000286 ; 000
	scrdef scr_seq_00000760_000003FE ; 001
	scrdef scr_seq_00000760_00000370 ; 002
	scrdef scr_seq_00000760_000003B6 ; 003
	scrdef scr_seq_00000760_000000F3 ; 004
	scrdef scr_seq_00000760_00000231 ; 005
	scrdef scr_seq_00000760_00000218 ; 006
	scrdef scr_seq_00000760_00000022 ; 007
	scrdef_end

scr_seq_00000760_00000022:
	scrcmd_142 29, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000760_000000ED
	scrcmd_294 15, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000760_000000E5
	comparevartovalue VAR_UNK_4089, 1
	gotoif eq, scr_seq_00000760_000000E7
	comparevartovalue VAR_UNK_4089, 2
	gotoif eq, scr_seq_00000760_000000E7
	scrcmd_147 29, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000760_000000AD
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000760_00000090
	setflag FLAG_UNK_253
	goto scr_seq_00000760_000000AB

scr_seq_00000760_00000090:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_00000760_000000A7
	setflag FLAG_UNK_253
	goto scr_seq_00000760_000000AB

scr_seq_00000760_000000A7:
	clearflag FLAG_UNK_253
scr_seq_00000760_000000AB:
	end

scr_seq_00000760_000000AD:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000760_000000C8
	setflag FLAG_UNK_253
	goto scr_seq_00000760_000000E3

scr_seq_00000760_000000C8:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_00000760_000000DF
	setflag FLAG_UNK_253
	goto scr_seq_00000760_000000E3

scr_seq_00000760_000000DF:
	clearflag FLAG_UNK_253
scr_seq_00000760_000000E3:
	end

scr_seq_00000760_000000E5:
	end

scr_seq_00000760_000000E7:
	clearflag FLAG_UNK_253
	end

scr_seq_00000760_000000ED:
	setflag FLAG_UNK_253
	end

scr_seq_00000760_000000F3:
	scrcmd_609
	lockall
	scrcmd_081 1065
	play_bgm SEQ_GS_EYE_ROCKET
	apply_movement 7, scr_seq_00000760_000001C8
	wait_movement
	play_se SEQ_SE_DP_WALL_HIT2
	msgbox 0
	apply_movement 7, scr_seq_00000760_000001D0
	wait_movement
	msgbox 1
	apply_movement 7, scr_seq_00000760_000001E4
	wait_movement
	msgbox 2
	apply_movement 7, scr_seq_00000760_000001F4
	wait_movement
	msgbox 3
	closemsg
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000760_00000179
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000760_00000159
	end

scr_seq_00000760_00000159:
	apply_movement 7, scr_seq_00000760_000001FC
	apply_movement 255, scr_seq_00000760_00000204
	apply_movement 253, scr_seq_00000760_00000210
	wait_movement
	goto scr_seq_00000760_0000018B

scr_seq_00000760_00000179:
	apply_movement 7, scr_seq_00000760_000001FC
	apply_movement 255, scr_seq_00000760_00000204
	wait_movement
scr_seq_00000760_0000018B:
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 7
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_081 1112
	play_bgm SEQ_GS_GYM
	setflag FLAG_UNK_254
	clearflag FLAG_UNK_255
	clearflag FLAG_UNK_256
	clearflag FLAG_UNK_309
	setvar VAR_UNK_411C, 2
	setvar VAR_UNK_4087, 1
	setvar VAR_UNK_4088, 1
	releaseall
	end

scr_seq_00000760_000001C5:
	.byte 0x00, 0x00, 0x00

scr_seq_00000760_000001C8:
	.short 21, 5
	.short 254, 0

scr_seq_00000760_000001D0:
	.short 71, 1
	.short 56, 1
	.short 63, 2
	.short 17, 2
	.short 254, 0

scr_seq_00000760_000001E4:
	.short 75, 1
	.short 71, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000760_000001F4:
	.short 13, 2
	.short 254, 0

scr_seq_00000760_000001FC:
	.short 17, 1
	.short 254, 0

scr_seq_00000760_00000204:
	.short 18, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000760_00000210:
	.short 18, 1
	.short 254, 0
scr_seq_00000760_00000218:
	scrcmd_814
	checkflag FLAG_UNK_257
	gotoif eq, scr_seq_00000760_0000022F
	scrcmd_375 8
	scrcmd_375 9
	end

scr_seq_00000760_0000022F:
	end

scr_seq_00000760_00000231:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_190 0
	msgbox 16
	setvar VAR_SPECIAL_x8004, 481
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000760_0000027C
	callstd 2008
	hide_person 8
	hide_person 9
	setflag FLAG_UNK_257
	setvar VAR_UNK_4087, 4
	closemsg
	releaseall
	end

scr_seq_00000760_0000027C:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000760_00000286:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 9, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000760_00000348
	msgbox 8
	closemsg
	trainer_battle 254, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000760_0000035E
	scrcmd_295 9
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	settrainerflag 297
	settrainerflag 298
	settrainerflag 678
	settrainerflag 676
	settrainerflag 677
	msgbox 9
	scrcmd_190 0
	msgbox 10
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	checkflag FLAG_UNK_14D
	callif eq, scr_seq_00000760_00000364
	scrcmd_190 0
	msgbox 11
	goto scr_seq_00000760_00000307

scr_seq_00000760_00000307:
	setvar VAR_SPECIAL_x8004, 330
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000760_0000033E
	callstd 2033
	setflag FLAG_UNK_180
	scrcmd_190 0
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000760_0000033E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000760_00000348:
	checkflag FLAG_UNK_180
	gotoif lt, scr_seq_00000760_00000307
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000760_0000035E:
	scrcmd_219
	releaseall
	end

scr_seq_00000760_00000364:
	clearflag FLAG_UNK_2A1
	setvar VAR_UNK_4089, 1
	return

scr_seq_00000760_00000370:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4088, 2
	gotoif ne, scr_seq_00000760_000003AD
	scrcmd_294 9, VAR_SPECIAL_x800C
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000760_000003A4
	msgbox 6
	goto scr_seq_00000760_000003A7

scr_seq_00000760_000003A4:
	msgbox 7
scr_seq_00000760_000003A7:
	goto scr_seq_00000760_000003F6

scr_seq_00000760_000003AD:
	msgbox 4
	goto scr_seq_00000760_000003F6

scr_seq_00000760_000003B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4088, 2
	gotoif ne, scr_seq_00000760_000003F3
	scrcmd_294 9, VAR_SPECIAL_x800C
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000760_000003EA
	msgbox 6
	goto scr_seq_00000760_000003ED

scr_seq_00000760_000003EA:
	msgbox 7
scr_seq_00000760_000003ED:
	goto scr_seq_00000760_000003F6

scr_seq_00000760_000003F3:
	msgbox 5
scr_seq_00000760_000003F6:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000760_000003FE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 9, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000760_00000424
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000760_00000424:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
