#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000090_0000012D ; 000
	scrdef scr_seq_00000090_00000360 ; 001
	scrdef scr_seq_00000090_0000003E ; 002
	scrdef scr_seq_00000090_000003C4 ; 003
	scrdef scr_seq_00000090_00000770 ; 004
	scrdef scr_seq_00000090_000007D4 ; 005
	scrdef scr_seq_00000090_00000838 ; 006
	scrdef scr_seq_00000090_000000B2 ; 007
	scrdef scr_seq_00000090_00000A40 ; 008
	scrdef scr_seq_00000090_00000A74 ; 009
	scrdef scr_seq_00000090_00000AB8 ; 010
	scrdef scr_seq_00000090_00000288 ; 011
	scrdef scr_seq_00000090_00000344 ; 012
	scrdef scr_seq_00000090_000001CC ; 013
	scrdef scr_seq_00000090_00000238 ; 014
	scrdef_end

scr_seq_00000090_0000003E:
	scrcmd_710
	comparevartovalue VAR_UNK_40A9, 3
	gotoif ge, scr_seq_00000090_0000004F
	end

scr_seq_00000090_0000004F:
	show_person_at 5, 29, 0, 22, 0
	show_person_at 6, 29, 0, 22, 0
	comparevartovalue VAR_UNK_40AC, 10
	gotoif ge, scr_seq_00000090_000000B0
	comparevartovalue VAR_UNK_40A9, 4
	gotoif ge, scr_seq_00000090_00000083
	end

scr_seq_00000090_00000083:
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_00000090_000000B0
	setvar VAR_TEMP_x4007, 77
	show_person_at 0, 39, 0, 18, 0
	show_person_at 1, 40, 0, 18, 0
	end

scr_seq_00000090_000000B0:
	end

scr_seq_00000090_000000B2:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000090_000000BF
	end

scr_seq_00000090_000000BF:
	scrcmd_221 16384, 1
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000090_00000127
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif ne, scr_seq_00000090_000000F4
	setflag FLAG_UNK_96B
	hide_person 9
	hide_person 12
	setflag FLAG_UNK_1F5
	goto scr_seq_00000090_00000127

scr_seq_00000090_000000F4:
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif ne, scr_seq_00000090_00000117
	setflag FLAG_UNK_96C
	hide_person 10
	hide_person 13
	setflag FLAG_UNK_1F6
	goto scr_seq_00000090_00000127

scr_seq_00000090_00000117:
	setflag FLAG_UNK_96D
	hide_person 11
	hide_person 14
	setflag FLAG_UNK_1F7
scr_seq_00000090_00000127:
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000090_0000012D:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000090_000001AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 0
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_282
	scrcmd_436
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_190 0
	scrcmd_132 1, 2
	closemsg
	apply_movement 0, scr_seq_00000090_000001B8
	apply_movement 1, scr_seq_00000090_000001C0
	wait_movement
	hide_person 0
	hide_person 1
	setflag FLAG_UNK_1E5
	releaseall
	setvar VAR_UNK_40A9, 1
	end

scr_seq_00000090_000001A9:
	.byte 0x00, 0x00, 0x00

scr_seq_00000090_000001AC:
	.short 15, 5
	.short 12, 4
	.short 254, 0

scr_seq_00000090_000001B8:
	.short 15, 11
	.short 254, 0

scr_seq_00000090_000001C0:
	.short 61, 1
	.short 15, 11
	.short 254, 0
scr_seq_00000090_000001CC:
	scrcmd_609
	lockall
	apply_movement 16, scr_seq_00000090_00000214
	wait_movement
	msgbox 24
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 16, scr_seq_00000090_0000021C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 5
	hide_person 16
	setflag FLAG_UNK_24B
	clearflag FLAG_UNK_24C
	releaseall
	end

scr_seq_00000090_00000213:
	.byte 0x00

