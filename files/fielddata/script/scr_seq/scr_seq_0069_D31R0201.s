#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0069_0259 ; 000
	scrdef scr_seq_0069_0BBF ; 001
	scrdef scr_seq_0069_08BC ; 002
	scrdef scr_seq_0069_0FB9 ; 003
	scrdef scr_seq_0069_059F ; 004
	scrdef scr_seq_0069_064C ; 005
	scrdef scr_seq_0069_014D ; 006
	scrdef scr_seq_0069_07D7 ; 007
	scrdef scr_seq_0069_14AD ; 008
	scrdef scr_seq_0069_1380 ; 009
	scrdef scr_seq_0069_139A ; 010
	scrdef scr_seq_0069_13B4 ; 011
	scrdef scr_seq_0069_13CE ; 012
	scrdef scr_seq_0069_1428 ; 013
	scrdef scr_seq_0069_143B ; 014
	scrdef scr_seq_0069_144E ; 015
	scrdef scr_seq_0069_1461 ; 016
	scrdef scr_seq_0069_1474 ; 017
	scrdef scr_seq_0069_1487 ; 018
	scrdef scr_seq_0069_149A ; 019
	scrdef scr_seq_0069_14AF ; 020
	scrdef scr_seq_0069_0062 ; 021
	scrdef scr_seq_0069_00AA ; 022
	scrdef scr_seq_0069_14DC ; 023
	scrdef_end

scr_seq_0069_0062:
	comparevartovalue VAR_UNK_414B, 1
	callif eq, scr_seq_0069_00A6
	comparevartovalue VAR_UNK_414B, 3
	callif eq, scr_seq_0069_00A6
	comparevartovalue VAR_UNK_414B, 255
	callif eq, scr_seq_0069_00A6
	scrcmd_415 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0069_00A0
	setflag FLAG_UNK_22F
	end

scr_seq_0069_00A0:
	clearflag FLAG_UNK_22F
	end

scr_seq_0069_00A6:
	scrcmd_521
	return

scr_seq_0069_00AA:
	comparevartovalue VAR_UNK_414B, 1
	gotoif ne, scr_seq_0069_00EF
	scrcmd_415 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0069_00F1
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0069_00F1
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0069_00F1
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0069_00F1
scr_seq_0069_00EF:
	end

scr_seq_0069_00F1:
	scrcmd_344 3, 2
	end

scr_seq_0069_00F9:
	setvar VAR_UNK_414B, 255
	setvar VAR_UNK_414D, 1
	setvar VAR_UNK_414E, 1
	setvar VAR_UNK_414C, 1
	return

scr_seq_0069_0113:
	setvar VAR_UNK_414B, 255
	setvar VAR_UNK_414D, 3
	setvar VAR_UNK_414F, 1
	setvar VAR_UNK_4150, 1
	setvar VAR_UNK_4151, 1
	return

scr_seq_0069_0133:
	setvar VAR_UNK_414B, 255
	setvar VAR_UNK_414D, 1
	setvar VAR_UNK_414E, 1
	setvar VAR_UNK_414C, 2
	return

scr_seq_0069_014D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4001, 0
	scrcmd_414 16386
	goto scr_seq_0069_0167

scr_seq_0069_0165:
	.byte 0x02, 0x00
scr_seq_0069_0167:
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4002
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_01DA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0069_01ED
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0069_0200
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0069_01CF
	npc_msg 15
	goto scr_seq_0069_01AC

scr_seq_0069_01AA:
	.byte 0x02, 0x00
scr_seq_0069_01AC:
	waitbutton
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0069_01C1
	closemsg
	releaseall
	end

scr_seq_0069_01C1:
	call scr_seq_0069_0872
	goto scr_seq_0069_0860

scr_seq_0069_01CD:
	.byte 0x02, 0x00
scr_seq_0069_01CF:
	npc_msg 89
	goto scr_seq_0069_01AC

scr_seq_0069_01D8:
	.byte 0x02, 0x00
scr_seq_0069_01DA:
	scrcmd_198 0, 20
	setvar VAR_SPECIAL_x8004, 85
	goto scr_seq_0069_0213

scr_seq_0069_01EB:
	.byte 0x02, 0x00
scr_seq_0069_01ED:
	scrcmd_198 0, 50
	setvar VAR_SPECIAL_x8004, 86
	goto scr_seq_0069_0213

scr_seq_0069_01FE:
	.byte 0x02, 0x00
