	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F61B8:
	.byte 0x06
_020F61B9:
	.byte 0x04, 0x10, 0x06

	.text

	thumb_func_start sub_0201660C
sub_0201660C: ; 0x0201660C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x78
	bl AllocFromHeap
	add r1, r5, #0
	add r4, r0, #0
	bl sub_02016A1C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201660C

	thumb_func_start sub_02016624
sub_02016624: ; 0x02016624
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x77
	ldrb r1, [r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #1
	bne _0201663A
	bl sub_020169CC
_0201663A:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02016624

	thumb_func_start sub_02016644
sub_02016644: ; 0x02016644
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	str r0, [r5, #0x5c]
	ldr r0, [r4, #4]
	str r0, [r5, #0x60]
	add r0, r5, #0
	ldrb r1, [r4, #0x10]
	add r0, #0x70
	strb r1, [r0]
	add r0, r5, #0
	ldrb r1, [r4, #0x11]
	add r0, #0x71
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x74
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
	add r0, r5, #0
	add r0, #0x74
	strb r1, [r0]
	ldrb r0, [r4, #0x12]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1c
	cmp r1, #2
	bhs _0201667E
	b _02016680
_0201667E:
	mov r1, #0
_02016680:
	add r0, r5, #0
	add r0, #0x75
	strb r1, [r0]
	ldrb r0, [r4, #0x13]
	lsl r1, r0, #1
	ldr r0, _020166F4 ; =_020F61B8
	ldrb r1, [r0, r1]
	add r0, r5, #0
	add r0, #0x72
	strb r1, [r0]
	ldrb r0, [r4, #0x13]
	lsl r1, r0, #1
	ldr r0, _020166F8 ; =_020F61B9
	ldrb r1, [r0, r1]
	add r0, r5, #0
	add r0, #0x73
	strb r1, [r0]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02016A64
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02016A84
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02016AB0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02016B4C
	add r0, r5, #0
	add r0, #0x77
	ldrb r1, [r0]
	mov r0, #0xf
	bic r1, r0
	mov r0, #1
	orr r1, r0
	add r0, r5, #0
	add r0, #0x77
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x77
	ldrb r1, [r0]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x80
	orr r1, r0
	add r0, r5, #0
	add r0, #0x77
	strb r1, [r0]
	add r0, r5, #0
	bl sub_020167C4
	pop {r3, r4, r5, pc}
	nop
_020166F4: .word _020F61B8
_020166F8: .word _020F61B9
	thumb_func_end sub_02016644

	thumb_func_start sub_020166FC
sub_020166FC: ; 0x020166FC
	ldr r3, _02016700 ; =sub_02016644
	bx r3
	.balign 4, 0
_02016700: .word sub_02016644
	thumb_func_end sub_020166FC

	thumb_func_start sub_02016704
sub_02016704: ; 0x02016704
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl sub_02016644
	cmp r4, #0
	beq _02016742
	ldr r3, [r5, #0x64]
	mov r0, #0x98
	mov r1, #0
	add r2, sp, #4
	bl GfGfxLoader_GetPlttData
	add r7, r0, #0
	mov r0, #0x40
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r3, [r6, #0xc]
	ldr r2, [r5, #0x60]
	lsl r3, r3, #0x14
	ldr r1, [r1, #0xc]
	add r0, r4, #0
	lsr r2, r2, #2
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
	add r0, r7, #0
	bl FreeToHeap
_02016742:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02016704

	thumb_func_start sub_02016748
sub_02016748: ; 0x02016748
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x77
	ldrb r2, [r1]
	mov r1, #0xf0
	bic r2, r1
	mov r1, #0x80
	orr r2, r1
	add r1, r4, #0
	add r1, #0x77
	strb r2, [r1]
	bl sub_020168F4
	cmp r0, #0
	bne _02016784
	add r1, r4, #0
	add r1, #0x77
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bne _02016784
	add r4, #0x76
	ldrb r0, [r4]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bne _02016782
	mov r0, #3
	pop {r4, pc}
_02016782:
	mov r0, #4
_02016784:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02016748

	thumb_func_start sub_02016788
sub_02016788: ; 0x02016788
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x28
	add r6, r1, #0
	add r4, #0xc
	mul r6, r0
	add r5, r4, r6
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r3, r5, #0
	lsl r2, r2, #2
	str r0, [sp]
	add r3, #0x24
	add r2, r5, r2
	ldrb r3, [r3]
	ldr r0, [r4, r6]
	ldr r1, [r5, #4]
	ldr r2, [r2, #0x10]
	bl sub_02016E40
	ldr r1, [r5, #4]
	ldr r0, [r4, r6]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02016788

	thumb_func_start sub_020167C4
sub_020167C4: ; 0x020167C4
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x74
	ldrb r1, [r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	bne _020167F6
	add r1, r4, #0
	add r1, #0x75
	ldrb r1, [r1]
	mov r2, #1
	bl sub_02016788
	add r0, r4, #0
	add r4, #0x75
	ldrb r2, [r4]
	mov r1, #1
	eor r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_02016788
	pop {r4, pc}
_020167F6:
	add r4, #0x75
	ldrb r1, [r4]
	mov r2, #0
	bl sub_02016788
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020167C4

	thumb_func_start sub_02016804
sub_02016804: ; 0x02016804
	push {r3, lr}
	mov r2, #1
	add r3, r1, #0
	tst r3, r2
	beq _02016832
	add r1, r0, #0
	add r1, #0x76
	ldrb r3, [r1]
	mov r1, #0xf
	bic r3, r1
	add r1, r0, #0
	add r1, #0x75
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x76
	and r1, r2
	orr r1, r3
	strb r1, [r0]
	ldr r0, _0201687C ; =0x000005E4
	bl PlaySE
	mov r0, #1
	pop {r3, pc}
_02016832:
	mov r3, #2
	tst r3, r1
	beq _02016854
	add r1, r0, #0
	add r1, #0x76
	ldrb r3, [r1]
	mov r1, #0xf
	add r0, #0x76
	bic r3, r1
	add r1, r3, #0
	orr r1, r2
	strb r1, [r0]
	ldr r0, _0201687C ; =0x000005E4
	bl PlaySE
	mov r0, #1
	pop {r3, pc}
_02016854:
	mov r3, #0xc0
	tst r1, r3
	beq _02016876
	add r1, r0, #0
	add r1, #0x75
	ldrb r1, [r1]
	eor r2, r1
	add r1, r0, #0
	add r1, #0x75
	strb r2, [r1]
	bl sub_020167C4
	ldr r0, _02016880 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r3, pc}
_02016876:
	mov r0, #0
	pop {r3, pc}
	nop
_0201687C: .word 0x000005E4
_02016880: .word 0x000005DC
	thumb_func_end sub_02016804

	thumb_func_start sub_02016884
sub_02016884: ; 0x02016884
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x76
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	bne _020168B0
	ldr r0, [r4]
	bl sub_02026CC4
	cmp r0, #0
	beq _020168B0
	add r0, r4, #0
	add r0, #0x74
	ldrb r1, [r0]
	mov r0, #1
	add r4, #0x74
	bic r1, r0
	mov r0, #1
	orr r1, r0
	strb r1, [r4]
	pop {r4, pc}
_020168B0:
	add r0, r4, #0
	add r0, #0x74
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _020168E2
	ldr r0, _020168F0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _020168E2
	add r0, r4, #0
	add r0, #0x74
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
	add r0, r4, #0
	add r0, #0x74
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020167C4
	mov r0, #0
	pop {r4, pc}
_020168E2:
	ldr r1, _020168F0 ; =gSystem
	add r0, r4, #0
	ldr r1, [r1, #0x48]
	bl sub_02016804
	pop {r4, pc}
	nop
_020168F0: .word gSystem
	thumb_func_end sub_02016884

	thumb_func_start sub_020168F4
sub_020168F4: ; 0x020168F4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x77
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _02016908
	bl GF_AssertFail
_02016908:
	add r0, r4, #0
	add r0, #0x76
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	cmp r1, #3
	bne _02016952
	add r0, r4, #0
	bl sub_02016884
	cmp r0, #0
	bne _02016924
	mov r0, #0
	pop {r3, r4, r5, pc}
_02016924:
	add r1, r4, #0
	add r1, #0x76
	ldrb r1, [r1]
	add r0, r4, #0
	mov r2, #1
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_02016788
	add r0, r4, #0
	add r4, #0x76
	ldrb r1, [r4]
	lsl r1, r1, #0x1c
	lsr r2, r1, #0x1c
	mov r1, #1
	eor r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_02016788
	mov r0, #0
	pop {r3, r4, r5, pc}
_02016952:
	add r0, r4, #0
	add r0, #0x74
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r5, r0, #0x1a
	cmp r5, #8
	bne _0201696C
	cmp r1, #0
	bne _02016968
	mov r0, #1
	pop {r3, r4, r5, pc}
_02016968:
	mov r0, #2
	pop {r3, r4, r5, pc}
_0201696C:
	lsr r2, r5, #0x1f
	lsl r0, r5, #0x1f
	sub r0, r0, r2
	mov r3, #0x1f
	ror r0, r3
	add r0, r2, r0
	bne _0201699A
	lsr r0, r5, #1
	lsr r2, r0, #0x1f
	lsl r0, r0, #0x1f
	sub r0, r0, r2
	ror r0, r3
	add r0, r2, r0
	bne _02016992
	add r0, r4, #0
	mov r2, #1
	bl sub_02016788
	b _0201699A
_02016992:
	add r0, r4, #0
	mov r2, #0
	bl sub_02016788
_0201699A:
	add r0, r4, #0
	add r0, #0x74
	ldrb r2, [r0]
	mov r1, #0xfc
	add r4, #0x74
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1a
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020168F4

	thumb_func_start sub_020169C0
sub_020169C0: ; 0x020169C0
	add r0, #0x74
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	.balign 4, 0
	thumb_func_end sub_020169C0

	thumb_func_start sub_020169CC
sub_020169CC: ; 0x020169CC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl sub_02026CAC
	add r5, r6, #0
	mov r4, #0
	add r5, #0xc
_020169DC:
	add r0, r5, #0
	bl sub_02016CC4
	add r4, r4, #1
	add r5, #0x28
	cmp r4, #2
	blt _020169DC
	ldr r1, [r6, #0x64]
	add r0, r6, #0
	bl sub_02016A1C
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020169CC

	thumb_func_start sub_020169F4
sub_020169F4: ; 0x020169F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02016A02
	bl GF_AssertFail
_02016A02:
	add r0, r5, #0
	add r0, #0x76
	ldrb r1, [r0]
	mov r0, #0xf0
	add r5, #0x76
	bic r1, r0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020169F4

	thumb_func_start sub_02016A1C
sub_02016A1C: ; 0x02016A1C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	mov r2, #0x78
	bl memset
	add r0, r5, #0
	add r0, #0x77
	ldrb r2, [r0]
	mov r1, #0xf
	add r0, r5, #0
	bic r2, r1
	add r0, #0x77
	strb r2, [r0]
	add r0, r5, #0
	str r4, [r5, #0x64]
	add r0, #0x76
	ldrb r2, [r0]
	mov r0, #3
	bic r2, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r5, #0
	add r0, #0x76
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x77
	ldrb r1, [r0]
	mov r0, #0xf0
	add r5, #0x77
	bic r1, r0
	mov r0, #0x80
	orr r0, r1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02016A1C

	thumb_func_start sub_02016A64
sub_02016A64: ; 0x02016A64
	push {r3, lr}
	sub sp, #8
	add r3, r0, #0
	ldr r0, [r1, #8]
	mov r1, #1
	str r0, [sp]
	ldr r0, [r3, #0x64]
	str r0, [sp, #4]
	ldr r2, [r3, #0x5c]
	ldr r3, [r3, #0x60]
	mov r0, #0x98
	bl sub_02016D24
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02016A64

	thumb_func_start sub_02016A84
sub_02016A84: ; 0x02016A84
	push {r3, lr}
	sub sp, #8
	add r3, r1, #0
	ldr r1, [r0, #0x60]
	cmp r1, #4
	bhs _02016A94
	mov r2, #0
	b _02016A96
_02016A94:
	mov r2, #4
_02016A96:
	mov r1, #0x40
	str r1, [sp]
	ldr r0, [r0, #0x64]
	mov r1, #0
	str r0, [sp, #4]
	ldr r3, [r3, #0xc]
	mov r0, #0x98
	lsl r3, r3, #5
	bl sub_02016D74
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02016A84

	thumb_func_start sub_02016AB0
sub_02016AB0: ; 0x02016AB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	mov r2, #0
	add r3, r7, #0
_02016ABA:
	add r2, r2, #1
	lsl r0, r2, #0xc
	str r0, [r3, #0x68]
	add r3, r3, #4
	cmp r2, #2
	blt _02016ABA
	ldr r0, [r7, #0x5c]
	add r2, sp, #4
	str r0, [sp, #4]
	ldr r0, [r7, #0x60]
	mov r5, #2
	strb r0, [r2, #0x12]
	mov r0, #0x98
	strh r0, [r2, #8]
	ldr r0, [r1, #8]
	strh r0, [r2, #0xe]
	ldr r0, [r1, #0xc]
	strh r0, [r2, #0x10]
	add r0, r7, #0
	add r0, #0x68
	str r0, [sp, #8]
	add r0, r7, #0
	strb r5, [r2, #0x13]
	add r0, #0x70
	ldrb r0, [r0]
	strb r0, [r2, #0x14]
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _02016AF6
	mov r5, #6
_02016AF6:
	add r0, r7, #0
	mov r6, #0
	str r0, [sp]
	add r0, #0xc
	add r4, r6, #0
	str r0, [sp]
_02016B02:
	mov r0, #0
	add r1, sp, #4
_02016B06:
	add r2, r5, r0
	add r2, r2, r4
	strh r2, [r1, #0xa]
	add r0, r0, #1
	add r1, r1, #2
	cmp r0, #2
	blt _02016B06
	add r1, r7, #0
	add r0, r7, #0
	add r1, #0x73
	add r0, #0x71
	ldrb r1, [r1]
	ldrb r0, [r0]
	mul r1, r6
	add r1, r0, r1
	add r0, sp, #4
	strb r1, [r0, #0x15]
	ldrh r0, [r0, #0x10]
	add r1, r0, r6
	add r0, sp, #4
	strh r1, [r0, #0x10]
	ldr r0, [sp]
	ldr r2, [r7, #0x64]
	add r1, sp, #4
	bl sub_02016C28
	ldr r0, [sp]
	add r6, r6, #1
	add r0, #0x28
	add r4, r4, #2
	str r0, [sp]
	cmp r6, #2
	blt _02016B02
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02016AB0

	thumb_func_start sub_02016B4C
sub_02016B4C: ; 0x02016B4C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
_02016B56:
	add r2, r4, #0
	add r2, #0x71
	ldrb r3, [r2]
	add r2, r4, #0
	add r2, #0x73
	ldrb r2, [r2]
	mul r2, r0
	add r2, r3, r2
	lsl r2, r2, #3
	strb r2, [r1, #4]
	add r2, r4, #0
	add r2, #0x70
	ldrb r2, [r2]
	add r0, r0, #1
	lsl r2, r2, #3
	strb r2, [r1, #6]
	add r2, r4, #0
	add r2, #0x73
	ldrb r2, [r2]
	add r3, r2, #0
	add r2, r4, #0
	add r2, #0x71
	ldrb r2, [r2]
	mul r3, r0
	add r2, r3, r2
	lsl r2, r2, #3
	strb r2, [r1, #5]
	add r2, r4, #0
	add r2, #0x70
	ldrb r3, [r2]
	add r2, r4, #0
	add r2, #0x72
	ldrb r2, [r2]
	add r2, r3, r2
	lsl r2, r2, #3
	strb r2, [r1, #7]
	add r1, r1, #4
	cmp r0, #2
	blt _02016B56
	ldr r0, [r4, #0x64]
	ldr r2, _02016BBC ; =sub_02016BC0
	str r0, [sp]
	add r0, r4, #4
	mov r1, #2
	add r3, r4, #0
	bl sub_02026C44
	str r0, [r4]
	add sp, #4
	pop {r3, r4, pc}
	nop
_02016BBC: .word sub_02016BC0
	thumb_func_end sub_02016B4C

	thumb_func_start sub_02016BC0
sub_02016BC0: ; 0x02016BC0
	push {r3, r4, lr}
	sub sp, #4
	add r3, r2, #0
	add r3, #0x77
	ldrb r3, [r3]
	mov r4, #0xf0
	bic r3, r4
	lsl r4, r1, #0x18
	lsr r4, r4, #0x18
	lsl r4, r4, #0x1c
	lsr r4, r4, #0x18
	orr r4, r3
	add r3, r2, #0
	add r3, #0x77
	strb r4, [r3]
	cmp r1, #0
	bne _02016C20
	add r1, r2, #0
	add r1, #0x76
	ldrb r1, [r1]
	mov r3, #0xf
	bic r1, r3
	lsl r3, r0, #0x18
	lsr r4, r3, #0x18
	mov r3, #0xf
	and r3, r4
	orr r3, r1
	add r1, r2, #0
	add r1, #0x76
	strb r3, [r1]
	mov r1, #0x28
	add r2, #0xc
	mul r1, r0
	add r3, r2, r1
	add r0, r3, #0
	add r0, #0x25
	ldrb r0, [r0]
	str r0, [sp]
	ldr r0, [r2, r1]
	ldr r1, [r3, #4]
	ldr r2, [r3, #0x14]
	add r3, #0x24
	ldrb r3, [r3]
	bl sub_02016E40
	ldr r0, _02016C24 ; =0x000005E4
	bl PlaySE
_02016C20:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02016C24: .word 0x000005E4
	thumb_func_end sub_02016BC0

	thumb_func_start sub_02016C28
sub_02016C28: ; 0x02016C28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, [r5, #4]
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r2, r0, #0
	str r1, [r0, #0x18]
	ldrb r0, [r5, #0x13]
	add r2, #0x18
	ldr r6, [sp, #4]
	str r0, [r2, #4]
	mov r0, #0
	str r0, [r2, #8]
	str r0, [sp, #0xc]
	ldr r1, [r5]
	ldr r0, [sp, #4]
	ldr r4, [sp, #4]
	str r1, [r0]
	ldrb r1, [r5, #0x12]
	add r6, #0x10
	add r7, r5, #0
	str r1, [r0, #4]
	ldrb r1, [r5, #0x14]
	add r0, #0x24
	strb r1, [r0]
	ldr r0, [sp, #4]
	ldrb r1, [r5, #0x15]
	add r0, #0x25
	strb r1, [r0]
_02016C64:
	ldr r0, [sp, #8]
	mov r2, #1
	str r0, [sp]
	ldrh r0, [r5, #8]
	ldrh r1, [r7, #0xa]
	add r3, r6, #0
	bl GfGfxLoader_GetScrnData
	str r0, [r4, #8]
	ldrh r1, [r5, #0xe]
	ldr r0, [r4, #0x10]
	bl sub_02016E8C
	ldrh r1, [r5, #0x10]
	ldr r0, [r4, #0x10]
	bl sub_02016EAC
	ldr r0, [sp, #0xc]
	add r6, r6, #4
	add r0, r0, #1
	add r7, r7, #2
	add r4, r4, #4
	str r0, [sp, #0xc]
	cmp r0, #2
	blt _02016C64
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r0, #0x25
	ldrb r0, [r0]
	ldr r1, [sp, #4]
	ldr r2, [sp, #4]
	str r0, [sp]
	ldr r0, [sp, #4]
	add r3, #0x24
	ldrb r3, [r3]
	ldr r0, [r0]
	ldr r1, [r1, #4]
	ldr r2, [r2, #0x10]
	bl sub_02016E40
	ldr r0, [sp, #4]
	mov r1, #0
	add r0, #0x26
	str r0, [sp, #4]
	strb r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02016C28

	thumb_func_start sub_02016CC4
sub_02016CC4: ; 0x02016CC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r0, #0x25
	ldrb r0, [r0]
	ldr r1, [r6, #0x10]
	add r3, r6, #0
	str r0, [sp]
	ldrh r0, [r1]
	mov r2, #0
	add r3, #0x24
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r1, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r1, [r6, #4]
	ldrb r3, [r3]
	lsl r1, r1, #0x18
	ldr r0, [r6]
	lsr r1, r1, #0x18
	bl FillBgTilemapRect
	ldr r1, [r6, #4]
	ldr r0, [r6]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	mov r4, #0
	add r5, r6, #0
_02016D08:
	ldr r0, [r5, #8]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02016D08
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x28
	bl memset
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02016CC4

	thumb_func_start sub_02016D24
sub_02016D24: ; 0x02016D24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	str r1, [sp, #4]
	ldr r0, [sp, #0x24]
	mov r1, #0x10
	add r5, r2, #0
	add r6, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02016D40:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02016D40
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #4]
	str r0, [sp]
	add r0, r7, #0
	mov r2, #1
	add r3, r4, #4
	bl GfGfxLoader_GetCharData
	str r0, [r4, #8]
	str r5, [r4]
	ldr r0, [sp, #0x20]
	strh r6, [r4, #0xc]
	strh r0, [r4, #0xe]
	ldr r0, _02016D70 ; =sub_02016DBC
	add r1, r4, #0
	mov r2, #0x80
	bl sub_0200E374
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02016D70: .word sub_02016DBC
	thumb_func_end sub_02016D24

	thumb_func_start sub_02016D74
sub_02016D74: ; 0x02016D74
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	mov r1, #0x10
	add r5, r2, #0
	add r6, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02016D8E:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02016D8E
	ldr r1, [sp]
	ldr r3, [sp, #0x1c]
	add r0, r7, #0
	add r2, r4, #0
	bl GfGfxLoader_GetPlttData
	str r0, [r4, #4]
	strh r5, [r4, #8]
	ldr r0, [sp, #0x18]
	strh r6, [r4, #0xa]
	strh r0, [r4, #0xc]
	ldr r0, _02016DB8 ; =sub_02016DF8
	add r1, r4, #0
	mov r2, #0x80
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02016DB8: .word sub_02016DF8
	thumb_func_end sub_02016D74

	thumb_func_start sub_02016DBC
sub_02016DBC: ; 0x02016DBC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #4]
	add r5, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	bl DC_FlushRange
	ldrh r0, [r4, #0xe]
	ldr r3, [r4, #4]
	str r0, [sp]
	ldrh r1, [r4, #0xc]
	ldr r2, [r3, #0x14]
	ldr r0, [r4]
	lsl r1, r1, #0x18
	ldr r3, [r3, #0x10]
	lsr r1, r1, #0x18
	bl BG_LoadCharTilesData
	add r0, r5, #0
	bl DestroySysTask
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02016DBC

	thumb_func_start sub_02016DF8
sub_02016DF8: ; 0x02016DF8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	ldrh r1, [r4, #0xc]
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldrh r0, [r4, #8]
	cmp r0, #0
	bne _02016E1C
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	ldrh r2, [r4, #0xc]
	ldr r0, [r0, #0xc]
	bl GX_LoadBGPltt
	b _02016E2C
_02016E1C:
	cmp r0, #4
	bne _02016E2C
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	ldrh r2, [r4, #0xc]
	ldr r0, [r0, #0xc]
	bl GXS_LoadBGPltt
_02016E2C:
	add r0, r5, #0
	bl DestroySysTask
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02016DF8

	thumb_func_start sub_02016E40
sub_02016E40: ; 0x02016E40
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r4, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldrh r6, [r1]
	ldrh r3, [r1, #2]
	lsl r2, r2, #0x18
	lsl r6, r6, #0x15
	lsr r6, r6, #0x18
	lsl r3, r3, #0x15
	str r6, [sp]
	lsr r3, r3, #0x18
	str r3, [sp, #4]
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	str r3, [sp, #0x18]
	ldr r3, [sp, #0x30]
	lsl r1, r4, #0x18
	lsl r3, r3, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	add r5, r0, #0
	bl CopyToBgTilemapRect
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02016E40

	thumb_func_start sub_02016E8C
sub_02016E8C: ; 0x02016E8C
	push {r3, r4}
	ldr r2, [r0, #8]
	add r0, #0xc
	lsr r4, r2, #1
	mov r3, #0
	cmp r4, #0
	ble _02016EA8
_02016E9A:
	ldrh r2, [r0]
	add r3, r3, #1
	add r2, r2, r1
	strh r2, [r0]
	add r0, r0, #2
	cmp r3, r4
	blt _02016E9A
_02016EA8:
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02016E8C

	thumb_func_start sub_02016EAC
sub_02016EAC: ; 0x02016EAC
	push {r4, r5}
	ldr r2, [r0, #8]
	add r0, #0xc
	lsr r3, r2, #1
	mov r2, #0
	cmp r3, #0
	ble _02016ED2
	ldr r4, _02016ED8 ; =0x00000FFF
	lsl r1, r1, #0xc
_02016EBE:
	ldrh r5, [r0]
	add r2, r2, #1
	and r5, r4
	strh r5, [r0]
	ldrh r5, [r0]
	orr r5, r1
	strh r5, [r0]
	add r0, r0, #2
	cmp r2, r3
	blt _02016EBE
_02016ED2:
	pop {r4, r5}
	bx lr
	nop
_02016ED8: .word 0x00000FFF
	thumb_func_end sub_02016EAC
