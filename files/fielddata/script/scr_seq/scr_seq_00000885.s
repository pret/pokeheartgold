#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000885_0000011C ; 000
	scrdef scr_seq_00000885_00000154 ; 001
	scrdef scr_seq_00000885_0000017D ; 002
	scrdef scr_seq_00000885_000001A6 ; 003
	scrdef scr_seq_00000885_000001B9 ; 004
	scrdef scr_seq_00000885_000001E8 ; 005
	scrdef scr_seq_00000885_00000220 ; 006
	scrdef scr_seq_00000885_00000258 ; 007
	scrdef scr_seq_00000885_00000310 ; 008
	scrdef scr_seq_00000885_00000339 ; 009
	scrdef scr_seq_00000885_00000362 ; 010
	scrdef scr_seq_00000885_0000038B ; 011
	scrdef scr_seq_00000885_000003B4 ; 012
	scrdef scr_seq_00000885_000003DD ; 013
	scrdef scr_seq_00000885_0000043B ; 014
	scrdef scr_seq_00000885_0000044E ; 015
	scrdef scr_seq_00000885_00000461 ; 016
	scrdef scr_seq_00000885_0000048A ; 017
	scrdef scr_seq_00000885_00000086 ; 018
	scrdef scr_seq_00000885_000007F0 ; 019
	scrdef scr_seq_00000885_00000805 ; 020
	scrdef scr_seq_00000885_0000081A ; 021
	scrdef scr_seq_00000885_0000082F ; 022
	scrdef scr_seq_00000885_00000846 ; 023
	scrdef scr_seq_00000885_0000085B ; 024
	scrdef scr_seq_00000885_00000870 ; 025
	scrdef scr_seq_00000885_00000885 ; 026
	scrdef scr_seq_00000885_0000089A ; 027
	scrdef scr_seq_00000885_000008AF ; 028
	scrdef scr_seq_00000885_000008C4 ; 029
	scrdef scr_seq_00000885_00000406 ; 030
	scrdef scr_seq_00000885_0000042A ; 031
	scrdef scr_seq_00000885_00000417 ; 032
	scrdef_end

scr_seq_00000885_00000086:
	setflag FLAG_UNK_1B9
	setflag FLAG_UNK_1BA
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1BB
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 0
	gotoif ne, scr_seq_00000885_000000B5
	clearflag FLAG_UNK_1B8
	clearflag FLAG_UNK_1B9
	goto scr_seq_00000885_0000011A

scr_seq_00000885_000000B5:
	comparevartovalue VAR_UNK_4077, 1
	gotoif ne, scr_seq_00000885_000000D4
	clearflag FLAG_UNK_1B8
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	goto scr_seq_00000885_0000011A

scr_seq_00000885_000000D4:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_000000F7
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	clearflag FLAG_UNK_1B7
	clearflag FLAG_UNK_1BB
	goto scr_seq_00000885_0000011A

scr_seq_00000885_000000F7:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_00000885_0000010E
	clearflag FLAG_UNK_1B8
	goto scr_seq_00000885_0000011A

scr_seq_00000885_0000010E:
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	clearflag FLAG_UNK_1B7
scr_seq_00000885_0000011A:
	end

scr_seq_00000885_0000011C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_00000885_0000013E
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_00000885_00000149
scr_seq_00000885_0000013E:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000149:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000154:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ge, scr_seq_00000885_00000172
	msgbox 4
	goto scr_seq_00000885_00000175

scr_seq_00000885_00000172:
	msgbox 5
scr_seq_00000885_00000175:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_0000017D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif TRUE, scr_seq_00000885_0000019B
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_0000019B:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_000001A6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_000001B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000885_000001DD
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_000001DD:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_000001E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_00000885_0000020A
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_00000885_00000215
scr_seq_00000885_0000020A:
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000215:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000220:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, scr_seq_00000885_00000242
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, scr_seq_00000885_0000024D
scr_seq_00000885_00000242:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_0000024D:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000258:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 13
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000885_00000284
	apply_movement 4, scr_seq_00000885_000002F8
	wait_movement
	goto scr_seq_00000885_000002B8

scr_seq_00000885_00000284:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000885_000002A1
	apply_movement 4, scr_seq_00000885_00000308
	wait_movement
	goto scr_seq_00000885_000002B8

scr_seq_00000885_000002A1:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000885_000002B8
	apply_movement 4, scr_seq_00000885_00000300
	wait_movement
scr_seq_00000885_000002B8:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_000002CE
	msgbox 15
	goto scr_seq_00000885_000002D1

scr_seq_00000885_000002CE:
	msgbox 14
scr_seq_00000885_000002D1:
	closemsg
	comparevartovalue VAR_TEMP_x4001, 350
	gotoif eq, scr_seq_00000885_000002EA
	apply_movement 4, scr_seq_00000885_000002F0
	wait_movement
