#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_04.inc"
	.include "global.inc"

	.text

	thumb_func_start ov04_02257240
ov04_02257240: ; 0x02257240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	str r0, [sp]
	str r2, [sp, #8]
	add r0, #0xb0
	ldr r0, [r0]
	mov r6, #0
	cmp r0, #0
	beq _0225725C
	mov r0, #0xf
	lsl r0, r0, #0xe
	str r0, [sp, #0xc]
	b _02257262
_0225725C:
	mov r0, #0x1e
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
_02257262:
	ldr r0, [sp, #4]
	mov r5, #0
	cmp r0, #0
	bls _022572CE
	ldr r4, [sp]
	add r4, #0x10
_0225726E:
	mov r0, #0x14
	add r7, r5, #0
	mul r7, r0
	add r0, r4, r7
	bl ov01_021FBF28
	mov r1, #1
	lsl r1, r1, #0xc
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	cmp r1, r0
	blt _02257294
	cmp r5, #0
	beq _02257292
	cmp r6, #0
	bne _02257292
	bl GF_AssertFail
_02257292:
	mov r6, #1
_02257294:
	mov r1, #1
	add r0, r4, r7
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndLoop
	cmp r6, #0
	beq _022572C2
	ldr r1, [sp]
	ldr r0, [sp, #8]
	add r1, #0xb0
	str r0, [r1]
	ldr r0, [sp]
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _022572BA
	mov r1, #0x1e
	lsl r1, r1, #0xc
	b _022572BC
_022572BA:
	mov r1, #0
_022572BC:
	add r0, r4, r7
	bl Field3dModelAnimation_FrameSet
_022572C2:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp, #4]
	cmp r5, r0
	blo _0225726E
_022572CE:
	cmp r6, #0
	beq _022572D8
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022572D8:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02257240

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
