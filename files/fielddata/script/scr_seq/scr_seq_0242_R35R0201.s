#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0242_R35R0201_032C ; 000
	scrdef scr_seq_0242_R35R0201_033F ; 001
	scrdef scr_seq_0242_R35R0201_046C ; 002
	scrdef scr_seq_0242_R35R0201_0638 ; 003
	scrdef scr_seq_0242_R35R0201_064B ; 004
	scrdef scr_seq_0242_R35R0201_065E ; 005
	scrdef scr_seq_0242_R35R0201_0671 ; 006
	scrdef scr_seq_0242_R35R0201_0684 ; 007
	scrdef scr_seq_0242_R35R0201_01A3 ; 008
	scrdef scr_seq_0242_R35R0201_0036 ; 009
	scrdef scr_seq_0242_R35R0201_0038 ; 010
	scrdef scr_seq_0242_R35R0201_047F ; 011
	scrdef scr_seq_0242_R35R0201_00F0 ; 012
	scrdef_end

scr_seq_0242_R35R0201_0036:
	end

scr_seq_0242_R35R0201_0038:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0242_R35R0201_00D8
	apply_movement 7, scr_seq_0242_R35R0201_00E0
	wait_movement
	callstd 10406
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_0242_R35R0201_00D2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0242_R35R0201_0448
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 487, 0, 40, 86, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0242_R35R0201_00C2
	scrcmd_606
	goto scr_seq_0242_R35R0201_00C4

scr_seq_0242_R35R0201_00C2:
	scrcmd_607
scr_seq_0242_R35R0201_00C4:
	apply_movement 253, scr_seq_0242_R35R0201_00E8
	wait_movement
	scrcmd_099 253
scr_seq_0242_R35R0201_00D2:
	releaseall
	end

scr_seq_0242_R35R0201_00D6:
	.byte 0x00, 0x00

scr_seq_0242_R35R0201_00D8:
	.short 2, 1
	.short 254, 0

scr_seq_0242_R35R0201_00E0:
	.short 3, 1
	.short 254, 0

scr_seq_0242_R35R0201_00E8:
	.short 0, 1
	.short 254, 0
scr_seq_0242_R35R0201_00F0:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_0242_R35R0201_010F
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_0242_R35R0201_0168

scr_seq_0242_R35R0201_010F:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0242_R35R0201_012A
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_0242_R35R0201_0168

scr_seq_0242_R35R0201_012A:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0242_R35R0201_0145
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_0242_R35R0201_0168

scr_seq_0242_R35R0201_0145:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0242_R35R0201_0160
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_0242_R35R0201_0168

scr_seq_0242_R35R0201_0160:
	clearflag FLAG_UNK_1C3
	setflag FLAG_UNK_1C4
scr_seq_0242_R35R0201_0168:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0242_R35R0201_0179
	clearflag FLAG_UNK_189
	end

scr_seq_0242_R35R0201_0179:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0242_R35R0201_019D
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0242_R35R0201_019D
	setflag FLAG_UNK_27E
	end

scr_seq_0242_R35R0201_019D:
	clearflag FLAG_UNK_27E
	end

scr_seq_0242_R35R0201_01A3:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_0242_R35R0201_029C
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_0242_R35R0201_01D2
	apply_movement 2, scr_seq_0242_R35R0201_02A4
	goto scr_seq_0242_R35R0201_0210

scr_seq_0242_R35R0201_01D2:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0242_R35R0201_01ED
	apply_movement 2, scr_seq_0242_R35R0201_02B4
	goto scr_seq_0242_R35R0201_0210

scr_seq_0242_R35R0201_01ED:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_0242_R35R0201_0208
	apply_movement 2, scr_seq_0242_R35R0201_02C4
	goto scr_seq_0242_R35R0201_0210

scr_seq_0242_R35R0201_0208:
	apply_movement 2, scr_seq_0242_R35R0201_02D4
scr_seq_0242_R35R0201_0210:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 2, scr_seq_0242_R35R0201_02E4
	apply_movement 255, scr_seq_0242_R35R0201_02EC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 10
	closemsg
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_0242_R35R0201_0258
	apply_movement 2, scr_seq_0242_R35R0201_02FC
	goto scr_seq_0242_R35R0201_0296

scr_seq_0242_R35R0201_0258:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0242_R35R0201_0273
	apply_movement 2, scr_seq_0242_R35R0201_0308
	goto scr_seq_0242_R35R0201_0296

scr_seq_0242_R35R0201_0273:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_0242_R35R0201_028E
	apply_movement 2, scr_seq_0242_R35R0201_0314
	goto scr_seq_0242_R35R0201_0296

