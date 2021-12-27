#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0792_0284 ; 000
	scrdef scr_seq_0792_02A0 ; 001
	scrdef scr_seq_0792_02B3 ; 002
	scrdef scr_seq_0792_02C6 ; 003
	scrdef scr_seq_0792_001E ; 004
	scrdef scr_seq_0792_019A ; 005
	scrdef scr_seq_0792_024C ; 006
	scrdef_end

scr_seq_0792_001E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0792_002F
	clearflag FLAG_UNK_189
	end

scr_seq_0792_002F:
	scrcmd_147 18, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0792_0082
	scrcmd_294 12, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0792_005B
	goto scr_seq_0792_00C2

scr_seq_0792_005B:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0792_007A
	clearflag FLAG_UNK_260
	clearflag FLAG_UNK_2E2
	goto scr_seq_0792_0080

scr_seq_0792_007A:
	goto scr_seq_0792_00C2

scr_seq_0792_0080:
	end

scr_seq_0792_0082:
	scrcmd_142 18, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0792_00C2
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0792_00BA
	clearflag FLAG_UNK_260
	setflag FLAG_UNK_2E2
	scrcmd_341 3, 1
	goto scr_seq_0792_00C0

scr_seq_0792_00BA:
	goto scr_seq_0792_00C2

scr_seq_0792_00C0:
	end

scr_seq_0792_00C2:
	setflag FLAG_UNK_260
	setflag FLAG_UNK_2E2
	end

scr_seq_0792_00CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	apply_movement 3, scr_seq_0792_026C
	wait_movement
	npc_msg 0
	closemsg
	apply_movement 4, scr_seq_0792_0274
	wait_movement
	npc_msg 1
	closemsg
	apply_movement 3, scr_seq_0792_026C
	wait_movement
	npc_msg 2
	closemsg
	apply_movement 4, scr_seq_0792_0274
	wait_movement
	npc_msg 3
	closemsg
	apply_movement 3, scr_seq_0792_027C
	wait_movement
	npc_msg 4
scr_seq_0792_011B:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0792_013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0792_0189
	end

scr_seq_0792_013F:
	npc_msg 5
	scrcmd_146 18
	buffer_players_name 0
	npc_msg 6
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg 7
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_260
	hide_person 3
	hide_person 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0792_0189:
	setvar VAR_TEMP_x4004, 1
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_019A:
	scrcmd_147 18, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0792_01CD
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0792_00CC
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	goto scr_seq_0792_011B

scr_seq_0792_01CB:
	.byte 0x02, 0x00
scr_seq_0792_01CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0792_0236
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0792_0241
	npc_msg 11
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 2
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_0236:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_0241:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_024C:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0792_00CC
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0792_026C:
	.short 34, 1
	.short 254, 0

scr_seq_0792_0274:
	.short 35, 1
	.short 254, 0

scr_seq_0792_027C:
	.short 33, 1
	.short 254, 0
scr_seq_0792_0284:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 21
	callstd 2052
	releaseall
	end

scr_seq_0792_02A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_02B3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0792_02C6:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