scr_seq_00000090_00000214:
	.short 50, 2
	.short 254, 0

scr_seq_00000090_0000021C:
	.short 3, 1
	.short 51, 1
	.short 19, 5
	.short 254, 0
	.byte 0x3f, 0x00, 0x01, 0x00
	.byte 0x0f, 0x00, 0x03, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000090_00000238:
	scrcmd_609
	lockall
	apply_movement 17, scr_seq_00000090_00000270
	wait_movement
	msgbox 25
	closemsg
	apply_movement 17, scr_seq_00000090_00000278
	wait_movement
	setvar VAR_UNK_40AC, 7
	hide_person 17
	setflag FLAG_UNK_24D
	clearflag FLAG_UNK_252
	scrcmd_100 18
	releaseall
	end

scr_seq_00000090_0000026F:
	.byte 0x00

scr_seq_00000090_00000270:
	.short 51, 2
	.short 254, 0

scr_seq_00000090_00000278:
	.short 2, 1
	.short 50, 1
	.short 18, 10
	.short 254, 0
scr_seq_00000090_00000288:
	scrcmd_609
	lockall
	apply_movement 18, scr_seq_00000090_00000308
	wait_movement
	msgbox 26
	closemsg
	msgbox 27
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement 5, scr_seq_00000090_000003B0
	apply_movement 6, scr_seq_00000090_000003B8
	wait_movement
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 24
	gotoif ne, scr_seq_00000090_000002D7
	apply_movement 18, scr_seq_00000090_00000324
	goto scr_seq_00000090_000002DF

scr_seq_00000090_000002D7:
	apply_movement 18, scr_seq_00000090_00000310
scr_seq_00000090_000002DF:
	wait_movement
	setvar VAR_UNK_40AC, 8
	hide_person 18
	setflag FLAG_UNK_252
	setvar VAR_UNK_40A9, 3
	setflag FLAG_UNK_24B
	setflag FLAG_UNK_24C
	setflag FLAG_UNK_0D3
	releaseall
	end

scr_seq_00000090_00000305:
	.byte 0x00, 0x00, 0x00

scr_seq_00000090_00000308:
	.short 48, 2
	.short 254, 0

scr_seq_00000090_00000310:
	.short 48, 2
	.short 2, 1
	.short 63, 1
	.short 18, 12
	.short 254, 0

scr_seq_00000090_00000324:
	.short 48, 2
	.short 2, 1
	.short 63, 1
	.short 18, 2
	.short 50, 2
	.short 17, 1
	.short 18, 10
	.short 254, 0
scr_seq_00000090_00000344:
	goto scr_seq_00000090_00000288

scr_seq_00000090_0000034A:
	.byte 0x02, 0x00, 0x4b, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x12, 0x00, 0x09, 0x00, 0x10, 0x00, 0x05, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000090_00000360:
	comparevartovalue VAR_UNK_40AC, 8
	gotoif ge, scr_seq_00000090_000003A0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0D3
	gotoif lt, scr_seq_00000090_000003A2
	scrcmd_190 0
	msgbox 21
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement 5, scr_seq_00000090_000003B0
	apply_movement 6, scr_seq_00000090_000003B8
	wait_movement
	releaseall
scr_seq_00000090_000003A0:
	end

scr_seq_00000090_000003A2:
	msgbox 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000090_000003AD:
	.byte 0x00, 0x00, 0x00

scr_seq_00000090_000003B0:
	.short 14, 2
	.short 254, 0

scr_seq_00000090_000003B8:
	.short 63, 1
	.short 14, 1
	.short 254, 0
scr_seq_00000090_000003C4:
	scrcmd_609
	lockall
	msgbox 3
	apply_movement 255, scr_seq_00000090_00000630
	wait_movement
	closemsg
	clearflag FLAG_UNK_1F3
	scrcmd_100 8
	scrcmd_100 7
	show_person_at 8, 32, 1, 30, 3
	show_person_at 7, 30, 1, 30, 0
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_ROCKET
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 30
	gotoif ne, scr_seq_00000090_0000042E
	apply_movement 255, scr_seq_00000090_0000065C
	goto scr_seq_00000090_00000436

