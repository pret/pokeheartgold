#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000018_0000000E ; 000
	scrdef scr_seq_00000018_00000025 ; 001
	scrdef scr_seq_00000018_0000013C ; 002
	scrdef_end

scr_seq_00000018_0000000E:
	clearflag FLAG_UNK_1A3
	checkflag FLAG_UNK_078
	gotoif eq, scr_seq_00000018_0000001F
	end

scr_seq_00000018_0000001F:
	setflag FLAG_UNK_1A3
	end

scr_seq_00000018_00000025:
	scrcmd_609
	lockall
	setvar VAR_UNK_40A4, 1
	apply_movement 255, scr_seq_00000018_000000B4
	wait_movement
	scrcmd_105 32772, 32773
	scrcmd_102 32772, 32773
	apply_movement 241, scr_seq_00000018_000000C0
	wait_movement
	apply_movement 3, scr_seq_00000018_000000D0
	wait_movement
	msgbox 0
	closemsg
	wait 15, VAR_SPECIAL_x800C
	callstd 2070
	scrcmd_191 0
	apply_movement 6, scr_seq_00000018_000000D8
	wait_movement
	msgbox 1
	closemsg
	wait 15, VAR_SPECIAL_x800C
	scrcmd_191 0
	msgbox 2
	scrcmd_049
	closemsg
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement 6, scr_seq_00000018_000000E0
	wait_movement
	scrcmd_101 6
	setflag FLAG_UNK_078
	callstd 2071
	apply_movement 241, scr_seq_00000018_000000C8
	wait_movement
	scrcmd_103
	releaseall
	end


scr_seq_00000018_000000B4:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000018_000000C0:
	.short 12, 5
	.short 254, 0

scr_seq_00000018_000000C8:
	.short 13, 5
	.short 254, 0

scr_seq_00000018_000000D0:
	.short 33, 2
	.short 254, 0

scr_seq_00000018_000000D8:
	.short 13, 1
	.short 254, 0

scr_seq_00000018_000000E0:
	.short 2, 4
	.short 0, 4
	.short 3, 4
	.short 1, 4
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0
scr_seq_00000018_0000013C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_076
	gotoif eq, scr_seq_00000018_00000197
	msgbox 3
	closemsg
	scrcmd_213 290, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000018_000001A2
	msgbox 4
	setvar VAR_SPECIAL_x8004, 397
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setflag FLAG_UNK_076
	setflag FLAG_UNK_2E3
	clearflag FLAG_UNK_2E4
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000018_00000197:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000018_000001A2:
	scrcmd_219
	releaseall
	end
	.balign 4, 0
