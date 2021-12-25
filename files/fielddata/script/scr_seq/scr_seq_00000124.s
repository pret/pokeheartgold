#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000124_00000046 ; 000
	scrdef scr_seq_00000124_000003F0 ; 001
	scrdef scr_seq_00000124_00000422 ; 002
	scrdef scr_seq_00000124_00000454 ; 003
	scrdef scr_seq_00000124_00000486 ; 004
	scrdef scr_seq_00000124_000004B8 ; 005
	scrdef scr_seq_00000124_000004EA ; 006
	scrdef scr_seq_00000124_0000051C ; 007
	scrdef scr_seq_00000124_0000054F ; 008
	scrdef scr_seq_00000124_00000581 ; 009
	scrdef scr_seq_00000124_000005B0 ; 010
	scrdef scr_seq_00000124_00000620 ; 011
	scrdef scr_seq_00000124_00000652 ; 012
	scrdef scr_seq_00000124_00000684 ; 013
	scrdef scr_seq_00000124_000006B6 ; 014
	scrdef scr_seq_00000124_000006F0 ; 015
	scrdef scr_seq_00000124_0000072A ; 016
	scrdef_end

scr_seq_00000124_00000046:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_074 2147
	callstd 2036
	checkflag FLAG_UNK_0FA
	gotoif lt, scr_seq_00000124_0000006A
	msgbox 1
	goto scr_seq_00000124_00000071

scr_seq_00000124_0000006A:
	msgbox 0
	setflag FLAG_UNK_0FA
scr_seq_00000124_00000071:
	msgbox 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 272, 255, 0
	scrcmd_751 296, 255, 1
	scrcmd_751 297, 255, 2
	scrcmd_751 12, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000124_000003C5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000124_000000D5
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000124_000003D0
	goto scr_seq_00000124_000003DB

scr_seq_00000124_000000D3:
	.byte 0x02, 0x00
scr_seq_00000124_000000D5:
	msgbox 3
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
	gotoif eq, scr_seq_00000124_00000071
	msgbox 4
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000124_00000166
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000124_000001A0
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000124_000001DA
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000124_00000214
	goto scr_seq_00000124_0000024E

scr_seq_00000124_00000164:
	.byte 0x02, 0x00
scr_seq_00000124_00000166:
	setvar VAR_TEMP_x4007, 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 298, 255, 0
	scrcmd_751 299, 255, 1
	scrcmd_751 304, 255, 6
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000124_00000288

scr_seq_00000124_0000019E:
	.byte 0x02, 0x00
scr_seq_00000124_000001A0:
	setvar VAR_TEMP_x4007, 1
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 301, 255, 3
	scrcmd_751 300, 255, 2
	scrcmd_751 307, 255, 9
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000124_00000288

scr_seq_00000124_000001D8:
	.byte 0x02, 0x00
scr_seq_00000124_000001DA:
	setvar VAR_TEMP_x4007, 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 306, 255, 8
	scrcmd_751 307, 255, 9
	scrcmd_751 299, 255, 1
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000124_00000288

scr_seq_00000124_00000212:
	.byte 0x02, 0x00
scr_seq_00000124_00000214:
	setvar VAR_TEMP_x4007, 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 305, 255, 7
	scrcmd_751 304, 255, 6
	scrcmd_751 301, 255, 3
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000124_00000288

scr_seq_00000124_0000024C:
	.byte 0x02, 0x00
scr_seq_00000124_0000024E:
	setvar VAR_TEMP_x4007, 4
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 303, 255, 5
	scrcmd_751 302, 255, 4
	scrcmd_751 298, 255, 0
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000124_00000288

scr_seq_00000124_00000286:
	.byte 0x02, 0x00
scr_seq_00000124_00000288:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000124_00000318
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000124_00000323
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000124_0000032E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000124_00000339
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000124_00000344
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000124_0000034F
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000124_0000035A
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_00000124_00000365
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_00000124_00000370
	comparevartovalue VAR_SPECIAL_x8008, 9
	gotoif eq, scr_seq_00000124_0000037B
	goto scr_seq_00000124_000000D5

