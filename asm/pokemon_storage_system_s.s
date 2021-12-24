	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.public PCStorage_IsValidWallpaperId

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