scr_seq_0069_0200:
	scrcmd_198 0, 100
	setvar VAR_SPECIAL_x8004, 87
	goto scr_seq_0069_0213

scr_seq_0069_0211:
	.byte 0x02, 0x00
scr_seq_0069_0213:
	npc_msg 88
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	comparevartovalue VAR_SPECIAL_x8004, 85
	gotoif ne, scr_seq_0069_0233
	clearflag FLAG_UNK_2A9
	goto scr_seq_0069_024E

scr_seq_0069_0233:
	comparevartovalue VAR_SPECIAL_x8004, 86
	gotoif ne, scr_seq_0069_024A
	clearflag FLAG_UNK_2AA
	goto scr_seq_0069_024E

scr_seq_0069_024A:
	clearflag FLAG_UNK_2AB
scr_seq_0069_024E:
	npc_msg 15
	goto scr_seq_0069_01AC

scr_seq_0069_0257:
	.byte 0x02, 0x00
scr_seq_0069_0259:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_409
	npc_msg 0
	goto scr_seq_0069_026E

scr_seq_0069_026C:
	.byte 0x02, 0x00
scr_seq_0069_026E:
	npc_msg 1
	call scr_seq_0069_02AC
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0069_02D2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_02A1
	scrcmd_747
	goto scr_seq_0069_085B

scr_seq_0069_029F:
	.byte 0x02
	.byte 0x00
scr_seq_0069_02A1:
	npc_msg 3
	goto scr_seq_0069_026E

scr_seq_0069_02AA:
	.byte 0x02, 0x00
scr_seq_0069_02AC:
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 143, 255, 0
	scrcmd_751 144, 255, 1
	scrcmd_751 145, 255, 2
	scrcmd_752
	return

scr_seq_0069_02D2:
	npc_msg 4
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 475, 255, 0
	scrcmd_751 476, 255, 1
	scrcmd_751 94, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0069_0321
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0356
	scrcmd_747
	goto scr_seq_0069_085B

scr_seq_0069_031F:
	.byte 0x02
	.byte 0x00
scr_seq_0069_0321:
	scrcmd_410 0, 0
	goto scr_seq_0069_032F

scr_seq_0069_032D:
	.byte 0x02, 0x00
scr_seq_0069_032F:
	scrcmd_412 1, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_0383
	scrcmd_747
	scrcmd_444 91, 3, 0, 0
	goto scr_seq_0069_085E

scr_seq_0069_0354:
	.byte 0x02, 0x00
scr_seq_0069_0356:
	scrcmd_410 0, 1
	scrcmd_412 1, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_042F
	scrcmd_747
	scrcmd_444 91, 4, 0, 0
	goto scr_seq_0069_085E

scr_seq_0069_0381:
	.byte 0x02, 0x00
scr_seq_0069_0383:
	npc_msg 8
	call scr_seq_0069_0560
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_085B
	scrcmd_412 32, 0, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0546
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0069_0553
	scrcmd_412 53, 0, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	scrcmd_412 53, 1, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	scrcmd_412 53, 2, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	scrcmd_412 43, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0069_0A97
	goto scr_seq_0069_04F6

scr_seq_0069_042D:
	.byte 0x02, 0x00
scr_seq_0069_042F:
	npc_msg 8
	call scr_seq_0069_0560
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_085B
	scrcmd_412 32, 0, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0546
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0069_0553
	scrcmd_412 53, 0, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	scrcmd_412 53, 1, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	scrcmd_412 53, 2, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	scrcmd_412 53, 3, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	scrcmd_412 43, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0069_0A97
	goto scr_seq_0069_04F6

scr_seq_0069_04F4:
	.byte 0x02, 0x00
scr_seq_0069_04F6:
	call scr_seq_0069_00F9
	scrcmd_412 5, 0, 0
	heal_party
	call scr_seq_0069_053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0855
	scrcmd_815 0
	scrcmd_412 57, 0, 32780
	scrcmd_412 52, 0, 0
	npc_msg 11
	scrcmd_049
	goto scr_seq_0069_06CD

scr_seq_0069_0538:
	.byte 0x02, 0x00
scr_seq_0069_053A:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	return

scr_seq_0069_0546:
	npc_msg 9
	scrcmd_747
	goto scr_seq_0069_085B

scr_seq_0069_0551:
	.byte 0x02, 0x00
scr_seq_0069_0553:
	npc_msg 10
	scrcmd_747
	goto scr_seq_0069_085B

scr_seq_0069_055E:
	.byte 0x02, 0x00
