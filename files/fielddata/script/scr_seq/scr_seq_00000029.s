#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000029_0000008D ; 000
	scrdef scr_seq_00000029_00000966 ; 001
	scrdef scr_seq_00000029_000000FD ; 002
	scrdef scr_seq_00000029_00000280 ; 003
	scrdef scr_seq_00000029_00000291 ; 004
	scrdef scr_seq_00000029_000002A2 ; 005
	scrdef scr_seq_00000029_00000940 ; 006
	scrdef scr_seq_00000029_00000953 ; 007
	scrdef scr_seq_00000029_0000002E ; 008
	scrdef scr_seq_00000029_00000384 ; 009
	scrdef scr_seq_00000029_000000E2 ; 010
	scrdef_end

scr_seq_00000029_0000002E:
	setflag FLAG_UNK_1BC
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_00000029_0000004D
	clearflag FLAG_UNK_1BC
	goto scr_seq_00000029_00000085

scr_seq_00000029_0000004D:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000029_00000066
	goto scr_seq_00000029_0000008B

scr_seq_00000029_00000060:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000029_00000066:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000029_00000081
	clearflag FLAG_UNK_1BC
	clearflag FLAG_UNK_1BD
	goto scr_seq_00000029_00000085

scr_seq_00000029_00000081:
	clearflag FLAG_UNK_1B8
scr_seq_00000029_00000085:
	setvar VAR_TEMP_x400A, 0
scr_seq_00000029_0000008B:
	end

scr_seq_00000029_0000008D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_00000029_000000AB
	msgbox 1
	goto scr_seq_00000029_000000DA

scr_seq_00000029_000000AB:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000029_000000C1
	msgbox 1
	goto scr_seq_00000029_000000DA

scr_seq_00000029_000000C1:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000029_000000D7
	msgbox 2
	goto scr_seq_00000029_000000DA

scr_seq_00000029_000000D7:
	msgbox 0
scr_seq_00000029_000000DA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_000000E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	apply_movement 7, scr_seq_00000029_0000036C
	wait_movement
	closemsg
	releaseall
	end

scr_seq_00000029_000000FD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif eq, scr_seq_00000029_00000243
	msgbox 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000029_00000221
	msgbox 4
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000029_0000022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	msgbox 5
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000029_0000022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	msgbox 6
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000029_0000022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	msgbox 7
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000029_0000022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	msgbox 8
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000029_0000022E
	wait 30, VAR_SPECIAL_x800C
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	scrcmd_747
	msgbox 9
	scrcmd_190 0
	msgbox 10
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	closemsg
	register_pokegear_card 2
	setflag FLAG_UNK_08A
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 7, scr_seq_00000029_00000250
	apply_movement 255, scr_seq_00000029_00000270
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 15
	closemsg
	apply_movement 7, scr_seq_00000029_00000264
	wait 24, VAR_SPECIAL_x800C
	apply_movement 255, scr_seq_00000029_0000036C
	wait_movement
	hide_person 7
	setflag FLAG_UNK_318
	releaseall
	end

scr_seq_00000029_00000221:
	msgbox 13
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000029_0000022E:
	play_se SEQ_SE_DP_BOX03
	wait_se SEQ_SE_DP_BOX03
	msgbox 12
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000029_00000243:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_0000024E:
	.byte 0x00, 0x00

scr_seq_00000029_00000250:
	.short 75, 1
	.short 50, 2
	.short 76, 3
	.short 78, 1
	.short 254, 0

scr_seq_00000029_00000264:
	.short 76, 1
	.short 78, 10
	.short 254, 0

scr_seq_00000029_00000270:
	.short 63, 6
	.short 76, 1
	.short 3, 1
	.short 254, 0
scr_seq_00000029_00000280:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_00000291:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_000002A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif eq, scr_seq_00000029_000002C2
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_000002C2:
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif eq, scr_seq_00000029_00000316
	msgbox 19
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_000002F5
	apply_movement 6, scr_seq_00000029_00000354
	goto scr_seq_00000029_0000030A

scr_seq_00000029_000002F5:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_0000030A
	apply_movement 6, scr_seq_00000029_00000360
scr_seq_00000029_0000030A:
	wait_movement
	releaseall
	setvar VAR_TEMP_x400A, 1
	end

scr_seq_00000029_00000316:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000029_00000333
	setvar VAR_TEMP_x400B, 33
	goto scr_seq_00000029_00000346

scr_seq_00000029_00000333:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000029_00000346
	setvar VAR_TEMP_x400B, 11
scr_seq_00000029_00000346:
	msgbox 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_00000351:
	.byte 0x00, 0x00, 0x00

scr_seq_00000029_00000354:
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000029_00000360:
	.short 14, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000029_0000036C:
	.short 34, 1
	.short 254, 0
	.byte 0x23, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x21, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_00000029_00000384:
	scrcmd_609
	lockall
	show_person_at 5, 13, 1, 6, 3
	callstd 2031
	get_person_coords 6, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_000003D0
	apply_movement 5, scr_seq_00000029_00000670
	comparevartovalue VAR_TEMP_x400B, 33
	gotoif ne, scr_seq_00000029_000003CA
	apply_movement 6, scr_seq_00000029_0000069C
