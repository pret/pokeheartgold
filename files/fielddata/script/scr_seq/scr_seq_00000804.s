#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000804_00000A5E ; 000
	scrdef scr_seq_00000804_00000A71 ; 001
	scrdef scr_seq_00000804_00000016 ; 002
	scrdef scr_seq_00000804_00000120 ; 003
	scrdef scr_seq_00000804_000007FC ; 004
	scrdef_end

scr_seq_00000804_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_172
	gotoif TRUE, scr_seq_00000804_0000004D
	setflag FLAG_UNK_172
	msgbox 2
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_000000F2
	goto scr_seq_00000804_0000006D

scr_seq_00000804_0000004B:
	.byte 0x02, 0x00
scr_seq_00000804_0000004D:
	msgbox 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_000000F2
	goto scr_seq_00000804_0000006D

scr_seq_00000804_0000006B:
	.byte 0x02, 0x00
scr_seq_00000804_0000006D:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000804_000000F2
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_00000804_000000FD
	scrcmd_670 32768, 32772
	comparevartovalue VAR_SPECIAL_x8004, 65535
	gotoif eq, scr_seq_00000804_000000E7
	scrcmd_140 32780, 237, 32768
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000108
	scrcmd_668 0, 32772
	msgbox 5
	goto scr_seq_00000804_00000118

scr_seq_00000804_000000E5:
	.byte 0x02, 0x00
scr_seq_00000804_000000E7:
	msgbox 8
	goto scr_seq_00000804_00000118

scr_seq_00000804_000000F0:
	.byte 0x02, 0x00
scr_seq_00000804_000000F2:
	msgbox 6
	goto scr_seq_00000804_00000118

scr_seq_00000804_000000FB:
	.byte 0x02, 0x00
scr_seq_00000804_000000FD:
	msgbox 7
	goto scr_seq_00000804_00000118

scr_seq_00000804_00000106:
	.byte 0x02, 0x00
scr_seq_00000804_00000108:
	scrcmd_668 0, 32772
	msgbox 4
	goto scr_seq_00000804_00000118

scr_seq_00000804_00000116:
	.byte 0x02, 0x00
scr_seq_00000804_00000118:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000804_00000120:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	msgbox 9
	scrcmd_746
	scrcmd_116 0, 20, 2
scr_seq_00000804_00000138:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 21, 255, 0
	scrcmd_751 22, 255, 1
	scrcmd_751 20, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000804_00000180
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000804_0000021C
	goto scr_seq_00000804_00000A43

scr_seq_00000804_00000180:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 23, 255, 0
	scrcmd_751 24, 255, 1
	scrcmd_751 25, 255, 2
	scrcmd_751 26, 255, 3
	scrcmd_751 27, 255, 4
	scrcmd_751 28, 255, 5
	scrcmd_751 20, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000804_0000028E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000804_00000319
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000804_000003A4
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000804_0000042F
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000804_000004BA
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000804_00000545
	goto scr_seq_00000804_00000138

scr_seq_00000804_0000021C:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 29, 255, 0
	scrcmd_751 30, 255, 1
	scrcmd_751 31, 255, 2
	scrcmd_751 32, 255, 3
	scrcmd_751 20, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000804_000005D0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000804_0000065B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000804_000006E6
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000804_00000771
	goto scr_seq_00000804_00000138

scr_seq_00000804_0000028E:
	setvar VAR_SPECIAL_x8004, 385
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_000002D7
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_00000180
scr_seq_00000804_000002D7:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 2000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_00000180

scr_seq_00000804_00000317:
	.byte 0x02, 0x00
scr_seq_00000804_00000319:
	setvar VAR_SPECIAL_x8004, 359
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000362
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_00000180
scr_seq_00000804_00000362:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 4000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 4000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_00000180

scr_seq_00000804_000003A2:
	.byte 0x02, 0x00
scr_seq_00000804_000003A4:
	setvar VAR_SPECIAL_x8004, 337
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_000003ED
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_00000180
scr_seq_00000804_000003ED:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 6000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_00000180

scr_seq_00000804_0000042D:
	.byte 0x02, 0x00
scr_seq_00000804_0000042F:
	setvar VAR_SPECIAL_x8004, 356
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000478
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_00000180
scr_seq_00000804_00000478:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_00000180

scr_seq_00000804_000004B8:
	.byte 0x02, 0x00
scr_seq_00000804_000004BA:
	setvar VAR_SPECIAL_x8004, 401
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000503
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_00000180
scr_seq_00000804_00000503:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_00000180

scr_seq_00000804_00000543:
	.byte 0x02, 0x00
scr_seq_00000804_00000545:
	setvar VAR_SPECIAL_x8004, 395
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_0000058E
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_00000180
scr_seq_00000804_0000058E:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 15000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 15000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_00000180

scr_seq_00000804_000005CE:
	.byte 0x02, 0x00
scr_seq_00000804_000005D0:
	setvar VAR_SPECIAL_x8004, 251
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000619
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_0000021C
scr_seq_00000804_00000619:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_0000021C

scr_seq_00000804_00000659:
	.byte 0x02, 0x00
scr_seq_00000804_0000065B:
	setvar VAR_SPECIAL_x8004, 265
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_000006A4
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_0000021C
scr_seq_00000804_000006A4:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_0000021C

scr_seq_00000804_000006E4:
	.byte 0x02, 0x00
scr_seq_00000804_000006E6:
	setvar VAR_SPECIAL_x8004, 276
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_0000072F
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_0000021C
scr_seq_00000804_0000072F:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_0000021C

