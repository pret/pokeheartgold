#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0085_020B ; 000
	scrdef scr_seq_0085_08B2 ; 001
	scrdef scr_seq_0085_08EB ; 002
	scrdef scr_seq_0085_0924 ; 003
	scrdef scr_seq_0085_0998 ; 004
	scrdef scr_seq_0085_0227 ; 005
	scrdef scr_seq_0085_09C0 ; 006
	scrdef scr_seq_0085_09D3 ; 007
	scrdef scr_seq_0085_09E6 ; 008
	scrdef scr_seq_0085_09F9 ; 009
	scrdef scr_seq_0085_0A18 ; 010
	scrdef scr_seq_0085_0A2B ; 011
	scrdef scr_seq_0085_0A3E ; 012
	scrdef scr_seq_0085_0A51 ; 013
	scrdef scr_seq_0085_0A64 ; 014
	scrdef scr_seq_0085_0157 ; 015
	scrdef scr_seq_0085_0A77 ; 016
	scrdef scr_seq_0085_0B16 ; 017
	scrdef scr_seq_0085_0C29 ; 018
	scrdef scr_seq_0085_0D3C ; 019
	scrdef scr_seq_0085_00A6 ; 020
	scrdef scr_seq_0085_005A ; 021
	scrdef_end

scr_seq_0085_005A:
	scrcmd_693 16384
	comparevartovalue VAR_TEMP_x4000, 11
	callif ge, scr_seq_0085_0090
	comparevartovalue VAR_TEMP_x4000, 101
	callif ge, scr_seq_0085_007A
	end

scr_seq_0085_007A:
	scrcmd_338 11, 8, 11
	show_person_at 11, 8, 0, 11, 2
	return

scr_seq_0085_0090:
	scrcmd_338 11, 13, 11
	show_person_at 11, 13, 0, 11, 2
	return

scr_seq_0085_00A6:
	comparevartovalue VAR_UNK_4145, 1
	gotoif eq, scr_seq_0085_00B5
	end

scr_seq_0085_00B5:
	scrcmd_380 16391, 100
	checkflag FLAG_UNK_234
	callif FALSE, scr_seq_0085_00D5
	comparevartovalue VAR_TEMP_x4007, 30
	gotoif lt, scr_seq_0085_00DF
	end

scr_seq_0085_00D5:
	hide_person 12
	setflag FLAG_UNK_234
	return

scr_seq_0085_00DF:
	checkflag FLAG_UNK_AA1
	gotoif FALSE, scr_seq_0085_00EC
	end

scr_seq_0085_00EC:
	setflag FLAG_UNK_AA1
	scrcmd_694 16392
	comparevartovalue VAR_TEMP_x4008, 10000
	gotoif ge, scr_seq_0085_011D
	comparevartovalue VAR_TEMP_x4008, 1000
	gotoif ge, scr_seq_0085_012B
	comparevartovalue VAR_TEMP_x4008, 500
	gotoif ge, scr_seq_0085_0139
	end

scr_seq_0085_011D:
	scrcmd_380 16467, 4
	goto scr_seq_0085_0147

scr_seq_0085_0129:
	.byte 0x02, 0x00
scr_seq_0085_012B:
	scrcmd_380 16467, 2
	goto scr_seq_0085_0147

scr_seq_0085_0137:
	.byte 0x02, 0x00
scr_seq_0085_0139:
	setvar VAR_UNK_4053, 0
	goto scr_seq_0085_0147

scr_seq_0085_0145:
	.byte 0x02, 0x00
scr_seq_0085_0147:
	clearflag FLAG_UNK_234
	call scr_seq_0085_017D
	scrcmd_100 12
	end

scr_seq_0085_0157:
	get_player_gender VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	callif eq, scr_seq_0085_01FB
	comparevartovalue VAR_TEMP_x4000, 1
	callif eq, scr_seq_0085_0203
	call scr_seq_0085_017D
	end

scr_seq_0085_017D:
	comparevartovalue VAR_UNK_4053, 0
	callif eq, scr_seq_0085_01B3
	comparevartovalue VAR_UNK_4053, 1
	callif eq, scr_seq_0085_01E3
	comparevartovalue VAR_UNK_4053, 2
	callif eq, scr_seq_0085_01EB
	comparevartovalue VAR_UNK_4053, 3
	callif eq, scr_seq_0085_01F3
	return

