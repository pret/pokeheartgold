#include "constants/scrcmd.h"
#include "../.h"
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
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_CUT
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _009E
	check_badge 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _009E
	npc_msg msg_0211_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00AD
	closemsg
	goto _093D
	.byte 0x02, 0x00
_009E:
	npc_msg msg_0211_00002
	waitbutton
	closemsg
	goto _093D
	.byte 0x02, 0x00
_00AD:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_CUT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_727 VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg msg_0211_00001
	closemsg
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _00EC
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _0165

_00EC:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0109
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _0165

_0109:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, _0126
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _0165

_0126:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _0143
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _0165

_0143:
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _025B
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 3, VAR_SPECIAL_x8005
_0165:
	wait 7, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
_016F:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, _016F
	goto _093D
	.byte 0x02, 0x00
scr_seq_0146_007:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00001
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _01C1
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _023A

_01C1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01DE
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _023A

_01DE:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, _01FB
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _023A

_01FB:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _0218
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 0, VAR_SPECIAL_x8005
	goto _023A

_0218:
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _025B
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 3, VAR_SPECIAL_x8005
_023A:
	wait 7, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
_0244:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, _0244
	releaseall
	end

_025B:
	scrcmd_732 20
	scrcmd_733 12, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _027C
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
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_ROCK_SMASH
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _02D7
	check_badge 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02D7
	npc_msg msg_0211_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02E6
	closemsg
	goto _093D
	.byte 0x02, 0x00
_02D7:
	npc_msg msg_0211_00004
	waitbutton
	closemsg
	goto _093D
	.byte 0x02, 0x00
_02E6:
	bufferpartymonnick 0, VAR_SPECIAL_x8004
	npc_msg msg_0211_00005
	closemsg
	scrcmd_727 VAR_SPECIAL_x8005
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _031F
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _03AA

_031F:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0342
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _03AA

_0342:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, _0365
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _03AA

_0365:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _0382
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _03AA

_0382:
	setvar VAR_SPECIAL_x8007, 1
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _04D0
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 2, VAR_SPECIAL_x8005
_03AA:
	wait 10, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
_03B4:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, _03B4
	releaseall
	scrcmd_753 32775, 32780, 32774
	goto _0CEB
	.byte 0x02, 0x00
scr_seq_0146_008:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00005
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0416
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _04A1

_0416:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0439
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _04A1

_0439:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, _045C
	setvar VAR_SPECIAL_x8007, 0
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _04A1

_045C:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _0479
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 1, VAR_SPECIAL_x8005
	goto _04A1

_0479:
	scrcmd_598 1
	setvar VAR_SPECIAL_x8007, 1
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _04D0
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_560 2, VAR_SPECIAL_x8005
_04A1:
	wait 10, VAR_SPECIAL_x800C
	hide_person VAR_SPECIAL_x800D
_04AB:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, _04AB
	releaseall
	scrcmd_753 32775, 32780, 32774
	goto _0CEB
	.byte 0x02, 0x00
_04D0:
	scrcmd_732 20
	scrcmd_733 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _04F1
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
	strength_flag_action 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _051C
	call _061D
	goto _093D

_051C:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_STRENGTH
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _0564
	check_badge 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0564
	npc_msg msg_0211_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0573
	closemsg
	goto _093D
	.byte 0x02, 0x00
_0564:
	npc_msg msg_0211_00009
	waitbutton
	closemsg
	goto _093D
	.byte 0x02, 0x00
_0573:
	strength_flag_action 1
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_STRENGTH
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg msg_0211_00011
	closemsg
	scrcmd_727 VAR_SPECIAL_x8005
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _05AF
	scrcmd_183 VAR_SPECIAL_x8004
	goto _060E

_05AF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _05C6
	scrcmd_183 VAR_SPECIAL_x8004
	goto _060E

_05C6:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, _05DD
	scrcmd_183 VAR_SPECIAL_x8004
	goto _060E

_05DD:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _05F4
	scrcmd_183 VAR_SPECIAL_x8004
	goto _060E

_05F4:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _0715
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_731
_060E:
	npc_msg msg_0211_00012
	waitbutton
	closemsg
	goto _093D
	.byte 0x02, 0x00
_061D:
	npc_msg msg_0211_00010
	waitbutton
	closemsg
	return

scr_seq_0146_009:
	scrcmd_609
	lockall
	strength_flag_action 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0648
	call _061D
	goto _0945

_0648:
	strength_flag_action 1
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00011
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0678
	scrcmd_183 VAR_SPECIAL_x8000
	goto _06D7

_0678:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _068F
	scrcmd_183 VAR_SPECIAL_x8000
	goto _06D7

_068F:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, _06A6
	scrcmd_183 VAR_SPECIAL_x8000
	goto _06D7

_06A6:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _06BD
	scrcmd_183 VAR_SPECIAL_x8000
	goto _06D7

_06BD:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _0715
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_731
_06D7:
	npc_msg msg_0211_00012
	waitbutton
	closemsg
	goto _0945
	.byte 0x02, 0x00
