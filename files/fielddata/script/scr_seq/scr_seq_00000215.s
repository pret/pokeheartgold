#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000215_00000194 ; 000
	scrdef scr_seq_00000215_000001E7 ; 001
	scrdef scr_seq_00000215_000000BC ; 002
	scrdef scr_seq_00000215_0000002D ; 003
	scrdef scr_seq_00000215_00000016 ; 004
	scrdef_end

scr_seq_00000215_00000016:
	comparevartovalue VAR_UNK_4087, 2
	gotoif eq, scr_seq_00000215_00000025
	end

scr_seq_00000215_00000025:
	setvar VAR_UNK_4087, 1
	end

scr_seq_00000215_0000002D:
	scrcmd_609
	lockall
	scrcmd_386 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000215_00000060
	apply_movement 2, scr_seq_00000215_00000084
	apply_movement 0, scr_seq_00000215_000000A0
	apply_movement 1, scr_seq_00000215_000000AC
	goto scr_seq_00000215_00000078

scr_seq_00000215_00000060:
	apply_movement 2, scr_seq_00000215_00000090
	apply_movement 0, scr_seq_00000215_000000A0
	apply_movement 1, scr_seq_00000215_000000AC
scr_seq_00000215_00000078:
	wait_movement
	setvar VAR_UNK_4087, 2
	releaseall
	end


scr_seq_00000215_00000084:
	.short 75, 1
	.short 18, 3
	.short 254, 0

scr_seq_00000215_00000090:
	.short 0, 1
	.short 75, 1
	.short 18, 3
	.short 254, 0

scr_seq_00000215_000000A0:
	.short 65, 3
	.short 1, 1
	.short 254, 0

scr_seq_00000215_000000AC:
	.short 65, 3
	.short 17, 1
	.short 0, 1
	.short 254, 0
scr_seq_00000215_000000BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_081 1061
	scrcmd_080 1112
	msgbox 0
	closemsg
	scrcmd_213 353, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000215_0000014A
	msgbox 2
	closemsg
	scrcmd_084 0, 30
	msgbox 3
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 2, scr_seq_00000215_00000150
	apply_movement 255, scr_seq_00000215_0000015C
	apply_movement 0, scr_seq_00000215_00000170
	apply_movement 1, scr_seq_00000215_0000017C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_101 2
	setflag FLAG_UNK_255
	clearflag FLAG_UNK_257
	scrcmd_080 1061
	setvar VAR_UNK_4087, 3
	releaseall
	end

scr_seq_00000215_0000014A:
	scrcmd_219
	releaseall
	end


scr_seq_00000215_00000150:
	.short 19, 1
	.short 17, 10
	.short 254, 0

scr_seq_00000215_0000015C:
	.short 71, 1
	.short 19, 1
	.short 72, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000215_00000170:
	.short 62, 12
	.short 2, 1
	.short 254, 0

scr_seq_00000215_0000017C:
	.short 62, 1
	.short 1, 1
	.short 62, 10
	.short 12, 1
	.short 2, 1
	.short 254, 0
scr_seq_00000215_00000194:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_4087, 2
	gotoif ne, scr_seq_00000215_000001B3
	goto scr_seq_00000215_000001DC

scr_seq_00000215_000001AD:
	.byte 0x16, 0x00, 0x29
	.byte 0x00, 0x00, 0x00
scr_seq_00000215_000001B3:
	comparevartovalue VAR_UNK_4087, 3
	gotoif ne, scr_seq_00000215_000001D1
	faceplayer
	msgbox 5
	goto scr_seq_00000215_000001DF

scr_seq_00000215_000001CB:
	.byte 0x16, 0x00, 0x0b, 0x00, 0x00
	.byte 0x00
scr_seq_00000215_000001D1:
	faceplayer
	msgbox 6
	goto scr_seq_00000215_000001DF

scr_seq_00000215_000001DC:
	msgbox 4
scr_seq_00000215_000001DF:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000215_000001E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_4087, 2
	gotoif ne, scr_seq_00000215_00000206
	goto scr_seq_00000215_0000022F

scr_seq_00000215_00000200:
	.byte 0x16, 0x00, 0x29, 0x00, 0x00, 0x00
scr_seq_00000215_00000206:
	comparevartovalue VAR_UNK_4087, 3
	gotoif ne, scr_seq_00000215_00000224
	faceplayer
	msgbox 8
	goto scr_seq_00000215_00000232

scr_seq_00000215_0000021E:
	.byte 0x16, 0x00
	.byte 0x0b, 0x00, 0x00, 0x00
scr_seq_00000215_00000224:
	faceplayer
	msgbox 9
	goto scr_seq_00000215_00000232

scr_seq_00000215_0000022F:
	msgbox 7
scr_seq_00000215_00000232:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
