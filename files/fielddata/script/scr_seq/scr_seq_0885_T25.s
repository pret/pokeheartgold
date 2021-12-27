#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0885_011C ; 000
	scrdef scr_seq_0885_0154 ; 001
	scrdef scr_seq_0885_017D ; 002
	scrdef scr_seq_0885_01A6 ; 003
	scrdef scr_seq_0885_01B9 ; 004
	scrdef scr_seq_0885_01E8 ; 005
	scrdef scr_seq_0885_0220 ; 006
	scrdef scr_seq_0885_0258 ; 007
	scrdef scr_seq_0885_0310 ; 008
	scrdef scr_seq_0885_0339 ; 009
	scrdef scr_seq_0885_0362 ; 010
	scrdef scr_seq_0885_038B ; 011
	scrdef scr_seq_0885_03B4 ; 012
	scrdef scr_seq_0885_03DD ; 013
	scrdef scr_seq_0885_043B ; 014
	scrdef scr_seq_0885_044E ; 015
	scrdef scr_seq_0885_0461 ; 016
	scrdef scr_seq_0885_048A ; 017
	scrdef scr_seq_0885_0086 ; 018
	scrdef scr_seq_0885_07F0 ; 019
	scrdef scr_seq_0885_0805 ; 020
	scrdef scr_seq_0885_081A ; 021
	scrdef scr_seq_0885_082F ; 022
	scrdef scr_seq_0885_0846 ; 023
	scrdef scr_seq_0885_085B ; 024
	scrdef scr_seq_0885_0870 ; 025
	scrdef scr_seq_0885_0885 ; 026
	scrdef scr_seq_0885_089A ; 027
	scrdef scr_seq_0885_08AF ; 028
	scrdef scr_seq_0885_08C4 ; 029
	scrdef scr_seq_0885_0406 ; 030
	scrdef scr_seq_0885_042A ; 031
	scrdef scr_seq_0885_0417 ; 032
	scrdef_end

scr_seq_0885_0086:
	setflag FLAG_UNK_1B9
	setflag FLAG_UNK_1BA
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1BB
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 0
	gotoif ne, scr_seq_0885_00B5
	clearflag FLAG_UNK_1B8
	clearflag FLAG_UNK_1B9
	goto scr_seq_0885_011A

scr_seq_0885_00B5:
	comparevartovalue VAR_UNK_4077, 1
	gotoif ne, scr_seq_0885_00D4
	clearflag FLAG_UNK_1B8
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	goto scr_seq_0885_011A

scr_seq_0885_00D4:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_00F7
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	clearflag FLAG_UNK_1B7
	clearflag FLAG_UNK_1BB
	goto scr_seq_0885_011A

scr_seq_0885_00F7:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_0885_010E
	clearflag FLAG_UNK_1B8
	goto scr_seq_0885_011A

scr_seq_0885_010E:
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	clearflag FLAG_UNK_1B7
scr_seq_0885_011A:
	end

scr_seq_0885_011C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_0885_013E
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_0885_0149
scr_seq_0885_013E:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0149:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0154:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ge, scr_seq_0885_0172
	npc_msg 4
	goto scr_seq_0885_0175

scr_seq_0885_0172:
	npc_msg 5
scr_seq_0885_0175:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_017D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif TRUE, scr_seq_0885_019B
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_019B:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_01A6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_01B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0885_01DD
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_01DD:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_01E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_0885_020A
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_0885_0215
scr_seq_0885_020A:
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0215:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0220:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_0885_0242
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_0885_024D
scr_seq_0885_0242:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_024D:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0258:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 13
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0885_0284
	apply_movement 4, scr_seq_0885_02F8
	wait_movement
	goto scr_seq_0885_02B8

scr_seq_0885_0284:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0885_02A1
	apply_movement 4, scr_seq_0885_0308
	wait_movement
	goto scr_seq_0885_02B8

scr_seq_0885_02A1:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0885_02B8
	apply_movement 4, scr_seq_0885_0300
	wait_movement
scr_seq_0885_02B8:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_02CE
	npc_msg 15
	goto scr_seq_0885_02D1

scr_seq_0885_02CE:
	npc_msg 14
scr_seq_0885_02D1:
	closemsg
	comparevartovalue VAR_TEMP_x4001, 350
	gotoif eq, scr_seq_0885_02EA
	apply_movement 4, scr_seq_0885_02F0
	wait_movement
scr_seq_0885_02EA:
	releaseall
	end

