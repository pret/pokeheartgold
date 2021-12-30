#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0042_D24R0205_00A7 ; 000
	scrdef scr_seq_0042_D24R0205_0179 ; 001
	scrdef scr_seq_0042_D24R0205_0480 ; 002
	scrdef scr_seq_0042_D24R0205_0491 ; 003
	scrdef scr_seq_0042_D24R0205_04A4 ; 004
	scrdef scr_seq_0042_D24R0205_04B7 ; 005
	scrdef scr_seq_0042_D24R0205_01D4 ; 006
	scrdef scr_seq_0042_D24R0205_0304 ; 007
	scrdef scr_seq_0042_D24R0205_002A ; 008
	scrdef scr_seq_0042_D24R0205_03A0 ; 009
	scrdef_end

scr_seq_0042_D24R0205_002A:
	comparevartovalue VAR_UNK_40FB, 10
	gotoif eq, scr_seq_0042_D24R0205_003D
	goto scr_seq_0042_D24R0205_009D

scr_seq_0042_D24R0205_003D:
	get_lead_mon_index VAR_TEMP_x4005
	comparevartovalue VAR_UNK_4102, 1
	gotoif eq, scr_seq_0042_D24R0205_0061
	comparevartovalue VAR_UNK_4102, 2
	gotoif eq, scr_seq_0042_D24R0205_007F
	goto scr_seq_0042_D24R0205_009D

scr_seq_0042_D24R0205_0061:
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 1
	callif eq, scr_seq_0042_D24R0205_009F
	scrcmd_490 16389
	scrcmd_490 16391
	end

scr_seq_0042_D24R0205_007F:
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	callif eq, scr_seq_0042_D24R0205_009F
	scrcmd_490 16389
	scrcmd_490 16390
	end

scr_seq_0042_D24R0205_009D:
	end

scr_seq_0042_D24R0205_009F:
	setvar VAR_UNK_40FB, 11
	return

scr_seq_0042_D24R0205_00A7:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_0042_D24R0205_018C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	checkflag FLAG_UNK_111
	gotoif TRUE, scr_seq_0042_D24R0205_016F
	checkflag FLAG_UNK_110
	gotoif TRUE, scr_seq_0042_D24R0205_016F
	wait 5, VAR_SPECIAL_x800C
	apply_movement 3, scr_seq_0042_D24R0205_0194
	apply_movement 4, scr_seq_0042_D24R0205_0194
	apply_movement 5, scr_seq_0042_D24R0205_01B8
	apply_movement 6, scr_seq_0042_D24R0205_01B8
	wait_movement
	npc_msg 0
	setvar VAR_SPECIAL_x8004, 469
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	closemsg
	apply_movement 3, scr_seq_0042_D24R0205_01A8
	apply_movement 4, scr_seq_0042_D24R0205_01B0
	apply_movement 5, scr_seq_0042_D24R0205_01CC
	apply_movement 6, scr_seq_0042_D24R0205_01CC
	wait_movement
	hide_person 3
	hide_person 4
	hide_person 5
	hide_person 6
	hide_person 1
	hide_person 0
	hide_person 2
	setflag FLAG_UNK_235
	setflag FLAG_UNK_236
	setflag FLAG_UNK_110
	npc_msg 1
	waitbutton
	closemsg
scr_seq_0042_D24R0205_016F:
	setvar VAR_UNK_40CE, 0
	releaseall
	end

scr_seq_0042_D24R0205_0179:
	comparevartovalue VAR_UNK_40CE, 1
	gotoif ne, scr_seq_0042_D24R0205_018A
	scrcmd_375 255
scr_seq_0042_D24R0205_018A:
	end


scr_seq_0042_D24R0205_018C:
	step 68, 1
	step_end

scr_seq_0042_D24R0205_0194:
	step 3, 1
	step 75, 1
	step 15, 5
	step 13, 1
	step_end

scr_seq_0042_D24R0205_01A8:
	step 14, 10
	step_end

scr_seq_0042_D24R0205_01B0:
	step 12, 10
	step_end

scr_seq_0042_D24R0205_01B8:
	step 2, 1
	step 75, 1
	step 14, 5
	step 13, 1
	step_end

scr_seq_0042_D24R0205_01CC:
	step 15, 10
	step_end
scr_seq_0042_D24R0205_01D4:
	scrcmd_609
	lockall
	apply_movement 7, scr_seq_0042_D24R0205_02B0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0042_D24R0205_02FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 6
	closemsg
	apply_movement 7, scr_seq_0042_D24R0205_02BC
	wait_movement
	npc_msg 7
	closemsg
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0x00
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0x00
	wait_fade
	scrcmd_074 2305
	apply_movement 7, scr_seq_0042_D24R0205_02E4
	wait_movement
	npc_msg 8
	closemsg
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0x00
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0x00
	wait_fade
	scrcmd_074 2305
	setvar VAR_UNK_40FB, 3
	setflag FLAG_UNK_2E6
	setflag FLAG_UNK_2E7
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 522, 0, 16, 24, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0042_D24R0205_02AD:
	.byte 0x00, 0x00, 0x00

scr_seq_0042_D24R0205_02B0:
	step 14, 4
	step 35, 1
	step_end

scr_seq_0042_D24R0205_02BC:
	step 75, 1
	step 63, 1
	step 16, 3
	step 32, 1
	step 18, 2
	step 32, 1
	step 71, 1
	step 10, 1
	step 72, 1
	step_end

scr_seq_0042_D24R0205_02E4:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end

scr_seq_0042_D24R0205_02FC:
	step 14, 4
	step_end
scr_seq_0042_D24R0205_0304:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 7, scr_seq_0042_D24R0205_0368
	apply_movement 255, scr_seq_0042_D24R0205_0398
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 255, scr_seq_0042_D24R0205_0390
	wait_movement
	npc_msg 9
	closemsg
	apply_movement 7, scr_seq_0042_D24R0205_0380
	wait_movement
	npc_msg 10
	closemsg
	apply_movement 7, scr_seq_0042_D24R0205_0388
	wait_movement
	hide_person 7
	setflag FLAG_UNK_2E7
	setvar VAR_UNK_40FB, 10
	releaseall
	end


scr_seq_0042_D24R0205_0368:
	step 63, 1
	step 34, 1
	step 75, 1
	step 63, 1
	step 18, 3
	step_end

scr_seq_0042_D24R0205_0380:
	step 34, 1
	step_end

scr_seq_0042_D24R0205_0388:
	step 15, 10
	step_end

scr_seq_0042_D24R0205_0390:
	step 35, 1
	step_end

scr_seq_0042_D24R0205_0398:
	step 15, 1
	step_end
scr_seq_0042_D24R0205_03A0:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0042_D24R0205_045C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0x00
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0x00
	wait_fade
	scrcmd_074 2305
	apply_movement 255, scr_seq_0042_D24R0205_0468
	wait_movement
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0x00
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0x00
	wait_fade
	scrcmd_074 2305
	setvar VAR_UNK_40FB, 12
	setvar VAR_UNK_4104, 1
	setflag FLAG_UNK_2DC
	setflag FLAG_UNK_2DD
	setflag FLAG_UNK_2DB
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 522, 0, 16, 24, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end


scr_seq_0042_D24R0205_045C:
	step 14, 1
	step 13, 1
	step_end

scr_seq_0042_D24R0205_0468:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end
scr_seq_0042_D24R0205_0480:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0042_D24R0205_0491:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0042_D24R0205_04A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0042_D24R0205_04B7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
