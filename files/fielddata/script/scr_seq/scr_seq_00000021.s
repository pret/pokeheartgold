#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000021_000000C5 ; 000
	scrdef scr_seq_00000021_000006E6 ; 001
	scrdef scr_seq_00000021_0000001E ; 002
	scrdef scr_seq_00000021_00000039 ; 003
	scrdef scr_seq_00000021_00000940 ; 004
	scrdef scr_seq_00000021_00000045 ; 005
	scrdef scr_seq_00000021_00000177 ; 006
	scrdef_end

scr_seq_00000021_0000001E:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000021_0000002B
	end

scr_seq_00000021_0000002B:
	setflag FLAG_UNK_242
	hide_person 5
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000021_00000039:
	setvar VAR_TEMP_x4003, 111
	setflag FLAG_UNK_105
	end

scr_seq_00000021_00000045:
	comparevartovalue VAR_TEMP_x400B, 123
	gotoif ne, scr_seq_00000021_0000005C
	scrcmd_074 2153
	setvar VAR_TEMP_x400B, 0
scr_seq_00000021_0000005C:
	checkflag FLAG_UNK_108
	gotoif eq, scr_seq_00000021_000000C3
	checkflag FLAG_UNK_10A
	gotoif lt, scr_seq_00000021_000000C3
	comparevartovalue VAR_TEMP_x4003, 111
	gotoif ne, scr_seq_00000021_000000BB
	show_person_at 0, 16, 1, 18, 0
	show_person_at 1, 12, 1, 18, 0
	show_person_at 2, 12, 1, 12, 1
	show_person_at 3, 18, 1, 18, 0
	show_person_at 4, 18, 1, 12, 1
scr_seq_00000021_000000BB:
	setvar VAR_TEMP_x4003, 0
	end

scr_seq_00000021_000000C3:
	end

scr_seq_00000021_000000C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 250
	scrcmd_076 16394, 0
	msgbox 4
	scrcmd_077
	closemsg
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000021_000000FD
	setvar VAR_SPECIAL_x8004, 45
	goto scr_seq_00000021_00000103

scr_seq_00000021_000000FD:
	setvar VAR_SPECIAL_x8004, 70
scr_seq_00000021_00000103:
	setflag FLAG_UNK_0A4
	scrcmd_589 16394, 32772, 0
	clearflag FLAG_UNK_0A4
	scrcmd_683 16389
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif eq, scr_seq_00000021_00000167
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif eq, scr_seq_00000021_00000167
	comparevartovalue VAR_TEMP_x4005, 4
	callif eq, scr_seq_00000021_00000171
	releaseall
	setflag FLAG_UNK_108
	setvar VAR_UNK_4081, 3
	setflag FLAG_UNK_1A2
	setflag FLAG_UNK_1A1
	setflag FLAG_UNK_2E8
	clearflag FLAG_UNK_2E5
	setflag FLAG_UNK_244
	clearflag FLAG_UNK_23C
	clearflag FLAG_UNK_241
	end

scr_seq_00000021_00000167:
	clearflag FLAG_UNK_242
	scrcmd_219
	releaseall
	end

scr_seq_00000021_00000171:
	setflag FLAG_UNK_116
	return

