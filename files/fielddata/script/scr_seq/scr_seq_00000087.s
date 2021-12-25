#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000087_00000048 ; 000
	scrdef scr_seq_00000087_000006EA ; 001
	scrdef scr_seq_00000087_00000723 ; 002
	scrdef scr_seq_00000087_0000075C ; 003
	scrdef scr_seq_00000087_000007D0 ; 004
	scrdef scr_seq_00000087_00000064 ; 005
	scrdef scr_seq_00000087_000007F8 ; 006
	scrdef scr_seq_00000087_0000080B ; 007
	scrdef scr_seq_00000087_0000081E ; 008
	scrdef scr_seq_00000087_00000831 ; 009
	scrdef scr_seq_00000087_00000844 ; 010
	scrdef scr_seq_00000087_00000857 ; 011
	scrdef scr_seq_00000087_0000086A ; 012
	scrdef scr_seq_00000087_0000087D ; 013
	scrdef scr_seq_00000087_00000046 ; 014
	scrdef scr_seq_00000087_00000890 ; 015
	scrdef scr_seq_00000087_000008A1 ; 016
	scrdef_end

scr_seq_00000087_00000046:
	end

scr_seq_00000087_00000048:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto scr_seq_00000087_00000080

scr_seq_00000087_00000062:
	.byte 0x02, 0x00
scr_seq_00000087_00000064:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_00000087_00000080

scr_seq_00000087_0000007E:
	.byte 0x02, 0x00
scr_seq_00000087_00000080:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000087_000006A0
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000087_000006A5
	goto scr_seq_00000087_000000A6

scr_seq_00000087_000000A4:
	.byte 0x02, 0x00
scr_seq_00000087_000000A6:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000087_000006AA
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000087_000006C9
	scrcmd_751 41, 255, 2
	scrcmd_751 42, 255, 3
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000087_0000014B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000087_00000178
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000087_00000110
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000087_000001A5
	scrcmd_747
	goto scr_seq_00000087_00000132

scr_seq_00000087_0000010E:
	.byte 0x02, 0x00
scr_seq_00000087_00000110:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000087_000006E0
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000087_000006E5
	goto scr_seq_00000087_000000A6

scr_seq_00000087_00000130:
	.byte 0x02, 0x00
scr_seq_00000087_00000132:
	goto scr_seq_00000087_0000013A

scr_seq_00000087_00000138:
	.byte 0x02, 0x00
scr_seq_00000087_0000013A:
	setvar VAR_UNK_414A, 0
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_0000014B:
	setvar VAR_UNK_4149, 0
	scrcmd_643 0, 3, 32780
	scrcmd_198 0, 3
	scrcmd_198 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000087_000001D2
	goto scr_seq_00000087_000001FC

scr_seq_00000087_00000176:
	.byte 0x02, 0x00
scr_seq_00000087_00000178:
	setvar VAR_UNK_4149, 1
	scrcmd_643 0, 3, 32780
	scrcmd_198 0, 3
	scrcmd_198 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000087_000001D2
	goto scr_seq_00000087_000001FC

scr_seq_00000087_000001A3:
	.byte 0x02, 0x00
scr_seq_00000087_000001A5:
	setvar VAR_UNK_4149, 2
	scrcmd_643 0, 2, 32780
	scrcmd_198 0, 2
	scrcmd_198 1, 2
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000087_000001E7
	goto scr_seq_00000087_000001FC

scr_seq_00000087_000001D0:
	.byte 0x02, 0x00
scr_seq_00000087_000001D2:
	msgbox 8
	scrcmd_444 9, 3, 0, 0
	scrcmd_747
	goto scr_seq_00000087_00000132

scr_seq_00000087_000001E5:
	.byte 0x02, 0x00
scr_seq_00000087_000001E7:
	msgbox 8
	scrcmd_444 9, 2, 0, 0
	scrcmd_747
	goto scr_seq_00000087_00000132

scr_seq_00000087_000001FA:
	.byte 0x02, 0x00
scr_seq_00000087_000001FC:
	msgbox 7
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_643 4, 16713, 32780
	scrcmd_645 16386, 16389, 16390
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, scr_seq_00000087_0000022E
	scrcmd_815 0
scr_seq_00000087_0000022E:
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_00000087_00000132
	scrcmd_690 16386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000087_00000607
	scrcmd_690 16389, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000087_00000607
	comparevartovalue VAR_UNK_4149, 2
	gotoif eq, scr_seq_00000087_0000028F
	scrcmd_690 16390, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000087_00000607
scr_seq_00000087_0000028F:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000087_000002AA
	scrcmd_747
	goto scr_seq_00000087_00000132

scr_seq_00000087_000002AA:
	goto scr_seq_00000087_000002B2

scr_seq_00000087_000002B0:
	.byte 0x02, 0x00
scr_seq_00000087_000002B2:
	goto scr_seq_00000087_000002BA

