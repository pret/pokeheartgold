#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30R0301.h"
#include "msgdata/msg/msg_0634_T30R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T30R0301_000
	scrdef scr_seq_T30R0301_001
	scrdef_end

scr_seq_T30R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_0D0, _00CA
	npc_msg msg_0634_T30R0301_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	compare VAR_SPECIAL_x800C, 0
	goto_if_eq _003B
	goto _00BF

_003B:
	closemsg
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	compare VAR_SPECIAL_x800C, 255
	goto_if_eq _00BF
	scrcmd_470 3
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_239 32772, 32774
	compare VAR_SPECIAL_x8006, 0
	goto_if_eq _00B2
	scrcmd_472 32780
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	goto_if_ne _00B2
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_0D0
	npc_msg msg_0634_T30R0301_00001
	waitbutton
	closemsg
	releaseall
	end

_00B2:
	scrcmd_474
	npc_msg msg_0634_T30R0301_00002
	waitbutton
	closemsg
	releaseall
	end

_00BF:
	npc_msg msg_0634_T30R0301_00003
	waitbutton
	closemsg
	releaseall
	end

_00CA:
	npc_msg msg_0634_T30R0301_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8000
	mon_has_ribbon VAR_SPECIAL_x800C, VAR_SPECIAL_x8000, RIBBON_HOENN_EFFORT
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _0199
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0634_T30R0301_00005
	get_ev_total 32780, 32768
	compare VAR_SPECIAL_x800C, 510
	goto_if_lt _0136
	npc_msg msg_0634_T30R0301_00006
	give_ribbon VAR_SPECIAL_x8000, RIBBON_HOENN_EFFORT
	play_fanfare SEQ_ME_ITEM
	buffer_players_name 1
	npc_msg msg_0634_T30R0301_00007
	wait_fanfare
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0634_T30R0301_00008
	waitbutton
	closemsg
	releaseall
	end

_0136:
	compare VAR_SPECIAL_x800C, 506
	goto_if_ne _014C
	npc_msg msg_0634_T30R0301_00010
	goto _0191

_014C:
	compare VAR_SPECIAL_x800C, 507
	goto_if_ne _0162
	npc_msg msg_0634_T30R0301_00011
	goto _0191

_0162:
	compare VAR_SPECIAL_x800C, 508
	goto_if_ne _0178
	npc_msg msg_0634_T30R0301_00012
	goto _0191

_0178:
	compare VAR_SPECIAL_x800C, 509
	goto_if_ne _018E
	npc_msg msg_0634_T30R0301_00013
	goto _0191

_018E:
	npc_msg msg_0634_T30R0301_00009
_0191:
	waitbutton
	closemsg
	releaseall
	end

_0199:
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0634_T30R0301_00014
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
