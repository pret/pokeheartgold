#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0798_0198 ; 000
	scrdef scr_seq_0798_02B2 ; 001
	scrdef scr_seq_0798_02C5 ; 002
	scrdef scr_seq_0798_02D8 ; 003
	scrdef scr_seq_0798_02EB ; 004
	scrdef scr_seq_0798_030D ; 005
	scrdef scr_seq_0798_031E ; 006
	scrdef scr_seq_0798_032F ; 007
	scrdef scr_seq_0798_003A ; 008
	scrdef scr_seq_0798_0250 ; 009
	scrdef scr_seq_0798_006D ; 010
	scrdef scr_seq_0798_0046 ; 011
	scrdef scr_seq_0798_0340 ; 012
	scrdef scr_seq_0798_02FC ; 013
	scrdef_end

scr_seq_0798_003A:
	scrcmd_144 16416
	setvar VAR_UNK_4125, 0
	end

scr_seq_0798_0046:
	comparevartovalue VAR_UNK_412C, 0
	gotoif ne, scr_seq_0798_006B
	show_person_at 5, 12, 0, 6, 2
	show_person_at 6, 13, 0, 6, 2
scr_seq_0798_006B:
	end

scr_seq_0798_006D:
	scrcmd_609
	lockall
	callstd 2029
	apply_movement 5, scr_seq_0798_012C
	apply_movement 6, scr_seq_0798_0138
	wait_movement
	buffer_players_name 0
	gender_msgbox 12, 13
	closemsg
	apply_movement 5, scr_seq_0798_0140
	apply_movement 6, scr_seq_0798_0148
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0798_0150
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox 14, 15
	closemsg
	apply_movement 5, scr_seq_0798_015C
	apply_movement 6, scr_seq_0798_016C
	wait_movement
	scrcmd_307 0, 0, 3, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 5, scr_seq_0798_0180
	apply_movement 6, scr_seq_0798_018C
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	callstd 2030
	setvar VAR_UNK_412C, 1
	show_person_at 5, 29, 0, 29, 2
	show_person_at 6, 29, 0, 29, 2
	releaseall
	end

scr_seq_0798_012B:
	.byte 0x00

scr_seq_0798_012C:
	.short 14, 4
	.short 75, 1
	.short 254, 0

scr_seq_0798_0138:
	.short 14, 4
	.short 254, 0

scr_seq_0798_0140:
	.short 14, 4
	.short 254, 0

scr_seq_0798_0148:
	.short 14, 4
	.short 254, 0

scr_seq_0798_0150:
	.short 13, 3
	.short 35, 1
	.short 254, 0

scr_seq_0798_015C:
	.short 12, 2
	.short 14, 1
	.short 12, 1
	.short 254, 0

scr_seq_0798_016C:
	.short 14, 1
	.short 12, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_0798_0180:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_0798_018C:
	.short 12, 2
	.short 69, 1
	.short 254, 0
scr_seq_0798_0198:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_423 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0798_0245
	checkflag FLAG_UNK_143
	gotoif TRUE, scr_seq_0798_01ED
	npc_msg 1
	play_fanfare SEQ_ME_HYOUKA2
	wait_fanfare
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_425 0
	scrcmd_150
	setflag FLAG_UNK_143
	scrcmd_515 25
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0798_01ED:
	scrcmd_424 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0798_0245
	checkflag FLAG_UNK_144
	gotoif TRUE, scr_seq_0798_023A
	npc_msg 2
	play_fanfare SEQ_ME_HYOUKA2
	wait_fanfare
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_425 1
	scrcmd_150
	setflag FLAG_UNK_144
	scrcmd_515 26
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0798_023A:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_0245:
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_0250:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0798_0276
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_0276:
	getitemquantity 502, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0798_02A7
	npc_msg 8
	setvar VAR_SPECIAL_x8004, 502
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_02A7:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_02B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_02C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_02D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_02EB:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_02FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_030D:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_031E:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_032F:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0798_0340:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
