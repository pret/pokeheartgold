#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R25R0101.h"
#include "msgdata/msg/msg_0364_R25R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R25R0101_000
	scrdef_end

scr_seq_R25R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_14E, _0020
	npc_msg msg_0364_R25R0101_00000
	setflag FLAG_UNK_14E
_0020:
	get_game_version VAR_SPECIAL_x8002
	compare VAR_SPECIAL_x8002, 8
	goto_if_ne _0037
	goto _00B1

_0037:
	compare VAR_UNK_412D, 0
	goto_if_ne _004D
	npc_msg msg_0364_R25R0101_00001
	goto _00AB

_004D:
	compare VAR_UNK_412D, 1
	goto_if_ne _0063
	npc_msg msg_0364_R25R0101_00002
	goto _00AB

_0063:
	compare VAR_UNK_412D, 2
	goto_if_ne _0079
	npc_msg msg_0364_R25R0101_00003
	goto _00AB

_0079:
	compare VAR_UNK_412D, 3
	goto_if_ne _008F
	npc_msg msg_0364_R25R0101_00004
	goto _00AB

_008F:
	compare VAR_UNK_412D, 4
	goto_if_ne _00A5
	npc_msg msg_0364_R25R0101_00005
	goto _00AB

_00A5:
	goto _0484

_00AB:
	goto _0125

_00B1:
	compare VAR_UNK_412D, 0
	goto_if_ne _00C7
	npc_msg msg_0364_R25R0101_00006
	goto _0125

_00C7:
	compare VAR_UNK_412D, 1
	goto_if_ne _00DD
	npc_msg msg_0364_R25R0101_00007
	goto _0125

_00DD:
	compare VAR_UNK_412D, 2
	goto_if_ne _00F3
	npc_msg msg_0364_R25R0101_00008
	goto _0125

_00F3:
	compare VAR_UNK_412D, 3
	goto_if_ne _0109
	npc_msg msg_0364_R25R0101_00009
	goto _0125

_0109:
	compare VAR_UNK_412D, 4
	goto_if_ne _011F
	npc_msg msg_0364_R25R0101_00010
	goto _0125

_011F:
	goto _0484

_0125:
	npc_msg msg_0364_R25R0101_00011
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _048D
	npc_msg msg_0364_R25R0101_00012
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_SPECIAL_x8000
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x8000, 255
	goto_if_eq _048D
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	compare VAR_SPECIAL_x8002, 8
	goto_if_ne _0188
	goto _02F0

_0188:
	switch VAR_UNK_412D
	case 0, _01C8
	case 1, _01E4
	case 2, _0200
	case 3, _021C
	goto _0238

_01C8:
	compare VAR_SPECIAL_x8001, 43
	goto_if_eq _01DE
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_01DE:
	goto _024E

_01E4:
	compare VAR_SPECIAL_x8001, 58
	goto_if_eq _01FA
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_01FA:
	goto _024E

_0200:
	compare VAR_SPECIAL_x8001, 39
	goto_if_eq _0216
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_0216:
	goto _024E

_021C:
	compare VAR_SPECIAL_x8001, 172
	goto_if_eq _0232
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_0232:
	goto _024E

_0238:
	compare VAR_SPECIAL_x8001, 183
	goto_if_eq _024E
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_024E:
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0364_R25R0101_00015
	switch VAR_UNK_412D
	case 0, _0296
	case 1, _02A8
	case 2, _02BA
	case 3, _02CC
	goto _02DE

_0296:
	setvar VAR_SPECIAL_x8004, 85
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_02A8:
	setvar VAR_SPECIAL_x8004, 82
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_02BA:
	setvar VAR_SPECIAL_x8004, 229
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_02CC:
	setvar VAR_SPECIAL_x8004, 83
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_02DE:
	setvar VAR_SPECIAL_x8004, 84
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_02F0:
	switch VAR_UNK_412D
	case 0, _0330
	case 1, _034C
	case 2, _0368
	case 3, _0384
	goto _03A0

_0330:
	compare VAR_SPECIAL_x8001, 108
	goto_if_eq _0346
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_0346:
	goto _03B6

_034C:
	compare VAR_SPECIAL_x8001, 43
	goto_if_eq _0362
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_0362:
	goto _03B6

_0368:
	compare VAR_SPECIAL_x8001, 120
	goto_if_eq _037E
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_037E:
	goto _03B6

_0384:
	compare VAR_SPECIAL_x8001, 37
	goto_if_eq _039A
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_039A:
	goto _03B6

_03A0:
	compare VAR_SPECIAL_x8001, 172
	goto_if_eq _03B6
	npc_msg msg_0364_R25R0101_00014
	goto _0490

_03B6:
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0364_R25R0101_00015
	switch VAR_UNK_412D
	case 0, _03FE
	case 1, _0410
	case 2, _0422
	case 3, _0434
	goto _0446

_03FE:
	setvar VAR_SPECIAL_x8004, 229
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_0410:
	setvar VAR_SPECIAL_x8004, 85
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_0422:
	setvar VAR_SPECIAL_x8004, 84
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_0434:
	setvar VAR_SPECIAL_x8004, 82
	setvar VAR_SPECIAL_x8005, 1
	goto _0452

_0446:
	setvar VAR_SPECIAL_x8004, 83
	setvar VAR_SPECIAL_x8005, 1
_0452:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _047A
	callstd std_give_item_verbose
	addvar VAR_UNK_412D, 1
	npc_msg msg_0364_R25R0101_00016
	goto _0490

_047A:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0484:
	npc_msg msg_0364_R25R0101_00017
	goto _0490

_048D:
	npc_msg msg_0364_R25R0101_00013
_0490:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