scr_seq_0069_0560:
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_412 30, 0, 0
	scrcmd_412 31, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0069_058F
	scrcmd_815 0
scr_seq_0069_058F:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_0069_059F:
	scrcmd_609
	lockall
	setvar VAR_UNK_414B, 0
	scrcmd_412 4, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_064C
	npc_msg 16
	scrcmd_410 1, 65535
	scrcmd_412 43, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0069_05FD
	call scr_seq_0069_0133
	scrcmd_412 5, 0, 0
	call scr_seq_0069_0817
	npc_msg 11
	scrcmd_049
	goto scr_seq_0069_06CD

scr_seq_0069_05FB:
	.byte 0x02, 0x00
scr_seq_0069_05FD:
	call scr_seq_0069_062C
	scrcmd_412 5, 0, 0
	call scr_seq_0069_0817
	scrcmd_412 51, 0, 32780
	copyvar VAR_TEMP_x4009, VAR_SPECIAL_x800C
	npc_msg 32
	scrcmd_049
	goto scr_seq_0069_06CD

scr_seq_0069_062A:
	.byte 0x02, 0x00
scr_seq_0069_062C:
	setvar VAR_UNK_414B, 255
	setvar VAR_UNK_414D, 2
	setvar VAR_UNK_414F, 1
	setvar VAR_UNK_4150, 2
	setvar VAR_UNK_4151, 0
	return

scr_seq_0069_064C:
	scrcmd_609
	lockall
	npc_msg 19
	scrcmd_412 14, 0, 32780
	comparevartovalue VAR_UNK_404D, 1
	callif eq, scr_seq_0069_068A
	comparevartovalue VAR_UNK_404D, 3
	callif eq, scr_seq_0069_0692
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0069_069A
	goto scr_seq_0069_0855

scr_seq_0069_0688:
	.byte 0x02, 0x00
scr_seq_0069_068A:
	setvar VAR_UNK_404D, 0
	return

scr_seq_0069_0692:
	setvar VAR_UNK_404D, 2
	return

scr_seq_0069_069A:
	scrcmd_412 9, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0855
	scrcmd_412 10, 0, 32780
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_198 0, 32768
	npc_msg 65
	goto scr_seq_0069_0855

scr_seq_0069_06CB:
	.byte 0x02, 0x00
scr_seq_0069_06CD:
	closemsg
	scrcmd_412 43, 0, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0069_0733
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0069_0733
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0069_074D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0069_0767
	goto scr_seq_0069_0719

scr_seq_0069_0717:
	.byte 0x02, 0x00
scr_seq_0069_0719:
	setvar VAR_TEMP_x4002, 0
	setvar VAR_TEMP_x4003, 15
	call scr_seq_0069_078F
	goto scr_seq_0069_0829

scr_seq_0069_0731:
	.byte 0x02, 0x00
scr_seq_0069_0733:
	setvar VAR_TEMP_x4002, 2
	setvar VAR_TEMP_x4003, 19
	call scr_seq_0069_078F
	goto scr_seq_0069_0829

scr_seq_0069_074B:
	.byte 0x02, 0x00
scr_seq_0069_074D:
	setvar VAR_TEMP_x4002, 1
	setvar VAR_TEMP_x4003, 11
	call scr_seq_0069_078F
	goto scr_seq_0069_07CF

scr_seq_0069_0765:
	.byte 0x02, 0x00
scr_seq_0069_0767:
	setvar VAR_TEMP_x4002, 1
	setvar VAR_TEMP_x4003, 11
	call scr_seq_0069_078F
	goto scr_seq_0069_0781

scr_seq_0069_077F:
	.byte 0x02
	.byte 0x00
scr_seq_0069_0781:
	setvar VAR_UNK_414D, 2
	goto scr_seq_0069_0829

scr_seq_0069_078D:
	.byte 0x02, 0x00
scr_seq_0069_078F:
	apply_movement VAR_TEMP_x4002, scr_seq_0069_1348
	apply_movement 255, scr_seq_0069_1360
	wait_movement
	scrcmd_307 0, 0, 16387, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement VAR_TEMP_x4002, scr_seq_0069_1354
	apply_movement 255, scr_seq_0069_136C
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_0069_07CF:
	goto scr_seq_0069_0829

scr_seq_0069_07D5:
	.byte 0x02, 0x00