scr_seq_00000804_0000076F:
	.byte 0x02
	.byte 0x00
scr_seq_00000804_00000771:
	setvar VAR_SPECIAL_x8004, 277
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_00000990
	scrcmd_194 0, 32772
	msgbox 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_000007BA
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000804_0000021C
scr_seq_00000804_000007BA:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000804_00000A31
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000804_0000021C

scr_seq_00000804_000007FA:
	.byte 0x02, 0x00
scr_seq_00000804_000007FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	msgbox 18
	scrcmd_746
	scrcmd_116 0, 20, 2
scr_seq_00000804_00000814:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 33, 255, 0
	scrcmd_751 34, 255, 1
	scrcmd_751 35, 255, 2
	scrcmd_751 20, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000804_00000871
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000804_0000087D
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000804_00000889
	goto scr_seq_00000804_00000A43

scr_seq_00000804_00000871:
	setorcopyvar VAR_TEMP_x4002, 122
	goto scr_seq_00000804_00000895

scr_seq_00000804_0000087D:
	setorcopyvar VAR_TEMP_x4002, 133
	goto scr_seq_00000804_00000895

scr_seq_00000804_00000889:
	setorcopyvar VAR_TEMP_x4002, 137
	goto scr_seq_00000804_00000895

scr_seq_00000804_00000895:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_00000804_000008B3
	msgbox 15
	waitbutton
	closemsg
	goto scr_seq_00000804_00000A52

scr_seq_00000804_000008B3:
	scrcmd_202 1, 16386, 0, 0
	msgbox 16
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000804_000008D7
	closemsg
	goto scr_seq_00000804_00000814

scr_seq_00000804_000008D7:
	comparevartovalue VAR_TEMP_x4002, 122
	gotoif ne, scr_seq_00000804_000008FB
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 3333
	gotoif lt, scr_seq_00000804_00000A3A
	goto scr_seq_00000804_00000930

scr_seq_00000804_000008FB:
	comparevartovalue VAR_TEMP_x4002, 133
	gotoif ne, scr_seq_00000804_0000091F
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6666
	gotoif lt, scr_seq_00000804_00000A3A
	goto scr_seq_00000804_00000930

scr_seq_00000804_0000091F:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 9999
	gotoif lt, scr_seq_00000804_00000A3A
scr_seq_00000804_00000930:
	msgbox 13
	play_se SEQ_SE_DP_REGI
	scrcmd_137 16386, 15, 0, 0, 0, 32780
	buffer_players_name 0
	scrcmd_202 1, 16386, 0, 0
	msgbox 17
	comparevartovalue VAR_TEMP_x4002, 122
	gotoif ne, scr_seq_00000804_0000096A
	scrcmd_121 3333
	goto scr_seq_00000804_00000985

scr_seq_00000804_0000096A:
	comparevartovalue VAR_TEMP_x4002, 133
	gotoif ne, scr_seq_00000804_00000981
	scrcmd_121 6666
	goto scr_seq_00000804_00000985

scr_seq_00000804_00000981:
	scrcmd_121 9999
scr_seq_00000804_00000985:
	scrcmd_118 0
	goto scr_seq_00000804_00000814

scr_seq_00000804_0000098E:
	.byte 0x02, 0x00
scr_seq_00000804_00000990:
	msgbox 14
	closemsg
scr_seq_00000804_00000995:
	comparevartovalue VAR_SPECIAL_x8004, 385
	gotoif ne, scr_seq_00000804_000009AE
	goto scr_seq_00000804_00000180

scr_seq_00000804_000009A8:
	.byte 0x16, 0x00, 0x83, 0x00, 0x00, 0x00
scr_seq_00000804_000009AE:
	comparevartovalue VAR_SPECIAL_x8004, 359
	gotoif ne, scr_seq_00000804_000009C7
	goto scr_seq_00000804_00000180

scr_seq_00000804_000009C1:
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00, 0x00
scr_seq_00000804_000009C7:
	comparevartovalue VAR_SPECIAL_x8004, 337
	gotoif ne, scr_seq_00000804_000009E0
	goto scr_seq_00000804_00000180

scr_seq_00000804_000009DA:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_00000804_000009E0:
	comparevartovalue VAR_SPECIAL_x8004, 356
	gotoif ne, scr_seq_00000804_000009F9
	goto scr_seq_00000804_00000180

scr_seq_00000804_000009F3:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_00000804_000009F9:
	comparevartovalue VAR_SPECIAL_x8004, 401
	gotoif ne, scr_seq_00000804_00000A12
	goto scr_seq_00000804_00000180

scr_seq_00000804_00000A0C:
	.byte 0x16, 0x00, 0x1f, 0x00
	.byte 0x00, 0x00
scr_seq_00000804_00000A12:
	comparevartovalue VAR_SPECIAL_x8004, 395
	gotoif ne, scr_seq_00000804_00000A2B
	goto scr_seq_00000804_00000180

scr_seq_00000804_00000A25:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000804_00000A2B:
	goto scr_seq_00000804_0000021C

scr_seq_00000804_00000A31:
	msgbox 11
	goto scr_seq_00000804_00000995

scr_seq_00000804_00000A3A:
	msgbox 11
	goto scr_seq_00000804_00000814

scr_seq_00000804_00000A43:
	msgbox 10
	waitbutton
	closemsg
	goto scr_seq_00000804_00000A52

scr_seq_00000804_00000A50:
	.byte 0x02, 0x00
scr_seq_00000804_00000A52:
	scrcmd_117
	scrcmd_747
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_00000804_00000A5E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000804_00000A71:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
