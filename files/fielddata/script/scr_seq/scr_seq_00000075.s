#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000075_00000177 ; 000
	scrdef scr_seq_00000075_00000246 ; 001
	scrdef scr_seq_00000075_000002D3 ; 002
	scrdef scr_seq_00000075_0000033E ; 003
	scrdef scr_seq_00000075_000003A3 ; 004
	scrdef scr_seq_00000075_00000408 ; 005
	scrdef scr_seq_00000075_0000002A ; 006
	scrdef scr_seq_00000075_00000126 ; 007
	scrdef scr_seq_00000075_00000156 ; 008
	scrdef scr_seq_00000075_000001D3 ; 009
	scrdef_end

scr_seq_00000075_0000002A:
	comparevartovalue VAR_UNK_4151, 2
	gotoif ne, scr_seq_00000075_0000004C
	scrcmd_412 55, 2, 16393
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif eq, scr_seq_00000075_000000EA
scr_seq_00000075_0000004C:
	clearflag FLAG_UNK_2AD
scr_seq_00000075_00000050:
	comparevartovalue VAR_UNK_4151, 2
	gotoif ne, scr_seq_00000075_00000072
	scrcmd_412 55, 2, 16393
	comparevartovalue VAR_TEMP_x4009, 1
	gotoif eq, scr_seq_00000075_000000F6
scr_seq_00000075_00000072:
	clearflag FLAG_UNK_2AE
scr_seq_00000075_00000076:
	comparevartovalue VAR_UNK_4151, 2
	gotoif ne, scr_seq_00000075_00000098
	scrcmd_412 55, 2, 16393
	comparevartovalue VAR_TEMP_x4009, 2
	gotoif eq, scr_seq_00000075_00000102
scr_seq_00000075_00000098:
	clearflag FLAG_UNK_2AF
scr_seq_00000075_0000009C:
	comparevartovalue VAR_UNK_4151, 2
	gotoif ne, scr_seq_00000075_000000BE
	scrcmd_412 55, 2, 16393
	comparevartovalue VAR_TEMP_x4009, 3
	gotoif eq, scr_seq_00000075_0000010E
scr_seq_00000075_000000BE:
	clearflag FLAG_UNK_2B0
scr_seq_00000075_000000C2:
	comparevartovalue VAR_UNK_4151, 2
	gotoif ne, scr_seq_00000075_000000E4
	scrcmd_412 55, 2, 16393
	comparevartovalue VAR_TEMP_x4009, 4
	gotoif eq, scr_seq_00000075_0000011A
scr_seq_00000075_000000E4:
	clearflag FLAG_UNK_2B1
scr_seq_00000075_000000E8:
	end

scr_seq_00000075_000000EA:
	setflag FLAG_UNK_2AD
	goto scr_seq_00000075_00000050

scr_seq_00000075_000000F4:
	.byte 0x02, 0x00
scr_seq_00000075_000000F6:
	setflag FLAG_UNK_2AE
	goto scr_seq_00000075_00000076

scr_seq_00000075_00000100:
	.byte 0x02, 0x00
scr_seq_00000075_00000102:
	setflag FLAG_UNK_2AF
	goto scr_seq_00000075_0000009C

scr_seq_00000075_0000010C:
	.byte 0x02, 0x00
scr_seq_00000075_0000010E:
	setflag FLAG_UNK_2B0
	goto scr_seq_00000075_000000C2

scr_seq_00000075_00000118:
	.byte 0x02, 0x00
scr_seq_00000075_0000011A:
	setflag FLAG_UNK_2B1
	goto scr_seq_00000075_000000E8

scr_seq_00000075_00000124:
	.byte 0x02, 0x00
scr_seq_00000075_00000126:
	comparevartovalue VAR_UNK_4151, 1
	callif eq, scr_seq_00000075_00000142
	comparevartovalue VAR_UNK_4151, 2
	gotoif eq, scr_seq_00000075_00000148
	end

scr_seq_00000075_00000142:
	scrcmd_375 255
	return

scr_seq_00000075_00000148:
	show_person_at 0, 8, 0, 3, 1
	end

scr_seq_00000075_00000156:
	scrcmd_609
	lockall
	setvar VAR_UNK_4151, 0
	call scr_seq_00000075_0000048B
	msgbox 0
	closemsg
	scrcmd_412 56, 0, 0
	releaseall
	end

scr_seq_00000075_00000177:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	msgbox 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000075_000001A3
	msgbox 0
	closemsg
	releaseall
	end

scr_seq_00000075_000001A3:
	closemsg
	releaseall
	setvar VAR_UNK_414B, 3
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 265, 0, 11, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	end

