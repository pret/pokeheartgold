	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02026EB4
sub_02026EB4: ; 0x02026EB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	mov r1, #0xc
	add r6, r0, #0
	add r5, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4]
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	mov r1, #2
	ldr r0, _02026F50 ; =0x04000540
	cmp r7, #0
	str r1, [r0]
	bne _02026F00
	lsl r0, r5, #7
	bl NNS_GfdGetLnkTexVramManagerWorkSize
	add r6, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp]
	ldr r2, [r4, #8]
	lsl r0, r5, #0x11
	mov r1, #0
	add r3, r6, #0
	bl sub_02026FE8
	b _02026F0A
_02026F00:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	bl sub_02027000
_02026F0A:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02026F34
	ldr r0, [sp, #0x20]
	lsl r0, r0, #8
	bl NNS_GfdGetLnkPlttVramManagerWorkSize
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl AllocFromHeap
	str r0, [r4, #4]
	ldr r0, [sp, #0x20]
	ldr r1, [r4, #4]
	lsl r0, r0, #0xd
	add r2, r5, #0
	mov r3, #1
	bl sub_02026FF8
	b _02026F3C
_02026F34:
	ldr r0, [sp, #0x20]
	mov r1, #1
	bl sub_02027008
_02026F3C:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _02026F46
	blx r0
	b _02026F4A
_02026F46:
	bl sub_02026F6C
_02026F4A:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02026F50: .word 0x04000540
	thumb_func_end sub_02026EB4

	thumb_func_start sub_02026F54
sub_02026F54: ; 0x02026F54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02026F54

	thumb_func_start sub_02026F6C
sub_02026F6C: ; 0x02026F6C
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02026FD0 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	strh r2, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02026FD4 ; =0xFFFFCFFD
	and r1, r2
	strh r1, [r0]
	ldrh r1, [r0]
	ldr r2, _02026FD8 ; =0x0000CFEF
	and r1, r2
	strh r1, [r0]
	add r1, r2, #0
	ldrh r3, [r0]
	add r1, #0xc
	and r1, r3
	strh r1, [r0]
	add r1, r2, #0
	ldrh r3, [r0]
	add r1, #8
	sub r2, #0x10
	and r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _02026FDC ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _02026FE0 ; =0xBFFF0000
	ldr r0, _02026FE4 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_02026FD0: .word 0x04000008
_02026FD4: .word 0xFFFFCFFD
_02026FD8: .word 0x0000CFEF
_02026FDC: .word 0x00007FFF
_02026FE0: .word 0xBFFF0000
_02026FE4: .word 0x04000580
	thumb_func_end sub_02026F6C

	thumb_func_start sub_02026FE8
sub_02026FE8: ; 0x02026FE8
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl NNS_GfdInitLnkTexVramManager
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_02026FE8

	thumb_func_start sub_02026FF8
sub_02026FF8: ; 0x02026FF8
	push {r3, lr}
	bl NNS_GfdInitLnkPlttVramManager
	pop {r3, pc}
	thumb_func_end sub_02026FF8

	thumb_func_start sub_02027000
sub_02027000: ; 0x02027000
	ldr r3, _02027004 ; =NNS_GfdInitFrmTexVramManager
	bx r3
	.balign 4, 0
_02027004: .word NNS_GfdInitFrmTexVramManager
	thumb_func_end sub_02027000

	thumb_func_start sub_02027008
sub_02027008: ; 0x02027008
	ldr r3, _0202700C ; =NNS_GfdInitFrmPlttVramManager
	bx r3
	.balign 4, 0
_0202700C: .word NNS_GfdInitFrmPlttVramManager
	thumb_func_end sub_02027008
