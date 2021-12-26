#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000004_0000004A ; 000
	scrdef scr_seq_00000004_000002A8 ; 001
	scrdef scr_seq_00000004_00000BD5 ; 002
	scrdef scr_seq_00000004_00000C1B ; 003
	scrdef scr_seq_00000004_00000E66 ; 004
	scrdef scr_seq_00000004_00000E68 ; 005
	scrdef scr_seq_00000004_00000E6A ; 006
	scrdef scr_seq_00000004_00000E6C ; 007
	scrdef scr_seq_00000004_00000E6E ; 008
	scrdef scr_seq_00000004_00000E70 ; 009
	scrdef scr_seq_00000004_00000E72 ; 010
	scrdef scr_seq_00000004_00000E86 ; 011
	scrdef scr_seq_00000004_0000006C ; 012
	scrdef scr_seq_00000004_00000147 ; 013
	scrdef scr_seq_00000004_0000006C ; 014
	scrdef scr_seq_00000004_0000006C ; 015
	scrdef scr_seq_00000004_00000F35 ; 016
	scrdef scr_seq_00000004_00000F44 ; 017
	scrdef_end

scr_seq_00000004_0000004A:
	comparevartovalue VAR_UNK_4133, 2
	gotoif eq, scr_seq_00000004_00000066
	comparevartovalue VAR_UNK_4133, 1
	gotoif eq, scr_seq_00000004_00000066
	end

scr_seq_00000004_00000066:
	scrcmd_375 255
	end

scr_seq_00000004_0000006C:
	scrcmd_609
	lockall
	scrcmd_446 32780
	scrcmd_840 32780, 32772
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_00000004_00000099
	goto scr_seq_00000004_0000027A

scr_seq_00000004_00000093:
	.byte 0x16, 0x00, 0xa8, 0x00, 0x00, 0x00
scr_seq_00000004_00000099:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000004_000000F0
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif eq, scr_seq_00000004_000000BF
	goto scr_seq_00000004_0000027A

scr_seq_00000004_000000B9:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000004_000000BF:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_00000004_000000D2
	goto scr_seq_00000004_0000027A

scr_seq_00000004_000000D2:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto scr_seq_00000004_00000222

scr_seq_00000004_000000EA:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_00000004_000000F0:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_00000004_00000141
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif eq, scr_seq_00000004_00000116
	goto scr_seq_00000004_0000027A

scr_seq_00000004_00000110:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000004_00000116:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif eq, scr_seq_00000004_00000129
	goto scr_seq_00000004_0000027A

scr_seq_00000004_00000129:
	setvar VAR_TEMP_x4000, 18
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto scr_seq_00000004_00000222

scr_seq_00000004_00000141:
	goto scr_seq_00000004_0000027A

scr_seq_00000004_00000147:
	scrcmd_609
	lockall
	scrcmd_446 32780
	scrcmd_840 32780, 32772
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_00000004_00000174
	goto scr_seq_00000004_0000027A

scr_seq_00000004_0000016E:
	.byte 0x16, 0x00
	.byte 0xa8, 0x00, 0x00, 0x00
scr_seq_00000004_00000174:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000004_000001CB
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif eq, scr_seq_00000004_0000019A
	goto scr_seq_00000004_0000027A

scr_seq_00000004_00000194:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000004_0000019A:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_00000004_000001AD
	goto scr_seq_00000004_0000027A

scr_seq_00000004_000001AD:
	setvar VAR_TEMP_x4000, 7
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto scr_seq_00000004_00000222

scr_seq_00000004_000001C5:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_00000004_000001CB:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_00000004_0000021C
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000004_000001F1
	goto scr_seq_00000004_0000027A

scr_seq_00000004_000001EB:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00
	.byte 0x00
scr_seq_00000004_000001F1:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif eq, scr_seq_00000004_00000204
	goto scr_seq_00000004_0000027A

scr_seq_00000004_00000204:
	setvar VAR_TEMP_x4000, 4
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto scr_seq_00000004_00000222

scr_seq_00000004_0000021C:
	goto scr_seq_00000004_0000027A