scr_seq_00000075_000001D3:
	scrcmd_609
	lockall
	setvar VAR_UNK_4151, 0
	msgbox 2
	closemsg
	call scr_seq_00000075_000004C5
	setvar VAR_UNK_414D, 2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 266, 0, 3, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000075_00000216:
	scrcmd_413 16393, 0, 32772, 32773
	scrcmd_202 0, 32772, 0, 0
	scrcmd_197 1, 32773
	scrcmd_413 16393, 1, 32772, 32773
	scrcmd_202 2, 32772, 0, 0
	scrcmd_197 3, 32773
	return

scr_seq_00000075_00000246:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4151, 2
	gotoif eq, scr_seq_00000075_000002A7
	setvar VAR_TEMP_x4009, 0
	scrcmd_413 16393, 0, 32772, 32773
	scrcmd_846 0, VAR_SPECIAL_x8004, 0, 0
	scrcmd_197 1, 32773
	scrcmd_413 16393, 1, 32772, 32773
	scrcmd_846 2, VAR_SPECIAL_x8004, 0, 0
	scrcmd_197 3, 32773
	msgbox 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000075_000002B2
scr_seq_00000075_000002A7:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000075_000002B2:
	scrcmd_412 50, 16393, 0
	setvar VAR_UNK_4151, 2
	msgbox 8
	closemsg
	releaseall
	scrcmd_098 1
	goto scr_seq_00000075_00000541

scr_seq_00000075_000002D1:
	.byte 0x02, 0x00
scr_seq_00000075_000002D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4151, 2
	gotoif eq, scr_seq_00000075_0000030F
	setvar VAR_TEMP_x4009, 1
	call scr_seq_00000075_00000216
	buffer_players_name 4
	msgbox 15
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000075_0000031A
scr_seq_00000075_0000030F:
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000075_0000031A:
	scrcmd_412 50, 16393, 0
	setvar VAR_UNK_4151, 2
	buffer_players_name 0
	msgbox 17
	closemsg
	releaseall
	scrcmd_098 2
	goto scr_seq_00000075_00000586

scr_seq_00000075_0000033C:
	.byte 0x02, 0x00
scr_seq_00000075_0000033E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4151, 2
	gotoif eq, scr_seq_00000075_00000377
	setvar VAR_TEMP_x4009, 2
	call scr_seq_00000075_00000216
	msgbox 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000075_00000382
scr_seq_00000075_00000377:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000075_00000382:
	scrcmd_412 50, 16393, 0
	setvar VAR_UNK_4151, 2
	msgbox 5
	closemsg
	releaseall
	scrcmd_098 3
	goto scr_seq_00000075_000005CB

scr_seq_00000075_000003A1:
	.byte 0x02, 0x00
scr_seq_00000075_000003A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4151, 2
	gotoif eq, scr_seq_00000075_000003DC
	setvar VAR_TEMP_x4009, 3
	call scr_seq_00000075_00000216
	msgbox 12
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000075_000003E7
scr_seq_00000075_000003DC:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000075_000003E7:
	scrcmd_412 50, 16393, 0
	setvar VAR_UNK_4151, 2
	msgbox 14
	closemsg
	releaseall
	scrcmd_098 4
	goto scr_seq_00000075_00000610

scr_seq_00000075_00000406:
	.byte 0x02, 0x00
scr_seq_00000075_00000408:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4151, 2
	gotoif eq, scr_seq_00000075_00000441
	setvar VAR_TEMP_x4009, 4
	call scr_seq_00000075_00000216
	msgbox 9
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000075_0000044C
scr_seq_00000075_00000441:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000075_0000044C:
	scrcmd_412 50, 16393, 0
	setvar VAR_UNK_4151, 2
	msgbox 11
	closemsg
	releaseall
	scrcmd_098 5
	goto scr_seq_00000075_00000655

scr_seq_00000075_0000046B:
	.byte 0x02, 0x00
scr_seq_00000075_0000046D:
	scrcmd_307 0, 0, 8, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_00000075_00000480:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_00000075_0000048B:
	call scr_seq_00000075_0000046D
	apply_movement 0, scr_seq_00000075_000006AC
	wait_movement
	scrcmd_374 255
	apply_movement 255, scr_seq_00000075_0000069C
	wait_movement
	call scr_seq_00000075_00000480
	apply_movement 0, scr_seq_00000075_000006BC
	wait_movement
	apply_movement 255, scr_seq_00000075_000006A4
	wait_movement
	return

scr_seq_00000075_000004C5:
	call scr_seq_00000075_0000046D
	apply_movement 0, scr_seq_00000075_000006F0
	apply_movement 255, scr_seq_00000075_000006E4
	wait_movement
	call scr_seq_00000075_00000480
	return

scr_seq_00000075_000004E5:
	apply_movement VAR_TEMP_x4000, scr_seq_00000075_000006FC
	wait_movement
	apply_movement 0, scr_seq_00000075_000006C8
	wait_movement
	call scr_seq_00000075_0000046D
	apply_movement VAR_TEMP_x4000, scr_seq_00000075_00000704
	wait_movement
	call scr_seq_00000075_00000480
	apply_movement 0, scr_seq_00000075_000006D8
	wait_movement
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 271, 0, 8, 4, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000075_00000541:
	setvar VAR_TEMP_x4000, 1
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8000, 12
	gotoif eq, scr_seq_00000075_00000562
	goto scr_seq_00000075_00000574

