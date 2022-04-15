	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov91_0225C540
ov91_0225C540: ; 0x0225C540
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x6a
	lsl r2, r0, #0x11
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0x88
	mov r2, #0x6a
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x88
	add r4, r0, #0
	bl memset
	str r5, [sp]
	add r1, r5, #0
	add r1, #0x39
	ldr r2, [r5, #0x34]
	add r5, #0x38
	add r0, r4, #0
	ldrb r1, [r1]
	ldrb r3, [r5]
	add r0, #8
	bl ov90_02258800
	add r0, r4, #0
	mov r1, #0x6a
	bl ov91_0225CBE4
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225C540

	thumb_func_start ov91_0225C58C
ov91_0225C58C: ; 0x0225C58C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r6, r0, #0
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	add r6, r0, #0
	add r0, r4, #0
	add r0, #8
	bl ov90_02258B54
	cmp r0, #1
	bne _0225C60A
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _0225C5BE
	cmp r0, #1
	beq _0225C5D8
	cmp r0, #2
	beq _0225C5EC
	b _0225C5FA
_0225C5BE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225C5CA
	bl sub_0200FB70
_0225C5CA:
	mov r0, #0
	bl sub_0200FC20
	ldr r0, [r4, #0x78]
	add r0, r0, #1
	str r0, [r4, #0x78]
	b _0225C604
_0225C5D8:
	add r0, r4, #0
	add r0, #8
	bl ov90_02258B98
	cmp r0, #1
	bne _0225C604
	ldr r0, [r4, #0x78]
	add r0, r0, #1
	str r0, [r4, #0x78]
	b _0225C604
_0225C5EC:
	add r0, r4, #0
	add r1, r6, #0
	bl ov91_0225CC4C
	add sp, #0x28
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225C5FA:
	bl GF_AssertFail
	add sp, #0x28
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225C604:
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_0225C60A:
	ldr r0, [r5]
	cmp r0, #0xf
	bhi _0225C67E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225C61C: ; jump table
	.short _0225C63C - _0225C61C - 2 ; case 0
	.short _0225C650 - _0225C61C - 2 ; case 1
	.short _0225C674 - _0225C61C - 2 ; case 2
	.short _0225C77E - _0225C61C - 2 ; case 3
	.short _0225C7A8 - _0225C61C - 2 ; case 4
	.short _0225C7E0 - _0225C61C - 2 ; case 5
	.short _0225C7F6 - _0225C61C - 2 ; case 6
	.short _0225C80A - _0225C61C - 2 ; case 7
	.short _0225C88C - _0225C61C - 2 ; case 8
	.short _0225C8CE - _0225C61C - 2 ; case 9
	.short _0225C8E6 - _0225C61C - 2 ; case 10
	.short _0225C8FA - _0225C61C - 2 ; case 11
	.short _0225C922 - _0225C61C - 2 ; case 12
	.short _0225C94C - _0225C61C - 2 ; case 13
	.short _0225C99C - _0225C61C - 2 ; case 14
	.short _0225C9BE - _0225C61C - 2 ; case 15
_0225C63C:
	add r0, r4, #0
	add r0, #8
	mov r1, #0x6a
	bl ov90_02258914
	str r0, [r4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C650:
	ldr r0, [r4]
	bl ov90_022589BC
	cmp r0, #1
	bne _0225C67E
	ldr r0, [r4]
	bl ov90_022589CC
	str r0, [r4, #0x70]
	ldr r0, [r4]
	bl ov90_02258938
	mov r0, #0
	str r0, [r4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C674:
	ldr r0, _0225C940 ; =gSystem
	ldr r1, [r0, #0x44]
	mov r0, #1
	tst r0, r1
	beq _0225C680
_0225C67E:
	b _0225C9E6
_0225C680:
	ldr r0, _0225C944 ; =ov91_0225CB58
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r2, #0
	str r2, [r4, #0x38]
	str r2, [r4, #0x3c]
	add r0, r4, #0
	add r1, r4, #0
	str r2, [r4, #0x40]
	add r0, #0x84
	strb r2, [r0]
	add r1, #0x84
	strb r2, [r1, #1]
	strb r2, [r1, #2]
	strb r2, [r1, #3]
	mov r0, #0x20
	mov r1, #0x6a
	bl GF_CreateVramTransferManager
	add r0, r4, #0
	bl ov91_02261B2C
	add r0, r4, #0
	mov r1, #1
	add r0, #0x80
	str r1, [r0]
	bl sub_020347A0
	str r0, [r4, #0x74]
	cmp r0, #1
	bhi _0225C6C8
	bl GF_AssertFail
_0225C6C8:
	bl sub_0203769C
	add r1, r4, #0
	add r1, #0x44
	strh r0, [r1]
	add r1, r4, #0
	add r1, #0x44
	add r0, r4, #0
	ldrh r1, [r1]
	add r0, #8
	bl ov90_0225886C
	add r1, r4, #0
	add r1, #0x46
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225C706
	mov r1, #0x4b
	add r3, r4, #0
	ldr r2, [r4, #0x74]
	mov r0, #0x6a
	lsl r1, r1, #4
	add r3, #0x48
	bl ov91_0225CCC4
	str r0, [r4, #0x30]
	mov r0, #1
	str r0, [r4, #0x7c]
_0225C706:
	add r0, r4, #0
	add r0, #0x48
	str r0, [sp]
	add r3, r4, #0
	add r3, #0x46
	mov r1, #0x4b
	ldrh r3, [r3]
	ldr r2, [r4, #0x74]
	mov r0, #0x6a
	lsl r1, r1, #4
	bl ov91_0225CDF4
	str r0, [r4, #0x34]
	bl sub_0203A880
	add r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _0225C732
	mov r0, #0x6a
	bl ov00_021E69A8
_0225C732:
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _0225C742
	cmp r0, #1
	beq _0225C74C
	cmp r0, #2
	beq _0225C758
	b _0225C764
_0225C742:
	mov r1, #0
	add r0, sp, #0xc
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	b _0225C768
_0225C74C:
	mov r1, #0
	add r0, sp, #0xc
	strb r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #9]
	b _0225C768
_0225C758:
	mov r1, #1
	add r0, sp, #0xc
	strb r1, [r0, #8]
	mov r1, #0
	strb r1, [r0, #9]
	b _0225C768
_0225C764:
	bl GF_AssertFail
_0225C768:
	ldr r0, [r4, #0x34]
	add r1, sp, #0x14
	bl ov91_0225D3C4
	mov r0, #1
	bl sub_02037AC0
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C77E:
	mov r0, #1
	bl sub_02037B38
	cmp r0, #0
	beq _0225C7CE
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6a
	mov r1, #0x1b
	str r0, [sp, #8]
	ldr r3, _0225C948 ; =0x0000FFFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C7A8:
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl ov91_0225CEB4
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225C7CE
	add r4, #0x44
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225C7D8
	mov r1, #0
	mov r0, #0x16
	add r2, r1, #0
	bl sub_02037030
	cmp r0, #0
	bne _0225C7D0
_0225C7CE:
	b _0225C9E6
_0225C7D0:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C7D8:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C7E0:
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl ov91_0225CEB4
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0225C8DC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C7F6:
	ldr r0, [r4, #0x34]
	mov r1, #1
	bl ov91_0225CEB4
	cmp r0, #0
	bne _0225C8DC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C80A:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0225C82E
	ldr r0, [r4, #0x34]
	bl ov91_0225D37C
	str r0, [sp, #0x10]
	mov r0, #0x19
	add r1, sp, #0x10
	mov r2, #4
	bl sub_02037030
	cmp r0, #0
	beq _0225C8DC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C82E:
	add r0, r4, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225C878
	ldr r0, [r4, #0x30]
	bl ov91_0225CCF4
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	bl ov91_0225CD5C
	cmp r0, #0
	beq _0225C868
	ldr r0, [r4, #0x30]
	bl ov91_0225CD6C
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x1b
	add r2, sp, #0xc
	mov r3, #4
	bl ov91_0225CCA8
	cmp r0, #1
	bne _0225C868
	ldr r0, [r4, #0x30]
	bl ov91_0225CD64
_0225C868:
	cmp r5, #0
	bne _0225C878
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x17
	add r3, r2, #0
	bl ov91_0225CCA8
_0225C878:
	ldr r0, [r4, #0x34]
	bl ov91_0225D1DC
	add r0, r4, #0
	bl ov91_0225CB64
	add r0, r4, #0
	bl ov91_0225CB98
	b _0225C9E6
_0225C88C:
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl ov91_0225D078
	add r0, r4, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225C8C6
	ldr r0, [r4, #0x30]
	bl ov91_0225CDAC
	cmp r0, #1
	bne _0225C8DC
	ldr r0, [r4, #0x30]
	add r1, sp, #0x18
	bl ov91_0225CDC4
	mov r0, #0x1a
	add r1, sp, #0x18
	mov r2, #0x10
	bl sub_02037030
	cmp r0, #0
	beq _0225C8DC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C8C6:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C8CE:
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl ov91_0225D078
	ldr r0, [r4, #0x40]
	cmp r0, #1
	beq _0225C8DE
_0225C8DC:
	b _0225C9E6
_0225C8DE:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C8E6:
	ldr r0, [r4, #0x34]
	mov r1, #1
	bl ov91_0225D078
	cmp r0, #0
	bne _0225C9E6
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C8FA:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6a
	mov r1, #0x1a
	str r0, [sp, #8]
	ldr r3, _0225C948 ; =0x0000FFFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #0x34]
	mov r1, #1
	bl ov91_0225D078
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C922:
	ldr r0, [r4, #0x34]
	mov r1, #1
	bl ov91_0225D078
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225C9E6
	mov r0, #3
	bl sub_02037AC0
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
	.balign 4, 0
_0225C940: .word gSystem
_0225C944: .word ov91_0225CB58
_0225C948: .word 0x0000FFFF
_0225C94C:
	mov r0, #3
	bl sub_02037B38
	cmp r0, #0
	bne _0225C95C
	add sp, #0x28
	mov r0, #0
	pop {r4, r5, r6, pc}
_0225C95C:
	add r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _0225C968
	bl ov00_021E6A4C
_0225C968:
	add r0, r4, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225C97C
	ldr r0, [r4, #0x30]
	bl ov91_0225CCEC
	mov r0, #0
	str r0, [r4, #0x30]
_0225C97C:
	ldr r0, [r4, #0x34]
	bl ov91_0225CE80
	mov r0, #0
	str r0, [r4, #0x34]
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GF_DestroyVramTransferManager
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C99C:
	ldrb r1, [r4, #0x10]
	add r0, r4, #0
	add r0, #0x18
	bl ov90_02258AA8
	add r0, r4, #0
	add r1, r4, #0
	add r0, #8
	add r1, #0x18
	mov r2, #0x6a
	bl ov90_022589E0
	str r0, [r4, #4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225C9E6
_0225C9BE:
	ldr r0, [r4, #4]
	bl ov90_02258AA0
	cmp r0, #1
	bne _0225C9E6
	ldr r0, [r4, #4]
	bl ov90_02258AA4
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl ov90_02258A04
	mov r0, #0
	str r0, [r4, #4]
	cmp r6, #0
	bne _0225C9E4
	add sp, #0x28
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225C9E4:
	str r0, [r5]
_0225C9E6:
	mov r0, #0
	add sp, #0x28
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_0225C58C

	thumb_func_start ov91_0225C9EC
ov91_0225C9EC: ; 0x0225C9EC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl OverlayManager_GetData
	add r6, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r4]
	cmp r0, #0
	beq _0225CA0A
	cmp r0, #1
	beq _0225CA44
	b _0225CA60
_0225CA0A:
	add r0, r6, #0
	add r0, #8
	bl ov90_02258B54
	add r7, r0, #0
	add r0, r6, #0
	bl ov91_0225CC38
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x6a
	bl DestroyHeap
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	cmp r7, #1
	bne _0225CA36
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225CA36:
	mov r0, #4
	bl sub_02037AC0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225CA60
_0225CA44:
	mov r0, #4
	bl sub_02037B38
	cmp r0, #0
	bne _0225CA5C
	bl sub_02037454
	add r4, r0, #0
	bl sub_020347A0
	cmp r4, r0
	bge _0225CA60
_0225CA5C:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225CA60:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225C9EC

	thumb_func_start ov91_0225CA64
ov91_0225CA64: ; 0x0225CA64
	mov r1, #1
	str r1, [r0, #0x38]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225CA64

	thumb_func_start ov91_0225CA6C
ov91_0225CA6C: ; 0x0225CA6C
	mov r1, #1
	str r1, [r0, #0x3c]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225CA6C

	thumb_func_start ov91_0225CA74
ov91_0225CA74: ; 0x0225CA74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, #8
	add r1, r2, #0
	bl ov90_0225886C
	add r2, r0, #0
	ldr r0, [r5, #0x30]
	add r1, r4, #0
	bl ov91_0225CD74
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225CA74

	thumb_func_start ov91_0225CA90
ov91_0225CA90: ; 0x0225CA90
	ldr r3, _0225CA98 ; =ov91_0225D2EC
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0225CA98: .word ov91_0225D2EC
	thumb_func_end ov91_0225CA90

	thumb_func_start ov91_0225CA9C
ov91_0225CA9C: ; 0x0225CA9C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, #8
	add r1, r2, #0
	bl ov90_0225886C
	add r2, r0, #0
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _0225CAB8
	add r1, r4, #0
	bl ov91_0225CD84
_0225CAB8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225CA9C

	thumb_func_start ov91_0225CABC
ov91_0225CABC: ; 0x0225CABC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	add r4, r1, #0
	bl ov91_0225D368
	mov r0, #1
	str r0, [r5, #0x40]
	mov r1, #0
_0225CACE:
	ldr r0, [r4]
	add r1, r1, #1
	str r0, [r5, #0x18]
	add r4, r4, #4
	add r5, r5, #4
	cmp r1, #4
	blt _0225CACE
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225CABC

	thumb_func_start ov91_0225CAE0
ov91_0225CAE0: ; 0x0225CAE0
	ldr r3, _0225CAE8 ; =ov91_0225D380
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0225CAE8: .word ov91_0225D380
	thumb_func_end ov91_0225CAE0

	thumb_func_start ov91_0225CAEC
ov91_0225CAEC: ; 0x0225CAEC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, #8
	add r1, r2, #0
	bl ov90_0225886C
	add r4, r0, #0
	ldr r0, [r5, #0x34]
	add r1, r6, #0
	add r2, r4, #0
	bl ov91_0225D3B4
	add r1, r5, #0
	add r1, #0x84
	ldrb r0, [r1, r4]
	add r0, r0, #1
	strb r0, [r1, r4]
	add r0, r5, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225CB4E
	ldr r3, [r5, #0x74]
	mov r1, #1
	mov r0, #0
	cmp r3, #0
	bls _0225CB3A
	ldr r2, [r5, #0x7c]
	add r6, r0, #0
_0225CB28:
	add r4, r5, r0
	add r4, #0x84
	ldrb r4, [r4]
	cmp r2, r4
	bls _0225CB34
	add r1, r6, #0
_0225CB34:
	add r0, r0, #1
	cmp r0, r3
	blo _0225CB28
_0225CB3A:
	cmp r1, #1
	bne _0225CB4E
	ldr r0, [r5, #0x7c]
	mov r1, #0
	add r0, r0, #1
	str r0, [r5, #0x7c]
	mov r0, #0x1d
	add r2, r1, #0
	bl sub_02037030
_0225CB4E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_0225CAEC

	thumb_func_start ov91_0225CB50
ov91_0225CB50: ; 0x0225CB50
	mov r1, #1
	add r0, #0x80
	str r1, [r0]
	bx lr
	thumb_func_end ov91_0225CB50

	thumb_func_start ov91_0225CB58
ov91_0225CB58: ; 0x0225CB58
	ldr r3, _0225CB60 ; =ov91_0225D2D0
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0225CB60: .word ov91_0225D2D0
	thumb_func_end ov91_0225CB58

	thumb_func_start ov91_0225CB64
ov91_0225CB64: ; 0x0225CB64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	add r1, sp, #0
	bl ov91_0225D32C
	cmp r0, #1
	bne _0225CB94
	mov r6, #0x18
	add r4, sp, #0
	mov r7, #0x14
_0225CB7C:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov91_0225CCA8
	ldr r0, [r5, #0x34]
	add r1, r4, #0
	bl ov91_0225D32C
	cmp r0, #1
	beq _0225CB7C
_0225CB94:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225CB64

	thumb_func_start ov91_0225CB98
ov91_0225CB98: ; 0x0225CB98
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov91_0225D2E8
	cmp r0, #0
	beq _0225CBDE
	mov r1, #0x1e
	bl _s32_div_f
	cmp r1, #0
	bne _0225CBDE
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	bne _0225CBDE
	ldr r0, [r4, #0x34]
	bl ov91_0225D37C
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x1c
	add r2, sp, #0
	mov r3, #4
	bl ov91_0225CCA8
	cmp r0, #0
	bne _0225CBD8
	bl GF_AssertFail
_0225CBD8:
	mov r0, #0
	add r4, #0x80
	str r0, [r4]
_0225CBDE:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225CB98

	thumb_func_start ov91_0225CBE4
ov91_0225CBE4: ; 0x0225CBE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r3, r1, #0
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	mov r0, #0xd4
	add r2, r1, #0
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	str r0, [r7, #0x4c]
	ldr r0, [sp, #8]
	mov r1, #0x18
	bl _u32_div_f
	str r0, [r7, #0x48]
	ldrb r0, [r7, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _0225CC34
	add r6, r7, #0
	add r5, r7, #0
	add r6, #8
_0225CC16:
	add r0, r6, #0
	add r1, r4, #0
	bl ov90_022588CC
	str r0, [r5, #0x50]
	add r0, r6, #0
	add r1, r4, #0
	bl ov90_022588A4
	str r0, [r5, #0x60]
	ldrb r0, [r7, #0x10]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0225CC16
_0225CC34:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225CBE4

	thumb_func_start ov91_0225CC38
ov91_0225CC38: ; 0x0225CC38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x4c]
	str r0, [r4, #0x48]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225CC38

	thumb_func_start ov91_0225CC4C
ov91_0225CC4C: ; 0x0225CC4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	ldr r0, [r5]
	cmp r0, #0
	beq _0225CC6C
	bl ov90_02258938
	mov r0, #0
	str r0, [r5]
_0225CC6C:
	ldr r0, [r5, #0x34]
	cmp r0, #0
	beq _0225CC8C
	add r0, r5, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0225CC82
	ldr r0, [r5, #0x30]
	bl ov91_0225CCEC
_0225CC82:
	ldr r0, [r5, #0x34]
	bl ov91_0225CE80
	bl GF_DestroyVramTransferManager
_0225CC8C:
	add r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _0225CC98
	bl ov00_021E6A4C
_0225CC98:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0225CCA6
	bl ov90_02258A04
	mov r0, #0
	str r0, [r5, #4]
_0225CCA6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov91_0225CC4C

	thumb_func_start ov91_0225CCA8
ov91_0225CCA8: ; 0x0225CCA8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bne _0225CCB6
	mov r0, #0
	pop {r3, pc}
_0225CCB6:
	add r0, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	bl sub_02037030
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov91_0225CCA8

	thumb_func_start ov91_0225CCC4
ov91_0225CCC4: ; 0x0225CCC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x38
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x38
	bl memset
	str r5, [r4]
	str r6, [r4, #8]
	str r7, [r4, #0x30]
	mov r0, #1
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_0225CCC4

	thumb_func_start ov91_0225CCEC
ov91_0225CCEC: ; 0x0225CCEC
	ldr r3, _0225CCF0 ; =FreeToHeap
	bx r3
	.balign 4, 0
_0225CCF0: .word FreeToHeap
	thumb_func_end ov91_0225CCEC

	thumb_func_start ov91_0225CCF4
ov91_0225CCF4: ; 0x0225CCF4
	push {r4, r5, r6, r7}
	ldr r2, [r0]
	cmp r2, #0
	ble _0225CD06
	ldr r1, [r0, #4]
	cmp r1, #1
	bne _0225CD06
	sub r1, r2, #1
	str r1, [r0]
_0225CD06:
	ldr r1, [r0]
	cmp r1, #0
	bgt _0225CD12
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_0225CD12:
	add r1, r0, #0
	add r1, #0x36
	ldrb r4, [r1]
	ldr r5, [r0, #0x30]
	ldr r2, [r5]
	add r1, r4, #0
	add r3, r4, #0
	cmp r4, r2
	bhs _0225CD3E
	ldr r6, [r5, #4]
	mov r5, #0x18
	mul r5, r4
	ldrh r7, [r0, #0x34]
	add r6, r6, r5
_0225CD2E:
	ldr r5, [r6]
	cmp r5, r7
	bge _0225CD3E
	add r1, r1, #1
	add r6, #0x18
	add r3, r1, #0
	cmp r1, r2
	blo _0225CD2E
_0225CD3E:
	cmp r3, r2
	bne _0225CD44
	sub r1, r1, #1
_0225CD44:
	cmp r1, r4
	beq _0225CD54
	add r2, r0, #0
	add r2, #0x36
	strb r1, [r2]
	mov r1, #1
	add r0, #0x37
	strb r1, [r0]
_0225CD54:
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225CCF4

	thumb_func_start ov91_0225CD5C
ov91_0225CD5C: ; 0x0225CD5C
	add r0, #0x37
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225CD5C

	thumb_func_start ov91_0225CD64
ov91_0225CD64: ; 0x0225CD64
	mov r1, #0
	add r0, #0x37
	strb r1, [r0]
	bx lr
	thumb_func_end ov91_0225CD64

	thumb_func_start ov91_0225CD6C
ov91_0225CD6C: ; 0x0225CD6C
	add r0, #0x36
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225CD6C

	thumb_func_start ov91_0225CD74
ov91_0225CD74: ; 0x0225CD74
	ldrh r1, [r1, #2]
	cmp r1, #0
	beq _0225CD80
	ldrh r1, [r0, #0x34]
	add r1, r1, #1
	strh r1, [r0, #0x34]
_0225CD80:
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225CD74

	thumb_func_start ov91_0225CD84
ov91_0225CD84: ; 0x0225CD84
	push {r3, r4}
	ldr r3, _0225CDA8 ; =0x0001869F
	cmp r1, r3
	bls _0225CD8E
	add r1, r3, #0
_0225CD8E:
	mov r3, #1
	lsl r3, r2
	ldr r4, [r0, #0x1c]
	tst r4, r3
	bne _0225CDA4
	lsl r2, r2, #2
	add r2, r0, r2
	str r1, [r2, #0xc]
	ldr r1, [r0, #0x1c]
	orr r1, r3
	str r1, [r0, #0x1c]
_0225CDA4:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0225CDA8: .word 0x0001869F
	thumb_func_end ov91_0225CD84

	thumb_func_start ov91_0225CDAC
ov91_0225CDAC: ; 0x0225CDAC
	push {r4, lr}
	add r4, r0, #0
	bl ov91_0225CDD4
	ldr r1, [r4, #8]
	cmp r0, r1
	blo _0225CDBE
	mov r0, #1
	pop {r4, pc}
_0225CDBE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225CDAC

	thumb_func_start ov91_0225CDC4
ov91_0225CDC4: ; 0x0225CDC4
	add r2, r0, #0
	add r3, r1, #0
	add r2, #0xc
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	bx lr
	thumb_func_end ov91_0225CDC4

	thumb_func_start ov91_0225CDD4
ov91_0225CDD4: ; 0x0225CDD4
	push {r3, r4}
	mov r3, #0
	ldr r4, [r0, #0x1c]
	add r2, r3, #0
	mov r0, #1
_0225CDDE:
	add r1, r0, #0
	lsl r1, r2
	tst r1, r4
	beq _0225CDE8
	add r3, r3, #1
_0225CDE8:
	add r2, r2, #1
	cmp r2, #4
	blt _0225CDDE
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov91_0225CDD4

	thumb_func_start ov91_0225CDF4
ov91_0225CDF4: ; 0x0225CDF4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	ldr r1, _0225CE64 ; =0x000087E8
	add r5, r0, #0
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	ldr r2, _0225CE64 ; =0x000087E8
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #1
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	str r6, [r4, #0xc]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, _0225CE68 ; =0x0000877C
	str r1, [r4, r0]
	ldr r1, _0225CE6C ; =0x000019CC
	add r0, r4, #0
	add r1, r4, r1
	bl ov91_0225DC3C
	add r0, r4, #0
	add r1, r5, #0
	bl ov91_0225F508
	ldr r0, _0225CE70 ; =0x0000878C
	ldr r1, _0225CE74 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	add r2, r5, #0
	bl ov91_0225F0C0
	ldr r0, _0225CE78 ; =0x000087CC
	add r0, r4, r0
	bl ov91_0225F388
	ldr r0, _0225CE7C ; =ov91_022627C0
	mov r1, #8
	mov r2, #4
	bl sub_020210D8
	cmp r0, #1
	beq _0225CE5E
	bl GF_AssertFail
_0225CE5E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CE64: .word 0x000087E8
_0225CE68: .word 0x0000877C
_0225CE6C: .word 0x000019CC
_0225CE70: .word 0x0000878C
_0225CE74: .word 0x00001AB4
_0225CE78: .word 0x000087CC
_0225CE7C: .word ov91_022627C0
	thumb_func_end ov91_0225CDF4

	thumb_func_start ov91_0225CE80
ov91_0225CE80: ; 0x0225CE80
	push {r4, lr}
	add r4, r0, #0
	bl sub_02021238
	cmp r0, #1
	beq _0225CE90
	bl GF_AssertFail
_0225CE90:
	ldr r0, _0225CEAC ; =0x0000878C
	ldr r1, _0225CEB0 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_0225F1E8
	add r0, r4, #0
	bl ov91_0225F66C
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	nop
_0225CEAC: .word 0x0000878C
_0225CEB0: .word 0x00001AB4
	thumb_func_end ov91_0225CE80

	thumb_func_start ov91_0225CEB4
ov91_0225CEB4: ; 0x0225CEB4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _0225D054 ; =0x00001F38
	add r6, r1, #0
	ldr r0, [r4, r0]
	mov r5, #1
	cmp r0, #4
	blo _0225CEE6
	ldr r0, _0225D058 ; =0x00008785
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0225CED2
	add r1, r5, #0
	sub r1, #0x79
	b _0225CED4
_0225CED2:
	mov r1, #0x78
_0225CED4:
	ldr r2, _0225D05C ; =0x000019CC
	add r0, r4, r2
	add r2, r2, #2
	ldrh r2, [r4, r2]
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov91_0225DD50
_0225CEE6:
	ldr r1, _0225D060 ; =0x00001AB4
	add r0, r4, r1
	sub r1, #0xe8
	add r1, r4, r1
	bl ov91_0225DBC0
	ldr r0, _0225D064 ; =0x00001F74
	ldr r1, _0225D05C ; =0x000019CC
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_022601F4
	ldr r0, _0225D064 ; =0x00001F74
	ldr r1, _0225D05C ; =0x000019CC
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_02260218
	ldr r0, _0225D054 ; =0x00001F38
	ldr r1, [r4, r0]
	cmp r1, #8
	bls _0225CF14
	b _0225D036
_0225CF14:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225CF20: ; jump table
	.short _0225CF32 - _0225CF20 - 2 ; case 0
	.short _0225CF44 - _0225CF20 - 2 ; case 1
	.short _0225CF62 - _0225CF20 - 2 ; case 2
	.short _0225CF7C - _0225CF20 - 2 ; case 3
	.short _0225CFD2 - _0225CF20 - 2 ; case 4
	.short _0225CFDC - _0225CF20 - 2 ; case 5
	.short _0225CFF4 - _0225CF20 - 2 ; case 6
	.short _0225D00A - _0225CF20 - 2 ; case 7
	.short _0225D020 - _0225CF20 - 2 ; case 8
_0225CF32:
	ldr r0, _0225D068 ; =0x0000878C
	add r0, r4, r0
	bl ov91_0225F23C
	ldr r0, _0225D054 ; =0x00001F38
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0225D036
_0225CF44:
	ldr r0, _0225D068 ; =0x0000878C
	add r1, r4, #0
	add r0, r4, r0
	bl ov91_0225F25C
	cmp r0, #1
	bne _0225D036
	ldr r0, _0225D054 ; =0x00001F38
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	mov r0, #2
	bl sub_02037AC0
	b _0225D036
_0225CF62:
	mov r0, #2
	bl sub_02037B38
	cmp r0, #0
	beq _0225D036
	ldr r0, _0225D054 ; =0x00001F38
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	mov r1, #0x41
	add r0, #8
	str r1, [r4, r0]
	b _0225D036
_0225CF7C:
	add r1, r0, #0
	add r1, #8
	ldr r1, [r4, r1]
	sub r2, r1, #1
	add r1, r0, #0
	add r1, #8
	str r2, [r4, r1]
	add r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0x32
	bne _0225CF98
	ldr r0, _0225D06C ; =0x00000619
	bl PlaySE
_0225CF98:
	mov r0, #0x7d
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0x14
	bne _0225CFA8
	ldr r0, _0225D070 ; =0x0000063D
	bl PlaySE
_0225CFA8:
	ldr r0, _0225D064 ; =0x00001F74
	mov r1, #1
	add r0, r4, r0
	lsl r1, r1, #0xc
	bl ov91_0226031C
	mov r0, #0x7d
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0225D036
	ldr r1, _0225D060 ; =0x00001AB4
	sub r0, #8
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_0225DB7C
	ldr r0, _0225D054 ; =0x00001F38
	mov r1, #4
	str r1, [r4, r0]
	b _0225D036
_0225CFD2:
	cmp r6, #1
	bne _0225D036
	mov r1, #5
	str r1, [r4, r0]
	b _0225D036
_0225CFDC:
	ldr r1, _0225D060 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_0225DB18
	ldr r0, _0225D074 ; =0x000005DD
	bl PlaySE
	ldr r0, _0225D054 ; =0x00001F38
	mov r1, #6
	str r1, [r4, r0]
	b _0225D036
_0225CFF4:
	ldr r1, _0225D060 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_0225DB44
	cmp r0, #0
	bne _0225D036
	ldr r0, _0225D054 ; =0x00001F38
	mov r1, #7
	str r1, [r4, r0]
	b _0225D036
_0225D00A:
	ldr r1, _0225D060 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_0225DBAC
	cmp r0, #0
	bne _0225D036
	ldr r0, _0225D054 ; =0x00001F38
	mov r1, #8
	str r1, [r4, r0]
	b _0225D036
_0225D020:
	ldr r1, _0225D060 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_0225DB5C
	ldr r0, _0225D05C ; =0x000019CC
	mov r1, #1
	add r0, r4, r0
	bl ov91_0225DD20
	mov r5, #0
_0225D036:
	ldr r0, _0225D064 ; =0x00001F74
	ldr r1, _0225D05C ; =0x000019CC
	ldr r2, [r4]
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_022601AC
	ldr r1, _0225D060 ; =0x00001AB4
	add r0, r4, #0
	add r1, r4, r1
	bl ov91_0225F7A8
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	nop
_0225D054: .word 0x00001F38
_0225D058: .word 0x00008785
_0225D05C: .word 0x000019CC
_0225D060: .word 0x00001AB4
_0225D064: .word 0x00001F74
_0225D068: .word 0x0000878C
_0225D06C: .word 0x00000619
_0225D070: .word 0x0000063D
_0225D074: .word 0x000005DD
	thumb_func_end ov91_0225CEB4

	thumb_func_start ov91_0225D078
ov91_0225D078: ; 0x0225D078
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r1, _0225D1B8 ; =0x00001F54
	add r4, r0, #0
	ldr r2, [r4, r1]
	mov r6, #1
	cmp r2, #3
	bhi _0225D158
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225D094: ; jump table
	.short _0225D09C - _0225D094 - 2 ; case 0
	.short _0225D0E2 - _0225D094 - 2 ; case 1
	.short _0225D13E - _0225D094 - 2 ; case 2
	.short _0225D156 - _0225D094 - 2 ; case 3
_0225D09C:
	bl ov91_0225E6B0
	add r0, r4, #0
	bl ov91_0225EE9C
	mov r0, #2
	str r0, [sp]
	mov r0, #0x18
	add r1, r0, #0
	sub r1, #0x26
	mov r2, #0
	mov r3, #0x3f
	bl sub_0200B484
	ldr r0, _0225D1BC ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0225DBE4
	ldr r0, _0225D1C0 ; =0x000021A4
	ldr r0, [r4, r0]
	bl ov90_02258CB0
	ldr r0, _0225D1C4 ; =0x000087E4
	add r0, r4, r0
	bl ov91_02261B10
	ldr r0, _0225D1C8 ; =0x0000862C
	add r0, r4, r0
	bl ov91_02261890
	ldr r0, _0225D1B8 ; =0x00001F54
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0225D158
_0225D0E2:
	ldr r0, _0225D1BC ; =0x00001AB4
	add r5, r6, #0
	add r0, r4, r0
	bl ov91_0225DBF4
	cmp r0, #0
	bne _0225D0F2
	mov r5, #0
_0225D0F2:
	add r0, r4, #0
	bl ov91_0225E40C
	add r0, r4, #0
	bl ov91_0225E648
	add r0, r4, #0
	bl ov91_0225E6D0
	cmp r0, #1
	bne _0225D10A
	mov r5, #0
_0225D10A:
	ldr r0, _0225D1BC ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0225DC24
	cmp r0, #0
	bne _0225D118
	mov r5, #0
_0225D118:
	mov r0, #2
	bl sub_0200B5C0
	cmp r0, #0
	bne _0225D124
	mov r5, #0
_0225D124:
	cmp r5, #1
	bne _0225D158
	cmp r7, #1
	bne _0225D158
	ldr r0, _0225D1CC ; =0x00001F58
	mov r1, #0
	str r1, [r4, r0]
	sub r1, r0, #4
	ldr r1, [r4, r1]
	sub r0, r0, #4
	add r1, r1, #1
	str r1, [r4, r0]
	b _0225D158
_0225D13E:
	add r0, r1, #4
	ldr r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x40
	blo _0225D158
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	b _0225D158
_0225D156:
	mov r6, #0
_0225D158:
	ldr r0, _0225D1D0 ; =0x00008785
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0225D166
	mov r2, #0x77
	mvn r2, r2
	b _0225D168
_0225D166:
	mov r2, #0x78
_0225D168:
	ldr r1, _0225D1D4 ; =0x000019CC
	add r0, r4, r1
	add r1, r1, #2
	ldrh r1, [r4, r1]
	add r1, r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov91_0225DD50
	ldr r0, _0225D1D8 ; =0x00001F74
	ldr r1, _0225D1D4 ; =0x000019CC
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_022601C8
	ldr r0, _0225D1D8 ; =0x00001F74
	ldr r1, _0225D1D4 ; =0x000019CC
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_022601F4
	ldr r0, _0225D1D8 ; =0x00001F74
	ldr r1, _0225D1D4 ; =0x000019CC
	ldr r2, [r4]
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_022601AC
	ldr r1, _0225D1BC ; =0x00001AB4
	add r0, r4, #0
	add r1, r4, r1
	bl ov91_0225F7A8
	ldr r0, _0225D1C8 ; =0x0000862C
	add r0, r4, r0
	bl ov91_02261928
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D1B8: .word 0x00001F54
_0225D1BC: .word 0x00001AB4
_0225D1C0: .word 0x000021A4
_0225D1C4: .word 0x000087E4
_0225D1C8: .word 0x0000862C
_0225D1CC: .word 0x00001F58
_0225D1D0: .word 0x00008785
_0225D1D4: .word 0x000019CC
_0225D1D8: .word 0x00001F74
	thumb_func_end ov91_0225D078

	thumb_func_start ov91_0225D1DC
ov91_0225D1DC: ; 0x0225D1DC
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4]
	cmp r2, #2
	bhs _0225D202
	ldr r0, _0225D2A8 ; =ov91_02261C44
	lsl r1, r2, #2
	ldr r1, [r0, r1]
	ldr r0, [r4, #8]
	cmp r1, r0
	bhi _0225D202
	add r0, r2, #1
	str r0, [r4]
	cmp r0, #1
	bne _0225D202
	ldr r0, _0225D2AC ; =0x000087E4
	add r0, r4, r0
	bl ov91_022619E8
_0225D202:
	ldr r0, _0225D2B0 ; =0x000086EC
	mov r1, #1
	add r0, r4, r0
	mov r2, #0
	bl sub_02021280
	add r0, r4, #0
	bl ov91_0225EA7C
	ldr r0, _0225D2B4 ; =0x00008730
	add r0, r4, r0
	bl ov91_0225EF70
	cmp r0, #0
	bne _0225D22A
	ldr r1, _0225D2B4 ; =0x00008730
	add r0, r4, #0
	add r1, r4, r1
	bl ov91_0225F008
_0225D22A:
	ldr r0, _0225D2B8 ; =0x000087CC
	ldr r1, [r4, #0x10]
	add r0, r4, r0
	bl ov91_0225F3E8
	cmp r0, #1
	bne _0225D258
	ldr r0, _0225D2B8 ; =0x000087CC
	add r0, r4, r0
	bl ov91_0225F3E4
	add r1, r0, #0
	ldr r0, _0225D2BC ; =0x0000FFFF
	cmp r1, r0
	beq _0225D250
	ldr r0, _0225D2C0 ; =0x00001F74
	add r0, r4, r0
	bl ov91_02260370
_0225D250:
	ldr r0, _0225D2B8 ; =0x000087CC
	add r0, r4, r0
	bl ov91_0225F3D4
_0225D258:
	add r0, r4, #0
	bl ov91_0225E40C
	ldr r1, _0225D2C4 ; =0x000019CC
	add r0, r4, #0
	add r1, r4, r1
	bl ov91_0225DCC4
	ldr r1, _0225D2C8 ; =0x00001AB4
	add r0, r4, #0
	add r1, r4, r1
	bl ov91_0225F74C
	add r0, r4, #0
	bl ov91_0225E62C
	ldr r0, _0225D2AC ; =0x000087E4
	ldr r1, _0225D2CC ; =0x00001C54
	ldr r2, _0225D2C0 ; =0x00001F74
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, r2
	bl ov91_02261A00
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _0225D294
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0225D294:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	cmp r0, r1
	blt _0225D2A2
	str r1, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_0225D2A2:
	mov r0, #0
	pop {r4, pc}
	nop
_0225D2A8: .word ov91_02261C44
_0225D2AC: .word 0x000087E4
_0225D2B0: .word 0x000086EC
_0225D2B4: .word 0x00008730
_0225D2B8: .word 0x000087CC
_0225D2BC: .word 0x0000FFFF
_0225D2C0: .word 0x00001F74
_0225D2C4: .word 0x000019CC
_0225D2C8: .word 0x00001AB4
_0225D2CC: .word 0x00001C54
	thumb_func_end ov91_0225D1DC

	thumb_func_start ov91_0225D2D0
ov91_0225D2D0: ; 0x0225D2D0
	push {r3, lr}
	ldr r1, _0225D2E4 ; =0x00001AB4
	ldr r0, [r0, r1]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	.balign 4, 0
_0225D2E4: .word 0x00001AB4
	thumb_func_end ov91_0225D2D0

	thumb_func_start ov91_0225D2E8
ov91_0225D2E8: ; 0x0225D2E8
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov91_0225D2E8

	thumb_func_start ov91_0225D2EC
ov91_0225D2EC: ; 0x0225D2EC
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r1, #0
	add r5, r0, #0
	ldrh r0, [r4]
	ldr r1, [r5, #0x14]
	cmp r1, r0
	beq _0225D324
	add r0, r4, #0
	add r1, sp, #0
	bl ov91_0225E294
	add r0, r5, #0
	add r1, sp, #0
	mov r2, #2
	bl ov91_0225E2E4
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0225D324
	mov r2, #0x12
	ldr r0, _0225D328 ; =0x00001E38
	ldrh r1, [r4]
	ldrsb r2, [r4, r2]
	ldr r3, [r5]
	add r0, r5, r0
	bl ov91_0225D694
_0225D324:
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225D328: .word 0x00001E38
	thumb_func_end ov91_0225D2EC

	thumb_func_start ov91_0225D32C
ov91_0225D32C: ; 0x0225D32C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r2, #0
	add r3, r5, #0
_0225D334:
	add r0, r3, #0
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #4
	bne _0225D35A
	mov r0, #0x44
	add r4, r2, #0
	mul r4, r0
	add r0, r5, #0
	add r0, #0x50
	add r0, r0, r4
	bl ov91_0225E23C
	add r5, #0x4c
	add r0, r5, r4
	bl ov91_0225E400
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225D35A:
	add r2, r2, #1
	add r3, #0x44
	cmp r2, #0x60
	blt _0225D334
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D32C

	thumb_func_start ov91_0225D368
ov91_0225D368: ; 0x0225D368
	add r3, r1, #0
	ldr r1, _0225D378 ; =0x000086DC
	add r2, r0, r1
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	bx lr
	.balign 4, 0
_0225D378: .word 0x000086DC
	thumb_func_end ov91_0225D368

	thumb_func_start ov91_0225D37C
ov91_0225D37C: ; 0x0225D37C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end ov91_0225D37C

	thumb_func_start ov91_0225D380
ov91_0225D380: ; 0x0225D380
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, _0225D3B0 ; =0x00008780
	add r3, r0, #0
	ldrh r2, [r3, r4]
	add r0, r4, #2
	strh r2, [r3, r0]
	strh r1, [r3, r4]
	ldrh r0, [r3, r4]
	add r2, r4, #4
	sub r1, r4, #4
	str r0, [sp]
	add r0, r4, #0
	sub r0, #0x50
	add r4, r4, #2
	add r0, r3, r0
	ldr r1, [r3, r1]
	add r2, r3, r2
	ldrh r3, [r3, r4]
	bl ov91_0225EED0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0225D3B0: .word 0x00008780
	thumb_func_end ov91_0225D380

	thumb_func_start ov91_0225D3B4
ov91_0225D3B4: ; 0x0225D3B4
	ldr r3, _0225D3BC ; =0x000087CC
	add r0, r0, r3
	ldr r3, _0225D3C0 ; =ov91_0225F3A0
	bx r3
	.balign 4, 0
_0225D3BC: .word 0x000087CC
_0225D3C0: .word ov91_0225F3A0
	thumb_func_end ov91_0225D3B4

	thumb_func_start ov91_0225D3C4
ov91_0225D3C4: ; 0x0225D3C4
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r1]
	ldr r2, _0225D404 ; =0x00008784
	strb r0, [r4, r2]
	ldrb r3, [r1, #1]
	add r0, r2, #1
	strb r3, [r4, r0]
	ldrb r3, [r1, #2]
	add r0, r2, #2
	strb r3, [r4, r0]
	ldrb r1, [r1, #3]
	add r0, r2, #3
	strb r1, [r4, r0]
	mov r1, #1
	add r0, r2, #4
	str r1, [r4, r0]
	add r1, r2, #0
	add r0, r2, #0
	sub r1, #8
	sub r0, #0x54
	ldr r1, [r4, r1]
	add r0, r4, r0
	add r2, r4, r2
	bl ov91_0225EEBC
	ldr r1, _0225D408 ; =0x00008730
	add r0, r4, #0
	add r1, r4, r1
	bl ov91_0225F008
	pop {r4, pc}
	.balign 4, 0
_0225D404: .word 0x00008784
_0225D408: .word 0x00008730
	thumb_func_end ov91_0225D3C4

	thumb_func_start ov91_0225D40C
ov91_0225D40C: ; 0x0225D40C
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	add r5, r0, #0
	add r7, r2, #0
	add r0, r3, #0
	add r6, r1, #0
	lsl r2, r4, #0xc
	str r3, [sp]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	sub r0, r7, r6
	mov r7, #2
	mov r3, #0
	lsl r7, r7, #0xa
	add r2, r2, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r2, r2, #0xc
	orr r2, r1
	sub r2, r0, r2
	asr r1, r2, #0x1f
	lsr r0, r2, #0x13
	lsl r1, r1, #0xd
	orr r1, r0
	lsl r0, r2, #0xd
	add r0, r0, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r1, r4, #0
	mul r1, r4
	lsl r1, r1, #0xc
	bl FX_Div
	str r6, [r5]
	ldr r1, [sp]
	str r6, [r5, #4]
	str r1, [r5, #8]
	str r0, [r5, #0xc]
	mov r0, #0
	str r0, [r5, #0x10]
	str r4, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D40C

	thumb_func_start ov91_0225D46C
ov91_0225D46C: ; 0x0225D46C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x10]
	ldr r0, [r5, #8]
	lsl r2, r6, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsr r4, r2, #0xc
	lsl r0, r1, #0x14
	add r2, r6, #0
	orr r4, r0
	ldr r0, [r5, #0xc]
	mul r2, r6
	lsl r2, r2, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	lsl r1, r2, #2
	bl FX_Div
	ldr r1, [r5, #4]
	add r0, r4, r0
	add r0, r1, r0
	str r0, [r5]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	add r0, r0, #1
	cmp r0, r1
	bgt _0225D4CC
	str r0, [r5, #0x10]
	mov r0, #0
	pop {r4, r5, r6, pc}
_0225D4CC:
	str r1, [r5, #0x10]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D46C

	thumb_func_start ov91_0225D4D4
ov91_0225D4D4: ; 0x0225D4D4
	push {r3, r4}
	lsl r4, r0, #5
	lsl r0, r2, #3
	ldr r2, _0225D4F8 ; =ov91_02261F8C
	lsl r1, r1, #7
	add r2, r2, r1
	add r2, r4, r2
	ldr r2, [r0, r2]
	str r2, [r3]
	ldr r2, _0225D4FC ; =ov91_02261F90
	add r1, r2, r1
	add r1, r4, r1
	ldr r1, [r0, r1]
	ldr r0, [sp, #8]
	str r1, [r0]
	pop {r3, r4}
	bx lr
	nop
_0225D4F8: .word ov91_02261F8C
_0225D4FC: .word ov91_02261F90
	thumb_func_end ov91_0225D4D4

	thumb_func_start ov91_0225D500
ov91_0225D500: ; 0x0225D500
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r4, r3, #0
	add r3, sp, #0
	strh r0, [r3]
	mov r0, #0
	strh r0, [r3, #2]
	sub r3, r1, r4
	lsr r1, r3, #0x1f
	add r1, r3, r1
	asr r1, r1, #1
	lsl r1, r1, #0x10
	asr r1, r1, #4
	str r1, [sp, #4]
	add r1, sp, #0x28
	ldrh r1, [r1, #0x10]
	sub r2, r2, r1
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	lsl r1, r1, #0x10
	asr r1, r1, #4
	str r0, [sp, #8]
	add r0, sp, #4
	str r1, [sp, #0xc]
	bl VEC_Mag
	ldr r1, _0225D5F8 ; =0x0001E200
	cmp r0, r1
	ble _0225D582
	add r0, sp, #4
	add r1, r0, #0
	bl VEC_Normalize
	ldr r0, [sp, #4]
	ldr r2, _0225D5F8 ; =0x0001E200
	asr r1, r0, #0x1f
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	ldr r2, _0225D5F8 ; =0x0001E200
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [sp, #0xc]
_0225D582:
	mov r0, #0x26
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	add r0, sp, #4
	bl VEC_Mag
	ldr r2, _0225D5FC ; =0x0000099A
	asr r1, r0, #0x1f
	mov r3, #0
	str r0, [sp, #0x10]
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	add r0, sp, #4
	str r1, [sp, #0x10]
	add r1, r0, #0
	bl VEC_Normalize
	lsl r0, r4, #0x10
	add r2, sp, #0x28
	mov r1, #0x10
	ldrsh r1, [r2, r1]
	asr r0, r0, #0x10
	add r2, sp, #0x14
	bl ov91_02260400
	mov r0, #0
	str r0, [sp, #0x18]
	add r2, sp, #0
	add r0, sp, #0x14
	ldrh r2, [r2]
	ldr r3, [r5, #0x10]
	add r1, r0, #0
	bl ov91_0226045C
	add r2, sp, #0
	add r0, sp, #4
	ldrh r2, [r2]
	ldr r3, [r5, #0x10]
	add r1, r0, #0
	bl ov91_0226045C
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r2, [sp, #0x3c]
	add r0, r5, #0
	add r1, sp, #0
	bl ov91_0225E2E4
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0225D5F8: .word 0x0001E200
_0225D5FC: .word 0x0000099A
	thumb_func_end ov91_0225D500

	thumb_func_start ov91_0225D600
ov91_0225D600: ; 0x0225D600
	ldr r1, [r0, #0x1c]
	cmp r1, #3
	blt _0225D60A
	mov r1, #2
	b _0225D60E
_0225D60A:
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
_0225D60E:
	lsl r2, r1, #2
	ldr r1, _0225D624 ; =ov91_02261C34
	ldr r0, [r0]
	ldr r1, [r1, r2]
	cmp r0, #2
	bne _0225D61E
	lsl r0, r1, #1
	add r1, r1, r0
_0225D61E:
	add r0, r1, #0
	bx lr
	nop
_0225D624: .word ov91_02261C34
	thumb_func_end ov91_0225D600

	thumb_func_start ov91_0225D628
ov91_0225D628: ; 0x0225D628
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r6, r1, #0
	add r5, r0, #0
	ldr r0, [r6, #0x1c]
	ldr r7, [sp, #0x58]
	str r0, [sp, #0x14]
	mov r0, #0x56
	lsl r0, r0, #2
	add r0, r6, r0
	str r0, [sp, #0x18]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	mov r4, #0
	add r0, sp, #0x14
	strh r4, [r0, #0x20]
	mov r0, #1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	str r4, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r7, [sp, #0x40]
_0225D65A:
	ldr r0, [sp, #0x10]
	str r4, [sp]
	str r0, [sp, #4]
	ldr r3, [sp, #0xc]
	add r0, r5, #0
	add r1, sp, #0x14
	add r2, r6, #0
	str r7, [sp, #8]
	bl ov91_0225D6B8
	add r4, r4, #1
	add r5, #0x40
	cmp r4, #4
	blt _0225D65A
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D628

	thumb_func_start ov91_0225D67C
ov91_0225D67C: ; 0x0225D67C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225D682:
	add r0, r5, #0
	bl ov91_0225D750
	add r4, r4, #1
	add r5, #0x40
	cmp r4, #4
	blt _0225D682
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D67C

	thumb_func_start ov91_0225D694
ov91_0225D694: ; 0x0225D694
	push {r4, lr}
	lsl r4, r1, #6
	add r0, r0, r4
	bl ov91_0225D768
	pop {r4, pc}
	thumb_func_end ov91_0225D694

	thumb_func_start ov91_0225D6A0
ov91_0225D6A0: ; 0x0225D6A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225D6A6:
	add r0, r5, #0
	bl ov91_0225D84C
	add r4, r4, #1
	add r5, #0x40
	cmp r4, #4
	blt _0225D6A6
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D6A0

	thumb_func_start ov91_0225D6B8
ov91_0225D6B8: ; 0x0225D6B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	ldr r6, [sp, #4]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	add r5, r1, #0
	str r3, [sp, #8]
	str r0, [sp, #0x2c]
	mov r7, #0
	add r4, r6, #0
_0225D6D0:
	add r0, sp, #0xc
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	add r3, sp, #0x10
	bl ov91_0225D4D4
	ldr r0, [sp, #0x10]
	add r3, r5, #0
	lsl r0, r0, #0xc
	str r0, [r5, #8]
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	lsl r0, r0, #0xc
	add r3, #8
	str r0, [r5, #0xc]
	ldmia r3!, {r0, r1}
	add r2, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r5, #0
	bl CreateSprite
	str r0, [r4]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r1, #6
	ldr r0, [r4]
	lsl r1, r1, #0xa
	bl sub_02024868
	mov r0, #0
	str r0, [r4, #0xc]
	add r7, r7, #1
	add r6, #0xc
	add r4, r4, #4
	cmp r7, #3
	blt _0225D6D0
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	cmp r1, r0
	bne _0225D744
	ldr r0, [sp, #4]
	mov r1, #1
	str r1, [r0, #0x3c]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0225D744:
	ldr r0, [sp, #4]
	mov r1, #0
	str r1, [r0, #0x3c]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D6B8

	thumb_func_start ov91_0225D750
ov91_0225D750: ; 0x0225D750
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225D756:
	ldr r0, [r5]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _0225D756
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D750

	thumb_func_start ov91_0225D768
ov91_0225D768: ; 0x0225D768
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r4, #0
	str r0, [sp]
	add r0, r4, #0
	sub r0, r0, #1
	ldr r5, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	str r0, [sp, #0x14]
	add r6, r4, #0
_0225D782:
	ldr r0, [r5]
	bl sub_020248B8
	cmp r0, #0
	bne _0225D794
	mov r0, #1
	str r6, [sp, #0x14]
	str r0, [sp, #0x10]
	b _0225D7B4
_0225D794:
	ldr r0, [r5]
	bl sub_02024AF8
	add r7, r0, #0
	ldr r0, [r5]
	add r1, r7, #1
	bl sub_02024ADC
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0225D7B4
	add r0, r7, #1
	cmp r4, r0
	bhi _0225D7B4
	add r4, r0, #0
	str r6, [sp, #0x14]
_0225D7B4:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _0225D782
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _0225D7C6
	bl GF_AssertFail
_0225D7C6:
	ldr r0, [sp, #8]
	cmp r0, #3
	blo _0225D7D0
	mov r0, #2
	str r0, [sp, #8]
_0225D7D0:
	ldr r0, [sp, #0xc]
	cmp r0, #2
	beq _0225D7F2
	ldr r0, [sp]
	ldr r0, [r0, #0x3c]
	cmp r0, #1
	bne _0225D7E6
	ldr r0, [sp, #8]
	add r0, r0, #2
	str r0, [sp, #8]
	b _0225D7EC
_0225D7E6:
	ldr r0, [sp, #8]
	add r0, #8
	str r0, [sp, #8]
_0225D7EC:
	ldr r0, [sp, #4]
	add r4, r0, #3
	b _0225D80A
_0225D7F2:
	ldr r0, [sp]
	ldr r0, [r0, #0x3c]
	cmp r0, #1
	bne _0225D802
	ldr r0, [sp, #8]
	add r0, r0, #5
	str r0, [sp, #8]
	b _0225D808
_0225D802:
	ldr r0, [sp, #8]
	add r0, #0xb
	str r0, [sp, #8]
_0225D808:
	mov r4, #7
_0225D80A:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	lsl r5, r0, #2
	ldr r0, [sp]
	ldr r0, [r0, r5]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [sp]
	mov r1, #0
	add r0, r0, r5
	str r1, [r0, #0xc]
	ldr r0, [sp]
	mov r1, #1
	ldr r0, [r0, r5]
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp]
	ldr r1, [sp, #0x14]
	bl ov91_0225D884
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, r5]
	bl sub_02024ADC
	ldr r0, [sp]
	add r1, r4, #0
	ldr r0, [r0, r5]
	bl sub_02024A14
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_0225D768

	thumb_func_start ov91_0225D84C
ov91_0225D84C: ; 0x0225D84C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0225D854:
	ldr r0, [r5]
	bl sub_020248B8
	cmp r0, #1
	bne _0225D87A
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0x10
	bls _0225D872
	add r0, r6, #0
	add r1, r4, #0
	bl ov91_0225D8E0
	b _0225D87A
_0225D872:
	add r0, r6, #0
	add r1, r4, #0
	bl ov91_0225D884
_0225D87A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _0225D854
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_0225D84C

	thumb_func_start ov91_0225D884
ov91_0225D884: ; 0x0225D884
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	lsl r4, r6, #2
	add r0, r5, r4
	ldr r0, [r0, #0xc]
	ldr r2, _0225D8DC ; =0xFFFF0000
	lsl r0, r0, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x10
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	lsl r1, r2, #5
	bl FX_Div
	add r2, r0, #0
	mov r0, #0xc
	mul r0, r6
	add r6, r5, r0
	add r6, #0x18
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r7, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r7, #0
	str r0, [r3]
	ldr r0, [sp, #4]
	add r0, r0, r2
	str r0, [sp, #4]
	ldr r0, [r5, r4]
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D8DC: .word 0xFFFF0000
	thumb_func_end ov91_0225D884

	thumb_func_start ov91_0225D8E0
ov91_0225D8E0: ; 0x0225D8E0
	ldr r3, _0225D8EC ; =Set2dSpriteVisibleFlag
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bx r3
	nop
_0225D8EC: .word Set2dSpriteVisibleFlag
	thumb_func_end ov91_0225D8E0

	thumb_func_start ov91_0225D8F0
ov91_0225D8F0: ; 0x0225D8F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x58]
	add r5, r2, #0
	str r1, [sp, #0x18]
	str r0, [sp, #0x58]
	ldr r4, [sp, #0x60]
	ldr r2, [sp, #0x14]
	str r3, [sp, #0x1c]
	mov r1, #0x1c
	mov r0, #0
_0225D908:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0225D908
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0xa
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	add r1, #0xc
	mov r2, #1
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0xe0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r2, #0
	add r0, #0xc
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, #0
	ldr r0, [r0, #8]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DAF8 ; =0x0001020F
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r3, r1, #0
	add r0, #0xc
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x18]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x5c]
	ldr r2, [r2]
	mov r1, #0x12
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x5c]
	ldr r2, [r2]
	add r1, #0x12
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x80
	str r0, [sp]
	mov r2, #0
	ldr r0, [sp, #0x5c]
	mov r1, #0x13
	add r3, r2, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add r0, sp, #0x30
	bl InitWindow
	mov r3, #0
	str r3, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	add r0, #0xfb
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	add r1, sp, #0x30
	ldr r0, [r0]
	bl AddWindowParameterized
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp, #0x28]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	mov r4, #0
	cmp r0, #0
	bls _0225DAD2
	ldr r0, [sp, #0x58]
	ldr r1, _0225DAFC ; =ov91_02261DAC
	lsl r0, r0, #7
	add r1, r1, r0
	ldr r0, [sp, #0x1c]
	lsl r0, r0, #5
	add r6, r1, r0
_0225DA0E:
	ldr r0, [sp, #0x58]
	cmp r4, r0
	beq _0225DAC6
	add r0, r6, #0
	sub r0, #0x20
	ldr r0, [r0]
	mov r1, #2
	str r0, [sp, #0x2c]
	add r0, r6, #0
	sub r0, #0x1c
	ldr r7, [r0]
	mov r0, #0xa
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	sub r2, r2, #1
	sub r3, r7, #1
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	add r0, sp, #0x30
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x18]
	cmp r0, #1
	bne _0225DA5C
	ldr r0, _0225DB00 ; =0x0005060F
	str r0, [sp, #0x20]
	b _0225DA60
_0225DA5C:
	ldr r0, _0225DAF8 ; =0x0001020F
	str r0, [sp, #0x20]
_0225DA60:
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x24]
	bl PlayerName_FlatToString
	ldr r1, [sp, #0x2c]
	add r0, sp, #0x30
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl SetWindowX
	lsl r1, r7, #0x18
	add r0, sp, #0x30
	lsr r1, r1, #0x18
	bl SetWindowY
	add r0, sp, #0x30
	ldrh r1, [r0, #0xa]
	ldr r0, _0225DB04 ; =0xFFFF8000
	and r0, r1
	ldr r1, [sp, #0x28]
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	ldr r1, _0225DB08 ; =0x00007FFF
	and r1, r2
	orr r1, r0
	add r0, sp, #0x30
	strh r1, [r0, #0xa]
	mov r0, #0
	ldr r1, [sp, #0x24]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	mov r3, #0x40
	str r0, [sp, #8]
	mov r0, #0
	sub r3, r3, r7
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x24]
	add r0, sp, #0x30
	mov r1, #0
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x28]
	add r0, #0x10
	str r0, [sp, #0x28]
_0225DAC6:
	ldr r0, [sp, #0x1c]
	add r4, r4, #1
	add r6, #8
	add r5, r5, #4
	cmp r4, r0
	blo _0225DA0E
_0225DAD2:
	ldr r0, [sp, #0x24]
	bl String_dtor
	add r0, sp, #0x30
	bl RemoveWindow
	ldr r0, [sp, #0x14]
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #2
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DAF8: .word 0x0001020F
_0225DAFC: .word ov91_02261DAC
_0225DB00: .word 0x0005060F
_0225DB04: .word 0xFFFF8000
_0225DB08: .word 0x00007FFF
	thumb_func_end ov91_0225D8F0

	thumb_func_start ov91_0225DB0C
ov91_0225DB0C: ; 0x0225DB0C
	ldr r3, _0225DB14 ; =RemoveWindow
	add r0, #0xc
	bx r3
	nop
_0225DB14: .word RemoveWindow
	thumb_func_end ov91_0225DB0C

	thumb_func_start ov91_0225DB18
ov91_0225DB18: ; 0x0225DB18
	push {r4, lr}
	add r4, r1, #0
	add r0, #0xc
	mov r1, #0
	mov r2, #1
	mov r3, #4
	bl DrawFrameAndWindow1
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov90_02258C8C
	pop {r4, pc}
	thumb_func_end ov91_0225DB18

	thumb_func_start ov91_0225DB44
ov91_0225DB44: ; 0x0225DB44
	push {r3, lr}
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl ov90_02258CE0
	cmp r0, #1
	beq _0225DB58
	mov r0, #1
	pop {r3, pc}
_0225DB58:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov91_0225DB44

	thumb_func_start ov91_0225DB5C
ov91_0225DB5C: ; 0x0225DB5C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc
	mov r1, #1
	bl sub_0200E5D4
	add r4, #0xc
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225DB5C

	thumb_func_start ov91_0225DB7C
ov91_0225DB7C: ; 0x0225DB7C
	push {r4, lr}
	mov r0, #0x13
	add r4, r1, #0
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #1
	bl ov91_02260298
	ldr r0, _0225DBA8 ; =0x0000066C
	mov r1, #0x2d
	add r0, r4, r0
	lsl r1, r1, #0xe
	bl sub_02018198
	mov r0, #0x13
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #1
	bl ov91_02260334
	pop {r4, pc}
	nop
_0225DBA8: .word 0x0000066C
	thumb_func_end ov91_0225DB7C

	thumb_func_start ov91_0225DBAC
ov91_0225DBAC: ; 0x0225DBAC
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	cmp r1, #8
	bge _0225DBBA
	mov r0, #1
	bx lr
_0225DBBA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225DBAC

	thumb_func_start ov91_0225DBC0
ov91_0225DBC0: ; 0x0225DBC0
	mov r2, #0x13
	lsl r2, r2, #6
	ldr r3, _0225DBCC ; =ov91_022601C8
	add r0, r0, r2
	bx r3
	nop
_0225DBCC: .word ov91_022601C8
	thumb_func_end ov91_0225DBC0

	thumb_func_start ov91_0225DBD0
ov91_0225DBD0: ; 0x0225DBD0
	mov r1, #0x4a
	mov r2, #0
	lsl r1, r1, #4
	str r2, [r0, r1]
	add r1, r1, #4
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225DBD0

	thumb_func_start ov91_0225DBE0
ov91_0225DBE0: ; 0x0225DBE0
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225DBE0

	thumb_func_start ov91_0225DBE4
ov91_0225DBE4: ; 0x0225DBE4
	mov r1, #0x13
	lsl r1, r1, #6
	add r0, r0, r1
	ldr r3, _0225DBF0 ; =ov91_02260298
	mov r1, #5
	bx r3
	.balign 4, 0
_0225DBF0: .word ov91_02260298
	thumb_func_end ov91_0225DBE4

	thumb_func_start ov91_0225DBF4
ov91_0225DBF4: ; 0x0225DBF4
	push {r3, lr}
	ldr r1, _0225DC1C ; =0x000004A4
	ldr r2, [r0, r1]
	add r2, r2, #1
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	cmp r1, #0x3c
	blo _0225DC18
	ldr r1, _0225DC20 ; =0x000006BC
	add r0, r0, r1
	mov r1, #2
	lsl r1, r1, #0xc
	bl sub_0201815C
	cmp r0, #1
	bne _0225DC18
	mov r0, #1
	pop {r3, pc}
_0225DC18:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0225DC1C: .word 0x000004A4
_0225DC20: .word 0x000006BC
	thumb_func_end ov91_0225DBF4

	thumb_func_start ov91_0225DC24
ov91_0225DC24: ; 0x0225DC24
	push {r3, lr}
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl ov90_02258CE0
	cmp r0, #1
	bne _0225DC38
	mov r0, #1
	pop {r3, pc}
_0225DC38:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov91_0225DC24

	thumb_func_start ov91_0225DC3C
ov91_0225DC3C: ; 0x0225DC3C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #6]
	ldr r1, _0225DCB4 ; =0x00007FFF
	add r0, r4, #0
	bl ov91_0225DD50
	ldr r1, _0225DCB8 ; =0x00000E38
	add r0, r4, #0
	bl ov91_0225DD24
	mov r0, #0
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r1, #0x32
	add r0, r4, #0
	add r2, sp, #0
	lsl r1, r1, #0xe
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0x7b
	add r0, #0x98
	str r1, [r0]
	mov r0, #5
	lsl r0, r0, #0x10
	ldr r5, _0225DCBC ; =ov91_02261C28
	str r0, [r4, #8]
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x9c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _0225DCC0 ; =0x000009C4
	str r0, [r2]
	add r0, r4, #0
	bl ov91_0225E09C
	add r3, sp, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xd8
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r4, #0xe4
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0225DCB4: .word 0x00007FFF
_0225DCB8: .word 0x00000E38
_0225DCBC: .word ov91_02261C28
_0225DCC0: .word 0x000009C4
	thumb_func_end ov91_0225DC3C

	thumb_func_start ov91_0225DCC4
ov91_0225DCC4: ; 0x0225DCC4
	push {r3, r4, r5, lr}
	add r3, r0, #0
	ldr r0, [r3]
	add r4, r1, #0
	cmp r0, #1
	bne _0225DCD4
	mov r0, #0
	b _0225DCD6
_0225DCD4:
	mov r0, #1
_0225DCD6:
	strb r0, [r4, #1]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	ldr r3, [r3]
	add r0, r4, #0
	lsl r5, r3, #2
	ldr r3, _0225DD1C ; =ov91_02261C58
	ldr r3, [r3, r5]
	blx r3
	add r1, r0, #0
	add r0, r4, #0
	bl ov91_0225DD24
	ldrh r1, [r4, #4]
	add r0, r4, #0
	bl ov91_0225E044
	str r0, [r4, #8]
	ldrh r1, [r4, #4]
	add r0, r4, #0
	bl ov91_0225E070
	add r1, r4, #0
	add r1, #0xe4
	str r0, [r1]
	ldrh r2, [r4, #2]
	ldrh r1, [r4, #6]
	add r0, r4, #0
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov91_0225DD50
	pop {r3, r4, r5, pc}
	nop
_0225DD1C: .word ov91_02261C58
	thumb_func_end ov91_0225DCC4

	thumb_func_start ov91_0225DD20
ov91_0225DD20: ; 0x0225DD20
	strb r1, [r0]
	bx lr
	thumb_func_end ov91_0225DD20

	thumb_func_start ov91_0225DD24
ov91_0225DD24: ; 0x0225DD24
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r0, #0xc
	strh r5, [r4, #4]
	bl MTX_Identity33_
	asr r0, r5, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	ldr r3, _0225DD4C ; =FX_SinCosTable_
	add r2, r2, #1
	lsl r2, r2, #1
	add r4, #0xc
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, r4, #0
	bl MTX_RotX33_
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225DD4C: .word FX_SinCosTable_
	thumb_func_end ov91_0225DD24

	thumb_func_start ov91_0225DD50
ov91_0225DD50: ; 0x0225DD50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x54
	strh r4, [r5, #2]
	bl MTX_Identity33_
	add r0, r5, #0
	add r0, #0x30
	bl MTX_Identity33_
	asr r0, r4, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	ldr r3, _0225DE84 ; =FX_SinCosTable_
	add r2, r2, #1
	lsl r2, r2, #1
	add r0, r5, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, #0x30
	bl MTX_RotY33_
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0xc
	add r1, #0x30
	add r2, #0x54
	bl MTX_Concat33
	add r1, r5, #0
	add r2, r5, #0
	ldr r0, _0225DE88 ; =ov91_02261C4C
	add r1, #0x54
	add r2, #0x78
	bl MTX_MultVec33
	mov r0, #0
	add r1, r5, #0
	add r2, r5, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #8]
	add r1, #0x54
	neg r0, r0
	str r0, [sp, #0x10]
	add r0, sp, #8
	add r2, #0x84
	bl MTX_MultVec33
	add r0, r5, #0
	add r0, #0xb8
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xbc
	ldr r0, [r0]
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0xa4
	ldr r1, [r0]
	mov r0, #5
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #0x10]
	add r0, sp, #8
	add r1, r5, #0
	add r1, #0x30
	add r2, r0, #0
	bl MTX_MultVec33
	add r1, r5, #0
	add r1, #0x84
	add r0, sp, #8
	add r2, r1, #0
	bl VEC_Add
	add r0, r5, #0
	add r2, r5, #0
	add r0, #0x80
	add r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r5, #0
	add r2, #0x84
	str r0, [sp, #4]
	ldr r2, [r2]
	ldr r0, [r5, #0x78]
	add r6, r1, #0
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	str r0, [sp]
	add r4, r1, #0
	add r2, r5, #0
	add r2, #0x88
	ldr r0, [r5, #0x7c]
	ldr r2, [r2]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r1, #0
	mov r3, #2
	add r7, r0, #0
	ldr r1, [sp, #4]
	mov r0, #0
	lsl r3, r3, #0xa
	add r1, r1, r3
	adc r6, r0
	lsl r3, r6, #0x14
	lsr r1, r1, #0xc
	orr r1, r3
	mov r3, #2
	ldr r6, [sp]
	lsl r3, r3, #0xa
	add r3, r6, r3
	adc r4, r0
	lsl r4, r4, #0x14
	lsr r3, r3, #0xc
	orr r3, r4
	mov r4, #2
	lsl r4, r4, #0xa
	add r4, r7, r4
	adc r2, r0
	lsl r0, r2, #0x14
	lsr r2, r4, #0xc
	orr r2, r0
	add r0, r3, r2
	add r1, r1, r0
	add r0, r5, #0
	add r0, #0x90
	str r1, [r0]
	add r0, r5, #0
	add r1, r5, #0
	add r5, #0xd8
	add r0, #0x9c
	add r1, #0x30
	add r2, r5, #0
	bl MTX_MultVec33
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DE84: .word FX_SinCosTable_
_0225DE88: .word ov91_02261C4C
	thumb_func_end ov91_0225DD50

	thumb_func_start ov91_0225DE8C
ov91_0225DE8C: ; 0x0225DE8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r0, #0
	ldrb r0, [r4]
	add r6, r1, #0
	add r7, r3, #0
	mov r5, #0
	cmp r0, #0
	bne _0225DEA4
	add sp, #0x34
	add r0, r5, #0
	pop {r4, r5, r6, r7, pc}
_0225DEA4:
	add r0, sp, #0x28
	str r0, [sp]
	add r0, sp, #0xc
	add r3, r4, #0
	str r0, [sp, #4]
	add r3, #0x90
	add r1, r2, #0
	add r2, r4, #0
	ldr r3, [r3]
	add r0, r6, #0
	add r2, #0x78
	bl ov91_02261208
	add r0, r4, #0
	add r0, #0x84
	add r1, r6, #0
	add r2, sp, #0x1c
	bl VEC_Subtract
	add r0, sp, #0x1c
	bl VEC_Mag
	add r6, r0, #0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	blt _0225DEFA
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r0, r1
	bgt _0225DEFA
	ldr r1, [r4, #8]
	cmp r6, r1
	bgt _0225DEF4
	ldrb r1, [r4, #1]
	cmp r1, #1
	bne _0225DEF0
	mov r5, #1
	b _0225DEFA
_0225DEF0:
	mov r5, #2
	b _0225DEFA
_0225DEF4:
	add sp, #0x34
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_0225DEFA:
	cmp r0, #0
	ble _0225DFAA
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r6, r0
	bge _0225DFAA
	add r2, r4, #0
	add r2, #0x98
	ldr r2, [r2]
	sub r0, r0, r6
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r5, r2, #0xc
	orr r5, r0
	add r0, sp, #0x1c
	add r1, sp, #0x10
	bl VEC_Normalize
	asr r0, r5, #0x1f
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #8]
	asr r1, r0, #0x1f
	add r2, r5, #0
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	str r0, [r7]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #8]
	asr r1, r0, #0x1f
	add r2, r5, #0
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	str r0, [r7, #4]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #8]
	asr r1, r0, #0x1f
	add r2, r5, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r7, #8]
	ldr r0, [r4, #8]
	sub r1, r6, r5
	cmp r1, r0
	bgt _0225DFA8
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _0225DFA4
	mov r5, #1
	b _0225DFAA
_0225DFA4:
	mov r5, #2
	b _0225DFAA
_0225DFA8:
	mov r5, #3
_0225DFAA:
	add r0, r5, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225DE8C

	thumb_func_start ov91_0225DFB0
ov91_0225DFB0: ; 0x0225DFB0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldrb r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	bne _0225DFC4
	add sp, #0x24
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0225DFC4:
	add r1, r5, #0
	add r1, #0xdc
	ldr r0, [r4, #4]
	ldr r2, [r1]
	cmp r2, r0
	bge _0225E03C
	add r1, r5, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r1, r2, r1
	cmp r1, r0
	ble _0225E03C
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	add r2, sp, #0x18
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r4]
	str r0, [sp]
	ldr r0, [r4, #8]
	str r0, [sp, #8]
	str r1, [sp, #4]
	add r0, sp, #0xc
	add r1, sp, #0
	bl VEC_Subtract
	add r0, sp, #0x18
	bl VEC_Mag
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xdc
	ldr r1, [r4, #4]
	ldr r0, [r0]
	sub r0, r1, r0
	asr r1, r0, #0xc
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	mul r0, r1
	add r1, r5, #0
	add r1, #0xe4
	ldr r1, [r1]
	asr r1, r1, #0xc
	bl _s32_div_f
	add r5, #0xcc
	ldr r1, [r5]
	sub r0, r1, r0
	cmp r6, r0
	bge _0225E03C
	add sp, #0x24
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0225E03C:
	mov r0, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_0225DFB0

	thumb_func_start ov91_0225E044
ov91_0225E044: ; 0x0225E044
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	mul r0, r1
	ldr r1, _0225E06C ; =0x0000FFFF
	bl _s32_div_f
	mov r1, #0x5a
	sub r2, r1, r0
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mul r0, r2
	bl _s32_div_f
	add r4, #0xb0
	ldr r1, [r4]
	add r0, r0, r1
	pop {r4, pc}
	.balign 4, 0
_0225E06C: .word 0x0000FFFF
	thumb_func_end ov91_0225E044

	thumb_func_start ov91_0225E070
ov91_0225E070: ; 0x0225E070
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	mul r0, r1
	ldr r1, _0225E098 ; =0x0000FFFF
	bl _s32_div_f
	add r1, r4, #0
	add r1, #0xc4
	ldr r1, [r1]
	mul r1, r0
	add r0, r1, #0
	mov r1, #0x5a
	bl _s32_div_f
	add r4, #0xc0
	ldr r1, [r4]
	add r0, r0, r1
	pop {r4, pc}
	.balign 4, 0
_0225E098: .word 0x0000FFFF
	thumb_func_end ov91_0225E070

	thumb_func_start ov91_0225E09C
ov91_0225E09C: ; 0x0225E09C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0xa8
	mov r2, #0x1e
	add r4, r1, #0
	str r1, [r0]
	asr r6, r1, #0x1f
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #0xc
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	add r0, r5, #0
	add r0, #0xac
	str r1, [r0]
	mov r2, #0x32
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #0xc
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	add r0, r5, #0
	add r0, #0xb0
	str r1, [r0]
	mov r2, #5
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #0x10
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r7, r2, #0xc
	orr r7, r0
	add r0, r5, #0
	add r0, #0xb4
	str r7, [r0]
	add r0, r5, #0
	add r0, #0xb8
	mov r2, #0x37
	str r3, [r0]
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #0xc
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	mov r2, #0x96
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r1, r5, #0
	add r1, #0xbc
	str r0, [r1]
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #0xc
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	mov r2, #0xf
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #0xe
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	mov r2, #0x1e
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r1, r5, #0
	add r1, #0xc4
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xc8
	str r7, [r0]
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #0xe
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	add r0, r5, #0
	add r0, #0xcc
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xcc
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	mov r2, #6
	sub r1, r1, r0
	add r0, r5, #0
	add r0, #0xd0
	str r1, [r0]
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #0xa
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	add r5, #0xd4
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225E09C

	thumb_func_start ov91_0225E1E0
ov91_0225E1E0: ; 0x0225E1E0
	strh r1, [r0, #6]
	bx lr
	thumb_func_end ov91_0225E1E0

	thumb_func_start ov91_0225E1E4
ov91_0225E1E4: ; 0x0225E1E4
	add r0, #0xa4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225E1E4

	thumb_func_start ov91_0225E1EC
ov91_0225E1EC: ; 0x0225E1EC
	ldr r0, _0225E1F0 ; =0x00000E38
	bx lr
	.balign 4, 0
_0225E1F0: .word 0x00000E38
	thumb_func_end ov91_0225E1EC

	thumb_func_start ov91_0225E1F4
ov91_0225E1F4: ; 0x0225E1F4
	ldr r0, _0225E1F8 ; =0x00003FFF
	bx lr
	.balign 4, 0
_0225E1F8: .word 0x00003FFF
	thumb_func_end ov91_0225E1F4

	thumb_func_start ov91_0225E1FC
ov91_0225E1FC: ; 0x0225E1FC
	push {r3, lr}
	ldr r0, _0225E22C ; =0x000002EE
	sub r0, r1, r0
	mov r1, #0x32
	bl _u32_div_f
	ldr r0, _0225E230 ; =0x0000638E
	mul r0, r1
	mov r1, #0x32
	bl _s32_div_f
	ldr r1, _0225E234 ; =0x000031C7
	cmp r0, r1
	ble _0225E220
	bl _s32_div_f
	ldr r0, _0225E234 ; =0x000031C7
	sub r0, r0, r1
_0225E220:
	ldr r1, _0225E238 ; =0x00000E38
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	nop
_0225E22C: .word 0x000002EE
_0225E230: .word 0x0000638E
_0225E234: .word 0x000031C7
_0225E238: .word 0x00000E38
	thumb_func_end ov91_0225E1FC

	thumb_func_start ov91_0225E23C
ov91_0225E23C: ; 0x0225E23C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	add r4, r1, #0
	ldr r2, _0225E290 ; =0x0000028F
	strh r0, [r4]
	ldrh r0, [r5, #2]
	mov r3, #0
	strh r0, [r4, #2]
	ldr r0, [r5, #4]
	strh r0, [r4, #4]
	ldr r0, [r5, #8]
	strh r0, [r4, #6]
	ldr r0, [r5, #0xc]
	strh r0, [r4, #8]
	ldr r0, [r5, #0x10]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	strh r1, [r4, #0x10]
	ldr r0, [r5, #0x14]
	asr r0, r0, #0xc
	strh r0, [r4, #0xa]
	ldr r0, [r5, #0x18]
	asr r0, r0, #0xc
	strh r0, [r4, #0xc]
	ldr r0, [r5, #0x1c]
	asr r0, r0, #0xc
	strh r0, [r4, #0xe]
	ldr r0, [r5, #0x20]
	strb r0, [r4, #0x12]
	ldr r0, [r5, #0x24]
	strb r0, [r4, #0x13]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E290: .word 0x0000028F
	thumb_func_end ov91_0225E23C

	thumb_func_start ov91_0225E294
ov91_0225E294: ; 0x0225E294
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	add r4, r1, #0
	ldr r1, _0225E2E0 ; =0x0000028F
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	mov r0, #4
	ldrsh r0, [r5, r0]
	str r0, [r4, #4]
	mov r0, #6
	ldrsh r0, [r5, r0]
	str r0, [r4, #8]
	mov r0, #8
	ldrsh r0, [r5, r0]
	str r0, [r4, #0xc]
	mov r0, #0x10
	ldrsh r0, [r5, r0]
	bl FX_Div
	str r0, [r4, #0x10]
	mov r0, #0xa
	ldrsh r0, [r5, r0]
	lsl r0, r0, #0xc
	str r0, [r4, #0x14]
	mov r0, #0xc
	ldrsh r0, [r5, r0]
	lsl r0, r0, #0xc
	str r0, [r4, #0x18]
	mov r0, #0xe
	ldrsh r0, [r5, r0]
	lsl r0, r0, #0xc
	str r0, [r4, #0x1c]
	ldrb r0, [r5, #0x13]
	str r0, [r4, #0x24]
	pop {r3, r4, r5, pc}
	nop
_0225E2E0: .word 0x0000028F
	thumb_func_end ov91_0225E294

	thumb_func_start ov91_0225E2E4
ov91_0225E2E4: ; 0x0225E2E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r6, r1, #0
	str r2, [sp]
	mov r1, #0
	add r2, r4, #0
_0225E2F2:
	add r0, r2, #0
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225E34C
	mov r0, #0x44
	add r5, r1, #0
	mul r5, r0
	add r3, r4, r5
	add r7, r6, #0
	add r3, #0x50
	mov r2, #5
_0225E30A:
	ldmia r7!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225E30A
	add r1, r4, r5
	ldr r0, [sp]
	add r1, #0x4c
	add r2, r4, r5
	add r6, #0x14
	strb r0, [r1]
	ldmia r6!, {r0, r1}
	add r2, #0x78
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	mov r1, #0
	str r0, [r2]
	add r0, r4, r5
	add r0, #0x4e
	strh r1, [r0]
	add r0, r4, r5
	add r0, #0x88
	str r1, [r0]
	ldr r0, _0225E3F0 ; =0x00001AB4
	add r1, r4, #0
	add r1, #0x4c
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x14]
	add r0, r4, r0
	add r1, r1, r5
	bl ov91_02260728
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225E34C:
	add r1, r1, #1
	add r2, #0x44
	cmp r1, #0x60
	blt _0225E2F2
	ldr r0, [sp]
	cmp r0, #1
	bne _0225E3EA
	mov r0, #0
	add r2, r4, #0
_0225E35E:
	add r1, r2, #0
	add r1, #0x4c
	ldrb r1, [r1]
	cmp r1, #2
	beq _0225E36C
	cmp r1, #5
	bne _0225E3DE
_0225E36C:
	add r5, r0, #0
	add r0, r4, #0
	str r0, [sp, #8]
	add r0, #0x4c
	mov r1, #0x44
	str r0, [sp, #8]
	mul r5, r1
	ldr r0, _0225E3F0 ; =0x00001AB4
	ldr r1, [sp, #8]
	add r0, r4, r0
	add r1, r1, r5
	bl ov91_02260754
	add r0, r4, #0
	str r0, [sp, #4]
	add r0, #0x4c
	str r0, [sp, #4]
	add r0, r0, r5
	bl ov91_0225E400
	add r2, r4, r5
	mov ip, r6
	add r2, #0x50
	mov r7, #5
_0225E39C:
	mov r3, ip
	ldmia r3!, {r0, r1}
	mov ip, r3
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _0225E39C
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r2, r4, r5
	add r6, #0x14
	strb r1, [r0, r5]
	ldmia r6!, {r0, r1}
	add r2, #0x78
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	mov r1, #0
	str r0, [r2]
	add r0, r4, r5
	add r0, #0x4e
	strh r1, [r0]
	add r0, r4, r5
	add r0, #0x88
	str r1, [r0]
	ldr r0, _0225E3F0 ; =0x00001AB4
	ldr r1, [sp, #8]
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x14]
	add r0, r4, r0
	add r1, r1, r5
	bl ov91_02260728
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0225E3DE:
	add r0, r0, #1
	add r2, #0x44
	cmp r0, #0x60
	blt _0225E35E
	bl GF_AssertFail
_0225E3EA:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225E3F0: .word 0x00001AB4
	thumb_func_end ov91_0225E2E4

	thumb_func_start ov91_0225E3F4
ov91_0225E3F4: ; 0x0225E3F4
	mov r0, #1
	strb r0, [r1, #1]
	strh r2, [r1, #6]
	str r3, [r1, #0x24]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225E3F4

	thumb_func_start ov91_0225E400
ov91_0225E400: ; 0x0225E400
	ldr r3, _0225E408 ; =memset
	mov r1, #0
	mov r2, #0x44
	bx r3
	.balign 4, 0
_0225E408: .word memset
	thumb_func_end ov91_0225E400

	thumb_func_start ov91_0225E40C
ov91_0225E40C: ; 0x0225E40C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r5, #0
	mov r7, #0
	add r6, r5, #0
	add r4, #0x4c
_0225E418:
	add r0, r6, #0
	add r0, #0x4c
	ldrb r0, [r0]
	add r1, r0, #0
	add r1, #0xff
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #1
	bhi _0225E434
	add r0, r5, #0
	add r1, r4, #0
	bl ov91_0225E45C
	b _0225E44E
_0225E434:
	cmp r0, #5
	bne _0225E442
	add r0, r4, #0
	add r1, r5, #0
	bl ov91_0225E8BC
	b _0225E44E
_0225E442:
	cmp r0, #3
	bne _0225E44E
	add r0, r4, #0
	add r1, r5, #0
	bl ov91_0225E9F4
_0225E44E:
	add r7, r7, #1
	add r6, #0x44
	add r4, #0x44
	cmp r7, #0x60
	blt _0225E418
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_0225E40C

	thumb_func_start ov91_0225E45C
ov91_0225E45C: ; 0x0225E45C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r1, #0
	ldrb r7, [r4]
	add r5, r0, #0
	cmp r7, #1
	beq _0225E470
	cmp r7, #2
	beq _0225E470
	b _0225E5FA
_0225E470:
	ldr r0, [r4, #0x30]
	add r1, sp, #0x14
	str r0, [sp, #4]
	add r0, r4, #0
	bl ov91_0225E728
	ldrb r0, [r4]
	cmp r0, #1
	bne _0225E496
	ldr r0, _0225E600 ; =0x000019CC
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x2c
	add r2, sp, #0x14
	add r3, sp, #8
	bl ov91_0225DE8C
	add r6, r0, #0
	b _0225E498
_0225E496:
	mov r6, #0
_0225E498:
	add r0, r4, #0
	add r1, sp, #0x14
	bl ov91_0225EA54
	cmp r6, #3
	beq _0225E4A8
	cmp r6, #1
	bne _0225E4B0
_0225E4A8:
	add r0, r4, #0
	add r1, sp, #8
	bl ov91_0225EA54
_0225E4B0:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	cmp r6, #1
	bne _0225E544
	add r0, r5, #0
	bl ov91_0225D600
	ldr r1, [r5, #0x18]
	add r1, r1, r0
	ldr r0, _0225E604 ; =0x0001869F
	str r1, [r5, #0x18]
	cmp r1, r0
	ble _0225E4CE
	str r0, [r5, #0x18]
_0225E4CE:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0225E4DA
	cmp r0, #1
	beq _0225E4E8
	b _0225E4F6
_0225E4DA:
	ldr r0, _0225E608 ; =0x00000582
	bl PlaySE
	ldr r0, _0225E60C ; =0x00000583
	bl PlaySE
	b _0225E502
_0225E4E8:
	ldr r0, _0225E608 ; =0x00000582
	bl PlaySE
	ldr r0, _0225E610 ; =0x00000584
	bl PlaySE
	b _0225E502
_0225E4F6:
	ldr r0, _0225E608 ; =0x00000582
	bl PlaySE
	ldr r0, _0225E614 ; =0x00000585
	bl PlaySE
_0225E502:
	add r0, r4, #0
	add r1, r5, #0
	bl ov91_0225E9E4
	ldr r0, _0225E618 ; =0x00001E38
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x1c]
	ldr r3, [r5]
	add r0, r5, r0
	bl ov91_0225D694
	ldr r0, [r5, #0x1c]
	cmp r0, #0x63
	bge _0225E522
	add r0, r0, #1
	str r0, [r5, #0x1c]
_0225E522:
	ldr r2, [r5, #0x1c]
	ldr r0, _0225E61C ; =0x0000862C
	cmp r2, #3
	ldr r1, _0225E620 ; =0x00001AB4
	bne _0225E538
	add r0, r5, r0
	add r1, r5, r1
	bl ov91_02261808
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0225E538:
	add r0, r5, r0
	add r1, r5, r1
	bl ov91_022618B0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0225E544:
	ldr r0, _0225E600 ; =0x000019CC
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x2c
	mov r6, #0
	bl ov91_0225DFB0
	cmp r0, #1
	bne _0225E56E
	mov r6, #1
	cmp r7, #1
	bne _0225E562
	ldr r0, _0225E624 ; =0x00000722
	bl PlaySE
_0225E562:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov91_0225E7C4
	b _0225E5E6
_0225E56E:
	ldr r1, [r4, #0x30]
	ldr r0, _0225E628 ; =0xFFFCE000
	cmp r1, r0
	bgt _0225E5BE
	add r0, r4, #0
	bl ov91_0225E990
	cmp r0, #0
	bne _0225E5A4
	ldr r1, _0225E628 ; =0xFFFCE000
	ldr r0, [sp, #4]
	mov r6, #1
	cmp r0, r1
	bgt _0225E598
	ldr r3, [r5, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov91_0225E3F4
	b _0225E5E6
_0225E598:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov91_0225E7C4
	b _0225E5E6
_0225E5A4:
	mov r0, #1
	ldr r1, [r4, #0x30]
	lsl r0, r0, #0xa
	cmp r1, r0
	bgt _0225E5E6
	ldr r3, [r5, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	mov r6, #1
	bl ov91_0225E3F4
	b _0225E5E6
_0225E5BE:
	add r0, r4, #0
	bl ov91_0225E9C0
	cmp r0, #1
	bne _0225E5E6
	add r0, r4, #0
	add r0, #0x2c
	mov r6, #1
	add r1, sp, #0x14
	add r2, r0, #0
	bl VEC_Subtract
	mov r0, #0
	add r2, r6, #0
	str r0, [sp]
	add r0, r4, #0
	add r1, r5, #0
	lsl r3, r2, #0xa
	bl ov91_0225E7E8
_0225E5E6:
	cmp r6, #1
	bne _0225E5FA
	cmp r7, #1
	bne _0225E5FA
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r0, _0225E61C ; =0x0000862C
	add r0, r5, r0
	bl ov91_02261890
_0225E5FA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E600: .word 0x000019CC
_0225E604: .word 0x0001869F
_0225E608: .word 0x00000582
_0225E60C: .word 0x00000583
_0225E610: .word 0x00000584
_0225E614: .word 0x00000585
_0225E618: .word 0x00001E38
_0225E61C: .word 0x0000862C
_0225E620: .word 0x00001AB4
_0225E624: .word 0x00000722
_0225E628: .word 0xFFFCE000
	thumb_func_end ov91_0225E45C

	thumb_func_start ov91_0225E62C
ov91_0225E62C: ; 0x0225E62C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0x4c
_0225E636:
	add r0, r5, #0
	add r1, r6, #0
	bl ov91_0225E67C
	add r4, r4, #1
	add r5, #0x44
	cmp r4, #0x60
	blt _0225E636
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_0225E62C

	thumb_func_start ov91_0225E648
ov91_0225E648: ; 0x0225E648
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	mov r6, #0
	add r4, r7, #0
	add r5, #0x4c
_0225E654:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225E666
	add r1, r4, #0
	add r1, #0x4c
	mov r0, #2
	strb r0, [r1]
_0225E666:
	add r0, r5, #0
	add r1, r7, #0
	bl ov91_0225E67C
	add r6, r6, #1
	add r4, #0x44
	add r5, #0x44
	cmp r6, #0x60
	blt _0225E654
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_0225E648

	thumb_func_start ov91_0225E67C
ov91_0225E67C: ; 0x0225E67C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #1]
	add r4, r1, #0
	cmp r0, #0
	beq _0225E6AA
	ldrb r0, [r5]
	cmp r0, #3
	bne _0225E69A
	ldrh r0, [r5, #6]
	cmp r0, #1
	bne _0225E69A
	mov r0, #4
	strb r0, [r5]
	b _0225E6A0
_0225E69A:
	add r0, r5, #0
	bl ov91_0225E400
_0225E6A0:
	ldr r0, _0225E6AC ; =0x00001AB4
	add r1, r5, #0
	add r0, r4, r0
	bl ov91_02260754
_0225E6AA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E6AC: .word 0x00001AB4
	thumb_func_end ov91_0225E67C

	thumb_func_start ov91_0225E6B0
ov91_0225E6B0: ; 0x0225E6B0
	mov r3, #0
	mov r2, #2
_0225E6B4:
	add r1, r0, #0
	add r1, #0x4c
	ldrb r1, [r1]
	cmp r1, #1
	bne _0225E6C4
	add r1, r0, #0
	add r1, #0x4c
	strb r2, [r1]
_0225E6C4:
	add r3, r3, #1
	add r0, #0x44
	cmp r3, #0x60
	blt _0225E6B4
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225E6B0

	thumb_func_start ov91_0225E6D0
ov91_0225E6D0: ; 0x0225E6D0
	mov r2, #0
_0225E6D2:
	add r1, r0, #0
	add r1, #0x4c
	ldrb r1, [r1]
	cmp r1, #1
	beq _0225E6E8
	cmp r1, #2
	beq _0225E6E8
	cmp r1, #5
	beq _0225E6E8
	cmp r1, #3
	bne _0225E6EC
_0225E6E8:
	mov r0, #1
	bx lr
_0225E6EC:
	add r2, r2, #1
	add r0, #0x44
	cmp r2, #0x60
	blt _0225E6D2
	mov r0, #0
	bx lr
	thumb_func_end ov91_0225E6D0

	thumb_func_start ov91_0225E6F8
ov91_0225E6F8: ; 0x0225E6F8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	mov r2, #0x67
	lsl r2, r2, #4
	lsl r0, r0, #0xc
	asr r1, r0, #0x1f
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	ldr r4, [r4, #0x14]
	orr r1, r0
	sub r0, r4, r1
	bpl _0225E724
	add r0, r3, #0
_0225E724:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225E6F8

	thumb_func_start ov91_0225E728
ov91_0225E728: ; 0x0225E728
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov91_0225E6F8
	add r7, r0, #0
	ldr r0, [r5, #8]
	asr r6, r7, #0x1f
	asr r1, r0, #0x1f
	add r2, r7, #0
	add r3, r6, #0
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	str r0, [r4]
	ldr r0, [r5, #0xc]
	add r2, r7, #0
	asr r1, r0, #0x1f
	add r3, r6, #0
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	ldr r2, _0225E7BC ; =0xFFFFECCC
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	asr r3, r2, #0xd
	lsl r0, r0, #0xc
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r3, #2
	add r2, r0, #0
	lsl r3, r3, #0xa
	add r3, r2, r3
	ldr r2, _0225E7C0 ; =0x00000000
	ldr r0, [r4, #4]
	adc r1, r2
	lsr r2, r3, #0xc
	lsl r1, r1, #0x14
	orr r2, r1
	add r0, r0, r2
	str r0, [r4, #4]
	ldr r0, [r5, #0x10]
	add r2, r7, #0
	asr r1, r0, #0x1f
	add r3, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E7BC: .word 0xFFFFECCC
_0225E7C0: .word 0x00000000
	thumb_func_end ov91_0225E728

	thumb_func_start ov91_0225E7C4
ov91_0225E7C4: ; 0x0225E7C4
	push {r3, r4, lr}
	sub sp, #4
	cmp r2, #1
	bne _0225E7D0
	ldr r3, _0225E7E0 ; =0x00000D9A
	b _0225E7D2
_0225E7D0:
	ldr r3, _0225E7E4 ; =0x00000CCD
_0225E7D2:
	mov r4, #1
	str r4, [sp]
	bl ov91_0225E7E8
	add sp, #4
	pop {r3, r4, pc}
	nop
_0225E7E0: .word 0x00000D9A
_0225E7E4: .word 0x00000CCD
	thumb_func_end ov91_0225E7C4

	thumb_func_start ov91_0225E7E8
ov91_0225E7E8: ; 0x0225E7E8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r3, #0
	cmp r2, #0
	beq _0225E87E
	ldr r0, [r5, #8]
	neg r0, r0
	str r0, [r5, #8]
	ldr r0, [r5, #0x10]
	neg r0, r0
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0225E87E
	bl MTRandom
	ldr r2, [r5, #0x10]
	add r1, r0, #0
	cmp r2, #0
	bge _0225E816
	neg r0, r2
	b _0225E818
_0225E816:
	add r0, r2, #0
_0225E818:
	ldr r3, [r5, #8]
	cmp r3, #0
	bge _0225E822
	neg r6, r3
	b _0225E824
_0225E822:
	add r6, r3, #0
_0225E824:
	cmp r6, r0
	bgt _0225E854
	asr r0, r2, #0x1f
	lsr r3, r2, #0x14
	lsl r0, r0, #0xc
	lsl r6, r2, #0xc
	mov r2, #2
	orr r0, r3
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r6, r2
	adc r0, r3
	lsl r0, r0, #0x14
	lsr r2, r2, #0xc
	orr r2, r0
	mov r0, #1
	and r0, r1
	cmp r0, #1
	bne _0225E850
	neg r0, r2
	str r0, [r5, #8]
	b _0225E87E
_0225E850:
	str r2, [r5, #8]
	b _0225E87E
_0225E854:
	asr r0, r3, #0x1f
	lsr r2, r3, #0x14
	lsl r0, r0, #0xc
	orr r0, r2
	mov r2, #2
	lsl r6, r3, #0xc
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r6, r2
	adc r0, r3
	lsl r0, r0, #0x14
	lsr r2, r2, #0xc
	orr r2, r0
	mov r0, #1
	and r0, r1
	cmp r0, #1
	bne _0225E87C
	neg r0, r2
	str r0, [r5, #0x10]
	b _0225E87E
_0225E87C:
	str r2, [r5, #0x10]
_0225E87E:
	ldr r0, [r5, #0x14]
	asr r3, r4, #0x1f
	asr r1, r0, #0x1f
	add r2, r4, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5, #0x14]
	strh r3, [r5, #2]
	mov r0, #5
	strb r0, [r5]
	add r0, r5, #0
	add r1, sp, #0
	bl ov91_0225E728
	add r0, r5, #0
	add r1, sp, #0
	bl ov91_0225EA54
	ldrh r0, [r5, #2]
	add r0, r0, #1
	strh r0, [r5, #2]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov91_0225E7E8

	thumb_func_start ov91_0225E8BC
ov91_0225E8BC: ; 0x0225E8BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	ldrb r1, [r5]
	mov r6, #0
	cmp r1, #5
	bne _0225E980
	add r1, sp, #4
	ldr r7, [r5, #0x30]
	bl ov91_0225E728
	add r0, r5, #0
	add r1, sp, #4
	bl ov91_0225EA54
	ldrh r0, [r5, #2]
	add r1, r5, #0
	add r1, #0x2c
	add r0, r0, #1
	strh r0, [r5, #2]
	ldr r0, _0225E984 ; =0x000019CC
	add r0, r4, r0
	bl ov91_0225DFB0
	cmp r0, #1
	bne _0225E8FE
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov91_0225E7C4
	b _0225E964
_0225E8FE:
	ldr r1, [r5, #0x30]
	ldr r0, _0225E988 ; =0xFFFCE000
	cmp r1, r0
	bgt _0225E93E
	add r0, r5, #0
	bl ov91_0225E990
	cmp r0, #0
	bne _0225E926
	ldr r0, _0225E988 ; =0xFFFCE000
	cmp r7, r0
	bgt _0225E91A
	mov r6, #1
	b _0225E930
_0225E91A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov91_0225E7C4
	b _0225E930
_0225E926:
	ldr r1, [r5, #0x30]
	ldr r0, _0225E98C ; =0xFFF9C000
	cmp r1, r0
	bgt _0225E930
	mov r6, #1
_0225E930:
	mov r0, #2
	ldr r1, [r5, #0x14]
	lsl r0, r0, #0xc
	cmp r1, r0
	bgt _0225E964
	mov r6, #1
	b _0225E964
_0225E93E:
	add r0, r5, #0
	bl ov91_0225E9C0
	cmp r0, #1
	bne _0225E964
	add r0, r5, #0
	add r0, #0x2c
	add r1, sp, #4
	add r2, r0, #0
	bl VEC_Subtract
	add r0, r6, #0
	mov r2, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	lsl r3, r2, #0xa
	bl ov91_0225E7E8
_0225E964:
	mov r0, #1
	ldr r1, [r5, #0x14]
	lsl r0, r0, #0xc
	cmp r1, r0
	bgt _0225E970
	mov r6, #1
_0225E970:
	cmp r6, #1
	bne _0225E980
	ldr r3, [r4, #0x1c]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov91_0225E3F4
_0225E980:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E984: .word 0x000019CC
_0225E988: .word 0xFFFCE000
_0225E98C: .word 0xFFF9C000
	thumb_func_end ov91_0225E8BC

	thumb_func_start ov91_0225E990
ov91_0225E990: ; 0x0225E990
	ldr r1, [r0, #0x40]
	mov r0, #0x2f
	lsl r0, r0, #0xe
	cmp r1, r0
	blt _0225E9A6
	mov r0, #0xf
	lsl r0, r0, #0x10
	cmp r1, r0
	bgt _0225E9A6
	mov r0, #1
	bx lr
_0225E9A6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225E990

	thumb_func_start ov91_0225E9AC
ov91_0225E9AC: ; 0x0225E9AC
	ldr r1, [r0, #0x40]
	mov r0, #0x1e
	lsl r0, r0, #0xe
	cmp r1, r0
	bgt _0225E9BA
	mov r0, #1
	bx lr
_0225E9BA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225E9AC

	thumb_func_start ov91_0225E9C0
ov91_0225E9C0: ; 0x0225E9C0
	mov r1, #0xf
	ldr r2, [r0, #0x40]
	lsl r1, r1, #0x10
	cmp r2, r1
	blt _0225E9D4
	ldr r0, [r0, #0x3c]
	cmp r0, #1
	bne _0225E9DE
	mov r0, #1
	bx lr
_0225E9D4:
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	bne _0225E9DE
	mov r1, #1
	str r1, [r0, #0x3c]
_0225E9DE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225E9C0

	thumb_func_start ov91_0225E9E4
ov91_0225E9E4: ; 0x0225E9E4
	mov r2, #3
	strb r2, [r0]
	mov r2, #8
	strh r2, [r0, #0x38]
	ldr r1, [r1, #0x1c]
	strh r1, [r0, #0x3a]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225E9E4

	thumb_func_start ov91_0225E9F4
ov91_0225E9F4: ; 0x0225E9F4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r6, r1, #0
	add r1, sp, #0xc
	add r5, r0, #0
	bl ov91_0225E728
	ldr r0, _0225EA50 ; =0x000019CC
	add r1, r5, #0
	add r0, r6, r0
	add r1, #0x2c
	add r2, sp, #0xc
	add r3, sp, #0
	bl ov91_0225DE8C
	add r4, r0, #0
	add r0, r5, #0
	add r1, sp, #0xc
	bl ov91_0225EA54
	cmp r4, #3
	beq _0225EA24
	cmp r4, #1
	bne _0225EA2C
_0225EA24:
	add r0, r5, #0
	add r1, sp, #0
	bl ov91_0225EA54
_0225EA2C:
	ldrh r0, [r5, #2]
	add r0, r0, #1
	strh r0, [r5, #2]
	mov r0, #0x38
	ldrsh r1, [r5, r0]
	sub r1, r1, #1
	strh r1, [r5, #0x38]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _0225EA4C
	ldrh r3, [r5, #0x3a]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #1
	bl ov91_0225E3F4
_0225EA4C:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225EA50: .word 0x000019CC
	thumb_func_end ov91_0225E9F4

	thumb_func_start ov91_0225EA54
ov91_0225EA54: ; 0x0225EA54
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x2c
	add r2, r0, #0
	bl VEC_Add
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x2c]
	str r0, [sp]
	ldr r0, [r4, #0x34]
	str r0, [sp, #8]
	add r0, sp, #0
	bl VEC_Mag
	str r0, [r4, #0x40]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225EA54

	thumb_func_start ov91_0225EA7C
ov91_0225EA7C: ; 0x0225EA7C
	push {r3, lr}
	ldr r1, _0225EA94 ; =gSystem + 0x40
	ldrh r1, [r1, #0x26]
	cmp r1, #0
	bne _0225EA8C
	bl ov91_0225EA98
	pop {r3, pc}
_0225EA8C:
	bl ov91_0225EC7C
	pop {r3, pc}
	nop
_0225EA94: .word gSystem + 0x40
	thumb_func_end ov91_0225EA7C

	thumb_func_start ov91_0225EA98
ov91_0225EA98: ; 0x0225EA98
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	mov r4, #0
	cmp r0, #0
	bne _0225EAB0
	ldr r0, [r5, #0x48]
	add sp, #0x30
	add r0, r0, #1
	str r0, [r5, #0x48]
	pop {r4, r5, r6, pc}
_0225EAB0:
	add r0, r5, #0
	add r0, #0x20
	add r1, sp, #4
	bl ov91_0225EE48
	cmp r0, #0
	bne _0225EAC2
	bl GF_AssertFail
_0225EAC2:
	add r0, r5, #0
	add r0, #0x20
	add r1, sp, #0
	bl ov91_0225EE64
	cmp r0, #0
	bne _0225EAD4
	bl GF_AssertFail
_0225EAD4:
	add r0, r5, #0
	add r0, #0x20
	bl ov91_0225EE88
	add r6, r0, #0
	cmp r6, #2
	bge _0225EAE4
	b _0225EC44
_0225EAE4:
	ldr r0, [r5, #0x14]
	add r1, sp, #0
	strh r0, [r1, #8]
	mov r3, #0
	strh r3, [r1, #0xa]
	mov r0, #4
	ldrsh r2, [r1, r0]
	ldrsh r0, [r1, r3]
	add r1, r6, #0
	sub r0, r2, r0
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r0, r0, #4
	str r0, [sp, #0xc]
	add r1, sp, #0
	mov r0, #6
	ldrsh r2, [r1, r0]
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r1, r6, #0
	sub r0, r2, r0
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r0, r0, #4
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0xc
	bl VEC_Mag
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bge _0225EB74
	cmp r0, #0
	beq _0225EB70
	add r0, sp, #0xc
	add r1, r0, #0
	bl VEC_Normalize
	ldr r3, [sp, #0xc]
	asr r1, r3, #0x1f
	lsr r0, r3, #0x11
	lsl r2, r1, #0xf
	orr r2, r0
	mov r0, #2
	lsl r3, r3, #0xf
	mov r1, #0
	lsl r0, r0, #0xa
	add r3, r3, r0
	adc r2, r1
	lsl r2, r2, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	ldr r2, [sp, #0x14]
	str r3, [sp, #0xc]
	asr r3, r2, #0x1f
	lsr r6, r2, #0x11
	lsl r3, r3, #0xf
	orr r3, r6
	lsl r2, r2, #0xf
	add r2, r2, r0
	adc r3, r1
	lsl r0, r3, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [sp, #0x14]
	b _0225EBBC
_0225EB70:
	mov r4, #1
	b _0225EBBC
_0225EB74:
	ldr r1, _0225EC6C ; =0x0001E200
	cmp r0, r1
	ble _0225EBBC
	add r0, sp, #0xc
	add r1, r0, #0
	bl VEC_Normalize
	ldr r0, [sp, #0xc]
	ldr r2, _0225EC6C ; =0x0001E200
	asr r1, r0, #0x1f
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	ldr r0, [sp, #0x14]
	str r1, [sp, #0xc]
	ldr r2, _0225EC6C ; =0x0001E200
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [sp, #0x14]
_0225EBBC:
	cmp r4, #0
	bne _0225EC46
	mov r0, #0x26
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	add r0, sp, #0xc
	bl VEC_Mag
	ldr r2, _0225EC70 ; =0x0000099A
	asr r1, r0, #0x1f
	mov r3, #0
	str r0, [sp, #0x18]
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	add r0, sp, #0xc
	str r1, [sp, #0x18]
	add r1, r0, #0
	bl VEC_Normalize
	add r2, sp, #0
	mov r0, #0
	mov r1, #2
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	add r2, sp, #0x1c
	bl ov91_02260400
	mov r0, #0
	str r0, [sp, #0x20]
	add r2, sp, #0
	add r0, sp, #0x1c
	ldrh r2, [r2, #8]
	ldr r3, [r5, #0x10]
	add r1, r0, #0
	bl ov91_0226045C
	add r2, sp, #0
	add r0, sp, #0xc
	ldrh r2, [r2, #8]
	ldr r3, [r5, #0x10]
	add r1, r0, #0
	bl ov91_0226045C
	ldr r0, [r5, #0x1c]
	cmp r0, #5
	blt _0225EC2E
	mov r0, #1
	str r0, [sp, #0x2c]
	b _0225EC32
_0225EC2E:
	mov r0, #0
	str r0, [sp, #0x2c]
_0225EC32:
	add r0, r5, #0
	add r1, sp, #8
	mov r2, #1
	bl ov91_0225E2E4
	ldr r0, _0225EC74 ; =0x0000064F
	bl PlaySE
	b _0225EC46
_0225EC44:
	mov r4, #1
_0225EC46:
	cmp r4, #1
	bne _0225EC5C
	add r3, sp, #0
	mov r1, #0
	mov r2, #2
	ldr r0, _0225EC78 ; =0x0000854C
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, r5, r0
	bl ov91_02260E88
_0225EC5C:
	add r0, r5, #0
	bl ov91_0225EE9C
	mov r0, #0
	str r0, [r5, #0x48]
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_0225EC6C: .word 0x0001E200
_0225EC70: .word 0x0000099A
_0225EC74: .word 0x0000064F
_0225EC78: .word 0x0000854C
	thumb_func_end ov91_0225EA98

	thumb_func_start ov91_0225EC7C
ov91_0225EC7C: ; 0x0225EC7C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, [r4, #0x20]
	cmp r1, #0
	bne _0225ECA4
	bl ov91_0225ED6C
	cmp r0, #1
	bne _0225ECA4
	mov r0, #1
	str r0, [r4, #0x20]
	ldr r0, _0225ED5C ; =0x00008544
	add r0, r4, r0
	bl ov91_02260CB4
	ldr r0, _0225ED60 ; =0x000021A8
	add r0, r4, r0
	bl ov91_022614D4
_0225ECA4:
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _0225ED56
	ldr r1, _0225ED64 ; =0x000086EC
	ldrh r0, [r4, r1]
	cmp r0, #1
	bne _0225ECDA
	add r0, r1, #2
	ldrh r0, [r4, r0]
	add r2, sp, #0
	mov r3, sp
	strh r0, [r2]
	add r0, r1, #4
	ldrh r0, [r4, r0]
	sub r3, r3, #4
	add r4, #0x20
	strh r0, [r2, #2]
	ldrh r1, [r2]
	add r0, r4, #0
	strh r1, [r3]
	ldrh r1, [r2, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov91_0225EDC8
	add sp, #4
	pop {r3, r4, pc}
_0225ECDA:
	cmp r0, #2
	blo _0225ED34
	add r0, r1, #2
	ldrh r0, [r4, r0]
	add r2, sp, #0
	mov r3, sp
	strh r0, [r2]
	add r0, r1, #4
	ldrh r0, [r4, r0]
	sub r3, r3, #4
	strh r0, [r2, #2]
	ldrh r1, [r2]
	add r0, r4, #0
	add r0, #0x20
	strh r1, [r3]
	ldrh r1, [r2, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov91_0225EDC8
	ldr r0, _0225ED64 ; =0x000086EC
	ldrh r1, [r4, r0]
	sub r1, r1, #1
	lsl r1, r1, #3
	add r3, r4, r1
	add r1, r0, #2
	ldrh r2, [r3, r1]
	add r1, sp, #0
	add r0, r0, #4
	strh r2, [r1]
	ldrh r0, [r3, r0]
	mov r3, sp
	sub r3, r3, #4
	strh r0, [r1, #2]
	ldrh r2, [r1]
	add r4, #0x20
	add r0, r4, #0
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov91_0225EDC8
	add sp, #4
	pop {r3, r4, pc}
_0225ED34:
	ldr r0, _0225ED68 ; =gSystem + 0x40
	mov r3, sp
	ldrh r2, [r0, #0x20]
	add r1, sp, #0
	sub r3, r3, #4
	strh r2, [r1]
	ldrh r0, [r0, #0x22]
	add r4, #0x20
	strh r0, [r1, #2]
	ldrh r2, [r1]
	add r0, r4, #0
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov91_0225EDC8
_0225ED56:
	add sp, #4
	pop {r3, r4, pc}
	nop
_0225ED5C: .word 0x00008544
_0225ED60: .word 0x000021A8
_0225ED64: .word 0x000086EC
_0225ED68: .word gSystem + 0x40
	thumb_func_end ov91_0225EC7C

	thumb_func_start ov91_0225ED6C
ov91_0225ED6C: ; 0x0225ED6C
	push {r3, lr}
	ldr r0, [r0, #0x48]
	cmp r0, #2
	bhs _0225ED78
	mov r0, #0
	pop {r3, pc}
_0225ED78:
	ldr r1, _0225EDA8 ; =gSystem + 0x40
	mov r0, #0x80
	ldrh r2, [r1, #0x20]
	ldrh r1, [r1, #0x22]
	sub r3, r0, r2
	sub r0, #0xe0
	sub r2, r0, r1
	add r1, r3, #0
	add r0, r2, #0
	mul r1, r3
	mul r0, r2
	add r0, r1, r0
	lsl r0, r0, #0xc
	bl FX_Sqrt
	asr r1, r0, #0xc
	ldr r0, _0225EDAC ; =0x0000011E
	cmp r1, r0
	bgt _0225EDA2
	mov r0, #1
	pop {r3, pc}
_0225EDA2:
	mov r0, #0
	pop {r3, pc}
	nop
_0225EDA8: .word gSystem + 0x40
_0225EDAC: .word 0x0000011E
	thumb_func_end ov91_0225ED6C

	thumb_func_start ov91_0225EDB0
ov91_0225EDB0: ; 0x0225EDB0
	push {r4, lr}
	add r4, r0, #0
	add r0, r4, #4
	mov r1, #0
	mov r2, #0x20
	bl memset
	mov r0, #0
	strh r0, [r4, #0x24]
	strh r0, [r4, #0x26]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225EDB0

	thumb_func_start ov91_0225EDC8
ov91_0225EDC8: ; 0x0225EDC8
	push {r0, r1, r2, r3}
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrh r1, [r4, #0x26]
	add r1, r1, #1
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1d
	sub r2, r2, r3
	mov r1, #0x1d
	ror r2, r1
	ldrh r1, [r4, #0x24]
	add r2, r3, r2
	cmp r2, r1
	bne _0225EDEC
	add r1, sp, #0
	bl ov91_0225EE18
_0225EDEC:
	ldrh r0, [r4, #0x26]
	lsl r0, r0, #2
	add r2, r4, r0
	add r0, sp, #0x10
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldrh r0, [r0, #6]
	strh r0, [r2, #6]
	ldrh r0, [r4, #0x26]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	strh r0, [r4, #0x26]
	add sp, #4
	pop {r3, r4}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov91_0225EDC8

	thumb_func_start ov91_0225EE18
ov91_0225EE18: ; 0x0225EE18
	ldrh r3, [r0, #0x24]
	ldrh r2, [r0, #0x26]
	cmp r2, r3
	bne _0225EE24
	mov r0, #0
	bx lr
_0225EE24:
	lsl r2, r3, #2
	add r3, r0, r2
	ldrh r2, [r3, #4]
	strh r2, [r1]
	ldrh r2, [r3, #6]
	strh r2, [r1, #2]
	ldrh r1, [r0, #0x24]
	add r1, r1, #1
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1d
	sub r2, r2, r3
	mov r1, #0x1d
	ror r2, r1
	add r1, r3, r2
	strh r1, [r0, #0x24]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225EE18

	thumb_func_start ov91_0225EE48
ov91_0225EE48: ; 0x0225EE48
	ldrh r3, [r0, #0x24]
	ldrh r2, [r0, #0x26]
	cmp r2, r3
	bne _0225EE54
	mov r0, #0
	bx lr
_0225EE54:
	lsl r2, r3, #2
	add r2, r0, r2
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #2]
	mov r0, #1
	bx lr
	thumb_func_end ov91_0225EE48

	thumb_func_start ov91_0225EE64
ov91_0225EE64: ; 0x0225EE64
	ldrh r3, [r0, #0x26]
	ldrh r2, [r0, #0x24]
	cmp r3, r2
	bne _0225EE70
	mov r0, #0
	bx lr
_0225EE70:
	sub r2, r3, #1
	bpl _0225EE76
	add r2, #8
_0225EE76:
	lsl r2, r2, #2
	add r2, r0, r2
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #2]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225EE64

	thumb_func_start ov91_0225EE88
ov91_0225EE88: ; 0x0225EE88
	ldrh r2, [r0, #0x26]
	ldrh r1, [r0, #0x24]
	cmp r1, r2
	bls _0225EE98
	mov r0, #8
	sub r0, r0, r1
	add r0, r0, r2
	bx lr
_0225EE98:
	sub r0, r2, r1
	bx lr
	thumb_func_end ov91_0225EE88

	thumb_func_start ov91_0225EE9C
ov91_0225EE9C: ; 0x0225EE9C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, #0x20]
	add r0, r4, #0
	add r0, #0x20
	bl ov91_0225EDB0
	ldr r0, _0225EEB8 ; =0x00008544
	add r0, r4, r0
	bl ov91_02260D00
	pop {r4, pc}
	nop
_0225EEB8: .word 0x00008544
	thumb_func_end ov91_0225EE9C

	thumb_func_start ov91_0225EEBC
ov91_0225EEBC: ; 0x0225EEBC
	push {r3, lr}
	add r3, r0, #0
	mov r0, #0x10
	str r0, [r3, #0x48]
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0
	bl ov91_0225F05C
	pop {r3, pc}
	thumb_func_end ov91_0225EEBC

	thumb_func_start ov91_0225EED0
ov91_0225EED0: ; 0x0225EED0
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r2, r3, #0
	add r0, r4, #0
	add r1, r6, #0
	add r3, sp, #0x18
	bl ov91_0225F05C
	add r2, sp, #0x30
	ldrh r2, [r2, #0x10]
	add r0, r4, #0
	add r1, r6, #0
	add r3, sp, #0
	bl ov91_0225F05C
	add r2, r5, #0
	add r3, sp, #0x18
	add r2, #0x18
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r3, sp, #0x18
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r1, [sp]
	ldr r0, [sp, #0x18]
	sub r0, r1, r0
	str r0, [r5, #0x30]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x20]
	sub r0, r1, r0
	str r0, [r5, #0x38]
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x28]
	sub r0, r1, r0
	str r0, [r5, #0x40]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	sub r0, r1, r0
	str r0, [r5, #0x44]
	ldr r2, [sp, #4]
	ldr r0, _0225EF6C ; =0x0000FFFF
	ldr r3, [sp, #0x1c]
	add r0, r2, r0
	sub r1, r0, r3
	sub r0, r2, r3
	cmp r0, r1
	bge _0225EF4A
	str r0, [r5, #0x34]
	b _0225EF4C
_0225EF4A:
	str r1, [r5, #0x34]
_0225EF4C:
	ldr r2, [sp, #0xc]
	ldr r0, _0225EF6C ; =0x0000FFFF
	ldr r3, [sp, #0x24]
	add r0, r2, r0
	sub r1, r0, r3
	sub r0, r2, r3
	cmp r0, r1
	bge _0225EF60
	str r0, [r5, #0x3c]
	b _0225EF62
_0225EF60:
	str r1, [r5, #0x3c]
_0225EF62:
	mov r0, #0
	str r0, [r5, #0x48]
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_0225EF6C: .word 0x0000FFFF
	thumb_func_end ov91_0225EED0

	thumb_func_start ov91_0225EF70
ov91_0225EF70: ; 0x0225EF70
	push {r3, r4}
	ldr r1, [r0, #0x48]
	cmp r1, #0x10
	blt _0225EF7E
	mov r0, #1
	pop {r3, r4}
	bx lr
_0225EF7E:
	add r2, r1, #1
	str r2, [r0, #0x48]
	ldr r1, [r0, #0x30]
	ldr r3, [r0, #0x18]
	mul r2, r1
	asr r1, r2, #3
	lsr r1, r1, #0x1c
	add r1, r2, r1
	asr r1, r1, #4
	add r1, r3, r1
	str r1, [r0]
	ldr r2, [r0, #0x34]
	ldr r1, [r0, #0x48]
	add r3, r2, #0
	mul r3, r1
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	ldr r4, [r0, #0x1c]
	asr r1, r1, #4
	add r1, r4, r1
	str r1, [r0, #4]
	ldr r2, [r0, #0x38]
	ldr r1, [r0, #0x48]
	add r3, r2, #0
	mul r3, r1
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	ldr r4, [r0, #0x20]
	asr r1, r1, #4
	add r1, r4, r1
	str r1, [r0, #8]
	ldr r2, [r0, #0x3c]
	ldr r1, [r0, #0x48]
	add r3, r2, #0
	mul r3, r1
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	ldr r4, [r0, #0x24]
	asr r1, r1, #4
	add r1, r4, r1
	str r1, [r0, #0xc]
	ldr r2, [r0, #0x40]
	ldr r1, [r0, #0x48]
	add r3, r2, #0
	mul r3, r1
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	ldr r4, [r0, #0x28]
	asr r1, r1, #4
	add r1, r4, r1
	str r1, [r0, #0x10]
	ldr r2, [r0, #0x44]
	ldr r1, [r0, #0x48]
	add r3, r2, #0
	mul r3, r1
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	ldr r4, [r0, #0x2c]
	asr r1, r1, #4
	add r1, r4, r1
	str r1, [r0, #0x14]
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov91_0225EF70

	thumb_func_start ov91_0225F008
ov91_0225F008: ; 0x0225F008
	ldr r3, _0225F00C ; =ov91_0225F010
	bx r3
	.balign 4, 0
_0225F00C: .word ov91_0225F010
	thumb_func_end ov91_0225F008

	thumb_func_start ov91_0225F010
ov91_0225F010: ; 0x0225F010
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #4]
	add r5, r0, #0
	ldr r0, _0225F054 ; =0x000019CC
	lsl r1, r1, #0x10
	add r0, r5, r0
	lsr r1, r1, #0x10
	bl ov91_0225E1E0
	ldr r0, _0225F058 ; =0x00001AB4
	ldr r1, [r4, #8]
	add r0, r5, r0
	bl ov91_0226137C
	ldr r1, [r4, #0xc]
	ldr r0, _0225F058 ; =0x00001AB4
	lsl r1, r1, #0x10
	add r0, r5, r0
	lsr r1, r1, #0x10
	bl ov91_02261384
	ldr r0, _0225F054 ; =0x000019CC
	ldr r1, [r4, #0x10]
	add r0, r5, r0
	bl ov91_0225E1E4
	ldr r0, _0225F054 ; =0x000019CC
	ldr r1, [r4, #0x14]
	add r0, r5, r0
	bl ov91_0225E09C
	pop {r3, r4, r5, pc}
	nop
_0225F054: .word 0x000019CC
_0225F058: .word 0x00001AB4
	thumb_func_end ov91_0225F010

	thumb_func_start ov91_0225F05C
ov91_0225F05C: ; 0x0225F05C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r2, #0
	add r7, r1, #0
	add r4, r3, #0
	cmp r6, r0
	blo _0225F070
	bl GF_AssertFail
_0225F070:
	mov r0, #0x18
	ldr r1, [r5, #4]
	mul r0, r6
	add r3, r1, r0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [r4, #0xc]
	ldrb r0, [r7]
	cmp r0, #0
	beq _0225F0B2
	add r1, r6, #1
	mov r0, #6
	sub r2, r0, r1
	bpl _0225F0A6
	mov r2, #0
_0225F0A6:
	mov r0, #0x18
	ldr r1, [r5, #4]
	mul r0, r2
	add r0, r1, r0
	ldr r0, [r0, #0x14]
	str r0, [r4, #0x14]
_0225F0B2:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0225F0BE
	ldr r0, [r4, #4]
	neg r0, r0
	str r0, [r4, #4]
_0225F0BE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225F05C

	thumb_func_start ov91_0225F0C0
ov91_0225F0C0: ; 0x0225F0C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #0
	mov r2, #0x40
	add r5, r0, #0
	bl memset
	mov r0, #0xc8
	add r1, r6, #0
	bl NARC_ctor
	mov r1, #0x78
	add r7, r0, #0
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	add r1, #0xd0
	ldr r0, [r4, r1]
	add r1, r7, #0
	mov r2, #0x15
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r5]
	mov r1, #0x78
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	add r1, #0xd4
	ldr r0, [r4, r1]
	add r1, r7, #0
	mov r2, #0x14
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	str r0, [r5, #4]
	mov r1, #0x78
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	add r1, #0xd8
	ldr r0, [r4, r1]
	add r1, r7, #0
	mov r2, #0x16
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #8]
	mov r1, #0x78
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	add r1, #0xdc
	ldr r0, [r4, r1]
	add r1, r7, #0
	mov r2, #0x17
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0xc]
	ldr r0, [r5]
	bl sub_0200AE18
	cmp r0, #0
	bne _0225F154
	bl GF_AssertFail
_0225F154:
	ldr r0, [r5, #4]
	bl sub_0200B00C
	cmp r0, #0
	bne _0225F162
	bl GF_AssertFail
_0225F162:
	ldr r0, [r5]
	bl sub_0200A740
	ldr r0, [r5, #4]
	bl sub_0200A740
	mov r1, #0x78
	add r0, r1, #0
	add r2, r1, #0
	str r1, [sp]
	sub r0, #0x79
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r2, #0xd0
	ldr r2, [r4, r2]
	add r3, r1, #0
	str r2, [sp, #0x14]
	add r2, r1, #0
	add r2, #0xd4
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	add r2, r1, #0
	add r2, #0xd8
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	add r2, r1, #0
	add r2, #0xdc
	ldr r2, [r4, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, #0
	add r0, #0x10
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x2c]
	add r0, r5, #0
	add r0, #0x10
	str r0, [sp, #0x30]
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x34]
	mov r0, #0x9e
	lsl r0, r0, #0xe
	str r0, [sp, #0x38]
	mov r0, #0
	str r0, [sp, #0x40]
	mov r0, #2
	str r0, [sp, #0x44]
	add r0, sp, #0x2c
	str r6, [sp, #0x48]
	bl sub_02024714
	mov r1, #0
	str r0, [r5, #0x34]
	bl Set2dSpriteVisibleFlag
	add r0, r7, #0
	bl NARC_dtor
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov91_0225F0C0

	thumb_func_start ov91_0225F1E8
ov91_0225F1E8: ; 0x0225F1E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	add r4, r1, #0
	bl sub_02024758
	ldr r0, [r5]
	bl sub_0200AEB0
	ldr r0, [r5, #4]
	bl sub_0200B0A8
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5]
	bl DestroySingle2DGfxResObj
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #4]
	bl DestroySingle2DGfxResObj
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #8]
	bl DestroySingle2DGfxResObj
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #0xc]
	bl DestroySingle2DGfxResObj
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x40
	bl memset
	pop {r3, r4, r5, pc}
	thumb_func_end ov91_0225F1E8

	thumb_func_start ov91_0225F23C
ov91_0225F23C: ; 0x0225F23C
	add r2, r0, #0
	mov r1, #1
	add r2, #0x38
	strb r1, [r2]
	add r2, r0, #0
	mov r3, #0
	add r2, #0x3a
	strb r3, [r2]
	add r2, r0, #0
	add r2, #0x39
	strb r3, [r2]
	ldr r3, _0225F258 ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, #0x34]
	bx r3
	.balign 4, 0
_0225F258: .word Set2dSpriteVisibleFlag
	thumb_func_end ov91_0225F23C

	thumb_func_start ov91_0225F25C
ov91_0225F25C: ; 0x0225F25C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0x3a
	ldrb r0, [r0]
	add r5, r1, #0
	cmp r0, #3
	bhi _0225F36A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F278: ; jump table
	.short _0225F280 - _0225F278 - 2 ; case 0
	.short _0225F2B2 - _0225F278 - 2 ; case 1
	.short _0225F340 - _0225F278 - 2 ; case 2
	.short _0225F352 - _0225F278 - 2 ; case 3
_0225F280:
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl sub_020249D4
	ldr r0, _0225F37C ; =0x00008544
	add r0, r5, r0
	bl ov91_02260CB4
	ldr r0, _0225F37C ; =0x00008544
	mov r1, #0x80
	add r0, r5, r0
	mov r2, #0xb1
	bl ov91_02260CE0
	add r0, r4, #0
	mov r1, #0
	add r0, #0x3b
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x3a
	ldrb r0, [r0]
	add r4, #0x3a
	add r0, r0, #1
	strb r0, [r4]
	b _0225F36A
_0225F2B2:
	mov r1, #2
	ldr r0, [r4, #0x34]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, [r4, #0x34]
	bl sub_020249F8
	add r6, r0, #0
	cmp r6, #0xa
	beq _0225F2CE
	cmp r6, #0xb
	beq _0225F2FA
	b _0225F32E
_0225F2CE:
	add r0, r4, #0
	add r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225F32E
	mov r0, #0x40
	str r0, [sp]
	mov r0, #2
	mov r1, #0x80
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0x60
	add r3, r1, #0
	bl ov91_0225D500
	ldr r0, _0225F380 ; =0x0000064F
	bl PlaySE
	mov r0, #1
	add r4, #0x3b
	strb r0, [r4]
	b _0225F32E
_0225F2FA:
	add r0, r4, #0
	add r0, #0x39
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x39
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x39
	ldrb r0, [r0]
	cmp r0, #2
	blo _0225F31A
	mov r0, #3
	add r4, #0x3a
	strb r0, [r4]
	b _0225F326
_0225F31A:
	add r0, r4, #0
	mov r1, #2
	add r0, #0x3a
	strb r1, [r0]
	mov r0, #0x10
	str r0, [r4, #0x3c]
_0225F326:
	ldr r0, _0225F37C ; =0x00008544
	add r0, r5, r0
	bl ov91_02260D00
_0225F32E:
	ldr r2, _0225F384 ; =ov91_02261C84
	lsl r3, r6, #1
	ldr r0, _0225F37C ; =0x00008544
	ldrsh r2, [r2, r3]
	add r0, r5, r0
	mov r1, #0x80
	bl ov91_02260CE0
	b _0225F36A
_0225F340:
	ldr r0, [r4, #0x3c]
	sub r0, r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0
	bgt _0225F36A
	mov r0, #0
	add r4, #0x3a
	strb r0, [r4]
	b _0225F36A
_0225F352:
	add r0, r5, #0
	bl ov91_0225E6D0
	cmp r0, #0
	bne _0225F36A
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225F36A:
	add r0, r5, #0
	bl ov91_0225E40C
	add r0, r5, #0
	bl ov91_0225E62C
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225F37C: .word 0x00008544
_0225F380: .word 0x0000064F
_0225F384: .word ov91_02261C84
	thumb_func_end ov91_0225F25C

	thumb_func_start ov91_0225F388
ov91_0225F388: ; 0x0225F388
	add r3, r0, #0
	mov r2, #0x18
	mov r1, #0
_0225F38E:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _0225F38E
	ldr r1, _0225F39C ; =0x0000FFFF
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
_0225F39C: .word 0x0000FFFF
	thumb_func_end ov91_0225F388

	thumb_func_start ov91_0225F3A0
ov91_0225F3A0: ; 0x0225F3A0
	push {r3, r4}
	lsl r3, r2, #2
	str r1, [r0, r3]
	mov r3, #1
	ldr r4, [r0, #0x10]
	lsl r3, r2
	orr r3, r4
	str r3, [r0, #0x10]
	cmp r1, #0
	beq _0225F3CC
	ldr r4, [r0, #0x14]
	ldr r3, _0225F3D0 ; =0x0000FFFF
	cmp r4, r3
	beq _0225F3CA
	lsl r3, r4, #2
	ldr r3, [r0, r3]
	cmp r3, r1
	bhs _0225F3CC
	str r2, [r0, #0x14]
	pop {r3, r4}
	bx lr
_0225F3CA:
	str r2, [r0, #0x14]
_0225F3CC:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0225F3D0: .word 0x0000FFFF
	thumb_func_end ov91_0225F3A0

	thumb_func_start ov91_0225F3D4
ov91_0225F3D4: ; 0x0225F3D4
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r1, _0225F3E0 ; =0x0000FFFF
	str r1, [r0, #0x14]
	bx lr
	nop
_0225F3E0: .word 0x0000FFFF
	thumb_func_end ov91_0225F3D4

	thumb_func_start ov91_0225F3E4
ov91_0225F3E4: ; 0x0225F3E4
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end ov91_0225F3E4

	thumb_func_start ov91_0225F3E8
ov91_0225F3E8: ; 0x0225F3E8
	push {r4, r5}
	mov r4, #0
	ldr r5, [r0, #0x10]
	add r3, r4, #0
	mov r0, #1
_0225F3F2:
	add r2, r0, #0
	lsl r2, r3
	tst r2, r5
	beq _0225F3FC
	add r4, r4, #1
_0225F3FC:
	add r3, r3, #1
	cmp r3, #4
	blt _0225F3F2
	cmp r1, r4
	bhi _0225F40C
	mov r0, #1
	pop {r4, r5}
	bx lr
_0225F40C:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225F3E8

	thumb_func_start ov91_0225F414
ov91_0225F414: ; 0x0225F414
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0225F430 ; =ov91_02261D84
	add r3, sp, #0
	mov r2, #5
_0225F41E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225F41E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0225F430: .word ov91_02261D84
	thumb_func_end ov91_0225F414

	thumb_func_start ov91_0225F434
ov91_0225F434: ; 0x0225F434
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0225F4A4 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0225F4A8 ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0225F4AC ; =0x0000CFFB
	and r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #8
	orr r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r1, #0
	ldr r0, _0225F4B0 ; =0x00006B5A
	ldr r2, _0225F4B4 ; =0x00007FFF
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	ldr r1, _0225F4B8 ; =0xBFFF0000
	ldr r0, _0225F4BC ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_0225F4A4: .word 0x04000008
_0225F4A8: .word 0xFFFFCFFD
_0225F4AC: .word 0x0000CFFB
_0225F4B0: .word 0x00006B5A
_0225F4B4: .word 0x00007FFF
_0225F4B8: .word 0xBFFF0000
_0225F4BC: .word 0x04000580
	thumb_func_end ov91_0225F434

	thumb_func_start ov91_0225F4C0
ov91_0225F4C0: ; 0x0225F4C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, _0225F4F4 ; =ov91_0225F434
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #1
	add r3, r1, #0
	bl GF_3DVramMan_Create
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	add r3, r4, #0
	bl ov91_0225FD2C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F4F4: .word ov91_0225F434
	thumb_func_end ov91_0225F4C0

	thumb_func_start ov91_0225F4F8
ov91_0225F4F8: ; 0x0225F4F8
	push {r4, lr}
	add r4, r0, #0
	bl ov91_0225FDC8
	ldr r0, [r4, #0x18]
	bl GF_3DVramMan_Delete
	pop {r4, pc}
	thumb_func_end ov91_0225F4F8

	thumb_func_start ov91_0225F508
ov91_0225F508: ; 0x0225F508
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0225F638 ; =0x000086CC
	mov r2, #0x20
	add r0, r5, r0
	add r4, r1, #0
	bl GF_ExpHeap_FndInitAllocator
	bl ov91_0225F414
	ldr r0, _0225F63C ; =0x00001AB4
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0x14]
	add r0, r5, r0
	add r3, r4, #0
	bl ov91_0225F4C0
	ldr r0, _0225F63C ; =0x00001AB4
	add r1, r4, #0
	add r0, r5, r0
	bl ov91_0225F878
	ldr r0, _0225F63C ; =0x00001AB4
	add r1, r4, #0
	add r0, r5, r0
	bl ov91_0225FA9C
	ldr r0, _0225F63C ; =0x00001AB4
	add r1, r4, #0
	add r0, r5, r0
	bl ov91_0225FCD8
	mov r0, #0xbd
	add r1, r4, #0
	bl NARC_ctor
	add r6, r0, #0
	ldr r0, _0225F63C ; =0x00001AB4
	add r1, r6, #0
	add r0, r5, r0
	add r2, r4, #0
	bl ov91_0225FB80
	ldr r0, [r5, #0x14]
	ldr r1, _0225F63C ; =0x00001AB4
	str r0, [sp]
	ldr r0, _0225F638 ; =0x000086CC
	str r4, [sp, #4]
	add r0, r5, r0
	str r0, [sp, #8]
	ldr r0, _0225F640 ; =0x00001C54
	ldr r3, [r5, #0x10]
	add r0, r5, r0
	add r1, r5, r1
	add r2, r6, #0
	bl ov91_02260F50
	ldr r0, _0225F644 ; =0x00001F74
	ldr r3, _0225F638 ; =0x000086CC
	add r0, r5, r0
	add r1, r6, #0
	add r2, r4, #0
	add r3, r5, r3
	bl ov91_0225FF00
	ldr r0, _0225F63C ; =0x00001AB4
	add r1, r6, #0
	add r0, r5, r0
	add r2, r4, #0
	bl ov91_022604F4
	ldr r0, _0225F63C ; =0x00001AB4
	ldr r1, _0225F648 ; =0x00008544
	ldr r2, [r5, #0x14]
	add r0, r5, r0
	add r1, r5, r1
	add r3, r4, #0
	bl ov91_02260C48
	ldr r0, _0225F63C ; =0x00001AB4
	ldr r1, _0225F64C ; =0x0000854C
	ldr r2, [r5, #0x14]
	add r0, r5, r0
	add r1, r5, r1
	add r3, r4, #0
	bl ov91_02260D14
	ldr r0, _0225F63C ; =0x00001AB4
	ldr r2, [r5, #0x14]
	add r0, r5, r0
	add r1, r6, #0
	add r3, r4, #0
	bl ov91_0225FDE0
	ldr r0, [r5, #0x14]
	ldr r1, _0225F63C ; =0x00001AB4
	str r0, [sp]
	str r6, [sp, #4]
	str r4, [sp, #8]
	ldr r2, _0225F650 ; =0x0000877C
	ldr r0, _0225F654 ; =0x00001F38
	ldr r2, [r5, r2]
	ldr r3, [r5, #0x10]
	add r0, r5, r0
	add r1, r5, r1
	bl ov91_0225D8F0
	ldr r0, _0225F63C ; =0x00001AB4
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0x14]
	add r0, r5, r0
	add r3, r4, #0
	bl ov91_0225DBD0
	str r4, [sp]
	ldr r0, _0225F658 ; =0x00001E38
	ldr r1, _0225F63C ; =0x00001AB4
	ldr r2, [r5, #0x10]
	ldr r3, [r5, #0x14]
	add r0, r5, r0
	add r1, r5, r1
	bl ov91_0225D628
	ldr r1, [r5, #0x14]
	ldr r0, _0225F65C ; =0x000021A8
	lsl r1, r1, #0x18
	add r0, r5, r0
	lsr r1, r1, #0x18
	bl ov91_022613AC
	ldr r0, _0225F660 ; =0x0000862C
	ldr r1, _0225F63C ; =0x00001AB4
	add r0, r5, r0
	add r1, r5, r1
	add r2, r6, #0
	add r3, r4, #0
	bl ov91_02261580
	add r0, r6, #0
	bl NARC_dtor
	ldr r0, _0225F664 ; =0x00001AD0
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl ov90_02258BD4
	ldr r1, _0225F668 ; =0x000021A4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0225F638: .word 0x000086CC
_0225F63C: .word 0x00001AB4
_0225F640: .word 0x00001C54
_0225F644: .word 0x00001F74
_0225F648: .word 0x00008544
_0225F64C: .word 0x0000854C
_0225F650: .word 0x0000877C
_0225F654: .word 0x00001F38
_0225F658: .word 0x00001E38
_0225F65C: .word 0x000021A8
_0225F660: .word 0x0000862C
_0225F664: .word 0x00001AD0
_0225F668: .word 0x000021A4
	thumb_func_end ov91_0225F508

	thumb_func_start ov91_0225F66C
ov91_0225F66C: ; 0x0225F66C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0225F71C ; =0x0000862C
	ldr r1, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_02261790
	ldr r0, _0225F724 ; =0x00001E38
	ldr r1, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_0225D67C
	ldr r0, _0225F720 ; =0x00001AB4
	ldr r1, [r4, #0x10]
	add r0, r4, r0
	bl ov91_0225DBE0
	ldr r0, _0225F728 ; =0x00001F38
	ldr r1, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_0225DB0C
	ldr r0, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0225FEFC
	ldr r0, _0225F720 ; =0x00001AB4
	ldr r1, _0225F72C ; =0x0000854C
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_02260D80
	ldr r0, _0225F730 ; =0x00008544
	add r0, r4, r0
	bl ov91_02260CA8
	ldr r0, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0226066C
	ldr r0, _0225F734 ; =0x00001F74
	ldr r1, _0225F738 ; =0x000086CC
	add r0, r4, r0
	add r1, r4, r1
	bl ov91_022600FC
	ldr r0, _0225F73C ; =0x00001C54
	ldr r1, _0225F720 ; =0x00001AB4
	ldr r2, _0225F738 ; =0x000086CC
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, r2
	bl ov91_02261070
	ldr r0, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0225FC84
	ldr r0, _0225F740 ; =0x000021A4
	ldr r0, [r4, r0]
	bl ov90_02258C38
	ldr r0, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0225FA60
	ldr r0, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0225FB48
	ldr r0, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0225FD0C
	ldr r0, _0225F720 ; =0x00001AB4
	add r0, r4, r0
	bl ov91_0225F4F8
	ldr r0, _0225F744 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0225F748 ; =0x04001050
	strh r1, [r0]
	pop {r4, pc}
	nop
_0225F71C: .word 0x0000862C
_0225F720: .word 0x00001AB4
_0225F724: .word 0x00001E38
_0225F728: .word 0x00001F38
_0225F72C: .word 0x0000854C
_0225F730: .word 0x00008544
_0225F734: .word 0x00001F74
_0225F738: .word 0x000086CC
_0225F73C: .word 0x00001C54
_0225F740: .word 0x000021A4
_0225F744: .word 0x04000050
_0225F748: .word 0x04001050
	thumb_func_end ov91_0225F66C

	thumb_func_start ov91_0225F74C
ov91_0225F74C: ; 0x0225F74C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x13
	ldr r1, _0225F798 ; =0x000019CC
	lsl r0, r0, #6
	ldr r2, [r5]
	add r0, r4, r0
	add r1, r5, r1
	bl ov91_0226014C
	mov r0, #0x13
	ldr r1, _0225F798 ; =0x000019CC
	lsl r0, r0, #6
	ldr r2, [r5]
	add r0, r4, r0
	add r1, r5, r1
	bl ov91_022601AC
	ldr r0, _0225F79C ; =0x00006A90
	add r0, r4, r0
	bl ov91_02260CC8
	add r0, r5, #0
	add r1, r4, #0
	bl ov91_0225F7A8
	ldr r0, _0225F7A0 ; =0x000006F4
	add r1, r4, #0
	add r0, r4, r0
	bl ov91_022613C8
	ldr r0, _0225F7A4 ; =0x00006B78
	add r0, r4, r0
	bl ov91_02261928
	pop {r3, r4, r5, pc}
	nop
_0225F798: .word 0x000019CC
_0225F79C: .word 0x00006A90
_0225F7A0: .word 0x000006F4
_0225F7A4: .word 0x00006B78
	thumb_func_end ov91_0225F74C

	thumb_func_start ov91_0225F7A8
ov91_0225F7A8: ; 0x0225F7A8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0225F868 ; =0x00006A98
	add r4, r1, #0
	add r0, r4, r0
	bl ov91_02260D98
	mov r0, #0xe1
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov91_0225D6A0
	bl sub_02026E48
	add r0, r4, #0
	bl ov91_0225FDD8
	mov r0, #0
	ldr r2, _0225F86C ; =0xFFFFF000
	add r1, r0, #0
	add r3, r0, #0
	bl NNS_G3dGlbLightVector
	ldr r1, _0225F870 ; =0x00007FFF
	mov r0, #0
	bl NNS_G3dGlbLightColor
	ldr r0, _0225F870 ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _0225F870 ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r0, #0x1a
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov91_022610A8
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #8
	str r2, [sp, #8]
	bl NNS_G3dGeBufferOP_N
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r0, #0x13
	ldr r1, _0225F874 ; =0x000019CC
	lsl r0, r0, #6
	add r0, r4, r0
	add r1, r5, r1
	bl ov91_0226023C
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #4
	str r2, [sp, #4]
	bl NNS_G3dGeBufferOP_N
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	ldr r1, [r5, #0x10]
	add r0, r4, #0
	bl ov91_0226078C
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	bl NNS_G3dGeBufferOP_N
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	ldr r0, [r4, #0x1c]
	bl sub_0202457C
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0225F868: .word 0x00006A98
_0225F86C: .word 0xFFFFF000
_0225F870: .word 0x00007FFF
_0225F874: .word 0x000019CC
	thumb_func_end ov91_0225F7A8

	thumb_func_start ov91_0225F878
ov91_0225F878: ; 0x0225F878
	push {r4, r5, r6, lr}
	sub sp, #0xc0
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl BgConfig_Alloc
	add r3, sp, #0xb0
	ldr r6, _0225FA44 ; =ov91_02261C74
	str r0, [r5]
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r6, _0225FA48 ; =ov91_02261C9C
	add r3, sp, #0x94
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r5]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r6, _0225FA4C ; =ov91_02261CB8
	add r3, sp, #0x78
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #2
	str r0, [r3]
	ldr r0, [r5]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r6, _0225FA50 ; =ov91_02261CD4
	add r3, sp, #0x5c
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #4
	str r0, [r3]
	ldr r0, [r5]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r6, _0225FA54 ; =ov91_02261CF0
	add r3, sp, #0x40
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #5
	str r0, [r3]
	ldr r0, [r5]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r6, _0225FA58 ; =ov91_02261D0C
	add r3, sp, #0x24
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #6
	str r0, [r3]
	ldr r0, [r5]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r6, _0225FA5C ; =ov91_02261D28
	add r3, sp, #8
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #7
	str r0, [r3]
	ldr r0, [r5]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0
	mov r1, #0xa0
	add r2, r4, #0
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	mov r1, #1
	ldr r0, [r5]
	add r2, r1, #0
	mov r3, #4
	bl LoadUserFrameGfx1
	add sp, #0xc0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225FA44: .word ov91_02261C74
_0225FA48: .word ov91_02261C9C
_0225FA4C: .word ov91_02261CB8
_0225FA50: .word ov91_02261CD4
_0225FA54: .word ov91_02261CF0
_0225FA58: .word ov91_02261D0C
_0225FA5C: .word ov91_02261D28
	thumb_func_end ov91_0225F878

	thumb_func_start ov91_0225FA60
ov91_0225FA60: ; 0x0225FA60
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov91_0225FA60

	thumb_func_start ov91_0225FA9C
ov91_0225FA9C: ; 0x0225FA9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r0, #0
	add r6, r1, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x1f
	str r3, [sp, #0xc]
	add r2, r0, #0
	str r6, [sp, #0x10]
	bl OamManager_Create
	ldr r4, _0225FB40 ; =ov91_02261C64
	add r3, sp, #0x14
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r1, _0225FB44 ; =0x00200010
	add r0, r2, #0
	add r2, r1, #0
	str r6, [sp, #0x20]
	bl sub_020215C0
	mov r0, #0x10
	add r1, r6, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	ldr r1, _0225FB44 ; =0x00200010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	add r1, r7, #0
	mov r0, #0x80
	add r1, #0x20
	add r2, r6, #0
	bl G2dRenderer_Init
	str r0, [r7, #0x1c]
	add r0, r7, #0
	mov r2, #2
	add r0, #0x20
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r4, #0
	add r5, r7, #0
_0225FB16:
	mov r0, #0x10
	add r1, r4, #0
	add r2, r6, #0
	bl Create2DGfxResObjMan
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225FB16
	mov r0, #8
	add r1, r6, #0
	bl sub_02013534
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r7, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FB40: .word ov91_02261C64
_0225FB44: .word 0x00200010
	thumb_func_end ov91_0225FA9C

	thumb_func_start ov91_0225FB48
ov91_0225FB48: ; 0x0225FB48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020135AC
	ldr r0, [r5, #0x1c]
	bl sub_02024504
	mov r6, #0x52
	mov r4, #0
	lsl r6, r6, #2
_0225FB62:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225FB62
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_0225FB48

	thumb_func_start ov91_0225FB80
ov91_0225FB80: ; 0x0225FB80
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r4, r2, #0
	mov r2, #0xc8
	add r5, r0, #0
	str r2, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r4, [sp, #8]
	add r2, #0x80
	ldr r0, [r5, r2]
	mov r2, #2
	mov r3, #0
	add r6, r1, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0xc8
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	add r1, #0x84
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #3
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r1, #0xc8
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	add r1, #0x88
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #1
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0xc8
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r2, #0
	str r4, [sp, #8]
	add r1, #0x8c
	ldr r0, [r5, r1]
	add r1, r6, #0
	add r3, r2, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200AE18
	cmp r0, #0
	bne _0225FC14
	bl GF_AssertFail
_0225FC14:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_0200B00C
	cmp r0, #0
	bne _0225FC26
	bl GF_AssertFail
_0225FC26:
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200A740
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_0200A740
	mov r1, #0xc8
	add r0, r1, #0
	add r2, r1, #0
	str r1, [sp]
	sub r0, #0xc9
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r2, #0x80
	ldr r2, [r5, r2]
	add r3, r1, #0
	str r2, [sp, #0x14]
	add r2, r1, #0
	add r2, #0x84
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r1, #0
	add r2, #0x88
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	add r2, r1, #0
	add r2, #0x8c
	ldr r2, [r5, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r1, #0
	add r0, #0x90
	add r0, r5, r0
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_0225FB80

	thumb_func_start ov91_0225FC84
ov91_0225FC84: ; 0x0225FC84
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200AEB0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_0200B0A8
	mov r1, #0x52
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x34
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	mov r1, #0x53
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x34
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	mov r1, #0x15
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, #0x34
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	mov r1, #0x55
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x34
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225FC84

	thumb_func_start ov91_0225FCD8
ov91_0225FCD8: ; 0x0225FCD8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ScrStrBufs_new
	str r0, [r5, #4]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xe6
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [r5, #8]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #0xc]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #0x10]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0225FCD8

	thumb_func_start ov91_0225FD0C
ov91_0225FD0C: ; 0x0225FD0C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl String_dtor
	ldr r0, [r4, #0xc]
	bl String_dtor
	ldr r0, [r4, #8]
	bl DestroyMsgData
	ldr r0, [r4, #4]
	bl ScrStrBufs_delete
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_0225FD0C

	thumb_func_start ov91_0225FD2C
ov91_0225FD2C: ; 0x0225FD2C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, r3, #0
	add r4, r1, #0
	add r6, r2, #0
	bl GF_Camera_Create
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0
	add r2, r1, #4
	str r0, [r5, r2]
	add r2, r1, #0
	add r2, #8
	str r0, [r5, r2]
	add r2, r1, #0
	add r2, #0xc
	str r0, [r5, r2]
	ldr r3, _0225FDB8 ; =0x0000F112
	add r2, sp, #0xc
	strh r3, [r2]
	ldr r3, _0225FDBC ; =ov91_02261D5C
	lsl r4, r4, #3
	lsl r6, r6, #1
	add r3, r3, r4
	ldrh r3, [r6, r3]
	strh r3, [r2, #2]
	strh r0, [r2, #4]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	ldr r3, _0225FDC0 ; =0x00000FA4
	str r0, [sp, #8]
	add r0, r1, #4
	ldr r1, _0225FDC4 ; =0x001D9000
	add r0, r5, r0
	add r2, sp, #0xc
	bl GF_Camera_InitFromTargetDistanceAndAngle
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	str r1, [sp, #0x14]
	str r1, [sp, #0x1c]
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, sp, #0x14
	bl GF_Camera_SetBindTarget
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl GF_Camera_RegisterToStaticPtr
	mov r0, #0x32
	lsl r0, r0, #0xe
	lsr r2, r0, #0xb
	mov r1, #0xfa
	ldr r2, [r5, r2]
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	add sp, #0x20
	pop {r4, r5, r6, pc}
	nop
_0225FDB8: .word 0x0000F112
_0225FDBC: .word ov91_02261D5C
_0225FDC0: .word 0x00000FA4
_0225FDC4: .word 0x001D9000
	thumb_func_end ov91_0225FD2C

	thumb_func_start ov91_0225FDC8
ov91_0225FDC8: ; 0x0225FDC8
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r3, _0225FDD4 ; =sub_02023120
	ldr r0, [r0, r1]
	bx r3
	nop
_0225FDD4: .word sub_02023120
	thumb_func_end ov91_0225FDC8

	thumb_func_start ov91_0225FDD8
ov91_0225FDD8: ; 0x0225FDD8
	ldr r3, _0225FDDC ; =sub_02023154
	bx r3
	.balign 4, 0
_0225FDDC: .word sub_02023154
	thumb_func_end ov91_0225FDD8

	thumb_func_start ov91_0225FDE0
ov91_0225FDE0: ; 0x0225FDE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r4, r3, #0
	str r0, [sp, #8]
	add r6, r1, #0
	str r4, [sp, #0xc]
	add r7, r2, #0
	ldr r2, [r5]
	add r0, r6, #0
	mov r1, #0xc
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r1, #0xe
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r1, #0xf
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r1, #0x10
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r1, #0x11
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp]
	add r0, r6, #0
	mov r1, #0xd
	mov r2, #4
	mov r3, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0225FEF8 ; =ov91_02261BEC
	mov r2, #0
	ldrb r0, [r0, r7]
	mov r1, #7
	add r3, r2, #0
	str r0, [sp, #8]
	ldr r0, [r5]
	bl BgTilemapRectChangePalette
	mov r0, #0x20
	str r0, [sp]
	lsl r4, r7, #1
	str r0, [sp, #4]
	add r0, r4, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r5]
	mov r1, #6
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	mov r0, #0x20
	str r0, [sp]
	mov r2, #0
	add r4, r4, #1
	str r0, [sp, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #5
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r5]
	mov r1, #4
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r5]
	mov r1, #4
	bl BgCommitTilemapBufferToVram
	ldr r0, [r5]
	mov r1, #5
	bl BgCommitTilemapBufferToVram
	ldr r0, [r5]
	mov r1, #6
	bl BgCommitTilemapBufferToVram
	ldr r0, [r5]
	mov r1, #7
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FEF8: .word ov91_02261BEC
	thumb_func_end ov91_0225FDE0

	thumb_func_start ov91_0225FEFC
ov91_0225FEFC: ; 0x0225FEFC
	bx lr
	.balign 4, 0
	thumb_func_end ov91_0225FEFC

	thumb_func_start ov91_0225FF00
ov91_0225FF00: ; 0x0225FF00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r2, [sp, #0x10]
	mov r2, #0x23
	str r1, [sp, #0xc]
	mov r1, #0
	lsl r2, r2, #4
	str r0, [sp, #8]
	str r3, [sp, #0x14]
	bl memset
	mov r1, #0x5a
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	ldr r6, _022600E4 ; =ov91_02261C04
	mov r7, #0
	add r4, r0, r1
	add r5, r0, #0
_0225FF24:
	ldrh r2, [r6]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r4, #0
	bl sub_02018030
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020181B0
	add r0, r5, #0
	mov r1, #0
	bl sub_020182A0
	mov r1, #0
	ldr r2, _022600E8 ; =0xFFEDE000
	add r0, r5, #0
	add r3, r1, #0
	bl sub_020182A8
	mov r1, #6
	lsl r1, r1, #0xa
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020182C4
	add r7, r7, #1
	add r6, r6, #2
	add r4, #0x10
	add r5, #0x78
	cmp r7, #3
	blt _0225FF24
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, _022600EC ; =ov91_02261C1C
	mov r1, #0x66
	str r0, [sp, #0x28]
	ldr r0, _022600F0 ; =ov91_0226274C
	lsl r1, r1, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #8]
	ldr r6, [sp, #8]
	add r0, r0, r1
	str r0, [sp, #0x20]
	ldr r0, _022600F4 ; =ov91_022621AC
	str r0, [sp, #0x1c]
_0225FF82:
	ldr r0, [sp, #0x10]
	mov r2, #0x5a
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	lsl r2, r2, #2
	add r2, r1, r2
	str r0, [sp, #4]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x28]
	ldrb r1, [r1]
	ldrh r3, [r3]
	ldr r0, [sp, #0x20]
	lsl r1, r1, #4
	add r1, r2, r1
	ldr r2, [sp, #0xc]
	bl sub_020180BC
	ldr r0, [sp, #0x20]
	mov r1, #0
	bl sub_02018198
	ldr r0, [sp, #0x24]
	mov r5, #0
	ldrb r0, [r0]
	lsl r1, r0, #4
	ldr r0, [sp, #8]
	add r1, r0, r1
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r4, [r1, r0]
	cmp r4, #0
	beq _0225FFC8
	add r4, #0x40
	b _0225FFCA
_0225FFC8:
	add r4, r5, #0
_0225FFCA:
	cmp r4, #0
	bne _0225FFD2
	mov r7, #1
	b _0225FFE4
_0225FFD2:
	mov r7, #0
	b _0225FFE4
_0225FFD6:
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	add r1, r5, #0
	bl NNS_G3dAnmObjDisableID
	add r5, r5, #1
_0225FFE4:
	cmp r7, #0
	bne _02260004
	cmp r4, #0
	beq _02260000
	ldrb r0, [r4, #1]
	cmp r5, r0
	bhs _02260000
	ldrh r0, [r4, #6]
	add r1, r4, r0
	ldrh r0, [r1, #2]
	add r1, r1, r0
	lsl r0, r5, #4
	add r0, r1, r0
	b _02260006
_02260000:
	mov r0, #0
	b _02260006
_02260004:
	mov r0, #0
_02260006:
	cmp r0, #0
	bne _0225FFD6
	ldr r5, [sp, #0x1c]
	mov r7, #0
_0226000E:
	cmp r4, #0
	beq _0226001E
	add r0, r4, #0
	add r1, r5, #0
	bl NNS_G3dGetResDictIdxByName
	add r1, r0, #0
	b _02260022
_0226001E:
	mov r1, #0
	mvn r1, r1
_02260022:
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _02260034
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl NNS_G3dAnmObjEnableID
_02260034:
	add r7, r7, #1
	add r5, #0x10
	cmp r7, #0xf
	blt _0226000E
	ldr r0, [sp, #0x28]
	add r6, #0x14
	add r0, r0, #2
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r0, #0x14
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r0, #0xf0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #6
	blt _0225FF82
	ldr r0, _022600F8 ; =_02261BE8
	mov r4, #0x85
	ldrb r5, [r0]
	ldr r0, [sp, #0x10]
	lsl r4, r4, #2
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	sub r2, #0xac
	add r2, r1, r2
	lsl r1, r5, #4
	add r1, r2, r1
	ldr r2, [sp, #0xc]
	add r0, r0, r4
	mov r3, #0x20
	bl sub_020180BC
	mov r0, #0x78
	add r1, r5, #0
	mul r1, r0
	ldr r0, [sp, #8]
	add r0, r0, r1
	ldr r1, [sp, #8]
	add r1, r1, r4
	bl sub_020181D4
	add r2, r4, #0
	ldr r0, [sp, #8]
	mov r1, #4
	add r2, #0x18
	strh r1, [r0, r2]
	mov r1, #0
	add r2, r2, #2
	strh r1, [r0, r2]
	bl ov91_02260334
	ldr r0, [sp, #8]
	add r2, r4, #0
	ldr r1, [sp, #8]
	sub r2, #0x2c
	add r0, #0x78
	add r1, r1, r2
	bl sub_020181D4
	add r1, r4, #0
	ldr r0, [sp, #8]
	sub r1, #0x2c
	add r0, r0, r1
	mov r1, #0
	bl sub_02018198
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, #0x78
	bl sub_020182A0
	ldr r0, [sp, #8]
	mov r2, #4
	sub r1, r4, #4
	strh r2, [r0, r1]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_022600E4: .word ov91_02261C04
_022600E8: .word 0xFFEDE000
_022600EC: .word ov91_02261C1C
_022600F0: .word ov91_0226274C
_022600F4: .word ov91_022621AC
_022600F8: .word _02261BE8
	thumb_func_end ov91_0225FF00

	thumb_func_start ov91_022600FC
ov91_022600FC: ; 0x022600FC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	add r6, r1, #0
	mov r4, #0
	add r5, r7, r0
_0226010A:
	add r0, r5, #0
	bl sub_02018068
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _0226010A
	mov r0, #0x66
	lsl r0, r0, #2
	mov r5, #0
	add r4, r7, r0
_02260120:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020180F8
	add r5, r5, #1
	add r4, #0x14
	cmp r5, #6
	blt _02260120
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r6, #0
	bl sub_020180F8
	mov r2, #0x23
	add r0, r7, #0
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_022600FC

	thumb_func_start ov91_0226014C
ov91_0226014C: ; 0x0226014C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl ov91_022601C8
	add r0, r5, #0
	add r1, r6, #0
	bl ov91_022601F4
	add r0, r5, #0
	add r1, r6, #0
	bl ov91_02260218
	cmp r4, #0
	beq _02260174
	cmp r4, #1
	beq _0226018E
	cmp r4, #2
	bne _022601A8
_02260174:
	add r0, r5, #0
	mov r1, #1
	bl ov91_02260298
	ldrh r1, [r6, #4]
	add r0, r5, #0
	bl ov91_02260254
	add r0, r5, #0
	mov r1, #1
	bl ov91_02260334
	pop {r4, r5, r6, pc}
_0226018E:
	add r0, r5, #0
	mov r1, #3
	bl ov91_02260298
	add r0, r5, #0
	mov r1, #0
	bl ov91_02260334
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl ov91_0226031C
_022601A8:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_0226014C

	thumb_func_start ov91_022601AC
ov91_022601AC: ; 0x022601AC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	mov r1, #1
	add r0, r4, r0
	lsl r1, r1, #0xc
	bl sub_02018124
	add r0, r4, #0
	bl ov91_02260378
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_022601AC

	thumb_func_start ov91_022601C8
ov91_022601C8: ; 0x022601C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r6, #0
_022601D0:
	add r1, r4, #0
	add r2, r4, #0
	add r3, r4, #0
	add r1, #0xd8
	add r2, #0xdc
	add r3, #0xe0
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	add r0, r5, #0
	bl sub_020182A8
	add r6, r6, #1
	add r5, #0x78
	cmp r6, #3
	blt _022601D0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_022601C8

	thumb_func_start ov91_022601F4
ov91_022601F4: ; 0x022601F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r1, #2]
	mov r4, #0
	mov r7, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
_02260202:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020182E0
	add r4, r4, #1
	add r5, #0x78
	cmp r4, #3
	blt _02260202
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_022601F4

	thumb_func_start ov91_02260218
ov91_02260218: ; 0x02260218
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_02260220:
	add r0, r6, #0
	add r0, #0xd4
	ldr r1, [r0]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020182C4
	add r4, r4, #1
	add r5, #0x78
	cmp r4, #3
	blt _02260220
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_02260218

	thumb_func_start ov91_0226023C
ov91_0226023C: ; 0x0226023C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_02260242:
	add r0, r5, #0
	bl sub_020181EC
	add r4, r4, #1
	add r5, #0x78
	cmp r4, #3
	blt _02260242
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_0226023C

	thumb_func_start ov91_02260254
ov91_02260254: ; 0x02260254
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02260290 ; =0x0000F222
	add r4, r1, #0
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	ldr r0, _02260294 ; =0x00000E38
	sub r2, r4, r0
	mov r0, #0x5a
	mul r0, r2
	bl _u32_div_f
	mov r1, #0x2d
	lsl r1, r1, #0xe
	mul r1, r0
	add r0, r1, #0
	mov r1, #0x5a
	bl _s32_div_f
	mov r1, #0x2d
	lsl r1, r1, #0xe
	sub r1, r1, r0
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_02018198
	pop {r3, r4, r5, pc}
	nop
_02260290: .word 0x0000F222
_02260294: .word 0x00000E38
	thumb_func_end ov91_02260254

	thumb_func_start ov91_02260298
ov91_02260298: ; 0x02260298
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #6
	blo _022602A6
	bl GF_AssertFail
_022602A6:
	mov r2, #0x21
	lsl r2, r2, #4
	ldrh r1, [r5, r2]
	cmp r1, r4
	beq _02260314
	ldr r0, _02260318 ; =ov91_0226274C
	sub r2, #0x78
	ldrb r3, [r0, r1]
	mov r0, #0x78
	mul r0, r3
	add r3, r5, r2
	mov r2, #0x14
	mul r2, r1
	add r0, r5, r0
	add r1, r3, r2
	bl sub_020181E0
	mov r0, #0x66
	lsl r0, r0, #2
	add r6, r5, r0
	mov r0, #0x14
	add r7, r4, #0
	mul r7, r0
	ldr r0, _02260318 ; =ov91_0226274C
	ldrb r1, [r0, r4]
	mov r0, #0x78
	mul r0, r1
	str r0, [sp]
	add r0, r5, r0
	add r1, r6, r7
	bl sub_020181D4
	add r0, r6, r7
	mov r1, #0
	bl sub_02018198
	mov r0, #0x21
	lsl r0, r0, #4
	ldrh r1, [r5, r0]
	ldr r0, _02260318 ; =ov91_0226274C
	ldrb r1, [r0, r1]
	mov r0, #0x78
	mul r0, r1
	add r0, r5, r0
	mov r1, #0
	bl sub_020182A0
	ldr r0, [sp]
	mov r1, #1
	add r0, r5, r0
	bl sub_020182A0
	mov r0, #0x21
	lsl r0, r0, #4
	strh r4, [r5, r0]
_02260314:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260318: .word ov91_0226274C
	thumb_func_end ov91_02260298

	thumb_func_start ov91_0226031C
ov91_0226031C: ; 0x0226031C
	mov r2, #0x66
	lsl r2, r2, #2
	add r3, r0, r2
	add r2, #0x78
	ldrh r2, [r0, r2]
	mov r0, #0x14
	mul r0, r2
	add r0, r3, r0
	ldr r3, _02260330 ; =sub_0201815C
	bx r3
	.balign 4, 0
_02260330: .word sub_0201815C
	thumb_func_end ov91_0226031C

	thumb_func_start ov91_02260334
ov91_02260334: ; 0x02260334
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _02260360 ; =0x00000212
	add r5, r0, #0
	ldrh r2, [r5, r1]
	cmp r2, r4
	beq _0226035C
	cmp r4, #1
	bne _02260350
	sub r1, #0x7a
	add r1, r5, r1
	bl sub_020181D4
	b _02260358
_02260350:
	sub r1, #0x7a
	add r1, r5, r1
	bl sub_020181E0
_02260358:
	ldr r0, _02260360 ; =0x00000212
	strh r4, [r5, r0]
_0226035C:
	pop {r3, r4, r5, pc}
	nop
_02260360: .word 0x00000212
	thumb_func_end ov91_02260334

	thumb_func_start ov91_02260364
ov91_02260364: ; 0x02260364
	ldr r2, _0226036C ; =0x0000022E
	strh r1, [r0, r2]
	bx lr
	nop
_0226036C: .word 0x0000022E
	thumb_func_end ov91_02260364

	thumb_func_start ov91_02260370
ov91_02260370: ; 0x02260370
	mov r2, #0x8b
	lsl r2, r2, #2
	strh r1, [r0, r2]
	bx lr
	thumb_func_end ov91_02260370

	thumb_func_start ov91_02260378
ov91_02260378: ; 0x02260378
	push {r3, r4, r5, lr}
	ldr r2, _022603F4 ; =0x0000022E
	add r3, r0, #0
	ldrh r0, [r3, r2]
	cmp r0, #1
	bne _022603AA
	sub r0, r2, #6
	mov r1, #2
	ldr r0, [r3, r0]
	lsl r1, r1, #0xc
	add r4, r0, r1
	mov r0, #0xa
	lsl r0, r0, #0xe
	cmp r4, r0
	bge _022603A2
	sub r0, r2, #6
	ldr r0, [r3, r0]
	add r1, r0, r1
	sub r0, r2, #6
	str r1, [r3, r0]
	b _022603E4
_022603A2:
	lsr r1, r1, #1
	sub r0, r2, #6
	str r1, [r3, r0]
	b _022603E4
_022603AA:
	sub r0, r2, #2
	ldrh r0, [r3, r0]
	cmp r0, #4
	bne _022603B6
	mov r0, #0
	b _022603B8
_022603B6:
	add r0, r0, #1
_022603B8:
	lsl r2, r0, #1
	ldr r0, _022603F8 ; =ov91_02261C12
	mov r4, #0x8a
	ldrb r0, [r0, r2]
	lsl r4, r4, #2
	ldr r5, [r3, r4]
	lsl r1, r0, #0xc
	cmp r5, r1
	bge _022603CE
	str r1, [r3, r4]
	b _022603E4
_022603CE:
	mov r0, #2
	lsl r0, r0, #0xc
	add r0, r5, r0
	ldr r5, _022603FC ; =ov91_02261C13
	ldrb r2, [r5, r2]
	lsl r2, r2, #0xc
	cmp r0, r2
	bge _022603E2
	str r0, [r3, r4]
	b _022603E4
_022603E2:
	str r1, [r3, r4]
_022603E4:
	mov r1, #0x85
	lsl r1, r1, #2
	add r0, r3, r1
	add r1, #0x14
	ldr r1, [r3, r1]
	bl sub_02018198
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022603F4: .word 0x0000022E
_022603F8: .word ov91_02261C12
_022603FC: .word ov91_02261C13
	thumb_func_end ov91_02260378

	thumb_func_start ov91_02260400
ov91_02260400: ; 0x02260400
	push {r3, r4}
	mov r3, #0xff
	sub r0, r3, r0
	mov r3, #0x96
	lsl r3, r3, #4
	add r4, r0, #0
	mul r4, r3
	lsl r0, r3, #7
	sub r0, r4, r0
	add r4, r1, #0
	str r0, [r2]
	mul r4, r3
	lsl r0, r3, #7
	sub r1, r4, r0
	ldr r0, _02260428 ; =0xFFED4000
	sub r0, r0, r1
	str r0, [r2, #8]
	pop {r3, r4}
	bx lr
	nop
_02260428: .word 0xFFED4000
	thumb_func_end ov91_02260400

	thumb_func_start ov91_0226042C
ov91_0226042C: ; 0x0226042C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0x4b
	ldr r0, [r5]
	lsl r1, r1, #0xc
	add r0, r0, r1
	lsr r1, r1, #7
	bl _s32_div_f
	mov r1, #0xff
	sub r0, r1, r0
	strh r0, [r4]
	ldr r1, [r5, #8]
	ldr r0, _02260458 ; =0xFFF1F000
	sub r0, r0, r1
	mov r1, #0x96
	lsl r1, r1, #4
	bl _s32_div_f
	strh r0, [r4, #2]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02260458: .word 0xFFF1F000
	thumb_func_end ov91_0226042C

	thumb_func_start ov91_0226045C
ov91_0226045C: ; 0x0226045C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r0, #0
	add r0, sp, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl MTX_Identity33_
	ldr r0, _0226049C ; =ov91_02261D3C
	lsl r2, r4, #3
	lsl r1, r5, #1
	add r0, r0, r2
	ldrh r0, [r1, r0]
	ldr r3, _022604A0 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotY33_
	add r0, r6, #0
	add r1, sp, #0
	add r2, r7, #0
	bl MTX_MultVec33
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0226049C: .word ov91_02261D3C
_022604A0: .word FX_SinCosTable_
	thumb_func_end ov91_0226045C

	thumb_func_start ov91_022604A4
ov91_022604A4: ; 0x022604A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r0, #0
	add r0, sp, #0
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl MTX_Identity33_
	ldr r0, _022604EC ; =ov91_02261D3C
	lsl r2, r4, #3
	lsl r1, r5, #1
	add r0, r0, r2
	ldrh r0, [r1, r0]
	ldr r3, _022604F0 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotY33_
	add r0, sp, #0
	add r1, r0, #0
	bl MTX_Inverse33
	add r0, r6, #0
	add r1, sp, #0
	add r2, r7, #0
	bl MTX_MultVec33
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022604EC: .word ov91_02261D3C
_022604F0: .word FX_SinCosTable_
	thumb_func_end ov91_022604A4

	thumb_func_start ov91_022604F4
ov91_022604F4: ; 0x022604F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #0x30]
	ldr r0, _0226064C ; =0x000006FC
	ldr r4, _02260650 ; =ov91_02261BF0
	str r1, [sp, #0x2c]
	add r7, r2, #0
	add r6, r5, r0
_02260508:
	ldrb r2, [r4]
	ldr r1, [sp, #0x2c]
	add r0, r6, #0
	add r3, r7, #0
	bl sub_02018030
	ldr r0, [sp, #0x30]
	add r4, r4, #1
	add r0, r0, #1
	add r6, #0x10
	str r0, [sp, #0x30]
	cmp r0, #5
	blt _02260508
	ldr r0, _02260654 ; =0x0000074C
	ldr r1, [sp, #0x2c]
	add r0, r5, r0
	mov r2, #0x2e
	add r3, r7, #0
	bl sub_02018030
	ldr r0, _02260658 ; =0x00000754
	mov r2, #0x1f
	ldr r0, [r5, r0]
	mov r1, #0
	lsl r2, r2, #0x10
	bl NNSi_G3dModifyPolygonAttrMask
	mov r1, #0x64
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r7, [sp, #8]
	add r1, #0xe4
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x2c]
	mov r2, #7
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	ldr r1, _0226065C ; =0x0000075C
	mov r2, #4
	str r0, [r5, r1]
	mov r1, #0x64
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r7, [sp, #0xc]
	add r1, #0xe8
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x2c]
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x76
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r1, #0x64
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r7, [sp, #8]
	add r1, #0xec
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x2c]
	mov r2, #6
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02260660 ; =0x00000764
	mov r2, #5
	str r0, [r5, r1]
	mov r1, #0x64
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r7, [sp, #8]
	add r1, #0xf0
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x2c]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02260664 ; =0x00000768
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200AE18
	cmp r0, #0
	bne _022605C2
	bl GF_AssertFail
_022605C2:
	mov r0, #0x76
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200B00C
	cmp r0, #0
	bne _022605D4
	bl GF_AssertFail
_022605D4:
	ldr r0, _0226065C ; =0x0000075C
	ldr r0, [r5, r0]
	bl sub_0200A740
	mov r0, #0x76
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200A740
	mov r1, #0x64
	add r0, r1, #0
	add r2, r1, #0
	str r1, [sp]
	sub r0, #0x65
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r2, #0xe4
	ldr r2, [r5, r2]
	add r3, r1, #0
	str r2, [sp, #0x14]
	add r2, r1, #0
	add r2, #0xe8
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r1, #0
	add r2, #0xec
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	add r2, r1, #0
	add r2, #0xf0
	ldr r2, [r5, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, _02260668 ; =0x0000076C
	add r2, r1, #0
	add r0, r5, r0
	bl CreateSpriteResourcesHeader
	mov r0, #0x79
	lsl r0, r0, #4
	mov r6, #0
	add r4, r5, r0
_02260630:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov91_022607C4
	mov r0, #0x42
	lsl r0, r0, #2
	add r6, r6, #1
	add r4, r4, r0
	cmp r6, #0x60
	blt _02260630
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0226064C: .word 0x000006FC
_02260650: .word ov91_02261BF0
_02260654: .word 0x0000074C
_02260658: .word 0x00000754
_0226065C: .word 0x0000075C
_02260660: .word 0x00000764
_02260664: .word 0x00000768
_02260668: .word 0x0000076C
	thumb_func_end ov91_022604F4

	thumb_func_start ov91_0226066C
ov91_0226066C: ; 0x0226066C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x79
	lsl r0, r0, #4
	mov r7, #0x42
	mov r6, #0
	add r4, r5, r0
	lsl r7, r7, #2
_0226067C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov91_02260830
	add r6, r6, #1
	add r4, r4, r7
	cmp r6, #0x60
	blt _0226067C
	ldr r0, _02260714 ; =0x0000075C
	ldr r0, [r5, r0]
	bl sub_0200AEB0
	mov r0, #0x76
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200B0A8
	mov r0, #0x52
	ldr r1, _02260714 ; =0x0000075C
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl DestroySingle2DGfxResObj
	mov r0, #0x53
	mov r1, #0x76
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl DestroySingle2DGfxResObj
	mov r0, #0x15
	ldr r1, _02260718 ; =0x00000764
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl DestroySingle2DGfxResObj
	mov r0, #0x55
	ldr r1, _0226071C ; =0x00000768
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl DestroySingle2DGfxResObj
	ldr r0, _02260720 ; =0x000006FC
	mov r6, #0
	add r4, r5, r0
_022606DE:
	add r0, r4, #0
	bl sub_02018068
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #5
	blt _022606DE
	ldr r0, _02260724 ; =0x0000074C
	add r0, r5, r0
	bl sub_02018068
	ldr r0, _02260720 ; =0x000006FC
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x94
	bl memset
	mov r0, #0x79
	lsl r0, r0, #4
	mov r2, #0x63
	add r0, r5, r0
	mov r1, #0
	lsl r2, r2, #8
	bl memset
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260714: .word 0x0000075C
_02260718: .word 0x00000764
_0226071C: .word 0x00000768
_02260720: .word 0x000006FC
_02260724: .word 0x0000074C
	thumb_func_end ov91_0226066C

	thumb_func_start ov91_02260728
ov91_02260728: ; 0x02260728
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r7, r2, #0
	add r6, r3, #0
	bl ov91_02260A50
	add r1, r0, #0
	ldrh r0, [r4, #4]
	cmp r0, r6
	bne _0226074A
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov91_02260848
	pop {r3, r4, r5, r6, r7, pc}
_0226074A:
	add r0, r5, #0
	add r2, r4, #0
	bl ov91_02260884
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov91_02260728

	thumb_func_start ov91_02260754
ov91_02260754: ; 0x02260754
	push {r4, r5, r6, lr}
	mov r3, #0x42
	ldr r4, _02260788 ; =0x00000888
	mov r2, #0
	add r6, r0, #0
	lsl r3, r3, #2
_02260760:
	ldr r5, [r6, r4]
	cmp r5, r1
	bne _0226077A
	mov r1, #0x79
	lsl r1, r1, #4
	add r1, r0, r1
	mov r0, #0x42
	lsl r0, r0, #2
	mul r0, r2
	add r0, r1, r0
	bl ov91_02260A2C
	pop {r4, r5, r6, pc}
_0226077A:
	add r2, r2, #1
	add r6, r6, r3
	cmp r2, #0x60
	blt _02260760
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02260788: .word 0x00000888
	thumb_func_end ov91_02260754

	thumb_func_start ov91_0226078C
ov91_0226078C: ; 0x0226078C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x79
	lsl r0, r0, #4
	str r1, [sp]
	mov r6, #0
	add r4, r7, #0
	add r5, r7, r0
_0226079C:
	ldr r0, _022607C0 ; =0x00000888
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022607AE
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl ov91_022608A8
_022607AE:
	mov r0, #0x42
	lsl r0, r0, #2
	add r6, r6, #1
	add r4, r4, r0
	add r5, r5, r0
	cmp r6, #0x60
	blt _0226079C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022607C0: .word 0x00000888
	thumb_func_end ov91_0226078C

	thumb_func_start ov91_022607C4
ov91_022607C4: ; 0x022607C4
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r3, sp, #0
	mov r0, #0
	add r4, r1, #0
	add r6, r3, #0
	add r1, r0, #0
	stmia r6!, {r0, r1}
	stmia r6!, {r0, r1}
	stmia r6!, {r0, r1}
	stmia r6!, {r0, r1}
	stmia r6!, {r0, r1}
	stmia r6!, {r0, r1}
	ldr r0, [r5, #0x1c]
	str r0, [sp]
	ldr r0, _02260828 ; =0x0000076C
	str r2, [sp, #0x2c]
	add r0, r5, r0
	str r0, [sp, #4]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	mov r0, #0x20
	str r0, [sp, #0x24]
	mov r0, #2
	str r0, [sp, #0x28]
	add r0, r3, #0
	bl CreateSprite
	mov r1, #0
	str r0, [r4]
	bl Set2dSpriteVisibleFlag
	ldr r1, _0226082C ; =0x0000074C
	add r0, r4, #0
	add r0, #0x7c
	add r1, r5, r1
	bl sub_020181B0
	add r4, #0x7c
	add r0, r4, #0
	mov r1, #0
	bl sub_020182A0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_02260828: .word 0x0000076C
_0226082C: .word 0x0000074C
	thumb_func_end ov91_022607C4

	thumb_func_start ov91_02260830
ov91_02260830: ; 0x02260830
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	bl sub_02024758
	mov r2, #0x42
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	pop {r4, pc}
	thumb_func_end ov91_02260830

	thumb_func_start ov91_02260848
ov91_02260848: ; 0x02260848
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r0, r5, #0
	add r4, r2, #0
	add r0, #0xf8
	str r4, [r0]
	add r0, r5, #0
	mov r1, #1
	add r0, #0xf4
	str r1, [r0]
	mov r0, #0x41
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r5, r0]
	ldrh r1, [r4, #4]
	ldr r0, [r5]
	add r6, r3, #0
	bl sub_02024A14
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov91_02260A88
	ldr r0, [r5]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_02260848

	thumb_func_start ov91_02260884
ov91_02260884: ; 0x02260884
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xf8
	str r2, [r0]
	mov r0, #0x41
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, [r4]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add r1, r5, #0
	bl ov91_02260AF8
	pop {r3, r4, r5, pc}
	thumb_func_end ov91_02260884

	thumb_func_start ov91_022608A8
ov91_022608A8: ; 0x022608A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r1, #0xf4
	ldr r1, [r1]
	cmp r1, #1
	bne _022608CE
	add r1, r5, #0
	add r1, #0xf8
	ldr r1, [r1]
	bl ov91_02260A88
	cmp r0, #0
	bne _022608CE
	add r0, r5, #0
	add r1, r4, #0
	bl ov91_02260AF8
_022608CE:
	add r0, r5, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r0, #0
	bne _02260940
	add r0, r5, #0
	add r0, #0xf8
	ldr r1, _02260944 ; =0x000006FC
	ldr r0, [r0]
	add r1, r4, r1
	bl ov91_02260B48
	add r1, r5, #0
	add r1, #0xf8
	ldr r1, [r1]
	ldr r0, [r0, #8]
	ldrb r1, [r1]
	cmp r1, #5
	bne _022608FC
	ldr r1, _02260948 ; =0x00007FFF
	bl NNS_G3dMdlSetMdlAmbAll
	b _02260902
_022608FC:
	ldr r1, _0226094C ; =0x00004A52
	bl NNS_G3dMdlSetMdlAmbAll
_02260902:
	add r0, r5, #0
	bl ov91_02260B5C
	add r0, r5, #0
	add r0, #0xf8
	ldr r3, [r0]
	add r0, r5, #4
	ldr r1, [r3, #0x2c]
	ldr r2, [r3, #0x30]
	ldr r3, [r3, #0x34]
	bl sub_020182A8
	add r0, r5, #4
	bl sub_020181EC
	add r0, r5, #0
	add r0, #0x7c
	bl sub_020182A4
	cmp r0, #1
	bne _02260940
	add r0, r5, #0
	bl ov91_02260950
	add r0, r5, #0
	add r0, #0x7c
	bl sub_020181EC
	add r0, r5, #0
	bl ov91_02260A10
_02260940:
	pop {r3, r4, r5, pc}
	nop
_02260944: .word 0x000006FC
_02260948: .word 0x00007FFF
_0226094C: .word 0x00004A52
	thumb_func_end ov91_022608A8

	thumb_func_start ov91_02260950
ov91_02260950: ; 0x02260950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov91_0225E9AC
	cmp r0, #1
	bne _02260966
	ldr r4, _02260A08 ; =0xFFED4000
	b _0226097A
_02260966:
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov91_0225E990
	cmp r0, #0
	bne _02260978
	ldr r4, _02260A0C ; =0xFFFCD000
	b _0226097A
_02260978:
	ldr r4, _02260A08 ; =0xFFED4000
_0226097A:
	add r0, r5, #0
	add r0, #0xf8
	ldr r3, [r0]
	add r0, r5, #0
	ldr r1, [r3, #0x2c]
	ldr r3, [r3, #0x34]
	add r0, #0x7c
	add r2, r4, #0
	bl sub_020182A8
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	mov r2, #0
	ldr r0, [r0, #0x30]
	sub r4, r0, r4
	asr r6, r4, #0x1f
	lsr r1, r4, #0x14
	lsl r0, r6, #0xc
	orr r0, r1
	mov r1, #2
	lsl r3, r4, #0xc
	lsl r1, r1, #0xa
	add r3, r3, r1
	adc r0, r2
	lsl r1, r0, #0x14
	lsr r0, r3, #0xc
	orr r0, r1
	mov r1, #0x4b
	lsl r1, r1, #0xe
	bl FX_Div
	mov r7, #1
	add r3, r0, #0
	lsl r7, r7, #0xc
	add r1, r3, r7
	add r5, #0x7c
	add r0, r5, #0
	add r2, r1, #0
	add r3, r3, r7
	bl sub_020182C4
	lsr r0, r4, #0x10
	lsl r3, r6, #0x10
	orr r3, r0
	lsl r2, r4, #0x10
	mov r1, #0
	lsr r0, r7, #1
	add r0, r2, r0
	adc r3, r1
	lsl r1, r3, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #0x4b
	lsl r1, r1, #0xe
	bl FX_Div
	asr r1, r0, #0xc
	mov r0, #0x18
	sub r0, r0, r1
	str r0, [sp]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	str r0, [sp, #4]
	bl NNS_G3dGlbPolygonAttr
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260A08: .word 0xFFED4000
_02260A0C: .word 0xFFFCD000
	thumb_func_end ov91_02260950

	thumb_func_start ov91_02260A10
ov91_02260A10: ; 0x02260A10
	push {r3, lr}
	sub sp, #8
	mov r0, #0x1f
	str r0, [sp]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	str r0, [sp, #4]
	bl NNS_G3dGlbPolygonAttr
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov91_02260A10

	thumb_func_start ov91_02260A2C
ov91_02260A2C: ; 0x02260A2C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	add r0, #0xf8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xf4
	str r1, [r0]
	ldr r0, [r4]
	bl Set2dSpriteVisibleFlag
	add r4, #0x7c
	add r0, r4, #0
	mov r1, #0
	bl sub_020182A0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_02260A2C

	thumb_func_start ov91_02260A50
ov91_02260A50: ; 0x02260A50
	push {r3, r4, r5, lr}
	mov r2, #0x42
	ldr r3, _02260A84 ; =0x00000888
	mov r1, #0
	add r5, r0, #0
	lsl r2, r2, #2
_02260A5C:
	ldr r4, [r5, r3]
	cmp r4, #0
	bne _02260A72
	mov r2, #0x79
	lsl r2, r2, #4
	add r2, r0, r2
	mov r0, #0x42
	lsl r0, r0, #2
	mul r0, r1
	add r0, r2, r0
	pop {r3, r4, r5, pc}
_02260A72:
	add r1, r1, #1
	add r5, r5, r2
	cmp r1, #0x60
	blt _02260A5C
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02260A84: .word 0x00000888
	thumb_func_end ov91_02260A50

	thumb_func_start ov91_02260A88
ov91_02260A88: ; 0x02260A88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0xf8
	ldr r6, [r0]
	add r5, sp, #4
	add r6, #0x2c
	ldmia r6!, {r0, r1}
	add r3, r2, #0
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r5]
	add r0, r2, #0
	add r2, r4, #0
	add r2, #0xf8
	ldr r2, [r2]
	ldrh r2, [r2, #4]
	bl ov91_022604A4
	add r0, sp, #4
	add r1, sp, #0
	bl ov91_0226042C
	add r1, sp, #0
	mov r2, #0
	ldrsh r0, [r1, r2]
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #2
	ldrsh r1, [r1, r0]
	lsl r0, r0, #0x14
	lsl r1, r1, #0xc
	add r0, r1, r0
	str r2, [sp, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4]
	add r1, sp, #4
	bl sub_020247D4
	add r1, sp, #0
	mov r0, #0
	ldrsh r0, [r1, r0]
	cmp r0, #0
	blt _02260AEC
	mov r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bge _02260AF2
_02260AEC:
	add sp, #0x10
	mov r0, #0
	pop {r4, r5, r6, pc}
_02260AF2:
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov91_02260A88

	thumb_func_start ov91_02260AF8
ov91_02260AF8: ; 0x02260AF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	mov r1, #0
	add r0, #0xf4
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xf8
	ldr r1, _02260B44 ; =0x000006FC
	ldr r0, [r0]
	add r1, r4, r1
	bl ov91_02260B48
	add r1, r0, #0
	add r0, r5, #4
	bl sub_020181B0
	add r0, r5, #4
	mov r1, #1
	bl sub_020182A0
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #1
	bne _02260B42
	add r5, #0x7c
	add r0, r5, #0
	mov r1, #1
	bl sub_020182A0
_02260B42:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02260B44: .word 0x000006FC
	thumb_func_end ov91_02260AF8

	thumb_func_start ov91_02260B48
ov91_02260B48: ; 0x02260B48
	ldr r2, [r0, #0x28]
	cmp r2, #1
	bne _02260B52
	mov r0, #4
	b _02260B54
_02260B52:
	ldrh r0, [r0, #4]
_02260B54:
	lsl r0, r0, #4
	add r0, r1, r0
	bx lr
	.balign 4, 0
	thumb_func_end ov91_02260B48

	thumb_func_start ov91_02260B5C
ov91_02260B5C: ; 0x02260B5C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x41
	lsl r0, r0, #2
	ldrsh r1, [r5, r0]
	sub r1, r1, #1
	strh r1, [r5, r0]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _02260BFA
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl ov91_0225E6F8
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xf8
	ldr r1, [r0]
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #8]
	bl FX_Atan2Idx
	asr r0, r0, #4
	lsl r4, r0, #1
	ldr r1, _02260C3C ; =0x0001E200
	lsl r0, r6, #9
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r6, r0, #4
	asr r7, r6, #0x1f
	ldr r0, _02260C40 ; =FX_SinCosTable_
	lsl r1, r4, #1
	ldrsh r0, [r0, r1]
	add r2, r6, #0
	add r3, r7, #0
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r1, r0, #0xc
	lsr r0, r2, #2
	add r1, r1, r0
	lsr r0, r2, #3
	strh r1, [r5, r0]
	add r0, r4, #1
	lsl r1, r0, #1
	ldr r0, _02260C40 ; =FX_SinCosTable_
	add r2, r6, #0
	ldrsh r0, [r0, r1]
	add r3, r7, #0
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r4, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r4, #0xc
	orr r1, r0
	asr r1, r1, #0xc
	lsr r0, r2, #2
	add r1, r1, r0
	ldr r0, _02260C44 ; =0x00000102
	strh r1, [r5, r0]
	mov r1, #8
	add r0, r1, #0
	add r0, #0xfc
	strh r1, [r5, r0]
_02260BFA:
	add r0, r5, #0
	add r0, #0xfc
	ldrh r2, [r0]
	mov r0, #1
	lsl r0, r0, #8
	ldrh r1, [r5, r0]
	add r0, r0, #2
	add r2, r2, r1
	add r1, r5, #0
	add r1, #0xfc
	strh r2, [r1]
	add r1, r5, #0
	add r1, #0xfe
	ldrh r1, [r1]
	ldrh r0, [r5, r0]
	mov r2, #0
	add r1, r1, r0
	add r0, r5, #0
	add r0, #0xfe
	strh r1, [r0]
	add r1, r5, #0
	add r1, #0xfc
	ldrh r1, [r1]
	add r0, r5, #4
	bl sub_020182E0
	add r0, r5, #4
	add r5, #0xfe
	ldrh r1, [r5]
	mov r2, #2
	bl sub_020182E0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260C3C: .word 0x0001E200
_02260C40: .word FX_SinCosTable_
_02260C44: .word 0x00000102
	thumb_func_end ov91_02260B5C

	thumb_func_start ov91_02260C48
ov91_02260C48: ; 0x02260C48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	add r7, sp, #0
	add r4, r2, #0
	mov r0, #0
	add r5, r1, #0
	add r2, r7, #0
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r6, #0x1c]
	str r0, [sp]
	ldr r0, _02260CA4 ; =0x0000076C
	str r3, [sp, #0x2c]
	add r0, r6, r0
	str r0, [sp, #4]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	mov r0, #0x20
	str r0, [sp, #0x24]
	mov r0, #2
	str r0, [sp, #0x28]
	add r0, r7, #0
	bl CreateSprite
	str r0, [r5, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl sub_02024A14
	mov r0, #0
	str r0, [r5]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260CA4: .word 0x0000076C
	thumb_func_end ov91_02260C48

	thumb_func_start ov91_02260CA8
ov91_02260CA8: ; 0x02260CA8
	ldr r3, _02260CB0 ; =sub_02024758
	ldr r0, [r0, #4]
	bx r3
	nop
_02260CB0: .word sub_02024758
	thumb_func_end ov91_02260CA8

	thumb_func_start ov91_02260CB4
ov91_02260CB4: ; 0x02260CB4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #1
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_02260CB4

	thumb_func_start ov91_02260CC8
ov91_02260CC8: ; 0x02260CC8
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _02260CDA
	ldr r2, _02260CDC ; =gSystem + 0x40
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl ov91_02260CE0
_02260CDA:
	pop {r3, pc}
	.balign 4, 0
_02260CDC: .word gSystem + 0x40
	thumb_func_end ov91_02260CC8

	thumb_func_start ov91_02260CE0
ov91_02260CE0: ; 0x02260CE0
	push {lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	mov r1, #2
	lsl r2, r2, #0xc
	lsl r1, r1, #0x14
	add r1, r2, r1
	str r1, [sp, #4]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov91_02260CE0

	thumb_func_start ov91_02260D00
ov91_02260D00: ; 0x02260D00
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov91_02260D00

	thumb_func_start ov91_02260D14
ov91_02260D14: ; 0x02260D14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r4, #0
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	add r2, sp, #0
	add r0, r4, #0
	add r1, r4, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r7, #0x1c]
	str r0, [sp]
	ldr r0, _02260D7C ; =0x0000076C
	str r3, [sp, #0x2c]
	add r0, r7, r0
	str r0, [sp, #4]
	mov r0, #9
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	mov r0, #0x20
	str r0, [sp, #0x24]
	mov r0, #2
	str r0, [sp, #0x28]
	add r7, r4, #0
_02260D50:
	add r0, sp, #0
	bl CreateSprite
	str r0, [r5, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #4]
	mov r1, #1
	bl sub_0202487C
	ldr r0, [r5, #4]
	add r1, r6, #0
	bl sub_02024A14
	str r7, [r5]
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, #8
	blt _02260D50
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260D7C: .word 0x0000076C
	thumb_func_end ov91_02260D14

	thumb_func_start ov91_02260D80
ov91_02260D80: ; 0x02260D80
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r4, #0
_02260D86:
	ldr r0, [r5, #4]
	bl sub_02024758
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, #8
	blt _02260D86
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_02260D80

	thumb_func_start ov91_02260D98
ov91_02260D98: ; 0x02260D98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r4, #0
	add r6, sp, #0x10
	add r7, sp, #0xc
_02260DA4:
	ldr r0, [r5]
	cmp r0, #1
	bne _02260E78
	ldr r0, [r5, #0x14]
	cmp r0, #0x10
	bge _02260DC4
	mov r1, #0x7d
	str r1, [sp]
	str r6, [sp, #4]
	mov r1, #0x10
	mov r2, #8
	mov r3, #0xbe
	str r7, [sp, #8]
	bl ov91_02260EE0
	b _02260DF2
_02260DC4:
	cmp r0, #0x1a
	bge _02260DDE
	mov r1, #0x8c
	str r1, [sp]
	str r6, [sp, #4]
	sub r0, #0x10
	mov r1, #0xa
	mov r2, #4
	mov r3, #0xb6
	str r7, [sp, #8]
	bl ov91_02260EE0
	b _02260DF2
_02260DDE:
	mov r1, #0xa0
	str r1, [sp]
	str r6, [sp, #4]
	sub r0, #0x1a
	mov r1, #6
	mov r2, #3
	mov r3, #0xb4
	str r7, [sp, #8]
	bl ov91_02260EE0
_02260DF2:
	ldr r0, [r5, #0x14]
	add r1, r0, #1
	lsl r0, r1, #1
	str r1, [r5, #0x14]
	add r1, r1, r0
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r1, r0, #5
	mov r0, #9
	sub r0, r0, r1
	mov r1, #0xa
	lsl r0, r0, #0xc
	lsl r1, r1, #0xc
	bl FX_Div
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	add r1, sp, #0x14
	bl sub_020247F4
	ldr r0, [r5, #0x18]
	ldr r1, [r5, #8]
	cmp r0, #0
	beq _02260E2E
	ldr r0, [sp, #0x10]
	lsl r0, r0, #0xc
	add r0, r1, r0
	b _02260E34
_02260E2E:
	ldr r0, [sp, #0x10]
	lsl r0, r0, #0xc
	sub r0, r1, r0
_02260E34:
	str r0, [r5, #8]
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r5, #0xc]
	add r1, r5, #0
	ldr r0, [r5, #4]
	add r1, #8
	bl sub_020247D4
	ldr r1, [r5, #8]
	ldr r0, _02260E84 ; =0xFFFE0000
	cmp r1, r0
	blt _02260E6C
	mov r0, #0x12
	lsl r0, r0, #0x10
	cmp r1, r0
	bgt _02260E6C
	mov r0, #0x1e
	ldr r1, [r5, #0xc]
	lsl r0, r0, #0x10
	cmp r1, r0
	blt _02260E6C
	mov r0, #0x2e
	lsl r0, r0, #0x10
	cmp r1, r0
	ble _02260E78
_02260E6C:
	mov r0, #0
	str r0, [r5]
	ldr r0, [r5, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_02260E78:
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, #8
	blt _02260DA4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260E84: .word 0xFFFE0000
	thumb_func_end ov91_02260D98

	thumb_func_start ov91_02260E88
ov91_02260E88: ; 0x02260E88
	push {r4, r5, r6, lr}
	mov r4, #0
	add r3, r4, #0
	add r6, r0, #0
_02260E90:
	ldr r5, [r6]
	cmp r5, #0
	bne _02260E9E
	mov r4, #0x1c
	mul r4, r3
	add r4, r0, r4
	b _02260EA6
_02260E9E:
	add r3, r3, #1
	add r6, #0x1c
	cmp r3, #8
	blt _02260E90
_02260EA6:
	cmp r4, #0
	beq _02260EDC
	cmp r1, #0x80
	bge _02260EB2
	mov r0, #1
	b _02260EB4
_02260EB2:
	mov r0, #0
_02260EB4:
	str r0, [r4, #0x18]
	lsl r0, r1, #0xc
	str r0, [r4, #8]
	mov r0, #2
	lsl r1, r2, #0xc
	lsl r0, r0, #0x14
	add r0, r1, r0
	str r0, [r4, #0xc]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #8
	bl sub_020247D4
	mov r1, #1
	str r1, [r4]
	ldr r0, [r4, #4]
	bl Set2dSpriteVisibleFlag
	mov r0, #0
	str r0, [r4, #0x14]
_02260EDC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_02260E88

	thumb_func_start ov91_02260EE0
ov91_02260EE0: ; 0x02260EE0
	push {r4, r5, r6, lr}
	add r4, r2, #0
	ldr r2, [sp, #0x10]
	add r5, r3, #0
	sub r2, r2, r5
	mul r2, r0
	add r0, r2, #0
	bl _s32_div_f
	add r0, r5, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r6, #0
	bl GF_CosDegNoWrap
	lsl r5, r4, #0xc
	asr r4, r5, #0x1f
	asr r1, r0, #0x1f
	add r2, r5, #0
	add r3, r4, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	ldr r0, [sp, #0x14]
	asr r1, r1, #0xc
	str r1, [r0]
	add r0, r6, #0
	bl GF_SinDegNoWrap
	asr r1, r0, #0x1f
	add r2, r5, #0
	add r3, r4, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	ldr r0, [sp, #0x18]
	asr r1, r1, #0xc
	str r1, [r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_02260EE0

	thumb_func_start ov91_02260F50
ov91_02260F50: ; 0x02260F50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	mov r1, #0x5a
	str r0, [sp, #0x40]
	ldr r0, [sp, #8]
	str r2, [sp, #0xc]
	lsl r1, r1, #2
	add r6, r0, r1
	sub r2, r3, #1
	add r5, r0, #0
	lsl r0, r2, #1
	str r0, [sp, #0x14]
	ldr r1, _0226105C ; =ov91_02261D64
	lsl r0, r2, #3
	add r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	lsl r0, r0, #1
	mov r4, #0
	str r0, [sp, #0x1c]
_02260F7E:
	cmp r4, #0
	bne _02260F86
	mov r2, #0x24
	b _02260F94
_02260F86:
	cmp r4, #1
	bne _02260F8E
	mov r2, #0x25
	b _02260F94
_02260F8E:
	ldr r1, _02261060 ; =ov91_02261C0A
	ldr r0, [sp, #0x14]
	ldrh r2, [r1, r0]
_02260F94:
	ldr r1, [sp, #0xc]
	add r0, r6, #0
	add r3, r7, #0
	bl sub_02018030
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020181B0
	mov r1, #0
	ldr r2, _02261064 ; =0xFFF9E000
	add r0, r5, #0
	add r3, r1, #0
	bl sub_020182A8
	mov r1, #6
	lsl r1, r1, #0xa
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020182C4
	cmp r4, #1
	bne _02260FCC
	add r0, r5, #0
	mov r1, #0
	bl sub_020182A0
_02260FCC:
	cmp r4, #1
	bhi _02260FE0
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	ldrh r1, [r2, r1]
	mov r2, #1
	bl sub_020182E0
	b _02260FF0
_02260FE0:
	mov r0, #0xb4
	bl GF_DegreeToSinCosIdxNoWrap
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #1
	bl sub_020182E0
_02260FF0:
	add r4, r4, #1
	add r6, #0x10
	add r5, #0x78
	cmp r4, #3
	blt _02260F7E
	mov r0, #0
	str r0, [sp, #0x10]
	mov r1, #0x66
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r5, r0, r1
	sub r1, #0x30
	add r0, r0, r1
	ldr r6, _02261068 ; =ov91_02261BF8
	ldr r4, _0226106C ; =ov91_02261BFE
	str r0, [sp, #0x20]
_02261010:
	ldr r0, [sp, #0x40]
	str r7, [sp]
	str r0, [sp, #4]
	ldrh r1, [r4]
	ldrh r3, [r6]
	add r0, r5, #0
	lsl r2, r1, #4
	ldr r1, [sp, #0x20]
	add r1, r1, r2
	ldr r2, [sp, #0xc]
	bl sub_020180BC
	ldrh r1, [r4]
	mov r0, #0x78
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #8]
	add r1, r5, #0
	add r0, r0, r2
	bl sub_020181D4
	ldr r0, [sp, #0x10]
	add r6, r6, #2
	add r0, r0, #1
	add r4, r4, #2
	add r5, #0x14
	str r0, [sp, #0x10]
	cmp r0, #3
	blt _02261010
	mov r2, #1
	mov r1, #0x75
	ldr r0, [sp, #8]
	lsl r2, r2, #0xc
	lsl r1, r1, #2
	str r2, [r0, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0226105C: .word ov91_02261D64
_02261060: .word ov91_02261C0A
_02261064: .word 0xFFF9E000
_02261068: .word ov91_02261BF8
_0226106C: .word ov91_02261BFE
	thumb_func_end ov91_02260F50

	thumb_func_start ov91_02261070
ov91_02261070: ; 0x02261070
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	add r6, r2, #0
	mov r4, #0
	add r5, r7, r0
_0226107E:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020180F8
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #3
	blt _0226107E
	mov r0, #0x5a
	lsl r0, r0, #2
	mov r4, #0
	add r5, r7, r0
_02261096:
	add r0, r5, #0
	bl sub_02018068
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _02261096
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_02261070

	thumb_func_start ov91_022610A8
ov91_022610A8: ; 0x022610A8
	push {r3, r4, r5, lr}
	mov r1, #0x66
	add r4, r0, #0
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, #0x3c
	ldr r1, [r4, r1]
	bl sub_02018124
	mov r0, #0x76
	lsl r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _022611B4
	add r1, r0, #1
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _022610D6
	cmp r1, #1
	beq _02261128
	cmp r1, #2
	beq _0226116C
	b _02261194
_022610D6:
	add r1, r0, #0
	add r1, #8
	add r2, r0, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r3, r2, r1
	mov r2, #0x33
	lsl r2, r2, #0xc
	cmp r3, r2
	bge _022610F2
	add r2, r0, #4
	ldr r2, [r4, r2]
	add r1, r2, r1
	b _022610F4
_022610F2:
	mov r1, #0
_022610F4:
	add r0, r0, #4
	str r1, [r4, r0]
	mov r1, #0x1e
	lsl r1, r1, #4
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #0x46
	add r3, r2, r0
	ldr r0, _022611C8 ; =0x000024CD
	cmp r3, r0
	bgt _02261114
	add r0, r1, #0
	sub r0, #0x46
	add r0, r2, r0
	str r0, [r4, r1]
	b _02261198
_02261114:
	str r0, [r4, r1]
	mov r2, #0x18
	sub r0, r1, #6
	strh r2, [r4, r0]
	sub r0, r1, #7
	ldrb r0, [r4, r0]
	add r2, r0, #1
	sub r0, r1, #7
	strb r2, [r4, r0]
	b _02261198
_02261128:
	add r1, r0, #0
	add r1, #8
	add r2, r0, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r3, r2, r1
	mov r2, #0x33
	lsl r2, r2, #0xc
	cmp r3, r2
	bge _02261144
	add r2, r0, #4
	ldr r2, [r4, r2]
	add r1, r2, r1
	b _02261146
_02261144:
	mov r1, #0
_02261146:
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _022611CC ; =0x000001DA
	ldrsh r0, [r4, r1]
	sub r0, r0, #1
	strh r0, [r4, r1]
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _02261198
	sub r0, r1, #1
	ldrb r0, [r4, r0]
	add r2, r0, #1
	sub r0, r1, #1
	strb r2, [r4, r0]
	mov r2, #0x33
	lsl r2, r2, #0xc
	add r0, r1, #2
	str r2, [r4, r0]
	b _02261198
_0226116C:
	add r1, r0, #4
	mov r2, #1
	ldr r1, [r4, r1]
	lsl r2, r2, #0xc
	add r3, r1, r2
	mov r1, #0x19
	lsl r1, r1, #0xe
	cmp r3, r1
	bge _0226118A
	add r1, r0, #4
	ldr r1, [r4, r1]
	add r0, r0, #4
	add r1, r1, r2
	str r1, [r4, r0]
	b _02261198
_0226118A:
	mov r1, #0x33
	lsl r1, r1, #0xc
	add r0, r0, #4
	str r1, [r4, r0]
	b _02261198
_02261194:
	bl GF_AssertFail
_02261198:
	mov r1, #0x6b
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, #0x30
	ldr r1, [r4, r1]
	bl sub_02018198
	mov r1, #7
	lsl r1, r1, #6
	add r0, r4, r1
	add r1, #0x1c
	ldr r1, [r4, r1]
	bl sub_02018198
_022611B4:
	mov r5, #0
_022611B6:
	add r0, r4, #0
	bl sub_020181EC
	add r5, r5, #1
	add r4, #0x78
	cmp r5, #3
	blt _022611B6
	pop {r3, r4, r5, pc}
	nop
_022611C8: .word 0x000024CD
_022611CC: .word 0x000001DA
	thumb_func_end ov91_022610A8

	thumb_func_start ov91_022611D0
ov91_022611D0: ; 0x022611D0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_020182A0
	add r0, r4, #0
	add r0, #0x78
	mov r1, #1
	bl sub_020182A0
	mov r0, #0x77
	lsl r0, r0, #2
	mov r3, #0
	mov r2, #1
	str r3, [r4, r0]
	lsl r2, r2, #0xc
	add r1, r0, #4
	str r2, [r4, r1]
	sub r1, r0, #4
	mov r2, #1
	strb r2, [r4, r1]
	sub r0, r0, #3
	strb r3, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov91_022611D0

	thumb_func_start ov91_02261200
ov91_02261200: ; 0x02261200
	mov r2, #0x75
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov91_02261200

	thumb_func_start ov91_02261208
ov91_02261208: ; 0x02261208
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r4, r0, #0
	ldr r0, [sp, #0x68]
	ldr r6, [r2]
	str r0, [sp, #0x68]
	ldr r0, [r2, #4]
	ldr r7, [r2, #8]
	str r0, [sp, #0x2c]
	asr r0, r0, #0x1f
	str r0, [sp, #0x30]
	asr r0, r6, #0x1f
	str r0, [sp, #0x34]
	add r5, r1, #0
	asr r0, r7, #0x1f
	str r0, [sp, #0x38]
	ldr r2, [r4]
	str r3, [sp]
	ldr r1, [sp, #0x34]
	add r0, r6, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	ldr r2, [r4, #4]
	str r0, [sp, #0x3c]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	asr r3, r2, #0x1f
	bl _ll_mul
	ldr r2, [r4, #8]
	str r1, [sp, #0x20]
	str r0, [sp, #0x40]
	ldr r1, [sp, #0x38]
	add r0, r7, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	ldr r2, [r5, #8]
	str r1, [sp, #0x18]
	str r0, [sp, #0x44]
	ldr r1, [sp, #0x38]
	add r0, r7, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	ldr r2, [r5]
	str r1, [sp, #0x10]
	str r0, [sp, #0x48]
	ldr r1, [sp, #0x34]
	add r0, r6, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	ldr r2, [r5, #4]
	str r0, [sp, #0x4c]
	add r6, r1, #0
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	asr r3, r2, #0x1f
	bl _ll_mul
	mov ip, r0
	mov r7, #2
	str r1, [sp, #8]
	ldr r0, [sp, #0x3c]
	lsl r7, r7, #0xa
	mov r1, #0
	add r2, r0, r7
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	adc r0, r1
	str r0, [sp, #0x28]
	lsl r0, r0, #0x14
	lsr r2, r2, #0xc
	orr r2, r0
	ldr r0, [sp, #0x40]
	add r0, r0, r7
	adc r3, r1
	str r3, [sp, #0x20]
	lsl r3, r3, #0x14
	lsr r0, r0, #0xc
	orr r0, r3
	add r2, r2, r0
	ldr r0, [sp, #0x44]
	ldr r3, [sp, #0x18]
	add r0, r0, r7
	adc r3, r1
	str r3, [sp, #0x18]
	lsl r3, r3, #0x14
	lsr r0, r0, #0xc
	orr r0, r3
	add r2, r2, r0
	ldr r0, [sp]
	sub r0, r0, r2
	ldr r2, [sp, #0x48]
	add r3, r2, r7
	ldr r2, [sp, #0x10]
	adc r2, r1
	str r2, [sp, #0x10]
	lsl r2, r2, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	ldr r2, [sp, #0x4c]
	add r2, r2, r7
	adc r6, r1
	lsl r6, r6, #0x14
	lsr r2, r2, #0xc
	orr r2, r6
	mov r6, ip
	add r7, r6, r7
	ldr r6, [sp, #8]
	adc r6, r1
	str r6, [sp, #8]
	lsl r1, r6, #0x14
	lsr r6, r7, #0xc
	orr r6, r1
	add r1, r2, r6
	add r1, r3, r1
	bl FX_Div
	add r6, r0, #0
	ldr r0, [r5]
	asr r7, r6, #0x1f
	asr r1, r0, #0x1f
	add r2, r6, #0
	add r3, r7, #0
	bl _ll_mul
	mov r3, #2
	add r2, r0, #0
	lsl r3, r3, #0xa
	add r3, r2, r3
	ldr r2, _02261378 ; =0x00000000
	ldr r0, [r4]
	adc r1, r2
	lsr r2, r3, #0xc
	lsl r1, r1, #0x14
	orr r2, r1
	add r1, r0, r2
	ldr r0, [sp, #0x68]
	add r2, r6, #0
	str r1, [r0]
	ldr r0, [r5, #4]
	add r3, r7, #0
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r3, #2
	add r2, r0, #0
	lsl r3, r3, #0xa
	add r3, r2, r3
	ldr r2, _02261378 ; =0x00000000
	ldr r0, [r4, #4]
	adc r1, r2
	lsr r2, r3, #0xc
	lsl r1, r1, #0x14
	orr r2, r1
	add r1, r0, r2
	ldr r0, [sp, #0x68]
	add r2, r6, #0
	str r1, [r0, #4]
	ldr r0, [r5, #8]
	add r3, r7, #0
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r3, #2
	ldr r2, [r4, #8]
	mov r4, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r4
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	ldr r0, [sp, #0x68]
	add r1, r2, r1
	str r1, [r0]
	ldr r0, [sp, #0x6c]
	str r6, [r0]
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02261378: .word 0x00000000
	thumb_func_end ov91_02261208

	thumb_func_start ov91_0226137C
ov91_0226137C: ; 0x0226137C
	mov r2, #0x66
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov91_0226137C

	thumb_func_start ov91_02261384
ov91_02261384: ; 0x02261384
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #0x19
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, sp, #0
	bl GF_Camera_GetAngle
	add r0, sp, #0
	mov r1, #0x19
	strh r4, [r0]
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, sp, #0
	bl GF_Camera_SetAngle
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov91_02261384

	thumb_func_start ov91_022613AC
ov91_022613AC: ; 0x022613AC
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	mov r2, #2
	strh r2, [r0, #4]
	strb r1, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ov91_022613AC

	thumb_func_start ov91_022613C8
ov91_022613C8: ; 0x022613C8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	ldrh r0, [r4]
	add r5, r1, #0
	cmp r0, #3
	bhi _022614CA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022613E2: ; jump table
	.short _022614CA - _022613E2 - 2 ; case 0
	.short _022613EA - _022613E2 - 2 ; case 1
	.short _02261406 - _022613E2 - 2 ; case 2
	.short _0226148E - _022613E2 - 2 ; case 3
_022613EA:
	mov r1, #4
	ldrsh r1, [r4, r1]
	ldrb r2, [r4, #6]
	add r0, r5, #0
	sub r1, r1, #1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl ov91_022614FC
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
_02261406:
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r0, #0x10
	blt _0226143E
	mov r0, #3
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r1, #4
	ldrsh r1, [r4, r1]
	ldrb r2, [r4, #6]
	add r0, r5, #0
	bl ov91_022614FC
	mov r0, #0x10
	str r0, [sp]
	mov r1, #4
	ldrsh r2, [r4, r1]
	mov r3, #1
	add r1, r3, #0
	lsl r1, r2
	ldr r0, _022614D0 ; =0x04001050
	mov r2, #8
	mov r3, #0
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0226143E:
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #4
	ldrsh r2, [r4, r0]
	sub r5, r2, #2
	sub r6, r2, #1
	cmp r2, #0
	bge _02261450
	add r2, r2, #3
_02261450:
	cmp r5, #0
	bge _02261456
	add r5, r5, #3
_02261456:
	cmp r6, #0
	bge _0226145C
	add r6, r6, #3
_0226145C:
	mov r0, #2
	ldrsh r0, [r4, r0]
	mov r4, #1
	lsl r1, r0, #4
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r1, r0, #4
	mov r0, #0x10
	sub r3, r0, r1
	add r1, r4, #0
	lsl r1, r2
	add r2, r4, #0
	sub r0, r0, r3
	str r0, [sp]
	lsl r2, r5
	lsl r4, r6
	orr r4, r2
	mov r2, #8
	ldr r0, _022614D0 ; =0x04001050
	orr r2, r4
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0226148E:
	mov r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #8
	blt _022614A2
	mov r1, #0
	ldr r0, _022614D0 ; =0x04001050
	strh r1, [r4]
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_022614A2:
	add r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	mov r5, #1
	lsl r1, r0, #4
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r3, r0, #3
	mov r0, #0x10
	sub r0, r0, r3
	str r0, [sp]
	mov r1, #4
	ldrsh r2, [r4, r1]
	add r1, r5, #0
	ldr r0, _022614D0 ; =0x04001050
	lsl r1, r2
	mov r2, #8
	bl G2x_SetBlendAlpha_
_022614CA:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022614D0: .word 0x04001050
	thumb_func_end ov91_022613C8

	thumb_func_start ov91_022614D4
ov91_022614D4: ; 0x022614D4
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #7]
	add r0, r0, #1
	strb r0, [r4, #7]
	ldrb r0, [r4, #7]
	cmp r0, #0xa
	blo _022614FA
	mov r0, #1
	strh r0, [r4]
	mov r0, #4
	ldrsh r0, [r4, r0]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	strh r1, [r4, #4]
	mov r0, #0
	strb r0, [r4, #7]
_022614FA:
	pop {r4, pc}
	thumb_func_end ov91_022614D4

	thumb_func_start ov91_022614FC
ov91_022614FC: ; 0x022614FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	lsl r0, r2, #1
	str r1, [sp, #0xc]
	add r1, r0, #2
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	lsl r0, r1, #0x18
	mov r4, #0
	lsr r7, r0, #0x18
_02261516:
	ldr r0, [sp, #0xc]
	sub r5, r0, r4
	bpl _0226151E
	add r5, r5, #3
_0226151E:
	mov r1, #2
	add r0, r5, #4
	sub r1, r1, r4
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	cmp r4, #0
	bne _0226154E
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	add r1, r5, #4
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r6]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	b _02261568
_0226154E:
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r1, r5, #4
	str r0, [sp, #8]
	lsl r1, r1, #0x18
	mov r2, #0
	ldr r0, [r6]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgTilemapRectChangePalette
_02261568:
	add r1, r5, #4
	lsl r1, r1, #0x18
	ldr r0, [r6]
	lsr r1, r1, #0x18
	bl BgCommitTilemapBufferToVram
	add r4, r4, #1
	cmp r4, #3
	blt _02261516
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov91_022614FC

	thumb_func_start ov91_02261580
ov91_02261580: ; 0x02261580
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r5, r0, #0
	add r6, r3, #0
	add r0, #0x9c
	add r4, r1, #0
	str r6, [r0]
	mov r1, #0x8c
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r7, r2, #0
	str r6, [sp, #8]
	add r1, #0xbc
	ldr r0, [r4, r1]
	add r1, r7, #0
	mov r2, #0xa
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r5]
	mov r1, #0x8c
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	add r1, #0xc0
	ldr r0, [r4, r1]
	add r1, r7, #0
	mov r2, #0xb
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	str r0, [r5, #4]
	mov r1, #0x8c
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	add r1, #0xc4
	ldr r0, [r4, r1]
	add r1, r7, #0
	mov r2, #9
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #8]
	mov r1, #0x8c
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	add r1, #0xc8
	ldr r0, [r4, r1]
	add r1, r7, #0
	mov r2, #8
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0xc]
	ldr r0, [r5]
	bl sub_0200AE18
	cmp r0, #0
	bne _02261608
	bl GF_AssertFail
_02261608:
	ldr r0, [r5, #4]
	bl sub_0200B00C
	cmp r0, #0
	bne _02261616
	bl GF_AssertFail
_02261616:
	ldr r0, [r5]
	bl sub_0200A740
	ldr r0, [r5, #4]
	bl sub_0200A740
	mov r1, #0x8c
	add r0, r1, #0
	add r2, r1, #0
	str r1, [sp]
	sub r0, #0x8d
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r2, #0xbc
	ldr r2, [r4, r2]
	add r3, r1, #0
	str r2, [sp, #0x14]
	add r2, r1, #0
	add r2, #0xc0
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	add r2, r1, #0
	add r2, #0xc4
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	add r2, r1, #0
	add r2, #0xc8
	ldr r2, [r4, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, #0
	add r0, #0x10
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x5c]
	add r0, r5, #0
	add r0, #0x10
	str r0, [sp, #0x60]
	ldr r0, _0226178C ; =0xFFFC0000
	str r6, [sp, #0x78]
	str r0, [sp, #0x64]
	mov r0, #3
	lsl r0, r0, #0x10
	str r0, [sp, #0x68]
	mov r0, #1
	str r0, [sp, #0x70]
	str r0, [sp, #0x74]
	add r0, sp, #0x5c
	bl sub_02024714
	mov r1, #0
	str r0, [r5, #0x34]
	bl Set2dSpriteVisibleFlag
	mov r0, #0x10
	add r1, r6, #0
	bl String_ctor
	str r0, [r5, #0x5c]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r1, r5, #0
	ldr r0, [r4]
	add r1, #0x38
	mov r2, #3
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	add r0, r5, #0
	add r0, #0x38
	add r1, r6, #0
	bl sub_02013910
	mov r1, #1
	str r0, [r5, #0x4c]
	bl sub_02013948
	mov r1, #1
	add r3, r5, #0
	add r2, r1, #0
	add r3, #0x50
	bl sub_02021AC8
	cmp r0, #1
	beq _022616D2
	bl GF_AssertFail
_022616D2:
	mov r1, #0x96
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	add r1, #0xb6
	ldr r0, [r4, r1]
	mov r1, #0x10
	mov r2, #7
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x60]
	bl sub_0200B00C
	cmp r0, #0
	bne _022616FA
	bl GF_AssertFail
_022616FA:
	ldr r0, [r5, #0x60]
	bl sub_0200A740
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	str r0, [sp, #0x2c]
	add r0, r5, #0
	add r0, #0x38
	str r0, [sp, #0x30]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x34]
	ldr r0, [r5, #0x60]
	bl sub_0200B0F8
	str r0, [sp, #0x38]
	ldr r0, [r5, #0x34]
	str r0, [sp, #0x3c]
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x40]
	mov r0, #6
	mvn r0, r0
	str r0, [sp, #0x44]
	add r0, r0, #2
	str r0, [sp, #0x48]
	mov r0, #0
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	mov r0, #1
	str r0, [sp, #0x54]
	str r6, [sp, #0x58]
	ldr r1, [r5, #0x4c]
	add r0, sp, #0x2c
	bl sub_02013950
	mov r1, #0
	str r0, [r5, #0x48]
	bl sub_020137C0
	add r0, r5, #0
	add r0, #0x38
	bl RemoveWindow
	mov r2, #8
	add r0, r5, #0
	mov r3, #9
	str r2, [sp]
	ldr r1, _0226178C ; =0xFFFC0000
	add r0, #0x64
	lsl r2, r2, #0xe
	lsl r3, r3, #0xe
	bl ov91_0225D40C
	mov r0, #4
	mov r1, #3
	lsl r1, r1, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x7c
	add r2, r1, #0
	lsr r3, r1, #2
	bl ov91_0225D40C
	add r0, r5, #0
	mov r1, #0
	add r0, #0x94
	strh r1, [r0]
	mov r0, #4
	add r5, #0x96
	strh r0, [r5]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0226178C: .word 0xFFFC0000
	thumb_func_end ov91_02261580

	thumb_func_start ov91_02261790
ov91_02261790: ; 0x02261790
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x48]
	add r4, r1, #0
	bl sub_020139C8
	ldr r0, [r5, #0x60]
	bl sub_0200B0A8
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x60]
	bl DestroySingle2DGfxResObj
	add r0, r5, #0
	add r0, #0x50
	bl sub_02021B5C
	ldr r0, [r5, #0x4c]
	bl sub_02013938
	ldr r0, [r5, #0x5c]
	bl String_dtor
	ldr r0, [r5, #0x34]
	bl sub_02024758
	ldr r0, [r5]
	bl sub_0200AEB0
	ldr r0, [r5, #4]
	bl sub_0200B0A8
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5]
	bl DestroySingle2DGfxResObj
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #4]
	bl DestroySingle2DGfxResObj
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #8]
	bl DestroySingle2DGfxResObj
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, #0xc]
	bl DestroySingle2DGfxResObj
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_02261790

	thumb_func_start ov91_02261808
ov91_02261808: ; 0x02261808
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	str r0, [sp]
	add r1, r2, #0
	mov r2, #2
	ldr r0, [r5, #0x5c]
	add r3, r2, #0
	bl String16_FormatInteger
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r1, r5, #0
	ldr r0, [r4]
	add r1, #0x38
	mov r2, #3
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0226188C ; =0x000F0E00
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x5c]
	add r0, #0x38
	bl AddTextPrinterParameterized2
	add r3, r5, #0
	add r3, #0x9c
	add r2, r5, #0
	ldr r0, [r5, #0x48]
	ldr r1, [r5, #0x4c]
	ldr r3, [r3]
	add r2, #0x38
	bl sub_020139D0
	add r0, r5, #0
	add r0, #0x38
	bl RemoveWindow
	ldr r0, [r5, #0x48]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [r5, #0x34]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	mov r1, #1
	add r0, #0x98
	strh r1, [r0]
	mov r0, #0
	add r5, #0x9a
	strh r0, [r5]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0226188C: .word 0x000F0E00
	thumb_func_end ov91_02261808

	thumb_func_start ov91_02261890
ov91_02261890: ; 0x02261890
	add r1, r0, #0
	add r1, #0x98
	ldrh r1, [r1]
	cmp r1, #3
	beq _022618AC
	cmp r1, #2
	bne _022618A6
	add r1, r0, #0
	mov r2, #0xc
	add r1, #0x9a
	strh r2, [r1]
_022618A6:
	mov r1, #3
	add r0, #0x98
	strh r1, [r0]
_022618AC:
	bx lr
	.balign 4, 0
	thumb_func_end ov91_02261890

	thumb_func_start ov91_022618B0
ov91_022618B0: ; 0x022618B0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x98
	ldrh r0, [r0]
	add r4, r1, #0
	cmp r0, #3
	beq _0226191E
	mov r0, #1
	str r0, [sp]
	add r1, r2, #0
	mov r2, #2
	ldr r0, [r5, #0x5c]
	add r3, r2, #0
	bl String16_FormatInteger
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r1, r5, #0
	ldr r0, [r4]
	add r1, #0x38
	mov r2, #3
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02261924 ; =0x000F0E00
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x5c]
	add r0, #0x38
	bl AddTextPrinterParameterized2
	add r3, r5, #0
	add r3, #0x9c
	add r2, r5, #0
	ldr r0, [r5, #0x48]
	ldr r1, [r5, #0x4c]
	ldr r3, [r3]
	add r2, #0x38
	bl sub_020139D0
	add r0, r5, #0
	add r0, #0x38
	bl RemoveWindow
	mov r0, #0
	add r5, #0x96
	strh r0, [r5]
_0226191E:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02261924: .word 0x000F0E00
	thumb_func_end ov91_022618B0

	thumb_func_start ov91_02261928
ov91_02261928: ; 0x02261928
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x98
	ldrh r0, [r0]
	cmp r0, #3
	bhi _022619A0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261942: ; jump table
	.short _022619A0 - _02261942 - 2 ; case 0
	.short _0226194A - _02261942 - 2 ; case 1
	.short _022619A0 - _02261942 - 2 ; case 2
	.short _02261966 - _02261942 - 2 ; case 3
_0226194A:
	mov r0, #0x94
	ldrsh r0, [r4, r0]
	cmp r0, #8
	bge _0226195C
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x94
	strh r1, [r0]
	b _022619A0
_0226195C:
	add r0, r4, #0
	mov r1, #2
	add r0, #0x98
	strh r1, [r0]
	b _022619A0
_02261966:
	mov r0, #0x9a
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02261978
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x9a
	strh r1, [r0]
	b _022619A0
_02261978:
	mov r0, #0x94
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0226198A
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x94
	strh r1, [r0]
	b _022619A0
_0226198A:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x98
	strh r1, [r0]
	ldr r0, [r4, #0x48]
	bl sub_020137C0
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_022619A0:
	mov r1, #0x96
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bge _022619C0
	add r2, r0, #1
	add r0, r4, #0
	add r0, #0x96
	strh r2, [r0]
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	add r0, #0x8c
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x7c
	bl ov91_0225D46C
_022619C0:
	mov r0, #0x94
	ldrsh r0, [r4, r0]
	str r0, [r4, #0x74]
	add r0, r4, #0
	add r0, #0x64
	bl ov91_0225D46C
	ldr r0, [r4, #0x64]
	add r1, sp, #0
	str r0, [sp]
	ldr r0, [r4, #0x7c]
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	bl sub_020247D4
	ldr r0, [r4, #0x48]
	bl sub_02013728
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov91_02261928

	thumb_func_start ov91_022619E8
ov91_022619E8: ; 0x022619E8
	mov r2, #0
	strh r2, [r0]
	mov r1, #1
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	ldr r3, _022619F8 ; =PlaySE
	ldr r0, _022619FC ; =0x00000586
	bx r3
	.balign 4, 0
_022619F8: .word PlaySE
_022619FC: .word 0x00000586
	thumb_func_end ov91_022619E8

	thumb_func_start ov91_02261A00
ov91_02261A00: ; 0x02261A00
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r0, [r4, #2]
	add r5, r1, #0
	add r6, r2, #0
	cmp r0, #0
	beq _02261B08
	ldrh r0, [r4]
	cmp r0, #5
	bhi _02261B08
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261A22: ; jump table
	.short _02261A2E - _02261A22 - 2 ; case 0
	.short _02261A8E - _02261A22 - 2 ; case 1
	.short _02261AA8 - _02261A22 - 2 ; case 2
	.short _02261AD4 - _02261A22 - 2 ; case 3
	.short _02261AEE - _02261A22 - 2 ; case 4
	.short _02261B02 - _02261A22 - 2 ; case 5
_02261A2E:
	mov r0, #3
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #3]
	ldrsb r1, [r4, r0]
	mov r0, #0x19
	lsl r0, r0, #0xc
	mul r0, r1
	mov r1, #0x3a
	bl _s32_div_f
	mov r1, #1
	add r2, r0, #0
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r1, r2, r1
	bl ov91_02261200
	mov r0, #3
	ldrsb r1, [r4, r0]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x3a
	bl _s32_div_f
	add r2, r0, #0
	mov r0, #7
	add r1, r0, #0
	add r1, #0xf9
	add r1, r2, r1
	bl GF_SndHandleSetTempoRatio
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0xc
	bne _02261A7C
	ldr r0, _02261B0C ; =0x00000587
	bl PlaySE
_02261A7C:
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0x3a
	blt _02261B08
	ldrh r0, [r4]
	add sp, #4
	add r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261A8E:
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x3f
	bl sub_0200B484
	ldrh r0, [r4]
	add sp, #4
	add r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261AA8:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #1
	bne _02261B08
	add r0, r5, #0
	bl ov91_022611D0
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl ov91_02261200
	add r0, r6, #0
	mov r1, #1
	bl ov91_02260364
	ldrh r0, [r4]
	add sp, #4
	add r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261AD4:
	mov r0, #1
	str r0, [sp]
	mov r0, #0xe
	mov r1, #0
	mov r2, #0x10
	mov r3, #0x3f
	bl sub_0200B484
	ldrh r0, [r4]
	add sp, #4
	add r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261AEE:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #1
	bne _02261B08
	ldrh r0, [r4]
	add sp, #4
	add r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02261B02:
	mov r0, #0
	strb r0, [r4, #2]
	strh r0, [r4]
_02261B08:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02261B0C: .word 0x00000587
	thumb_func_end ov91_02261A00

	thumb_func_start ov91_02261B10
ov91_02261B10: ; 0x02261B10
	mov r0, #7
	add r1, r0, #0
	ldr r3, _02261B1C ; =GF_SndHandleSetTempoRatio
	add r1, #0xf9
	bx r3
	nop
_02261B1C: .word GF_SndHandleSetTempoRatio
	thumb_func_end ov91_02261B10

	thumb_func_start ov91_02261B20
ov91_02261B20: ; 0x02261B20
	ldr r0, _02261B24 ; =ov91_02262754
	bx lr
	.balign 4, 0
_02261B24: .word ov91_02262754
	thumb_func_end ov91_02261B20

	thumb_func_start ov91_02261B28
ov91_02261B28: ; 0x02261B28
	mov r0, #8
	bx lr
	thumb_func_end ov91_02261B28

	thumb_func_start ov91_02261B2C
ov91_02261B2C: ; 0x02261B2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov91_02261B20
	add r4, r0, #0
	bl ov91_02261B28
	add r1, r0, #0
	add r0, r4, #0
	add r2, r5, #0
	bl sub_0203410C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov91_02261B2C

	thumb_func_start ov91_02261B48
ov91_02261B48: ; 0x02261B48
	mov r0, #0
	bx lr
	thumb_func_end ov91_02261B48

	thumb_func_start ov91_02261B4C
ov91_02261B4C: ; 0x02261B4C
	add r0, r3, #0
	ldr r3, _02261B54 ; =ov91_0225CA64
	bx r3
	nop
_02261B54: .word ov91_0225CA64
	thumb_func_end ov91_02261B4C

	thumb_func_start ov91_02261B58
ov91_02261B58: ; 0x02261B58
	add r0, r3, #0
	ldr r3, _02261B60 ; =ov91_0225CA6C
	bx r3
	nop
_02261B60: .word ov91_0225CA6C
	thumb_func_end ov91_02261B58

	thumb_func_start ov91_02261B64
ov91_02261B64: ; 0x02261B64
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r3, #0
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov91_0225CA90
	bl sub_0203769C
	cmp r0, #0
	bne _02261B88
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov91_0225CA74
_02261B88:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov91_02261B64

	thumb_func_start ov91_02261B8C
ov91_02261B8C: ; 0x02261B8C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r2]
	add r0, r3, #0
	add r2, r4, #0
	bl ov91_0225CA9C
	pop {r4, pc}
	thumb_func_end ov91_02261B8C

	thumb_func_start ov91_02261B9C
ov91_02261B9C: ; 0x02261B9C
	push {r4, lr}
	add r4, r0, #0
	add r1, r2, #0
	add r0, r3, #0
	add r2, r4, #0
	bl ov91_0225CABC
	pop {r4, pc}
	thumb_func_end ov91_02261B9C

	thumb_func_start ov91_02261BAC
ov91_02261BAC: ; 0x02261BAC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r2]
	add r0, r3, #0
	add r2, r4, #0
	bl ov91_0225CAEC
	pop {r4, pc}
	thumb_func_end ov91_02261BAC

	thumb_func_start ov91_02261BBC
ov91_02261BBC: ; 0x02261BBC
	add r0, r3, #0
	ldr r3, _02261BC4 ; =ov91_0225CB50
	bx r3
	nop
_02261BC4: .word ov91_0225CB50
	thumb_func_end ov91_02261BBC

	thumb_func_start ov91_02261BC8
ov91_02261BC8: ; 0x02261BC8
	push {r3, lr}
	ldr r1, [r2]
	cmp r0, #0
	bne _02261BD6
	add r0, r3, #0
	bl ov91_0225CAE0
_02261BD6:
	pop {r3, pc}
	thumb_func_end ov91_02261BC8

	thumb_func_start ov91_02261BD8
ov91_02261BD8: ; 0x02261BD8
	mov r0, #0x14
	bx lr
	thumb_func_end ov91_02261BD8

	thumb_func_start ov91_02261BDC
ov91_02261BDC: ; 0x02261BDC
	mov r0, #0x10
	bx lr
	thumb_func_end ov91_02261BDC

	thumb_func_start ov91_02261BE0
ov91_02261BE0: ; 0x02261BE0
	mov r0, #4
	bx lr
	thumb_func_end ov91_02261BE0

	thumb_func_start ov91_02261BE4
ov91_02261BE4: ; 0x02261BE4
	mov r0, #4
	bx lr
	thumb_func_end ov91_02261BE4

	.rodata

_02261BE8:
	.byte 0x00, 0x00, 0x00, 0x00

ov91_02261BEC: ; 0x02261BEC
	.byte 0x00, 0x09, 0x0A, 0x0B

ov91_02261BF0: ; 0x02261BF0
	.byte 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x00, 0x00, 0x00

ov91_02261BF8: ; 0x02261BF8
	.byte 0x26, 0x00, 0x27, 0x00, 0x28, 0x00

ov91_02261BFE: ; 0x02261BFE
	.byte 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00

ov91_02261C04: ; 0x02261C04
	.byte 0x17, 0x00, 0x18, 0x00, 0x19, 0x00

ov91_02261C0A: ; 0x02261C0A
	.byte 0x23, 0x00, 0x23, 0x00, 0x22, 0x00
	.byte 0x21, 0x00

ov91_02261C12: ; 0x02261C12
	.byte 0x00

ov91_02261C13: ; 0x02261C13
	.byte 0x00, 0x01, 0x0A, 0x0B, 0x14, 0x15, 0x1E, 0x1F, 0x28

ov91_02261C1C: ; 0x02261C1C
	.byte 0x1A, 0x00, 0x1B, 0x00
	.byte 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00

ov91_02261C28: ; 0x02261C28
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xFA, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00

ov91_02261C34: ; 0x02261C34
	.byte 0x64, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov91_02261C44: ; 0x02261C44
	.byte 0x94, 0x02, 0x00, 0x00, 0xEE, 0x02, 0x00, 0x00

ov91_02261C4C: ; 0x02261C4C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x9C, 0x00, 0x00, 0x00, 0x00, 0x00

ov91_02261C58: ; 0x02261C58
	.word ov91_0225E1EC
	.word ov91_0225E1F4
	.word ov91_0225E1FC

ov91_02261C64: ; 0x02261C64
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov91_02261C74: ; 0x02261C74
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov91_02261C84: ; 0x02261C84
	.byte 0xB1, 0x00, 0xA7, 0x00, 0x93, 0x00, 0x89, 0x00, 0x7F, 0x00, 0x75, 0x00
	.byte 0x6B, 0x00, 0x61, 0x00, 0x57, 0x00, 0x4D, 0x00, 0x4D, 0x00, 0x4D, 0x00

ov91_02261C9C: ; 0x02261C9C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov91_02261CB8: ; 0x02261CB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov91_02261CD4: ; 0x02261CD4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov91_02261CF0: ; 0x02261CF0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov91_02261D0C: ; 0x02261D0C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov91_02261D28: ; 0x02261D28
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00

ov91_02261D3C: ; 0x02261D3C
	.byte 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x55, 0xAA, 0xAA, 0x00, 0x00

ov91_02261D5C: ; 0x02261D5C
	.byte 0x00, 0x00, 0xFF, 0x7F
	.byte 0xFF, 0x3F, 0xFF, 0xBF

ov91_02261D64: ; 0x02261D64
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0x54, 0xD5, 0xAA, 0x2A, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0xBF, 0xFF, 0x3F

ov91_02261D84: ; 0x02261D84
	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov91_02261DAC: ; 0x02261DAC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov91_02261F8C: ; 0x02261F8C
	.byte 0x17, 0x00, 0x00, 0x00

ov91_02261F90: ; 0x02261F90
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00

ov91_022621AC: ; 0x022621AC
	.ascii "polySurface2"
	.space 16-(.-ov91_022621AC)
ov91_022621BC:
	.ascii "polySurface3"
	.space 16-(.-ov91_022621BC)
ov91_022621CC:
	.ascii "pTorus2"
	.space 16-(.-ov91_022621CC)
ov91_022621DC:
	.ascii "null1"
	.space 16-(.-ov91_022621DC)
ov91_022621EC:
	.ascii ""
	.space 16-(ov91_022621EC-.)
ov91_022621FC:
	.ascii ""
	.space 16-(.-ov91_022621FC)
ov91_0226220C:
	.ascii ""
	.space 16-(.-ov91_0226220C)
ov91_0226221C:
	.ascii ""
	.space 16-(.-ov91_0226221C)
ov91_0226222C:
	.ascii ""
	.space 16-(.-ov91_0226222C)
ov91_0226223C:
	.ascii ""
	.space 16-(.-ov91_0226223C)
ov91_0226224C:
	.ascii ""
	.space 16-(.-ov91_0226224C)
ov91_0226225C:
	.ascii ""
	.space 16-(.-ov91_0226225C)
ov91_0226226C:
	.ascii ""
	.space 16-(.-ov91_0226226C)
ov91_0226227C:
	.ascii ""
	.space 16-(.-ov91_0226227C)
ov91_0226228C:
	.ascii ""
	.space 16-(.-ov91_0226228C)
ov91_0226229C:
	.ascii "polySurface7"
	.space 16-(.-ov91_0226229C)
ov91_022622AC:
	.ascii "polySurface13"
	.space 16-(.-ov91_022622AC)
ov91_022622BC:
	.ascii "pSphere2"
	.space 16-(.-ov91_022622BC)
ov91_022622CC:
	.ascii "pSphere3"
	.space 16-(.-ov91_022622CC)
ov91_022622DC:
	.ascii "pSphere6"
	.space 16-(.-ov91_022622DC)
ov91_022622EC:
	.ascii "pSphere7"
	.space 16-(.-ov91_022622EC)
ov91_022622FC:
	.ascii ""
	.space 16-(.-ov91_022622FC)
ov91_0226230C:
	.ascii ""
	.space 16-(.-ov91_0226230C)
ov91_0226231C:
	.ascii ""
	.space 16-(.-ov91_0226231C)
ov91_0226232C:
	.ascii ""
	.space 16-(.-ov91_0226232C)
ov91_0226233C:
	.ascii ""
	.space 16-(.-ov91_0226233C)
ov91_0226234C:
	.ascii ""
	.space 16-(.-ov91_0226234C)
ov91_0226235C:
	.ascii ""
	.space 16-(.-ov91_0226235C)
ov91_0226236C:
	.ascii ""
	.space 16-(.-ov91_0226236C)
ov91_0226237C:
	.ascii ""
	.space 16-(.-ov91_0226237C)
ov91_0226238C:
	.ascii "polySurface13"
	.space 16-(.-ov91_0226238C)
ov91_0226239C:
	.ascii "pSphere7"
	.space 16-(.-ov91_0226239C)
ov91_022623AC:
	.ascii ""
	.space 16-(.-ov91_022623AC)
ov91_022623BC:
	.ascii ""
	.space 16-(.-ov91_022623BC)
ov91_022623CC:
	.ascii ""
	.space 16-(.-ov91_022623CC)
ov91_022623DC:
	.ascii ""
	.space 16-(.-ov91_022623DC)
ov91_022623EC:
	.ascii ""
	.space 16-(.-ov91_022623EC)
ov91_022623FC:
	.ascii ""
	.space 16-(.-ov91_022623FC)
ov91_0226240C:
	.ascii ""
	.space 16-(.-ov91_0226240C)
ov91_0226241C:
	.ascii ""
	.space 16-(.-ov91_0226241C)
ov91_0226242C:
	.ascii ""
	.space 16-(.-ov91_0226242C)
ov91_0226243C:
	.ascii ""
	.space 16-(.-ov91_0226243C)
ov91_0226244C:
	.ascii ""
	.space 16-(.-ov91_0226244C)
ov91_0226245C:
	.ascii ""
	.space 16-(.-ov91_0226245C)
ov91_0226246C:
	.ascii ""
	.space 16-(.-ov91_0226246C)
ov91_0226247C:
	.ascii "null1"
	.space 16-(.-ov91_0226247C)
ov91_0226248C:
	.ascii "pCylinder4"
	.space 16-(.-ov91_0226248C)
ov91_0226249C:
	.ascii "pCylinder5"
	.space 16-(.-ov91_0226249C)
ov91_022624AC:
	.ascii "pSphere2"
	.space 16-(.-ov91_022624AC)
ov91_022624BC:
	.ascii "pSphere3"
	.space 16-(.-ov91_022624BC)
ov91_022624CC:
	.ascii "pSphere6"
	.space 16-(.-ov91_022624CC)
ov91_022624DC:
	.ascii "pSphere7"
	.space 16-(.-ov91_022624DC)
ov91_022624EC:
	.ascii "pTorus1"
	.space 16-(.-ov91_022624EC)
ov91_022624FC:
	.ascii "pTorus2"
	.space 16-(.-ov91_022624FC)
ov91_0226250C:
	.ascii "polySurface13"
	.space 16-(.-ov91_0226250C)
ov91_0226251C:
	.ascii "polySurface8"
	.space 16-(.-ov91_0226251C)
ov91_0226252C:
	.ascii "polySurface2"
	.space 16-(.-ov91_0226252C)
ov91_0226253C:
	.ascii "polySurface3"
	.space 16-(.-ov91_0226253C)
ov91_0226254C:
	.ascii "polySurface7"
	.space 16-(.-ov91_0226254C)
ov91_0226255C:
	.ascii "polySurface12"
	.space 16-(.-ov91_0226255C)
ov91_0226256C:
	.ascii "polySurface7"
	.space 16-(.-ov91_0226256C)
ov91_0226257C:
	.ascii "polySurface13"
	.space 16-(.-ov91_0226257C)
ov91_0226258C:
	.ascii "pSphere2"
	.space 16-(.-ov91_0226258C)
ov91_0226259C:
	.ascii "pSphere3"
	.space 16-(.-ov91_0226259C)
ov91_022625AC:
	.ascii "pSphere6"
	.space 16-(.-ov91_022625AC)
ov91_022625BC:
	.ascii "pSphere7"
	.space 16-(.-ov91_022625BC)
ov91_022625CC:
	.ascii "null1"
	.space 16-(.-ov91_022625CC)
ov91_022625DC:
	.ascii ""
	.space 16-(.-ov91_022625DC)
ov91_022625EC:
	.ascii ""
	.space 16-(.-ov91_022625EC)
ov91_022625FC:
	.ascii ""
	.space 16-(.-ov91_022625FC)
ov91_0226260C:
	.ascii ""
	.space 16-(.-ov91_0226260C)
ov91_0226261C:
	.ascii ""
	.space 16-(.-ov91_0226261C)
ov91_0226262C:
	.ascii ""
	.space 16-(.-ov91_0226262C)
ov91_0226263C:
	.ascii ""
	.space 16-(.-ov91_0226263C)
ov91_0226264C:
	.ascii ""
	.space 16-(.-ov91_0226264C)
ov91_0226265C:
	.ascii "polySurface7"
	.space 16-(.-ov91_0226265C)
ov91_0226266C:
	.ascii "polySurface13"
	.space 16-(.-ov91_0226266C)
ov91_0226267C:
	.ascii "pSphere2"
	.space 16-(.-ov91_0226267C)
ov91_0226268C:
	.ascii "pSphere3"
	.space 16-(.-ov91_0226268C)
ov91_0226269C:
	.ascii "pSphere6"
	.space 16-(.-ov91_0226269C)
ov91_022626AC:
	.ascii "pSphere7"
	.space 16-(.-ov91_022626AC)
ov91_022626BC:
	.ascii ""
	.space 16-(.-ov91_022626BC)
ov91_022626CC:
	.ascii ""
	.space 16-(.-ov91_022626CC)
ov91_022626DC:
	.ascii ""
	.space 16-(.-ov91_022626DC)
ov91_022626EC:
	.ascii ""
	.space 16-(.-ov91_022626EC)
ov91_022626FC:
	.ascii ""
	.space 16-(.-ov91_022626FC)
ov91_0226270C:
	.ascii ""
	.space 16-(.-ov91_0226270C)
ov91_0226271C:
	.ascii ""
	.space 16-(.-ov91_0226271C)
ov91_0226272C:
	.ascii ""
	.space 16-(.-ov91_0226272C)
ov91_0226273C:
	.ascii ""
	.space 16-(.-ov91_0226273C)

ov91_0226274C: ; 0x0226274C
	.byte 0x00, 0x00, 0x00, 0x02
	.byte 0x01, 0x00, 0x00, 0x00

ov91_02262754: ; 0x02262754
	.word ov91_02261B4C
	.word ov91_02261B48
	.word 0
	.word ov91_02261B58
	.word ov91_02261B48
	.word 0
	.word ov91_02261B64
	.word ov91_02261BD8
	.word 0
	.word ov91_02261B8C
	.word ov91_02261BE0
	.word 0
	.word ov91_02261B9C
	.word ov91_02261BDC
	.word 0
	.word ov91_02261BC8
	.word ov91_02261BE4
	.word 0
	.word ov91_02261BAC
	.word ov91_02261BE0
	.word 0
	.word ov91_02261BBC
	.word ov91_02261B48
	.word 0
	; 0x022627B4

	.bss

ov91_022627C0: ; 0x022627C0
	.space 0x40