scr_seq_00000004_00000222:
	scrcmd_307 0, 0, 16384, 16385, 77
	call scr_seq_00000004_00000BC2
	apply_movement 255, scr_seq_00000004_00000288
	wait_movement
	call scr_seq_00000004_00000BCA
	scrcmd_307 0, 0, 16384, 16386, 77
	call scr_seq_00000004_00000BC2
	apply_movement 255, scr_seq_00000004_000002A0
	wait_movement
	call scr_seq_00000004_00000BCA
	scrcmd_606
	clearflag FLAG_UNK_966
	setvar VAR_UNK_4133, 0
	setvar VAR_UNK_4133, 0
	releaseall
	end

scr_seq_00000004_0000027A:
	setvar VAR_UNK_4133, 0
	scrcmd_374 255
	releaseall
	end


scr_seq_00000004_00000288:
	.short 1, 1
	.short 70, 1
	.short 13, 2
	.short 254, 0
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000004_000002A0:
	.short 13, 2
	.short 254, 0
scr_seq_00000004_000002A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_00000F27
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000004_00000C10
	msgbox 0
	goto scr_seq_00000004_000002DD

scr_seq_00000004_000002DB:
	.byte 0x02, 0x00
scr_seq_00000004_000002DD:
	msgbox 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 166, 255, 0
	scrcmd_751 167, 255, 1
	scrcmd_751 11, 255, 2
	scrcmd_751 12, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000004_00000364
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000004_000003DF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000004_0000033F
	goto scr_seq_00000004_0000034C

scr_seq_00000004_0000033F:
	msgbox 6
	closemsg
	goto scr_seq_00000004_000002DD

scr_seq_00000004_0000034A:
	.byte 0x02, 0x00
scr_seq_00000004_0000034C:
	msgbox 29
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000004_00000359:
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000004_00000364:
	msgbox 1
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 6, 255, 0
	scrcmd_751 7, 255, 1
	scrcmd_751 8, 255, 2
	scrcmd_751 10, 255, 3
	scrcmd_751 13, 255, 4
	scrcmd_752
	copyvar VAR_TEMP_x4003, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000004_00000415
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000004_00000423
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000004_0000044D
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000004_000004A1
	goto scr_seq_00000004_000002DD

scr_seq_00000004_000003DF:
	msgbox 3
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 4, 255, 0
	scrcmd_751 5, 255, 1
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000004_00000477
	goto scr_seq_00000004_000002DD

scr_seq_00000004_00000415:
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_00000004_000004AF

scr_seq_00000004_00000421:
	.byte 0x02, 0x00
scr_seq_00000004_00000423:
	setvar VAR_SPECIAL_x8004, 2
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_00000004_00000440
	goto scr_seq_00000004_000004AF

scr_seq_00000004_00000440:
	msgbox 10
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000004_0000044D:
	setvar VAR_SPECIAL_x8004, 3
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, scr_seq_00000004_0000046A
	goto scr_seq_00000004_00000905

scr_seq_00000004_0000046A:
	msgbox 141
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000004_00000477:
	setvar VAR_SPECIAL_x8004, 4
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif lt, scr_seq_00000004_00000494
	goto scr_seq_00000004_00000905

scr_seq_00000004_00000494:
	msgbox 140
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000004_000004A1:
	setvar VAR_SPECIAL_x8004, 37
	goto scr_seq_00000004_0000059A

scr_seq_00000004_000004AD:
	.byte 0x02, 0x00
scr_seq_00000004_000004AF:
	msgbox 120
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 20, 255, 12
	scrcmd_798 0
	scrcmd_751 19, 255, 0
	scrcmd_798 1
	scrcmd_751 19, 255, 1
	scrcmd_798 2
	scrcmd_751 19, 255, 2
	scrcmd_798 3
	scrcmd_751 19, 255, 3
	scrcmd_798 4
	scrcmd_751 19, 255, 4
	scrcmd_837 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000004_0000051B
	scrcmd_798 5
	scrcmd_751 19, 255, 5