scr_seq_00000090_0000042E:
	apply_movement 255, scr_seq_00000090_00000668
scr_seq_00000090_00000436:
	apply_movement 8, scr_seq_00000090_00000638
	apply_movement 7, scr_seq_00000090_00000650
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 8, scr_seq_00000090_00000648
	wait_movement
	msgbox 4
	closemsg
	clearflag FLAG_UNK_1E5
	scrcmd_100 0
	scrcmd_100 1
	show_person_at 0, 20, 1, 25, 3
	show_person_at 1, 19, 1, 25, 0
	apply_movement 0, scr_seq_00000090_0000067C
	apply_movement 1, scr_seq_00000090_00000684
	wait_movement
	msgbox 5
	closemsg
	apply_movement 1, scr_seq_00000090_00000690
	scrcmd_076 149, 0
	scrcmd_077
	apply_movement 8, scr_seq_00000090_00000648
	wait_movement
	msgbox 6
	closemsg
	apply_movement 8, scr_seq_00000090_00000698
	apply_movement 7, scr_seq_00000090_000006A0
	wait_movement
	scrcmd_562 675, 479, 499, 1
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000090_00000620
	msgbox 8
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	show_person_at 0, 28, 1, 24, 1
	show_person_at 1, 27, 1, 24, 3
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000090_000006A8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 8
	hide_person 7
	hide_person 3
	hide_person 4
	hide_person 2
	setflag FLAG_UNK_1F3
	setflag FLAG_UNK_1F2
	setflag FLAG_UNK_1E8
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	apply_movement 0, scr_seq_00000090_000006BC
	apply_movement 1, scr_seq_00000090_000006C4
	wait_movement
	scrcmd_190 0
	scrcmd_132 10, 11
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000090_00000738
	apply_movement 0, scr_seq_00000090_000006D0
	apply_movement 1, scr_seq_00000090_0000070C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_076 149, 0
	scrcmd_077
	apply_movement 0, scr_seq_00000090_000006FC
	apply_movement 1, scr_seq_00000090_0000072C
	wait_movement
	scrcmd_190 0
	scrcmd_132 12, 13
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000090_00000744
	apply_movement 0, scr_seq_00000090_00000758
	apply_movement 1, scr_seq_00000090_00000760
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	show_person_at 0, 39, 0, 18, 0
	show_person_at 1, 40, 0, 18, 0
	releaseall
	setvar VAR_UNK_40AC, 9
	setvar VAR_UNK_40A9, 4
	setflag FLAG_UNK_998
	end

scr_seq_00000090_00000620:
	scrcmd_219
	setflag FLAG_UNK_1F3
	setflag FLAG_UNK_1E5
	releaseall
	end

scr_seq_00000090_0000062E:
	.byte 0x00, 0x00

scr_seq_00000090_00000630:
	.short 75, 1
	.short 254, 0

scr_seq_00000090_00000638:
	.short 63, 1
	.short 16, 6
	.short 34, 1
	.short 254, 0

scr_seq_00000090_00000648:
	.short 34, 1
	.short 254, 0

scr_seq_00000090_00000650:
	.short 63, 2
	.short 16, 3
	.short 254, 0

scr_seq_00000090_0000065C:
	.short 13, 5
	.short 35, 1
	.short 254, 0

scr_seq_00000090_00000668:
	.short 13, 2
	.short 14, 1
	.short 13, 3
	.short 35, 1
	.short 254, 0

scr_seq_00000090_0000067C:
	.short 19, 10
	.short 254, 0

scr_seq_00000090_00000684:
	.short 62, 1
	.short 19, 10
	.short 254, 0

