	.include "asm/macros.inc"
	.include "overlay_58.inc"
	.include "global.inc"

	.text

	thumb_func_start ov58_022378C0
ov58_022378C0: ; 0x022378C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _022378E0
	bl OverlayManager_Run
	cmp r0, #0
	beq _022378E0
	ldr r0, [r4]
	bl OverlayManager_Delete
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_022378E0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov58_022378C0

	thumb_func_start ov58_022378E4
ov58_022378E4: ; 0x022378E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov58_02237CCC
	mov r2, #2
	mov r0, #3
	mov r1, #0x85
	lsl r2, r2, #0xc
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x20
	mov r2, #0x85
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x85
	str r0, [r4]
	add r0, r5, #0
	bl OverlayManager_GetArgs
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov58_02237B40
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov58_022378E4

	thumb_func_start ov58_02237924
ov58_02237924: ; 0x02237924
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #7
	bhi _02237996
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223793E: ; jump table
	.short _0223794E - _0223793E - 2 ; case 0
	.short _02237962 - _0223793E - 2 ; case 1
	.short _0223796A - _0223793E - 2 ; case 2
	.short _02237972 - _0223793E - 2 ; case 3
	.short _0223797A - _0223793E - 2 ; case 4
	.short _02237982 - _0223793E - 2 ; case 5
	.short _0223798A - _0223793E - 2 ; case 6
	.short _02237992 - _0223793E - 2 ; case 7
