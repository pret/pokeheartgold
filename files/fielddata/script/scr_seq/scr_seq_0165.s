#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0165_0006 ; 000
	scrdef_end

scr_seq_0165_0006:
	scrcmd_609
	lockall
	scrcmd_839 1
	wait 1, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8000
	scrcmd_547 32768
	scrcmd_089 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0165_0037
	goto scr_seq_0165_005E

scr_seq_0165_0035:
	.byte 0x02, 0x00
scr_seq_0165_0037:
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0165_005E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0165_00C9
	end

scr_seq_0165_005E:
	fade_out_bgm 42, 10
	npc_msg 8
	scrcmd_345
	wait 80, VAR_SPECIAL_x800C
	scrcmd_346
	npc_msg 1
	scrcmd_090 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_085 10
	wait 10, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif eq, scr_seq_0165_00D5
	scrcmd_091
	wait 1, VAR_SPECIAL_x800C
	scrcmd_092
	wait 1, VAR_SPECIAL_x800C
	scrcmd_548
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 2
	scrcmd_549 32780
	scrcmd_076 441, 0
	scrcmd_077
	goto scr_seq_0165_00C9

scr_seq_0165_00C7:
	.byte 0x02, 0x00
scr_seq_0165_00C9:
	scrcmd_453
	closemsg
	scrcmd_839 0
	releaseall
	end

scr_seq_0165_00D5:
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg 3
	npc_msg 4
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0165_005E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0165_00C9
	end
	.balign 4, 0
