#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000837_00000108 ; 000
	scrdef scr_seq_00000837_0000011B ; 001
	scrdef scr_seq_00000837_0000001A ; 002
	scrdef scr_seq_00000837_00000530 ; 003
	scrdef scr_seq_00000837_0000016F ; 004
	scrdef scr_seq_00000837_000000CB ; 005
	scrdef_end

scr_seq_00000837_0000001A:
	setvar VAR_TEMP_x4008, 0
	setvar VAR_TEMP_x4009, 0
	comparevartovalue VAR_UNK_4130, 3
	gotoif eq, scr_seq_00000837_00000046
	scrcmd_389 16384, 479
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000837_000000AB
scr_seq_00000837_00000046:
	setvar VAR_TEMP_x4009, 1
	clearflag FLAG_UNK_281
	clearflag FLAG_UNK_282
	checkflag FLAG_UNK_167
	gotoif TRUE, scr_seq_00000837_00000099
	comparevartovalue VAR_UNK_4130, 4
	gotoif eq, scr_seq_00000837_00000099
	comparevartovalue VAR_UNK_4130, 1
	gotoif le, scr_seq_00000837_00000099
	comparevartovalue VAR_UNK_40FD, 0
	gotoif eq, scr_seq_00000837_00000099
	clearflag FLAG_UNK_2FA
	comparevartovalue VAR_UNK_4130, 5
	callif eq, scr_seq_00000837_000000A5
	end

scr_seq_00000837_00000099:
	setflag FLAG_UNK_2FA
	call scr_seq_00000837_000000C3
	end

scr_seq_00000837_000000A5:
	setflag FLAG_UNK_317
	return

scr_seq_00000837_000000AB:
	setflag FLAG_UNK_0A0
	setflag FLAG_UNK_281
	setflag FLAG_UNK_282
	setflag FLAG_UNK_2FA
	call scr_seq_00000837_000000C3
	end

scr_seq_00000837_000000C3:
	setvar VAR_TEMP_x4008, 1
	return

scr_seq_00000837_000000CB:
	comparevartovalue VAR_TEMP_x4009, 1
	gotoif ne, scr_seq_00000837_000000E0
	scrcmd_342 1, 23, 2
scr_seq_00000837_000000E0:
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_00000837_00000106
	comparevartovalue VAR_UNK_4130, 3
	gotoif gt, scr_seq_00000837_00000106
	show_person_at 2, 22, 0, 8, 0
scr_seq_00000837_00000106:
	end

scr_seq_00000837_00000108:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000837_0000011B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_130
	gotoif TRUE, scr_seq_00000837_0000015A
	msgbox 1
	setvar VAR_SPECIAL_x8004, 252
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000837_00000165
	callstd 2033
	setflag FLAG_UNK_130
scr_seq_00000837_0000015A:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000837_00000165:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000837_0000016F:
	checkflag FLAG_UNK_177
	gotoif TRUE, scr_seq_00000837_000003E8
	comparevartovalue VAR_UNK_4130, 3
	gotoif eq, scr_seq_00000837_0000039B
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_UNK_4130, 3
	msgbox 14
	closemsg
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000837_000001B7
	apply_movement 2, scr_seq_00000837_000003AC
	goto scr_seq_00000837_000001DA

scr_seq_00000837_000001B7:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_00000837_000001D2
	apply_movement 2, scr_seq_00000837_000003BC
	goto scr_seq_00000837_000001DA

scr_seq_00000837_000001D2:
	apply_movement 2, scr_seq_00000837_000003B4
scr_seq_00000837_000001DA:
	wait_movement
	apply_movement 2, scr_seq_00000837_000003C4
	wait_movement
	msgbox 15
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000837_00000204
	apply_movement 2, scr_seq_00000837_000003AC
	goto scr_seq_00000837_00000227

scr_seq_00000837_00000204:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_00000837_0000021F
	apply_movement 2, scr_seq_00000837_000003BC
	goto scr_seq_00000837_00000227

scr_seq_00000837_0000021F:
	apply_movement 2, scr_seq_00000837_000003B4
scr_seq_00000837_00000227:
	wait_movement
	msgbox 16