scr_seq_00000004_0000051B:
	scrcmd_751 22, 255, 255
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 12
	gotoif eq, scr_seq_00000004_000008F9
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000004_0000058E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000004_0000058E
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000004_0000058E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000004_0000058E
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000004_0000058E
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000004_0000058E
	goto scr_seq_00000004_000002DD

scr_seq_00000004_0000058C:
	.byte 0x02, 0x00
scr_seq_00000004_0000058E:
	scrcmd_800 16384
	goto scr_seq_00000004_00000682

scr_seq_00000004_00000598:
	.byte 0x02, 0x00
scr_seq_00000004_0000059A:
	setvar VAR_SPECIAL_x8004, 37
	msgbox 120
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 20, 255, 6
	scrcmd_798 7
	scrcmd_751 19, 255, 7
	scrcmd_798 8
	scrcmd_751 19, 255, 8
	scrcmd_798 9
	scrcmd_751 19, 255, 9
	scrcmd_798 10
	scrcmd_751 23, 255, 10
	scrcmd_798 11
	scrcmd_751 19, 255, 11
	scrcmd_751 22, 255, 255
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000004_000008F9
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_00000004_0000058E
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_00000004_0000058E
	comparevartovalue VAR_SPECIAL_x8008, 9
	gotoif eq, scr_seq_00000004_00000653
	comparevartovalue VAR_SPECIAL_x8008, 10
	gotoif eq, scr_seq_00000004_0000065F
	comparevartovalue VAR_SPECIAL_x8008, 11
	gotoif eq, scr_seq_00000004_00000653
	goto scr_seq_00000004_000002DD

scr_seq_00000004_00000653:
	setvar VAR_SPECIAL_x8004, 38
	goto scr_seq_00000004_0000058E

scr_seq_00000004_0000065F:
	setvar VAR_SPECIAL_x8004, 38
	scrcmd_800 16384
	scrcmd_803 16384, 16386
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000004_00000440
	goto scr_seq_00000004_00000905

scr_seq_00000004_00000682:
	scrcmd_799 16384
	msgbox 121
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 130, 255, 0
	scrcmd_751 131, 255, 1
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, scr_seq_00000004_000006B6
	scrcmd_751 24, 255, 2
scr_seq_00000004_000006B6:
	scrcmd_751 22, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000004_00000702
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000004_00000751
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, scr_seq_00000004_000006FA
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000004_00000778
scr_seq_00000004_000006FA:
	goto scr_seq_00000004_00000763

scr_seq_00000004_00000700:
	.byte 0x02, 0x00
scr_seq_00000004_00000702:
	scrcmd_803 16384, 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000004_00000905
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000004_0000072A
	goto scr_seq_00000004_00000744

scr_seq_00000004_00000728:
	.byte 0x02, 0x00
scr_seq_00000004_0000072A:
	msgbox 122
	scrcmd_049
	comparevartovalue VAR_TEMP_x4003, 3
	gotoif eq, scr_seq_00000004_0000059A
	goto scr_seq_00000004_000004AF

scr_seq_00000004_00000742:
	.byte 0x02, 0x00
scr_seq_00000004_00000744:
	msgbox 136
	scrcmd_049
	goto scr_seq_00000004_000004AF

scr_seq_00000004_0000074F:
	.byte 0x02
	.byte 0x00
scr_seq_00000004_00000751:
	closemsg
	scrcmd_801 16384
	scrcmd_049
	scrcmd_802
	goto scr_seq_00000004_00000682

scr_seq_00000004_00000761:
	.byte 0x02, 0x00
scr_seq_00000004_00000763:
	comparevartovalue VAR_TEMP_x4003, 3
	gotoif eq, scr_seq_00000004_0000059A
	goto scr_seq_00000004_000004AF

scr_seq_00000004_00000776:
	.byte 0x02, 0x00