scr_seq_00000124_00000316:
	.byte 0x02, 0x00
scr_seq_00000124_00000318:
	msgbox 6
	goto scr_seq_00000124_00000386

scr_seq_00000124_00000321:
	.byte 0x02, 0x00
scr_seq_00000124_00000323:
	msgbox 7
	goto scr_seq_00000124_00000386

scr_seq_00000124_0000032C:
	.byte 0x02, 0x00
scr_seq_00000124_0000032E:
	msgbox 8
	goto scr_seq_00000124_00000386

scr_seq_00000124_00000337:
	.byte 0x02, 0x00
scr_seq_00000124_00000339:
	msgbox 9
	goto scr_seq_00000124_00000386

scr_seq_00000124_00000342:
	.byte 0x02, 0x00
scr_seq_00000124_00000344:
	msgbox 10
	goto scr_seq_00000124_00000386

scr_seq_00000124_0000034D:
	.byte 0x02, 0x00
scr_seq_00000124_0000034F:
	msgbox 11
	goto scr_seq_00000124_00000386

scr_seq_00000124_00000358:
	.byte 0x02, 0x00
scr_seq_00000124_0000035A:
	msgbox 12
	goto scr_seq_00000124_00000386

scr_seq_00000124_00000363:
	.byte 0x02, 0x00
scr_seq_00000124_00000365:
	msgbox 13
	goto scr_seq_00000124_00000386

scr_seq_00000124_0000036E:
	.byte 0x02, 0x00
scr_seq_00000124_00000370:
	msgbox 14
	goto scr_seq_00000124_00000386

scr_seq_00000124_00000379:
	.byte 0x02, 0x00
scr_seq_00000124_0000037B:
	msgbox 15
	goto scr_seq_00000124_00000386

scr_seq_00000124_00000384:
	.byte 0x02, 0x00
scr_seq_00000124_00000386:
	msgbox 4
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, scr_seq_00000124_00000166
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_00000124_000001A0
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, scr_seq_00000124_000001DA
	comparevartovalue VAR_TEMP_x4007, 3
	gotoif eq, scr_seq_00000124_00000214
	goto scr_seq_00000124_0000024E

scr_seq_00000124_000003C3:
	.byte 0x02, 0x00
scr_seq_00000124_000003C5:
	msgbox 5
	goto scr_seq_00000124_00000071

scr_seq_00000124_000003CE:
	.byte 0x02, 0x00
scr_seq_00000124_000003D0:
	msgbox 17
	goto scr_seq_00000124_00000071

scr_seq_00000124_000003D9:
	.byte 0x02, 0x00
scr_seq_00000124_000003DB:
	msgbox 16
	waitbutton
	closemsg
	scrcmd_747
	scrcmd_081 0
	scrcmd_082
	scrcmd_726
	releaseall
	end

scr_seq_00000124_000003F0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 500
	gotoif lt, scr_seq_00000124_00000417
	scrcmd_190 0
	msgbox 25
	goto scr_seq_00000124_0000041A

scr_seq_00000124_00000417:
	msgbox 24
scr_seq_00000124_0000041A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_00000422:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 51
	gotoif lt, scr_seq_00000124_00000449
	scrcmd_190 0
	msgbox 27
	goto scr_seq_00000124_0000044C

scr_seq_00000124_00000449:
	msgbox 26
scr_seq_00000124_0000044C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_00000454:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 150
	gotoif lt, scr_seq_00000124_0000047B
	scrcmd_190 0
	msgbox 29
	goto scr_seq_00000124_0000047E

scr_seq_00000124_0000047B:
	msgbox 28
scr_seq_00000124_0000047E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_00000486:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif lt, scr_seq_00000124_000004AD
	scrcmd_190 0
	msgbox 31
	goto scr_seq_00000124_000004B0

