#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000866_00000061 ; 000
	scrdef scr_seq_00000866_00000074 ; 001
	scrdef scr_seq_00000866_00000092 ; 002
	scrdef scr_seq_00000866_000002FC ; 003
	scrdef scr_seq_00000866_00000046 ; 004
	scrdef scr_seq_00000866_00000061 ; 005
	scrdef scr_seq_00000866_00000380 ; 006
	scrdef scr_seq_00000866_000003A7 ; 007
	scrdef scr_seq_00000866_000003CC ; 008
	scrdef scr_seq_00000866_000003E1 ; 009
	scrdef scr_seq_00000866_000003F6 ; 010
	scrdef scr_seq_00000866_0000040B ; 011
	scrdef scr_seq_00000866_00000422 ; 012
	scrdef scr_seq_00000866_00000437 ; 013
	scrdef scr_seq_00000866_0000044E ; 014
	scrdef scr_seq_00000866_00000461 ; 015
	scrdef scr_seq_00000866_00000474 ; 016
	scrdef_end

scr_seq_00000866_00000046:
	comparevartovalue VAR_UNK_4080, 0
	gotoif ne, scr_seq_00000866_0000005F
	setflag FLAG_UNK_19F
	clearflag FLAG_UNK_271
	clearflag FLAG_UNK_272
scr_seq_00000866_0000005F:
	end

scr_seq_00000866_00000061:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000866_00000074:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	scrcmd_076 79, 0
	msgbox 10
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000866_00000092:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement 255, scr_seq_00000866_000002A4
	wait_movement
	setvar VAR_UNK_4099, 1
	callstd 2031
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 462
	gotoif ne, scr_seq_00000866_000000E5
	show_person_at 9, 404, 0, 463, 2
	apply_movement 9, scr_seq_00000866_0000028C
	apply_movement 255, scr_seq_00000866_000002AC
	goto scr_seq_00000866_0000018E

scr_seq_00000866_000000E5:
	comparevartovalue VAR_SPECIAL_x8005, 463
	gotoif ne, scr_seq_00000866_00000114
	show_person_at 9, 404, 0, 464, 2
	apply_movement 9, scr_seq_00000866_0000028C
	apply_movement 255, scr_seq_00000866_000002AC
	goto scr_seq_00000866_0000018E

scr_seq_00000866_00000114:
	comparevartovalue VAR_SPECIAL_x8005, 464
	gotoif ne, scr_seq_00000866_00000143
	show_person_at 9, 404, 0, 463, 2
	apply_movement 9, scr_seq_00000866_00000298
	apply_movement 255, scr_seq_00000866_000002C0
	goto scr_seq_00000866_0000018E

scr_seq_00000866_00000143:
	comparevartovalue VAR_SPECIAL_x8005, 465
	gotoif ne, scr_seq_00000866_00000172
	show_person_at 9, 404, 0, 464, 2
	apply_movement 9, scr_seq_00000866_00000298
	apply_movement 255, scr_seq_00000866_000002C0
	goto scr_seq_00000866_0000018E

scr_seq_00000866_00000172:
	show_person_at 9, 404, 0, 465, 2
	apply_movement 9, scr_seq_00000866_00000298
	apply_movement 255, scr_seq_00000866_000002C0
scr_seq_00000866_0000018E:
	wait_movement
	scrcmd_191 0
	msgbox 1
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_00000866_000001B7
	trainer_battle 266, 0, 0, 0
	goto scr_seq_00000866_000001DA

scr_seq_00000866_000001B7:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_00000866_000001D2
	trainer_battle 269, 0, 0, 0
	goto scr_seq_00000866_000001DA

scr_seq_00000866_000001D2:
	trainer_battle 1, 0, 0, 0
scr_seq_00000866_000001DA:
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000866_00000285
	callstd 2070
	scrcmd_191 0
	msgbox 2
	closemsg
	setvar VAR_UNK_4075, 2
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 462
	gotoif ne, scr_seq_00000866_0000021E
	apply_movement 9, scr_seq_00000866_000002D4
	goto scr_seq_00000866_00000277