scr_seq_0085_01B3:
	get_player_gender VAR_TEMP_x4009
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif eq, scr_seq_0085_01D3
	comparevartovalue VAR_TEMP_x4009, 1
	gotoif eq, scr_seq_0085_01DB
	return

scr_seq_0085_01D3:
	setvar VAR_OBJ_1, 97
	return

scr_seq_0085_01DB:
	setvar VAR_OBJ_1, 0
	return

scr_seq_0085_01E3:
	setvar VAR_OBJ_1, 365
	return

scr_seq_0085_01EB:
	setvar VAR_OBJ_1, 366
	return

scr_seq_0085_01F3:
	setvar VAR_OBJ_1, 354
	return

scr_seq_0085_01FB:
	setvar VAR_OBJ_9, 320
	return

scr_seq_0085_0203:
	setvar VAR_OBJ_9, 317
	return

scr_seq_0085_020B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto scr_seq_0085_0243

scr_seq_0085_0225:
	.byte 0x02, 0x00
scr_seq_0085_0227:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_0085_0243

scr_seq_0085_0241:
	.byte 0x02, 0x00
scr_seq_0085_0243:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0085_0868
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0085_086D
	goto scr_seq_0085_0269

scr_seq_0085_0267:
	.byte 0x02, 0x00
scr_seq_0085_0269:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0085_0872
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0085_0891
	scrcmd_751 19, 255, 2
	scrcmd_751 20, 255, 3
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0085_030E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0085_0331
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0085_02D3
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0085_0354
	scrcmd_747
	goto scr_seq_0085_02F5

scr_seq_0085_02D1:
	.byte 0x02, 0x00
scr_seq_0085_02D3:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0085_08A8
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0085_08AD
	goto scr_seq_0085_0269

scr_seq_0085_02F3:
	.byte 0x02, 0x00
scr_seq_0085_02F5:
	goto scr_seq_0085_02FD

scr_seq_0085_02FB:
	.byte 0x02, 0x00
scr_seq_0085_02FD:
	setvar VAR_UNK_4145, 0
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_030E:
	setvar VAR_UNK_4146, 0
	scrcmd_633 0, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0085_0377
	goto scr_seq_0085_03A1

scr_seq_0085_032F:
	.byte 0x02
	.byte 0x00
scr_seq_0085_0331:
	setvar VAR_UNK_4146, 1
	scrcmd_633 0, 2, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0085_038C
	goto scr_seq_0085_03A1

scr_seq_0085_0352:
	.byte 0x02, 0x00
scr_seq_0085_0354:
	setvar VAR_UNK_4146, 2
	scrcmd_633 0, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0085_0377
	goto scr_seq_0085_03A1

scr_seq_0085_0375:
	.byte 0x02, 0x00
scr_seq_0085_0377:
	npc_msg 35
	scrcmd_444 37, 1, 0, 0
	scrcmd_747
	goto scr_seq_0085_02F5

scr_seq_0085_038A:
	.byte 0x02, 0x00
scr_seq_0085_038C:
	npc_msg 36
	scrcmd_444 37, 2, 0, 0
	scrcmd_747
	goto scr_seq_0085_02F5

scr_seq_0085_039F:
	.byte 0x02
	.byte 0x00
scr_seq_0085_03A1:
	npc_msg 33
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_633 4, 16710, 32780
	scrcmd_635 16386, 16389
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, scr_seq_0085_03D1
	scrcmd_815 0
scr_seq_0085_03D1:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_0085_02F5
	scrcmd_690 16386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0085_07B9
	comparevartovalue VAR_UNK_4146, 1
	gotoif eq, scr_seq_0085_0414
	goto scr_seq_0085_042F

scr_seq_0085_0412:
	.byte 0x02, 0x00
scr_seq_0085_0414:
	scrcmd_690 16389, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0085_07B9
	goto scr_seq_0085_042F

scr_seq_0085_042D:
	.byte 0x02, 0x00
scr_seq_0085_042F:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0085_044A
	scrcmd_747
	goto scr_seq_0085_02F5

scr_seq_0085_044A:
	scrcmd_633 1, 16710, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0085_04D8
	scrcmd_633 2, 16710, 32780
	scrcmd_202 0, 32780, 0, 0
	comparevartovar VAR_SPECIAL_x800C, VAR_TEMP_x4001
	gotoif eq, scr_seq_0085_04D8
	goto scr_seq_0085_0484

scr_seq_0085_0482:
	.byte 0x02, 0x00
