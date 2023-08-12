	.include "asm/macros.inc"
	.include "overlay_16.inc"
	.include "global.inc"

	.text

	thumb_func_start ov16_02201948
ov16_02201948: ; 0x02201948
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02201968
	bl OverlayManager_Run
	cmp r0, #0
	beq _02201968
	ldr r0, [r4]
	bl OverlayManager_Delete
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_02201968:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov16_02201948

	thumb_func_start ov16_0220196C
ov16_0220196C: ; 0x0220196C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022019B4 ; =FS_OVERLAY_ID(OVY_17)
	mov r1, #2
	bl HandleLoadOverlay
	bl ov17_02201BC0
	mov r2, #2
	mov r0, #3
	mov r1, #0x82
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x20
	mov r2, #0x82
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x82
	str r0, [r4]
	add r0, r5, #0
	bl OverlayManager_GetArgs
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov16_02201A34
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_022019B4: .word FS_OVERLAY_ID(OVY_17)
	thumb_func_end ov16_0220196C

	thumb_func_start ov16_022019B8
ov16_022019B8: ; 0x022019B8
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #4
	bhi _02201A00
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022019D2: ; jump table
	.short _022019DC - _022019D2 - 2 ; case 0
	.short _022019E4 - _022019D2 - 2 ; case 1
	.short _022019EC - _022019D2 - 2 ; case 2
	.short _022019F4 - _022019D2 - 2 ; case 3
	.short _022019FC - _022019D2 - 2 ; case 4
_022019DC:
	bl ov16_02201A60
	str r0, [r4]
	b _02201A00
_022019E4:
	bl ov16_02201A78
	str r0, [r4]
	b _02201A00
_022019EC:
	bl ov16_02201AA0
	str r0, [r4]
	b _02201A00
_022019F4:
	bl ov16_02201B24
	str r0, [r4]
	b _02201A00
_022019FC:
	mov r0, #1
	pop {r4, pc}
_02201A00:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov16_022019B8

	thumb_func_start ov16_02201A04
ov16_02201A04: ; 0x02201A04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov17_02201BC0
	add r0, r4, #0
	bl ov16_02201A4C
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x82
	bl DestroyHeap
	ldr r0, _02201A30 ; =FS_OVERLAY_ID(OVY_17)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02201A30: .word FS_OVERLAY_ID(OVY_17)
	thumb_func_end ov16_02201A04

	thumb_func_start ov16_02201A34
ov16_02201A34: ; 0x02201A34
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl BagCursor_New
	str r0, [r4, #0x18]
	ldr r0, [r4]
	bl BagCursor_New
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov16_02201A34

	thumb_func_start ov16_02201A4C
ov16_02201A4C: ; 0x02201A4C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov16_02201A4C

	thumb_func_start ov16_02201A60
ov16_02201A60: ; 0x02201A60
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02201A74 ; =ov16_02201B68
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_New
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02201A74: .word ov16_02201B68
	thumb_func_end ov16_02201A60

	thumb_func_start ov16_02201A78
ov16_02201A78: ; 0x02201A78
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	bl ov16_02201948
	cmp r0, #0
	bne _02201A8A
	mov r0, #1
	pop {r4, pc}
_02201A8A:
	ldrb r0, [r4, #0x14]
	add r0, #0xff
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02201A9A
	mov r0, #2
	pop {r4, pc}
_02201A9A:
	mov r0, #4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov16_02201A78

	thumb_func_start ov16_02201AA0
ov16_02201AA0: ; 0x02201AA0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl Save_Bag_Get
	ldrb r1, [r4, #0x14]
	cmp r1, #1
	beq _02201ABA
	cmp r1, #2
	beq _02201ADC
	b _02201AFE
_02201ABA:
	ldr r1, _02201B14 ; =_02201B60
	ldr r2, _02201B18 ; =_02201BA0
	str r1, [r2]
	ldr r2, [r4]
	bl Bag_CreateView
	str r0, [r4, #0x10]
	ldr r1, [r4, #4]
	mov r2, #6
	ldr r0, [r1, #4]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	ldr r1, [r1, #0xc]
	ldr r3, [r4, #0x1c]
	bl sub_0207789C
	b _02201B02
_02201ADC:
	ldr r1, _02201B1C ; =ov16_02201B64
	ldr r2, _02201B18 ; =_02201BA0
	str r1, [r2]
	ldr r2, [r4]
	bl Bag_CreateView
	str r0, [r4, #0x10]
	ldr r1, [r4, #4]
	mov r2, #6
	ldr r0, [r1, #4]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	ldr r1, [r1, #0xc]
	ldr r3, [r4, #0x18]
	bl sub_0207789C
	b _02201B02
_02201AFE:
	bl GF_AssertFail
_02201B02:
	ldr r0, _02201B20 ; =ov16_02201B78
	ldr r1, [r4, #0x10]
	ldr r2, [r4]
	bl OverlayManager_New
	str r0, [r4, #8]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02201B14: .word _02201B60
_02201B18: .word _02201BA0
_02201B1C: .word ov16_02201B64
_02201B20: .word ov16_02201B78
	thumb_func_end ov16_02201AA0

	thumb_func_start ov16_02201B24
ov16_02201B24: ; 0x02201B24
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	bl ov16_02201948
	cmp r0, #0
	bne _02201B36
	mov r0, #3
	pop {r4, pc}
_02201B36:
	ldr r0, [r4, #0x10]
	bl sub_0207790C
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #4
	bne _02201B4C
	ldr r0, [r4, #0x10]
	bl sub_02077904
	b _02201B4E
_02201B4C:
	ldr r0, _02201B5C ; =0x0000FFFF
_02201B4E:
	strh r0, [r4, #0x16]
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	.balign 4, 0
_02201B5C: .word 0x0000FFFF
	thumb_func_end ov16_02201B24

	.rodata

_02201B60:
	.byte 0x00, 0xFF, 0x00, 0x00

ov16_02201B64: ; 0x02201B64
	.byte 0x04, 0xFF, 0x00, 0x00

ov16_02201B68: ; 0x02201B68
	.word ov17_02201C10, ov17_02201C78, ov17_02201D04, 0xFFFFFFFF

ov16_02201B78: ; 0x02201B78
	.word ov15_BagApp_Init, ov15_BagApp_Exec, ov15_BagApp_Exit, FS_OVERLAY_ID(OVY_15)

	.data

_02201BA0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x02201BC0
