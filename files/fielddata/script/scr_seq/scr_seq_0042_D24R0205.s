#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0205.h"
#include "msgdata/msg/msg_0076_D24R0205.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0205_000
	scrdef scr_seq_D24R0205_001
	scrdef scr_seq_D24R0205_002
	scrdef scr_seq_D24R0205_003
	scrdef scr_seq_D24R0205_004
	scrdef scr_seq_D24R0205_005
	scrdef scr_seq_D24R0205_006
	scrdef scr_seq_D24R0205_007
	scrdef scr_seq_D24R0205_008
	scrdef scr_seq_D24R0205_009
	scrdef_end

scr_seq_D24R0205_008:
	comparevartovalue VAR_UNK_40FB, 10
	gotoif eq, _003D
	goto _009D

_003D:
	get_lead_mon_index VAR_TEMP_x4005
	comparevartovalue VAR_UNK_4102, 1
	gotoif eq, _0061
	comparevartovalue VAR_UNK_4102, 2
	gotoif eq, _007F
	goto _009D

_0061:
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 1
	callif eq, _009F
	scrcmd_490 16389
	scrcmd_490 16391
	end

_007F:
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	callif eq, _009F
	scrcmd_490 16389
	scrcmd_490 16390
	end

_009D:
	end

_009F:
	setvar VAR_UNK_40FB, 11
	return

scr_seq_D24R0205_000:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_RAKKA01
	apply_movement obj_player, _018C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	checkflag FLAG_UNK_111
	gotoif TRUE, _016F
	checkflag FLAG_UNK_110
	gotoif TRUE, _016F
	wait 5, VAR_SPECIAL_x800C
	apply_movement obj_D24R0205_gsassistantm, _0194
	apply_movement obj_D24R0205_gsassistantm_2, _0194
	apply_movement obj_D24R0205_gsassistantm_3, _01B8
	apply_movement obj_D24R0205_gsassistantm_4, _01B8
	wait_movement
	npc_msg msg_0076_D24R0205_00000
	setvar VAR_SPECIAL_x8004, 469
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	closemsg
	apply_movement obj_D24R0205_gsassistantm, _01A8
	apply_movement obj_D24R0205_gsassistantm_2, _01B0
	apply_movement obj_D24R0205_gsassistantm_3, _01CC
	apply_movement obj_D24R0205_gsassistantm_4, _01CC
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
	npc_msg msg_0076_D24R0205_00001
	waitbutton
	closemsg
_016F:
	setvar VAR_UNK_40CE, 0
	releaseall
	end

scr_seq_D24R0205_001:
	comparevartovalue VAR_UNK_40CE, 1
	gotoif ne, _018A
	scrcmd_375 255
_018A:
	end


_018C:
	step 68, 1
	step_end

_0194:
	step 3, 1
	step 75, 1
	step 15, 5
	step 13, 1
	step_end

_01A8:
	step 14, 10
	step_end

_01B0:
	step 12, 10
	step_end

_01B8:
	step 2, 1
	step 75, 1
	step 14, 5
	step 13, 1
	step_end

_01CC:
	step 15, 10
	step_end
scr_seq_D24R0205_006:
	scrcmd_609
	lockall
	apply_movement obj_D24R0205_suit, _02B0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _02FC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0076_D24R0205_00006
	closemsg
	apply_movement obj_D24R0205_suit, _02BC
	wait_movement
	npc_msg msg_0076_D24R0205_00007
	closemsg
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0x00
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0x00
	wait_fade
	scrcmd_074 2305
	apply_movement obj_D24R0205_suit, _02E4
	wait_movement
	npc_msg msg_0076_D24R0205_00008
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
	.byte 0x00, 0x00, 0x00

_02B0:
	step 14, 4
	step 35, 1
	step_end

_02BC:
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

_02E4:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end

_02FC:
	step 14, 4
	step_end
scr_seq_D24R0205_007:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D24R0205_suit, _0368
	apply_movement obj_player, _0398
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_player, _0390
	wait_movement
	npc_msg msg_0076_D24R0205_00009
	closemsg
	apply_movement obj_D24R0205_suit, _0380
	wait_movement
	npc_msg msg_0076_D24R0205_00010
	closemsg
	apply_movement obj_D24R0205_suit, _0388
	wait_movement
	hide_person 7
	setflag FLAG_UNK_2E7
	setvar VAR_UNK_40FB, 10
	releaseall
	end


_0368:
	step 63, 1
	step 34, 1
	step 75, 1
	step 63, 1
	step 18, 3
	step_end

_0380:
	step 34, 1
	step_end

_0388:
	step 15, 10
	step_end

_0390:
	step 35, 1
	step_end

_0398:
	step 15, 1
	step_end
scr_seq_D24R0205_009:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _045C
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
	apply_movement obj_player, _0468
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


_045C:
	step 14, 1
	step 13, 1
	step_end

_0468:
	step 35, 1
	step 63, 1
	step 34, 1
	step 63, 1
	step 33, 1
	step_end
scr_seq_D24R0205_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0076_D24R0205_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D24R0205_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0076_D24R0205_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D24R0205_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0076_D24R0205_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D24R0205_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0076_D24R0205_00004
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