scr_seq_0069_07D7:
	scrcmd_609
	lockall
	call scr_seq_0069_0807
	scrcmd_412 100, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_085B
	npc_msg 56
	call scr_seq_0069_0817
	goto scr_seq_0069_0855

scr_seq_0069_0805:
	.byte 0x02, 0x00
scr_seq_0069_0807:
	call scr_seq_0069_0890
	scrcmd_412 6, 0, 0
	return

scr_seq_0069_0817:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_0069_0829:
	scrcmd_420 59
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 266, 0, 3, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0069_0855:
	call scr_seq_0069_0872
scr_seq_0069_085B:
	npc_msg 2
scr_seq_0069_085E:
	waitbutton
scr_seq_0069_0860:
	closemsg
	call scr_seq_0069_088C
	call scr_seq_0069_0890
	releaseall
	end

scr_seq_0069_0872:
	scrcmd_412 6, 0, 0
	call scr_seq_0069_0882
	return

scr_seq_0069_0882:
	scrcmd_412 3, 0, 0
	return

scr_seq_0069_088C:
	scrcmd_411
	return

scr_seq_0069_0890:
	setvar VAR_UNK_414B, 0
	setvar VAR_UNK_414D, 0
	setvar VAR_UNK_414E, 0
	setvar VAR_UNK_414F, 0
	setvar VAR_UNK_414C, 0
	setvar VAR_UNK_4150, 0
	setvar VAR_UNK_4151, 0
	return

scr_seq_0069_08BC:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_409
	scrcmd_412 12, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_09F7
	npc_msg 36
	goto scr_seq_0069_08E6

scr_seq_0069_08E4:
	.byte 0x02, 0x00
scr_seq_0069_08E6:
	scrcmd_412 15, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_0974
	goto scr_seq_0069_0903

scr_seq_0069_0901:
	.byte 0x02, 0x00
scr_seq_0069_0903:
	npc_msg 37
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 143, 255, 0
	scrcmd_751 155, 255, 1
	scrcmd_751 144, 255, 2
	scrcmd_751 145, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0069_0B97
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0B46
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0069_0969
	scrcmd_747
	goto scr_seq_0069_085B

scr_seq_0069_0967:
	.byte 0x02, 0x00
scr_seq_0069_0969:
	npc_msg 38
	goto scr_seq_0069_08E6

scr_seq_0069_0972:
	.byte 0x02, 0x00
scr_seq_0069_0974:
	npc_msg 37
	call scr_seq_0069_09C1
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0069_0B97
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0B46
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0069_0BA5
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0069_0969
	scrcmd_747
	goto scr_seq_0069_085B

scr_seq_0069_09BF:
	.byte 0x02
	.byte 0x00
scr_seq_0069_09C1:
	scrcmd_746
	scrcmd_749 12, 7, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 143, 255, 0
	scrcmd_751 153, 255, 1
	scrcmd_751 154, 255, 2
	scrcmd_751 144, 255, 3
	scrcmd_751 145, 255, 4
	scrcmd_752
	return

scr_seq_0069_09F7:
	npc_msg 61
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_08E6
	call scr_seq_0069_053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_085B
	scrcmd_815 0
	call scr_seq_0069_0A42
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0069_085B
	npc_msg 60
	goto scr_seq_0069_085B

scr_seq_0069_0A40:
	.byte 0x02, 0x00
scr_seq_0069_0A42:
	closemsg
	setvar VAR_TEMP_x4001, 1
	call scr_seq_0069_0A52
	return

scr_seq_0069_0A52:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_166 16384
	scrcmd_412 16, 16385, 16384
	copyvar VAR_TEMP_x4001, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_0069_0A81
	scrcmd_815 0
scr_seq_0069_0A81:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4001
	return

scr_seq_0069_0A97:
	heal_party
	call scr_seq_0069_053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0855
	call scr_seq_0069_00F9
	scrcmd_412 5, 0, 0
	heal_party
	closemsg
	setvar VAR_TEMP_x4001, 0
	call scr_seq_0069_0A52
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0069_0855
	goto scr_seq_0069_0ADF

scr_seq_0069_0ADD:
	.byte 0x02, 0x00
scr_seq_0069_0ADF:
	npc_msg 47
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_06CD
	npc_msg 48
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_0ADF
	setvar VAR_UNK_414B, 2
	scrcmd_412 39, 0, 0
	scrcmd_411
	npc_msg 56
	call scr_seq_0069_0817
	scrcmd_348 30
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_412 2, 0, 0
	releaseall
	end