scr_seq_00000029_000003CA:
	goto scr_seq_00000029_000003FA

scr_seq_00000029_000003D0:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_000003FA
	apply_movement 5, scr_seq_00000029_0000067C
	comparevartovalue VAR_TEMP_x400B, 11
	gotoif ne, scr_seq_00000029_000003FA
	apply_movement 6, scr_seq_00000029_000006A8
scr_seq_00000029_000003FA:
	wait_movement
	scrcmd_191 1
	msgbox 21
	closemsg
	apply_movement 5, scr_seq_00000029_00000664
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_00000431
	apply_movement 5, scr_seq_00000029_00000684
	apply_movement 6, scr_seq_00000029_000006B4
	goto scr_seq_00000029_0000044E

scr_seq_00000029_00000431:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_0000044E
	apply_movement 5, scr_seq_00000029_00000690
	apply_movement 6, scr_seq_00000029_000006C8
scr_seq_00000029_0000044E:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_0000046B
	apply_movement 255, scr_seq_00000029_000006E4
	goto scr_seq_00000029_00000480

scr_seq_00000029_0000046B:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_00000480
	apply_movement 255, scr_seq_00000029_000006EC
scr_seq_00000029_00000480:
	wait_movement
	scrcmd_190 0
	scrcmd_191 1
	msgbox 22
	closemsg
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_000004A8
	apply_movement 255, scr_seq_00000029_000006FC
	goto scr_seq_00000029_000004BD

scr_seq_00000029_000004A8:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_000004BD
	apply_movement 255, scr_seq_00000029_000007BC
scr_seq_00000029_000004BD:
	wait 50, VAR_SPECIAL_x800C
	scrcmd_188 1
	scrcmd_189
	scrcmd_620 0
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_000004E9
	apply_movement 6, scr_seq_00000029_00000874
	goto scr_seq_00000029_000004FE

scr_seq_00000029_000004E9:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_000004FE
	apply_movement 6, scr_seq_00000029_00000890
scr_seq_00000029_000004FE:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_00000523
	apply_movement 6, scr_seq_00000029_000008AC
	apply_movement 5, scr_seq_00000029_000008BC
	goto scr_seq_00000029_00000540

scr_seq_00000029_00000523:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_00000540
	apply_movement 6, scr_seq_00000029_000008B4
	apply_movement 5, scr_seq_00000029_000008D4
scr_seq_00000029_00000540:
	wait_movement
	msgbox 23
	closemsg
	trainer_battle 185, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000029_00000655
	msgbox 24
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_00000592
	apply_movement 6, scr_seq_00000029_000008EC
	apply_movement 255, scr_seq_00000029_00000900
	goto scr_seq_00000029_000005AF

scr_seq_00000029_00000592:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_000005AF
	apply_movement 6, scr_seq_00000029_000008F4
	apply_movement 255, scr_seq_00000029_00000914
scr_seq_00000029_000005AF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 6
	callstd 2070
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_000005DE
	apply_movement 5, scr_seq_00000029_00000928
	goto scr_seq_00000029_000005F3

scr_seq_00000029_000005DE:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_000005F3
	apply_movement 5, scr_seq_00000029_00000930
scr_seq_00000029_000005F3:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_00000029_00000610
	apply_movement 255, scr_seq_00000029_000006DC
	goto scr_seq_00000029_00000625

scr_seq_00000029_00000610:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000029_00000625
	apply_movement 255, scr_seq_00000029_000006F4
scr_seq_00000029_00000625:
	wait_movement
	scrcmd_191 1
	msgbox 25
	closemsg
	apply_movement 5, scr_seq_00000029_00000938
	wait_movement
	hide_person 5
	callstd 2071
	releaseall
	setvar VAR_UNK_4077, 4
	setflag FLAG_UNK_1BD
	setvar VAR_UNK_409F, 1
	end

scr_seq_00000029_00000655:
	setvar VAR_UNK_4077, 2
	scrcmd_219
	releaseall
	end

scr_seq_00000029_00000661:
	.byte 0x00, 0x00, 0x00

scr_seq_00000029_00000664:
	.short 65, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000029_00000670:
	.short 19, 9
	.short 32, 1
	.short 254, 0

scr_seq_00000029_0000067C:
	.short 19, 9
	.short 254, 0

scr_seq_00000029_00000684:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000029_00000690:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000029_0000069C:
	.short 62, 9
	.short 33, 1
	.short 254, 0

scr_seq_00000029_000006A8:
	.short 62, 9
	.short 34, 1
	.short 254, 0

scr_seq_00000029_000006B4:
	.short 3, 1
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000029_000006C8:
	.short 0, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000029_000006DC:
	.short 34, 1
	.short 254, 0

scr_seq_00000029_000006E4:
	.short 35, 1
	.short 254, 0

scr_seq_00000029_000006EC:
	.short 32, 1
	.short 254, 0

scr_seq_00000029_000006F4:
	.short 33, 1
	.short 254, 0

