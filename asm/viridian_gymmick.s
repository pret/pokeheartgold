#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start InitViridianGymPuzzleGimmick
InitViridianGymPuzzleGimmick: ; 0x02256B64
	push {r4, lr}
	add r4, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #8
	bl SavGymmick_AssertMagic_GetData
	ldr r1, _02256B9C ; =0x00000708
	mov r0, #4
	bl AllocFromHeap
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
	thumb_func_end InitViridianGymPuzzleGimmick

	thumb_func_start DeleteViridianPuzzleGimmick
DeleteViridianPuzzleGimmick: ; 0x02256BA0
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
	bl DestroySysTask
_02256BCA:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _02256BB8
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end DeleteViridianPuzzleGimmick

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
	bl GF_ExpHeap_FndInitAllocator
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
	bl ov01_021FBCD8
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
	bl ov01_021FBE44
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	add r0, r6, r5
	add r1, r2, r1
	bl ov01_021FBF2C
	add r0, r6, r5
	add r1, r7, r5
	bl ov01_021FBF50
	add r0, r7, r5
	mov r1, #0
	bl ov01_021FBF20
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
	bl ov01_021FC00C
	add r0, r6, r5
	mov r1, #0
	bl ov01_021FC004
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
	bl ov01_021FBDA8
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
	bl ov01_021FBE80
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
	bl CreateSysTask
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
	bl ov01_021FC004
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r7, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r5, r6
	bl ov01_021FC00C
	add r4, #8
	add r0, r4, r6
	mov r1, #0
	bl ov01_021FBF20
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
	bl ov01_021FC004
	mov r0, #0
	str r0, [r5]
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl DestroySysTask
	mov r0, #0x8e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
_02256E3E:
	add r5, #0x1c
	add r0, r5, r4
	bl ov01_021FBF68
	pop {r3, r4, r5, pc}
	thumb_func_end ov04_02256DFC

	thumb_func_start ov04_02256E48
ov04_02256E48: ; 0x02256E48
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _02256E5A
	mov r0, #1
	pop {r3, pc}
_02256E5A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov04_02256E48
