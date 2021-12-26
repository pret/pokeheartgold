#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000907_00000120 ; 000
	scrdef scr_seq_00000907_0000004C ; 001
	scrdef scr_seq_00000907_00000061 ; 002
	scrdef scr_seq_00000907_000003D0 ; 003
	scrdef scr_seq_00000907_000003E3 ; 004
	scrdef scr_seq_00000907_000003F6 ; 005
	scrdef scr_seq_00000907_00000409 ; 006
	scrdef scr_seq_00000907_0000041C ; 007
	scrdef scr_seq_00000907_0000042F ; 008
	scrdef scr_seq_00000907_00000442 ; 009
	scrdef scr_seq_00000907_00000455 ; 010
	scrdef scr_seq_00000907_00000468 ; 011
	scrdef scr_seq_00000907_00000503 ; 012
	scrdef scr_seq_00000907_0000059E ; 013
	scrdef scr_seq_00000907_000005B1 ; 014
	scrdef scr_seq_00000907_000005C4 ; 015
	scrdef scr_seq_00000907_00000687 ; 016
	scrdef scr_seq_00000907_000006DC ; 017
	scrdef_end


scr_seq_00000907_0000004A:
	.byte 0x13, 0xfd
scr_seq_00000907_0000004C:
	comparevartovalue VAR_UNK_4133, 6
	callif eq, scr_seq_00000907_0000005B
	end

scr_seq_00000907_0000005B:
	scrcmd_375 255
	return

scr_seq_00000907_00000061:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif eq, scr_seq_00000907_00000084
	goto scr_seq_00000907_0000009D

scr_seq_00000907_0000007E:
	.byte 0x16, 0x00
	.byte 0x13, 0x00, 0x00, 0x00
scr_seq_00000907_00000084:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_00000907_00000097
	goto scr_seq_00000907_0000009D

scr_seq_00000907_00000097:
	call scr_seq_00000907_000000A7
scr_seq_00000907_0000009D:
	setvar VAR_UNK_4133, 0
	releaseall
	end

scr_seq_00000907_000000A7:
	scrcmd_307 0, 0, 8, 2, 77
	call scr_seq_00000907_000000F5
	scrcmd_374 255
	apply_movement 255, scr_seq_00000907_00000108
	wait_movement
	call scr_seq_00000907_000000FD
	scrcmd_307 0, 0, 8, 4, 77
	call scr_seq_00000907_000000F5
	apply_movement 255, scr_seq_00000907_00000118
	wait_movement
	call scr_seq_00000907_000000FD
	setvar VAR_UNK_4133, 0
	return

scr_seq_00000907_000000F5:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_00000907_000000FD:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return


scr_seq_00000907_00000108:
	.short 13, 1
	.short 254, 0
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000907_00000118:
	.short 13, 2
	.short 254, 0
scr_seq_00000907_00000120:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000907_000003C4
	checkflag FLAG_UNK_112
	gotoif TRUE, scr_seq_00000907_00000354
	setflag FLAG_UNK_112
	msgbox 0
scr_seq_00000907_0000014B:
	scrcmd_746
scr_seq_00000907_0000014D:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 131, 255, 0
	scrcmd_751 130, 255, 1
	scrcmd_751 132, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000907_00000227
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000907_000001A4
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000907_00000330
	goto scr_seq_00000907_00000330

scr_seq_00000907_000001A2:
	.byte 0x02, 0x00
scr_seq_00000907_000001A4:
	msgbox 2
	goto scr_seq_00000907_000001AF

scr_seq_00000907_000001AD:
	.byte 0x02, 0x00
scr_seq_00000907_000001AF:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 133, 255, 0
	scrcmd_751 134, 255, 1
	scrcmd_751 135, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000907_00000206
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000907_00000211
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000907_0000021C
	goto scr_seq_00000907_0000021C

scr_seq_00000907_00000204:
	.byte 0x02, 0x00
scr_seq_00000907_00000206:
	msgbox 3
	goto scr_seq_00000907_000001AF

scr_seq_00000907_0000020F:
	.byte 0x02
	.byte 0x00
scr_seq_00000907_00000211:
	msgbox 4
	goto scr_seq_00000907_000001AF

scr_seq_00000907_0000021A:
	.byte 0x02, 0x00
scr_seq_00000907_0000021C:
	msgbox 5
	goto scr_seq_00000907_0000014D

scr_seq_00000907_00000225:
	.byte 0x02, 0x00
scr_seq_00000907_00000227:
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_00000907_00000240
	goto scr_seq_00000907_0000035F

scr_seq_00000907_0000023E:
	.byte 0x02, 0x00
scr_seq_00000907_00000240:
	msgbox 9
	waitbutton
	scrcmd_747
	closemsg
	releaseall
	end

