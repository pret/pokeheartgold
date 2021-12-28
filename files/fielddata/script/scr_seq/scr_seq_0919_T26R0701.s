#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0919_T26R0701_00DC ; 000
	scrdef scr_seq_0919_T26R0701_00ED ; 001
	scrdef scr_seq_0919_T26R0701_0100 ; 002
	scrdef scr_seq_0919_T26R0701_0113 ; 003
	scrdef scr_seq_0919_T26R0701_001E ; 004
	scrdef scr_seq_0919_T26R0701_02DC ; 005
	scrdef scr_seq_0919_T26R0701_00C9 ; 006
	scrdef_end

scr_seq_0919_T26R0701_001E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0919_T26R0701_002F
	clearflag FLAG_UNK_189
	end

scr_seq_0919_T26R0701_002F:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0919_T26R0701_004A
	setflag FLAG_UNK_27E
	goto scr_seq_0919_T26R0701_004E

scr_seq_0919_T26R0701_004A:
	setflag FLAG_UNK_27E
scr_seq_0919_T26R0701_004E:
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0919_T26R0701_00C3
	scrcmd_147 38, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0919_T26R0701_008F
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_0919_T26R0701_0087
	clearflag FLAG_UNK_2CB
	goto scr_seq_0919_T26R0701_008D

scr_seq_0919_T26R0701_0087:
	goto scr_seq_0919_T26R0701_00C3

scr_seq_0919_T26R0701_008D:
	end

scr_seq_0919_T26R0701_008F:
	scrcmd_142 38, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0919_T26R0701_00C3
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_0919_T26R0701_00BD
	clearflag FLAG_UNK_2CB
	goto scr_seq_0919_T26R0701_00C1

scr_seq_0919_T26R0701_00BD:
	setflag FLAG_UNK_2CB
scr_seq_0919_T26R0701_00C1:
	end

scr_seq_0919_T26R0701_00C3:
	setflag FLAG_UNK_2CB
	end

scr_seq_0919_T26R0701_00C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_00DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_00ED:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_0100:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_0113:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0919_T26R0701_025E
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0919_T26R0701_0272
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0919_T26R0701_018C
	apply_movement 255, scr_seq_0919_T26R0701_0288
	apply_movement 3, scr_seq_0919_T26R0701_02C0
	goto scr_seq_0919_T26R0701_01B7

scr_seq_0919_T26R0701_018C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0919_T26R0701_01A7
	apply_movement 255, scr_seq_0919_T26R0701_02A0
	goto scr_seq_0919_T26R0701_01B7

scr_seq_0919_T26R0701_01A7:
	apply_movement 255, scr_seq_0919_T26R0701_02AC
	apply_movement 3, scr_seq_0919_T26R0701_02C0
scr_seq_0919_T26R0701_01B7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0919_T26R0701_01DE
	apply_movement 253, scr_seq_0919_T26R0701_02CC
	wait_movement
scr_seq_0919_T26R0701_01DE:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 25
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_0218:
	.byte 0x82, 0x01, 0x0c, 0x80, 0x11, 0x00, 0x0c, 0x80
	.byte 0x00, 0x00, 0x1c, 0x00, 0x05, 0x0e, 0x00, 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x57, 0x00, 0x00
	.byte 0x00, 0x16, 0x00, 0x23, 0x00, 0x00, 0x00, 0x11, 0x00, 0x0c, 0x80, 0x01, 0x00, 0x1c, 0x00, 0x05
	.byte 0x0e, 0x00, 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x54, 0x00, 0x00, 0x00, 0x16, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x5e, 0x00, 0xff, 0x00, 0x52, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x1b, 0x00
scr_seq_0919_T26R0701_025E:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_0272:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_0286:
	.byte 0x00, 0x00

scr_seq_0919_T26R0701_0288:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0919_T26R0701_02A0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0919_T26R0701_02AC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0919_T26R0701_02C0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0919_T26R0701_02CC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0919_T26R0701_02DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 38, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0919_T26R0701_038A
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_0919_T26R0701_037F
	npc_msg 4
scr_seq_0919_T26R0701_0307:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0919_T26R0701_032B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0919_T26R0701_036E
	end

scr_seq_0919_T26R0701_032B:
	buffer_players_name 0
	npc_msg 5
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 38
	npc_msg 6
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

scr_seq_0919_T26R0701_036E:
	setvar VAR_TEMP_x4004, 1
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_037F:
	npc_msg 8
	goto scr_seq_0919_T26R0701_0307

scr_seq_0919_T26R0701_0388:
	.byte 0x02, 0x00
scr_seq_0919_T26R0701_038A:
	npc_msg 9
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0919_T26R0701_03EB
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0919_T26R0701_03F6
	npc_msg 10
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
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_03EB:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0919_T26R0701_03F6:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
