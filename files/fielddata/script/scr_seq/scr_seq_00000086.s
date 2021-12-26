#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000086_0000003C ; 000
	scrdef scr_seq_00000086_000006D6 ; 001
	scrdef scr_seq_00000086_0000070F ; 002
	scrdef scr_seq_00000086_0000074C ; 003
	scrdef scr_seq_00000086_000007C0 ; 004
	scrdef scr_seq_00000086_00000058 ; 005
	scrdef scr_seq_00000086_000007E8 ; 006
	scrdef scr_seq_00000086_000007FB ; 007
	scrdef scr_seq_00000086_0000080E ; 008
	scrdef scr_seq_00000086_00000821 ; 009
	scrdef scr_seq_00000086_00000834 ; 010
	scrdef scr_seq_00000086_00000847 ; 011
	scrdef scr_seq_00000086_0000085A ; 012
	scrdef scr_seq_00000086_0000003A ; 013
	scrdef_end

scr_seq_00000086_0000003A:
	end

scr_seq_00000086_0000003C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto scr_seq_00000086_00000074

scr_seq_00000086_00000056:
	.byte 0x02, 0x00
scr_seq_00000086_00000058:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_00000086_00000074

scr_seq_00000086_00000072:
	.byte 0x02, 0x00
scr_seq_00000086_00000074:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000086_0000068C
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000086_00000691
	goto scr_seq_00000086_0000009A

scr_seq_00000086_00000098:
	.byte 0x02, 0x00
scr_seq_00000086_0000009A:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000086_00000696
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000086_000006B5
	scrcmd_751 41, 255, 2
	scrcmd_751 42, 255, 3
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000086_0000013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000086_0000016C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000086_00000104
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000086_00000199
	scrcmd_747
	goto scr_seq_00000086_00000126

scr_seq_00000086_00000102:
	.byte 0x02, 0x00
scr_seq_00000086_00000104:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000086_000006CC
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000086_000006D1
	goto scr_seq_00000086_0000009A

scr_seq_00000086_00000124:
	.byte 0x02, 0x00
scr_seq_00000086_00000126:
	goto scr_seq_00000086_0000012E

scr_seq_00000086_0000012C:
	.byte 0x02, 0x00
scr_seq_00000086_0000012E:
	setvar VAR_UNK_4147, 0
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000086_0000013F:
	setvar VAR_UNK_4148, 0
	scrcmd_637 0, 3, 32780
	scrcmd_198 0, 3
	scrcmd_198 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000086_000001C6
	goto scr_seq_00000086_000001F0

scr_seq_00000086_0000016A:
	.byte 0x02, 0x00
scr_seq_00000086_0000016C:
	setvar VAR_UNK_4148, 1
	scrcmd_637 0, 3, 32780
	scrcmd_198 0, 3
	scrcmd_198 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000086_000001C6
	goto scr_seq_00000086_000001F0

scr_seq_00000086_00000197:
	.byte 0x02, 0x00
scr_seq_00000086_00000199:
	setvar VAR_UNK_4148, 2
	scrcmd_637 0, 2, 32780
	scrcmd_198 0, 2
	scrcmd_198 1, 2
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000086_000001DB
	goto scr_seq_00000086_000001F0

scr_seq_00000086_000001C4:
	.byte 0x02, 0x00
scr_seq_00000086_000001C6:
	msgbox 8
	scrcmd_444 9, 3, 0, 0
	scrcmd_747
	goto scr_seq_00000086_00000126

scr_seq_00000086_000001D9:
	.byte 0x02, 0x00
scr_seq_00000086_000001DB:
	msgbox 8
	scrcmd_444 9, 2, 0, 0
	scrcmd_747
	goto scr_seq_00000086_00000126

scr_seq_00000086_000001EE:
	.byte 0x02, 0x00
scr_seq_00000086_000001F0:
	msgbox 7
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_637 4, 16712, 32780
	scrcmd_639 16386, 16389, 16390
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, scr_seq_00000086_00000222
	scrcmd_815 0
scr_seq_00000086_00000222:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_00000086_00000126
	scrcmd_690 16386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000086_000005FB
	scrcmd_690 16389, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000086_000005FB
	comparevartovalue VAR_UNK_4148, 2
	gotoif eq, scr_seq_00000086_00000283
	scrcmd_690 16390, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000086_000005FB
scr_seq_00000086_00000283:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000086_0000029E
	scrcmd_747
	goto scr_seq_00000086_00000126

scr_seq_00000086_0000029E:
	goto scr_seq_00000086_000002A6

scr_seq_00000086_000002A4:
	.byte 0x02, 0x00
scr_seq_00000086_000002A6:
	goto scr_seq_00000086_000002AE

scr_seq_00000086_000002AC:
	.byte 0x02, 0x00
