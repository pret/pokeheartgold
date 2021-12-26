#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000025_00000341 ; 000
	scrdef scr_seq_00000025_00000694 ; 001
	scrdef scr_seq_00000025_000006A9 ; 002
	scrdef scr_seq_00000025_000006BE ; 003
	scrdef scr_seq_00000025_000006D3 ; 004
	scrdef scr_seq_00000025_000006E6 ; 005
	scrdef scr_seq_00000025_000006F9 ; 006
	scrdef scr_seq_00000025_0000070C ; 007
	scrdef scr_seq_00000025_0000071F ; 008
	scrdef scr_seq_00000025_00000732 ; 009
	scrdef scr_seq_00000025_00000745 ; 010
	scrdef scr_seq_00000025_0000006E ; 011
	scrdef scr_seq_00000025_000001CF ; 012
	scrdef scr_seq_00000025_000001E2 ; 013
	scrdef scr_seq_00000025_000001F5 ; 014
	scrdef scr_seq_00000025_00000208 ; 015
	scrdef scr_seq_00000025_0000021B ; 016
	scrdef scr_seq_00000025_0000022E ; 017
	scrdef scr_seq_00000025_00000241 ; 018
	scrdef scr_seq_00000025_00000254 ; 019
	scrdef scr_seq_00000025_00000267 ; 020
	scrdef scr_seq_00000025_0000027A ; 021
	scrdef scr_seq_00000025_0000028D ; 022
	scrdef scr_seq_00000025_00000395 ; 023
	scrdef scr_seq_00000025_00000528 ; 024
	scrdef scr_seq_00000025_000000E3 ; 025
	scrdef scr_seq_00000025_000002A0 ; 026
	scrdef_end

scr_seq_00000025_0000006E:
	comparevartovalue VAR_UNK_40F7, 1
	callif eq, scr_seq_00000025_0000007D
	end

scr_seq_00000025_0000007D:
	show_person_at 20, 51, 0, 48, 1
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 10
	setvar VAR_TEMP_x4002, 48
	scrcmd_784 1, 0
scr_seq_00000025_0000009F:
	scrcmd_790 16384, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_00000025_000000C4
	show_person_at VAR_TEMP_x4001, VAR_TEMP_x4002, 0, 50, 0
	addvar VAR_TEMP_x4002, 2
scr_seq_00000025_000000C4:
	addvar VAR_TEMP_x4000, 1
	addvar VAR_TEMP_x4001, 1
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif lt, scr_seq_00000025_0000009F
	scrcmd_784 1, 1
	return

scr_seq_00000025_000000E3:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000025_000000F4
	clearflag FLAG_UNK_189
	end

scr_seq_00000025_000000F4:
	comparevartovalue VAR_UNK_40F7, 1
	gotoif eq, scr_seq_00000025_00000162
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000025_00000154
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000025_00000154
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000025_00000162
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000025_00000162
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000025_00000162
	setflag FLAG_UNK_27E
	clearflag FLAG_UNK_27F
	goto scr_seq_00000025_0000016E

scr_seq_00000025_00000154:
	clearflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	goto scr_seq_00000025_0000016E

scr_seq_00000025_00000162:
	setflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	clearflag FLAG_UNK_996
scr_seq_00000025_0000016E:
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_00000025_0000017F
	setflag FLAG_UNK_288
	end

scr_seq_00000025_0000017F:
	scrcmd_142 34, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000025_000001C9
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000025_000001C3
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000025_000001C3
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000025_000001C3
	setflag FLAG_UNK_288
	end

scr_seq_00000025_000001C3:
	clearflag FLAG_UNK_288
	end

scr_seq_00000025_000001C9:
	setflag FLAG_UNK_288
	end

scr_seq_00000025_000001CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 45
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_000001E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_000001F5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000208:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_0000021B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_0000022E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000241:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000254:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000267:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_0000027A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 72
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_0000028D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_000002A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000025_000002C7
	buffer_players_name 0
	msgbox 84
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_000002C7:
	buffer_players_name 0
	msgbox 85
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000025_0000032B
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000025_00000336
	msgbox 86
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 7
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	msgbox 87
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_0000032B:
	msgbox 88
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000336:
	msgbox 89
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000341:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_10E
	gotoif TRUE, scr_seq_00000025_00000380
	msgbox 2
	setvar VAR_SPECIAL_x8004, 217
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000025_0000038B
	callstd 2033
	setflag FLAG_UNK_10E
scr_seq_00000025_00000380:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_0000038B:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000025_00000395:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000025_00000650
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000025_00000664
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000025_0000040E
	apply_movement 255, scr_seq_00000025_000004C0
	apply_movement 26, scr_seq_00000025_0000050C
	goto scr_seq_00000025_0000045C

scr_seq_00000025_0000040E:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000025_00000429
	apply_movement 255, scr_seq_00000025_000004D8
	goto scr_seq_00000025_0000045C

scr_seq_00000025_00000429:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000025_0000044C
	apply_movement 255, scr_seq_00000025_000004F8
	apply_movement 26, scr_seq_00000025_0000050C
	goto scr_seq_00000025_0000045C

scr_seq_00000025_0000044C:
	apply_movement 255, scr_seq_00000025_000004E4
	apply_movement 26, scr_seq_00000025_0000050C
scr_seq_00000025_0000045C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000025_00000483
	apply_movement 253, scr_seq_00000025_00000518
	wait_movement
scr_seq_00000025_00000483:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 16
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_000004BD:
	.byte 0x00, 0x00, 0x00

scr_seq_00000025_000004C0:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000025_000004D8:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000025_000004E4:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000025_000004F8:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000025_0000050C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000025_00000518:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000025_00000528:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000025_00000650
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000025_00000664
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000025_000005A1
	apply_movement 255, scr_seq_00000025_000004C0
	apply_movement 27, scr_seq_00000025_0000050C
	goto scr_seq_00000025_000005EF

scr_seq_00000025_000005A1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000025_000005BC
	apply_movement 255, scr_seq_00000025_000004D8
	goto scr_seq_00000025_000005EF

scr_seq_00000025_000005BC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000025_000005DF
	apply_movement 255, scr_seq_00000025_00000678
	apply_movement 27, scr_seq_00000025_0000050C
	goto scr_seq_00000025_000005EF

scr_seq_00000025_000005DF:
	apply_movement 255, scr_seq_00000025_000004E4
	apply_movement 27, scr_seq_00000025_0000050C
scr_seq_00000025_000005EF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000025_00000616
	apply_movement 253, scr_seq_00000025_00000518
	wait_movement
scr_seq_00000025_00000616:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 17
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000650:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000664:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000025_00000678:
	.short 13, 1
	.short 15, 2
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 33, 1
	.short 254, 0
scr_seq_00000025_00000694:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 22, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000025_000006A9:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 23, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000025_000006BE:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 24, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000025_000006D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_000006E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_000006F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_0000070C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_0000071F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000732:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000745:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	scrcmd_076 53, 0
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000025_00000760:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
