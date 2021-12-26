#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000121_000001BC ; 000
	scrdef scr_seq_00000121_00000238 ; 001
	scrdef scr_seq_00000121_0000024B ; 002
	scrdef scr_seq_00000121_0000025E ; 003
	scrdef scr_seq_00000121_00000067 ; 004
	scrdef scr_seq_00000121_0000001E ; 005
	scrdef scr_seq_00000121_00000037 ; 006
	scrdef_end

scr_seq_00000121_0000001E:
	comparevartovalue VAR_UNK_40F9, 2
	gotoif eq, scr_seq_00000121_00000031
	setflag FLAG_UNK_2CE
	end

scr_seq_00000121_00000031:
	clearflag FLAG_UNK_2CE
	end

scr_seq_00000121_00000037:
	comparevartovalue VAR_UNK_40F9, 2
	gotoif eq, scr_seq_00000121_00000046
	end

scr_seq_00000121_00000046:
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_00000121_00000065
	show_person_at 3, 19, 0, 40, 1
	end

scr_seq_00000121_00000065:
	end

scr_seq_00000121_00000067:
	scrcmd_609
	lockall
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_00000121_00000086
	apply_movement 3, scr_seq_00000121_00000130
	goto scr_seq_00000121_0000008E

scr_seq_00000121_00000086:
	apply_movement 3, scr_seq_00000121_00000148
scr_seq_00000121_0000008E:
	wait_movement
	buffer_players_name 0
	msgbox 7
	closemsg
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_00000121_000000B3
	apply_movement 3, scr_seq_00000121_00000160
	goto scr_seq_00000121_000000BB

scr_seq_00000121_000000B3:
	apply_movement 3, scr_seq_00000121_0000016C
scr_seq_00000121_000000BB:
	wait_movement
	msgbox 8
	closemsg
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_00000121_000000DD
	apply_movement 3, scr_seq_00000121_00000178
	goto scr_seq_00000121_000000E5

scr_seq_00000121_000000DD:
	apply_movement 3, scr_seq_00000121_00000180
scr_seq_00000121_000000E5:
	wait_movement
	msgbox 9
	closemsg
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_00000121_0000010F
	apply_movement 255, scr_seq_00000121_000001A8
	apply_movement 3, scr_seq_00000121_00000188
	goto scr_seq_00000121_00000117

scr_seq_00000121_0000010F:
	apply_movement 3, scr_seq_00000121_00000194
scr_seq_00000121_00000117:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2CE
	hide_person 3
	setvar VAR_UNK_40F9, 3
	releaseall
	end

scr_seq_00000121_0000012F:
	.byte 0x00

scr_seq_00000121_00000130:
	.short 35, 1
	.short 63, 1
	.short 15, 2
	.short 13, 1
	.short 15, 1
	.short 254, 0

scr_seq_00000121_00000148:
	.short 33, 1
	.short 63, 1
	.short 13, 3
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000121_00000160:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000121_0000016C:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000121_00000178:
	.short 35, 1
	.short 254, 0

scr_seq_00000121_00000180:
	.short 33, 1
	.short 254, 0

scr_seq_00000121_00000188:
	.short 63, 1
	.short 15, 2
	.short 254, 0

scr_seq_00000121_00000194:
	.short 63, 1
	.short 12, 4
	.short 15, 2
	.short 12, 9
	.short 254, 0

scr_seq_00000121_000001A8:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000121_000001BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40EB, 1
	gotoif eq, scr_seq_00000121_00000215
	checkflag FLAG_UNK_0F5
	gotoif TRUE, scr_seq_00000121_000001E7
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000121_000001E7:
	msgbox 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000121_0000020A
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000121_0000020A:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000121_00000215:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000121_00000220:
	.byte 0x24, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000121_00000238:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000121_0000024B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000121_0000025E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F5
	gotoif TRUE, scr_seq_00000121_0000027C
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000121_0000027C:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