scr_seq_00000086_000002AE:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, scr_seq_00000086_0000046A
	comparevartovalue VAR_UNK_4148, 1
	callif eq, scr_seq_00000086_0000046A
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000086_00000126
	scrcmd_747
	comparevartovalue VAR_UNK_4148, 2
	gotoif eq, scr_seq_00000086_000002FE
	goto scr_seq_00000086_000004CB

scr_seq_00000086_000002FC:
	.byte 0x02, 0x00
scr_seq_00000086_000002FE:
	msgbox 43
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000086_0000034F
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000086_000003A7
	scrcmd_747
	goto scr_seq_00000086_00000126

scr_seq_00000086_0000034D:
	.byte 0x02, 0x00
scr_seq_00000086_0000034F:
	msgbox 44
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000086_000002FE
	scrcmd_747
	closemsg
	scrcmd_226 31, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000086_00000395
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000086_0000039D
	goto scr_seq_00000086_000003FF

scr_seq_00000086_00000393:
	.byte 0x02, 0x00
scr_seq_00000086_00000395:
	goto scr_seq_00000086_000002FE

scr_seq_00000086_0000039B:
	.byte 0x02, 0x00
scr_seq_00000086_0000039D:
	scrcmd_283
	goto scr_seq_00000086_000002FE

scr_seq_00000086_000003A5:
	.byte 0x02, 0x00
scr_seq_00000086_000003A7:
	msgbox 44
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000086_000002FE
	scrcmd_747
	closemsg
	scrcmd_227 31, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000086_000003ED
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000086_000003F5
	goto scr_seq_00000086_000003FF

scr_seq_00000086_000003EB:
	.byte 0x02, 0x00
scr_seq_00000086_000003ED:
	goto scr_seq_00000086_000002FE

scr_seq_00000086_000003F3:
	.byte 0x02, 0x00
scr_seq_00000086_000003F5:
	scrcmd_283
	goto scr_seq_00000086_000002FE

scr_seq_00000086_000003FD:
	.byte 0x02, 0x00
scr_seq_00000086_000003FF:
	scrcmd_258
	scrcmd_257 136
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x8000
	get_partymon_species VAR_TEMP_x4005, VAR_SPECIAL_x8001
	scrcmd_638 32768, 32769, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000086_00000472
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000086_00000488
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000086_0000049E
	scrcmd_258
	scrcmd_257 138
	msgbox 45
	comparevartovalue VAR_UNK_4148, 2
	callif eq, scr_seq_00000086_0000046A
	call scr_seq_00000086_000006FD
	goto scr_seq_00000086_000004CB

scr_seq_00000086_00000468:
	.byte 0x02, 0x00
scr_seq_00000086_0000046A:
	setvar VAR_UNK_4147, 255
	return

scr_seq_00000086_00000472:
	call scr_seq_00000086_000004C1
	scrcmd_193 0, 16386
	msgbox 29
	goto scr_seq_00000086_000004B9

scr_seq_00000086_00000486:
	.byte 0x02, 0x00
scr_seq_00000086_00000488:
	call scr_seq_00000086_000004C1
	scrcmd_193 0, 16389
	msgbox 29
	goto scr_seq_00000086_000004B9

scr_seq_00000086_0000049C:
	.byte 0x02, 0x00
scr_seq_00000086_0000049E:
	call scr_seq_00000086_000004C1
	scrcmd_193 0, 16386
	scrcmd_193 1, 16389
	msgbox 30
	goto scr_seq_00000086_000004B9

scr_seq_00000086_000004B7:
	.byte 0x02, 0x00
scr_seq_00000086_000004B9:
	goto scr_seq_00000086_00000126

scr_seq_00000086_000004BF:
	.byte 0x02
	.byte 0x00
scr_seq_00000086_000004C1:
	scrcmd_258
	scrcmd_257 139
	scrcmd_283
	return

scr_seq_00000086_000004CB:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, scr_seq_00000086_00000563
	comparevartovalue VAR_UNK_4148, 1
	callif eq, scr_seq_00000086_0000057E
	comparevartovalue VAR_UNK_4148, 2
	callif eq, scr_seq_00000086_00000599
	play_se SEQ_SE_DP_KAIDAN2
	goto scr_seq_00000086_000004FE

scr_seq_00000086_000004FC:
	.byte 0x02, 0x00
scr_seq_00000086_000004FE:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_815 0
	comparevartovalue VAR_UNK_4148, 0
	callif eq, scr_seq_00000086_000005BF
	comparevartovalue VAR_UNK_4148, 1
	callif eq, scr_seq_00000086_000005D3
	comparevartovalue VAR_UNK_4148, 2
	callif eq, scr_seq_00000086_000005E7
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 11
	comparevartovalue VAR_UNK_4148, 2
	callif eq, scr_seq_00000086_0000055F
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_682 1
	end

