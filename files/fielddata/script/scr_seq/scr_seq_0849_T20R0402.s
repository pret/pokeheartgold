#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0402.h"
#include "msgdata/msg/msg_0549_T20R0402.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T20R0402_000
	scrdef scr_seq_T20R0402_001
	scrdef scr_seq_T20R0402_002
	scrdef scr_seq_T20R0402_003
	scrdef scr_seq_T20R0402_004
	scrdef_end

scr_seq_T20R0402_002:
	goto_if_set FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND, _0025
	get_friend_sprite VAR_OBJ_0
_0025:
	end

scr_seq_T20R0402_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _006D
	buffer_players_name 0
	goto_if_set FLAG_GOT_STARTER, _005C
	gender_msgbox msg_0549_T20R0402_00000, msg_0549_T20R0402_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_005C:
	buffer_mon_species_name 1, VAR_SPECIAL_RESULT
	gender_msgbox msg_0549_T20R0402_00002, msg_0549_T20R0402_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_006D:
	get_party_lead_alive VAR_SPECIAL_x8006
	scrcmd_825 VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	goto_if_set FLAG_UNK_161, _00B1
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _009E
_008F:
	buffer_players_name 0
	gender_msgbox msg_0549_T20R0402_00005, msg_0549_T20R0402_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_009E:
	setflag FLAG_UNK_161
	buffer_players_name 0
	gender_msgbox msg_0549_T20R0402_00007, msg_0549_T20R0402_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00B1:
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8004, 6
	goto_if_eq _00E4
	compare VAR_SPECIAL_x8004, 5
	goto_if_eq _00FC
	compare VAR_SPECIAL_x8004, 1
	goto_if_ge _0137
	goto _008F

_00E4:
	buffer_players_name 0
	scrcmd_727 VAR_SPECIAL_RESULT
	bufferpartymonnick 1, VAR_SPECIAL_RESULT
	gender_msgbox msg_0549_T20R0402_00015, msg_0549_T20R0402_00016
	closemsg
	goto _010D

_00FC:
	scrcmd_826 VAR_SPECIAL_x8006
	setflag FLAG_UNK_184
	buffer_players_name 0
	gender_msgbox msg_0549_T20R0402_00011, msg_0549_T20R0402_00012
	closemsg
_010D:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_425 2
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	gender_msgbox msg_0549_T20R0402_00013, msg_0549_T20R0402_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0137:
	compare VAR_SPECIAL_x8004, 1
	goto_if_ne _0150
	setvar VAR_SPECIAL_x8005, 4
	goto _0188

_0150:
	compare VAR_SPECIAL_x8004, 2
	goto_if_ne _0169
	setvar VAR_SPECIAL_x8005, 3
	goto _0188

_0169:
	compare VAR_SPECIAL_x8004, 3
	goto_if_ne _0182
	setvar VAR_SPECIAL_x8005, 2
	goto _0188

_0182:
	setvar VAR_SPECIAL_x8005, 1
_0188:
	buffer_players_name 0
	buffer_int 1, VAR_SPECIAL_x8004
	buffer_int 2, VAR_SPECIAL_x8005
	gender_msgbox msg_0549_T20R0402_00009, msg_0549_T20R0402_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0402_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0549_T20R0402_00004
	play_cry SPECIES_MARILL, 0
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0402_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0549_T20R0402_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0402_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0549_T20R0402_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
