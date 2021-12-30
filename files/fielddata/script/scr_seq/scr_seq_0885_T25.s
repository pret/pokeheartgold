#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0885_T25_011C ; 000
	scrdef scr_seq_0885_T25_0154 ; 001
	scrdef scr_seq_0885_T25_017D ; 002
	scrdef scr_seq_0885_T25_01A6 ; 003
	scrdef scr_seq_0885_T25_01B9 ; 004
	scrdef scr_seq_0885_T25_01E8 ; 005
	scrdef scr_seq_0885_T25_0220 ; 006
	scrdef scr_seq_0885_T25_0258 ; 007
	scrdef scr_seq_0885_T25_0310 ; 008
	scrdef scr_seq_0885_T25_0339 ; 009
	scrdef scr_seq_0885_T25_0362 ; 010
	scrdef scr_seq_0885_T25_038B ; 011
	scrdef scr_seq_0885_T25_03B4 ; 012
	scrdef scr_seq_0885_T25_03DD ; 013
	scrdef scr_seq_0885_T25_043B ; 014
	scrdef scr_seq_0885_T25_044E ; 015
	scrdef scr_seq_0885_T25_0461 ; 016
	scrdef scr_seq_0885_T25_048A ; 017
	scrdef scr_seq_0885_T25_0086 ; 018
	scrdef scr_seq_0885_T25_07F0 ; 019
	scrdef scr_seq_0885_T25_0805 ; 020
	scrdef scr_seq_0885_T25_081A ; 021
	scrdef scr_seq_0885_T25_082F ; 022
	scrdef scr_seq_0885_T25_0846 ; 023
	scrdef scr_seq_0885_T25_085B ; 024
	scrdef scr_seq_0885_T25_0870 ; 025
	scrdef scr_seq_0885_T25_0885 ; 026
	scrdef scr_seq_0885_T25_089A ; 027
	scrdef scr_seq_0885_T25_08AF ; 028
	scrdef scr_seq_0885_T25_08C4 ; 029
	scrdef scr_seq_0885_T25_0406 ; 030
	scrdef scr_seq_0885_T25_042A ; 031
	scrdef scr_seq_0885_T25_0417 ; 032
	scrdef_end

scr_seq_0885_T25_0086:
	setflag FLAG_UNK_1B9
	setflag FLAG_UNK_1BA
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1BB
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 0
	gotoif ne, scr_seq_0885_T25_00B5
	clearflag FLAG_UNK_1B8
	clearflag FLAG_UNK_1B9
	goto scr_seq_0885_T25_011A

scr_seq_0885_T25_00B5:
	comparevartovalue VAR_UNK_4077, 1
	gotoif ne, scr_seq_0885_T25_00D4
	clearflag FLAG_UNK_1B8
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	goto scr_seq_0885_T25_011A

scr_seq_0885_T25_00D4:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_00F7
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	clearflag FLAG_UNK_1B7
	clearflag FLAG_UNK_1BB
	goto scr_seq_0885_T25_011A

scr_seq_0885_T25_00F7:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_0885_T25_010E
	clearflag FLAG_UNK_1B8
	goto scr_seq_0885_T25_011A

scr_seq_0885_T25_010E:
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	clearflag FLAG_UNK_1B7
scr_seq_0885_T25_011A:
	end

scr_seq_0885_T25_011C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_0885_T25_013E
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_0885_T25_0149
scr_seq_0885_T25_013E:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0149:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0154:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ge, scr_seq_0885_T25_0172
	npc_msg 4
	goto scr_seq_0885_T25_0175

scr_seq_0885_T25_0172:
	npc_msg 5
scr_seq_0885_T25_0175:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_017D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif TRUE, scr_seq_0885_T25_019B
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_019B:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_01A6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_01B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0885_T25_01DD
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_01DD:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_01E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_0885_T25_020A
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_0885_T25_0215
scr_seq_0885_T25_020A:
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0215:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0220:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_0885_T25_0242
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_0885_T25_024D
scr_seq_0885_T25_0242:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_024D:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0258:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 13
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0885_T25_0284
	apply_movement 4, scr_seq_0885_T25_02F8
	wait_movement
	goto scr_seq_0885_T25_02B8

scr_seq_0885_T25_0284:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0885_T25_02A1
	apply_movement 4, scr_seq_0885_T25_0308
	wait_movement
	goto scr_seq_0885_T25_02B8

scr_seq_0885_T25_02A1:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0885_T25_02B8
	apply_movement 4, scr_seq_0885_T25_0300
	wait_movement
