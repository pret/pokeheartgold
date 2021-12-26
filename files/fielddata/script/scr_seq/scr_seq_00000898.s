#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000898_00000006 ; 000
	scrdef_end

scr_seq_00000898_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000898_0000002E
	goto scr_seq_00000898_000000B3

scr_seq_00000898_0000002C:
	.byte 0x02, 0x00
scr_seq_00000898_0000002E:
	msgbox 1
	scrcmd_049
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000898_000000B3
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000898_000000BE
	partymon_is_mine VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000898_000000C9
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 2
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000898_000000D9
	goto scr_seq_00000898_000000B3

scr_seq_00000898_000000B1:
	.byte 0x02, 0x00
scr_seq_00000898_000000B3:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000898_000000BE:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000898_000000C9:
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000898_000000D9:
	msgbox 3
	closemsg
	setvar VAR_SPECIAL_x800C, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000898_0000011F
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000898_0000011F:
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