scr_seq_00000004_00000778:
	scrcmd_747
	buffer_players_name 0
	msgbox 25
	setvar VAR_TEMP_x4005, 0
	scrcmd_707 150, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_000007AA
	scrcmd_202 0, 150, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_000007AA:
	scrcmd_707 249, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_000007CE
	scrcmd_202 0, 249, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_000007CE:
	scrcmd_707 250, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_000007F2
	scrcmd_202 0, 250, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_000007F2:
	scrcmd_707 382, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_00000816
	scrcmd_202 0, 382, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_00000816:
	scrcmd_707 383, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_0000083A
	scrcmd_202 0, 383, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_0000083A:
	scrcmd_707 384, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_0000085E
	scrcmd_202 0, 384, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_0000085E:
	scrcmd_707 483, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_00000882
	scrcmd_202 0, 483, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_00000882:
	scrcmd_707 484, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_000008A6
	scrcmd_202 0, 484, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_000008A6:
	scrcmd_707 487, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000004_000008CA
	scrcmd_202 0, 487, 0, 0
	msgbox 26
	setvar VAR_TEMP_x4005, 1
scr_seq_00000004_000008CA:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_00000004_000008E0
	msgbox 27
	goto scr_seq_00000004_000008E3

scr_seq_00000004_000008E0:
	msgbox 28
scr_seq_00000004_000008E3:
	scrcmd_746
	goto scr_seq_00000004_00000682

scr_seq_00000004_000008EB:
	.byte 0x29, 0x00, 0x05, 0x80, 0x00
	.byte 0x00, 0x16, 0x00, 0x0e, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_00000004_000008F9:
	scrcmd_800 16384
	goto scr_seq_00000004_00000905

scr_seq_00000004_00000903:
	.byte 0x02, 0x00
scr_seq_00000004_00000905:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_00000924
	goto scr_seq_00000004_00000359

scr_seq_00000004_00000922:
	.byte 0x02, 0x00
scr_seq_00000004_00000924:
	scrcmd_746
scr_seq_00000004_00000926:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_00000004_000009BE
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_00000004_000009BE
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_00000004_000009BE
	comparevartovalue VAR_SPECIAL_x8004, 37
	callif eq, scr_seq_00000004_000009BE
	comparevartovalue VAR_SPECIAL_x8004, 38
	callif eq, scr_seq_00000004_000009BE
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_00000004_000009C3
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000004_000009C8
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000004_00000A41
	goto scr_seq_00000004_0000034C

scr_seq_00000004_000009BC:
	.byte 0x02, 0x00
scr_seq_00000004_000009BE:
	msgbox 36
	return

scr_seq_00000004_000009C3:
	msgbox 57
	return

scr_seq_00000004_000009C8:
	msgbox 139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_00000926
	closemsg
	scrcmd_226 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_00000A17
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000004_00000A23
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000004_00000A32
	goto scr_seq_00000004_00000ABA

scr_seq_00000004_00000A15:
	.byte 0x02, 0x00
scr_seq_00000004_00000A17:
	scrcmd_283
	scrcmd_746
	goto scr_seq_00000004_00000926

scr_seq_00000004_00000A21:
	.byte 0x02, 0x00
scr_seq_00000004_00000A23:
	scrcmd_283
	scrcmd_747
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000004_00000A32:
	scrcmd_283
	msgbox 29
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000004_00000A41:
	msgbox 139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_00000926
	closemsg
	scrcmd_227 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_00000A90
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000004_00000A9C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000004_00000AAB
	goto scr_seq_00000004_00000ABA

scr_seq_00000004_00000A8E:
	.byte 0x02, 0x00
scr_seq_00000004_00000A90:
	scrcmd_283
	scrcmd_746
	goto scr_seq_00000004_00000926

scr_seq_00000004_00000A9A:
	.byte 0x02, 0x00
scr_seq_00000004_00000A9C:
	scrcmd_283
	msgbox 30
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000004_00000AAB:
	scrcmd_283
	msgbox 29
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000004_00000ABA:
	setvar VAR_UNK_4133, 1
	setflag FLAG_UNK_966
	scrcmd_047 66
	scrcmd_348 45
	scrcmd_257 96
	closemsg
	scrcmd_600
	heal_party
	scrcmd_815 0
	scrcmd_446 32780
	comparevartovalue VAR_SPECIAL_x800C, 300
	gotoif ne, scr_seq_00000004_00000B13
	apply_movement 255, scr_seq_00000004_00000BE8
	wait_movement
	setvar VAR_TEMP_x4000, 18
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto scr_seq_00000004_00000B35