scr_seq_00000029_000006FC:
	.short 62, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 62, 1
	.short 2, 1
	.short 62, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 62, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000029_000007BC:
	.short 62, 1
	.short 2, 1
	.short 62, 1
	.short 0, 1
	.short 62, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 62, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000029_00000874:
	.short 65, 1
	.short 3, 1
	.short 71, 1
	.short 18, 2
	.short 72, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000029_00000890:
	.short 65, 1
	.short 0, 1
	.short 71, 1
	.short 17, 2
	.short 72, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000029_000008AC:
	.short 19, 3
	.short 254, 0

scr_seq_00000029_000008B4:
	.short 16, 3
	.short 254, 0

scr_seq_00000029_000008BC:
	.short 62, 1
	.short 0, 1
	.short 71, 1
	.short 17, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000029_000008D4:
	.short 62, 1
	.short 3, 1
	.short 71, 1
	.short 18, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000029_000008EC:
	.short 15, 2
	.short 254, 0

scr_seq_00000029_000008F4:
	.short 12, 1
	.short 15, 1
	.short 254, 0

scr_seq_00000029_00000900:
	.short 0, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000029_00000914:
	.short 3, 1
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000029_00000928:
	.short 35, 1
	.short 254, 0

scr_seq_00000029_00000930:
	.short 32, 1
	.short 254, 0

scr_seq_00000029_00000938:
	.short 14, 9
	.short 254, 0
scr_seq_00000029_00000940:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_00000953:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_00000966:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4136, 0
	gotoif ne, scr_seq_00000029_00000B86
	checkflag FLAG_UNK_AA6
	gotoif eq, scr_seq_00000029_000009CF
	checkflag FLAG_UNK_AA5
	gotoif eq, scr_seq_00000029_000009AF
	msgbox 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000029_000009E5
	goto scr_seq_00000029_000009DA

scr_seq_00000029_000009AF:
	msgbox 45
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000029_000009E5
	goto scr_seq_00000029_000009DA

scr_seq_00000029_000009CD:
	.byte 0x02, 0x00
scr_seq_00000029_000009CF:
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_000009DA:
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_000009E5:
	setflag FLAG_UNK_AA5
	msgbox 31
	scrcmd_503 32768
	scrcmd_541 0, 32768, 2, 5
	msgbox 32
	scrcmd_504 32769, 32770, 32771, 32768
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, scr_seq_00000029_00000A24
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif eq, scr_seq_00000029_00000A2F
	goto scr_seq_00000029_00000A3D

scr_seq_00000029_00000A24:
	msgbox 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_00000A2F:
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	msgbox 33
	goto scr_seq_00000029_00000A4B

scr_seq_00000029_00000A3D:
	scrcmd_506 0, 32769
	msgbox 34
	goto scr_seq_00000029_00000A4B

scr_seq_00000029_00000A4B:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000029_00000A94
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000029_00000A9F
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000029_00000AA8
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000029_00000AB1
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000029_00000ABA
	end

scr_seq_00000029_00000A94:
	msgbox 36
	goto scr_seq_00000029_00000AC3

scr_seq_00000029_00000A9D:
	.byte 0x02, 0x00
scr_seq_00000029_00000A9F:
	msgbox 38
	goto scr_seq_00000029_00000AC3

scr_seq_00000029_00000AA8:
	msgbox 39
	goto scr_seq_00000029_00000AC3

scr_seq_00000029_00000AB1:
	msgbox 40
	goto scr_seq_00000029_00000AC3

scr_seq_00000029_00000ABA:
	msgbox 41
	goto scr_seq_00000029_00000AC3

scr_seq_00000029_00000AC3:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000029_00000B0C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000029_00000B1A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000029_00000B26
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000029_00000B32
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000029_00000B3E
	end

scr_seq_00000029_00000B0C:
	setvar VAR_SPECIAL_x8003, 2
	goto scr_seq_00000029_00000B4A

scr_seq_00000029_00000B18:
	.byte 0x02, 0x00
scr_seq_00000029_00000B1A:
	setvar VAR_SPECIAL_x8003, 51
	goto scr_seq_00000029_00000B4A

scr_seq_00000029_00000B26:
	setvar VAR_SPECIAL_x8003, 216
	goto scr_seq_00000029_00000B4A

scr_seq_00000029_00000B32:
	setvar VAR_SPECIAL_x8003, 29
	goto scr_seq_00000029_00000B4A

scr_seq_00000029_00000B3E:
	setvar VAR_SPECIAL_x8003, 1
	goto scr_seq_00000029_00000B4A

scr_seq_00000029_00000B4A:
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8003
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000029_00000B75
	callstd 2033
	goto scr_seq_00000029_00000B98

scr_seq_00000029_00000B75:
	copyvar VAR_UNK_4136, VAR_SPECIAL_x8002
	msgbox 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000029_00000B86:
	scrcmd_190 0
	msgbox 43
	copyvar VAR_SPECIAL_x8002, VAR_UNK_4136
	goto scr_seq_00000029_00000AC3

scr_seq_00000029_00000B98:
	setvar VAR_UNK_4136, 0
	setflag FLAG_UNK_AA6
	msgbox 44
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
