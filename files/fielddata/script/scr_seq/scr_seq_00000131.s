#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000131_000000CC ; 000
	scrdef scr_seq_00000131_000000CE ; 001
	scrdef scr_seq_00000131_00000022 ; 002
	scrdef scr_seq_00000131_00000444 ; 003
	scrdef scr_seq_00000131_000003DC ; 004
	scrdef scr_seq_00000131_000004AC ; 005
	scrdef scr_seq_00000131_00000095 ; 006
	scrdef scr_seq_00000131_00000069 ; 007
	scrdef_end

scr_seq_00000131_00000022:
	comparevartovalue VAR_UNK_40FB, 7
	gotoif eq, scr_seq_00000131_00000065
	comparevartovalue VAR_UNK_40FB, 8
	gotoif eq, scr_seq_00000131_00000065
	comparevartovalue VAR_UNK_40FB, 9
	gotoif eq, scr_seq_00000131_00000065
	comparevartovalue VAR_UNK_40FB, 12
	gotoif eq, scr_seq_00000131_00000065
	comparevartovalue VAR_UNK_40FB, 13
	gotoif eq, scr_seq_00000131_00000065
	end

scr_seq_00000131_00000065:
	scrcmd_818
	end

scr_seq_00000131_00000069:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000131_000000C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40FB, 13
	releaseall
	end

scr_seq_00000131_00000095:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000131_000000C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40FB, 4
	releaseall
	end

scr_seq_00000131_000000C1:
	.byte 0x00, 0x00, 0x00

scr_seq_00000131_000000C4:
	.short 13, 2
	.short 254, 0
scr_seq_00000131_000000CC:
	end

scr_seq_00000131_000000CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40FB, 8
	gotoif eq, scr_seq_00000131_00000165
	scrcmd_529 VAR_TEMP_x4005
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif eq, scr_seq_00000131_0000011A
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_00000131_0000011A
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000131_0000011A:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_00000131_00000154
	msgbox 0
	closemsg
	scrcmd_332 VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ge, scr_seq_00000131_00000154
	apply_movement 0, scr_seq_00000131_000002CC
	wait_movement
	msgbox 6
	closemsg
	goto scr_seq_00000131_00000170

scr_seq_00000131_00000152:
	.byte 0x02, 0x00
scr_seq_00000131_00000154:
	msgbox 2
	waitbutton
	closemsg
	setvar VAR_TEMP_x4004, 1
	releaseall
	end

scr_seq_00000131_00000165:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000131_00000170:
	setvar VAR_UNK_40FB, 8
	setvar VAR_UNK_4104, 1
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000131_0000019B
	apply_movement 0, scr_seq_00000131_000002B4
	goto scr_seq_00000131_000001BE

scr_seq_00000131_0000019B:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_00000131_000001B6
	apply_movement 0, scr_seq_00000131_000002BC
	goto scr_seq_00000131_000001BE

scr_seq_00000131_000001B6:
	apply_movement 0, scr_seq_00000131_000002C4
scr_seq_00000131_000001BE:
	wait_movement
	msgbox 4
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_00000131_000001EA
	apply_movement 0, scr_seq_00000131_000002D4
	goto scr_seq_00000131_000001F2

scr_seq_00000131_000001EA:
	apply_movement 0, scr_seq_00000131_000002E0
scr_seq_00000131_000001F2:
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000131_00000217
	apply_movement 255, scr_seq_00000131_00000390
	apply_movement 0, scr_seq_00000131_00000308
	goto scr_seq_00000131_0000024A

scr_seq_00000131_00000217:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_00000131_0000023A
	apply_movement 255, scr_seq_00000131_000003A0
	apply_movement 0, scr_seq_00000131_00000308
	goto scr_seq_00000131_0000024A

scr_seq_00000131_0000023A:
	apply_movement 255, scr_seq_00000131_000003B4
	apply_movement 0, scr_seq_00000131_000002EC
scr_seq_00000131_0000024A:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 5
	closemsg
	apply_movement 0, scr_seq_00000131_00000324
	wait_movement
	msgbox 7
	closemsg
	apply_movement 0, scr_seq_00000131_00000334
	wait_movement
	msgbox 8
	closemsg
	apply_movement 0, scr_seq_00000131_00000348
	wait_movement
	msgbox 9
	closemsg
	apply_movement 0, scr_seq_00000131_00000364
	wait_movement
	msgbox 10
	closemsg
	apply_movement 0, scr_seq_00000131_00000370
	apply_movement 255, scr_seq_00000131_000003C8
	wait_movement
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000131_000002B4:
	.short 33, 1
	.short 254, 0

