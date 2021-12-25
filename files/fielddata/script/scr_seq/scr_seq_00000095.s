#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000095_0000037B ; 000
	scrdef scr_seq_00000095_000003DC ; 001
	scrdef scr_seq_00000095_000004EA ; 002
	scrdef scr_seq_00000095_00000012 ; 003
	scrdef_end

scr_seq_00000095_00000012:
	scrcmd_375 9
	scrcmd_375 10
	scrcmd_375 11
	scrcmd_375 12
	scrcmd_375 13
	scrcmd_375 14
	scrcmd_375 15
	scrcmd_375 16
	scrcmd_375 17
	checkflag FLAG_UNK_096
	gotoif eq, scr_seq_00000095_00000059
	checkflag FLAG_UNK_097
	gotoif eq, scr_seq_00000095_000001BE
	checkflag FLAG_UNK_098
	gotoif eq, scr_seq_00000095_00000207
	end

scr_seq_00000095_00000059:
	checkflag FLAG_UNK_097
	gotoif eq, scr_seq_00000095_000000B3
	checkflag FLAG_UNK_098
	gotoif eq, scr_seq_00000095_0000013E
	scrcmd_109 0, 9
	show_person_at 1, 19, 0, 16, 1
	show_person_at 7, 19, 0, 18, 0
	show_person_at 9, 19, 0, 17, 0
	show_person_at 10, 20, 0, 17, 0
	show_person_at 11, 20, 0, 18, 0
	end

scr_seq_00000095_000000B3:
	checkflag FLAG_UNK_098
	gotoif eq, scr_seq_00000095_000002BF
	scrcmd_109 0, 9
	show_person_at 1, 19, 0, 16, 1
	show_person_at 7, 19, 0, 18, 0
	show_person_at 9, 19, 0, 17, 0
	show_person_at 10, 20, 0, 17, 0
	show_person_at 11, 20, 0, 18, 0
	show_person_at 2, 3, 0, 14, 2
	show_person_at 6, 1, 0, 14, 0
	show_person_at 12, 1, 0, 13, 0
	show_person_at 13, 2, 0, 13, 0
	show_person_at 14, 2, 0, 14, 0
	end

scr_seq_00000095_0000013E:
	scrcmd_109 0, 9
	show_person_at 1, 19, 0, 16, 1
	show_person_at 7, 19, 0, 18, 0
	show_person_at 9, 19, 0, 17, 0
	show_person_at 10, 20, 0, 17, 0
	show_person_at 11, 20, 0, 18, 0
	show_person_at 3, 7, 0, 17, 3
	show_person_at 5, 8, 0, 18, 0
	show_person_at 15, 8, 0, 17, 0
	show_person_at 16, 9, 0, 17, 0
	show_person_at 17, 9, 0, 18, 0
	end

scr_seq_00000095_000001BE:
	checkflag FLAG_UNK_098
	gotoif eq, scr_seq_00000095_00000245
	show_person_at 2, 3, 0, 14, 2
	show_person_at 6, 1, 0, 14, 0
	show_person_at 12, 1, 0, 13, 0
	show_person_at 13, 2, 0, 13, 0
	show_person_at 14, 2, 0, 14, 0
	end

scr_seq_00000095_00000207:
	show_person_at 3, 7, 0, 17, 3
	show_person_at 5, 8, 0, 18, 0
	show_person_at 15, 8, 0, 17, 0
	show_person_at 16, 9, 0, 17, 0
	show_person_at 17, 9, 0, 18, 0
	end

scr_seq_00000095_00000245:
	show_person_at 2, 3, 0, 14, 2
	show_person_at 6, 1, 0, 14, 0
	show_person_at 12, 1, 0, 13, 0
	show_person_at 13, 2, 0, 13, 0
	show_person_at 14, 2, 0, 14, 0
	show_person_at 3, 7, 0, 17, 3
	show_person_at 5, 8, 0, 18, 0
	show_person_at 15, 8, 0, 17, 0
	show_person_at 16, 9, 0, 17, 0
	show_person_at 17, 9, 0, 18, 0
	end