scr_seq_0146_015:
	play_se SEQ_SE_GS_IWAOTOSHI01
	wait 12, VAR_SPECIAL_x800C
	play_se SEQ_SE_GS_IWAOTOSHI02
	scrcmd_561 0, 4, 2, 8
	scrcmd_561 0, 2, 1, 8
	wait_se SEQ_SE_GS_IWAOTOSHI02
	npc_msg msg_0211_00013
	waitbutton
	closemsg
	end

_0715:
	scrcmd_733 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0733
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
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_ROCK_CLIMB
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _0797
	check_badge 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0797
	check_escort_mode VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _07A6
	npc_msg msg_0211_00020
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _07B5
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0797:
	npc_msg msg_0211_00022
	waitbutton
	closemsg
	goto _0941
	.byte 0x02, 0x00
_07A6:
	npc_msg msg_0211_00023
	waitbutton
	closemsg
	goto _0941
	.byte 0x02, 0x00
_07B5:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_ROCK_CLIMB
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
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
	check_escort_mode VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0826
	npc_msg msg_0211_00014
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0833
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0826:
	npc_msg msg_0211_00016
	waitbutton
	closemsg
	goto _0941

_0833:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_SURF
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
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
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _08A4
	scrcmd_183 VAR_SPECIAL_x8000
	goto _0909

_08A4:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _08BB
	scrcmd_183 VAR_SPECIAL_x8000
	goto _0909

_08BB:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8005
	gotoif eq, _08D2
	scrcmd_183 VAR_SPECIAL_x8000
	goto _0909

_08D2:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _08E9
	scrcmd_183 VAR_SPECIAL_x8000
	goto _0909

_08E9:
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4000
	call _091A
	play_cry VAR_TEMP_x4000, 0
	wait_cry
	scrcmd_728 16, 2
	scrcmd_728 16, 2
_0909:
	scrcmd_401 1, 181
	wait 42, VAR_SPECIAL_x800C
	goto _0945

_091A:
	scrcmd_733 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0938
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
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_WATERFALL
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _0997
	check_badge 7, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0997
	npc_msg msg_0211_00024
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _09A6
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0997:
	npc_msg msg_0211_00026
	waitbutton
	closemsg
	goto _0941
	.byte 0x02, 0x00
_09A6:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_WATERFALL
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
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
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_WHIRLPOOL
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _0A34
	check_badge 6, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0A34
	npc_msg msg_0211_00029
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0A43
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0A34:
	npc_msg msg_0211_00031
	waitbutton
	closemsg
	goto _0941
	.byte 0x02, 0x00
_0A43:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_WHIRLPOOL
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
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
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_HEADBUTT
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, _0AC2
	npc_msg msg_0211_00032
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0AD1
	closemsg
	goto _093D
	.byte 0x02, 0x00
_0AC2:
	npc_msg msg_0211_00034
	waitbutton
	closemsg
	goto _093D
	.byte 0x02
	.byte 0x00
_0AD1:
	get_party_slot_with_move VAR_SPECIAL_x800C, MOVE_HEADBUTT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_727 VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg msg_0211_00033
	closemsg
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0B10
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0BAE

_0B10:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0B2D
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0BAE

_0B2D:
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif eq, _0B4A
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0BAE

_0B4A:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _0B67
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0BAE

_0B67:
	scrcmd_829 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0BA0
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
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
	wait 7, VAR_SPECIAL_x800C
_0BB4:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, _0BB4
	releaseall
	scrcmd_754 32780
	end

scr_seq_0146_018:
	scrcmd_609
	lockall
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0211_00033
	closemsg
	scrcmd_727 VAR_SPECIAL_x8004
	get_player_state VAR_SPECIAL_x800C
	scrcmd_730 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0C06
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0CA4

_0C06:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0C23
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0CA4

_0C23:
	comparevartovar VAR_SPECIAL_x8000, VAR_SPECIAL_x8004
	gotoif eq, _0C40
	scrcmd_183 VAR_SPECIAL_x8000
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0CA4

_0C40:
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif ne, _0C5D
	scrcmd_183 VAR_SPECIAL_x8004
	scrcmd_560 4, VAR_SPECIAL_x8005
	goto _0CA4

_0C5D:
	scrcmd_829 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0C96
	scrcmd_598 1
	get_lead_mon_index VAR_TEMP_x4000
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
	wait 7, VAR_SPECIAL_x800C
_0CAA:
	wait 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, _0CAA
	releaseall
	scrcmd_754 32780
	end

_0CC5:
	scrcmd_732 20
	scrcmd_733 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0CE6
	scrcmd_734 2
	scrcmd_732 1
	goto _0CE9

_0CE6:
	scrcmd_734 1
_0CE9:
	return

_0CEB:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0D2A
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8005, 1
	buffer_item_name_indef 1, VAR_SPECIAL_x8004
	capitalize 1
	npc_msg msg_0211_00006
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0D2C
	callstd 2008
	closemsg
_0D2A:
	end

_0D2C:
	callstd std_bag_is_full
	closemsg
	end
	.balign 4, 0
