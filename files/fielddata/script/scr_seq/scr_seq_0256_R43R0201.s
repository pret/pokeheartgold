#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0256_R43R0201_01B4 ; 000
	scrdef scr_seq_0256_R43R0201_0012 ; 001
	scrdef scr_seq_0256_R43R0201_00FD ; 002
	scrdef scr_seq_0256_R43R0201_01C7 ; 003
	scrdef_end

scr_seq_0256_R43R0201_0012:
	scrcmd_081 1037
	play_bgm SEQ_GS_EYE_ROCKET
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0256_R43R0201_0037
	goto scr_seq_0256_R43R0201_0095

scr_seq_0256_R43R0201_0031:
	.byte 0x16, 0x00, 0x2f, 0x00, 0x00, 0x00
scr_seq_0256_R43R0201_0037:
	apply_movement 0, scr_seq_0256_R43R0201_0114
	apply_movement 1, scr_seq_0256_R43R0201_0128
	wait_movement
	npc_msg 0
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0256_R43R0201_006C
	npc_msg 1
	closemsg
	goto scr_seq_0256_R43R0201_0077

scr_seq_0256_R43R0201_006C:
	npc_msg 2
	closemsg
	goto scr_seq_0256_R43R0201_0077

scr_seq_0256_R43R0201_0077:
	submoneyimmediate 1000
	apply_movement 0, scr_seq_0256_R43R0201_0144
	apply_movement 1, scr_seq_0256_R43R0201_0158
	wait_movement
	goto scr_seq_0256_R43R0201_00ED

scr_seq_0256_R43R0201_0095:
	apply_movement 0, scr_seq_0256_R43R0201_0164
	apply_movement 1, scr_seq_0256_R43R0201_0180
	wait_movement
	npc_msg 0
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0256_R43R0201_00CA
	npc_msg 1
	closemsg
	goto scr_seq_0256_R43R0201_00D5

scr_seq_0256_R43R0201_00CA:
	npc_msg 2
	closemsg
	goto scr_seq_0256_R43R0201_00D5

scr_seq_0256_R43R0201_00D5:
	submoneyimmediate 1000
	apply_movement 0, scr_seq_0256_R43R0201_0194
	apply_movement 1, scr_seq_0256_R43R0201_01A4
	wait_movement
scr_seq_0256_R43R0201_00ED:
	scrcmd_081 1112
	play_bgm SEQ_GS_R_7_42
	setvar VAR_UNK_410F, 1
	end

scr_seq_0256_R43R0201_00FD:
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif TRUE, scr_seq_0256_R43R0201_0110
	setvar VAR_UNK_410F, 0
	end

scr_seq_0256_R43R0201_0110:
	end

scr_seq_0256_R43R0201_0112:
	.byte 0x00, 0x00

scr_seq_0256_R43R0201_0114:
	step 75, 1
	step 21, 3
	step 23, 2
	step 1, 1
	step_end

scr_seq_0256_R43R0201_0128:
	step 63, 6
	step 1, 1
	step 75, 1
	step 21, 3
	step 22, 1
	step 1, 1
	step_end

scr_seq_0256_R43R0201_0144:
	step 62, 3
	step 22, 2
	step 20, 3
	step 1, 1
	step_end

scr_seq_0256_R43R0201_0158:
	step 23, 1
	step 20, 3
	step_end

scr_seq_0256_R43R0201_0164:
	step 63, 6
	step 0, 1
	step 75, 1
	step 20, 4
	step 23, 1
	step 0, 1
	step_end

scr_seq_0256_R43R0201_0180:
	step 75, 1
	step 20, 4
	step 22, 2
	step 0, 1
	step_end

scr_seq_0256_R43R0201_0194:
	step 62, 3
	step 22, 1
	step 21, 4
	step_end

scr_seq_0256_R43R0201_01A4:
	step 23, 2
	step 21, 4
	step 0, 1
	step_end
scr_seq_0256_R43R0201_01B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0256_R43R0201_01C7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0CE
	gotoif TRUE, scr_seq_0256_R43R0201_0208
	npc_msg 4
	setvar VAR_SPECIAL_x8004, 363
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0256_R43R0201_0213
	callstd 2008
	waitbutton
	setflag FLAG_UNK_0CE
scr_seq_0256_R43R0201_0208:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0256_R43R0201_0213:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.balign 4, 0
