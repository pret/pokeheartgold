#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0838_T11R0702_08A8 ; 000
	scrdef scr_seq_0838_T11R0702_00A3 ; 001
	scrdef scr_seq_0838_T11R0702_00B7 ; 002
	scrdef scr_seq_0838_T11R0702_00CB ; 003
	scrdef scr_seq_0838_T11R0702_00DF ; 004
	scrdef scr_seq_0838_T11R0702_00F3 ; 005
	scrdef scr_seq_0838_T11R0702_0022 ; 006
	scrdef scr_seq_0838_T11R0702_083A ; 007
	scrdef_end

scr_seq_0838_T11R0702_0022:
	setflag FLAG_UNK_283
	setflag FLAG_UNK_284
	setflag FLAG_UNK_285
	setflag FLAG_UNK_286
	setflag FLAG_UNK_287
	scrcmd_673 16384, 16385, 16386, 16387, 16388
	comparevartovalue VAR_TEMP_x4000, 0
	callif eq, scr_seq_0838_T11R0702_0085
	comparevartovalue VAR_TEMP_x4001, 0
	callif eq, scr_seq_0838_T11R0702_008B
	comparevartovalue VAR_TEMP_x4002, 0
	callif eq, scr_seq_0838_T11R0702_0091
	comparevartovalue VAR_TEMP_x4003, 0
	callif eq, scr_seq_0838_T11R0702_0097
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0838_T11R0702_009D
	end

scr_seq_0838_T11R0702_0085:
	clearflag FLAG_UNK_283
	return

scr_seq_0838_T11R0702_008B:
	clearflag FLAG_UNK_284
	return

scr_seq_0838_T11R0702_0091:
	clearflag FLAG_UNK_285
	return

scr_seq_0838_T11R0702_0097:
	clearflag FLAG_UNK_286
	return

scr_seq_0838_T11R0702_009D:
	clearflag FLAG_UNK_287
	return

scr_seq_0838_T11R0702_00A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_0838_T11R0702_0107

scr_seq_0838_T11R0702_00B5:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_00B7:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 4
	goto scr_seq_0838_T11R0702_0107

scr_seq_0838_T11R0702_00C9:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_00CB:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 3
	goto scr_seq_0838_T11R0702_0107

scr_seq_0838_T11R0702_00DD:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_00DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 2
	goto scr_seq_0838_T11R0702_0107

scr_seq_0838_T11R0702_00F1:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_00F3:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 5
	goto scr_seq_0838_T11R0702_0107

scr_seq_0838_T11R0702_0105:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0107:
	scrcmd_389 32780, 479
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0838_T11R0702_07D8
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_0838_T11R0702_0724
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_0838_T11R0702_0729
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_0838_T11R0702_072E
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_0838_T11R0702_0733
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_0838_T11R0702_0738
	scrcmd_674 32771, 32780
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ge, scr_seq_0838_T11R0702_01E5
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_073D
	goto scr_seq_0838_T11R0702_0189

scr_seq_0838_T11R0702_0187:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0189:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_0838_T11R0702_06FC
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_0838_T11R0702_0704
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_0838_T11R0702_070C
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_0838_T11R0702_0714
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_0838_T11R0702_071C
	scrcmd_632 32780, 479
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_03B2
	goto scr_seq_0838_T11R0702_03C0

scr_seq_0838_T11R0702_01E3:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_01E5:
	touchscreen_menu_hide
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 15, 255, 0
	scrcmd_751 14, 255, 1
	scrcmd_751 16, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0838_T11R0702_0189
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0838_T11R0702_0231
	goto scr_seq_0838_T11R0702_073D

scr_seq_0838_T11R0702_022F:
	.byte 0x02
	.byte 0x00
scr_seq_0838_T11R0702_0231:
	scrcmd_674 32771, 32780
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8003, 2
	gotoif ge, scr_seq_0838_T11R0702_0332
	goto scr_seq_0838_T11R0702_0252

scr_seq_0838_T11R0702_0250:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0252:
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 11
	scrcmd_675 32768, 0, 0, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_676 32768, 32772
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_0838_T11R0702_0300
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_0838_T11R0702_030A
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_0838_T11R0702_0314
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_0838_T11R0702_031E
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_0838_T11R0702_0328
	goto scr_seq_0838_T11R0702_02C1

scr_seq_0838_T11R0702_02BF:
	.byte 0x02
	.byte 0x00
scr_seq_0838_T11R0702_02C1:
	scrcmd_815 0
	get_player_coords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_176 403, 0, 32774, 32775, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_490 16395
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, scr_seq_0838_T11R0702_07BA
	goto scr_seq_0838_T11R0702_08A4

scr_seq_0838_T11R0702_02FE:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0300:
	clearflag FLAG_UNK_283
	show_person 0
	return

scr_seq_0838_T11R0702_030A:
	clearflag FLAG_UNK_285
	show_person 2
	return

