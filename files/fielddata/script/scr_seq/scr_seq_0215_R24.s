#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0215_0194 ; 000
	scrdef scr_seq_0215_01E7 ; 001
	scrdef scr_seq_0215_00BC ; 002
	scrdef scr_seq_0215_002D ; 003
	scrdef scr_seq_0215_0016 ; 004
	scrdef_end

scr_seq_0215_0016:
	comparevartovalue VAR_UNK_4087, 2
	gotoif eq, scr_seq_0215_0025
	end

scr_seq_0215_0025:
	setvar VAR_UNK_4087, 1
	end

scr_seq_0215_002D:
	scrcmd_609
	lockall
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0215_0060
	apply_movement 2, scr_seq_0215_0084
	apply_movement 0, scr_seq_0215_00A0
	apply_movement 1, scr_seq_0215_00AC
	goto scr_seq_0215_0078

scr_seq_0215_0060:
	apply_movement 2, scr_seq_0215_0090
	apply_movement 0, scr_seq_0215_00A0
	apply_movement 1, scr_seq_0215_00AC
scr_seq_0215_0078:
	wait_movement
	setvar VAR_UNK_4087, 2
	releaseall
	end


scr_seq_0215_0084:
	.short 75, 1
	.short 18, 3
	.short 254, 0

scr_seq_0215_0090:
	.short 0, 1
	.short 75, 1
	.short 18, 3
	.short 254, 0

scr_seq_0215_00A0:
	.short 65, 3
	.short 1, 1
	.short 254, 0

scr_seq_0215_00AC:
	.short 65, 3
	.short 17, 1
	.short 0, 1
	.short 254, 0
scr_seq_0215_00BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_081 1061
	play_bgm SEQ_GS_EYE_ROCKET
	npc_msg 0
	closemsg
	trainer_battle 353, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0215_014A
	npc_msg 2
	closemsg
	fade_out_bgm 0, 30
	npc_msg 3
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 2, scr_seq_0215_0150
	apply_movement 255, scr_seq_0215_015C
	apply_movement 0, scr_seq_0215_0170
	apply_movement 1, scr_seq_0215_017C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 2
	setflag FLAG_UNK_255
	clearflag FLAG_UNK_257
	play_bgm SEQ_GS_R_12_24
	setvar VAR_UNK_4087, 3
	releaseall
	end

scr_seq_0215_014A:
	scrcmd_219
	releaseall
	end


scr_seq_0215_0150:
	.short 19, 1
	.short 17, 10
	.short 254, 0

scr_seq_0215_015C:
	.short 71, 1
	.short 19, 1
	.short 72, 1
	.short 1, 1
	.short 254, 0

scr_seq_0215_0170:
	.short 62, 12
	.short 2, 1
	.short 254, 0

scr_seq_0215_017C:
	.short 62, 1
	.short 1, 1
	.short 62, 10
	.short 12, 1
	.short 2, 1
	.short 254, 0
scr_seq_0215_0194:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_4087, 2
	gotoif ne, scr_seq_0215_01B3
	goto scr_seq_0215_01DC

scr_seq_0215_01AD:
	.byte 0x16, 0x00, 0x29
	.byte 0x00, 0x00, 0x00
scr_seq_0215_01B3:
	comparevartovalue VAR_UNK_4087, 3
	gotoif ne, scr_seq_0215_01D1
	faceplayer
	npc_msg 5
	goto scr_seq_0215_01DF

scr_seq_0215_01CB:
	.byte 0x16, 0x00, 0x0b, 0x00, 0x00
	.byte 0x00
scr_seq_0215_01D1:
	faceplayer
	npc_msg 6
	goto scr_seq_0215_01DF

scr_seq_0215_01DC:
	npc_msg 4
scr_seq_0215_01DF:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0215_01E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_4087, 2
	gotoif ne, scr_seq_0215_0206
	goto scr_seq_0215_022F

scr_seq_0215_0200:
	.byte 0x16, 0x00, 0x29, 0x00, 0x00, 0x00
scr_seq_0215_0206:
	comparevartovalue VAR_UNK_4087, 3
	gotoif ne, scr_seq_0215_0224
	faceplayer
	npc_msg 8
	goto scr_seq_0215_0232

scr_seq_0215_021E:
	.byte 0x16, 0x00
	.byte 0x0b, 0x00, 0x00, 0x00
scr_seq_0215_0224:
	faceplayer
	npc_msg 9
	goto scr_seq_0215_0232

scr_seq_0215_022F:
	npc_msg 7
scr_seq_0215_0232:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