scr_seq_00000086_0000055F:
	scrcmd_283
	return

scr_seq_00000086_00000563:
	msgbox 32
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000086_0000060C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000086_0000062C
	wait_movement
	return

scr_seq_00000086_0000057E:
	msgbox 32
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000086_0000060C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000086_0000062C
	wait_movement
	return

scr_seq_00000086_00000599:
	scrcmd_047 32
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 137
	closemsg
	apply_movement 255, scr_seq_00000086_00000618
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000086_00000638
	wait_movement
	return

scr_seq_00000086_000005BF:
	apply_movement 255, scr_seq_00000086_0000064C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000086_00000670
	wait_movement
	return

scr_seq_00000086_000005D3:
	apply_movement 255, scr_seq_00000086_0000064C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000086_00000670
	wait_movement
	return

scr_seq_00000086_000005E7:
	apply_movement 255, scr_seq_00000086_0000065C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000086_0000067C
	wait_movement
	return

scr_seq_00000086_000005FB:
	scrcmd_747
	setvar VAR_UNK_4147, 0
	callstd 2041
	end

scr_seq_00000086_00000609:
	.byte 0x00, 0x00, 0x00

scr_seq_00000086_0000060C:
	.short 14, 6
	.short 69, 1
	.short 254, 0

scr_seq_00000086_00000618:
	.short 14, 3
	.short 12, 1
	.short 14, 3
	.short 69, 1
	.short 254, 0

scr_seq_00000086_0000062C:
	.short 14, 5
	.short 69, 1
	.short 254, 0

scr_seq_00000086_00000638:
	.short 14, 2
	.short 12, 1
	.short 14, 3
	.short 69, 1
	.short 254, 0

scr_seq_00000086_0000064C:
	.short 23, 6
	.short 70, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000086_0000065C:
	.short 23, 6
	.short 21, 1
	.short 70, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000086_00000670:
	.short 23, 5
	.short 70, 1
	.short 254, 0

scr_seq_00000086_0000067C:
	.short 21, 1
	.short 23, 5
	.short 70, 1
	.short 254, 0
scr_seq_00000086_0000068C:
	msgbox 0
	return

scr_seq_00000086_00000691:
	msgbox 3
	return

scr_seq_00000086_00000696:
	msgbox 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 38, 255, 0
	scrcmd_751 39, 255, 1
	return

scr_seq_00000086_000006B5:
	msgbox 4
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 40, 255, 4
	return

scr_seq_00000086_000006CC:
	msgbox 2
	return

scr_seq_00000086_000006D1:
	msgbox 5
	return

scr_seq_00000086_000006D6:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4147, 0
	msgbox 33
	call scr_seq_00000086_0000046A
	call scr_seq_00000086_000006FD
	goto scr_seq_00000086_000004CB

scr_seq_00000086_000006FB:
	.byte 0x02, 0x00
scr_seq_00000086_000006FD:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_00000086_0000070F:
	lockall
	faceplayer
	msgbox 34
	scrcmd_640 16712
	comparevartovalue VAR_UNK_4050, 1
	callif eq, scr_seq_00000086_0000073C
	comparevartovalue VAR_UNK_4050, 3
	callif eq, scr_seq_00000086_00000744
	goto scr_seq_00000086_00000126

scr_seq_00000086_0000073A:
	.byte 0x02, 0x00
scr_seq_00000086_0000073C:
	setvar VAR_UNK_4050, 0
	return

scr_seq_00000086_00000744:
	setvar VAR_UNK_4050, 2
	return

scr_seq_00000086_0000074C:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, scr_seq_00000086_00000788
	comparevartovalue VAR_UNK_4148, 1
	callif eq, scr_seq_00000086_00000788
	comparevartovalue VAR_UNK_4050, 1
	callif eq, scr_seq_00000086_0000078E
	comparevartovalue VAR_UNK_4050, 3
	callif eq, scr_seq_00000086_000007A5
	goto scr_seq_00000086_00000126

scr_seq_00000086_00000786:
	.byte 0x02, 0x00
scr_seq_00000086_00000788:
	scrcmd_680 28
	return

scr_seq_00000086_0000078E:
	msgbox 35
	buffer_players_name 0
	msgbox 37
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4050, 2
	return

scr_seq_00000086_000007A5:
	msgbox 35
	buffer_players_name 0
	msgbox 36
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4050, 4
	callstd 2040
	return

scr_seq_00000086_000007C0:
	goto scr_seq_00000086_00000126

scr_seq_00000086_000007C6:
	.byte 0x02, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000086_000007E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 46
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000086_000007FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 47
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000086_0000080E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000086_00000821:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 49
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000086_00000834:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 50
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000086_00000847:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000086_0000085A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 52
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