scr_seq_00000021_00000177:
	scrcmd_609
	lockall
	scrcmd_805
	apply_movement 0, scr_seq_00000021_00000790
	wait_movement
	msgbox 0
	closemsg
	scrcmd_074 2153
	scrcmd_174 4, 4, 0, 32767
	scrcmd_175
	scrcmd_755
	scrcmd_757
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	scrcmd_174 4, 4, 1, 32767
	scrcmd_175
	wait_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	apply_movement 0, scr_seq_00000021_00000754
	apply_movement 1, scr_seq_00000021_00000760
	apply_movement 2, scr_seq_00000021_0000076C
	apply_movement 3, scr_seq_00000021_00000778
	apply_movement 4, scr_seq_00000021_00000784
	wait_movement
	wait 16, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_00000790
	apply_movement 1, scr_seq_00000021_00000790
	apply_movement 2, scr_seq_00000021_00000790
	apply_movement 3, scr_seq_00000021_00000790
	apply_movement 4, scr_seq_00000021_00000790
	wait_movement
	wait 16, VAR_SPECIAL_x800C
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MAIKO_MAI
	wait 18, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_000007A0
	apply_movement 1, scr_seq_00000021_000007A0
	apply_movement 2, scr_seq_00000021_000007A0
	apply_movement 3, scr_seq_00000021_000007A0
	apply_movement 4, scr_seq_00000021_000007A0
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 67, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_000007A0
	apply_movement 1, scr_seq_00000021_000007A0
	apply_movement 2, scr_seq_00000021_000007A0
	apply_movement 3, scr_seq_00000021_000007A0
	apply_movement 4, scr_seq_00000021_000007A0
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	scrcmd_174 4, 6, 1, 32767
	scrcmd_765
	scrcmd_175
	wait 4, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_00000914
	apply_movement 1, scr_seq_00000021_00000904
	apply_movement 2, scr_seq_00000021_0000091C
	apply_movement 3, scr_seq_00000021_00000914
	apply_movement 4, scr_seq_00000021_0000090C
	wait_movement
	apply_movement 0, scr_seq_00000021_0000080C
	apply_movement 1, scr_seq_00000021_000007C4
	apply_movement 2, scr_seq_00000021_00000830
	apply_movement 3, scr_seq_00000021_0000080C
	apply_movement 4, scr_seq_00000021_000007E8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_00000904
	apply_movement 1, scr_seq_00000021_00000904
	apply_movement 2, scr_seq_00000021_0000091C
	apply_movement 3, scr_seq_00000021_00000914
	apply_movement 4, scr_seq_00000021_0000090C
	wait_movement
	apply_movement 0, scr_seq_00000021_000007C4
	apply_movement 1, scr_seq_00000021_000007C4
	apply_movement 2, scr_seq_00000021_00000830
	apply_movement 3, scr_seq_00000021_0000080C
	apply_movement 4, scr_seq_00000021_000007E8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 33, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_00000904
	apply_movement 1, scr_seq_00000021_00000904
	apply_movement 2, scr_seq_00000021_0000091C
	apply_movement 3, scr_seq_00000021_00000914
	apply_movement 4, scr_seq_00000021_0000090C
	wait_movement
	apply_movement 0, scr_seq_00000021_000007C4
	apply_movement 1, scr_seq_00000021_00000854
	apply_movement 2, scr_seq_00000021_000008D8
	apply_movement 3, scr_seq_00000021_000008AC
	apply_movement 4, scr_seq_00000021_00000880
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_0000091C
	apply_movement 1, scr_seq_00000021_0000091C
	apply_movement 2, scr_seq_00000021_0000090C
	apply_movement 3, scr_seq_00000021_00000904
	apply_movement 4, scr_seq_00000021_00000914
	wait_movement
	apply_movement 0, scr_seq_00000021_00000830
	apply_movement 1, scr_seq_00000021_00000830
	apply_movement 2, scr_seq_00000021_000007E8
	apply_movement 3, scr_seq_00000021_000007C4
	apply_movement 4, scr_seq_00000021_0000080C
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 1
	play_se SEQ_SE_GS_SUZUNOONPA_RU
	wait_movement
	scrcmd_766
	scrcmd_762 0
	wait 32, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_0000091C
	apply_movement 1, scr_seq_00000021_0000091C
	apply_movement 2, scr_seq_00000021_0000090C
	apply_movement 3, scr_seq_00000021_00000904
	apply_movement 4, scr_seq_00000021_00000914
	wait_movement
	apply_movement 0, scr_seq_00000021_00000830
	apply_movement 1, scr_seq_00000021_00000830
	apply_movement 2, scr_seq_00000021_000007E8
	apply_movement 3, scr_seq_00000021_000007C4
	apply_movement 4, scr_seq_00000021_0000080C
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_0000090C
	apply_movement 1, scr_seq_00000021_0000091C
	apply_movement 2, scr_seq_00000021_0000090C
	apply_movement 3, scr_seq_00000021_00000904
	apply_movement 4, scr_seq_00000021_00000914
	wait_movement
	apply_movement 0, scr_seq_00000021_000007E8
	apply_movement 1, scr_seq_00000021_00000830
	apply_movement 2, scr_seq_00000021_000007E8
	apply_movement 3, scr_seq_00000021_000007C4
	apply_movement 4, scr_seq_00000021_0000080C
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 41, VAR_SPECIAL_x800C
	scrcmd_763
	wait 8, VAR_SPECIAL_x800C
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_761 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	wait 20, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	scrcmd_099 0
	scrcmd_099 1
	scrcmd_099 2
	scrcmd_099 3
	scrcmd_099 4
	show_person_at 0, 15, 1, 18, 0
	show_person_at 1, 12, 1, 18, 0
	show_person_at 2, 12, 1, 12, 1
	show_person_at 3, 18, 1, 18, 0
	show_person_at 4, 18, 1, 12, 1
	wait 86, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait 32, VAR_SPECIAL_x800C
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_761 2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	wait 22, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_000007C4
	apply_movement 1, scr_seq_00000021_000007C4
	apply_movement 2, scr_seq_00000021_000007E8
	apply_movement 3, scr_seq_00000021_000007C4
	apply_movement 4, scr_seq_00000021_000007E8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 32, VAR_SPECIAL_x800C
	wait 34, VAR_SPECIAL_x800C
	apply_movement 0, scr_seq_00000021_000007C4
	apply_movement 1, scr_seq_00000021_000007C4
	apply_movement 2, scr_seq_00000021_000007E8
	apply_movement 3, scr_seq_00000021_000007C4
	apply_movement 4, scr_seq_00000021_000007E8
	wait 12, VAR_SPECIAL_x800C
	scrcmd_758 0
	play_se SEQ_SE_GS_SUZUNOONPA2
	wait_movement
	wait 60, VAR_SPECIAL_x800C
	scrcmd_762 1
	scrcmd_763
	scrcmd_081 0
	scrcmd_756
	setvar VAR_TEMP_x400B, 123
	scrcmd_174 6, 1, 0, 32767
	scrcmd_175
	scrcmd_773 0
	clearflag FLAG_UNK_242
	scrcmd_100 5
	scrcmd_375 5
	wait 6, VAR_SPECIAL_x800C
	scrcmd_174 6, 1, 1, 32767
	scrcmd_175
	wait 20, VAR_SPECIAL_x800C
	scrcmd_764
	scrcmd_081 30
	apply_movement 0, scr_seq_00000021_00000798
	wait_movement
	scrcmd_726
	scrcmd_190 0
	msgbox 2
	closemsg
	apply_movement 0, scr_seq_00000021_00000790
	wait_movement
	scrcmd_190 0
	msgbox 3
	closemsg
	apply_movement 0, scr_seq_00000021_0000092C
	wait_movement
	releaseall
	setflag FLAG_UNK_10A
	setvar VAR_UNK_40FA, 2
	end