scr_seq_00000907_0000024D:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000907_00000343
	scrcmd_747
	heal_party
	setvar VAR_UNK_4133, 6
	msgbox 7
	closemsg
	apply_movement 255, scr_seq_00000907_000003A0
	wait_movement
	scrcmd_307 0, 0, 8, 4, 77
	call scr_seq_00000907_000000F5
	apply_movement 255, scr_seq_00000907_000003B4
	wait_movement
	call scr_seq_00000907_000000FD
	scrcmd_307 0, 0, 8, 2, 77
	call scr_seq_00000907_000000F5
	apply_movement 255, scr_seq_00000907_000003AC
	wait_movement
	scrcmd_375 255
	apply_movement 255, scr_seq_00000907_000003BC
	wait_movement
	call scr_seq_00000907_000000FD
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_579
	scrcmd_815 0
	scrcmd_166 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_165 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000907_00000314
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	call scr_seq_00000907_000000A7
	releaseall
	end

scr_seq_00000907_00000314:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	call scr_seq_00000907_000000A7
	goto scr_seq_00000907_00000343

scr_seq_00000907_0000032E:
	.byte 0x02, 0x00
scr_seq_00000907_00000330:
	setvar VAR_UNK_4133, 0
	scrcmd_747
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_00000343:
	setvar VAR_UNK_4133, 0
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_00000354:
	msgbox 1
	goto scr_seq_00000907_0000014B

scr_seq_00000907_0000035D:
	.byte 0x02, 0x00
scr_seq_00000907_0000035F:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000907_00000378
	goto scr_seq_00000907_0000024D

scr_seq_00000907_00000376:
	.byte 0x02, 0x00
scr_seq_00000907_00000378:
	scrcmd_507 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000907_00000391
	goto scr_seq_00000907_0000024D

scr_seq_00000907_0000038F:
	.byte 0x02
	.byte 0x00
scr_seq_00000907_00000391:
	scrcmd_747
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_0000039E:
	.byte 0x00, 0x00

scr_seq_00000907_000003A0:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000907_000003AC:
	.short 12, 1
	.short 254, 0

scr_seq_00000907_000003B4:
	.short 12, 2
	.short 254, 0

scr_seq_00000907_000003BC:
	.short 1, 1
	.short 254, 0
scr_seq_00000907_000003C4:
	callstd 9016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_000003D0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_000003E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_000003F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_00000409:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_0000041C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_0000042F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_00000442:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_00000455:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_00000468:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_00000907_0000047C

scr_seq_00000907_0000047A:
	.byte 0x02, 0x00
scr_seq_00000907_0000047C:
	msgbox 31
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 33, 255, 0
	scrcmd_751 34, 255, 1
	scrcmd_751 35, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000907_000004D3
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000907_000004F8
	goto scr_seq_00000907_000004CB

scr_seq_00000907_000004C9:
	.byte 0x02, 0x00
scr_seq_00000907_000004CB:
	scrcmd_747
scr_seq_00000907_000004CD:
	closemsg
	releaseall
	end

scr_seq_00000907_000004D3:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000907_000004CD
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_00000907_000004F8:
	msgbox 32
	goto scr_seq_00000907_0000047C

scr_seq_00000907_00000501:
	.byte 0x02, 0x00
scr_seq_00000907_00000503:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_00000907_00000517

scr_seq_00000907_00000515:
	.byte 0x02, 0x00
scr_seq_00000907_00000517:
	msgbox 29
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 33, 255, 0
	scrcmd_751 34, 255, 1
	scrcmd_751 35, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000907_0000056E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000907_00000593
	goto scr_seq_00000907_00000566

scr_seq_00000907_00000564:
	.byte 0x02, 0x00
scr_seq_00000907_00000566:
	scrcmd_747
scr_seq_00000907_00000568:
	closemsg
	releaseall
	end

scr_seq_00000907_0000056E:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000907_00000568
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_00000907_00000593:
	msgbox 30
	goto scr_seq_00000907_00000517

scr_seq_00000907_0000059C:
	.byte 0x02, 0x00
scr_seq_00000907_0000059E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_000005B1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_000005C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000907_00000622
	setvar VAR_SPECIAL_x8000, 0
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000907_0000064D
	scrcmd_193 0, 0
	msgbox 18
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000907_0000062D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000907_0000063A
	end

scr_seq_00000907_00000622:
	msgbox 23
	goto scr_seq_00000907_0000067F

scr_seq_00000907_0000062B:
	.byte 0x02, 0x00
scr_seq_00000907_0000062D:
	scrcmd_671
	msgbox 20
	goto scr_seq_00000907_0000067F

scr_seq_00000907_00000638:
	.byte 0x02, 0x00
scr_seq_00000907_0000063A:
	scrcmd_193 0, 0
	msgbox 21
	goto scr_seq_00000907_0000067F

scr_seq_00000907_00000648:
	.byte 0x02, 0x00, 0x2d, 0x00, 0x12
scr_seq_00000907_0000064D:
	msgbox 19
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000907_0000062D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000907_00000674
	end

scr_seq_00000907_00000674:
	msgbox 22
	goto scr_seq_00000907_0000067F

scr_seq_00000907_0000067D:
	.byte 0x02, 0x00
scr_seq_00000907_0000067F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_00000687:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000907_000006D1
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_681 32772
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif eq, scr_seq_00000907_000006D1
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_000006D1:
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000907_000006DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 36
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
