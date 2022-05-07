#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0146.h"
#include "msgdata/msg/msg_0211.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0146_000
	scrdef scr_seq_0146_001
	scrdef scr_seq_0146_002
	scrdef scr_seq_0146_003
	scrdef scr_seq_0146_004
	scrdef scr_seq_0146_005
	scrdef scr_seq_0146_006
	scrdef scr_seq_0146_007
	scrdef scr_seq_0146_008
	scrdef scr_seq_0146_009
	scrdef scr_seq_0146_010
	scrdef scr_seq_0146_011
	scrdef scr_seq_0146_012
	scrdef scr_seq_0146_013
	scrdef scr_seq_0146_014
	scrdef scr_seq_0146_015
	scrdef scr_seq_0146_016
	scrdef scr_seq_0146_017
	scrdef scr_seq_0146_018
	scrdef_end

scr_seq_0146_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_CUT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _009E
	check_badge BADGE_HIVE, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _009E
	npc_msg msg_0211_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00AD
	closemsg
	goto _093D
	.byte 0x02, 0x00
_009E:
	npc_msg msg_0211_00002
	wait_button_or_walk_away
	closemsg
	goto _093D
	.byte 0x02, 0x00
_00AD:
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_CUT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_727 VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_RESULT
	npc_msg msg_0211_00001
	closemsg
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _00EC
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _0165

_00EC:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0109
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _0165

_0109:
	compare VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	goto_if_eq _0126
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _0165

_0126:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0143
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _0165

_0143:
	scrcmd_598 1
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _025B
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 3, VAR_SPECIAL_x8005
_0165:
	wait 7, VAR_SPECIAL_RESULT
	hide_person VAR_SPECIAL_LAST_TALKED
_016F:
	wait 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _016F
	goto _093D
	.byte 0x02, 0x00
scr_seq_0146_007:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00001
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _01C1
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _023A

_01C1:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01DE
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _023A

_01DE:
	compare VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	goto_if_eq _01FB
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _023A

_01FB:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0218
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _023A

_0218:
	scrcmd_598 1
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _025B
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 3, VAR_SPECIAL_x8005
_023A:
	wait 7, VAR_SPECIAL_RESULT
	hide_person VAR_SPECIAL_LAST_TALKED
_0244:
	wait 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _0244
	releaseall
	end

_025B:
	scrcmd_732 20
	scrcmd_733 12, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _027C
	scrcmd_734 2
	scrcmd_732 1
	goto _027F

_027C:
	scrcmd_734 1
_027F:
	return

scr_seq_0146_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_ROCK_SMASH
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _02D7
	check_badge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02D7
	npc_msg msg_0211_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02E6
	closemsg
	goto _093D
	.byte 0x02, 0x00
_02D7:
	npc_msg msg_0211_00004
	wait_button_or_walk_away
	closemsg
	goto _093D
	.byte 0x02, 0x00
_02E6:
	bufferpartymonnick 0, VAR_SPECIAL_x8004
	npc_msg msg_0211_00005
	closemsg
	scrcmd_727 VAR_SPECIAL_x8005
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _031F
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _03AA

_031F:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0342
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _03AA

_0342:
	compare VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	goto_if_eq _0365
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _03AA

_0365:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0382
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _03AA

_0382:
	setvar VAR_SPECIAL_x8007, 1
	scrcmd_598 1
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _04D0
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 2, VAR_SPECIAL_x8005
_03AA:
	wait 10, VAR_SPECIAL_RESULT
	hide_person VAR_SPECIAL_LAST_TALKED
_03B4:
	wait 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _03B4
	releaseall
	scrcmd_rock_smash_item_check VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8006
	goto _0CEB
	.byte 0x02, 0x00
scr_seq_0146_008:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00005
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0416
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _04A1

_0416:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0439
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _04A1

_0439:
	compare VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	goto_if_eq _045C
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _04A1

_045C:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0479
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _04A1

_0479:
	scrcmd_598 1
	setvar VAR_SPECIAL_x8007, 1
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _04D0
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 2, VAR_SPECIAL_x8005
_04A1:
	wait 10, VAR_SPECIAL_RESULT
	hide_person VAR_SPECIAL_LAST_TALKED
_04AB:
	wait 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _04AB
	releaseall
	scrcmd_rock_smash_item_check VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8006
	goto _0CEB
	.byte 0x02, 0x00
_04D0:
	scrcmd_732 20
	scrcmd_733 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _04F1
	scrcmd_734 2
	scrcmd_732 1
	goto _04F4

_04F1:
	scrcmd_734 1
_04F4:
	return

scr_seq_0146_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	strength_flag_action 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _051C
	call _061D
	goto _093D

