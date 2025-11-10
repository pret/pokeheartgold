	.include "asm/macros.inc"
	.include "unk_020192D0.inc"
	.include "global.inc"

    .rodata

_020F6298:
	.word sub_02019BA0, BgCommitTilemapBufferToVram, ScheduleBgTilemapBufferTransfer

    .text

	thumb_func_start sub_0201956C
sub_0201956C: ; 0x0201956C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r0, r3, #0
	mov r1, #0x10
	add r5, r2, #0
	str r3, [sp]
	bl Heap_Alloc
	add r4, r0, #0
	str r6, [r4]
	strh r5, [r4, #8]
	ldr r0, [sp]
	lsl r2, r7, #0x10
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	ldr r1, _020195BC ; =0xFFFF8000
	lsr r3, r2, #0x10
	lsr r2, r1, #0x11
	and r0, r1
	and r2, r3
	orr r0, r2
	strh r0, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	sub r0, r1, #1
	lsl r5, r5, #4
	and r0, r2
	strh r0, [r4, #0xa]
	ldr r0, [sp]
	add r1, r5, #0
	bl Heap_Alloc
	mov r1, #0
	add r2, r5, #0
	str r0, [r4, #4]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020195BC: .word 0xFFFF8000
	thumb_func_end sub_0201956C

	thumb_func_start sub_020195C0
sub_020195C0: ; 0x020195C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #8]
	mov r6, #0
	cmp r0, #0
	bls _020195E4
	add r4, r6, #0
_020195CE:
	ldr r0, [r5, #4]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _020195DA
	bl Heap_Free
_020195DA:
	ldrh r0, [r5, #8]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blo _020195CE
_020195E4:
	ldr r0, [r5, #4]
	bl Heap_Free
	add r0, r5, #0
	bl Heap_Free
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020195C0

	thumb_func_start sub_020195F4
sub_020195F4: ; 0x020195F4
	push {r3, r4, r5, r6, r7, lr}
	lsl r7, r1, #4
	ldr r4, [r0, #4]
	ldr r1, [sp, #0x18]
	add r6, r3, #0
	mul r1, r6
	ldr r0, [r0, #0xc]
	add r5, r4, r7
	lsl r1, r1, #1
	str r2, [sp]
	bl Heap_Alloc
	str r0, [r4, r7]
	ldrh r0, [r5, #4]
	mov r1, #0x3f
	bic r0, r1
	lsl r1, r6, #0x10
	lsr r2, r1, #0x10
	mov r1, #0x3f
	and r1, r2
	orr r0, r1
	strh r0, [r5, #4]
	ldrh r1, [r5, #4]
	ldr r0, _02019660 ; =0xFFFFF03F
	and r1, r0
	ldr r0, [sp, #0x18]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x14
	orr r0, r1
	strh r0, [r5, #4]
	ldr r0, [sp]
	ldr r1, _02019664 ; =0xFFFF1FFF
	strb r0, [r5, #0xa]
	mov r0, #0
	strb r0, [r5, #6]
	strb r0, [r5, #7]
	ldrh r2, [r5, #4]
	and r1, r2
	strh r1, [r5, #4]
	mov r1, #1
	ldrh r2, [r5, #4]
	lsl r1, r1, #0xc
	orr r1, r2
	strh r1, [r5, #4]
	strb r0, [r5, #0xc]
	mov r1, #0x20
	strb r1, [r5, #0xd]
	strb r0, [r5, #0xe]
	mov r0, #0x18
	strb r0, [r5, #0xf]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02019660: .word 0xFFFFF03F
_02019664: .word 0xFFFF1FFF
	thumb_func_end sub_020195F4

	thumb_func_start sub_02019668
sub_02019668: ; 0x02019668
	push {r4, lr}
	ldr r3, [r0, #4]
	lsl r1, r1, #4
	add r4, r3, r1
	add r0, r2, #0
	ldrh r2, [r4, #4]
	ldr r1, [r3, r1]
	lsl r3, r2, #0x1a
	lsl r2, r2, #0x14
	lsr r3, r3, #0x1a
	lsr r2, r2, #0x1a
	mul r2, r3
	lsl r2, r2, #1
	bl MIi_CpuCopy16
	pop {r4, pc}
	thumb_func_end sub_02019668

	thumb_func_start sub_02019688
sub_02019688: ; 0x02019688
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	str r0, [sp]
	add r0, r2, #0
	add r1, r3, #0
	ldr r2, [sp, #0x18]
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r2, [sp, #4]
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, #0xc
	bl sub_02019668
	add r0, r6, #0
	bl Heap_Free
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02019688

	thumb_func_start sub_020196B8
sub_020196B8: ; 0x020196B8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	str r0, [sp]
	add r0, r2, #0
	add r1, r3, #0
	ldr r2, [sp, #0x18]
	add r3, sp, #4
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r2, [sp, #4]
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, #0xc
	bl sub_02019668
	add r0, r6, #0
	bl Heap_Free
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020196B8

	thumb_func_start sub_020196E8
sub_020196E8: ; 0x020196E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x1c]
	add r0, r2, #0
	ldr r2, [sp, #0x1c]
	lsl r1, r1, #4
	ldr r2, [r2, #4]
	add r4, r2, r1
	strb r0, [r4, #6]
	strb r3, [r4, #7]
	mov r1, #0xd
	ldrsb r1, [r4, r1]
	str r1, [sp, #0x28]
	cmp r0, r1
	bge _020197E6
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	str r1, [sp, #0x20]
	cmp r3, r1
	bge _020197E6
	ldrh r1, [r4, #4]
	lsl r2, r1, #0x1a
	lsr r2, r2, #0x1a
	str r2, [sp, #0x2c]
	add r7, r0, r2
	mov r2, #0xc
	ldrsb r2, [r4, r2]
	mov ip, r2
	cmp r7, r2
	blt _020197E6
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1a
	str r1, [sp, #0x24]
	add r6, r3, r1
	mov r1, #0xe
	ldrsb r2, [r4, r1]
	cmp r6, r2
	blt _020197E6
	lsl r1, r0, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x34]
	ldr r1, [sp, #0x2c]
	mov r5, #0
	lsl r1, r1, #0x18
	str r5, [sp, #0x30]
	mov r5, ip
	lsr r1, r1, #0x18
	cmp r0, r5
	bge _02019762
	mov r5, ip
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	str r5, [sp, #0x34]
	mov r5, ip
	sub r0, r5, r0
	sub r1, r1, r0
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	str r0, [sp, #0x30]
_02019762:
	ldr r0, [sp, #0x28]
	cmp r7, r0
	blt _02019770
	sub r0, r7, r0
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
_02019770:
	lsl r0, r3, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp, #0x24]
	mov r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r3, r2
	bge _02019790
	lsl r5, r2, #0x18
	sub r2, r2, r3
	sub r0, r0, r2
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r7, r5, #0x18
	lsr r0, r0, #0x18
	lsr r5, r2, #0x18
_02019790:
	ldr r2, [sp, #0x20]
	cmp r6, r2
	blt _0201979E
	sub r2, r6, r2
	sub r0, r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
_0201979E:
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r4]
	add r3, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	ldrb r1, [r4, #0xa]
	ldr r0, [r0]
	ldr r2, [sp, #0x34]
	bl CopyToBgTilemapRect
	ldr r2, [sp, #0x1c]
	ldr r0, [sp, #0x1c]
	ldrh r2, [r2, #0xa]
	ldrb r1, [r4, #0xa]
	ldr r0, [r0]
	lsl r2, r2, #0x11
	lsr r3, r2, #0xf
	ldr r2, _020197EC ; =_020F6298
	ldr r2, [r2, r3]
	blx r2
	ldrh r1, [r4, #4]
	ldr r0, _020197F0 ; =0xFFFFEFFF
	and r0, r1
	strh r0, [r4, #4]
_020197E6:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020197EC: .word _020F6298
_020197F0: .word 0xFFFFEFFF
	thumb_func_end sub_020196E8

	thumb_func_start sub_020197F4
sub_020197F4: ; 0x020197F4
	push {r4, lr}
	ldr r2, [r0, #4]
	lsl r3, r1, #4
	add r4, r2, r3
	mov r2, #6
	mov r3, #7
	ldrsb r2, [r4, r2]
	ldrsb r3, [r4, r3]
	bl sub_020196E8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020197F4

	thumb_func_start sub_0201980C
sub_0201980C: ; 0x0201980C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	ldr r2, [r0, #4]
	str r0, [sp, #0x10]
	lsl r0, r1, #4
	add r4, r2, r0
	mov r0, #1
	ldrh r1, [r4, #4]
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r4, #4]
	mov r0, #0xd
	ldrsb r6, [r4, r0]
	mov r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, r6
	bge _020198F4
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	str r1, [sp, #0x28]
	mov r1, #7
	ldrsb r3, [r4, r1]
	ldr r1, [sp, #0x28]
	cmp r3, r1
	bge _020198F4
	ldrh r2, [r4, #4]
	lsl r1, r2, #0x1a
	lsr r1, r1, #0x1a
	str r1, [sp, #0x24]
	add r7, r0, r1
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	mov ip, r1
	cmp r7, r1
	blt _020198F4
	lsl r1, r2, #0x14
	lsr r1, r1, #0x1a
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	str r3, [sp, #0x18]
	add r2, r3, r1
	mov r1, #0xe
	ldrsb r1, [r4, r1]
	str r1, [sp, #0x14]
	cmp r2, r1
	blt _020198F4
	ldr r1, [sp, #0x24]
	mov r5, ip
	lsl r1, r1, #0x18
	str r0, [sp, #0x20]
	asr r1, r1, #0x18
	cmp r0, r5
	bge _02019884
	mov r5, ip
	str r5, [sp, #0x20]
	mov r5, ip
	sub r0, r5, r0
	sub r0, r1, r0
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
_02019884:
	cmp r7, r6
	blt _02019890
	sub r0, r7, r6
	sub r0, r1, r0
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
_02019890:
	ldr r0, [sp, #0x1c]
	ldr r5, [sp, #0x14]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	cmp r3, r5
	bge _020198AA
	add r3, r5, #0
	add r6, r5, #0
	ldr r5, [sp, #0x18]
	sub r5, r6, r5
	sub r0, r0, r5
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
_020198AA:
	ldr r5, [sp, #0x28]
	cmp r2, r5
	blt _020198B8
	sub r2, r2, r5
	sub r0, r0, r2
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
_020198B8:
	lsl r2, r3, #0x18
	lsr r2, r2, #0x18
	lsl r1, r1, #0x18
	str r2, [sp]
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	str r1, [sp, #4]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x20]
	ldrb r1, [r4, #0xa]
	lsl r3, r3, #0x18
	ldr r0, [r0]
	mov r2, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x10]
	ldrh r2, [r2, #0xa]
	ldrb r1, [r4, #0xa]
	ldr r0, [r0]
	lsl r2, r2, #0x11
	lsr r3, r2, #0xf
	ldr r2, _020198F8 ; =_020F6298
	ldr r2, [r2, r3]
	blx r2
_020198F4:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020198F8: .word _020F6298
	thumb_func_end sub_0201980C

	thumb_func_start sub_020198FC
sub_020198FC: ; 0x020198FC
	push {r3, r4}
	ldr r4, [r0, #4]
	lsl r1, r1, #4
	add r1, r4, r1
	strb r2, [r1, #8]
	ldr r2, _0201992C ; =0xFFFFFFF8
	strb r3, [r1, #9]
	add r2, sp
	ldrb r2, [r2, #0x10]
	strb r2, [r1, #0xb]
	ldrh r3, [r1, #4]
	ldr r2, _02019930 ; =0xFFFF1FFF
	and r3, r2
	mov r2, #2
	lsl r2, r2, #0xc
	orr r3, r2
	strh r3, [r1, #4]
	ldrh r3, [r0, #0xa]
	lsl r1, r2, #2
	orr r1, r3
	strh r1, [r0, #0xa]
	pop {r3, r4}
	bx lr
	nop
_0201992C: .word 0xFFFFFFF8
_02019930: .word 0xFFFF1FFF
	thumb_func_end sub_020198FC

	thumb_func_start sub_02019934
sub_02019934: ; 0x02019934
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r1, [r5, #0xa]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x1f
	beq _02019970
	ldr r0, _02019974 ; =0xFFFF7FFF
	add r6, r5, #0
	and r0, r1
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #8]
	add r6, #0xa
	mov r4, #0
	cmp r0, #0
	bls _02019970
	mov r7, #2
	lsl r7, r7, #0xe
_02019956:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02019978
	cmp r0, #1
	bne _02019968
	ldrh r0, [r6]
	orr r0, r7
	strh r0, [r6]
_02019968:
	ldrh r0, [r5, #8]
	add r4, r4, #1
	cmp r4, r0
	blo _02019956
_02019970:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02019974: .word 0xFFFF7FFF
	thumb_func_end sub_02019934

	thumb_func_start sub_02019978
sub_02019978: ; 0x02019978
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r2, [r5, #4]
	lsl r4, r6, #4
	add r2, r2, r4
	ldrh r2, [r2, #4]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1d
	bne _02019990
	mov r0, #0
	pop {r4, r5, r6, pc}
_02019990:
	bl sub_0201980C
	ldr r2, [r5, #4]
	add r1, r2, #6
	add r3, r2, r4
	mov r2, #8
	ldrsb r0, [r1, r4]
	ldrsb r2, [r3, r2]
	add r0, r0, r2
	strb r0, [r1, r4]
	ldr r2, [r5, #4]
	add r1, r2, #7
	add r3, r2, r4
	mov r2, #9
	ldrsb r0, [r1, r4]
	ldrsb r2, [r3, r2]
	add r0, r0, r2
	strb r0, [r1, r4]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020197F4
	ldr r1, [r5, #4]
	add r1, #0xb
	ldrb r0, [r1, r4]
	sub r0, r0, #1
	strb r0, [r1, r4]
	ldr r0, [r5, #4]
	add r2, r0, r4
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	bne _020199DC
	ldrh r1, [r2, #4]
	ldr r0, _020199E0 ; =0xFFFF1FFF
	and r0, r1
	strh r0, [r2, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_020199DC:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020199E0: .word 0xFFFF1FFF
	thumb_func_end sub_02019978

	thumb_func_start sub_020199E4
sub_020199E4: ; 0x020199E4
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r0, r2, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1d
	bx lr
	.balign 4, 0
	thumb_func_end sub_020199E4

	thumb_func_start sub_020199F4
sub_020199F4: ; 0x020199F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r2, [sp]
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r1, r2, r0
	ldr r0, [r2, r0]
	add r7, r3, #0
	mov ip, r0
	ldrh r0, [r1, #4]
	add r1, sp, #0x10
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	mov lr, r0
	ldrb r0, [r1, #0x14]
	add r0, r7, r0
	str r0, [sp, #4]
	cmp r7, r0
	bge _02019A58
	ldrb r0, [r1, #0x18]
	ldrb r1, [r1, #0x10]
	ldr r6, _02019A5C ; =0x00000FFF
	lsl r5, r0, #0xc
	ldr r0, [sp]
	add r2, r0, r1
_02019A26:
	ldr r1, [sp]
	add r0, r1, #0
	cmp r0, r2
	bge _02019A4C
	mov r0, lr
	mul r0, r7
	lsl r3, r0, #1
	mov r0, ip
	add r3, r0, r3
_02019A38:
	lsl r0, r1, #1
	ldrh r4, [r3, r0]
	and r4, r6
	orr r4, r5
	strh r4, [r3, r0]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, r2
	blt _02019A38
_02019A4C:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _02019A26
_02019A58:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02019A5C: .word 0x00000FFF
	thumb_func_end sub_020199F4

	thumb_func_start sub_02019A60
sub_02019A60: ; 0x02019A60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	lsl r0, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [sp]
	mov r6, #0
	ldr r1, [r0, #4]
	ldr r0, [sp, #0xc]
	add r3, r1, r0
	ldr r0, [r1, r0]
	mov ip, r0
	ldrh r0, [r3, #4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	mov lr, r0
	ldrh r0, [r2, #0xa]
	lsl r0, r0, #0x11
	lsr r7, r0, #0x11
	ldrb r0, [r2, #9]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldrb r0, [r2, #8]
	cmp r0, #0
	ble _02019B04
_02019A94:
	ldrb r0, [r2, #6]
	add r3, r0, r6
	ldr r0, [sp]
	ldr r1, [r0, #4]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1a
	cmp r3, r0
	bge _02019B04
	ldrb r0, [r2, #7]
	mov r1, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02019AF0
_02019AB4:
	ldr r0, [sp]
	ldrb r5, [r2, #5]
	ldr r3, [r0, #4]
	ldr r0, [sp, #0xc]
	add r4, r5, r1
	add r0, r3, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	cmp r4, r0
	bge _02019AF0
	ldr r0, [sp, #8]
	add r3, r7, r1
	add r0, r0, r3
	ldrb r3, [r2, #6]
	add r4, r3, r6
	mov r3, lr
	mul r4, r3
	add r3, r5, r4
	add r3, r1, r3
	lsl r4, r3, #1
	mov r3, ip
	strh r0, [r3, r4]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldrb r0, [r2, #7]
	str r0, [sp, #4]
	cmp r1, r0
	blt _02019AB4
_02019AF0:
	ldr r0, [sp, #4]
	add r0, r7, r0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldrb r0, [r2, #8]
	cmp r6, r0
	blt _02019A94
_02019B04:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02019A60

	thumb_func_start sub_02019B08
sub_02019B08: ; 0x02019B08
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	ldr r0, [r2, r0]
	bx lr
	thumb_func_end sub_02019B08

	thumb_func_start sub_02019B10
sub_02019B10: ; 0x02019B10
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r0, r2, r0
	ldrb r0, [r0, #0xa]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019B10

	thumb_func_start sub_02019B1C
sub_02019B1C: ; 0x02019B1C
	push {r4, r5}
	cmp r2, #0
	beq _02019B2E
	ldr r5, [r0, #4]
	lsl r4, r1, #4
	add r5, r5, r4
	mov r4, #6
	ldrsb r4, [r5, r4]
	strb r4, [r2]
_02019B2E:
	cmp r3, #0
	beq _02019B3E
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r1, r2, r0
	mov r0, #7
	ldrsb r0, [r1, r0]
	strb r0, [r3]
_02019B3E:
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019B1C

	thumb_func_start sub_02019B44
sub_02019B44: ; 0x02019B44
	push {r4, r5}
	cmp r2, #0
	beq _02019B58
	ldr r5, [r0, #4]
	lsl r4, r1, #4
	add r4, r5, r4
	ldrh r4, [r4, #4]
	lsl r4, r4, #0x1a
	lsr r4, r4, #0x1a
	strh r4, [r2]
_02019B58:
	cmp r3, #0
	beq _02019B6A
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r0, r2, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1a
	strh r0, [r3]
_02019B6A:
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019B44

	thumb_func_start sub_02019B70
sub_02019B70: ; 0x02019B70
	push {r3, r4}
	ldr r4, [r0, #4]
	lsl r1, r1, #4
	add r4, r4, r1
	strb r2, [r4, #0xc]
	ldr r2, [r0, #4]
	add r2, r2, r1
	strb r3, [r2, #0xd]
	ldr r3, _02019B9C ; =0xFFFFFFF8
	mov r2, #0x10
	add r3, sp
	ldrsb r4, [r3, r2]
	ldr r2, [r0, #4]
	add r2, r2, r1
	strb r4, [r2, #0xe]
	mov r2, #0x14
	ldr r0, [r0, #4]
	ldrsb r2, [r3, r2]
	add r0, r0, r1
	strb r2, [r0, #0xf]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02019B9C: .word 0xFFFFFFF8
	thumb_func_end sub_02019B70

	thumb_func_start sub_02019BA0
sub_02019BA0: ; 0x02019BA0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019BA0