scr_seq_00000866_0000021E:
	comparevartovalue VAR_SPECIAL_x8005, 463
	gotoif ne, scr_seq_00000866_00000239
	apply_movement 9, scr_seq_00000866_000002DC
	goto scr_seq_00000866_00000277

scr_seq_00000866_00000239:
	comparevartovalue VAR_SPECIAL_x8005, 464
	gotoif ne, scr_seq_00000866_00000254
	apply_movement 9, scr_seq_00000866_000002D4
	goto scr_seq_00000866_00000277

scr_seq_00000866_00000254:
	comparevartovalue VAR_SPECIAL_x8005, 465
	gotoif ne, scr_seq_00000866_0000026F
	apply_movement 9, scr_seq_00000866_000002DC
	goto scr_seq_00000866_00000277

scr_seq_00000866_0000026F:
	apply_movement 9, scr_seq_00000866_000002EC
scr_seq_00000866_00000277:
	wait_movement
	hide_person 9
	callstd 2071
	releaseall
	end

scr_seq_00000866_00000285:
	scrcmd_219
	releaseall
	end

scr_seq_00000866_0000028B:
	.byte 0x00

scr_seq_00000866_0000028C:
	.short 14, 9
	.short 0, 1
	.short 254, 0

scr_seq_00000866_00000298:
	.short 14, 9
	.short 1, 1
	.short 254, 0

scr_seq_00000866_000002A4:
	.short 75, 1
	.short 254, 0

scr_seq_00000866_000002AC:
	.short 3, 1
	.short 62, 6
	.short 63, 7
	.short 1, 1
	.short 254, 0

scr_seq_00000866_000002C0:
	.short 3, 1
	.short 62, 6
	.short 63, 7
	.short 0, 1
	.short 254, 0

scr_seq_00000866_000002D4:
	.short 14, 3
	.short 254, 0

scr_seq_00000866_000002DC:
	.short 14, 1
	.short 12, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000866_000002EC:
	.short 14, 1
	.short 12, 2
	.short 14, 2
	.short 254, 0
scr_seq_00000866_000002FC:
	scrcmd_609
	lockall
	apply_movement 12, scr_seq_00000866_00000350
	wait_movement
	msgbox 16
	play_se SEQ_SE_DP_WALL_HIT
	msgbox 17
	closemsg
	apply_movement 13, scr_seq_00000866_00000358
	wait_movement
	show_person_at 13, 23, 0, 16, 3
	apply_movement 12, scr_seq_00000866_00000374
	wait_movement
	hide_person 13
	setflag FLAG_UNK_272
	setflag FLAG_UNK_271
	clearflag FLAG_UNK_19F
	setvar VAR_UNK_4080, 1
	releaseall
	end


scr_seq_00000866_00000350:
	.short 34, 2
	.short 254, 0

scr_seq_00000866_00000358:
	.short 71, 1
	.short 22, 1
	.short 63, 2
	.short 10, 2
	.short 72, 1
	.short 18, 9
	.short 254, 0

scr_seq_00000866_00000374:
	.short 12, 2
	.short 33, 1
	.short 254, 0
scr_seq_00000866_00000380:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07B
	gotoif eq, scr_seq_00000866_0000039C
	msgbox 18
	goto scr_seq_00000866_0000039F

scr_seq_00000866_0000039C:
	msgbox 19
scr_seq_00000866_0000039F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000866_000003A7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07B
	gotoif eq, scr_seq_00000866_000003C3
	msgbox 5
	goto scr_seq_00000866_0000039F

scr_seq_00000866_000003C3:
	msgbox 6
	goto scr_seq_00000866_0000039F

scr_seq_00000866_000003CC:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000866_000003E1:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000866_000003F6:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000866_0000040B:
	scrcmd_055 11, 0, 14, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000866_00000422:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000866_00000437:
	scrcmd_055 0, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000866_0000044E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000866_00000461:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000866_00000474:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