scr_seq_00000837_0000022C:
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x8004
	scrcmd_751 17, 255, 0
	scrcmd_751 18, 255, 1
	scrcmd_751 19, 255, 2
	scrcmd_751 27, 255, 3
	scrcmd_752
	scrcmd_747
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000837_00000346
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000837_0000033B
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_00000837_00000297
	setvar VAR_SPECIAL_x8004, 252
	goto scr_seq_00000837_000002B6

scr_seq_00000837_00000297:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000837_000002B0
	setvar VAR_SPECIAL_x8004, 255
	goto scr_seq_00000837_000002B6

scr_seq_00000837_000002B0:
	setvar VAR_SPECIAL_x8004, 258
scr_seq_00000837_000002B6:
	scrcmd_202 1, 32772, 0, 0
	buffer_players_name 0
	msgbox 20
	play_fanfare SEQ_ME_POKEGET
	msgbox 21
	wait_fanfare
	scrcmd_137 32772, 5, 0, 0, 0, 32780
	scrcmd_746
	msgbox 25
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000837_00000351
	scrcmd_747
scr_seq_00000837_000002F3:
	msgbox 22
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000837_00000317
	apply_movement 2, scr_seq_00000837_000003DC
	goto scr_seq_00000837_0000031F

scr_seq_00000837_00000317:
	apply_movement 2, scr_seq_00000837_000003CC
scr_seq_00000837_0000031F:
	wait_movement
	hide_person 2
	setflag FLAG_UNK_2FA
	setflag FLAG_UNK_177
	setvar VAR_UNK_4130, 4
	clearflag FLAG_UNK_317
	releaseall
	end

scr_seq_00000837_0000033B:
	msgbox 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000837_00000346:
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000837_00000351:
	closemsg
	get_party_count VAR_SPECIAL_x800C
	subvar VAR_SPECIAL_x800C, 1
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_815 0
	scrcmd_173 VAR_SPECIAL_x800C, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000837_000002F3
	msgbox 26
	goto scr_seq_00000837_000002F3

scr_seq_00000837_0000039B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	goto scr_seq_00000837_0000022C


scr_seq_00000837_000003AC:
	.short 33, 1
	.short 254, 0

scr_seq_00000837_000003B4:
	.short 34, 1
	.short 254, 0

scr_seq_00000837_000003BC:
	.short 35, 1
	.short 254, 0

scr_seq_00000837_000003C4:
	.short 75, 1
	.short 254, 0

scr_seq_00000837_000003CC:
	.short 14, 2
	.short 13, 3
	.short 14, 8
	.short 254, 0

scr_seq_00000837_000003DC:
	.short 13, 3
	.short 14, 10
	.short 254, 0
scr_seq_00000837_000003E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4130, 6
	comparevartovalue VAR_TEMP_x400A, 77
	gotoif ne, scr_seq_00000837_0000040C
	msgbox 8
	goto scr_seq_00000837_00000415

scr_seq_00000837_0000040C:
	msgbox 7
	setvar VAR_TEMP_x400A, 77
scr_seq_00000837_00000415:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000837_000004EA
	msgbox 9
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000837_000004EA
	scrcmd_470 12
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_382 VAR_TEMP_x4002, VAR_SPECIAL_x8004
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000837_000004F5
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_167
	comparevartovalue VAR_TEMP_x4002, 200
	gotoif lt, scr_seq_00000837_000004A2
	msgbox 13
	goto scr_seq_00000837_000004A5

scr_seq_00000837_000004A2:
	msgbox 12
scr_seq_00000837_000004A5:
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000837_000004C6
	apply_movement 2, scr_seq_00000837_00000504
	goto scr_seq_00000837_000004CE

scr_seq_00000837_000004C6:
	apply_movement 2, scr_seq_00000837_0000051C
scr_seq_00000837_000004CE:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	hide_person 2
	setflag FLAG_UNK_2FA
	setvar VAR_UNK_4130, 7
	releaseall
	end

scr_seq_00000837_000004EA:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000837_000004F5:
	scrcmd_474
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000837_00000502:
	.byte 0x00, 0x00

scr_seq_00000837_00000504:
	.short 14, 2
	.short 13, 5
	.short 14, 1
	.short 13, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000837_0000051C:
	.short 13, 5
	.short 14, 3
	.short 13, 1
	.short 69, 1
	.short 254, 0
scr_seq_00000837_00000530:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
