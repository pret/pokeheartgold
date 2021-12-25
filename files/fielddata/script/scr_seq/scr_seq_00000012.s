#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000012_0000001A ; 000
	scrdef scr_seq_00000012_00000020 ; 001
	scrdef scr_seq_00000012_00000085 ; 002
	scrdef scr_seq_00000012_000000B1 ; 003
	scrdef scr_seq_00000012_000000E5 ; 004
	scrdef scr_seq_00000012_0000013C ; 005
	scrdef_end

scr_seq_00000012_0000001A:
	scrcmd_508 2
	end

scr_seq_00000012_00000020:
	play_se SEQ_SE_DP_SELECT
	lockall
	message 6
	wait 30, VAR_SPECIAL_x800C
	message 7
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_x800C
	message 8
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_x800C
	message 9
	play_se SEQ_SE_DP_DECIDE
	wait 30, VAR_SPECIAL_x800C
	message 10
	play_se SEQ_SE_DP_CON_016
	wait 30, VAR_SPECIAL_x800C
	scrcmd_508 0
	setvar VAR_UNK_4124, 1
	closemsg
	releaseall
	end

scr_seq_00000012_00000073:
	.byte 0xfc, 0x01, 0x00, 0x00, 0x29, 0x00, 0x24, 0x41, 0x01, 0x00, 0x32, 0x00, 0x35
	.byte 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_00000012_00000085:
	play_se SEQ_SE_DP_SELECT
	lockall
	play_se SEQ_SE_DP_PINPON
	scrcmd_190 0
	msgbox 4
	scrcmd_080 1002
	scrcmd_078 1185
	scrcmd_079
	closemsg
	releaseall
	setvar VAR_UNK_4124, 1
	call scr_seq_00000012_000001D4
	end

scr_seq_00000012_000000B1:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 5
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000012_000000D5
	releaseall
	end

scr_seq_00000012_000000D5:
	setvar VAR_UNK_4124, 2
	releaseall
	call scr_seq_00000012_000001D4
	end

scr_seq_00000012_000000E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000012_00000180
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000012_00000110
	setvar VAR_UNK_4124, 2
	releaseall
	call scr_seq_00000012_000001D4
	end

scr_seq_00000012_00000110:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000012_00000134
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_00000012_00000132:
	.byte 0x00, 0x00

scr_seq_00000012_00000134:
	.short 12, 1
	.short 254, 0
scr_seq_00000012_0000013C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call scr_seq_00000012_00000180
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000012_00000169
	setvar VAR_UNK_4124, 2
	releaseall
	call scr_seq_00000012_000001D4
	end

scr_seq_00000012_00000169:
	apply_movement 0, scr_seq_00000012_00000178
	wait_movement
	releaseall
	end

scr_seq_00000012_00000177:
	.byte 0x00

scr_seq_00000012_00000178:
	.short 34, 1
	.short 254, 0
scr_seq_00000012_00000180:
	msgbox 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000012_000001C9
	scrcmd_281 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000012_000001B9
	scrcmd_190 0
	msgbox 2
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_00000012_000001B9:
	scrcmd_190 0
	msgbox 3
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_00000012_000001C9:
	msgbox 1
	setvar VAR_SPECIAL_x800C, 1
	return

scr_seq_00000012_000001D4:
	scrcmd_508 1
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 479, 0, 7, 7, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	return
	.balign 4, 0
