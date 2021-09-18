	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start PCStorage_init
PCStorage_init: ; 0x02073B18
	ldr r3, _02073B1C ; =PCStorage_InitializeBoxes
	bx r3
	.balign 4, 0
_02073B1C: .word PCStorage_InitializeBoxes
	thumb_func_end PCStorage_init

	thumb_func_start PCStorage_sizeof
PCStorage_sizeof: ; 0x02073B20
	ldr r0, _02073B24 ; =0x000122FC
	bx lr
	.balign 4, 0
_02073B24: .word 0x000122FC
	thumb_func_end PCStorage_sizeof

	thumb_func_start PCStorage_InitializeBoxes
PCStorage_InitializeBoxes: ; 0x02073B28
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r7, #0
	add r6, r0, #0
_02073B30:
	mov r4, #0
	add r5, r6, #0
_02073B34:
	add r0, r5, #0
	bl ZeroBoxMonData
	add r4, r4, #1
	add r5, #0x88
	cmp r4, #0x1e
	blo _02073B34
	mov r0, #1
	lsl r0, r0, #0xc
	add r7, r7, #1
	add r6, r6, r0
	cmp r7, #0x12
	blo _02073B30
	mov r3, #0
	ldr r1, _02073BAC ; =0x000122D8
	add r4, r3, #0
	add r2, r3, #0
_02073B56:
	ldr r0, [sp]
	add r0, r0, r3
	strb r4, [r0, r1]
	add r4, r4, #1
	cmp r4, #0x10
	blo _02073B64
	add r4, r2, #0
_02073B64:
	add r3, r3, #1
	cmp r3, #0x12
	blo _02073B56
	ldr r1, _02073BB0 ; =0x000122EA
	ldr r0, [sp]
	mov r3, #0
	strb r3, [r0, r1]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x18
	bl NewMsgDataFromNarc
	add r6, r0, #0
	beq _02073BA0
	ldr r1, _02073BB4 ; =0x00012008
	ldr r0, [sp]
	mov r5, #0
	add r4, r0, r1
_02073B88:
	add r0, r6, #0
	add r1, r5, #6
	add r2, r4, #0
	bl ReadMsgDataIntoU16Array
	add r5, r5, #1
	add r4, #0x28
	cmp r5, #0x12
	blo _02073B88
	add r0, r6, #0
	bl DestroyMsgData
_02073BA0:
	mov r1, #0x12
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #0xc
	str r2, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02073BAC: .word 0x000122D8
_02073BB0: .word 0x000122EA
_02073BB4: .word 0x00012008
	thumb_func_end PCStorage_InitializeBoxes

	thumb_func_start PCStorage_PlaceMonInFirstEmptySlotInAnyBox
PCStorage_PlaceMonInFirstEmptySlotInAnyBox: ; 0x02073BB8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r4, [r5, r0]
	add r6, r1, #0
	add r7, r0, #0
_02073BC6:
	add r0, r6, #0
	bl RestoreBoxMonPP
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl PCStorage_PlaceMonInBoxFirstEmptySlot
	cmp r0, #0
	beq _02073BE8
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl PCStorage_SetBoxModified
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02073BE8:
	add r4, r4, #1
	cmp r4, #0x12
	blo _02073BF0
	mov r4, #0
_02073BF0:
	ldr r0, [r5, r7]
	cmp r4, r0
	bne _02073BC6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PCStorage_PlaceMonInFirstEmptySlotInAnyBox

	thumb_func_start PCStorage_PlaceMonInBoxFirstEmptySlot
