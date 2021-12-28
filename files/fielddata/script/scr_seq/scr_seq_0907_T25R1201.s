#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0907_T25R1201_0120 ; 000
	scrdef scr_seq_0907_T25R1201_004C ; 001
	scrdef scr_seq_0907_T25R1201_0061 ; 002
	scrdef scr_seq_0907_T25R1201_03D0 ; 003
	scrdef scr_seq_0907_T25R1201_03E3 ; 004
	scrdef scr_seq_0907_T25R1201_03F6 ; 005
	scrdef scr_seq_0907_T25R1201_0409 ; 006
	scrdef scr_seq_0907_T25R1201_041C ; 007
	scrdef scr_seq_0907_T25R1201_042F ; 008
	scrdef scr_seq_0907_T25R1201_0442 ; 009
	scrdef scr_seq_0907_T25R1201_0455 ; 010
	scrdef scr_seq_0907_T25R1201_0468 ; 011
	scrdef scr_seq_0907_T25R1201_0503 ; 012
	scrdef scr_seq_0907_T25R1201_059E ; 013
	scrdef scr_seq_0907_T25R1201_05B1 ; 014
	scrdef scr_seq_0907_T25R1201_05C4 ; 015
	scrdef scr_seq_0907_T25R1201_0687 ; 016
	scrdef scr_seq_0907_T25R1201_06DC ; 017
	scrdef_end


scr_seq_0907_T25R1201_004A:
	.byte 0x13, 0xfd
scr_seq_0907_T25R1201_004C:
	comparevartovalue VAR_UNK_4133, 6
	callif eq, scr_seq_0907_T25R1201_005B
	end

scr_seq_0907_T25R1201_005B:
	scrcmd_375 255
	return

scr_seq_0907_T25R1201_0061:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif eq, scr_seq_0907_T25R1201_0084
	goto scr_seq_0907_T25R1201_009D

scr_seq_0907_T25R1201_007E:
	.byte 0x16, 0x00
	.byte 0x13, 0x00, 0x00, 0x00
scr_seq_0907_T25R1201_0084:
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_0907_T25R1201_0097
	goto scr_seq_0907_T25R1201_009D

scr_seq_0907_T25R1201_0097:
	call scr_seq_0907_T25R1201_00A7
scr_seq_0907_T25R1201_009D:
	setvar VAR_UNK_4133, 0
	releaseall
	end

scr_seq_0907_T25R1201_00A7:
	scrcmd_307 0, 0, 8, 2, 77
	call scr_seq_0907_T25R1201_00F5
	scrcmd_374 255
	apply_movement 255, scr_seq_0907_T25R1201_0108
	wait_movement
	call scr_seq_0907_T25R1201_00FD
	scrcmd_307 0, 0, 8, 4, 77
	call scr_seq_0907_T25R1201_00F5
	apply_movement 255, scr_seq_0907_T25R1201_0118
	wait_movement
	call scr_seq_0907_T25R1201_00FD
	setvar VAR_UNK_4133, 0
	return

scr_seq_0907_T25R1201_00F5:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_0907_T25R1201_00FD:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return


scr_seq_0907_T25R1201_0108:
	.short 13, 1
	.short 254, 0
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0907_T25R1201_0118:
	.short 13, 2
	.short 254, 0
scr_seq_0907_T25R1201_0120:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0907_T25R1201_03C4
	checkflag FLAG_UNK_112
	gotoif TRUE, scr_seq_0907_T25R1201_0354
	setflag FLAG_UNK_112
	npc_msg 0
scr_seq_0907_T25R1201_014B:
	scrcmd_746
scr_seq_0907_T25R1201_014D:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 131, 255, 0
	scrcmd_751 130, 255, 1
	scrcmd_751 132, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0907_T25R1201_0227
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0907_T25R1201_01A4
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0907_T25R1201_0330
	goto scr_seq_0907_T25R1201_0330

scr_seq_0907_T25R1201_01A2:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_01A4:
	npc_msg 2
	goto scr_seq_0907_T25R1201_01AF

scr_seq_0907_T25R1201_01AD:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_01AF:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 133, 255, 0
	scrcmd_751 134, 255, 1
	scrcmd_751 135, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0907_T25R1201_0206
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0907_T25R1201_0211
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0907_T25R1201_021C
	goto scr_seq_0907_T25R1201_021C

scr_seq_0907_T25R1201_0204:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_0206:
	npc_msg 3
	goto scr_seq_0907_T25R1201_01AF

scr_seq_0907_T25R1201_020F:
	.byte 0x02
	.byte 0x00
scr_seq_0907_T25R1201_0211:
	npc_msg 4
	goto scr_seq_0907_T25R1201_01AF

scr_seq_0907_T25R1201_021A:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_021C:
	npc_msg 5
	goto scr_seq_0907_T25R1201_014D

scr_seq_0907_T25R1201_0225:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_0227:
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_0907_T25R1201_0240
	goto scr_seq_0907_T25R1201_035F

