#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000874_0000001E ; 000
	scrdef scr_seq_00000874_0000006D ; 001
	scrdef scr_seq_00000874_00000314 ; 002
	scrdef scr_seq_00000874_0000037C ; 003
	scrdef scr_seq_00000874_00000397 ; 004
	scrdef scr_seq_00000874_00000035 ; 005
	scrdef scr_seq_00000874_000003AA ; 006
	scrdef_end

scr_seq_00000874_0000001E:
	checkflag FLAG_UNK_07B
	gotoif TRUE, scr_seq_00000874_0000002F
	setflag FLAG_UNK_1AB
	end

scr_seq_00000874_0000002F:
	clearflag FLAG_UNK_1AB
	end

scr_seq_00000874_00000035:
	scrcmd_609
	lockall
	setvar VAR_UNK_4080, 3
	apply_movement 0, scr_seq_00000874_000002B0
	wait_movement
	buffer_players_name 0
	msgbox 1
	setvar VAR_SPECIAL_x8004, 492
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	setflag FLAG_UNK_07C
	releaseall
	goto scr_seq_00000874_0000011A

scr_seq_00000874_0000006B:
	.byte 0x02, 0x00
scr_seq_00000874_0000006D:
	checkflag FLAG_UNK_07C
	gotoif TRUE, scr_seq_00000874_0000011A
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	msgbox 0
	scrcmd_049
	closemsg
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000874_000000A7
	goto scr_seq_00000874_000000C7

scr_seq_00000874_000000A1:
	.byte 0x16, 0x00, 0x08, 0x00, 0x00, 0x00
scr_seq_00000874_000000A7:
	apply_movement 0, scr_seq_00000874_000002E0
	wait_movement
scr_seq_00000874_000000B1:
	releaseall
	hide_person 0
	wait_fanfare
	setflag FLAG_UNK_077
	setflag FLAG_UNK_19E
	setflag FLAG_UNK_19F
	end

scr_seq_00000874_000000C7:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_person_coords 253, VAR_TEMP_x4002, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif ne, scr_seq_00000874_000000F4
	apply_movement 0, scr_seq_00000874_000002E8
	goto scr_seq_00000874_00000108

scr_seq_00000874_000000F4:
	play_se SEQ_SE_DP_WALL_HIT
	apply_movement 0, scr_seq_00000874_000002E0
	apply_movement 255, scr_seq_00000874_000002C8
scr_seq_00000874_00000108:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000874_000000B1

scr_seq_00000874_0000011A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_735 32768
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif ne, scr_seq_00000874_000001A5
	scrcmd_738 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000874_0000020F
	apply_movement 0, scr_seq_00000874_000002BC
	wait_movement
	msgbox 4
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_739
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_735 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000874_00000189
	msgbox 6
	goto scr_seq_00000874_00000190

scr_seq_00000874_00000189:
	setflag FLAG_UNK_AA2
	msgbox 5
scr_seq_00000874_00000190:
	waitbutton
	closemsg
	comparevartovalue VAR_UNK_4080, 3
	gotoif eq, scr_seq_00000874_0000022D
	releaseall
	end

scr_seq_00000874_000001A5:
	checkflag FLAG_UNK_AA2
	gotoif TRUE, scr_seq_00000874_00000204
	buffer_players_name 0
	msgbox 8
	scrcmd_737 32772
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8000
	callstd 2033
	scrcmd_736
	comparevartovalue VAR_UNK_413B, 10
	gotoif ge, scr_seq_00000874_000001EE
	addvar VAR_UNK_413B, 1
	comparevartovalue VAR_UNK_413B, 10
	callif ge, scr_seq_00000874_00000227
scr_seq_00000874_000001EE:
	msgbox 10
	goto scr_seq_00000874_0000021F

scr_seq_00000874_000001F7:
	.byte 0x02, 0x00, 0x2d, 0x00, 0x09, 0x16, 0x00, 0x1d, 0x00
	.byte 0x00, 0x00, 0x02, 0x00
scr_seq_00000874_00000204:
	msgbox 7
	goto scr_seq_00000874_0000021F

scr_seq_00000874_0000020D:
	.byte 0x02, 0x00
scr_seq_00000874_0000020F:
	msgbox 3
	comparevartovalue VAR_UNK_4080, 3
	gotoif eq, scr_seq_00000874_0000022D
scr_seq_00000874_0000021F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_00000227:
	setflag FLAG_UNK_127
	return

scr_seq_00000874_0000022D:
	setvar VAR_UNK_4080, 4
	apply_movement 1, scr_seq_00000874_000002FC
	wait_movement
	apply_movement 255, scr_seq_00000874_000002D4
	wait_movement
	msgbox 15
scr_seq_00000874_0000024A:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000874_0000026E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000874_00000289
	end

scr_seq_00000874_0000026E:
	buffer_players_name 0
	msgbox 16
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 5
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_00000289:
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_00000294:
	.byte 0x5e, 0x00, 0x01, 0x00, 0x68, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
scr_seq_00000874_000002A2:
	msgbox 19
	goto scr_seq_00000874_0000024A

scr_seq_00000874_000002AB:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00

scr_seq_00000874_000002B0:
	.short 65, 1
	.short 37, 1
	.short 254, 0

scr_seq_00000874_000002BC:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000874_000002C8:
	.short 18, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000874_000002D4:
	.short 39, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000874_000002E0:
	.short 17, 5
	.short 254, 0

scr_seq_00000874_000002E8:
	.short 18, 1
	.short 17, 2
	.short 19, 1
	.short 17, 3
	.short 254, 0

scr_seq_00000874_000002FC:
	.short 14, 1
	.short 254, 0
	.byte 0x27, 0x00, 0x01, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x26, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_00000874_00000314:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_077
	gotoif TRUE, scr_seq_00000874_00000332
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_00000332:
	checkflag FLAG_UNK_07B
	gotoif TRUE, scr_seq_00000874_00000348
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_00000348:
	scrcmd_147 5, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_00000874_000002A2
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_00000874_00000371
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_00000371:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_0000037C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 79, 0
	msgbox 20
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_00000397:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000874_000003AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_00000874_000003C8
	msgbox 24
	goto scr_seq_00000874_000003F7

scr_seq_00000874_000003C8:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000874_000003DE
	msgbox 24
	goto scr_seq_00000874_000003F7

scr_seq_00000874_000003DE:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000874_000003F4
	msgbox 24
	goto scr_seq_00000874_000003F7

scr_seq_00000874_000003F4:
	msgbox 23
scr_seq_00000874_000003F7:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