scr_seq_0838_T11R0702_0314:
	clearflag FLAG_UNK_284
	show_person 3
	return

scr_seq_0838_T11R0702_031E:
	clearflag FLAG_UNK_286
	show_person 1
	return

scr_seq_0838_T11R0702_0328:
	clearflag FLAG_UNK_287
	show_person 4
	return

scr_seq_0838_T11R0702_0332:
	npc_msg 7
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0838_T11R0702_03AC
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0838_T11R0702_041A
	comparevartovalue VAR_SPECIAL_x800C, 479
	gotoif ne, scr_seq_0838_T11R0702_0427
	scrcmd_676 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0838_T11R0702_039F
	goto scr_seq_0838_T11R0702_0252

scr_seq_0838_T11R0702_039D:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_039F:
	npc_msg 17
	waitbutton
	goto scr_seq_0838_T11R0702_089C

scr_seq_0838_T11R0702_03AA:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_03AC:
	touchscreen_menu_show
	releaseall
	end

scr_seq_0838_T11R0702_03B2:
	scrcmd_647 32768, 479
	goto scr_seq_0838_T11R0702_0434

scr_seq_0838_T11R0702_03BE:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_03C0:
	npc_msg 7
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0838_T11R0702_073D
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0838_T11R0702_041A
	comparevartovalue VAR_SPECIAL_x800C, 479
	gotoif ne, scr_seq_0838_T11R0702_0427
	goto scr_seq_0838_T11R0702_0434

scr_seq_0838_T11R0702_0418:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_041A:
	npc_msg 8
	waitbutton
	goto scr_seq_0838_T11R0702_089C

scr_seq_0838_T11R0702_0425:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0427:
	npc_msg 9
	waitbutton
	goto scr_seq_0838_T11R0702_089C

scr_seq_0838_T11R0702_0432:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0434:
	scrcmd_140 32780, 315, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_04BE
	scrcmd_140 32780, 59, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_04BE
	scrcmd_140 32780, 56, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_04BE
	scrcmd_140 32780, 403, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_04BE
	scrcmd_140 32780, 437, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_04BE
	scrcmd_396 32780, 32768
	copyvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0838_T11R0702_051C
	goto scr_seq_0838_T11R0702_04CC

scr_seq_0838_T11R0702_04BC:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_04BE:
	setvar VAR_SPECIAL_x8002, 0
	goto scr_seq_0838_T11R0702_04CC

scr_seq_0838_T11R0702_04CA:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_04CC:
	scrcmd_490 16389
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, scr_seq_0838_T11R0702_050C
	comparevartovar VAR_TEMP_x4000, VAR_SPECIAL_x8000
	gotoif ne, scr_seq_0838_T11R0702_0506
	scrcmd_099 253
	apply_movement 253, scr_seq_0838_T11R0702_06F0
	wait_movement
	scrcmd_098 253
scr_seq_0838_T11R0702_0506:
	setvar VAR_TEMP_x400A, 1
scr_seq_0838_T11R0702_050C:
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	npc_msg 10
	goto scr_seq_0838_T11R0702_0671

scr_seq_0838_T11R0702_051A:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_051C:
	scrcmd_490 16391
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, scr_seq_0838_T11R0702_0564
	scrcmd_490 16384
	scrcmd_490 32768
	comparevartovar VAR_TEMP_x4000, VAR_SPECIAL_x8000
	gotoif ne, scr_seq_0838_T11R0702_055E
	scrcmd_099 253
	apply_movement 253, scr_seq_0838_T11R0702_06F0
	wait_movement
	scrcmd_098 253
scr_seq_0838_T11R0702_055E:
	setvar VAR_TEMP_x400A, 1
scr_seq_0838_T11R0702_0564:
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	scrcmd_197 1, 32769
	npc_msg 0
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_0649
	goto scr_seq_0838_T11R0702_058A

scr_seq_0838_T11R0702_0588:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_058A:
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_352 1, 32768, 32769
	scrcmd_353 1, 32770
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8002, 4
	gotoif eq, scr_seq_0838_T11R0702_0628
	scrcmd_398 32780, 32768, 32770
	scrcmd_197 1, 32780
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_0649
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	scrcmd_398 32780, 32768, 32770
	scrcmd_197 1, 32780
	npc_msg 4
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_x800C
	npc_msg 5
	wait 32, VAR_SPECIAL_x800C
	scrcmd_197 1, 32769
	npc_msg 6
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 16, VAR_SPECIAL_x800C
	goto scr_seq_0838_T11R0702_0671

scr_seq_0838_T11R0702_0626:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0628:
	scrcmd_197 1, 32769
	npc_msg 1
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0838_T11R0702_058A
	goto scr_seq_0838_T11R0702_0649

