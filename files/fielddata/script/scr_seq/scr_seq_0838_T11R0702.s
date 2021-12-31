#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0702.h"
#include "msgdata/msg/msg_0538_T11R0702.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0702_000
	scrdef scr_seq_T11R0702_001
	scrdef scr_seq_T11R0702_002
	scrdef scr_seq_T11R0702_003
	scrdef scr_seq_T11R0702_004
	scrdef scr_seq_T11R0702_005
	scrdef scr_seq_T11R0702_006
	scrdef scr_seq_T11R0702_007
	scrdef_end

scr_seq_T11R0702_006:
	setflag FLAG_UNK_283
	setflag FLAG_UNK_284
	setflag FLAG_UNK_285
	setflag FLAG_UNK_286
	setflag FLAG_UNK_287
	scrcmd_673 16384, 16385, 16386, 16387, 16388
	comparevartovalue VAR_TEMP_x4000, 0
	callif eq, _0085
	comparevartovalue VAR_TEMP_x4001, 0
	callif eq, _008B
	comparevartovalue VAR_TEMP_x4002, 0
	callif eq, _0091
	comparevartovalue VAR_TEMP_x4003, 0
	callif eq, _0097
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _009D
	end

_0085:
	clearflag FLAG_UNK_283
	return

_008B:
	clearflag FLAG_UNK_284
	return

_0091:
	clearflag FLAG_UNK_285
	return

_0097:
	clearflag FLAG_UNK_286
	return

_009D:
	clearflag FLAG_UNK_287
	return

scr_seq_T11R0702_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 1
	goto _0107
	.byte 0x02, 0x00
scr_seq_T11R0702_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 4
	goto _0107
	.byte 0x02, 0x00
scr_seq_T11R0702_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 3
	goto _0107
	.byte 0x02, 0x00
scr_seq_T11R0702_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 2
	goto _0107
	.byte 0x02, 0x00
scr_seq_T11R0702_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 5
	goto _0107
	.byte 0x02, 0x00
_0107:
	scrcmd_389 32780, 479
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _07D8
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, _0724
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, _0729
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, _072E
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, _0733
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, _0738
	scrcmd_674 32771, 32780
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ge, _01E5
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _073D
	goto _0189
	.byte 0x02, 0x00
_0189:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, _06FC
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, _0704
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, _070C
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, _0714
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, _071C
	scrcmd_632 32780, 479
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03B2
	goto _03C0
	.byte 0x02, 0x00
_01E5:
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 15, 255, 0
	menu_item_add 14, 255, 1
	menu_item_add 16, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0189
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0231
	goto _073D
	.byte 0x02
	.byte 0x00
_0231:
	scrcmd_674 32771, 32780
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8003, 2
	gotoif ge, _0332
	goto _0252
	.byte 0x02, 0x00
_0252:
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0538_T11R0702_00011
	scrcmd_675 32768, 0, 0, 0
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_676 32768, 32772
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, _0300
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, _030A
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, _0314
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, _031E
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, _0328
	goto _02C1
	.byte 0x02
	.byte 0x00
_02C1:
	scrcmd_815 0
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 403, 0, 32774, 32775, 32780
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_490 16395
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, _07BA
	goto _08A4
	.byte 0x02, 0x00
_0300:
	clearflag FLAG_UNK_283
	show_person obj_T11R0702_rotomf
	return

_030A:
	clearflag FLAG_UNK_285
	show_person obj_T11R0702_rotomi
	return

_0314:
	clearflag FLAG_UNK_284
	show_person obj_T11R0702_rotomw
	return

_031E:
	clearflag FLAG_UNK_286
	show_person obj_T11R0702_rotoms
	return

_0328:
	clearflag FLAG_UNK_287
	show_person obj_T11R0702_rotomg
	return

_0332:
	npc_msg msg_0538_T11R0702_00007
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, _03AC
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _041A
	comparevartovalue VAR_SPECIAL_x800C, 479
	gotoif ne, _0427
	scrcmd_676 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _039F
	goto _0252
	.byte 0x02, 0x00
_039F:
	npc_msg msg_0538_T11R0702_00017
	waitbutton
	goto _089C
	.byte 0x02, 0x00
_03AC:
	touchscreen_menu_show
	releaseall
	end

_03B2:
	scrcmd_647 32768, 479
	goto _0434
	.byte 0x02, 0x00
_03C0:
	npc_msg msg_0538_T11R0702_00007
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, _073D
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _041A
	comparevartovalue VAR_SPECIAL_x800C, 479
	gotoif ne, _0427
	goto _0434
	.byte 0x02, 0x00
_041A:
	npc_msg msg_0538_T11R0702_00008
	waitbutton
	goto _089C
	.byte 0x02, 0x00
_0427:
	npc_msg msg_0538_T11R0702_00009
	waitbutton
	goto _089C
	.byte 0x02, 0x00
_0434:
	mon_has_move VAR_SPECIAL_x800C, MOVE_OVERHEAT, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04BE
	mon_has_move VAR_SPECIAL_x800C, MOVE_BLIZZARD, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04BE
	mon_has_move VAR_SPECIAL_x800C, MOVE_HYDRO_PUMP, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04BE
	mon_has_move VAR_SPECIAL_x800C, MOVE_AIR_SLASH, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04BE
	mon_has_move VAR_SPECIAL_x800C, MOVE_LEAF_STORM, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04BE
	scrcmd_396 32780, 32768
	copyvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, _051C
	goto _04CC
	.byte 0x02, 0x00
_04BE:
	setvar VAR_SPECIAL_x8002, 0
	goto _04CC
	.byte 0x02, 0x00
