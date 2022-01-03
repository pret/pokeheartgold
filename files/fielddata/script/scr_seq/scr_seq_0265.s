#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0265.h"
#include "msgdata/msg/msg_0439.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0265_000
	scrdef scr_seq_0265_001
	scrdef_end

scr_seq_0265_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_312
	scrcmd_313 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0094
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _0151
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _015E
	comparevartovalue VAR_UNK_408E, 4
	gotoif eq, _0057
	npc_msg msg_0439_00000
	waitbutton
	closemsg
	releaseall
	end

_0057:
	buffer_players_name 0
	gender_msgbox msg_0439_00013, msg_0439_00014
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0082
	setflag FLAG_UNK_99E
	npc_msg msg_0439_00015
	waitbutton
	closemsg
	releaseall
	end

_0082:
	clearflag FLAG_UNK_99E
	scrcmd_149 5
	npc_msg msg_0439_00016
	waitbutton
	closemsg
	releaseall
	end

_0094:
	scrcmd_149 5
	npc_msg msg_0439_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00F6
	npc_msg msg_0439_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00F6
	touchscreen_menu_show
	clearflag FLAG_UNK_067
	scrcmd_365
	comparevartovalue VAR_UNK_408E, 3
	gotoif ne, _00EB
	npc_msg msg_0439_00012
	setvar VAR_UNK_408E, 4
	setflag FLAG_UNK_992
	goto _0057

_00EB:
	npc_msg msg_0439_00003
	waitbutton
	closemsg
	releaseall
	end

_00F6:
	touchscreen_menu_show
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, _0114
	npc_msg msg_0439_00004
	waitbutton
	closemsg
	releaseall
	end

_0114:
	buffer_players_name 0
	npc_msg msg_0439_00005
	play_fanfare SEQ_ME_TAMAGO_GET
	wait_fanfare
	scrcmd_366
	clearflag FLAG_UNK_067
	comparevartovalue VAR_UNK_408E, 3
	gotoif ne, _0146
	npc_msg msg_0439_00011
	setvar VAR_UNK_408E, 4
	setflag FLAG_UNK_992
	goto _0057

_0146:
	npc_msg msg_0439_00006
	waitbutton
	closemsg
	releaseall
	end

_0151:
	scrcmd_312
	npc_msg msg_0439_00002
	waitbutton
	closemsg
	releaseall
	end

_015E:
	scrcmd_312
	npc_msg msg_0439_00009
	scrcmd_387 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0196
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01BD
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _01E4
	goto _020B
	.byte 0x02, 0x00
_0196:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, _01B2
	npc_msg msg_0439_00047
	goto _0057
	.byte 0x16, 0x00, 0x03, 0x00
	.byte 0x00, 0x00
_01B2:
	npc_msg msg_0439_00017
	waitbutton
	closemsg
	releaseall
	end

_01BD:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, _01D9
	npc_msg msg_0439_00048
	goto _0057
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_01D9:
	npc_msg msg_0439_00018
	waitbutton
	closemsg
	releaseall
	end

_01E4:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, _0200
	npc_msg msg_0439_00049
	goto _0057
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_0200:
	npc_msg msg_0439_00019
	waitbutton
	closemsg
	releaseall
	end

_020B:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, _0227
	npc_msg msg_0439_00050
	goto _0057
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_0227:
	npc_msg msg_0439_00020
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_113 20, 2
	scrcmd_313 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _042E
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _0455
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0620
	npc_msg msg_0439_00021
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0290
	touchscreen_menu_show
	npc_msg msg_0439_00026
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_0290:
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03FB
	scrcmd_358 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _041F
	npc_msg msg_0439_00022
	closemsg
	scrcmd_114
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setvar VAR_SPECIAL_x800C, 0
_02CB:
	scrcmd_551 32780
	scrcmd_552 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02F4
	scrcmd_352 0, VAR_SPECIAL_x8000, 0
	scrcmd_353 0, VAR_SPECIAL_x800C
	goto _02CB

