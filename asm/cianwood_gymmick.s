#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start InitCianwoodPuzzleGimmick
InitCianwoodPuzzleGimmick: ; 0x02255FC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #2
	bl SavGymmick_AssertMagic_GetData
	add r4, r0, #0
	mov r0, #4
	add r1, r0, #0
	bl AllocFromHeap
	ldr r1, [r5, #4]
	mov r2, #4
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x24]
	str r5, [r0]
	ldr r0, [r4]
	cmp r0, #0
	beq _0225603E
	add r0, r5, #0
	bl ov04_02256278
	add r7, r0, #0
	ldr r4, _02256040 ; =0x00000000
	beq _02256026
_02256004:
	ldr r2, [r5, #0x54]
	mov r0, #0xae
	add r1, r4, #0
	bl ov01_021E8B04
	add r6, r0, #0
	mov r1, #1
	bl ov01_021E8B60
	add r0, r6, #0
	bl ov01_021E8B78
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r7
	blo _02256004
_02256026:
	ldr r2, [r5, #0x54]
	mov r0, #0xaf
	mov r1, #0
	bl ov01_021E8B04
	add r4, r0, #0
	mov r1, #1
	bl ov01_021E8B60
	add r0, r4, #0
	bl ov01_021E8B78
_0225603E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256040: .word 0x00000000
	thumb_func_end InitCianwoodPuzzleGimmick

	thumb_func_start DeleteCianwoodPuzzleGimmick
DeleteCianwoodPuzzleGimmick: ; 0x02256044
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end DeleteCianwoodPuzzleGimmick

	thumb_func_start ov04_02256058
ov04_02256058: ; 0x02256058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	add r4, r0, #0
	bl SavGymmick_GetType
	cmp r0, #2
	beq _02256072
	mov r0, #0
	pop {r3, r4, r5, pc}
_02256072:
	add r0, r4, #0
	mov r1, #2
	bl SavGymmick_AssertMagic_GetData
	ldr r1, [r5, #4]
	ldr r1, [r1, #0x24]
	cmp r1, #0
	bne _02256086
	mov r0, #0
	pop {r3, r4, r5, pc}
_02256086:
	ldr r0, [r0]
	cmp r0, #0
	bne _02256096
	add r0, r1, #0
	bl ov04_0225609C
	mov r0, #1
	pop {r3, r4, r5, pc}
_02256096:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov04_02256058

	thumb_func_start ov04_0225609C
ov04_0225609C: ; 0x0225609C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #2
	bl SavGymmick_AssertMagic_GetData
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	mov r0, #1
	str r0, [r4]
	ldr r0, [r5]
	ldr r1, _022560D0 ; =ov04_022560D4
	ldr r0, [r0, #0x10]
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022560D0: .word ov04_022560D4
	thumb_func_end ov04_0225609C

	thumb_func_start ov04_022560D4
ov04_022560D4: ; 0x022560D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	ldr r0, [r4]
	cmp r0, #6
	bls _022560F6
	b _0225626C
_022560F6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02256102: ; jump table
	.short _02256110 - _02256102 - 2 ; case 0
	.short _02256168 - _02256102 - 2 ; case 1
	.short _02256180 - _02256102 - 2 ; case 2
	.short _022561CE - _02256102 - 2 ; case 3
	.short _022561E8 - _02256102 - 2 ; case 4
	.short _02256248 - _02256102 - 2 ; case 5
	.short _02256260 - _02256102 - 2 ; case 6
_02256110:
	ldr r1, [r6, #0x24]
	add r0, sp, #0xc
	bl GF_Camera_GetAngle
	add r0, sp, #4
	ldrh r1, [r0, #8]
	strh r1, [r0, #0x18]
	ldrh r1, [r0, #0xa]
	strh r1, [r0, #0x1a]
	ldrh r1, [r0, #0xc]
	strh r1, [r0, #0x1c]
	ldrh r1, [r0, #0xe]
	strh r1, [r0, #0x1e]
	ldrh r1, [r0, #0x18]
	add r0, sp, #0x44
	strh r1, [r0]
	ldr r0, [r6, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	add r1, sp, #0x44
	ldr r3, _02256274 ; =ov04_02257660
	strh r0, [r1, #2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x48
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r6, #0x24]
	bl GF_Camera_GetDistance
	str r0, [sp, #0x54]
	ldr r1, [r6, #0x24]
	mov r0, #4
	bl CreateCameraTranslationWrapper
	str r0, [r4, #8]
	add r1, sp, #0x44
	mov r2, #0x18
	bl SetCameraTranslationPath
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256168:
	ldr r0, [r4, #8]
	bl IsCameraTranslationFinished
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4, #8]
	bl DeleteCameraTranslationWrapper
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256180:
	add r0, r6, #0
	bl ov04_02256278
	mov r5, #0
	str r0, [sp]
	cmp r0, #0
	ble _022561AE
_0225618E:
	ldr r2, [r6, #0x54]
	mov r0, #0xae
	add r1, r5, #0
	bl ov01_021E8B04
	add r7, r0, #0
	mov r1, #1
	bl ov01_021E8B84
	add r0, r7, #0
	bl ov01_021E8B6C
	ldr r0, [sp]
	add r5, r5, #1
	cmp r5, r0
	blt _0225618E
_022561AE:
	ldr r2, [r6, #0x54]
	mov r0, #0xaf
	mov r1, #0
	bl ov01_021E8B04
	add r5, r0, #0
	mov r1, #1
	bl ov01_021E8B84
	add r0, r5, #0
	bl ov01_021E8B6C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_022561CE:
	ldr r2, [r6, #0x54]
	mov r0, #0xaf
	mov r1, #0
	bl ov01_021E8B04
	bl ov01_021E8B90
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_022561E8:
	add r1, sp, #0x24
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r1, [r6, #0x24]
	add r0, sp, #4
	bl GF_Camera_GetAngle
	add r0, sp, #4
	ldrh r1, [r0]
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #2]
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #4]
	strh r1, [r0, #0x14]
	ldrh r1, [r0, #6]
	strh r1, [r0, #0x16]
	ldrh r1, [r0, #0x10]
	strh r1, [r0, #0x2c]
	ldr r0, [r6, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	add r1, sp, #4
	add r3, sp, #0x24
	strh r0, [r1, #0x2e]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x34
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r6, #0x24]
	bl GF_Camera_GetDistance
	str r0, [sp, #0x40]
	ldr r1, [r6, #0x24]
	mov r0, #4
	bl CreateCameraTranslationWrapper
	str r0, [r4, #8]
	add r1, sp, #0x30
	mov r2, #0x18
	bl SetCameraTranslationPath
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256248:
	ldr r0, [r4, #8]
	bl IsCameraTranslationFinished
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4, #8]
	bl DeleteCameraTranslationWrapper
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256260:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225626C:
	mov r0, #0
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256274: .word ov04_02257660
	thumb_func_end ov04_022560D4

	thumb_func_start ov04_02256278
ov04_02256278: ; 0x02256278
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0xad
	bl ov01_022040D0
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0xae
	bl ov01_022040D0
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0xaf
	bl ov01_022040D0
	str r0, [sp, #4]
	ldr r0, [r4, #0x54]
	mov r1, #0xad
	bl ov01_021E8BAC
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022562C6
_022562B4:
	ldr r0, [r4, #0x54]
	add r1, r6, #0
	mov r2, #0xad
	add r3, r5, #0
	bl ov01_021E8A8C
	add r5, r5, #1
	cmp r5, r7
	blt _022562B4
_022562C6:
	ldr r0, [r4, #0x54]
	mov r1, #0xae
	bl ov01_021E8BAC
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022562EC
_022562D6:
	ldr r0, [r4, #0x54]
	add r1, r5, #0
	str r0, [sp]
	mov r0, #0xae
	mov r2, #1
	add r3, r6, #0
	bl ov01_021E8970
	add r5, r5, #1
	cmp r5, r7
	blt _022562D6
_022562EC:
	ldr r0, [r4, #0x54]
	ldr r3, [sp, #4]
	str r0, [sp]
	mov r0, #0xaf
	mov r1, #0
	mov r2, #1
	bl ov01_021E8970
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02256278

	.rodata

ov04_02257660: ; 0x02257660
	.byte 0x00, 0x20, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x03, 0x00
