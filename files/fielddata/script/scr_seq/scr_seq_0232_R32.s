#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0232_01FC ; 000
	scrdef scr_seq_0232_0250 ; 001
	scrdef scr_seq_0232_0330 ; 002
	scrdef scr_seq_0232_0504 ; 003
	scrdef scr_seq_0232_002A ; 004
	scrdef scr_seq_0232_00AE ; 005
	scrdef scr_seq_0232_06F0 ; 006
	scrdef scr_seq_0232_0707 ; 007
	scrdef scr_seq_0232_071E ; 008
	scrdef scr_seq_0232_0538 ; 009
	scrdef_end

scr_seq_0232_002A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0232_003B
	clearflag FLAG_UNK_189
	end

scr_seq_0232_003B:
	scrcmd_294 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0232_0079
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0232_0083
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0232_0083
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0232_0083
scr_seq_0232_0079:
	setflag FLAG_UNK_27E
	goto scr_seq_0232_008D

scr_seq_0232_0083:
	clearflag FLAG_UNK_27E
	goto scr_seq_0232_008D

scr_seq_0232_008D:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0232_00A8
	clearflag FLAG_UNK_208
	goto scr_seq_0232_00AC

scr_seq_0232_00A8:
	setflag FLAG_UNK_208
scr_seq_0232_00AC:
	end

scr_seq_0232_00AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	scrcmd_480 32780, 32770, 63
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0232_01D4
	checkflag FLAG_UNK_ABC
	gotoif TRUE, scr_seq_0232_01E8
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_0232_0182
	checkflag FLAG_UNK_0D9
	gotoif TRUE, scr_seq_0232_0164
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_0232_0115
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 19
	goto scr_seq_0232_015C

scr_seq_0232_0115:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 16
	setvar VAR_SPECIAL_x8004, 245
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0232_0178
	callstd 2033
	setflag FLAG_UNK_0D9
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 17
scr_seq_0232_015C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0232_0164:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0232_0178:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0232_0182:
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_0232_01A5
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 19
	goto scr_seq_0232_015C

scr_seq_0232_01A5:
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

scr_seq_0232_01D4:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 45
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0232_01E8:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 47
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0232_01FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_06E
	gotoif TRUE, scr_seq_0232_023B
	npc_msg 10
	setvar VAR_SPECIAL_x8004, 332
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0232_0246
	callstd 2033
	setflag FLAG_UNK_06E
scr_seq_0232_023B:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0232_0246:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0232_0250:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0232_028C
	checkflag FLAG_UNK_070
	gotoif FALSE, scr_seq_0232_0297
	checkflag FLAG_UNK_074
	gotoif FALSE, scr_seq_0232_02A5
	npc_msg 7
scr_seq_0232_0284:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0232_028C:
	npc_msg 3
	goto scr_seq_0232_0284

scr_seq_0232_0295:
	.byte 0x02, 0x00
scr_seq_0232_0297:
	buffer_players_name 0
	npc_msg 1
	goto scr_seq_0232_0284

scr_seq_0232_02A3:
	.byte 0x02, 0x00
scr_seq_0232_02A5:
	setvar VAR_TEMP_x4002, 0
	call scr_seq_0232_02B5
	releaseall
	end

scr_seq_0232_02B5:
	comparevartovalue VAR_UNK_408D, 0
	gotoif ne, scr_seq_0232_02C8
	setvar VAR_UNK_408D, 1
scr_seq_0232_02C8:
	npc_msg 5
	setvar VAR_SPECIAL_x8004, 239
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0232_030D
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0232_0304
	npc_msg 8
	waitbutton
	goto scr_seq_0232_0307

scr_seq_0232_0304:
	npc_msg 9
scr_seq_0232_0307:
	goto scr_seq_0232_032C

scr_seq_0232_030D:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0232_0324
	callstd 2008
	goto scr_seq_0232_0328

scr_seq_0232_0324:
	callstd 2033
scr_seq_0232_0328:
	setflag FLAG_UNK_074
scr_seq_0232_032C:
	closemsg
	return

scr_seq_0232_0330:
	scrcmd_609
	lockall
	apply_movement 1, scr_seq_0232_046C
	wait_movement
	npc_msg 0
	closemsg
	checkflag FLAG_UNK_070
	gotoif TRUE, scr_seq_0232_03F0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 475
	gotoif ne, scr_seq_0232_0381
	apply_movement 1, scr_seq_0232_0478
	apply_movement 255, scr_seq_0232_0494
	goto scr_seq_0232_0391

