#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0053_0394 ; 000
	scrdef scr_seq_0053_009F ; 001
	scrdef scr_seq_0053_01CC ; 002
	scrdef scr_seq_0053_0268 ; 003
	scrdef scr_seq_0053_001E ; 004
	scrdef scr_seq_0053_0348 ; 005
	scrdef scr_seq_0053_0376 ; 006
	scrdef_end

scr_seq_0053_001E:
	scrcmd_490 16388
	comparevartovalue VAR_UNK_40FB, 10
	gotoif eq, scr_seq_0053_0035
	goto scr_seq_0053_0095

scr_seq_0053_0035:
	get_lead_mon_index VAR_TEMP_x4005
	comparevartovalue VAR_UNK_4102, 1
	gotoif eq, scr_seq_0053_0059
	comparevartovalue VAR_UNK_4102, 2
	gotoif eq, scr_seq_0053_0077
	goto scr_seq_0053_0095

scr_seq_0053_0059:
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 1
	callif eq, scr_seq_0053_0097
	scrcmd_490 16389
	scrcmd_490 16391
	end

scr_seq_0053_0077:
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	callif eq, scr_seq_0053_0097
	scrcmd_490 16389
	scrcmd_490 16390
	end

scr_seq_0053_0095:
	end

scr_seq_0053_0097:
	setvar VAR_UNK_40FB, 11
	return

scr_seq_0053_009F:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_0053_0178
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0053_01C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 1
	closemsg
	apply_movement 0, scr_seq_0053_0184
	wait_movement
	npc_msg 2
	closemsg
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0
	wait_fade
	scrcmd_074 2305
	apply_movement 0, scr_seq_0053_01AC
	wait_movement
	npc_msg 3
	closemsg
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0
	wait_fade
	scrcmd_074 2305
	setvar VAR_UNK_40FB, 3
	setflag FLAG_UNK_2E6
	setflag FLAG_UNK_2E7
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 522, 0, 16, 24, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end


scr_seq_0053_0178:
	.short 14, 4
	.short 35, 1
	.short 254, 0

scr_seq_0053_0184:
	.short 75, 1
	.short 63, 1
	.short 16, 3
	.short 32, 1
	.short 18, 2
	.short 32, 1
	.short 71, 1
	.short 10, 1
	.short 72, 1
	.short 254, 0

scr_seq_0053_01AC:
	.short 35, 1
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 33, 1
	.short 254, 0

scr_seq_0053_01C4:
	.short 14, 4
	.short 254, 0
scr_seq_0053_01CC:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0053_0230
	apply_movement 255, scr_seq_0053_0260
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 255, scr_seq_0053_0258
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 0, scr_seq_0053_0248
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 0, scr_seq_0053_0250
	wait_movement
	hide_person 0
	setflag FLAG_UNK_2E7
	setvar VAR_UNK_40FB, 10
	releaseall
	end


scr_seq_0053_0230:
	.short 63, 1
	.short 34, 1
	.short 75, 1
	.short 63, 1
	.short 18, 3
	.short 254, 0

scr_seq_0053_0248:
	.short 34, 1
	.short 254, 0

scr_seq_0053_0250:
	.short 15, 10
	.short 254, 0

scr_seq_0053_0258:
	.short 35, 1
	.short 254, 0

scr_seq_0053_0260:
	.short 15, 1
	.short 254, 0
scr_seq_0053_0268:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0053_0324
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0
	wait_fade
	scrcmd_074 2305
	apply_movement 255, scr_seq_0053_0330
	wait_movement
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0
	wait_fade
	scrcmd_074 2305
	setvar VAR_UNK_40FB, 12
	setvar VAR_UNK_4104, 1
	setflag FLAG_UNK_2DC
	setflag FLAG_UNK_2DD
	setflag FLAG_UNK_2DB
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 522, 0, 16, 24, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end


scr_seq_0053_0324:
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_0053_0330:
	.short 35, 1
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 33, 1
	.short 254, 0
scr_seq_0053_0348:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_0053_038C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40CE, 0
	releaseall
	end

scr_seq_0053_0376:
	comparevartovalue VAR_UNK_40CE, 1
	gotoif ne, scr_seq_0053_0387
	scrcmd_375 255
scr_seq_0053_0387:
	end

scr_seq_0053_0389:
	.byte 0x00, 0x00, 0x00

scr_seq_0053_038C:
	.short 68, 1
	.short 254, 0
scr_seq_0053_0394:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