scr_seq_0885_T25_02B8:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_02CE
	npc_msg 15
	goto scr_seq_0885_T25_02D1

scr_seq_0885_T25_02CE:
	npc_msg 14
scr_seq_0885_T25_02D1:
	closemsg
	comparevartovalue VAR_TEMP_x4001, 350
	gotoif eq, scr_seq_0885_T25_02EA
	apply_movement 4, scr_seq_0885_T25_02F0
	wait_movement
scr_seq_0885_T25_02EA:
	releaseall
	end

scr_seq_0885_T25_02EE:
	.byte 0x00, 0x00

scr_seq_0885_T25_02F0:
	step 32, 1
	step_end

scr_seq_0885_T25_02F8:
	step 33, 1
	step_end

scr_seq_0885_T25_0300:
	step 34, 1
	step_end

scr_seq_0885_T25_0308:
	step 35, 1
	step_end
scr_seq_0885_T25_0310:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_032E
	npc_msg 17
	goto scr_seq_0885_T25_0331

scr_seq_0885_T25_032E:
	npc_msg 16
scr_seq_0885_T25_0331:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0339:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_0357
	npc_msg 19
	goto scr_seq_0885_T25_035A

scr_seq_0885_T25_0357:
	npc_msg 18
scr_seq_0885_T25_035A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0362:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_0380
	npc_msg 21
	goto scr_seq_0885_T25_0383

scr_seq_0885_T25_0380:
	npc_msg 20
scr_seq_0885_T25_0383:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_038B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_03A9
	npc_msg 23
	goto scr_seq_0885_T25_03AC

scr_seq_0885_T25_03A9:
	npc_msg 22
scr_seq_0885_T25_03AC:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_03B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_03D2
	npc_msg 25
	goto scr_seq_0885_T25_03D5

scr_seq_0885_T25_03D2:
	npc_msg 24
scr_seq_0885_T25_03D5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_03DD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_03FB
	npc_msg 30
	goto scr_seq_0885_T25_03FE

scr_seq_0885_T25_03FB:
	npc_msg 29
scr_seq_0885_T25_03FE:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0406:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0417:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_042A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_043B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_044E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_0461:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_T25_047F
	npc_msg 34
	goto scr_seq_0885_T25_0482

scr_seq_0885_T25_047F:
	npc_msg 33
scr_seq_0885_T25_0482:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_T25_048A:
	scrcmd_609
	lockall
	apply_movement 15, scr_seq_0885_T25_06E4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 354
	gotoif ne, scr_seq_0885_T25_04B9
	apply_movement 15, scr_seq_0885_T25_06EC
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_04B9:
	comparevartovalue VAR_TEMP_x4000, 355
	gotoif ne, scr_seq_0885_T25_04D4
	apply_movement 15, scr_seq_0885_T25_06F4
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_04D4:
	comparevartovalue VAR_TEMP_x4000, 356
	gotoif ne, scr_seq_0885_T25_04EF
	apply_movement 15, scr_seq_0885_T25_06FC
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_04EF:
	comparevartovalue VAR_TEMP_x4000, 357
	gotoif ne, scr_seq_0885_T25_050A
	apply_movement 15, scr_seq_0885_T25_0704
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_050A:
	comparevartovalue VAR_TEMP_x4000, 358
	gotoif ne, scr_seq_0885_T25_0525
	apply_movement 15, scr_seq_0885_T25_070C
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_0525:
	comparevartovalue VAR_TEMP_x4000, 359
	gotoif ne, scr_seq_0885_T25_0540
	apply_movement 15, scr_seq_0885_T25_0714
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_0540:
	comparevartovalue VAR_TEMP_x4000, 360
	gotoif ne, scr_seq_0885_T25_055B
	apply_movement 15, scr_seq_0885_T25_071C
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_055B:
	comparevartovalue VAR_TEMP_x4000, 361
	gotoif ne, scr_seq_0885_T25_0576
	apply_movement 15, scr_seq_0885_T25_0724
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_0576:
	comparevartovalue VAR_TEMP_x4000, 362
	gotoif ne, scr_seq_0885_T25_0591
	apply_movement 15, scr_seq_0885_T25_072C
	goto scr_seq_0885_T25_05A6

scr_seq_0885_T25_0591:
	comparevartovalue VAR_TEMP_x4000, 363
	gotoif ne, scr_seq_0885_T25_05A6
	apply_movement 15, scr_seq_0885_T25_0734