scr_seq_00000131_000002BC:
	.short 34, 1
	.short 254, 0

scr_seq_00000131_000002C4:
	.short 35, 1
	.short 254, 0

scr_seq_00000131_000002CC:
	.short 32, 1
	.short 254, 0

scr_seq_00000131_000002D4:
	.short 14, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000131_000002E0:
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000131_000002EC:
	.short 65, 1
	.short 15, 1
	.short 12, 3
	.short 15, 1
	.short 12, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000131_00000308:
	.short 65, 1
	.short 14, 1
	.short 12, 3
	.short 15, 1
	.short 12, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000131_00000324:
	.short 15, 3
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000131_00000334:
	.short 13, 1
	.short 14, 8
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000131_00000348:
	.short 12, 3
	.short 15, 2
	.short 12, 3
	.short 15, 2
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000364:
	.short 13, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000370:
	.short 15, 1
	.short 13, 6
	.short 14, 1
	.short 32, 1
	.short 254, 0
	.byte 0x21, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000131_00000390:
	.short 12, 6
	.short 65, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000131_000003A0:
	.short 15, 1
	.short 12, 5
	.short 65, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000131_000003B4:
	.short 14, 1
	.short 12, 5
	.short 65, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000131_000003C8:
	.short 63, 2
	.short 35, 1
	.short 63, 3
	.short 35, 1
	.short 254, 0
scr_seq_00000131_000003DC:
	scrcmd_609
	lockall
	comparevartovalue VAR_UNK_40FB, 13
	gotoif lt, scr_seq_00000131_00000430
	comparevartovalue VAR_UNK_4103, 1
	gotoif eq, scr_seq_00000131_00000545
	call scr_seq_00000131_00000550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, scr_seq_00000131_00000633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, scr_seq_00000131_0000061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, scr_seq_00000131_00000628
	msgbox 27
	goto scr_seq_00000131_00000433

scr_seq_00000131_00000430:
	msgbox 13
scr_seq_00000131_00000433:
	scrcmd_820 1
	setvar VAR_TEMP_x4009, 483
	goto scr_seq_00000131_00000514

scr_seq_00000131_00000442:
	.byte 0x02, 0x00
scr_seq_00000131_00000444:
	scrcmd_609
	lockall
	comparevartovalue VAR_UNK_40FB, 13
	gotoif lt, scr_seq_00000131_00000498
	comparevartovalue VAR_UNK_4103, 2
	gotoif eq, scr_seq_00000131_00000545
	call scr_seq_00000131_00000550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, scr_seq_00000131_00000633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, scr_seq_00000131_0000061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, scr_seq_00000131_00000628
	msgbox 28
	goto scr_seq_00000131_0000049B

scr_seq_00000131_00000498:
	msgbox 14
scr_seq_00000131_0000049B:
	scrcmd_820 2
	setvar VAR_TEMP_x4009, 484
	goto scr_seq_00000131_00000514

scr_seq_00000131_000004AA:
	.byte 0x02, 0x00
scr_seq_00000131_000004AC:
	scrcmd_609
	lockall
	comparevartovalue VAR_UNK_40FB, 13
	gotoif lt, scr_seq_00000131_00000500
	comparevartovalue VAR_UNK_4103, 3
	gotoif eq, scr_seq_00000131_00000545
	call scr_seq_00000131_00000550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, scr_seq_00000131_00000633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, scr_seq_00000131_0000061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, scr_seq_00000131_00000628
	msgbox 29
	goto scr_seq_00000131_00000503

scr_seq_00000131_00000500:
	msgbox 15
scr_seq_00000131_00000503:
	scrcmd_820 3
	setvar VAR_TEMP_x4009, 487
	goto scr_seq_00000131_00000514

scr_seq_00000131_00000512:
	.byte 0x02, 0x00
scr_seq_00000131_00000514:
	scrcmd_490 16393
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000131_0000063E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000131_0000053C
	end

scr_seq_00000131_0000053C:
	closemsg
	scrcmd_820 0
	releaseall
	end

scr_seq_00000131_00000545:
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000131_00000550:
	scrcmd_332 VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_00000131_0000056D
	scrcmd_490 16392
	setvar VAR_TEMP_x400A, 2
	return

