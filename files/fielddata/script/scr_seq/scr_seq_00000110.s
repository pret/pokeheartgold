#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000110_0000001E ; 000
	scrdef scr_seq_00000110_0000021C ; 001
	scrdef scr_seq_00000110_0000021E ; 002
	scrdef scr_seq_00000110_00000230 ; 003
	scrdef scr_seq_00000110_00000242 ; 004
	scrdef scr_seq_00000110_00000254 ; 005
	scrdef scr_seq_00000110_00000266 ; 006
	scrdef_end

scr_seq_00000110_0000001E:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000110_00000168
	wait_movement
	clearflag FLAG_UNK_20A
	scrcmd_100 0
	callstd 2031
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 37
	gotoif ne, scr_seq_00000110_00000059
	apply_movement 0, scr_seq_00000110_00000180
	goto scr_seq_00000110_0000007C

scr_seq_00000110_00000059:
	comparevartovalue VAR_TEMP_x4000, 38
	gotoif ne, scr_seq_00000110_00000074
	apply_movement 0, scr_seq_00000110_00000198
	goto scr_seq_00000110_0000007C

scr_seq_00000110_00000074:
	apply_movement 0, scr_seq_00000110_000001B0
scr_seq_00000110_0000007C:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000110_00000178
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_190 0
	msgbox 0
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_00000110_000000C1
	trainer_battle 268, 0, 0, 0
	goto scr_seq_00000110_000000E4

scr_seq_00000110_000000C1:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_00000110_000000DC
	trainer_battle 272, 0, 0, 0
	goto scr_seq_00000110_000000E4

scr_seq_00000110_000000DC:
	trainer_battle 264, 0, 0, 0
scr_seq_00000110_000000E4:
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000110_0000015A
	callstd 2070
	msgbox 1
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 37
	gotoif ne, scr_seq_00000110_0000011F
	apply_movement 0, scr_seq_00000110_000001C8
	goto scr_seq_00000110_00000142

scr_seq_00000110_0000011F:
	comparevartovalue VAR_TEMP_x4000, 38
	gotoif ne, scr_seq_00000110_0000013A
	apply_movement 0, scr_seq_00000110_000001E4
	goto scr_seq_00000110_00000142

scr_seq_00000110_0000013A:
	apply_movement 0, scr_seq_00000110_00000200
scr_seq_00000110_00000142:
	wait_movement
	setflag FLAG_UNK_20A
	hide_person 0
	callstd 2071
	setvar VAR_UNK_40C5, 1
	releaseall
	end

scr_seq_00000110_0000015A:
	hide_person 0
	setflag FLAG_UNK_20A
	scrcmd_219
	releaseall
	end


scr_seq_00000110_00000168:
	.short 75, 1
	.short 63, 2
	.short 1, 2
	.short 254, 0

scr_seq_00000110_00000178:
	.short 9, 1
	.short 254, 0

scr_seq_00000110_00000180:
	.short 16, 3
	.short 3, 2
	.short 19, 4
	.short 0, 2
	.short 16, 3
	.short 254, 0

scr_seq_00000110_00000198:
	.short 16, 3
	.short 3, 2
	.short 19, 5
	.short 0, 2
	.short 16, 3
	.short 254, 0

scr_seq_00000110_000001B0:
	.short 16, 3
	.short 3, 2
	.short 19, 6
	.short 0, 2
	.short 16, 3
	.short 254, 0

scr_seq_00000110_000001C8:
	.short 1, 2
	.short 13, 2
	.short 2, 2
	.short 14, 5
	.short 1, 2
	.short 13, 7
	.short 254, 0

scr_seq_00000110_000001E4:
	.short 1, 2
	.short 13, 2
	.short 2, 2
	.short 14, 6
	.short 1, 2
	.short 13, 7
	.short 254, 0

scr_seq_00000110_00000200:
	.short 1, 2
	.short 13, 2
	.short 2, 2
	.short 14, 7
	.short 1, 2
	.short 13, 7
	.short 254, 0
scr_seq_00000110_0000021C:
	end

scr_seq_00000110_0000021E:
	setvar VAR_TEMP_x4000, 57
	setvar VAR_TEMP_x4001, 42
	goto scr_seq_00000110_00000278

scr_seq_00000110_00000230:
	setvar VAR_TEMP_x4000, 28
	setvar VAR_TEMP_x4001, 38
	goto scr_seq_00000110_00000278

scr_seq_00000110_00000242:
	setvar VAR_TEMP_x4000, 31
	setvar VAR_TEMP_x4001, 44
	goto scr_seq_00000110_00000278

scr_seq_00000110_00000254:
	setvar VAR_TEMP_x4000, 22
	setvar VAR_TEMP_x4001, 17
	goto scr_seq_00000110_00000278

scr_seq_00000110_00000266:
	setvar VAR_TEMP_x4000, 58
	setvar VAR_TEMP_x4001, 28
	goto scr_seq_00000110_00000278

scr_seq_00000110_00000278:
	scrcmd_609
	lockall
	setvar VAR_UNK_40CA, 1
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000110_000002A9
	apply_movement 255, scr_seq_00000110_00000330
	apply_movement 253, scr_seq_00000110_0000033C
	goto scr_seq_00000110_000002FF

scr_seq_00000110_000002A9:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000110_000002CC
	apply_movement 255, scr_seq_00000110_0000034C
	apply_movement 253, scr_seq_00000110_00000358
	goto scr_seq_00000110_000002FF

scr_seq_00000110_000002CC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000110_000002EF
	apply_movement 255, scr_seq_00000110_00000384
	apply_movement 253, scr_seq_00000110_00000390
	goto scr_seq_00000110_000002FF

scr_seq_00000110_000002EF:
	apply_movement 255, scr_seq_00000110_00000368
	apply_movement 253, scr_seq_00000110_00000374
scr_seq_00000110_000002FF:
	wait_movement
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 178, 0, 16384, 16385, 32780
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000110_0000032D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000110_00000330:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000110_0000033C:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000110_0000034C:
	.short 41, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000110_00000358:
	.short 62, 3
	.short 21, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000110_00000368:
	.short 42, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000110_00000374:
	.short 62, 3
	.short 22, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000110_00000384:
	.short 43, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000110_00000390:
	.short 62, 3
	.short 23, 1
	.short 69, 1
	.short 254, 0
	.balign 4, 0