scr_seq_00000004_00000B0D:
	.byte 0x16, 0x00, 0x22
	.byte 0x00, 0x00, 0x00
scr_seq_00000004_00000B13:
	apply_movement 255, scr_seq_00000004_00000BDC
	wait_movement
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto scr_seq_00000004_00000B35

scr_seq_00000004_00000B35:
	scrcmd_307 0, 0, 16384, 16386, 77
	call scr_seq_00000004_00000BC2
	apply_movement 255, scr_seq_00000004_00000BF4
	wait_movement
	call scr_seq_00000004_00000BCA
	apply_movement 255, scr_seq_00000004_00000BFC
	wait_movement
	scrcmd_307 0, 0, 16384, 16385, 77
	call scr_seq_00000004_00000BC2
	apply_movement 255, scr_seq_00000004_00000C04
	wait_movement
	call scr_seq_00000004_00000BCA
	comparevartovalue VAR_SPECIAL_x8004, 4
	gotoif eq, scr_seq_00000004_00000BA8
	scrcmd_451 32780
	addvar VAR_SPECIAL_x800C, 7
	scrcmd_448 4, 0, 32780, 11, 0
	releaseall
	end

scr_seq_00000004_00000BA8:
	scrcmd_451 32780
	addvar VAR_SPECIAL_x800C, 6
	scrcmd_448 5, 0, 32780, 11, 0
	releaseall
	end

scr_seq_00000004_00000BC2:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_00000004_00000BCA:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_00000004_00000BD5:
	scrcmd_230
	scrcmd_284
	end

scr_seq_00000004_00000BDB:
	.byte 0x00

scr_seq_00000004_00000BDC:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000004_00000BE8:
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000004_00000BF4:
	.short 12, 2
	.short 254, 0

scr_seq_00000004_00000BFC:
	.short 12, 1
	.short 254, 0

scr_seq_00000004_00000C04:
	.short 12, 1
	.short 69, 1
	.short 254, 0
scr_seq_00000004_00000C10:
	msgbox 144
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000004_00000C1B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_00000F27
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000004_00000E3A
	get_party_count VAR_TEMP_x4009
	setvar VAR_TEMP_x400A, 0
scr_seq_00000004_00000C4F:
	get_partymon_species VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 172
	gotoif ne, scr_seq_00000004_00000C7B
	get_partymon_forme VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000004_00000C7B
	goto scr_seq_00000004_00000E45

scr_seq_00000004_00000C7B:
	addvar VAR_TEMP_x400A, 1
	comparevartovar VAR_TEMP_x400A, VAR_TEMP_x4009
	gotoif ge, scr_seq_00000004_00000C94
	goto scr_seq_00000004_00000C4F

scr_seq_00000004_00000C94:
	goto scr_seq_00000004_00000C9C

scr_seq_00000004_00000C9A:
	.byte 0x02, 0x00
scr_seq_00000004_00000C9C:
	msgbox 71
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 42, 255, 0
	scrcmd_751 11, 255, 1
	scrcmd_751 45, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000004_00000D14
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000004_00000CF8
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000004_0000034C
	goto scr_seq_00000004_0000034C

scr_seq_00000004_00000CF6:
	.byte 0x02, 0x00
scr_seq_00000004_00000CF8:
	msgbox 72
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000004_00000D14
	goto scr_seq_00000004_0000034C

scr_seq_00000004_00000D12:
	.byte 0x02, 0x00
scr_seq_00000004_00000D14:
	setvar VAR_SPECIAL_x8004, 9
	msgbox 139
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_0000034C
	scrcmd_689 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000004_00000E34
	setvar VAR_UNK_4133, 2
	setflag FLAG_UNK_966
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000004_00000D70
	setvar VAR_UNK_4133, 0
	clearflag FLAG_UNK_966
	goto scr_seq_00000004_00000359

