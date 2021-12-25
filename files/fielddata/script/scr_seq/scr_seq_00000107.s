#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000107_00000006 ; 000
	scrdef_end

scr_seq_00000107_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	closemsg
	trainer_battle 260, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000107_00000098
	msgbox 1
	wait 30, VAR_SPECIAL_x800C
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	hide_person 0
	setflag FLAG_UNK_25F
	setvar VAR_UNK_40FD, 1
	comparevartovalue VAR_UNK_4131, 0
	callif eq, scr_seq_00000107_0000009E
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	call scr_seq_00000107_000000B2
	wait 60, VAR_SPECIAL_x800C
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_163 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000107_00000098:
	scrcmd_219
	releaseall
	end

scr_seq_00000107_0000009E:
	setvar VAR_UNK_4131, 1
	clearflag FLAG_UNK_2FE
	clearflag FLAG_UNK_300
	clearflag FLAG_UNK_2FF
	return

scr_seq_00000107_000000B2:
	scrcmd_332 VAR_SPECIAL_x8004
	setvar VAR_SPECIAL_x8005, 0
scr_seq_00000107_000000BC:
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000107_000000D5
	scrcmd_481 32773, 72
scr_seq_00000107_000000D5:
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x8004
	gotoif lt, scr_seq_00000107_000000BC
	return
	.balign 4, 0
