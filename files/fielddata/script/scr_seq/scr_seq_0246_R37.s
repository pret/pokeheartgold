#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R37.h"
#include "msgdata/msg/msg_0393_R37.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R37_000
	scrdef scr_seq_R37_001
	scrdef scr_seq_R37_002
	scrdef scr_seq_R37_003
	scrdef_end

scr_seq_R37_000:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _002D
	clearflag FLAG_UNK_1C3
	goto _0031

_002D:
	setflag FLAG_UNK_1C3
_0031:
	end

scr_seq_R37_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_x800C, VAR_SPECIAL_x8002, RIBBON_SMILE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0159
	checkflag FLAG_GOT_SHOCK_RIBBON
	gotoif TRUE, _016D
	comparevartovalue VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	gotoif eq, _0107
	checkflag FLAG_UNK_0A5
	gotoif TRUE, _00E9
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _009A
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 27
	goto _00E1

_009A:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 24
	setvar VAR_SPECIAL_x8004, 242
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00FD
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A5
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 25
_00E1:
	waitbutton
	closemsg
	releaseall
	end

_00E9:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 26
	waitbutton
	closemsg
	releaseall
	end

_00FD:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0107:
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _012A
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 27
	goto _00E1

_012A:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 52
	buffer_mon_species_name 0, VAR_SPECIAL_x8002
	msgbox_extern VAR_SPECIAL_x800C, 54
	give_ribbon VAR_SPECIAL_x8002, RIBBON_SMILE
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_GOT_SHOCK_RIBBON
	waitbutton
	closemsg
	releaseall
	end

_0159:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 53
	waitbutton
	closemsg
	releaseall
	end

_016D:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 55
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R37_002:
	scrcmd_055 0, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R37_003:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
