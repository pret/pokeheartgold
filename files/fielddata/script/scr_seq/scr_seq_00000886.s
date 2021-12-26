#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000886_0000010C ; 000
	scrdef scr_seq_00000886_0000021E ; 001
	scrdef scr_seq_00000886_00000284 ; 002
	scrdef scr_seq_00000886_000002B5 ; 003
	scrdef scr_seq_00000886_00000016 ; 004
	scrdef_end

scr_seq_00000886_00000016:
	scrcmd_142 17, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000886_00000106
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_00000886_00000100
	scrcmd_147 17, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000886_000000AF
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000886_00000062
	setflag FLAG_UNK_2EC
	goto scr_seq_00000886_000000AD

scr_seq_00000886_00000062:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000886_00000079
	setflag FLAG_UNK_2EC
	goto scr_seq_00000886_000000AD

scr_seq_00000886_00000079:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000886_00000090
	setflag FLAG_UNK_2EC
	goto scr_seq_00000886_000000AD

scr_seq_00000886_00000090:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_00000886_000000A7
	setflag FLAG_UNK_2EC
	goto scr_seq_00000886_000000AD

scr_seq_00000886_000000A7:
	goto scr_seq_00000886_00000100

scr_seq_00000886_000000AD:
	end

scr_seq_00000886_000000AF:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000886_000000CA
	setflag FLAG_UNK_2EC
	goto scr_seq_00000886_000000FE

scr_seq_00000886_000000CA:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_00000886_000000E1
	setflag FLAG_UNK_2EC
	goto scr_seq_00000886_000000FE

scr_seq_00000886_000000E1:
	comparevartovalue VAR_TEMP_x4000, 20
	gotoif ne, scr_seq_00000886_000000F8
	setflag FLAG_UNK_2EC
	goto scr_seq_00000886_000000FE

scr_seq_00000886_000000F8:
	goto scr_seq_00000886_00000100

scr_seq_00000886_000000FE:
	end

scr_seq_00000886_00000100:
	clearflag FLAG_UNK_2EC
	end

scr_seq_00000886_00000106:
	setflag FLAG_UNK_2EC
	end

scr_seq_00000886_0000010C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000886_00000202
	checkflag FLAG_UNK_0B7
	gotoif TRUE, scr_seq_00000886_000001A0
	comparevartovalue VAR_UNK_410A, 1
	gotoif eq, scr_seq_00000886_0000017D
	msgbox 0
	closemsg
	trainer_battle 30, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000886_00000218
	settrainerflag 22
	settrainerflag 71
	settrainerflag 5
	settrainerflag 70
	scrcmd_515 22
	show_person_at 1, 13, 0, 15, 0
scr_seq_00000886_0000017D:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_410A, 1
	setflag FLAG_UNK_084
	setvar VAR_UNK_40DA, 1
	clearflag FLAG_UNK_223
	setflag FLAG_UNK_224
	end

scr_seq_00000886_000001A0:
	msgbox 3
	buffer_players_name 0
	msgbox 4
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	scrcmd_295 2
	setvar VAR_UNK_410A, 2
	clearflag FLAG_UNK_084
	setflag FLAG_UNK_998
	msgbox 5
scr_seq_00000886_000001C4:
	setvar VAR_SPECIAL_x8004, 372
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000886_000001F8
	callstd 2033
	msgbox 7
	waitbutton
	closemsg
	setflag FLAG_UNK_085
	releaseall
	end

scr_seq_00000886_000001F8:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000886_00000202:
	checkflag FLAG_UNK_085
	gotoif FALSE, scr_seq_00000886_000001C4
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000886_00000218:
	scrcmd_219
	releaseall
	end

scr_seq_00000886_0000021E:
	scrcmd_609
	lockall
	apply_movement 1, scr_seq_00000886_00000260
	wait_movement
	msgbox 9
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 1, scr_seq_00000886_0000026C
	apply_movement 255, scr_seq_00000886_00000278
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setflag FLAG_UNK_0B7
	releaseall
	end

scr_seq_00000886_0000025F:
	.byte 0x00

scr_seq_00000886_00000260:
	.short 75, 1
	.short 12, 3
	.short 254, 0

scr_seq_00000886_0000026C:
	.short 13, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000886_00000278:
	.short 63, 1
	.short 12, 1
	.short 254, 0
scr_seq_00000886_00000284:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000886_000002AA
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000886_000002AA:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000886_000002B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 2, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000886_000002DC
	msgbox 12
	goto scr_seq_00000886_000002DF

scr_seq_00000886_000002DC:
	msgbox 13
scr_seq_00000886_000002DF:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