scr_seq_0885_T25_05A6:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 15, scr_seq_0885_T25_073C
	apply_movement 255, scr_seq_0885_T25_0744
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 35
	closemsg
	comparevartovalue VAR_TEMP_x4000, 354
	gotoif ne, scr_seq_0885_T25_05EE
	apply_movement 15, scr_seq_0885_T25_0754
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_05EE:
	comparevartovalue VAR_TEMP_x4000, 355
	gotoif ne, scr_seq_0885_T25_0609
	apply_movement 15, scr_seq_0885_T25_0764
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_0609:
	comparevartovalue VAR_TEMP_x4000, 356
	gotoif ne, scr_seq_0885_T25_0624
	apply_movement 15, scr_seq_0885_T25_0774
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_0624:
	comparevartovalue VAR_TEMP_x4000, 357
	gotoif ne, scr_seq_0885_T25_063F
	apply_movement 15, scr_seq_0885_T25_0784
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_063F:
	comparevartovalue VAR_TEMP_x4000, 358
	gotoif ne, scr_seq_0885_T25_065A
	apply_movement 15, scr_seq_0885_T25_0794
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_065A:
	comparevartovalue VAR_TEMP_x4000, 359
	gotoif ne, scr_seq_0885_T25_0675
	apply_movement 15, scr_seq_0885_T25_07A4
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_0675:
	comparevartovalue VAR_TEMP_x4000, 360
	gotoif ne, scr_seq_0885_T25_0690
	apply_movement 15, scr_seq_0885_T25_07B0
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_0690:
	comparevartovalue VAR_TEMP_x4000, 361
	gotoif ne, scr_seq_0885_T25_06AB
	apply_movement 15, scr_seq_0885_T25_07C0
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_06AB:
	comparevartovalue VAR_TEMP_x4000, 362
	gotoif ne, scr_seq_0885_T25_06C6
	apply_movement 15, scr_seq_0885_T25_07D0
	goto scr_seq_0885_T25_06DB

scr_seq_0885_T25_06C6:
	comparevartovalue VAR_TEMP_x4000, 363
	gotoif ne, scr_seq_0885_T25_06DB
	apply_movement 15, scr_seq_0885_T25_07E0
scr_seq_0885_T25_06DB:
	wait_movement
	releaseall
	end

scr_seq_0885_T25_06E1:
	.byte 0x00, 0x00, 0x00

scr_seq_0885_T25_06E4:
	step 75, 1
	step_end

scr_seq_0885_T25_06EC:
	step 14, 5
	step_end

scr_seq_0885_T25_06F4:
	step 14, 4
	step_end

scr_seq_0885_T25_06FC:
	step 14, 3
	step_end

scr_seq_0885_T25_0704:
	step 14, 2
	step_end

scr_seq_0885_T25_070C:
	step 14, 1
	step_end

scr_seq_0885_T25_0714:
	step 60, 1
	step_end

scr_seq_0885_T25_071C:
	step 15, 1
	step_end

scr_seq_0885_T25_0724:
	step 15, 2
	step_end

scr_seq_0885_T25_072C:
	step 15, 3
	step_end

scr_seq_0885_T25_0734:
	step 15, 4
	step_end

scr_seq_0885_T25_073C:
	step 12, 1
	step_end

scr_seq_0885_T25_0744:
	step 71, 1
	step 12, 1
	step 72, 1
	step_end

scr_seq_0885_T25_0754:
	step 13, 1
	step 15, 5
	step 32, 1
	step_end

scr_seq_0885_T25_0764:
	step 13, 1
	step 15, 4
	step 32, 1
	step_end

scr_seq_0885_T25_0774:
	step 13, 1
	step 15, 3
	step 32, 1
	step_end

scr_seq_0885_T25_0784:
	step 13, 1
	step 15, 2
	step 32, 1
	step_end

scr_seq_0885_T25_0794:
	step 13, 1
	step 15, 1
	step 32, 1
	step_end

scr_seq_0885_T25_07A4:
	step 13, 1
	step 32, 1
	step_end

scr_seq_0885_T25_07B0:
	step 13, 1
	step 14, 1
	step 32, 1
	step_end

scr_seq_0885_T25_07C0:
	step 13, 1
	step 14, 2
	step 32, 1
	step_end

scr_seq_0885_T25_07D0:
	step 13, 1
	step 14, 3
	step 32, 1
	step_end

scr_seq_0885_T25_07E0:
	step 13, 1
	step 14, 4
	step 32, 1
	step_end
scr_seq_0885_T25_07F0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 36, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_0805:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 37, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_081A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 38, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_082F:
	scrcmd_055 39, 0, 16, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_0846:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 40, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_085B:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 41, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_0870:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 42, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_0885:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 43, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_089A:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 44, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_08AF:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 45, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_T25_08C4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 46, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
