#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0161_P01R0306_0046 ; 000
	scrdef scr_seq_0161_P01R0306_0012 ; 001
	scrdef scr_seq_0161_P01R0306_0120 ; 002
	scrdef scr_seq_0161_P01R0306_0098 ; 003
	scrdef_end

scr_seq_0161_P01R0306_0012:
	comparevartovalue VAR_UNK_40CB, 7
	gotoif ge, scr_seq_0161_P01R0306_003C
	comparevartovalue VAR_UNK_40CB, 4
	gotoif gt, scr_seq_0161_P01R0306_0036
	setflag FLAG_UNK_218
	goto scr_seq_0161_P01R0306_003A

scr_seq_0161_P01R0306_0036:
	clearflag FLAG_UNK_218
scr_seq_0161_P01R0306_003A:
	end

scr_seq_0161_P01R0306_003C:
	setflag FLAG_UNK_216
	setflag FLAG_UNK_218
	end

scr_seq_0161_P01R0306_0046:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40CB, 3
	gotoif gt, scr_seq_0161_P01R0306_006E
	apply_movement 0, scr_seq_0161_P01R0306_0090
	wait_movement
	npc_msg 1
	goto scr_seq_0161_P01R0306_0087

scr_seq_0161_P01R0306_006E:
	comparevartovalue VAR_UNK_40CB, 4
	gotoif ne, scr_seq_0161_P01R0306_0084
	npc_msg 0
	goto scr_seq_0161_P01R0306_0087

scr_seq_0161_P01R0306_0084:
	npc_msg 7
scr_seq_0161_P01R0306_0087:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0161_P01R0306_008F:
	.byte 0x00

scr_seq_0161_P01R0306_0090:
	step 49, 2
	step_end
scr_seq_0161_P01R0306_0098:
	scrcmd_609
	lockall
	apply_movement 4, scr_seq_0161_P01R0306_0110
	wait_movement
	gender_msgbox 2, 3
	closemsg
	apply_movement 0, scr_seq_0161_P01R0306_0118
	wait_movement
	buffer_players_name 0
	gender_msgbox 4, 5
	setvar VAR_SPECIAL_x8004, 233
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0161_P01R0306_0103
	callstd std_give_item_verbose
scr_seq_0161_P01R0306_00E2:
	setvar VAR_UNK_40CB, 6
	setflag FLAG_UNK_22A
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	setflag FLAG_UNK_0EB
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0161_P01R0306_0103:
	callstd std_bag_is_full
	closemsg
	goto scr_seq_0161_P01R0306_00E2

scr_seq_0161_P01R0306_010F:
	.byte 0x00

scr_seq_0161_P01R0306_0110:
	step 51, 3
	step_end

scr_seq_0161_P01R0306_0118:
	step 9, 1
	step_end
scr_seq_0161_P01R0306_0120:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
