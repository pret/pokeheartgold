#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0157_P01R0302_0023 ; 000
	scrdef scr_seq_0157_P01R0302_02D3 ; 001
	scrdef scr_seq_0157_P01R0302_000E ; 002
	scrdef_end

scr_seq_0157_P01R0302_000E:
	comparevartovalue VAR_UNK_40CB, 4
	gotoif ge, scr_seq_0157_P01R0302_001D
	end

scr_seq_0157_P01R0302_001D:
	setflag FLAG_UNK_217
	end

scr_seq_0157_P01R0302_0023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40CB, 6
	gotoif ge, scr_seq_0157_P01R0302_005B
	comparevartovalue VAR_UNK_40CB, 4
	gotoif eq, scr_seq_0157_P01R0302_0050
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0157_P01R0302_0050:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0157_P01R0302_005B:
	checkflag FLAG_UNK_ABB
	gotoif TRUE, scr_seq_0157_P01R0302_0084
	checkflag FLAG_UNK_092
	gotoif TRUE, scr_seq_0157_P01R0302_0084
	scrcmd_294 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0157_P01R0302_008F
scr_seq_0157_P01R0302_0084:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0157_P01R0302_008F:
	npc_msg 7
	closemsg
	comparevartovalue VAR_UNK_4101, 0
	gotoif ne, scr_seq_0157_P01R0302_00B3
	setvar VAR_SPECIAL_x8004, 298
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_00B3:
	comparevartovalue VAR_UNK_4101, 1
	gotoif ne, scr_seq_0157_P01R0302_00D2
	setvar VAR_SPECIAL_x8004, 299
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_00D2:
	comparevartovalue VAR_UNK_4101, 2
	gotoif ne, scr_seq_0157_P01R0302_00F1
	setvar VAR_SPECIAL_x8004, 300
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_00F1:
	comparevartovalue VAR_UNK_4101, 3
	gotoif ne, scr_seq_0157_P01R0302_0110
	setvar VAR_SPECIAL_x8004, 301
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_0110:
	comparevartovalue VAR_UNK_4101, 4
	gotoif ne, scr_seq_0157_P01R0302_012F
	setvar VAR_SPECIAL_x8004, 302
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_012F:
	comparevartovalue VAR_UNK_4101, 5
	gotoif ne, scr_seq_0157_P01R0302_014E
	setvar VAR_SPECIAL_x8004, 303
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_014E:
	comparevartovalue VAR_UNK_4101, 6
	gotoif ne, scr_seq_0157_P01R0302_016D
	setvar VAR_SPECIAL_x8004, 304
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_016D:
	comparevartovalue VAR_UNK_4101, 7
	gotoif ne, scr_seq_0157_P01R0302_018C
	setvar VAR_SPECIAL_x8004, 305
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_018C:
	comparevartovalue VAR_UNK_4101, 8
	gotoif ne, scr_seq_0157_P01R0302_01AB
	setvar VAR_SPECIAL_x8004, 306
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_01AB:
	comparevartovalue VAR_UNK_4101, 9
	gotoif ne, scr_seq_0157_P01R0302_01CA
	setvar VAR_SPECIAL_x8004, 307
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_01CA:
	comparevartovalue VAR_UNK_4101, 10
	gotoif ne, scr_seq_0157_P01R0302_01E9
	setvar VAR_SPECIAL_x8004, 308
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_01E9:
	comparevartovalue VAR_UNK_4101, 11
	gotoif ne, scr_seq_0157_P01R0302_0208
	setvar VAR_SPECIAL_x8004, 309
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_0208:
	comparevartovalue VAR_UNK_4101, 12
	gotoif ne, scr_seq_0157_P01R0302_0227
	setvar VAR_SPECIAL_x8004, 310
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_0227:
	comparevartovalue VAR_UNK_4101, 13
	gotoif ne, scr_seq_0157_P01R0302_0246
	setvar VAR_SPECIAL_x8004, 311
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_0246:
	comparevartovalue VAR_UNK_4101, 14
	gotoif ne, scr_seq_0157_P01R0302_0265
	setvar VAR_SPECIAL_x8004, 312
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_0265:
	comparevartovalue VAR_UNK_4101, 15
	gotoif ne, scr_seq_0157_P01R0302_0284
	setvar VAR_SPECIAL_x8004, 313
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_0296

scr_seq_0157_P01R0302_0284:
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_0157_P01R0302_029C

scr_seq_0157_P01R0302_0296:
	addvar VAR_UNK_4101, 1
scr_seq_0157_P01R0302_029C:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0157_P01R0302_02C3
	callstd 2008
	setflag FLAG_UNK_ABB
	setflag FLAG_UNK_092
	closemsg
	releaseall
	end

scr_seq_0157_P01R0302_02C3:
	scrcmd_194 1, 32772
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0157_P01R0302_02D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0157_P01R0302_02FD
	apply_movement 1, scr_seq_0157_P01R0302_0340
	goto scr_seq_0157_P01R0302_0305

scr_seq_0157_P01R0302_02FD:
	apply_movement 1, scr_seq_0157_P01R0302_0350
scr_seq_0157_P01R0302_0305:
	wait_movement
	gender_msgbox 3, 2
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setvar VAR_UNK_40CB, 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	hide_person 1
	setflag FLAG_UNK_217
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0157_P01R0302_033F:
	.byte 0x00

scr_seq_0157_P01R0302_0340:
	.short 75, 1
	.short 63, 1
	.short 0, 2
	.short 254, 0

scr_seq_0157_P01R0302_0350:
	.short 75, 1
	.short 63, 1
	.short 3, 2
	.short 254, 0
	.balign 4, 0
