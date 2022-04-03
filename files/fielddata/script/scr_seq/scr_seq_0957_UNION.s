#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_UNION.h"
#include "msgdata/msg/msg_0738_UNION.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_UNION_000
	scrdef scr_seq_UNION_001
	scrdef scr_seq_UNION_002
	scrdef scr_seq_UNION_003
	scrdef scr_seq_UNION_004
	scrdef scr_seq_UNION_005
	scrdef scr_seq_UNION_006
	scrdef scr_seq_UNION_007
	scrdef_end

scr_seq_UNION_000:
	end

scr_seq_UNION_001:
	end

scr_seq_UNION_002:
	scrcmd_270
	end

scr_seq_UNION_003:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	scrcmd_268 VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 5
	goto_if_eq _0499
	scrcmd_264 0
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _04AF
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _05DB
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0528
	scrcmd_274 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_268 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 5
	goto_if_eq _0499
	npc_msg msg_0738_UNION_00199
	scrcmd_269 VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_RESULT
	case 3, _07CC
	case 2, _0488
	goto _00BC
	.byte 0x02, 0x00
_00BC:
	scrcmd_257 100
	scrcmd_267 2, VAR_SPECIAL_RESULT
	scrcmd_592 VAR_SPECIAL_RESULT
	goto _00EC
	.byte 0x02, 0x00
_00D2:
	scrcmd_257 100
	scrcmd_261 11
	scrcmd_267 22, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	goto _00EC
	.byte 0x02, 0x00
_00EC:
	scrcmd_064 31, 3, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_841 1
	scrcmd_066 168, 0
	scrcmd_066 59, 1
	scrcmd_066 52, 2
	scrcmd_066 23, 3
	scrcmd_066 142, 4
	scrcmd_066 141, 5
	scrcmd_066 24, 99
	scrcmd_585
	switch VAR_SPECIAL_RESULT
	case 0, _0184
	case 1, _0336
	case 2, _0276
	case 3, _01ED
	case 4, _0396
	case 5, _03F6
	case 7, _07A0
	scrcmd_271 0, 7
	goto _0784
	.byte 0x02, 0x00
_0184:
	scrcmd_271 0, 1
	scrcmd_267 9, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01A1
	non_npc_msg_var VAR_SPECIAL_RESULT
_01A1:
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _06AE
	scrcmd_261 5
	scrcmd_267 1, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 1
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_160
	scrcmd_150
	call _0BDA
	non_npc_msg msg_0738_UNION_00016
	goto _00D2
	.byte 0x02, 0x00
_01ED:
	party_count_not_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_lt _0264
	scrcmd_271 0, 3
	scrcmd_267 9, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _021B
	non_npc_msg_var VAR_SPECIAL_RESULT
_021B:
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _06F6
	scrcmd_261 7
	scrcmd_267 1, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 3
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_161
	scrcmd_150
	call _0BDA
	goto _00D2
	.byte 0x02, 0x00
_0264:
	scrcmd_267 20, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	goto _00D2
	.byte 0x02, 0x00
_0276:
	party_count_mons_at_or_below_level VAR_SPECIAL_RESULT, 30
	compare VAR_SPECIAL_RESULT, 2
	goto_if_lt _0324
	scrcmd_271 0, 2
	scrcmd_267 9, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02A6
	non_npc_msg_var VAR_SPECIAL_RESULT
_02A6:
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _06DE
	scrcmd_261 6
	scrcmd_267 1, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 2
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_350
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0738_UNION_00202
	scrcmd_257 102
	closemsg
	scrcmd_586 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0B8B
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0B8B
	scrcmd_230
	call _0BDA
	goto _00D2
	.byte 0x02, 0x00
_0324:
	scrcmd_267 19, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	goto _00D2
	.byte 0x02, 0x00
_0336:
	scrcmd_271 0, 4
	scrcmd_267 9, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0353
	non_npc_msg_var VAR_SPECIAL_RESULT