_051C:
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_STRENGTH
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _0564
	check_badge BADGE_PLAIN, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0564
	npc_msg msg_0211_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0573
	closemsg
	goto _093D
	.byte 0x02, 0x00
_0564:
	npc_msg msg_0211_00009
	wait_button_or_walk_away
	closemsg
	goto _093D
	.byte 0x02, 0x00
_0573:
	strength_flag_action 1
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_STRENGTH
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	bufferpartymonnick 0, VAR_SPECIAL_RESULT
	npc_msg msg_0211_00011
	closemsg
	scrcmd_727 VAR_SPECIAL_x8005
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _05AF
	scrcmd_183 VAR_SPECIAL_x8004
	goto _060E

_05AF:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _05C6
	scrcmd_183 VAR_SPECIAL_x8004
	goto _060E

_05C6:
	compare VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	goto_if_eq _05DD
	scrcmd_183 VAR_SPECIAL_x8004
	goto _060E

_05DD:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _05F4
	scrcmd_183 VAR_SPECIAL_x8004
	goto _060E

_05F4:
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _0715
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_731
_060E:
	npc_msg msg_0211_00012
	wait_button_or_walk_away
	closemsg
	goto _093D
	.byte 0x02, 0x00
_061D:
	npc_msg msg_0211_00010
	wait_button_or_walk_away
	closemsg
	return

scr_seq_0146_009:
	scrcmd_609
	lockall
	strength_flag_action 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0648
	call _061D
	goto _0945

_0648:
	strength_flag_action 1
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00011
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0678
	scrcmd_183 VAR_SPECIAL_x8000
	goto _06D7

_0678:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _068F
	scrcmd_183 VAR_SPECIAL_x8000
	goto _06D7

_068F:
	compare VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	goto_if_eq _06A6
	scrcmd_183 VAR_SPECIAL_x8000
	goto _06D7

_06A6:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _06BD
	scrcmd_183 VAR_SPECIAL_x8000
	goto _06D7

_06BD:
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _0715
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_731
_06D7:
	npc_msg msg_0211_00012
	wait_button_or_walk_away
	closemsg
	goto _0945
	.byte 0x02, 0x00
scr_seq_0146_015:
	play_se SEQ_SE_GS_IWAOTOSHI01
	wait 12, VAR_SPECIAL_RESULT
	play_se SEQ_SE_GS_IWAOTOSHI02
	scrcmd_561 0, 4, 2, 8
	scrcmd_561 0, 2, 1, 8
	wait_se SEQ_SE_GS_IWAOTOSHI02
	npc_msg msg_0211_00013
	wait_button_or_walk_away
	closemsg
	end

_0715:
	scrcmd_733 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0733
	scrcmd_734 2
	scrcmd_732 1
	goto _0736

_0733:
	scrcmd_734 1
_0736:
	return

scr_seq_0146_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_ROCK_CLIMB
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _0797
	check_badge BADGE_EARTH, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0797
	check_escort_mode VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _07A6
	npc_msg msg_0211_00020
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _07B5
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0797:
	npc_msg msg_0211_00022
	wait_button_or_walk_away
	closemsg
	goto _0941
	.byte 0x02, 0x00
_07A6:
	npc_msg msg_0211_00023
	wait_button_or_walk_away
	closemsg
	goto _0941
	.byte 0x02, 0x00
_07B5:
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_ROCK_CLIMB
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	bufferpartymonnick 0, VAR_SPECIAL_RESULT
	npc_msg msg_0211_00021
	closemsg
	rock_climb VAR_SPECIAL_x8004
	goto _0941
	.byte 0x02, 0x00
scr_seq_0146_010:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00021
	closemsg
	rock_climb VAR_SPECIAL_x8000
	releaseall
	end

scr_seq_0146_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	check_escort_mode VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0826
	npc_msg msg_0211_00014
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0833
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0826:
	npc_msg msg_0211_00016
	wait_button_or_walk_away
	closemsg
	goto _0941

_0833:
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_SURF
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	bufferpartymonnick 0, VAR_SPECIAL_RESULT
	npc_msg msg_0211_00015
	closemsg
	surf VAR_SPECIAL_x8004
	goto _0941
	.byte 0x02, 0x00
scr_seq_0146_011:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00015
	closemsg
	release obj_player
	surf VAR_SPECIAL_x8000
	lock obj_player
	releaseall
	end

scr_seq_0146_013:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00028
	closemsg
	scrcmd_727 VAR_SPECIAL_x8005
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _08A4
	scrcmd_183 VAR_SPECIAL_x8000
	goto _0909

_08A4:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _08BB
	scrcmd_183 VAR_SPECIAL_x8000
	goto _0909