PCStorage_PlaceMonInBoxFirstEmptySlot: ; 0x02073BFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r0, r2, #0
	add r6, r1, #0
	str r2, [sp, #4]
	bl RestoreBoxMonPP
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _02073C1C
	mov r1, #0x12
	ldr r0, [sp]
	lsl r1, r1, #0xc
	ldr r6, [r0, r1]
_02073C1C:
	ldr r0, [sp]
	lsl r1, r6, #0xc
	add r5, r0, r1
	mov r4, #0
	str r5, [sp, #8]
	mov r7, #5
_02073C28:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02073C5E
	mov r0, #0x88
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	mov r3, #0x11
	add r4, r0, r1
_02073C42:
	ldr r2, [sp, #4]
	sub r3, r3, #1
	ldmia r2!, {r0, r1}
	str r2, [sp, #4]
	stmia r4!, {r0, r1}
	bne _02073C42
	lsl r1, r6, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	bl PCStorage_SetBoxModified
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02073C5E:
	add r4, r4, #1
	add r5, #0x88
	cmp r4, #0x1e
	blo _02073C28
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end PCStorage_PlaceMonInBoxFirstEmptySlot

	thumb_func_start PCStorage_PlaceMonInBoxByIndexPair
PCStorage_PlaceMonInBoxByIndexPair: ; 0x02073C6C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r3, #0
	add r5, r0, #0
	add r0, r7, #0
	add r4, r1, #0
	add r6, r2, #0
	bl RestoreBoxMonPP
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _02073C8A
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r4, [r5, r0]
_02073C8A:
	cmp r4, #0x12
	bhs _02073CB6
	cmp r6, #0x1e
	bhs _02073CB6
	lsl r2, r4, #0xc
	mov r0, #0x88
	add r1, r6, #0
	mul r1, r0
	add r0, r5, r2
	add r3, r1, r0
	mov r2, #0x11
_02073CA0:
	ldmia r7!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02073CA0
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl PCStorage_SetBoxModified
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02073CB6:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PCStorage_PlaceMonInBoxByIndexPair

	thumb_func_start PCStorage_SwapMonsInBoxByIndexPair
PCStorage_SwapMonsInBoxByIndexPair: ; 0x02073CC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x8c
	add r4, r1, #0
	lsl r1, r4, #0xc
	mov ip, r3
	str r0, [sp]
	add r3, r0, r1
	mov r0, #0x88
	mul r0, r2
	add r6, r3, r0
	add r7, r6, #0
	add r5, sp, #4
	mov r2, #0x11
_02073CDA:
	ldmia r7!, {r0, r1}
	stmia r5!, {r0, r1}
	sub r2, r2, #1
	bne _02073CDA
	mov r1, #0x88
	mov r0, ip
	mul r1, r0
	add r2, r3, r1
	add r5, r2, #0
	mov r3, #0x11
_02073CEE:
	ldmia r5!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r3, r3, #1
	bne _02073CEE
	add r5, sp, #4
	mov r3, #0x11
_02073CFA:
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r3, r3, #1
	bne _02073CFA
	lsl r1, r4, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	bl PCStorage_SetBoxModified
	add sp, #0x8c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end PCStorage_SwapMonsInBoxByIndexPair

	thumb_func_start PCStorage_DeleteBoxMonByIndexPair
PCStorage_DeleteBoxMonByIndexPair: ; 0x02073D10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	mvn r0, r0
	cmp r4, r0
	bne _02073D24
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r4, [r5, r0]
_02073D24:
	cmp r2, #0x1e
	bhs _02073D46
	cmp r4, #0x12
	bhs _02073D46
	lsl r0, r4, #0xc
	add r1, r5, r0
	mov r0, #0x88
	mul r0, r2
	add r0, r1, r0
	bl ZeroBoxMonData
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl PCStorage_SetBoxModified
	pop {r3, r4, r5, pc}
_02073D46:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end PCStorage_DeleteBoxMonByIndexPair

	thumb_func_start PCStorage_GetActiveBox
PCStorage_GetActiveBox: ; 0x02073D4C
	mov r1, #0x12
	lsl r1, r1, #0xc
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end PCStorage_GetActiveBox

	thumb_func_start PCStorage_FindFirstBoxWithEmptySlot
PCStorage_FindFirstBoxWithEmptySlot: ; 0x02073D54
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x12
	lsl r1, r1, #0xc
	ldr r6, [r0, r1]
	str r0, [sp]
	mov r7, #0xac
_02073D60:
	ldr r0, [sp]
	lsl r1, r6, #0xc
	mov r4, #0
	add r5, r0, r1
_02073D68:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02073D7A
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02073D7A:
	add r4, r4, #1
	add r5, #0x88
	cmp r4, #0x1e
	blt _02073D68
	add r6, r6, #1
	cmp r6, #0x12
	blt _02073D8A
	mov r6, #0
_02073D8A:
	mov r0, #0x12
	ldr r1, [sp]
	lsl r0, r0, #0xc
	ldr r0, [r1, r0]
	cmp r6, r0
	bne _02073D60
	mov r0, #0x12
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PCStorage_FindFirstBoxWithEmptySlot

	thumb_func_start PCStorage_FindFirstEmptySlot
PCStorage_FindFirstEmptySlot: ; 0x02073D9C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	mov r0, #0
	ldr r1, [r6]
	mvn r0, r0
	str r2, [sp]
	cmp r1, r0
	bne _02073DB6
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r0, [r7, r0]
	str r0, [r6]
_02073DB6:
	ldr r0, [sp]
	ldr r4, [r6]
	ldr r5, [r0]
	b _02073DE0
_02073DBE:
	lsl r0, r4, #0xc
	add r1, r7, r0
	mov r0, #0x88
	mul r0, r5
	add r0, r1, r0
	mov r1, #0xac
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02073DDE
	ldr r0, [sp]
	str r4, [r6]
	str r5, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02073DDE:
	add r5, r5, #1
_02073DE0:
	cmp r5, #0x1e
	blt _02073DBE
	add r4, r4, #1
	cmp r4, #0x12
	blt _02073DEC
	mov r4, #0
_02073DEC:
	ldr r0, [r6]
	cmp r4, r0
	beq _02073DF6
	mov r5, #0
	b _02073DE0
_02073DF6:
	mov r0, #0x12
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PCStorage_FindFirstEmptySlot

	thumb_func_start PCStorage_CountEmptySpotsInAllBoxes
PCStorage_CountEmptySpotsInAllBoxes: ; 0x02073DFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r6, #0
	str r0, [sp]
	str r6, [sp, #4]
	mov r7, #0xac
_02073E08:
	ldr r5, [sp]
	mov r4, #0
_02073E0C:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02073E1C
	add r6, r6, #1
_02073E1C:
	add r4, r4, #1
	add r5, #0x88
	cmp r4, #0x1e
	blt _02073E0C
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0x12
	blt _02073E08
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PCStorage_CountEmptySpotsInAllBoxes

	thumb_func_start PCStorage_CountEmptySpotsInBox
PCStorage_CountEmptySpotsInBox: ; 0x02073E40
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0
	add r5, r1, #0
	mvn r0, r0
	cmp r5, r0
	bne _02073E54
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r5, [r7, r0]
_02073E54:
	cmp r5, #0x12
	blo _02073E5C
	bl GF_AssertFail
_02073E5C:
	mov r4, #0
	lsl r0, r5, #0xc
	add r5, r7, r0
	add r6, r4, #0
	mov r7, #0xac
_02073E66:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02073E76
	add r4, r4, #1
_02073E76:
	add r6, r6, #1
	add r5, #0x88
	cmp r6, #0x1e
	blt _02073E66
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PCStorage_CountEmptySpotsInBox

	thumb_func_start PCStorage_SetActiveBox
PCStorage_SetActiveBox: ; 0x02073E84
	push {r3, lr}
	cmp r1, #0x12
	bhs _02073E92
	mov r2, #0x12
	lsl r2, r2, #0xc
	str r1, [r0, r2]
	pop {r3, pc}
_02073E92:
	bl GF_AssertFail
	pop {r3, pc}
	thumb_func_end PCStorage_SetActiveBox

	thumb_func_start PCStorage_GetBoxWallpaper
PCStorage_GetBoxWallpaper: ; 0x02073E98
	push {r3, lr}
	cmp r1, #0x12
	bhs _02073EA6
	add r1, r0, r1
	ldr r0, _02073EB0 ; =0x000122D8
	ldrb r0, [r1, r0]
	pop {r3, pc}
_02073EA6:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_02073EB0: .word 0x000122D8
	thumb_func_end PCStorage_GetBoxWallpaper

	thumb_func_start PCStorage_IsValidWallpaperId
PCStorage_IsValidWallpaperId: ; 0x02073EB4
	cmp r0, #0x10
	blo _02073EC0
	cmp r0, #0x20
	blo _02073EC4
	cmp r0, #0x28
	bhs _02073EC4
_02073EC0:
	mov r0, #1
	bx lr
_02073EC4:
	mov r0, #0
	bx lr
	thumb_func_end PCStorage_IsValidWallpaperId

	thumb_func_start PCStorage_SetBoxWallpaper
PCStorage_SetBoxWallpaper: ; 0x02073EC8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	mvn r0, r0
	add r6, r2, #0
	cmp r4, r0
	bne _02073EDE
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r4, [r5, r0]
_02073EDE:
	cmp r4, #0x12
	bhs _02073EF4
	add r0, r6, #0
	bl PCStorage_IsValidWallpaperId
	cmp r0, #1
	bne _02073EF4
	ldr r0, _02073EFC ; =0x000122D8
	add r1, r5, r4
	strb r6, [r1, r0]
	pop {r4, r5, r6, pc}
_02073EF4:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	nop
_02073EFC: .word 0x000122D8
	thumb_func_end PCStorage_SetBoxWallpaper

	thumb_func_start PCStorage_GetBoxName
PCStorage_GetBoxName: ; 0x02073F00
	push {r3, lr}
	add r3, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02073F12
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r1, [r3, r0]
_02073F12:
	cmp r1, #0x12
	bhs _02073F28
	add r0, r2, #0
	ldr r2, _02073F30 ; =0x00012008
	add r3, r3, r2
	mov r2, #0x28
	mul r2, r1
	add r1, r3, r2
	bl CopyU16ArrayToString
	pop {r3, pc}
_02073F28:
	bl GF_AssertFail
	pop {r3, pc}
	nop
_02073F30: .word 0x00012008
	thumb_func_end PCStorage_GetBoxName

	thumb_func_start PCStorage_SetBoxName
PCStorage_SetBoxName: ; 0x02073F34
	push {r3, lr}
	add r3, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02073F46
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r1, [r3, r0]
_02073F46:
	cmp r1, #0x12
	bhs _02073F5C
	add r0, r2, #0
	ldr r2, _02073F60 ; =0x00012008
	add r3, r3, r2
	mov r2, #0x28
	mul r2, r1
	add r1, r3, r2
	mov r2, #0x14
	bl CopyStringToU16Array
_02073F5C:
	pop {r3, pc}
	nop
_02073F60: .word 0x00012008
	thumb_func_end PCStorage_SetBoxName

	thumb_func_start PCStorage_CountMonsAndEggsInBox
PCStorage_CountMonsAndEggsInBox: ; 0x02073F64
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0
	mvn r2, r2
	cmp r1, r2
	bne _02073F74
	mov r1, #0x12
	lsl r1, r1, #0xc
	ldr r1, [r0, r1]
_02073F74:
	cmp r1, #0x12
	bhs _02073F9E
	mov r4, #0
	lsl r1, r1, #0xc
	add r6, r4, #0
	add r5, r0, r1
	mov r7, #0xac
_02073F82:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _02073F92
	add r4, r4, #1
_02073F92:
	add r6, r6, #1
	add r5, #0x88
	cmp r6, #0x1e
	blt _02073F82
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02073F9E:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PCStorage_CountMonsAndEggsInBox

	thumb_func_start PCStorage_CountMonsInBox
PCStorage_CountMonsInBox: ; 0x02073FA8
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0
	mvn r2, r2
	cmp r1, r2
	bne _02073FB8
	mov r1, #0x12
	lsl r1, r1, #0xc
	ldr r1, [r0, r1]
_02073FB8:
	cmp r1, #0x12
	bhs _02073FF0
	mov r4, #0
	lsl r1, r1, #0xc
	add r6, r4, #0
	add r5, r0, r1
	mov r7, #0xac
_02073FC6:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _02073FE4
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02073FE4
	add r4, r4, #1
_02073FE4:
	add r6, r6, #1
	add r5, #0x88
	cmp r6, #0x1e
	blt _02073FC6
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02073FF0:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end PCStorage_CountMonsInBox

	thumb_func_start PCStorage_CountMonsInAllBoxes
PCStorage_CountMonsInAllBoxes: ; 0x02073FF8
	push {r4, r5, r6, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
_02074000:
	add r0, r6, #0
	add r1, r5, #0
	bl PCStorage_CountMonsInBox
	add r5, r5, #1
	add r4, r4, r0
	cmp r5, #0x12
	blo _02074000
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end PCStorage_CountMonsInAllBoxes

	thumb_func_start PCStorage_GetMonDataByIndexPair
PCStorage_GetMonDataByIndexPair: ; 0x02074014
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0x12
	blo _0207402E
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0207402E
	bl GF_AssertFail
_0207402E:
	cmp r6, #0x1e
	blo _02074036
	bl GF_AssertFail
_02074036:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _02074044
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r4, [r5, r0]
_02074044:
	lsl r0, r4, #0xc
	add r1, r5, r0
	mov r0, #0x88
	mul r0, r6
	add r0, r1, r0
	ldr r2, [sp, #0x18]
	add r1, r7, #0
	bl GetBoxMonData
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end PCStorage_GetMonDataByIndexPair

	thumb_func_start PCStorage_GetMonByIndexPair
PCStorage_GetMonByIndexPair: ; 0x02074058
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x12
	blo _02074070
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02074070
	bl GF_AssertFail
_02074070:
	cmp r6, #0x1e
	blo _02074078
	bl GF_AssertFail
_02074078:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _02074086
	mov r0, #0x12
	lsl r0, r0, #0xc
	ldr r4, [r5, r0]
_02074086:
	lsl r0, r4, #0xc
	add r1, r5, r0
	mov r0, #0x88
	mul r0, r6
	add r0, r1, r0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end PCStorage_GetMonDataByIndexPair

	thumb_func_start PCStorage_UnlockBonusWallpaper
PCStorage_UnlockBonusWallpaper: ; 0x02074094
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blo _020740A2
	bl GF_AssertFail
_020740A2:
	ldr r0, _020740B0 ; =0x000122EA
	mov r1, #1
	ldrb r2, [r5, r0]
	lsl r1, r4
	orr r1, r2
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020740B0: .word 0x000122EA
	thumb_func_end PCStorage_UnlockBonusWallpaper

	thumb_func_start PCStorage_IsBonusWallpaperUnlocked
PCStorage_IsBonusWallpaperUnlocked: ; 0x020740B4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blo _020740C2
	bl GF_AssertFail
_020740C2:
	ldr r0, _020740D4 ; =0x000122EA
	ldrb r2, [r5, r0]
	mov r0, #1
	add r1, r0, #0
	lsl r1, r4
	tst r1, r2
	bne _020740D2
	mov r0, #0
_020740D2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020740D4: .word 0x000122EA
	thumb_func_end PCStorage_IsBonusWallpaperUnlocked

	thumb_func_start PCStorage_SetBoxModified
PCStorage_SetBoxModified: ; 0x020740D8
	push {r4, lr}
	cmp r1, #0x12
	blo _020740E4
	bl GF_AssertFail
	pop {r4, pc}
_020740E4:
	ldr r2, _020740F4 ; =0x00012004
	mov r3, #1
	ldr r4, [r0, r2]
	lsl r3, r1
	add r1, r4, #0
	orr r1, r3
	str r1, [r0, r2]
	pop {r4, pc}
	.balign 4, 0
_020740F4: .word 0x00012004
	thumb_func_end PCStorage_SetBoxModified

	thumb_func_start PCStorage_SetAllBoxesModified
PCStorage_SetAllBoxesModified: ; 0x020740F8
	ldr r2, _02074100 ; =0x0003FFFF
	ldr r1, _02074104 ; =0x00012004
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
_02074100: .word 0x0003FFFF
_02074104: .word 0x00012004
	thumb_func_end PCStorage_SetAllBoxesModified

	thumb_func_start PCStorage_ResetBoxModifiedFlags
PCStorage_ResetBoxModifiedFlags: ; 0x02074108
	ldr r1, _02074110 ; =0x00012004
	mov r2, #0
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
_02074110: .word 0x00012004
	thumb_func_end PCStorage_ResetBoxModifiedFlags

	thumb_func_start PCStorage_GetBoxModifiedFlags
PCStorage_GetBoxModifiedFlags: ; 0x02074114
	ldr r1, _0207411C ; =0x00012004
	ldr r0, [r0, r1]
	bx lr
	nop
_0207411C: .word 0x00012004
	thumb_func_end PCStorage_GetBoxModifiedFlags