_0353:
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _06C6
	scrcmd_267 1, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait_button_or_delay 30
	scrcmd_257 4
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_159
	scrcmd_150
	call _0BDA
	goto _0478
	.byte 0x02, 0x00
_0396:
	scrcmd_271 0, 5
	scrcmd_267 9, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03B3
	non_npc_msg_var VAR_SPECIAL_RESULT
_03B3:
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _0726
	scrcmd_267 1, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait_button_or_delay 30
	scrcmd_257 5
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_162
	scrcmd_150
	call _0BDA
	goto _0478
	.byte 0x02, 0x00
_03F6:
	party_count_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _074F
	scrcmd_630 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0761
	scrcmd_271 0, 6
	scrcmd_267 9, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0435
	non_npc_msg_var VAR_SPECIAL_RESULT
_0435:
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _076C
	scrcmd_267 1, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait_button_or_delay 30
	scrcmd_257 6
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_629
	scrcmd_150
	call _0BDA
	goto _0478
	.byte 0x02, 0x00
_0478:
	releaseall
	end
	.byte 0x0f, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
_0488:
	npc_msg msg_0738_UNION_00038
	wait 30, VAR_SPECIAL_RESULT
	closemsg
	scrcmd_263
	releaseall
	end

_0499:
	scrcmd_262
	scrcmd_267 0, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait_button
	closemsg
	scrcmd_263
	releaseall
	end

_04AF:
	scrcmd_262
	scrcmd_267 10, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05C3
	scrcmd_274 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 5
	goto_if_eq _0488
	scrcmd_269 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0488
	scrcmd_267 13, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_159
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	goto _0478
	.byte 0x02, 0x00
_0528:
	scrcmd_262
	scrcmd_267 12, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _066C
	party_count_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0698
	party_legal_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0682
	scrcmd_274 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 5
	goto_if_eq _0488
	scrcmd_269 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0488
	scrcmd_267 15, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_629
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	goto _0478
	.byte 0x02, 0x00
_05C3:
	scrcmd_267 16, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_263
	closemsg
	releaseall
	end

_05DB:
	scrcmd_262
	scrcmd_267 11, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0654
	scrcmd_274 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 5
	goto_if_eq _0488
	scrcmd_269 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0488
	scrcmd_267 14, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_162
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	goto _0478
	.byte 0x02, 0x00
_0654:
	scrcmd_267 17, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	closemsg
	scrcmd_263
	releaseall
	end

_066C:
	scrcmd_267 18, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	closemsg
	releaseall
	end

_0682:
	scrcmd_267 26, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	closemsg
	releaseall
	end

_0698:
	scrcmd_267 21, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	closemsg
	releaseall
	end

_06AE:
	scrcmd_267 3, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	goto _07BC
	.byte 0x02, 0x00
_06C6:
	scrcmd_267 4, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	goto _07BC
	.byte 0x02, 0x00
_06DE:
	scrcmd_267 5, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	goto _07BC
	.byte 0x02, 0x00
_06F6:
	scrcmd_267 6, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	goto _07BC
	.byte 0x02, 0x00, 0x0b, 0x01
	.byte 0x07, 0x00, 0x0c, 0x80, 0x2e, 0x00, 0x0c, 0x80, 0x03, 0x00, 0x1e, 0x00, 0x0c, 0x80, 0x16, 0x00
	.byte 0x98, 0x00, 0x00, 0x00, 0x02, 0x00
_0726:
	scrcmd_267 8, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	goto _07BC
	.byte 0x02, 0x00
_073E:
	scrcmd_271 1, 1
	npc_msg msg_0738_UNION_00036
	goto _0BC2
	.byte 0x02, 0x00
_074F:
	scrcmd_267 21, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	goto _00D2
	.byte 0x02
	.byte 0x00
_0761:
	npc_msg msg_0738_UNION_00218
	goto _00D2
	.byte 0x02, 0x00
_076C:
	scrcmd_267 8, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	goto _07BC
	.byte 0x02, 0x00
