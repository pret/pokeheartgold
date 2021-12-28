#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0152_P01R0101_0138 ; 000
	scrdef scr_seq_0152_P01R0101_0016 ; 001
	scrdef scr_seq_0152_P01R0101_0031 ; 002
	scrdef scr_seq_0152_P01R0101_03FC ; 003
	scrdef scr_seq_0152_P01R0101_040F ; 004
	scrdef_end

scr_seq_0152_P01R0101_0016:
	scrcmd_445 16384
	comparevartovalue VAR_TEMP_x4000, 330
	gotoif eq, scr_seq_0152_P01R0101_0029
	end

scr_seq_0152_P01R0101_0029:
	scrcmd_341 0, 1
	end

scr_seq_0152_P01R0101_0031:
	scrcmd_609
	lockall
	apply_movement 1, scr_seq_0152_P01R0101_00E4
	wait_movement
	scrcmd_081 0
	play_bgm SEQ_GS_OHKIDO
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 1, scr_seq_0152_P01R0101_00EC
	apply_movement 255, scr_seq_0152_P01R0101_0100
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox 9, 10
	closemsg
	apply_movement 1, scr_seq_0152_P01R0101_0110
	wait_movement
	scrcmd_477 1, 32780
	buffer_players_name 0
	play_fanfare SEQ_ME_ITEM
	npc_msg 11
	wait_fanfare
	scrcmd_463
	npc_msg 12
	closemsg
	apply_movement 1, scr_seq_0152_P01R0101_0120
	wait_movement
	npc_msg 13
	closemsg
	apply_movement 1, scr_seq_0152_P01R0101_0128
	wait_movement
	hide_person 1
	setflag FLAG_UNK_251
	setvar VAR_UNK_411A, 0
	fade_out_bgm 0, 30
	scrcmd_081 0
	reset_bgm
	releaseall
	comparevartovalue VAR_UNK_40D3, 1
	callif eq, scr_seq_0152_P01R0101_00DE
	scrcmd_463
	end

scr_seq_0152_P01R0101_00DE:
	clearflag FLAG_UNK_2B3
	return


scr_seq_0152_P01R0101_00E4:
	.short 75, 1
	.short 254, 0

scr_seq_0152_P01R0101_00EC:
	.short 63, 1
	.short 14, 3
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0152_P01R0101_0100:
	.short 63, 3
	.short 13, 3
	.short 35, 1
	.short 254, 0

scr_seq_0152_P01R0101_0110:
	.short 34, 1
	.short 63, 2
	.short 34, 1
	.short 254, 0

scr_seq_0152_P01R0101_0120:
	.short 75, 1
	.short 254, 0

scr_seq_0152_P01R0101_0128:
	.short 12, 2
	.short 14, 1
	.short 12, 1
	.short 254, 0
scr_seq_0152_P01R0101_0138:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0152_P01R0101_0361
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0152_P01R0101_0356
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_0152_P01R0101_0320
	comparevartovalue VAR_UNK_40CB, 7
	gotoif ge, scr_seq_0152_P01R0101_01FB
	npc_msg 1
	closemsg
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0152_P01R0101_02F9
	apply_movement 255, scr_seq_0152_P01R0101_036C
	wait_movement
	buffer_players_name 0
	npc_msg 4
	closemsg
	apply_movement 0, scr_seq_0152_P01R0101_03F4
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 0, scr_seq_0152_P01R0101_038C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0152_P01R0101_03AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_UNK_40E1, 1
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_UNK_0EB
	setflag FLAG_UNK_22C
	setflag FLAG_UNK_22B
	releaseall
	end

scr_seq_0152_P01R0101_01FB:
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0152_P01R0101_0218
	goto scr_seq_0152_P01R0101_02EE

scr_seq_0152_P01R0101_0212:
	.byte 0x16, 0x00, 0x83, 0x00, 0x00, 0x00
scr_seq_0152_P01R0101_0218:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0152_P01R0101_0231
	goto scr_seq_0152_P01R0101_029B

scr_seq_0152_P01R0101_022B:
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00
	.byte 0x00
scr_seq_0152_P01R0101_0231:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0152_P01R0101_024A
	goto scr_seq_0152_P01R0101_02EE

scr_seq_0152_P01R0101_0244:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_0152_P01R0101_024A:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0152_P01R0101_0263
	goto scr_seq_0152_P01R0101_02EE

scr_seq_0152_P01R0101_025D:
	.byte 0x16, 0x00, 0x38
	.byte 0x00, 0x00, 0x00
scr_seq_0152_P01R0101_0263:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, scr_seq_0152_P01R0101_027C
	goto scr_seq_0152_P01R0101_02EE

scr_seq_0152_P01R0101_0276:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0152_P01R0101_027C:
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif ne, scr_seq_0152_P01R0101_0295
	goto scr_seq_0152_P01R0101_029B

scr_seq_0152_P01R0101_028F:
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0152_P01R0101_0295:
	goto scr_seq_0152_P01R0101_02EE

scr_seq_0152_P01R0101_029B:
	npc_msg 7
	closemsg
	apply_movement 0, scr_seq_0152_P01R0101_038C
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0152_P01R0101_03AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_UNK_40E1, 1
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_UNK_0EB
	setflag FLAG_UNK_22A
	clearflag FLAG_UNK_22B
	setflag FLAG_UNK_22C
	releaseall
	end

scr_seq_0152_P01R0101_02EE:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0152_P01R0101_02F9:
	apply_movement 255, scr_seq_0152_P01R0101_0378
	wait_movement
	buffer_players_name 0
	npc_msg 2
	closemsg
	apply_movement 0, scr_seq_0152_P01R0101_03F4
	wait_movement
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0152_P01R0101_0320:
	apply_movement 0, scr_seq_0152_P01R0101_03B4
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0152_P01R0101_03D4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_0152_P01R0101_03E0
	wait_movement
	releaseall
	end

scr_seq_0152_P01R0101_0356:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0152_P01R0101_0361:
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0152_P01R0101_036C:
	.short 35, 1
	.short 1, 2
	.short 254, 0

scr_seq_0152_P01R0101_0378:
	.short 50, 1
	.short 51, 1
	.short 1, 2
	.short 75, 1
	.short 254, 0

scr_seq_0152_P01R0101_038C:
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 2, 2
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_0152_P01R0101_03AC:
	.short 13, 2
	.short 254, 0

scr_seq_0152_P01R0101_03B4:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 2, 2
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_0152_P01R0101_03D4:
	.short 63, 1
	.short 12, 4
	.short 254, 0

scr_seq_0152_P01R0101_03E0:
	.short 14, 1
	.short 1, 2
	.short 13, 1
	.short 32, 1
	.short 254, 0

scr_seq_0152_P01R0101_03F4:
	.short 32, 1
	.short 254, 0
scr_seq_0152_P01R0101_03FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0152_P01R0101_040F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