scr_seq_0069_0B46:
	call scr_seq_0069_053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_085B
	closemsg
	setvar VAR_TEMP_x4001, 2
	scrcmd_815 0
	call scr_seq_0069_0A52
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0069_085B
	scrcmd_418 32772, 32773
	scrcmd_198 0, 32772
	scrcmd_541 1, 32773, 2, 3
	npc_msg 52
	scrcmd_049
	goto scr_seq_0069_0860

scr_seq_0069_0B95:
	.byte 0x02, 0x00
scr_seq_0069_0B97:
	scrcmd_410 0, 4
	goto scr_seq_0069_032F

scr_seq_0069_0BA3:
	.byte 0x02, 0x00
scr_seq_0069_0BA5:
	scrcmd_410 0, 5
	goto scr_seq_0069_032F

scr_seq_0069_0BB1:
	.byte 0x02, 0x00
scr_seq_0069_0BB3:
	apply_movement 255, scr_seq_0069_1378
	wait_movement
	return

scr_seq_0069_0BBF:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_409
	npc_msg 20
	goto scr_seq_0069_0BD4

scr_seq_0069_0BD2:
	.byte 0x02, 0x00
scr_seq_0069_0BD4:
	npc_msg 21
	call scr_seq_0069_02AC
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0069_0C12
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0C07
	scrcmd_747
	goto scr_seq_0069_085B

scr_seq_0069_0C05:
	.byte 0x02, 0x00
scr_seq_0069_0C07:
	npc_msg 23
	goto scr_seq_0069_0BD4

scr_seq_0069_0C10:
	.byte 0x02, 0x00
scr_seq_0069_0C12:
	scrcmd_412 1, 2, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_0C39
	scrcmd_747
	scrcmd_444 91, 2, 0, 0
	goto scr_seq_0069_085E

scr_seq_0069_0C37:
	.byte 0x02, 0x00
scr_seq_0069_0C39:
	npc_msg 26
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0C69
	goto scr_seq_0069_0C55

scr_seq_0069_0C53:
	.byte 0x02, 0x00
scr_seq_0069_0C55:
	scrcmd_410 0, 2
	setvar VAR_TEMP_x4001, 0
	goto scr_seq_0069_0C7D

scr_seq_0069_0C67:
	.byte 0x02, 0x00
scr_seq_0069_0C69:
	scrcmd_410 0, 3
	setvar VAR_TEMP_x4001, 1
	goto scr_seq_0069_0C7D

scr_seq_0069_0C7B:
	.byte 0x02, 0x00
scr_seq_0069_0C7D:
	npc_msg 8
	call scr_seq_0069_0560
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_085B
	scrcmd_412 32, 0, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0546
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0069_0553
	scrcmd_412 53, 0, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	scrcmd_412 53, 1, 32780
	scrcmd_690 32780, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0069_14C8
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0069_0D40
	call scr_seq_0069_0113
	scrcmd_412 5, 0, 0
	heal_party
	call scr_seq_0069_053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0855
	scrcmd_815 0
	scrcmd_412 57, 0, 32780
	scrcmd_412 52, 0, 0
	npc_msg 35
	goto scr_seq_0069_06CD

scr_seq_0069_0D3E:
	.byte 0x02, 0x00
scr_seq_0069_0D40:
	heal_party
	call scr_seq_0069_053A
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0855
scr_seq_0069_0D55:
	npc_msg 27
	scrcmd_746
	scrcmd_749 18, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0069_0DA6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0DFE
	scrcmd_747
	goto scr_seq_0069_0855

scr_seq_0069_0DA4:
	.byte 0x02, 0x00
scr_seq_0069_0DA6:
	npc_msg 112
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_0D55
	scrcmd_747
	closemsg
	scrcmd_226 16, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_0DEC
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0069_0DF4
	goto scr_seq_0069_0E56

scr_seq_0069_0DEA:
	.byte 0x02, 0x00
scr_seq_0069_0DEC:
	goto scr_seq_0069_0D55

scr_seq_0069_0DF2:
	.byte 0x02, 0x00
scr_seq_0069_0DF4:
	scrcmd_283
	goto scr_seq_0069_0D55

scr_seq_0069_0DFC:
	.byte 0x02, 0x00
scr_seq_0069_0DFE:
	npc_msg 112
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_0D55
	scrcmd_747
	closemsg
	scrcmd_227 16, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_0E44
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0069_0E4C
	goto scr_seq_0069_0E56

scr_seq_0069_0E42:
	.byte 0x02, 0x00
