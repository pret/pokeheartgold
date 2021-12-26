#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000153_0000014C ; 000
	scrdef scr_seq_00000153_0000001E ; 001
	scrdef scr_seq_00000153_000000C7 ; 002
	scrdef scr_seq_00000153_00000118 ; 003
	scrdef scr_seq_00000153_00000129 ; 004
	scrdef scr_seq_00000153_0000003B ; 005
	scrdef scr_seq_00000153_00000274 ; 006
	scrdef_end

scr_seq_00000153_0000001E:
	comparevartovalue VAR_UNK_40E1, 2
	gotoif eq, scr_seq_00000153_0000002D
	end

scr_seq_00000153_0000002D:
	show_person_at 0, 28, 0, 22, 2
	end

scr_seq_00000153_0000003B:
	scrcmd_582 77, 279, 276
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000153_00000054
	clearflag FLAG_UNK_189
	end

scr_seq_00000153_00000054:
	scrcmd_147 35, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000153_00000097
	scrcmd_294 13, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000153_00000080
	goto scr_seq_00000153_000000C1

scr_seq_00000153_00000080:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000153_000000C1
	clearflag FLAG_UNK_2C9
	end

scr_seq_00000153_00000097:
	scrcmd_142 35, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000153_000000C1
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000153_000000C1
	clearflag FLAG_UNK_2C9
	end

scr_seq_00000153_000000C1:
	setflag FLAG_UNK_2C9
	end

scr_seq_00000153_000000C7:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000153_00000104
	wait_movement
	apply_movement 0, scr_seq_00000153_0000010C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40E1, 0
	clearflag FLAG_UNK_092
	releaseall
	end

scr_seq_00000153_00000101:
	.byte 0x00, 0x00, 0x00

scr_seq_00000153_00000104:
	.short 13, 3
	.short 254, 0

scr_seq_00000153_0000010C:
	.short 14, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000153_00000118:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000153_00000129:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	closemsg
	apply_movement 2, scr_seq_00000153_00000144
	wait_movement
	releaseall
	end


scr_seq_00000153_00000144:
	.short 32, 1
	.short 254, 0
scr_seq_00000153_0000014C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EB
	gotoif TRUE, scr_seq_00000153_00000211
	msgbox 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000153_00000197
	apply_movement 0, scr_seq_00000153_0000021C
	wait_movement
	apply_movement 255, scr_seq_00000153_0000024C
	goto scr_seq_00000153_000001F3

scr_seq_00000153_00000197:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000153_000001BC
	apply_movement 0, scr_seq_00000153_0000022C
	wait_movement
	apply_movement 255, scr_seq_00000153_0000025C
	goto scr_seq_00000153_000001F3

scr_seq_00000153_000001BC:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000153_000001E1
	apply_movement 0, scr_seq_00000153_0000023C
	wait_movement
	apply_movement 255, scr_seq_00000153_0000026C
	goto scr_seq_00000153_000001F3

scr_seq_00000153_000001E1:
	apply_movement 0, scr_seq_00000153_0000023C
	wait_movement
	apply_movement 255, scr_seq_00000153_0000026C
scr_seq_00000153_000001F3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_723 0, 0, 307, 24, 19
	releaseall
	end

scr_seq_00000153_00000211:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000153_0000021C:
	.short 2, 1
	.short 14, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000153_0000022C:
	.short 3, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000153_0000023C:
	.short 3, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000153_0000024C:
	.short 14, 1
	.short 0, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000153_0000025C:
	.short 15, 1
	.short 0, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000153_0000026C:
	.short 12, 2
	.short 254, 0
scr_seq_00000153_00000274:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 35, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000153_00000322
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_00000153_00000317
	msgbox 4
scr_seq_00000153_0000029F:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000153_000002C3
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000153_00000306
	end

scr_seq_00000153_000002C3:
	buffer_players_name 0
	msgbox 5
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 35
	msgbox 6
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_2C9
	hide_person 3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000153_00000306:
	setvar VAR_TEMP_x4004, 1
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000153_00000317:
	msgbox 8
	goto scr_seq_00000153_0000029F

scr_seq_00000153_00000320:
	.byte 0x02, 0x00
scr_seq_00000153_00000322:
	msgbox 9
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000153_00000383
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000153_0000038E
	msgbox 10
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 88
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000153_00000383:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000153_0000038E:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
