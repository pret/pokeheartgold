#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25SP0101.h"
#include "msgdata/msg/msg_0603_T25SP0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25SP0101_000
	scrdef scr_seq_T25SP0101_001
	scrdef scr_seq_T25SP0101_002
	scrdef scr_seq_T25SP0101_003
	scrdef scr_seq_T25SP0101_004
	scrdef_end

scr_seq_T25SP0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _006A
	apply_movement obj_T25SP0101_suit, _0080
	wait_movement
	npc_msg msg_0603_T25SP0101_00040
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 0, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	setvar VAR_TEMP_x4001, 2
	releaseall
	end

_006A:
	npc_msg msg_0603_T25SP0101_00038
	apply_movement obj_T25SP0101_suit, _0080
	wait_movement
	npc_msg msg_0603_T25SP0101_00039
	goto _00E8


_0080:
	step 1, 1
	step_end

_0088:
	step 2, 1
	step_end

_0090:
	step 3, 1
	step_end
scr_seq_T25SP0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, _00BD
	call _00F0
	goto _00C5

_00BD:
	apply_movement obj_T25SP0101_suit, _0080
_00C5:
	wait_movement
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00E5
	npc_msg msg_0603_T25SP0101_00041
	goto _00E8

_00E5:
	npc_msg msg_0603_T25SP0101_00039
_00E8:
	waitbutton
	closemsg
	releaseall
	end

_00F0:
	get_player_coords VAR_TEMP_x4002, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4002, 6
	gotoif ne, _0111
	apply_movement obj_T25SP0101_suit, _0088
	goto _0119

_0111:
	apply_movement obj_T25SP0101_suit, _0090
_0119:
	return

scr_seq_T25SP0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0175
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _0154
	npc_msg msg_0603_T25SP0101_00034
	setvar VAR_TEMP_x4001, 1
	goto _016D

_0154:
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, _016A
	npc_msg msg_0603_T25SP0101_00035
	goto _016D

_016A:
	npc_msg msg_0603_T25SP0101_00036
_016D:
	waitbutton
	closemsg
	releaseall
	end

_0175:
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _018B
	npc_msg msg_0603_T25SP0101_00028
	goto _018E

_018B:
	npc_msg msg_0603_T25SP0101_00037
_018E:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01C5
	npc_msg msg_0603_T25SP0101_00031
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8004, 444
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg msg_0603_T25SP0101_00032
	goto _00E8

_01C5:
	setvar VAR_TEMP_x4001, 1
	npc_msg msg_0603_T25SP0101_00033
	goto _00E8

scr_seq_T25SP0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg msg_0603_T25SP0101_00000
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
_01EC:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 12, 255, 0
	menu_item_add 13, 255, 1
	menu_item_add 11, 255, 2
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _0234
	case 1, _02D0
	goto _0C17

_0234:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 16, 255, 2
	menu_item_add 17, 255, 3
	menu_item_add 18, 255, 4
	menu_item_add 19, 255, 5
	menu_item_add 11, 255, 6
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _0342
	case 1, _03CD
	case 2, _0458
	case 3, _04E3
	case 4, _056E
	case 5, _05F9
	goto _01EC

_02D0:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 20, 255, 0
	menu_item_add 21, 255, 1
	menu_item_add 22, 255, 2
	menu_item_add 23, 255, 3
	menu_item_add 11, 255, 4
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _0684
	case 1, _070F
	case 2, _079A
	case 3, _0825
	goto _01EC

_0342:
	goto_if_no_item_space ITEM_TM90, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _038B
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0234
_038B:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 2000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0234
	.byte 0x02, 0x00
_03CD:
	goto_if_no_item_space ITEM_TM75, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0416
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0234
_0416:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 4000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 4000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0234
	.byte 0x02, 0x00
_0458:
	goto_if_no_item_space ITEM_TM44, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04A1
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0234
_04A1:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 6000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0234
	.byte 0x02, 0x00
_04E3:
	goto_if_no_item_space ITEM_TM35, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _052C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0234
_052C:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0234
	.byte 0x02, 0x00
_056E:
	goto_if_no_item_space ITEM_TM13, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _05B7
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0234
_05B7:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0234
	.byte 0x02, 0x00
_05F9:
	goto_if_no_item_space ITEM_TM24, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0642
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0234
_0642:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0234
	.byte 0x02, 0x00
_0684:
	goto_if_no_item_space ITEM_SILK_SCARF, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _06CD
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02D0
_06CD:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _02D0
	.byte 0x02, 0x00
_070F:
	goto_if_no_item_space ITEM_WIDE_LENS, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0758
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02D0
_0758:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _02D0
	.byte 0x02, 0x00