_02F4:
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, _03C6
	scrcmd_690 VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _03A1
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _03B1
	count_alive_mons VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _040A
	scrcmd_373 VAR_SPECIAL_x8000
	call _038B
	scrcmd_372 VAR_SPECIAL_x8001
	setflag FLAG_UNK_068
	scrcmd_313 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _0363
	goto _0374

_0363:
	play_cry VAR_SPECIAL_x8001, 0
	npc_msg msg_0439_00023
	wait_cry
	goto _03DB

_0374:
	touchscreen_menu_show
	play_cry VAR_SPECIAL_x8001, 0
	npc_msg msg_0439_00041
	waitbutton
	closemsg
	wait_cry
	scrcmd_114
	releaseall
	end

_038B:
	scrcmd_150
	scrcmd_113 20, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	return

_03A1:
	call _038B
	touchscreen_menu_show
	scrcmd_114
	callstd std_bag_is_full_griseous_orb
	end

_03B1:
	call _038B
	touchscreen_menu_show
	npc_msg msg_0439_00040
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_03C6:
	call _038B
	touchscreen_menu_show
_03CE:
	npc_msg msg_0439_00029
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_03DB:
	npc_msg msg_0439_00024
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0290
	touchscreen_menu_show
	goto _03CE
	.byte 0x02, 0x00
_03FB:
	touchscreen_menu_show
	npc_msg msg_0439_00036
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_040A:
	call _038B
	touchscreen_menu_show
	npc_msg msg_0439_00038
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_041F:
	touchscreen_menu_show
	npc_msg msg_0439_00039
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_042E:
	npc_msg msg_0439_00025
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_043B:
	npc_msg msg_0439_00031
	return

_0440:
	scrcmd_371 32780, 32768
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, _043B
	return

_0455:
	npc_msg msg_0439_00030
	setvar VAR_SPECIAL_x8000, 0
	call _0440
	npc_msg msg_0439_00024
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0290
	npc_msg msg_0439_00037
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0498
	touchscreen_menu_show
	goto _03CE

_0498:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _05DC
	scrcmd_313 VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8001, 0
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _0520
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8001
	scrcmd_385 0, 1, 2, 0
	menu_item_add 136, 255, 0
	scrcmd_385 0, 1, 2, 1
	menu_item_add 137, 255, 1
	menu_item_add 138, 255, 2
	menu_exec
	switch VAR_SPECIAL_x8001
	case 0, _0520
	case 1, _0520
	touchscreen_menu_show
	goto _03CE

_0520:
	scrcmd_367 32772, 32769
	npc_msg msg_0439_00033
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0544
	touchscreen_menu_show
	goto _03CE

_0544:
	hasenoughmoneyvar VAR_SPECIAL_x800C, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0566
	touchscreen_menu_show
	npc_msg msg_0439_00027
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_0566:
	scrcmd_361 32770, 32769
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_715
	fade_screen 6, 1, 1, 0x00
	wait_fade
	submoneyvar VAR_SPECIAL_x8004
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0439_00034
	play_cry VAR_SPECIAL_x8002, 0
	buffer_players_name 1
	npc_msg msg_0439_00035
	wait_cry
	scrcmd_313 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _05BE
	touchscreen_menu_show
	goto _03CE

_05BE:
	npc_msg msg_0439_00028
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0498
	touchscreen_menu_show
	goto _03CE

_05DC:
	touchscreen_menu_show
	npc_msg msg_0439_00032
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end
	.byte 0x00, 0x3e, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x03, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x03, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x45, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x46, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
_0620:
	npc_msg msg_0439_00030
	setvar VAR_SPECIAL_x8000, 0
	call _0440
	setvar VAR_SPECIAL_x8000, 1
	call _0440
	npc_msg msg_0439_00037
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0498
	touchscreen_menu_show
	npc_msg msg_0439_00029
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x2d, 0x00, 0x2a, 0x71, 0x01, 0x35, 0x00, 0x72, 0x00, 0x61
	.byte 0x00, 0x02, 0x00, 0x00
	.balign 4, 0