scr_seq_00000885_000002EA:
	releaseall
	end

scr_seq_00000885_000002EE:
	.byte 0x00, 0x00

scr_seq_00000885_000002F0:
	.short 32, 1
	.short 254, 0

scr_seq_00000885_000002F8:
	.short 33, 1
	.short 254, 0

scr_seq_00000885_00000300:
	.short 34, 1
	.short 254, 0

scr_seq_00000885_00000308:
	.short 35, 1
	.short 254, 0
scr_seq_00000885_00000310:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_0000032E
	msgbox 17
	goto scr_seq_00000885_00000331

scr_seq_00000885_0000032E:
	msgbox 16
scr_seq_00000885_00000331:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000339:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_00000357
	msgbox 19
	goto scr_seq_00000885_0000035A

scr_seq_00000885_00000357:
	msgbox 18
scr_seq_00000885_0000035A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000362:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_00000380
	msgbox 21
	goto scr_seq_00000885_00000383

scr_seq_00000885_00000380:
	msgbox 20
scr_seq_00000885_00000383:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_0000038B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_000003A9
	msgbox 23
	goto scr_seq_00000885_000003AC

scr_seq_00000885_000003A9:
	msgbox 22
scr_seq_00000885_000003AC:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_000003B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_000003D2
	msgbox 25
	goto scr_seq_00000885_000003D5

scr_seq_00000885_000003D2:
	msgbox 24
scr_seq_00000885_000003D5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_000003DD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_000003FB
	msgbox 30
	goto scr_seq_00000885_000003FE

scr_seq_00000885_000003FB:
	msgbox 29
scr_seq_00000885_000003FE:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000406:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000417:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_0000042A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_0000043B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_0000044E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_00000461:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000885_0000047F
	msgbox 34
	goto scr_seq_00000885_00000482

scr_seq_00000885_0000047F:
	msgbox 33
scr_seq_00000885_00000482:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000885_0000048A:
	scrcmd_609
	lockall
	apply_movement 15, scr_seq_00000885_000006E4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 354
	gotoif ne, scr_seq_00000885_000004B9
	apply_movement 15, scr_seq_00000885_000006EC
	goto scr_seq_00000885_000005A6

scr_seq_00000885_000004B9:
	comparevartovalue VAR_TEMP_x4000, 355
	gotoif ne, scr_seq_00000885_000004D4
	apply_movement 15, scr_seq_00000885_000006F4
	goto scr_seq_00000885_000005A6

scr_seq_00000885_000004D4:
	comparevartovalue VAR_TEMP_x4000, 356
	gotoif ne, scr_seq_00000885_000004EF
	apply_movement 15, scr_seq_00000885_000006FC
	goto scr_seq_00000885_000005A6

scr_seq_00000885_000004EF:
	comparevartovalue VAR_TEMP_x4000, 357
	gotoif ne, scr_seq_00000885_0000050A
	apply_movement 15, scr_seq_00000885_00000704
	goto scr_seq_00000885_000005A6

scr_seq_00000885_0000050A:
	comparevartovalue VAR_TEMP_x4000, 358
	gotoif ne, scr_seq_00000885_00000525
	apply_movement 15, scr_seq_00000885_0000070C
	goto scr_seq_00000885_000005A6

scr_seq_00000885_00000525:
	comparevartovalue VAR_TEMP_x4000, 359
	gotoif ne, scr_seq_00000885_00000540
	apply_movement 15, scr_seq_00000885_00000714
	goto scr_seq_00000885_000005A6

scr_seq_00000885_00000540:
	comparevartovalue VAR_TEMP_x4000, 360
	gotoif ne, scr_seq_00000885_0000055B
	apply_movement 15, scr_seq_00000885_0000071C
	goto scr_seq_00000885_000005A6

scr_seq_00000885_0000055B:
	comparevartovalue VAR_TEMP_x4000, 361
	gotoif ne, scr_seq_00000885_00000576
	apply_movement 15, scr_seq_00000885_00000724
	goto scr_seq_00000885_000005A6

scr_seq_00000885_00000576:
	comparevartovalue VAR_TEMP_x4000, 362
	gotoif ne, scr_seq_00000885_00000591
	apply_movement 15, scr_seq_00000885_0000072C
	goto scr_seq_00000885_000005A6

scr_seq_00000885_00000591:
	comparevartovalue VAR_TEMP_x4000, 363
	gotoif ne, scr_seq_00000885_000005A6
	apply_movement 15, scr_seq_00000885_00000734
scr_seq_00000885_000005A6:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 15, scr_seq_00000885_0000073C
	apply_movement 255, scr_seq_00000885_00000744
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 35
	closemsg
	comparevartovalue VAR_TEMP_x4000, 354
	gotoif ne, scr_seq_00000885_000005EE
	apply_movement 15, scr_seq_00000885_00000754
	goto scr_seq_00000885_000006DB