scr_seq_00000095_000002BF:
	scrcmd_109 0, 9
	show_person_at 1, 19, 0, 16, 1
	show_person_at 7, 19, 0, 18, 0
	show_person_at 9, 19, 0, 17, 0
	show_person_at 10, 20, 0, 17, 0
	show_person_at 11, 20, 0, 18, 0
	show_person_at 2, 3, 0, 14, 2
	show_person_at 6, 1, 0, 14, 0
	show_person_at 12, 1, 0, 13, 0
	show_person_at 13, 2, 0, 13, 0
	show_person_at 14, 2, 0, 14, 0
	show_person_at 3, 7, 0, 17, 3
	show_person_at 5, 8, 0, 18, 0
	show_person_at 15, 8, 0, 17, 0
	show_person_at 16, 9, 0, 17, 0
	show_person_at 17, 9, 0, 18, 0
	end

scr_seq_00000095_0000037B:
	checkflag FLAG_UNK_096
	gotoif eq, scr_seq_00000095_000003C9
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	closemsg
	apply_movement 1, scr_seq_00000095_00000504
	apply_movement 7, scr_seq_00000095_00000504
	apply_movement 9, scr_seq_00000095_00000504
	apply_movement 10, scr_seq_00000095_00000504
	apply_movement 11, scr_seq_00000095_00000504
	wait_movement
	setflag FLAG_UNK_096
	scrcmd_109 0, 9
	releaseall
	end

scr_seq_00000095_000003C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000095_000003DC:
	get_person_coords 4, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 15
	gotoif ne, scr_seq_00000095_000003FD
	goto scr_seq_00000095_0000041C

scr_seq_00000095_000003F7:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000095_000003FD:
	comparevartovalue VAR_TEMP_x4001, 16
	gotoif ne, scr_seq_00000095_00000416
	goto scr_seq_00000095_00000483

scr_seq_00000095_00000410:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000095_00000416:
	goto scr_seq_00000095_000003C9

scr_seq_00000095_0000041C:
	checkflag FLAG_UNK_097
	gotoif eq, scr_seq_00000095_000003C9
	scrcmd_622 4, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000095_00000440
	goto scr_seq_00000095_00000446

scr_seq_00000095_00000440:
	goto scr_seq_00000095_000003C9

scr_seq_00000095_00000446:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	closemsg
	apply_movement 2, scr_seq_00000095_0000050C
	apply_movement 6, scr_seq_00000095_0000050C
	apply_movement 12, scr_seq_00000095_0000050C
	apply_movement 13, scr_seq_00000095_0000050C
	apply_movement 14, scr_seq_00000095_0000050C
	wait_movement
	setflag FLAG_UNK_097
	releaseall
	end

scr_seq_00000095_00000483:
	checkflag FLAG_UNK_098
	gotoif eq, scr_seq_00000095_000003C9
	scrcmd_622 4, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000095_000004A7
	goto scr_seq_00000095_000004AD

scr_seq_00000095_000004A7:
	goto scr_seq_00000095_000003C9

scr_seq_00000095_000004AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	closemsg
	apply_movement 3, scr_seq_00000095_00000514
	apply_movement 5, scr_seq_00000095_00000514
	apply_movement 15, scr_seq_00000095_00000514
	apply_movement 16, scr_seq_00000095_00000514
	apply_movement 17, scr_seq_00000095_00000514
	wait_movement
	setflag FLAG_UNK_098
	releaseall
	end

scr_seq_00000095_000004EA:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_076 67, 0
	msgbox 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000095_00000503:
	.byte 0x00

scr_seq_00000095_00000504:
	.short 9, 2
	.short 254, 0

scr_seq_00000095_0000050C:
	.short 10, 2
	.short 254, 0

scr_seq_00000095_00000514:
	.short 11, 2
	.short 254, 0
	.balign 4, 0
