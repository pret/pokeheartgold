#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_04.inc"
	.include "global.inc"

	.extern ov04_022575A4
	.extern ov04_02257344
	.extern ov04_02257350

	.text

	.extern ov04_02254698
	.extern ov04_022546C8
	.extern ov04_022546E8

	thumb_func_start ov04_02254CA4
ov04_02254CA4: ; 0x02254CA4
	push {r3, lr}
	ldr r0, _02254CB8 ; =SEQ_SE_DP_KI_GASYAN
	bl IsSEPlaying
	cmp r0, #0
	bne _02254CB4
	mov r0, #1
	pop {r3, pc}
_02254CB4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02254CB8: .word SEQ_SE_DP_KI_GASYAN
	thumb_func_end ov04_02254CA4
