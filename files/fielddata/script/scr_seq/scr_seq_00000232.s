#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000232_000001FC ; 000
	scrdef scr_seq_00000232_00000250 ; 001
	scrdef scr_seq_00000232_00000330 ; 002
	scrdef scr_seq_00000232_00000504 ; 003
	scrdef scr_seq_00000232_0000002A ; 004
	scrdef scr_seq_00000232_000000AE ; 005
	scrdef scr_seq_00000232_000006F0 ; 006
	scrdef scr_seq_00000232_00000707 ; 007
	scrdef scr_seq_00000232_0000071E ; 008
	scrdef scr_seq_00000232_00000538 ; 009
	scrdef_end

scr_seq_00000232_0000002A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000232_0000003B
	clearflag FLAG_UNK_189
	end

scr_seq_00000232_0000003B:
	scrcmd_294 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000232_00000079
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000232_00000083
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000232_00000083
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000232_00000083
scr_seq_00000232_00000079:
	setflag FLAG_UNK_27E
	goto scr_seq_00000232_0000008D

scr_seq_00000232_00000083:
	clearflag FLAG_UNK_27E
	goto scr_seq_00000232_0000008D

scr_seq_00000232_0000008D:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000232_000000A8
	clearflag FLAG_UNK_208
	goto scr_seq_00000232_000000AC

scr_seq_00000232_000000A8:
	setflag FLAG_UNK_208
scr_seq_00000232_000000AC:
	end

scr_seq_00000232_000000AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	scrcmd_480 32780, 32770, 63
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000232_000001D4
	checkflag FLAG_UNK_ABC
	gotoif TRUE, scr_seq_00000232_000001E8
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_00000232_00000182
	checkflag FLAG_UNK_0D9
	gotoif TRUE, scr_seq_00000232_00000164
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000232_00000115
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 19
	goto scr_seq_00000232_0000015C

scr_seq_00000232_00000115:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 16
	setvar VAR_SPECIAL_x8004, 245
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000232_00000178
	callstd 2033
	setflag FLAG_UNK_0D9
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 17
scr_seq_00000232_0000015C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_00000164:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_00000178:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000232_00000182:
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000232_000001A5
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 19
	goto scr_seq_00000232_0000015C

scr_seq_00000232_000001A5:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 44
	scrcmd_193 0, 32770
	scrcmd_440 VAR_SPECIAL_x800C, 46
	scrcmd_481 32770, 63
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_ABC
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_000001D4:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 45
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_000001E8:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 47
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_000001FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_06E
	gotoif TRUE, scr_seq_00000232_0000023B
	msgbox 10
	setvar VAR_SPECIAL_x8004, 332
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000232_00000246
	callstd 2033
	setflag FLAG_UNK_06E
scr_seq_00000232_0000023B:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_00000246:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000232_00000250:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000232_0000028C
	checkflag FLAG_UNK_070
	gotoif FALSE, scr_seq_00000232_00000297
	checkflag FLAG_UNK_074
	gotoif FALSE, scr_seq_00000232_000002A5
	msgbox 7
scr_seq_00000232_00000284:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_0000028C:
	msgbox 3
	goto scr_seq_00000232_00000284

scr_seq_00000232_00000295:
	.byte 0x02, 0x00
scr_seq_00000232_00000297:
	buffer_players_name 0
	msgbox 1
	goto scr_seq_00000232_00000284

scr_seq_00000232_000002A3:
	.byte 0x02, 0x00
scr_seq_00000232_000002A5:
	setvar VAR_TEMP_x4002, 0
	call scr_seq_00000232_000002B5
	releaseall
	end

scr_seq_00000232_000002B5:
	comparevartovalue VAR_UNK_408D, 0
	gotoif ne, scr_seq_00000232_000002C8
	setvar VAR_UNK_408D, 1
scr_seq_00000232_000002C8:
	msgbox 5
	setvar VAR_SPECIAL_x8004, 239
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000232_0000030D
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000232_00000304
	msgbox 8
	waitbutton
	goto scr_seq_00000232_00000307

scr_seq_00000232_00000304:
	msgbox 9
scr_seq_00000232_00000307:
	goto scr_seq_00000232_0000032C

scr_seq_00000232_0000030D:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000232_00000324
	callstd 2008
	goto scr_seq_00000232_00000328

scr_seq_00000232_00000324:
	callstd 2033
scr_seq_00000232_00000328:
	setflag FLAG_UNK_074
scr_seq_00000232_0000032C:
	closemsg
	return

