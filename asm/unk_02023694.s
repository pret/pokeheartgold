	.include "asm/macros.inc"
	.include "unk_02023694.inc"
	.include "global.inc"

	.bss

_021D2208:
	.space 0x8

	.text

	thumb_func_start sub_02023694
sub_02023694: ; 0x02023694
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	str r2, [r0, #4]
	add r1, r0, #0
	str r2, [r0, #8]
	add r1, #0xd0
	str r2, [r1]
	add r1, r0, #0
	add r1, #0xd4
	str r2, [r1]
	add r1, r0, #0
	add r1, #0xd8
	str r2, [r1]
	add r1, r0, #0
	add r1, #0xdc
	str r2, [r1]
	strb r2, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02023694

	thumb_func_start sub_020236BC
sub_020236BC: ; 0x020236BC
	mov r3, #0
	str r3, [r0, #0x28]
	add r1, r0, #0
	str r3, [r0, #0x2c]
	add r1, #0x84
	str r3, [r1]
	add r1, r0, #0
	add r1, #0x88
	str r3, [r1]
	add r1, r0, #0
	add r1, #0x8c
	str r3, [r1]
	add r1, r0, #0
	add r1, #0x90
	add r2, r0, #0
	str r3, [r1]
	add r2, #0xa0
	mov r1, #0x10
_020236E0:
	strb r3, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _020236E0
	add r2, r0, #0
	mov r1, #0
	add r2, #0x94
	str r1, [r2]
	add r2, r0, #0
	add r2, #0x98
	str r1, [r2]
	add r2, r0, #0
	add r2, #0x9c
	str r1, [r2]
	add r2, r0, #0
	add r2, #0xb0
	str r1, [r2]
	str r1, [r0]
	str r1, [r0, #4]
	mov r2, #1
	str r1, [r0, #8]
	lsl r2, r2, #0xc
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	str r2, [r0, #0x14]
	add r2, r0, #0
	str r1, [r0, #0x18]
	add r2, #0xb6
	strh r1, [r2]
	add r2, r0, #0
	add r2, #0xb4
	strb r1, [r2]
	add r2, r0, #0
	add r2, #0xbc
	str r1, [r2]
	add r2, r0, #0
	add r2, #0xc0
	str r1, [r2]
	add r2, r0, #0
	add r2, #0x24
	strb r1, [r2]
	str r1, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020236BC

	thumb_func_start sub_02023738
sub_02023738: ; 0x02023738
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02023774 ; =_021D2208
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _0202374A
	bl GF_AssertFail
_0202374A:
	mov r1, #0xe0
	add r0, r4, #0
	mul r1, r6
	bl Heap_Alloc
	ldr r7, _02023774 ; =_021D2208
	mov r4, #0
	str r0, [r7]
	str r6, [r7, #4]
	cmp r6, #0
	ble _02023772
	add r5, r4, #0
_02023762:
	ldr r0, [r7]
	add r0, r0, r5
	bl sub_02023694
	add r4, r4, #1
	add r5, #0xe0
	cmp r4, r6
	blt _02023762
_02023772:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02023774: .word _021D2208
	thumb_func_end sub_02023738

	thumb_func_start sub_02023778
sub_02023778: ; 0x02023778
	push {r4, r5, r6, lr}
	ldr r6, _020237AC ; =_021D2208
	mov r4, #0
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _02023798
	add r5, r4, #0
_02023786:
	ldr r0, [r6]
	add r0, r0, r5
	bl sub_02023874
	ldr r0, [r6, #4]
	add r4, r4, #1
	add r5, #0xe0
	cmp r4, r0
	blt _02023786
_02023798:
	ldr r0, _020237AC ; =_021D2208
	ldr r0, [r0]
	bl Heap_Free
	ldr r0, _020237AC ; =_021D2208
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	pop {r4, r5, r6, pc}
	nop
_020237AC: .word _021D2208
	thumb_func_end sub_02023778

	thumb_func_start sub_020237B0
sub_020237B0: ; 0x020237B0
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _020237E8 ; =_021D2208
	mov r4, #0
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _020237E4
	add r5, r4, #0
	mov r7, #2
_020237C0:
	ldr r0, [r6]
	add r0, r0, r5
	ldrb r1, [r0, #1]
	cmp r1, #1
	bne _020237CE
	bl sub_02023950
_020237CE:
	ldr r0, [r6]
	add r1, r0, r5
	ldrb r0, [r1, #3]
	cmp r0, #1
	bne _020237DA
	strb r7, [r1, #3]
_020237DA:
	ldr r0, [r6, #4]
	add r4, r4, #1
	add r5, #0xe0
	cmp r4, r0
	blt _020237C0
_020237E4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020237E8: .word _021D2208
	thumb_func_end sub_020237B0

	thumb_func_start sub_020237EC
sub_020237EC: ; 0x020237EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0202391C
	add r4, r0, #0
	bne _02023800
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02023800:
	mov r0, #1
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r2, [r5]
	mov r1, #0xc4
	ldr r0, [r5, #4]
	mul r1, r2
	bl Heap_Alloc
	str r0, [r4, #4]
	ldr r0, [r5]
	str r0, [r4, #8]
	add r0, r4, #0
	add r0, #0xc
	bl sub_020236BC
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0xc
	add r0, #0xc8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xcc
	str r1, [r0]
	ldr r1, [r5]
	ldr r0, [r5, #4]
	lsl r1, r1, #2
	bl Heap_Alloc
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	add r0, r4, #0
	bl sub_02024248
	ldr r0, [r5, #4]
	mov r1, #0x10
	bl Heap_Alloc
	add r1, r4, #0
	add r1, #0xd8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	ldr r1, [r5, #4]
	mov r2, #4
	bl HeapExp_FndInitAllocator
	ldr r0, [r5]
	ldr r1, [r5, #4]
	bl sub_0202068C
	add r1, r4, #0
	add r1, #0xdc
	str r0, [r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020237EC

	thumb_func_start sub_02023874
sub_02023874: ; 0x02023874
	push {r4, lr}
	add r4, r0, #0
	bne _02023882
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_02023882:
	ldrb r1, [r4]
	cmp r1, #0
	beq _020238B6
	bl sub_020238BC
	ldr r0, [r4, #4]
	bl Heap_Free
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl Heap_Free
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl Heap_Free
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	bl sub_020206C8
	add r0, r4, #0
	bl sub_02023694
_020238B6:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023874

	thumb_func_start sub_020238BC
sub_020238BC: ; 0x020238BC
	push {r3, r4, r5, lr}
	cmp r0, #0
	bne _020238CC
	bne _020238C8
	bl GF_AssertFail
_020238C8:
	mov r0, #0
	pop {r3, r4, r5, pc}
_020238CC:
	ldrb r1, [r0]
	cmp r1, #0
	beq _020238F2
	add r1, r0, #0
	add r1, #0xc8
	add r4, r0, #0
	ldr r1, [r1]
	add r4, #0xc
	cmp r1, r4
	beq _020238F2
_020238E0:
	add r0, r1, #0
	add r0, #0xbc
	ldr r5, [r0]
	add r0, r1, #0
	bl sub_02023DA4
	add r1, r5, #0
	cmp r5, r4
	bne _020238E0
_020238F2:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020238BC

	thumb_func_start sub_020238F8
sub_020238F8: ; 0x020238F8
	push {r4, lr}
	add r4, r0, #0
	bne _02023902
	bl GF_AssertFail
_02023902:
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _0202390C
	mov r0, #0
	pop {r4, pc}
_0202390C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020238F8

	thumb_func_start sub_02023910
sub_02023910: ; 0x02023910
	ldrb r1, [r0, #3]
	cmp r1, #2
	bne _0202391A
	mov r1, #0
	strb r1, [r0, #3]
_0202391A:
	bx lr
	thumb_func_end sub_02023910

	thumb_func_start sub_0202391C
sub_0202391C: ; 0x0202391C
	push {r3, r4}
	ldr r0, _0202394C ; =_021D2208
	mov r1, #0
	ldr r3, [r0, #4]
	cmp r3, #0
	ble _02023944
	ldr r4, [r0]
	add r2, r4, #0
_0202392C:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0202393C
	mov r0, #0xe0
	mul r0, r1
	add r0, r4, r0
	pop {r3, r4}
	bx lr
_0202393C:
	add r1, r1, #1
	add r2, #0xe0
	cmp r1, r3
	blt _0202392C
_02023944:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_0202394C: .word _021D2208
	thumb_func_end sub_0202391C

	thumb_func_start sub_02023950
sub_02023950: ; 0x02023950
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	bne _0202395C
	bl GF_AssertFail
_0202395C:
	add r0, sp, #0
	bl MTX_Identity33_
	add r0, r5, #0
	add r0, #0xc8
	ldr r4, [r0]
	add r5, #0xc
	cmp r4, r5
	beq _020239CC
	add r6, sp, #0
_02023970:
	add r0, r4, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _020239C4
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _02023986
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	blx r2
_02023986:
	add r0, r4, #0
	bl sub_020243FC
	add r0, r4, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0202399E
	add r0, r4, #0
	bl sub_02023FEC
	b _020239A8
_0202399E:
	cmp r0, #2
	bne _020239A8
	add r0, r4, #0
	bl sub_02023FC0
_020239A8:
	ldr r2, [r4, #0x18]
	cmp r2, #0
	bne _020239B0
	add r2, r6, #0
_020239B0:
	add r0, r4, #0
	add r3, r4, #0
	add r0, #0x30
	add r1, r4, #0
	add r3, #0xc
	bl GF3dRender_DrawModel
	add r0, r4, #0
	bl sub_0202441C
_020239C4:
	add r4, #0xbc
	ldr r4, [r4]
	cmp r4, r5
	bne _02023970
_020239CC:
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02023950

	thumb_func_start sub_020239D0
sub_020239D0: ; 0x020239D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x28]
	add r4, r1, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02023C04
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023C20
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02023C9C
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #1
	bne _02023A06
	add r6, #0xc
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020242E4
_02023A06:
	add r0, r5, #0
	mov r1, #2
	add r0, #0xb4
	strb r1, [r0]
	ldr r0, [r4, #8]
	mov r1, #0
	str r0, [r5, #0x2c]
	add r0, r5, #0
	add r0, #0xb6
	strh r1, [r0]
	add r5, #0xb8
	str r1, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020239D0

	thumb_func_start sub_02023A20
sub_02023A20: ; 0x02023A20
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x28]
	add r4, r1, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02023C04
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #2
	bne _02023A4A
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x94
	add r1, #0x98
	add r2, #0x9c
	bl sub_02023B70
_02023A4A:
	add r0, r5, #0
	ldr r1, [r4, #0x1c]
	add r0, #0x94
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #0x20]
	add r0, #0x98
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #0x24]
	add r0, #0x9c
	str r1, [r0]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023CF0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02023D24
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #1
	bne _02023A86
	add r6, #0xc
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020242E4
_02023A86:
	add r0, r5, #0
	mov r1, #3
	add r0, #0xb4
	strb r1, [r0]
	ldr r0, [r4, #8]
	mov r1, #0
	str r0, [r5, #0x2c]
	add r0, r5, #0
	add r0, #0xb6
	strh r1, [r0]
	add r5, #0xb8
	str r1, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02023A20

	thumb_func_start sub_02023AA0
sub_02023AA0: ; 0x02023AA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl NNS_G3dTexGetRequiredSize
	str r0, [sp, #8]
	add r0, r5, #0
	bl NNS_G3dTex4x4GetRequiredSize
	str r0, [sp, #4]
	add r0, r5, #0
	bl NNS_G3dPlttGetRequiredSize
	str r0, [sp]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02023ADE
	ldr r3, _02023B30 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r1, #0
	ldr r3, [r3]
	add r2, r1, #0
	blx r3
	str r0, [r4]
	cmp r0, #0
	bne _02023AE2
	bl GF_AssertFail
	b _02023AE2
_02023ADE:
	mov r0, #0
	str r0, [r4]
_02023AE2:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02023AFE
	ldr r3, _02023B30 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r1, #1
	ldr r3, [r3]
	mov r2, #0
	blx r3
	str r0, [r6]
	cmp r0, #0
	bne _02023B02
	bl GF_AssertFail
	b _02023B02
_02023AFE:
	mov r0, #0
	str r0, [r6]
_02023B02:
	ldr r0, [sp]
	cmp r0, #0
	beq _02023B26
	ldr r3, _02023B34 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #2
	ldrh r2, [r5, #0x20]
	lsl r1, r1, #0xe
	ldr r3, [r3]
	and r1, r2
	mov r2, #0
	blx r3
	str r0, [r7]
	cmp r0, #0
	bne _02023B2A
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02023B26:
	mov r0, #0
	str r0, [r7]
_02023B2A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02023B30: .word NNS_GfdDefaultFuncAllocTexVram
_02023B34: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end sub_02023AA0

	thumb_func_start sub_02023B38
sub_02023B38: ; 0x02023B38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl NNS_G3dTexReleaseTexKey
	add r0, r5, #0
	bl NNS_G3dPlttReleasePlttKey
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023B38

	thumb_func_start sub_02023B4C
sub_02023B4C: ; 0x02023B4C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r2]
	ldr r2, [r3]
	add r5, r0, #0
	bl NNS_G3dTexSetTexKey
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	ldr r1, [r1]
	bl NNS_G3dPlttSetPlttKey
	add r0, r4, #0
	add r1, r5, #0
	bl NNS_G3dBindMdlSet
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023B4C

	thumb_func_start sub_02023B70
sub_02023B70: ; 0x02023B70
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	add r5, r1, #0
	add r4, r2, #0
	cmp r0, #0
	beq _02023B82
	ldr r1, _02023B9C ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r1, [r1]
	blx r1
_02023B82:
	ldr r0, [r5]
	cmp r0, #0
	beq _02023B8E
	ldr r1, _02023B9C ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r1, [r1]
	blx r1
_02023B8E:
	ldr r0, [r4]
	cmp r0, #0
	beq _02023B9A
	ldr r1, _02023BA0 ; =NNS_GfdDefaultFuncFreePlttVram
	ldr r1, [r1]
	blx r1
_02023B9A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02023B9C: .word NNS_GfdDefaultFuncFreeTexVram
_02023BA0: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end sub_02023B70

	thumb_func_start sub_02023BA4
sub_02023BA4: ; 0x02023BA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	beq _02023BB4
	cmp r5, #0
	bne _02023BBA
_02023BB4:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02023BBA:
	bl NNS_G3dTexGetRequiredSize
	str r0, [sp]
	add r0, r4, #0
	bl NNS_G3dTex4x4GetRequiredSize
	str r0, [sp, #4]
	add r0, r4, #0
	bl NNS_G3dPlttGetRequiredSize
	add r4, r0, #0
	add r0, r5, #0
	bl NNS_G3dTexGetRequiredSize
	add r6, r0, #0
	add r0, r5, #0
	bl NNS_G3dTex4x4GetRequiredSize
	add r7, r0, #0
	add r0, r5, #0
	bl NNS_G3dPlttGetRequiredSize
	ldr r1, [sp]
	cmp r1, r6
	bne _02023BF6
	ldr r1, [sp, #4]
	cmp r1, r7
	bne _02023BF6
	cmp r4, r0
	beq _02023BFC
_02023BF6:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02023BFC:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02023BA4

	thumb_func_start sub_02023C04
sub_02023C04: ; 0x02023C04
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _02023C1C
	bl sub_02020738
	mov r0, #0
	add r4, #0xb0
	str r0, [r4]
_02023C1C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023C04

	thumb_func_start sub_02023C20
sub_02023C20: ; 0x02023C20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x8c
	ldr r4, [r0]
	add r0, r1, #0
	add r1, r5, #0
	add r2, r5, #0
	add r1, #0x88
	add r2, #0x8c
	bl sub_02024328
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	add r1, r5, #0
	add r1, #0x88
	add r0, r5, #0
	ldr r1, [r1]
	add r0, #0x30
	bl NNS_G3dRenderObjInit
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #3
	beq _02023C62
	add r1, r5, #0
	add r1, #0x8c
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_02023BA4
	b _02023C64
_02023C62:
	mov r0, #0
_02023C64:
	cmp r0, #0
	bne _02023C98
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #2
	bne _02023C82
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x94
	add r1, #0x98
	add r2, #0x9c
	bl sub_02023B70
_02023C82:
	add r0, r5, #0
	add r0, #0x8c
	add r1, r5, #0
	add r2, r5, #0
	add r5, #0x9c
	ldr r0, [r0]
	add r1, #0x94
	add r2, #0x98
	add r3, r5, #0
	bl sub_02023AA0
_02023C98:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023C20

	thumb_func_start sub_02023C9C
sub_02023C9C: ; 0x02023C9C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	add r0, r4, #0
	bl sub_02024374
	add r1, r5, #0
	add r1, #0x90
	add r3, r5, #0
	add r3, #0xa0
	str r0, [r1]
	add r4, #0xc
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r5, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r1, r2, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	add r2, r5, #0
	add r3, r5, #0
	str r0, [sp, #4]
	add r6, #0xdc
	add r2, #0x90
	add r3, #0x94
	ldr r0, [r6]
	ldr r2, [r2]
	ldr r3, [r3]
	bl sub_020206E0
	add r5, #0xb0
	str r0, [r5]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02023C9C

	thumb_func_start sub_02023CF0
sub_02023CF0: ; 0x02023CF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, r4, #0
	add r1, #0x88
	add r2, #0x8c
	bl sub_02024328
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	add r1, r5, #0
	add r1, #0x88
	add r0, r5, #0
	ldr r1, [r1]
	add r0, #0x30
	bl NNS_G3dRenderObjInit
	add r0, r4, #0
	bl sub_02024374
	add r5, #0x90
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023CF0

	thumb_func_start sub_02023D24
sub_02023D24: ; 0x02023D24
	push {r3, r4}
	add r4, r0, #0
	add r2, r4, #0
	add r3, r1, #0
	add r3, #0xc
	add r2, #0xa0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0
	add r4, #0xb0
	str r0, [r4]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02023D24

	thumb_func_start sub_02023D44
sub_02023D44: ; 0x02023D44
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5]
	cmp r6, #0
	bne _02023D52
	mov r0, #0
	pop {r4, r5, r6, pc}
_02023D52:
	add r0, r6, #0
	bl sub_02024280
	add r4, r0, #0
	bne _02023D60
	mov r0, #0
	pop {r4, r5, r6, pc}
_02023D60:
	add r3, r5, #0
	str r6, [r4, #0x28]
	add r3, #8
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, r5, #0
	str r0, [r2]
	add r3, #0x14
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	add r0, r4, #0
	add r0, #0xb6
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #1
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xb4
	strb r1, [r0]
	ldr r1, [r5, #4]
	add r0, r4, #0
	bl sub_02024380
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02023D44

	thumb_func_start sub_02023DA4
sub_02023DA4: ; 0x02023DA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bne _02023DAE
	bl GF_AssertFail
_02023DAE:
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #1
	bne _02023DBC
	bl GF_AssertFail
_02023DBC:
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	ldr r4, [r5, #0x28]
	cmp r0, #0
	bne _02023DCC
	mov r0, #0
	pop {r3, r4, r5, pc}
_02023DCC:
	add r0, r5, #0
	bl sub_02024308
	add r0, r5, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #2
	bne _02023DEC
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0x94
	add r1, #0x98
	add r2, #0x9c
	bl sub_02023B70
_02023DEC:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02023C04
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020242AC
	mov r0, #1
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023DA4

	thumb_func_start sub_02023E04
sub_02023E04: ; 0x02023E04
	push {r3, r4}
	add r4, r0, #0
	str r1, [r4]
	str r2, [r4, #4]
	str r3, [r4, #8]
	ldr r3, [sp, #8]
	add r2, r4, #0
	add r2, #0xc
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp, #0xc]
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x14]
	str r0, [r4, #0x24]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02023E04

	thumb_func_start sub_02023E2C
sub_02023E2C: ; 0x02023E2C
	push {r3, r4}
	add r4, r0, #0
	str r1, [r4]
	str r2, [r4, #4]
	str r3, [r4, #8]
	ldr r3, [sp, #8]
	add r2, r4, #0
	add r2, #0xc
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02023E2C

	thumb_func_start sub_02023E50
sub_02023E50: ; 0x02023E50
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _02023E5E
	bl GF_AssertFail
_02023E5E:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023E50

	thumb_func_start sub_02023E68
sub_02023E68: ; 0x02023E68
	push {r4, lr}
	add r4, r0, #0
	bne _02023E72
	bl GF_AssertFail
_02023E72:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023E68

	thumb_func_start sub_02023E78
sub_02023E78: ; 0x02023E78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _02023E86
	bl GF_AssertFail
_02023E86:
	ldmia r5!, {r0, r1}
	add r4, #0xc
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023E78

	thumb_func_start sub_02023E94
sub_02023E94: ; 0x02023E94
	push {r4, lr}
	add r4, r0, #0
	bne _02023E9E
	bl GF_AssertFail
_02023E9E:
	add r4, #0xc
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02023E94

	thumb_func_start sub_02023EA4
sub_02023EA4: ; 0x02023EA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023EB2
	bl GF_AssertFail
_02023EB2:
	add r5, #0x24
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023EA4

	thumb_func_start sub_02023EB8
sub_02023EB8: ; 0x02023EB8
	push {r4, lr}
	add r4, r0, #0
	bne _02023EC2
	bl GF_AssertFail
_02023EC2:
	add r4, #0x24
	ldrb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023EB8

	thumb_func_start sub_02023EC8
sub_02023EC8: ; 0x02023EC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023ED6
	bl GF_AssertFail
_02023ED6:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02024380
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023EC8

	thumb_func_start sub_02023EE0
sub_02023EE0: ; 0x02023EE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023EEE
	bl GF_AssertFail
_02023EEE:
	add r5, #0xb6
	strh r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023EE0

	thumb_func_start sub_02023EF4
sub_02023EF4: ; 0x02023EF4
	push {r4, lr}
	add r4, r0, #0
	bne _02023EFE
	bl GF_AssertFail
_02023EFE:
	add r4, #0xb6
	ldrh r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023EF4

	thumb_func_start sub_02023F04
sub_02023F04: ; 0x02023F04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023F12
	bl GF_AssertFail
_02023F12:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020243A4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023F04

	thumb_func_start sub_02023F1C
sub_02023F1C: ; 0x02023F1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023F2A
	bl GF_AssertFail
_02023F2A:
	add r5, #0xb8
	str r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02023F1C

	thumb_func_start sub_02023F30
sub_02023F30: ; 0x02023F30
	push {r4, lr}
	add r4, r0, #0
	bne _02023F3A
	bl GF_AssertFail
_02023F3A:
	add r4, #0xb8
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023F30

	thumb_func_start sub_02023F40
sub_02023F40: ; 0x02023F40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02023F4E
	bl GF_AssertFail
_02023F4E:
	add r1, r5, #0
	add r1, #0xb6
	ldrh r1, [r1]
	add r0, r5, #0
	bl sub_02024394
	add r1, r5, #0
	add r1, #0xb8
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	add r5, #0xb8
	add r0, r0, r4
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02023F40

	thumb_func_start sub_02023F70
sub_02023F70: ; 0x02023F70
	push {r4, lr}
	add r4, r0, #0
	bne _02023F7A
	bl GF_AssertFail
_02023F7A:
	add r1, r4, #0
	add r1, #0xb6
	ldrh r1, [r1]
	add r0, r4, #0
	bl sub_02024394
	add r4, #0xb8
	ldr r1, [r4]
	sub r0, r1, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023F70

	thumb_func_start sub_02023F90
sub_02023F90: ; 0x02023F90
	push {r4, lr}
	add r4, r0, #0
	bne _02023F9A
	bl GF_AssertFail
_02023F9A:
	add r4, #0x88
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023F90

	thumb_func_start sub_02023FA0
sub_02023FA0: ; 0x02023FA0
	push {r4, lr}
	add r4, r0, #0
	bne _02023FAA
	bl GF_AssertFail
_02023FAA:
	add r4, #0x94
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023FA0

	thumb_func_start sub_02023FB0
sub_02023FB0: ; 0x02023FB0
	push {r4, lr}
	add r4, r0, #0
	bne _02023FBA
	bl GF_AssertFail
_02023FBA:
	add r4, #0x9c
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02023FB0

	thumb_func_start sub_02023FC0
sub_02023FC0: ; 0x02023FC0
	push {r3, lr}
	add r1, r0, #0
	add r0, #0xb4
	ldrb r0, [r0]
	cmp r0, #2
	bne _02023FDA
	add r0, r1, #0
	add r0, #0xb0
	add r1, #0xb8
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_02020764
_02023FDA:
	pop {r3, pc}
	thumb_func_end sub_02023FC0

	thumb_func_start sub_02023FDC
sub_02023FDC: ; 0x02023FDC
	add r0, #0x88
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02023FDC

	thumb_func_start sub_02023FE4
sub_02023FE4: ; 0x02023FE4
	str r2, [r0, #0x1c]
	str r1, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02023FE4

	thumb_func_start sub_02023FEC
sub_02023FEC: ; 0x02023FEC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xb8
	ldr r1, [r1]
	add r0, #0xa0
	lsl r1, r1, #4
	lsr r1, r1, #0x10
	bl sub_02026DE0
	add r2, sp, #0
	strb r0, [r2]
	lsr r0, r0, #8
	strb r0, [r2, #1]
	ldrb r0, [r2]
	add r1, r4, #0
	add r1, #0x90
	strb r0, [r2, #2]
	ldrb r0, [r2, #1]
	strb r0, [r2, #3]
	add r0, r4, #0
	add r0, #0x88
	ldrb r2, [r2, #2]
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0202403C
	add r0, r4, #0
	add r2, sp, #0
	add r0, #0x88
	add r4, #0x90
	ldrb r2, [r2, #3]
	ldr r0, [r0]
	ldr r1, [r4]
	bl sub_02024140
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02023FEC

	thumb_func_start sub_0202403C
sub_0202403C: ; 0x0202403C
	push {r3, r4, r5, r6, r7, lr}
	cmp r0, #0
	beq _0202404C
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _0202404C
	add r6, r0, r3
	b _0202404E
_0202404C:
	mov r6, #0
_0202404E:
	ldrh r0, [r6]
	add r4, r6, r0
	cmp r1, #0
	beq _0202407C
	add r0, r1, #0
	add r0, #0x3c
	beq _02024078
	add r3, r1, #0
	add r3, #0x3d
	ldrb r3, [r3]
	cmp r2, r3
	bhs _02024078
	add r1, #0x42
	ldrh r1, [r1]
	add r3, r0, r1
	ldrh r0, [r0, r1]
	add r3, r3, #4
	add r1, r0, #0
	mul r1, r2
	add r0, r3, r1
	b _0202407E
_02024078:
	mov r0, #0
	b _0202407E
_0202407C:
	mov r0, #0
_0202407E:
	ldr r0, [r0]
	mov r5, #0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldrb r0, [r4, #1]
	cmp r0, #0
	ble _020240C0
_0202408C:
	cmp r4, #0
	beq _020240A6
	ldrb r0, [r4, #1]
	cmp r5, r0
	bhs _020240A6
	ldrh r0, [r4, #6]
	add r1, r4, r0
	ldrh r0, [r4, r0]
	add r2, r1, #4
	add r1, r0, #0
	mul r1, r5
	add r1, r2, r1
	b _020240A8
_020240A6:
	mov r1, #0
_020240A8:
	ldrb r2, [r1, #3]
	mov r0, #1
	tst r0, r2
	beq _020240B8
	add r0, r6, #0
	add r2, r7, #0
	bl sub_020240C4
_020240B8:
	ldrb r0, [r4, #1]
	add r5, r5, #1
	cmp r5, r0
	blt _0202408C
_020240C0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202403C

	thumb_func_start sub_020240C4
sub_020240C4: ; 0x020240C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	ldrh r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	add r0, r5, r0
	str r0, [sp, #8]
	add r0, r1, #0
	ldrb r0, [r0, #2]
	mov r6, #0
	cmp r0, #0
	ble _02024136
	add r7, r5, #4
_020240E2:
	ldr r0, [sp, #8]
	cmp r5, #0
	ldrb r0, [r0, r6]
	beq _0202410E
	cmp r7, #0
	beq _02024102
	ldrb r1, [r5, #5]
	cmp r0, r1
	bhs _02024102
	ldrh r1, [r5, #0xa]
	add r2, r7, r1
	ldrh r1, [r7, r1]
	add r2, r2, #4
	mul r0, r1
	add r0, r2, r0
	b _02024104
_02024102:
	mov r0, #0
_02024104:
	cmp r0, #0
	beq _0202410E
	ldr r0, [r0]
	add r4, r5, r0
	b _02024110
_0202410E:
	mov r4, #0
_02024110:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [sp, #4]
	add r1, r1, r0
	ldr r0, _0202413C ; =0x0000FFFF
	cmp r1, r0
	bls _02024124
	bl GF_AssertFail
_02024124:
	ldr r1, [r4, #0x14]
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r0, [sp]
	ldrb r0, [r0, #2]
	cmp r6, r0
	blt _020240E2
_02024136:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0202413C: .word 0x0000FFFF
	thumb_func_end sub_020240C4

	thumb_func_start sub_02024140
sub_02024140: ; 0x02024140
	push {r3, r4, r5, r6, r7, lr}
	cmp r0, #0
	beq _02024150
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _02024150
	add r6, r0, r3
	b _02024152
_02024150:
	mov r6, #0
_02024152:
	ldrh r0, [r6, #2]
	add r4, r6, r0
	cmp r1, #0
	beq _0202417E
	ldrh r0, [r1, #0x34]
	cmp r0, #0
	beq _0202417E
	add r0, r1, r0
	beq _0202417A
	ldrb r1, [r0, #1]
	cmp r2, r1
	bhs _0202417A
	ldrh r1, [r0, #6]
	add r3, r0, r1
	ldrh r0, [r0, r1]
	add r3, r3, #4
	add r1, r0, #0
	mul r1, r2
	add r0, r3, r1
	b _02024180
_0202417A:
	mov r0, #0
	b _02024180
_0202417E:
	mov r0, #0
_02024180:
	ldrh r1, [r0, #2]
	ldrh r7, [r0]
	mov r0, #1
	tst r0, r1
	bne _0202418C
	lsr r7, r7, #1
_0202418C:
	ldrb r0, [r4, #1]
	mov r5, #0
	cmp r0, #0
	bls _020241C8
_02024194:
	cmp r4, #0
	beq _020241AE
	ldrb r0, [r4, #1]
	cmp r5, r0
	bhs _020241AE
	ldrh r0, [r4, #6]
	add r1, r4, r0
	ldrh r0, [r4, r0]
	add r2, r1, #4
	add r1, r0, #0
	mul r1, r5
	add r1, r2, r1
	b _020241B0
_020241AE:
	mov r1, #0
_020241B0:
	ldrb r2, [r1, #3]
	mov r0, #1
	tst r0, r2
	beq _020241C0
	add r0, r6, #0
	add r2, r7, #0
	bl sub_020241CC
_020241C0:
	ldrb r0, [r4, #1]
	add r5, r5, #1
	cmp r5, r0
	blo _02024194
_020241C8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02024140

	thumb_func_start sub_020241CC
sub_020241CC: ; 0x020241CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	ldrh r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	add r0, r5, r0
	str r0, [sp, #8]
	add r0, r1, #0
	ldrb r0, [r0, #2]
	mov r6, #0
	cmp r0, #0
	bls _0202423E
	add r7, r5, #4
_020241EA:
	ldr r0, [sp, #8]
	cmp r5, #0
	ldrb r0, [r0, r6]
	beq _02024216
	cmp r7, #0
	beq _0202420A
	ldrb r1, [r5, #5]
	cmp r0, r1
	bhs _0202420A
	ldrh r1, [r5, #0xa]
	add r2, r7, r1
	ldrh r1, [r7, r1]
	add r2, r2, #4
	mul r0, r1
	add r0, r2, r0
	b _0202420C
_0202420A:
	mov r0, #0
_0202420C:
	cmp r0, #0
	beq _02024216
	ldr r0, [r0]
	add r4, r5, r0
	b _02024218
_02024216:
	mov r4, #0
_02024218:
	ldrh r1, [r4, #0x1c]
	ldr r0, _02024244 ; =0x00001FFF
	and r1, r0
	ldr r0, [sp, #4]
	add r1, r1, r0
	ldr r0, _02024244 ; =0x00001FFF
	cmp r1, r0
	bls _0202422C
	bl GF_AssertFail
_0202422C:
	ldrh r1, [r4, #0x1c]
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r1, r0
	strh r0, [r4, #0x1c]
	ldr r0, [sp]
	ldrb r0, [r0, #2]
	cmp r6, r0
	blo _020241EA
_0202423E:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02024244: .word 0x00001FFF
	thumb_func_end sub_020241CC

	thumb_func_start sub_02024248
sub_02024248: ; 0x02024248
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	mov r7, #0
	cmp r0, #0
	ble _02024278
	add r4, r7, #0
	add r6, r7, #0
_02024258:
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl sub_020236BC
	ldr r0, [r5, #4]
	add r7, r7, #1
	add r1, r0, r4
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r4, #0xc4
	str r1, [r0, r6]
	ldr r0, [r5, #8]
	add r6, r6, #4
	cmp r7, r0
	blt _02024258
_02024278:
	mov r0, #0
	add r5, #0xd4
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02024248

	thumb_func_start sub_02024280
sub_02024280: ; 0x02024280
	add r1, r0, #0
	add r1, #0xd4
	ldr r3, [r1]
	ldr r1, [r0, #8]
	cmp r3, r1
	blt _02024290
	mov r0, #0
	bx lr
_02024290:
	add r1, r0, #0
	add r1, #0xd0
	ldr r2, [r1]
	lsl r1, r3, #2
	ldr r2, [r2, r1]
	add r1, r0, #0
	add r1, #0xd4
	ldr r1, [r1]
	add r0, #0xd4
	add r1, r1, #1
	str r1, [r0]
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02024280

	thumb_func_start sub_020242AC
sub_020242AC: ; 0x020242AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xd4
	ldr r0, [r0]
	add r4, r1, #0
	cmp r0, #0
	bgt _020242BE
	mov r0, #0
	pop {r3, r4, r5, pc}
_020242BE:
	add r0, r4, #0
	bl sub_020236BC
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xd0
	add r5, #0xd4
	ldr r1, [r0]
	ldr r0, [r5]
	lsl r0, r0, #2
	str r4, [r1, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020242AC

	thumb_func_start sub_020242E4
sub_020242E4: ; 0x020242E4
	add r2, r0, #0
	add r2, #0xc0
	ldr r3, [r2]
	add r2, r1, #0
	add r2, #0xc0
	str r3, [r2]
	add r2, r0, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r2, #0xbc
	str r1, [r2]
	add r2, r1, #0
	add r2, #0xbc
	str r0, [r2]
	add r0, #0xc0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020242E4

	thumb_func_start sub_02024308
sub_02024308: ; 0x02024308
	add r1, r0, #0
	add r1, #0xbc
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r1, #0xbc
	str r2, [r1]
	add r1, r0, #0
	add r0, #0xbc
	add r1, #0xc0
	ldr r0, [r0]
	ldr r1, [r1]
	add r0, #0xc0
	str r1, [r0]
	bx lr
	thumb_func_end sub_02024308

	thumb_func_start sub_02024328
sub_02024328: ; 0x02024328
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0
	add r5, r2, #0
	bl sub_0202443C
	add r7, r0, #0
	bl NNS_G3dGetMdlSet
	add r4, r0, #0
	beq _0202435E
	add r1, r4, #0
	add r1, #8
	beq _02024352
	ldrb r0, [r4, #9]
	cmp r0, #0
	bls _02024352
	ldrh r0, [r4, #0xe]
	add r0, r1, r0
	add r0, r0, #4
	b _02024354
_02024352:
	mov r0, #0
_02024354:
	cmp r0, #0
	beq _0202435E
	ldr r0, [r0]
	add r0, r4, r0
	b _02024360
_0202435E:
	mov r0, #0
_02024360:
	str r0, [r6]
	cmp r5, #0
	beq _0202436E
	add r0, r7, #0
	bl NNS_G3dGetTex
	str r0, [r5]
_0202436E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02024328

	thumb_func_start sub_02024374
sub_02024374: ; 0x02024374
	ldr r3, _0202437C ; =sub_0202443C
	mov r1, #1
	bx r3
	nop
_0202437C: .word sub_0202443C
	thumb_func_end sub_02024374

	thumb_func_start sub_02024380
sub_02024380: ; 0x02024380
	push {r3, lr}
	ldr r2, [r1, #0x1c]
	cmp r2, #0
	bne _0202438E
	bl sub_020239D0
	pop {r3, pc}
_0202438E:
	bl sub_02023A20
	pop {r3, pc}
	thumb_func_end sub_02024380

	thumb_func_start sub_02024394
sub_02024394: ; 0x02024394
	push {r3, lr}
	ldr r0, [r0, #0x2c]
	bl sub_02024454
	ldr r0, [r0]
	lsl r0, r0, #0xc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02024394

	thumb_func_start sub_020243A4
sub_020243A4: ; 0x020243A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r1, #0xb6
	ldrh r1, [r1]
	ldr r0, [r5, #0x2c]
	bl sub_02024454
	add r5, #0xb8
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020243C4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020243A4

	thumb_func_start sub_020243C4
sub_020243C4: ; 0x020243C4
	push {r3, r4, r5, r6}
	ldr r4, [r0]
	ldr r6, [r1]
	lsl r4, r4, #0xc
	mov r3, #0
	cmp r4, r6
	bgt _020243DA
	ldr r5, [r0, #4]
	lsl r5, r5, #0xc
	cmp r5, r6
	bge _020243DE
_020243DA:
	str r4, [r1]
	b _020243F6
_020243DE:
	add r2, r6, r2
	cmp r5, r2
	bge _020243F4
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020243EE
	str r4, [r1]
	b _020243F6
_020243EE:
	mov r3, #1
	str r5, [r1]
	b _020243F6
_020243F4:
	str r2, [r1]
_020243F6:
	add r0, r3, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_020243C4

	thumb_func_start sub_020243FC
sub_020243FC: ; 0x020243FC
	push {r3, lr}
	add r3, r0, #0
	add r0, #0x9c
	str r0, [sp]
	add r0, r3, #0
	add r1, r3, #0
	add r2, r3, #0
	add r0, #0x8c
	add r1, #0x84
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, #0x94
	add r3, #0x98
	bl sub_02023B4C
	pop {r3, pc}
	thumb_func_end sub_020243FC

	thumb_func_start sub_0202441C
sub_0202441C: ; 0x0202441C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x84
	ldr r0, [r0]
	bl NNS_G3dReleaseMdlSet
	add r4, #0x8c
	ldr r0, [r4]
	add r1, sp, #4
	add r2, sp, #8
	add r3, sp, #0
	bl sub_02023B38
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0202441C

	thumb_func_start sub_0202443C
sub_0202443C: ; 0x0202443C
	cmp r1, #0
	beq _02024446
	cmp r1, #1
	beq _0202444A
	b _0202444E
_02024446:
	ldr r0, [r0]
	bx lr
_0202444A:
	ldr r0, [r0, #4]
	bx lr
_0202444E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202443C

	thumb_func_start sub_02024454
sub_02024454: ; 0x02024454
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	bx lr
	thumb_func_end sub_02024454
