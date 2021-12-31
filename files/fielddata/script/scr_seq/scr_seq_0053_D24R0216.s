#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0216.h"
#include "msgdata/msg/msg_0084_D24R0216.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0216_000
	scrdef scr_seq_D24R0216_001
	scrdef scr_seq_D24R0216_002
	scrdef scr_seq_D24R0216_003
	scrdef scr_seq_D24R0216_004
	scrdef scr_seq_D24R0216_005
	scrdef scr_seq_D24R0216_006
	scrdef_end

scr_seq_D24R0216_004:
	scrcmd_490 16388
	comparevartovalue VAR_UNK_40FB, 10
	gotoif eq, _0035
	goto _0095

_0035:
	get_lead_mon_index VAR_TEMP_x4005
	comparevartovalue VAR_UNK_4102, 1
	gotoif eq, _0059
	comparevartovalue VAR_UNK_4102, 2
	gotoif eq, _0077
	goto _0095

_0059:
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 1
	callif eq, _0097
	scrcmd_490 16389
	scrcmd_490 16391
	end

_0077:
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	callif eq, _0097
	scrcmd_490 16389
	scrcmd_490 16390
	end

_0095:
	end

_0097:
	setvar VAR_UNK_40FB, 11
	return

scr_seq_D24R0216_001:
	scrcmd_609
	lockall
	apply_movement obj_D24R0216_suit, _0178
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _01C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0084_D24R0216_00001
	closemsg
	apply_movement obj_D24R0216_suit, _0184
	wait_movement
	npc_msg msg_0084_D24R0216_00002
	closemsg
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0x00
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0x00
	wait_fade
	scrcmd_074 2305
	apply_movement obj_D24R0216_suit, _01AC
	wait_movement
	npc_msg msg_0084_D24R0216_00003
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


_0178:
	step 14, 4
	step 35, 1
	step_end

_0184:
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

_01AC:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end

_01C4:
	step 14, 4
	step_end
scr_seq_D24R0216_002:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D24R0216_suit, _0230
	apply_movement obj_player, _0260
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_player, _0258
	wait_movement
	npc_msg msg_0084_D24R0216_00004
	closemsg
	apply_movement obj_D24R0216_suit, _0248
	wait_movement
	npc_msg msg_0084_D24R0216_00005
	closemsg
	apply_movement obj_D24R0216_suit, _0250
	wait_movement
	hide_person obj_D24R0216_suit
	setflag FLAG_UNK_2E7
	setvar VAR_UNK_40FB, 10
	releaseall
	end


_0230:
	step 63, 1
	step 34, 1
	step 75, 1
	step 63, 1
	step 18, 3
	step_end

_0248:
	step 34, 1
	step_end

_0250:
	step 15, 10
	step_end

_0258:
	step 35, 1
	step_end

_0260:
	step 15, 1
	step_end
scr_seq_D24R0216_003:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0324
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
	apply_movement obj_player, _0330
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


_0324:
	step 14, 1
	step 13, 1
	step_end

_0330:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end
scr_seq_D24R0216_005:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _038C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40CE, 0
	releaseall
	end

scr_seq_D24R0216_006:
	comparevartovalue VAR_UNK_40CE, 1
	gotoif ne, _0387
	scrcmd_375 255
_0387:
	end
	.byte 0x00, 0x00, 0x00

_038C:
	step 68, 1
	step_end
scr_seq_D24R0216_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0084_D24R0216_00000
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
