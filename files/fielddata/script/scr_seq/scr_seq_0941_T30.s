#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0941_0231 ; 000
	scrdef scr_seq_0941_0244 ; 001
	scrdef scr_seq_0941_026D ; 002
	scrdef scr_seq_0941_0280 ; 003
	scrdef scr_seq_0941_0293 ; 004
	scrdef scr_seq_0941_0046 ; 005
	scrdef scr_seq_0941_00E3 ; 006
	scrdef scr_seq_0941_00C5 ; 007
	scrdef scr_seq_0941_0440 ; 008
	scrdef scr_seq_0941_0457 ; 009
	scrdef scr_seq_0941_046C ; 010
	scrdef scr_seq_0941_0481 ; 011
	scrdef scr_seq_0941_0496 ; 012
	scrdef scr_seq_0941_04AB ; 013
	scrdef scr_seq_0941_04BE ; 014
	scrdef scr_seq_0941_04D1 ; 015
	scrdef scr_seq_0941_02BC ; 016
	scrdef_end

scr_seq_0941_0046:
	comparevartovalue VAR_UNK_40C4, 1
	gotoif ne, scr_seq_0941_005D
	setflag FLAG_UNK_209
	setvar VAR_UNK_40C4, 2
scr_seq_0941_005D:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0941_006E
	clearflag FLAG_UNK_189
	end

scr_seq_0941_006E:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0941_0089
	clearflag FLAG_UNK_27E
	goto scr_seq_0941_00A4

scr_seq_0941_0089:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0941_00A0
	clearflag FLAG_UNK_27E
	goto scr_seq_0941_00A4

scr_seq_0941_00A0:
	setflag FLAG_UNK_27E
scr_seq_0941_00A4:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0941_00BF
	clearflag FLAG_UNK_204
	goto scr_seq_0941_00C3

scr_seq_0941_00BF:
	setflag FLAG_UNK_204
scr_seq_0941_00C3:
	end

scr_seq_0941_00C5:
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 3
	callstd 2039
	setvar VAR_UNK_407B, 2
	end

scr_seq_0941_00E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	scrcmd_480 32780, 32770, 64
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0941_0209
	checkflag FLAG_UNK_ABC
	gotoif TRUE, scr_seq_0941_021D
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_0941_01B7
	checkflag FLAG_UNK_0D4
	gotoif TRUE, scr_seq_0941_0199
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0941_014A
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 23
	goto scr_seq_0941_0191

scr_seq_0941_014A:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 20
	setvar VAR_SPECIAL_x8004, 237
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0941_01AD
	callstd 2033
	setflag FLAG_UNK_0D4
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 21
scr_seq_0941_0191:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_0199:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_01AD:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0941_01B7:
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0941_01DA
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 23
	goto scr_seq_0941_0191

scr_seq_0941_01DA:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 48
	scrcmd_193 0, 32770
	scrcmd_440 VAR_SPECIAL_x800C, 50
	scrcmd_481 32770, 64
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_ABC
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_0209:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 49
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_021D:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_0231:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_0244:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0D1
	gotoif TRUE, scr_seq_0941_0262
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_0262:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_026D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_0280:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_0293:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_0941_02B1
	npc_msg 5
	goto scr_seq_0941_02B4

scr_seq_0941_02B1:
	npc_msg 6
scr_seq_0941_02B4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_02BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0941_03C1
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0941_03D5
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0941_0335
	apply_movement 255, scr_seq_0941_03EC
	apply_movement 9, scr_seq_0941_0424
	goto scr_seq_0941_0360

scr_seq_0941_0335:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0941_0350
	apply_movement 255, scr_seq_0941_0404
	goto scr_seq_0941_0360

scr_seq_0941_0350:
	apply_movement 255, scr_seq_0941_0410
	apply_movement 9, scr_seq_0941_0424
scr_seq_0941_0360:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0941_0387
	apply_movement 253, scr_seq_0941_0430
	wait_movement
scr_seq_0941_0387:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 44
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

scr_seq_0941_03C1:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_03D5:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_03E9:
	.byte 0x00, 0x00, 0x00

scr_seq_0941_03EC:
	.short 14, 1
	.short 12, 2
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0941_0404:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0941_0410:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0941_0424:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0941_0430:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0941_0440:
	scrcmd_055 10, 0, 20, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0941_0457:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0941_046C:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0941_0481:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0941_0496:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0941_04AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_04BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0941_04D1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