scr_seq_0069_0E44:
	goto scr_seq_0069_0D55

scr_seq_0069_0E4A:
	.byte 0x02, 0x00
scr_seq_0069_0E4C:
	scrcmd_283
	goto scr_seq_0069_0D55

scr_seq_0069_0E54:
	.byte 0x02, 0x00
scr_seq_0069_0E56:
	scrcmd_258
	scrcmd_257 1
	scrcmd_412 58, 0, 0
	goto scr_seq_0069_0E6C

scr_seq_0069_0E6A:
	.byte 0x02, 0x00
scr_seq_0069_0E6C:
	scrcmd_416 0, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0E6C
	scrcmd_417 0, 16384
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0069_0EE1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0069_0EFF
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0069_0F1D
	scrcmd_258
	scrcmd_257 2
	scrcmd_412 57, 0, 32772
	scrcmd_451 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0F84
	scrcmd_417 1, 16384
	goto scr_seq_0069_0F52

scr_seq_0069_0EDF:
	.byte 0x02
	.byte 0x00
scr_seq_0069_0EE1:
	call scr_seq_0069_0F48
	scrcmd_412 53, 0, 32780
	scrcmd_193 0, 32780
	npc_msg 33
	goto scr_seq_0069_0855

scr_seq_0069_0EFD:
	.byte 0x02, 0x00
scr_seq_0069_0EFF:
	call scr_seq_0069_0F48
	scrcmd_412 53, 1, 32780
	scrcmd_193 0, 32780
	npc_msg 33
	goto scr_seq_0069_0855

scr_seq_0069_0F1B:
	.byte 0x02, 0x00
scr_seq_0069_0F1D:
	call scr_seq_0069_0F48
	scrcmd_412 53, 0, 32780
	scrcmd_193 0, 32780
	scrcmd_412 53, 1, 32780
	scrcmd_193 1, 32780
	npc_msg 34
	goto scr_seq_0069_0855

scr_seq_0069_0F46:
	.byte 0x02, 0x00
scr_seq_0069_0F48:
	scrcmd_258
	scrcmd_257 8
	scrcmd_283
	return

scr_seq_0069_0F52:
	call scr_seq_0069_0113
	scrcmd_412 5, 0, 0
	heal_party
	npc_msg 69
	call scr_seq_0069_0817
	scrcmd_702
	npc_msg 32
	wait 30, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 3
	goto scr_seq_0069_06CD

scr_seq_0069_0F82:
	.byte 0x02, 0x00
scr_seq_0069_0F84:
	scrcmd_412 52, 0, 0
	scrcmd_412 58, 0, 0
	goto scr_seq_0069_0F9C

scr_seq_0069_0F9A:
	.byte 0x02, 0x00
scr_seq_0069_0F9C:
	scrcmd_416 1, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0F9C
	goto scr_seq_0069_0F52

scr_seq_0069_0FB7:
	.byte 0x02, 0x00
scr_seq_0069_0FB9:
	scrcmd_609
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	call scr_seq_0069_0807
	scrcmd_412 100, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_085B
	scrcmd_412 35, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_107A
	goto scr_seq_0069_1001

scr_seq_0069_0FFF:
	.byte 0x02
	.byte 0x00
scr_seq_0069_1001:
	npc_msg 53
	scrcmd_412 43, 0, 32780
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0069_104F
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0069_12B6
	scrcmd_412 49, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_0069_106F
	goto scr_seq_0069_104F

scr_seq_0069_104D:
	.byte 0x02, 0x00
scr_seq_0069_104F:
	npc_msg 56
	call scr_seq_0069_0817
	closemsg
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0069_1286
	goto scr_seq_0069_0855

scr_seq_0069_106D:
	.byte 0x02, 0x00
scr_seq_0069_106F:
	npc_msg 73
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	return

scr_seq_0069_107A:
	scrcmd_412 43, 0, 32780
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0069_1268
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0069_118D
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0069_10E6
	scrcmd_412 49, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0069_10D2
	call scr_seq_0069_1263
	goto scr_seq_0069_1273

scr_seq_0069_10D0:
	.byte 0x02, 0x00
scr_seq_0069_10D2:
	npc_msg 12
	npc_msg 73
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	goto scr_seq_0069_1273

scr_seq_0069_10E4:
	.byte 0x02, 0x00
scr_seq_0069_10E6:
	npc_msg 12
	scrcmd_412 54, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_115A
	goto scr_seq_0069_1106