scr_seq_00000131_0000056D:
	scrcmd_529 VAR_TEMP_x4000
	comparevartovalue VAR_UNK_4102, 1
	gotoif ne, scr_seq_00000131_000005B2
	scrcmd_698 1, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000131_00000605
	scrcmd_698 2, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000131_0000060D
	goto scr_seq_00000131_00000615

scr_seq_00000131_000005AC:
	.byte 0x16, 0x00, 0x47, 0x00
	.byte 0x00, 0x00
scr_seq_00000131_000005B2:
	comparevartovalue VAR_UNK_4102, 2
	gotoif ne, scr_seq_00000131_000005F3
	scrcmd_698 2, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000131_00000605
	scrcmd_698 1, 16384, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000131_0000060D
	goto scr_seq_00000131_00000615

scr_seq_00000131_000005ED:
	.byte 0x16, 0x00, 0x06
	.byte 0x00, 0x00, 0x00
scr_seq_00000131_000005F3:
	goto scr_seq_00000131_00000615

scr_seq_00000131_000005F9:
	.byte 0xea, 0x01, 0x07, 0x40, 0x29, 0x00, 0x0a
	.byte 0x40, 0x02, 0x00, 0x1b, 0x00
scr_seq_00000131_00000605:
	setvar VAR_TEMP_x400A, 1
	return

scr_seq_00000131_0000060D:
	setvar VAR_TEMP_x400A, 3
	return

scr_seq_00000131_00000615:
	setvar VAR_TEMP_x400A, 0
	return

scr_seq_00000131_0000061D:
	msgbox 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000131_00000628:
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000131_00000633:
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000131_0000063E:
	closemsg
	comparevartovalue VAR_UNK_40FB, 13
	gotoif ne, scr_seq_00000131_00000659
	setvar VAR_UNK_40FB, 14
	goto scr_seq_00000131_0000065F

scr_seq_00000131_00000659:
	setvar VAR_UNK_40FB, 9
scr_seq_00000131_0000065F:
	scrcmd_820 0
	setvar VAR_UNK_4104, 0
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, scr_seq_00000131_00000691
	goto scr_seq_00000131_000006B0

scr_seq_00000131_0000068B:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00
	.byte 0x00
scr_seq_00000131_00000691:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, scr_seq_00000131_000006AA
	goto scr_seq_00000131_00000731

scr_seq_00000131_000006A4:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000131_000006AA:
	goto scr_seq_00000131_000007B2

scr_seq_00000131_000006B0:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000131_000006D3
	apply_movement 253, scr_seq_00000131_00000BE4
	apply_movement 241, scr_seq_00000131_00000C28
	goto scr_seq_00000131_00000729

scr_seq_00000131_000006D3:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_00000131_000006F6
	apply_movement 253, scr_seq_00000131_00000BF4
	apply_movement 241, scr_seq_00000131_00000C28
	goto scr_seq_00000131_00000729

scr_seq_00000131_000006F6:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_00000131_00000719
	apply_movement 253, scr_seq_00000131_00000C08
	apply_movement 241, scr_seq_00000131_00000C28
	goto scr_seq_00000131_00000729

scr_seq_00000131_00000719:
	apply_movement 253, scr_seq_00000131_00000C18
	apply_movement 241, scr_seq_00000131_00000C28
scr_seq_00000131_00000729:
	wait_movement
	goto scr_seq_00000131_00000833

scr_seq_00000131_00000731:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000131_00000754
	apply_movement 253, scr_seq_00000131_00000C34
	apply_movement 241, scr_seq_00000131_00000C78
	goto scr_seq_00000131_000007AA

scr_seq_00000131_00000754:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_00000131_00000777
	apply_movement 253, scr_seq_00000131_00000C44
	apply_movement 241, scr_seq_00000131_00000C78
	goto scr_seq_00000131_000007AA

scr_seq_00000131_00000777:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_00000131_0000079A
	apply_movement 253, scr_seq_00000131_00000C54
	apply_movement 241, scr_seq_00000131_00000C78
	goto scr_seq_00000131_000007AA

scr_seq_00000131_0000079A:
	apply_movement 253, scr_seq_00000131_00000C68
	apply_movement 241, scr_seq_00000131_00000C78
scr_seq_00000131_000007AA:
	wait_movement
	goto scr_seq_00000131_00000833

