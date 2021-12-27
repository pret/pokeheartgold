#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0025_0341 ; 000
	scrdef scr_seq_0025_0694 ; 001
	scrdef scr_seq_0025_06A9 ; 002
	scrdef scr_seq_0025_06BE ; 003
	scrdef scr_seq_0025_06D3 ; 004
	scrdef scr_seq_0025_06E6 ; 005
	scrdef scr_seq_0025_06F9 ; 006
	scrdef scr_seq_0025_070C ; 007
	scrdef scr_seq_0025_071F ; 008
	scrdef scr_seq_0025_0732 ; 009
	scrdef scr_seq_0025_0745 ; 010
	scrdef scr_seq_0025_006E ; 011
	scrdef scr_seq_0025_01CF ; 012
	scrdef scr_seq_0025_01E2 ; 013
	scrdef scr_seq_0025_01F5 ; 014
	scrdef scr_seq_0025_0208 ; 015
	scrdef scr_seq_0025_021B ; 016
	scrdef scr_seq_0025_022E ; 017
	scrdef scr_seq_0025_0241 ; 018
	scrdef scr_seq_0025_0254 ; 019
	scrdef scr_seq_0025_0267 ; 020
	scrdef scr_seq_0025_027A ; 021
	scrdef scr_seq_0025_028D ; 022
	scrdef scr_seq_0025_0395 ; 023
	scrdef scr_seq_0025_0528 ; 024
	scrdef scr_seq_0025_00E3 ; 025
	scrdef scr_seq_0025_02A0 ; 026
	scrdef_end

scr_seq_0025_006E:
	comparevartovalue VAR_UNK_40F7, 1
	callif eq, scr_seq_0025_007D
	end

scr_seq_0025_007D:
	show_person_at 20, 51, 0, 48, 1
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 10
	setvar VAR_TEMP_x4002, 48
	scrcmd_784 1, 0
scr_seq_0025_009F:
	scrcmd_790 16384, 16388
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ne, scr_seq_0025_00C4
	show_person_at VAR_TEMP_x4001, VAR_TEMP_x4002, 0, 50, 0
	addvar VAR_TEMP_x4002, 2
scr_seq_0025_00C4:
	addvar VAR_TEMP_x4000, 1
	addvar VAR_TEMP_x4001, 1
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif lt, scr_seq_0025_009F
	scrcmd_784 1, 1
	return

scr_seq_0025_00E3:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0025_00F4
	clearflag FLAG_UNK_189
	end

scr_seq_0025_00F4:
	comparevartovalue VAR_UNK_40F7, 1
	gotoif eq, scr_seq_0025_0162
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0025_0154
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0025_0154
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0025_0162
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0025_0162
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0025_0162
	setflag FLAG_UNK_27E
	clearflag FLAG_UNK_27F
	goto scr_seq_0025_016E

scr_seq_0025_0154:
	clearflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	goto scr_seq_0025_016E

scr_seq_0025_0162:
	setflag FLAG_UNK_27E
	setflag FLAG_UNK_27F
	clearflag FLAG_UNK_996
scr_seq_0025_016E:
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0025_017F
	setflag FLAG_UNK_288
	end

scr_seq_0025_017F:
	scrcmd_142 34, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0025_01C9
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0025_01C3
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0025_01C3
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0025_01C3
	setflag FLAG_UNK_288
	end

scr_seq_0025_01C3:
	clearflag FLAG_UNK_288
	end

scr_seq_0025_01C9:
	setflag FLAG_UNK_288
	end

scr_seq_0025_01CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 45
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_01E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_01F5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0208:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_021B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_022E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0241:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0254:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0267:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_027A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 72
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_028D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_02A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_0025_02C7
	buffer_players_name 0
	npc_msg 84
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_02C7:
	buffer_players_name 0
	npc_msg 85
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_032B
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_0336
	npc_msg 86
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
	npc_msg 87
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_032B:
	npc_msg 88
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0336:
	npc_msg 89
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0341:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_10E
	gotoif TRUE, scr_seq_0025_0380
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 217
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0025_038B
	callstd 2033
	setflag FLAG_UNK_10E
scr_seq_0025_0380:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_038B:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0025_0395:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_0650
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_0664
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0025_040E
	apply_movement 255, scr_seq_0025_04C0
	apply_movement 26, scr_seq_0025_050C
	goto scr_seq_0025_045C

scr_seq_0025_040E:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0025_0429
	apply_movement 255, scr_seq_0025_04D8
	goto scr_seq_0025_045C

scr_seq_0025_0429:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0025_044C
	apply_movement 255, scr_seq_0025_04F8
	apply_movement 26, scr_seq_0025_050C
	goto scr_seq_0025_045C

scr_seq_0025_044C:
	apply_movement 255, scr_seq_0025_04E4
	apply_movement 26, scr_seq_0025_050C
scr_seq_0025_045C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0025_0483
	apply_movement 253, scr_seq_0025_0518
	wait_movement
scr_seq_0025_0483:
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

scr_seq_0025_04BD:
	.byte 0x00, 0x00, 0x00

scr_seq_0025_04C0:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0025_04D8:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0025_04E4:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0025_04F8:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0025_050C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0025_0518:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0025_0528:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_0650
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0025_0664
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0025_05A1
	apply_movement 255, scr_seq_0025_04C0
	apply_movement 27, scr_seq_0025_050C
	goto scr_seq_0025_05EF

scr_seq_0025_05A1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0025_05BC
	apply_movement 255, scr_seq_0025_04D8
	goto scr_seq_0025_05EF

scr_seq_0025_05BC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0025_05DF
	apply_movement 255, scr_seq_0025_0678
	apply_movement 27, scr_seq_0025_050C
	goto scr_seq_0025_05EF

scr_seq_0025_05DF:
	apply_movement 255, scr_seq_0025_04E4
	apply_movement 27, scr_seq_0025_050C
scr_seq_0025_05EF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0025_0616
	apply_movement 253, scr_seq_0025_0518
	wait_movement
scr_seq_0025_0616:
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

scr_seq_0025_0650:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0664:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0025_0678:
	.short 13, 1
	.short 15, 2
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 33, 1
	.short 254, 0
scr_seq_0025_0694:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 22, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0025_06A9:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 23, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0025_06BE:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 24, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0025_06D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_06E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_06F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_070C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_071F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0732:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0745:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	scrcmd_076 53, 0
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0025_0760:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
