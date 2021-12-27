#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0086_003C ; 000
	scrdef scr_seq_0086_06D6 ; 001
	scrdef scr_seq_0086_070F ; 002
	scrdef scr_seq_0086_074C ; 003
	scrdef scr_seq_0086_07C0 ; 004
	scrdef scr_seq_0086_0058 ; 005
	scrdef scr_seq_0086_07E8 ; 006
	scrdef scr_seq_0086_07FB ; 007
	scrdef scr_seq_0086_080E ; 008
	scrdef scr_seq_0086_0821 ; 009
	scrdef scr_seq_0086_0834 ; 010
	scrdef scr_seq_0086_0847 ; 011
	scrdef scr_seq_0086_085A ; 012
	scrdef scr_seq_0086_003A ; 013
	scrdef_end

scr_seq_0086_003A:
	end

scr_seq_0086_003C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto scr_seq_0086_0074

scr_seq_0086_0056:
	.byte 0x02, 0x00
scr_seq_0086_0058:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_0086_0074

scr_seq_0086_0072:
	.byte 0x02, 0x00
scr_seq_0086_0074:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0086_068C
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0086_0691
	goto scr_seq_0086_009A

scr_seq_0086_0098:
	.byte 0x02, 0x00
scr_seq_0086_009A:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0086_0696
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0086_06B5
	scrcmd_751 41, 255, 2
	scrcmd_751 42, 255, 3
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0086_013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0086_016C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0086_0104
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0086_0199
	scrcmd_747
	goto scr_seq_0086_0126

scr_seq_0086_0102:
	.byte 0x02, 0x00
scr_seq_0086_0104:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0086_06CC
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0086_06D1
	goto scr_seq_0086_009A

scr_seq_0086_0124:
	.byte 0x02, 0x00
scr_seq_0086_0126:
	goto scr_seq_0086_012E

scr_seq_0086_012C:
	.byte 0x02, 0x00
scr_seq_0086_012E:
	setvar VAR_UNK_4147, 0
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0086_013F:
	setvar VAR_UNK_4148, 0
	scrcmd_637 0, 3, 32780
	scrcmd_198 0, 3
	scrcmd_198 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0086_01C6
	goto scr_seq_0086_01F0

scr_seq_0086_016A:
	.byte 0x02, 0x00
scr_seq_0086_016C:
	setvar VAR_UNK_4148, 1
	scrcmd_637 0, 3, 32780
	scrcmd_198 0, 3
	scrcmd_198 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0086_01C6
	goto scr_seq_0086_01F0

scr_seq_0086_0197:
	.byte 0x02, 0x00
scr_seq_0086_0199:
	setvar VAR_UNK_4148, 2
	scrcmd_637 0, 2, 32780
	scrcmd_198 0, 2
	scrcmd_198 1, 2
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0086_01DB
	goto scr_seq_0086_01F0

scr_seq_0086_01C4:
	.byte 0x02, 0x00
scr_seq_0086_01C6:
	npc_msg 8
	scrcmd_444 9, 3, 0, 0
	scrcmd_747
	goto scr_seq_0086_0126

scr_seq_0086_01D9:
	.byte 0x02, 0x00
scr_seq_0086_01DB:
	npc_msg 8
	scrcmd_444 9, 2, 0, 0
	scrcmd_747
	goto scr_seq_0086_0126

scr_seq_0086_01EE:
	.byte 0x02, 0x00
scr_seq_0086_01F0:
	npc_msg 7
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_637 4, 16712, 32780
	scrcmd_639 16386, 16389, 16390
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, scr_seq_0086_0222
	scrcmd_815 0
scr_seq_0086_0222:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_0086_0126
	scrcmd_690 16386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0086_05FB
	scrcmd_690 16389, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0086_05FB
	comparevartovalue VAR_UNK_4148, 2
	gotoif eq, scr_seq_0086_0283
	scrcmd_690 16390, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0086_05FB
scr_seq_0086_0283:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0086_029E
	scrcmd_747
	goto scr_seq_0086_0126

scr_seq_0086_029E:
	goto scr_seq_0086_02A6

scr_seq_0086_02A4:
	.byte 0x02, 0x00
scr_seq_0086_02A6:
	goto scr_seq_0086_02AE

scr_seq_0086_02AC:
	.byte 0x02, 0x00
