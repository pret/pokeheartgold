	.include "asm/macros.inc"
	.include "overlay_80_022324C4.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_022324C4
ov80_022324C4: ; 0x022324C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	add r5, r0, #0
	ldr r1, _02232818 ; =0x00000A28
	mov r0, #0xb
	add r6, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	ldr r1, _0223281C ; =ov80_0223DD48
	ldr r2, _02232818 ; =0x00000A28
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r4, [r0]
	add r0, r5, #0
	bl sub_02030CC8
	str r0, [r4, #8]
	ldr r1, _0223281C ; =ov80_0223DD48
	str r5, [r4, #4]
	mov r0, #0xb
	str r0, [r4]
	ldr r4, [r1]
	bl SaveArray_Party_Alloc
	str r0, [r4, #0x28]
	mov r0, #0xb
	bl SaveArray_Party_Alloc
	str r0, [r4, #0x2c]
	mov r0, #0xa2
	ldr r1, [sp, #0x38]
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r5, #0
	ldr r4, [r4, #8]
	bl sub_02030E08
	add r5, r0, #0
	cmp r7, #0
	beq _02232520
	b _022326BA
_02232520:
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r1, [r0]
	mov r0, #0
	strb r6, [r1, #0x10]
	strb r0, [r1, #0x11]
	add r0, r4, #0
	bl sub_02030CBC
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	cmp r2, #3
	bne _02232546
	ldr r0, [r0, #4]
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_GetVar4052
	b _02232552
_02232546:
	mov r3, #0
	add r0, r5, #0
	mov r1, #9
	str r3, [sp]
	bl sub_02030E58
_02232552:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _02232592
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r5, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1A0
	add r4, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1A0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020310BC
	ldr r1, _0223281C ; =ov80_0223DD48
	ldr r1, [r1]
	strh r0, [r1, #0x14]
	b _02232630
_02232592:
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r4, [r0]
	mov r0, #0
	strh r0, [r4, #0x14]
	ldr r0, [r4, #4]
	bl sub_0203107C
	add r5, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r4, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl sub_02031108
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205C218
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205C218
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #0
	bl sub_02031108
	ldr r4, _0223281C ; =ov80_0223DD48
	mov r5, #0
_022325F2:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r6, r0, #0
	ldr r0, [r4]
	lsl r1, r5, #0x18
	ldrb r0, [r0, #0x10]
	lsr r1, r1, #0x18
	bl sub_0205C174
	add r7, r0, #0
	ldr r0, [r4]
	lsl r1, r5, #0x18
	ldrb r0, [r0, #0x10]
	lsr r1, r1, #0x18
	bl sub_0205C174
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	mov r3, #1
	bl sub_02031108
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _022325F2
_02232630:
	ldr r0, _0223281C ; =ov80_0223DD48
	mov r1, #7
	ldr r5, [r0]
	ldrh r0, [r5, #0x14]
	bl _s32_div_f
	strh r0, [r5, #0x16]
	mov r0, #0
	str r0, [r5, #0x18]
	add r1, r5, #0
	ldr r0, [sp, #4]
	add r1, #0x24
	strb r0, [r1]
	add r1, sp, #0x20
	add r0, r5, #0
	ldrh r2, [r1, #0x10]
	add r0, #0x25
	strb r2, [r0]
	add r0, r5, #0
	ldrh r1, [r1, #0x14]
	add r0, #0x26
	strb r1, [r0]
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	strh r0, [r5, #0x20]
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0xa
	bl sub_02031228
	b _0223273E
_022326BA:
	ldr r0, _0223281C ; =ov80_0223DD48
	mov r1, #0
	ldr r5, [r0]
	str r1, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030D84
	strb r0, [r5, #0x10]
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl sub_02030D84
	strb r0, [r5, #0x11]
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r6, [r0]
	ldr r0, [r6, #4]
	bl sub_0203107C
	add r7, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1A0
	str r0, [sp, #0xc]
	ldrb r0, [r5, #0x10]
	bl sub_0205C1A0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #0xc]
	add r0, r7, #0
	bl sub_020310BC
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x14]
	mov r1, #7
	bl _s32_div_f
	mov r5, #0
	strh r0, [r6, #0x16]
	ldr r7, _0223281C ; =ov80_0223DD48
	add r6, r5, #0
_0223271C:
	lsl r2, r5, #0x18
	add r0, r4, #0
	mov r1, #7
	lsr r2, r2, #0x18
	add r3, r6, #0
	str r6, [sp]
	bl sub_02030D84
	ldr r1, [r7]
	add r1, r1, r5
	add r1, #0x24
	strb r0, [r1]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _0223271C
_0223273E:
	ldr r6, _0223281C ; =ov80_0223DD48
	ldr r7, _02232820 ; =0x0000036A
	mov r4, #0
_02232744:
	ldr r5, [r6]
	ldr r0, [r5, #4]
	bl SaveArray_Party_Get
	add r1, r5, r4
	add r1, #0x24
	ldrb r1, [r1]
	bl Party_GetMonByIndex
	ldr r5, [r6]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r1, r4, #1
	add r1, r5, r1
	strh r0, [r1, r7]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #3
	blo _02232744
	ldr r0, [r5, #4]
	bl SaveArray_Party_Get
	str r0, [sp, #8]
	ldr r0, _0223281C ; =ov80_0223DD48
	mov r1, #0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_02237B24
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022327F8
	ldr r6, _0223281C ; =ov80_0223DD48
_0223278E:
	ldr r1, [r6]
	ldr r0, [sp, #8]
	add r1, r1, r5
	add r1, #0x24
	ldrb r1, [r1]
	bl Party_GetMonByIndex
	add r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x28]
	bl Party_AddMon
	ldr r0, [r6]
	add r1, r5, #0
	ldr r0, [r0, #0x28]
	bl Party_GetMonByIndex
	mov r1, #0
	str r1, [sp, #0x14]
	add r4, r0, #0
	mov r1, #6
	add r2, sp, #0x14
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x32
	bls _022327EE
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x32
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0x10
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
_022327EE:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r7
	blt _0223278E
_022327F8:
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02232810
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov80_0222A840
_02232810:
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02232818: .word 0x00000A28
_0223281C: .word ov80_0223DD48
_02232820: .word 0x0000036A
	thumb_func_end ov80_022324C4

	thumb_func_start ov80_02232824
ov80_02232824: ; 0x02232824
	push {r3, lr}
	cmp r1, #0
	bne _02232830
	bl ov80_02232838
	pop {r3, pc}
_02232830:
	bl ov80_02232908
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02232824

	thumb_func_start ov80_02232838
ov80_02232838: ; 0x02232838
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	ldr r0, [r7, #0x28]
	bl Party_GetCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r6, #0
	str r0, [sp, #0x10]
	cmp r0, #0
	ble _022328A0
	add r5, r7, #0
_02232852:
	ldr r0, [r7, #0x28]
	add r1, r6, #0
	bl Party_GetMonByIndex
	mov r1, #0x3a
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	mov r1, #0xe5
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	ldr r1, _02232900 ; =0x00000396
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x3c
	bl GetMonData
	mov r1, #0xe6
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	ldr r1, _02232904 ; =0x0000039A
	add r6, r6, #1
	strh r0, [r5, r1]
	ldr r0, [sp, #0x10]
	add r5, #8
	cmp r6, r0
	blt _02232852
_022328A0:
	add r0, r7, #0
	bl ov80_02237ED8
	add r1, r0, #0
	add r2, r7, #0
	ldrb r0, [r7, #0x10]
	add r2, #0x30
	mov r3, #0xe
	bl ov80_02237ADC
	ldrb r0, [r7, #0x10]
	mov r1, #1
	ldrb r4, [r7, #0x11]
	bl ov80_02237B58
	add r5, r0, #0
	ldrb r0, [r7, #0x10]
	bl ov80_02237D8C
	mov r3, #0xa2
	lsl r3, r3, #2
	add r1, r7, r3
	str r1, [sp]
	add r1, r3, #0
	sub r1, #0x14
	add r1, r7, r1
	str r1, [sp, #4]
	add r1, r3, #0
	sub r1, #0x10
	add r1, r7, r1
	lsl r0, r0, #0x18
	add r2, r4, #7
	str r1, [sp, #8]
	lsr r0, r0, #0x18
	lsl r1, r4, #1
	lsl r2, r2, #1
	str r0, [sp, #0xc]
	add r1, r7, r1
	add r2, r7, r2
	sub r3, #0x1c
	ldrh r1, [r1, #0x30]
	ldrh r2, [r2, #0x30]
	add r0, r5, #0
	add r3, r7, r3
	bl ov80_0222A6B8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02232900: .word 0x00000396
_02232904: .word 0x0000039A
	thumb_func_end ov80_02232838

	thumb_func_start ov80_02232908
ov80_02232908: ; 0x02232908
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18c
	add r5, r0, #0
	bl ov80_022329B4
	mov r4, #0
	add r6, r5, #0
	add r7, r4, #0
_02232918:
	str r7, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #6
	lsr r2, r2, #0x18
	add r3, r7, #0
	bl sub_02030D84
	strh r0, [r6, #0x30]
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #0xe
	blt _02232918
	mov r6, #0
	add r4, sp, #0x30
	add r7, r5, #0
_02232938:
	mov r0, #0
	str r0, [sp]
	lsl r2, r6, #0x18
	ldr r0, [r5, #8]
	mov r1, #8
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	strh r0, [r4]
	ldrh r1, [r4]
	mov r0, #0x9b
	lsl r0, r0, #2
	strh r1, [r7, r0]
	add r6, r6, #1
	add r4, r4, #2
	add r7, r7, #2
	cmp r6, #4
	blt _02232938
	add r0, sp, #0x18
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	add r1, sp, #0x30
	add r2, sp, #0x10
	mov r3, #0
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r7, #0
	add r4, sp, #0x3c
_02232986:
	add r0, r5, #0
	bl ov80_02237D88
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x2c]
	add r0, r5, #0
	add r2, r6, #0
	bl ov80_02237E18
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #4
	blt _02232986
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x18c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02232908

	thumb_func_start ov80_022329B4
ov80_022329B4: ; 0x022329B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	bl Party_GetCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02232AB6
	add r7, sp, #8
_022329CE:
	ldr r0, [r5, #0x28]
	add r1, r4, #0
	bl Party_GetMonByIndex
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #2
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	add r2, sp, #8
	strh r0, [r7, #2]
	add r0, r6, #0
	mov r1, #0xa3
	add r2, #2
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	strb r0, [r7]
	add r0, r6, #0
	mov r1, #0x3a
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #1
	bl sub_02030D84
	strb r0, [r7]
	add r0, r6, #0
	mov r1, #0x3b
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #2
	bl sub_02030D84
	strb r0, [r7]
	add r0, r6, #0
	mov r1, #0x3c
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	mov r1, #3
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	add r3, r1, #0
	bl sub_02030D84
	strb r0, [r7]
	add r0, r6, #0
	mov r1, #0x3d
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0xa0
	add r2, sp, #0xc
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #5
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	add r2, sp, #8
	strh r0, [r7, #2]
	add r0, r6, #0
	mov r1, #6
	add r2, #2
	bl SetMonData
	ldr r0, [sp, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _022329CE
_02232AB6:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022329B4

	thumb_func_start ov80_02232ABC
ov80_02232ABC: ; 0x02232ABC
	push {r4, lr}
	add r4, r0, #0
	beq _02232AE6
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02232ACC
	bl FreeToHeap
_02232ACC:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02232AD6
	bl FreeToHeap
_02232AD6:
	ldr r2, _02232AE8 ; =0x00000A28
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
_02232AE6:
	pop {r4, pc}
	.balign 4, 0
_02232AE8: .word 0x00000A28
	thumb_func_end ov80_02232ABC

	thumb_func_start ov80_02232AEC
ov80_02232AEC: ; 0x02232AEC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	mov r4, #0
	add r5, r7, #0
_02232AF6:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ov80_02232B44
	mov r1, #0xe
	lsl r1, r1, #6
	strh r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #6
	blt _02232AF6
	mov r3, #0
	sub r0, r1, #4
_02232B12:
	add r2, r6, r3
	ldrb r5, [r2, #8]
	mov r4, #0x37
	add r1, r7, r3
	lsl r4, r4, #4
	strb r5, [r1, r4]
	ldrb r5, [r2, #0xc]
	add r4, r4, #4
	add r3, r3, #1
	strb r5, [r1, r4]
	mov r4, #0xde
	lsl r4, r4, #2
	ldrb r5, [r2, #0x10]
	cmp r3, #4
	strb r5, [r1, r4]
	ldrb r2, [r2, #0x14]
	strb r2, [r1, r0]
	blt _02232B12
	ldrh r1, [r6, #0x28]
	ldr r0, _02232B40 ; =0x00000A1C
	strh r1, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232B40: .word 0x00000A1C
	thumb_func_end ov80_02232AEC

	thumb_func_start ov80_02232B44
ov80_02232B44: ; 0x02232B44
	push {r3, lr}
	cmp r1, #6
	blo _02232B52
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02232B52:
	ldrh r0, [r0, #0x20]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02232B44

	thumb_func_start ov80_02232B58
ov80_02232B58: ; 0x02232B58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r6, r1, #0
	bl sub_02030E08
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_02237B58
	ldrb r1, [r5, #0x10]
	add r0, sp, #0x10
	strb r1, [r0, #8]
	mov r1, #0
	add r0, sp, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030CF4
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02030CE0
	mov r2, #0
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x10
	add r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02030CF4
	ldrb r0, [r5, #0x10]
	bl sub_0205C1A0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1A0
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0x14]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02031108
	cmp r6, #2
	beq _02232CCA
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0x14]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0203126C
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020310BC
	str r0, [sp, #0xc]
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020310BC
	add r7, r0, #0
	ldrh r0, [r5, #0x14]
	cmp r0, r6
	bne _02232C6E
	ldrb r0, [r5, #0x10]
	bl sub_0205C240
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C240
	bl sub_0205C268
	lsl r3, r7, #0x10
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	lsr r3, r3, #0x10
	bl sub_0203126C
	b _02232C94
_02232C6E:
	ldr r0, [sp, #0xc]
	cmp r6, r0
	bhs _02232C94
	ldrb r0, [r5, #0x10]
	bl sub_0205C240
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C240
	bl sub_0205C268
	lsl r3, r7, #0x10
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	lsr r3, r3, #0x10
	bl sub_02031108
_02232C94:
	add r0, r5, #0
	add r0, #0x27
	ldrb r1, [r0]
	add r0, sp, #0x10
	mov r3, #0
	strb r1, [r0, #8]
	add r0, sp, #0x18
	str r0, [sp]
	ldrb r2, [r5, #0x10]
	ldr r0, [sp, #4]
	mov r1, #9
	bl sub_02030E18
	ldrb r0, [r5, #0x10]
	cmp r0, #3
	bne _02232CCA
	mov r0, #0x6c
	bl sub_0205C268
	add r3, r5, #0
	add r3, #0x27
	add r2, r0, #0
	ldrb r3, [r3]
	add r0, r4, #0
	mov r1, #0x6c
	bl sub_02031108
_02232CCA:
	mov r4, #0
	add r6, sp, #0x10
	add r7, sp, #0x10
_02232CD0:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, #0x30]
	lsl r2, r4, #0x18
	mov r1, #6
	strh r0, [r7]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0xe
	blo _02232CD0
	mov r4, #0
	add r6, sp, #0x18
	add r7, sp, #0x10
_02232CF8:
	add r0, r5, r4
	add r0, #0x24
	ldrb r0, [r0]
	lsl r2, r4, #0x18
	mov r1, #7
	strb r0, [r7, #8]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #3
	blo _02232CF8
	ldr r0, [r5, #0x28]
	bl Party_GetCount
	mov r4, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _02232E10
	add r7, sp, #0x10
_02232D2A:
	ldr r0, [r5, #0x28]
	add r1, r4, #0
	bl Party_GetMonByIndex
	mov r1, #0xa3
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	strh r0, [r7]
	add r0, sp, #0x10
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #2
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0x3a
	mov r2, #0
	bl GetMonData
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #1
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0x3c
	mov r2, #0
	bl GetMonData
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #2
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	mov r1, #3
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	add r3, r1, #0
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x1c]
	add r0, sp, #0x1c
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r7]
	add r0, sp, #0x10
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #5
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #8]
	cmp r4, r0
	blo _02232D2A
_02232E10:
	ldr r0, [r5, #0x2c]
	bl Party_GetCount
	add r6, r0, #0
	ldr r4, _02232E54 ; =0x00000000
	beq _02232E4E
	add r7, sp, #0x10
_02232E1E:
	ldr r0, [r5, #0x2c]
	add r1, r4, #0
	bl Party_GetMonByIndex
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0x9b
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	add r0, sp, #0x10
	lsl r2, r4, #0x18
	strh r1, [r0]
	str r7, [sp]
	ldr r0, [r5, #8]
	mov r1, #8
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r6
	blo _02232E1E
_02232E4E:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02232E54: .word 0x00000000
	thumb_func_end ov80_02232B58

	thumb_func_start ov80_02232E58
ov80_02232E58: ; 0x02232E58
	ldrb r1, [r0, #0x11]
	add r1, r1, #1
	strb r1, [r0, #0x11]
	ldrb r0, [r0, #0x11]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02232E58

	thumb_func_start ov80_02232E64
ov80_02232E64: ; 0x02232E64
	ldrb r0, [r0, #0x11]
	bx lr
	thumb_func_end ov80_02232E64

	thumb_func_start ov80_02232E68
ov80_02232E68: ; 0x02232E68
	push {r4, lr}
	sub sp, #0x30
	add r2, r0, #0
	ldrb r4, [r2, #0x11]
	mov r3, #7
	mul r3, r1
	add r1, r4, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x17
	add r1, r2, r1
	ldrh r1, [r1, #0x30]
	add r0, sp, #0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r4, pc}
	thumb_func_end ov80_02232E68

	thumb_func_start ov80_02232E9C
ov80_02232E9C: ; 0x02232E9C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
_02232EA2:
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r6, r0, #0
	lsl r1, r4, #0x18
	ldrb r0, [r5, #0x10]
	lsr r1, r1, #0x18
	bl sub_0205C174
	add r7, r0, #0
	lsl r1, r4, #0x18
	ldrb r0, [r5, #0x10]
	lsr r1, r1, #0x18
	bl sub_0205C174
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	mov r3, #1
	bl sub_02031108
	add r4, r4, #1
	cmp r4, #3
	blt _02232EA2
	add r0, r5, #0
	mov r1, #1
	bl ov80_02232B58
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02232E9C

	thumb_func_start ov80_02232EE0
ov80_02232EE0: ; 0x02232EE0
	add r1, r0, #0
	mov r2, #1
	add r1, #0x27
	strb r2, [r1]
	ldrh r1, [r0, #0x16]
	cmp r1, #8
	bhs _02232EF2
	add r1, r1, #1
	strh r1, [r0, #0x16]
_02232EF2:
	ldr r3, _02232EFC ; =ov80_02232B58
	mov r1, #0
	strb r1, [r0, #0x11]
	bx r3
	nop
_02232EFC: .word ov80_02232B58
	thumb_func_end ov80_02232EE0

	thumb_func_start ov80_02232F00
ov80_02232F00: ; 0x02232F00
	ldr r3, _02232F04 ; =ov80_02237E30
	bx r3
	.balign 4, 0
_02232F04: .word ov80_02237E30
	thumb_func_end ov80_02232F00

	thumb_func_start ov80_02232F08
ov80_02232F08: ; 0x02232F08
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	ldrb r4, [r5, #0x11]
	bl ov80_02237B58
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02237D8C
	mov r3, #0xa2
	lsl r3, r3, #2
	add r1, r5, r3
	str r1, [sp]
	add r1, r3, #0
	sub r1, #0x14
	add r1, r5, r1
	str r1, [sp, #4]
	add r1, r3, #0
	sub r1, #0x10
	add r1, r5, r1
	lsl r0, r0, #0x18
	add r2, r4, #7
	str r1, [sp, #8]
	lsr r0, r0, #0x18
	lsl r1, r4, #1
	lsl r2, r2, #1
	str r0, [sp, #0xc]
	add r1, r5, r1
	add r2, r5, r2
	sub r3, #0x1c
	ldrh r1, [r1, #0x30]
	ldrh r2, [r2, #0x30]
	add r0, r6, #0
	add r3, r5, r3
	bl ov80_0222A6B8
	add r0, r5, #0
	bl ov80_02237E30
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02232F08

	thumb_func_start ov80_02232F60
ov80_02232F60: ; 0x02232F60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02232F74
	mov r0, #0
	str r0, [sp]
	b _02232F78
_02232F74:
	mov r0, #2
	str r0, [sp]
_02232F78:
	ldrb r0, [r6, #0x10]
	mov r1, #0
	bl ov80_02237B24
	add r5, r0, #0
	ldr r0, [r6, #0x28]
	bl Party_GetCount
	ldr r4, [sp]
	add r0, r4, #0
	add r0, r5, r0
	add r1, r4, #0
	str r0, [sp, #4]
	cmp r1, r0
	bge _02232FEA
_02232F96:
	ldr r0, [r6, #0x28]
	add r1, r4, #0
	bl Party_GetMonByIndex
	ldr r1, [sp]
	mov r2, #0
	sub r1, r4, r1
	lsl r1, r1, #3
	add r5, r6, r1
	mov r1, #0x3a
	add r7, r0, #0
	bl GetMonData
	mov r1, #0xe5
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r7, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	ldr r1, _02233018 ; =0x00000396
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r7, #0
	mov r1, #0x3c
	bl GetMonData
	mov r1, #0xe6
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r7, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	ldr r1, _0223301C ; =0x0000039A
	add r4, r4, #1
	strh r0, [r5, r1]
	ldr r0, [sp, #4]
	cmp r4, r0
	blt _02232F96
_02232FEA:
	ldr r0, [r6, #0x28]
	bl ov80_02237D9C
	mov r0, #0x37
	lsl r0, r0, #4
	mov r7, #0
	add r2, r0, #0
	add r3, r0, #0
	add r4, r7, #0
	add r1, r0, #4
	add r2, #8
	add r3, #0xc
_02233002:
	add r5, r6, r7
	strb r4, [r5, r0]
	strb r4, [r5, r1]
	strb r4, [r5, r2]
	add r7, r7, #1
	strb r4, [r5, r3]
	cmp r7, #4
	blt _02233002
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02233018: .word 0x00000396
_0223301C: .word 0x0000039A
	thumb_func_end ov80_02232F60

	thumb_func_start ov80_02233020
ov80_02233020: ; 0x02233020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #0x10]
	add r1, sp, #0x18
	add r4, r0, #0
_0223302E:
	add r0, r0, #1
	strb r4, [r1]
	add r1, r1, #1
	cmp r0, #0x14
	blt _0223302E
	strb r4, [r6, #0x12]
	bl sub_0203769C
	cmp r0, #0
	bne _02233048
	mov r0, #0
	str r0, [sp]
	b _0223304C
_02233048:
	mov r0, #2
	str r0, [sp]
_0223304C:
	ldrb r0, [r6, #0x10]
	mov r1, #0
	bl ov80_02237B24
	str r0, [sp, #8]
	ldrb r0, [r6, #0x10]
	mov r1, #1
	bl ov80_02237B58
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [sp]
	add r0, r1, r0
	ldr r1, [sp]
	str r0, [sp, #0xc]
	cmp r1, r0
	bge _02233122
	add r7, sp, #0x18
_02233070:
	ldr r0, [r6, #0x28]
	ldr r1, [sp]
	bl Party_GetMonByIndex
	mov r1, #0xac
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02233116
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x14]
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022330E2
	ldrb r1, [r7]
	add r1, r1, #1
	strb r1, [r7]
	ldr r1, [sp, #0x14]
	cmp r1, r0
	bne _022330B6
	ldrb r0, [r7, #1]
	add r0, r0, #1
	strb r0, [r7, #1]
	b _022330CC
_022330B6:
	lsr r1, r0, #1
	ldr r0, [sp, #0x14]
	cmp r0, r1
	blo _022330C6
	ldrb r0, [r7, #2]
	add r0, r0, #1
	strb r0, [r7, #2]
	b _022330CC
_022330C6:
	ldrb r0, [r7, #3]
	add r0, r0, #1
	strb r0, [r7, #3]
_022330CC:
	add r0, r5, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022330E6
	ldrb r0, [r7, #4]
	add r0, r0, #1
	strb r0, [r7, #4]
	b _022330E6
_022330E2:
	mov r0, #1
	strb r0, [r6, #0x12]
_022330E6:
	add r0, r5, #0
	mov r1, #0x3a
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x3c
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
_02233116:
	ldr r0, [sp]
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp]
	cmp r1, r0
	blt _02233070
_02233122:
	ldr r1, [sp, #4]
	mov r0, #0
	cmp r1, #0
	ble _02233146
	mov r2, #0xdd
	add r3, sp, #0x18
	lsl r2, r2, #2
_02233130:
	add r1, r6, r0
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _0223313E
	ldrb r1, [r3, #8]
	add r1, r1, #1
	strb r1, [r3, #8]
_0223313E:
	ldr r1, [sp, #4]
	add r0, r0, #1
	cmp r0, r1
	blt _02233130
_02233146:
	ldr r0, [sp, #8]
	mov r3, #0
	add r7, r3, #0
	cmp r0, #0
	ble _0223316E
	mov r0, #0xe5
	lsl r0, r0, #2
_02233154:
	mov r2, #0
	add r5, r6, #0
_02233158:
	ldrh r1, [r5, r0]
	add r2, r2, #1
	add r5, r5, #2
	add r3, r3, r1
	cmp r2, #4
	blt _02233158
	ldr r1, [sp, #8]
	add r7, r7, #1
	add r6, #8
	cmp r7, r1
	blt _02233154
_0223316E:
	sub r0, r3, r4
	cmp r0, #5
	bgt _0223317E
	add r0, sp, #0x18
	ldrb r1, [r0, #5]
	add r1, r1, #1
	strb r1, [r0, #5]
	b _02233198
_0223317E:
	cmp r0, #0xa
	bgt _0223318C
	add r0, sp, #0x18
	ldrb r1, [r0, #6]
	add r1, r1, #1
	strb r1, [r0, #6]
	b _02233198
_0223318C:
	cmp r0, #0xf
	bgt _02233198
	add r0, sp, #0x18
	ldrb r1, [r0, #7]
	add r1, r1, #1
	strb r1, [r0, #7]
_02233198:
	add r1, sp, #0x18
	ldrb r2, [r1]
	lsl r0, r2, #1
	add r2, r2, r0
	ldr r0, [sp, #0x10]
	add r3, r0, r2
	ldrb r2, [r1, #1]
	lsl r0, r2, #1
	add r0, r2, r0
	add r2, r3, r0
	ldrb r0, [r1, #2]
	lsl r0, r0, #1
	add r2, r2, r0
	ldrb r0, [r1, #3]
	add r2, r2, r0
	ldrb r0, [r1, #4]
	add r2, r2, r0
	ldrb r0, [r1, #5]
	lsl r0, r0, #3
	add r3, r2, r0
	ldrb r2, [r1, #6]
	mov r0, #6
	mul r0, r2
	add r2, r3, r0
	ldrb r0, [r1, #7]
	ldrb r1, [r1, #8]
	lsl r0, r0, #2
	add r2, r2, r0
	mov r0, #7
	mul r0, r1
	add r0, r2, r0
	str r0, [sp, #0x10]
	cmp r0, #0
	bgt _022331E0
	mov r0, #1
	str r0, [sp, #0x10]
_022331E0:
	ldr r0, [sp, #0x10]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02233020

	thumb_func_start ov80_022331E8
ov80_022331E8: ; 0x022331E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0203107C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	bl sub_020310BC
	add r1, r0, r4
	ldr r0, _0223327C ; =0x0000270F
	cmp r1, r0
	ble _02233244
	add r0, r6, #0
	bl sub_0203107C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #4]
	ldr r3, _0223327C ; =0x0000270F
	add r0, r7, #0
	bl sub_02031108
	b _0223326A
_02233244:
	add r0, r6, #0
	bl sub_0203107C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r3, r4, #0
	bl sub_02031228
_0223326A:
	add r0, r6, #0
	bl Save_GameStats_Get
	mov r1, #0x42
	add r2, r4, #0
	bl GameStats_Add
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223327C: .word 0x0000270F
	thumb_func_end ov80_022331E8

	thumb_func_start ov80_02233280
ov80_02233280: ; 0x02233280
	push {r3, lr}
	cmp r1, #6
	bhi _022332CC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02233292: ; jump table
	.short _022332A0 - _02233292 - 2 ; case 0
	.short _022332A6 - _02233292 - 2 ; case 1
	.short _022332AC - _02233292 - 2 ; case 2
	.short _022332B2 - _02233292 - 2 ; case 3
	.short _022332B8 - _02233292 - 2 ; case 4
	.short _022332C0 - _02233292 - 2 ; case 5
	.short _022332C8 - _02233292 - 2 ; case 6
_022332A0:
	bl ov80_0222B5C8
	pop {r3, pc}
_022332A6:
	bl ov80_0222B65C
	pop {r3, pc}
_022332AC:
	bl ov80_0222B6C8
	pop {r3, pc}
_022332B2:
	bl ov80_0222B7E4
	pop {r3, pc}
_022332B8:
	add r1, r2, #0
	bl ov80_0222B8D8
	pop {r3, pc}
_022332C0:
	add r1, r2, #0
	bl ov80_0222B920
	pop {r3, pc}
_022332C8:
	bl ov80_0222B968
_022332CC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02233280

	thumb_func_start ov80_022332D0
ov80_022332D0: ; 0x022332D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	beq _022332EC
	bl GF_AssertFail
_022332EC:
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq _022332FA
	bl GF_AssertFail
_022332FA:
	ldrb r0, [r6, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02233342
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	mov r2, #1
	add r1, r5, #0
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333C8 ; =0x00000253
	add r1, #0xa8
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	add r3, r2, #0
	bl AddWindowParameterized
	add r1, r5, #0
	add r1, #0xa8
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
	b _022333BA
_02233342:
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	add r1, r5, #0
	add r1, #0xac
	str r0, [r1]
	mov r2, #1
	add r1, r5, #0
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333C8 ; =0x00000253
	add r1, #0xa8
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	add r3, r2, #0
	bl AddWindowParameterized
	mov r2, #1
	add r1, r5, #0
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333CC ; =0x0000022B
	add r1, #0xac
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	mov r3, #0x15
	bl AddWindowParameterized
	add r1, r5, #0
	add r1, #0xa8
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
	add r1, r5, #0
	add r1, #0xac
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
_022333BA:
	add r0, r5, #0
	add r1, r6, #0
	bl ov80_02233490
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_022333C8: .word 0x00000253
_022333CC: .word 0x0000022B
	thumb_func_end ov80_022332D0

	thumb_func_start ov80_022333D0
ov80_022333D0: ; 0x022333D0
	push {r4, lr}
	add r4, r1, #0
	ldr r2, _022333EC ; =0x000003D9
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow1
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	pop {r4, pc}
	nop
_022333EC: .word 0x000003D9
	thumb_func_end ov80_022333D0

	thumb_func_start ov80_022333F0
ov80_022333F0: ; 0x022333F0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r1, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02233424
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _0223340C
	bl GF_AssertFail
_0223340C:
	add r0, r5, #0
	add r0, #0xa8
	ldr r4, [r0]
	mov r1, #0
	add r0, r4, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #1
	bl WindowArray_Delete
	b _02233480
_02233424:
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02233432
	bl GF_AssertFail
_02233432:
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	bne _02233440
	bl GF_AssertFail
_02233440:
	bl sub_0203769C
	cmp r0, #0
	bne _02233454
	add r0, r5, #0
	add r0, #0xa8
	ldr r4, [r0]
	add r0, r5, #0
	add r0, #0xac
	b _0223345E
_02233454:
	add r0, r5, #0
	add r0, #0xac
	ldr r4, [r0]
	add r0, r5, #0
	add r0, #0xa8
_0223345E:
	ldr r6, [r0]
	add r0, r4, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #1
	bl WindowArray_Delete
	add r0, r6, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	mov r1, #1
	bl WindowArray_Delete
_02233480:
	add r0, r5, #0
	mov r1, #0
	add r0, #0xa8
	str r1, [r0]
	add r5, #0xac
	str r1, [r5]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_022333F0

	thumb_func_start ov80_02233490
ov80_02233490: ; 0x02233490
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022334EA
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022334AE
	bl GF_AssertFail
_022334AE:
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	add r6, r0, #0
	ldr r0, [r5, #4]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r4, #0
	add r4, #0xa8
	ldr r1, [r4]
	add r3, r6, #0
	bl ov80_02233594
	pop {r3, r4, r5, r6, r7, pc}
_022334EA:
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022334F8
	bl GF_AssertFail
_022334F8:
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	bne _02233506
	bl GF_AssertFail
_02233506:
	bl sub_0203769C
	cmp r0, #0
	bne _0223353A
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	add r6, r0, #0
	ldr r0, _02233590 ; =0x00000A1C
	ldrh r5, [r5, r0]
	b _02233564
_0223353A:
	ldr r0, _02233590 ; =0x00000A1C
	ldrh r6, [r5, r0]
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	str r0, [sp]
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	bl sub_020310BC
	add r5, r0, #0
_02233564:
	mov r0, #0
	bl sub_02034818
	add r1, r4, #0
	add r1, #0xa8
	add r2, r0, #0
	ldr r1, [r1]
	add r0, r4, #0
	add r3, r6, #0
	bl ov80_02233594
	mov r0, #1
	bl sub_02034818
	add r2, r0, #0
	add r0, r4, #0
	add r4, #0xac
	ldr r1, [r4]
	add r3, r5, #0
	bl ov80_02233594
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02233590: .word 0x00000A1C
	thumb_func_end ov80_02233490

	thumb_func_start ov80_02233594
ov80_02233594: ; 0x02233594
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	str r3, [sp, #0x14]
	str r1, [sp, #0xc]
	ldr r1, [r5, #0x34]
	mov r0, #0x14
	str r2, [sp, #0x10]
	bl String_New
	add r4, r0, #0
	ldr r1, [r5, #0x34]
	mov r0, #0x14
	bl String_New
	add r6, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x1f
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x44]
	ldr r2, [sp, #0x14]
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	add r0, r7, #0
	mov r1, #2
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x44]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	mov r3, #0x10
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	add r2, r6, #0
	bl AddTextPrinterParameterized
	ldr r0, [r5, #0x44]
	ldr r2, [sp, #0x10]
	mov r1, #0
	bl BufferPlayersName
	add r0, r7, #0
	mov r1, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x44]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, [sp, #0xc]
	bl CopyWindowToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02233594

	thumb_func_start ov80_02233648
ov80_02233648: ; 0x02233648
	ldrb r3, [r0, #0x10]
	ldrh r2, [r0, #0x16]
	cmp r3, #1
	bhi _0223365E
	cmp r2, #8
	blo _02233658
	mov r1, #7
	b _0223366A
_02233658:
	ldr r1, _02233680 ; =ov80_0223BE54
	ldrb r1, [r1, r2]
	b _0223366A
_0223365E:
	cmp r2, #8
	blo _02233666
	mov r1, #0x12
	b _0223366A
_02233666:
	ldr r1, _02233684 ; =ov80_0223BE60
	ldrb r1, [r1, r2]
_0223366A:
	cmp r3, #0
	bne _0223367A
	ldrh r0, [r0, #0x14]
	cmp r0, #0x15
	beq _02233678
	cmp r0, #0x31
	bne _0223367A
_02233678:
	mov r1, #0x14
_0223367A:
	add r0, r1, #0
	bx lr
	nop
_02233680: .word ov80_0223BE54
_02233684: .word ov80_0223BE60
	thumb_func_end ov80_02233648

    .bss

ov80_0223DD48: ; 0x0223DD48
	.space 0x4
    