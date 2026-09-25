#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0101.h"
#include "msgdata/msg/msg_0321_R02R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R02R0101_000
	ScrDefEnd

scr_seq_R02R0101_000:
	TrainerTipsEx 2, msg_0321_R02R0101_00000
	End
	.balign 4, 0
