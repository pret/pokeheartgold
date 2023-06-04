	.include "asm/macros.inc"
	.include "overlay_55.inc"
	.include "global.inc"

	.text

	thumb_func_start ov55_021E5900
ov55_021E5900: ; 0x021E5900
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E5920
	bl OverlayManager_Run
	cmp r0, #0
	beq _021E5920
	ldr r0, [r4]
	bl OverlayManager_Delete
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E5920:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov55_021E5900

	thumb_func_start ov55_021E5924
ov55_021E5924: ; 0x021E5924
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetArgs
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x28
	lsl r2, r2, #0xc
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0x1c
	mov r2, #0x28
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl MI_CpuFill8
	mov r1, #0x28
	str r1, [r4]
	ldr r0, [r5, #0x14]
	bl ov55_021E5B08
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x10]
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, [r4, #0x10]
	str r0, [r1, #4]
	ldrh r0, [r5]
	cmp r0, #1
	bne _021E5970
	ldrb r1, [r5, #0xf]
	ldr r0, [r4, #0x10]
	strb r1, [r0, #0x13]
_021E5970:
	ldr r1, [r4, #0x10]
	ldrb r0, [r1, #0x13]
	cmp r0, #0xc
	blo _021E597C
	mov r0, #0
	strb r0, [r1, #0x13]
_021E597C:
	ldrh r1, [r5]
	ldr r0, [r4, #0x10]
	strh r1, [r0]
	ldr r1, [r5, #0x1c]
	ldr r0, [r4, #0x10]
	str r1, [r0, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov55_021E5924

	thumb_func_start ov55_021E598C
ov55_021E598C: ; 0x021E598C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r6, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetArgs
	add r5, r0, #0
	ldr r0, [r6]
	cmp r0, #4
	bls _021E59AA
	b _021E5AD4
_021E59AA:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E59B6: ; jump table
	.short _021E59C0 - _021E59B6 - 2 ; case 0
	.short _021E59D8 - _021E59B6 - 2 ; case 1
	.short _021E5A04 - _021E59B6 - 2 ; case 2
	.short _021E5A40 - _021E59B6 - 2 ; case 3
	.short _021E5AA2 - _021E59B6 - 2 ; case 4
_021E59C0:
	ldrh r1, [r5]
	ldr r0, [r4, #0x10]
	strh r1, [r0]
	ldr r0, _021E5ADC ; =ov55_021E5BF4
	ldr r1, [r4, #0x10]
	ldr r2, [r4]
	bl OverlayManager_New
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r6]
	b _021E5AD4
_021E59D8:
	add r0, r4, #0
	add r0, #0xc
	bl ov55_021E5900
	cmp r0, #0
	beq _021E5AD4
	ldr r0, [r4, #0x10]
	ldrh r1, [r0]
	cmp r1, #3
	beq _021E59F8
	ldr r0, _021E5AE0 ; =0x0000FFFF
	cmp r1, r0
	bne _021E59FE
	mov r0, #2
	str r0, [r6]
	b _021E5AD4
_021E59F8:
	mov r0, #2
	str r0, [r6]
	b _021E5AD4
_021E59FE:
	mov r0, #3
	str r0, [r6]
	b _021E5AD4
_021E5A04:
	ldrh r0, [r5]
	cmp r0, #1
	bne _021E5A3A
	ldr r1, [r4, #0x10]
	ldrh r0, [r1]
	cmp r0, #3
	bne _021E5A36
	ldr r0, [r5, #0x14]
	bl ov55_021E5BC4
	ldr r0, [r5, #0x10]
	bl Sav2_GameStats_Get
	mov r1, #2
	bl GameStats_AddSpecial
	ldr r0, [r5, #0x10]
	bl Sav2_GameStats_Get
	mov r1, #0x2e
	bl GameStats_Inc
	mov r0, #1
	str r0, [r5, #4]
	b _021E5A3A
_021E5A36:
	mov r0, #0
	str r0, [r5, #4]
_021E5A3A:
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E5A40:
	ldr r0, [r4]
	mov r1, #0
	str r0, [sp]
	ldr r2, [r5, #0x10]
	ldr r3, [r5, #0x1c]
	mov r0, #2
	bl sub_02090C94
	str r0, [r4, #8]
	ldr r0, [r4, #0x10]
	add r1, r0, #0
	ldrb r0, [r0, #2]
	add r1, #0x1e
	lsl r0, r0, #3
	add r0, r1, r0
	bl MailMsg_IsInit
	cmp r0, #0
	beq _021E5A7C
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	ldrb r1, [r1, #2]
	add r2, #0x1e
	add r0, #0x14
	lsl r1, r1, #3
	add r1, r2, r1
	bl MailMsg_Copy
	b _021E5A86
_021E5A7C:
	add r0, r4, #0
	add r0, #0x14
	mov r1, #3
	bl MailMsg_Init_WithBank
_021E5A86:
	add r1, r4, #0
	ldr r0, [r4, #8]
	add r1, #0x14
	bl sub_02090D20
	ldr r0, _021E5AE4 ; =ov55_021E5C04
	ldr r1, [r4, #8]
	ldr r2, [r4]
	bl OverlayManager_New
	str r0, [r4, #0xc]
	mov r0, #4
	str r0, [r6]
	b _021E5AD4
_021E5AA2:
	add r0, r4, #0
	add r0, #0xc
	bl ov55_021E5900
	cmp r0, #0
	beq _021E5AD4
	ldr r0, [r4, #8]
	bl sub_02090D48
	cmp r0, #0
	bne _021E5ACA
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #8]
	add r2, r1, #0
	ldrb r1, [r1, #2]
	add r2, #0x1e
	lsl r1, r1, #3
	add r1, r2, r1
	bl sub_02090D60
_021E5ACA:
	ldr r0, [r4, #8]
	bl sub_02090D0C
	mov r0, #0
	str r0, [r6]
_021E5AD4:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E5ADC: .word ov55_021E5BF4
_021E5AE0: .word 0x0000FFFF
_021E5AE4: .word ov55_021E5C04
	thumb_func_end ov55_021E598C

	thumb_func_start ov55_021E5AE8
ov55_021E5AE8: ; 0x021E5AE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov55_021E5BAC
	add r0, r5, #0
	bl OverlayManager_FreeData
	ldr r0, [r4]
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov55_021E5AE8

	thumb_func_start ov55_021E5B08
ov55_021E5B08: ; 0x021E5B08
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x38
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x38
	add r6, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	strh r0, [r6]
	add r0, r4, #0
	bl Mail_GetOTID
	str r0, [r6, #0xc]
	mov r0, #8
	add r1, r5, #0
	bl String_New
	str r0, [r6, #0x14]
	add r0, r4, #0
	bl Mail_GetAuthorNamePtr
	add r1, r0, #0
	ldr r0, [r6, #0x14]
	bl CopyU16ArrayToString
	add r0, r4, #0
	bl Mail_GetType
	strb r0, [r6, #0x13]
	add r0, r4, #0
	bl Mail_GetLanguage
	strb r0, [r6, #0x11]
	add r0, r4, #0
	bl Mail_GetVersion
	strb r0, [r6, #0x12]
	mov r5, #0
	mov r7, #2
_021E5B60:
	add r0, r4, #0
	bl sub_0202B4E4
	lsl r1, r5, #0x18
	add r3, r0, #0
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r2, r7, #0
	bl sub_0202B404
	lsl r1, r5, #1
	add r1, r6, r1
	strh r0, [r1, #0x18]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _021E5B60
	add r7, r6, #0
	mov r5, #0
	add r7, #0x1e
_021E5B8A:
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl Mail_GetUnk20Array
	add r1, r0, #0
	lsl r0, r5, #3
	add r0, r7, r0
	bl MailMsg_Copy
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _021E5B8A
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov55_021E5B08

	thumb_func_start ov55_021E5BAC
ov55_021E5BAC: ; 0x021E5BAC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021E5BBA
	bl String_Delete
_021E5BBA:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov55_021E5BAC

	thumb_func_start ov55_021E5BC4
ov55_021E5BC4: ; 0x021E5BC4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r4, r7, #0
	add r6, r0, #0
	mov r5, #0
	add r4, #0x1e
_021E5BD0:
	lsl r1, r5, #3
	lsl r2, r5, #0x18
	add r0, r6, #0
	add r1, r4, r1
	lsr r2, r2, #0x18
	bl Mail_SetMessage
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _021E5BD0
	ldrb r1, [r7, #0x13]
	add r0, r6, #0
	bl Mail_SetType
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov55_021E5BC4

	.rodata

ov55_021E5BF4:
	.word ov56_021E5C20, ov56_021E5C9C, ov56_021E5CB4, FS_OVERLAY_ID(OVY_56)

ov55_021E5C04: ; 0x021E5C04
	.word ov102_021E7740, ov102_021E77B8, ov102_021E7868, FS_OVERLAY_ID(OVY_102)
	; 0x021E5C14