scr_seq_0086_02AE:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, scr_seq_0086_046A
	comparevartovalue VAR_UNK_4148, 1
	callif eq, scr_seq_0086_046A
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0086_0126
	scrcmd_747
	comparevartovalue VAR_UNK_4148, 2
	gotoif eq, scr_seq_0086_02FE
	goto scr_seq_0086_04CB

scr_seq_0086_02FC:
	.byte 0x02, 0x00
scr_seq_0086_02FE:
	npc_msg 43
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0086_034F
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0086_03A7
	scrcmd_747
	goto scr_seq_0086_0126

scr_seq_0086_034D:
	.byte 0x02, 0x00
scr_seq_0086_034F:
	npc_msg 44
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0086_02FE
	scrcmd_747
	closemsg
	scrcmd_226 31, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0086_0395
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0086_039D
	goto scr_seq_0086_03FF

scr_seq_0086_0393:
	.byte 0x02, 0x00
scr_seq_0086_0395:
	goto scr_seq_0086_02FE

scr_seq_0086_039B:
	.byte 0x02, 0x00
scr_seq_0086_039D:
	scrcmd_283
	goto scr_seq_0086_02FE

scr_seq_0086_03A5:
	.byte 0x02, 0x00
scr_seq_0086_03A7:
	npc_msg 44
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0086_02FE
	scrcmd_747
	closemsg
	scrcmd_227 31, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0086_03ED
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0086_03F5
	goto scr_seq_0086_03FF

scr_seq_0086_03EB:
	.byte 0x02, 0x00
scr_seq_0086_03ED:
	goto scr_seq_0086_02FE

scr_seq_0086_03F3:
	.byte 0x02, 0x00
scr_seq_0086_03F5:
	scrcmd_283
	goto scr_seq_0086_02FE

scr_seq_0086_03FD:
	.byte 0x02, 0x00
scr_seq_0086_03FF:
	scrcmd_258
	scrcmd_257 136
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x8000
	get_partymon_species VAR_TEMP_x4005, VAR_SPECIAL_x8001
	scrcmd_638 32768, 32769, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0086_0472
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0086_0488
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0086_049E
	scrcmd_258
	scrcmd_257 138
	npc_msg 45
	comparevartovalue VAR_UNK_4148, 2
	callif eq, scr_seq_0086_046A
	call scr_seq_0086_06FD
	goto scr_seq_0086_04CB

scr_seq_0086_0468:
	.byte 0x02, 0x00
scr_seq_0086_046A:
	setvar VAR_UNK_4147, 255
	return

scr_seq_0086_0472:
	call scr_seq_0086_04C1
	scrcmd_193 0, 16386
	npc_msg 29
	goto scr_seq_0086_04B9

scr_seq_0086_0486:
	.byte 0x02, 0x00
scr_seq_0086_0488:
	call scr_seq_0086_04C1
	scrcmd_193 0, 16389
	npc_msg 29
	goto scr_seq_0086_04B9

scr_seq_0086_049C:
	.byte 0x02, 0x00
scr_seq_0086_049E:
	call scr_seq_0086_04C1
	scrcmd_193 0, 16386
	scrcmd_193 1, 16389
	npc_msg 30
	goto scr_seq_0086_04B9

scr_seq_0086_04B7:
	.byte 0x02, 0x00
scr_seq_0086_04B9:
	goto scr_seq_0086_0126

scr_seq_0086_04BF:
	.byte 0x02
	.byte 0x00
scr_seq_0086_04C1:
	scrcmd_258
	scrcmd_257 139
	scrcmd_283
	return

scr_seq_0086_04CB:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, scr_seq_0086_0563
	comparevartovalue VAR_UNK_4148, 1
	callif eq, scr_seq_0086_057E
	comparevartovalue VAR_UNK_4148, 2
	callif eq, scr_seq_0086_0599
	play_se SEQ_SE_DP_KAIDAN2
	goto scr_seq_0086_04FE

scr_seq_0086_04FC:
	.byte 0x02, 0x00
scr_seq_0086_04FE:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_815 0
	comparevartovalue VAR_UNK_4148, 0
	callif eq, scr_seq_0086_05BF
	comparevartovalue VAR_UNK_4148, 1
	callif eq, scr_seq_0086_05D3
	comparevartovalue VAR_UNK_4148, 2
	callif eq, scr_seq_0086_05E7
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 11
	comparevartovalue VAR_UNK_4148, 2
	callif eq, scr_seq_0086_055F
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_682 1
	end

scr_seq_0086_055F:
	scrcmd_283
	return

scr_seq_0086_0563:
	npc_msg 32
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0086_060C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0086_062C
	wait_movement
	return

