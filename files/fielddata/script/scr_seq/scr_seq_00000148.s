#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000148_0000000A ; 000
	scrdef scr_seq_00000148_00000013 ; 001
	scrdef_end

scr_seq_00000148_0000000A:
	msgbox 15
	goto scr_seq_00000148_00000019

scr_seq_00000148_00000013:
	buffer_players_name 0
	msgbox 57
scr_seq_00000148_00000019:
	scrcmd_247
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000148_0000005E
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 17, 255, 0
	scrcmd_751 16, 255, 1
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000148_000000EB
	goto scr_seq_00000148_000000DA

scr_seq_00000148_0000005E:
	checkflag FLAG_UNK_987
	gotoif TRUE, scr_seq_00000148_000000AF
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 18, 255, 0
	scrcmd_751 19, 255, 1
	scrcmd_751 16, 255, 2
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000148_000000EB
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000148_00000142
	goto scr_seq_00000148_000000DA

scr_seq_00000148_000000AF:
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 19, 255, 0
	scrcmd_751 16, 255, 1
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000148_00000142
scr_seq_00000148_000000DA:
	msgbox 21
	waitbutton
	closemsg
	setvar VAR_SPECIAL_x800C, 0
	endstd
	end

scr_seq_00000148_000000EB:
	scrcmd_243 32772
	scrcmd_244 32773
	scrcmd_198 5, 32772
	scrcmd_198 6, 32773
	msgbox 20
	scrcmd_248 0, 32780, 32768
	play_fanfare VAR_SPECIAL_x8000
	buffer_players_name 0
	scrcmd_046 VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_423 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000148_0000012F
	setflag FLAG_UNK_987
	goto scr_seq_00000148_00000132

scr_seq_00000148_0000012F:
	msgbox 21
scr_seq_00000148_00000132:
	waitbutton
	closemsg
	setvar VAR_SPECIAL_x800C, 1
	goto scr_seq_00000148_00000189

scr_seq_00000148_00000142:
	scrcmd_245 32772
	scrcmd_246 32773
	scrcmd_198 5, 32772
	scrcmd_198 6, 32773
	msgbox 20
	scrcmd_248 1, 32780, 32768
	play_fanfare VAR_SPECIAL_x8000
	buffer_players_name 0
	scrcmd_046 VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_424 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000148_00000183
	msgbox 21
	waitbutton
	closemsg
scr_seq_00000148_00000183:
	setvar VAR_SPECIAL_x800C, 2
scr_seq_00000148_00000189:
	endstd
	end
	.balign 4, 0