_079A:
	goto_if_no_item_space ITEM_ZOOM_LENS, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _07E3
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02D0
_07E3:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _02D0
	.byte 0x02, 0x00
_0825:
	goto_if_no_item_space ITEM_METRONOME, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _086E
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02D0
_086E:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _02D0
	.byte 0x02, 0x00
scr_seq_T25SP0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg msg_0603_T25SP0101_00009
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _08E5
	goto _08EB
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
_08E5:
	goto _0948

_08EB:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 24, 255, 0
	menu_item_add 25, 255, 1
	menu_item_add 26, 255, 2
	menu_item_add 11, 255, 3
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _09A5
	case 1, _09B1
	case 2, _09BD
	goto _0C17

_0948:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 24, 255, 0
	menu_item_add 27, 255, 1
	menu_item_add 26, 255, 2
	menu_item_add 11, 255, 3
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _09A5
	case 1, _09C9
	case 2, _09BD
	goto _0C17

_09A5:
	setorcopyvar VAR_TEMP_x4002, 63
	goto _09D5

_09B1:
	setorcopyvar VAR_TEMP_x4002, 23
	goto _09D5

_09BD:
	setorcopyvar VAR_TEMP_x4002, 147
	goto _09D5

_09C9:
	setorcopyvar VAR_TEMP_x4002, 27
	goto _09D5

_09D5:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, _09F3
	npc_msg msg_0603_T25SP0101_00006
	waitbutton
	closemsg
	goto _0C26

_09F3:
	buffer_species_name 1, VAR_TEMP_x4002, 0, 0
	npc_msg msg_0603_T25SP0101_00007
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0A34
	closemsg
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _0A2E
	goto _08EB
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0A2E:
	goto _0948

_0A34:
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, _0A58
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 200
	gotoif lt, _0BF1
	goto _0AB1

_0A58:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, _0A7C
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, _0BF1
	goto _0AB1

_0A7C:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, _0AA0
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, _0BF1
	goto _0AB1

_0AA0:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2100
	gotoif lt, _0BF1
_0AB1:
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	give_mon VAR_TEMP_x4002, 15, 0, 0, 0, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_species_name 1, VAR_TEMP_x4002, 0, 0
	npc_msg msg_0603_T25SP0101_00008
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, _0AEB
	scrcmd_121 200
	goto _0B1D

_0AEB:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, _0B02
	scrcmd_121 700
	goto _0B1D

_0B02:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, _0B19
	scrcmd_121 700
	goto _0B1D

_0B19:
	scrcmd_121 2100
_0B1D:
	scrcmd_118 0
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _0B3D
	goto _08EB
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0B3D:
	goto _0948
	.byte 0x02, 0x00
_0B45:
	npc_msg msg_0603_T25SP0101_00005
	closemsg
_0B4A:
	comparevartovalue VAR_SPECIAL_x8004, 417
	gotoif ne, _0B63
	goto _0234
	.byte 0x16, 0x00, 0x83
	.byte 0x00, 0x00, 0x00
_0B63:
	comparevartovalue VAR_SPECIAL_x8004, 402
	gotoif ne, _0B7C
	goto _0234
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00, 0x00
_0B7C:
	comparevartovalue VAR_SPECIAL_x8004, 371
	gotoif ne, _0B95
	goto _0234
	.byte 0x16
	.byte 0x00, 0x51, 0x00, 0x00, 0x00
_0B95:
	comparevartovalue VAR_SPECIAL_x8004, 362
	gotoif ne, _0BAE
	goto _0234
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
_0BAE:
	comparevartovalue VAR_SPECIAL_x8004, 340
	gotoif ne, _0BC7
	goto _0234
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_0BC7:
	comparevartovalue VAR_SPECIAL_x8004, 351
	gotoif ne, _0BE0
	goto _0234
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0BE0:
	goto _02D0

_0BE6:
	npc_msg msg_0603_T25SP0101_00002
	goto _0B4A
	.byte 0x02
	.byte 0x00
_0BF1:
	npc_msg msg_0603_T25SP0101_00002
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _0C11
	goto _08EB
	.byte 0x16, 0x00, 0x06, 0x00, 0x00
	.byte 0x00
_0C11:
	goto _0948

_0C17:
	npc_msg msg_0603_T25SP0101_00001
	waitbutton
	closemsg
	goto _0C26
	.byte 0x02, 0x00
_0C26:
	scrcmd_117
	touchscreen_menu_show
	scrcmd_784 3, 1
	releaseall
	end
	.balign 4, 0