scr_seq_00000075_00000560:
	.byte 0x02, 0x00
scr_seq_00000075_00000562:
	apply_movement 1, scr_seq_00000075_00000710
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_00000572:
	.byte 0x02, 0x00
scr_seq_00000075_00000574:
	apply_movement 1, scr_seq_00000075_00000724
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_00000584:
	.byte 0x02, 0x00
scr_seq_00000075_00000586:
	setvar VAR_TEMP_x4000, 2
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8000, 4
	gotoif eq, scr_seq_00000075_000005A7
	goto scr_seq_00000075_000005B9

scr_seq_00000075_000005A5:
	.byte 0x02, 0x00
scr_seq_00000075_000005A7:
	apply_movement 2, scr_seq_00000075_0000073C
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_000005B7:
	.byte 0x02, 0x00
scr_seq_00000075_000005B9:
	apply_movement 2, scr_seq_00000075_0000074C
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_000005C9:
	.byte 0x02, 0x00
scr_seq_00000075_000005CB:
	setvar VAR_TEMP_x4000, 3
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 7
	gotoif eq, scr_seq_00000075_000005EC
	goto scr_seq_00000075_000005FE

scr_seq_00000075_000005EA:
	.byte 0x02, 0x00
scr_seq_00000075_000005EC:
	apply_movement 3, scr_seq_00000075_00000758
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_000005FC:
	.byte 0x02, 0x00
scr_seq_00000075_000005FE:
	apply_movement 3, scr_seq_00000075_00000768
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_0000060E:
	.byte 0x02, 0x00
scr_seq_00000075_00000610:
	setvar VAR_TEMP_x4000, 4
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 9
	gotoif eq, scr_seq_00000075_00000631
	goto scr_seq_00000075_00000643

scr_seq_00000075_0000062F:
	.byte 0x02
	.byte 0x00
scr_seq_00000075_00000631:
	apply_movement 4, scr_seq_00000075_00000774
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_00000641:
	.byte 0x02, 0x00
scr_seq_00000075_00000643:
	apply_movement 4, scr_seq_00000075_00000788
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_00000653:
	.byte 0x02, 0x00
scr_seq_00000075_00000655:
	setvar VAR_TEMP_x4000, 5
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8000, 8
	gotoif eq, scr_seq_00000075_00000676
	goto scr_seq_00000075_00000688

scr_seq_00000075_00000674:
	.byte 0x02, 0x00
scr_seq_00000075_00000676:
	apply_movement 5, scr_seq_00000075_0000079C
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_00000686:
	.byte 0x02, 0x00
scr_seq_00000075_00000688:
	apply_movement 5, scr_seq_00000075_000007AC
	wait_movement
	goto scr_seq_00000075_000004E5

scr_seq_00000075_00000698:
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000075_0000069C:
	.short 13, 2
	.short 254, 0

scr_seq_00000075_000006A4:
	.short 0, 1
	.short 254, 0

scr_seq_00000075_000006AC:
	.short 13, 2
	.short 14, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000075_000006BC:
	.short 15, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000075_000006C8:
	.short 1, 1
	.short 18, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000075_000006D8:
	.short 19, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000075_000006E4:
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000075_000006F0:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000075_000006FC:
	.short 0, 1
	.short 254, 0

scr_seq_00000075_00000704:
	.short 16, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000075_00000710:
	.short 17, 1
	.short 18, 3
	.short 16, 7
	.short 18, 2
	.short 254, 0

scr_seq_00000075_00000724:
	.short 18, 1
	.short 16, 1
	.short 18, 2
	.short 16, 5
	.short 18, 2
	.short 254, 0

scr_seq_00000075_0000073C:
	.short 19, 1
	.short 16, 2
	.short 19, 3
	.short 254, 0

scr_seq_00000075_0000074C:
	.short 16, 2
	.short 19, 4
	.short 254, 0

scr_seq_00000075_00000758:
	.short 18, 1
	.short 16, 4
	.short 18, 2
	.short 254, 0

scr_seq_00000075_00000768:
	.short 16, 4
	.short 18, 3
	.short 254, 0

scr_seq_00000075_00000774:
	.short 17, 1
	.short 19, 4
	.short 16, 7
	.short 19, 2
	.short 254, 0

scr_seq_00000075_00000788:
	.short 16, 1
	.short 19, 4
	.short 16, 5
	.short 19, 2
	.short 254, 0

scr_seq_00000075_0000079C:
	.short 18, 1
	.short 16, 5
	.short 19, 2
	.short 254, 0

scr_seq_00000075_000007AC:
	.short 19, 3
	.short 16, 5
	.short 18, 2
	.short 254, 0
	.balign 4, 0