scr_seq_00000090_00000690:
	.short 51, 1
	.short 254, 0

scr_seq_00000090_00000698:
	.short 18, 1
	.short 254, 0

scr_seq_00000090_000006A0:
	.short 16, 1
	.short 254, 0

scr_seq_00000090_000006A8:
	.short 16, 2
	.short 19, 1
	.short 17, 2
	.short 2, 1
	.short 254, 0

scr_seq_00000090_000006BC:
	.short 15, 2
	.short 254, 0

scr_seq_00000090_000006C4:
	.short 61, 1
	.short 15, 2
	.short 254, 0

scr_seq_00000090_000006D0:
	.short 12, 6
	.short 63, 2
	.short 14, 2
	.short 32, 1
	.short 63, 2
	.short 35, 1
	.short 15, 5
	.short 32, 1
	.short 63, 2
	.short 35, 1
	.short 254, 0

scr_seq_00000090_000006FC:
	.short 14, 2
	.short 33, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000090_0000070C:
	.short 61, 1
	.short 15, 1
	.short 12, 5
	.short 15, 8
	.short 12, 1
	.short 63, 4
	.short 14, 4
	.short 254, 0

scr_seq_00000090_0000072C:
	.short 62, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000090_00000738:
	.short 63, 4
	.short 12, 5
	.short 254, 0

scr_seq_00000090_00000744:
	.short 61, 1
	.short 63, 1
	.short 12, 1
	.short 14, 5
	.short 254, 0

scr_seq_00000090_00000758:
	.short 15, 6
	.short 254, 0

scr_seq_00000090_00000760:
	.short 61, 1
	.short 14, 1
	.short 15, 5
	.short 254, 0
scr_seq_00000090_00000770:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 1
	setflag FLAG_UNK_0A4
	scrcmd_589 101, 23, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000090_0000089C
	scrcmd_221 16384, 0
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000090_000007D0
	setflag FLAG_UNK_0CB
	checkflag FLAG_UNK_0CC
	gotoif lt, scr_seq_00000090_000007D0
	checkflag FLAG_UNK_0CD
	gotoif lt, scr_seq_00000090_000007D0
	goto scr_seq_00000090_000008A2

scr_seq_00000090_000007D0:
	releaseall
	end

scr_seq_00000090_000007D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 2
	setflag FLAG_UNK_0A4
	scrcmd_589 101, 23, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000090_0000089C
	scrcmd_221 16384, 0
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000090_00000834
	setflag FLAG_UNK_0CC
	checkflag FLAG_UNK_0CB
	gotoif lt, scr_seq_00000090_00000834
	checkflag FLAG_UNK_0CD
	gotoif lt, scr_seq_00000090_00000834
	goto scr_seq_00000090_000008A2

scr_seq_00000090_00000834:
	releaseall
	end

scr_seq_00000090_00000838:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 3
	setflag FLAG_UNK_0A4
	scrcmd_589 101, 23, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000090_0000089C
	scrcmd_221 16384, 0
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000090_00000898
	setflag FLAG_UNK_0CD
	checkflag FLAG_UNK_0CB
	gotoif lt, scr_seq_00000090_00000898
	checkflag FLAG_UNK_0CC
	gotoif lt, scr_seq_00000090_00000898
	goto scr_seq_00000090_000008A2

scr_seq_00000090_00000898:
	releaseall
	end

scr_seq_00000090_0000089C:
	scrcmd_219
	releaseall
	end

scr_seq_00000090_000008A2:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 16
	gotoif ne, scr_seq_00000090_000008CD
	apply_movement 255, scr_seq_00000090_000009E0
	goto scr_seq_00000090_000008F0

scr_seq_00000090_000008CD:
	comparevartovalue VAR_TEMP_x4001, 14
	gotoif ne, scr_seq_00000090_000008E8
	apply_movement 255, scr_seq_00000090_000009EC
	goto scr_seq_00000090_000008F0

