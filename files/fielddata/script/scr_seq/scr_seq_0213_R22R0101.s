#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0213_0132 ; 000
	scrdef scr_seq_0213_017F ; 001
	scrdef scr_seq_0213_0311 ; 002
	scrdef scr_seq_0213_016C ; 003
	scrdef scr_seq_0213_02E8 ; 004
	scrdef scr_seq_0213_047C ; 005
	scrdef scr_seq_0213_0026 ; 006
	scrdef scr_seq_0213_0056 ; 007
	scrdef scr_seq_0213_04A5 ; 008
	scrdef_end

scr_seq_0213_0026:
	checkflag FLAG_UNK_12C
	gotoif FALSE, scr_seq_0213_003D
	show_person_at 2, 15, 0, 8, 1
scr_seq_0213_003D:
	checkflag FLAG_UNK_12B
	gotoif FALSE, scr_seq_0213_0054
	show_person_at 1, 7, 0, 8, 1
scr_seq_0213_0054:
	end

scr_seq_0213_0056:
	setflag FLAG_UNK_9D1
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0213_006B
	clearflag FLAG_UNK_189
	end

scr_seq_0213_006B:
	scrcmd_147 26, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0213_00DF
	scrcmd_294 12, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0213_009D
	goto scr_seq_0213_012C

scr_seq_0213_0097:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0213_009D:
	goto scr_seq_0213_00A5

scr_seq_0213_00A3:
	.byte 0x02, 0x00
scr_seq_0213_00A5:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0213_00C0
	clearflag FLAG_UNK_270
	goto scr_seq_0213_00DD

scr_seq_0213_00C0:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_0213_00D7
	clearflag FLAG_UNK_270
	goto scr_seq_0213_00DD

scr_seq_0213_00D7:
	goto scr_seq_0213_012C

scr_seq_0213_00DD:
	end

scr_seq_0213_00DF:
	scrcmd_142 26, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0213_012C
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_0213_010D
	clearflag FLAG_UNK_270
	goto scr_seq_0213_012A

scr_seq_0213_010D:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_0213_0124
	clearflag FLAG_UNK_270
	goto scr_seq_0213_012A

scr_seq_0213_0124:
	goto scr_seq_0213_012C

scr_seq_0213_012A:
	end

scr_seq_0213_012C:
	setflag FLAG_UNK_270
	end

scr_seq_0213_0132:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_0213_015C
	wait_movement
	apply_movement 255, scr_seq_0213_0164
	wait_movement
	npc_msg 0
	waitbutton
	closemsg
	setvar VAR_UNK_4110, 1
	releaseall
	end

scr_seq_0213_015B:
	.byte 0x00

scr_seq_0213_015C:
	.short 75, 1
	.short 254, 0

scr_seq_0213_0164:
	.short 34, 1
	.short 254, 0
scr_seq_0213_016C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0213_017F:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0213_01A4
	apply_movement 2, scr_seq_0213_0264
	goto scr_seq_0213_01AC

scr_seq_0213_01A4:
	apply_movement 2, scr_seq_0213_0270
scr_seq_0213_01AC:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0213_01C9
	apply_movement 2, scr_seq_0213_027C
	goto scr_seq_0213_01EC

scr_seq_0213_01C9:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_0213_01E4
	apply_movement 2, scr_seq_0213_028C
	goto scr_seq_0213_01EC

scr_seq_0213_01E4:
	apply_movement 2, scr_seq_0213_029C
scr_seq_0213_01EC:
	wait_movement
	npc_msg 5
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 2, scr_seq_0213_02AC
	apply_movement 255, scr_seq_0213_02B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 16, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0213_023A
	apply_movement 2, scr_seq_0213_02C4
	goto scr_seq_0213_025D

scr_seq_0213_023A:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_0213_0255
	apply_movement 2, scr_seq_0213_02D0
	goto scr_seq_0213_025D

scr_seq_0213_0255:
	apply_movement 2, scr_seq_0213_02DC