scr_seq_0085_0484:
	scrcmd_202 1, 16385, 0, 0
	npc_msg 34
	scrcmd_746
	scrcmd_749 1, 1, 1, 1, VAR_SPECIAL_x800C
	scrcmd_751 42, 255, 0
	scrcmd_751 43, 255, 1
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0085_04C8
	scrcmd_747
	goto scr_seq_0085_02F5

scr_seq_0085_04C6:
	.byte 0x02, 0x00
scr_seq_0085_04C8:
	scrcmd_633 3, 16710, 32780
	goto scr_seq_0085_04D8

scr_seq_0085_04D6:
	.byte 0x02, 0x00
scr_seq_0085_04D8:
	goto scr_seq_0085_04E0

scr_seq_0085_04DE:
	.byte 0x02, 0x00
scr_seq_0085_04E0:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, scr_seq_0085_066C
	comparevartovalue VAR_UNK_4146, 1
	callif eq, scr_seq_0085_066C
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0085_02F5
	comparevartovalue VAR_UNK_4146, 2
	gotoif eq, scr_seq_0085_052E
	goto scr_seq_0085_0689

scr_seq_0085_052C:
	.byte 0x02, 0x00
scr_seq_0085_052E:
	npc_msg 30
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0085_057F
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0085_05D7
	scrcmd_747
	goto scr_seq_0085_02F5

scr_seq_0085_057D:
	.byte 0x02, 0x00
scr_seq_0085_057F:
	npc_msg 31
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0085_052E
	scrcmd_747
	closemsg
	scrcmd_226 30, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0085_05C5
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0085_05CD
	goto scr_seq_0085_062F

scr_seq_0085_05C3:
	.byte 0x02, 0x00
scr_seq_0085_05C5:
	goto scr_seq_0085_052E

scr_seq_0085_05CB:
	.byte 0x02, 0x00
scr_seq_0085_05CD:
	scrcmd_283
	goto scr_seq_0085_052E

scr_seq_0085_05D5:
	.byte 0x02, 0x00
scr_seq_0085_05D7:
	npc_msg 31
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0085_052E
	scrcmd_747
	closemsg
	scrcmd_227 30, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0085_061D
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0085_0625
	goto scr_seq_0085_062F

scr_seq_0085_061B:
	.byte 0x02, 0x00
scr_seq_0085_061D:
	goto scr_seq_0085_052E

scr_seq_0085_0623:
	.byte 0x02, 0x00
scr_seq_0085_0625:
	scrcmd_283
	goto scr_seq_0085_052E

scr_seq_0085_062D:
	.byte 0x02, 0x00
scr_seq_0085_062F:
	scrcmd_258
	scrcmd_257 108
	scrcmd_634 16385, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0085_0674
	scrcmd_258
	scrcmd_257 110
	npc_msg 32
	comparevartovalue VAR_UNK_4146, 2
	callif eq, scr_seq_0085_066C
	call scr_seq_0085_08D9
	goto scr_seq_0085_0689

scr_seq_0085_066A:
	.byte 0x02, 0x00
scr_seq_0085_066C:
	setvar VAR_UNK_4145, 255
	return

scr_seq_0085_0674:
	call scr_seq_0085_0685
	npc_msg 57
	goto scr_seq_0085_02F5

scr_seq_0085_0683:
	.byte 0x02, 0x00
scr_seq_0085_0685:
	scrcmd_283
	return

scr_seq_0085_0689:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, scr_seq_0085_0721
	comparevartovalue VAR_UNK_4146, 1
	callif eq, scr_seq_0085_073C
	comparevartovalue VAR_UNK_4146, 2
	callif eq, scr_seq_0085_0757
	play_se SEQ_SE_DP_KAIDAN2
	goto scr_seq_0085_06BC

scr_seq_0085_06BA:
	.byte 0x02, 0x00
scr_seq_0085_06BC:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_815 0
	comparevartovalue VAR_UNK_4146, 0
	callif eq, scr_seq_0085_077D
	comparevartovalue VAR_UNK_4146, 1
	callif eq, scr_seq_0085_0791
	comparevartovalue VAR_UNK_4146, 2
	callif eq, scr_seq_0085_07A5
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 9
	comparevartovalue VAR_UNK_4146, 2
	callif eq, scr_seq_0085_071D
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_682 1
	end

scr_seq_0085_071D:
	scrcmd_283
	return

scr_seq_0085_0721:
	npc_msg 9
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0085_07C8
	apply_movement VAR_SPECIAL_x800D, scr_seq_0085_07F0
	wait_movement
	return

