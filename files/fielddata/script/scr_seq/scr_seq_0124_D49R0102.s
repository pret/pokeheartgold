#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0124_0046 ; 000
	scrdef scr_seq_0124_03F0 ; 001
	scrdef scr_seq_0124_0422 ; 002
	scrdef scr_seq_0124_0454 ; 003
	scrdef scr_seq_0124_0486 ; 004
	scrdef scr_seq_0124_04B8 ; 005
	scrdef scr_seq_0124_04EA ; 006
	scrdef scr_seq_0124_051C ; 007
	scrdef scr_seq_0124_054F ; 008
	scrdef scr_seq_0124_0581 ; 009
	scrdef scr_seq_0124_05B0 ; 010
	scrdef scr_seq_0124_0620 ; 011
	scrdef scr_seq_0124_0652 ; 012
	scrdef scr_seq_0124_0684 ; 013
	scrdef scr_seq_0124_06B6 ; 014
	scrdef scr_seq_0124_06F0 ; 015
	scrdef scr_seq_0124_072A ; 016
	scrdef_end

scr_seq_0124_0046:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_074 2147
	callstd 2036
	checkflag FLAG_UNK_0FA
	gotoif FALSE, scr_seq_0124_006A
	npc_msg 1
	goto scr_seq_0124_0071

scr_seq_0124_006A:
	npc_msg 0
	setflag FLAG_UNK_0FA
scr_seq_0124_0071:
	npc_msg 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 272, 255, 0
	scrcmd_751 296, 255, 1
	scrcmd_751 297, 255, 2
	scrcmd_751 12, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0124_03C5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0124_00D5
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0124_03D0
	goto scr_seq_0124_03DB

scr_seq_0124_00D3:
	.byte 0x02, 0x00
scr_seq_0124_00D5:
	npc_msg 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 308, 255, 0
	scrcmd_751 309, 255, 1
	scrcmd_751 310, 255, 2
	scrcmd_751 311, 255, 3
	scrcmd_751 312, 255, 4
	scrcmd_751 13, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0124_0071
	npc_msg 4
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0124_0166
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0124_01A0
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0124_01DA
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0124_0214
	goto scr_seq_0124_024E

scr_seq_0124_0164:
	.byte 0x02, 0x00
scr_seq_0124_0166:
	setvar VAR_TEMP_x4007, 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 298, 255, 0
	scrcmd_751 299, 255, 1
	scrcmd_751 304, 255, 6
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0124_0288

scr_seq_0124_019E:
	.byte 0x02, 0x00
scr_seq_0124_01A0:
	setvar VAR_TEMP_x4007, 1
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 301, 255, 3
	scrcmd_751 300, 255, 2
	scrcmd_751 307, 255, 9
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0124_0288

scr_seq_0124_01D8:
	.byte 0x02, 0x00
scr_seq_0124_01DA:
	setvar VAR_TEMP_x4007, 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 306, 255, 8
	scrcmd_751 307, 255, 9
	scrcmd_751 299, 255, 1
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0124_0288

scr_seq_0124_0212:
	.byte 0x02, 0x00
scr_seq_0124_0214:
	setvar VAR_TEMP_x4007, 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 305, 255, 7
	scrcmd_751 304, 255, 6
	scrcmd_751 301, 255, 3
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0124_0288

scr_seq_0124_024C:
	.byte 0x02, 0x00
scr_seq_0124_024E:
	setvar VAR_TEMP_x4007, 4
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 303, 255, 5
	scrcmd_751 302, 255, 4
	scrcmd_751 298, 255, 0
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0124_0288

scr_seq_0124_0286:
	.byte 0x02, 0x00
scr_seq_0124_0288:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0124_0318
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0124_0323
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0124_032E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0124_0339
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0124_0344
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0124_034F
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0124_035A
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0124_0365
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_0124_0370
	comparevartovalue VAR_SPECIAL_x8008, 9
	gotoif eq, scr_seq_0124_037B
	goto scr_seq_0124_00D5

scr_seq_0124_0316:
	.byte 0x02, 0x00
scr_seq_0124_0318:
	npc_msg 6
	goto scr_seq_0124_0386

scr_seq_0124_0321:
	.byte 0x02, 0x00
scr_seq_0124_0323:
	npc_msg 7
	goto scr_seq_0124_0386

scr_seq_0124_032C:
	.byte 0x02, 0x00
scr_seq_0124_032E:
	npc_msg 8
	goto scr_seq_0124_0386

scr_seq_0124_0337:
	.byte 0x02, 0x00
scr_seq_0124_0339:
	npc_msg 9
	goto scr_seq_0124_0386

scr_seq_0124_0342:
	.byte 0x02, 0x00
scr_seq_0124_0344:
	npc_msg 10
	goto scr_seq_0124_0386

scr_seq_0124_034D:
	.byte 0x02, 0x00
scr_seq_0124_034F:
	npc_msg 11
	goto scr_seq_0124_0386

scr_seq_0124_0358:
	.byte 0x02, 0x00
scr_seq_0124_035A:
	npc_msg 12
	goto scr_seq_0124_0386

scr_seq_0124_0363:
	.byte 0x02, 0x00
scr_seq_0124_0365:
	npc_msg 13
	goto scr_seq_0124_0386

scr_seq_0124_036E:
	.byte 0x02, 0x00
scr_seq_0124_0370:
	npc_msg 14
	goto scr_seq_0124_0386

scr_seq_0124_0379:
	.byte 0x02, 0x00
scr_seq_0124_037B:
	npc_msg 15
	goto scr_seq_0124_0386