scr_seq_00000885_000005EE:
	comparevartovalue VAR_TEMP_x4000, 355
	gotoif ne, scr_seq_00000885_00000609
	apply_movement 15, scr_seq_00000885_00000764
	goto scr_seq_00000885_000006DB

scr_seq_00000885_00000609:
	comparevartovalue VAR_TEMP_x4000, 356
	gotoif ne, scr_seq_00000885_00000624
	apply_movement 15, scr_seq_00000885_00000774
	goto scr_seq_00000885_000006DB

scr_seq_00000885_00000624:
	comparevartovalue VAR_TEMP_x4000, 357
	gotoif ne, scr_seq_00000885_0000063F
	apply_movement 15, scr_seq_00000885_00000784
	goto scr_seq_00000885_000006DB

scr_seq_00000885_0000063F:
	comparevartovalue VAR_TEMP_x4000, 358
	gotoif ne, scr_seq_00000885_0000065A
	apply_movement 15, scr_seq_00000885_00000794
	goto scr_seq_00000885_000006DB

scr_seq_00000885_0000065A:
	comparevartovalue VAR_TEMP_x4000, 359
	gotoif ne, scr_seq_00000885_00000675
	apply_movement 15, scr_seq_00000885_000007A4
	goto scr_seq_00000885_000006DB

scr_seq_00000885_00000675:
	comparevartovalue VAR_TEMP_x4000, 360
	gotoif ne, scr_seq_00000885_00000690
	apply_movement 15, scr_seq_00000885_000007B0
	goto scr_seq_00000885_000006DB

scr_seq_00000885_00000690:
	comparevartovalue VAR_TEMP_x4000, 361
	gotoif ne, scr_seq_00000885_000006AB
	apply_movement 15, scr_seq_00000885_000007C0
	goto scr_seq_00000885_000006DB

scr_seq_00000885_000006AB:
	comparevartovalue VAR_TEMP_x4000, 362
	gotoif ne, scr_seq_00000885_000006C6
	apply_movement 15, scr_seq_00000885_000007D0
	goto scr_seq_00000885_000006DB

scr_seq_00000885_000006C6:
	comparevartovalue VAR_TEMP_x4000, 363
	gotoif ne, scr_seq_00000885_000006DB
	apply_movement 15, scr_seq_00000885_000007E0
scr_seq_00000885_000006DB:
	wait_movement
	releaseall
	end

scr_seq_00000885_000006E1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000885_000006E4:
	.short 75, 1
	.short 254, 0

scr_seq_00000885_000006EC:
	.short 14, 5
	.short 254, 0

scr_seq_00000885_000006F4:
	.short 14, 4
	.short 254, 0

scr_seq_00000885_000006FC:
	.short 14, 3
	.short 254, 0

scr_seq_00000885_00000704:
	.short 14, 2
	.short 254, 0

scr_seq_00000885_0000070C:
	.short 14, 1
	.short 254, 0

scr_seq_00000885_00000714:
	.short 60, 1
	.short 254, 0

scr_seq_00000885_0000071C:
	.short 15, 1
	.short 254, 0

scr_seq_00000885_00000724:
	.short 15, 2
	.short 254, 0

scr_seq_00000885_0000072C:
	.short 15, 3
	.short 254, 0

scr_seq_00000885_00000734:
	.short 15, 4
	.short 254, 0

scr_seq_00000885_0000073C:
	.short 12, 1
	.short 254, 0

scr_seq_00000885_00000744:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000885_00000754:
	.short 13, 1
	.short 15, 5
	.short 32, 1
	.short 254, 0

scr_seq_00000885_00000764:
	.short 13, 1
	.short 15, 4
	.short 32, 1
	.short 254, 0

scr_seq_00000885_00000774:
	.short 13, 1
	.short 15, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000885_00000784:
	.short 13, 1
	.short 15, 2
	.short 32, 1
	.short 254, 0

scr_seq_00000885_00000794:
	.short 13, 1
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000885_000007A4:
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000885_000007B0:
	.short 13, 1
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000885_000007C0:
	.short 13, 1
	.short 14, 2
	.short 32, 1
	.short 254, 0

scr_seq_00000885_000007D0:
	.short 13, 1
	.short 14, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000885_000007E0:
	.short 13, 1
	.short 14, 4
	.short 32, 1
	.short 254, 0
scr_seq_00000885_000007F0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 36, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_00000805:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 37, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_0000081A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 38, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_0000082F:
	scrcmd_055 39, 0, 16, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_00000846:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 40, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_0000085B:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 41, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_00000870:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 42, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_00000885:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 43, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_0000089A:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 44, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_000008AF:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 45, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000885_000008C4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 46, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