scr_seq_0885_02EE:
	.byte 0x00, 0x00

scr_seq_0885_02F0:
	.short 32, 1
	.short 254, 0

scr_seq_0885_02F8:
	.short 33, 1
	.short 254, 0

scr_seq_0885_0300:
	.short 34, 1
	.short 254, 0

scr_seq_0885_0308:
	.short 35, 1
	.short 254, 0
scr_seq_0885_0310:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_032E
	npc_msg 17
	goto scr_seq_0885_0331

scr_seq_0885_032E:
	npc_msg 16
scr_seq_0885_0331:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0339:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_0357
	npc_msg 19
	goto scr_seq_0885_035A

scr_seq_0885_0357:
	npc_msg 18
scr_seq_0885_035A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0362:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_0380
	npc_msg 21
	goto scr_seq_0885_0383

scr_seq_0885_0380:
	npc_msg 20
scr_seq_0885_0383:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_038B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_03A9
	npc_msg 23
	goto scr_seq_0885_03AC

scr_seq_0885_03A9:
	npc_msg 22
scr_seq_0885_03AC:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_03B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_03D2
	npc_msg 25
	goto scr_seq_0885_03D5

scr_seq_0885_03D2:
	npc_msg 24
scr_seq_0885_03D5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_03DD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_03FB
	npc_msg 30
	goto scr_seq_0885_03FE

scr_seq_0885_03FB:
	npc_msg 29
scr_seq_0885_03FE:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0406:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0417:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_042A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_043B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_044E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_0461:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0885_047F
	npc_msg 34
	goto scr_seq_0885_0482

scr_seq_0885_047F:
	npc_msg 33
scr_seq_0885_0482:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0885_048A:
	scrcmd_609
	lockall
	apply_movement 15, scr_seq_0885_06E4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 354
	gotoif ne, scr_seq_0885_04B9
	apply_movement 15, scr_seq_0885_06EC
	goto scr_seq_0885_05A6

scr_seq_0885_04B9:
	comparevartovalue VAR_TEMP_x4000, 355
	gotoif ne, scr_seq_0885_04D4
	apply_movement 15, scr_seq_0885_06F4
	goto scr_seq_0885_05A6

scr_seq_0885_04D4:
	comparevartovalue VAR_TEMP_x4000, 356
	gotoif ne, scr_seq_0885_04EF
	apply_movement 15, scr_seq_0885_06FC
	goto scr_seq_0885_05A6

scr_seq_0885_04EF:
	comparevartovalue VAR_TEMP_x4000, 357
	gotoif ne, scr_seq_0885_050A
	apply_movement 15, scr_seq_0885_0704
	goto scr_seq_0885_05A6

scr_seq_0885_050A:
	comparevartovalue VAR_TEMP_x4000, 358
	gotoif ne, scr_seq_0885_0525
	apply_movement 15, scr_seq_0885_070C
	goto scr_seq_0885_05A6

scr_seq_0885_0525:
	comparevartovalue VAR_TEMP_x4000, 359
	gotoif ne, scr_seq_0885_0540
	apply_movement 15, scr_seq_0885_0714
	goto scr_seq_0885_05A6

scr_seq_0885_0540:
	comparevartovalue VAR_TEMP_x4000, 360
	gotoif ne, scr_seq_0885_055B
	apply_movement 15, scr_seq_0885_071C
	goto scr_seq_0885_05A6

scr_seq_0885_055B:
	comparevartovalue VAR_TEMP_x4000, 361
	gotoif ne, scr_seq_0885_0576
	apply_movement 15, scr_seq_0885_0724
	goto scr_seq_0885_05A6

scr_seq_0885_0576:
	comparevartovalue VAR_TEMP_x4000, 362
	gotoif ne, scr_seq_0885_0591
	apply_movement 15, scr_seq_0885_072C
	goto scr_seq_0885_05A6

scr_seq_0885_0591:
	comparevartovalue VAR_TEMP_x4000, 363
	gotoif ne, scr_seq_0885_05A6
	apply_movement 15, scr_seq_0885_0734
scr_seq_0885_05A6:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 15, scr_seq_0885_073C
	apply_movement 255, scr_seq_0885_0744
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 35
	closemsg
	comparevartovalue VAR_TEMP_x4000, 354
	gotoif ne, scr_seq_0885_05EE
	apply_movement 15, scr_seq_0885_0754
	goto scr_seq_0885_06DB

