#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_04.inc"
	.include "global.inc"

	.text

	thumb_func_start GymmickInit_Viridian
GymmickInit_Viridian: ; 0x02256B64
	push {r4, lr}
	add r4, r0, #0
	bl FieldSystem_GetSaveData
	bl Save_GetGymmickPtr
	mov r1, #8
	bl Save_Gymmick_AssertMagic_GetData
	ldr r1, _02256B9C ; =0x00000708
	mov r0, #4
	bl Heap_Alloc
	ldr r1, [r4, #4]
	ldr r2, _02256B9C ; =0x00000708
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	mov r1, #4
	ldr r0, [r0, #0x24]
	bl ov04_02256C20
	pop {r4, pc}
	nop
_02256B9C: .word 0x00000708
	thumb_func_end GymmickInit_Viridian

	thumb_func_start GymmickFree_Viridian
GymmickFree_Viridian: ; 0x02256BA0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #4]
	ldr r5, [r0, #0x24]
	add r0, r5, #0
	bl ov04_02256D00
	mov r7, #0xa3
	lsl r7, r7, #2
	add r6, r7, #0
	mov r4, #0
	sub r6, #0x50
_02256BB8:
	add r0, r4, #0
	mul r0, r6
	add r1, r5, r0
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _02256BCA
	ldr r0, [r1, r7]
	bl SysTask_Destroy
_02256BCA:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _02256BB8
	add r0, r5, #0
	bl Heap_Free
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GymmickFree_Viridian

	thumb_func_start ov04_02256BE4
ov04_02256BE4: ; 0x02256BE4
	push {r4, r5, r6, lr}
	add r3, r0, #0
	ldr r0, [r3, #4]
	add r2, r1, #0
	ldr r4, [r0, #0x24]
	mov r1, #0x8f
	ldr r5, [r4, #0x50]
	add r0, r4, #0
	lsl r1, r1, #2
	add r6, r5, #0
	add r0, #0x54
	mul r6, r1
	ldr r1, [r0, r6]
	cmp r1, #0
	bne _02256C18
	add r0, r0, r6
	add r1, r3, #0
	bl ov04_02256D68
	ldr r0, [r4, #0x50]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r4, #0x50]
	pop {r4, r5, r6, pc}
_02256C18:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov04_02256BE4

	thumb_func_start ov04_02256C20
ov04_02256C20: ; 0x02256C20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	mov r2, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl HeapExp_FndInitAllocator
	ldr r4, [sp, #8]
	ldr r6, _02256CFC ; =0x00000101
	mov r5, #0
	add r4, #0x10
_02256C36:
	lsl r0, r5, #4
	ldr r3, [sp, #0xc]
	add r0, r4, r0
	add r1, r6, #0
	add r2, r5, #4
	bl Field3dModel_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02256C36
	mov r0, #0
	str r0, [sp, #0x14]
_02256C52:
	ldr r0, [sp, #8]
	mov r4, #0
	add r2, r0, #0
	str r4, [r0, #0x50]
	mov r1, #0x8f
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r2, #0x54
	mul r1, r0
	add r7, r2, r1
	str r4, [r2, r1]
	str r4, [r7, #4]
	add r6, r7, #0
	ldr r0, [sp, #0x14]
	mov r1, #0x8c
	mul r1, r0
	ldr r0, [sp, #8]
	add r6, #0x1c
	str r0, [sp, #0x1c]
	add r0, #0x10
	str r1, [sp, #0x18]
	add r7, #8
	str r0, [sp, #0x1c]
_02256C80:
	lsl r0, r4, #4
	str r0, [sp, #0x10]
	mov r0, #0x8c
	add r5, r4, #0
	mul r5, r0
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #8]
	add r1, r2, r1
	str r0, [sp, #4]
	ldr r2, _02256CFC ; =0x00000101
	add r0, r7, r5
	add r3, r4, #0
	bl Field3dModelAnimation_LoadFromFilesystem
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	add r0, r6, r5
	add r1, r2, r1
	bl Field3dObject_InitFromModel
	add r0, r6, r5
	add r1, r7, r5
	bl Field3dObject_AddAnimation
	add r0, r7, r5
	mov r1, #0
	bl Field3dModelAnimation_FrameSet
	mov r1, #0
	add r0, sp, #0x20
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	add r0, r6, r0
	bl Field3dObject_SetPosEx
	add r0, r6, r5
	mov r1, #0
	bl Field3dObject_SetActiveFlag
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02256C80
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #3
	blo _02256C52
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02256CFC: .word 0x00000101
	thumb_func_end ov04_02256C20

	thumb_func_start ov04_02256D00
ov04_02256D00: ; 0x02256D00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0x10
_02256D0C:
	lsl r0, r4, #4
	add r0, r5, r0
	bl Field3dModel_Unload
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02256D0C
	mov r0, #0
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	add r0, #0x54
	str r0, [sp, #4]
	mov r7, #0x8c
_02256D2C:
	ldr r1, [sp]
	mov r0, #0x8f
	lsl r0, r0, #2
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #4]
	mov r5, #0
	add r4, r0, r2
	add r4, #8
_02256D3E:
	add r0, r5, #0
	mul r0, r7
	add r0, r4, r0
	add r1, r6, #0
	bl Field3dModelAnimation_Unload
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02256D3E
	ldr r0, [sp]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	cmp r0, #3
	blo _02256D2C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02256D00

	thumb_func_start ov04_02256D68
ov04_02256D68: ; 0x02256D68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r5, #1
	sub r2, #0x40
	add r7, r1, #0
	str r5, [r4]
	cmp r2, #3
	bhi _02256D9A
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02256D86: ; jump table
	.short _02256D8E - _02256D86 - 2 ; case 0
	.short _02256D92 - _02256D86 - 2 ; case 1
	.short _02256D96 - _02256D86 - 2 ; case 2
	.short _02256D98 - _02256D86 - 2 ; case 3
_02256D8E:
	mov r5, #2
	b _02256DA2
_02256D92:
	mov r5, #0
	b _02256DA2
_02256D96:
	mov r5, #3
_02256D98:
	b _02256DA2
_02256D9A:
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02256DA2:
	ldr r0, _02256DF8 ; =ov04_02256DFC
	add r1, r4, #0
	mov r2, #0
	str r5, [r4, #4]
	bl SysTask_CreateOnMainQueue
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r6, r5, #0
	mov r0, #0x8c
	add r5, r4, #0
	mul r6, r0
	add r5, #0x1c
	add r0, r5, r6
	mov r1, #1
	bl Field3dObject_SetActiveFlag
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r7, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0
	bl MapObject_CopyPositionVector
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r5, r6
	bl Field3dObject_SetPosEx
	add r4, #8
	add r0, r4, r6
	mov r1, #0
	bl Field3dModelAnimation_FrameSet
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02256DF8: .word ov04_02256DFC
	thumb_func_end ov04_02256D68

	thumb_func_start ov04_02256DFC
ov04_02256DFC: ; 0x02256DFC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x8c
	add r4, r1, #0
	mul r4, r0
	add r0, r5, #0
	add r0, #8
	add r0, r0, r4
	bl ov04_02256E48
	cmp r0, #0
	beq _02256E3E
	add r0, r5, #0
	add r0, #0x1c
	add r0, r0, r4
	mov r1, #0
	bl Field3dObject_SetActiveFlag
	mov r0, #0
	str r0, [r5]
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl SysTask_Destroy
	mov r0, #0x8e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
_02256E3E:
	add r5, #0x1c
	add r0, r5, r4
	bl Field3dObject_Draw
	pop {r3, r4, r5, pc}
	thumb_func_end ov04_02256DFC

	thumb_func_start ov04_02256E48
ov04_02256E48: ; 0x02256E48
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndCheck
	cmp r0, #0
	beq _02256E5A
	mov r0, #1
	pop {r3, pc}
_02256E5A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov04_02256E48

	thumb_func_start GymmickInit_Sinjoh
GymmickInit_Sinjoh: ; 0x02256E60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl FieldSystem_GetSaveData
	bl Save_GetGymmickPtr
	mov r1, #9
	bl Save_Gymmick_AssertMagic_GetData
	mov r1, #0x8e
	mov r0, #4
	lsl r1, r1, #2
	bl Heap_Alloc
	ldr r1, [r5, #4]
	mov r2, #0x8e
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	lsl r2, r2, #2
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	add r0, r4, #0
	str r5, [r4]
	bl ov04_02256F50
	ldr r0, _02256EAC ; =ov04_02257148
	add r1, r4, #0
	mov r2, #1
	bl SysTask_CreateOnMainQueue
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02256EAC: .word ov04_02257148
	thumb_func_end GymmickInit_Sinjoh

	thumb_func_start GymmickFree_Sinjoh
GymmickFree_Sinjoh: ; 0x02256EB0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl SysTask_Destroy
	add r0, r4, #0
	bl ov04_022570EC
	add r0, r4, #0
	bl Heap_Free
	ldr r0, [r5, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GymmickFree_Sinjoh

	thumb_func_start ov04_02256ED8
ov04_02256ED8: ; 0x02256ED8
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0, #4]
	mov r5, #0
	ldr r4, [r0, #0x24]
	add r7, r5, #0
	add r4, #0x4c
	mov r6, #0xb4
_02256EE6:
	add r0, r5, #0
	mul r0, r6
	add r0, r4, r0
	add r1, r7, #0
	bl Field3dObject_SetActiveFlag
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02256EE6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02256ED8

	thumb_func_start ov04_02256F00
ov04_02256F00: ; 0x02256F00
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r6, r1, #0
	ldr r4, [r0, #0x24]
	cmp r6, #3
	bls _02256F14
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_02256F14:
	add r0, r4, #0
	add r0, #0x4c
	bl Field3dObject_GetActiveFlag
	cmp r0, #0
	bne _02256F24
	bl GF_AssertFail
_02256F24:
	add r0, r5, #0
	bl FieldSystem_GetSaveData
	bl Save_GetGymmickPtr
	mov r1, #9
	bl Save_Gymmick_AssertMagic_GetData
	str r6, [r0]
	mov r0, #0x23
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r5, #0x10]
	ldr r1, _02256F4C ; =ov04_02257308
	add r2, r4, #0
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	nop
_02256F4C: .word ov04_02257308
	thumb_func_end ov04_02256F00

	thumb_func_start ov04_02256F50
ov04_02256F50: ; 0x02256F50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	ldr r3, _022570E0 ; =ov04_02257B28
	str r0, [sp, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x54
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _022570E4 ; =ov04_02257B1C
	add r2, sp, #0x48
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #4
	str r0, [r2]
	ldr r0, [sp, #8]
	mov r2, #0x20
	add r0, r0, #4
	bl HeapExp_FndInitAllocator
	ldr r4, [sp, #8]
	mov r5, #0
	add r4, #0x14
	add r6, sp, #0x48
	mov r7, #0xb4
_02256F88:
	add r0, r5, #0
	lsl r2, r5, #2
	mul r0, r7
	ldr r2, [r6, r2]
	add r0, r4, r0
	mov r1, #0xae
	mov r3, #4
	bl Field3dModel_LoadFromFilesystem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02256F88
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
	add r0, #0x24
	str r0, [sp, #0x18]
_02256FBE:
	ldr r0, [sp, #0x10]
	mov r5, #0
	lsl r1, r0, #3
	add r0, sp, #0x54
	add r6, r0, r1
	ldr r1, [sp, #0x10]
	mov r0, #0xb4
	add r7, r1, #0
	mul r7, r0
	ldr r0, [sp, #0x18]
	add r4, r0, r7
_02256FD4:
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
	blo _02256FD4
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #3
	blo _02256FBE
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	mov r5, #0
	add r4, #0x4c
	add r6, #0x14
	mov r7, #0xb4
_02257014:
	add r1, r5, #0
	mul r1, r7
	add r0, r4, r1
	add r1, r6, r1
	bl Field3dObject_InitFromModel
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02257014
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0x20]
	add r0, #0x24
	str r0, [sp, #0x20]
	add r7, #0x4c
_0225703A:
	ldr r1, [sp, #0xc]
	mov r0, #0xb4
	add r6, r1, #0
	mul r6, r0
	ldr r0, [sp, #0x20]
	mov r5, #0
	add r4, r0, r6
_02257048:
	mov r1, #0x14
	mul r1, r5
	add r0, r7, r6
	add r1, r4, r1
	bl Field3dObject_AddAnimation
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02257048
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #3
	blo _0225703A
	ldr r6, [sp, #8]
	ldr r7, [sp, #8]
	mov r5, #0
	add r6, #0x4c
	add r7, #0x24
_02257076:
	mov r0, #0xb4
	add r4, r5, #0
	mul r4, r0
	add r0, r6, r4
	mov r1, #1
	bl Field3dObject_SetActiveFlag
	add r0, r7, r4
	mov r1, #2
	mov r2, #0
	bl ov04_022572E0
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02257076
	ldr r4, _022570E8 ; =ov04_02257B40
	add r3, sp, #0x24
	mov r2, #4
_0225709E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225709E
	ldr r0, [r4]
	mov r5, #0
	str r0, [r3]
	ldr r0, [sp, #8]
	add r4, sp, #0x24
	add r0, #0x4c
	str r0, [sp, #8]
	mov r7, #0xc
	mov r6, #0xb4
_022570B8:
	add r1, r5, #0
	mul r1, r7
	add r2, r5, #0
	add r3, r4, r1
	ldr r0, [sp, #8]
	mul r2, r6
	add r0, r0, r2
	ldr r2, [r3, #4]
	ldr r1, [r4, r1]
	ldr r3, [r3, #8]
	bl Field3dObject_SetPosEx
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _022570B8
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_022570E0: .word ov04_02257B28
_022570E4: .word ov04_02257B1C
_022570E8: .word ov04_02257B40
	thumb_func_end ov04_02256F50

	thumb_func_start ov04_022570EC
ov04_022570EC: ; 0x022570EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, r6, #0
	str r0, [sp, #0xc]
	add r0, #0x14
	str r0, [sp, #0xc]
	add r0, r6, #0
	str r0, [sp, #8]
	add r0, #0x24
	str r0, [sp, #8]
	mov r7, #0x14
_02257108:
	ldr r1, [sp, #4]
	mov r0, #0xb4
	mul r0, r1
	ldr r1, [sp, #8]
	mov r4, #0
	str r0, [sp]
	add r5, r1, r0
_02257116:
	add r0, r4, #0
	mul r0, r7
	add r0, r5, r0
	add r1, r6, #4
	bl Field3dModelAnimation_Unload
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _02257116
	ldr r1, [sp, #0xc]
	ldr r0, [sp]
	add r0, r1, r0
	bl Field3dModel_Unload
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #3
	blo _02257108
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_022570EC

	thumb_func_start ov04_02257148
ov04_02257148: ; 0x02257148
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r1, sp, #4
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	ldr r0, [r7]
	bl FieldSystem_GetSaveData
	bl Save_GetGymmickPtr
	mov r1, #9
	bl Save_Gymmick_AssertMagic_GetData
	ldr r0, [r0]
	cmp r0, #3
	bhi _0225719A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225717A: ; jump table
	.short _0225719E - _0225717A - 2 ; case 0
	.short _02257182 - _0225717A - 2 ; case 1
	.short _0225718A - _0225717A - 2 ; case 2
	.short _02257192 - _0225717A - 2 ; case 3
_02257182:
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0]
	b _0225719E
_0225718A:
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0, #1]
	b _0225719E
_02257192:
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0, #2]
	b _0225719E
_0225719A:
	bl GF_AssertFail
_0225719E:
	add r4, r7, #0
	mov r5, #0
	add r4, #0x14
	add r6, sp, #4
_022571A6:
	mov r0, #0xb4
	mul r0, r5
	ldrb r2, [r6, r5]
	add r0, r4, r0
	mov r1, #2
	bl ov04_02257240
	str r0, [sp]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _022571A6
	add r4, r7, #0
	mov r5, #0
	add r4, #0x4c
	mov r6, #0xb4
_022571C8:
	add r0, r5, #0
	mul r0, r6
	add r0, r4, r0
	bl Field3dObject_Draw
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _022571C8
	ldr r0, [sp]
	cmp r0, #0
	beq _022571EA
	mov r0, #0x23
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r7, r0]
_022571EA:
	mov r5, #0
	add r6, sp, #8
	add r7, #0x14
_022571F0:
	mov r0, #0xb4
	mul r0, r5
	add r0, r7, r0
	add r0, #0x10
	lsl r4, r5, #2
	bl ov01_021FBF28
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	mov r1, #0x1e
	bl _s32_div_f
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	str r1, [r6, r4]
	cmp r5, #3
	blo _022571F0
	ldr r4, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, r4
	beq _02257228
	bl GF_AssertFail
_02257228:
	ldr r5, [sp, #0x10]
	cmp r4, r5
	beq _02257232
	bl GF_AssertFail
_02257232:
	ldr r0, [sp, #8]
	cmp r5, r0
	beq _0225723C
	bl GF_AssertFail
_0225723C:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02257148

	thumb_func_start ov04_02257240
ov04_02257240: ; 0x02257240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	str r0, [sp]
	str r2, [sp, #8]
	add r0, #0xb0
	ldr r0, [r0]
	mov r6, #0
	cmp r0, #0
	beq _0225725C
	mov r0, #0xf
	lsl r0, r0, #0xe
	str r0, [sp, #0xc]
	b _02257262
_0225725C:
	mov r0, #0x1e
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
_02257262:
	ldr r0, [sp, #4]
	mov r5, #0
	cmp r0, #0
	bls _022572CE
	ldr r4, [sp]
	add r4, #0x10
_0225726E:
	mov r0, #0x14
	add r7, r5, #0
	mul r7, r0
	add r0, r4, r7
	bl ov01_021FBF28
	mov r1, #1
	lsl r1, r1, #0xc
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	cmp r1, r0
	blt _02257294
	cmp r5, #0
	beq _02257292
	cmp r6, #0
	bne _02257292
	bl GF_AssertFail
_02257292:
	mov r6, #1
_02257294:
	mov r1, #1
	add r0, r4, r7
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndLoop
	cmp r6, #0
	beq _022572C2
	ldr r1, [sp]
	ldr r0, [sp, #8]
	add r1, #0xb0
	str r0, [r1]
	ldr r0, [sp]
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _022572BA
	mov r1, #0x1e
	lsl r1, r1, #0xc
	b _022572BC
_022572BA:
	mov r1, #0
_022572BC:
	add r0, r4, r7
	bl Field3dModelAnimation_FrameSet
_022572C2:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp, #4]
	cmp r5, r0
	blo _0225726E
_022572CE:
	cmp r6, #0
	beq _022572D8
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022572D8:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02257240

	thumb_func_start ov04_022572E0
ov04_022572E0: ; 0x022572E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _02257304
_022572EE:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl Field3dModelAnimation_FrameSet
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _022572EE
_02257304:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_022572E0

	thumb_func_start ov04_02257308
ov04_02257308: ; 0x02257308
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	mov r1, #0x23
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02257324
	mov r0, #1
	pop {r4, pc}
_02257324:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov04_02257308

	.rodata

ov04_02257B1C: ; 0x02257B1C
	.byte 0x65, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00

ov04_02257B28: ; 0x02257B28
	.byte 0x66, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x00, 0x00

ov04_02257B40: ; 0x02257B40
	.byte 0x00, 0x80, 0x0C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x80, 0x14, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x80, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x80, 0x08, 0x00
	; 0x02257B80