scr_seq_0838_T11R0702_0647:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0649:
	bufferpartymonnick 0, VAR_SPECIAL_x8000
	scrcmd_197 1, 32769
	npc_msg 2
	waitbutton
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, scr_seq_0838_T11R0702_07BA
	scrcmd_490 16397
	goto scr_seq_0838_T11R0702_089C

scr_seq_0838_T11R0702_066F:
	.byte 0x02
	.byte 0x00
scr_seq_0838_T11R0702_0671:
	scrcmd_675 32768, 32770, 32769, 32772
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_0838_T11R0702_06D2
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_0838_T11R0702_06D8
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_0838_T11R0702_06DE
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_0838_T11R0702_06E4
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_0838_T11R0702_06EA
	goto scr_seq_0838_T11R0702_02C1

scr_seq_0838_T11R0702_06D0:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_06D2:
	hide_person 0
	return

scr_seq_0838_T11R0702_06D8:
	hide_person 1
	return

scr_seq_0838_T11R0702_06DE:
	hide_person 2
	return

scr_seq_0838_T11R0702_06E4:
	hide_person 3
	return

scr_seq_0838_T11R0702_06EA:
	hide_person 4
	return


scr_seq_0838_T11R0702_06F0:
	.short 45, 2
	.short 69, 1
	.short 254, 0
scr_seq_0838_T11R0702_06FC:
	setvar VAR_SPECIAL_x8001, 315
	return

scr_seq_0838_T11R0702_0704:
	setvar VAR_SPECIAL_x8001, 59
	return

scr_seq_0838_T11R0702_070C:
	setvar VAR_SPECIAL_x8001, 56
	return

scr_seq_0838_T11R0702_0714:
	setvar VAR_SPECIAL_x8001, 403
	return

scr_seq_0838_T11R0702_071C:
	setvar VAR_SPECIAL_x8001, 437
	return

scr_seq_0838_T11R0702_0724:
	npc_msg 21
	return

scr_seq_0838_T11R0702_0729:
	npc_msg 24
	return

scr_seq_0838_T11R0702_072E:
	npc_msg 27
	return

scr_seq_0838_T11R0702_0733:
	npc_msg 30
	return

scr_seq_0838_T11R0702_0738:
	npc_msg 33
	return

scr_seq_0838_T11R0702_073D:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_0838_T11R0702_0797
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_0838_T11R0702_079E
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_0838_T11R0702_07A5
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_0838_T11R0702_07AC
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_0838_T11R0702_07B3
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, scr_seq_0838_T11R0702_07BA
	scrcmd_490 16390
	goto scr_seq_0838_T11R0702_089C

scr_seq_0838_T11R0702_0795:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_0797:
	npc_msg 22
	waitbutton
	return

scr_seq_0838_T11R0702_079E:
	npc_msg 25
	waitbutton
	return

scr_seq_0838_T11R0702_07A5:
	npc_msg 28
	waitbutton
	return

scr_seq_0838_T11R0702_07AC:
	npc_msg 31
	waitbutton
	return

scr_seq_0838_T11R0702_07B3:
	npc_msg 34
	waitbutton
	return

scr_seq_0838_T11R0702_07BA:
	scrcmd_099 253
	apply_movement 253, scr_seq_0838_T11R0702_07D0
	wait_movement
	scrcmd_098 253
	return

scr_seq_0838_T11R0702_07CE:
	.byte 0x00, 0x00

scr_seq_0838_T11R0702_07D0:
	.short 70, 1
	.short 254, 0
scr_seq_0838_T11R0702_07D8:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_0838_T11R0702_0821
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_0838_T11R0702_0826
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_0838_T11R0702_082B
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_0838_T11R0702_0830
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_0838_T11R0702_0835
	goto scr_seq_0838_T11R0702_089C

scr_seq_0838_T11R0702_081F:
	.byte 0x02
	.byte 0x00
scr_seq_0838_T11R0702_0821:
	npc_msg 20
	return

scr_seq_0838_T11R0702_0826:
	npc_msg 23
	return

scr_seq_0838_T11R0702_082B:
	npc_msg 26
	return

scr_seq_0838_T11R0702_0830:
	npc_msg 29
	return

scr_seq_0838_T11R0702_0835:
	npc_msg 32
	return

scr_seq_0838_T11R0702_083A:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_674 32771, 32780
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif eq, scr_seq_0838_T11R0702_088D
	npc_msg 13
	touchscreen_menu_hide
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 19, 255, 1
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0838_T11R0702_0231
	goto scr_seq_0838_T11R0702_089C

scr_seq_0838_T11R0702_088B:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_088D:
	npc_msg 18
	waitbutton
	closemsg
	goto scr_seq_0838_T11R0702_08A4

scr_seq_0838_T11R0702_089A:
	.byte 0x02, 0x00
scr_seq_0838_T11R0702_089C:
	touchscreen_menu_show
	closemsg
	releaseall
	end

scr_seq_0838_T11R0702_08A4:
	releaseall
	end

scr_seq_0838_T11R0702_08A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 35
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