scr_seq_0232_0381:
	apply_movement 1, scr_seq_0232_0484
	apply_movement 255, scr_seq_0232_04A4
scr_seq_0232_0391:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0232_03B9
	npc_msg 4
	goto scr_seq_0232_03BF

scr_seq_0232_03B9:
	buffer_players_name 0
	npc_msg 2
scr_seq_0232_03BF:
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 475
	gotoif ne, scr_seq_0232_03E2
	apply_movement 1, scr_seq_0232_04B4
	goto scr_seq_0232_03EA

scr_seq_0232_03E2:
	apply_movement 1, scr_seq_0232_04C4
scr_seq_0232_03EA:
	wait_movement
	releaseall
	end

scr_seq_0232_03F0:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 475
	gotoif ne, scr_seq_0232_0429
	apply_movement 1, scr_seq_0232_04D4
	apply_movement 255, scr_seq_0232_04E4
	setvar VAR_TEMP_x4002, 1
	goto scr_seq_0232_043F

scr_seq_0232_0429:
	apply_movement 1, scr_seq_0232_04DC
	apply_movement 255, scr_seq_0232_04F0
	setvar VAR_TEMP_x4002, 0
scr_seq_0232_043F:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call scr_seq_0232_02B5
	comparevartovalue VAR_TEMP_x4000, 475
	gotoif ne, scr_seq_0232_0468
	apply_movement 1, scr_seq_0232_04F8
	wait_movement
scr_seq_0232_0468:
	releaseall
	end


scr_seq_0232_046C:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_0232_0478:
	.short 14, 2
	.short 12, 1
	.short 254, 0

scr_seq_0232_0484:
	.short 62, 1
	.short 14, 1
	.short 12, 1
	.short 254, 0

scr_seq_0232_0494:
	.short 63, 1
	.short 12, 2
	.short 1, 1
	.short 254, 0

scr_seq_0232_04A4:
	.short 62, 1
	.short 12, 2
	.short 1, 1
	.short 254, 0

scr_seq_0232_04B4:
	.short 13, 1
	.short 15, 2
	.short 2, 1
	.short 254, 0

scr_seq_0232_04C4:
	.short 13, 1
	.short 15, 1
	.short 2, 1
	.short 254, 0

scr_seq_0232_04D4:
	.short 14, 1
	.short 254, 0

scr_seq_0232_04DC:
	.short 62, 1
	.short 254, 0

scr_seq_0232_04E4:
	.short 63, 1
	.short 3, 1
	.short 254, 0

scr_seq_0232_04F0:
	.short 3, 1
	.short 254, 0

scr_seq_0232_04F8:
	.short 15, 1
	.short 2, 1
	.short 254, 0
scr_seq_0232_0504:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0232_052D
	npc_msg 15
	goto scr_seq_0232_0530

scr_seq_0232_052D:
	npc_msg 16
scr_seq_0232_0530:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0232_0538:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0232_0660
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0232_0674
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0232_05B1
	apply_movement 255, scr_seq_0232_0688
	apply_movement 18, scr_seq_0232_06D4
	goto scr_seq_0232_05FF

scr_seq_0232_05B1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0232_05CC
	apply_movement 255, scr_seq_0232_06A0
	goto scr_seq_0232_05FF

scr_seq_0232_05CC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0232_05EF
	apply_movement 255, scr_seq_0232_06C0
	apply_movement 18, scr_seq_0232_06D4
	goto scr_seq_0232_05FF

scr_seq_0232_05EF:
	apply_movement 255, scr_seq_0232_06AC
	apply_movement 18, scr_seq_0232_06D4
scr_seq_0232_05FF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0232_0626
	apply_movement 253, scr_seq_0232_06E0
	wait_movement
scr_seq_0232_0626:
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

scr_seq_0232_0660:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0232_0674:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0232_0688:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0232_06A0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0232_06AC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0232_06C0:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0232_06D4:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0232_06E0:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0232_06F0:
	scrcmd_055 18, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0232_0707:
	scrcmd_055 17, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0232_071E:
	scrcmd_055 19, 1, 13, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
