	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02007200
sub_02007200: ; 0x02007200
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	cmp r5, #0
	beq _02007224
	add r0, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _0200721A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0200721A:
	mov r1, #0
	add r2, r5, #0
	bl memset
	b _02007226
_02007224:
	mov r4, #0
_02007226:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02007200

	thumb_func_start sub_02007234
sub_02007234: ; 0x02007234
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F988
	cmp r0, #0
	beq _02007244
	bl FreeToHeap
_02007244:
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end sub_02007234
