#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000263_00000006 ; 000
	scrdef_end

scr_seq_00000263_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	scrcmd_116 1, 21, 1
	checkflag FLAG_UNK_0FF
	gotoif eq, scr_seq_00000263_00000038
	setflag FLAG_UNK_0FF
	scrcmd_198 0, 1
	msgbox 15
	goto scr_seq_00000263_00000048

scr_seq_00000263_00000036:
	.byte 0x02, 0x00
scr_seq_00000263_00000038:
	scrcmd_198 0, 1
	msgbox 0
	goto scr_seq_00000263_00000048

scr_seq_00000263_00000046:
	.byte 0x02, 0x00
scr_seq_00000263_00000048:
	msgbox 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 2, 255, 0
	scrcmd_751 3, 255, 1
	scrcmd_751 4, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000263_00000097
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000263_00000178
	goto scr_seq_00000263_0000016B

scr_seq_00000263_00000095:
	.byte 0x02, 0x00
scr_seq_00000263_00000097:
	scrcmd_198 2, 1
	msgbox 7
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000263_0000016B
	scrcmd_557 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000263_0000015E
	scrcmd_556 1
	scrcmd_118 1
	msgbox 10
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_815 0
	scrcmd_117
	closemsg
	scrcmd_649
	scrcmd_651 0, 16384, 16385
	scrcmd_651 1, 16386, 16387
	scrcmd_651 2, 16388, 16389
	scrcmd_650
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_SPECIAL_x8000, 0
	call scr_seq_00000263_0000019D
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif eq, scr_seq_00000263_000001CE
	scrcmd_198 0, 32768
	msgbox 11
	comparevartovalue VAR_TEMP_x4001, 0
	callif ne, scr_seq_00000263_000001D9
	comparevartovalue VAR_TEMP_x4003, 0
	callif ne, scr_seq_00000263_00000225
	comparevartovalue VAR_TEMP_x4005, 0
	callif ne, scr_seq_00000263_00000271
	msgbox 5
	goto scr_seq_00000263_00000191

scr_seq_00000263_0000015C:
	.byte 0x02, 0x00
scr_seq_00000263_0000015E:
	scrcmd_747
	msgbox 14
	goto scr_seq_00000263_00000183

scr_seq_00000263_00000169:
	.byte 0x02, 0x00
scr_seq_00000263_0000016B:
	scrcmd_747
	msgbox 5
	goto scr_seq_00000263_00000183

scr_seq_00000263_00000176:
	.byte 0x02, 0x00
scr_seq_00000263_00000178:
	msgbox 6
	goto scr_seq_00000263_00000048

scr_seq_00000263_00000181:
	.byte 0x02, 0x00
scr_seq_00000263_00000183:
	waitbutton
	closemsg
	scrcmd_117
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_00000263_00000191:
	waitbutton
	closemsg
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_00000263_0000019D:
	comparevartovalue VAR_TEMP_x4001, 0
	callif ne, scr_seq_00000263_000001C6
	comparevartovalue VAR_TEMP_x4003, 0
	callif ne, scr_seq_00000263_000001C6
	comparevartovalue VAR_TEMP_x4005, 0
	callif ne, scr_seq_00000263_000001C6
	return

scr_seq_00000263_000001C6:
	addvar VAR_SPECIAL_x8000, 1
	return

scr_seq_00000263_000001CE:
	msgbox 5
	goto scr_seq_00000263_00000191

scr_seq_00000263_000001D7:
	.byte 0x02, 0x00
scr_seq_00000263_000001D9:
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif gt, scr_seq_00000263_000001F1
	scrcmd_194 0, 16384
	goto scr_seq_00000263_000001F6

scr_seq_00000263_000001F1:
	scrcmd_844 0, 16384
scr_seq_00000263_000001F6:
	scrcmd_198 1, 16385
	hasspaceforitem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000263_000002BD
	play_fanfare SEQ_ME_ITEM
	msgbox 13
	giveitem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

scr_seq_00000263_00000225:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif gt, scr_seq_00000263_0000023D
	scrcmd_194 0, 16386
	goto scr_seq_00000263_00000242

scr_seq_00000263_0000023D:
	scrcmd_844 0, 16386
scr_seq_00000263_00000242:
	scrcmd_198 1, 16387
	hasspaceforitem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000263_000002BD
	play_fanfare SEQ_ME_ITEM
	msgbox 13
	giveitem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

scr_seq_00000263_00000271:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif gt, scr_seq_00000263_00000289
	scrcmd_194 0, 16388
	goto scr_seq_00000263_0000028E

scr_seq_00000263_00000289:
	scrcmd_844 0, 16388
scr_seq_00000263_0000028E:
	scrcmd_198 1, 16389
	hasspaceforitem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000263_000002BD
	play_fanfare SEQ_ME_ITEM
	msgbox 13
	giveitem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_x800C
	wait_fanfare
	scrcmd_049
	return

scr_seq_00000263_000002BD:
	msgbox 12
	return
	.balign 4, 0