_0784:
	scrcmd_267 23, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

_07A0:
	scrcmd_267 24, VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

_07BC:
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_UNION_004:
	scrcmd_609
	lockall
_07CC:
	play_se SEQ_SE_DP_BUTTON9
	scrcmd_264 1
	scrcmd_592 7
	wait_button_or_delay 30
	goto _07E4
	.byte 0x02, 0x00
_07E4:
	npc_msg msg_0738_UNION_00009
	scrcmd_257 100
	scrcmd_261 11
	scrcmd_273 VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_RESULT
	case 1, _0863
	case 4, _0B11
	case 2, _0974
	case 3, _08DB
	case 5, _0A44
	case 6, _0AA2
	case 7, _0BA0
	case 8, _0BB1
	end

_0863:
	npc_msg msg_0738_UNION_00011
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _08CA
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _0B80
	scrcmd_576 VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 1
	closemsg
	scrcmd_261 5
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_160
	scrcmd_150
	call _0BDA
	goto _07E4
	.byte 0x02, 0x00
_08CA:
	scrcmd_271 1, 1
	npc_msg msg_0738_UNION_00017
	goto _0BC2
	.byte 0x02, 0x00
_08DB:
	npc_msg msg_0738_UNION_00026
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0952
	party_count_not_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_lt _0963
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _0BA0
	npc_msg msg_0738_UNION_00027
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 3
	closemsg
	scrcmd_261 7
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_161
	scrcmd_150
	scrcmd_261 11
	call _0BDA
	goto _07E4
	.byte 0x02, 0x00
_0952:
	scrcmd_271 1, 1
	npc_msg msg_0738_UNION_00020
	goto _0BC2
	.byte 0x02, 0x00
_0963:
	scrcmd_271 1, 1
	npc_msg msg_0738_UNION_00029
	goto _0BC2
	.byte 0x02, 0x00
_0974:
	npc_msg msg_0738_UNION_00021
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A22
	party_count_mons_at_or_below_level VAR_SPECIAL_RESULT, 30
	compare VAR_SPECIAL_RESULT, 2
	goto_if_lt _0A33
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _0BA0
	npc_msg msg_0738_UNION_00022
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 2
	closemsg
	scrcmd_261 6
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_350
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0738_UNION_00202
	scrcmd_257 102
	closemsg
	scrcmd_586 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0B8B
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0B8B
	scrcmd_230
	scrcmd_261 11
	call _0BDA
	goto _07E4
	.byte 0x02, 0x00
_0A22:
	scrcmd_271 1, 1
	npc_msg msg_0738_UNION_00023
	goto _0BC2
	.byte 0x02, 0x00
_0A33:
	scrcmd_271 1, 1
	npc_msg msg_0738_UNION_00024
	goto _0BC2
	.byte 0x02, 0x00
_0A44:
	npc_msg msg_0738_UNION_00030
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A22
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _0BA0
	npc_msg msg_0738_UNION_00031
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 5
	closemsg
	scrcmd_261 2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_162
	scrcmd_150
	call _0BDA
	releaseall
	end

_0AA2:
	npc_msg msg_0738_UNION_00033
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A22
	scrcmd_271 1, 0
	closemsg
	party_count_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _073E
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _0BA0
	npc_msg msg_0738_UNION_00034
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 6
	closemsg
	scrcmd_261 13
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_629
	scrcmd_150
	call _0BDA
	releaseall
	end

_0B11:
	npc_msg msg_0738_UNION_00018
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0B6F
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_eq _0BA0
	npc_msg msg_0738_UNION_00019
	wait 30, VAR_SPECIAL_RESULT
	scrcmd_257 4
	closemsg
	scrcmd_261 1
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_159
	scrcmd_150
	call _0BDA
	releaseall
	end

_0B6F:
	scrcmd_271 1, 1
	npc_msg msg_0738_UNION_00028
	goto _0BC2
	.byte 0x02, 0x00
