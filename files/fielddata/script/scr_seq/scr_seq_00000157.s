#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000157_00000023 ; 000
	scrdef scr_seq_00000157_000002D3 ; 001
	scrdef scr_seq_00000157_0000000E ; 002
	scrdef_end

scr_seq_00000157_0000000E:
	comparevartovalue VAR_UNK_40CB, 4
	gotoif ge, scr_seq_00000157_0000001D
	end

scr_seq_00000157_0000001D:
	setflag FLAG_UNK_217
	end

scr_seq_00000157_00000023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40CB, 6
	gotoif ge, scr_seq_00000157_0000005B
	comparevartovalue VAR_UNK_40CB, 4
	gotoif eq, scr_seq_00000157_00000050
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000157_00000050:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000157_0000005B:
	checkflag FLAG_UNK_ABB
	gotoif eq, scr_seq_00000157_00000084
	checkflag FLAG_UNK_092
	gotoif eq, scr_seq_00000157_00000084
	scrcmd_294 15, 16386
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000157_0000008F
scr_seq_00000157_00000084:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000157_0000008F:
	msgbox 7
	closemsg
	comparevartovalue VAR_UNK_4101, 0
	gotoif ne, scr_seq_00000157_000000B3
	setvar VAR_SPECIAL_x8004, 298
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_000000B3:
	comparevartovalue VAR_UNK_4101, 1
	gotoif ne, scr_seq_00000157_000000D2
	setvar VAR_SPECIAL_x8004, 299
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_000000D2:
	comparevartovalue VAR_UNK_4101, 2
	gotoif ne, scr_seq_00000157_000000F1
	setvar VAR_SPECIAL_x8004, 300
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_000000F1:
	comparevartovalue VAR_UNK_4101, 3
	gotoif ne, scr_seq_00000157_00000110
	setvar VAR_SPECIAL_x8004, 301
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_00000110:
	comparevartovalue VAR_UNK_4101, 4
	gotoif ne, scr_seq_00000157_0000012F
	setvar VAR_SPECIAL_x8004, 302
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_0000012F:
	comparevartovalue VAR_UNK_4101, 5
	gotoif ne, scr_seq_00000157_0000014E
	setvar VAR_SPECIAL_x8004, 303
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_0000014E:
	comparevartovalue VAR_UNK_4101, 6
	gotoif ne, scr_seq_00000157_0000016D
	setvar VAR_SPECIAL_x8004, 304
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_0000016D:
	comparevartovalue VAR_UNK_4101, 7
	gotoif ne, scr_seq_00000157_0000018C
	setvar VAR_SPECIAL_x8004, 305
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_0000018C:
	comparevartovalue VAR_UNK_4101, 8
	gotoif ne, scr_seq_00000157_000001AB
	setvar VAR_SPECIAL_x8004, 306
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_000001AB:
	comparevartovalue VAR_UNK_4101, 9
	gotoif ne, scr_seq_00000157_000001CA
	setvar VAR_SPECIAL_x8004, 307
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_000001CA:
	comparevartovalue VAR_UNK_4101, 10
	gotoif ne, scr_seq_00000157_000001E9
	setvar VAR_SPECIAL_x8004, 308
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_000001E9:
	comparevartovalue VAR_UNK_4101, 11
	gotoif ne, scr_seq_00000157_00000208
	setvar VAR_SPECIAL_x8004, 309
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_00000208:
	comparevartovalue VAR_UNK_4101, 12
	gotoif ne, scr_seq_00000157_00000227
	setvar VAR_SPECIAL_x8004, 310
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_00000227:
	comparevartovalue VAR_UNK_4101, 13
	gotoif ne, scr_seq_00000157_00000246
	setvar VAR_SPECIAL_x8004, 311
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_00000246:
	comparevartovalue VAR_UNK_4101, 14
	gotoif ne, scr_seq_00000157_00000265
	setvar VAR_SPECIAL_x8004, 312
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_00000265:
	comparevartovalue VAR_UNK_4101, 15
	gotoif ne, scr_seq_00000157_00000284
	setvar VAR_SPECIAL_x8004, 313
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_00000296

scr_seq_00000157_00000284:
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	goto scr_seq_00000157_0000029C

scr_seq_00000157_00000296:
	addvar VAR_UNK_4101, 1
scr_seq_00000157_0000029C:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000157_000002C3
	callstd 2008
	setflag FLAG_UNK_ABB
	setflag FLAG_UNK_092
	closemsg
	releaseall
	end

scr_seq_00000157_000002C3:
	scrcmd_194 1, 32772
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000157_000002D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	closemsg
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000157_000002FD
	apply_movement 1, scr_seq_00000157_00000340
	goto scr_seq_00000157_00000305

scr_seq_00000157_000002FD:
	apply_movement 1, scr_seq_00000157_00000350
scr_seq_00000157_00000305:
	wait_movement
	scrcmd_132 3, 2
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setvar VAR_UNK_40CB, 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_101 1
	setflag FLAG_UNK_217
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000157_0000033F:
	.byte 0x00

scr_seq_00000157_00000340:
	.short 75, 1
	.short 63, 1
	.short 0, 2
	.short 254, 0

scr_seq_00000157_00000350:
	.short 75, 1
	.short 63, 1
	.short 3, 2
	.short 254, 0
	.balign 4, 0
