#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0246_R37_0012 ; 000
	scrdef scr_seq_0246_R37_0033 ; 001
	scrdef scr_seq_0246_R37_0181 ; 002
	scrdef scr_seq_0246_R37_0198 ; 003
	scrdef_end

scr_seq_0246_R37_0012:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0246_R37_002D
	clearflag FLAG_UNK_1C3
	goto scr_seq_0246_R37_0031

scr_seq_0246_R37_002D:
	setflag FLAG_UNK_1C3
scr_seq_0246_R37_0031:
	end

scr_seq_0246_R37_0033:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_x800C, VAR_SPECIAL_x8002, RIBBON_SMILE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0246_R37_0159
	checkflag FLAG_GOT_SHOCK_RIBBON
	gotoif TRUE, scr_seq_0246_R37_016D
	comparevartovalue VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	gotoif eq, scr_seq_0246_R37_0107
	checkflag FLAG_UNK_0A5
	gotoif TRUE, scr_seq_0246_R37_00E9
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0246_R37_009A
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 27
	goto scr_seq_0246_R37_00E1

scr_seq_0246_R37_009A:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 24
	setvar VAR_SPECIAL_x8004, 242
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0246_R37_00FD
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A5
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 25
scr_seq_0246_R37_00E1:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0246_R37_00E9:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0246_R37_00FD:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0246_R37_0107:
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0246_R37_012A
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 27
	goto scr_seq_0246_R37_00E1

scr_seq_0246_R37_012A:
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

scr_seq_0246_R37_0159:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0246_R37_016D:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 55
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0246_R37_0181:
	scrcmd_055 0, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0246_R37_0198:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