scr_seq_0085_073C:
	npc_msg 9
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0085_07C8
	apply_movement VAR_SPECIAL_x800D, scr_seq_0085_07F0
	wait_movement
	return

scr_seq_0085_0757:
	scrcmd_047 9
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 109
	closemsg
	apply_movement 255, scr_seq_0085_07D8
	apply_movement VAR_SPECIAL_x800D, scr_seq_0085_0800
	wait_movement
	return

scr_seq_0085_077D:
	apply_movement 255, scr_seq_0085_0818
	apply_movement VAR_SPECIAL_x800D, scr_seq_0085_0848
	wait_movement
	return

scr_seq_0085_0791:
	apply_movement 255, scr_seq_0085_0818
	apply_movement VAR_SPECIAL_x800D, scr_seq_0085_0848
	wait_movement
	return

scr_seq_0085_07A5:
	apply_movement 255, scr_seq_0085_082C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0085_0858
	wait_movement
	return

scr_seq_0085_07B9:
	scrcmd_747
	setvar VAR_UNK_4145, 0
	callstd 2041
	end

scr_seq_0085_07C7:
	.byte 0x00

scr_seq_0085_07C8:
	.short 14, 4
	.short 13, 3
	.short 69, 1
	.short 254, 0

scr_seq_0085_07D8:
	.short 14, 2
	.short 12, 1
	.short 14, 2
	.short 13, 3
	.short 69, 1
	.short 254, 0

scr_seq_0085_07F0:
	.short 14, 3
	.short 13, 3
	.short 69, 1
	.short 254, 0

scr_seq_0085_0800:
	.short 14, 1
	.short 12, 1
	.short 14, 2
	.short 13, 3
	.short 69, 1
	.short 254, 0

scr_seq_0085_0818:
	.short 23, 4
	.short 20, 3
	.short 2, 1
	.short 70, 1
	.short 254, 0

scr_seq_0085_082C:
	.short 23, 2
	.short 21, 1
	.short 23, 2
	.short 20, 3
	.short 2, 1
	.short 70, 1
	.short 254, 0

scr_seq_0085_0848:
	.short 20, 3
	.short 23, 3
	.short 70, 1
	.short 254, 0

scr_seq_0085_0858:
	.short 20, 2
	.short 23, 3
	.short 70, 1
	.short 254, 0
scr_seq_0085_0868:
	npc_msg 0
	return

scr_seq_0085_086D:
	npc_msg 3
	return

scr_seq_0085_0872:
	npc_msg 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 16, 255, 0
	scrcmd_751 17, 255, 1
	return

scr_seq_0085_0891:
	npc_msg 4
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 18, 255, 4
	return

scr_seq_0085_08A8:
	npc_msg 2
	return

scr_seq_0085_08AD:
	npc_msg 5
	return

scr_seq_0085_08B2:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4145, 0
	npc_msg 11
	call scr_seq_0085_066C
	call scr_seq_0085_08D9
	goto scr_seq_0085_0689

scr_seq_0085_08D7:
	.byte 0x02, 0x00
scr_seq_0085_08D9:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_0085_08EB:
	npc_msg 12
	scrcmd_636 16710
	comparevartovalue VAR_UNK_404F, 1
	callif eq, scr_seq_0085_0914
	comparevartovalue VAR_UNK_404F, 3
	callif eq, scr_seq_0085_091C
	goto scr_seq_0085_02F5

scr_seq_0085_0912:
	.byte 0x02, 0x00
scr_seq_0085_0914:
	setvar VAR_UNK_404F, 0
	return

scr_seq_0085_091C:
	setvar VAR_UNK_404F, 2
	return

scr_seq_0085_0924:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, scr_seq_0085_0960
	comparevartovalue VAR_UNK_4146, 1
	callif eq, scr_seq_0085_0960
	comparevartovalue VAR_UNK_404F, 1
	callif eq, scr_seq_0085_0966
	comparevartovalue VAR_UNK_404F, 3
	callif eq, scr_seq_0085_097D
	goto scr_seq_0085_02F5

scr_seq_0085_095E:
	.byte 0x02, 0x00
scr_seq_0085_0960:
	scrcmd_680 29
	return

scr_seq_0085_0966:
	npc_msg 13
	buffer_players_name 0
	npc_msg 15
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404F, 2
	return

scr_seq_0085_097D:
	npc_msg 13
	buffer_players_name 0
	npc_msg 14
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404F, 4
	callstd 2040
	return

scr_seq_0085_0998:
	goto scr_seq_0085_02F5

