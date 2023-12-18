#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0952.h"
#include "msgdata/msg/msg_0726.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0952_000
	scrdef scr_seq_0952_001
	scrdef scr_seq_0952_002
	scrdef scr_seq_0952_003
	scrdef scr_seq_0952_004
	scrdef scr_seq_0952_005
	scrdef scr_seq_0952_006
	scrdef scr_seq_0952_007
	scrdef scr_seq_0952_008
	scrdef scr_seq_0952_009
	scrdef scr_seq_0952_010
	scrdef scr_seq_0952_011
	scrdef_end

scr_seq_0952_000:
	setflag FLAG_SYS_FLYPOINT_UNION_CAVE
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 653
_0042:
	set_trainer_house_sprite VAR_TEMP_x4000, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_ne _005F
	setflagvar VAR_TEMP_x4001
	goto _0063

_005F:
	clearflagvar VAR_TEMP_x4001
_0063:
	addvar VAR_TEMP_x4000, 1
	addvar VAR_TEMP_x4001, 1
	compare VAR_TEMP_x4000, 10
	goto_if_lt _0042
	end

scr_seq_0952_001:
	setvar VAR_TEMP_x4000, 10
	goto _0118
	end

scr_seq_0952_002:
	setvar VAR_TEMP_x4000, 0
	goto _0118
	end

scr_seq_0952_003:
	setvar VAR_TEMP_x4000, 1
	goto _0118
	end

scr_seq_0952_004:
	setvar VAR_TEMP_x4000, 2
	goto _0118
	end

scr_seq_0952_005:
	setvar VAR_TEMP_x4000, 3
	goto _0118
	end

scr_seq_0952_006:
	setvar VAR_TEMP_x4000, 4
	goto _0118
	end

scr_seq_0952_007:
	setvar VAR_TEMP_x4000, 5
	goto _0118
	end

scr_seq_0952_008:
	setvar VAR_TEMP_x4000, 6
	goto _0118
	end

scr_seq_0952_009:
	setvar VAR_TEMP_x4000, 7
	goto _0118
	end

scr_seq_0952_010:
	setvar VAR_TEMP_x4000, 8
	goto _0118
	end

scr_seq_0952_011:
	setvar VAR_TEMP_x4000, 9
	goto _0118
	end

_0118:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4001, 2730
	addvar VAR_TEMP_x4001, VAR_TEMP_x4000
	checkflagvar VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0186
	npc_msg msg_0726_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	closemsg
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0186
	script_overlay_cmd 4, 0
	show_trainer_house_intro_message VAR_TEMP_x4000
	wait_button
	closemsg
	script_overlay_cmd 4, 1
	scrcmd_808 VAR_TEMP_x4000
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	call_if_eq _0191
	setflagvar VAR_TEMP_x4001
	releaseall
	end

_0186:
	npc_msg msg_0726_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0191:
	npc_msg msg_0726_00002
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	scrcmd_555 1
	return
	.balign 4, 0