scr_seq_00000004_00000D70:
	setvar VAR_UNK_4133, 2
	setflag FLAG_UNK_966
	msgbox 77
	closemsg
	scrcmd_600
	heal_party
	apply_movement 255, scr_seq_00000004_00000BDC
	wait_movement
	scrcmd_815 0
	goto scr_seq_00000004_00000D99

scr_seq_00000004_00000D97:
	.byte 0x02, 0x00
scr_seq_00000004_00000D99:
	scrcmd_446 32780
	comparevartovalue VAR_SPECIAL_x800C, 300
	gotoif ne, scr_seq_00000004_00000DC8
	setvar VAR_TEMP_x4000, 4
	setvar VAR_TEMP_x4001, 11
	setvar VAR_TEMP_x4002, 14
	goto scr_seq_00000004_00000DE2

scr_seq_00000004_00000DC2:
	.byte 0x16, 0x00, 0x18, 0x00, 0x00, 0x00
scr_seq_00000004_00000DC8:
	setvar VAR_TEMP_x4000, 7
	setvar VAR_TEMP_x4001, 2
	setvar VAR_TEMP_x4002, 5
	goto scr_seq_00000004_00000DE2

scr_seq_00000004_00000DE0:
	.byte 0x02, 0x00
scr_seq_00000004_00000DE2:
	scrcmd_307 0, 0, 16384, 16386, 77
	call scr_seq_00000004_00000BC2
	apply_movement 255, scr_seq_00000004_00000BF4
	wait_movement
	call scr_seq_00000004_00000BCA
	apply_movement 255, scr_seq_00000004_00000BFC
	wait_movement
	scrcmd_307 0, 0, 16384, 16385, 77
	call scr_seq_00000004_00000BC2
	apply_movement 255, scr_seq_00000004_00000C04
	wait_movement
	call scr_seq_00000004_00000BCA
	releaseall
	scrcmd_286
	end

scr_seq_00000004_00000E34:
	callstd 2041
	end

scr_seq_00000004_00000E3A:
	msgbox 146
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000004_00000E45:
	comparevartovalue VAR_UNK_412F, 0
	gotoif ne, scr_seq_00000004_00000E5B
	msgbox 172
	goto scr_seq_00000004_00000E5E

scr_seq_00000004_00000E5B:
	msgbox 147
scr_seq_00000004_00000E5E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000004_00000E66:
	end

scr_seq_00000004_00000E68:
	end

scr_seq_00000004_00000E6A:
	end

scr_seq_00000004_00000E6C:
	end

scr_seq_00000004_00000E6E:
	end

scr_seq_00000004_00000E70:
	end

scr_seq_00000004_00000E72:
	scrcmd_436
	scrcmd_152
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	end

scr_seq_00000004_00000E86:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_066
	msgbox 116
	goto scr_seq_00000004_00000E9D

scr_seq_00000004_00000E9B:
	.byte 0x02, 0x00
scr_seq_00000004_00000E9D:
	msgbox 117
	scrcmd_064 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_066 42, 0
	scrcmd_066 43, 1
	scrcmd_066 11, 2
	scrcmd_067
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000004_00000EF6
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000004_00000F1C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000004_00000EEB
	goto scr_seq_00000004_00000F1C

scr_seq_00000004_00000EE9:
	.byte 0x02, 0x00
scr_seq_00000004_00000EEB:
	msgbox 119
	goto scr_seq_00000004_00000E9D

scr_seq_00000004_00000EF4:
	.byte 0x02, 0x00
scr_seq_00000004_00000EF6:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_252
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_00000004_00000F1C

scr_seq_00000004_00000F1A:
	.byte 0x02, 0x00
scr_seq_00000004_00000F1C:
	msgbox 118
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000004_00000F27:
	call scr_seq_00000004_00000F3F
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000004_00000F35:
	call scr_seq_00000004_00000F3F
	endstd
	end

scr_seq_00000004_00000F3F:
	msgbox 142
	return

scr_seq_00000004_00000F44:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 149
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