scr_seq_00000131_000007B2:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000131_000007D5
	apply_movement 253, scr_seq_00000131_00000C84
	apply_movement 241, scr_seq_00000131_00000CC4
	goto scr_seq_00000131_0000082B

scr_seq_00000131_000007D5:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, scr_seq_00000131_000007F8
	apply_movement 253, scr_seq_00000131_00000C90
	apply_movement 241, scr_seq_00000131_00000CC4
	goto scr_seq_00000131_0000082B

scr_seq_00000131_000007F8:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_00000131_0000081B
	apply_movement 253, scr_seq_00000131_00000CA0
	apply_movement 241, scr_seq_00000131_00000CC4
	goto scr_seq_00000131_0000082B

scr_seq_00000131_0000081B:
	apply_movement 253, scr_seq_00000131_00000CB0
	apply_movement 241, scr_seq_00000131_00000CC4
scr_seq_00000131_0000082B:
	wait_movement
	goto scr_seq_00000131_00000833

scr_seq_00000131_00000833:
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_TAMASYUTUGEN
	scrcmd_816
	scrcmd_074 2366
	scrcmd_773 2
	comparevartovalue VAR_UNK_40FB, 14
	gotoif eq, scr_seq_00000131_0000086E
	scrcmd_099 0
	show_person_at 0, 16, 1, 28, 0
	wait 5, VAR_SPECIAL_x800C
	scrcmd_098 0
scr_seq_00000131_0000086E:
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, scr_seq_00000131_00000889
	apply_movement 255, scr_seq_00000131_00000CCC
	goto scr_seq_00000131_000008AC

scr_seq_00000131_00000889:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, scr_seq_00000131_000008A4
	apply_movement 255, scr_seq_00000131_00000CD8
	goto scr_seq_00000131_000008AC

scr_seq_00000131_000008A4:
	apply_movement 255, scr_seq_00000131_00000CE4
scr_seq_00000131_000008AC:
	wait 150, VAR_SPECIAL_x800C
	scrcmd_174 6, 30, 1, 0
	scrcmd_175
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_490 32772
	scrcmd_490 32773
	apply_movement 241, scr_seq_00000131_00000CF0
	wait_movement
	play_se SEQ_SE_GS_TAMASYUTUGEN
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, scr_seq_00000131_000008F6
	scrcmd_817 0
	goto scr_seq_00000131_0000090F

scr_seq_00000131_000008F6:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, scr_seq_00000131_0000090C
	scrcmd_817 1
	goto scr_seq_00000131_0000090F

scr_seq_00000131_0000090C:
	scrcmd_817 2
scr_seq_00000131_0000090F:
	scrcmd_074 2322
	apply_movement 255, scr_seq_00000131_00000D0C
	wait_movement
	scrcmd_819
	wait 2, VAR_SPECIAL_x800C
	msgbox 25
	scrcmd_490 16393
	scrcmd_190 0
	scrcmd_202 1, 16393, 0, 0
	play_fanfare SEQ_ME_SHINKAOME
	msgbox 26
	wait_fanfare
	closemsg
	apply_movement 241, scr_seq_00000131_00000CF8
	wait_movement
	scrcmd_103
	reset_bgm
	scrcmd_490 16393
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, scr_seq_00000131_0000097B
	scrcmd_137 483, 1, 135, 0, 0, 32780
	setvar VAR_UNK_4103, 1
	goto scr_seq_00000131_000009B6

scr_seq_00000131_0000097B:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, scr_seq_00000131_000009A2
	scrcmd_137 484, 1, 136, 0, 0, 32780
	setvar VAR_UNK_4103, 2
	goto scr_seq_00000131_000009B6

scr_seq_00000131_000009A2:
	scrcmd_137 487, 1, 112, 1, 26, 32780
	setvar VAR_UNK_4103, 3
scr_seq_00000131_000009B6:
	scrcmd_746
	msgbox 32
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	scrcmd_815 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_00000131_00000BB2
	comparevartovalue VAR_UNK_40FB, 14
	gotoif eq, scr_seq_00000131_00000A4D
	apply_movement 0, scr_seq_00000131_00000D28
	apply_movement 255, scr_seq_00000131_00000D00
	apply_movement 253, scr_seq_00000131_00000D1C
	wait_movement
	msgbox 16
	closemsg
	apply_movement 0, scr_seq_00000131_00000D4C
	wait_movement
	msgbox 17
	closemsg
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	apply_movement 0, scr_seq_00000131_00000D30
	wait_movement
	msgbox 18
	closemsg
	apply_movement 0, scr_seq_00000131_00000D44
	wait_movement
	msgbox 19
	closemsg