_0223794E:
	ldr r0, [r0, #4]
	ldrb r0, [r0]
	cmp r0, #3
	bne _0223795C
	mov r0, #3
	str r0, [r4]
	b _02237996
_0223795C:
	mov r0, #1
	str r0, [r4]
	b _02237996
_02237962:
	bl ov58_02237B98
	str r0, [r4]
	b _02237996
_0223796A:
	bl ov58_02237BB0
	str r0, [r4]
	b _02237996
_02237972:
	bl ov58_02237BD4
	str r0, [r4]
	b _02237996
_0223797A:
	bl ov58_02237C4C
	str r0, [r4]
	b _02237996
_02237982:
	bl ov58_02237C88
	str r0, [r4]
	b _02237996
_0223798A:
	bl ov58_02237CA0
	str r0, [r4]
	b _02237996
_02237992:
	mov r0, #1
	pop {r4, pc}
_02237996:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov58_02237924

	thumb_func_start ov58_0223799C
ov58_0223799C: ; 0x0223799C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov58_02237CCC
	add r0, r4, #0
	bl ov58_02237B94
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x85
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov58_0223799C

	thumb_func_start ov58_022379C0
ov58_022379C0: ; 0x022379C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	add r0, sp, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	add r0, #1
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	add r1, sp, #0x14
	add r0, r4, #0
	add r1, #2
	bl sub_02031DA0
	add r0, sp, #0xc
	ldrh r1, [r0, #0xa]
	ldrb r4, [r4, #2]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #5
	blo _022379F2
	ldrb r5, [r0, #0x10]
	b _022379F6
_022379F2:
	lsl r0, r1, #0x18
	lsr r5, r0, #0x18
_022379F6:
	add r0, sp, #0xc
	ldrh r1, [r0, #0xc]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #5
	blo _02237A06
	ldrb r7, [r0, #0x11]
	b _02237A0A
_02237A06:
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
_02237A0A:
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, sp, #0xc
	bl Party_GetUnkSubSlot
	add r0, sp, #0xc
	ldrh r0, [r0, #0xa]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, sp, #0x10
	add r0, #1
	add r6, r0, r5
	ldr r0, [sp, #8]
	bl _ffltu
	add r1, r0, #0
	mov r0, #0xff
	lsl r0, r0, #0x16
	bl _fmul
	bl _ffixu
	add r1, sp, #0x10
	add r1, #1
	strb r0, [r1, r5]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02237A4C
	mov r0, #0
	ldrsb r0, [r6, r0]
	add r0, #0xa
	strb r0, [r6]
_02237A4C:
	add r0, sp, #0xc
	ldrh r0, [r0, #0xc]
	lsl r0, r0, #0x10
	lsr r5, r0, #0x18
	add r0, r5, #0
	bl _ffltu
	add r1, r0, #0
	mov r0, #0xff
	lsl r0, r0, #0x16
	bl _fmul
	bl _ffixu
	add r1, sp, #0x10
	add r1, #1
	strb r0, [r1, r7]
	ldr r0, [sp, #8]
	add r0, r0, r5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r4, #0xff
	bne _02237A90
	bl _ffltu
	add r1, r0, #0
	ldr r0, _02237B38 ; =0x3DCCCCCD
	bl _fmul
	bl _ffixu
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	b _02237AE2
_02237A90:
	cmp r4, #0xc8
	blo _02237AAA
	bl _ffltu
	add r1, r0, #0
	ldr r0, _02237B3C ; =0x3E4CCCCD
	bl _fmul
	bl _ffixu
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	b _02237AE2
_02237AAA:
	bl _ffltu
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x19
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl _ffltu
	add r1, r0, #0
	ldr r0, _02237B38 ; =0x3DCCCCCD
	bl _fmul
	add r1, r0, #0
	mov r0, #0xfe
	lsl r0, r0, #0x16
	bl _fsub
	add r1, r0, #0
	add r0, r5, #0
	bl _fmul
	bl _ffixu
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
_02237AE2:
	add r0, sp, #0xc
	ldrb r1, [r0, #0x14]
	add r5, sp, #0x10
	add r5, #1
	ldrsb r0, [r5, r1]
	mov r7, #0x7f
	mov r3, #0
	sub r0, r0, r2
	strb r0, [r5, r1]
	add r2, r7, #0
	add r1, r7, #0
	add r6, sp, #0xc
	sub r2, #0xfe
	add r0, r3, #0
	sub r1, #0xfe
_02237B00:
	ldrsb r4, [r5, r0]
	cmp r4, r1
	bge _02237B0A
	add r4, r2, #0
	b _02237B10
_02237B0A:
	cmp r4, #0x7f
	ble _02237B10
	add r4, r7, #0
_02237B10:
	add r3, r3, #1
	strb r4, [r6]
	add r5, r5, #1
	add r6, r6, #1
	cmp r3, #5
	blt _02237B00
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, sp, #0xc
	bl Party_SetUnkSubSlot
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl Party_GetMonByIndex
	mov r1, #7
	bl ApplyMonMoodModifier
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02237B38: .word 0x3DCCCCCD
_02237B3C: .word 0x3E4CCCCD
	thumb_func_end ov58_022379C0

	thumb_func_start ov58_02237B40
ov58_02237B40: ; 0x02237B40
	ldr r1, [r0, #4]
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _02237B4C
	mov r1, #0
	strh r1, [r2]
_02237B4C:
	ldr r1, [r0, #4]
	ldrb r1, [r1]
	cmp r1, #3
	bhi _02237B8A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02237B60: ; jump table
	.short _02237B68 - _02237B60 - 2 ; case 0
	.short _02237B6E - _02237B60 - 2 ; case 1
	.short _02237B74 - _02237B60 - 2 ; case 2
	.short _02237B7A - _02237B60 - 2 ; case 3
_02237B68:
	mov r1, #0
	strb r1, [r0, #0x18]
	b _02237B8A
_02237B6E:
	mov r1, #1
	strb r1, [r0, #0x18]
	b _02237B8A
_02237B74:
	mov r1, #2
	strb r1, [r0, #0x18]
	b _02237B8A
_02237B7A:
	mov r1, #1
	strb r1, [r0, #0x19]
	mov r1, #0
	strb r1, [r0, #0x18]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0xc]
	str r1, [r0, #0x14]
	bx lr
_02237B8A:
	mov r1, #0
	strb r1, [r0, #0x19]
	mov r1, #8
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov58_02237B40

	thumb_func_start ov58_02237B94
ov58_02237B94: ; 0x02237B94
	bx lr
	.balign 4, 0
	thumb_func_end ov58_02237B94

	thumb_func_start ov58_02237B98
ov58_02237B98: ; 0x02237B98
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02237BAC ; =_02237D1C
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_New
	str r0, [r4, #8]
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_02237BAC: .word _02237D1C
	thumb_func_end ov58_02237B98

	thumb_func_start ov58_02237BB0
ov58_02237BB0: ; 0x02237BB0
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	bl ov58_022378C0
	cmp r0, #0
	bne _02237BC2
	mov r0, #2
	pop {r4, pc}
_02237BC2:
	ldrb r0, [r4, #0x18]
	cmp r0, #3
	bne _02237BD0
	mov r0, #0
	strb r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
_02237BD0:
	mov r0, #7
	pop {r4, pc}
	thumb_func_end ov58_02237BB0

	thumb_func_start ov58_02237BD4
ov58_02237BD4: ; 0x02237BD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x18]
	bl SaveArray_Party_Get
	str r0, [r4]
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x18]
	bl Save_Bag_Get
	str r0, [r4, #4]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x14
	add r0, #0x24
	strb r1, [r0]
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x18]
	bl Save_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x18]
	bl Save_Mailbox_Get
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x14]
	str r0, [r4, #0x20]
	add r0, r4, #0
	ldrb r1, [r5, #0x1c]
	add r0, #0x26
	strb r1, [r0]
	ldr r0, _02237C48 ; =_0210159C
	ldr r2, [r5]
	add r1, r4, #0
	bl OverlayManager_New
	str r0, [r5, #8]
	str r4, [r5, #0x10]
	mov r0, #4
	pop {r3, r4, r5, pc}
	nop
_02237C48: .word _0210159C
	thumb_func_end ov58_02237BD4

	thumb_func_start ov58_02237C4C
ov58_02237C4C: ; 0x02237C4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #8
	bl ov58_022378C0
	cmp r0, #0
	bne _02237C5E
	mov r0, #4
	pop {r3, r4, r5, pc}
_02237C5E:
	ldr r0, [r5, #0x10]
	add r0, #0x26
	ldrb r4, [r0]
	strb r4, [r5, #0x1c]
	ldr r0, [r5, #0x10]
	bl FreeToHeap
	mov r0, #0
	str r0, [r5, #0x10]
	cmp r4, #7
	bne _02237C84
	ldr r0, [r5, #4]
	ldrb r0, [r0]
	cmp r0, #3
	bne _02237C80
	mov r0, #7
	pop {r3, r4, r5, pc}
_02237C80:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02237C84:
	mov r0, #5
	pop {r3, r4, r5, pc}
	thumb_func_end ov58_02237C4C

	thumb_func_start ov58_02237C88
ov58_02237C88: ; 0x02237C88
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02237C9C ; =ov58_02237D2C
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_New
	str r0, [r4, #8]
	mov r0, #6
	pop {r4, pc}
	.balign 4, 0
_02237C9C: .word ov58_02237D2C
	thumb_func_end ov58_02237C88

	thumb_func_start ov58_02237CA0
ov58_02237CA0: ; 0x02237CA0
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	bl ov58_022378C0
	cmp r0, #0
	bne _02237CB2
	mov r0, #6
	pop {r4, pc}
_02237CB2:
	ldrb r0, [r4, #0x18]
	cmp r0, #3
	bne _02237CBC
	mov r0, #3
	pop {r4, pc}
_02237CBC:
	ldr r0, [r4, #4]
	ldrb r0, [r0]
	cmp r0, #3
	bne _02237CC8
	mov r0, #7
	pop {r4, pc}
_02237CC8:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov58_02237CA0

	thumb_func_start ov58_02237CCC
ov58_02237CCC: ; 0x02237CCC
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02237D14 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02237D18 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	pop {r3, pc}
	.balign 4, 0
_02237D14: .word 0xFFFFE0FF
_02237D18: .word 0x04001000
	thumb_func_end ov58_02237CCC

	.rodata

_02237D1C:
	.word ov59_02237D40, ov59_02237DA8, ov59_02237E68, FS_OVERLAY_ID(OVY_59)

ov58_02237D2C: ; 0x02237D2C
	.word ov59_0223A8E0, ov59_0223A948, ov59_0223A9B8, FS_OVERLAY_ID(OVY_59)
	; 0x02237D3C