scr_seq_0069_1104:
	.byte 0x02, 0x00
scr_seq_0069_1106:
	scrcmd_412 10, 0, 32780
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	buffer_players_name 0
	scrcmd_198 1, 16384
	npc_msg 55
	goto scr_seq_0069_1127

scr_seq_0069_1125:
	.byte 0x02, 0x00
scr_seq_0069_1127:
	scrcmd_412 49, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_12F1
	goto scr_seq_0069_1144

scr_seq_0069_1142:
	.byte 0x02, 0x00
scr_seq_0069_1144:
	scrcmd_198 0, 16384
	npc_msg 70
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	goto scr_seq_0069_12F1

scr_seq_0069_1158:
	.byte 0x02, 0x00
scr_seq_0069_115A:
	scrcmd_412 49, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_12F1
	goto scr_seq_0069_1177

scr_seq_0069_1175:
	.byte 0x02, 0x00
scr_seq_0069_1177:
	scrcmd_198 0, 16384
	npc_msg 132
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	goto scr_seq_0069_12F1

scr_seq_0069_118B:
	.byte 0x02, 0x00
scr_seq_0069_118D:
	scrcmd_412 45, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_11AA
	goto scr_seq_0069_11F1

scr_seq_0069_11A8:
	.byte 0x02, 0x00
scr_seq_0069_11AA:
	call scr_seq_0069_1263
	goto scr_seq_0069_11B8

scr_seq_0069_11B6:
	.byte 0x02, 0x00
scr_seq_0069_11B8:
	npc_msg 14
	call scr_seq_0069_0817
	scrcmd_414 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0855
	npc_msg 113
	closemsg
	copyvar VAR_TEMP_x4002, VAR_SPECIAL_x800C
	setvar VAR_TEMP_x4001, 1
	call scr_seq_0069_0BB3
	goto scr_seq_0069_0167

scr_seq_0069_11EF:
	.byte 0x02
	.byte 0x00
scr_seq_0069_11F1:
	comparevartovalue VAR_UNK_404D, 1
	callif eq, scr_seq_0069_1231
	comparevartovalue VAR_UNK_404D, 3
	callif eq, scr_seq_0069_1248
	scrcmd_412 48, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_11B8
	npc_msg 84
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	goto scr_seq_0069_11B8

scr_seq_0069_122F:
	.byte 0x02
	.byte 0x00
scr_seq_0069_1231:
	npc_msg 85
	buffer_players_name 0
	npc_msg 87
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404D, 2
	return

scr_seq_0069_1248:
	npc_msg 85
	buffer_players_name 0
	npc_msg 86
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404D, 4
	callstd 2040
	return

scr_seq_0069_1263:
	npc_msg 12
	return

scr_seq_0069_1268:
	npc_msg 54
	goto scr_seq_0069_1273

scr_seq_0069_1271:
	.byte 0x02, 0x00
scr_seq_0069_1273:
	npc_msg 14
	call scr_seq_0069_0817
	closemsg
	goto scr_seq_0069_0855

scr_seq_0069_1284:
	.byte 0x02, 0x00
scr_seq_0069_1286:
	scrcmd_414 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_0855
	npc_msg 113
	closemsg
	copyvar VAR_TEMP_x4002, VAR_SPECIAL_x800C
	setvar VAR_TEMP_x4001, 1
	call scr_seq_0069_0BB3
	goto scr_seq_0069_0167

scr_seq_0069_12B4:
	.byte 0x02, 0x00
scr_seq_0069_12B6:
	scrcmd_412 9, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_12D3
	goto scr_seq_0069_12F1

scr_seq_0069_12D1:
	.byte 0x02, 0x00
scr_seq_0069_12D3:
	scrcmd_412 10, 0, 32780
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_198 0, 32768
	npc_msg 65
	goto scr_seq_0069_12F1

scr_seq_0069_12EF:
	.byte 0x02
	.byte 0x00
scr_seq_0069_12F1:
	scrcmd_412 11, 1, 0
	goto scr_seq_0069_1301

scr_seq_0069_12FF:
	.byte 0x02
	.byte 0x00
scr_seq_0069_1301:
	call scr_seq_0069_0872
	npc_msg 56
	call scr_seq_0069_0817
	npc_msg 57
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0069_085B
	call scr_seq_0069_0A42
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0069_085B
	npc_msg 60
	goto scr_seq_0069_085B

scr_seq_0069_1344:
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_0069_1348:
	.short 62, 1
	.short 12, 2
	.short 254, 0

