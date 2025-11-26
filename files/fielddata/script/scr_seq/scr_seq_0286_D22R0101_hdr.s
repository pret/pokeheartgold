#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D22R0101.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_D22R0101_map_scripts_2-.-4 // var check (on frame table)
	.byte 3
	.short _EV_scr_seq_D22R0101_011 + 1, 0 // when a fadescreen happens (called on_load)
	.byte 2
	.short _EV_scr_seq_D22R0101_025 + 1, 0 // on enter (on map load, actually on_transition here)
	.byte 0

scr_seq_D22R0101_map_scripts_2:
	.short VAR_UNK_40F7, 1, std_bug_contest_judging
	.short 0

	.balign 4, 0
