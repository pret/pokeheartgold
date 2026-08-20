#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_04.inc"
	.include "global.inc"

	.text

	thumb_func_start ov04_022572E0
ov04_022572E0: ; 0x022572E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _02257304
_022572EE:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl Field3dModelAnimation_FrameSet
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _022572EE
_02257304:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_022572E0

	thumb_func_start ov04_02257308
ov04_02257308: ; 0x02257308
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	mov r1, #0x23
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02257324
	mov r0, #1
	pop {r4, pc}
_02257324:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov04_02257308