scr_seq_0086_057E:
	npc_msg 32
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0086_060C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0086_062C
	wait_movement
	return

scr_seq_0086_0599:
	scrcmd_047 32
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 137
	closemsg
	apply_movement 255, scr_seq_0086_0618
	apply_movement VAR_SPECIAL_x800D, scr_seq_0086_0638
	wait_movement
	return

scr_seq_0086_05BF:
	apply_movement 255, scr_seq_0086_064C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0086_0670
	wait_movement
	return

scr_seq_0086_05D3:
	apply_movement 255, scr_seq_0086_064C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0086_0670
	wait_movement
	return

scr_seq_0086_05E7:
	apply_movement 255, scr_seq_0086_065C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0086_067C
	wait_movement
	return

scr_seq_0086_05FB:
	scrcmd_747
	setvar VAR_UNK_4147, 0
	callstd 2041
	end

scr_seq_0086_0609:
	.byte 0x00, 0x00, 0x00

scr_seq_0086_060C:
	.short 14, 6
	.short 69, 1
	.short 254, 0

scr_seq_0086_0618:
	.short 14, 3
	.short 12, 1
	.short 14, 3
	.short 69, 1
	.short 254, 0

scr_seq_0086_062C:
	.short 14, 5
	.short 69, 1
	.short 254, 0

scr_seq_0086_0638:
	.short 14, 2
	.short 12, 1
	.short 14, 3
	.short 69, 1
	.short 254, 0

scr_seq_0086_064C:
	.short 23, 6
	.short 70, 1
	.short 2, 1
	.short 254, 0

scr_seq_0086_065C:
	.short 23, 6
	.short 21, 1
	.short 70, 1
	.short 2, 1
	.short 254, 0

scr_seq_0086_0670:
	.short 23, 5
	.short 70, 1
	.short 254, 0

scr_seq_0086_067C:
	.short 21, 1
	.short 23, 5
	.short 70, 1
	.short 254, 0
scr_seq_0086_068C:
	npc_msg 0
	return

scr_seq_0086_0691:
	npc_msg 3
	return

scr_seq_0086_0696:
	npc_msg 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 38, 255, 0
	scrcmd_751 39, 255, 1
	return

scr_seq_0086_06B5:
	npc_msg 4
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 40, 255, 4
	return

scr_seq_0086_06CC:
	npc_msg 2
	return

scr_seq_0086_06D1:
	npc_msg 5
	return

scr_seq_0086_06D6:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4147, 0
	npc_msg 33
	call scr_seq_0086_046A
	call scr_seq_0086_06FD
	goto scr_seq_0086_04CB

scr_seq_0086_06FB:
	.byte 0x02, 0x00
scr_seq_0086_06FD:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_0086_070F:
	lockall
	faceplayer
	npc_msg 34
	scrcmd_640 16712
	comparevartovalue VAR_UNK_4050, 1
	callif eq, scr_seq_0086_073C
	comparevartovalue VAR_UNK_4050, 3
	callif eq, scr_seq_0086_0744
	goto scr_seq_0086_0126

scr_seq_0086_073A:
	.byte 0x02, 0x00
scr_seq_0086_073C:
	setvar VAR_UNK_4050, 0
	return

scr_seq_0086_0744:
	setvar VAR_UNK_4050, 2
	return

scr_seq_0086_074C:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, scr_seq_0086_0788
	comparevartovalue VAR_UNK_4148, 1
	callif eq, scr_seq_0086_0788
	comparevartovalue VAR_UNK_4050, 1
	callif eq, scr_seq_0086_078E
	comparevartovalue VAR_UNK_4050, 3
	callif eq, scr_seq_0086_07A5
	goto scr_seq_0086_0126

scr_seq_0086_0786:
	.byte 0x02, 0x00
scr_seq_0086_0788:
	scrcmd_680 28
	return

scr_seq_0086_078E:
	npc_msg 35
	buffer_players_name 0
	npc_msg 37
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4050, 2
	return

scr_seq_0086_07A5:
	npc_msg 35
	buffer_players_name 0
	npc_msg 36
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4050, 4
	callstd 2040
	return

scr_seq_0086_07C0:
	goto scr_seq_0086_0126

scr_seq_0086_07C6:
	.byte 0x02, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0086_07E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 46
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0086_07FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 47
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0086_080E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0086_0821:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 49
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0086_0834:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 50
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0086_0847:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0086_085A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 52
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
