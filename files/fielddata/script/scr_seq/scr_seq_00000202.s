#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000202_00000055 ; 000
	scrdef scr_seq_00000202_0000001A ; 001
	scrdef scr_seq_00000202_00000210 ; 002
	scrdef scr_seq_00000202_00000598 ; 003
	scrdef scr_seq_00000202_000005AE ; 004
	scrdef scr_seq_00000202_000005C4 ; 005
	scrdef_end

scr_seq_00000202_0000001A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000202_0000002B
	clearflag FLAG_UNK_189
	end

scr_seq_00000202_0000002B:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000202_0000004F
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000202_0000004F
	setflag FLAG_UNK_27E
	end

scr_seq_00000202_0000004F:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000202_00000055:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000202_0000017D
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000202_00000191
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000202_000000CE
	apply_movement 255, scr_seq_00000202_000001A8
	apply_movement 10, scr_seq_00000202_000001F4
	goto scr_seq_00000202_0000011C

scr_seq_00000202_000000CE:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000202_000000E9
	apply_movement 255, scr_seq_00000202_000001C0
	goto scr_seq_00000202_0000011C

scr_seq_00000202_000000E9:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000202_0000010C
	apply_movement 255, scr_seq_00000202_000001E0
	apply_movement 10, scr_seq_00000202_000001F4
	goto scr_seq_00000202_0000011C

scr_seq_00000202_0000010C:
	apply_movement 255, scr_seq_00000202_000001CC
	apply_movement 10, scr_seq_00000202_000001F4
scr_seq_00000202_0000011C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000202_00000143
	apply_movement 253, scr_seq_00000202_00000200
	wait_movement
scr_seq_00000202_00000143:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 60
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_0000017D:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_00000191:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_000001A5:
	.byte 0x00, 0x00, 0x00

scr_seq_00000202_000001A8:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000202_000001C0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000202_000001CC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000202_000001E0:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000202_000001F4:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000202_00000200:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000202_00000210:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_2A5
	scrcmd_100 12
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 1358
	gotoif ne, scr_seq_00000202_0000024F
	apply_movement 255, scr_seq_00000202_00000450
	wait_movement
	goto scr_seq_00000202_0000027C

scr_seq_00000202_00000249:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000202_0000024F:
	goto scr_seq_00000202_00000255

scr_seq_00000202_00000255:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, scr_seq_00000202_00000272
	apply_movement 255, scr_seq_00000202_00000450
	wait_movement
	goto scr_seq_00000202_0000027C

scr_seq_00000202_00000272:
	apply_movement 255, scr_seq_00000202_00000450
	wait_movement
scr_seq_00000202_0000027C:
	scrcmd_076 245, 0
	scrcmd_099 11
	scrcmd_523 11, 2, 90, 2, 0
	scrcmd_098 11
	scrcmd_077
	comparevartovalue VAR_TEMP_x4000, 1358
	gotoif ne, scr_seq_00000202_000002B1
	goto scr_seq_00000202_000002D0

scr_seq_00000202_000002AB:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00
	.byte 0x00
scr_seq_00000202_000002B1:
	comparevartovalue VAR_TEMP_x4000, 1359
	gotoif ne, scr_seq_00000202_000002CA
	goto scr_seq_00000202_00000382

scr_seq_00000202_000002C4:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000202_000002CA:
	goto scr_seq_00000202_000003AD

scr_seq_00000202_000002D0:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, scr_seq_00000202_000002EB
	apply_movement 255, scr_seq_00000202_000004AC
	goto scr_seq_00000202_0000037A

scr_seq_00000202_000002EB:
	comparevartovalue VAR_TEMP_x4001, 410
	gotoif ne, scr_seq_00000202_00000306
	apply_movement 255, scr_seq_00000202_000004C0
	goto scr_seq_00000202_0000037A

scr_seq_00000202_00000306:
	comparevartovalue VAR_TEMP_x4001, 411
	gotoif ne, scr_seq_00000202_00000321
	apply_movement 255, scr_seq_00000202_000004D0
	goto scr_seq_00000202_0000037A

scr_seq_00000202_00000321:
	comparevartovalue VAR_TEMP_x4001, 412
	gotoif ne, scr_seq_00000202_0000033C
	apply_movement 255, scr_seq_00000202_000004E0
	goto scr_seq_00000202_0000037A

scr_seq_00000202_0000033C:
	comparevartovalue VAR_TEMP_x4001, 413
	gotoif ne, scr_seq_00000202_00000357
	apply_movement 255, scr_seq_00000202_000004E8
	goto scr_seq_00000202_0000037A