scr_seq_0885_05EE:
	comparevartovalue VAR_TEMP_x4000, 355
	gotoif ne, scr_seq_0885_0609
	apply_movement 15, scr_seq_0885_0764
	goto scr_seq_0885_06DB

scr_seq_0885_0609:
	comparevartovalue VAR_TEMP_x4000, 356
	gotoif ne, scr_seq_0885_0624
	apply_movement 15, scr_seq_0885_0774
	goto scr_seq_0885_06DB

scr_seq_0885_0624:
	comparevartovalue VAR_TEMP_x4000, 357
	gotoif ne, scr_seq_0885_063F
	apply_movement 15, scr_seq_0885_0784
	goto scr_seq_0885_06DB

scr_seq_0885_063F:
	comparevartovalue VAR_TEMP_x4000, 358
	gotoif ne, scr_seq_0885_065A
	apply_movement 15, scr_seq_0885_0794
	goto scr_seq_0885_06DB

scr_seq_0885_065A:
	comparevartovalue VAR_TEMP_x4000, 359
	gotoif ne, scr_seq_0885_0675
	apply_movement 15, scr_seq_0885_07A4
	goto scr_seq_0885_06DB

scr_seq_0885_0675:
	comparevartovalue VAR_TEMP_x4000, 360
	gotoif ne, scr_seq_0885_0690
	apply_movement 15, scr_seq_0885_07B0
	goto scr_seq_0885_06DB

scr_seq_0885_0690:
	comparevartovalue VAR_TEMP_x4000, 361
	gotoif ne, scr_seq_0885_06AB
	apply_movement 15, scr_seq_0885_07C0
	goto scr_seq_0885_06DB

scr_seq_0885_06AB:
	comparevartovalue VAR_TEMP_x4000, 362
	gotoif ne, scr_seq_0885_06C6
	apply_movement 15, scr_seq_0885_07D0
	goto scr_seq_0885_06DB

scr_seq_0885_06C6:
	comparevartovalue VAR_TEMP_x4000, 363
	gotoif ne, scr_seq_0885_06DB
	apply_movement 15, scr_seq_0885_07E0
scr_seq_0885_06DB:
	wait_movement
	releaseall
	end

scr_seq_0885_06E1:
	.byte 0x00, 0x00, 0x00

scr_seq_0885_06E4:
	.short 75, 1
	.short 254, 0

scr_seq_0885_06EC:
	.short 14, 5
	.short 254, 0

scr_seq_0885_06F4:
	.short 14, 4
	.short 254, 0

scr_seq_0885_06FC:
	.short 14, 3
	.short 254, 0

scr_seq_0885_0704:
	.short 14, 2
	.short 254, 0

scr_seq_0885_070C:
	.short 14, 1
	.short 254, 0

scr_seq_0885_0714:
	.short 60, 1
	.short 254, 0

scr_seq_0885_071C:
	.short 15, 1
	.short 254, 0

scr_seq_0885_0724:
	.short 15, 2
	.short 254, 0

scr_seq_0885_072C:
	.short 15, 3
	.short 254, 0

scr_seq_0885_0734:
	.short 15, 4
	.short 254, 0

scr_seq_0885_073C:
	.short 12, 1
	.short 254, 0

scr_seq_0885_0744:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 254, 0

scr_seq_0885_0754:
	.short 13, 1
	.short 15, 5
	.short 32, 1
	.short 254, 0

scr_seq_0885_0764:
	.short 13, 1
	.short 15, 4
	.short 32, 1
	.short 254, 0

scr_seq_0885_0774:
	.short 13, 1
	.short 15, 3
	.short 32, 1
	.short 254, 0

scr_seq_0885_0784:
	.short 13, 1
	.short 15, 2
	.short 32, 1
	.short 254, 0

scr_seq_0885_0794:
	.short 13, 1
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0885_07A4:
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_0885_07B0:
	.short 13, 1
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0885_07C0:
	.short 13, 1
	.short 14, 2
	.short 32, 1
	.short 254, 0

scr_seq_0885_07D0:
	.short 13, 1
	.short 14, 3
	.short 32, 1
	.short 254, 0

scr_seq_0885_07E0:
	.short 13, 1
	.short 14, 4
	.short 32, 1
	.short 254, 0
scr_seq_0885_07F0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 36, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_0805:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 37, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_081A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 38, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_082F:
	scrcmd_055 39, 0, 16, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_0846:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 40, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_085B:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 41, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_0870:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 42, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_0885:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 43, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_089A:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 44, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_08AF:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 45, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0885_08C4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 46, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
