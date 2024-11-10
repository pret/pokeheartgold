#include "constants/abilities.h"
#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/items.h"
#include "constants/pokemon.h"
#include "constants/std_script.h"
	.include "asm/macros.inc"
	.include "overlay_02.inc"
	.include "global.inc"

	.text
    .public CelebiCutscene_SwirlEffect

	thumb_func_start ov02_022529A0
ov02_022529A0: ; 0x022529A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	mov r7, #0x14
_022529AA:
	add r0, r4, #0
	mul r0, r7
	add r0, r5, r0
	add r1, r6, #0
	bl Field3dModelAnimation_FrameSet
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _022529AA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_022529A0

	thumb_func_start ov02_022529C4
ov02_022529C4: ; 0x022529C4
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
	mov r7, #0x14
_022529CE:
	add r0, r4, #0
	mul r0, r7
	mov r1, #1
	add r0, r6, r0
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndCheck
	cmp r0, #0
	beq _022529E6
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_022529E6:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _022529CE
	cmp r5, #3
	bne _022529F8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022529F8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022529C4

	thumb_func_start ov02_022529FC
ov02_022529FC: ; 0x022529FC
	push {r3, r4, r5, lr}
	mov r1, #0x8a
	add r5, r0, #0
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	mov r2, #0x8a
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	str r5, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _02252A24 ; =ov02_02252A28
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02252A24: .word ov02_02252A28
	thumb_func_end ov02_022529FC

	thumb_func_start ov02_02252A28
ov02_02252A28: ; 0x02252A28
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetFieldSystem
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	ldr r0, [r5]
	cmp r0, #5
	bhi _02252B3A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02252A54: ; jump table
	.short _02252A60 - _02252A54 - 2 ; case 0
	.short _02252A80 - _02252A54 - 2 ; case 1
	.short _02252AAC - _02252A54 - 2 ; case 2
	.short _02252AD2 - _02252A54 - 2 ; case 3
	.short _02252AF2 - _02252A54 - 2 ; case 4
	.short _02252B20 - _02252A54 - 2 ; case 5
_02252A60:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _02252B94 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252A80:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252B3A
	add r0, r4, #0
	bl ov02_02252BA4
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r3, _02252B94 ; =0x00007FFF
	mov r0, #3
	mov r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AAC:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252B3A
	mov r2, #0x89
	lsl r2, r2, #2
	mov r1, #1
	strb r1, [r4, r2]
	add r0, r2, #3
	mov r3, #0
	sub r2, #0x78
	strb r3, [r4, r0]
	add r0, r4, r2
	bl Field3dObject_SetActiveFlag
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AD2:
	ldr r1, _02252B98 ; =0x00000227
	ldrb r0, [r4, r1]
	add r0, r0, #1
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #0x64
	blo _02252B3A
	mov r2, #1
	sub r0, r1, #2
	strb r2, [r4, r0]
	mov r0, #0
	strb r0, [r4, r1]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252AF2:
	ldr r0, _02252B98 ; =0x00000227
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x96
	blo _02252B3A
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _02252B94 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252B3A
_02252B20:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252B3A
	add r0, r4, #0
	bl ov02_02252DF8
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02252B3A:
	mov r0, #0x89
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02252B58
	add r0, r4, #0
	add r0, #0x34
	mov r1, #2
	bl ov02_02252EA8
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #2
	bl ov02_02252EA8
_02252B58:
	ldr r0, _02252B9C ; =0x00000225
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _02252B6A
	sub r0, #0xa1
	add r0, r4, r0
	mov r1, #2
	bl ov02_02252EA8
_02252B6A:
	ldr r0, _02252BA0 ; =0x00000226
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02252B8C
	add r0, r4, #0
	add r0, #0x84
	bl Field3dObject_Draw
	add r0, r4, #0
	add r0, #0xfc
	bl Field3dObject_Draw
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	bl Field3dObject_Draw
_02252B8C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02252B94: .word 0x00007FFF
_02252B98: .word 0x00000227
_02252B9C: .word 0x00000225
_02252BA0: .word 0x00000226
	thumb_func_end ov02_02252A28

	thumb_func_start ov02_02252BA4