scr_seq_00000202_00000357:
	comparevartovalue VAR_TEMP_x4001, 414
	gotoif ne, scr_seq_00000202_00000372
	apply_movement 255, scr_seq_00000202_000004F8
	goto scr_seq_00000202_0000037A

scr_seq_00000202_00000372:
	apply_movement 255, scr_seq_00000202_00000508
scr_seq_00000202_0000037A:
	wait_movement
	goto scr_seq_00000202_000003D2

scr_seq_00000202_00000382:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, scr_seq_00000202_0000039D
	apply_movement 255, scr_seq_00000202_0000051C
	goto scr_seq_00000202_000003A5

scr_seq_00000202_0000039D:
	apply_movement 255, scr_seq_00000202_00000530
scr_seq_00000202_000003A5:
	wait_movement
	goto scr_seq_00000202_000003D2

scr_seq_00000202_000003AD:
	comparevartovalue VAR_TEMP_x4001, 409
	gotoif ne, scr_seq_00000202_000003C8
	apply_movement 255, scr_seq_00000202_00000544
	goto scr_seq_00000202_000003D0

scr_seq_00000202_000003C8:
	apply_movement 255, scr_seq_00000202_00000550
scr_seq_00000202_000003D0:
	wait_movement
scr_seq_00000202_000003D2:
	apply_movement 11, scr_seq_00000202_00000488
	apply_movement 255, scr_seq_00000202_0000055C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd 2042
	apply_movement 12, scr_seq_00000202_0000057C
	apply_movement 255, scr_seq_00000202_0000056C
	wait_movement
	buffer_players_name 0
	msgbox 6
	waitbutton
	closemsg
	callstd 2043
	hide_person 11
	setflag FLAG_UNK_2A0
	setflag FLAG_UNK_2A5
	clearflag FLAG_UNK_2AC
	setvar VAR_UNK_4086, 0
	setflag FLAG_UNK_14D
	scrcmd_294 9, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000202_00000449
	clearflag FLAG_UNK_2A1
	setvar VAR_UNK_4089, 1
scr_seq_00000202_00000449:
	releaseall
	end

scr_seq_00000202_0000044D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000202_00000450:
	.short 75, 1
	.short 254, 0
	.byte 0x3e, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x3e, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000202_00000488:
	.short 20, 2
	.short 52, 1
	.short 56, 1
	.short 20, 2
	.short 52, 1
	.short 56, 2
	.short 20, 2
	.short 52, 1
	.short 254, 0

scr_seq_00000202_000004AC:
	.short 13, 1
	.short 15, 3
	.short 13, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000202_000004C0:
	.short 15, 3
	.short 13, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000202_000004D0:
	.short 15, 3
	.short 13, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000202_000004E0:
	.short 15, 3
	.short 254, 0

scr_seq_00000202_000004E8:
	.short 15, 3
	.short 12, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000202_000004F8:
	.short 15, 3
	.short 12, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000202_00000508:
	.short 12, 1
	.short 15, 3
	.short 12, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000202_0000051C:
	.short 13, 1
	.short 15, 2
	.short 13, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000202_00000530:
	.short 12, 1
	.short 15, 2
	.short 12, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000202_00000544:
	.short 13, 3
	.short 3, 1
	.short 254, 0

scr_seq_00000202_00000550:
	.short 12, 3
	.short 3, 1
	.short 254, 0

scr_seq_00000202_0000055C:
	.short 63, 1
	.short 0, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000202_0000056C:
	.short 65, 5
	.short 2, 1
	.short 254, 0
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_00000202_0000057C:
	.short 16, 11
	.short 12, 2
	.short 4, 1
	.short 63, 3
	.short 9, 1
	.short 3, 1
	.short 254, 0
scr_seq_00000202_00000598:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_000005AE:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_000005C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_15C
	gotoif TRUE, scr_seq_00000202_00000658
	msgbox 0
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000202_00000602
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 113
	gotoif eq, scr_seq_00000202_0000060D
scr_seq_00000202_00000602:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_0000060D:
	apply_movement 17, scr_seq_00000202_00000698
	wait_movement
	msgbox 2
	setvar VAR_SPECIAL_x8004, 256
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000202_0000064E
	callstd 2033
	setflag FLAG_UNK_15C
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_0000064E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000202_00000658:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000202_00000680
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 113
	gotoif eq, scr_seq_00000202_0000068B
scr_seq_00000202_00000680:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_0000068B:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000202_00000696:
	.byte 0x00, 0x00

scr_seq_00000202_00000698:
	.short 75, 1
	.short 62, 1
	.short 254, 0
	.balign 4, 0