_0B80:
	npc_msg msg_0738_UNION_00035
	goto _0BC2
	.byte 0x02, 0x00
_0B8B:
	scrcmd_261 11
	npc_msg msg_0738_UNION_00025
	wait 30, VAR_SPECIAL_RESULT
	goto _0BC2
	.byte 0x02, 0x00
_0BA0:
	npc_msg msg_0738_UNION_00008
	wait 30, VAR_SPECIAL_RESULT
	goto _0BC2
	.byte 0x02
	.byte 0x00
_0BB1:
	npc_msg msg_0738_UNION_00010
	wait 30, VAR_SPECIAL_RESULT
	goto _0BC2
	.byte 0x02, 0x00
_0BC2:
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end
	.byte 0x0f, 0x01
	.byte 0x01, 0x00, 0x01, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
_0BDA:
	scrcmd_265
	fade_screen 6, 1, 1, RGB_BLACK
	return

scr_seq_UNION_005:
	simple_npc_msg msg_0738_UNION_00207
	end

scr_seq_UNION_006:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	goto _0499
	.byte 0x02, 0x00
scr_seq_UNION_007:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	goto _0C1F
	.byte 0x02, 0x00
_0C1F:
	scrcmd_262
	call_if_set FLAG_UNK_069, _0C87
	touchscreen_menu_hide
_0C2E:
	call_if_unset FLAG_UNK_069, _0C8C
	setflag FLAG_UNK_069
	menu_init_std_gmm 21, 11, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 11, 255, 0
	menu_item_add 169, 255, 1
	menu_item_add 24, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0CAF
	case 1, _0C91
	goto _0CA5
	.byte 0x02, 0x00
_0C87:
	npc_msg msg_0738_UNION_00158
	return

_0C8C:
	npc_msg msg_0738_UNION_00157
	return

_0C91:
	touchscreen_menu_show
	scrcmd_260 VAR_SPECIAL_RESULT
	non_npc_msg_var VAR_SPECIAL_RESULT
	touchscreen_menu_hide
	goto _0C2E
	.byte 0x02, 0x00
_0CA5:
	touchscreen_menu_show
	scrcmd_263
	closemsg
	releaseall
	end

_0CAF:
	npc_msg msg_0738_UNION_00159
	menu_init_std_gmm 24, 3, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 52, 255, 0
	menu_item_add 23, 255, 1
	menu_item_add 142, 255, 2
	menu_item_add 59, 255, 3
	menu_item_add 170, 255, 4
	menu_item_add 141, 255, 5
	menu_item_add 13, 255, 6
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0D50
	case 1, _0D5F
	case 2, _0D6E
	case 3, _0D7D
	case 4, _0D8C
	case 5, _0D9B
	goto _0C2E
	.byte 0x02, 0x00
_0D50:
	touchscreen_menu_show
	npc_msg msg_0738_UNION_00160
	touchscreen_menu_hide
	goto _0CAF
	.byte 0x02, 0x00
_0D5F:
	touchscreen_menu_show
	npc_msg msg_0738_UNION_00161
	touchscreen_menu_hide
	goto _0CAF
	.byte 0x02, 0x00
_0D6E:
	touchscreen_menu_show
	npc_msg msg_0738_UNION_00162
	touchscreen_menu_hide
	goto _0CAF
	.byte 0x02, 0x00
_0D7D:
	touchscreen_menu_show
	npc_msg msg_0738_UNION_00164
	touchscreen_menu_hide
	goto _0CAF
	.byte 0x02, 0x00
_0D8C:
	touchscreen_menu_show
	npc_msg msg_0738_UNION_00165
	touchscreen_menu_hide
	goto _0CAF
	.byte 0x02, 0x00
_0D9B:
	touchscreen_menu_show
	npc_msg msg_0738_UNION_00163
	touchscreen_menu_hide
	goto _0CAF
	.byte 0x02, 0x00, 0x16, 0x00, 0x7e, 0xfe, 0xff, 0xff
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