scr_seq_0124_0384:
	.byte 0x02, 0x00
scr_seq_0124_0386:
	npc_msg 4
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, scr_seq_0124_0166
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_0124_01A0
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, scr_seq_0124_01DA
	comparevartovalue VAR_TEMP_x4007, 3
	gotoif eq, scr_seq_0124_0214
	goto scr_seq_0124_024E

scr_seq_0124_03C3:
	.byte 0x02, 0x00
scr_seq_0124_03C5:
	npc_msg 5
	goto scr_seq_0124_0071

scr_seq_0124_03CE:
	.byte 0x02, 0x00
scr_seq_0124_03D0:
	npc_msg 17
	goto scr_seq_0124_0071

scr_seq_0124_03D9:
	.byte 0x02, 0x00
scr_seq_0124_03DB:
	npc_msg 16
	waitbutton
	closemsg
	scrcmd_747
	scrcmd_081 0
	reset_bgm
	scrcmd_726
	releaseall
	end

scr_seq_0124_03F0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 500
	gotoif lt, scr_seq_0124_0417
	buffer_players_name 0
	npc_msg 25
	goto scr_seq_0124_041A

scr_seq_0124_0417:
	npc_msg 24
scr_seq_0124_041A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_0422:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 51
	gotoif lt, scr_seq_0124_0449
	buffer_players_name 0
	npc_msg 27
	goto scr_seq_0124_044C

scr_seq_0124_0449:
	npc_msg 26
scr_seq_0124_044C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_0454:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 150
	gotoif lt, scr_seq_0124_047B
	buffer_players_name 0
	npc_msg 29
	goto scr_seq_0124_047E

scr_seq_0124_047B:
	npc_msg 28
scr_seq_0124_047E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_0486:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif lt, scr_seq_0124_04AD
	buffer_players_name 0
	npc_msg 31
	goto scr_seq_0124_04B0

scr_seq_0124_04AD:
	npc_msg 30
scr_seq_0124_04B0:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_04B8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 10001
	gotoif lt, scr_seq_0124_04DF
	buffer_players_name 0
	npc_msg 33
	goto scr_seq_0124_04E2

scr_seq_0124_04DF:
	npc_msg 32
scr_seq_0124_04E2:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_04EA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 75
	gotoif lt, scr_seq_0124_0511
	buffer_players_name 0
	npc_msg 35
	goto scr_seq_0124_0514

scr_seq_0124_0511:
	npc_msg 34
scr_seq_0124_0514:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_051C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 26
	gotoif lt, scr_seq_0124_0544
	buffer_players_name 0
	gender_msgbox 37, 38
	goto scr_seq_0124_0547

scr_seq_0124_0544:
	npc_msg 36
scr_seq_0124_0547:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_054F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 20001
	gotoif lt, scr_seq_0124_0576
	buffer_players_name 0
	npc_msg 40
	goto scr_seq_0124_0579

scr_seq_0124_0576:
	npc_msg 39
scr_seq_0124_0579:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_0581:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, scr_seq_0124_05A5
	npc_msg 43
	goto scr_seq_0124_05A8

scr_seq_0124_05A5:
	npc_msg 41
scr_seq_0124_05A8:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_05B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, scr_seq_0124_05D7
	buffer_players_name 0
	npc_msg 46
	goto scr_seq_0124_05DA

scr_seq_0124_05D7:
	npc_msg 45
scr_seq_0124_05DA:
	closemsg
	apply_movement 13, scr_seq_0124_0610
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, scr_seq_0124_05FC
	npc_msg 44
	goto scr_seq_0124_05FF

scr_seq_0124_05FC:
	npc_msg 42
scr_seq_0124_05FF:
	closemsg
	apply_movement 13, scr_seq_0124_0618
	wait_movement
	releaseall
	end

scr_seq_0124_060F:
	.byte 0x00

scr_seq_0124_0610:
	.short 35, 1
	.short 254, 0

scr_seq_0124_0618:
	.short 32, 1
	.short 254, 0
scr_seq_0124_0620:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 201
	gotoif lt, scr_seq_0124_0647
	buffer_players_name 0
	npc_msg 48
	goto scr_seq_0124_064A

scr_seq_0124_0647:
	npc_msg 47
scr_seq_0124_064A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_0652:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 250
	gotoif lt, scr_seq_0124_0679
	buffer_players_name 0
	npc_msg 50
	goto scr_seq_0124_067C

scr_seq_0124_0679:
	npc_msg 49
scr_seq_0124_067C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_0684:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 101
	gotoif lt, scr_seq_0124_06AB
	buffer_players_name 0
	npc_msg 52
	goto scr_seq_0124_06AE

scr_seq_0124_06AB:
	npc_msg 51
scr_seq_0124_06AE:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_06B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	scrcmd_076 19, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, scr_seq_0124_06E3
	buffer_players_name 0
	npc_msg 19
	goto scr_seq_0124_06E6

scr_seq_0124_06E3:
	npc_msg 18
scr_seq_0124_06E6:
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_06F0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	scrcmd_076 66, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, scr_seq_0124_071D
	buffer_players_name 0
	npc_msg 21
	goto scr_seq_0124_0720

scr_seq_0124_071D:
	npc_msg 20
scr_seq_0124_0720:
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0124_072A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	scrcmd_076 12, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, scr_seq_0124_0757
	buffer_players_name 0
	npc_msg 23
	goto scr_seq_0124_075A

scr_seq_0124_0757:
	npc_msg 22
scr_seq_0124_075A:
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