scr_seq_00000087_000002B8:
	.byte 0x02, 0x00
scr_seq_00000087_000002BA:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, scr_seq_00000087_00000476
	comparevartovalue VAR_UNK_4149, 1
	callif eq, scr_seq_00000087_00000476
	setvar VAR_TEMP_x4000, 0
	scrcmd_282
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000087_00000132
	scrcmd_747
	comparevartovalue VAR_UNK_4149, 2
	gotoif eq, scr_seq_00000087_0000030A
	goto scr_seq_00000087_000004D7

scr_seq_00000087_00000308:
	.byte 0x02, 0x00
scr_seq_00000087_0000030A:
	msgbox 43
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000087_0000035B
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000087_000003B3
	scrcmd_747
	goto scr_seq_00000087_00000132

scr_seq_00000087_00000359:
	.byte 0x02, 0x00
scr_seq_00000087_0000035B:
	msgbox 44
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000087_0000030A
	scrcmd_747
	closemsg
	scrcmd_226 32, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000087_000003A1
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000087_000003A9
	goto scr_seq_00000087_0000040B

scr_seq_00000087_0000039F:
	.byte 0x02
	.byte 0x00
scr_seq_00000087_000003A1:
	goto scr_seq_00000087_0000030A

scr_seq_00000087_000003A7:
	.byte 0x02, 0x00
scr_seq_00000087_000003A9:
	scrcmd_283
	goto scr_seq_00000087_0000030A

scr_seq_00000087_000003B1:
	.byte 0x02, 0x00
scr_seq_00000087_000003B3:
	msgbox 44
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000087_0000030A
	scrcmd_747
	closemsg
	scrcmd_227 32, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000087_000003F9
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000087_00000401
	goto scr_seq_00000087_0000040B

scr_seq_00000087_000003F7:
	.byte 0x02, 0x00
scr_seq_00000087_000003F9:
	goto scr_seq_00000087_0000030A

scr_seq_00000087_000003FF:
	.byte 0x02
	.byte 0x00
scr_seq_00000087_00000401:
	scrcmd_283
	goto scr_seq_00000087_0000030A

scr_seq_00000087_00000409:
	.byte 0x02, 0x00
scr_seq_00000087_0000040B:
	scrcmd_258
	scrcmd_257 154
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x8000
	get_partymon_species VAR_TEMP_x4005, VAR_SPECIAL_x8001
	scrcmd_644 32768, 32769, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000087_0000047E
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000087_00000494
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000087_000004AA
	scrcmd_258
	scrcmd_257 156
	msgbox 45
	comparevartovalue VAR_UNK_4149, 2
	callif eq, scr_seq_00000087_00000476
	call scr_seq_00000087_00000711
	goto scr_seq_00000087_000004D7

scr_seq_00000087_00000474:
	.byte 0x02, 0x00
scr_seq_00000087_00000476:
	setvar VAR_UNK_414A, 255
	return

scr_seq_00000087_0000047E:
	call scr_seq_00000087_000004CD
	scrcmd_193 0, 16386
	msgbox 29
	goto scr_seq_00000087_000004C5

scr_seq_00000087_00000492:
	.byte 0x02, 0x00
scr_seq_00000087_00000494:
	call scr_seq_00000087_000004CD
	scrcmd_193 0, 16389
	msgbox 29
	goto scr_seq_00000087_000004C5

scr_seq_00000087_000004A8:
	.byte 0x02, 0x00
scr_seq_00000087_000004AA:
	call scr_seq_00000087_000004CD
	scrcmd_193 0, 16386
	scrcmd_193 1, 16389
	msgbox 30
	goto scr_seq_00000087_000004C5

scr_seq_00000087_000004C3:
	.byte 0x02, 0x00
scr_seq_00000087_000004C5:
	goto scr_seq_00000087_00000132

scr_seq_00000087_000004CB:
	.byte 0x02, 0x00
scr_seq_00000087_000004CD:
	scrcmd_258
	scrcmd_257 157
	scrcmd_283
	return

scr_seq_00000087_000004D7:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, scr_seq_00000087_0000056F
	comparevartovalue VAR_UNK_4149, 1
	callif eq, scr_seq_00000087_0000058A
	comparevartovalue VAR_UNK_4149, 2
	callif eq, scr_seq_00000087_000005A5
	play_se SEQ_SE_DP_KAIDAN2
	goto scr_seq_00000087_0000050A

scr_seq_00000087_00000508:
	.byte 0x02, 0x00
scr_seq_00000087_0000050A:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_815 0
	comparevartovalue VAR_UNK_4149, 0
	callif eq, scr_seq_00000087_000005CB
	comparevartovalue VAR_UNK_4149, 1
	callif eq, scr_seq_00000087_000005DF
	comparevartovalue VAR_UNK_4149, 2
	callif eq, scr_seq_00000087_000005F3
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 15
	comparevartovalue VAR_UNK_4149, 2
	callif eq, scr_seq_00000087_0000056B
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_682 1
	end