ov02_02252BA4: ; 0x02252BA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	ldr r3, _02252DEC ; =ov02_02253D14
	add r2, sp, #0x40
	str r0, [sp, #8]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, _02252DF0 ; =ov02_02253CF8
	ldr r1, [r0, #4]
	ldr r2, [r0]
	str r1, [sp, #0x30]
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r2, [sp, #0x2c]
	str r0, [sp, #0x28]
	ldr r0, [sp, #8]
	str r1, [sp, #0x24]
	add r0, r0, #4
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	ldr r4, [sp, #8]
	mov r5, #0
	add r4, #0x14
	mov r7, #0xae
	add r6, sp, #0x24
_02252BDE:
	lsl r2, r5, #2
	lsl r0, r5, #4
	ldr r2, [r6, r2]
	add r0, r4, r0
	add r1, r7, #0
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252BDE
	mov r1, #0x5d
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0xae
	mov r2, #0x55
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	str r0, [sp, #0x14]
	add r0, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	add r0, #0x34
	str r0, [sp, #0x18]
_02252C24:
	ldr r0, [sp, #0x10]
	mov r5, #0
	lsl r1, r0, #3
	add r0, sp, #0x40
	add r6, r0, r1
	ldr r0, [sp, #0x10]
	add r1, r0, #0
	lsl r7, r0, #4
	mov r0, #0x28
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x18]
	add r4, r0, r2
_02252C3E:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	mov r0, #0x14
	lsl r3, r5, #2
	mul r0, r5
	ldr r3, [r6, r3]
	add r0, r4, r0
	add r1, r1, r7
	mov r2, #0xae
	bl Field3dModelAnimation_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252C3E
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #2
	blo _02252C24
	ldr r0, [sp, #8]
	mov r1, #0x61
	lsl r1, r1, #2
	mov r5, #0
	add r4, r0, #4
	add r7, r0, r1
_02252C7E:
	mov r0, #4
	str r0, [sp]
	mov r0, #0x14
	mov r1, #0x5d
	mul r0, r5
	ldr r2, [sp, #8]
	lsl r1, r1, #2
	add r1, r2, r1
	lsl r6, r5, #2
	add r3, sp, #0x2c
	ldr r3, [r3, r6]
	add r0, r7, r0
	mov r2, #0xae
	str r4, [sp, #4]
	bl Field3dModelAnimation_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252C7E
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	mov r5, #0
	add r4, #0x84
	add r6, #0x14
	mov r7, #0x78
_02252CB4:
	add r0, r5, #0
	mul r0, r7
	lsl r1, r5, #4
	add r0, r4, r0
	add r1, r6, r1
	bl Field3dObject_InitFromModel
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252CB4
	mov r2, #0x6b
	ldr r0, [sp, #8]
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r1, [sp, #8]
	sub r2, #0x38
	add r1, r1, r2
	bl Field3dObject_InitFromModel
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0x20]
	add r0, #0x34
	str r0, [sp, #0x20]
	add r7, #0x84
_02252CEE:
	ldr r1, [sp, #0xc]
	mov r0, #0x28
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x20]
	add r6, r1, #0
	add r4, r0, r2
	mov r0, #0x78
	mov r5, #0
	mul r6, r0
_02252D02:
	mov r1, #0x14
	mul r1, r5
	add r0, r7, r6
	add r1, r4, r1
	bl Field3dObject_AddAnimation
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252D02
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #2
	blo _02252CEE
	mov r6, #0x6b
	lsl r6, r6, #2
	add r1, r6, #0
	ldr r0, [sp, #8]
	sub r1, #0x28
	mov r5, #0
	add r4, r0, r1
	mov r7, #0x14
_02252D36:
	ldr r0, [sp, #8]
	add r1, r5, #0
	mul r1, r7
	add r0, r0, r6
	add r1, r4, r1
	bl Field3dObject_AddAnimation
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252D36
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	mov r5, #0
	add r4, #0x84
	add r6, #0x34
	mov r7, #0x28
_02252D5A:
	mov r0, #0x78
	mul r0, r5
	add r0, r4, r0
	mov r1, #1
	bl Field3dObject_SetActiveFlag
	add r0, r5, #0
	mul r0, r7
	add r0, r6, r0
	mov r1, #2
	mov r2, #0
	bl ov02_02252E80
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252D5A
	mov r1, #0x6b
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl Field3dObject_SetActiveFlag
	mov r1, #0x61
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #2
	mov r2, #0
	bl ov02_02252E80
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl FollowMon_GetMapObject
	add r1, sp, #0x34
	bl MapObject_GetPositionVec
	ldr r4, [sp, #8]
	mov r5, #0
	add r4, #0x84
	mov r6, #0x78
_02252DB2:
	add r0, r5, #0
	mul r0, r6
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	add r0, r4, r0
	bl Field3dObject_SetPosEx
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02252DB2
	mov r1, #0x6b
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	bl Field3dObject_SetPosEx
	ldr r1, _02252DF4 ; =0x00000226
	ldr r0, [sp, #8]
	mov r2, #1
	strb r2, [r0, r1]
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02252DEC: .word ov02_02253D14
_02252DF0: .word ov02_02253CF8
_02252DF4: .word 0x00000226
	thumb_func_end ov02_02252BA4

	thumb_func_start ov02_02252DF8
ov02_02252DF8: ; 0x02252DF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	str r0, [sp, #8]
	add r0, #0x14
	str r0, [sp, #8]
	add r0, r5, #0
	str r0, [sp, #4]
	add r0, #0x34
	str r0, [sp, #4]
	mov r7, #0x14
_02252E14:
	ldr r1, [sp]
	mov r0, #0x28
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #4]
	mov r4, #0
	add r6, r0, r2
_02252E22:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	add r1, r5, #4
	bl Field3dModelAnimation_Unload
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _02252E22
	ldr r0, [sp]
	lsl r1, r0, #4
	ldr r0, [sp, #8]
	add r0, r0, r1
	bl Field3dModel_Unload
	ldr r0, [sp]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	cmp r0, #2
	blo _02252E14
	mov r0, #0x61
	lsl r0, r0, #2
	mov r4, #0
	add r6, r5, r0
	mov r7, #0x14
_02252E5C:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	add r1, r5, #4
	bl Field3dModelAnimation_Unload
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _02252E5C
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r5, r0
	bl Field3dModel_Unload
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_02252DF8

	thumb_func_start ov02_02252E80
ov02_02252E80: ; 0x02252E80
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _02252EA4
_02252E8E:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl Field3dModelAnimation_FrameSet
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _02252E8E
_02252EA4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02252E80

	thumb_func_start ov02_02252EA8
ov02_02252EA8: ; 0x02252EA8
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _02252ED8
_02252EB6:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndCheck
	cmp r0, #0
	beq _02252ECE
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02252ECE:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02252EB6
_02252ED8:
	cmp r5, r6
	bne _02252EE0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02252EE0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02252EA8

	thumb_func_start ov02_02252EE4
ov02_02252EE4: ; 0x02252EE4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0xf0
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	mov r1, #0
	mov r2, #0xf0
	bl MI_CpuFill8
	add r0, r6, #0
	str r5, [r6]
	add r0, #0xef
	strb r4, [r0]
	ldr r0, [r5, #0x10]
	ldr r1, _02252F10 ; =ov02_02252F14
	add r2, r6, #0
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02252F10: .word ov02_02252F14
	thumb_func_end ov02_02252EE4

	thumb_func_start ov02_02252F14
ov02_02252F14: ; 0x02252F14
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetFieldSystem
	add r0, r5, #0
	bl TaskManager_GetEnvironment
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #4
	bhi _02252FD4
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02252F40: ; jump table
	.short _02252F4A - _02252F40 - 2 ; case 0
	.short _02252F6A - _02252F40 - 2 ; case 1
	.short _02252F96 - _02252F40 - 2 ; case 2
	.short _02252FB6 - _02252F40 - 2 ; case 3
	.short _02252FC4 - _02252F40 - 2 ; case 4
_02252F4A:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _02253008 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252F6A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252FD4
	add r0, r5, #0
	bl ov02_0225300C
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r3, _02253008 ; =0x00007FFF
	mov r0, #3
	mov r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252F96:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252FD4
	add r0, r5, #0
	mov r1, #1
	add r0, #0xec
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0xed
	strb r1, [r0]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02252FD4
_02252FB6:
	add r0, #0xed
	ldrb r0, [r0]
	cmp r0, #0
	beq _02252FD4
	add r0, r1, #1
	str r0, [r4]
	b _02252FD4
_02252FC4:
	bl ov02_02253108
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02252FD4:
	add r0, r5, #0
	add r0, #0xec
	ldrb r0, [r0]
	cmp r0, #0
	beq _02252FEE
	add r0, r5, #0
	add r0, #0x24
	mov r1, #4
	bl ov02_02252EA8
	add r1, r5, #0
	add r1, #0xed
	strb r0, [r1]
_02252FEE:
	add r0, r5, #0
	add r0, #0xee
	ldrb r0, [r0]
	cmp r0, #0
	beq _02253000
	add r5, #0x74
	add r0, r5, #0
	bl Field3dObject_Draw
_02253000:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02253008: .word 0x00007FFF
	thumb_func_end ov02_02252F14

	thumb_func_start ov02_0225300C
ov02_0225300C: ; 0x0225300C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	ldr r4, _02253100 ; =ov02_02253D24
	add r7, r0, #0
	add r3, sp, #0x2c
	mov r2, #6
_02253018:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02253018
	ldr r3, _02253104 ; =ov02_02253D08
	add r2, sp, #0x20
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #4
	str r0, [r2]
	add r0, r7, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r2, r7, #0
	add r2, #0xef
	ldrb r2, [r2]
	add r0, r7, #0
	add r0, #0x14
	lsl r3, r2, #2
	add r2, sp, #0x20
	ldr r2, [r2, r3]
	mov r1, #0xae
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	add r0, r7, #4
	str r0, [sp, #0x10]
	add r0, r7, #0
	str r0, [sp, #8]
	add r0, #0x24
	str r0, [sp, #8]
	add r0, r7, #0
	str r0, [sp, #0xc]
	add r0, #0x14
	mov r4, #0
	str r0, [sp, #0xc]
_02253064:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r3, r7, #0
	str r0, [sp, #4]
	add r3, #0xef
	ldrb r3, [r3]
	mov r0, #0x14
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	lsl r6, r3, #4
	add r3, sp, #0x2c
	add r0, r0, r1
	lsl r5, r4, #2
	add r3, r3, r6
	ldr r1, [sp, #0xc]
	ldr r3, [r5, r3]
	mov r2, #0xae
	bl Field3dModelAnimation_LoadFromFilesystem
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02253064
	add r0, r7, #0
	add r1, r7, #0
	add r0, #0x74
	add r1, #0x14
	bl Field3dObject_InitFromModel
	add r6, r7, #0
	add r5, r7, #0
	mov r4, #0
	add r6, #0x74
	add r5, #0x24
_022530AE:
	mov r1, #0x14
	mul r1, r4
	add r0, r6, #0
	add r1, r5, r1
	bl Field3dObject_AddAnimation
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _022530AE
	add r0, r7, #0
	add r0, #0x74
	mov r1, #1
	bl Field3dObject_SetActiveFlag
	add r0, r7, #0
	add r0, #0x24
	mov r1, #4
	mov r2, #0
	bl ov02_02252E80
	ldr r0, [r7]
	bl FollowMon_GetMapObject
	add r1, sp, #0x14
	bl MapObject_GetPositionVec
	add r0, r7, #0
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, #0x74
	bl Field3dObject_SetPosEx
	mov r0, #1
	add r7, #0xee
	strb r0, [r7]
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02253100: .word ov02_02253D24
_02253104: .word ov02_02253D08
	thumb_func_end ov02_0225300C

	thumb_func_start ov02_02253108
ov02_02253108: ; 0x02253108
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r5, #0
	mov r4, #0
	add r6, #0x24
	mov r7, #0x14
_02253114:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	add r1, r5, #4
	bl Field3dModelAnimation_Unload
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02253114
	add r5, #0x14
	add r0, r5, #0
	bl Field3dModel_Unload
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02253108

	thumb_func_start ov02_02253134
ov02_02253134: ; 0x02253134
	push {r3, r4, r5, r6, r7, lr}
	bl Save_FashionData_Get
	bl Save_FashionData_GetFashionCase
	ldr r6, _02253168 ; =ov02_02253D54
	add r5, r0, #0
	mov r4, #0
	mov r7, #1
_02253146:
	ldrb r1, [r6, r4]
	add r0, r5, #0
	add r2, r7, #0
	bl sub_0202BA2C
	cmp r0, #1
	bne _02253158
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02253158:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x27
	blo _02253146
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02253168: .word ov02_02253D54
	thumb_func_end ov02_02253134

	thumb_func_start ov02_0225316C
ov02_0225316C: ; 0x0225316C
	push {r3, lr}
	bl LCRandom
	mov r1, #0x27
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	ldr r0, _02253184 ; =ov02_02253D54
	ldrb r0, [r0, r1]
	pop {r3, pc}
	nop
_02253184: .word ov02_02253D54
	thumb_func_end ov02_0225316C

	thumb_func_start ov02_02253188
ov02_02253188: ; 0x02253188
	push {r3, r4, r5, lr}
	bl Save_FashionData_Get
	bl Save_FashionData_GetFashionCase
	add r4, r0, #0
	mov r5, #0
_02253196:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0202BA5C
	cmp r0, #0
	bne _022531A6
	mov r0, #0
	pop {r3, r4, r5, pc}
_022531A6:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0xe
	blo _02253196
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02253188

	thumb_func_start ov02_022531B4
ov02_022531B4: ; 0x022531B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r1, r4, #0
	add r3, r4, #0
	add r2, sp, #0
_022531C0:
	strb r3, [r2, r1]
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #0xe
	blo _022531C0
	bl Save_FashionData_Get
	bl Save_FashionData_GetFashionCase
	add r6, r0, #0
	mov r5, #0
	add r7, sp, #0
_022531DA:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202BA5C
	cmp r0, #0
	bne _022531EE
	add r0, r4, #1
	lsl r0, r0, #0x18
	strb r5, [r7, r4]
	lsr r4, r0, #0x18
_022531EE:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0xe
	blo _022531DA
	cmp r4, #0
	bne _02253206
	bl GF_AssertFail
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02253206:
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	add r0, sp, #0
	ldrb r0, [r0, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022531B4

    .rodata

.public ov02_02253C84
ov02_02253C84: ; 0x02253C84
	.byte 0x01, 0x00

.public ov02_02253C86
ov02_02253C86: ; 0x02253C86
	.byte 0x0D, 0x00

.public ov02_02253C88
ov02_02253C88: ; 0x02253C88
	.byte 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x55, 0x00, 0x01, 0x00, 0x09, 0x00, 0x5D, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00
	.byte 0x8E, 0x00, 0x01, 0x00, 0x18, 0x00, 0x8F, 0x00, 0x01, 0x00, 0x18, 0x00, 0x90, 0x00, 0x01, 0x00
	.byte 0x18, 0x00, 0x91, 0x00, 0x01, 0x00, 0x18, 0x00, 0x92, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

.public ov02_02253CD4
ov02_02253CD4: ; 0x02253CD4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.public ov02_02253CE0
ov02_02253CE0: ; 0x02253CE0
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00

.public sCelebiCutsceneAnimationFiles
sCelebiCutsceneAnimationFiles: ; 0x02253CEC
	.byte 0x4C, 0x00, 0x00, 0x00
	.byte 0x4E, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00

ov02_02253CF8: ; 0x02253CF8
	.byte 0x56, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00

ov02_02253D08: ; 0x02253D08
	.byte 0x58, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov02_02253D14: ; 0x02253D14
	.byte 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x53, 0x00, 0x00, 0x00
	.byte 0x54, 0x00, 0x00, 0x00

ov02_02253D24: ; 0x02253D24
	.byte 0x64, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.byte 0x59, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00
	.byte 0x61, 0x00, 0x00, 0x00

ov02_02253D54: ; 0x02253D54
	.byte 0x2F, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42
	.byte 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52
	.byte 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x5B, 0x5F, 0x60, 0x00