scr_seq_00000090_000008E8:
	apply_movement 255, scr_seq_00000090_000009F8
scr_seq_00000090_000008F0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_00000090_00000A04
	apply_movement 1, scr_seq_00000090_00000A0C
	wait_movement
	msgbox 15
	setvar VAR_SPECIAL_x8004, 424
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 17
	closemsg
	apply_movement 0, scr_seq_00000090_00000A18
	wait_movement
	scrcmd_190 0
	scrcmd_132 18, 19
	closemsg
	apply_movement 0, scr_seq_00000090_00000A20
	apply_movement 1, scr_seq_00000090_00000A2C
	wait_movement
	hide_person 0
	hide_person 1
	setflag FLAG_UNK_1E5
	releaseall
	scrcmd_074 2141
	setflag FLAG_RED_GYARADOS_MEET
	clearflag FLAG_UNK_1FB
	setflag FLAG_UNK_1FA
	setflag FLAG_UNK_1F9
	setvar VAR_UNK_40AC, 10
	setvar VAR_UNK_410F, 1
	scrcmd_530 0, 1
	setvar VAR_UNK_40B2, 1
	setvar VAR_UNK_40B3, 1
	setvar VAR_UNK_40B4, 1
	setvar VAR_UNK_40B5, 1
	setvar VAR_UNK_40B6, 1
	setvar VAR_UNK_40B7, 1
	setvar VAR_UNK_40B8, 1
	setvar VAR_UNK_40B9, 1
	setvar VAR_UNK_40BA, 1
	setvar VAR_UNK_40BB, 1
	setvar VAR_UNK_40BC, 1
	setvar VAR_UNK_40BD, 1
	setvar VAR_UNK_40BE, 1
	setvar VAR_UNK_40BF, 1
	setvar VAR_UNK_40C0, 1
	setvar VAR_UNK_40C1, 1
	end


scr_seq_00000090_000009E0:
	.short 13, 2
	.short 15, 10
	.short 254, 0

scr_seq_00000090_000009EC:
	.short 13, 4
	.short 15, 10
	.short 254, 0

scr_seq_00000090_000009F8:
	.short 13, 6
	.short 15, 10
	.short 254, 0

scr_seq_00000090_00000A04:
	.short 14, 8
	.short 254, 0

scr_seq_00000090_00000A0C:
	.short 61, 1
	.short 14, 8
	.short 254, 0

scr_seq_00000090_00000A18:
	.short 33, 1
	.short 254, 0

scr_seq_00000090_00000A20:
	.short 17, 6
	.short 18, 12
	.short 254, 0

scr_seq_00000090_00000A2C:
	.short 62, 1
	.short 18, 1
	.short 17, 6
	.short 18, 12
	.short 254, 0
scr_seq_00000090_00000A40:
	scrcmd_609
	lockall
	msgbox 14
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000090_00000A6C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000090_00000A6B:
	.byte 0x00

scr_seq_00000090_00000A6C:
	.short 14, 1
	.short 254, 0
scr_seq_00000090_00000A74:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_00000090_00000AAC
	wait_movement
	msgbox 14
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000090_00000A6C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000090_00000AA9:
	.byte 0x00, 0x00, 0x00

scr_seq_00000090_00000AAC:
	.short 75, 1
	.short 34, 1
	.short 254, 0
scr_seq_00000090_00000AB8:
	releaseall
	checkflag FLAG_UNK_0CB
	gotoif lt, scr_seq_00000090_00000AE4
	checkflag FLAG_UNK_0CC
	gotoif lt, scr_seq_00000090_00000AE4
	checkflag FLAG_UNK_0CD
	gotoif lt, scr_seq_00000090_00000AE4
	msgbox 23
	closemsg
	releaseall
	end

scr_seq_00000090_00000AE4:
	msgbox 22
	closemsg
	releaseall
	end
	.balign 4, 0