scr_seq_00000232_00000330:
	scrcmd_609
	lockall
	apply_movement 1, scr_seq_00000232_0000046C
	wait_movement
	msgbox 0
	closemsg
	checkflag FLAG_UNK_070
	gotoif TRUE, scr_seq_00000232_000003F0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 475
	gotoif ne, scr_seq_00000232_00000381
	apply_movement 1, scr_seq_00000232_00000478
	apply_movement 255, scr_seq_00000232_00000494
	goto scr_seq_00000232_00000391

scr_seq_00000232_00000381:
	apply_movement 1, scr_seq_00000232_00000484
	apply_movement 255, scr_seq_00000232_000004A4
scr_seq_00000232_00000391:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000232_000003B9
	msgbox 4
	goto scr_seq_00000232_000003BF

scr_seq_00000232_000003B9:
	buffer_players_name 0
	msgbox 2
scr_seq_00000232_000003BF:
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 475
	gotoif ne, scr_seq_00000232_000003E2
	apply_movement 1, scr_seq_00000232_000004B4
	goto scr_seq_00000232_000003EA

scr_seq_00000232_000003E2:
	apply_movement 1, scr_seq_00000232_000004C4
scr_seq_00000232_000003EA:
	wait_movement
	releaseall
	end

scr_seq_00000232_000003F0:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 475
	gotoif ne, scr_seq_00000232_00000429
	apply_movement 1, scr_seq_00000232_000004D4
	apply_movement 255, scr_seq_00000232_000004E4
	setvar VAR_TEMP_x4002, 1
	goto scr_seq_00000232_0000043F

scr_seq_00000232_00000429:
	apply_movement 1, scr_seq_00000232_000004DC
	apply_movement 255, scr_seq_00000232_000004F0
	setvar VAR_TEMP_x4002, 0
scr_seq_00000232_0000043F:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call scr_seq_00000232_000002B5
	comparevartovalue VAR_TEMP_x4000, 475
	gotoif ne, scr_seq_00000232_00000468
	apply_movement 1, scr_seq_00000232_000004F8
	wait_movement
scr_seq_00000232_00000468:
	releaseall
	end


scr_seq_00000232_0000046C:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000232_00000478:
	.short 14, 2
	.short 12, 1
	.short 254, 0

scr_seq_00000232_00000484:
	.short 62, 1
	.short 14, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000232_00000494:
	.short 63, 1
	.short 12, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000232_000004A4:
	.short 62, 1
	.short 12, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000232_000004B4:
	.short 13, 1
	.short 15, 2
	.short 2, 1
	.short 254, 0

scr_seq_00000232_000004C4:
	.short 13, 1
	.short 15, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000232_000004D4:
	.short 14, 1
	.short 254, 0

scr_seq_00000232_000004DC:
	.short 62, 1
	.short 254, 0

scr_seq_00000232_000004E4:
	.short 63, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000232_000004F0:
	.short 3, 1
	.short 254, 0

scr_seq_00000232_000004F8:
	.short 15, 1
	.short 2, 1
	.short 254, 0
scr_seq_00000232_00000504:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000232_0000052D
	msgbox 15
	goto scr_seq_00000232_00000530

scr_seq_00000232_0000052D:
	msgbox 16
scr_seq_00000232_00000530:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_00000538:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000232_00000660
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000232_00000674
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000232_000005B1
	apply_movement 255, scr_seq_00000232_00000688
	apply_movement 18, scr_seq_00000232_000006D4
	goto scr_seq_00000232_000005FF

scr_seq_00000232_000005B1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000232_000005CC
	apply_movement 255, scr_seq_00000232_000006A0
	goto scr_seq_00000232_000005FF

scr_seq_00000232_000005CC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000232_000005EF
	apply_movement 255, scr_seq_00000232_000006C0
	apply_movement 18, scr_seq_00000232_000006D4
	goto scr_seq_00000232_000005FF

scr_seq_00000232_000005EF:
	apply_movement 255, scr_seq_00000232_000006AC
	apply_movement 18, scr_seq_00000232_000006D4
scr_seq_00000232_000005FF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000232_00000626
	apply_movement 253, scr_seq_00000232_000006E0
	wait_movement
scr_seq_00000232_00000626:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 5
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_00000660:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000232_00000674:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000232_00000688:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000232_000006A0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000232_000006AC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000232_000006C0:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000232_000006D4:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000232_000006E0:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000232_000006F0:
	scrcmd_055 18, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000232_00000707:
	scrcmd_055 17, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000232_0000071E:
	scrcmd_055 19, 1, 13, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
