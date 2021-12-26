#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000919_000000DC ; 000
	scrdef scr_seq_00000919_000000ED ; 001
	scrdef scr_seq_00000919_00000100 ; 002
	scrdef scr_seq_00000919_00000113 ; 003
	scrdef scr_seq_00000919_0000001E ; 004
	scrdef scr_seq_00000919_000002DC ; 005
	scrdef scr_seq_00000919_000000C9 ; 006
	scrdef_end

scr_seq_00000919_0000001E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000919_0000002F
	clearflag FLAG_UNK_189
	end

scr_seq_00000919_0000002F:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000919_0000004A
	setflag FLAG_UNK_27E
	goto scr_seq_00000919_0000004E

scr_seq_00000919_0000004A:
	setflag FLAG_UNK_27E
scr_seq_00000919_0000004E:
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_00000919_000000C3
	scrcmd_147 38, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000919_0000008F
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000919_00000087
	clearflag FLAG_UNK_2CB
	goto scr_seq_00000919_0000008D

scr_seq_00000919_00000087:
	goto scr_seq_00000919_000000C3

scr_seq_00000919_0000008D:
	end

scr_seq_00000919_0000008F:
	scrcmd_142 38, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000919_000000C3
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000919_000000BD
	clearflag FLAG_UNK_2CB
	goto scr_seq_00000919_000000C1

scr_seq_00000919_000000BD:
	setflag FLAG_UNK_2CB
scr_seq_00000919_000000C1:
	end

scr_seq_00000919_000000C3:
	setflag FLAG_UNK_2CB
	end

scr_seq_00000919_000000C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_000000DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_000000ED:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_00000100:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_00000113:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000919_0000025E
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000919_00000272
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000919_0000018C
	apply_movement 255, scr_seq_00000919_00000288
	apply_movement 3, scr_seq_00000919_000002C0
	goto scr_seq_00000919_000001B7

scr_seq_00000919_0000018C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000919_000001A7
	apply_movement 255, scr_seq_00000919_000002A0
	goto scr_seq_00000919_000001B7

scr_seq_00000919_000001A7:
	apply_movement 255, scr_seq_00000919_000002AC
	apply_movement 3, scr_seq_00000919_000002C0
scr_seq_00000919_000001B7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000919_000001DE
	apply_movement 253, scr_seq_00000919_000002CC
	wait_movement
scr_seq_00000919_000001DE:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 25
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

scr_seq_00000919_00000218:
	.byte 0x82, 0x01, 0x0c, 0x80, 0x11, 0x00, 0x0c, 0x80
	.byte 0x00, 0x00, 0x1c, 0x00, 0x05, 0x0e, 0x00, 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x57, 0x00, 0x00
	.byte 0x00, 0x16, 0x00, 0x23, 0x00, 0x00, 0x00, 0x11, 0x00, 0x0c, 0x80, 0x01, 0x00, 0x1c, 0x00, 0x05
	.byte 0x0e, 0x00, 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x54, 0x00, 0x00, 0x00, 0x16, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x52, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x1b, 0x00
scr_seq_00000919_0000025E:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_00000272:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_00000286:
	.byte 0x00, 0x00

scr_seq_00000919_00000288:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000919_000002A0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000919_000002AC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000919_000002C0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000919_000002CC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000919_000002DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 38, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000919_0000038A
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_00000919_0000037F
	msgbox 4
scr_seq_00000919_00000307:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000919_0000032B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000919_0000036E
	end

scr_seq_00000919_0000032B:
	buffer_players_name 0
	msgbox 5
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 38
	msgbox 6
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_2CB
	hide_person 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000919_0000036E:
	setvar VAR_TEMP_x4004, 1
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_0000037F:
	msgbox 8
	goto scr_seq_00000919_00000307

scr_seq_00000919_00000388:
	.byte 0x02, 0x00
scr_seq_00000919_0000038A:
	msgbox 9
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000919_000003EB
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000919_000003F6
	msgbox 10
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 89
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_000003EB:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000919_000003F6:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