scr_seq_00000087_0000056B:
	scrcmd_283
	return

scr_seq_00000087_0000056F:
	msgbox 32
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000087_00000618
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000087_00000638
	wait_movement
	return

scr_seq_00000087_0000058A:
	msgbox 32
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000087_00000618
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000087_00000638
	wait_movement
	return

scr_seq_00000087_000005A5:
	scrcmd_047 32
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 155
	closemsg
	apply_movement 255, scr_seq_00000087_0000062C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000087_0000064C
	wait_movement
	return

scr_seq_00000087_000005CB:
	apply_movement 255, scr_seq_00000087_00000658
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000087_00000680
	wait_movement
	return

scr_seq_00000087_000005DF:
	apply_movement 255, scr_seq_00000087_00000658
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000087_00000680
	wait_movement
	return

scr_seq_00000087_000005F3:
	apply_movement 255, scr_seq_00000087_00000670
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000087_00000694
	wait_movement
	return

scr_seq_00000087_00000607:
	scrcmd_747
	setvar VAR_UNK_414A, 0
	callstd 2041
	end

scr_seq_00000087_00000615:
	.byte 0x00, 0x00, 0x00

scr_seq_00000087_00000618:
	.short 12, 2
	.short 15, 1
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000087_0000062C:
	.short 12, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000087_00000638:
	.short 12, 1
	.short 15, 1
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000087_0000064C:
	.short 12, 3
	.short 69, 1
	.short 254, 0

scr_seq_00000087_00000658:
	.short 21, 2
	.short 22, 1
	.short 21, 2
	.short 0, 1
	.short 70, 1
	.short 254, 0

scr_seq_00000087_00000670:
	.short 21, 4
	.short 0, 1
	.short 70, 1
	.short 254, 0

scr_seq_00000087_00000680:
	.short 21, 1
	.short 22, 1
	.short 21, 2
	.short 70, 1
	.short 254, 0

scr_seq_00000087_00000694:
	.short 21, 3
	.short 70, 1
	.short 254, 0
scr_seq_00000087_000006A0:
	msgbox 0
	return

scr_seq_00000087_000006A5:
	msgbox 3
	return

scr_seq_00000087_000006AA:
	msgbox 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 38, 255, 0
	scrcmd_751 39, 255, 1
	return

scr_seq_00000087_000006C9:
	msgbox 4
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 40, 255, 4
	return

scr_seq_00000087_000006E0:
	msgbox 2
	return

scr_seq_00000087_000006E5:
	msgbox 5
	return

scr_seq_00000087_000006EA:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_414A, 0
	msgbox 33
	call scr_seq_00000087_00000476
	call scr_seq_00000087_00000711
	goto scr_seq_00000087_000004D7

scr_seq_00000087_0000070F:
	.byte 0x02
	.byte 0x00
scr_seq_00000087_00000711:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_00000087_00000723:
	msgbox 34
	scrcmd_646 16713
	comparevartovalue VAR_UNK_4051, 1
	callif eq, scr_seq_00000087_0000074C
	comparevartovalue VAR_UNK_4051, 3
	callif eq, scr_seq_00000087_00000754
	goto scr_seq_00000087_00000132

scr_seq_00000087_0000074A:
	.byte 0x02, 0x00
scr_seq_00000087_0000074C:
	setvar VAR_UNK_4051, 0
	return

scr_seq_00000087_00000754:
	setvar VAR_UNK_4051, 2
	return

scr_seq_00000087_0000075C:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, scr_seq_00000087_00000798
	comparevartovalue VAR_UNK_4149, 1
	callif eq, scr_seq_00000087_00000798
	comparevartovalue VAR_UNK_4051, 1
	callif eq, scr_seq_00000087_0000079E
	comparevartovalue VAR_UNK_4051, 3
	callif eq, scr_seq_00000087_000007B5
	goto scr_seq_00000087_00000132

scr_seq_00000087_00000796:
	.byte 0x02, 0x00
scr_seq_00000087_00000798:
	scrcmd_680 30
	return

scr_seq_00000087_0000079E:
	msgbox 35
	scrcmd_190 0
	msgbox 37
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4051, 2
	return

scr_seq_00000087_000007B5:
	msgbox 35
	scrcmd_190 0
	msgbox 36
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4051, 4
	callstd 2040
	return

scr_seq_00000087_000007D0:
	goto scr_seq_00000087_00000132

scr_seq_00000087_000007D6:
	.byte 0x02, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000087_000007F8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 46
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_0000080B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 47
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_0000081E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_00000831:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 49
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_00000844:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 50
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_00000857:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_0000086A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 52
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_0000087D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_00000890:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000087_000008A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 55
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