scr_seq_0069_1354:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_0069_1360:
	.short 62, 1
	.short 12, 2
	.short 254, 0

scr_seq_0069_136C:
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_0069_1378:
	.short 3, 1
	.short 254, 0
scr_seq_0069_1380:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	call scr_seq_0069_1404
	end

scr_seq_0069_139A:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 1
	call scr_seq_0069_1404
	end

scr_seq_0069_13B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 2
	call scr_seq_0069_1404
	end

scr_seq_0069_13CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_419 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0069_13F9
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8001, 0
	call scr_seq_0069_1404
	end

scr_seq_0069_13F9:
	npc_msg 111
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_1404:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_408 32768, 32769
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	return

scr_seq_0069_1428:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 74
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_143B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 75
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_144E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 76
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_1461:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 77
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_1474:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 78
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_1487:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 79
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_149A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 80
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_14AD:
	end

scr_seq_0069_14AF:
	scrcmd_076 25, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 81
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_14C8:
	scrcmd_747
	call scr_seq_0069_088C
	call scr_seq_0069_0890
	callstd 2041
	end

scr_seq_0069_14DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_14F
	callif FALSE, scr_seq_0069_158E
	checkflag FLAG_UNK_14F
	callif TRUE, scr_seq_0069_1593
	setflag FLAG_UNK_14F
	goto scr_seq_0069_1506

scr_seq_0069_1504:
	.byte 0x02, 0x00
scr_seq_0069_1506:
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0069_1645
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif eq, scr_seq_0069_1598
	scrcmd_657 32768, 32769, 32770, 32771
	comparevartovalue VAR_SPECIAL_x8001, 90
	gotoif le, scr_seq_0069_15E5
	comparevartovalue VAR_SPECIAL_x8001, 120
	gotoif le, scr_seq_0069_15F0
	comparevartovalue VAR_SPECIAL_x8001, 150
	gotoif le, scr_seq_0069_15FB
	comparevartovalue VAR_SPECIAL_x8001, 151
	gotoif ge, scr_seq_0069_1606
	end

scr_seq_0069_158E:
	npc_msg 114
	return

scr_seq_0069_1593:
	npc_msg 115
	return

scr_seq_0069_1598:
	npc_msg 117
	goto scr_seq_0069_1506

scr_seq_0069_15A1:
	.byte 0x02, 0x00
scr_seq_0069_15A3:
	scrcmd_046 VAR_SPECIAL_x8002
	goto scr_seq_0069_15AF

scr_seq_0069_15AD:
	.byte 0x02, 0x00
scr_seq_0069_15AF:
	comparevartovalue VAR_SPECIAL_x8003, 15
	gotoif le, scr_seq_0069_1611
	comparevartovalue VAR_SPECIAL_x8003, 25
	gotoif le, scr_seq_0069_161C
	comparevartovalue VAR_SPECIAL_x8003, 30
	gotoif le, scr_seq_0069_1627
	comparevartovalue VAR_SPECIAL_x8003, 31
	gotoif ge, scr_seq_0069_1632
	end

scr_seq_0069_15E5:
	npc_msg 118
	goto scr_seq_0069_15A3

scr_seq_0069_15EE:
	.byte 0x02, 0x00
scr_seq_0069_15F0:
	npc_msg 119
	goto scr_seq_0069_15A3

scr_seq_0069_15F9:
	.byte 0x02, 0x00
scr_seq_0069_15FB:
	npc_msg 120
	goto scr_seq_0069_15A3

scr_seq_0069_1604:
	.byte 0x02, 0x00
scr_seq_0069_1606:
	npc_msg 121
	goto scr_seq_0069_15A3

scr_seq_0069_160F:
	.byte 0x02
	.byte 0x00
scr_seq_0069_1611:
	npc_msg 128
	goto scr_seq_0069_163D

scr_seq_0069_161A:
	.byte 0x02, 0x00
scr_seq_0069_161C:
	npc_msg 129
	goto scr_seq_0069_163D

scr_seq_0069_1625:
	.byte 0x02, 0x00
scr_seq_0069_1627:
	npc_msg 130
	goto scr_seq_0069_163D

scr_seq_0069_1630:
	.byte 0x02, 0x00
scr_seq_0069_1632:
	npc_msg 131
	goto scr_seq_0069_163D

scr_seq_0069_163B:
	.byte 0x02, 0x00
scr_seq_0069_163D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0069_1645:
	npc_msg 116
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
