#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0101.h"
#include "msgdata/msg/msg_0072_D24R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0101_000
	scrdef scr_seq_D24R0101_001
	scrdef scr_seq_D24R0101_002
	scrdef scr_seq_D24R0101_003
	scrdef scr_seq_D24R0101_004
	scrdef scr_seq_D24R0101_005
	scrdef scr_seq_D24R0101_006
	scrdef scr_seq_D24R0101_007
	scrdef_end

scr_seq_D24R0101_006:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, _005E
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, _0080
_003C:
	scrcmd_342 11, 418, 284
	scrcmd_342 12, 419, 284
	scrcmd_342 13, 418, 284
	scrcmd_342 14, 419, 284
	end

_005E:
	scrcmd_342 8, 418, 284
	scrcmd_342 9, 419, 284
	scrcmd_342 11, 418, 284
	scrcmd_342 12, 419, 284
	end

_0080:
	scrcmd_342 8, 418, 284
	scrcmd_342 9, 419, 284
	scrcmd_342 13, 418, 284
	scrcmd_342 14, 419, 284
	end

scr_seq_D24R0101_005:
	checkflag FLAG_UNK_189
	gotoif FALSE, _00B3
	clearflag FLAG_UNK_189
	end

_00B3:
	comparevartovalue VAR_UNK_40FB, 9
	gotoif ge, _00C6
	setvar VAR_UNK_40FB, 1
_00C6:
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _0104
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, _010E
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, _010E
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _010E
_0104:
	setflag FLAG_HIDE_CAMERON
	goto _0112

_010E:
	clearflag FLAG_HIDE_CAMERON
_0112:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, _005E
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, _0080
	goto _003C
	.byte 0x02, 0x00
scr_seq_D24R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0239
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _024D
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _01AD
	apply_movement obj_player, _0264
	apply_movement obj_D24R0101_gsmiddleman1, _029C
	goto _01D8

_01AD:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01C8
	apply_movement obj_player, _027C
	goto _01D8

_01C8:
	apply_movement obj_player, _0288
	apply_movement obj_D24R0101_gsmiddleman1, _029C
_01D8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01FF
	apply_movement 253, _02A8
	wait_movement
_01FF:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 3
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

_0239:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

_024D:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0264:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_027C:
	step 12, 3
	step 33, 1
	step_end

_0288:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_029C:
	step 63, 1
	step 32, 1
	step_end

_02A8:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D24R0101_007:
	scrcmd_609
	lockall
	get_lead_mon_index VAR_TEMP_x4005
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 0
	gotoif eq, _02DA
	goto _02EE

_02DA:
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, _0530
_02EE:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0530
	scrcmd_307 13, 8, 25, 29, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_UNK_2E6
	show_person 9
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement obj_D24R0101_suit, _0534
	apply_movement obj_player, _05C4
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, _0350
	apply_movement 253, _05DC
	goto _0373

_0350:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, _036B
	apply_movement 253, _05F4
	goto _0373

_036B:
	apply_movement 253, _0604
_0373:
	wait_movement
	npc_msg msg_0072_D24R0101_00001
	closemsg
	apply_movement obj_D24R0101_suit, _054C
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, _039D
	apply_movement 253, _0614
	goto _03C0

_039D:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, _03B8
	apply_movement 253, _0624
	goto _03C0

_03B8:
	apply_movement 253, _0630
_03C0:
	wait_movement
	npc_msg msg_0072_D24R0101_00002
	closemsg
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, _03E2
	apply_movement obj_D24R0101_suit, _0554
	goto _03EA

_03E2:
	apply_movement obj_D24R0101_suit, _0570
_03EA:
	wait_movement
	npc_msg msg_0072_D24R0101_00003
	closemsg
	apply_movement obj_D24R0101_suit, _0584
	wait_movement
	npc_msg msg_0072_D24R0101_00004
	closemsg
	apply_movement obj_D24R0101_suit, _05A4
	wait_movement
	npc_msg msg_0072_D24R0101_00005
	closemsg
	apply_movement obj_D24R0101_suit, _05B4
	wait_movement
	npc_msg msg_0072_D24R0101_00006
	closemsg
	setvar VAR_UNK_40FB, 2
	setflag FLAG_UNK_2E6
	clearflag FLAG_UNK_2E7
	play_se SEQ_SE_DP_KAIDAN2
	comparevartovalue VAR_UNK_403E, 6
	gotoif ne, _0467
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 490, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0530

_0467:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ne, _049E
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 492, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0530

_049E:
	comparevartovalue VAR_UNK_403E, 8
	gotoif ne, _04D5
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 492, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0530

_04D5:
	comparevartovalue VAR_UNK_403E, 9
	gotoif ne, _050C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 492, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0530

_050C:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 315, 0, 15, 24, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
_0530:
	releaseall
	end


_0534:
	step 62, 1
	step 17, 3
	step 71, 1
	step 20, 1
	step 72, 1
	step_end

_054C:
	step 17, 1
	step_end

_0554:
	step 38, 1
	step 75, 1
	step 63, 1
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_0570:
	step 75, 1
	step 63, 1
	step 15, 1
	step 37, 1
	step_end

_0584:
	step 15, 1
	step 14, 2
	step 63, 1
	step 15, 2
	step 39, 1
	step 14, 1
	step 37, 1
	step_end

_05A4:
	step 75, 1
	step 63, 1
	step 37, 1
	step_end

_05B4:
	step 14, 1
	step 13, 1
	step 37, 1
	step_end

_05C4:
	step 71, 1
	step 57, 1
	step 17, 2
	step 72, 1
	step 32, 1
	step_end

_05DC:
	step 71, 1
	step 18, 1
	step 72, 1
	step 63, 2
	step 33, 1
	step_end

_05F4:
	step 50, 1
	step 63, 3
	step 33, 1
	step_end

_0604:
	step 71, 1
	step 17, 5
	step 72, 1
	step_end

_0614:
	step 13, 3
	step 15, 1
	step 32, 1
	step_end

_0624:
	step 13, 4
	step 32, 1
	step_end

_0630:
	step 63, 2
	step 12, 1
	step 15, 1
	step 12, 1
	step_end
scr_seq_D24R0101_000:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 10, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D24R0101_001:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D24R0101_002:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 7, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D24R0101_003:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 8, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