scr_seq_0242_R35R0201_028E:
	apply_movement 2, scr_seq_0242_R35R0201_0320
scr_seq_0242_R35R0201_0296:
	wait_movement
	releaseall
	end


scr_seq_0242_R35R0201_029C:
	.short 75, 1
	.short 254, 0

scr_seq_0242_R35R0201_02A4:
	.short 18, 1
	.short 16, 2
	.short 39, 1
	.short 254, 0

scr_seq_0242_R35R0201_02B4:
	.short 18, 1
	.short 16, 1
	.short 39, 1
	.short 254, 0

scr_seq_0242_R35R0201_02C4:
	.short 18, 1
	.short 17, 1
	.short 39, 1
	.short 254, 0

scr_seq_0242_R35R0201_02D4:
	.short 18, 1
	.short 17, 2
	.short 39, 1
	.short 254, 0

scr_seq_0242_R35R0201_02E4:
	.short 15, 1
	.short 254, 0

scr_seq_0242_R35R0201_02EC:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_0242_R35R0201_02FC:
	.short 13, 2
	.short 35, 1
	.short 254, 0

scr_seq_0242_R35R0201_0308:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_0242_R35R0201_0314:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_0242_R35R0201_0320:
	.short 12, 2
	.short 35, 1
	.short 254, 0
scr_seq_0242_R35R0201_032C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_033F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10405
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_0242_R35R0201_0438
	checkflag FLAG_UNK_1C4
	gotoif TRUE, scr_seq_0242_R35R0201_03C1
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0242_R35R0201_038C
	apply_movement 255, scr_seq_0242_R35R0201_043C
	goto scr_seq_0242_R35R0201_03AF

scr_seq_0242_R35R0201_038C:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0242_R35R0201_03A7
	apply_movement 255, scr_seq_0242_R35R0201_0448
	goto scr_seq_0242_R35R0201_03AF

scr_seq_0242_R35R0201_03A7:
	apply_movement 255, scr_seq_0242_R35R0201_0450
scr_seq_0242_R35R0201_03AF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0242_R35R0201_03E3

scr_seq_0242_R35R0201_03C1:
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0242_R35R0201_0460
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_0242_R35R0201_03E3:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 487, 0, 40, 86, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0242_R35R0201_0428
	scrcmd_606
	goto scr_seq_0242_R35R0201_042A

scr_seq_0242_R35R0201_0428:
	scrcmd_607
scr_seq_0242_R35R0201_042A:
	apply_movement 253, scr_seq_0242_R35R0201_00E8
	wait_movement
	scrcmd_099 253
scr_seq_0242_R35R0201_0438:
	releaseall
	end


scr_seq_0242_R35R0201_043C:
	.short 15, 1
	.short 12, 2
	.short 254, 0

scr_seq_0242_R35R0201_0448:
	.short 12, 1
	.short 254, 0

scr_seq_0242_R35R0201_0450:
	.short 13, 1
	.short 15, 2
	.short 12, 2
	.short 254, 0

scr_seq_0242_R35R0201_0460:
	.short 15, 2
	.short 12, 2
	.short 254, 0
scr_seq_0242_R35R0201_046C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_047F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0242_R35R0201_05A7
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0242_R35R0201_05BB
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0242_R35R0201_04F8
	apply_movement 255, scr_seq_0242_R35R0201_05D0
	apply_movement 6, scr_seq_0242_R35R0201_061C
	goto scr_seq_0242_R35R0201_0546

scr_seq_0242_R35R0201_04F8:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0242_R35R0201_0513
	apply_movement 255, scr_seq_0242_R35R0201_05E8
	goto scr_seq_0242_R35R0201_0546

scr_seq_0242_R35R0201_0513:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0242_R35R0201_0536
	apply_movement 255, scr_seq_0242_R35R0201_0608
	apply_movement 6, scr_seq_0242_R35R0201_061C
	goto scr_seq_0242_R35R0201_0546

scr_seq_0242_R35R0201_0536:
	apply_movement 255, scr_seq_0242_R35R0201_05F4
	apply_movement 6, scr_seq_0242_R35R0201_061C
scr_seq_0242_R35R0201_0546:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0242_R35R0201_056D
	apply_movement 253, scr_seq_0242_R35R0201_0628
	wait_movement
scr_seq_0242_R35R0201_056D:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 12
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_05A7:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_05BB:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_05CF:
	.byte 0x00

scr_seq_0242_R35R0201_05D0:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0242_R35R0201_05E8:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0242_R35R0201_05F4:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0242_R35R0201_0608:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0242_R35R0201_061C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0242_R35R0201_0628:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0242_R35R0201_0638:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_064B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_065E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_0671:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0242_R35R0201_0684:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