_04CC:
	scrcmd_490 16389
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, _050C
	comparevartovar VAR_TEMP_x4000, VAR_SPECIAL_x8000
	gotoif ne, _0506
	release obj_partner_poke
	apply_movement obj_partner_poke, _06F0
	wait_movement
	lock obj_partner_poke
_0506:
	setvar VAR_TEMP_x400A, 1
_050C:
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg msg_0538_T11R0702_00010
	goto _0671
	.byte 0x02, 0x00
_051C:
	scrcmd_490 16391
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, _0564
	scrcmd_490 16384
	scrcmd_490 32768
	comparevartovar VAR_TEMP_x4000, VAR_SPECIAL_x8000
	gotoif ne, _055E
	release obj_partner_poke
	apply_movement obj_partner_poke, _06F0
	wait_movement
	lock obj_partner_poke
_055E:
	setvar VAR_TEMP_x400A, 1
_0564:
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	buffer_move_name 1, VAR_SPECIAL_x8001
	npc_msg msg_0538_T11R0702_00000
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0649
	goto _058A
	.byte 0x02, 0x00
_058A:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_352 1, 32768, 32769
	scrcmd_353 1, 32770
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8002, 4
	gotoif eq, _0628
	scrcmd_398 32780, 32768, 32770
	buffer_move_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0538_T11R0702_00003
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0649
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	scrcmd_398 32780, 32768, 32770
	buffer_move_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0538_T11R0702_00004
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_x800C
	npc_msg msg_0538_T11R0702_00005
	wait 32, VAR_SPECIAL_x800C
	buffer_move_name 1, VAR_SPECIAL_x8001
	npc_msg msg_0538_T11R0702_00006
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 16, VAR_SPECIAL_x800C
	goto _0671
	.byte 0x02, 0x00
_0628:
	buffer_move_name 1, VAR_SPECIAL_x8001
	npc_msg msg_0538_T11R0702_00001
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _058A
	goto _0649
	.byte 0x02, 0x00
_0649:
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	buffer_move_name 1, VAR_SPECIAL_x8001
	npc_msg msg_0538_T11R0702_00002
	waitbutton
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, _07BA
	scrcmd_490 16397
	goto _089C
	.byte 0x02
	.byte 0x00
_0671:
	scrcmd_675 32768, 32770, 32769, 32772
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, _06D2
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, _06D8
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, _06DE
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, _06E4
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, _06EA
	goto _02C1
	.byte 0x02, 0x00
_06D2:
	hide_person obj_T11R0702_rotomf
	return

_06D8:
	hide_person obj_T11R0702_rotoms
	return

_06DE:
	hide_person obj_T11R0702_rotomi
	return

_06E4:
	hide_person obj_T11R0702_rotomw
	return

_06EA:
	hide_person obj_T11R0702_rotomg
	return


_06F0:
	step 45, 2
	step 69, 1
	step_end
_06FC:
	setvar VAR_SPECIAL_x8001, 315
	return

_0704:
	setvar VAR_SPECIAL_x8001, 59
	return

_070C:
	setvar VAR_SPECIAL_x8001, 56
	return

_0714:
	setvar VAR_SPECIAL_x8001, 403
	return

_071C:
	setvar VAR_SPECIAL_x8001, 437
	return

_0724:
	npc_msg msg_0538_T11R0702_00021
	return

_0729:
	npc_msg msg_0538_T11R0702_00024
	return

_072E:
	npc_msg msg_0538_T11R0702_00027
	return

_0733:
	npc_msg msg_0538_T11R0702_00030
	return

_0738:
	npc_msg msg_0538_T11R0702_00033
	return

_073D:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, _0797
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, _079E
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, _07A5
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, _07AC
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, _07B3
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, _07BA
	scrcmd_490 16390
	goto _089C
	.byte 0x02, 0x00
_0797:
	npc_msg msg_0538_T11R0702_00022
	waitbutton
	return

_079E:
	npc_msg msg_0538_T11R0702_00025
	waitbutton
	return

_07A5:
	npc_msg msg_0538_T11R0702_00028
	waitbutton
	return

_07AC:
	npc_msg msg_0538_T11R0702_00031
	waitbutton
	return

_07B3:
	npc_msg msg_0538_T11R0702_00034
	waitbutton
	return

_07BA:
	release obj_partner_poke
	apply_movement obj_partner_poke, _07D0
	wait_movement
	lock obj_partner_poke
	return
	.byte 0x00, 0x00

_07D0:
	step 70, 1
	step_end
_07D8:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, _0821
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, _0826
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, _082B
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, _0830
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, _0835
	goto _089C
	.byte 0x02
	.byte 0x00
_0821:
	npc_msg msg_0538_T11R0702_00020
	return

_0826:
	npc_msg msg_0538_T11R0702_00023
	return

_082B:
	npc_msg msg_0538_T11R0702_00026
	return

_0830:
	npc_msg msg_0538_T11R0702_00029
	return

_0835:
	npc_msg msg_0538_T11R0702_00032
	return

scr_seq_T11R0702_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_674 32771, 32780
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif eq, _088D
	npc_msg msg_0538_T11R0702_00013
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 14, 255, 0
	menu_item_add 19, 255, 1
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0231
	goto _089C
	.byte 0x02, 0x00
_088D:
	npc_msg msg_0538_T11R0702_00018
	waitbutton
	closemsg
	goto _08A4
	.byte 0x02, 0x00
_089C:
	touchscreen_menu_show
	closemsg
	releaseall
	end

_08A4:
	releaseall
	end

scr_seq_T11R0702_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0538_T11R0702_00035
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