scr_seq_00000021_000006E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif eq, scr_seq_00000021_00000704
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000021_00000704:
	comparevartovalue VAR_TEMP_x4005, 5
	gotoif ne, scr_seq_00000021_0000071A
	msgbox 8
	goto scr_seq_00000021_00000749

scr_seq_00000021_0000071A:
	comparevartovalue VAR_TEMP_x4005, 6
	gotoif ne, scr_seq_00000021_00000730
	msgbox 8
	goto scr_seq_00000021_00000749

scr_seq_00000021_00000730:
	comparevartovalue VAR_TEMP_x4005, 4
	gotoif ne, scr_seq_00000021_00000746
	msgbox 6
	goto scr_seq_00000021_00000749

scr_seq_00000021_00000746:
	msgbox 7
scr_seq_00000021_00000749:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000021_00000751:
	.byte 0x00, 0x00, 0x00

scr_seq_00000021_00000754:
	.short 63, 6
	.short 12, 1
	.short 254, 0

scr_seq_00000021_00000760:
	.short 63, 5
	.short 14, 2
	.short 254, 0

scr_seq_00000021_0000076C:
	.short 14, 1
	.short 12, 6
	.short 254, 0

scr_seq_00000021_00000778:
	.short 63, 5
	.short 15, 2
	.short 254, 0

scr_seq_00000021_00000784:
	.short 15, 1
	.short 12, 6
	.short 254, 0

scr_seq_00000021_00000790:
	.short 33, 1
	.short 254, 0

scr_seq_00000021_00000798:
	.short 32, 1
	.short 254, 0

scr_seq_00000021_000007A0:
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_000007C4:
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_000007E8:
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_0000080C:
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_00000830:
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_00000854:
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_00000880:
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_000008AC:
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_000008D8:
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 254, 0

scr_seq_00000021_00000904:
	.short 8, 2
	.short 254, 0

scr_seq_00000021_0000090C:
	.short 9, 2
	.short 254, 0

scr_seq_00000021_00000914:
	.short 10, 2
	.short 254, 0

scr_seq_00000021_0000091C:
	.short 11, 2
	.short 254, 0
	.byte 0x09, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000021_0000092C:
	.short 2, 1
	.short 71, 1
	.short 11, 1
	.short 72, 1
	.short 254, 0
scr_seq_00000021_00000940:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif eq, scr_seq_00000021_0000095E
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000021_0000095E:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