scr_seq_00000124_000004AD:
	msgbox 30
scr_seq_00000124_000004B0:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_000004B8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 10001
	gotoif lt, scr_seq_00000124_000004DF
	scrcmd_190 0
	msgbox 33
	goto scr_seq_00000124_000004E2

scr_seq_00000124_000004DF:
	msgbox 32
scr_seq_00000124_000004E2:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_000004EA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 75
	gotoif lt, scr_seq_00000124_00000511
	scrcmd_190 0
	msgbox 35
	goto scr_seq_00000124_00000514

scr_seq_00000124_00000511:
	msgbox 34
scr_seq_00000124_00000514:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_0000051C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 26
	gotoif lt, scr_seq_00000124_00000544
	scrcmd_190 0
	scrcmd_132 37, 38
	goto scr_seq_00000124_00000547

scr_seq_00000124_00000544:
	msgbox 36
scr_seq_00000124_00000547:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_0000054F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 20001
	gotoif lt, scr_seq_00000124_00000576
	scrcmd_190 0
	msgbox 40
	goto scr_seq_00000124_00000579

scr_seq_00000124_00000576:
	msgbox 39
scr_seq_00000124_00000579:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_00000581:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, scr_seq_00000124_000005A5
	msgbox 43
	goto scr_seq_00000124_000005A8

scr_seq_00000124_000005A5:
	msgbox 41
scr_seq_00000124_000005A8:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_000005B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, scr_seq_00000124_000005D7
	scrcmd_190 0
	msgbox 46
	goto scr_seq_00000124_000005DA

scr_seq_00000124_000005D7:
	msgbox 45
scr_seq_00000124_000005DA:
	closemsg
	apply_movement 13, scr_seq_00000124_00000610
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, scr_seq_00000124_000005FC
	msgbox 44
	goto scr_seq_00000124_000005FF

scr_seq_00000124_000005FC:
	msgbox 42
scr_seq_00000124_000005FF:
	closemsg
	apply_movement 13, scr_seq_00000124_00000618
	wait_movement
	releaseall
	end

scr_seq_00000124_0000060F:
	.byte 0x00

scr_seq_00000124_00000610:
	.short 35, 1
	.short 254, 0

scr_seq_00000124_00000618:
	.short 32, 1
	.short 254, 0
scr_seq_00000124_00000620:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 201
	gotoif lt, scr_seq_00000124_00000647
	scrcmd_190 0
	msgbox 48
	goto scr_seq_00000124_0000064A

scr_seq_00000124_00000647:
	msgbox 47
scr_seq_00000124_0000064A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_00000652:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 250
	gotoif lt, scr_seq_00000124_00000679
	scrcmd_190 0
	msgbox 50
	goto scr_seq_00000124_0000067C

scr_seq_00000124_00000679:
	msgbox 49
scr_seq_00000124_0000067C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_00000684:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 101
	gotoif lt, scr_seq_00000124_000006AB
	scrcmd_190 0
	msgbox 52
	goto scr_seq_00000124_000006AE

scr_seq_00000124_000006AB:
	msgbox 51
scr_seq_00000124_000006AE:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_000006B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	scrcmd_076 19, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, scr_seq_00000124_000006E3
	scrcmd_190 0
	msgbox 19
	goto scr_seq_00000124_000006E6

scr_seq_00000124_000006E3:
	msgbox 18
scr_seq_00000124_000006E6:
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_000006F0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	scrcmd_076 66, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, scr_seq_00000124_0000071D
	scrcmd_190 0
	msgbox 21
	goto scr_seq_00000124_00000720

scr_seq_00000124_0000071D:
	msgbox 20
scr_seq_00000124_00000720:
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000124_0000072A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	scrcmd_076 12, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, scr_seq_00000124_00000757
	scrcmd_190 0
	msgbox 23
	goto scr_seq_00000124_0000075A

scr_seq_00000124_00000757:
	msgbox 22
scr_seq_00000124_0000075A:
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