scr_seq_0085_099E:
	.byte 0x02, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0085_09C0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 59
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_09D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_09E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 61
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_09F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	scrcmd_076 80, 0
	npc_msg 62
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0A18:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0A2B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 64
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0A3E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 65
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0A51:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0A64:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 67
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0A77:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0FE
	gotoif FALSE, scr_seq_0085_0AFF
	scrcmd_692 1, 2, 3, 4, VAR_UNK_4054, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0085_0AD5
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0085_0AE0
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0085_0AF1
	buffer_players_name 0
	npc_msg 69
	npc_msg 70
	play_fanfare SEQ_ME_BPGET
	npc_msg 72
	wait_fanfare
	goto scr_seq_0085_0B0E

scr_seq_0085_0AD3:
	.byte 0x02, 0x00
scr_seq_0085_0AD5:
	npc_msg 68
	goto scr_seq_0085_0B0E

scr_seq_0085_0ADE:
	.byte 0x02, 0x00
scr_seq_0085_0AE0:
	buffer_players_name 0
	npc_msg 73
	npc_msg 71
	goto scr_seq_0085_0B0E

scr_seq_0085_0AEF:
	.byte 0x02
	.byte 0x00
scr_seq_0085_0AF1:
	buffer_players_name 0
	npc_msg 74
	goto scr_seq_0085_0B0E

scr_seq_0085_0AFD:
	.byte 0x02, 0x00
scr_seq_0085_0AFF:
	setflag FLAG_UNK_0FE
	npc_msg 68
	goto scr_seq_0085_0B0E

scr_seq_0085_0B0C:
	.byte 0x02, 0x00
scr_seq_0085_0B0E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0B16:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0085_0C4A
	goto scr_seq_0085_0B37

scr_seq_0085_0B35:
	.byte 0x02, 0x00
scr_seq_0085_0B37:
	buffer_players_name 0
	scrcmd_693 32773
	comparevartovalue VAR_SPECIAL_x8005, 475
	gotoif ge, scr_seq_0085_0BBE
	comparevartovalue VAR_SPECIAL_x8005, 351
	gotoif ge, scr_seq_0085_0BC9
	comparevartovalue VAR_SPECIAL_x8005, 251
	gotoif ge, scr_seq_0085_0BD4
	comparevartovalue VAR_SPECIAL_x8005, 151
	gotoif ge, scr_seq_0085_0BDF
	comparevartovalue VAR_SPECIAL_x8005, 101
	gotoif ge, scr_seq_0085_0BEA
	comparevartovalue VAR_SPECIAL_x8005, 51
	gotoif ge, scr_seq_0085_0BF5
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ge, scr_seq_0085_0C00
	comparevartovalue VAR_SPECIAL_x8005, 11
	gotoif ge, scr_seq_0085_0C0B
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ge, scr_seq_0085_0C16
	npc_msg 75
	goto scr_seq_0085_0C21

scr_seq_0085_0BBC:
	.byte 0x02, 0x00
scr_seq_0085_0BBE:
	npc_msg 84
	goto scr_seq_0085_0C21

scr_seq_0085_0BC7:
	.byte 0x02, 0x00
scr_seq_0085_0BC9:
	npc_msg 83
	goto scr_seq_0085_0C21

scr_seq_0085_0BD2:
	.byte 0x02, 0x00
scr_seq_0085_0BD4:
	npc_msg 82
	goto scr_seq_0085_0C21

scr_seq_0085_0BDD:
	.byte 0x02, 0x00
scr_seq_0085_0BDF:
	npc_msg 81
	goto scr_seq_0085_0C21

scr_seq_0085_0BE8:
	.byte 0x02, 0x00
scr_seq_0085_0BEA:
	npc_msg 80
	goto scr_seq_0085_0C21

scr_seq_0085_0BF3:
	.byte 0x02, 0x00
scr_seq_0085_0BF5:
	npc_msg 79
	goto scr_seq_0085_0C21

scr_seq_0085_0BFE:
	.byte 0x02, 0x00
scr_seq_0085_0C00:
	npc_msg 78
	goto scr_seq_0085_0C21

scr_seq_0085_0C09:
	.byte 0x02, 0x00
scr_seq_0085_0C0B:
	npc_msg 77
	goto scr_seq_0085_0C21

scr_seq_0085_0C14:
	.byte 0x02, 0x00
scr_seq_0085_0C16:
	npc_msg 76
	goto scr_seq_0085_0C21