_08BB:
	compare VAR_SPECIAL_x8000, VAR_SPECIAL_x8005
	goto_if_eq _08D2
	scrcmd_183 VAR_SPECIAL_x8000
	goto _0909

_08D2:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _08E9
	scrcmd_183 VAR_SPECIAL_x8000
	goto _0909

_08E9:
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _091A
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_728 16, 2
	scrcmd_728 16, 2
_0909:
	flash_action 1
	flash_effect
	wait 42, VAR_SPECIAL_RESULT
	goto _0945

_091A:
	scrcmd_733 14, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0938
	scrcmd_734 2
	scrcmd_732 1
	goto _093B

_0938:
	scrcmd_734 1
_093B:
	return

_093D:
	releaseall
	end

_0941:
	releaseall
	end

_0945:
	releaseall
	end

scr_seq_0146_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_WATERFALL
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _0997
	check_badge BADGE_RISING, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0997
	npc_msg msg_0211_00024
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _09A6
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0997:
	npc_msg msg_0211_00026
	wait_button_or_walk_away
	closemsg
	goto _0941
	.byte 0x02, 0x00
_09A6:
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_WATERFALL
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	bufferpartymonnick 0, VAR_SPECIAL_RESULT
	npc_msg msg_0211_00025
	closemsg
	waterfall VAR_SPECIAL_x8004
	goto _0941
	.byte 0x02, 0x00
scr_seq_0146_012:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00025
	closemsg
	release obj_player
	waterfall VAR_SPECIAL_x8000
	lock obj_player
	releaseall
	end

scr_seq_0146_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_WHIRLPOOL
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _0A34
	check_badge BADGE_GLACIER, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0A34
	npc_msg msg_0211_00029
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0A43
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0A34:
	npc_msg msg_0211_00031
	wait_button_or_walk_away
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0A43:
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_WHIRLPOOL
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	bufferpartymonnick 0, VAR_SPECIAL_RESULT
	npc_msg msg_0211_00030
	closemsg
	whirlpool VAR_SPECIAL_x8004
	goto _0941
	.byte 0x02, 0x00
scr_seq_0146_017:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00030
	closemsg
	release obj_player
	whirlpool VAR_SPECIAL_x8000
	lock obj_player
	releaseall
	end

scr_seq_0146_006:
	end

scr_seq_0146_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_HEADBUTT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _0AC2
	npc_msg msg_0211_00032
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0AD1
	closemsg
	goto _093D
	.byte 0x02, 0x00
_0AC2:
	npc_msg msg_0211_00034
	wait_button_or_walk_away
	closemsg
	goto _093D
	.byte 0x02
	.byte 0x00
_0AD1:
	get_party_slot_with_move VAR_SPECIAL_RESULT, MOVE_HEADBUTT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_727 VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_RESULT
	npc_msg msg_0211_00033
	closemsg
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0B10
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0BAE

_0B10:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0B2D
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0BAE

_0B2D:
	compare VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	goto_if_eq _0B4A
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0BAE

_0B4A:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0B67
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0BAE

_0B67:
	scrcmd_829 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0BA0
	scrcmd_598 1
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _0CC5
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 5, VAR_SPECIAL_x8005
	goto _0BAE

_0BA0:
	scrcmd_600
	scrcmd_606
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
_0BAE:
	wait 7, VAR_SPECIAL_RESULT
_0BB4:
	wait 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _0BB4
	releaseall
	scrcmd_754 VAR_SPECIAL_RESULT
	end

scr_seq_0146_018:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00033
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_RESULT
	scrcmd_730 VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0C06
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0CA4

_0C06:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0C23
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0CA4

_0C23:
	compare VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	goto_if_eq _0C40
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0CA4

_0C40:
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0C5D
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0CA4

_0C5D:
	scrcmd_829 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0C96
	scrcmd_598 1
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _0CC5
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 5, VAR_SPECIAL_x8005
	goto _0CA4

_0C96:
	scrcmd_600
	scrcmd_606
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
_0CA4:
	wait 7, VAR_SPECIAL_RESULT
_0CAA:
	wait 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _0CAA
	releaseall
	scrcmd_754 VAR_SPECIAL_RESULT
	end

_0CC5:
	scrcmd_732 20
	scrcmd_733 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0CE6
	scrcmd_734 2
	scrcmd_732 1
	goto _0CE9

_0CE6:
	scrcmd_734 1
_0CE9:
	return

_0CEB:
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0D2A
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8005, 1
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	capitalize 1
	npc_msg msg_0211_00006
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0D2C
	callstd std_obtain_item_verbose
	closemsg
_0D2A:
	end

_0D2C:
	callstd std_bag_is_full
	closemsg
	end
	.balign 4, 0