scr_seq_0213_025D:
	wait_movement
	releaseall
	end

scr_seq_0213_0263:
	.byte 0x00

scr_seq_0213_0264:
	.short 32, 1
	.short 75, 1
	.short 254, 0

scr_seq_0213_0270:
	.short 33, 1
	.short 75, 1
	.short 254, 0

scr_seq_0213_027C:
	.short 19, 1
	.short 16, 1
	.short 38, 1
	.short 254, 0

scr_seq_0213_028C:
	.short 19, 1
	.short 17, 1
	.short 38, 1
	.short 254, 0

scr_seq_0213_029C:
	.short 19, 1
	.short 17, 2
	.short 38, 1
	.short 254, 0

scr_seq_0213_02AC:
	.short 14, 1
	.short 254, 0

scr_seq_0213_02B4:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_0213_02C4:
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_0213_02D0:
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0213_02DC:
	.short 12, 2
	.short 34, 1
	.short 254, 0
scr_seq_0213_02E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_12C
	gotoif TRUE, scr_seq_0213_0306
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0213_0306:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0213_0311:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0213_0336
	apply_movement 1, scr_seq_0213_03F8
	goto scr_seq_0213_033E

scr_seq_0213_0336:
	apply_movement 1, scr_seq_0213_0404
scr_seq_0213_033E:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0213_035B
	apply_movement 1, scr_seq_0213_0410
	goto scr_seq_0213_037E

scr_seq_0213_035B:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_0213_0376
	apply_movement 1, scr_seq_0213_0420
	goto scr_seq_0213_037E

scr_seq_0213_0376:
	apply_movement 1, scr_seq_0213_0430
scr_seq_0213_037E:
	wait_movement
	npc_msg 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 1, scr_seq_0213_0440
	apply_movement 255, scr_seq_0213_0448
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 16, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_0213_03CC
	apply_movement 1, scr_seq_0213_0458
	goto scr_seq_0213_03EF

scr_seq_0213_03CC:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_0213_03E7
	apply_movement 1, scr_seq_0213_0464
	goto scr_seq_0213_03EF

scr_seq_0213_03E7:
	apply_movement 1, scr_seq_0213_0470
scr_seq_0213_03EF:
	wait_movement
	releaseall
	end

scr_seq_0213_03F5:
	.byte 0x00, 0x00, 0x00

scr_seq_0213_03F8:
	.short 32, 1
	.short 75, 1
	.short 254, 0

scr_seq_0213_0404:
	.short 33, 1
	.short 75, 1
	.short 254, 0

scr_seq_0213_0410:
	.short 18, 1
	.short 16, 1
	.short 39, 1
	.short 254, 0

scr_seq_0213_0420:
	.short 18, 1
	.short 17, 1
	.short 39, 1
	.short 254, 0

scr_seq_0213_0430:
	.short 18, 1
	.short 17, 2
	.short 39, 1
	.short 254, 0

scr_seq_0213_0440:
	.short 15, 1
	.short 254, 0

scr_seq_0213_0448:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_0213_0458:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_0213_0464:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_0213_0470:
	.short 12, 2
	.short 35, 1
	.short 254, 0
scr_seq_0213_047C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_12B
	gotoif TRUE, scr_seq_0213_049A
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0213_049A:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0213_04A5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 26, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0213_0553
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ge, scr_seq_0213_0548
	npc_msg 7
scr_seq_0213_04D0:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0213_04F4
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0213_0537
	end

scr_seq_0213_04F4:
	buffer_players_name 0
	npc_msg 8
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 26
	npc_msg 9
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_270
	hide_person 3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0213_0537:
	setvar VAR_TEMP_x4005, 1
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0213_0548:
	npc_msg 11
	goto scr_seq_0213_04D0

scr_seq_0213_0551:
	.byte 0x02, 0x00
scr_seq_0213_0553:
	npc_msg 12
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0213_05B4
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0213_05BF
	npc_msg 13
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 70
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0213_05B4:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0213_05BF:
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