scr_seq_0085_0C1F:
	.byte 0x02
	.byte 0x00
scr_seq_0085_0C21:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0C29:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0085_0B37
	goto scr_seq_0085_0C4A

scr_seq_0085_0C48:
	.byte 0x02, 0x00
scr_seq_0085_0C4A:
	buffer_players_name 0
	scrcmd_693 32773
	comparevartovalue VAR_SPECIAL_x8005, 475
	gotoif ge, scr_seq_0085_0CD1
	comparevartovalue VAR_SPECIAL_x8005, 351
	gotoif ge, scr_seq_0085_0CDC
	comparevartovalue VAR_SPECIAL_x8005, 251
	gotoif ge, scr_seq_0085_0CE7
	comparevartovalue VAR_SPECIAL_x8005, 151
	gotoif ge, scr_seq_0085_0CF2
	comparevartovalue VAR_SPECIAL_x8005, 101
	gotoif ge, scr_seq_0085_0CFD
	comparevartovalue VAR_SPECIAL_x8005, 51
	gotoif ge, scr_seq_0085_0D08
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ge, scr_seq_0085_0D13
	comparevartovalue VAR_SPECIAL_x8005, 11
	gotoif ge, scr_seq_0085_0D1E
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ge, scr_seq_0085_0D29
	npc_msg 85
	goto scr_seq_0085_0D34

scr_seq_0085_0CCF:
	.byte 0x02
	.byte 0x00
scr_seq_0085_0CD1:
	npc_msg 94
	goto scr_seq_0085_0D34

scr_seq_0085_0CDA:
	.byte 0x02, 0x00
scr_seq_0085_0CDC:
	npc_msg 93
	goto scr_seq_0085_0D34

scr_seq_0085_0CE5:
	.byte 0x02, 0x00
scr_seq_0085_0CE7:
	npc_msg 92
	goto scr_seq_0085_0D34

scr_seq_0085_0CF0:
	.byte 0x02, 0x00
scr_seq_0085_0CF2:
	npc_msg 91
	goto scr_seq_0085_0D34

scr_seq_0085_0CFB:
	.byte 0x02, 0x00
scr_seq_0085_0CFD:
	npc_msg 90
	goto scr_seq_0085_0D34

scr_seq_0085_0D06:
	.byte 0x02, 0x00
scr_seq_0085_0D08:
	npc_msg 89
	goto scr_seq_0085_0D34

scr_seq_0085_0D11:
	.byte 0x02, 0x00
scr_seq_0085_0D13:
	npc_msg 88
	goto scr_seq_0085_0D34

scr_seq_0085_0D1C:
	.byte 0x02, 0x00
scr_seq_0085_0D1E:
	npc_msg 87
	goto scr_seq_0085_0D34

scr_seq_0085_0D27:
	.byte 0x02, 0x00
scr_seq_0085_0D29:
	npc_msg 86
	goto scr_seq_0085_0D34

scr_seq_0085_0D32:
	.byte 0x02, 0x00
scr_seq_0085_0D34:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0085_0D3C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	copyvar VAR_TEMP_x4001, VAR_OBJ_1
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_0085_0D90
	comparevartovalue VAR_TEMP_x4001, 97
	gotoif eq, scr_seq_0085_0D9B
	comparevartovalue VAR_TEMP_x4001, 365
	gotoif eq, scr_seq_0085_0DA6
	comparevartovalue VAR_TEMP_x4001, 366
	gotoif eq, scr_seq_0085_0DB1
	comparevartovalue VAR_TEMP_x4001, 354
	gotoif eq, scr_seq_0085_0DBC
	end

scr_seq_0085_0D90:
	npc_msg 96
	goto scr_seq_0085_0DC7

scr_seq_0085_0D99:
	.byte 0x02, 0x00
scr_seq_0085_0D9B:
	npc_msg 95
	goto scr_seq_0085_0DC7

scr_seq_0085_0DA4:
	.byte 0x02, 0x00
scr_seq_0085_0DA6:
	npc_msg 97
	goto scr_seq_0085_0DC7

scr_seq_0085_0DAF:
	.byte 0x02
	.byte 0x00
scr_seq_0085_0DB1:
	npc_msg 98
	goto scr_seq_0085_0DC7

scr_seq_0085_0DBA:
	.byte 0x02, 0x00
scr_seq_0085_0DBC:
	npc_msg 99
	goto scr_seq_0085_0DC7

scr_seq_0085_0DC5:
	.byte 0x02, 0x00
scr_seq_0085_0DC7:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