scr_seq_00000131_00000A4D:
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	comparevartovalue VAR_UNK_40FB, 14
	gotoif eq, scr_seq_00000131_00000AAA
	scrcmd_529 VAR_TEMP_x4005
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif ne, scr_seq_00000131_00000AA0
	setvar VAR_UNK_4102, 1
	goto scr_seq_00000131_00000AA6

scr_seq_00000131_00000AA0:
	setvar VAR_UNK_4102, 2
scr_seq_00000131_00000AA6:
	clearflag FLAG_UNK_2E7
scr_seq_00000131_00000AAA:
	play_se SEQ_SE_DP_KAIDAN2
	comparevartovalue VAR_UNK_403E, 6
	gotoif ne, scr_seq_00000131_00000AE5
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 490, 0, 9, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000131_00000BAE

scr_seq_00000131_00000AE5:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ne, scr_seq_00000131_00000B1C
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 492, 0, 9, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000131_00000BAE

scr_seq_00000131_00000B1C:
	comparevartovalue VAR_UNK_403E, 8
	gotoif ne, scr_seq_00000131_00000B53
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 492, 0, 9, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000131_00000BAE

scr_seq_00000131_00000B53:
	comparevartovalue VAR_UNK_403E, 9
	gotoif ne, scr_seq_00000131_00000B8A
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 492, 0, 9, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	goto scr_seq_00000131_00000BAE

scr_seq_00000131_00000B8A:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 315, 0, 9, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000131_00000BAE:
	releaseall
	end

scr_seq_00000131_00000BB2:
	scrcmd_332 VAR_SPECIAL_x800C
	subvar VAR_SPECIAL_x800C, 1
	setvar VAR_TEMP_x4008, 0
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_173 VAR_SPECIAL_x800C, VAR_TEMP_x4008
	scrcmd_819
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	return


scr_seq_00000131_00000BE4:
	.short 11, 4
	.short 8, 4
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000BF4:
	.short 8, 2
	.short 11, 5
	.short 8, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000C08:
	.short 11, 3
	.short 8, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000C18:
	.short 11, 4
	.short 8, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000C28:
	.short 11, 4
	.short 8, 3
	.short 254, 0

scr_seq_00000131_00000C34:
	.short 10, 4
	.short 8, 4
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000C44:
	.short 10, 3
	.short 8, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000C54:
	.short 8, 2
	.short 10, 5
	.short 8, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000C68:
	.short 10, 4
	.short 8, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000C78:
	.short 10, 4
	.short 8, 3
	.short 254, 0

scr_seq_00000131_00000C84:
	.short 9, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000C90:
	.short 9, 4
	.short 11, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000CA0:
	.short 9, 4
	.short 10, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000CB0:
	.short 11, 1
	.short 9, 5
	.short 10, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000131_00000CC4:
	.short 9, 4
	.short 254, 0

scr_seq_00000131_00000CCC:
	.short 23, 4
	.short 0, 1
	.short 254, 0

scr_seq_00000131_00000CD8:
	.short 22, 4
	.short 0, 1
	.short 254, 0

scr_seq_00000131_00000CE4:
	.short 13, 7
	.short 0, 1
	.short 254, 0

scr_seq_00000131_00000CF0:
	.short 12, 3
	.short 254, 0

scr_seq_00000131_00000CF8:
	.short 13, 3
	.short 254, 0

scr_seq_00000131_00000D00:
	.short 65, 2
	.short 13, 2
	.short 254, 0

scr_seq_00000131_00000D0C:
	.short 63, 1
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000131_00000D1C:
	.short 65, 2
	.short 13, 4
	.short 254, 0

scr_seq_00000131_00000D28:
	.short 12, 9
	.short 254, 0

scr_seq_00000131_00000D30:
	.short 3, 1
	.short 63, 3
	.short 2, 1
	.short 63, 3
	.short 254, 0

scr_seq_00000131_00000D44:
	.short 32, 1
	.short 254, 0

scr_seq_00000131_00000D4C:
	.short 63, 1
	.short 33, 1
	.short 254, 0
	.balign 4, 0