scr_seq_0907_T25R1201_023E:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_0240:
	npc_msg 9
	waitbutton
	scrcmd_747
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_024D:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0907_T25R1201_0343
	scrcmd_747
	heal_party
	setvar VAR_UNK_4133, 6
	npc_msg 7
	closemsg
	apply_movement 255, scr_seq_0907_T25R1201_03A0
	wait_movement
	scrcmd_307 0, 0, 8, 4, 77
	call scr_seq_0907_T25R1201_00F5
	apply_movement 255, scr_seq_0907_T25R1201_03B4
	wait_movement
	call scr_seq_0907_T25R1201_00FD
	scrcmd_307 0, 0, 8, 2, 77
	call scr_seq_0907_T25R1201_00F5
	apply_movement 255, scr_seq_0907_T25R1201_03AC
	wait_movement
	scrcmd_375 255
	apply_movement 255, scr_seq_0907_T25R1201_03BC
	wait_movement
	call scr_seq_0907_T25R1201_00FD
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_579
	scrcmd_815 0
	scrcmd_166 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_165 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0907_T25R1201_0314
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	call scr_seq_0907_T25R1201_00A7
	releaseall
	end

scr_seq_0907_T25R1201_0314:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	call scr_seq_0907_T25R1201_00A7
	goto scr_seq_0907_T25R1201_0343

scr_seq_0907_T25R1201_032E:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_0330:
	setvar VAR_UNK_4133, 0
	scrcmd_747
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_0343:
	setvar VAR_UNK_4133, 0
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_0354:
	npc_msg 1
	goto scr_seq_0907_T25R1201_014B

scr_seq_0907_T25R1201_035D:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_035F:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0907_T25R1201_0378
	goto scr_seq_0907_T25R1201_024D

scr_seq_0907_T25R1201_0376:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_0378:
	scrcmd_507 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0907_T25R1201_0391
	goto scr_seq_0907_T25R1201_024D

scr_seq_0907_T25R1201_038F:
	.byte 0x02
	.byte 0x00
scr_seq_0907_T25R1201_0391:
	scrcmd_747
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_039E:
	.byte 0x00, 0x00

scr_seq_0907_T25R1201_03A0:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0907_T25R1201_03AC:
	.short 12, 1
	.short 254, 0

scr_seq_0907_T25R1201_03B4:
	.short 12, 2
	.short 254, 0

scr_seq_0907_T25R1201_03BC:
	.short 1, 1
	.short 254, 0
scr_seq_0907_T25R1201_03C4:
	callstd 9016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_03D0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_03E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_03F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_0409:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_041C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_042F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_0442:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_0455:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_0468:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0907_T25R1201_047C

scr_seq_0907_T25R1201_047A:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_047C:
	npc_msg 31
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 33, 255, 0
	scrcmd_751 34, 255, 1
	scrcmd_751 35, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0907_T25R1201_04D3
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0907_T25R1201_04F8
	goto scr_seq_0907_T25R1201_04CB

scr_seq_0907_T25R1201_04C9:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_04CB:
	scrcmd_747
scr_seq_0907_T25R1201_04CD:
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_04D3:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0907_T25R1201_04CD
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_0907_T25R1201_04F8:
	npc_msg 32
	goto scr_seq_0907_T25R1201_047C

scr_seq_0907_T25R1201_0501:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_0503:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0907_T25R1201_0517

scr_seq_0907_T25R1201_0515:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_0517:
	npc_msg 29
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 33, 255, 0
	scrcmd_751 34, 255, 1
	scrcmd_751 35, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0907_T25R1201_056E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0907_T25R1201_0593
	goto scr_seq_0907_T25R1201_0566

scr_seq_0907_T25R1201_0564:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_0566:
	scrcmd_747
scr_seq_0907_T25R1201_0568:
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_056E:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0907_T25R1201_0568
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_0907_T25R1201_0593:
	npc_msg 30
	goto scr_seq_0907_T25R1201_0517

scr_seq_0907_T25R1201_059C:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_059E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_05B1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_05C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0907_T25R1201_0622
	setvar VAR_SPECIAL_x8000, 0
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0907_T25R1201_064D
	buffer_mon_species_name 0, 0
	npc_msg 18
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0907_T25R1201_062D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0907_T25R1201_063A
	end

scr_seq_0907_T25R1201_0622:
	npc_msg 23
	goto scr_seq_0907_T25R1201_067F

scr_seq_0907_T25R1201_062B:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_062D:
	scrcmd_671
	npc_msg 20
	goto scr_seq_0907_T25R1201_067F

scr_seq_0907_T25R1201_0638:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_063A:
	buffer_mon_species_name 0, 0
	npc_msg 21
	goto scr_seq_0907_T25R1201_067F

scr_seq_0907_T25R1201_0648:
	.byte 0x02, 0x00, 0x2d, 0x00, 0x12
scr_seq_0907_T25R1201_064D:
	npc_msg 19
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0907_T25R1201_062D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0907_T25R1201_0674
	end

scr_seq_0907_T25R1201_0674:
	npc_msg 22
	goto scr_seq_0907_T25R1201_067F

scr_seq_0907_T25R1201_067D:
	.byte 0x02, 0x00
scr_seq_0907_T25R1201_067F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_0687:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0907_T25R1201_06D1
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	scrcmd_681 32772
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif eq, scr_seq_0907_T25R1201_06D1
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_06D1:
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0907_T25R1201_06DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 36
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
