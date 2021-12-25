#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000156_000000C4 ; 000
	scrdef scr_seq_00000156_000002D8 ; 001
	scrdef scr_seq_00000156_00000305 ; 002
	scrdef scr_seq_00000156_00000318 ; 003
	scrdef scr_seq_00000156_000001A0 ; 004
	scrdef scr_seq_00000156_00000065 ; 005
	scrdef scr_seq_00000156_00000033 ; 006
	scrdef scr_seq_00000156_00000026 ; 007
	scrdef scr_seq_00000156_00000063 ; 008
	scrdef_end

scr_seq_00000156_00000026:
	checkflag FLAG_UNK_0EB
	gotoif lt, scr_seq_00000156_00000031
scr_seq_00000156_00000031:
	end

scr_seq_00000156_00000033:
	comparevartovalue VAR_UNK_40E1, 1
	gotoif le, scr_seq_00000156_0000004F
	comparevartovalue VAR_UNK_40E1, 2
	gotoif ge, scr_seq_00000156_00000059
	end

scr_seq_00000156_0000004F:
	scrcmd_342 0, 27, 20
	end

scr_seq_00000156_00000059:
	scrcmd_342 12, 27, 20
	end

scr_seq_00000156_00000063:
	end

scr_seq_00000156_00000065:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000156_0000009C
	apply_movement 1, scr_seq_00000156_000000A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40DC, 1
	releaseall
	end

scr_seq_00000156_00000099:
	.byte 0x00, 0x00, 0x00

scr_seq_00000156_0000009C:
	.short 12, 4
	.short 254, 0

scr_seq_00000156_000000A4:
	.short 71, 1
	.short 10, 1
	.short 72, 1
	.short 3, 2
	.short 65, 1
	.short 11, 1
	.short 0, 2
	.short 254, 0
scr_seq_00000156_000000C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40E1, 1
	gotoif gt, scr_seq_00000156_000000E5
	goto scr_seq_00000156_000000EB

scr_seq_00000156_000000DF:
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000156_000000E5:
	goto scr_seq_00000156_00000138

scr_seq_00000156_000000EB:
	checkflag FLAG_UNK_0EB
	gotoif eq, scr_seq_00000156_00000101
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000156_00000101:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000156_0000012D
	msgbox 2
	closemsg
	apply_movement 1, scr_seq_00000156_00000180
	wait_movement
	setvar VAR_UNK_40CB, 7
	setvar VAR_TEMP_x4000, 1
	releaseall
	end

scr_seq_00000156_0000012D:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000156_00000138:
	checkflag FLAG_UNK_0EB
	gotoif eq, scr_seq_00000156_0000014E
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000156_0000014E:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000156_00000174
	msgbox 5
	closemsg
	apply_movement 1, scr_seq_00000156_00000180
	wait_movement
	setvar VAR_TEMP_x4000, 1
	releaseall
	end

scr_seq_00000156_00000174:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000156_0000017F:
	.byte 0x00

scr_seq_00000156_00000180:
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 2, 2
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0
scr_seq_00000156_000001A0:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000156_00000280
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 22
	gotoif ne, scr_seq_00000156_000001D3
	show_person_at 3, 31, 0, VAR_TEMP_x4001, 2
	goto scr_seq_00000156_0000023C

scr_seq_00000156_000001D3:
	comparevartovalue VAR_TEMP_x4000, 23
	gotoif ne, scr_seq_00000156_000001F2
	show_person_at 3, 32, 0, VAR_TEMP_x4001, 2
	goto scr_seq_00000156_0000023C

scr_seq_00000156_000001F2:
	comparevartovalue VAR_TEMP_x4000, 24
	gotoif ne, scr_seq_00000156_00000211
	show_person_at 3, 33, 0, VAR_TEMP_x4001, 2
	goto scr_seq_00000156_0000023C

scr_seq_00000156_00000211:
	comparevartovalue VAR_TEMP_x4000, 25
	gotoif ne, scr_seq_00000156_00000230
	show_person_at 3, 34, 0, VAR_TEMP_x4001, 2
	goto scr_seq_00000156_0000023C

scr_seq_00000156_00000230:
	show_person_at 3, 35, 0, VAR_TEMP_x4001, 2
scr_seq_00000156_0000023C:
	apply_movement 3, scr_seq_00000156_00000288
	apply_movement 255, scr_seq_00000156_000002A0
	wait_movement
	apply_movement 3, scr_seq_00000156_000002B8
	wait_movement
	msgbox 7
	closemsg
	apply_movement 3, scr_seq_00000156_000002C0
	wait_movement
	hide_person 3
	setflag FLAG_UNK_215
	setvar VAR_UNK_40CB, 2
	scrcmd_074 2133
	releaseall
	end

scr_seq_00000156_0000027D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000156_00000280:
	.short 75, 1
	.short 254, 0

scr_seq_00000156_00000288:
	.short 18, 9
	.short 71, 1
	.short 55, 1
	.short 72, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000156_000002A0:
	.short 61, 5
	.short 3, 2
	.short 61, 5
	.short 51, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000156_000002B8:
	.short 50, 4
	.short 254, 0

scr_seq_00000156_000002C0:
	.short 38, 2
	.short 0, 2
	.short 16, 1
	.short 2, 2
	.short 18, 10
	.short 254, 0
scr_seq_00000156_000002D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_490 16587
	comparevartovalue VAR_UNK_40CB, 7
	gotoif lt, scr_seq_00000156_000002FA
	msgbox 9
	goto scr_seq_00000156_000002FD

scr_seq_00000156_000002FA:
	msgbox 8
scr_seq_00000156_000002FD:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000156_00000305:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000156_00000318:
	end
	.balign 4, 0
