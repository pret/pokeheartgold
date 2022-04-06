#include "constants/abilities.h"
#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/items.h"
#include "constants/pokemon.h"
#include "constants/std_script.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov02_02245B80
ov02_02245B80: ; 0x02245B80
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	bl ov02_02245B9C
	add r2, r0, #0
	ldr r1, _02245B98 ; =ov02_02245BC8
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_02245B98: .word ov02_02245BC8
	thumb_func_end ov02_02245B80

	thumb_func_start ov02_02245B9C
ov02_02245B9C: ; 0x02245B9C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0xd0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02245BB4
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02245BB4:
	mov r1, #0
	mov r2, #0xd0
	bl MI_CpuFill8
	str r5, [r4, #4]
	mov r0, #4
	str r0, [r4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_02245B9C

	thumb_func_start ov02_02245BC8
ov02_02245BC8: ; 0x02245BC8
	push {r3, r4, lr}
	sub sp, #0xc
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r1, [r4, #8]
	cmp r1, #4
	bls _02245BDA
	b _02245D06
_02245BDA:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02245BE6: ; jump table
	.short _02245BF0 - _02245BE6 - 2 ; case 0
	.short _02245C06 - _02245BE6 - 2 ; case 1
	.short _02245C98 - _02245BE6 - 2 ; case 2
	.short _02245CB0 - _02245BE6 - 2 ; case 3
	.short _02245CF2 - _02245BE6 - 2 ; case 4
_02245BF0:
	bl ov02_02245D18
	mov r1, #0
	add r0, r4, #0
	strh r1, [r4, #0xa]
	add r0, #0xcc
	str r1, [r0]
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	b _02245D06
_02245C06:
	add r0, #0xcc
	ldr r0, [r0]
	cmp r0, #0xff
	beq _02245C68
	cmp r0, #0
	beq _02245C26
	cmp r0, #0x1e
	beq _02245C26
	cmp r0, #0x32
	beq _02245C26
	cmp r0, #0x3c
	beq _02245C26
	cmp r0, #0x46
	beq _02245C26
	cmp r0, #0x50
	bne _02245C5A
_02245C26:
	ldr r0, _02245D0C ; =SEQ_SE_DP_FW411
	bl PlaySE
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	cmp r0, #0x32
	bne _02245C3C
	ldr r0, _02245D10 ; =SEQ_SE_DP_F207
	bl PlaySE
_02245C3C:
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	cmp r0, #0x3c
	blt _02245C5A
	mov r1, #0xa
	bl _s32_div_f
	add r1, r0, #0
	sub r1, r1, #5
	lsl r1, r1, #0x16
	ldr r0, _02245D0C ; =SEQ_SE_DP_FW411
	asr r1, r1, #0x10
	bl PlaySE_SetPitch
_02245C5A:
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xcc
	str r1, [r0]
_02245C68:
	add r0, r4, #0
	bl ov02_02245DE0
	ldrh r1, [r4, #0xa]
	add r0, r1, #1
	strh r0, [r4, #0xa]
	cmp r1, #0x5a
	blo _02245D06
	mov r0, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _02245D14 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	b _02245D06
_02245C98:
	bl ov02_02245DE0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02245D06
	mov r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	b _02245D06
_02245CB0:
	ldrh r2, [r4, #0xa]
	add r1, r2, #1
	strh r1, [r4, #0xa]
	cmp r2, #0x3c
	blo _02245D06
	bl ov02_02245DB0
	ldr r0, [r4, #4]
	add r0, #0x50
	bl ov01_021EA284
	ldr r0, [r4, #4]
	mov r1, #4
	ldr r0, [r0, #0x48]
	bl ov01_021EA220
	ldr r1, [r4, #4]
	ldr r3, _02245D14 ; =0x00007FFF
	str r0, [r1, #0x50]
	mov r0, #0x12
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	b _02245D06
_02245CF2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02245D06
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_02245D06:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02245D0C: .word SEQ_SE_DP_FW411
_02245D10: .word SEQ_SE_DP_F207
_02245D14: .word 0x00007FFF
	thumb_func_end ov02_02245BC8

	thumb_func_start ov02_02245D18
ov02_02245D18: ; 0x02245D18
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4]
	add r0, #0xbc
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	ldr r3, [r4]
	add r0, #0xc
	mov r1, #0xae
	mov r2, #0
	bl ov01_021FBCD8
	ldr r0, [r4]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xbc
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x1c
	add r1, #0xc
	mov r2, #0xae
	mov r3, #1
	bl ov01_021FBE44
	ldr r0, [r4]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xbc
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x30
	add r1, #0xc
	mov r2, #0xae
	mov r3, #2
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x44
	add r1, #0xc
	bl ov01_021FBF2C
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x44
	add r1, #0x1c
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x44
	add r1, #0x30
	bl ov01_021FBF50
	add r0, r4, #0
	mov r1, #0x22
	mov r3, #0xa
	add r0, #0x44
	lsl r1, r1, #0xe
	mov r2, #0
	lsl r3, r3, #0x10
	bl ov01_021FC00C
	add r4, #0x44
	add r0, r4, #0
	mov r1, #1
	bl ov01_021FC004
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02245D18

	thumb_func_start ov02_02245DB0
ov02_02245DB0: ; 0x02245DB0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x44
	mov r1, #0
	bl ov01_021FC004
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x30
	add r1, #0xbc
	bl ov01_021FBE80
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x1c
	add r1, #0xbc
	bl ov01_021FBE80
	add r4, #0xc
	add r0, r4, #0
	bl ov01_021FBDA8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02245DB0

	thumb_func_start ov02_02245DE0
ov02_02245DE0: ; 0x02245DE0
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	add r0, #0x1c
	lsl r1, r1, #0xc
	bl ov01_021FBEAC
	add r0, r4, #0
	mov r1, #1
	add r0, #0x30
	lsl r1, r1, #0xc
	bl ov01_021FBEAC
	add r4, #0x44
	add r0, r4, #0
	bl ov01_021FBF68
	pop {r4, pc}
	thumb_func_end ov02_02245DE0

	thumb_func_start ov02_02245E04
ov02_02245E04: ; 0x02245E04
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0xa4
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xa4
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xa0
	str r6, [r0]
	add r0, r4, #0
	add r0, #0x8c
	add r1, r6, #0
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	ldrh r1, [r5]
	ldrb r2, [r5, #2]
	add r0, r4, #0
	add r3, r6, #0
	bl ov01_021FBCD8
	add r0, r4, #0
	add r0, #0x10
	add r1, r4, #0
	bl ov01_021FBF2C
	ldrh r1, [r5]
	ldrb r3, [r5, #3]
	ldr r2, [r5, #4]
	add r0, r4, #0
	bl ov02_02245ED8
	add r0, r4, #0
	add r0, #0x10
	mov r1, #1
	bl ov01_021FC004
	add r0, r4, #0
	mov r1, #1
	add r0, #0x9e
	strh r1, [r0]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_02245E04

	thumb_func_start ov02_02245E68
ov02_02245E68: ; 0x02245E68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x10
	mov r1, #0
	bl ov01_021FC004
	add r0, r5, #0
	add r0, #0x9c
	ldrb r0, [r0]
	mov r6, #0
	cmp r0, #0
	ble _02245EB8
	add r0, r5, #0
	add r7, r5, #0
	str r0, [sp]
	add r0, #0x8c
	add r4, r6, #0
	add r7, #0x10
	str r0, [sp]
_02245E8E:
	add r1, r5, #0
	add r1, #0x88
	ldr r1, [r1]
	add r0, r7, #0
	add r1, r1, r4
	bl ov01_021FBF5C
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r1, [sp]
	add r0, r0, r4
	bl ov01_021FBE80
	add r0, r5, #0
	add r0, #0x9c
	ldrb r0, [r0]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _02245E8E
_02245EB8:
	add r0, r5, #0
	mov r1, #0
	add r0, #0x9c
	strb r1, [r0]
	add r0, r5, #0
	bl ov01_021FBDA8
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02245E68

	thumb_func_start ov02_02245ED8
ov02_02245ED8: ; 0x02245ED8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	str r3, [sp, #0xc]
	add r0, #0x9c
	ldrb r0, [r0]
	add r7, r2, #0
	str r1, [sp, #8]
	cmp r0, #0
	beq _02245F38
	mov r6, #0
	cmp r0, #0
	ble _02245F2E
	add r0, r5, #0
	str r0, [sp, #0x10]
	add r0, #0x10
	str r0, [sp, #0x10]
	add r0, r5, #0
	str r0, [sp, #0x14]
	add r0, #0x8c
	add r4, r6, #0
	str r0, [sp, #0x14]
_02245F04:
	add r1, r5, #0
	add r1, #0x88
	ldr r1, [r1]
	ldr r0, [sp, #0x10]
	add r1, r1, r4
	bl ov01_021FBF5C
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	add r0, r0, r4
	bl ov01_021FBE80
	add r0, r5, #0
	add r0, #0x9c
	ldrb r0, [r0]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _02245F04
_02245F2E:
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	bl FreeToHeap
_02245F38:
	add r1, r5, #0
	ldr r0, [sp, #0xc]
	add r1, #0x9c
	strb r0, [r1]
	add r1, r5, #0
	add r1, #0x9c
	add r0, r5, #0
	ldrb r2, [r1]
	add r0, #0xa0
	mov r1, #0x14
	ldr r0, [r0]
	mul r1, r2
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0x88
	str r0, [r1]
	add r2, r5, #0
	add r2, #0x9c
	add r0, r5, #0
	ldrb r3, [r2]
	add r0, #0x88
	mov r2, #0x14
	ldr r0, [r0]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x9c
	ldrb r0, [r0]
	mov r6, #0
	cmp r0, #0
	ble _02245FCA
	add r0, r5, #0
	str r0, [sp, #0x18]
	add r0, #0x8c
	str r0, [sp, #0x18]
	add r0, r5, #0
	str r0, [sp, #0x1c]
	add r0, #0x10
	add r4, r6, #0
	str r0, [sp, #0x1c]
_02245F8E:
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r2, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	ldrh r3, [r7]
	add r0, r0, r4
	bl ov01_021FBE44
	add r1, r5, #0
	add r1, #0x88
	ldr r1, [r1]
	ldr r0, [sp, #0x1c]
	add r1, r1, r4
	bl ov01_021FBF50
	add r0, r5, #0
	add r0, #0x9c
	ldrb r0, [r0]
	add r6, r6, #1
	add r7, r7, #2
	add r4, #0x14
	cmp r6, r0
	blt _02245F8E
_02245FCA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02245ED8

	thumb_func_start ov02_02245FD0
ov02_02245FD0: ; 0x02245FD0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x9c
	ldrb r0, [r0]
	mov r7, #0
	add r6, r7, #0
	cmp r0, #0
	ble _0224602E
	add r4, r7, #0
_02245FE2:
	add r0, r5, #0
	add r0, #0x9e
	ldrh r0, [r0]
	cmp r0, #0
	beq _02245FFE
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224600C
_02245FFE:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224600C:
	bl _ffix
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	add r0, r0, r4
	bl ov01_021FBEE4
	add r7, r7, r0
	add r0, r5, #0
	add r0, #0x9c
	ldrb r0, [r0]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _02245FE2
_0224602E:
	add r0, r5, #0
	add r0, #0x10
	bl ov01_021FBF68
	add r5, #0x9c
	ldrb r0, [r5]
	cmp r7, r0
	bne _02246042
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02246042:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02245FD0

	thumb_func_start ov02_02246048
ov02_02246048: ; 0x02246048
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x9c
	ldrb r0, [r0]
	mov r4, #0
	cmp r0, #0
	ble _022460A2
	mov r7, #0x3f
	add r6, r4, #0
	lsl r7, r7, #0x18
_0224605C:
	add r0, r5, #0
	add r0, #0x9e
	ldrh r0, [r0]
	cmp r0, #0
	beq _02246076
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	b _02246082
_02246076:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r7, #0
	bl _fsub
_02246082:
	bl _ffix
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	add r0, r0, r6
	bl ov01_021FBEAC
	add r0, r5, #0
	add r0, #0x9c
	ldrb r0, [r0]
	add r4, r4, #1
	add r6, #0x14
	cmp r4, r0
	blt _0224605C
_022460A2:
	add r5, #0x10
	add r0, r5, #0
	bl ov01_021FBF68
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02246048

	thumb_func_start ov02_022460AC
ov02_022460AC: ; 0x022460AC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl TaskManager_GetSys
	add r1, r4, #0
	bl ov02_022460CC
	add r2, r0, #0
	ldr r1, _022460C8 ; =ov02_022460FC
	add r0, r5, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022460C8: .word ov02_022460FC
	thumb_func_end ov02_022460AC

	thumb_func_start ov02_022460CC
ov02_022460CC: ; 0x022460CC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	bne _022460E6
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_022460E6:
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	str r5, [r4, #4]
	strh r6, [r4, #0x10]
	mov r0, #4
	str r0, [r4]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_022460CC

	thumb_func_start ov02_022460FC
ov02_022460FC: ; 0x022460FC
	push {r3, r4, lr}
	sub sp, #0xc
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	beq _02246116
	cmp r0, #1
	beq _02246158
	cmp r0, #2
	beq _0224616A
	b _0224617C
_02246116:
	ldrh r1, [r4, #0x10]
	mov r0, #0xc
	ldr r2, _02246184 ; =ov02_02253264
	mul r0, r1
	ldr r1, [r4]
	add r0, r2, r0
	bl ov02_02245E04
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r1, sp, #0
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetPositionVec
	ldr r0, [r4, #8]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, #0x10
	bl ov01_021FC00C
	ldrh r1, [r4, #0x10]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _02246188 ; =ov02_02253264 + 8
	ldrh r0, [r0, r2]
	bl PlaySE
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0224617C
_02246158:
	ldr r0, [r4, #8]
	bl ov02_02245FD0
	cmp r0, #0
	beq _0224617C
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _0224617C
_0224616A:
	ldr r0, [r4, #8]
	bl ov02_02245E68
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0224617C:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02246184: .word ov02_02253264
_02246188: .word ov02_02253264 + 8
	thumb_func_end ov02_022460FC

	thumb_func_start ov02_0224618C
ov02_0224618C: ; 0x0224618C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl TaskManager_GetSys
	add r1, r4, #0
	bl ov02_022461AC
	add r2, r0, #0
	ldr r1, _022461A8 ; =ov02_022461DC
	add r0, r5, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022461A8: .word ov02_022461DC
	thumb_func_end ov02_0224618C

	thumb_func_start ov02_022461AC
ov02_022461AC: ; 0x022461AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	bne _022461C6
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_022461C6:
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	str r5, [r4, #4]
	strb r6, [r4, #0x10]
	mov r0, #4
	str r0, [r4]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_022461AC

	thumb_func_start ov02_022461DC
ov02_022461DC: ; 0x022461DC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r4, #0x12]
	cmp r0, #4
	bhi _022462C0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022461FA: ; jump table
	.short _02246204 - _022461FA - 2 ; case 0
	.short _0224623A - _022461FA - 2 ; case 1
	.short _02246276 - _022461FA - 2 ; case 2
	.short _02246282 - _022461FA - 2 ; case 3
	.short _022462A4 - _022461FA - 2 ; case 4
_02246204:
	ldrb r0, [r4, #0x10]
	ldr r1, _022462C8 ; =ov02_02253254
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r1, [r4]
	bl ov02_02245E04
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r1, sp, #0
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetPositionVec
	ldr r0, [r4, #8]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, #0x10
	bl ov01_021FC00C
	ldr r0, _022462CC ; =SEQ_SE_GS_STOPPERKAIJO
	bl PlaySE
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	b _022462C0
_0224623A:
	ldr r0, [r4, #8]
	bl ov02_02245FD0
	cmp r0, #0
	beq _022462C0
	ldrb r2, [r4, #0x10]
	ldr r0, [r4, #8]
	mov r1, #0xae
	lsl r3, r2, #3
	ldr r2, _022462D0 ; =ov02_02253D80
	ldr r2, [r2, r3]
	mov r3, #3
	bl ov02_02245ED8
	ldr r0, _022462D4 ; =ov02_022462DC
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	mov r2, #0
	str r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl QueueScript
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
	b _022462C0
_02246276:
	ldr r0, [r4, #0xc]
	bl DestroySysTask
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
_02246282:
	ldr r0, [r4, #8]
	bl ov02_02245FD0
	cmp r0, #0
	beq _022462C0
	ldrb r2, [r4, #0x10]
	ldr r0, [r4, #8]
	mov r1, #0xae
	lsl r3, r2, #3
	ldr r2, _022462D8 ; =ov02_02253D84
	ldr r2, [r2, r3]
	mov r3, #3
	bl ov02_02245ED8
	ldrh r0, [r4, #0x12]
	add r0, r0, #1
	strh r0, [r4, #0x12]
_022462A4:
	ldr r0, [r4, #8]
	bl ov02_02245FD0
	cmp r0, #0
	beq _022462C0
	ldr r0, [r4, #8]
	bl ov02_02245E68
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_022462C0:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022462C8: .word ov02_02253254
_022462CC: .word SEQ_SE_GS_STOPPERKAIJO
_022462D0: .word ov02_02253D80
_022462D4: .word ov02_022462DC
_022462D8: .word ov02_02253D84
	thumb_func_end ov02_022461DC

	thumb_func_start ov02_022462DC
ov02_022462DC: ; 0x022462DC
	ldr r3, _022462E4 ; =ov02_02246048
	ldr r0, [r1, #8]
	bx r3
	nop
_022462E4: .word ov02_02246048
	thumb_func_end ov02_022462DC

	thumb_func_start ov02_022462E8
ov02_022462E8: ; 0x022462E8
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	bl ov02_02246304
	add r2, r0, #0
	ldr r1, _02246300 ; =ov02_02246330
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_02246300: .word ov02_02246330
	thumb_func_end ov02_022462E8

	thumb_func_start ov02_02246304
ov02_02246304: ; 0x02246304
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	bne _0224631C
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224631C:
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	str r5, [r4, #4]
	mov r0, #4
	str r0, [r4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_02246304

	thumb_func_start ov02_02246330
ov02_02246330: ; 0x02246330
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _02246348
	cmp r1, #1
	beq _0224635A
	cmp r1, #2
	beq _02246374
	b _0224638E
_02246348:
	bl ov02_02246398
	ldr r0, _02246394 ; =SEQ_SE_GS_AJITO_SIREN
	bl PlaySE
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0224638E
_0224635A:
	bl ov02_02246490
	cmp r0, #0
	beq _0224638E
	ldrb r1, [r4, #0xc]
	add r0, r1, #1
	strb r0, [r4, #0xc]
	cmp r1, #1
	blo _0224638E
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _0224638E
_02246374:
	ldr r0, _02246394 ; =SEQ_SE_GS_AJITO_SIREN
	bl IsSEPlaying
	cmp r0, #0
	bne _0224638E
	add r0, r4, #0
	bl ov02_02246444
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_0224638E:
	mov r0, #0
	pop {r4, pc}
	nop
_02246394: .word SEQ_SE_GS_AJITO_SIREN
	thumb_func_end ov02_02246330

	thumb_func_start ov02_02246398
ov02_02246398: ; 0x02246398
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	strb r0, [r5, #0xd]
	ldrb r3, [r5, #0xd]
	mov r0, #0x1f
	mov r1, #2
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _02246440 ; =0x04000050
	mov r2, #5
	bl G2x_SetBlendAlpha_
	ldr r1, [r5]
	mov r0, #0xae
	bl NARC_ctor
	mov r1, #0x20
	str r1, [sp]
	ldr r1, [r5]
	mov r2, #0
	str r1, [sp, #4]
	mov r1, #0xc
	add r3, r2, #0
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0
	str r1, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xd
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, r4, #0
	ldr r2, [r2, #8]
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xe
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, r4, #0
	ldr r2, [r2, #8]
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5, #4]
	mov r1, #0
	ldr r0, [r0, #8]
	bl GetBgPriority
	strb r0, [r5, #0xe]
	ldr r0, [r5, #4]
	mov r1, #1
	ldr r0, [r0, #8]
	bl GetBgPriority
	strb r0, [r5, #0xf]
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02246440: .word 0x04000050
	thumb_func_end ov02_02246398

	thumb_func_start ov02_02246444
ov02_02246444: ; 0x02246444
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldrb r1, [r4, #0xe]
	mov r0, #0
	bl SetBgPriority
	ldrb r1, [r4, #0xf]
	mov r0, #1
	bl SetBgPriority
	ldr r0, [r4, #4]
	mov r1, #1
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x40
	mov r2, #0
	bl BG_ClearCharDataRange
	mov r1, #0
	ldr r0, _0224648C ; =0x04000050
	add r2, r1, #0
	mov r3, #0x1f
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
	nop
_0224648C: .word 0x04000050
	thumb_func_end ov02_02246444

	thumb_func_start ov02_02246490
ov02_02246490: ; 0x02246490
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _022464A2
	cmp r0, #1
	beq _022464B2
	b _022464F4
_022464A2:
	mov r0, #0
	strb r0, [r4, #0xb]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	b _02246502
_022464B2:
	ldrb r1, [r4, #0xb]
	add r0, r1, #1
	strb r0, [r4, #0xb]
	cmp r1, #0
	bne _02246502
	ldrb r3, [r4, #0xd]
	mov r0, #0x1f
	mov r1, #2
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _02246508 ; =0x04000050
	mov r2, #5
	bl G2x_SetBlendAlpha_
	ldrb r1, [r4, #0xa]
	add r0, r1, #1
	strb r0, [r4, #0xa]
	cmp r1, #0xc
	ldrb r0, [r4, #0xd]
	bhs _022464DE
	add r0, r0, #1
	b _022464E0
_022464DE:
	sub r0, r0, #1
_022464E0:
	strb r0, [r4, #0xd]
	mov r0, #0
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xa]
	cmp r0, #0x18
	bls _02246502
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	b _02246502
_022464F4:
	mov r0, #0
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	strb r0, [r4, #9]
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_02246502:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02246508: .word 0x04000050
	thumb_func_end ov02_02246490

	thumb_func_start ov02_0224650C
ov02_0224650C: ; 0x0224650C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x38
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x38
	bl MI_CpuFill8
	str r6, [r4]
	add r0, r6, #0
	str r5, [r4, #4]
	bl GF_Camera_Create
	str r0, [r4, #0x18]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224650C

	thumb_func_start ov02_02246534
ov02_02246534: ; 0x02246534
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl sub_02023120
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02246534

	thumb_func_start ov02_02246548
ov02_02246548: ; 0x02246548
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r1, #0
	ble _02246568
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02246576
_02246568:
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02246576:
	bl _ffix
	strh r0, [r5, #8]
	cmp r4, #0
	ble _02246592
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022465A0
_02246592:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022465A0:
	bl _ffix
	strh r0, [r5, #0xa]
	strh r6, [r5, #0xe]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	strh r0, [r5, #0x12]
	mov r0, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	cmp r0, #0
	beq _022465CA
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022465D8
_022465CA:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022465D8:
	bl _ffix
	add r1, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #0xe
	bl FX_Div
	str r0, [r5, #0x14]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x18]
	ldr r0, [r0, #0x24]
	bl sub_02023128
	ldr r1, [r5, #0x18]
	add r0, sp, #0
	bl GF_Camera_GetTarget
	add r4, sp, #0
	add r3, r5, #0
	add r3, #0x20
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r4, r2, #0
	str r0, [r3]
	add r3, r5, #0
	ldmia r4!, {r0, r1}
	add r3, #0x2c
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r1, [r5, #0x18]
	add r0, r2, #0
	bl sub_02023214
	ldr r0, [r5, #0x18]
	bl GF_Camera_RegisterToStaticPtr
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_02246548

	thumb_func_start ov02_0224662C
ov02_0224662C: ; 0x0224662C
	mov r1, #0
	strh r1, [r0, #0x10]
	ldr r0, [r0, #4]
	ldr r3, _02246638 ; =sub_0202313C
	ldr r0, [r0, #0x24]
	bx r3
	.balign 4, 0
_02246638: .word GF_Camera_RegisterToStaticPtr
	thumb_func_end ov02_0224662C

	thumb_func_start ov02_0224663C
ov02_0224663C: ; 0x0224663C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r2, [r5, #0x10]
	add r0, #0x10
	add r1, r2, #1
	strh r1, [r5, #0x10]
	cmp r2, #0
	ldrh r2, [r5, #0x10]
	beq _02246666
	ldrh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	lsl r0, r2, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224667A
_02246666:
	ldrh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	lsl r0, r2, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224667A:
	bl _ffix
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	asr r3, r2, #0x1f
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	bl GF_SinDegFX32
	mov r2, #8
	ldrsh r2, [r5, r2]
	add r4, r0, #0
	asr r6, r4, #0x1f
	add r1, r6, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	add r3, r1, #0
	mov r7, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r3, r7
	ldr r1, [r5, #0x2c]
	lsl r2, r3, #0x14
	lsr r0, r0, #0xc
	orr r0, r2
	add r0, r1, r0
	str r0, [r5, #0x20]
	mov r2, #0xa
	ldrsh r2, [r5, r2]
	add r0, r4, #0
	add r1, r6, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r4, #2
	add r3, r7, #0
	lsl r4, r4, #0xa
	add r4, r0, r4
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r4, #0xc
	ldr r2, [r5, #0x30]
	orr r1, r0
	add r0, r2, r1
	str r0, [r5, #0x24]
	ldrh r1, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	cmp r1, r0
	bhs _022466F8
	add r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
_022466F8:
	ldr r0, [r5, #0x2c]
	str r0, [r5, #0x20]
	ldr r0, [r5, #0x30]
	str r0, [r5, #0x24]
	strh r3, [r5, #0x10]
	ldrh r0, [r5, #0xe]
	sub r0, r0, #1
	strh r0, [r5, #0xe]
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	bne _02246710
	mov r3, #1
_02246710:
	add r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224663C

	thumb_func_start ov02_02246714
ov02_02246714: ; 0x02246714
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl TaskManager_GetSys
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r2, r6, #0
	add r3, r7, #0
	str r1, [sp]
	add r1, r4, #0
	bl ov02_02246744
	add r2, r0, #0
	ldr r1, _02246740 ; =ov02_02246798
	add r0, r5, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02246740: .word ov02_02246798
	thumb_func_end ov02_02246714

	thumb_func_start ov02_02246744
ov02_02246744: ; 0x02246744
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0xc
	add r7, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	bne _02246766
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246766:
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	str r5, [r4, #4]
	mov r1, #4
	str r1, [r4]
	ldr r0, [r4, #4]
	bl ov02_0224650C
	str r0, [r4, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	lsl r1, r6, #0x10
	lsl r2, r7, #0x10
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r3, [sp, #4]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov02_02246548
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02246744

	thumb_func_start ov02_02246798
ov02_02246798: ; 0x02246798
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl ov02_0224663C
	cmp r0, #0
	bne _022467AE
	mov r0, #0
	pop {r4, pc}
_022467AE:
	ldr r0, [r4, #8]
	bl ov02_0224662C
	ldr r0, [r4, #8]
	bl ov02_02246534
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov02_02246798

	thumb_func_start ov02_022467C4
ov02_022467C4: ; 0x022467C4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl TaskManager_GetSys
	lsl r1, r5, #0x18
	lsr r1, r1, #0x18
	bl ov02_022467E8
	add r2, r0, #0
	ldr r1, _022467E4 ; =ov02_02246818
	add r0, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	nop
_022467E4: .word ov02_02246818
	thumb_func_end ov02_022467C4

	thumb_func_start ov02_022467E8
ov02_022467E8: ; 0x022467E8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x1c
	bl AllocFromHeap
	add r4, r0, #0
	bne _02246802
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02246802:
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	str r5, [r4, #4]
	strb r6, [r4, #0x19]
	mov r0, #4
	str r0, [r4]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_022467E8

	thumb_func_start ov02_02246818
ov02_02246818: ; 0x02246818
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4, #0x18]
	cmp r1, #0
	beq _0224682C
	cmp r1, #1
	beq _0224683E
	b _02246862
_0224682C:
	bl ov02_0224686C
	ldr r0, _02246868 ; =0x000005DC
	bl PlaySE
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _02246862
_0224683E:
	bl ov02_022469A0
	cmp r0, #0
	beq _02246862
	ldr r0, _02246868 ; =0x000005DC
	bl PlaySE
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	add r0, r4, #0
	bl ov02_02246964
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_02246862:
	mov r0, #0
	pop {r4, pc}
	nop
_02246868: .word 0x000005DC
	thumb_func_end ov02_02246818

	thumb_func_start ov02_0224686C
ov02_0224686C: ; 0x0224686C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xae
	bl NARC_ctor
	mov r1, #0x20
	str r1, [sp]
	ldr r1, [r5]
	mov r2, #0
	str r1, [sp, #4]
	mov r1, #0xf
	add r3, r2, #0
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x10
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, r4, #0
	ldr r2, [r2, #8]
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x11
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, r4, #0
	ldr r2, [r2, #8]
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5, #4]
	mov r1, #1
	ldr r0, [r0, #8]
	bl GetBgPriority
	strb r0, [r5, #0x1a]
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl NARC_dtor
	ldr r0, [r5, #4]
	add r1, r5, #0
	ldr r0, [r0, #8]
	ldr r2, _0224695C ; =ov02_0225324C
	add r1, #8
	bl AddWindow
	add r0, r5, #0
	add r0, #8
	mov r1, #9
	bl FillWindowPixelBuffer
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc6
	bl NewMsgDataFromNarc
	ldrb r1, [r5, #0x19]
	add r4, r0, #0
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #3
	add r1, r7, #0
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r6, r0, #0x18
	mov r3, #0x70
	sub r6, r3, r6
	lsr r3, r6, #0x1f
	add r3, r6, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02246960 ; =0x000F0E09
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	add r0, #8
	mov r1, #3
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	add r5, #8
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	bl DestroyMsgData
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224695C: .word ov02_0225324C
_02246960: .word 0x000F0E09
	thumb_func_end ov02_0224686C

	thumb_func_start ov02_02246964
ov02_02246964: ; 0x02246964
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldrb r1, [r4, #0x1a]
	mov r0, #1
	bl SetBgPriority
	add r0, r4, #0
	add r0, #8
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #8
	bl RemoveWindow
	ldr r0, [r4, #4]
	mov r1, #1
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	ldr r3, [r4]
	lsl r1, r0, #0xc
	mov r2, #0
	bl BG_ClearCharDataRange
	pop {r4, pc}
	thumb_func_end ov02_02246964

	thumb_func_start ov02_022469A0
ov02_022469A0: ; 0x022469A0
	ldr r0, _022469B0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r1, r0
	bne _022469AC
	mov r0, #0
_022469AC:
	bx lr
	nop
_022469B0: .word gSystem
	thumb_func_end ov02_022469A0

	thumb_func_start ov02_022469B4
ov02_022469B4: ; 0x022469B4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	bl TaskManager_GetSys
	add r1, r4, #0
	add r2, r6, #0
	bl ov02_022469D8
	add r2, r0, #0
	ldr r1, _022469D4 ; =ov02_02246A34
	add r0, r5, #0
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022469D4: .word ov02_02246A34
	thumb_func_end ov02_022469B4

	thumb_func_start ov02_022469D8
ov02_022469D8: ; 0x022469D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x1c
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _022469F8
	bl GF_AssertFail
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022469F8:
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	str r5, [r4, #8]
	str r6, [r4, #0x10]
	str r7, [r4, #0x14]
	mov r0, #4
	str r0, [r4]
	bl AllocMonZeroed
	str r0, [r4, #0xc]
	bl ZeroMonData
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	mov r1, #0x95
	mov r2, #0x64
	mov r3, #0x20
	bl CreateMon
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_022469D8

	thumb_func_start ov02_02246A34
ov02_02246A34: ; 0x02246A34
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246A48
	cmp r0, #1
	beq _02246A5E
	b _02246A7E
_02246A48:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x14]
	bl ov02_022494C4
	str r0, [r4, #0x18]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02246A7E
_02246A5E:
	ldr r0, [r4, #0x18]
	bl ov02_0224953C
	cmp r0, #0
	beq _02246A7E
	ldr r0, [r4, #0x18]
	bl ov02_02249548
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_02246A7E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02246A34

	thumb_func_start ov02_02246A84
ov02_02246A84: ; 0x02246A84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl GF_RTC_GetTimeOfDay
	cmp r0, #0
	bne _02246A98
	add r3, r5, #0
	add r3, #0x14
	b _02246AB8
_02246A98:
	sub r1, r0, #1
	cmp r1, #1
	bhi _02246AA4
	add r3, r5, #0
	add r3, #0x2c
	b _02246AB8
_02246AA4:
	sub r0, r0, #3
	cmp r0, #1
	bhi _02246AB0
	add r3, r5, #0
	add r3, #0x44
	b _02246AB8
_02246AB0:
	bl GF_AssertFail
	add r3, r5, #0
	add r3, #0x14
_02246AB8:
	mov r2, #0
_02246ABA:
	ldrh r0, [r3]
	add r1, r5, r2
	add r2, r2, #1
	str r0, [r4]
	ldrb r0, [r1, #8]
	add r3, r3, #2
	strh r0, [r4, #4]
	ldrb r0, [r1, #8]
	strh r0, [r4, #6]
	add r4, #8
	cmp r2, #0xc
	blt _02246ABA
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02246A84

	thumb_func_start ov02_02246AD4
ov02_02246AD4: ; 0x02246AD4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl GF_RTC_GetTimeOfDay
	sub r0, r0, #3
	cmp r0, #1
	bhi _02246AFC
	cmp r4, #1
	bne _02246AF2
	add r5, #0xc0
	ldrh r0, [r5]
	str r0, [r6, #0x18]
	pop {r4, r5, r6, pc}
_02246AF2:
	cmp r4, #2
	bne _02246AFC
	add r5, #0xc0
	ldrh r0, [r5]
	str r0, [r6, #8]
_02246AFC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_02246AD4

	thumb_func_start ov02_02246B00
ov02_02246B00: ; 0x02246B00
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl ov02_022522B4
	cmp r0, #3
	bne _02246B2E
	add r0, r5, #0
	add r0, #0x5c
	ldrh r0, [r0]
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r0, #0x5c
	ldrh r0, [r0]
	str r0, [r4, #0x18]
	add r0, r5, #0
	add r0, #0x5e
	ldrh r0, [r0]
	add r5, #0x5e
	str r0, [r4, #0x20]
	ldrh r0, [r5]
	str r0, [r4, #0x28]
	pop {r3, r4, r5, pc}
_02246B2E:
	bl ov02_022522B4
	cmp r0, #4
	bne _02246B54
	add r0, r5, #0
	add r0, #0x60
	ldrh r0, [r0]
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r0, #0x60
	ldrh r0, [r0]
	str r0, [r4, #0x18]
	add r0, r5, #0
	add r0, #0x62
	ldrh r0, [r0]
	add r5, #0x62
	str r0, [r4, #0x20]
	ldrh r0, [r5]
	str r0, [r4, #0x28]
_02246B54:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_02246B00

	thumb_func_start ov02_02246B58
ov02_02246B58: ; 0x02246B58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl Save_Roamers_get
	str r0, [sp]
	bl RoamerSave_OutbreakActive
	cmp r0, #0
	beq _02246B9A
	ldr r0, [sp]
	mov r1, #2
	bl Roamers_GetRand
	ldr r1, [r5, #0x20]
	mov r2, #0
	ldr r1, [r1]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02097F6C
	cmp r0, #0
	beq _02246B9A
	add r0, r4, #0
	add r0, #0xbc
	ldrh r0, [r0]
	add r4, #0xbc
	str r0, [r6]
	ldrh r0, [r4]
	str r0, [r7]
_02246B9A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02246B58

	thumb_func_start ov02_02246B9C
ov02_02246B9C: ; 0x02246B9C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	add r6, r2, #0
	bl Save_Roamers_get
	add r7, r0, #0
	bl RoamerSave_OutbreakActive
	cmp r0, #0
	beq _02246BD4
	add r0, r7, #0
	mov r1, #2
	bl Roamers_GetRand
	ldr r1, [r5, #0x20]
	mov r2, #1
	ldr r1, [r1]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02097F6C
	cmp r0, #0
	beq _02246BD4
	add r4, #0xbe
	ldrh r0, [r4]
	str r0, [r6]
_02246BD4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02246B9C

	thumb_func_start ov02_02246BD8
ov02_02246BD8: ; 0x02246BD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r6, r0, #0
	ldr r0, [r6, #0xc]
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl Save_Roamers_get
	str r0, [sp]
	bl RoamerSave_OutbreakActive
	cmp r0, #0
	beq _02246C7A
	ldr r0, [sp]
	mov r1, #2
	bl Roamers_GetRand
	ldr r1, [r6, #0x20]
	mov r2, #2
	ldr r1, [r1]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02097F6C
	cmp r0, #0
	beq _02246C7A
	ldr r0, _02246C80 ; =ov02_02253290
	add r2, sp, #0x20
	ldr r0, [r0]
	ldr r6, _02246C84 ; =ov02_02253294
	str r0, [sp, #8]
	ldmia r6!, {r0, r1}
	str r2, [sp, #4]
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	add r6, sp, #0xc
	str r0, [r2]
	ldr r2, _02246C88 ; =ov02_022532A0
	mov ip, r6
	ldmia r2!, {r0, r1}
	stmia r6!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r6!, {r0, r1}
	ldr r0, [r2]
	add r3, sp, #8
	str r0, [r6]
	cmp r7, #0
	beq _02246C44
	cmp r7, #1
	beq _02246C48
	cmp r7, #2
	beq _02246C4E
	b _02246C54
_02246C44:
	mov r1, #1
	b _02246C5C
_02246C48:
	mov r1, #3
	ldr r3, [sp, #4]
	b _02246C5C
_02246C4E:
	mov r1, #5
	mov r3, ip
	b _02246C5C
_02246C54:
	bl GF_AssertFail
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02246C5C:
	mov r2, #0
	cmp r1, #0
	bls _02246C7A
_02246C62:
	add r0, r5, #0
	add r0, #0xc2
	lsl r6, r2, #2
	ldr r6, [r3, r6]
	ldrh r0, [r0]
	lsl r6, r6, #3
	str r0, [r4, r6]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, r1
	blo _02246C62
_02246C7A:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02246C80: .word ov02_02253290
_02246C84: .word ov02_02253294
_02246C88: .word ov02_022532A0
	thumb_func_end ov02_02246BD8

	thumb_func_start ov02_02246C8C
ov02_02246C8C: ; 0x02246C8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa0
	add r5, r0, #0
	add r0, #0x7e
	ldrh r0, [r0]
	cmp r0, #3
	bhi _02246CA0
	add sp, #0xa0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246CA0:
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetMetatileBehaviorAt
	add r7, r0, #0
	add r2, sp, #0x18
	add r0, r5, #0
	add r1, r7, #0
	add r2, #1
	bl ov02_0224762C
	add r1, sp, #0x18
	strb r0, [r1]
	ldrb r0, [r1]
	cmp r0, #0
	bne _02246CD6
	add sp, #0xa0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246CD6:
	add r0, r5, #0
	bl ov02_02248698
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r6, r0, #0
	add r0, r5, #0
	bl MapEvents_GetLoadedEncTable
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	add r3, sp, #0x24
	bl ov02_02248618
	ldr r0, [r5, #0xc]
	bl Save_Roamers_get
	bl RoamerSave_RepelNotInUse
	cmp r0, #0
	bne _02246D26
	add r0, r6, #0
	bl GetFirstAliveMonInParty_CrashIfNone
	mov r1, #1
	str r1, [sp, #0x28]
	mov r1, #MON_DATA_LEVEL
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #0x18]
_02246D26:
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetWeatherType
	add r3, r0, #0
	ldr r0, [sp, #0x10]
	add r1, sp, #0x18
	str r0, [sp]
	ldrb r1, [r1]
	mov r0, #0
	add r2, sp, #0x24
	bl ov02_02248190
	add r1, sp, #0x18
	strb r0, [r1]
	add r0, r5, #0
	add r1, sp, #0x18
	bl ApplyFluteEffectToEncounterRate
	ldr r0, [sp, #0x10]
	add r1, sp, #0x18
	bl ApplyLeadMonHeldItemEffectToEncounterRate
	add r1, sp, #0x18
	ldrb r1, [r1]
	add r0, r5, #0
	add r2, r7, #0
	bl ov02_02247568
	cmp r0, #0
	beq _02246D6A
	mov r7, #1
	b _02246D6C
_02246D6A:
	mov r7, #0
_02246D6C:
	cmp r7, #0
	bne _02246D76
	add sp, #0xa0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246D76:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #0
	beq _02246D88
	mov r6, #1
	b _02246D8A
_02246D88:
	mov r6, #0
_02246D8A:
	cmp r6, #0
	bne _02246DE0
	add r0, r5, #0
	add r1, sp, #0x1c
	bl ov02_GetRandomActiveRoamerInCurrMap
	cmp r0, #0
	beq _02246DE0
	ldr r0, [sp, #0x1c]
	mov r1, #6
	bl GetRoamerData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, sp, #0x24
	bl ov02_02248290
	cmp r0, #0
	bne _02246DDA
	mov r0, #0xb
	add r1, r0, #0
	add r1, #0xf5
	bl BattleStruct_new
	str r0, [sp, #0x20]
	add r1, r5, #0
	bl BattleStruct_InitFromFsys
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	bl ov02_022482BC
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl sub_02050B08
	add sp, #0xa0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02246DDA:
	add sp, #0xa0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246DE0:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	str r0, [sp, #0x14]
	bl ScriptState_CheckSafariSysFlag
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	bl CheckFlag996
	str r0, [sp, #8]
	cmp r6, #0
	bne _02246E18
	ldr r0, [sp, #0xc]
	mov r1, #0
	cmp r0, #0
	beq _02246E06
	mov r1, #1
	b _02246E0E
_02246E06:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02246E0E
	mov r1, #2
_02246E0E:
	add r0, r5, #0
	add r2, sp, #0x20
	bl ov02_02248244
	b _02246E22
_02246E18:
	mov r0, #0xb
	mov r1, #0x4a
	bl BattleStruct_new
	str r0, [sp, #0x20]
_02246E22:
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	bl BattleStruct_InitFromFsys
	add r0, sp, #0x18
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _02246ECA
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov02_02246A84
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x40
	add r3, sp, #0x48
	bl ov02_02246B58
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x40
	bl ov02_02246B00
	cmp r6, #0
	bne _02246EA0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02246E70
	add r0, sp, #0x40
	str r0, [sp]
	add r0, sp, #0x24
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	add r3, r4, #0
	bl ov02_02247444
	b _02246F26
_02246E70:
	ldr r0, [sp, #8]
	cmp r0, #0
	add r0, sp, #0x40
	beq _02246E8C
	str r0, [sp]
	add r0, sp, #0x24
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	add r3, r4, #0
	bl ov02_02247460
	b _02246F26
_02246E8C:
	str r0, [sp]
	add r0, sp, #0x24
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	add r3, r4, #0
	bl ov02_02247424
	b _02246F26
_02246EA0:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_GetFollowerTrainerNum
	ldr r1, [sp, #0x20]
	mov r2, #0xb
	str r0, [r1, #0x20]
	ldr r0, [sp, #0x20]
	ldr r1, [r5, #0xc]
	bl EnemyTrainerSet_Init
	add r0, sp, #0x24
	str r0, [sp]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	add r3, sp, #0x40
	bl ov02_0224749C
	b _02246F26
_02246ECA:
	cmp r0, #1
	bne _02246F16
	mov r0, #0
	add r1, r4, #0
	add r2, sp, #0x40
_02246ED4:
	add r3, r1, #0
	add r3, #0x66
	ldrh r3, [r3]
	add r0, r0, #1
	str r3, [r2]
	add r3, r1, #0
	add r3, #0x65
	ldrb r3, [r3]
	strh r3, [r2, #4]
	add r3, r1, #0
	add r3, #0x64
	ldrb r3, [r3]
	add r1, r1, #4
	strh r3, [r2, #6]
	add r2, #8
	cmp r0, #5
	blt _02246ED4
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x40
	bl ov02_02246B9C
	add r0, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [sp, #4]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	add r3, sp, #0x40
	bl ov02_022474E0
	b _02246F26
_02246F16:
	bl GF_AssertFail
	ldr r0, [sp, #0x20]
	bl sub_02051BF8
	add sp, #0xa0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246F26:
	cmp r0, #0
	beq _02246F40
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl sub_02050B08
	add r0, r5, #0
	mov r1, #0
	add r0, #0x7e
	strh r1, [r0]
	add r5, #0x7c
	strh r1, [r5]
	b _02246F42
_02246F40:
	mov r7, #0
_02246F42:
	mov r0, #4
	bl GF_heap_c_dummy_return_true
	cmp r0, #0
	bne _02246F50
	bl GF_AssertFail
_02246F50:
	mov r0, #0xb
	bl GF_heap_c_dummy_return_true
	cmp r0, #0
	bne _02246F5E
	bl GF_AssertFail
_02246F5E:
	cmp r7, #0
	bne _02246F68
	ldr r0, [sp, #0x20]
	bl sub_02051BF8
_02246F68:
	add r0, r7, #0
	add sp, #0xa0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02246C8C

	thumb_func_start ov02_02246F70
ov02_02246F70: ; 0x02246F70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa0
	str r0, [sp, #0x20]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	bl ov02_0224802C
	add r4, r0, #0
	bne _02246F88
	add sp, #0xa0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246F88:
	ldr r0, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	mov r2, #0
	add r3, sp, #0x24
	bl ov02_02248618
	ldr r0, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetWeatherType
	add r3, r0, #0
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	str r0, [sp]
	mov r0, #1
	add r2, sp, #0x24
	bl ov02_02248190
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, r4
	blt _02246FDA
	add sp, #0xa0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02246FDA:
	ldr r0, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	str r0, [sp, #0x18]
	cmp r0, #0
	beq _02246FF8
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x10]
	mov r1, #1
	bl ov02_02248244
	b _02247002
_02246FF8:
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x10]
	mov r1, #0
	bl ov02_02248244
_02247002:
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	bl BattleStruct_InitFromFsys
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	bl sub_02052544
	ldr r0, [sp, #0x20]
	bl MapEvents_GetLoadedEncTable
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0224702C
	cmp r0, #1
	beq _02247032
	cmp r0, #2
	beq _02247038
	b _0224703C
_0224702C:
	ldr r7, [sp, #0x14]
	add r7, #0x80
	b _0224703C
_02247032:
	ldr r7, [sp, #0x14]
	add r7, #0x94
	b _0224703C
_02247038:
	ldr r7, [sp, #0x14]
	add r7, #0xa8
_0224703C:
	mov r6, #0
_0224703E:
	lsl r4, r6, #2
	add r5, r7, r4
	ldrh r1, [r5, #2]
	lsl r2, r6, #3
	add r0, sp, #0x40
	add r3, r0, r2
	str r1, [r0, r2]
	ldrb r0, [r5, #1]
	strh r0, [r3, #4]
	ldrb r0, [r7, r4]
	strh r0, [r3, #6]
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #5
	blo _0224703E
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0xc]
	add r2, sp, #0x40
	bl ov02_02246AD4
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x14]
	add r3, sp, #0x40
	bl ov02_02246BD8
	add r0, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	ldr r2, [r2]
	add r3, sp, #0x40
	bl ov02_02247514
	cmp r0, #0
	beq _02247098
	add sp, #0xa0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02247098:
	mov r0, #0
	add sp, #0xa0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02246F70

	thumb_func_start ov02_022470A0
ov02_022470A0: ; 0x022470A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x8c
	str r0, [sp, #0xc]
	str r1, [sp, #4]
	bl ov02_022480B4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	bne _022470B8
	add sp, #0x8c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_022470B8:
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	mov r2, #0
	add r3, sp, #0x10
	bl ov02_02248618
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetWeatherType
	add r3, r0, #0
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	mov r0, #0
	add r2, sp, #0x10
	bl ov02_02248190
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r4
	blt _02247106
	add sp, #0x8c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02247106:
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #4]
	mov r1, #0
	bl ov02_02248244
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [r0]
	bl BattleStruct_InitFromFsys
	ldr r0, [sp, #0xc]
	bl MapEvents_GetLoadedEncTable
	add r5, r0, #0
	add r5, #0x78
	mov r6, #0
_02247126:
	lsl r3, r6, #2
	add r4, r5, r3
	ldrh r1, [r4, #2]
	lsl r7, r6, #3
	add r0, sp, #0x2c
	add r2, r0, r7
	str r1, [r0, r7]
	ldrb r0, [r4, #1]
	strh r0, [r2, #4]
	ldrb r0, [r5, r3]
	strh r0, [r2, #6]
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	blo _02247126
	add r0, sp, #0x10
	str r0, [sp]
	ldr r2, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	ldr r2, [r2]
	add r3, sp, #0x2c
	bl ov02_0224754C
	cmp r0, #0
	bne _0224716A
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl sub_02051BF8
	add sp, #0x8c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224716A:
	mov r0, #1
	add sp, #0x8c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_022470A0

	thumb_func_start ov02_02247170
ov02_02247170: ; 0x02247170
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	str r1, [sp, #8]
	bl SavArray_Flags_get
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetMetatileBehaviorAt
	add r1, r0, #0
	add r0, r5, #0
	add r2, sp, #0x14
	bl ov02_0224762C
	cmp r0, #0
	bne _022471AC
	add sp, #0x9c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_022471AC:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r6, r0, #0
	add r0, r5, #0
	bl MapEvents_GetLoadedEncTable
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	add r3, sp, #0x20
	bl ov02_02248618
	mov r0, #1
	str r0, [sp, #0x28]
	add r0, r7, #0
	bl ScriptState_CheckHaveFollower
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _0224721A
	add r0, r5, #0
	add r1, sp, #0x18
	bl ov02_GetRandomActiveRoamerInCurrMap
	cmp r0, #0
	beq _0224721A
	mov r0, #0xb
	add r1, r0, #0
	add r1, #0xf5
	bl BattleStruct_new
	str r0, [sp, #0x1c]
	add r1, r5, #0
	bl BattleStruct_InitFromFsys
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	bl ov02_022482BC
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x1c]
	add r0, r5, #0
	bl sub_02050B90
	add sp, #0x9c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224721A:
	add r0, r7, #0
	bl ScriptState_CheckSafariSysFlag
	add r6, r0, #0
	add r0, r7, #0
	bl CheckFlag996
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0224724A
	mov r1, #0
	cmp r6, #0
	beq _0224723A
	mov r1, #1
	b _02247240
_0224723A:
	cmp r7, #0
	beq _02247240
	mov r1, #2
_02247240:
	add r0, r5, #0
	add r2, sp, #0x1c
	bl ov02_02248244
	b _02247254
_0224724A:
	mov r0, #0xb
	mov r1, #0x4a
	bl BattleStruct_new
	str r0, [sp, #0x1c]
_02247254:
	ldr r0, [sp, #0x1c]
	add r1, r5, #0
	bl BattleStruct_InitFromFsys
	add r0, sp, #0x14
	ldrb r0, [r0]
	cmp r0, #0
	bne _022472F8
	add r0, r4, #0
	add r1, sp, #0x3c
	bl ov02_02246A84
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x3c
	add r3, sp, #0x44
	bl ov02_02246B58
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x3c
	bl ov02_02246B00
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _022472CE
	cmp r6, #0
	add r0, sp, #0x3c
	beq _022472A2
	str r0, [sp]
	add r0, sp, #0x20
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	add r0, r5, #0
	add r3, r4, #0
	bl ov02_02247444
	b _0224734C
_022472A2:
	cmp r7, #0
	beq _022472BA
	str r0, [sp]
	add r0, sp, #0x20
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	add r0, r5, #0
	add r3, r4, #0
	bl ov02_02247460
	b _0224734C
_022472BA:
	str r0, [sp]
	add r0, sp, #0x20
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	add r0, r5, #0
	add r3, r4, #0
	bl ov02_02247424
	b _0224734C
_022472CE:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_GetFollowerTrainerNum
	ldr r1, [sp, #0x1c]
	mov r2, #0xb
	str r0, [r1, #0x20]
	ldr r0, [sp, #0x1c]
	ldr r1, [r5, #0xc]
	bl EnemyTrainerSet_Init
	add r0, sp, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	add r0, r5, #0
	add r3, sp, #0x3c
	bl ov02_0224749C
	b _0224734C
_022472F8:
	cmp r0, #1
	bne _02247342
	mov r0, #0
	add r1, r4, #0
	add r2, sp, #0x3c
_02247302:
	add r3, r1, #0
	add r3, #0x66
	ldrh r3, [r3]
	add r0, r0, #1
	str r3, [r2]
	add r3, r1, #0
	add r3, #0x65
	ldrb r3, [r3]
	strh r3, [r2, #4]
	add r3, r1, #0
	add r3, #0x64
	ldrb r3, [r3]
	add r1, r1, #4
	strh r3, [r2, #6]
	add r2, #8
	cmp r0, #5
	blt _02247302
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x3c
	bl ov02_02246B9C
	add r0, sp, #0x20
	str r0, [sp]
	str r6, [sp, #4]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	add r0, r5, #0
	add r3, sp, #0x3c
	bl ov02_022474E0
	b _0224734C
_02247342:
	bl GF_AssertFail
	add sp, #0x9c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224734C:
	cmp r0, #0
	beq _0224735C
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x1c]
	add r0, r5, #0
	bl sub_02050B90
	b _02247360
_0224735C:
	bl GF_AssertFail
_02247360:
	add r0, r5, #0
	mov r1, #0
	add r0, #0x7e
	strh r1, [r0]
	add r5, #0x7c
	strh r1, [r5]
	mov r0, #1
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02247170

	thumb_func_start ov02_02247374
ov02_02247374: ; 0x02247374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa8
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	str r1, [sp, #0xc]
	add r4, r2, #0
	bl SavArray_PlayerParty_get
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	mov r2, #0
	add r3, sp, #0x2c
	bl ov02_02248618
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	mov r1, #0
	bl ov02_02248244
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	ldr r0, [r0]
	bl BattleStruct_InitFromFsys
	mov r5, #0
	add r0, sp, #0x14
_022473B0:
	lsl r3, r5, #2
	ldrh r6, [r4, r3]
	add r1, r0, r3
	add r2, r4, r3
	strh r6, [r1, #2]
	ldrb r6, [r2, #3]
	strb r6, [r1, #1]
	ldrb r1, [r2, #2]
	strb r1, [r0, r3]
	add r1, r5, #1
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	cmp r5, #6
	blo _022473B0
	mov r6, #0
	add r4, sp, #0x14
	add r7, sp, #0x48
_022473D2:
	lsl r3, r6, #2
	add r5, r4, r3
	ldrh r0, [r5, #2]
	lsl r1, r6, #3
	add r2, r7, r1
	str r0, [r7, r1]
	ldrb r0, [r5, #1]
	strh r0, [r2, #4]
	ldrb r0, [r4, r3]
	strh r0, [r2, #6]
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #6
	blo _022473D2
	mov r0, #4
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	mov r1, #0xff
	ldr r0, [r0]
	add r2, sp, #0x2c
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	add r3, r7, #0
	bl ov02_02247B64
	cmp r0, #0
	bne _0224741C
	ldr r0, [sp, #0xc]
	ldr r0, [r0]
	bl sub_02051BF8
	add sp, #0xa8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224741C:
	mov r0, #1
	add sp, #0xa8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02247374

	thumb_func_start ov02_02247424
ov02_02247424: ; 0x02247424
	push {lr}
	sub sp, #0xc
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r0, r1, #0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x10]
	mov r1, #0xff
	bl ov02_02247B64
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov02_02247424

	thumb_func_start ov02_02247444
ov02_02247444: ; 0x02247444
	push {lr}
	sub sp, #0xc
	mov r3, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #0x14]
	mov r2, #0xff
	bl ov02_02247DA0
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov02_02247444

	thumb_func_start ov02_02247460
ov02_02247460: ; 0x02247460
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r7, _02247498 ; =FS_OVERLAY_ID(bug_contest)
	add r5, r0, #0
	add r6, r1, #0
	add r0, r7, #0
	mov r1, #2
	add r4, r2, #0
	bl HandleLoadOverlay
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r3, [sp, #0x24]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0xff
	str r4, [sp, #8]
	bl ov02_02247ED8
	add r4, r0, #0
	add r0, r7, #0
	bl UnloadOverlayByID
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02247498: .word FS_OVERLAY_ID(bug_contest)
	thumb_func_end ov02_02247460

	thumb_func_start ov02_0224749C
ov02_0224749C: ; 0x0224749C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	mov r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r1, #0xff
	add r6, r3, #0
	str r4, [sp, #8]
	bl ov02_02247B64
	cmp r0, #0
	bne _022474C4
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_022474C4:
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	mov r1, #0xff
	add r3, r6, #0
	str r4, [sp, #8]
	bl ov02_02247B64
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224749C

	thumb_func_start ov02_022474E0
ov02_022474E0: ; 0x022474E0
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x1c]
	cmp r4, #0
	beq _022474FE
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #0x18]
	mov r2, #0xff
	bl ov02_02247DA0
	add sp, #0xc
	pop {r3, r4, pc}
_022474FE:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r0, r1, #0
	ldr r2, [sp, #0x18]
	mov r1, #0xff
	bl ov02_02247B64
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov02_022474E0

	thumb_func_start ov02_02247514
ov02_02247514: ; 0x02247514
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x20]
	cmp r4, #0
	beq _02247534
	mov r3, #2
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	bl ov02_02247DA0
	add sp, #0xc
	pop {r3, r4, pc}
_02247534:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r0, r1, #0
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	bl ov02_02247B64
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov02_02247514

	thumb_func_start ov02_0224754C
ov02_0224754C: ; 0x0224754C
	push {lr}
	sub sp, #0xc
	mov r0, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r0, r1, #0
	ldr r2, [sp, #0x10]
	mov r1, #0xff
	bl ov02_02247B64
	add sp, #0xc
	pop {pc}
	thumb_func_end ov02_0224754C

	thumb_func_start ov02_02247568
ov02_02247568: ; 0x02247568
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	str r2, [sp]
	cmp r6, #0x64
	bls _02247576
	mov r6, #0x64
_02247576:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	add r7, r0, #0
	mov r4, #0x28
	cmp r7, #1
	beq _02247598
	cmp r7, #2
	beq _02247598
	ldr r0, [r5, #0x40]
	bl sub_0205DE98
	cmp r0, #0
	bne _02247598
	sub r4, #0x14
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_02247598:
	ldr r0, [sp]
	bl sub_0205B6F4
	cmp r0, #0
	beq _022475AA
	add r4, #0x28
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
	b _022475B4
_022475AA:
	cmp r7, #1
	bne _022475B4
	add r4, #0x1e
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_022475B4:
	add r0, r5, #0
	add r0, #0x7c
	ldrh r0, [r0]
	bl ov02_02247610
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	bl ov02_022522B4
	cmp r0, #1
	bne _022475D4
	add r4, #0x19
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
	b _022475E2
_022475D4:
	bl ov02_022522B4
	cmp r0, #2
	bne _022475E2
	sub r4, #0x19
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_022475E2:
	cmp r4, #0x64
	bls _022475E8
	mov r4, #0x64
_022475E8:
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, r4
	bge _0224760A
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_0224766C
	cmp r0, #0
	beq _0224760A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224760A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02247568

	thumb_func_start ov02_02247610
ov02_02247610: ; 0x02247610
	mov r1, #0
	cmp r0, #4
	blo _0224761A
	mov r1, #0x3c
	b _02247628
_0224761A:
	cmp r0, #3
	blo _02247622
	mov r1, #0x28
	b _02247628
_02247622:
	cmp r0, #2
	blo _02247628
	mov r1, #0x1e
_02247628:
	add r0, r1, #0
	bx lr
	thumb_func_end ov02_02247610

	thumb_func_start ov02_0224762C
ov02_0224762C: ; 0x0224762C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	add r4, r2, #0
	bl sub_0205B994
	cmp r0, #0
	beq _02247668
	add r0, r6, #0
	bl sub_0205B778
	cmp r0, #0
	beq _02247658
	mov r0, #1
	strb r0, [r4]
	add r0, r5, #0
	bl ov02_02248020
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_02247658:
	mov r0, #0
	strb r0, [r4]
	add r0, r5, #0
	bl ov02_02248014
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_02247668:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224762C

	thumb_func_start ov02_0224766C
ov02_0224766C: ; 0x0224766C
	push {r4, lr}
	add r4, r1, #0
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, r4
	bhs _02247686
	mov r0, #1
	pop {r4, pc}
_02247686:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224766C

	thumb_func_start ov02_0224768C
ov02_0224768C: ; 0x0224768C
	push {r3, lr}
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x14
	bhs _022476A8
	mov r0, #0
	pop {r3, pc}
_022476A8:
	blo _022476B2
	cmp r0, #0x28
	bhs _022476B2
	mov r0, #1
	pop {r3, pc}
_022476B2:
	cmp r0, #0x28
	blo _022476BE
	cmp r0, #0x32
	bhs _022476BE
	mov r0, #2
	pop {r3, pc}
_022476BE:
	cmp r0, #0x32
	blo _022476CA
	cmp r0, #0x3c
	bhs _022476CA
	mov r0, #3
	pop {r3, pc}
_022476CA:
	cmp r0, #0x3c
	blo _022476D6
	cmp r0, #0x46
	bhs _022476D6
	mov r0, #4
	pop {r3, pc}
_022476D6:
	cmp r0, #0x46
	blo _022476E2
	cmp r0, #0x50
	bhs _022476E2
	mov r0, #5
	pop {r3, pc}
_022476E2:
	cmp r0, #0x50
	blo _022476EE
	cmp r0, #0x55
	bhs _022476EE
	mov r0, #6
	pop {r3, pc}
_022476EE:
	cmp r0, #0x55
	blo _022476FA
	cmp r0, #0x5a
	bhs _022476FA
	mov r0, #7
	pop {r3, pc}
_022476FA:
	cmp r0, #0x5a
	blo _02247706
	cmp r0, #0x5e
	bhs _02247706
	mov r0, #8
	pop {r3, pc}
_02247706:
	cmp r0, #0x5e
	blo _02247712
	cmp r0, #0x62
	bhs _02247712
	mov r0, #9
	pop {r3, pc}
_02247712:
	cmp r0, #0x62
	bne _0224771A
	mov r0, #0xa
	pop {r3, pc}
_0224771A:
	mov r0, #0xb
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224768C

	thumb_func_start ov02_02247720
ov02_02247720: ; 0x02247720
	push {r3, lr}
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x3c
	bhs _0224773C
	mov r0, #0
	pop {r3, pc}
_0224773C:
	blo _02247746
	cmp r0, #0x5a
	bhs _02247746
	mov r0, #1
	pop {r3, pc}
_02247746:
	cmp r0, #0x5a
	blo _02247752
	cmp r0, #0x5f
	bhs _02247752
	mov r0, #2
	pop {r3, pc}
_02247752:
	cmp r0, #0x5f
	blo _0224775E
	cmp r0, #0x63
	bhs _0224775E
	mov r0, #3
	pop {r3, pc}
_0224775E:
	mov r0, #4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02247720

	thumb_func_start ov02_02247764
ov02_02247764: ; 0x02247764
	push {r3, lr}
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x28
	bhs _02247780
	mov r0, #0
	pop {r3, pc}
_02247780:
	cmp r0, #0x46
	bhs _02247788
	mov r0, #1
	pop {r3, pc}
_02247788:
	cmp r0, #0x55
	bhs _02247790
	mov r0, #2
	pop {r3, pc}
_02247790:
	cmp r0, #0x5f
	bhs _02247798
	mov r0, #3
	pop {r3, pc}
_02247798:
	mov r0, #4
	pop {r3, pc}
	thumb_func_end ov02_02247764

	thumb_func_start ov02_0224779C
ov02_0224779C: ; 0x0224779C
	push {r3, lr}
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x50
	blo _022477B8
	mov r0, #1
	b _022477BA
_022477B8:
	mov r0, #0
_022477BA:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end ov02_0224779C

	thumb_func_start ov02_022477C0
ov02_022477C0: ; 0x022477C0
	push {r3, lr}
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x32
	bhs _022477DC
	mov r0, #0
	pop {r3, pc}
_022477DC:
	cmp r0, #0x41
	bhs _022477E4
	mov r0, #1
	pop {r3, pc}
_022477E4:
	cmp r0, #0x50
	bhs _022477EC
	mov r0, #2
	pop {r3, pc}
_022477EC:
	cmp r0, #0x5a
	bhs _022477F4
	mov r0, #3
	pop {r3, pc}
_022477F4:
	cmp r0, #0x5f
	bhs _022477FC
	mov r0, #4
	pop {r3, pc}
_022477FC:
	mov r0, #5
	pop {r3, pc}
	thumb_func_end ov02_022477C0

	thumb_func_start ApplyLeadMonHeldItemEffectToEncounterRate
ApplyLeadMonHeldItemEffectToEncounterRate: ; 0x02247800
	push {r4, lr}
	add r4, r1, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #ITEM_CLEANSE_TAG
	beq _0224781C
	mov r0, #ITEM_PURE_INCENSE>>6
	lsl r0, r0, #6
	cmp r1, r0
	bne _02247828
_0224781C:
	ldrb r0, [r4]
	mov r1, #3
	lsl r0, r0, #1
	bl _s32_div_f
	strb r0, [r4]
_02247828:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ApplyLeadMonHeldItemEffectToEncounterRate

	thumb_func_start ApplyFluteEffectToEncounterRate
ApplyFluteEffectToEncounterRate: ; 0x0224782C
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl Save_Roamers_get
	bl RoamerSave_GetFlute
	cmp r0, #1
	bne _02247846
	ldrb r0, [r4]
	asr r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02247846:
	cmp r0, #2
	bne _02247852
	ldrb r1, [r4]
	lsr r0, r1, #1
	add r0, r1, r0
	strb r0, [r4]
_02247852:
	pop {r4, pc}
	thumb_func_end ApplyFluteEffectToEncounterRate

	thumb_func_start ov02_02247854
ov02_02247854: ; 0x02247854
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _02247890
	ldrb r0, [r1, #0xe]
	cmp r0, #0x1c
	bne _02247890
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _02247890
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	mov r1, #0x19
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
_02247890:
	bl LCRandom
	mov r1, #0x19
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
	thumb_func_end ov02_02247854

	thumb_func_start ov02_022478A4
ov02_022478A4: ; 0x022478A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldrh r2, [r0, #6]
	ldrh r1, [r0, #4]
	cmp r1, r2
	blo _022478B8
	lsl r0, r2, #0x18
	lsr r4, r0, #0x18
	lsl r0, r1, #0x18
	b _022478BE
_022478B8:
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	lsl r0, r2, #0x18
_022478BE:
	lsr r5, r0, #0x18
	bl LCRandom
	sub r1, r5, r4
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	ldrb r0, [r7, #0xd]
	cmp r0, #0
	bne _02247908
	ldrb r0, [r7, #0xe]
	cmp r0, #0x37
	beq _022478E8
	cmp r0, #0x48
	beq _022478E8
	cmp r0, #0x2e
	bne _02247908
_022478E8:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _02247904
	add r0, r4, r6
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02247904:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02247908:
	add r0, r4, r6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022478A4

	thumb_func_start ov02_02247910
ov02_02247910: ; 0x02247910
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x10]
	ldr r6, [sp, #0x40]
	str r1, [sp, #0x14]
	mov r0, #0xb
	str r2, [sp, #0x18]
	add r5, r3, #0
	bl AllocMonZeroed
	str r0, [sp, #0x1c]
	bl ZeroMonData
	ldrb r0, [r6, #0xd]
	mov r7, #0
	cmp r0, #0
	bne _02247994
	ldrb r0, [r6, #0xe]
	cmp r0, #0x38
	bne _02247970
	ldr r0, [sp, #0x10]
	mov r1, #0x12
	bl GetMonBaseStat
	cmp r0, #0
	beq _02247994
	cmp r0, #0xfe
	beq _02247994
	cmp r0, #0xff
	beq _02247994
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	beq _02247994
	ldr r0, [sp, #0x44]
	mov r1, #0x6f
	add r2, r7, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	mov r7, #1
	b _02247994
_02247970:
	cmp r0, #0x1c
	bne _02247994
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _02247994
	ldr r0, [sp, #0x44]
	bl GetMonNature
	str r0, [sp, #0x20]
	mov r7, #1
_02247994:
	add r0, r5, #0
	bl GenerateShinyPersonality
	add r4, r0, #0
	cmp r7, #0
	beq _022479E2
_022479A0:
	ldrb r0, [r6, #0xe]
	cmp r0, #0x38
	bne _022479C8
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	bl GetGenderBySpeciesAndPersonality
	add r7, r0, #0
	cmp r7, #2
	bne _022479B8
	bl GF_AssertFail
_022479B8:
	ldr r0, [sp, #0x24]
	cmp r7, r0
	bne _022479E2
	add r0, r5, #0
	bl GenerateShinyPersonality
	add r4, r0, #0
	b _022479A0
_022479C8:
	cmp r0, #0x1c
	bne _022479A0
	add r0, r4, #0
	bl GetNatureFromPersonality
	ldr r1, [sp, #0x20]
	cmp r0, r1
	beq _022479E2
	add r0, r5, #0
	bl GenerateShinyPersonality
	add r4, r0, #0
	b _022479A0
_022479E2:
	mov r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r6]
	mov r3, #0x20
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl CreateMon
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x48]
	add r1, r6, #0
	bl ov02_0224855C
	cmp r0, #0
	bne _02247A0E
	bl GF_AssertFail
_02247A0E:
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247910

	thumb_func_start ov02_02247A18
ov02_02247A18: ; 0x02247A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	str r1, [sp, #0x10]
	str r0, [sp, #0x3c]
	mov r0, #0xb
	str r2, [sp, #0x14]
	add r6, r3, #0
	ldr r7, [sp, #0x38]
	bl AllocMonZeroed
	add r4, r0, #0
	bl ZeroMonData
	ldr r0, [sp, #0xc]
	mov r1, #0x12
	mov r5, #1
	bl GetMonBaseStat
	cmp r0, #0
	beq _02247A4C
	cmp r0, #0xfe
	beq _02247A4C
	cmp r0, #0xff
	bne _02247A4E
_02247A4C:
	mov r5, #0
_02247A4E:
	cmp r5, #0
	beq _02247AD4
	ldrb r0, [r7, #0xd]
	cmp r0, #0
	bne _02247AD4
	ldrb r0, [r7, #0xe]
	cmp r0, #0x38
	bne _02247AD4
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	beq _02247AD4
	ldr r0, [sp, #0x3c]
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #1
	bne _02247A84
	mov r5, #0
	b _02247A90
_02247A84:
	cmp r5, #0
	bne _02247A8C
	mov r5, #1
	b _02247A90
_02247A8C:
	bl GF_AssertFail
_02247A90:
	ldr r0, [sp, #0x3c]
	add r1, r7, #0
	bl ov02_02247854
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	mov r3, #0x20
	bl CreateMonWithGenderNatureLetter
	add r0, r4, #0
	mov r1, #7
	add r2, r7, #0
	bl SetMonData
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x40]
	add r1, r7, #0
	add r2, r4, #0
	bl ov02_0224855C
	cmp r0, #0
	bne _02247ACA
	bl GF_AssertFail
_02247ACA:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_02247AD4:
	cmp r6, #0
	beq _02247B26
	mov r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	add r6, r0, #0
_02247AE0:
	ldr r0, [sp, #0x3c]
	add r1, r7, #0
	bl ov02_02247854
	str r0, [sp]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	mov r3, #0x20
	bl CreateMonWithNature
	mov r5, #0
_02247AF8:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x46
	add r2, r6, #0
	bl GetMonData
	cmp r0, #0x1f
	bne _02247B0E
	mov r0, #1
	str r0, [sp, #0x18]
	b _02247B14
_02247B0E:
	add r5, r5, #1
	cmp r5, #6
	blt _02247AF8
_02247B14:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _02247B3C
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #4
	blt _02247AE0
	b _02247B3C
_02247B26:
	ldr r0, [sp, #0x3c]
	add r1, r7, #0
	bl ov02_02247854
	str r0, [sp]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	mov r3, #0x20
	bl CreateMonWithNature
_02247B3C:
	add r0, r4, #0
	mov r1, #7
	add r2, r7, #0
	bl SetMonData
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x40]
	add r1, r7, #0
	add r2, r4, #0
	bl ov02_0224855C
	cmp r0, #0
	bne _02247B5A
	bl GF_AssertFail
_02247B5A:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247A18

	thumb_func_start ov02_02247B64
ov02_02247B64: ; 0x02247B64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #0xc]
	mov r7, #0
	add r1, sp, #0x10
	strb r7, [r1]
	add r1, sp, #0x18
	ldrb r1, [r1, #0x10]
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r1, #4
	bls _02247B80
	b _02247D36
_02247B80:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02247B8C: ; jump table
	.short _02247B96 - _02247B8C - 2 ; case 0
	.short _02247C44 - _02247B8C - 2 ; case 1
	.short _02247C94 - _02247B8C - 2 ; case 2
	.short _02247BF4 - _02247B8C - 2 ; case 3
	.short _02247CE6 - _02247B8C - 2 ; case 4
_02247B96:
	mov r1, #8
	str r1, [sp]
	mov r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0xc
	bl ov02_02248150
	cmp r0, #0
	bne _02247BD4
	mov r0, #0xd
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0xc
	bl ov02_02248150
	cmp r0, #0
	bne _02247BD4
	bl ov02_0224768C
	add r1, sp, #0x10
	strb r0, [r1]
_02247BD4:
	add r3, sp, #0x10
	ldrb r3, [r3]
	add r0, r4, #0
	mov r1, #0xc
	add r2, r5, #0
	bl ov02_022485B0
	add r1, sp, #0x10
	strb r0, [r1]
	ldrb r0, [r1]
	lsl r0, r0, #3
	add r0, r4, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	b _02247D3A
_02247BF4:
	mov r1, #8
	str r1, [sp]
	mov r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #2
	bl ov02_02248150
	cmp r0, #0
	bne _02247C32
	mov r0, #0xd
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #2
	bl ov02_02248150
	cmp r0, #0
	bne _02247C32
	bl ov02_0224779C
	add r1, sp, #0x10
	strb r0, [r1]
_02247C32:
	add r0, sp, #0x10
	ldrb r0, [r0]
	add r1, r5, #0
	lsl r0, r0, #3
	add r0, r4, r0
	bl ov02_022478A4
	add r7, r0, #0
	b _02247D3A
_02247C44:
	mov r1, #8
	str r1, [sp]
	mov r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #5
	bl ov02_02248150
	cmp r0, #0
	bne _02247C82
	mov r0, #0xd
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #5
	bl ov02_02248150
	cmp r0, #0
	bne _02247C82
	bl ov02_02247720
	add r1, sp, #0x10
	strb r0, [r1]
_02247C82:
	add r0, sp, #0x10
	ldrb r0, [r0]
	add r1, r5, #0
	lsl r0, r0, #3
	add r0, r4, r0
	bl ov02_022478A4
	add r7, r0, #0
	b _02247D3A
_02247C94:
	mov r1, #8
	str r1, [sp]
	mov r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #5
	bl ov02_02248150
	cmp r0, #0
	bne _02247CD4
	mov r0, #0xd
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #5
	bl ov02_02248150
	cmp r0, #0
	bne _02247CD4
	ldr r0, [sp, #0xc]
	bl ov02_02247764
	add r1, sp, #0x10
	strb r0, [r1]
_02247CD4:
	add r0, sp, #0x10
	ldrb r0, [r0]
	add r1, r5, #0
	lsl r0, r0, #3
	add r0, r4, r0
	bl ov02_022478A4
	add r7, r0, #0
	b _02247D3A
_02247CE6:
	mov r1, #8
	str r1, [sp]
	mov r1, #0x2a
	str r1, [sp, #4]
	add r1, sp, #0x10
	str r1, [sp, #8]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #6
	bl ov02_02248150
	cmp r0, #0
	bne _02247D24
	mov r0, #0xd
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #6
	bl ov02_02248150
	cmp r0, #0
	bne _02247D24
	bl ov02_022477C0
	add r1, sp, #0x10
	strb r0, [r1]
_02247D24:
	add r0, sp, #0x10
	ldrb r0, [r0]
	add r1, r5, #0
	lsl r0, r0, #3
	add r0, r4, r0
	bl ov02_022478A4
	add r7, r0, #0
	b _02247D3A
_02247D36:
	bl GF_AssertFail
_02247D3A:
	add r0, sp, #0x10
	ldrb r0, [r0]
	lsl r0, r0, #3
	ldr r0, [r4, r0]
	cmp r0, #0xc9
	bne _02247D56
	add r0, r5, #0
	bl ov02_022482A4
	cmp r0, #0
	bne _02247D56
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02247D56:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov02_022481EC
	cmp r0, #0
	beq _02247D6A
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02247D6A:
	add r0, r7, #0
	add r1, r5, #0
	bl ov02_02248290
	cmp r0, #1
	bne _02247D7C
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02247D7C:
	str r5, [sp]
	ldr r0, [sp, #0x30]
	str r6, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrb r0, [r0]
	ldr r2, [sp, #0x2c]
	add r1, r7, #0
	lsl r0, r0, #3
	ldr r0, [r4, r0]
	mov r3, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ov02_02247A18
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247B64

	thumb_func_start ov02_02247DA0
ov02_02247DA0: ; 0x02247DA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	ldr r0, [r7, #0xc]
	add r6, r1, #0
	str r2, [sp, #0xc]
	add r5, r3, #0
	bl Save_SafariZone_get
	mov r1, #3
	bl SafariZone_GetAreaSet
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl ov02_0224E340
	add r7, r0, #0
	bl GF_RTC_GetTimeOfDayWildParam
	add r3, r0, #0
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _02247DDA
	cmp r0, #1
	beq _02247DEC
	cmp r0, #2
	beq _02247DFE
	b _02247E12
_02247DDA:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	mov r2, #0
	bl sub_020974C4
	add r4, r0, #0
	b _02247E16
_02247DEC:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	mov r2, #1
	bl sub_020974C4
	add r4, r0, #0
	b _02247E16
_02247DFE:
	mov r0, #4
	ldr r2, [sp, #0xc]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	add r2, r2, #2
	bl sub_020974C4
	add r4, r0, #0
	b _02247E16
_02247E12:
	bl GF_AssertFail
_02247E16:
	mov r1, #0
	add r0, sp, #0x18
	strb r1, [r0]
	mov r0, #8
	str r0, [sp]
	mov r0, #0x2a
	str r0, [sp, #4]
	add r0, sp, #0x18
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0xa
	bl ov02_02248150
	cmp r0, #0
	bne _02247E50
	mov r0, #0xd
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x18
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0xa
	bl ov02_02248150
_02247E50:
	cmp r0, #0
	bne _02247E62
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	add r0, sp, #0x18
	strb r1, [r0]
_02247E62:
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _02247E7C
	add r3, sp, #0x18
	ldrb r3, [r3]
	add r0, r4, #0
	mov r1, #0xa
	add r2, r5, #0
	bl ov02_022485B0
	add r1, sp, #0x18
	strb r0, [r1]
_02247E7C:
	add r0, sp, #0x18
	ldrb r0, [r0]
	lsl r1, r0, #3
	ldr r0, [r4, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r4, r1
	ldrh r0, [r0, #4]
	add r1, r6, #0
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r5, #0
	add r2, r7, #0
	bl ov02_022481EC
	cmp r0, #0
	bne _02247EAC
	add r0, r7, #0
	add r1, r5, #0
	bl ov02_02248290
	cmp r0, #1
	bne _02247EB8
_02247EAC:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02247EB8:
	str r5, [sp]
	ldr r0, [sp, #0x38]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x34]
	add r1, r7, #0
	mov r3, #1
	bl ov02_02247A18
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247DA0

	thumb_func_start ov02_02247ED8
ov02_02247ED8: ; 0x02247ED8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r3, #0
	bl FieldSys_BugContest_get
	mov r1, #4
	bl BugContest_GetEncounterSlot
	add r4, r0, #0
	ldrh r0, [r4, #4]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov02_02248290
	cmp r0, #1
	bne _02247F08
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02247F08:
	str r5, [sp]
	ldr r0, [sp, #0x28]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldrh r1, [r4, #4]
	ldr r0, [r4]
	ldr r2, [sp, #0x24]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	mov r3, #1
	bl ov02_02247A18
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov02_02247ED8

	thumb_func_start ov02_02247F30
ov02_02247F30: ; 0x02247F30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #0xc]
	bl SavArray_PlayerParty_get
	mov r1, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	add r3, sp, #0x10
	bl ov02_02248618
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02247F80
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerID
	add r3, r0, #0
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x40]
	str r4, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #1
	bl ov02_02247910
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02247F80:
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x40]
	str r4, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #1
	mov r3, #0
	bl ov02_02247A18
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02247F30

	thumb_func_start ov02_02247F9C
ov02_02247F9C: ; 0x02247F9C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r4, #0
	bl sub_0205B994
	cmp r0, #0
	beq _02247FCA
	add r0, r6, #0
	bl sub_0205B778
	cmp r0, #0
	beq _02247FC2
	add r0, r5, #0
	bl ov02_02248020
	add r4, r0, #0
	b _02247FCA
_02247FC2:
	add r0, r5, #0
	bl ov02_02248014
	add r4, r0, #0
_02247FCA:
	cmp r4, #0
	beq _0224800C
	ldr r0, [r5, #0x20]
	ldr r1, [r0]
	ldr r0, _02248010 ; =0x0000013B
	cmp r1, r0
	beq _02247FE0
	add r0, #0xaf
	sub r0, r1, r0
	cmp r0, #2
	bhi _02248008
_02247FE0:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	mov r5, #0
_02247FEA:
	add r0, r4, #0
	add r1, r5, #0
	bl ScriptState_CheckAlphPuzzleFlag
	cmp r0, #0
	beq _02247FFA
	mov r0, #1
	pop {r4, r5, r6, pc}
_02247FFA:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02247FEA
	mov r0, #0
	pop {r4, r5, r6, pc}
_02248008:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0224800C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02248010: .word 0x0000013B
	thumb_func_end ov02_02247F9C

	thumb_func_start ov02_02248014
ov02_02248014: ; 0x02248014
	push {r3, lr}
	bl MapEvents_GetLoadedEncTable
	ldrb r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02248014

	thumb_func_start ov02_02248020
ov02_02248020: ; 0x02248020
	push {r3, lr}
	bl MapEvents_GetLoadedEncTable
	ldrb r0, [r0, #1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02248020

	thumb_func_start ov02_0224802C
ov02_0224802C: ; 0x0224802C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapEvents_GetLoadedEncTable
	cmp r4, #0
	beq _02248044
	cmp r4, #1
	beq _02248048
	cmp r4, #2
	beq _0224804C
	b _02248050
_02248044:
	ldrb r4, [r0, #3]
	b _02248058
_02248048:
	ldrb r4, [r0, #4]
	b _02248058
_0224804C:
	ldrb r4, [r0, #5]
	b _02248058
_02248050:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02248058:
	cmp r4, #0
	bne _02248060
	mov r0, #0
	pop {r3, r4, r5, pc}
_02248060:
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _0224808A
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	mov r1, #9
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov02_02248090
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0224808A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224802C

	thumb_func_start ov02_02248090
ov02_02248090: ; 0x02248090
	cmp r0, #0x63
	bhi _02248098
	mov r0, #0
	bx lr
_02248098:
	cmp r0, #0x95
	bhi _022480A0
	mov r0, #0x14
	bx lr
_022480A0:
	cmp r0, #0xc7
	bhi _022480A8
	mov r0, #0x1e
	bx lr
_022480A8:
	cmp r0, #0xf9
	bhi _022480B0
	mov r0, #0x28
	bx lr
_022480B0:
	mov r0, #0x32
	bx lr
	thumb_func_end ov02_02248090

	thumb_func_start ov02_022480B4
ov02_022480B4: ; 0x022480B4
	push {r3, lr}
	bl MapEvents_GetLoadedEncTable
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_022480B4

	thumb_func_start ov02_022480C0
ov02_022480C0: ; 0x022480C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	mov r0, #0
	str r1, [sp]
	add r7, r2, #0
	str r3, [sp, #4]
	add r4, r0, #0
	add r1, sp, #0x10
_022480D2:
	strb r4, [r1, r0]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0xc
	blo _022480D2
	ldr r0, [sp]
	add r5, r4, #0
	cmp r0, #0
	bls _02248128
_022480E6:
	lsl r0, r5, #3
	str r0, [sp, #0xc]
	ldr r0, [r6, r0]
	mov r1, #6
	bl GetMonBaseStat
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r1, #7
	ldr r0, [r6, r0]
	bl GetMonBaseStat
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp, #8]
	cmp r0, r7
	beq _02248110
	cmp r1, r7
	bne _0224811C
_02248110:
	add r1, r4, #1
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r4, r1, #0x18
	add r1, sp, #0x10
	strb r5, [r1, r0]
_0224811C:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp]
	cmp r5, r0
	blo _022480E6
_02248128:
	cmp r4, #0
	beq _02248132
	ldr r0, [sp]
	cmp r4, r0
	bne _02248138
_02248132:
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02248138:
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	add r0, sp, #0x10
	ldrb r1, [r0, r1]
	ldr r0, [sp, #4]
	strb r1, [r0]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_022480C0

	thumb_func_start ov02_02248150
ov02_02248150: ; 0x02248150
	push {r3, r4, r5, lr}
	ldrb r0, [r1, #0xd]
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #0
	bne _0224818C
	add r0, sp, #0
	ldrb r1, [r1, #0xe]
	ldrb r0, [r0, #0x14]
	cmp r1, r0
	bne _0224818C
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _0224818C
	add r2, sp, #0
	ldrb r2, [r2, #0x10]
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_022480C0
	pop {r3, r4, r5, pc}
_0224818C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02248150

	thumb_func_start ov02_02248190
ov02_02248190: ; 0x02248190
	push {r3, r4}
	ldrb r4, [r2, #0xd]
	cmp r4, #0
	bne _022481E2
	cmp r0, #0
	ldrb r0, [r2, #0xe]
	beq _022481AA
	cmp r0, #0x3c
	beq _022481A6
	cmp r0, #0x15
	bne _022481DC
_022481A6:
	lsl r1, r1, #1
	b _022481DC
_022481AA:
	cmp r0, #0x47
	beq _022481B6
	cmp r0, #0x63
	beq _022481B6
	cmp r0, #0x23
	bne _022481BA
_022481B6:
	lsl r1, r1, #1
	b _022481DC
_022481BA:
	cmp r0, #0x51
	bne _022481CA
	cmp r3, #5
	bne _022481DC
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	b _022481DC
_022481CA:
	cmp r0, #0x49
	beq _022481D6
	cmp r0, #0x5f
	beq _022481D6
	cmp r0, #1
	bne _022481DC
_022481D6:
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
_022481DC:
	cmp r1, #0x64
	ble _022481E2
	mov r1, #0x64
_022481E2:
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov02_02248190

	thumb_func_start ov02_022481EC
ov02_022481EC: ; 0x022481EC
	push {r4, lr}
	add r4, r2, #0
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _022481FA
	mov r0, #0
	pop {r4, pc}
_022481FA:
	ldrb r2, [r0, #0xd]
	cmp r2, #0
	bne _02248240
	ldrb r0, [r0, #0xe]
	cmp r0, #0x33
	beq _0224820A
	cmp r0, #0x16
	bne _02248240
_0224820A:
	add r0, r1, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #5
	bhi _02248220
	mov r0, #0
	pop {r4, pc}
_02248220:
	sub r0, r0, #5
	cmp r4, r0
	bgt _02248240
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _02248240
	mov r0, #1
	pop {r4, pc}
_02248240:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_022481EC

	thumb_func_start ov02_02248244
ov02_02248244: ; 0x02248244
	push {r3, r4, r5, lr}
	add r5, r2, #0
	cmp r1, #1
	beq _02248252
	cmp r1, #2
	beq _0224826A
	b _02248284
_02248252:
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetSafariBallsCounter
	add r1, r0, #0
	ldrh r1, [r1]
	mov r0, #0xb
	bl sub_02051A60
	str r0, [r5]
	pop {r3, r4, r5, pc}
_0224826A:
	bl FieldSys_BugContest_get
	add r4, r0, #0
	bl BugContest_GetSportBallsAddr
	add r1, r0, #0
	ldrh r1, [r1]
	ldr r2, [r4, #0x10]
	mov r0, #0xb
	bl sub_02051A74
	str r0, [r5]
	pop {r3, r4, r5, pc}
_02248284:
	mov r0, #0xb
	mov r1, #0
	bl BattleStruct_new
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02248244

	thumb_func_start ov02_02248290
ov02_02248290: ; 0x02248290
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _022482A0
	ldrb r1, [r1, #0xc]
	cmp r1, r0
	bls _022482A0
	mov r0, #1
	bx lr
_022482A0:
	mov r0, #0
	bx lr
	thumb_func_end ov02_02248290

	thumb_func_start ov02_022482A4
ov02_022482A4: ; 0x022482A4
	mov r2, #0
_022482A6:
	add r1, r0, r2
	ldrb r1, [r1, #0x12]
	cmp r1, #0
	beq _022482B2
	mov r0, #1
	bx lr
_022482B2:
	add r2, r2, #1
	cmp r2, #4
	blt _022482A6
	mov r0, #0
	bx lr
	thumb_func_end ov02_022482A4

	thumb_func_start ov02_022482BC
ov02_022482BC: ; 0x022482BC
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	mov r0, #4
	add r6, r2, #0
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #4
	bl GetRoamerData
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #6
	bl GetRoamerData
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r5, #0
	mov r1, #2
	bl GetRoamerData
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #3
	bl GetRoamerData
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #7
	bl GetRoamerData
	str r0, [sp, #0x14]
	add r0, r5, #0
	mov r1, #5
	bl GetRoamerData
	add r1, sp, #0x10
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0xc]
	lsl r1, r1, #0x10
	str r0, [sp]
	ldr r3, [sp, #8]
	add r0, r4, #0
	lsr r1, r1, #0x10
	add r2, r7, #0
	bl CreateMonWithFixedIVs
	add r0, r4, #0
	mov r1, #7
	add r2, sp, #0x30
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa0
	add r2, sp, #0x14
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa3
	add r2, sp, #0x10
	bl SetMonData
	ldr r0, [r6, #8]
	add r1, r4, #0
	bl AddMonToParty
	cmp r0, #0
	bne _02248350
	bl GF_AssertFail
_02248350:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov02_022482BC

; BOOL ov02_GetRandomActiveRoamerInCurrMap(FieldSystem *fsys, ROAMER **out);
	thumb_func_start ov02_GetRandomActiveRoamerInCurrMap
ov02_GetRandomActiveRoamerInCurrMap: ; 0x02248360
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	ldr r0, [r0, #0xc]
	str r1, [sp, #4]
	mov r5, #0
	bl Save_Roamers_get
	add r6, r0, #0
	add r4, r5, #0
_02248374:
	add r0, r6, #0
	add r1, r4, #0
	bl Roamer_GetLocation
	bl GetRoamMapByLocationIdx
	add r7, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl GetRoamerIsActiveByIndex
	cmp r0, #0
	beq _022483AC
	ldr r0, [sp]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	cmp r7, r0
	bne _022483AC
	add r0, r6, #0
	add r1, r4, #0
	bl Roamers_GetRoamMonStats
	lsl r2, r5, #2
	add r1, sp, #8
	str r0, [r1, r2]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_022483AC:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02248374
	cmp r5, #0
	bne _022483C0
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022483C0:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _022483DC
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022483DC:
	cmp r5, #1
	bls _0224840A
	cmp r5, #0
	bne _022483E8
	bl GF_AssertFail
_022483E8:
	cmp r5, #1
	bhi _022483F0
	mov r0, #0
	b _022483FE
_022483F0:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
_022483FE:
	lsl r1, r0, #2
	add r0, sp, #8
	ldr r1, [r0, r1]
	ldr r0, [sp, #4]
	str r1, [r0]
	b _02248410
_0224840A:
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	str r1, [r0]
_02248410:
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_GetRandomActiveRoamerInCurrMap

	thumb_func_start ov02_02248418
ov02_02248418: ; 0x02248418
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r6, r2, #0
	mov r4, #0
	cmp r5, #0
	ble _0224843E
_02248426:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #1
	bl Pokedex_GetSeenFormeByIdx_Unown
	cmp r6, r0
	bne _02248438
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02248438:
	add r4, r4, #1
	cmp r4, r5
	blt _02248426
_0224843E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02248418

	thumb_func_start ov02_02248444
ov02_02248444: ; 0x02248444
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _02248470
	bl LCRandom
	ldr r1, _02248554 ; =ov02_02253290
	lsr r2, r0, #0x1f
	ldr r3, [r1, #0x48]
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add sp, #0x18
	ldrb r0, [r3, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02248470:
	mov r0, #4
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	str r0, [sp, #8]
	mov r0, #4
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	bl ov02_022522B4
	cmp r0, #6
	bne _022484A4
	mov r0, #1
	str r0, [sp, #0xc]
_022484A4:
	ldr r0, [sp]
	mov r6, #0
	ldr r0, [r0, #0x18]
	mov r1, #1
	add r7, r6, #0
	bl Pokedex_GetSeenFormeNum_Unown
	lsl r0, r0, #0x18
	add r1, r6, #0
	lsr r0, r0, #0x18
	ldr r4, _02248558 ; =ov02_022532B4
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
_022484BE:
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _02248500
	ldr r0, [r4]
	mov r5, #0
	cmp r0, #0
	ble _02248500
_022484D2:
	ldr r2, [r4, #4]
	ldr r0, [sp]
	ldrb r2, [r2, r5]
	ldr r0, [r0, #0x18]
	ldr r1, [sp, #0x14]
	bl ov02_02248418
	cmp r0, #0
	bne _022484EE
	ldr r0, [r4, #4]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #4]
	strb r1, [r0, r6]
	add r6, r6, #1
_022484EE:
	ldr r0, [r4, #4]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #8]
	add r5, r5, #1
	strb r1, [r0, r7]
	ldr r0, [r4]
	add r7, r7, #1
	cmp r5, r0
	blt _022484D2
_02248500:
	ldr r0, [sp, #0x10]
	add r4, #8
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _022484BE
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02248534
	cmp r6, #0
	ble _02248534
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, #0x32
	bge _02248534
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	ldr r0, [sp, #4]
	ldrb r4, [r0, r1]
	b _02248542
_02248534:
	bl LCRandom
	add r1, r7, #0
	bl _s32_div_f
	ldr r0, [sp, #8]
	ldrb r4, [r0, r1]
_02248542:
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldr r0, [sp, #8]
	bl FreeToHeap
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248554: .word ov02_02253290
_02248558: .word ov02_022532B4
	thumb_func_end ov02_02248444

	thumb_func_start ov02_0224855C
ov02_0224855C: ; 0x0224855C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldrb r0, [r5, #0xd]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	bne _02248576
	ldrb r0, [r5, #0xe]
	cmp r0, #0xe
	bne _02248576
	mov r2, #1
	b _02248578
_02248576:
	mov r2, #0
_02248578:
	ldr r1, [r6]
	add r0, r4, #0
	bl WildMonSetRandomHeldItem
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #SPECIES_UNOWN
	bne _022485A2
	add r0, r5, #0
	bl ov02_02248444
	add r1, sp, #0
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #0
	bl SetMonData
_022485A2:
	lsl r0, r7, #2
	add r0, r6, r0
	ldr r0, [r0, #4]
	add r1, r4, #0
	bl AddMonToParty
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224855C

	thumb_func_start ov02_022485B0
ov02_022485B0: ; 0x022485B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r2, #0xd]
	add r6, r1, #0
	add r4, r3, #0
	cmp r0, #0
	bne _02248614
	ldrb r0, [r2, #0xe]
	cmp r0, #0x48
	beq _022485CC
	cmp r0, #0x37
	beq _022485CC
	cmp r0, #0x2e
	bne _02248614
_022485CC:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _022485E6
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_022485E6:
	mov r7, #0
	cmp r6, #0
	ble _02248610
_022485EC:
	lsl r2, r4, #3
	lsl r0, r7, #3
	add r3, r5, r2
	add r1, r5, r0
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	cmp r0, r2
	bne _02248606
	ldrh r1, [r1, #4]
	ldrh r0, [r3, #4]
	cmp r1, r0
	bls _02248606
	add r4, r7, #0
_02248606:
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, r6
	blt _022485EC
_02248610:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02248614:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022485B0

	thumb_func_start ov02_02248618
ov02_02248618: ; 0x02248618
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	add r5, r3, #0
	bl GetMonData
	cmp r0, #0
	bne _0224863C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xa
	strb r2, [r5, #0xd]
	bl GetMonData
	b _02248642
_0224863C:
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r0, #NUM_ABILITIES
_02248642:
	strb r0, [r5, #0xe]
	mov r0, #0
	strb r0, [r5, #0xc]
	str r0, [r5, #4]
	str r0, [r5, #8]
	strb r0, [r5, #0xf]
	strb r0, [r5, #0x10]
	ldr r0, [r7, #0xc]
	bl SavArray_Flags_get
	add r6, r0, #0
	ldr r0, [r7, #0x20]
	ldr r1, [r0]
	ldr r0, _02248694 ; =0x000001EB
	cmp r1, r0
	bne _02248666
	mov r0, #1
	b _02248668
_02248666:
	mov r0, #0
_02248668:
	strb r0, [r5, #0x11]
	mov r4, #0
_0224866C:
	add r0, r6, #0
	add r1, r4, #0
	bl ScriptState_CheckAlphPuzzleFlag
	add r1, r5, r4
	add r4, r4, #1
	strb r0, [r1, #0x12]
	cmp r4, #4
	blt _0224866C
	ldr r0, [r7, #0xc]
	bl Sav2_Pokedex_get
	str r0, [r5, #0x18]
	ldr r0, [r7, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerID
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248694: .word 0x000001EB
	thumb_func_end ov02_02248618

	thumb_func_start ov02_02248698
ov02_02248698: ; 0x02248698
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	cmp r0, #3
	bhi _022486F8
	add r2, r0, r0
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022486B8: ; jump table
	.short _022486C0 - _022486B8 - 2 ; case 0
	.short _022486CE - _022486B8 - 2 ; case 1
	.short _022486DC - _022486B8 - 2 ; case 2
	.short _022486EA - _022486B8 - 2 ; case 3
_022486C0:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #1
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486CE:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #0
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486DC:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #3
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486EA:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #2
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486F8:
	bl GF_AssertFail
	pop {r4, pc}
_022486FE:
	cmp r1, #0
	beq _0224871C
	add r1, r4, #0
	add r1, #0x7c
	ldrh r2, [r1]
	ldr r1, _02248724 ; =0x0000FFFF
	cmp r2, r1
	bhs _0224871C
	add r1, r4, #0
	add r1, #0x7c
	ldrh r1, [r1]
	add r2, r1, #1
	add r1, r4, #0
	add r1, #0x7c
	strh r2, [r1]
_0224871C:
	add r4, #0x7a
	strh r0, [r4]
	pop {r4, pc}
	nop
_02248724: .word 0x0000FFFF
	thumb_func_end ov02_02248698

	thumb_func_start ov02_02248728
ov02_02248728: ; 0x02248728
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r2, #0
	ldr r0, [sp, #0x1c]
	add r7, r3, #0
	strb r6, [r5]
	ldr r4, [sp, #0x18]
	strb r7, [r5, #1]
	strb r4, [r5, #2]
	str r0, [sp, #0x1c]
	strb r0, [r5, #3]
	ldr r0, [sp, #0x20]
	mov r2, #4
	strb r0, [r5, #4]
	ldr r0, [sp, #0x24]
	strb r0, [r5, #5]
	ldr r0, [sp, #0x28]
	strb r0, [r5, #6]
	ldr r0, [sp, #0x2c]
	strb r0, [r5, #7]
	add r0, r1, #0
	add r1, r5, #0
	add r1, #0xc
	bl G2dRenderer_Init
	str r0, [r5, #8]
	add r0, r5, #0
	mov r2, #2
	add r0, #0xc
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r6, #0
	mov r1, #0
	mov r2, #4
	bl Create2DGfxResObjMan
	mov r1, #0x4d
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r7, #0
	mov r1, #1
	mov r2, #4
	bl Create2DGfxResObjMan
	mov r1, #0x4e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	mov r1, #2
	mov r2, #4
	bl Create2DGfxResObjMan
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp, #0x1c]
	mov r1, #3
	mov r2, #4
	bl Create2DGfxResObjMan
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #4
	lsl r1, r6, #3
	bl ov02_0224B690
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #4
	lsl r1, r7, #3
	bl ov02_0224B690
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #4
	lsl r1, r4, #3
	bl ov02_0224B690
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [sp, #0x1c]
	mov r0, #4
	lsl r1, r1, #3
	bl ov02_0224B690
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r1, #0
	cmp r6, #0
	ble _02248804
	ble _02248804
	ldr r0, [sp, #0x20]
	add r2, r1, #0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_022487F4:
	mov r3, #0x51
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	add r1, r1, #1
	strh r0, [r3, r2]
	add r2, #8
	cmp r1, r6
	blt _022487F4
_02248804:
	mov r3, #0
	cmp r7, #0
	ble _02248824
	ble _02248824
	ldr r0, [sp, #0x24]
	mov r6, #0x52
	lsl r0, r0, #0x10
	add r2, r3, #0
	asr r1, r0, #0x10
	lsl r6, r6, #2
_02248818:
	ldr r0, [r5, r6]
	add r3, r3, #1
	strh r1, [r0, r2]
	add r2, #8
	cmp r3, r7
	blt _02248818
_02248824:
	mov r1, #0
	cmp r4, #0
	ble _02248844
	ble _02248844
	ldr r2, [sp, #0x28]
	add r0, r1, #0
	lsl r2, r2, #0x10
	asr r6, r2, #0x10
	mov r2, #0x53
	lsl r2, r2, #2
_02248838:
	ldr r3, [r5, r2]
	add r1, r1, #1
	strh r6, [r3, r0]
	add r0, #8
	cmp r1, r4
	blt _02248838
_02248844:
	ldr r0, [sp, #0x1c]
	mov r1, #0
	cmp r0, #0
	ble _02248868
	ble _02248868
	ldr r2, [sp, #0x2c]
	mov r3, #0x15
	lsl r2, r2, #0x10
	add r0, r1, #0
	asr r4, r2, #0x10
	lsl r3, r3, #4
_0224885A:
	ldr r2, [r5, r3]
	add r1, r1, #1
	strh r4, [r2, r0]
	ldr r2, [sp, #0x1c]
	add r0, #8
	cmp r1, r2
	blt _0224885A
_02248868:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02248728

	thumb_func_start ov02_0224886C
ov02_0224886C: ; 0x0224886C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5]
	mov r6, #0
	cmp r0, #0
	ble _0224889C
	add r4, r6, #0
	mov r7, #4
_0224887C:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrsb r2, [r5, r7]
	add r0, r1, r4
	ldrsh r1, [r1, r4]
	cmp r2, r1
	beq _02248892
	ldr r0, [r0, #4]
	bl sub_0200AEB0
_02248892:
	ldrb r0, [r5]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _0224887C
_0224889C:
	ldrb r0, [r5, #1]
	mov r6, #0
	cmp r0, #0
	ble _022488C8
	add r4, r6, #0
	mov r7, #5
_022488A8:
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrsb r2, [r5, r7]
	add r0, r1, r4
	ldrsh r1, [r1, r4]
	cmp r2, r1
	beq _022488BE
	ldr r0, [r0, #4]
	bl sub_0200B0A8
_022488BE:
	ldrb r0, [r5, #1]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _022488A8
_022488C8:
	ldrb r0, [r5, #2]
	mov r6, #0
	cmp r0, #0
	ble _022488F4
	add r4, r6, #0
	mov r7, #6
_022488D4:
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrsb r2, [r5, r7]
	add r0, r1, r4
	ldrsh r1, [r1, r4]
	cmp r2, r1
	beq _022488EA
	ldr r0, [r0, #4]
	bl sub_0200A740
_022488EA:
	ldrb r0, [r5, #2]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _022488D4
_022488F4:
	ldrb r0, [r5, #3]
	mov r6, #0
	cmp r0, #0
	ble _02248920
	add r4, r6, #0
	mov r7, #7
_02248900:
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	ldrsb r2, [r5, r7]
	add r0, r1, r4
	ldrsh r1, [r1, r4]
	cmp r2, r1
	beq _02248916
	ldr r0, [r0, #4]
	bl sub_0200A740
_02248916:
	ldrb r0, [r5, #3]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _02248900
_02248920:
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Destroy2DGfxResObjMan
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Destroy2DGfxResObjMan
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Destroy2DGfxResObjMan
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl Destroy2DGfxResObjMan
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl FreeToHeap
	ldr r0, [r5, #8]
	bl sub_02024544
	ldr r0, [r5, #8]
	bl sub_02024504
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224886C

	thumb_func_start ov02_02248980
ov02_02248980: ; 0x02248980
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	ldrb r5, [r6]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	add r7, r3, #0
	mov r2, #0
	cmp r5, #0
	ble _022489E6
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r3, [r6, r0]
	mov r0, #4
	ldrsb r4, [r6, r0]
	mov ip, r3
	add r0, r2, #0
_022489A2:
	ldrsh r1, [r3, r0]
	cmp r4, r1
	bne _022489DE
	lsl r4, r2, #3
	mov r0, ip
	strh r7, [r0, r4]
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	mov r3, #0
	add r1, r1, r4
	strh r3, [r1, #2]
	str r7, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	sub r0, #0x10
	ldr r0, [r6, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl AddCharResObjFromOpenNarc
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add sp, #0x14
	add r1, r1, r4
	str r0, [r1, #4]
	pop {r4, r5, r6, r7, pc}
_022489DE:
	add r2, r2, #1
	add r3, #8
	cmp r2, r5
	blt _022489A2
_022489E6:
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02248980

	thumb_func_start ov02_022489F0
ov02_022489F0: ; 0x022489F0
	push {r4, r5, r6, lr}
	ldrb r3, [r0]
	mov r2, #0
	cmp r3, #0
	ble _02248A1E
	mov r4, #0x51
	lsl r4, r4, #2
	ldr r0, [r0, r4]
	add r4, r2, #0
	add r6, r0, #0
_02248A04:
	ldrsh r5, [r6, r4]
	cmp r1, r5
	bne _02248A16
	lsl r1, r2, #3
	add r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_0200ADA4
	pop {r4, r5, r6, pc}
_02248A16:
	add r2, r2, #1
	add r6, #8
	cmp r2, r3
	blt _02248A04
_02248A1E:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_022489F0

	thumb_func_start ov02_02248A24
ov02_02248A24: ; 0x02248A24
	push {r4, r5, r6, lr}
	ldrb r3, [r0]
	mov r2, #0
	cmp r3, #0
	ble _02248A52
	mov r4, #0x51
	lsl r4, r4, #2
	ldr r0, [r0, r4]
	add r4, r2, #0
	add r6, r0, #0
_02248A38:
	ldrsh r5, [r6, r4]
	cmp r1, r5
	bne _02248A4A
	lsl r1, r2, #3
	add r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_0200A740
	pop {r4, r5, r6, pc}
_02248A4A:
	add r2, r2, #1
	add r6, #8
	cmp r2, r3
	blt _02248A38
_02248A52:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02248A24

	thumb_func_start ov02_02248A58
ov02_02248A58: ; 0x02248A58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	ldrb r5, [r6]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	add r7, r3, #0
	mov r2, #0
	cmp r5, #0
	ble _02248AC0
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r3, [r6, r0]
	mov r0, #5
	ldrsb r4, [r6, r0]
	mov ip, r3
	add r0, r2, #0
_02248A7A:
	ldrsh r1, [r3, r0]
	cmp r4, r1
	bne _02248AB8
	lsl r4, r2, #3
	mov r0, ip
	strh r7, [r0, r4]
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	mov r3, #0
	add r1, r1, r4
	strh r3, [r1, #2]
	str r7, [sp]
	mov r1, #1
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #4
	str r1, [sp, #0xc]
	sub r0, #0x10
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x52
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add sp, #0x18
	add r1, r1, r4
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02248AB8:
	add r2, r2, #1
	add r3, #8
	cmp r2, r5
	blt _02248A7A
_02248AC0:
	bl GF_AssertFail
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02248A58

	thumb_func_start ov02_02248AC8
ov02_02248AC8: ; 0x02248AC8
	push {r4, r5, r6, lr}
	ldrb r3, [r0, #1]
	mov r2, #0
	cmp r3, #0
	ble _02248AF6
	mov r4, #0x52
	lsl r4, r4, #2
	ldr r0, [r0, r4]
	add r4, r2, #0
	add r6, r0, #0
_02248ADC:
	ldrsh r5, [r6, r4]
	cmp r1, r5
	bne _02248AEE
	lsl r1, r2, #3
	add r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_0200B00C
	pop {r4, r5, r6, pc}
_02248AEE:
	add r2, r2, #1
	add r6, #8
	cmp r2, r3
	blt _02248ADC
_02248AF6:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02248AC8

	thumb_func_start ov02_02248AFC
ov02_02248AFC: ; 0x02248AFC
	push {r4, r5, r6, lr}
	ldrb r3, [r0, #1]
	mov r2, #0
	cmp r3, #0
	ble _02248B2A
	mov r4, #0x52
	lsl r4, r4, #2
	ldr r0, [r0, r4]
	add r4, r2, #0
	add r6, r0, #0
_02248B10:
	ldrsh r5, [r6, r4]
	cmp r1, r5
	bne _02248B22
	lsl r1, r2, #3
	add r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_0200A740
	pop {r4, r5, r6, pc}
_02248B22:
	add r2, r2, #1
	add r6, #8
	cmp r2, r3
	blt _02248B10
_02248B2A:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02248AFC

	thumb_func_start ov02_02248B30
ov02_02248B30: ; 0x02248B30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	ldrb r5, [r6]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	add r7, r3, #0
	mov r2, #0
	cmp r5, #0
	ble _02248B96
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r3, [r6, r0]
	mov r0, #6
	ldrsb r4, [r6, r0]
	mov ip, r3
	add r0, r2, #0
_02248B52:
	ldrsh r1, [r3, r0]
	cmp r4, r1
	bne _02248B8E
	lsl r4, r2, #3
	mov r0, ip
	strh r7, [r0, r4]
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	mov r3, #0
	add r1, r1, r4
	strh r3, [r1, #2]
	str r7, [sp]
	mov r1, #2
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	sub r0, #0x10
	ldr r0, [r6, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x53
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add sp, #0x14
	add r1, r1, r4
	str r0, [r1, #4]
	pop {r4, r5, r6, r7, pc}
_02248B8E:
	add r2, r2, #1
	add r3, #8
	cmp r2, r5
	blt _02248B52
_02248B96:
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02248B30

	thumb_func_start ov02_02248BA0
ov02_02248BA0: ; 0x02248BA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	ldrb r5, [r6]
	str r2, [sp, #0x10]
	str r1, [sp, #0xc]
	add r7, r3, #0
	mov r2, #0
	cmp r5, #0
	ble _02248C06
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r3, [r6, r0]
	mov r0, #7
	ldrsb r4, [r6, r0]
	mov ip, r3
	add r0, r2, #0
_02248BC2:
	ldrsh r1, [r3, r0]
	cmp r4, r1
	bne _02248BFE
	lsl r4, r2, #3
	mov r0, ip
	strh r7, [r0, r4]
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r1, [r6, r0]
	mov r3, #0
	add r1, r1, r4
	strh r3, [r1, #2]
	str r7, [sp]
	mov r1, #3
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	sub r0, #0x10
	ldr r0, [r6, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x15
	lsl r1, r1, #4
	ldr r1, [r6, r1]
	add sp, #0x14
	add r1, r1, r4
	str r0, [r1, #4]
	pop {r4, r5, r6, r7, pc}
_02248BFE:
	add r2, r2, #1
	add r3, #8
	cmp r2, r5
	blt _02248BC2
_02248C06:
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02248BA0

	thumb_func_start ov02_02248C10
ov02_02248C10: ; 0x02248C10
	push {r4, r5, r6, lr}
	sub sp, #0x70
	add r5, r0, #0
	add r4, r1, #0
	add r1, r2, #0
	mov r0, #7
	add r2, r3, #0
	ldrsb r3, [r5, r0]
	ldr r6, [sp, #0x84]
	cmp r6, r3
	bne _02248C2A
	sub r0, #8
	str r0, [sp, #0x84]
_02248C2A:
	ldr r0, [sp, #0x84]
	mov r3, #0
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x88]
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	str r6, [sp, #0x14]
	add r6, r0, #4
	ldr r6, [r5, r6]
	str r6, [sp, #0x18]
	add r6, r0, #0
	add r6, #8
	ldr r6, [r5, r6]
	add r0, #0xc
	str r6, [sp, #0x1c]
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	ldr r3, [sp, #0x80]
	add r0, sp, #0x4c
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #8]
	add r2, sp, #0x34
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	ldr r0, [sp, #0x8c]
	str r0, [sp, #0x40]
	mov r0, #1
	str r0, [sp, #0x44]
	mov r0, #4
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	bl sub_02024714
	add r4, r0, #0
	bne _02248C92
	bl GF_AssertFail
_02248C92:
	add r0, r4, #0
	add sp, #0x70
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02248C10

	thumb_func_start ov02_02248C98
ov02_02248C98: ; 0x02248C98
	push {r4, lr}
	add r4, r1, #0
	bl sub_020248AC
	add r2, r0, #0
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov02_02248C98

	thumb_func_start ov02_02248CAC
ov02_02248CAC: ; 0x02248CAC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	add r4, r0, #0
	mov r2, #0
	add r0, sp, #0x1c
	str r2, [r0]
	str r2, [r0, #4]
	add r3, sp, #0x28
	str r2, [r3]
	str r2, [r3, #4]
	ldr r6, _02248D14 ; =ov02_02253360
	str r2, [r0, #8]
	ldmia r6!, {r0, r1}
	add r5, sp, #0x10
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	str r2, [r3, #8]
	str r0, [r5]
	add r1, r3, #0
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r0, #0x84
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r3, r2, #0
	bl ov02_02248C10
	add r4, r0, #0
	mov r1, #2
	bl sub_0202487C
	add r0, r4, #0
	add r1, sp, #0x1c
	bl sub_020247E4
	add r0, r4, #0
	add r1, sp, #0x10
	bl sub_020247F4
	mov r0, #0
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02024818
	add r0, r4, #0
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	nop
_02248D14: .word ov02_02253360
	thumb_func_end ov02_02248CAC

	thumb_func_start ov02_02248D18
ov02_02248D18: ; 0x02248D18
	push {r3, r4, lr}
	sub sp, #0x1c
	mov r3, #0
	add r2, sp, #0x10
	str r3, [r2]
	str r3, [r2, #4]
	str r3, [r2, #8]
	cmp r1, #1
	bne _02248D2C
	mov r3, #1
_02248D2C:
	mov r2, #2
	str r2, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x83
	str r1, [sp, #0xc]
	add r1, sp, #0x10
	bl ov02_02248C10
	add r4, r0, #0
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov02_02248D18

	thumb_func_start ov02_02248D58
ov02_02248D58: ; 0x02248D58
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, sp, #0x18
	mov r4, #0
	str r4, [r5]
	str r4, [r5, #4]
	str r0, [sp, #0xc]
	str r2, [sp, #0x14]
	str r3, [sp, #0x10]
	str r4, [r5, #8]
	str r1, [sp, #8]
	add r0, sp, #8
	str r0, [sp]
	mov r0, #0x82
	str r0, [sp, #4]
	add r0, r1, #0
	ldr r1, _02248D88 ; =ov02_02253454
	add r2, r5, #0
	add r3, r4, #0
	bl sub_02068B0C
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02248D88: .word ov02_02253454
	thumb_func_end ov02_02248D58

	thumb_func_start ov02_02248D8C
ov02_02248D8C: ; 0x02248D8C
	push {r3, lr}
	bl sub_02068D74
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02248D8C

	thumb_func_start ov02_02248D98
ov02_02248D98: ; 0x02248D98
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D98
	add r2, r4, #0
	add r3, r0, #0
	add r2, #0x58
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x64]
	bl ov02_02248CAC
	str r0, [r4, #0x68]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02248D98

	thumb_func_start ov02_02248DBC
ov02_02248DBC: ; 0x02248DBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02068D74
	add r4, r0, #0
	ldr r0, [r4, #0x6c]
	cmp r0, #0
	beq _02248DD0
	bl sub_02068B48
_02248DD0:
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _02248DDA
	bl ov01_021FCD78
_02248DDA:
	add r0, r5, #0
	bl sub_02068B48
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_02248DBC

	thumb_func_start ov02_02248DE4
ov02_02248DE4: ; 0x02248DE4
	ldr r3, _02248DEC ; =sub_02024758
	ldr r0, [r1, #0x68]
	bx r3
	nop
_02248DEC: .word sub_02024758
	thumb_func_end ov02_02248DE4

	thumb_func_start ov02_02248DF0
ov02_02248DF0: ; 0x02248DF0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldrb r0, [r5]
	lsl r1, r0, #2
	ldr r0, _02248E0C ; =ov02_02253320
	ldr r4, [r0, r1]
_02248DFC:
	ldrb r1, [r5, #1]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _02248DFC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02248E0C: .word ov02_02253320
	thumb_func_end ov02_02248DF0

	thumb_func_start ov02_02248E10
ov02_02248E10: ; 0x02248E10
	push {r3, lr}
	mov r1, #0
	strb r1, [r0, #2]
	ldr r0, [r0, #0x68]
	bl Set2dSpriteVisibleFlag
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov02_02248E10

	thumb_func_start ov02_02248E20
ov02_02248E20: ; 0x02248E20
	push {r4, r5, r6, lr}
	sub sp, #0x30
	ldr r4, _02248F74 ; =ov02_0225339C
	add r2, r0, #0
	ldmia r4!, {r0, r1}
	add r3, sp, #0x24
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _02248F78 ; =ov02_022533CC
	str r0, [r3]
	ldmia r4!, {r0, r1}
	add r3, sp, #0x18
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	add r0, r2, #0
	bl sub_02068D74
	add r4, r0, #0
	mov r3, #1
	add r5, r4, #0
	strb r3, [r4]
	mov r2, #0
	strb r2, [r4, #2]
	strb r2, [r4, #1]
	str r2, [r4, #4]
	add r6, sp, #0x24
	ldmia r6!, {r0, r1}
	add r5, #8
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	str r0, [r5]
	str r2, [r4, #0x14]
	str r2, [r4, #0x18]
	str r2, [r4, #0x1c]
	ldr r0, _02248F7C ; =0x0015E000
	add r2, r4, #0
	add r5, sp, #0x18
	str r0, [r4, #0x38]
	ldmia r5!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	lsl r0, r3, #0xa
	str r0, [r4, #0x50]
	mov r0, #0x2d
	lsl r0, r0, #0xc
	str r0, [r4, #0x40]
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [r4, #0x48]
	lsl r0, r3, #0x11
	str r0, [r4, #0x4c]
	mov r0, #0x2d
	bl GF_CosDeg
	ldr r2, [r4, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r2, [r4, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r4, #0x18]
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x68]
	add r1, sp, #0x24
	bl sub_020247D4
	ldr r0, [r4, #0x68]
	add r1, sp, #0x18
	bl sub_020247F4
	ldr r1, [r4, #0x38]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	ldr r0, [r4, #0x68]
	bl sub_02024818
	ldr r0, [r4, #0x68]
	mov r1, #0x84
	bl sub_02024ADC
	ldr r0, [r4, #0x68]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x60]
	bl ov02_0224B298
	str r0, [r4, #0x6c]
	ldr r0, [r4, #0x5c]
	mov r1, #4
	bl ov01_021FCD2C
	ldr r2, _02248F80 ; =0xFFF88000
	mov r1, #1
	mov r3, #0xc
	str r0, [r4, #0x70]
	bl ov01_021FCD8C
	add r1, sp, #0xc
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _02248F84 ; =ov02_022533A8
	str r0, [r1, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #2
	str r0, [r2]
	ldr r4, [r4, #0x60]
	add r0, r4, #0
	bl sub_0202487C
	add r0, r4, #0
	add r1, sp, #0xc
	bl sub_020247E4
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247F4
	mov r0, #0
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02024818
	add r0, r4, #0
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	bl ov02_022493FC
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_02248F74: .word ov02_0225339C
_02248F78: .word ov02_022533CC
_02248F7C: .word 0x0015E000
_02248F80: .word 0xFFF88000
_02248F84: .word ov02_022533A8
	thumb_func_end ov02_02248E20

	thumb_func_start ov02_02248F88
ov02_02248F88: ; 0x02248F88
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r6, [r5, #0x68]
	ldr r4, [r5, #0x60]
	sub r0, r1, r0
	str r0, [r5, #0x48]
	bpl _02248FA0
	mov r0, #0
	str r0, [r5, #0x48]
_02248FA0:
	mov r0, #2
	ldr r1, [r5, #0x4c]
	lsl r0, r0, #0xa
	cmp r1, r0
	ble _02248FB2
	mov r0, #7
	lsl r0, r0, #0xa
	sub r0, r1, r0
	str r0, [r5, #0x4c]
_02248FB2:
	mov r0, #1
	ldr r1, [r5, #0x4c]
	lsl r0, r0, #0xc
	cmp r1, r0
	bge _02248FBE
	str r0, [r5, #0x4c]
_02248FBE:
	mov r0, #0x2d
	bl GF_CosDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	cmp r0, #0x5a
	bge _02249006
	mov r0, #1
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [r5, #0x40]
_02249006:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	sub r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [r5, #0x2c]
	cmp r1, r0
	bge _02249018
	str r0, [r5, #0x2c]
_02249018:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	sub r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [r5, #0x30]
	cmp r1, r0
	bge _0224902A
	str r0, [r5, #0x30]
_0224902A:
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x2c
	bl sub_020247F4
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x2c
	bl sub_020247F4
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #0
	bl sub_020247D4
	mov r0, #0x12
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bne _0224907A
	mov r0, #0
	str r0, [r5, #4]
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
	b _02249080
_0224907A:
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
_02249080:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_02248F88

	thumb_func_start ov02_02249088
ov02_02249088: ; 0x02249088
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x6c]
	bl ov02_0224B314
	ldr r0, [r4, #0x70]
	mov r1, #2
	mov r2, #0
	mov r3, #0xc
	bl ov01_021FCD8C
	mov r0, #1
	lsl r0, r0, #0xa
	str r0, [r4, #0x50]
	lsl r0, r0, #9
	str r0, [r4, #0x40]
	mov r0, #0
	str r0, [r4, #0x48]
	mov r0, #6
	lsl r0, r0, #0xa
	str r0, [r4, #0x4c]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov02_02249088

	thumb_func_start ov02_022490BC
ov02_022490BC: ; 0x022490BC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r4, [r5, #0x68]
	add r0, r1, r0
	str r0, [r5, #0x48]
	mov r0, #1
	ldr r1, [r5, #0x4c]
	lsl r0, r0, #0xc
	add r2, r1, r0
	lsl r1, r0, #4
	str r2, [r5, #0x4c]
	cmp r2, r1
	ble _022490E0
	lsl r0, r0, #4
	str r0, [r5, #0x4c]
_022490E0:
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x14]
	mov r0, #0x80
	bl GF_SinDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x18]
	mov r0, #0xa
	ldr r1, [r5, #0x40]
	lsl r0, r0, #0x10
	cmp r1, r0
	bge _02249124
	mov r0, #1
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r5, #0x40]
_02249124:
	mov r0, #2
	ldr r1, [r5, #0x38]
	lsl r0, r0, #0xc
	add r1, r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	str r1, [r5, #0x38]
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02024818
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [r5, #0x2c]
	cmp r1, r0
	ble _02249156
	str r0, [r5, #0x2c]
_02249156:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [r5, #0x30]
	cmp r1, r0
	ble _02249168
	str r0, [r5, #0x30]
_02249168:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x2c
	bl sub_020247F4
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	ldr r1, [sp, #4]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r1, r0, #0xc
	mov r0, #0xf
	mvn r0, r0
	cmp r1, r0
	bgt _022491A2
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
_022491A2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov02_022490BC

	thumb_func_start ov02_022491A8
ov02_022491A8: ; 0x022491A8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x68]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x60]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	str r0, [r4, #4]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_022491A8

	thumb_func_start ov02_022491CC
ov02_022491CC: ; 0x022491CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0x14
	bge _022491E2
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022491E2:
	ldr r3, _02249284 ; =ov02_022533D8
	add r2, sp, #0xc
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _02249288 ; =ov02_022533B4
	str r0, [r2]
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	add r5, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r7, #0
	str r0, [r2]
	add r2, r4, #0
	str r7, [r4, #4]
	add r3, r6, #0
	ldmia r3!, {r0, r1}
	add r2, #8
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	str r7, [r4, #0x14]
	str r7, [r4, #0x18]
	str r7, [r4, #0x1c]
	str r7, [r4, #0x38]
	add r2, r4, #0
	ldmia r5!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r2]
	lsl r1, r1, #8
	ldr r0, _0224928C ; =0x0013B000
	str r1, [r4, #0x50]
	str r0, [r4, #0x40]
	lsl r0, r1, #0xa
	str r0, [r4, #0x48]
	lsl r0, r1, #4
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x68]
	add r1, r6, #0
	bl sub_020247D4
	ldr r0, [r4, #0x68]
	add r1, sp, #0
	bl sub_020247F4
	ldr r1, [r4, #0x38]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	ldr r0, [r4, #0x68]
	bl sub_02024818
	ldr r0, [r4, #0x68]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x60]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x60]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02249284: .word ov02_022533D8
_02249288: .word ov02_022533B4
_0224928C: .word 0x0013B000
	thumb_func_end ov02_022491CC

	thumb_func_start ov02_02249290
ov02_02249290: ; 0x02249290
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r4, [r5, #0x68]
	sub r0, r1, r0
	str r0, [r5, #0x48]
	mov r0, #1
	ldr r1, [r5, #0x4c]
	lsl r0, r0, #0x10
	cmp r1, r0
	bge _022492B0
	lsr r0, r0, #3
	add r0, r1, r0
	str r0, [r5, #0x4c]
_022492B0:
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bge _022492BA
	mov r0, #0
	str r0, [r5, #0x48]
_022492BA:
	ldr r0, _02249398 ; =0x0000013B
	bl GF_CosDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	cmp r0, #0xb4
	bge _02249302
	mov r0, #1
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [r5, #0x40]
_02249302:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	sub r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, #0x2c]
	cmp r1, r0
	bge _02249314
	str r0, [r5, #0x2c]
_02249314:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	sub r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xa
	str r1, [r5, #0x30]
	cmp r1, r0
	bge _02249326
	str r0, [r5, #0x30]
_02249326:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x2c
	bl sub_020247F4
	mov r0, #6
	ldr r1, [r5, #0x38]
	lsl r0, r0, #0xc
	add r1, r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	str r1, [r5, #0x38]
	cmp r0, #0x3c
	ble _0224934C
	mov r0, #0xf
	lsl r0, r0, #0xe
	str r0, [r5, #0x38]
_0224934C:
	ldr r1, [r5, #0x38]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02024818
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bgt _02249390
	add r0, r4, #0
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
_02249390:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02249398: .word 0x0000013B
	thumb_func_end ov02_02249290

	thumb_func_start ov02_0224939C
ov02_0224939C: ; 0x0224939C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #8
	bne _022493BA
	ldr r0, [r4, #0x60]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x5c]
	mov r1, #0
	bl ov02_02249444
_022493BA:
	ldr r0, [r4, #4]
	cmp r0, #0xa
	bne _022493C8
	ldr r0, [r4, #0x60]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_022493C8:
	ldr r0, [r4, #4]
	cmp r0, #0xf
	ble _022493E6
	ldr r0, [r4, #0x70]
	bl ov01_021FCD6C
	cmp r0, #1
	bne _022493E6
	mov r0, #0
	str r0, [r4, #4]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #2
	strb r0, [r4, #2]
_022493E6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224939C

	thumb_func_start ov02_022493EC
ov02_022493EC: ; 0x022493EC
	mov r0, #0
	bx lr
	thumb_func_end ov02_022493EC

	thumb_func_start ov02_022493F0
ov02_022493F0: ; 0x022493F0
	ldr r3, _022493F8 ; =NARC_ctor
	mov r0, #0x5d
	mov r1, #4
	bx r3
	.balign 4, 0
_022493F8: .word NARC_ctor
	thumb_func_end ov02_022493F0

	thumb_func_start ov02_022493FC
ov02_022493FC: ; 0x022493FC
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r3, _0224941C ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	nop
_0224941C: .word 0x00007FFF
	thumb_func_end ov02_022493FC

	thumb_func_start ov02_02249420
ov02_02249420: ; 0x02249420
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _02249440 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	.balign 4, 0
_02249440: .word 0x00007FFF
	thumb_func_end ov02_02249420

	thumb_func_start ov02_02249444
ov02_02249444: ; 0x02249444
	push {r4, lr}
	ldr r0, [r0, #0x40]
	add r4, r1, #0
	bl PlayerAvatar_GetMapObject
	add r1, r4, #0
	bl sub_0205F690
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249444

	thumb_func_start ov02_02249458
ov02_02249458: ; 0x02249458
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov02_0224955C
	add r4, r0, #0
	str r6, [r4, #0x5c]
	strh r7, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	str r5, [r4, #0x20]
	ldr r0, [r4, #0x60]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	mov r1, #0x82
	lsl r1, r1, #2
	str r0, [r4, r1]
	cmp r5, #0
	bne _02249490
	ldr r0, _022494B8 ; =ov02_02249584
	add r1, r4, #0
	mov r2, #0x86
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
_02249490:
	cmp r5, #2
	bne _022494AC
	ldr r0, [sp]
	bl FollowingPokemon_GetMapObject
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _022494BC ; =ov02_022499B8
	add r1, r4, #0
	mov r2, #0x86
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
_022494AC:
	ldr r0, _022494C0 ; =ov02_02249984
	add r1, r4, #0
	mov r2, #0x86
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022494B8: .word ov02_02249584
_022494BC: .word ov02_022499B8
_022494C0: .word ov02_02249984
	thumb_func_end ov02_02249458

	thumb_func_start ov02_022494C4
ov02_022494C4: ; 0x022494C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov02_0224955C
	add r4, r0, #0
	str r5, [r4, #0x5c]
	mov r0, #0
	strh r0, [r4, #0xc]
	mov r0, #2
	strh r0, [r4, #0xe]
	mov r0, #3
	str r0, [r4, #0x20]
	mov r0, #0x82
	lsl r0, r0, #2
	str r6, [r4, r0]
	add r0, r0, #4
	str r7, [r4, r0]
	ldr r0, [r4, #0x60]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [sp]
	ldr r0, [sp, #0xc]
	sub r0, r1, r0
	mov r1, #2
	lsl r1, r1, #0xc
	bl FX_Div
	mov r1, #0xbb
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	add r0, r2, r0
	str r0, [r4, r1]
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x14]
	add r1, #8
	sub r0, r2, r0
	str r0, [r4, r1]
	ldr r0, _02249538 ; =ov02_022499B8
	add r1, r4, #0
	mov r2, #0x86
	bl CreateSysTask
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02249538: .word ov02_022499B8
	thumb_func_end ov02_022494C4

	thumb_func_start ov02_0224953C
ov02_0224953C: ; 0x0224953C
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224953C

	thumb_func_start ov02_02249548
ov02_02249548: ; 0x02249548
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F988
	bl ov02_0224957C
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end ov02_02249548

	thumb_func_start ov02_0224955C
ov02_0224955C: ; 0x0224955C
	push {r3, r4, r5, lr}
	mov r1, #0xbe
	add r5, r0, #0
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	mov r2, #0xbe
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	str r5, [r4, #0x60]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224955C

	thumb_func_start ov02_0224957C
ov02_0224957C: ; 0x0224957C
	ldr r3, _02249580 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02249580: .word FreeToHeap
	thumb_func_end ov02_0224957C

	thumb_func_start ov02_02249584
ov02_02249584: ; 0x02249584
	push {r3, r4, r5, lr}
	ldr r4, _022495B4 ; =ov02_02253550
	add r5, r1, #0
_0224958A:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _0224958A
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _022495B2
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022495AC
	bl sub_02068BAC
_022495AC:
	add r0, r5, #0
	bl ov02_0224A32C
_022495B2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022495B4: .word ov02_02253550
	thumb_func_end ov02_02249584

	thumb_func_start ov02_022495B8
ov02_022495B8: ; 0x022495B8
	push {r4, lr}
	add r4, r0, #0
	bl ov02_02249EC0
	add r0, r4, #0
	bl ov02_02249CF0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_022495B8

	thumb_func_start ov02_022495D0
ov02_022495D0: ; 0x022495D0
	push {r4, lr}
	add r4, r0, #0
	bl ov02_02249F6C
	add r0, r4, #0
	bl ov02_02249CF0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_022495D0

	thumb_func_start ov02_022495E8
ov02_022495E8: ; 0x022495E8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022495FE
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_022495FE:
	ldr r5, _02249650 ; =ov02_02253408
	add r3, sp, #0xc
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	ldr r5, _02249654 ; =ov02_02253384
	str r0, [r3]
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r2, #0
	str r0, [r3]
	add r0, r4, #0
	bl ov02_0224A418
	mov r1, #0x79
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	add r1, sp, #0
	bl ov02_0224A9B8
	mov r1, #0x7a
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ov02_0224A9D8
	add r0, r4, #0
	bl ov02_02249D40
	mov r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02249650: .word ov02_02253408
_02249654: .word ov02_02253384
	thumb_func_end ov02_022495E8

	thumb_func_start ov02_02249658
ov02_02249658: ; 0x02249658
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224B72C
	mov r0, #0
	ldr r1, _0224968C ; =0xFFFC0000
	str r0, [r4, #0x2c]
	str r1, [r4, #0x54]
	mov r1, #0xfe
	lsl r1, r1, #0xc
	str r1, [r4, #0x44]
	mov r1, #0xff
	lsl r1, r1, #0xc
	str r1, [r4, #0x48]
	mov r1, #0x5f
	lsl r1, r1, #0xc
	str r1, [r4, #0x4c]
	mov r1, #0x61
	lsl r1, r1, #0xc
	str r1, [r4, #0x50]
	mov r1, #1
	str r1, [r4, #0x2c]
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	pop {r4, pc}
	.balign 4, 0
_0224968C: .word 0xFFFC0000
	thumb_func_end ov02_02249658

	thumb_func_start ov02_02249690
ov02_02249690: ; 0x02249690
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r2, #0
	str r2, [r4, #0x2c]
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x54]
	add r0, r1, r0
	str r0, [r4, #0x44]
	cmp r0, #0
	bgt _022496B4
	mov r0, #2
	str r2, [r4, #0x44]
	lsl r0, r0, #0xc
	str r0, [r4, #0x54]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022496B4:
	ldr r0, [r4, #0x50]
	str r0, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x48]
	add r0, r4, #0
	bl ov02_0224A69C
	mov r0, #1
	str r0, [r4, #0x2c]
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249690

	thumb_func_start ov02_022496D0
ov02_022496D0: ; 0x022496D0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x54]
	sub r0, r1, r0
	str r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	ldr r0, [r4, #0x54]
	add r0, r1, r0
	str r0, [r4, #0x50]
	mov r0, #2
	ldr r1, [r4, #0x54]
	lsl r0, r0, #0xc
	add r2, r1, r0
	lsl r1, r0, #4
	str r2, [r4, #0x54]
	cmp r2, r1
	ble _022496FE
	lsl r0, r0, #4
	str r0, [r4, #0x54]
_022496FE:
	mov r0, #0xe
	ldr r1, [r4, #0x4c]
	lsl r0, r0, #0xe
	cmp r1, r0
	bge _0224970A
	str r0, [r4, #0x4c]
_0224970A:
	mov r0, #0x22
	ldr r1, [r4, #0x50]
	lsl r0, r0, #0xe
	cmp r1, r0
	ble _02249716
	str r0, [r4, #0x50]
_02249716:
	ldr r0, [r4, #0x50]
	str r0, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x48]
	add r0, r4, #0
	bl ov02_0224A69C
	mov r0, #1
	str r0, [r4, #0x2c]
	mov r0, #0xe
	ldr r1, [r4, #0x4c]
	lsl r0, r0, #0xe
	cmp r1, r0
	bne _0224974E
	mov r0, #0x22
	ldr r1, [r4, #0x50]
	lsl r0, r0, #0xe
	cmp r1, r0
	bne _0224974E
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov02_0224A450
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0224974E:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov02_022496D0

	thumb_func_start ov02_02249754
ov02_02249754: ; 0x02249754
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	cmp r1, #0xf
	blt _0224976C
	mov r1, #0
	str r1, [r0, #8]
	ldr r1, _02249770 ; =0xFFFC0000
	str r1, [r0, #0x58]
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
_0224976C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02249770: .word 0xFFFC0000
	thumb_func_end ov02_02249754

	thumb_func_start ov02_02249774
ov02_02249774: ; 0x02249774
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020248AC
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp]
	ldr r0, [r4, #0x58]
	add r1, r1, r0
	mov r0, #0xa
	lsl r0, r0, #0x10
	str r1, [sp]
	cmp r1, r0
	bgt _022497AC
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [sp]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022497AC:
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl sub_020247D4
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249774

	thumb_func_start ov02_022497C0
ov02_022497C0: ; 0x022497C0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #0x58]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	ldr r0, _02249834 ; =0xFFFFE000
	str r1, [r4, #0x58]
	cmp r1, r0
	ble _02249802
	str r0, [r4, #0x58]
	ldr r0, [r4]
	mov r1, #5
	add r0, r0, #1
	str r0, [r4]
	ldr r0, [r4, #0x5c]
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	ldr r0, [r4, #0x5c]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r5, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
_02249802:
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020248AC
	add r5, r0, #0
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r1, [sp]
	ldr r0, [r4, #0x58]
	add r0, r1, r0
	str r0, [sp]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r2, #0
	bl sub_020247D4
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02249834: .word 0xFFFFE000
	thumb_func_end ov02_022497C0

	thumb_func_start ov02_02249838
ov02_02249838: ; 0x02249838
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	cmp r1, #8
	blt _02249850
	mov r1, #0
	str r1, [r0, #8]
	ldr r1, _02249854 ; =0xFFFFF000
	str r1, [r0, #0x58]
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
_02249850:
	mov r0, #0
	bx lr
	.balign 4, 0
_02249854: .word 0xFFFFF000
	thumb_func_end ov02_02249838

	thumb_func_start ov02_02249858
ov02_02249858: ; 0x02249858
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x58]
	lsl r1, r0, #1
	ldr r0, _022498B4 ; =0xFFFC0000
	str r1, [r4, #0x58]
	cmp r1, r0
	bge _0224986C
	str r0, [r4, #0x58]
_0224986C:
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020248AC
	add r5, r0, #0
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r1, [sp]
	ldr r0, [r4, #0x58]
	add r0, r1, r0
	str r0, [sp]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r2, #0
	bl sub_020247D4
	ldr r1, [sp]
	ldr r0, _022498B8 ; =0xFFFD8000
	cmp r1, r0
	bgt _022498AC
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x54]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022498AC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022498B4: .word 0xFFFC0000
_022498B8: .word 0xFFFD8000
	thumb_func_end ov02_02249858

	thumb_func_start ov02_022498BC
ov02_022498BC: ; 0x022498BC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x54]
	add r0, r1, r0
	str r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	ldr r0, [r4, #0x54]
	sub r0, r1, r0
	str r0, [r4, #0x50]
	mov r0, #1
	ldr r1, [r4, #0x54]
	lsl r0, r0, #0xe
	add r2, r1, r0
	lsl r1, r0, #2
	str r2, [r4, #0x54]
	cmp r2, r1
	ble _022498EA
	lsl r0, r0, #2
	str r0, [r4, #0x54]
_022498EA:
	mov r0, #0x5f
	ldr r1, [r4, #0x4c]
	lsl r0, r0, #0xc
	cmp r1, r0
	blt _022498F6
	str r0, [r4, #0x4c]
_022498F6:
	mov r0, #0x61
	ldr r1, [r4, #0x50]
	lsl r0, r0, #0xc
	cmp r1, r0
	bgt _02249902
	str r0, [r4, #0x50]
_02249902:
	ldr r0, [r4, #0x50]
	str r0, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x48]
	add r0, r4, #0
	bl ov02_0224A69C
	mov r0, #1
	str r0, [r4, #0x2c]
	mov r0, #0x5f
	ldr r1, [r4, #0x4c]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _0224993A
	mov r0, #0x61
	ldr r1, [r4, #0x50]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _0224993A
	add r0, r4, #0
	bl ov02_0224B768
	mov r0, #0x11
	str r0, [r4, #0x34]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0224993A:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov02_022498BC

	thumb_func_start ov02_02249940
ov02_02249940: ; 0x02249940
	push {r4, lr}
	add r4, r0, #0
	bl ov02_02249FD4
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	pop {r4, pc}
	thumb_func_end ov02_02249940

	thumb_func_start ov02_02249954
ov02_02249954: ; 0x02249954
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224A028
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	pop {r4, pc}
	thumb_func_end ov02_02249954

	thumb_func_start ov02_02249968
ov02_02249968: ; 0x02249968
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224A6D0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249968

	thumb_func_start ov02_0224997C
ov02_0224997C: ; 0x0224997C
	mov r1, #1
	str r1, [r0, #4]
	mov r0, #0
	bx lr
	thumb_func_end ov02_0224997C

	thumb_func_start ov02_02249984
ov02_02249984: ; 0x02249984
	push {r3, r4, r5, lr}
	ldr r4, _022499B4 ; =ov02_02253588
	add r5, r1, #0
_0224998A:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _0224998A
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _022499B2
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022499AC
	bl sub_02068BAC
_022499AC:
	add r0, r5, #0
	bl ov02_0224A32C
_022499B2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022499B4: .word ov02_02253588
	thumb_func_end ov02_02249984

	thumb_func_start ov02_022499B8
ov02_022499B8: ; 0x022499B8
	push {r3, r4, r5, lr}
	ldr r4, _022499E8 ; =ov02_022534F0
	add r5, r1, #0
_022499BE:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _022499BE
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _022499E6
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022499E0
	bl sub_02068BAC
_022499E0:
	add r0, r5, #0
	bl ov02_0224A32C
_022499E6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022499E8: .word ov02_022534F0
	thumb_func_end ov02_022499B8

	thumb_func_start ov02_022499EC
ov02_022499EC: ; 0x022499EC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02249A02
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_02249A02:
	ldr r5, _02249A54 ; =ov02_022533FC
	add r3, sp, #0xc
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	ldr r5, _02249A58 ; =ov02_02253414
	str r0, [r3]
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r2, #0
	str r0, [r3]
	add r0, r4, #0
	bl ov02_0224A418
	mov r1, #0x79
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	add r1, sp, #0
	bl ov02_0224A9B8
	mov r1, #0x7a
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ov02_0224A9D8
	add r0, r4, #0
	bl ov02_02249D40
	mov r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02249A54: .word ov02_022533FC
_02249A58: .word ov02_02253414
	thumb_func_end ov02_022499EC

	thumb_func_start ov02_02249A5C
ov02_02249A5C: ; 0x02249A5C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	mov r3, #0x85
	add r4, r0, #0
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	cmp r0, #0
	bne _02249A72
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02249A72:
	ldr r6, _02249AC0 ; =ov02_02253348
	add r5, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	str r0, [r5]
	add r0, r3, #0
	add r0, #0xd8
	ldr r1, [sp]
	ldr r0, [r4, r0]
	add r3, #0xe0
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r4, r3]
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r2, #0
	bl ov02_0224A418
	mov r1, #0x79
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	bl ov02_02249D40
	mov r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02249AC0: .word ov02_02253348
	thumb_func_end ov02_02249A5C

	thumb_func_start ov02_02249AC4
ov02_02249AC4: ; 0x02249AC4
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224A8D4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249AC4

	thumb_func_start ov02_02249AD8
ov02_02249AD8: ; 0x02249AD8
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224A4D0
	add r0, r4, #0
	bl ov02_02249D18
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_02249AD8

	thumb_func_start ov02_02249AF0
ov02_02249AF0: ; 0x02249AF0
	push {r4, lr}
	mov r1, #0x85
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02249B02
	mov r0, #0
	pop {r4, pc}
_02249B02:
	bl ov02_02249D40
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov02_02249AF0

	thumb_func_start ov02_02249B10
ov02_02249B10: ; 0x02249B10
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224AB58
	add r0, r4, #0
	bl ov02_0224AC38
	add r0, r4, #0
	bl ov02_0224A690
	add r0, r4, #0
	mov r1, #1
	bl ov02_0224B6B0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249B10

	thumb_func_start ov02_02249B38
ov02_02249B38: ; 0x02249B38
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224AB8C
	cmp r0, #2
	beq _02249B48
	mov r0, #0
	pop {r4, pc}
_02249B48:
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249B38

	thumb_func_start ov02_02249B60
ov02_02249B60: ; 0x02249B60
	push {r3, lr}
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	cmp r1, #0x14
	blt _02249B7A
	mov r1, #0
	str r1, [r0, #8]
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	bl ov02_0224ADF0
_02249B7A:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02249B60

	thumb_func_start ov02_02249B80
ov02_02249B80: ; 0x02249B80
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	add r1, r1, #1
	str r1, [r4, #8]
	cmp r1, #0x14
	blt _02249BA2
	mov r1, #0
	str r1, [r4, #8]
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	bl ov02_0224AB58
	add r0, r4, #0
	bl ov02_0224ADF0
_02249BA2:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249B80

	thumb_func_start ov02_02249BA8
ov02_02249BA8: ; 0x02249BA8
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224AB8C
	cmp r0, #3
	beq _02249BB8
	mov r0, #0
	pop {r4, pc}
_02249BB8:
	ldr r0, _02249BD4 ; =SEQ_SE_DP_FW019
	bl PlaySE
	mov r0, #2
	lsl r0, r0, #0xa
	str r0, [r4, #0x54]
	mov r0, #2
	str r0, [r4, #0x14]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	nop
_02249BD4: .word SEQ_SE_DP_FW019
	thumb_func_end ov02_02249BA8

	thumb_func_start ov02_02249BD8
ov02_02249BD8: ; 0x02249BD8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x54]
	add r0, r1, r0
	str r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	ldr r0, [r4, #0x54]
	sub r0, r1, r0
	str r0, [r4, #0x50]
	mov r0, #2
	ldr r1, [r4, #0x54]
	lsl r0, r0, #0xa
	add r2, r1, r0
	lsl r1, r0, #5
	str r2, [r4, #0x54]
	cmp r2, r1
	ble _02249C06
	lsl r0, r0, #5
	str r0, [r4, #0x54]
_02249C06:
	mov r0, #0x5f
	ldr r1, [r4, #0x4c]
	lsl r0, r0, #0xc
	cmp r1, r0
	blt _02249C12
	str r0, [r4, #0x4c]
_02249C12:
	mov r0, #0x61
	ldr r1, [r4, #0x50]
	lsl r0, r0, #0xc
	cmp r1, r0
	bgt _02249C1E
	str r0, [r4, #0x50]
_02249C1E:
	ldr r0, [r4, #0x50]
	str r0, [sp]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	ldr r3, [r4, #0x48]
	add r0, r4, #0
	bl ov02_0224A69C
	mov r0, #1
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _02249C4A
	add r0, r4, #0
	bl ov02_0224AB8C
	cmp r0, #4
	bne _02249C4A
	mov r0, #1
	str r0, [r4, #0x18]
	bl ov02_02249420
_02249C4A:
	mov r0, #0x5f
	ldr r1, [r4, #0x4c]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _02249C6C
	mov r0, #0x61
	ldr r1, [r4, #0x50]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _02249C6C
	mov r0, #0x11
	str r0, [r4, #0x34]
	mov r0, #1
	str r0, [r4, #0x14]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_02249C6C:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249BD8

	thumb_func_start ov02_02249C74
ov02_02249C74: ; 0x02249C74
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x20]
	cmp r1, #3
	bne _02249C96
	bl ov02_0224AB8C
	cmp r0, #2
	bne _02249C92
	add r0, r4, #0
	bl ov02_0224AB9C
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
_02249C92:
	mov r0, #0
	pop {r4, pc}
_02249C96:
	ldr r1, [r4, #0x18]
	cmp r1, #0
	bne _02249CAC
	bl ov02_0224AB8C
	cmp r0, #4
	bne _02249CAC
	mov r0, #1
	str r0, [r4, #0x18]
	bl ov02_02249420
_02249CAC:
	add r0, r4, #0
	bl ov02_0224AB8C
	cmp r0, #2
	beq _02249CBA
	mov r0, #0
	pop {r4, pc}
_02249CBA:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _02249CC8
	mov r0, #1
	str r0, [r4, #0x18]
	bl ov02_02249420
_02249CC8:
	add r0, r4, #0
	bl ov02_0224AB9C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_02249C74

	thumb_func_start ov02_02249CD8
ov02_02249CD8: ; 0x02249CD8
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02249CEA
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_02249CEA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02249CD8

	thumb_func_start ov02_02249CF0
ov02_02249CF0: ; 0x02249CF0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x21
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02249D14 ; =ov02_02249D5C
	add r1, r4, #0
	mov r2, #0x80
	bl sub_0200E33C
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_02249D14: .word ov02_02249D5C
	thumb_func_end ov02_02249CF0

	thumb_func_start ov02_02249D18
ov02_02249D18: ; 0x02249D18
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x21
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _02249D3C ; =ov02_02249E58
	add r1, r4, #0
	mov r2, #0x80
	bl sub_0200E33C
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_02249D3C: .word ov02_02249E58
	thumb_func_end ov02_02249D18

	thumb_func_start ov02_02249D40
ov02_02249D40: ; 0x02249D40
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02249D5A
	bl DestroySysTask
	mov r0, #0x22
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
_02249D5A:
	pop {r4, pc}
	thumb_func_end ov02_02249D40

	thumb_func_start ov02_02249D5C
ov02_02249D5C: ; 0x02249D5C
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0x21
	add r6, r1, #0
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _02249DD2
	mov r7, #0x6b
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_02249D72:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02249D7C
	bl sub_0200ADA4
_02249D7C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02249D72
	mov r7, #0x6f
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02249D8C:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02249D96
	bl sub_0200B00C
_02249D96:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #3
	blt _02249D8C
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	cmp r1, #0
	beq _02249DAE
	add r0, r6, #0
	bl ov02_0224A834
_02249DAE:
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	cmp r1, #0
	beq _02249DBE
	add r0, r6, #0
	bl ov02_0224A88C
_02249DBE:
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r1, [r6, r0]
	mov r2, #0x80
	add r1, r1, #1
	str r1, [r6, r0]
	ldr r0, _02249DD4 ; =ov02_02249DD8
	add r1, r6, #0
	bl sub_0200E374
_02249DD2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02249DD4: .word ov02_02249DD8
	thumb_func_end ov02_02249D5C

	thumb_func_start ov02_02249DD8
ov02_02249DD8: ; 0x02249DD8
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r0, #0x21
	add r6, r1, #0
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	cmp r0, #1
	bne _02249E56
	mov r7, #0x6b
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_02249DF0:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02249DFA
	bl sub_0200A740
_02249DFA:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02249DF0
	mov r7, #0x6f
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02249E0A:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02249E14
	bl sub_0200A740
_02249E14:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #3
	blt _02249E0A
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02249E32
	bl FreeToHeap
	mov r0, #0x86
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r6, r0]
_02249E32:
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02249E48
	bl FreeToHeap
	mov r0, #0x87
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r6, r0]
_02249E48:
	mov r0, #0x85
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r6, r0]
	ldr r0, [sp]
	bl DestroySysTask
_02249E56:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02249DD8

	thumb_func_start ov02_02249E58
ov02_02249E58: ; 0x02249E58
	push {r4, lr}
	mov r0, #0x67
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Get2DGfxResObjById
	mov r1, #0x21
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02249E8A
	bl sub_0200ADA4
	ldr r0, _02249E8C ; =ov02_02249E90
	add r1, r4, #0
	mov r2, #0x80
	bl sub_0200E374
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_02249E8A:
	pop {r4, pc}
	.balign 4, 0
_02249E8C: .word ov02_02249E90
	thumb_func_end ov02_02249E58

	thumb_func_start ov02_02249E90
ov02_02249E90: ; 0x02249E90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x67
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Get2DGfxResObjById
	mov r1, #0x21
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _02249EBE
	bl sub_0200A740
	mov r0, #0x85
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	bl DestroySysTask
_02249EBE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02249E90

	thumb_func_start ov02_02249EC0
ov02_02249EC0: ; 0x02249EC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov02_0224A074
	mov r2, #3
	mov r3, #1
	add r4, r0, #0
	lsl r2, r2, #0x12
	add r0, r5, #0
	mov r1, #0
	lsl r3, r3, #0xc
	str r2, [sp]
	bl ov02_0224A69C
	add r0, r5, #0
	bl ov02_0224A648
	ldr r0, [r5, #0x60]
	mov r1, #0
	ldr r0, [r0, #8]
	bl GetBgPriority
	strh r0, [r5, #0x24]
	ldr r0, [r5, #0x60]
	mov r1, #3
	ldr r0, [r0, #8]
	bl GetBgPriority
	strh r0, [r5, #0x26]
	ldr r2, _02249F68 ; =0x0400000A
	mov r1, #3
	ldrh r3, [r2]
	mov r0, #1
	bic r3, r1
	orr r0, r3
	strh r0, [r2]
	ldrh r0, [r2, #4]
	bic r0, r1
	strh r0, [r2, #4]
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r2, r5, #0
	add r0, r4, #0
#ifdef HEARTGOLD
	mov r1, #2
#else
	mov r1, #5
#endif
	add r2, #0x6c
	bl ov02_0224A570
	ldr r0, [r5, #0x60]
	add r3, r5, #0
	ldr r0, [r0, #8]
	add r1, r4, #0
#ifdef HEARTGOLD
	mov r2, #0
#else
	mov r2, #3
#endif
	add r3, #0x68
	bl ov02_0224A598
	ldr r0, [r5, #0x60]
	add r3, r5, #0
	ldr r0, [r0, #8]
	add r1, r4, #0
#ifdef HEARTGOLD
	mov r2, #1
#else
	mov r2, #4
#endif
	add r3, #0x64
	bl ov02_0224A5D0
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224A080
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #4
	mov r1, #0x20
	bl sub_020689C8
	mov r1, #0x1e
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02249F68: .word 0x0400000A
	thumb_func_end ov02_02249EC0

	thumb_func_start ov02_02249F6C
ov02_02249F6C: ; 0x02249F6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov02_0224A074
	add r4, r0, #0
	ldr r0, [r5, #0x60]
	mov r1, #0
	ldr r0, [r0, #8]
	bl GetBgPriority
	strh r0, [r5, #0x24]
	ldr r0, [r5, #0x60]
	mov r1, #3
	ldr r0, [r0, #8]
	bl GetBgPriority
	strh r0, [r5, #0x26]
	ldr r2, _02249FD0 ; =0x0400000A
	mov r1, #3
	ldrh r3, [r2]
	mov r0, #1
	bic r3, r1
	orr r0, r3
	strh r0, [r2]
	ldrh r0, [r2, #4]
	bic r0, r1
	strh r0, [r2, #4]
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224A080
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #4
	mov r1, #0x20
	bl sub_020689C8
	mov r1, #0x1e
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02249FD0: .word 0x0400000A
	thumb_func_end ov02_02249F6C

	thumb_func_start ov02_02249FD4
ov02_02249FD4: ; 0x02249FD4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020689F8
	ldr r0, [r4, #0x60]
	ldr r0, [r0, #8]
	bl ov02_0224A63C
	add r0, r4, #0
	bl ov02_0224A288
	ldr r2, _0224A024 ; =0x04000008
	ldrh r1, [r4, #0x24]
	ldrh r3, [r2]
	mov r0, #3
	bic r3, r0
	orr r1, r3
	strh r1, [r2]
	ldrh r1, [r2, #6]
	bic r1, r0
	ldrh r0, [r4, #0x26]
	orr r0, r1
	strh r0, [r2, #6]
	mov r0, #0
	mov r1, #1
	bl sub_0205B4EC
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	nop
_0224A024: .word 0x04000008
	thumb_func_end ov02_02249FD4

	thumb_func_start ov02_0224A028
ov02_0224A028: ; 0x0224A028
	push {r4, lr}
	add r4, r0, #0
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020689F8
	add r0, r4, #0
	bl ov02_0224A288
	ldr r2, _0224A070 ; =0x04000008
	ldrh r1, [r4, #0x24]
	ldrh r3, [r2]
	mov r0, #3
	bic r3, r0
	orr r1, r3
	strh r1, [r2]
	ldrh r1, [r2, #6]
	bic r1, r0
	ldrh r0, [r4, #0x26]
	orr r0, r1
	strh r0, [r2, #6]
	mov r0, #0
	mov r1, #1
	bl sub_0205B4EC
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	nop
_0224A070: .word 0x04000008
	thumb_func_end ov02_0224A028

	thumb_func_start ov02_0224A074
ov02_0224A074: ; 0x0224A074
	ldr r3, _0224A07C ; =NARC_ctor
	mov r0, #0x5d
	mov r1, #4
	bx r3
	.balign 4, 0
_0224A07C: .word NARC_ctor
	thumb_func_end ov02_0224A074

	thumb_func_start ov02_0224A080
ov02_0224A080: ; 0x0224A080
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	mov r1, #0x7e
	add r5, r0, #0
	lsl r1, r1, #2
	add r1, r5, r1
	bl ov02_0224A7A8
	add r1, r5, #0
	mov r0, #0x20
	add r1, #0x74
	mov r2, #4
	bl G2dRenderer_Init
	str r0, [r5, #0x70]
	add r0, r5, #0
	mov r2, #2
	add r0, #0x74
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r0, #4
	mov r1, #0
	add r2, r0, #0
	bl Create2DGfxResObjMan
	mov r1, #0x67
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	mov r1, #1
	mov r2, #4
	bl Create2DGfxResObjMan
	mov r1, #0x1a
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #4
	mov r1, #2
	add r2, r0, #0
	bl Create2DGfxResObjMan
	mov r1, #0x69
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	mov r1, #3
	mov r2, #4
	bl Create2DGfxResObjMan
	mov r1, #0x6a
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #4
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #0xe
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldrh r2, [r5, #0xe]
	sub r1, #0x10
	ldr r0, [r5, r1]
	lsl r3, r2, #1
	ldr r2, _0224A278 ; =ov02_02253304
	add r1, r6, #0
	ldrh r2, [r2, r3]
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x1b
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_0224A810
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r4, #0
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #4
	sub r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #6
	add r3, r4, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldrh r2, [r5, #0xe]
	add r4, r4, #1
	cmp r2, #0
	beq _0224A196
	mov r0, #1
	sub r2, r2, #1
	str r0, [sp]
	lsl r3, r2, #1
	ldr r2, _0224A27C ; =ov02_022532FC
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #4
	ldrh r2, [r2, r3]
	sub r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r4, r4, #1
_0224A196:
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_0224A868
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r2, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	sub r1, #0x18
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #0xf
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldrh r2, [r5, #0xe]
	sub r1, #0x24
	ldr r0, [r5, r1]
	lsl r3, r2, #1
	ldr r2, _0224A280 ; =ov02_02253310
	add r1, r6, #0
	ldrh r2, [r2, r3]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x73
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	sub r1, #0x28
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #0xa
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x1d
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #4
	sub r1, #0x28
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #0x10
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x76
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldrh r2, [r5, #0xe]
	sub r1, #0x30
	ldr r0, [r5, r1]
	lsl r3, r2, #1
	ldr r2, _0224A284 ; =ov02_0225330A
	add r1, r6, #0
	ldrh r2, [r2, r3]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x77
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r1, #0x1c
	ldr r0, [r5, #0x5c]
	add r1, r5, r1
	mov r2, #4
	bl ov02_0224A7B8
	mov r1, #0x86
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x20
	add r0, r5, r1
	mov r1, #4
	bl ov02_0224A800
	mov r1, #0x87
	lsl r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0224A278: .word ov02_02253304
_0224A27C: .word ov02_022532FC
_0224A280: .word ov02_02253310
_0224A284: .word ov02_0225330A
	thumb_func_end ov02_0224A080

	thumb_func_start ov02_0224A288
ov02_0224A288: ; 0x0224A288
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0x6b
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0224A294:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0224A29E
	bl sub_0200AEB0
_0224A29E:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0224A294
	mov r7, #0x6f
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_0224A2AE:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0224A2B8
	bl sub_0200B0A8
_0224A2B8:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #3
	blt _0224A2AE
	mov r7, #0x72
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_0224A2C8:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0224A2D2
	bl sub_0200A740
_0224A2D2:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _0224A2C8
	mov r7, #0x76
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_0224A2E2:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0224A2EC
	bl sub_0200A740
_0224A2EC:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #2
	blt _0224A2E2
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl Destroy2DGfxResObjMan
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl Destroy2DGfxResObjMan
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl Destroy2DGfxResObjMan
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl Destroy2DGfxResObjMan
	ldr r0, [r6, #0x70]
	bl sub_02024544
	ldr r0, [r6, #0x70]
	bl sub_02024504
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A288

	thumb_func_start ov02_0224A32C
ov02_0224A32C: ; 0x0224A32C
	push {r3, lr}
	ldr r0, [r0, #0x70]
	cmp r0, #0
	beq _0224A338
	bl sub_0202457C
_0224A338:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A32C

	thumb_func_start ov02_0224A33C
ov02_0224A33C: ; 0x0224A33C
	push {r4, r5, r6, lr}
	sub sp, #0x70
	add r5, r0, #0
	ldr r0, [sp, #0x84]
	add r4, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	cmp r0, #4
	bne _0224A384
	mov r0, #0
	mvn r0, r0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	mov r6, #0x67
	ldr r3, [sp, #0x88]
	str r0, [sp, #0xc]
	lsl r6, r6, #2
	str r3, [sp, #0x10]
	ldr r3, [r5, r6]
	str r3, [sp, #0x14]
	add r3, r6, #4
	ldr r3, [r5, r3]
	add r6, #8
	str r3, [sp, #0x18]
	ldr r3, [r5, r6]
	str r3, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r3, [sp, #0x80]
	add r0, sp, #0x4c
	bl CreateSpriteResourcesHeader
	b _0224A3BE
_0224A384:
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0
	ldr r0, [sp, #0x88]
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	str r6, [sp, #0x14]
	add r6, r0, #4
	ldr r6, [r5, r6]
	str r6, [sp, #0x18]
	add r6, r0, #0
	add r6, #8
	ldr r6, [r5, r6]
	add r0, #0xc
	str r6, [sp, #0x1c]
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	ldr r3, [sp, #0x80]
	add r0, sp, #0x4c
	bl CreateSpriteResourcesHeader
_0224A3BE:
	ldr r0, [r5, #0x70]
	add r2, sp, #0x34
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	ldr r0, [sp, #0x8c]
	str r0, [sp, #0x40]
	mov r0, #1
	str r0, [sp, #0x44]
	mov r0, #4
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	bl sub_02024714
	add r4, r0, #0
	bne _0224A3EA
	bl GF_AssertFail
_0224A3EA:
	add r0, r4, #0
	add sp, #0x70
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224A33C

	thumb_func_start ov02_0224A3F0
ov02_0224A3F0: ; 0x0224A3F0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r5, #1
	add r4, r3, #0
	str r5, [sp]
	mov r3, #0
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	add r2, r5, #0
	bl ov02_0224A33C
	add r1, r4, #0
	add r5, r0, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A3F0

	thumb_func_start ov02_0224A418
ov02_0224A418: ; 0x0224A418
	push {r4, lr}
	sub sp, #0x10
	ldrh r2, [r0, #0xe]
	mov r3, #0
	cmp r2, #0
	beq _0224A426
	mov r3, #1
_0224A426:
	mov r2, #2
	str r2, [sp]
	mov r4, #1
	str r4, [sp, #4]
	mov r4, #0
	str r4, [sp, #8]
	mov r4, #0x83
	str r4, [sp, #0xc]
	bl ov02_0224A33C
	add r4, r0, #0
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov02_0224A418

	thumb_func_start ov02_0224A450
ov02_0224A450: ; 0x0224A450
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	bl Set2dSpriteAnimActiveFlag
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02024868
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A450

	thumb_func_start ov02_0224A468
ov02_0224A468: ; 0x0224A468
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r4, r0, #0
	add r0, sp, #0x1c
	mov r7, #0
	str r7, [r0]
	str r7, [r0, #4]
	add r6, r2, #0
	ldr r5, _0224A4CC ; =ov02_02253390
	add r3, r1, #0
	str r7, [r0, #8]
	ldmia r5!, {r0, r1}
	add r2, sp, #0x10
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	add r1, r3, #0
	str r0, [r2]
	str r7, [sp]
	sub r0, r7, #1
	str r0, [sp, #4]
	str r7, [sp, #8]
	add r0, r4, #0
	add r2, r7, #0
	add r3, r7, #0
	str r6, [sp, #0xc]
	bl ov02_0224A33C
	add r4, r0, #0
	mov r1, #2
	bl sub_0202487C
	add r0, r4, #0
	add r1, sp, #0x1c
	bl sub_020247E4
	add r0, r4, #0
	add r1, sp, #0x10
	bl sub_020247F4
	add r0, r7, #0
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02024818
	add r0, r4, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224A4CC: .word ov02_02253390
	thumb_func_end ov02_0224A468

	thumb_func_start ov02_0224A4D0
ov02_0224A4D0: ; 0x0224A4D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov02_0224A074
	add r6, r0, #0
	mov r0, #0x6b
	mov r5, #0
	add r2, r4, #0
	lsl r0, r0, #2
_0224A4E4:
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0224A510
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r6, #0
	mov r2, #0xb
	bl AddCharResObjFromOpenNarc
	lsl r1, r5, #2
	add r2, r4, r1
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r2, r1]
	b _0224A518
_0224A510:
	add r5, r5, #1
	add r2, r2, #4
	cmp r5, #4
	blt _0224A4E4
_0224A518:
	cmp r5, #4
	blt _0224A520
	bl GF_AssertFail
_0224A520:
	mov r0, #0x72
	mov r5, #0
	add r2, r4, #0
	lsl r0, r0, #2
_0224A528:
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0224A554
	mov r3, #0
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r6, #0
	mov r2, #0xc
	bl AddCellOrAnimResObjFromOpenNarc
	lsl r1, r5, #2
	add r2, r4, r1
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r2, r1]
	b _0224A55C
_0224A554:
	add r5, r5, #1
	add r2, r2, #4
	cmp r5, #4
	blt _0224A528
_0224A55C:
	cmp r5, #4
	blt _0224A564
	bl GF_AssertFail
_0224A564:
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A4D0

	thumb_func_start ov02_0224A570
ov02_0224A570: ; 0x0224A570
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #4
	bl NARC_AllocAndReadWholeMember
	add r1, r5, #0
	add r4, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	ldr r1, [r5]
	mov r0, #3
	ldr r1, [r1, #0xc]
	mov r2, #0x20
	lsl r3, r0, #7
	bl BG_LoadPlttData
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224A570

	thumb_func_start ov02_0224A598
ov02_0224A598: ; 0x0224A598
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	mov r2, #4
	bl NARC_AllocAndReadWholeMember
	add r1, r4, #0
	add r6, r0, #0
	bl NNS_G2dGetUnpackedCharacterData
	ldr r3, [r4]
	mov r0, #0
	str r0, [sp]
	ldr r2, [r3, #0x14]
	ldr r3, [r3, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BG_LoadCharTilesData
	add r0, r6, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A598

	thumb_func_start ov02_0224A5D0
ov02_0224A5D0: ; 0x0224A5D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r2, #0
	add r6, r1, #0
	mov r2, #0
	add r4, r3, #0
	mov r1, #3
	add r3, r2, #0
	add r5, r0, #0
	bl BgSetPosTextAndCommit
	mov r1, #3
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #4
	bl NARC_AllocAndReadWholeMember
	add r1, r4, #0
	add r6, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	ldr r3, [r4]
	add r0, r5, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #3
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xc
	mov r2, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r5, #0
	mov r1, #3
	bl BgCommitTilemapBufferToVram
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224A5D0

	thumb_func_start ov02_0224A63C
ov02_0224A63C: ; 0x0224A63C
	ldr r3, _0224A644 ; =BgClearTilemapBufferAndCommit
	mov r1, #3
	bx r3
	nop
_0224A644: .word BgClearTilemapBufferAndCommit
	thumb_func_end ov02_0224A63C

	thumb_func_start ov02_0224A648
ov02_0224A648: ; 0x0224A648
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224A6A8
	mov r0, #0
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl ov02_0224A674
	add r0, r4, #0
	bl ov02_0224A67C
	add r0, r4, #0
	bl ov02_0224A66C
	mov r0, #1
	str r0, [r4, #0x2c]
	pop {r4, pc}
	thumb_func_end ov02_0224A648

	thumb_func_start ov02_0224A66C
ov02_0224A66C: ; 0x0224A66C
	mov r1, #1
	str r1, [r0, #0x30]
	bx lr
	.balign 4, 0
	thumb_func_end ov02_0224A66C

	thumb_func_start ov02_0224A674
ov02_0224A674: ; 0x0224A674
	mov r1, #0
	str r1, [r0, #0x30]
	bx lr
	.balign 4, 0
	thumb_func_end ov02_0224A674

	thumb_func_start ov02_0224A67C
ov02_0224A67C: ; 0x0224A67C
	mov r1, #0x18
	str r1, [r0, #0x34]
	mov r1, #0
	str r1, [r0, #0x38]
	mov r1, #0x17
	str r1, [r0, #0x3c]
	mov r1, #1
	str r1, [r0, #0x40]
	bx lr
	.balign 4, 0
	thumb_func_end ov02_0224A67C

	thumb_func_start ov02_0224A690
ov02_0224A690: ; 0x0224A690
	mov r1, #0x17
	str r1, [r0, #0x3c]
	mov r1, #1
	str r1, [r0, #0x40]
	bx lr
	.balign 4, 0
	thumb_func_end ov02_0224A690

	thumb_func_start ov02_0224A69C
ov02_0224A69C: ; 0x0224A69C
	str r1, [r0, #0x44]
	str r3, [r0, #0x48]
	ldr r1, [sp]
	str r2, [r0, #0x4c]
	str r1, [r0, #0x50]
	bx lr
	thumb_func_end ov02_0224A69C

	thumb_func_start ov02_0224A6A8
ov02_0224A6A8: ; 0x0224A6A8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224A6BA
	bl GF_AssertFail
_0224A6BA:
	ldr r0, _0224A6CC ; =ov02_0224A700
	add r1, r4, #0
	mov r2, #0x81
	bl sub_0200E33C
	mov r1, #0x89
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_0224A6CC: .word ov02_0224A700
	thumb_func_end ov02_0224A6A8

	thumb_func_start ov02_0224A6D0
ov02_0224A6D0: ; 0x0224A6D0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0224A6E2
	bl GF_AssertFail
_0224A6E2:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroySysTask
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0224A6FC ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	pop {r4, pc}
	nop
_0224A6FC: .word 0xFFFF1FFF
	thumb_func_end ov02_0224A6D0

	thumb_func_start ov02_0224A700
ov02_0224A700: ; 0x0224A700
	push {r3, r4, r5, r6}
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _0224A796
	mov r3, #1
	lsl r3, r3, #0x1a
	ldr r2, [r3]
	ldr r0, _0224A79C ; =0xFFFF1FFF
	and r2, r0
	ldr r0, [r1, #0x30]
	lsl r0, r0, #0xd
	orr r0, r2
	str r0, [r3]
	add r3, #0x48
	ldrh r2, [r3]
	mov r0, #0x3f
	bic r2, r0
	ldr r0, [r1, #0x34]
	orr r2, r0
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _0224A730
	mov r0, #0x20
	orr r2, r0
_0224A730:
	ldr r0, _0224A7A0 ; =0x04000048
	strh r2, [r0]
	ldrh r2, [r0, #2]
	mov r0, #0x3f
	bic r2, r0
	ldr r0, [r1, #0x3c]
	orr r2, r0
	ldr r0, [r1, #0x40]
	cmp r0, #0
	beq _0224A748
	mov r0, #0x20
	orr r2, r0
_0224A748:
	ldr r5, _0224A7A4 ; =0x0400004A
	strh r2, [r5]
	ldr r2, [r1, #0x50]
	ldr r6, [r1, #0x48]
	asr r0, r2, #0xb
	lsr r0, r0, #0x14
	add r0, r2, r0
	ldr r2, [r1, #0x4c]
	asr r4, r0, #0xc
	asr r0, r2, #0xb
	lsr r0, r0, #0x14
	add r0, r2, r0
	ldr r2, [r1, #0x44]
	asr r3, r0, #0xc
	asr r0, r2, #0xb
	lsr r0, r0, #0x14
	asr r1, r6, #0xb
	add r0, r2, r0
	lsr r1, r1, #0x14
	asr r0, r0, #0xc
	add r1, r6, r1
	lsl r2, r0, #8
	mov r0, #0xff
	asr r1, r1, #0xc
	lsl r0, r0, #8
	lsl r1, r1, #0x18
	and r2, r0
	lsr r1, r1, #0x18
	orr r2, r1
	add r1, r5, #0
	sub r1, #0xa
	strh r2, [r1]
	lsl r1, r3, #8
	and r1, r0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	orr r1, r0
	sub r0, r5, #6
	strh r1, [r0]
_0224A796:
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0224A79C: .word 0xFFFF1FFF
_0224A7A0: .word 0x04000048
_0224A7A4: .word 0x0400004A
	thumb_func_end ov02_0224A700

	thumb_func_start ov02_0224A7A8
ov02_0224A7A8: ; 0x0224A7A8
	ldr r3, _0224A7B4 ; =GetPokemonSpriteCharAndPlttNarcIds
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2, #0x5c]
	mov r2, #2
	bx r3
	.balign 4, 0
_0224A7B4: .word GetPokemonSpriteCharAndPlttNarcIds
	thumb_func_end ov02_0224A7A8

	thumb_func_start ov02_0224A7B8
ov02_0224A7B8: ; 0x0224A7B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	mov r1, #0x32
	add r6, r0, #0
	mov r0, #4
	lsl r1, r1, #6
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _0224A7D4
	bl GF_AssertFail
_0224A7D4:
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrh r0, [r5, #6]
	add r2, r7, #0
	add r3, r4, #0
	str r0, [sp, #0xc]
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	bl sub_02014540
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A7B8

	thumb_func_start ov02_0224A800
ov02_0224A800: ; 0x0224A800
	add r3, r0, #0
	add r2, r1, #0
	ldrh r0, [r3]
	ldrh r1, [r3, #4]
	ldr r3, _0224A80C ; =sub_02014450
	bx r3
	.balign 4, 0
_0224A80C: .word sub_02014450
	thumb_func_end ov02_0224A800

	thumb_func_start ov02_0224A810
ov02_0224A810: ; 0x0224A810
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	mov r2, #0x67
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	mov r2, #9
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov02_0224A810

	thumb_func_start ov02_0224A834
ov02_0224A834: ; 0x0224A834
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x67
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #3
	bl Get2DGfxResObjById
	bl sub_0200AF00
	mov r1, #1
	bl NNS_G2dGetImageLocation
	mov r1, #0x32
	add r5, r0, #0
	add r0, r4, #0
	lsl r1, r1, #6
	bl DC_FlushRange
	mov r2, #0x32
	add r0, r4, #0
	add r1, r5, #0
	lsl r2, r2, #6
	bl GX_LoadOBJ
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224A834

	thumb_func_start ov02_0224A868
ov02_0224A868: ; 0x0224A868
	push {r3, lr}
	sub sp, #0x10
	mov r2, #3
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	mov r2, #4
	str r2, [sp, #0xc]
	mov r2, #0x1a
	lsl r2, r2, #4
	ldr r0, [r0, r2]
	mov r2, #6
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end ov02_0224A868

	thumb_func_start ov02_0224A88C
ov02_0224A88C: ; 0x0224A88C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x67
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	mov r1, #3
	bl Get2DGfxResObjById
	bl sub_0200AF00
	add r6, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	bl Get2DGfxResObjById
	add r1, r6, #0
	bl sub_0200B0F8
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x20
	bl DC_FlushRange
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x20
	bl GX_LoadOBJPltt
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A88C

	thumb_func_start ov02_0224A8D4
ov02_0224A8D4: ; 0x0224A8D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl Get2DGfxResObjById
	add r4, r0, #0
	bl sub_0200AEB0
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl DestroySingle2DGfxResObj
	mov r1, #0x6b
	mov r0, #0
	add r3, r5, #0
	lsl r1, r1, #2
_0224A8FE:
	ldr r2, [r3, r1]
	cmp r2, r4
	bne _0224A912
	lsl r1, r0, #2
	add r2, r5, r1
	mov r1, #0x6b
	mov r3, #0
	lsl r1, r1, #2
	str r3, [r2, r1]
	b _0224A91A
_0224A912:
	add r0, r0, #1
	add r3, r3, #4
	cmp r0, #4
	blt _0224A8FE
_0224A91A:
	cmp r0, #4
	blt _0224A922
	bl GF_AssertFail
_0224A922:
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	bl Get2DGfxResObjById
	add r4, r0, #0
	bl sub_0200B0A8
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl DestroySingle2DGfxResObj
	mov r1, #0x6f
	mov r0, #0
	add r3, r5, #0
	lsl r1, r1, #2
_0224A948:
	ldr r2, [r3, r1]
	cmp r2, r4
	bne _0224A95C
	lsl r1, r0, #2
	add r2, r5, r1
	mov r1, #0x6f
	mov r3, #0
	lsl r1, r1, #2
	str r3, [r2, r1]
	b _0224A964
_0224A95C:
	add r0, r0, #1
	add r3, r3, #4
	cmp r0, #3
	blt _0224A948
_0224A964:
	cmp r0, #3
	blt _0224A96C
	bl GF_AssertFail
_0224A96C:
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl Get2DGfxResObjById
	add r4, r0, #0
	bl sub_0200A740
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl DestroySingle2DGfxResObj
	mov r1, #0x72
	mov r0, #0
	add r3, r5, #0
	lsl r1, r1, #2
_0224A992:
	ldr r2, [r3, r1]
	cmp r2, r4
	bne _0224A9A6
	lsl r1, r0, #2
	add r2, r5, r1
	mov r1, #0x72
	mov r3, #0
	lsl r1, r1, #2
	str r3, [r2, r1]
	b _0224A9AE
_0224A9A6:
	add r0, r0, #1
	add r3, r3, #4
	cmp r0, #4
	blt _0224A992
_0224A9AE:
	cmp r0, #4
	blt _0224A9B6
	bl GF_AssertFail
_0224A9B6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224A8D4

	thumb_func_start ov02_0224A9B8
ov02_0224A9B8: ; 0x0224A9B8
	push {r3, lr}
	sub sp, #0x10
	mov r2, #3
	str r2, [sp]
	sub r3, r2, #4
	str r3, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	mov r3, #0x81
	str r3, [sp, #0xc]
	add r3, r2, #0
	bl ov02_0224A33C
	add sp, #0x10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224A9B8

	thumb_func_start ov02_0224A9D8
ov02_0224A9D8: ; 0x0224A9D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	mov r0, #2
	ldr r4, _0224AA40 ; =ov02_022535E4
	add r6, r1, #0
	str r0, [r5, #0x14]
	mov r7, #0
_0224A9E8:
	ldr r0, [r4]
	add r1, sp, #0x1c
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	add r2, sp, #0x10
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r0, [r4, #8]
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r4, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4, #0x10]
	ldr r3, [sp, #8]
	str r0, [sp]
	str r0, [sp, #0xc]
	str r6, [sp, #4]
	add r0, r5, #0
	bl ov02_0224AA44
	mov r0, #1
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x14
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #8]
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #0x1c
	add r2, sp, #0x10
	str r6, [sp, #4]
	bl ov02_0224AA44
	add r7, r7, #1
	add r4, #0x14
	cmp r7, #0xd
	blt _0224A9E8
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224AA40: .word ov02_022535E4
	thumb_func_end ov02_0224A9D8

	thumb_func_start ov02_0224AA44
ov02_0224AA44: ; 0x0224AA44
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [sp, #0x34]
	str r3, [sp, #8]
	str r5, [sp, #0x10]
	add r4, r1, #0
	str r0, [sp, #0xc]
	ldmia r2!, {r0, r1}
	add r3, sp, #0x14
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	ldr r1, _0224AA7C ; =ov02_02253468
	str r0, [r3]
	add r0, sp, #8
	str r0, [sp]
	mov r0, #0x85
	str r0, [sp, #4]
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x30]
	add r2, r4, #0
	bl sub_02068B0C
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_0224AA7C: .word ov02_02253468
	thumb_func_end ov02_0224AA44

	thumb_func_start ov02_0224AA80
ov02_0224AA80: ; 0x0224AA80
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl sub_02068D98
	add r2, r4, #0
	add r3, r0, #0
	add r2, #0xc
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	bl sub_02068D90
	str r0, [r4, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #4]
	add r1, sp, #0
	bl ov02_0224A3F0
	mov r1, #0
	str r0, [r4, #8]
	bl Set2dSpriteVisibleFlag
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov02_0224AA80

	thumb_func_start ov02_0224AAC8
ov02_0224AAC8: ; 0x0224AAC8
	ldr r3, _0224AAD0 ; =sub_02024758
	ldr r0, [r1, #8]
	bx r3
	nop
_0224AAD0: .word sub_02024758
	thumb_func_end ov02_0224AAC8

	thumb_func_start ov02_0224AAD4
ov02_0224AAD4: ; 0x0224AAD4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	add r5, r0, #0
	bl sub_02068DB8
	ldr r1, [sp]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	lsr r2, r0, #0x1f
	lsl r1, r0, #0xb
	str r0, [sp]
	sub r1, r1, r2
	mov r0, #0xb
	ror r1, r0
	add r0, r2, r1
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl sub_020247D4
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _0224AB4E
	ldr r3, [r4, #0x14]
	ldr r0, [r3, #0x14]
	cmp r0, #2
	bne _0224AB42
	ldr r2, [r3, #0x4c]
	ldr r0, [r3, #0x50]
	mov r3, #2
	ldr r6, [sp, #4]
	lsl r3, r3, #0xc
	sub r5, r6, r3
	mov r1, #0
	cmp r5, r2
	blt _0224AB38
	cmp r5, r0
	bgt _0224AB38
	add r3, r6, r3
	cmp r3, r2
	blt _0224AB38
	cmp r3, r0
	bgt _0224AB38
	mov r1, #1
_0224AB38:
	ldr r0, [r4, #8]
	bl Set2dSpriteVisibleFlag
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0224AB42:
	cmp r0, #1
	bne _0224AB4E
	ldr r0, [r4, #8]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0224AB4E:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224AAD4

	thumb_func_start ov02_0224AB54
ov02_0224AB54: ; 0x0224AB54
	bx lr
	.balign 4, 0
	thumb_func_end ov02_0224AB54

	thumb_func_start ov02_0224AB58
ov02_0224AB58: ; 0x0224AB58
	push {r4, lr}
	sub sp, #0x18
	add r2, sp, #0xc
	mov r3, #0
	add r4, r0, #0
	str r3, [r2]
	str r3, [r2, #4]
	str r3, [r2, #8]
	str r4, [sp, #8]
	add r0, sp, #8
	str r0, [sp]
	mov r0, #0x82
	str r0, [sp, #4]
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, _0224AB88 ; =ov02_0225347C
	bl sub_02068B0C
	mov r1, #0x7b
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_0224AB88: .word ov02_0225347C
	thumb_func_end ov02_0224AB58

	thumb_func_start ov02_0224AB8C
ov02_0224AB8C: ; 0x0224AB8C
	push {r3, lr}
	mov r1, #0x7b
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_02068D74
	ldrb r0, [r0, #2]
	pop {r3, pc}
	thumb_func_end ov02_0224AB8C

	thumb_func_start ov02_0224AB9C
ov02_0224AB9C: ; 0x0224AB9C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02068D74
	add r5, r0, #0
	ldr r0, [r5, #0x60]
	cmp r0, #0
	beq _0224ABB6
	bl sub_02068B48
_0224ABB6:
	ldr r0, [r5, #0x64]
	cmp r0, #0
	beq _0224ABC0
	bl ov01_021FCD78
_0224ABC0:
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02068B48
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224AB9C

	thumb_func_start ov02_0224ABCC
ov02_0224ABCC: ; 0x0224ABCC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [r4, #0x5c]
	add r0, r5, #0
	bl sub_02068DB8
	mov r2, #0
	ldr r0, [r4, #0x5c]
	add r1, sp, #0
	add r3, r2, #0
	bl ov02_0224A468
	str r0, [r4, #0x58]
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov02_0224ABCC

	thumb_func_start ov02_0224ABF8
ov02_0224ABF8: ; 0x0224ABF8
	ldr r3, _0224AC00 ; =sub_02024758
	ldr r0, [r1, #0x58]
	bx r3
	nop
_0224AC00: .word sub_02024758
	thumb_func_end ov02_0224ABF8

	thumb_func_start ov02_0224AC04
ov02_0224AC04: ; 0x0224AC04
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldrb r0, [r5]
	lsl r1, r0, #2
	ldr r0, _0224AC20 ; =ov02_022533C0
	ldr r4, [r0, r1]
_0224AC10:
	ldrb r1, [r5, #1]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _0224AC10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224AC20: .word ov02_022533C0
	thumb_func_end ov02_0224AC04

	thumb_func_start ov02_0224AC24
ov02_0224AC24: ; 0x0224AC24
	bx lr
	.balign 4, 0
	thumb_func_end ov02_0224AC24

	thumb_func_start ov02_0224AC28
ov02_0224AC28: ; 0x0224AC28
	push {r3, lr}
	mov r1, #0
	strb r1, [r0, #2]
	ldr r0, [r0, #0x58]
	bl Set2dSpriteVisibleFlag
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov02_0224AC28

	thumb_func_start ov02_0224AC38
ov02_0224AC38: ; 0x0224AC38
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r4, _0224ACD8 ; =ov02_022533E4
	add r2, r0, #0
	ldmia r4!, {r0, r1}
	add r3, sp, #0xc
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _0224ACDC ; =ov02_022533F0
	str r0, [r3]
	ldmia r4!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	bl sub_02068D74
	add r4, r0, #0
	mov r3, #1
	add r5, r4, #0
	strb r3, [r4]
	mov r2, #0
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	add r6, sp, #0xc
	ldmia r6!, {r0, r1}
	add r5, #8
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r6, sp, #0
	str r0, [r5]
	str r2, [r4, #0x14]
	str r2, [r4, #0x18]
	mov r0, #0xf
	add r5, r4, #0
	str r2, [r4, #0x1c]
	lsl r0, r0, #0xe
	str r0, [r4, #0x38]
	ldmia r6!, {r0, r1}
	add r5, #0x2c
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, sp, #0xc
	str r0, [r5]
	lsl r0, r3, #9
	str r0, [r4, #0x50]
	mov r0, #0x2d
	lsl r0, r0, #0xe
	str r0, [r4, #0x40]
	str r2, [r4, #0x48]
	lsl r0, r3, #0xd
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x58]
	bl sub_020247D4
	ldr r0, [r4, #0x58]
	add r1, sp, #0
	bl sub_020247F4
	ldr r1, [r4, #0x38]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	ldr r0, [r4, #0x58]
	bl sub_02024818
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224ACD8: .word ov02_022533E4
_0224ACDC: .word ov02_022533F0
	thumb_func_end ov02_0224AC38

	thumb_func_start ov02_0224ACE0
ov02_0224ACE0: ; 0x0224ACE0
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r4, [r5, #0x58]
	add r0, r1, r0
	str r0, [r5, #0x48]
	mov r0, #1
	ldr r1, [r5, #0x4c]
	lsl r0, r0, #0x10
	cmp r1, r0
	bge _0224AD00
	lsr r0, r0, #2
	add r0, r1, r0
	str r0, [r5, #0x4c]
_0224AD00:
	ldr r0, _0224ADE0 ; =0x0000013B
	bl GF_CosDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r2, r0, #0xc
	ldr r0, _0224ADE4 ; =0x0000010E
	cmp r2, r0
	bge _0224AD4A
	mov r0, #1
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [r5, #0x40]
_0224AD4A:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [r5, #0x2c]
	cmp r1, r0
	ble _0224AD5C
	str r0, [r5, #0x2c]
_0224AD5C:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [r5, #0x30]
	cmp r1, r0
	ble _0224AD6E
	str r0, [r5, #0x30]
_0224AD6E:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x2c
	bl sub_020247F4
	mov r0, #6
	ldr r1, [r5, #0x38]
	lsl r0, r0, #0xc
	sub r1, r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	str r1, [r5, #0x38]
	asr r0, r0, #0xc
	bpl _0224AD90
	mov r0, #0
	str r0, [r5, #0x38]
_0224AD90:
	ldr r1, [r5, #0x38]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02024818
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	ldr r1, [sp, #4]
	ldr r0, _0224ADE8 ; =0xFFFC0000
	cmp r1, r0
	bge _0224ADDA
	add r0, r4, #0
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #2
	strb r0, [r5, #2]
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
_0224ADDA:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0224ADE0: .word 0x0000013B
_0224ADE4: .word 0x0000010E
_0224ADE8: .word 0xFFFC0000
	thumb_func_end ov02_0224ACE0

	thumb_func_start ov02_0224ADEC
ov02_0224ADEC: ; 0x0224ADEC
	mov r0, #0
	bx lr
	thumb_func_end ov02_0224ADEC

	thumb_func_start ov02_0224ADF0
ov02_0224ADF0: ; 0x0224ADF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r3, _0224AF5C ; =ov02_02253354
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x24
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _0224AF60 ; =ov02_0225336C
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02068D74
	add r4, r0, #0
	mov r0, #2
	strb r0, [r4]
	mov r6, #0
	mov r0, #0xbb
	strb r6, [r4, #1]
	mov r7, #1
	strb r7, [r4, #2]
	str r6, [r4, #4]
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldr r2, [sp, #0x24]
	add r0, #8
	add r1, r2, r1
	str r1, [sp, #0x24]
	add r2, r4, #0
	ldr r1, [sp, #0x28]
	ldr r0, [r5, r0]
	add r3, sp, #0x24
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldmia r3!, {r0, r1}
	add r2, #8
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, sp, #0x18
	str r0, [r2]
	str r6, [r4, #0x14]
	str r6, [r4, #0x18]
	str r6, [r4, #0x1c]
	ldr r6, _0224AF64 ; =0x0013B000
	add r2, r4, #0
	str r6, [r4, #0x38]
	ldmia r3!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r7, #0
	add r0, #0xff
	str r0, [r4, #0x50]
	mov r0, #0xe1
	lsl r0, r0, #0xc
	str r0, [r4, #0x40]
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [r4, #0x48]
	lsl r0, r7, #0x11
	str r0, [r4, #0x4c]
	lsr r0, r6, #0xc
	bl GF_CosDeg
	ldr r2, [r4, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r2, [r4, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r4, #0x18]
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x58]
	add r1, sp, #0x24
	bl sub_020247D4
	ldr r0, [r4, #0x58]
	add r1, sp, #0x18
	bl sub_020247F4
	ldr r1, [r4, #0x38]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	ldr r0, [r4, #0x58]
	bl sub_02024818
	ldr r0, [r4, #0x58]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	mov r1, #0x1e
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl ov02_0224B298
	str r0, [r4, #0x60]
	add r0, r7, #0
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x60]
	mov r1, #4
	bl ov01_021FCD2C
	ldr r2, _0224AF68 ; =0xFFF88000
	add r1, r7, #0
	mov r3, #0xc
	str r0, [r4, #0x64]
	bl ov01_021FCD8C
	add r1, sp, #0xc
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _0224AF6C ; =ov02_02253378
	str r0, [r1, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0x79
	ldr r1, [r4, #0x5c]
	lsl r0, r0, #2
	ldr r4, [r1, r0]
	mov r1, #2
	add r0, r4, #0
	bl sub_0202487C
	add r0, r4, #0
	add r1, sp, #0xc
	bl sub_020247E4
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247F4
	mov r0, #0
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02024818
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224AF5C: .word ov02_02253354
_0224AF60: .word ov02_0225336C
_0224AF64: .word 0x0013B000
_0224AF68: .word 0xFFF88000
_0224AF6C: .word ov02_02253378
	thumb_func_end ov02_0224ADF0

	thumb_func_start ov02_0224AF70
ov02_0224AF70: ; 0x0224AF70
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	ldr r4, [r5, #0x58]
	sub r0, r1, r0
	str r0, [r5, #0x48]
	bpl _0224AF86
	mov r0, #0
	str r0, [r5, #0x48]
_0224AF86:
	mov r0, #2
	ldr r1, [r5, #0x4c]
	lsl r0, r0, #0xa
	cmp r1, r0
	ble _0224AF98
	mov r0, #6
	lsl r0, r0, #0xa
	sub r0, r1, r0
	str r0, [r5, #0x4c]
_0224AF98:
	mov r0, #1
	ldr r1, [r5, #0x4c]
	lsl r0, r0, #0xc
	cmp r1, r0
	bge _0224AFA4
	str r0, [r5, #0x4c]
_0224AFA4:
	ldr r0, _0224B0D8 ; =0x0000013B
	bl GF_CosDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r2, [r5, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r5, #0x18]
	ldr r1, [r5, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r2, r0, #0xc
	ldr r0, _0224B0DC ; =0x0000010E
	cmp r2, r0
	bge _0224AFEE
	mov r0, #1
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [r5, #0x40]
_0224AFEE:
	ldr r1, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	add r1, r1, r0
	mov r0, #6
	lsl r0, r0, #0xa
	str r1, [r5, #0x2c]
	cmp r1, r0
	ble _0224B000
	str r0, [r5, #0x2c]
_0224B000:
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x50]
	add r1, r1, r0
	mov r0, #6
	lsl r0, r0, #0xa
	str r1, [r5, #0x30]
	cmp r1, r0
	ble _0224B012
	str r0, [r5, #0x30]
_0224B012:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x2c
	bl sub_020247F4
	mov r0, #2
	ldr r1, [r5, #0x38]
	lsl r0, r0, #0xe
	add r1, r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	str r1, [r5, #0x38]
	asr r1, r0, #0xc
	mov r0, #0x5a
	lsl r0, r0, #2
	cmp r1, r0
	ble _0224B03A
	lsl r0, r0, #0xc
	str r0, [r5, #0x38]
_0224B03A:
	ldr r1, [r5, #0x38]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02024818
	ldr r1, [r5, #8]
	ldr r0, [r5, #0x14]
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, sp, #0xc
	bl sub_020247D4
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bne _0224B07C
	mov r0, #0
	str r0, [r5, #4]
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
	b _0224B082
_0224B07C:
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
_0224B082:
	ldr r0, [r5, #4]
	cmp r0, #0xc
	bne _0224B08E
	ldr r0, [r5, #0x60]
	bl ov02_0224B2CC
_0224B08E:
	mov r0, #0x79
	ldr r1, [r5, #0x5c]
	lsl r0, r0, #2
	ldr r4, [r1, r0]
	add r0, r4, #0
	bl sub_020248B0
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp]
	mov r0, #5
	add r1, #0x80
	lsl r0, r0, #0xa
	str r1, [sp]
	cmp r1, r0
	ble _0224B0B8
	str r0, [sp]
_0224B0B8:
	ldr r1, [sp, #4]
	mov r0, #5
	add r1, #0x80
	lsl r0, r0, #0xa
	str r1, [sp, #4]
	cmp r1, r0
	ble _0224B0C8
	str r0, [sp, #4]
_0224B0C8:
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247F4
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0224B0D8: .word 0x0000013B
_0224B0DC: .word 0x0000010E
	thumb_func_end ov02_0224AF70

	thumb_func_start ov02_0224B0E0
ov02_0224B0E0: ; 0x0224B0E0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x79
	ldr r1, [r4, #0x5c]
	lsl r0, r0, #2
	ldr r5, [r1, r0]
	mov r1, #3
	add r0, r5, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl ov02_0224B6B0
	mov r0, #0x82
	ldr r1, [r4, #0x5c]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_0205F484
	add r0, r5, #0
	bl sub_020248AC
	ldr r5, [r0, #4]
	ldr r0, [r4, #0x58]
	bl sub_020248AC
	ldr r0, [r0, #4]
	sub r0, r5, r0
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x60]
	bl ov02_0224B2C0
	ldr r0, [r4, #0x64]
	mov r1, #2
	mov r2, #0
	mov r3, #0xc
	bl ov01_021FCD8C
	mov r1, #1
	lsl r1, r1, #8
	str r1, [r4, #0x50]
	lsl r0, r1, #0xb
	str r0, [r4, #0x40]
	mov r0, #0
	str r0, [r4, #0x48]
	lsl r0, r1, #3
	str r0, [r4, #0x4c]
	mov r0, #3
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B0E0

	thumb_func_start ov02_0224B158
ov02_0224B158: ; 0x0224B158
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	ldr r1, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	ldr r6, [r4, #0x58]
	add r0, r1, r0
	str r0, [r4, #0x48]
	mov r0, #1
	ldr r1, [r4, #0x4c]
	lsl r0, r0, #0xc
	add r2, r1, r0
	lsl r1, r0, #4
	str r2, [r4, #0x4c]
	cmp r2, r1
	ble _0224B17C
	lsl r0, r0, #4
	str r0, [r4, #0x4c]
_0224B17C:
	ldr r1, [r4, #0x40]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r2, [r4, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r4, #0x14]
	mov r0, #0x80
	bl GF_SinDeg
	ldr r2, [r4, #0x48]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	mul r0, r1
	str r0, [r4, #0x18]
	mov r0, #0x87
	ldr r1, [r4, #0x40]
	lsl r0, r0, #0xc
	cmp r1, r0
	bge _0224B1C0
	mov r0, #1
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r4, #0x40]
_0224B1C0:
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x50]
	add r1, r1, r0
	mov r0, #2
	lsl r0, r0, #0xc
	str r1, [r4, #0x2c]
	cmp r1, r0
	ble _0224B1D2
	str r0, [r4, #0x2c]
_0224B1D2:
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x50]
	add r1, r1, r0
	mov r0, #2
	lsl r0, r0, #0xc
	str r1, [r4, #0x30]
	cmp r1, r0
	ble _0224B1E4
	str r0, [r4, #0x30]
_0224B1E4:
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x18]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x18]
	add r1, r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	str r1, [sp, #0x1c]
	cmp r0, #0xe6
	blt _0224B20A
	mov r0, #2
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_0224B20A:
	mov r0, #0x79
	ldr r1, [r4, #0x5c]
	lsl r0, r0, #2
	ldr r7, [r1, r0]
	add r0, r7, #0
	bl sub_020248B0
	add r2, sp, #0xc
	add r3, sp, #0x18
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	mov ip, r2
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldmia r5!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	mov r0, #1
	ldr r1, [r4, #0x54]
	lsl r0, r0, #0xc
	sub r1, r1, r0
	str r1, [r4, #0x54]
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x10]
	add r0, r7, #0
	mov r1, ip
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #8
	add r2, r1, r0
	lsl r1, r0, #5
	str r2, [sp]
	cmp r2, r1
	ble _0224B25E
	lsl r0, r0, #5
	str r0, [sp]
_0224B25E:
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #8
	add r2, r1, r0
	lsl r1, r0, #5
	str r2, [sp, #4]
	cmp r2, r1
	ble _0224B272
	lsl r0, r0, #5
	str r0, [sp, #4]
_0224B272:
	add r0, r7, #0
	add r1, sp, #0
	bl sub_020247F4
	add r4, #0x2c
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020247F4
	add r0, r6, #0
	add r1, sp, #0x18
	bl sub_020247D4
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B158

	thumb_func_start ov02_0224B294
ov02_0224B294: ; 0x0224B294
	mov r0, #0
	bx lr
	thumb_func_end ov02_0224B294

	thumb_func_start ov02_0224B298
ov02_0224B298: ; 0x0224B298
	push {lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	mov r3, #0
	str r3, [r2]
	str r3, [r2, #4]
	str r1, [sp, #0xc]
	str r3, [r2, #8]
	add r1, sp, #8
	str r1, [sp]
	mov r1, #0x81
	str r1, [sp, #4]
	ldr r1, _0224B2BC ; =ov02_022534A4
	bl sub_02068B0C
	add sp, #0x1c
	pop {pc}
	nop
_0224B2BC: .word ov02_022534A4
	thumb_func_end ov02_0224B298

	thumb_func_start ov02_0224B2C0
ov02_0224B2C0: ; 0x0224B2C0
	push {r3, lr}
	bl sub_02068D74
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	thumb_func_end ov02_0224B2C0

	thumb_func_start ov02_0224B2CC
ov02_0224B2CC: ; 0x0224B2CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_02068D74
	add r4, r0, #0
	mov r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
	str r0, [r4, #8]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x20]
	bl sub_020248AC
	add r6, r0, #0
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	add r0, r5, #0
	bl sub_02068DA8
	ldr r0, [r4, #0x20]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B2CC

	thumb_func_start ov02_0224B314
ov02_0224B314: ; 0x0224B314
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_02068D74
	add r4, r0, #0
	mov r0, #2
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
	str r0, [r4, #8]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x20]
	add r1, sp, #0
	bl ov02_02248C98
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #0x20]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B314

	thumb_func_start ov02_0224B350
ov02_0224B350: ; 0x0224B350
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D98
	ldr r1, [r0]
	str r1, [r4, #0x1c]
	ldr r0, [r0, #4]
	str r0, [r4, #0x20]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov02_0224B350

	thumb_func_start ov02_0224B364
ov02_0224B364: ; 0x0224B364
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0224B3A8
	ldr r1, [r4, #0xc]
	lsl r2, r1, #2
	ldr r1, _0224B3AC ; =ov02_02253520
	ldr r1, [r1, r2]
	str r1, [r4, #0x14]
	add r1, sp, #0
	bl sub_02068DB8
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r4, #0x20]
	add r1, sp, #0
	bl sub_020247D4
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0xc
	blt _0224B3A8
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0224B3A8:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0224B3AC: .word ov02_02253520
	thumb_func_end ov02_0224B364

	thumb_func_start ov02_0224B3B0
ov02_0224B3B0: ; 0x0224B3B0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _0224B3F4
	ldr r1, [r4, #0xc]
	lsl r2, r1, #2
	ldr r1, _0224B3F8 ; =ov02_02253430
	ldr r1, [r1, r2]
	str r1, [r4, #0x14]
	add r1, sp, #0
	bl sub_02068DB8
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r4, #0x20]
	add r1, sp, #0
	bl sub_020247D4
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #4
	blt _0224B3F4
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0224B3F4:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0224B3F8: .word ov02_02253430
	thumb_func_end ov02_0224B3B0

	thumb_func_start ov02_0224B3FC
ov02_0224B3FC: ; 0x0224B3FC
	push {r3, lr}
	ldr r2, [r1]
	cmp r2, #1
	beq _0224B40A
	cmp r2, #2
	beq _0224B410
	pop {r3, pc}
_0224B40A:
	bl ov02_0224B364
	pop {r3, pc}
_0224B410:
	bl ov02_0224B3B0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B3FC

	thumb_func_start ov02_0224B418
ov02_0224B418: ; 0x0224B418
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x5f
	add r5, r0, #0
	mov r0, #4
	lsl r1, r1, #2
	bl ov02_0224B690
	add r1, r0, #0
	str r4, [r1, #0xc]
	ldr r0, _0224B438 ; =ov02_0224B45C
	mov r2, #0x86
	str r5, [r1, #0x14]
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224B438: .word ov02_0224B45C
	thumb_func_end ov02_0224B418

	thumb_func_start ov02_0224B43C
ov02_0224B43C: ; 0x0224B43C
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B43C

	thumb_func_start ov02_0224B448
ov02_0224B448: ; 0x0224B448
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F988
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end ov02_0224B448

	thumb_func_start ov02_0224B45C
ov02_0224B45C: ; 0x0224B45C
	push {r3, r4, r5, lr}
	ldr r4, _0224B490 ; =ov02_022534B8
	add r5, r1, #0
_0224B462:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _0224B462
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _0224B48E
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0224B484
	bl sub_02068BAC
_0224B484:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _0224B48E
	bl sub_0202457C
_0224B48E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224B490: .word ov02_022534B8
	thumb_func_end ov02_0224B45C

	thumb_func_start ov02_0224B494
ov02_0224B494: ; 0x0224B494
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl ov02_02249444
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B494

	thumb_func_start ov02_0224B4AC
ov02_0224B4AC: ; 0x0224B4AC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x20
	bl sub_020689C8
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r2, #2
	str r2, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x18
	mov r1, #0x20
	add r3, r2, #0
	str r2, [sp, #0x14]
	bl ov02_02248728
	bl ov02_022493F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #0xb
	mov r3, #0
	bl ov02_02248980
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #6
	mov r3, #0
	bl ov02_02248A58
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #0xc
	mov r3, #0
	bl ov02_02248B30
	add r0, r5, #0
	add r0, #0x18
	mov r1, #0
	bl ov02_022489F0
	add r0, r5, #0
	add r0, #0x18
	mov r1, #0
	bl ov02_02248AC8
	add r0, r5, #0
	add r0, #0x18
	mov r1, #0
	bl ov02_02248A24
	add r0, r5, #0
	add r0, #0x18
	mov r1, #0
	bl ov02_02248AFC
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0224B57C
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #0x11
	mov r3, #2
	bl ov02_02248980
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #0x12
	mov r3, #2
	bl ov02_02248B30
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #0x13
	mov r3, #1
	bl ov02_02248BA0
	add r0, r5, #0
	add r0, #0x18
	mov r1, #2
	bl ov02_022489F0
	add r0, r5, #0
	add r0, #0x18
	mov r1, #2
	bl ov02_02248A24
	b _0224B5DC
_0224B57C:
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #0x14
	mov r3, #2
	bl ov02_02248980
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #7
	mov r3, #1
	bl ov02_02248A58
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #0x15
	mov r3, #2
	bl ov02_02248B30
	add r0, r5, #0
	add r0, #0x18
	add r1, r4, #0
	mov r2, #0x16
	mov r3, #1
	bl ov02_02248BA0
	add r0, r5, #0
	add r0, #0x18
	mov r1, #2
	bl ov02_022489F0
	add r0, r5, #0
	add r0, #0x18
	mov r1, #1
	bl ov02_02248AC8
	add r0, r5, #0
	add r0, #0x18
	mov r1, #2
	bl ov02_02248A24
	add r0, r5, #0
	add r0, #0x18
	mov r1, #1
	bl ov02_02248AFC
_0224B5DC:
	add r0, r4, #0
	bl NARC_dtor
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B4AC

	thumb_func_start ov02_0224B5F0
ov02_0224B5F0: ; 0x0224B5F0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	add r0, #0x18
	bl ov02_02248D18
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r3, #0x17
	lsl r3, r3, #4
	ldr r1, [r4, r3]
	sub r3, r3, #4
	add r2, r4, #0
	ldr r0, [r4, #0x14]
	ldr r3, [r4, r3]
	add r2, #0x18
	bl ov02_02248D58
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl ov02_02248E20
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_0224B5F0

	thumb_func_start ov02_0224B638
ov02_0224B638: ; 0x0224B638
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov02_02248D8C
	cmp r0, #2
	beq _0224B64E
	mov r0, #0
	pop {r4, pc}
_0224B64E:
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov02_02248DBC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B638

	thumb_func_start ov02_0224B664
ov02_0224B664: ; 0x0224B664
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020689F8
	add r0, r4, #0
	add r0, #0x18
	bl ov02_0224886C
	mov r0, #0
	str r0, [r4, #0x10]
	mov r1, #1
	str r1, [r4, #4]
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B664

	thumb_func_start ov02_0224B68C
ov02_0224B68C: ; 0x0224B68C
	mov r0, #0
	bx lr
	thumb_func_end ov02_0224B68C

	thumb_func_start ov02_0224B690
ov02_0224B690: ; 0x0224B690
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _0224B6A0
	bl GF_AssertFail
_0224B6A0:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B690

	thumb_func_start ov02_0224B6B0
ov02_0224B6B0: ; 0x0224B6B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl MapObject_UnpauseMovement
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0205F690
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B6B0

	thumb_func_start ov02_0224B6D0
ov02_0224B6D0: ; 0x0224B6D0
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D98
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r4]
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov02_0224B6D0

	thumb_func_start ov02_0224B6E4
ov02_0224B6E4: ; 0x0224B6E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r0, [r4]
	bl sub_020248AC
	ldr r1, [r4, #4]
	ldr r0, [r0, #4]
	ldr r5, [r1, #0x4c]
	ldr r3, [r1, #0x50]
	ldr r1, [r1, #0x1c]
	cmp r1, #0
	bne _0224B720
	mov r1, #2
	lsl r1, r1, #0xe
	sub r2, r0, r1
	cmp r2, r5
	blt _0224B716
	add r0, r0, r1
	cmp r0, r3
	bgt _0224B716
	ldr r0, [r4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
_0224B716:
	ldr r0, [r4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
_0224B720:
	ldr r0, [r4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B6E4

	thumb_func_start ov02_0224B72C
ov02_0224B72C: ; 0x0224B72C
	push {r3, r4, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	mov r3, #0
	str r3, [r2]
	add r4, r0, #0
	str r3, [r2, #4]
	mov r0, #0x79
	str r3, [r2, #8]
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	add r1, sp, #8
	str r1, [sp]
	mov r1, #0x87
	str r1, [sp, #4]
	ldr r0, [r4, r0]
	ldr r1, _0224B764 ; =ov02_02253440
	bl sub_02068B0C
	mov r1, #0x7d
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_0224B764: .word ov02_02253440
	thumb_func_end ov02_0224B72C

	thumb_func_start ov02_0224B768
ov02_0224B768: ; 0x0224B768
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x7d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224B782
	bl sub_02068B48
	mov r0, #0x7d
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0224B782:
	pop {r4, pc}
	thumb_func_end ov02_0224B768

	thumb_func_start ov02_0224B784
ov02_0224B784: ; 0x0224B784
	push {r4, lr}
	sub sp, #0x18
	add r2, sp, #0xc
	mov r1, #0
	str r1, [r2]
	add r4, r0, #0
	str r1, [r2, #4]
	str r1, [r2, #8]
	str r4, [sp, #8]
	bl ov02_0224B88C
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
	add r0, sp, #8
	str r0, [sp]
	mov r0, #0x83
	str r0, [sp, #4]
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, _0224B7C8 ; =ov02_02253490
	add r2, sp, #0xc
	mov r3, #0
	bl sub_02068B0C
	mov r1, #0x1f
	lsl r1, r1, #4
	str r0, [r4, r1]
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_0224B7C8: .word ov02_02253490
	thumb_func_end ov02_0224B784

	thumb_func_start ov02_0224B7CC
ov02_0224B7CC: ; 0x0224B7CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	ldr r1, [r0]
	mov r6, #0x8a
	str r1, [r4]
	ldr r4, [r0]
	lsl r6, r6, #2
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	add r0, r4, r6
	add r0, #0x24
	add r1, sp, #0
	bl ov01_021FC014
	add r0, r4, r6
	add r0, #0x24
	mov r1, #0
	bl ov01_021FC004
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov02_0224B7CC

	thumb_func_start ov02_0224B804
ov02_0224B804: ; 0x0224B804
	bx lr
	.balign 4, 0
	thumb_func_end ov02_0224B804

	thumb_func_start ov02_0224B808
ov02_0224B808: ; 0x0224B808
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r0, [r5, #4]
	mov r6, #0x8a
	lsl r6, r6, #2
	ldr r4, [r5]
	cmp r0, #3
	bhi _0224B878
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224B824: ; jump table
	.short _0224B82C - _0224B824 - 2 ; case 0
	.short _0224B832 - _0224B824 - 2 ; case 1
	.short _0224B854 - _0224B824 - 2 ; case 2
	.short _0224B878 - _0224B824 - 2 ; case 3
_0224B82C:
	mov r0, #1
	str r0, [r5, #4]
	pop {r4, r5, r6, pc}
_0224B832:
	add r0, r4, r6
	add r0, #0x24
	mov r1, #1
	bl ov01_021FC004
	add r0, r4, r6
	add r0, #0x9c
	mov r1, #0
	bl ov01_021FBF20
	add r0, r4, r6
	add r0, #0xb0
	mov r1, #0
	bl ov01_021FBF20
	mov r0, #2
	str r0, [r5, #4]
_0224B854:
	add r0, r4, r6
	mov r1, #1
	add r0, #0x9c
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	add r0, r4, r6
	mov r1, #1
	add r0, #0xb0
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _0224B878
	mov r0, #1
	str r0, [r5, #8]
	mov r0, #3
	str r0, [r5, #4]
_0224B878:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B808

	thumb_func_start ov02_0224B87C
ov02_0224B87C: ; 0x0224B87C
	mov r0, #0x93
	ldr r1, [r1]
	lsl r0, r0, #2
	ldr r3, _0224B888 ; =ov01_021FBF68
	add r0, r1, r0
	bx r3
	.balign 4, 0
_0224B888: .word ov01_021FBF68
	thumb_func_end ov02_0224B87C

	thumb_func_start ov02_0224B88C
ov02_0224B88C: ; 0x0224B88C
	push {r4, lr}
	sub sp, #8
	mov r1, #0x8a
	lsl r1, r1, #2
	add r4, r0, r1
	add r0, r4, #0
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	mov r0, #0x67
	mov r1, #0x83
	mov r2, #4
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	str r0, [r4, #0x10]
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x14
	bl ov01_021FBD38
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x24
	add r1, #0x14
	bl ov01_021FBF2C
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x9c
	add r1, #0x14
	mov r2, #0x67
	mov r3, #0xa7
	str r4, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xb0
	add r1, #0x14
	mov r2, #0x67
	mov r3, #0xa5
	str r4, [sp, #4]
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x24
	add r1, #0x9c
	bl ov01_021FBF50
	add r0, r4, #0
	add r4, #0xb0
	add r0, #0x24
	add r1, r4, #0
	bl ov01_021FBF50
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B88C

	thumb_func_start ov02_0224B90C
ov02_0224B90C: ; 0x0224B90C
	push {r4, lr}
	mov r1, #0x8a
	lsl r1, r1, #2
	add r4, r0, r1
	add r0, r4, #0
	add r0, #0x14
	bl ov01_021FBDFC
	ldr r0, [r4, #0x10]
	bl ov01_021F1448
	add r0, r4, #0
	add r0, #0x9c
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0xb0
	add r1, r4, #0
	bl ov01_021FBE80
	pop {r4, pc}
	thumb_func_end ov02_0224B90C

	thumb_func_start ov02_0224B938
ov02_0224B938: ; 0x0224B938
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0205F690
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0205F484
	add r0, r4, #0
	bl ov02_0224B784
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B938

	thumb_func_start ov02_0224B964
ov02_0224B964: ; 0x0224B964
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02068D74
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _0224B992
	mov r0, #0x1f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02068B48
	add r0, r4, #0
	bl ov02_0224B90C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
_0224B992:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224B964

	thumb_func_start ov02_BattleExit_HandleRoamerAction
ov02_BattleExit_HandleRoamerAction: ; 0x0224B998
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r1, #8]
	str r1, [sp]
	mov r1, #0
	bl GetPartyMonByIndex
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_Roamers_get
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl ov02_0224BAA8
	str r0, [sp, #8]
	cmp r0, #0
	beq _0224BA50
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl SpeciesToRoamerIdx
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r7, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _0224BA14
	cmp r4, #0
	bne _0224BA14
	add r0, sp, #8
	bl RoamerMon_init
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	ldr r1, [sp, #4]
	mov r2, #2
	bl sub_02066BE8
	b _0224BA42
_0224BA14:
	cmp r0, #4
	bne _0224BA2E
	add r0, sp, #8
	bl RoamerMon_init
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	ldr r1, [sp, #4]
	mov r2, #1
	bl sub_02066BE8
	b _0224BA42
_0224BA2E:
	ldr r0, [sp, #8]
	mov r1, #5
	add r2, r4, #0
	bl SetRoamerData
	ldr r0, [sp, #8]
	mov r1, #7
	add r2, r7, #0
	bl SetRoamerData
_0224BA42:
	ldr r1, [r5, #0x20]
	add r0, r6, #0
	ldr r1, [r1]
	bl ov02_RepelActiveRoamersFromMapNo
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0224BA50:
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0x1e
	bhs _0224BA6C
	ldr r1, [r5, #0x20]
	add r0, r6, #0
	ldr r1, [r1]
	bl ov02_RepelActiveRoamersFromMapNo
_0224BA6C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_BattleExit_HandleRoamerAction

	thumb_func_start ov02_RepelActiveRoamersFromMapNo
ov02_RepelActiveRoamersFromMapNo: ; 0x0224BA70
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0224BA78:
	add r0, r5, #0
	add r1, r4, #0
	bl GetRoamerIsActiveByIndex
	cmp r0, #0
	beq _0224BA9C
	add r0, r5, #0
	add r1, r4, #0
	bl Roamer_GetLocation
	bl GetRoamMapByLocationIdx
	cmp r6, r0
	bne _0224BA9C
	add r0, r5, #0
	add r1, r4, #0
	bl RoamerLocationUpdateRand
_0224BA9C:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _0224BA78
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_RepelActiveRoamersFromMapNo

	thumb_func_start ov02_0224BAA8
ov02_0224BAA8: ; 0x0224BAA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0224BAB0:
	add r0, r5, #0
	add r1, r4, #0
	bl GetRoamerIsActiveByIndex
	cmp r0, #0
	beq _0224BAD4
	add r0, r5, #0
	add r1, r4, #0
	bl Roamers_GetRoamMonStats
	mov r1, #4
	add r7, r0, #0
	bl GetRoamerData
	cmp r6, r0
	bne _0224BAD4
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224BAD4:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _0224BAB0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224BAA8

	thumb_func_start PlayerStepEvent_RepelCounterDecrement
PlayerStepEvent_RepelCounterDecrement: ; 0x0224BAE4
	push {r4, lr}
	add r4, r1, #0
	bl Save_Roamers_get
	bl RoamerSave_GetRepelAddr
	ldrb r1, [r0]
	cmp r1, #0
	beq _0224BB0E
	sub r1, r1, #1
	strb r1, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0224BB0E
	ldr r1, _0224BB14 ; =std_repel_wore_off
	add r0, r4, #0
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r4, pc}
_0224BB0E:
	mov r0, #0
	pop {r4, pc}
	nop
_0224BB14: .word std_repel_wore_off
	thumb_func_end PlayerStepEvent_RepelCounterDecrement

	thumb_func_start PokecenterAnimCreate
PokecenterAnimCreate: ; 0x0224BB18
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r6, r1, #0
	mov r1, #0x24
	add r2, sp, #4
	add r3, sp, #0
	add r5, r0, #0
	bl sub_02054C20
	cmp r0, #0
	beq _0224BB84
	mov r0, #4
	mov r1, #0x18
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	strb r6, [r4, #0xc]
	mov r0, #0
	strb r0, [r4, #0xd]
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	ldr r0, [r5, #0x30]
	bl MapMatrix_GetWidth
	add r1, r0, #0
	ldr r0, [sp]
	add r2, sp, #0x14
	bl sub_02054DC8
	ldr r1, [sp, #4]
	add r0, sp, #8
	bl ov01_021F3B0C
	add r3, sp, #8
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r4]
	ldr r0, [sp, #0x14]
	add r2, r4, #0
	add r0, r1, r0
	str r0, [r4]
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x1c]
	add r0, r1, r0
	str r0, [r4, #8]
	ldr r0, [r5, #0x10]
	ldr r1, _0224BB8C ; =PokecenterAnimRun
	bl TaskManager_Call
	add sp, #0x20
	pop {r4, r5, r6, pc}
_0224BB84:
	bl GF_AssertFail
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224BB8C: .word PokecenterAnimRun
	thumb_func_end PokecenterAnimCreate

	thumb_func_start PokecenterAnimRun
PokecenterAnimRun: ; 0x0224BB90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4, #0xf]
	cmp r1, #5
	bls _0224BBAC
	b _0224BDCC
_0224BBAC:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224BBB8: ; jump table
	.short _0224BBC4 - _0224BBB8 - 2 ; case 0
	.short _0224BC98 - _0224BBB8 - 2 ; case 1
	.short _0224BCFA - _0224BBB8 - 2 ; case 2
	.short _0224BD42 - _0224BBB8 - 2 ; case 3
	.short _0224BD64 - _0224BBB8 - 2 ; case 4
	.short _0224BDC2 - _0224BBB8 - 2 ; case 5
_0224BBC4:
	ldr r1, [r6, #0x34]
	mov r0, #0x6b
	bl ov01_021FB90C
	add r5, r0, #0
	ldr r1, [r6, #0x34]
	mov r0, #0x25
	bl ov01_021FB90C
	add r7, r0, #0
	ldr r0, [r5]
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _0224BC02
	add r2, r0, #0
	add r2, #8
	beq _0224BBF6
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0224BBF6
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0224BBF8
_0224BBF6:
	mov r1, #0
_0224BBF8:
	cmp r1, #0
	beq _0224BC02
	ldr r1, [r1]
	add r5, r0, r1
	b _0224BC04
_0224BC02:
	mov r5, #0
_0224BC04:
	ldr r0, [r7]
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _0224BC2E
	add r2, r0, #0
	add r2, #8
	beq _0224BC22
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0224BC22
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0224BC24
_0224BC22:
	mov r1, #0
_0224BC24:
	cmp r1, #0
	beq _0224BC2E
	ldr r1, [r1]
	add r7, r0, r1
	b _0224BC30
_0224BC2E:
	mov r7, #0
_0224BC30:
	ldr r0, [r6, #0x34]
	bl ov01_021FB9E0
	mov r1, #0
	str r1, [sp]
	str r5, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #0x10
	mov r3, #0x6b
	bl ov01_021E8DE8
	add r0, r6, #0
	mov r1, #0x25
	add r2, sp, #0x18
	mov r3, #0
	bl sub_02054C20
	cmp r0, #0
	bne _0224BC66
	bl GF_AssertFail
_0224BC66:
	ldr r0, [sp, #0x18]
	bl ov01_021F3B38
	add r5, r0, #0
	ldr r0, [r6, #0x34]
	bl ov01_021FB9E0
	str r5, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #0x20
	mov r3, #0x25
	bl ov01_021E8DE8
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BC98:
	add r1, sp, #0x1c
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldrb r2, [r4, #0xd]
	mov r1, #0xc
	ldr r0, [r4]
	add r3, r2, #0
	ldr r2, _0224BDD4 ; =ov02_02253D90
	mul r3, r1
	ldr r2, [r2, r3]
	add r0, r0, r2
	str r0, [sp, #0x28]
	ldrb r2, [r4, #0xd]
	ldr r0, [r4, #4]
	add r3, r2, #0
	ldr r2, _0224BDD8 ; =ov02_02253D94
	mul r3, r1
	ldr r2, [r2, r3]
	add r0, r0, r2
	str r0, [sp, #0x2c]
	ldrb r2, [r4, #0xd]
	ldr r0, [r4, #8]
	add r3, r2, #0
	mul r3, r1
	ldr r1, _0224BDDC ; =ov02_02253D98
	ldr r1, [r1, r3]
	add r0, r0, r1
	str r0, [sp, #0x30]
	ldr r0, _0224BDE0 ; =SEQ_SE_DP_BOWA
	bl PlaySE
	ldr r0, [r6, #0x54]
	add r6, #0x9c
	str r0, [sp]
	ldr r0, [r6]
	mov r1, #0x6b
	add r2, sp, #0x28
	add r3, sp, #0x1c
	bl ov01_021F3C0C
	ldrb r1, [r4, #0xd]
	add r1, r4, r1
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BCFA:
	ldrb r0, [r4, #0xe]
	cmp r0, #0xc
	bhs _0224BD06
	add r0, r0, #1
	strb r0, [r4, #0xe]
	b _0224BDCC
_0224BD06:
	mov r0, #0
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	cmp r1, r0
	bhs _0224BD1E
	mov r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BD1E:
	add r0, r6, #0
	add r0, #0x9c
	ldrb r1, [r4, #0x10]
	ldr r0, [r0]
	bl ov01_021F3B60
	bl ov01_021F3B38
	add r3, r0, #0
	ldr r0, [r6, #0x58]
	mov r1, #0x10
	mov r2, #0
	bl ov01_021E8E40
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BD42:
	ldr r0, [r6, #0x58]
	mov r1, #0x10
	mov r2, #0
	bl ov01_021E8E70
	ldr r0, [r6, #0x58]
	mov r1, #0x20
	mov r2, #0
	bl ov01_021E8E70
	ldr r0, _0224BDE4 ; =SEQ_ME_ASA
	bl PlayFanfare
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BD64:
	ldr r0, [r6, #0x58]
	mov r1, #0x10
	bl ov01_021E8F10
	cmp r0, #0
	beq _0224BDCC
	ldr r0, [r6, #0x58]
	mov r1, #0x20
	bl ov01_021E8F10
	cmp r0, #0
	beq _0224BDCC
	bl IsFanfarePlaying
	cmp r0, #0
	bne _0224BDCC
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #0x20
	bl ov01_021E8ED0
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #0x10
	bl ov01_021E8ED0
	ldrb r0, [r4, #0xc]
	mov r5, #0
	cmp r0, #0
	bls _0224BDBA
_0224BDA0:
	add r0, r4, r5
	add r1, r6, #0
	add r1, #0x9c
	ldrb r0, [r0, #0x10]
	ldr r1, [r1]
	bl ov01_021F36DC
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	blo _0224BDA0
_0224BDBA:
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224BDCC
_0224BDC2:
	bl FreeToHeap
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224BDCC:
	mov r0, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0224BDD4: .word ov02_02253D90
_0224BDD8: .word ov02_02253D94
_0224BDDC: .word ov02_02253D98
_0224BDE0: .word SEQ_SE_DP_BOWA
_0224BDE4: .word SEQ_ME_ASA
	thumb_func_end PokecenterAnimRun

	thumb_func_start ov02_0224BDE8
ov02_0224BDE8: ; 0x0224BDE8
	push {r4, r5, r6, lr}
	add r6, r2, #0
	mov r2, #0
	add r4, r1, #0
	mov r1, #0xd0
	add r3, r2, #0
	add r5, r0, #0
	bl sub_02054C20
	cmp r0, #0
	beq _0224BE1A
	mov r0, #4
	add r1, r0, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	strb r6, [r2]
	strb r4, [r2, #1]
	mov r0, #0
	strb r0, [r2, #2]
	ldr r0, [r5, #0x10]
	ldr r1, _0224BE20 ; =ov02_0224BE24
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
_0224BE1A:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224BE20: .word ov02_0224BE24
	thumb_func_end ov02_0224BDE8

	thumb_func_start ov02_0224BE24
ov02_0224BE24: ; 0x0224BE24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4, #2]
	cmp r1, #4
	bls _0224BE40
	b _0224BF48
_0224BE40:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224BE4C: ; jump table
	.short _0224BE56 - _0224BE4C - 2 ; case 0
	.short _0224BED2 - _0224BE4C - 2 ; case 1
	.short _0224BF00 - _0224BE4C - 2 ; case 2
	.short _0224BF2C - _0224BE4C - 2 ; case 3
	.short _0224BF3E - _0224BE4C - 2 ; case 4
_0224BE56:
	ldr r1, [r6, #0x34]
	mov r0, #0xd0
	bl ov01_021FB90C
	ldr r0, [r0]
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _0224BE88
	add r2, r0, #0
	add r2, #8
	beq _0224BE7C
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0224BE7C
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0224BE7E
_0224BE7C:
	mov r1, #0
_0224BE7E:
	cmp r1, #0
	beq _0224BE88
	ldr r1, [r1]
	add r7, r0, r1
	b _0224BE8A
_0224BE88:
	mov r7, #0
_0224BE8A:
	add r0, r6, #0
	mov r1, #0xd0
	add r2, sp, #0x18
	mov r3, #0
	bl sub_02054C20
	cmp r0, #0
	bne _0224BE9E
	bl GF_AssertFail
_0224BE9E:
	ldr r0, [sp, #0x18]
	bl ov01_021F3B38
	add r5, r0, #0
	ldr r0, [r6, #0x34]
	bl ov01_021FB9E0
	str r5, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldrb r0, [r4]
	mov r2, #1
	mov r3, #0xd0
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	bl ov01_021E8DE8
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _0224BF48
_0224BED2:
	ldrb r0, [r4, #1]
	mov r1, #1
	cmp r0, #0
	beq _0224BEE0
	cmp r0, #1
	beq _0224BEE0
	mov r1, #0
_0224BEE0:
	cmp r1, #0
	bne _0224BEE8
	bl GF_AssertFail
_0224BEE8:
	ldrb r2, [r4, #1]
	ldr r0, [r6, #0x58]
	mov r1, #1
	bl ov01_021E8E70
	ldr r0, _0224BF50 ; =SEQ_SE_DP_ELEBETA2
	bl PlaySE
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _0224BF48
_0224BF00:
	ldr r0, [r6, #0x58]
	mov r1, #1
	bl ov01_021E8F10
	cmp r0, #0
	beq _0224BF48
	ldr r0, _0224BF50 ; =SEQ_SE_DP_ELEBETA2
	mov r1, #0
	bl StopSE
	ldr r0, _0224BF54 ; =SEQ_SE_DP_PINPON
	bl PlaySE
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #1
	bl ov01_021E8ED0
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _0224BF48
_0224BF2C:
	ldr r0, _0224BF54 ; =SEQ_SE_DP_PINPON
	bl IsSEPlaying
	cmp r0, #0
	bne _0224BF48
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _0224BF48
_0224BF3E:
	bl FreeToHeap
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224BF48:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0224BF50: .word SEQ_SE_DP_ELEBETA2
_0224BF54: .word SEQ_SE_DP_PINPON
	thumb_func_end ov02_0224BE24

	thumb_func_start ov02_0224BF58
ov02_0224BF58: ; 0x0224BF58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r2, _0224BFBC ; =ov02_022536E8
	add r7, r1, #0
	ldr r3, [r2]
	ldr r2, [r2, #4]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	add r2, sp, #0x20
	str r2, [sp]
	add r1, sp, #0x18
	mov r2, #2
	add r3, sp, #0x24
	add r5, r0, #0
	bl sub_02054C90
	cmp r0, #0
	beq _0224BFB4
	ldr r0, [r5, #0x34]
	bl ov01_021FB9E0
	add r6, r0, #0
	ldr r0, [sp, #0x24]
	bl ov01_021F3B38
	add r4, r0, #0
	ldr r0, [sp, #0x24]
	bl ov01_021F3B3C
	str r4, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	ldr r3, [sp, #0x20]
	add r2, r7, #0
	bl ov01_021E8DE8
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_0224BFB4:
	bl GF_AssertFail
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224BFBC: .word ov02_022536E8
	thumb_func_end ov02_0224BF58

	thumb_func_start ov02_0224BFC0
ov02_0224BFC0: ; 0x0224BFC0
	ldr r3, _0224BFC8 ; =ov01_021E8E70
	ldr r0, [r0, #0x58]
	mov r2, #0
	bx r3
	.balign 4, 0
_0224BFC8: .word ov01_021E8E70
	thumb_func_end ov02_0224BFC0

	thumb_func_start ov02_0224BFCC
ov02_0224BFCC: ; 0x0224BFCC
	ldr r3, _0224BFD4 ; =ov01_021E8E70
	ldr r0, [r0, #0x58]
	mov r2, #1
	bx r3
	.balign 4, 0
_0224BFD4: .word ov01_021E8E70
	thumb_func_end ov02_0224BFCC

	thumb_func_start CreateFieldEscapeRopeTaskEnv
CreateFieldEscapeRopeTaskEnv: ; 0x0224BFD8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x30
	bl ov02_0224C660
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, #0xc]
	str r5, [r4, #0x24]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	sub r0, r0, #1
	cmp r0, #1
	bhi _0224C006
	mov r0, #0
	str r0, [r4, #8]
	b _0224C01A
_0224C006:
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _0224C016
	mov r0, #1
	str r0, [r4, #8]
	b _0224C01A
_0224C016:
	mov r0, #0
	str r0, [r4, #8]
_0224C01A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end CreateFieldEscapeRopeTaskEnv

	thumb_func_start Task_FieldEscapeRope
Task_FieldEscapeRope: ; 0x0224C020
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
_0224C032:
	ldr r3, [r5]
	add r0, r6, #0
	lsl r4, r3, #2
	ldr r3, _0224C058 ; =ov02_02253700
	add r1, r7, #0
	ldr r3, [r3, r4]
	add r2, r5, #0
	blx r3
	add r4, r0, #0
	cmp r4, #2
	bne _0224C04E
	add r0, r5, #0
	bl FreeToHeap
_0224C04E:
	cmp r4, #1
	beq _0224C032
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224C058: .word ov02_02253700
	thumb_func_end Task_FieldEscapeRope

	thumb_func_start ov02_0224C05C
ov02_0224C05C: ; 0x0224C05C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	mov r1, #4
	add r4, r2, #0
	bl ov01_021FCD2C
	ldr r2, _0224C0A4 ; =0xFFF6A000
	str r0, [r4, #0x1c]
	mov r1, #1
	mov r3, #0xf
	bl ov01_021FCD8C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C0A8 ; =ov02_02253820
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C092
	add r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C0A8 ; =ov02_02253820
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C092:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldr r0, _0224C0AC ; =SEQ_SE_DP_KAIDAN2
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224C0A4: .word 0xFFF6A000
_0224C0A8: .word ov02_02253820
_0224C0AC: .word SEQ_SE_DP_KAIDAN2
	thumb_func_end ov02_0224C05C

	thumb_func_start ov02_0224C0B0
ov02_0224C0B0: ; 0x0224C0B0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	add r5, r1, #0
	bl EventObjectMovementMan_IsFinish
	cmp r0, #0
	bne _0224C0C8
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_0224C0C8:
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224C144 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C0F0
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
	add r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C144 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C0F0:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #8
	bge _0224C100
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_0224C100:
	ldr r0, [r4, #0xc]
	cmp r0, #2
	bne _0224C120
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _0224C138
_0224C120:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _0224C148 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
_0224C138:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0224C144: .word ov02_02253794
_0224C148: .word 0x00007FFF
	thumb_func_end ov02_0224C0B0

	thumb_func_start ov02_0224C14C
ov02_0224C14C: ; 0x0224C14C
	push {r3, r4, r5, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	add r5, r1, #0
	bl EventObjectMovementMan_IsFinish
	cmp r0, #1
	bne _0224C184
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224C1B4 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C184
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
	add r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C1B4 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C184:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0224C190
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224C190:
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C1A2
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
_0224C1A2:
	ldr r0, [r4, #0x1c]
	bl ov01_021FCD78
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0224C1B4: .word ov02_02253794
	thumb_func_end ov02_0224C14C

	thumb_func_start ov02_0224C1B8
ov02_0224C1B8: ; 0x0224C1B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r1, #0xc]
	add r4, r2, #0
	bl Save_FlyPoints_get
	bl FlyPoints_GetSpecialSpawnWarpPtr
	add r1, r0, #0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	bl sub_02053B04
	mov r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224C1B8

	thumb_func_start ov02_0224C1D8
ov02_0224C1D8: ; 0x0224C1D8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x30
	add r6, r2, #0
	bl ov02_0224C660
	add r4, r0, #0
	str r6, [r4, #0xc]
	str r5, [r4, #0x24]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	str r0, [r4, #0x20]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224C1D8

	thumb_func_start ov02_0224C1F8
ov02_0224C1F8: ; 0x0224C1F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	ldr r7, _0224C230 ; =ov02_022536F0
	add r4, r0, #0
_0224C20C:
	ldr r3, [r4]
	add r0, r5, #0
	lsl r3, r3, #2
	ldr r3, [r7, r3]
	add r1, r6, #0
	add r2, r4, #0
	blx r3
	cmp r0, #2
	bne _0224C228
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224C228:
	cmp r0, #1
	beq _0224C20C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224C230: .word ov02_022536F0
	thumb_func_end ov02_0224C1F8

	thumb_func_start ov02_0224C234
ov02_0224C234: ; 0x0224C234
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r0, [r4, #0xc]
	add r5, r1, #0
	cmp r0, #2
	bne _0224C25A
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _0224C270
_0224C25A:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r3, _0224C29C ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
_0224C270:
	add r0, r5, #0
	mov r1, #4
	bl ov01_021FCD2C
	mov r1, #1
	ldr r2, _0224C2A0 ; =0xFFF6A000
	str r0, [r4, #0x1c]
	add r3, r1, #0
	bl ov01_021FCD8C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C2A4 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0224C29C: .word 0x00007FFF
_0224C2A0: .word 0xFFF6A000
_0224C2A4: .word ov02_02253794
	thumb_func_end ov02_0224C234

	thumb_func_start ov02_0224C2A8
ov02_0224C2A8: ; 0x0224C2A8
	push {r4, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_IsFinish
	cmp r0, #1
	bne _0224C2C6
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224C2E8 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
_0224C2C6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0224C2D2
	mov r0, #0
	pop {r4, pc}
_0224C2D2:
	ldr r0, [r4, #0x1c]
	mov r1, #2
	mov r2, #0
	mov r3, #0x3c
	bl ov01_021FCD8C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0224C2E8: .word ov02_02253794
	thumb_func_end ov02_0224C2A8

	thumb_func_start ov02_0224C2EC
ov02_0224C2EC: ; 0x0224C2EC
	push {r4, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_IsFinish
	cmp r0, #0
	bne _0224C2FE
	mov r0, #0
	pop {r4, pc}
_0224C2FE:
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #4
	ldr r0, [r4, #0x20]
	bge _0224C31C
	ldr r1, _0224C330 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	mov r0, #0
	pop {r4, pc}
_0224C31C:
	ldr r1, _0224C334 ; =ov02_02253884
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	nop
_0224C330: .word ov02_02253794
_0224C334: .word ov02_02253884
	thumb_func_end ov02_0224C2EC

	thumb_func_start ov02_0224C338
ov02_0224C338: ; 0x0224C338
	push {r4, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_IsFinish
	cmp r0, #0
	bne _0224C34A
	mov r0, #0
	pop {r4, pc}
_0224C34A:
	ldr r0, [r4, #0x1c]
	bl ov01_021FCD6C
	cmp r0, #0
	bne _0224C358
	mov r0, #0
	pop {r4, pc}
_0224C358:
	ldr r0, [r4, #0x1c]
	bl ov01_021FCD78
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov02_0224C338

	thumb_func_start CreateFieldDigTaskEnv
CreateFieldDigTaskEnv: ; 0x0224C368
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	mov r1, #0x30
	add r7, r2, #0
	bl ov02_0224C660
	add r4, r0, #0
	mov r0, #1
	str r0, [r4, #0xc]
	str r5, [r4, #0x24]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	str r0, [r4, #0x20]
	add r0, r5, #0
	str r6, [r4, #0x28]
	bl ov01_02206268
	cmp r0, #0
	beq _0224C3A4
	add r0, r5, #0
	bl ov01_022062CC
	cmp r7, r0
	bne _0224C3A4
	mov r0, #1
	str r0, [r4, #8]
	b _0224C3A8
_0224C3A4:
	mov r0, #0
	str r0, [r4, #8]
_0224C3A8:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end CreateFieldDigTaskEnv

	thumb_func_start Task_FieldDig
Task_FieldDig: ; 0x0224C3AC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r7, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #3
	bhi _0224C4A2
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224C3D8: ; jump table
	.short _0224C3E0 - _0224C3D8 - 2 ; case 0
	.short _0224C3F8 - _0224C3D8 - 2 ; case 1
	.short _0224C42A - _0224C3D8 - 2 ; case 2
	.short _0224C45C - _0224C3D8 - 2 ; case 3
_0224C3E0:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C3F0
	ldr r1, _0224C4A8 ; =ov01_02205A60
	add r0, r7, #0
	mov r2, #0
	bl TaskManager_Call
_0224C3F0:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224C4A2
_0224C3F8:
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C42A
	add r0, r6, #0
	mov r1, #4
	bl ov02_02250780
	cmp r0, #0
	beq _0224C41E
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	mov r4, #2
	bl FsysUnkSub108_AddMonMood
	b _0224C420
_0224C41E:
	mov r4, #1
_0224C420:
	add r0, r6, #0
	add r1, r4, #0
	bl ov02_022507B4
	b _0224C4A2
_0224C42A:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C456
	ldr r0, [r4, #0x28]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	ldr r0, [sp]
	lsl r1, r1, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
_0224C456:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0224C45C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C482
	bl IsCryFinished
	cmp r0, #0
	beq _0224C46E
	mov r5, #0
	b _0224C494
_0224C46E:
	ldr r3, [r4]
	add r0, r7, #0
	lsl r5, r3, #2
	ldr r3, _0224C4AC ; =ov02_02253710
	add r1, r6, #0
	ldr r3, [r3, r5]
	add r2, r4, #0
	blx r3
	add r5, r0, #0
	b _0224C494
_0224C482:
	ldr r3, [r4]
	add r0, r7, #0
	lsl r5, r3, #2
	ldr r3, _0224C4B0 ; =ov02_02253754
	add r1, r6, #0
	ldr r3, [r3, r5]
	add r2, r4, #0
	blx r3
	add r5, r0, #0
_0224C494:
	cmp r5, #2
	bne _0224C49E
	add r0, r4, #0
	bl FreeToHeap
_0224C49E:
	cmp r5, #1
	beq _0224C45C
_0224C4A2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224C4A8: .word ov01_02205A60
_0224C4AC: .word ov02_02253710
_0224C4B0: .word ov02_02253754
	thumb_func_end Task_FieldDig

	thumb_func_start ov02_0224C4B4
ov02_0224C4B4: ; 0x0224C4B4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r0, [r5, #0x40]
	add r4, r2, #0
	bl PlayerAvatar_GetGender
	add r3, r0, #0
	ldr r2, [r4, #0x28]
	add r0, r5, #0
	mov r1, #0
	bl ov02_02249458
	str r0, [r4, #0x18]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224C4B4

	thumb_func_start ov02_0224C4D8
ov02_0224C4D8: ; 0x0224C4D8
	push {r4, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x18]
	bl ov02_0224953C
	cmp r0, #0
	bne _0224C4EA
	mov r0, #0
	pop {r4, pc}
_0224C4EA:
	ldr r0, [r4, #0x18]
	bl ov02_02249548
	ldr r0, [r4, #0x24]
	bl ov01_02205D68
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_0224C4D8

	thumb_func_start CreateFieldTeleportTaskEnv
CreateFieldTeleportTaskEnv: ; 0x0224C500
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	mov r1, #0x30
	add r7, r2, #0
	bl ov02_0224C660
	add r4, r0, #0
	mov r0, #2
	str r0, [r4, #0xc]
	str r5, [r4, #0x24]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	str r0, [r4, #0x20]
	str r6, [r4, #0x28]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	sub r0, r0, #1
	cmp r0, #1
	bhi _0224C534
	mov r0, #0
	str r0, [r4, #8]
	b _0224C552
_0224C534:
	add r0, r5, #0
	bl ov01_02206268
	cmp r0, #0
	beq _0224C54E
	add r0, r5, #0
	bl ov01_022062CC
	cmp r7, r0
	bne _0224C54E
	mov r0, #1
	str r0, [r4, #8]
	b _0224C552
_0224C54E:
	mov r0, #0
	str r0, [r4, #8]
_0224C552:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end CreateFieldTeleportTaskEnv

	thumb_func_start Task_FieldTeleport
Task_FieldTeleport: ; 0x0224C558
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r7, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #3
	bhi _0224C64E
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224C584: ; jump table
	.short _0224C58C - _0224C584 - 2 ; case 0
	.short _0224C5A4 - _0224C584 - 2 ; case 1
	.short _0224C5D6 - _0224C584 - 2 ; case 2
	.short _0224C608 - _0224C584 - 2 ; case 3
_0224C58C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C59C
	ldr r1, _0224C654 ; =ov01_02205A60
	add r0, r7, #0
	mov r2, #0
	bl TaskManager_Call
_0224C59C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224C64E
_0224C5A4:
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C5D6
	add r0, r6, #0
	mov r1, #0xe
	bl ov02_02250780
	cmp r0, #0
	beq _0224C5CA
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	mov r4, #2
	bl FsysUnkSub108_AddMonMood
	b _0224C5CC
_0224C5CA:
	mov r4, #1
_0224C5CC:
	add r0, r6, #0
	add r1, r4, #0
	bl ov02_022507B4
	b _0224C64E
_0224C5D6:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C602
	ldr r0, [r4, #0x28]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	ldr r0, [sp]
	lsl r1, r1, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
_0224C602:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0224C608:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C62E
	bl IsCryFinished
	cmp r0, #0
	beq _0224C61A
	mov r5, #0
	b _0224C640
_0224C61A:
	ldr r3, [r4]
	add r0, r7, #0
	lsl r5, r3, #2
	ldr r3, _0224C658 ; =ov02_0225373C
	add r1, r6, #0
	ldr r3, [r3, r5]
	add r2, r4, #0
	blx r3
	add r5, r0, #0
	b _0224C640
_0224C62E:
	ldr r3, [r4]
	add r0, r7, #0
	lsl r5, r3, #2
	ldr r3, _0224C65C ; =ov02_02253724
	add r1, r6, #0
	ldr r3, [r3, r5]
	add r2, r4, #0
	blx r3
	add r5, r0, #0
_0224C640:
	cmp r5, #2
	bne _0224C64A
	add r0, r4, #0
	bl FreeToHeap
_0224C64A:
	cmp r5, #1
	beq _0224C608
_0224C64E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224C654: .word ov01_02205A60
_0224C658: .word ov02_0225373C
_0224C65C: .word ov02_02253724
	thumb_func_end Task_FieldTeleport

	thumb_func_start ov02_0224C660
ov02_0224C660: ; 0x0224C660
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _0224C670
	bl GF_AssertFail
_0224C670:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224C660

	thumb_func_start ov02_0224C680
ov02_0224C680: ; 0x0224C680
	push {r4, lr}
	add r4, r2, #0
	add r0, r1, #0
	mov r1, #2
	mov r2, #1
	bl ov01_022060B8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_0224C680

	thumb_func_start ov02_0224C698
ov02_0224C698: ; 0x0224C698
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	mov r1, #4
	add r4, r2, #0
	bl ov01_021FCD2C
	ldr r2, _0224C6D0 ; =0xFFF6A000
	mov r1, #1
	mov r3, #0xf
	str r0, [r4, #0x1c]
	bl ov01_021FCD8C
	add r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C6D4 ; =ov02_02253770
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldr r0, _0224C6D8 ; =SEQ_SE_DP_TELE
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224C6D0: .word 0xFFF6A000
_0224C6D4: .word ov02_02253770
_0224C6D8: .word SEQ_SE_DP_TELE
	thumb_func_end ov02_0224C698

	thumb_func_start ov02_0224C6DC
ov02_0224C6DC: ; 0x0224C6DC
	push {r3, r4, r5, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x14]
	add r5, r1, #0
	bl EventObjectMovementMan_IsFinish
	cmp r0, #0
	bne _0224C6F0
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224C6F0:
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224C718 ; =ov02_02253820
	bl EventObjectMovementMan_Create
	add r5, #0xe4
	str r0, [r4, #0x10]
	ldr r0, [r5]
	ldr r1, _0224C718 ; =ov02_02253820
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224C718: .word ov02_02253820
	thumb_func_end ov02_0224C6DC

	thumb_func_start ov02_0224C71C
ov02_0224C71C: ; 0x0224C71C
	push {r4, lr}
	add r0, r1, #0
	mov r1, #4
	add r4, r2, #0
	bl ov01_021FCD2C
	ldr r2, _0224C750 ; =0xFFF6A000
	str r0, [r4, #0x1c]
	mov r1, #1
	mov r3, #0xf
	bl ov01_021FCD8C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C754 ; =ov02_02253820
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldr r0, _0224C758 ; =SEQ_SE_DP_TELE
	bl PlaySE
	mov r0, #0
	pop {r4, pc}
	nop
_0224C750: .word 0xFFF6A000
_0224C754: .word ov02_02253820
_0224C758: .word SEQ_SE_DP_TELE
	thumb_func_end ov02_0224C71C

	thumb_func_start ov02_0224C75C
ov02_0224C75C: ; 0x0224C75C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	add r5, r1, #0
	bl EventObjectMovementMan_IsFinish
	cmp r0, #0
	bne _0224C774
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_0224C774:
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224C7D0 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C79C
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
	add r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C7D0 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C79C:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #8
	bge _0224C7AC
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_0224C7AC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0224C7D0: .word ov02_02253794
	thumb_func_end ov02_0224C75C

	thumb_func_start ov02_0224C7D4
ov02_0224C7D4: ; 0x0224C7D4
	push {r3, r4, r5, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	add r5, r1, #0
	bl EventObjectMovementMan_IsFinish
	cmp r0, #1
	bne _0224C80C
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224C83C ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C80C
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
	add r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C83C ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C80C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0224C818
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224C818:
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C82A
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
_0224C82A:
	ldr r0, [r4, #0x1c]
	bl ov01_021FCD78
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0224C83C: .word ov02_02253794
	thumb_func_end ov02_0224C7D4

	thumb_func_start ov02_0224C840
ov02_0224C840: ; 0x0224C840
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r1, #0xc]
	add r4, r2, #0
	bl Save_FlyPoints_get
	add r6, r0, #0
	bl FlyPoints_GetDeathSpawn
	add r1, sp, #0
	add r7, r0, #0
	bl GetFlyWarpData
	add r0, r6, #0
	bl FlyPoints_GetSpecialSpawnWarpPtr
	add r1, r0, #0
	add r0, r7, #0
	bl GetSpecialSpawnWarpData
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02053B04
	mov r0, #2
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224C840

	thumb_func_start ov02_0224C87C
ov02_0224C87C: ; 0x0224C87C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	mov r1, #4
	add r4, r2, #0
	bl ov01_021FCD2C
	ldr r2, _0224C8C4 ; =0xFFF6A000
	str r0, [r4, #0x1c]
	mov r1, #1
	mov r3, #0xf
	bl ov01_021FCD8C
	ldr r0, [r4, #0x20]
	ldr r1, _0224C8C8 ; =ov02_022537DC
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C8B2
	add r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C8C8 ; =ov02_022537DC
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C8B2:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldr r0, _0224C8CC ; =SEQ_SE_DP_KAIDAN2
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224C8C4: .word 0xFFF6A000
_0224C8C8: .word ov02_022537DC
_0224C8CC: .word SEQ_SE_DP_KAIDAN2
	thumb_func_end ov02_0224C87C

	thumb_func_start ov02_0224C8D0
ov02_0224C8D0: ; 0x0224C8D0
	push {r3, r4, r5, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	add r5, r1, #0
	bl EventObjectMovementMan_IsFinish
	cmp r0, #0
	bne _0224C8E4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224C8E4:
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224C938 ; =ov02_022537B8
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C90E
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	ldr r1, _0224C938 ; =ov02_022537B8
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C90E:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _0224C92E
	ldr r0, [r4, #8]
	cmp r0, #0
	ldr r0, [r4, #0x24]
	beq _0224C928
	bl ov02_0224DDF4
	str r0, [r4, #0x2c]
	b _0224C92E
_0224C928:
	bl ov02_0224DDE0
	str r0, [r4, #0x2c]
_0224C92E:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224C938: .word ov02_022537B8
	thumb_func_end ov02_0224C8D0

	thumb_func_start ov02_0224C93C
ov02_0224C93C: ; 0x0224C93C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	add r5, r1, #0
	bl EventObjectMovementMan_IsFinish
	cmp r0, #0
	bne _0224C954
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_0224C954:
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224C9B0 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C97C
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
	add r5, #0xe4
	ldr r0, [r5]
	ldr r1, _0224C9B0 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C97C:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #8
	bge _0224C98C
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_0224C98C:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _0224C9B4 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0224C9B0: .word ov02_02253794
_0224C9B4: .word 0x00007FFF
	thumb_func_end ov02_0224C93C

	thumb_func_start ov02_0224C9B8
ov02_0224C9B8: ; 0x0224C9B8
	push {r3, r4, r5, lr}
	add r4, r2, #0
	ldr r0, [r4, #0x10]
	add r5, r1, #0
	bl EventObjectMovementMan_IsFinish
	cmp r0, #1
	bne _0224C9F2
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r4, #0x20]
	ldr r1, _0224CA34 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224C9F2
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	ldr r1, _0224CA34 ; =ov02_02253794
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x14]
_0224C9F2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0224C9FE
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224C9FE:
	ldr r0, [r4, #0x10]
	bl EventObjectMovementMan_Delete
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _0224CA18
	ldr r0, [r4, #0x2c]
	bl ov02_0224DE08
	mov r0, #0
	str r0, [r4, #0x2c]
_0224CA18:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224CA24
	ldr r0, [r4, #0x14]
	bl EventObjectMovementMan_Delete
_0224CA24:
	ldr r0, [r4, #0x1c]
	bl ov01_021FCD78
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224CA34: .word ov02_02253794
	thumb_func_end ov02_0224C9B8

	thumb_func_start ov02_0224CA38
ov02_0224CA38: ; 0x0224CA38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r1, #0xc]
	add r4, r2, #0
	bl Save_FlyPoints_get
	bl FlyPoints_GetSpecialSpawnWarpPtr
	add r1, r0, #0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	bl sub_02053B04
	mov r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224CA38

	thumb_func_start ov02_0224CA58
ov02_0224CA58: ; 0x0224CA58
	push {r4, r5, r6, r7}
	add r3, r0, #0
	add r0, r2, #0
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r2, #0
	beq _0224CAB4
	add r6, r3, r1
	sub r7, r1, #1
_0224CA6C:
	sub r1, r6, #1
	ldrb r2, [r1]
	mov r1, #1
	add r5, r7, #0
	and r1, r2
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r7, #0
	ble _0224CA9A
_0224CA7E:
	ldrb r1, [r3, r5]
	add r2, r3, r5
	sub r2, r2, #1
	asr r1, r1, #1
	strb r1, [r3, r5]
	ldrb r2, [r2]
	ldrb r1, [r3, r5]
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r3, r5]
	sub r5, r5, #1
	cmp r5, #0
	bgt _0224CA7E
_0224CA9A:
	ldrb r1, [r3, r5]
	asr r1, r1, #1
	strb r1, [r3, r5]
	ldrb r2, [r3, r5]
	lsl r1, r4, #7
	orr r1, r2
	strb r1, [r3, r5]
	add r1, r0, #0
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r1, #0
	bne _0224CA6C
_0224CAB4:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov02_0224CA58

	thumb_func_start ov02_0224CAB8
ov02_0224CAB8: ; 0x0224CAB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r2, #0
	str r1, [sp]
	add r7, r3, #0
	bl WallpaperPasswordBank_GetNum
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl WallpaperPasswordBank_GetIndexOfWord
	add r1, sp, #4
	strh r0, [r1, #4]
	add r0, r5, #0
	add r1, r7, #0
	bl WallpaperPasswordBank_GetIndexOfWord
	add r1, sp, #4
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x10]
	add r0, r5, #0
	bl WallpaperPasswordBank_GetIndexOfWord
	add r1, sp, #4
	strh r0, [r1, #8]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x14]
	add r0, r5, #0
	bl WallpaperPasswordBank_GetIndexOfWord
	add r1, sp, #4
	mov r2, #0
	strh r0, [r1, #0xa]
	add r3, sp, #8
	add r5, sp, #4
	add r7, r2, #0
_0224CB06:
	ldrsh r0, [r3, r7]
	cmp r0, #0
	bge _0224CB14
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CB14:
	cmp r2, #0
	ble _0224CB48
	mov r6, #1
	mvn r6, r6
	ldrsh r6, [r3, r6]
	cmp r0, r6
	blt _0224CB34
	sub r0, r0, r6
	cmp r0, #0xff
	ble _0224CB30
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CB30:
	strb r0, [r5]
	b _0224CB5A
_0224CB34:
	sub r0, r6, r0
	sub r0, r4, r0
	cmp r0, #0xff
	ble _0224CB44
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CB44:
	strb r0, [r5]
	b _0224CB5A
_0224CB48:
	mov r0, #4
	ldrsh r0, [r1, r0]
	cmp r0, #0xff
	ble _0224CB58
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CB58:
	strb r0, [r1]
_0224CB5A:
	add r2, r2, #1
	add r3, r3, #2
	add r5, r5, #1
	cmp r2, #4
	blt _0224CB06
	add r0, sp, #4
	mov r1, #4
	mov r2, #5
	bl ov02_0224CA58
	mov r2, #0
	add r1, sp, #4
	add r4, sp, #4
	mov r3, #0xf0
_0224CB76:
	ldrb r5, [r4, #3]
	ldrb r0, [r1]
	add r2, r2, #1
	asr r6, r5, #4
	and r5, r3
	orr r5, r6
	eor r0, r5
	strb r0, [r1]
	add r1, r1, #1
	cmp r2, #3
	blt _0224CB76
	add r2, sp, #4
	ldrb r3, [r2, #3]
	mov r2, #0xf
	add r0, sp, #4
	and r2, r3
	lsl r2, r2, #0x18
	mov r1, #3
	lsr r2, r2, #0x18
	bl ov02_0224CA58
	add r1, sp, #4
	ldrb r5, [r1]
	mov r0, #0xf
	add r4, r5, #0
	and r4, r0
	cmp r4, #8
	blt _0224CBB4
	add sp, #0x10
	sub r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0224CBB4:
	ldrb r0, [r1, #1]
	eor r0, r5
	strb r0, [r1, #1]
	ldrb r0, [r1, #2]
	eor r0, r5
	strb r0, [r1, #2]
	ldrb r2, [r1, #1]
	ldrb r3, [r1, #2]
	lsl r0, r2, #8
	add r6, r0, #0
	ldr r0, [sp]
	orr r6, r3
	cmp r0, r6
	bne _0224CBEE
	mov r0, #0xf0
	and r0, r5
	asr r0, r0, #4
	cmp r0, #6
	bne _0224CBEE
	ldrb r0, [r1, #3]
	add r1, r5, r2
	mul r1, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r0, r1
	bne _0224CBEE
	add sp, #0x10
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224CBEE:
	mov r0, #0
	mvn r0, r0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224CAB8

	thumb_func_start ov02_0224CBF8
ov02_0224CBF8: ; 0x0224CBF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r2, #0
	str r1, [sp]
	add r7, r3, #0
	bl WallpaperPasswordBank_GetNum
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl WallpaperPasswordBank_GetIndexOfWord
	add r1, sp, #4
	strh r0, [r1, #4]
	add r0, r5, #0
	add r1, r7, #0
	bl WallpaperPasswordBank_GetIndexOfWord
	add r1, sp, #4
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x10]
	add r0, r5, #0
	bl WallpaperPasswordBank_GetIndexOfWord
	add r1, sp, #4
	strh r0, [r1, #8]
	add r1, sp, #0x18
	ldrh r1, [r1, #0x14]
	add r0, r5, #0
	bl WallpaperPasswordBank_GetIndexOfWord
	add r1, sp, #4
	mov r2, #0
	strh r0, [r1, #0xa]
	add r3, sp, #8
	add r5, sp, #4
	add r7, r2, #0
_0224CC46:
	ldrsh r0, [r3, r7]
	cmp r0, #0
	bge _0224CC54
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CC54:
	cmp r2, #0
	ble _0224CC88
	mov r6, #1
	mvn r6, r6
	ldrsh r6, [r3, r6]
	cmp r0, r6
	blt _0224CC74
	sub r0, r0, r6
	cmp r0, #0xff
	ble _0224CC70
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CC70:
	strb r0, [r5]
	b _0224CC9A
_0224CC74:
	sub r0, r6, r0
	sub r0, r4, r0
	cmp r0, #0xff
	ble _0224CC84
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CC84:
	strb r0, [r5]
	b _0224CC9A
_0224CC88:
	mov r0, #4
	ldrsh r0, [r1, r0]
	cmp r0, #0xff
	ble _0224CC98
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CC98:
	strb r0, [r1]
_0224CC9A:
	add r2, r2, #1
	add r3, r3, #2
	add r5, r5, #1
	cmp r2, #4
	blt _0224CC46
	add r0, sp, #4
	mov r1, #4
	mov r2, #5
	bl ov02_0224CA58
	mov r2, #0
	add r1, sp, #4
	add r4, sp, #4
	mov r3, #0xf0
_0224CCB6:
	ldrb r5, [r4, #3]
	ldrb r0, [r1]
	add r2, r2, #1
	asr r6, r5, #4
	and r5, r3
	orr r5, r6
	eor r0, r5
	strb r0, [r1]
	add r1, r1, #1
	cmp r2, #3
	blt _0224CCB6
	add r2, sp, #4
	ldrb r3, [r2, #3]
	mov r2, #0xf
	add r0, sp, #4
	and r2, r3
	lsl r2, r2, #0x18
	mov r1, #3
	lsr r2, r2, #0x18
	bl ov02_0224CA58
	add r1, sp, #4
	ldrb r4, [r1]
	mov r0, #0xf
	and r0, r4
	lsl r2, r0, #0x18
	lsr r2, r2, #0x18
	cmp r2, #8
	blo _0224CCF4
	cmp r2, #0xb
	blo _0224CCFC
_0224CCF4:
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0224CCFC:
	ldrb r2, [r1, #1]
	eor r2, r4
	strb r2, [r1, #1]
	ldrb r2, [r1, #2]
	eor r2, r4
	strb r2, [r1, #2]
	ldrb r2, [r1, #1]
	ldrb r3, [r1, #2]
	lsl r5, r2, #8
	add r6, r5, #0
	ldr r5, [sp]
	orr r6, r3
	cmp r5, r6
	bne _0224CD30
	mov r5, #0xf0
	and r5, r4
	asr r5, r5, #4
	cmp r5, #6
	bne _0224CD30
	add r2, r4, r2
	mul r2, r3
	lsl r2, r2, #0x18
	ldrb r1, [r1, #3]
	lsr r2, r2, #0x18
	cmp r1, r2
	beq _0224CD34
_0224CD30:
	mov r0, #0
	mvn r0, r0
_0224CD34:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224CBF8

	thumb_func_start ov02_0224CD38
ov02_0224CD38: ; 0x0224CD38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, [sp, #0x24]
	add r7, r1, #0
	str r2, [sp, #8]
	add r5, r3, #0
	bl WallpaperPasswordBank_Create
	add r4, r0, #0
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID_VisibleHalf
	add r1, r0, #0
	str r5, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	add r2, r7, #0
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl ov02_0224CAB8
	add r5, r0, #0
	add r0, r4, #0
	bl WallpaperPasswordBank_Delete
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224CD38

	thumb_func_start ov02_0224CD74
ov02_0224CD74: ; 0x0224CD74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, [sp, #0x24]
	add r7, r1, #0
	str r2, [sp, #8]
	add r5, r3, #0
	bl WallpaperPasswordBank_Create
	add r4, r0, #0
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID_VisibleHalf
	add r1, r0, #0
	str r5, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	add r2, r7, #0
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl ov02_0224CBF8
	add r5, r0, #0
	add r0, r4, #0
	bl WallpaperPasswordBank_Delete
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224CD74

	thumb_func_start ov02_0224CDB0
ov02_0224CDB0: ; 0x0224CDB0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r6, r1, #0
	mov r1, #0x26
	add r2, sp, #4
	add r3, sp, #0
	add r5, r0, #0
	bl sub_02054C20
	cmp r0, #0
	beq _0224CE1C
	mov r0, #4
	mov r1, #0x18
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	strb r6, [r4, #0xc]
	mov r0, #0
	strb r0, [r4, #0xd]
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	ldr r0, [r5, #0x30]
	bl MapMatrix_GetWidth
	add r1, r0, #0
	ldr r0, [sp]
	add r2, sp, #0x14
	bl sub_02054DC8
	ldr r1, [sp, #4]
	add r0, sp, #8
	bl ov01_021F3B0C
	add r3, sp, #8
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r4]
	ldr r0, [sp, #0x14]
	add r2, r4, #0
	add r0, r1, r0
	str r0, [r4]
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x1c]
	add r0, r1, r0
	str r0, [r4, #8]
	ldr r0, [r5, #0x10]
	ldr r1, _0224CE24 ; =ov02_0224CE28
	bl TaskManager_Call
	add sp, #0x20
	pop {r4, r5, r6, pc}
_0224CE1C:
	bl GF_AssertFail
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224CE24: .word ov02_0224CE28
	thumb_func_end ov02_0224CDB0

	thumb_func_start ov02_0224CE28
ov02_0224CE28: ; 0x0224CE28
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4, #0xf]
	cmp r1, #5
	bls _0224CE44
	b _0224CFC0
_0224CE44:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224CE50: ; jump table
	.short _0224CE5C - _0224CE50 - 2 ; case 0
	.short _0224CEBA - _0224CE50 - 2 ; case 1
	.short _0224CF1C - _0224CE50 - 2 ; case 2
	.short _0224CF64 - _0224CE50 - 2 ; case 3
	.short _0224CF76 - _0224CE50 - 2 ; case 4
	.short _0224CFB6 - _0224CE50 - 2 ; case 5
_0224CE5C:
	ldr r1, [r6, #0x34]
	mov r0, #0x6b
	bl ov01_021FB90C
	ldr r0, [r0]
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _0224CE8E
	add r2, r0, #0
	add r2, #8
	beq _0224CE82
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0224CE82
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0224CE84
_0224CE82:
	mov r1, #0
_0224CE84:
	cmp r1, #0
	beq _0224CE8E
	ldr r1, [r1]
	add r5, r0, r1
	b _0224CE90
_0224CE8E:
	mov r5, #0
_0224CE90:
	ldr r0, [r6, #0x34]
	bl ov01_021FB9E0
	mov r1, #0
	str r1, [sp]
	str r5, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #0x10
	mov r3, #0x6b
	bl ov01_021E8DE8
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CEBA:
	add r1, sp, #0x18
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldrb r2, [r4, #0xd]
	mov r1, #0xc
	ldr r0, [r4]
	add r3, r2, #0
	ldr r2, _0224CFC8 ; =ov02_02253DD8
	mul r3, r1
	ldr r2, [r2, r3]
	add r0, r0, r2
	str r0, [sp, #0x24]
	ldrb r2, [r4, #0xd]
	ldr r0, [r4, #4]
	add r3, r2, #0
	ldr r2, _0224CFCC ; =ov02_02253DDC
	mul r3, r1
	ldr r2, [r2, r3]
	add r0, r0, r2
	str r0, [sp, #0x28]
	ldrb r2, [r4, #0xd]
	ldr r0, [r4, #8]
	add r3, r2, #0
	mul r3, r1
	ldr r1, _0224CFD0 ; =ov02_02253DE0
	ldr r1, [r1, r3]
	add r0, r0, r1
	str r0, [sp, #0x2c]
	ldr r0, _0224CFD4 ; =SEQ_SE_DP_BOWA
	bl PlaySE
	ldr r0, [r6, #0x54]
	add r6, #0x9c
	str r0, [sp]
	ldr r0, [r6]
	mov r1, #0x6b
	add r2, sp, #0x24
	add r3, sp, #0x18
	bl ov01_021F3C0C
	ldrb r1, [r4, #0xd]
	add r1, r4, r1
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CF1C:
	ldrb r0, [r4, #0xe]
	cmp r0, #0xf
	bhs _0224CF28
	add r0, r0, #1
	strb r0, [r4, #0xe]
	b _0224CFC0
_0224CF28:
	mov r0, #0
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	cmp r1, r0
	bhs _0224CF40
	mov r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CF40:
	add r0, r6, #0
	add r0, #0x9c
	ldrb r1, [r4, #0x10]
	ldr r0, [r0]
	bl ov01_021F3B60
	bl ov01_021F3B38
	add r3, r0, #0
	ldr r0, [r6, #0x58]
	mov r1, #0x10
	mov r2, #0
	bl ov01_021E8E40
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CF64:
	ldr r0, [r6, #0x58]
	mov r1, #0x10
	mov r2, #0
	bl ov01_021E8E70
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CF76:
	ldr r0, [r6, #0x58]
	mov r1, #0x10
	bl ov01_021E8F10
	cmp r0, #0
	beq _0224CFC0
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x58]
	mov r2, #0x10
	bl ov01_021E8ED0
	ldrb r0, [r4, #0xc]
	mov r5, #0
	cmp r0, #0
	bls _0224CFAE
_0224CF94:
	add r0, r4, r5
	add r1, r6, #0
	add r1, #0x9c
	ldrb r0, [r0, #0x10]
	ldr r1, [r1]
	bl ov01_021F36DC
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	blo _0224CF94
_0224CFAE:
	ldrb r0, [r4, #0xf]
	add r0, r0, #1
	strb r0, [r4, #0xf]
	b _0224CFC0
_0224CFB6:
	bl FreeToHeap
	add sp, #0x30
	mov r0, #1
	pop {r4, r5, r6, pc}
_0224CFC0:
	mov r0, #0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_0224CFC8: .word ov02_02253DD8
_0224CFCC: .word ov02_02253DDC
_0224CFD0: .word ov02_02253DE0
_0224CFD4: .word SEQ_SE_DP_BOWA
	thumb_func_end ov02_0224CE28

	thumb_func_start ov02_0224CFD8
ov02_0224CFD8: ; 0x0224CFD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r2, #0
	bl GetMapObjectByID
	add r6, r0, #0
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r6, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentY
	add r4, r0, #0
	add r0, r6, #0
	bl MapObject_GetFacingDirection
	cmp r0, #3
	bhi _0224D028
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224D010: ; jump table
	.short _0224D018 - _0224D010 - 2 ; case 0
	.short _0224D01C - _0224D010 - 2 ; case 1
	.short _0224D020 - _0224D010 - 2 ; case 2
	.short _0224D024 - _0224D010 - 2 ; case 3
_0224D018:
	sub r4, r4, #1
	b _0224D02C
_0224D01C:
	add r4, r4, #1
	b _0224D02C
_0224D020:
	sub r5, r5, #1
	b _0224D02C
_0224D024:
	add r5, r5, #1
	b _0224D02C
_0224D028:
	bl GF_AssertFail
_0224D02C:
	mov r3, #2
	lsl r1, r5, #0x10
	lsl r3, r3, #0xe
	ldr r2, [sp, #4]
	lsl r4, r4, #0x10
	add r1, r1, r3
	add r0, r7, #0
	add r3, r4, r3
	bl ov01_021FC00C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224CFD8

	thumb_func_start ov02_0224D044
ov02_0224D044: ; 0x0224D044
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	add r6, r0, #0
	add r1, sp, #0
	bl PlayerAvatar_GetPositionVec
	add r0, r6, #0
	bl GetPlayerXCoord
	add r5, r0, #0
	add r0, r6, #0
	bl GetPlayerYCoord
	add r4, r0, #0
	add r0, r6, #0
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #3
	bhi _0224D090
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224D078: ; jump table
	.short _0224D080 - _0224D078 - 2 ; case 0
	.short _0224D084 - _0224D078 - 2 ; case 1
	.short _0224D088 - _0224D078 - 2 ; case 2
	.short _0224D08C - _0224D078 - 2 ; case 3
_0224D080:
	sub r4, r4, #1
	b _0224D094
_0224D084:
	add r4, r4, #1
	b _0224D094
_0224D088:
	sub r5, r5, #1
	b _0224D094
_0224D08C:
	add r5, r5, #1
	b _0224D094
_0224D090:
	bl GF_AssertFail
_0224D094:
	mov r3, #2
	lsl r1, r5, #0x10
	lsl r3, r3, #0xe
	ldr r2, [sp, #4]
	lsl r4, r4, #0x10
	add r1, r1, r3
	add r0, r7, #0
	add r3, r4, r3
	bl ov01_021FC00C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D044

	thumb_func_start ov02_0224D0AC
ov02_0224D0AC: ; 0x0224D0AC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	bl PlayerAvatar_GetPositionVec
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl ov01_021FC00C
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov02_0224D0AC

	thumb_func_start ov02_0224D0C8
ov02_0224D0C8: ; 0x0224D0C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	str r2, [sp, #8]
	add r6, r0, #0
	mov r1, #0
	mov r2, #0xdc
	add r4, r3, #0
	ldr r7, [sp, #0x28]
	bl memset
	add r0, r6, #0
	add r0, #0x78
	mov r1, #0x86
	add r2, r5, #0
	mov r3, #4
	bl ov01_021FBCD8
	add r1, r6, #0
	add r0, r6, #0
	add r1, #0x78
	bl ov01_021FBF2C
	add r0, r6, #0
	add r0, #0xd8
	str r4, [r0]
	add r0, r6, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r4, #0
	cmp r0, #0
	bls _0224D13E
	add r0, r6, #0
	add r5, r6, #0
	str r0, [sp, #0xc]
	add r0, #0x78
	add r5, #0x88
	str r0, [sp, #0xc]
_0224D114:
	ldr r3, [sp, #8]
	mov r0, #4
	str r0, [sp]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x86
	add r3, r3, r4
	str r7, [sp, #4]
	bl ov01_021FBE44
	add r0, r6, #0
	add r1, r5, #0
	bl ov01_021FBF50
	add r0, r6, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r4, r4, #1
	add r5, #0x14
	cmp r4, r0
	blo _0224D114
_0224D13E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D0C8

	thumb_func_start ov02_0224D144
ov02_0224D144: ; 0x0224D144
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x78
	add r7, r1, #0
	bl ov01_021FBDA8
	add r0, r6, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r4, #0
	cmp r0, #0
	bls _0224D176
	add r5, r6, #0
	add r5, #0x88
_0224D160:
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021FBE80
	add r0, r6, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r4, r4, #1
	add r5, #0x14
	cmp r4, r0
	blo _0224D160
_0224D176:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D144

	thumb_func_start ov02_0224D178
ov02_0224D178: ; 0x0224D178
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r6, #1
	mov r4, #0
	cmp r0, #0
	bls _0224D1A6
	add r5, r7, #0
	add r5, #0x88
_0224D18C:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	and r6, r0
	add r0, r7, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r4, r4, #1
	add r5, #0x14
	cmp r4, r0
	blo _0224D18C
_0224D1A6:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D178

	thumb_func_start ov02_0224D1AC
ov02_0224D1AC: ; 0x0224D1AC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r4, #0
	cmp r0, #0
	bls _0224D1D8
	add r5, r6, #0
	mov r7, #1
	add r5, #0x88
	lsl r7, r7, #0xc
_0224D1C2:
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021FBEAC
	add r0, r6, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r4, r4, #1
	add r5, #0x14
	cmp r4, r0
	blo _0224D1C2
_0224D1D8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D1AC

	thumb_func_start ov02_0224D1DC
ov02_0224D1DC: ; 0x0224D1DC
	ldr r3, _0224D1E0 ; =ov01_021FBF68
	bx r3
	.balign 4, 0
_0224D1E0: .word ov01_021FBF68
	thumb_func_end ov02_0224D1DC

	thumb_func_start ov02_0224D1E4
ov02_0224D1E4: ; 0x0224D1E4
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xf0
	bl memset
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #3
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r3, r1, #0
	bl ov02_0224D0C8
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl ov02_0224D044
	ldr r0, _0224D228 ; =SEQ_SE_DP_FW015
	bl PlaySE
	mov r0, #0
	add r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224D228: .word SEQ_SE_DP_FW015
	thumb_func_end ov02_0224D1E4

	thumb_func_start ov02_0224D22C
ov02_0224D22C: ; 0x0224D22C
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xf0
	bl memset
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #3
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r3, r1, #0
	bl ov02_0224D0C8
	ldr r0, [r5, #0x3c]
	mov r1, #0xfd
	add r2, r4, #0
	bl ov02_0224CFD8
	ldr r0, _0224D274 ; =SEQ_SE_DP_FW015
	bl PlaySE
	mov r0, #0
	add r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0224D274: .word SEQ_SE_DP_FW015
	thumb_func_end ov02_0224D22C

	thumb_func_start ov02_0224D278
ov02_0224D278: ; 0x0224D278
	ldr r3, _0224D284 ; =ov02_0224D144
	add r0, r2, #0
	add r2, #0xdc
	add r1, r2, #0
	bx r3
	nop
_0224D284: .word ov02_0224D144
	thumb_func_end ov02_0224D278

	thumb_func_start ov02_0224D288
ov02_0224D288: ; 0x0224D288
	push {r4, lr}
	add r4, r2, #0
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _0224D29A
	cmp r0, #1
	pop {r4, pc}
_0224D29A:
	add r0, r4, #0
	bl ov02_0224D178
	cmp r0, #1
	bne _0224D2B8
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FC004
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	add r4, #0xec
	add r0, r0, #1
	str r0, [r4]
_0224D2B8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D288

	thumb_func_start ov02_0224D2BC
ov02_0224D2BC: ; 0x0224D2BC
	ldr r3, _0224D2C4 ; =ov02_0224D1DC
	add r0, r2, #0
	bx r3
	nop
_0224D2C4: .word ov02_0224D1DC
	thumb_func_end ov02_0224D2BC

	thumb_func_start ov02_0224D2C8
ov02_0224D2C8: ; 0x0224D2C8
	ldr r0, [r0, #4]
	ldr r3, _0224D2D4 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D2D8 ; =ov02_02253974
	bx r3
	nop
_0224D2D4: .word ov01_021E67BC
_0224D2D8: .word ov02_02253974
	thumb_func_end ov02_0224D2C8

	thumb_func_start ov02_0224D2DC
ov02_0224D2DC: ; 0x0224D2DC
	ldr r0, [r0, #4]
	ldr r3, _0224D2E8 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D2EC ; =ov02_022539BC
	bx r3
	nop
_0224D2E8: .word ov01_021E67BC
_0224D2EC: .word ov02_022539BC
	thumb_func_end ov02_0224D2DC

	thumb_func_start ov02_0224D2F0
ov02_0224D2F0: ; 0x0224D2F0
	ldr r3, _0224D2F4 ; =ov01_021E683C
	bx r3
	.balign 4, 0
_0224D2F4: .word ov01_021E683C
	thumb_func_end ov02_0224D2F0

	thumb_func_start ov02_0224D2F8
ov02_0224D2F8: ; 0x0224D2F8
	push {r3, lr}
	bl ov01_021E687C
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	bne _0224D30A
	mov r0, #1
	pop {r3, pc}
_0224D30A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D2F8

	thumb_func_start ov02_0224D310
ov02_0224D310: ; 0x0224D310
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xf0
	bl memset
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0xdc
	mov r2, #4
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	add r3, r2, #0
	bl ov02_0224D0C8
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl ov02_0224D044
	ldr r0, _0224D354 ; =SEQ_SE_DP_FW088
	bl PlaySE
	mov r0, #0
	add r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224D354: .word SEQ_SE_DP_FW088
	thumb_func_end ov02_0224D310

	thumb_func_start ov02_0224D358
ov02_0224D358: ; 0x0224D358
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xf0
	bl memset
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0xdc
	mov r2, #4
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	add r3, r2, #0
	bl ov02_0224D0C8
	ldr r0, [r5, #0x3c]
	mov r1, #0xfd
	add r2, r4, #0
	bl ov02_0224CFD8
	ldr r0, _0224D3A0 ; =SEQ_SE_DP_FW088
	bl PlaySE
	mov r0, #0
	add r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0224D3A0: .word SEQ_SE_DP_FW088
	thumb_func_end ov02_0224D358

	thumb_func_start ov02_0224D3A4
ov02_0224D3A4: ; 0x0224D3A4
	ldr r3, _0224D3B0 ; =ov02_0224D144
	add r0, r2, #0
	add r2, #0xdc
	add r1, r2, #0
	bx r3
	nop
_0224D3B0: .word ov02_0224D144
	thumb_func_end ov02_0224D3A4

	thumb_func_start ov02_0224D3B4
ov02_0224D3B4: ; 0x0224D3B4
	push {r4, lr}
	add r4, r2, #0
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _0224D3C6
	cmp r0, #1
	pop {r4, pc}
_0224D3C6:
	add r0, r4, #0
	bl ov02_0224D178
	cmp r0, #1
	bne _0224D3E4
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FC004
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	add r4, #0xec
	add r0, r0, #1
	str r0, [r4]
_0224D3E4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D3B4

	thumb_func_start ov02_0224D3E8
ov02_0224D3E8: ; 0x0224D3E8
	ldr r3, _0224D3F0 ; =ov02_0224D1DC
	add r0, r2, #0
	bx r3
	nop
_0224D3F0: .word ov02_0224D1DC
	thumb_func_end ov02_0224D3E8

	thumb_func_start ov02_0224D3F4
ov02_0224D3F4: ; 0x0224D3F4
	ldr r0, [r0, #4]
	ldr r3, _0224D400 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D404 ; =ov02_022538FC
	bx r3
	nop
_0224D400: .word ov01_021E67BC
_0224D404: .word ov02_022538FC
	thumb_func_end ov02_0224D3F4

	thumb_func_start ov02_0224D408
ov02_0224D408: ; 0x0224D408
	ldr r0, [r0, #4]
	ldr r3, _0224D414 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D418 ; =ov02_0225398C
	bx r3
	nop
_0224D414: .word ov01_021E67BC
_0224D418: .word ov02_0225398C
	thumb_func_end ov02_0224D408

	thumb_func_start ov02_0224D41C
ov02_0224D41C: ; 0x0224D41C
	ldr r3, _0224D420 ; =ov01_021E683C
	bx r3
	.balign 4, 0
_0224D420: .word ov01_021E683C
	thumb_func_end ov02_0224D41C

	thumb_func_start ov02_0224D424
ov02_0224D424: ; 0x0224D424
	push {r3, lr}
	bl ov01_021E687C
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #1
	bne _0224D436
	mov r0, #1
	pop {r3, pc}
_0224D436:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D424

	thumb_func_start ov02_0224D43C
ov02_0224D43C: ; 0x0224D43C
	push {r4, lr}
	add r4, r2, #0
	mov r2, #0x73
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	mov r0, #0x6e
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	ldr r0, _0224D464 ; =0x000001CA
	mov r1, #0
	strh r1, [r4, r0]
	pop {r4, pc}
	nop
_0224D464: .word 0x000001CA
	thumb_func_end ov02_0224D43C

	thumb_func_start ov02_0224D468
ov02_0224D468: ; 0x0224D468
	push {r4, r5, r6, lr}
	mov r0, #0x6e
	add r5, r2, #0
	lsl r0, r0, #2
	mov r4, #0
	add r6, r5, r0
_0224D474:
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_0224D144
	add r4, r4, #1
	add r5, #0xdc
	cmp r4, #2
	blt _0224D474
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D468

	thumb_func_start ov02_0224D488
ov02_0224D488: ; 0x0224D488
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r7, _0224D574 ; =0x000001CA
	add r4, r2, #0
	ldrh r0, [r4, r7]
	add r5, r1, #0
	cmp r0, #3
	bhi _0224D570
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224D4A4: ; jump table
	.short _0224D4AC - _0224D4A4 - 2 ; case 0
	.short _0224D50A - _0224D4A4 - 2 ; case 1
	.short _0224D522 - _0224D4A4 - 2 ; case 2
	.short _0224D55E - _0224D4A4 - 2 ; case 3
_0224D4AC:
	ldr r2, _0224D578 ; =ov02_022538EC
	add r1, sp, #4
	ldrb r3, [r2, #2]
	add r0, sp, #4
	add r1, #2
	strb r3, [r0, #2]
	ldrb r3, [r2, #3]
	strb r3, [r0, #3]
	ldrb r6, [r2, #4]
	add r3, sp, #4
	strb r6, [r0]
	ldrb r2, [r2, #5]
	strb r2, [r0, #1]
	sub r0, r7, #2
	ldrh r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xdc
	add r6, r2, #0
	mul r6, r0
	add r0, #0xdc
	add r0, r4, r0
	str r0, [sp]
	ldrb r1, [r1, r2]
	ldrb r2, [r3, r2]
	add r0, r4, r6
	mov r3, #2
	bl ov02_0224D0C8
	ldr r0, [r5, #0x40]
	add r1, r4, r6
	bl ov02_0224D0AC
	sub r1, r7, #2
	ldrh r0, [r4, r1]
	add r0, r0, #1
	strh r0, [r4, r1]
	ldrh r0, [r4, r1]
	cmp r0, #2
	blo _0224D570
	add r0, r1, #2
	ldrh r0, [r4, r0]
	add sp, #8
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0224D50A:
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #0
	bl ov01_021FC004
	ldr r0, _0224D57C ; =SEQ_SE_DP_FW463
	bl PlaySE
	add r0, r7, #0
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
_0224D522:
	add r0, r4, #0
	bl ov02_0224D178
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl ov02_0224D0AC
	cmp r6, #1
	bne _0224D570
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #1
	bl ov01_021FC004
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FC004
	add r1, r4, #0
	ldr r0, [r5, #0x40]
	add r1, #0xdc
	bl ov02_0224D0AC
	ldr r0, _0224D574 ; =0x000001CA
	add sp, #8
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0224D55E:
	add r0, r4, #0
	add r0, #0xdc
	bl ov02_0224D1AC
	add r4, #0xdc
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl ov02_0224D0AC
_0224D570:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224D574: .word 0x000001CA
_0224D578: .word ov02_022538EC
_0224D57C: .word SEQ_SE_DP_FW463
	thumb_func_end ov02_0224D488

	thumb_func_start ov02_0224D580
ov02_0224D580: ; 0x0224D580
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r4, #0
_0224D586:
	add r0, r5, #0
	bl ov02_0224D1DC
	add r4, r4, #1
	add r5, #0xdc
	cmp r4, #2
	blt _0224D586
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D580

	thumb_func_start ov02_0224D598
ov02_0224D598: ; 0x0224D598
	ldr r0, [r0, #4]
	ldr r3, _0224D5A4 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D5A8 ; =ov02_02253944
	bx r3
	nop
_0224D5A4: .word ov01_021E67BC
_0224D5A8: .word ov02_02253944
	thumb_func_end ov02_0224D598

	thumb_func_start ov02_0224D5AC
ov02_0224D5AC: ; 0x0224D5AC
	ldr r3, _0224D5B0 ; =ov01_021E683C
	bx r3
	.balign 4, 0
_0224D5B0: .word ov01_021E683C
	thumb_func_end ov02_0224D5AC

	thumb_func_start ov02_0224D5B4
ov02_0224D5B4: ; 0x0224D5B4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, _0224D640 ; =ov02_022538EC
	add r4, r2, #0
	ldrb r2, [r1]
	add r0, sp, #4
	strb r2, [r0, #1]
	ldrb r2, [r1, #1]
	strb r2, [r0]
	ldrh r2, [r1, #6]
	strh r2, [r0, #2]
	ldrh r2, [r1, #8]
	strh r2, [r0, #4]
	ldrh r2, [r1, #0xa]
	strh r2, [r0, #6]
	ldrh r1, [r1, #0xc]
	mov r2, #0xf0
	strh r1, [r0, #8]
	add r0, r4, #0
	mov r1, #0
	bl memset
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xdc
	str r0, [sp]
	add r2, sp, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	add r0, r4, #0
	mov r3, #1
	bl ov02_0224D0C8
	add r0, r4, #0
	bl ov02_0224D1AC
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl ov02_0224D0AC
	add r0, sp, #4
	lsl r1, r6, #1
	add r0, #2
	ldrh r0, [r0, r1]
	bl GF_DegreeToSinCosIdxNoWrap
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov01_021FC024
	ldr r0, _0224D644 ; =SEQ_SE_DP_FW463
	bl PlaySE
	mov r0, #0
	add r4, #0xec
	strh r0, [r4]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0224D640: .word ov02_022538EC
_0224D644: .word SEQ_SE_DP_FW463
	thumb_func_end ov02_0224D5B4

	thumb_func_start ov02_0224D648
ov02_0224D648: ; 0x0224D648
	ldr r3, _0224D654 ; =ov02_0224D144
	add r0, r2, #0
	add r2, #0xdc
	add r1, r2, #0
	bx r3
	nop
_0224D654: .word ov02_0224D144
	thumb_func_end ov02_0224D648

	thumb_func_start ov02_0224D658
ov02_0224D658: ; 0x0224D658
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r0, r4, #0
	bl ov02_0224D1AC
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl ov02_0224D0AC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D658

	thumb_func_start ov02_0224D670
ov02_0224D670: ; 0x0224D670
	ldr r3, _0224D678 ; =ov02_0224D1DC
	add r0, r2, #0
	bx r3
	nop
_0224D678: .word ov02_0224D1DC
	thumb_func_end ov02_0224D670

	thumb_func_start ov02_0224D67C
ov02_0224D67C: ; 0x0224D67C
	ldr r0, [r0, #4]
	ldr r3, _0224D688 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D68C ; =ov02_02253914
	bx r3
	nop
_0224D688: .word ov01_021E67BC
_0224D68C: .word ov02_02253914
	thumb_func_end ov02_0224D67C

	thumb_func_start ov02_0224D690
ov02_0224D690: ; 0x0224D690
	ldr r3, _0224D694 ; =ov01_021E683C
	bx r3
	.balign 4, 0
_0224D694: .word ov01_021E683C
	thumb_func_end ov02_0224D690

	thumb_func_start ov02_0224D698
ov02_0224D698: ; 0x0224D698
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r0, #0xc8
	ldr r0, [r0]
	add r6, r1, #0
	add r4, r2, #0
	add r5, r3, #0
	cmp r0, #0
	beq _0224D6B0
	bl GF_AssertFail
_0224D6B0:
	add r0, r6, #0
	add r1, sp, #0
	bl PlayerAvatar_GetPositionVec
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r2, r4
	add r3, r3, r5
	bl ov01_021FC00C
	add r0, r7, #0
	mov r4, #0
	add r5, r7, #0
	mov r1, #1
	add r0, #0xc8
	str r1, [r0]
	add r5, #0x78
	add r6, r4, #0
_0224D6D8:
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021FBF20
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #4
	blt _0224D6D8
	add r0, r7, #0
	mov r1, #1
	bl ov01_021FC004
	ldr r0, _0224D6FC ; =SEQ_SE_DP_UG_023
	bl PlaySE
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0224D6FC: .word SEQ_SE_DP_UG_023
	thumb_func_end ov02_0224D698

	thumb_func_start ov02_0224D700
ov02_0224D700: ; 0x0224D700
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #0
	beq _0224D73A
	ldr r5, [sp]
	mov r4, #1
	mov r6, #0
	add r5, #0x78
	lsl r7, r4, #0xc
_0224D716:
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021FBEE4
	add r6, r6, #1
	and r4, r0
	add r5, #0x14
	cmp r6, #4
	blt _0224D716
	cmp r4, #1
	bne _0224D73A
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc8
	str r1, [r0]
	ldr r0, [sp]
	bl ov01_021FC004
_0224D73A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D700

	thumb_func_start ov02_0224D73C
ov02_0224D73C: ; 0x0224D73C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	str r2, [sp, #4]
	mov r1, #0
	mov r2, #0xcc
	add r7, r0, #0
	add r5, r3, #0
	bl memset
	ldr r1, [sp]
	add r0, r7, #0
	bl ov01_021FBF2C
	add r4, r7, #0
	mov r6, #0
	add r4, #0x78
_0224D75E:
	ldr r1, [sp]
	ldr r2, [r5]
	ldr r3, [sp, #4]
	add r0, r4, #0
	bl ov01_021FBE70
	add r0, r7, #0
	add r1, r4, #0
	bl ov01_021FBF50
	add r6, r6, #1
	add r5, r5, #4
	add r4, #0x14
	cmp r6, #4
	blt _0224D75E
	add r0, r7, #0
	mov r1, #0
	bl ov01_021FC004
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D73C

	thumb_func_start ov02_0224D788
ov02_0224D788: ; 0x0224D788
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	add r6, r1, #0
	mov r4, #0
	add r5, #0x78
_0224D794:
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021FBE80
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #4
	blt _0224D794
	add r0, r7, #0
	mov r1, #0
	mov r2, #0xcc
	bl memset
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224D788

	thumb_func_start ov02_0224D7B0
ov02_0224D7B0: ; 0x0224D7B0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0xce
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetPositionVec
	mov r1, #0xcf
	lsl r1, r1, #4
	ldr r2, [sp]
	ldr r0, [r4, r1]
	sub r0, r2, r0
	bne _0224D7F8
	add r0, r1, #4
	ldr r2, [sp, #4]
	ldr r0, [r4, r0]
	cmp r2, r0
	bge _0224D7F8
	add r0, r1, #0
	add r0, #8
	ldr r2, [sp, #8]
	ldr r0, [r4, r0]
	cmp r2, r0
	ble _0224D7F8
	add r0, r1, #0
	mov r2, #0
	sub r0, #8
	str r2, [r4, r0]
	mov r2, #2
	lsl r2, r2, #0x10
	sub r0, r1, #4
	str r2, [r4, r0]
	b _0224D806
_0224D7F8:
	mov r1, #2
	ldr r0, _0224D81C ; =0x00000CE8
	lsl r1, r1, #0x10
	str r1, [r4, r0]
	lsr r1, r1, #1
	add r0, r0, #4
	str r1, [r4, r0]
_0224D806:
	mov r0, #0xcf
	lsl r0, r0, #4
	add r3, sp, #0
	add r2, r4, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0224D81C: .word 0x00000CE8
	thumb_func_end ov02_0224D7B0

	thumb_func_start ov02_0224D820
ov02_0224D820: ; 0x0224D820
	push {r4, lr}
	add r4, r0, #0
	bl ov02_0224D7B0
	mov r2, #0
	add r1, r4, #0
_0224D82C:
	add r0, r1, #0
	add r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	bne _0224D858
	add r1, r4, #0
	mov r0, #0xcc
	mov r3, #0xce
	add r1, #0x10
	mul r0, r2
	lsl r3, r3, #4
	add r0, r1, r0
	ldr r1, [r4, r3]
	add r2, r3, #0
	add r2, #8
	add r3, #0xc
	ldr r1, [r1, #0x40]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	bl ov02_0224D698
	pop {r4, pc}
_0224D858:
	add r2, r2, #1
	add r1, #0xcc
	cmp r2, #0x10
	blt _0224D82C
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224D820

	thumb_func_start ov02_0224D868
ov02_0224D868: ; 0x0224D868
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x10
_0224D870:
	add r0, r5, #0
	bl ov02_0224D700
	add r4, r4, #1
	add r5, #0xcc
	cmp r4, #0x10
	blt _0224D870
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224D868

	thumb_func_start ov02_0224D880
ov02_0224D880: ; 0x0224D880
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r2, #0
	mov r2, #0xd1
	str r1, [sp, #4]
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	ldr r0, _0224D90C ; =0x00000CFC
	mov r1, #4
	add r0, r5, r0
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r5, #0
	mov r1, #0x86
	mov r2, #8
	mov r3, #4
	bl ov01_021FBCD8
	mov r7, #0xcd
	mov r4, #0
	add r6, r5, #0
	lsl r7, r7, #4
_0224D8B4:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x86
	add r1, r4, #4
	mov r2, #0
	mov r3, #4
	bl GfGfxLoader_LoadFromNarc
	str r0, [r6, r7]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #4
	blt _0224D8B4
	add r4, r5, #0
	mov r7, #0xcd
	mov r6, #0
	add r4, #0x10
	lsl r7, r7, #4
_0224D8D8:
	ldr r2, _0224D90C ; =0x00000CFC
	add r0, r4, #0
	add r1, r5, #0
	add r2, r5, r2
	add r3, r5, r7
	bl ov02_0224D73C
	add r6, r6, #1
	add r4, #0xcc
	cmp r6, #0x10
	blt _0224D8D8
	mov r1, #0xce
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	add r1, #0x10
	ldr r0, [r0, #0x40]
	add r1, r5, r1
	bl PlayerAvatar_GetPositionVec
	ldr r0, _0224D910 ; =0x00000D0C
	mov r1, #0
	str r1, [r5, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224D90C: .word 0x00000CFC
_0224D910: .word 0x00000D0C
	thumb_func_end ov02_0224D880

	thumb_func_start ov02_0224D914
ov02_0224D914: ; 0x0224D914
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r4, r5, #0
	ldr r7, _0224D94C ; =0x00000CFC
	mov r6, #0
	add r4, #0x10
_0224D920:
	add r0, r4, #0
	add r1, r5, r7
	bl ov02_0224D788
	add r6, r6, #1
	add r4, #0xcc
	cmp r6, #0x10
	blt _0224D920
	add r0, r5, #0
	bl ov01_021FBDA8
	mov r6, #0xcd
	mov r4, #0
	lsl r6, r6, #4
_0224D93C:
	ldr r0, [r5, r6]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0224D93C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224D94C: .word 0x00000CFC
	thumb_func_end ov02_0224D914

	thumb_func_start ov02_0224D950
ov02_0224D950: ; 0x0224D950
	push {r4, lr}
	ldr r1, _0224D988 ; =0x00000D0C
	add r4, r2, #0
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0224D986
	add r0, r1, #0
	sub r0, #0x28
	ldr r0, [r4, r0]
	sub r2, r0, #1
	add r0, r1, #0
	sub r0, #0x28
	str r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0x28
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0224D980
	mov r0, #4
	sub r1, #0x28
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov02_0224D820
_0224D980:
	add r0, r4, #0
	bl ov02_0224D868
_0224D986:
	pop {r4, pc}
	.balign 4, 0
_0224D988: .word 0x00000D0C
	thumb_func_end ov02_0224D950

	thumb_func_start ov02_0224D98C
ov02_0224D98C: ; 0x0224D98C
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r4, #0
	add r5, #0x10
_0224D994:
	add r0, r5, #0
	bl ov01_021FBF68
	add r4, r4, #1
	add r5, #0xcc
	cmp r4, #0x10
	blt _0224D994
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224D98C

	thumb_func_start ov02_0224D9A4
ov02_0224D9A4: ; 0x0224D9A4
	ldr r0, [r0, #4]
	ldr r3, _0224D9B0 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224D9B4 ; =ov02_0225395C
	bx r3
	nop
_0224D9B0: .word ov01_021E67BC
_0224D9B4: .word ov02_0225395C
	thumb_func_end ov02_0224D9A4

	thumb_func_start ov02_0224D9B8
ov02_0224D9B8: ; 0x0224D9B8
	ldr r3, _0224D9BC ; =ov01_021E683C
	bx r3
	.balign 4, 0
_0224D9BC: .word ov01_021E683C
	thumb_func_end ov02_0224D9B8

	thumb_func_start ov02_0224D9C0
ov02_0224D9C0: ; 0x0224D9C0
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r2, #0
	mov r2, #0x45
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0xdc
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0x11
	mov r3, #2
	bl ov02_0224D0C8
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl ov02_0224D044
	ldr r1, [r5, #0x24]
	add r0, sp, #0x10
	bl GF_Camera_GetTarget
	add r3, sp, #0x10
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xf8
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r5, #0x24]
	add r0, sp, #4
	bl sub_02023640
	add r3, sp, #4
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xec
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x1c
	str r0, [r2]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #3
	bhi _0224DA7C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224DA46: ; jump table
	.short _0224DA4E - _0224DA46 - 2 ; case 0
	.short _0224DA5A - _0224DA46 - 2 ; case 1
	.short _0224DA66 - _0224DA46 - 2 ; case 2
	.short _0224DA72 - _0224DA46 - 2 ; case 3
_0224DA4E:
	mov r0, #2
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0x24]
	b _0224DA7C
_0224DA5A:
	mov r0, #2
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x24]
	b _0224DA7C
_0224DA66:
	mov r0, #2
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	b _0224DA7C
_0224DA72:
	mov r0, #2
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x1c]
_0224DA7C:
	mov r0, #0x41
	lsl r0, r0, #2
	add r3, sp, #0x1c
	add r2, r4, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, _0224DA9C ; =SEQ_SE_GS_ZUTUKI
	bl PlaySE
	ldr r0, _0224DAA0 ; =0x00000113
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224DA9C: .word SEQ_SE_GS_ZUTUKI
_0224DAA0: .word 0x00000113
	thumb_func_end ov02_0224D9C0

	thumb_func_start ov02_0224DAA4
ov02_0224DAA4: ; 0x0224DAA4
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r2, #0
	mov r2, #0x45
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	add r0, r4, #0
	add r0, #0xdc
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0xdc
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0x11
	mov r3, #2
	bl ov02_0224D0C8
	ldr r0, [r5, #0x3c]
	mov r1, #0xfd
	add r2, r4, #0
	bl ov02_0224CFD8
	ldr r1, [r5, #0x24]
	add r0, sp, #0x10
	bl GF_Camera_GetTarget
	add r3, sp, #0x10
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xf8
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r5, #0x24]
	add r0, sp, #4
	bl sub_02023640
	add r3, sp, #4
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xec
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x1c
	str r0, [r2]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #3
	bhi _0224DB62
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224DB2C: ; jump table
	.short _0224DB34 - _0224DB2C - 2 ; case 0
	.short _0224DB40 - _0224DB2C - 2 ; case 1
	.short _0224DB4C - _0224DB2C - 2 ; case 2
	.short _0224DB58 - _0224DB2C - 2 ; case 3
_0224DB34:
	mov r0, #2
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0x24]
	b _0224DB62
_0224DB40:
	mov r0, #2
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x24]
	b _0224DB62
_0224DB4C:
	mov r0, #2
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	b _0224DB62
_0224DB58:
	mov r0, #2
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x1c]
_0224DB62:
	mov r0, #0x41
	lsl r0, r0, #2
	add r3, sp, #0x1c
	add r2, r4, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, _0224DB84 ; =SEQ_SE_GS_ZUTUKI
	bl PlaySE
	ldr r0, _0224DB88 ; =0x00000113
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0224DB84: .word SEQ_SE_GS_ZUTUKI
_0224DB88: .word 0x00000113
	thumb_func_end ov02_0224DAA4

	thumb_func_start ov02_0224DB8C
ov02_0224DB8C: ; 0x0224DB8C
	ldr r3, _0224DB98 ; =ov02_0224D144
	add r0, r2, #0
	add r2, #0xdc
	add r1, r2, #0
	bx r3
	nop
_0224DB98: .word ov02_0224D144
	thumb_func_end ov02_0224DB8C

	thumb_func_start ov02_0224DB9C
ov02_0224DB9C: ; 0x0224DB9C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r1, _0224DC50 ; =0x00000113
	add r4, r2, #0
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0224DBB0
	cmp r0, #1
	beq _0224DC38
	pop {r3, r4, r5, pc}
_0224DBB0:
	sub r0, r1, #1
	ldrb r0, [r4, r0]
	cmp r0, #2
	bhs _0224DC1C
	sub r0, r1, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bgt _0224DC12
	mov r2, #1
	sub r0, r1, #3
	strb r2, [r4, r0]
	sub r0, r1, #2
	ldrb r0, [r4, r0]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r2, r2, r1
	add r1, r0, #0
	add r1, #0xf2
	strb r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xf2
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0224DBF4
	add r0, #0xe5
	ldr r1, [r5, #0x24]
	add r0, r4, r0
	bl GF_Camera_ShiftBy
	b _0224DC1C
_0224DBF4:
	add r0, r4, #0
	ldr r1, [r5, #0x24]
	add r0, #0xf8
	bl sub_0202365C
	add r0, r4, #0
	ldr r1, [r5, #0x24]
	add r0, #0xec
	bl sub_0202366C
	ldr r0, _0224DC54 ; =0x00000112
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0224DC1C
_0224DC12:
	sub r0, r1, #3
	ldrsb r0, [r4, r0]
	sub r2, r0, #1
	sub r0, r1, #3
	strb r2, [r4, r0]
_0224DC1C:
	add r0, r4, #0
	bl ov02_0224D178
	cmp r0, #1
	bne _0224DC4C
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FC004
	ldr r0, _0224DC50 ; =0x00000113
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0224DC38:
	add r0, r4, #0
	ldr r1, [r5, #0x24]
	add r0, #0xf8
	bl sub_0202365C
	add r4, #0xec
	ldr r1, [r5, #0x24]
	add r0, r4, #0
	bl sub_0202366C
_0224DC4C:
	pop {r3, r4, r5, pc}
	nop
_0224DC50: .word 0x00000113
_0224DC54: .word 0x00000112
	thumb_func_end ov02_0224DB9C

	thumb_func_start ov02_0224DC58
ov02_0224DC58: ; 0x0224DC58
	ldr r3, _0224DC60 ; =ov02_0224D1DC
	add r0, r2, #0
	bx r3
	nop
_0224DC60: .word ov02_0224D1DC
	thumb_func_end ov02_0224DC58

	thumb_func_start ov02_0224DC64
ov02_0224DC64: ; 0x0224DC64
	ldr r0, [r0, #4]
	ldr r3, _0224DC70 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224DC74 ; =ov02_022539A4
	bx r3
	nop
_0224DC70: .word ov01_021E67BC
_0224DC74: .word ov02_022539A4
	thumb_func_end ov02_0224DC64

	thumb_func_start ov02_0224DC78
ov02_0224DC78: ; 0x0224DC78
	ldr r0, [r0, #4]
	ldr r3, _0224DC84 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224DC88 ; =ov02_0225392C
	bx r3
	nop
_0224DC84: .word ov01_021E67BC
_0224DC88: .word ov02_0225392C
	thumb_func_end ov02_0224DC78

	thumb_func_start ov02_0224DC8C
ov02_0224DC8C: ; 0x0224DC8C
	ldr r3, _0224DC90 ; =ov01_021E683C
	bx r3
	.balign 4, 0
_0224DC90: .word ov01_021E683C
	thumb_func_end ov02_0224DC8C

	thumb_func_start ov02_0224DC94
ov02_0224DC94: ; 0x0224DC94
	push {r3, lr}
	bl ov01_021E687C
	ldr r1, _0224DCAC ; =0x00000113
	ldrb r0, [r0, r1]
	cmp r0, #1
	bne _0224DCA6
	mov r0, #1
	pop {r3, pc}
_0224DCA6:
	mov r0, #0
	pop {r3, pc}
	nop
_0224DCAC: .word 0x00000113
	thumb_func_end ov02_0224DC94

	thumb_func_start ov02_0224DCB0
ov02_0224DCB0: ; 0x0224DCB0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	str r1, [sp, #4]
	ldr r2, _0224DD28 ; =0x00000E9C
	add r0, r6, #0
	mov r1, #0
	bl memset
	ldr r0, _0224DD2C ; =0x00000E88
	mov r1, #4
	add r0, r6, r0
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r6, #0
	mov r1, #0x86
	mov r2, #8
	mov r3, #4
	bl ov01_021FBCD8
	ldr r7, _0224DD30 ; =0x00000E68
	mov r4, #0
	add r5, r6, #0
_0224DCE0:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x86
	add r1, r4, #4
	mov r2, #0
	mov r3, #4
	bl GfGfxLoader_LoadFromNarc
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0224DCE0
	add r4, r6, #0
	ldr r7, _0224DD30 ; =0x00000E68
	mov r5, #0
	add r4, #0x10
_0224DD02:
	ldr r2, _0224DD2C ; =0x00000E88
	add r0, r4, #0
	add r1, r6, #0
	add r2, r6, r2
	add r3, r6, r7
	bl ov02_0224DEA8
	add r5, r5, #1
	add r4, #0xcc
	cmp r5, #0x12
	blt _0224DD02
	ldr r1, _0224DD34 ; =0x00000E78
	ldr r0, [sp, #4]
	str r0, [r6, r1]
	mov r0, #0
	add r1, #0x20
	strh r0, [r6, r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224DD28: .word 0x00000E9C
_0224DD2C: .word 0x00000E88
_0224DD30: .word 0x00000E68
_0224DD34: .word 0x00000E78
	thumb_func_end ov02_0224DCB0

	thumb_func_start ov02_0224DD38
ov02_0224DD38: ; 0x0224DD38
	push {r4, lr}
	add r4, r2, #0
	bl ov02_0224DCB0
	ldr r0, _0224DD48 ; =0x00000E9A
	mov r1, #1
	strh r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0224DD48: .word 0x00000E9A
	thumb_func_end ov02_0224DD38

	thumb_func_start ov02_0224DD4C
ov02_0224DD4C: ; 0x0224DD4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r4, r5, #0
	ldr r7, _0224DD84 ; =0x00000E88
	mov r6, #0
	add r4, #0x10
_0224DD58:
	add r0, r4, #0
	add r1, r5, r7
	bl ov02_0224DEF4
	add r6, r6, #1
	add r4, #0xcc
	cmp r6, #0x12
	blt _0224DD58
	add r0, r5, #0
	bl ov01_021FBDA8
	ldr r6, _0224DD88 ; =0x00000E68
	mov r4, #0
_0224DD72:
	ldr r0, [r5, r6]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0224DD72
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224DD84: .word 0x00000E88
_0224DD88: .word 0x00000E68
	thumb_func_end ov02_0224DD4C

	thumb_func_start ov02_0224DD8C
ov02_0224DD8C: ; 0x0224DD8C
	push {r4, lr}
	ldr r1, _0224DDC4 ; =0x00000E98
	add r4, r2, #0
	ldrh r0, [r4, r1]
	cmp r0, #0
	bne _0224DDC2
	add r0, r1, #0
	sub r0, #0x1c
	ldr r0, [r4, r0]
	sub r2, r0, #1
	add r0, r1, #0
	sub r0, #0x1c
	str r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0x1c
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0224DDBC
	mov r0, #4
	sub r1, #0x1c
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov02_0224DF1C
_0224DDBC:
	add r0, r4, #0
	bl ov02_0224E008
_0224DDC2:
	pop {r4, pc}
	.balign 4, 0
_0224DDC4: .word 0x00000E98
	thumb_func_end ov02_0224DD8C

	thumb_func_start ov02_0224DDC8
ov02_0224DDC8: ; 0x0224DDC8
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r4, #0
	add r5, #0x10
_0224DDD0:
	add r0, r5, #0
	bl ov01_021FBF68
	add r4, r4, #1
	add r5, #0xcc
	cmp r4, #0x12
	blt _0224DDD0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224DDC8

	thumb_func_start ov02_0224DDE0
ov02_0224DDE0: ; 0x0224DDE0
	ldr r0, [r0, #4]
	ldr r3, _0224DDEC ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224DDF0 ; =ov02_022539D4
	bx r3
	nop
_0224DDEC: .word ov01_021E67BC
_0224DDF0: .word ov02_022539D4
	thumb_func_end ov02_0224DDE0

	thumb_func_start ov02_0224DDF4
ov02_0224DDF4: ; 0x0224DDF4
	ldr r0, [r0, #4]
	ldr r3, _0224DE00 ; =ov01_021E67BC
	ldr r0, [r0, #4]
	ldr r1, _0224DE04 ; =ov02_022539EC
	bx r3
	nop
_0224DE00: .word ov01_021E67BC
_0224DE04: .word ov02_022539EC
	thumb_func_end ov02_0224DDF4

	thumb_func_start ov02_0224DE08
ov02_0224DE08: ; 0x0224DE08
	ldr r3, _0224DE0C ; =ov01_021E683C
	bx r3
	.balign 4, 0
_0224DE0C: .word ov01_021E683C
	thumb_func_end ov02_0224DE08

	thumb_func_start ov02_0224DE10
ov02_0224DE10: ; 0x0224DE10
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0xc8
	ldr r0, [r0]
	add r4, r1, #0
	add r5, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _0224DE26
	bl GF_AssertFail
_0224DE26:
	ldr r2, [r4, #4]
	ldr r3, [r4, #8]
	ldr r1, [r4]
	add r0, r7, #0
	add r2, r2, r5
	add r3, r3, r6
	bl ov01_021FC00C
	add r0, r7, #0
	mov r4, #0
	add r5, r7, #0
	mov r1, #1
	add r0, #0xc8
	str r1, [r0]
	add r5, #0x78
	add r6, r4, #0
_0224DE46:
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021FBF20
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #4
	blt _0224DE46
	add r0, r7, #0
	mov r1, #1
	bl ov01_021FC004
	ldr r0, _0224DE68 ; =SEQ_SE_DP_UG_023
	bl PlaySE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224DE68: .word SEQ_SE_DP_UG_023
	thumb_func_end ov02_0224DE10

	thumb_func_start ov02_0224DE6C
ov02_0224DE6C: ; 0x0224DE6C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #0
	beq _0224DEA6
	ldr r5, [sp]
	mov r4, #1
	mov r6, #0
	add r5, #0x78
	lsl r7, r4, #0xc
_0224DE82:
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021FBEE4
	add r6, r6, #1
	and r4, r0
	add r5, #0x14
	cmp r6, #4
	blt _0224DE82
	cmp r4, #1
	bne _0224DEA6
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc8
	str r1, [r0]
	ldr r0, [sp]
	bl ov01_021FC004
_0224DEA6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224DE6C

	thumb_func_start ov02_0224DEA8
ov02_0224DEA8: ; 0x0224DEA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	str r2, [sp, #4]
	mov r1, #0
	mov r2, #0xcc
	add r7, r0, #0
	add r5, r3, #0
	bl memset
	ldr r1, [sp]
	add r0, r7, #0
	bl ov01_021FBF2C
	add r4, r7, #0
	mov r6, #0
	add r4, #0x78
_0224DECA:
	ldr r1, [sp]
	ldr r2, [r5]
	ldr r3, [sp, #4]
	add r0, r4, #0
	bl ov01_021FBE70
	add r0, r7, #0
	add r1, r4, #0
	bl ov01_021FBF50
	add r6, r6, #1
	add r5, r5, #4
	add r4, #0x14
	cmp r6, #4
	blt _0224DECA
	add r0, r7, #0
	mov r1, #0
	bl ov01_021FC004
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224DEA8

	thumb_func_start ov02_0224DEF4
ov02_0224DEF4: ; 0x0224DEF4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	add r6, r1, #0
	mov r4, #0
	add r5, #0x78
_0224DF00:
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021FBE80
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #4
	blt _0224DF00
	add r0, r7, #0
	mov r1, #0
	mov r2, #0xcc
	bl memset
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224DEF4

	thumb_func_start ov02_0224DF1C
ov02_0224DF1C: ; 0x0224DF1C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #1
	mov r1, #0x3a
	mov r2, #3
	lsl r0, r0, #0xc
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r0, r1, #4
	lsl r2, r2, #0xc
	sub r1, #8
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	add r1, sp, #0xc
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetPositionVec
	ldr r0, _0224E004 ; =0x00000E9A
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _0224DFC6
	sub r0, #0x22
	ldr r0, [r4, r0]
	bl FollowingPokemon_GetMapObject
	add r1, sp, #0
	bl MapObject_GetPositionVec
	mov r5, #0
	add r1, r4, #0
_0224DF5A:
	add r0, r1, #0
	add r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	bne _0224DF80
	mov r3, #0x3a
	lsl r3, r3, #6
	add r1, r4, #0
	mov r0, #0xcc
	ldr r2, [r4, r3]
	add r3, r3, #4
	add r1, #0x10
	mul r0, r5
	add r0, r1, r0
	ldr r3, [r4, r3]
	add r1, sp, #0xc
	bl ov02_0224DE10
	b _0224DF88
_0224DF80:
	add r5, r5, #1
	add r1, #0xcc
	cmp r5, #0x12
	blt _0224DF5A
_0224DF88:
	cmp r5, #0x12
	bne _0224DF90
	bl GF_AssertFail
_0224DF90:
	mov r0, #0
	add r2, r4, #0
_0224DF94:
	add r1, r2, #0
	add r1, #0xd8
	ldr r1, [r1]
	cmp r1, #0
	bne _0224DFBC
	add r2, r4, #0
	mov r1, #0xcc
	mov r3, #0x3a
	add r2, #0x10
	mul r1, r0
	add r0, r2, r1
	lsl r3, r3, #6
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r3, [r4, r3]
	add r1, sp, #0
	bl ov02_0224DE10
	add sp, #0x18
	pop {r3, r4, r5, pc}
_0224DFBC:
	add r0, r0, #1
	add r2, #0xcc
	cmp r0, #0x12
	blt _0224DF94
	b _0224DFFA
_0224DFC6:
	mov r0, #0
	add r2, r4, #0
_0224DFCA:
	add r1, r2, #0
	add r1, #0xd8
	ldr r1, [r1]
	cmp r1, #0
	bne _0224DFF2
	add r2, r4, #0
	mov r1, #0xcc
	mov r3, #0x3a
	add r2, #0x10
	mul r1, r0
	add r0, r2, r1
	lsl r3, r3, #6
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r3, [r4, r3]
	add r1, sp, #0xc
	bl ov02_0224DE10
	add sp, #0x18
	pop {r3, r4, r5, pc}
_0224DFF2:
	add r0, r0, #1
	add r2, #0xcc
	cmp r0, #0x12
	blt _0224DFCA
_0224DFFA:
	bl GF_AssertFail
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0224E004: .word 0x00000E9A
	thumb_func_end ov02_0224DF1C

	thumb_func_start ov02_0224E008
ov02_0224E008: ; 0x0224E008
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x10
_0224E010:
	add r0, r5, #0
	bl ov02_0224DE6C
	add r4, r4, #1
	add r5, #0xcc
	cmp r4, #0x12
	blt _0224E010
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224E008

	thumb_func_start ov02_0224E020
ov02_0224E020: ; 0x0224E020
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224E032
	cmp r0, #1
	beq _0224E04A
	pop {r3, r4, r5, pc}
_0224E032:
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	lsl r2, r1, #2
	ldr r1, _0224E06C ; =ov02_02253A34
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0224E068
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224E04A:
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	lsl r2, r1, #2
	ldr r1, _0224E070 ; =ov02_02253A04
	ldr r1, [r1, r2]
	blx r1
	ldr r0, [r4, #4]
	mov r1, #1
	strh r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_0224E068:
	pop {r3, r4, r5, pc}
	nop
_0224E06C: .word ov02_02253A34
_0224E070: .word ov02_02253A04
	thumb_func_end ov02_0224E020

	thumb_func_start ov02_0224E074
ov02_0224E074: ; 0x0224E074
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x10
	add r4, r2, #0
	bl AllocFromHeap
	add r6, r0, #0
	add r2, r6, #0
	mov r1, #0x10
	mov r0, #0
_0224E08C:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0224E08C
	ldr r1, _0224E0B4 ; =ov02_02253A1C
	lsl r2, r4, #2
	ldr r1, [r1, r2]
	add r0, r7, #0
	blx r1
	str r0, [r6]
	str r5, [r6, #4]
	ldr r0, _0224E0B8 ; =ov02_0224E020
	str r4, [r6, #0xc]
	mov r2, #0
	add r1, r6, #0
	strh r2, [r5]
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224E0B4: .word ov02_02253A1C
_0224E0B8: .word ov02_0224E020
	thumb_func_end ov02_0224E074

	thumb_func_start ov02_0224E0BC
ov02_0224E0BC: ; 0x0224E0BC
	push {r4, lr}
	add r4, r2, #0
	bl ov02_0224E0D4
	add r2, r0, #0
	ldr r1, _0224E0D0 ; =ov02_0224E0EC
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_0224E0D0: .word ov02_0224E0EC
	thumb_func_end ov02_0224E0BC

	thumb_func_start ov02_0224E0D4
ov02_0224E0D4: ; 0x0224E0D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #4
	mov r1, #0x20
	bl AllocFromHeapAtEnd
	mov r1, #0
	str r1, [r0]
	str r5, [r0, #4]
	str r4, [r0, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224E0D4

	thumb_func_start ov02_0224E0EC
ov02_0224E0EC: ; 0x0224E0EC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	mov r5, #0
	cmp r0, #5
	bls _0224E108
	b _0224E21E
_0224E108:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224E114: ; jump table
	.short _0224E120 - _0224E114 - 2 ; case 0
	.short _0224E130 - _0224E114 - 2 ; case 1
	.short _0224E156 - _0224E114 - 2 ; case 2
	.short _0224E1AA - _0224E114 - 2 ; case 3
	.short _0224E1C6 - _0224E114 - 2 ; case 4
	.short _0224E1F6 - _0224E114 - 2 ; case 5
_0224E120:
	add r0, r6, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0224E130:
	ldr r0, [r4, #4]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4, #8]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _0224E21E
	add r0, r6, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_PauseMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224E21E
_0224E156:
	ldr r0, [r4, #4]
	bl MapObject_GetCurrentX
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	bl MapObject_GetCurrentY
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl MapObject_GetFacingDirection
	str r0, [r4, #0x14]
	ldr r0, [r4, #8]
	bl MapObject_GetCurrentX
	str r0, [r4, #0x18]
	ldr r0, [r4, #8]
	bl MapObject_GetCurrentY
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xc
	add r1, #0x18
	bl ov02_0224E224
	add r6, r0, #0
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl MapObject_SetHeldMovement
	add r0, r6, #0
	bl ov02_0224E2D4
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl MapObject_SetHeldMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224E21E
_0224E1AA:
	ldr r0, [r4, #4]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4, #8]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224E21E
_0224E1C6:
	ldr r0, [r4, #4]
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov02_0224E2A0
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl MapObject_SetHeldMovement
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov02_0224E26C
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl MapObject_SetHeldMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224E21E
_0224E1F6:
	ldr r0, [r4, #4]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4, #8]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _0224E21E
	ldr r0, [r4, #4]
	bl MapObject_ClearHeldMovementIfActive
	ldr r0, [r4, #8]
	bl MapObject_ClearHeldMovementIfActive
	add r0, r4, #0
	mov r5, #1
	bl FreeToHeap
_0224E21E:
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_0224E0EC

	thumb_func_start ov02_0224E224
ov02_0224E224: ; 0x0224E224
	push {r3, r4, r5, lr}
	ldr r5, [r1]
	ldr r3, [r0]
	mov r4, #0xd
	cmp r3, r5
	bne _0224E246
	ldr r1, [r1, #4]
	ldr r0, [r0, #4]
	cmp r0, r1
	ble _0224E23C
	mov r4, #0xc
	b _0224E268
_0224E23C:
	cmp r0, r1
	blt _0224E268
	bl GF_AssertFail
	b _0224E268
_0224E246:
	ldr r2, [r0, #4]
	ldr r0, [r1, #4]
	cmp r2, r0
	bne _0224E264
	cmp r3, r5
	ble _0224E256
	mov r4, #0xe
	b _0224E268
_0224E256:
	cmp r3, r5
	bge _0224E25E
	mov r4, #0xf
	b _0224E268
_0224E25E:
	bl GF_AssertFail
	b _0224E268
_0224E264:
	bl GF_AssertFail
_0224E268:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224E224

	thumb_func_start ov02_0224E26C
ov02_0224E26C: ; 0x0224E26C
	push {r3, lr}
	cmp r0, #3
	bhi _0224E296
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224E27E: ; jump table
	.short _0224E286 - _0224E27E - 2 ; case 0
	.short _0224E28A - _0224E27E - 2 ; case 1
	.short _0224E28E - _0224E27E - 2 ; case 2
	.short _0224E292 - _0224E27E - 2 ; case 3
_0224E286:
	mov r0, #0
	pop {r3, pc}
_0224E28A:
	mov r0, #1
	pop {r3, pc}
_0224E28E:
	mov r0, #2
	pop {r3, pc}
_0224E292:
	mov r0, #3
	pop {r3, pc}
_0224E296:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224E26C

	thumb_func_start ov02_0224E2A0
ov02_0224E2A0: ; 0x0224E2A0
	push {r3, lr}
	cmp r0, #3
	bhi _0224E2CA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224E2B2: ; jump table
	.short _0224E2BA - _0224E2B2 - 2 ; case 0
	.short _0224E2BE - _0224E2B2 - 2 ; case 1
	.short _0224E2C2 - _0224E2B2 - 2 ; case 2
	.short _0224E2C6 - _0224E2B2 - 2 ; case 3
_0224E2BA:
	mov r0, #1
	pop {r3, pc}
_0224E2BE:
	mov r0, #0
	pop {r3, pc}
_0224E2C2:
	mov r0, #3
	pop {r3, pc}
_0224E2C6:
	mov r0, #2
	pop {r3, pc}
_0224E2CA:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224E2A0

	thumb_func_start ov02_0224E2D4
ov02_0224E2D4: ; 0x0224E2D4
	push {r3, lr}
	sub r0, #0xc
	cmp r0, #3
	bhi _0224E300
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224E2E8: ; jump table
	.short _0224E2F0 - _0224E2E8 - 2 ; case 0
	.short _0224E2F4 - _0224E2E8 - 2 ; case 1
	.short _0224E2F8 - _0224E2E8 - 2 ; case 2
	.short _0224E2FC - _0224E2E8 - 2 ; case 3
_0224E2F0:
	mov r0, #0xd
	pop {r3, pc}
_0224E2F4:
	mov r0, #0xc
	pop {r3, pc}
_0224E2F8:
	mov r0, #0xf
	pop {r3, pc}
_0224E2FC:
	mov r0, #0xe
	pop {r3, pc}
_0224E300:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov02_0224E2D4

	thumb_func_start ov02_0224E308
ov02_0224E308: ; 0x0224E308
	ldr r1, _0224E318 ; =0x00000165
	cmp r0, r1
	bne _0224E312
	mov r0, #1
	bx lr
_0224E312:
	mov r0, #0
	bx lr
	nop
_0224E318: .word 0x00000165
	thumb_func_end ov02_0224E308

	thumb_func_start ov02_0224E31C
ov02_0224E31C: ; 0x0224E31C
	sub r0, #0x20
	asr r2, r0, #4
	lsr r2, r2, #0x1b
	add r2, r0, r2
	sub r1, #0x20
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r1, r0, #5
	lsl r0, r1, #1
	asr r2, r2, #5
	add r0, r1, r0
	add r0, r2, r0
	bmi _0224E33C
	cmp r0, #6
	blt _0224E33E
_0224E33C:
	mov r0, #0
_0224E33E:
	bx lr
	thumb_func_end ov02_0224E31C

	thumb_func_start ov02_0224E340
ov02_0224E340: ; 0x0224E340
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r1, r0, #0
	add r0, r4, #0
	bl ov02_0224E31C
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0224E340

	thumb_func_start ov02_0224E35C
ov02_0224E35C: ; 0x0224E35C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	ldr r0, [r5, #0xc]
	bl Save_SafariZone_get
	add r4, r0, #0
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl ov02_0224E308
	cmp r0, #0
	bne _0224E38E
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E38E:
	add r0, r6, #0
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #0
	bne _0224E39E
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E39E:
	add r0, r4, #0
	bl sub_0202F620
	cmp r0, #0
	beq _0224E3AE
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E3AE:
	add r0, r4, #0
	bl sub_0202F720
	cmp r0, #0
	bne _0224E3BE
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E3BE:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	str r0, [sp, #8]
	add r0, r7, #0
	bl GetDeltaXByFacingDirection
	add r6, r4, r0
	add r0, r7, #0
	bl GetDeltaYByFacingDirection
	ldr r1, [sp, #8]
	add r4, r1, r0
	cmp r6, #0x20
	blt _0224E3F8
	cmp r6, #0x80
	bge _0224E3F8
	cmp r4, #0x20
	blt _0224E3F8
	cmp r4, #0x60
	blt _0224E3FE
_0224E3F8:
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E3FE:
	cmp r6, #0x20
	blt _0224E40E
	cmp r6, #0x80
	bge _0224E40E
	cmp r4, #0x20
	blt _0224E40E
	cmp r4, #0x60
	blt _0224E414
_0224E40E:
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E414:
	ldr r0, [r5, #0x40]
	add r1, sp, #0x10
	bl PlayerAvatar_GetPositionVec
	add r0, sp, #0xc
	str r0, [sp]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	bl sub_02054774
	add r7, r0, #0
	add r0, sp, #0xc
	ldrb r0, [r0]
	cmp r0, #1
	beq _0224E43C
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E43C:
	lsl r0, r4, #4
	add r0, #8
	cmp r0, #0
	ble _0224E458
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #4]
	b _0224E468
_0224E458:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #4]
_0224E468:
	lsl r0, r6, #4
	add r0, #8
	cmp r0, #0
	ble _0224E482
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224E490
_0224E482:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224E490:
	bl _ffix
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl _ffix
	add r3, r0, #0
	add r0, sp, #0xc
	str r0, [sp]
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_02054774
	add r1, sp, #0xc
	ldrb r1, [r1]
	cmp r1, #1
	beq _0224E4BA
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224E4BA:
	cmp r7, r0
	bne _0224E4C4
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224E4C4:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224E35C

	thumb_func_start ov02_0224E4CC
ov02_0224E4CC: ; 0x0224E4CC
	push {r3, lr}
	cmp r1, #0
	beq _0224E4D6
	mov r0, #0
	pop {r3, pc}
_0224E4D6:
	bl sub_0205BAD0
	pop {r3, pc}
	thumb_func_end ov02_0224E4CC

	thumb_func_start ov02_0224E4DC
ov02_0224E4DC: ; 0x0224E4DC
	push {r3, lr}
	cmp r1, #0
	beq _0224E4E6
	mov r0, #0
	pop {r3, pc}
_0224E4E6:
	bl sub_0205BAE4
	pop {r3, pc}
	thumb_func_end ov02_0224E4DC

	thumb_func_start ov02_0224E4EC
ov02_0224E4EC: ; 0x0224E4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x24
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r1, r5, r0
	add r0, r0, #5
	str r1, [r4, #4]
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	bne _0224E528
	mov r0, #1
	b _0224E52A
_0224E528:
	mov r0, #0
_0224E52A:
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	strb r6, [r4, #0x18]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	ldr r0, [r5, #0x40]
	add r1, sp, #0x20
	bl PlayerAvatar_GetPositionVec
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	bl ov02_0224E31C
	strb r0, [r4, #0x19]
	add r0, sp, #0x18
	str r0, [sp]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x28]
	add r0, r5, #0
	bl sub_02054774
	str r0, [sp, #0x24]
	add r1, sp, #0x18
	ldrb r1, [r1]
	cmp r1, #1
	beq _0224E584
	add sp, #0x2c
	add r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_0224E584:
	asr r0, r0, #0xc
	strb r0, [r4, #0x1a]
	ldr r0, [sp, #0x10]
	bl GetDeltaXByFacingDirection
	ldr r1, [sp, #0x14]
	add r0, r1, r0
	strb r0, [r4, #9]
	ldr r0, [sp, #0x10]
	bl GetDeltaYByFacingDirection
	add r0, r7, r0
	strb r0, [r4, #0xb]
	mov r0, #1
	strb r0, [r4, #8]
	ldr r0, [sp, #0x24]
	add r2, r7, #0
	str r0, [sp]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	add r0, sp, #0x18
	add r0, #2
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	bl ov02_0224E828
	cmp r0, #0
	beq _0224E5D4
	add r1, sp, #0x18
	mov r0, #4
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0xd]
	mov r0, #2
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0xf]
	mov r0, #1
	strb r0, [r4, #0xc]
_0224E5D4:
	ldr r0, [sp, #0x24]
	add r2, r7, #0
	str r0, [sp]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	add r0, sp, #0x18
	add r0, #2
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	bl ov02_0224EB48
	cmp r0, #0
	beq _0224E606
	add r1, sp, #0x18
	mov r0, #4
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0x11]
	mov r0, #2
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0x13]
	mov r0, #1
	strb r0, [r4, #0x10]
_0224E606:
	ldr r0, [sp, #0x24]
	add r2, r7, #0
	str r0, [sp]
	add r0, sp, #0x1c
	str r0, [sp, #4]
	add r0, sp, #0x18
	add r0, #2
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	bl ov02_0224EE4C
	cmp r0, #0
	beq _0224E638
	add r1, sp, #0x18
	mov r0, #4
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0x15]
	mov r0, #2
	ldrsh r0, [r1, r0]
	strb r0, [r4, #0x17]
	mov r0, #1
	strb r0, [r4, #0x14]
_0224E638:
	add r0, r4, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224E4EC

	thumb_func_start ov02_0224E640
ov02_0224E640: ; 0x0224E640
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerID
	add r5, r0, #0
	add r0, r4, #0
	bl Save_SafariZone_get
	bl sub_0202F720
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xa
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	cmp r0, #6
	bhs _0224E672
	mov r1, #3
	bl _s32_div_f
	b _0224E67C
_0224E672:
	sub r1, r0, #6
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, r0, #2
_0224E67C:
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #3
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r0, r0, #1
	cmp r4, r0
	blt _0224E692
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224E692:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224E640

	thumb_func_start ov02_0224E698
ov02_0224E698: ; 0x0224E698
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, [r5, #0x40]
	add r1, sp, #0x14
	bl PlayerAvatar_GetPositionVec
	ldr r0, [r5, #0xc]
	bl Save_SafariZone_get
	mov r1, #0
	bl SafariZone_GetAreaSet
	add r2, r0, #0
	add r0, r6, #0
	sub r0, #0x20
	asr r1, r0, #4
	lsr r1, r1, #0x1b
	add r1, r0, r1
	add r0, r4, #0
	sub r0, #0x20
	asr r3, r0, #4
	lsr r3, r3, #0x1b
	add r3, r0, r3
	asr r3, r3, #5
	lsl r0, r3, #1
	asr r1, r1, #5
	add r0, r3, r0
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x7a
	mul r0, r1
	add r0, r2, r0
	ldrb r0, [r0, #1]
	cmp r0, #0x1e
	blo _0224E706
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224E706:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _0224E716
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224E716:
	ldr r0, [r5, #0xc]
	bl ov02_0224E640
	cmp r0, #0
	bne _0224E726
	add sp, #0x20
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0224E726:
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [sp]
	add r0, sp, #0x10
	add r0, #2
	str r0, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov02_0224EE4C
	cmp r0, #0
	beq _0224E74E
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224E74E:
	mov r0, #3
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224E698

	thumb_func_start ov02_0224E754
ov02_0224E754: ; 0x0224E754
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	str r1, [sp]
	bl PlayerAvatar_GetFacingDirection
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl GetPlayerXCoord
	add r5, r0, #0
	add r0, r6, #0
	bl GetDeltaXByFacingDirection
	add r7, r5, r0
	ldr r0, [r4, #0x40]
	bl GetPlayerYCoord
	add r5, r0, #0
	add r0, r6, #0
	bl GetDeltaYByFacingDirection
	add r6, r5, r0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	bl ov02_0224E31C
	add r5, r0, #0
	lsr r1, r7, #0x1f
	lsl r0, r7, #0x1b
	sub r0, r0, r1
	mov r2, #0x1b
	ror r0, r2
	add r7, r1, r0
	lsr r1, r6, #0x1f
	lsl r0, r6, #0x1b
	sub r0, r0, r1
	ror r0, r2
	add r6, r1, r0
	ldr r0, [r4, #0xc]
	bl Save_SafariZone_get
	mov r1, #0
	bl SafariZone_GetAreaSet
	mov r1, #0x7a
	mul r1, r5
	add r0, r0, r1
	str r0, [sp, #8]
	ldrb r0, [r0, #1]
	mov r4, #0
	cmp r0, #0
	ble _0224E81C
	ldr r0, [sp, #8]
	add r5, r0, #2
_0224E7D4:
	ldrb r1, [r5]
	ldr r2, [sp, #4]
	add r0, sp, #0xc
	bl sub_02097268
	ldrb r1, [r5, #1]
	cmp r7, r1
	blt _0224E810
	ldrb r0, [r5, #3]
	cmp r6, r0
	bgt _0224E810
	add r2, sp, #0xc
	ldrb r2, [r2, #1]
	lsl r3, r2, #0x1c
	lsr r3, r3, #0x1d
	add r1, r1, r3
	cmp r7, r1
	bge _0224E810
	lsl r1, r2, #0x19
	lsr r1, r1, #0x1d
	sub r0, r0, r1
	cmp r6, r0
	ble _0224E810
	ldr r0, [sp]
	cmp r0, #0
	beq _0224E80A
	strh r4, [r0]
_0224E80A:
	add sp, #0x10
	ldrb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0224E810:
	ldr r0, [sp, #8]
	add r4, r4, #1
	ldrb r0, [r0, #1]
	add r5, r5, #4
	cmp r4, r0
	blt _0224E7D4
_0224E81C:
	ldr r0, [sp]
	mov r1, #0
	strh r1, [r0]
	mov r0, #0xff
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224E754

	thumb_func_start ov02_0224E828
ov02_0224E828: ; 0x0224E828
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	add r4, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x84]
	str r2, [sp, #4]
	ldr r1, _0224EB44 ; =ov02_02253A4C
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x88]
	ldrb r2, [r1, #2]
	str r0, [sp, #0x88]
	ldrb r1, [r1, #3]
	str r3, [sp, #8]
	add r0, sp, #0x68
	strb r2, [r0, #1]
	strb r1, [r0, #2]
	ldr r1, [sp, #0x84]
	ldr r6, [sp, #0x80]
	strh r5, [r1]
	ldr r2, [sp, #4]
	ldr r1, [sp, #0x88]
	strh r2, [r1]
	ldr r1, [sp, #8]
	cmp r1, #3
	bls _0224E85C
	b _0224EB3E
_0224E85C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224E868: ; jump table
	.short _0224E870 - _0224E868 - 2 ; case 0
	.short _0224E870 - _0224E868 - 2 ; case 1
	.short _0224E992 - _0224E868 - 2 ; case 2
	.short _0224E992 - _0224E868 - 2 ; case 3
_0224E870:
	mov r0, #0
	str r0, [sp, #0x50]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0224E87E
	mov r0, #1
	b _0224E880
_0224E87E:
	ldr r0, [sp, #0x50]
_0224E880:
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0
	str r0, [sp, #0x54]
	add r0, sp, #0x68
	add r0, #1
	ldrsb r0, [r0, r1]
	ldr r7, [sp, #0x54]
	str r0, [sp, #0x38]
	add r0, sp, #0x70
	ldrb r0, [r0, #0x1c]
	str r0, [sp, #0x48]
	lsl r0, r5, #4
	str r0, [sp, #0x44]
	add r0, #8
	str r0, [sp, #0x44]
	lsl r0, r0, #0xc
	str r0, [sp, #0x40]
_0224E8A4:
	ldr r0, [sp, #0x38]
	add r1, r7, r0
	ldr r0, [sp, #4]
	add r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r2, [sp, #0x3c]
	add r0, r4, #0
	add r1, r5, #0
	bl GetMetatileBehaviorAt
	str r0, [sp, #0x58]
	ldr r2, [sp, #0x3c]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020548C0
	add r1, r0, #0
	ldr r0, [sp, #0x58]
	ldr r2, [sp, #0x48]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224E95C
	ldr r0, [sp, #0x3c]
	lsl r0, r0, #4
	add r0, #8
	cmp r0, #0
	ble _0224E8F4
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #0x14]
	b _0224E904
_0224E8F4:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #0x14]
_0224E904:
	ldr r0, [sp, #0x44]
	cmp r0, #0
	ble _0224E91C
	ldr r0, [sp, #0x40]
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224E92A
_0224E91C:
	ldr r0, [sp, #0x40]
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224E92A:
	bl _ffix
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x14]
	bl _ffix
	add r3, r0, #0
	add r0, sp, #0x68
	str r0, [sp]
	ldr r2, [sp, #0x5c]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02054774
	add r1, sp, #0x68
	ldrb r1, [r1]
	cmp r1, #1
	bne _0224E95C
	cmp r0, r6
	bne _0224E95C
	ldr r0, [sp, #0x50]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x50]
_0224E95C:
	ldr r0, [sp, #0x38]
	add r7, r7, r0
	ldr r0, [sp, #0x54]
	add r0, r0, #1
	str r0, [sp, #0x54]
	cmp r0, #2
	blt _0224E8A4
	ldr r0, [sp, #0x50]
	cmp r0, #2
	beq _0224E972
	b _0224EB3E
_0224E972:
	ldr r0, [sp, #0x84]
	strh r5, [r0]
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0224E984
	ldr r0, [sp, #4]
	sub r1, r0, #1
	ldr r0, [sp, #0x88]
	b _0224E98A
_0224E984:
	ldr r0, [sp, #4]
	add r1, r0, #2
	ldr r0, [sp, #0x88]
_0224E98A:
	strh r1, [r0]
	add sp, #0x6c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224E992:
	ldr r1, [sp, #8]
	cmp r1, #2
	bne _0224E99C
	mov r1, #1
	b _0224E99E
_0224E99C:
	mov r1, #2
_0224E99E:
	ldrsb r0, [r0, r1]
	ldr r2, [sp, #4]
	add r0, r5, r0
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	add r0, r4, #0
	add r1, r5, #0
	bl GetMetatileBehaviorAt
	str r0, [sp, #0x20]
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020548C0
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	lsl r0, r0, #4
	add r0, #8
	cmp r0, #0
	ble _0224E9DC
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #0x10]
	b _0224E9EC
_0224E9DC:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #0x10]
_0224E9EC:
	lsl r0, r5, #4
	str r0, [sp, #0x2c]
	add r0, #8
	str r0, [sp, #0x2c]
	cmp r0, #0
	ble _0224EA0A
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224EA18
_0224EA0A:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224EA18:
	bl _ffix
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	bl _ffix
	add r3, r0, #0
	add r0, sp, #0x68
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054774
	add r7, r0, #0
	add r0, sp, #0x70
	ldrb r0, [r0, #0x1c]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x34]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224EA56
	add r0, sp, #0x68
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224EA56
	cmp r7, r6
	beq _0224EA5C
_0224EA56:
	add sp, #0x6c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0224EA5C:
	mov r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	add r7, sp, #0x68
	lsl r0, r0, #0xc
	add r7, #1
	str r0, [sp, #0x4c]
_0224EA6A:
	mov r0, #0
	ldrsb r1, [r7, r0]
	ldr r0, [sp, #4]
	add r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x30]
	ldr r2, [sp, #0x30]
	add r0, r4, #0
	add r1, r5, #0
	bl GetMetatileBehaviorAt
	str r0, [sp, #0x24]
	ldr r2, [sp, #0x30]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020548C0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x30]
	lsl r0, r0, #4
	add r0, #8
	cmp r0, #0
	ble _0224EAAE
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #0xc]
	b _0224EABE
_0224EAAE:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #0xc]
_0224EABE:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	ble _0224EAD6
	ldr r0, [sp, #0x4c]
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224EAE4
_0224EAD6:
	ldr r0, [sp, #0x4c]
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224EAE4:
	bl _ffix
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xc]
	bl _ffix
	add r3, r0, #0
	add r0, sp, #0x68
	str r0, [sp]
	ldr r2, [sp, #0x60]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02054774
	str r0, [sp, #0x64]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x34]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224EB32
	add r0, sp, #0x68
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224EB32
	ldr r0, [sp, #0x64]
	cmp r0, r6
	bne _0224EB32
	ldr r0, [sp, #0x84]
	strh r5, [r0]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r1, r0
	ldr r0, [sp, #0x88]
	add sp, #0x6c
	strh r1, [r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224EB32:
	ldr r0, [sp, #0x28]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #2
	blt _0224EA6A
_0224EB3E:
	mov r0, #0
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224EB44: .word ov02_02253A4C
	thumb_func_end ov02_0224E828

	thumb_func_start ov02_0224EB48
ov02_0224EB48: ; 0x0224EB48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	add r4, r0, #0
	ldr r0, [sp, #0x84]
	str r1, [sp, #4]
	str r0, [sp, #0x84]
	ldr r0, [sp, #0x88]
	ldr r1, _0224EE48 ; =ov02_02253A4C
	str r0, [sp, #0x88]
	add r5, r2, #0
	add r2, r3, #0
	ldrb r0, [r1]
	add r3, sp, #0x64
	ldr r6, [sp, #0x80]
	strb r0, [r3, #1]
	ldrb r0, [r1, #1]
	cmp r2, #3
	strb r0, [r3, #2]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x84]
	strh r1, [r0]
	ldr r0, [sp, #0x88]
	strh r5, [r0]
	bls _0224EB7A
	b _0224EE42
_0224EB7A:
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224EB86: ; jump table
	.short _0224EB8E - _0224EB86 - 2 ; case 0
	.short _0224EB8E - _0224EB86 - 2 ; case 1
	.short _0224ED3A - _0224EB86 - 2 ; case 2
	.short _0224ED3A - _0224EB86 - 2 ; case 3
_0224EB8E:
	cmp r2, #0
	bne _0224EB96
	mov r0, #1
	b _0224EB98
_0224EB96:
	mov r0, #2
_0224EB98:
	ldrsb r0, [r3, r0]
	ldr r1, [sp, #4]
	add r0, r5, r0
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	add r0, r4, #0
	add r2, r5, #0
	bl GetMetatileBehaviorAt
	str r0, [sp, #0x50]
	ldr r1, [sp, #4]
	add r0, r4, #0
	add r2, r5, #0
	bl sub_020548C0
	str r0, [sp, #0x4c]
	lsl r0, r5, #4
	str r0, [sp, #0x24]
	add r0, #8
	str r0, [sp, #0x24]
	cmp r0, #0
	ble _0224EBD8
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #0x14]
	b _0224EBE8
_0224EBD8:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #0x14]
_0224EBE8:
	ldr r0, [sp, #4]
	lsl r0, r0, #4
	add r0, #8
	cmp r0, #0
	ble _0224EC04
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224EC12
_0224EC04:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224EC12:
	bl _ffix
	add r7, r0, #0
	ldr r0, [sp, #0x14]
	bl _ffix
	add r3, r0, #0
	add r0, sp, #0x64
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054774
	add r7, r0, #0
	add r0, sp, #0x70
	ldrb r0, [r0, #0x1c]
	ldr r1, [sp, #0x4c]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x50]
	ldr r2, [sp, #0x30]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224EC50
	add r0, sp, #0x64
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224EC50
	cmp r7, r6
	beq _0224EC56
_0224EC50:
	add sp, #0x68
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224EC56:
	mov r0, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x24]
	add r7, sp, #0x64
	lsl r0, r0, #0xc
	add r7, #1
	str r0, [sp, #0x34]
_0224EC64:
	mov r0, #0
	ldrsb r1, [r7, r0]
	ldr r0, [sp, #4]
	add r2, r5, #0
	sub r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x2c]
	add r0, r4, #0
	bl GetMetatileBehaviorAt
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x2c]
	add r0, r4, #0
	add r2, r5, #0
	bl sub_020548C0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ble _0224ECA4
	ldr r0, [sp, #0x34]
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #0x10]
	b _0224ECB4
_0224ECA4:
	ldr r0, [sp, #0x34]
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #0x10]
_0224ECB4:
	ldr r0, [sp, #0x2c]
	lsl r0, r0, #4
	add r0, #8
	cmp r0, #0
	ble _0224ECD0
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224ECDE
_0224ECD0:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224ECDE:
	bl _ffix
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x10]
	bl _ffix
	add r3, r0, #0
	add r0, sp, #0x64
	str r0, [sp]
	ldr r2, [sp, #0x54]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02054774
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x30]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224ED2C
	add r0, sp, #0x64
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224ED2C
	ldr r0, [sp, #0x58]
	cmp r0, r6
	bne _0224ED2C
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x48]
	sub r1, r1, r0
	ldr r0, [sp, #0x84]
	strh r1, [r0]
	ldr r0, [sp, #0x88]
	add sp, #0x68
	strh r5, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224ED2C:
	ldr r0, [sp, #0x48]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #0x48]
	cmp r0, #2
	blt _0224EC64
	b _0224EE42
_0224ED3A:
	mov r0, #0
	str r0, [sp, #0x44]
	cmp r2, #2
	bne _0224ED4E
	ldr r0, [sp, #4]
	sub r0, r0, #2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0xc]
	b _0224ED58
_0224ED4E:
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0xc]
_0224ED58:
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, sp, #0x70
	ldrb r0, [r0, #0x1c]
	ldr r7, [sp, #0xc]
	str r0, [sp, #0x40]
	lsl r0, r5, #4
	str r0, [sp, #0x3c]
	add r0, #8
	str r0, [sp, #0x3c]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
_0224ED70:
	lsl r0, r7, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	add r2, r5, #0
	bl GetMetatileBehaviorAt
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	add r2, r5, #0
	bl sub_020548C0
	add r1, r0, #0
	ldr r0, [sp, #0x5c]
	ldr r2, [sp, #0x40]
	bl ov02_0224EF6C
	cmp r0, #0
	beq _0224EE20
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	ble _0224EDB4
	ldr r0, [sp, #0x38]
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #8]
	b _0224EDC4
_0224EDB4:
	ldr r0, [sp, #0x38]
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #8]
_0224EDC4:
	ldr r0, [sp, #0x28]
	lsl r0, r0, #4
	add r0, #8
	cmp r0, #0
	ble _0224EDE0
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0224EDEE
_0224EDE0:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0224EDEE:
	bl _ffix
	str r0, [sp, #0x60]
	ldr r0, [sp, #8]
	bl _ffix
	add r3, r0, #0
	add r0, sp, #0x64
	str r0, [sp]
	ldr r2, [sp, #0x60]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02054774
	add r1, sp, #0x64
	ldrb r1, [r1]
	cmp r1, #1
	bne _0224EE20
	cmp r0, r6
	bne _0224EE20
	ldr r0, [sp, #0x44]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x44]
_0224EE20:
	ldr r0, [sp, #0x18]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _0224ED70
	ldr r0, [sp, #0x44]
	cmp r0, #2
	bne _0224EE42
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x84]
	strh r1, [r0]
	ldr r0, [sp, #0x88]
	add sp, #0x68
	strh r5, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224EE42:
	mov r0, #0
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224EE48: .word ov02_02253A4C
	thumb_func_end ov02_0224EB48

	thumb_func_start ov02_0224EE4C
ov02_0224EE4C: ; 0x0224EE4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r4, [sp, #0x38]
	str r3, [sp, #0x1c]
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x44]
	ldr r6, [sp, #0x3c]
	str r4, [sp, #0x44]
	ldr r4, _0224EF68 ; =ov02_02253A4C
	ldr r7, [sp, #0x40]
	ldrb r5, [r4, #4]
	add r4, sp, #0x20
	str r0, [sp, #0x10]
	strb r5, [r4]
	ldr r4, _0224EF68 ; =ov02_02253A4C
	ldrb r5, [r4, #5]
	add r4, sp, #0x20
	strb r5, [r4, #1]
	ldr r4, [sp, #0x14]
	strh r4, [r6]
	ldr r4, [sp, #0x18]
	strh r4, [r7]
	ldr r4, [sp, #0x1c]
	cmp r4, #3
	bhi _0224EF60
	add r4, r4, r4
	add r4, pc
	ldrh r4, [r4, #6]
	lsl r4, r4, #0x10
	asr r4, r4, #0x10
	add pc, r4
_0224EE8E: ; jump table
	.short _0224EE96 - _0224EE8E - 2 ; case 0
	.short _0224EE96 - _0224EE8E - 2 ; case 1
	.short _0224EEFC - _0224EE8E - 2 ; case 2
	.short _0224EEFC - _0224EE8E - 2 ; case 3
_0224EE96:
	ldr r4, [sp, #0x38]
	str r4, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r4, [sp, #0x44]
	str r4, [sp, #0xc]
	bl ov02_0224E828
	cmp r0, #0
	beq _0224EF60
	mov r4, #0
	add r5, sp, #0x20
_0224EEAE:
	ldr r0, [sp, #0x38]
	mov r1, #0
	str r0, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0xc]
	ldrsb r2, [r5, r1]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r1, r1, r2
	lsl r1, r1, #0x10
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	asr r1, r1, #0x10
	bl ov02_0224E828
	cmp r0, #0
	beq _0224EEF2
	ldr r0, [sp, #0x14]
	sub r0, r0, r4
	strh r0, [r6]
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0224EEE6
	ldr r0, [sp, #0x18]
	sub r0, r0, #1
	b _0224EEEA
_0224EEE6:
	ldr r0, [sp, #0x18]
	add r0, r0, #2
_0224EEEA:
	add sp, #0x24
	strh r0, [r7]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224EEF2:
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #2
	blt _0224EEAE
	b _0224EF60
_0224EEFC:
	ldr r4, [sp, #0x38]
	str r4, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r4, [sp, #0x44]
	str r4, [sp, #0xc]
	bl ov02_0224EB48
	cmp r0, #0
	beq _0224EF60
	mov r5, #0
	add r4, sp, #0x20
_0224EF14:
	ldr r0, [sp, #0x38]
	mov r2, #0
	str r0, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0xc]
	ldrsb r3, [r4, r2]
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x10]
	sub r2, r2, r3
	lsl r2, r2, #0x10
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	asr r2, r2, #0x10
	bl ov02_0224EB48
	cmp r0, #0
	beq _0224EF58
	ldr r0, [sp, #0x1c]
	cmp r0, #2
	bne _0224EF46
	ldr r0, [sp, #0x14]
	sub r0, r0, #2
	b _0224EF4A
_0224EF46:
	ldr r0, [sp, #0x14]
	add r0, r0, #1
_0224EF4A:
	strh r0, [r6]
	ldr r0, [sp, #0x18]
	add sp, #0x24
	add r0, r0, r5
	strh r0, [r7]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224EF58:
	add r5, r5, #1
	add r4, r4, #1
	cmp r5, #2
	blt _0224EF14
_0224EF60:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0224EF68: .word ov02_02253A4C
	thumb_func_end ov02_0224EE4C

	thumb_func_start ov02_0224EF6C
ov02_0224EF6C: ; 0x0224EF6C
	push {r3, lr}
	cmp r2, #0
	bne _0224EF78
	bl ov02_0224E4CC
	pop {r3, pc}
_0224EF78:
	bl ov02_0224E4DC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224EF6C

	thumb_func_start Fsys_FollowPokeInteract
Fsys_FollowPokeInteract: ; 0x0224EF80
	ldr r3, _0224EF8C ; =TaskManager_Call
	ldr r0, [r0, #0x10]
	ldr r1, _0224EF90 ; =Task_FollowPokeInteract
	mov r2, #0
	bx r3
	nop
_0224EF8C: .word TaskManager_Call
_0224EF90: .word Task_FollowPokeInteract
	thumb_func_end Fsys_FollowPokeInteract

	thumb_func_start ov02_0224EF94
ov02_0224EF94: ; 0x0224EF94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1b0
	add r7, r0, #0
	ldr r0, [r7, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	mov r1, #0xde
	add r0, #0x14
	add r2, r2, #1
	bl ReadWholeNarcMemberByIdPair
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r7, r0]
	mov r0, #0x9b
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0xde
	mov r2, #0
	bl ReadWholeNarcMemberByIdPair
	add r0, r7, #0
	add r1, sp, #4
	bl ov02_0224F058
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	add r3, sp, #0x20
	str r0, [sp]
	add r0, #0x14
	str r0, [sp]
	mov r0, #0
	add r2, r0, #0
_0224EFE2:
	add r1, r2, #0
	add r1, #0x1e
	add r2, r2, #1
	add r0, r0, #1
	stmia r3!, {r1}
	cmp r2, #0xc
	blt _0224EFE2
	add r2, sp, #0x20
	lsl r1, r0, #2
	mov r3, #0
	add r1, r2, r1
_0224EFF8:
	stmia r1!, {r3}
	add r3, r3, #1
	add r0, r0, #1
	cmp r3, #0x1e
	blt _0224EFF8
	add r2, sp, #0x20
	lsl r1, r0, #2
	mov r3, #0x2a
	add r1, r2, r1
_0224F00A:
	stmia r1!, {r3}
	add r3, r3, #1
	add r0, r0, #1
	cmp r3, #0x64
	blt _0224F00A
	mov r5, #0
	add r4, sp, #0x20
_0224F018:
	ldr r1, [r4]
	mov r0, #0x14
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	add r6, r0, r2
	ldrh r0, [r6, #0xa]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x16
	beq _0224F044
	add r0, r7, #0
	add r1, r6, #0
	add r2, sp, #4
	bl ov02_0224F108
	cmp r0, #0
	beq _0224F044
	ldrh r0, [r6, #0xa]
	add sp, #0x1b0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x16
	pop {r3, r4, r5, r6, r7, pc}
_0224F044:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x64
	blt _0224F018
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x1b0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224EF94

	thumb_func_start ov02_0224F058
ov02_0224F058: ; 0x0224F058
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _0224F100 ; =0x0000087E
	strh r0, [r2, r1]
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _0224F104 ; =0x0000087D
	strb r0, [r2, r1]
	add r0, r6, #0
	add r1, r4, #0
	bl ov02_0224F324
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224F4BC
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224F580
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224F5D0
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224F5FC
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224F644
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224F64C
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224F698
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r3, [r5, r0]
	ldr r2, _0224F100 ; =0x0000087E
	add r0, r5, #0
	ldrh r1, [r3, r2]
	sub r2, r2, #1
	ldrb r2, [r3, r2]
	add r3, r4, #0
	bl ov02_0224F6AC
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_0224F728
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0224F100 ; =0x0000087E
	ldrh r0, [r1, r0]
	add r1, r4, #0
	bl ov02_0224F76C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224F100: .word 0x0000087E
_0224F104: .word 0x0000087D
	thumb_func_end ov02_0224F058

	thumb_func_start ov02_0224F108
ov02_0224F108: ; 0x0224F108
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	ldrb r0, [r5, #0x11]
	cmp r1, r0
	blt _0224F124
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F124:
	ldrh r7, [r5, #0x12]
	cmp r7, #0
	beq _0224F13E
	ldr r0, [r6, #0xc]
	bl SavArray_Flags_get
	add r1, r7, #0
	bl CheckFlagInArray
	cmp r0, #0
	bne _0224F13E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F13E:
	ldrb r0, [r5, #3]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1b
	beq _0224F15E
	cmp r1, #9
	bne _0224F154
	ldrb r0, [r4]
	cmp r0, #0
	bne _0224F15E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F154:
	ldrb r0, [r4, #1]
	cmp r1, r0
	beq _0224F15E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F15E:
	ldrb r1, [r5]
	cmp r1, #0
	beq _0224F16E
	ldrb r0, [r4, #2]
	cmp r1, r0
	beq _0224F16E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F16E:
	ldrb r0, [r5, #2]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1d
	beq _0224F19C
	cmp r1, #7
	ldrb r0, [r4, #3]
	bne _0224F194
	cmp r0, #2
	beq _0224F19C
	cmp r0, #3
	beq _0224F19C
	cmp r0, #4
	beq _0224F19C
	cmp r0, #5
	beq _0224F19C
	cmp r0, #8
	beq _0224F19C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F194:
	cmp r1, r0
	beq _0224F19C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F19C:
	ldrh r0, [r5, #0xa]
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1d
	beq _0224F1BA
	cmp r1, #5
	ldrb r0, [r4, #0xc]
	bne _0224F1B2
	cmp r0, #5
	bhs _0224F1BA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1B2:
	cmp r1, r0
	beq _0224F1BA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1BA:
	ldrb r0, [r5, #0x10]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1d
	beq _0224F1D8
	cmp r1, #4
	ldrb r0, [r4, #0xd]
	bne _0224F1D0
	cmp r0, #4
	bhs _0224F1D8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1D0:
	cmp r1, r0
	beq _0224F1D8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1D8:
	ldrb r0, [r5, #0x10]
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1e
	beq _0224F1EA
	ldrb r0, [r4, #4]
	cmp r1, r0
	beq _0224F1EA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F1EA:
	ldrb r0, [r5, #0x10]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1e
	beq _0224F212
	cmp r1, #3
	bne _0224F200
	ldrb r0, [r4, #0xe]
	cmp r0, #0
	bne _0224F200
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F200:
	cmp r1, #1
	bne _0224F20E
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _0224F20E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F20E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F212:
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1b
	beq _0224F22A
	ldrb r0, [r4, #5]
	cmp r1, r0
	beq _0224F22A
	ldrb r0, [r4, #6]
	cmp r1, r0
	beq _0224F22A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F22A:
	ldrh r0, [r5, #8]
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1d
	beq _0224F23C
	ldrb r0, [r4, #0x11]
	cmp r1, r0
	beq _0224F23C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F23C:
	ldrh r1, [r5, #0xe]
	cmp r1, #0
	beq _0224F24C
	ldrb r0, [r4, #0x12]
	cmp r1, r0
	beq _0224F24C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F24C:
	ldrb r1, [r5, #5]
	cmp r1, #0
	beq _0224F25C
	ldrb r0, [r4, #0x13]
	cmp r1, r0
	beq _0224F25C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F25C:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	beq _0224F26E
	sub r1, r0, #1
	ldrh r0, [r4, #0x1a]
	cmp r1, r0
	beq _0224F26E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F26E:
	ldrh r0, [r5, #0xa]
	lsl r0, r0, #0x1a
	lsr r1, r0, #0x1d
	beq _0224F280
	ldrb r0, [r4, #0x14]
	cmp r1, r0
	beq _0224F280
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F280:
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	beq _0224F298
	mov r1, #0x15
	ldrsb r1, [r4, r1]
	bl ov02_02250628
	cmp r0, #0
	bne _0224F298
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F298:
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1d
	beq _0224F2AA
	ldrb r0, [r4, #0x16]
	cmp r1, r0
	beq _0224F2AA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2AA:
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	beq _0224F2C0
	ldrb r1, [r4, #7]
	bl ov02_02250594
	cmp r0, #0
	bne _0224F2C0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2C0:
	ldrb r0, [r5, #2]
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1d
	beq _0224F2D2
	ldrb r0, [r4, #8]
	cmp r1, r0
	beq _0224F2D2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2D2:
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _0224F2E6
	ldrb r1, [r4, #0xa]
	bl ov02_022506D4
	cmp r0, #0
	bne _0224F2E6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2E6:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _0224F2FA
	ldrb r1, [r4, #0xb]
	bl ov02_02250738
	cmp r0, #0
	bne _0224F2FA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F2FA:
	ldrb r0, [r5, #2]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1e
	beq _0224F30C
	ldrb r0, [r4, #9]
	cmp r1, r0
	beq _0224F30C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F30C:
	ldrh r0, [r5, #8]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x1d
	beq _0224F31E
	ldrb r0, [r4, #0x17]
	cmp r1, r0
	beq _0224F31E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224F31E:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224F108

	thumb_func_start ov02_0224F324
ov02_0224F324: ; 0x0224F324
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	mov r1, #6
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224F34E
	mov r1, #1
	lsl r0, r0, #0x10
	strb r1, [r5]
	lsr r0, r0, #0x10
	mov r1, #5
	mov r2, #0xb
	bl GetItemAttr
	bl ov02_0224F820
	b _0224F354
_0224F34E:
	mov r0, #0
	strb r0, [r5]
	mov r0, #8
_0224F354:
	strb r0, [r5, #1]
	add r0, r7, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	mov r0, #0x64
	mul r0, r4
	bl _s32_div_f
	cmp r0, #0x64
	bne _0224F380
	mov r0, #1
	strb r0, [r5, #2]
	b _0224F3A2
_0224F380:
	cmp r0, #0x4b
	blt _0224F38A
	mov r0, #2
	strb r0, [r5, #2]
	b _0224F3A2
_0224F38A:
	cmp r0, #0x32
	blt _0224F394
	mov r0, #3
	strb r0, [r5, #2]
	b _0224F3A2
_0224F394:
	cmp r0, #0x19
	blt _0224F39E
	mov r0, #4
	strb r0, [r5, #2]
	b _0224F3A2
_0224F39E:
	mov r0, #5
	strb r0, [r5, #2]
_0224F3A2:
	add r0, r7, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	mov r1, #0x88
	tst r1, r0
	beq _0224F3B8
	mov r0, #5
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3B8:
	mov r1, #7
	tst r1, r0
	beq _0224F3C4
	mov r0, #8
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3C4:
	mov r1, #0x10
	tst r1, r0
	beq _0224F3D0
	mov r0, #2
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3D0:
	mov r1, #0x20
	tst r1, r0
	beq _0224F3DC
	mov r0, #3
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3DC:
	mov r1, #0x40
	tst r1, r0
	beq _0224F3E8
	mov r0, #4
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3E8:
	cmp r0, #0
	bne _0224F3F2
	mov r0, #1
	strb r0, [r5, #3]
	b _0224F3FA
_0224F3F2:
	bl GF_AssertFail
	mov r0, #1
	strb r0, [r5, #3]
_0224F3FA:
	add r0, r7, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r1, r0, #2
	cmp r1, #0x32
	blt _0224F410
	mov r0, #4
	strb r0, [r5, #4]
	b _0224F420
_0224F410:
	sub r0, r0, #2
	cmp r0, #0x32
	bgt _0224F41C
	mov r0, #6
	strb r0, [r5, #4]
	b _0224F420
_0224F41C:
	mov r0, #5
	strb r0, [r5, #4]
_0224F420:
	add r0, r7, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	bl ov02_0224F79C
	strb r0, [r5, #5]
	add r0, r6, #0
	bl ov02_0224F79C
	strb r0, [r5, #6]
	add r0, r7, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #7]
	add r0, r7, #0
	bl GetMonNature
	lsl r1, r0, #2
	ldr r0, _0224F4B4 ; =ov02_02253AC0
	mov r2, #0
	ldr r0, [r0, r1]
	mov r1, #0x6f
	strb r0, [r5, #8]
	add r0, r7, #0
	bl GetMonData
	cmp r0, #0
	bne _0224F474
	mov r0, #1
	b _0224F476
_0224F474:
	mov r0, #2
_0224F476:
	ldr r3, _0224F4B8 ; =ov02_02253A5C
	strb r0, [r5, #9]
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r4, #0
	str r0, [r2]
	strb r4, [r5, #0xb]
	add r5, #0xb
_0224F490:
	ldr r1, [r6]
	add r0, r7, #0
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r4
	ldrb r1, [r5]
	add r4, r4, #1
	add r6, r6, #4
	orr r0, r1
	strb r0, [r5]
	cmp r4, #5
	blt _0224F490
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0224F4B4: .word ov02_02253AC0
_0224F4B8: .word ov02_02253A5C
	thumb_func_end ov02_0224F324

	thumb_func_start ov02_0224F4BC
ov02_0224F4BC: ; 0x0224F4BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #0
	strb r0, [r5, #0xc]
	strb r0, [r5, #0xe]
	strb r0, [r5, #0xf]
	strb r0, [r5, #0x10]
	ldr r0, [r4, #0x40]
	bl GetPlayerXCoord
	str r0, [sp, #4]
	ldr r0, [r4, #0x40]
	bl GetPlayerYCoord
	str r0, [sp]
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_GetCount
	str r0, [sp, #8]
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_GetArray
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _0224F57A
	add r7, r5, #0
	add r7, #0xc
_0224F4FC:
	ldr r0, [sp, #0x10]
	bl MapObject_IsInUse
	cmp r0, #1
	bne _0224F568
	ldr r0, [sp, #0x10]
	bl MapObject_GetCurrentX
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	bl MapObject_GetCurrentY
	ldr r1, [sp, #4]
	sub r6, r1, r4
	ldr r1, [sp]
	sub r4, r1, r0
	ldr r0, [sp, #0x10]
	bl MapObject_GetGfxID
	cmp r0, #0x54
	bne _0224F52C
	mov r0, #1
	strb r0, [r5, #0xf]
	b _0224F568
_0224F52C:
	cmp r0, #0x55
	bne _0224F536
	mov r0, #1
	strb r0, [r5, #0xe]
	b _0224F568
_0224F536:
	cmp r0, #0x56
	bne _0224F540
	mov r0, #1
	strb r0, [r5, #0x10]
	b _0224F568
_0224F540:
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	blt _0224F568
	cmp r6, #1
	bgt _0224F568
	cmp r4, r0
	blt _0224F568
	cmp r4, #1
	bgt _0224F568
	ldr r0, [sp, #0x10]
	bl MapObject_GetID
	cmp r0, #0xfd
	beq _0224F568
	cmp r0, #0xff
	beq _0224F568
	ldrb r0, [r7]
	add r0, r0, #1
	strb r0, [r7]
_0224F568:
	add r0, sp, #0x10
	bl sub_0205F1D0
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _0224F4FC
_0224F57A:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224F4BC

	thumb_func_start ov02_0224F580
ov02_0224F580: ; 0x0224F580
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	mov r4, #0
	bl Field_GetBgEvents
	add r5, r0, #0
	ldr r0, [sp]
	bl Field_GetNumBgEvents
	add r7, r0, #0
	beq _0224F5C6
	cmp r5, #0
	beq _0224F5C6
	add r6, r4, #0
	cmp r7, #0
	ble _0224F5C6
_0224F5A4:
	ldrh r0, [r5, #2]
	cmp r0, #2
	bne _0224F5BE
	ldrh r0, [r5]
	bl HiddenItemScriptNoToFlagId
	add r1, r0, #0
	ldr r0, [sp]
	bl FlagGet
	cmp r0, #0
	bne _0224F5BE
	add r4, r4, #1
_0224F5BE:
	add r6, r6, #1
	add r5, #0x14
	cmp r6, r7
	blt _0224F5A4
_0224F5C6:
	ldr r0, [sp, #4]
	strb r4, [r0, #0xd]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224F580

	thumb_func_start ov02_0224F5D0
ov02_0224F5D0: ; 0x0224F5D0
	push {r4, lr}
	ldr r0, [r0, #0xc]
	add r4, r1, #0
	bl Save_FlyPoints_get
	bl FlyPoints_GetWeatherType
	cmp r0, #0
	beq _0224F5E8
	cmp r0, #1
	beq _0224F5EE
	b _0224F5F4
_0224F5E8:
	mov r0, #1
	strb r0, [r4, #0x11]
	pop {r4, pc}
_0224F5EE:
	mov r0, #3
	strb r0, [r4, #0x11]
	pop {r4, pc}
_0224F5F4:
	mov r0, #0
	strb r0, [r4, #0x11]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224F5D0

	thumb_func_start ov02_0224F5FC
ov02_0224F5FC: ; 0x0224F5FC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_GetCurrentY
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl GetMetatileBehaviorAt
	mov r1, #0x12
	strb r0, [r4, #0x12]
	lsl r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _0224F640 ; =0x00000882
	strh r0, [r2, r1]
	bl sub_0205B994
	cmp r0, #0
	beq _0224F63A
	mov r0, #1
	strb r0, [r4, #0x13]
	pop {r4, r5, r6, pc}
_0224F63A:
	mov r0, #2
	strb r0, [r4, #0x13]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224F640: .word 0x00000882
	thumb_func_end ov02_0224F5FC

	thumb_func_start ov02_0224F644
ov02_0224F644: ; 0x0224F644
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	strh r0, [r1, #0x1a]
	bx lr
	thumb_func_end ov02_0224F644

	thumb_func_start ov02_0224F64C
ov02_0224F64C: ; 0x0224F64C
	push {r4, lr}
	add r4, r1, #0
	bl Field_GetTimeOfDay
	cmp r0, #4
	bhi _0224F68C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224F664: ; jump table
	.short _0224F66E - _0224F664 - 2 ; case 0
	.short _0224F674 - _0224F664 - 2 ; case 1
	.short _0224F67A - _0224F664 - 2 ; case 2
	.short _0224F680 - _0224F664 - 2 ; case 3
	.short _0224F686 - _0224F664 - 2 ; case 4
_0224F66E:
	mov r0, #1
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F674:
	mov r0, #2
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F67A:
	mov r0, #3
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F680:
	mov r0, #4
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F686:
	mov r0, #5
	strb r0, [r4, #0x14]
	pop {r4, pc}
_0224F68C:
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #0x14]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224F64C

	thumb_func_start ov02_0224F698
ov02_0224F698: ; 0x0224F698
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x42
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl FsysUnkSub108_GetMonMood
	strb r0, [r4, #0x15]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224F698

	thumb_func_start ov02_0224F6AC
ov02_0224F6AC: ; 0x0224F6AC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r0, [r0, #0xc]
	add r5, r3, #0
	bl SavArray_PlayerParty_get
	add r4, r0, #0
	bl GetIdxOfFirstAliveMonInParty_CrashIfNone
	add r6, r0, #0
	add r0, r4, #0
	add r1, sp, #8
	add r2, r6, #0
	bl Party_GetUnkSubSlot
	add r0, r4, #0
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, sp, #0
	add r2, sp, #8
	mov r3, #0xb
	bl CalcMonPokeathlonStars
	add r0, sp, #0
	ldrh r2, [r0]
	lsl r0, r2, #0x1d
	lsl r2, r2, #0x11
	lsr r1, r0, #0x1d
	lsr r2, r2, #0x1d
	mov r0, #1
	cmp r1, r2
	bhs _0224F6F4
	add r1, r2, #0
	mov r0, #2
_0224F6F4:
	add r2, sp, #0
	ldrh r2, [r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x1d
	cmp r1, r2
	bhs _0224F704
	add r1, r2, #0
	mov r0, #4
_0224F704:
	add r2, sp, #0
	ldrh r2, [r2]
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1d
	cmp r1, r2
	bhs _0224F714
	add r1, r2, #0
	mov r0, #3
_0224F714:
	add r2, sp, #0
	ldrh r2, [r2]
	lsl r2, r2, #0x17
	lsr r2, r2, #0x1d
	cmp r1, r2
	bhs _0224F722
	mov r0, #5
_0224F722:
	strb r0, [r5, #0x16]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_0224F6AC

	thumb_func_start ov02_0224F728
ov02_0224F728: ; 0x0224F728
	push {r4, lr}
	add r0, #0xe4
	ldr r0, [r0]
	add r4, r1, #0
	bl MapObject_GetFacingDirection
	cmp r0, #3
	bhi _0224F764
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224F744: ; jump table
	.short _0224F74C - _0224F744 - 2 ; case 0
	.short _0224F752 - _0224F744 - 2 ; case 1
	.short _0224F758 - _0224F744 - 2 ; case 2
	.short _0224F75E - _0224F744 - 2 ; case 3
_0224F74C:
	mov r0, #3
	strb r0, [r4, #0x17]
	pop {r4, pc}
_0224F752:
	mov r0, #4
	strb r0, [r4, #0x17]
	pop {r4, pc}
_0224F758:
	mov r0, #2
	strb r0, [r4, #0x17]
	pop {r4, pc}
_0224F75E:
	mov r0, #1
	strb r0, [r4, #0x17]
	pop {r4, pc}
_0224F764:
	mov r0, #0
	strb r0, [r4, #0x17]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_0224F728

	thumb_func_start ov02_0224F76C
ov02_0224F76C: ; 0x0224F76C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	ble _0224F77C
	ldr r0, _0224F798 ; =0x000001ED
	cmp r5, r0
	ble _0224F782
_0224F77C:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0224F782:
	mov r0, #0xe9
	mov r1, #0
	mov r2, #0xb
	bl AllocAtEndAndReadWholeNarcMemberByIdPair
	sub r1, r5, #1
	ldrb r1, [r0, r1]
	strb r1, [r4, #0xa]
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224F798: .word 0x000001ED
	thumb_func_end ov02_0224F76C

	thumb_func_start ov02_0224F79C
ov02_0224F79C: ; 0x0224F79C
	push {r3, lr}
	cmp r0, #0x11
	bhi _0224F816
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224F7AE: ; jump table
	.short _0224F7D2 - _0224F7AE - 2 ; case 0
	.short _0224F7D6 - _0224F7AE - 2 ; case 1
	.short _0224F7DA - _0224F7AE - 2 ; case 2
	.short _0224F7DE - _0224F7AE - 2 ; case 3
	.short _0224F7E2 - _0224F7AE - 2 ; case 4
	.short _0224F7E6 - _0224F7AE - 2 ; case 5
	.short _0224F7EA - _0224F7AE - 2 ; case 6
	.short _0224F7EE - _0224F7AE - 2 ; case 7
	.short _0224F7F2 - _0224F7AE - 2 ; case 8
	.short _0224F816 - _0224F7AE - 2 ; case 9
	.short _0224F7F6 - _0224F7AE - 2 ; case 10
	.short _0224F7FA - _0224F7AE - 2 ; case 11
	.short _0224F7FE - _0224F7AE - 2 ; case 12
	.short _0224F802 - _0224F7AE - 2 ; case 13
	.short _0224F806 - _0224F7AE - 2 ; case 14
	.short _0224F80A - _0224F7AE - 2 ; case 15
	.short _0224F80E - _0224F7AE - 2 ; case 16
	.short _0224F812 - _0224F7AE - 2 ; case 17
_0224F7D2:
	mov r0, #1
	pop {r3, pc}
_0224F7D6:
	mov r0, #7
	pop {r3, pc}
_0224F7DA:
	mov r0, #0xa
	pop {r3, pc}
_0224F7DE:
	mov r0, #8
	pop {r3, pc}
_0224F7E2:
	mov r0, #9
	pop {r3, pc}
_0224F7E6:
	mov r0, #0xd
	pop {r3, pc}
_0224F7EA:
	mov r0, #0xc
	pop {r3, pc}
_0224F7EE:
	mov r0, #0xe
	pop {r3, pc}
_0224F7F2:
	mov r0, #0x11
	pop {r3, pc}
_0224F7F6:
	mov r0, #2
	pop {r3, pc}
_0224F7FA:
	mov r0, #3
	pop {r3, pc}
_0224F7FE:
	mov r0, #5
	pop {r3, pc}
_0224F802:
	mov r0, #4
	pop {r3, pc}
_0224F806:
	mov r0, #0xb
	pop {r3, pc}
_0224F80A:
	mov r0, #6
	pop {r3, pc}
_0224F80E:
	mov r0, #0xf
	pop {r3, pc}
_0224F812:
	mov r0, #0x10
	pop {r3, pc}
_0224F816:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_0224F79C

	thumb_func_start ov02_0224F820
ov02_0224F820: ; 0x0224F820
	push {r3, lr}
	cmp r0, #6
	bhi _0224F85C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224F832: ; jump table
	.short _0224F840 - _0224F832 - 2 ; case 0
	.short _0224F844 - _0224F832 - 2 ; case 1
	.short _0224F848 - _0224F832 - 2 ; case 2
	.short _0224F84C - _0224F832 - 2 ; case 3
	.short _0224F850 - _0224F832 - 2 ; case 4
	.short _0224F854 - _0224F832 - 2 ; case 5
	.short _0224F858 - _0224F832 - 2 ; case 6
_0224F840:
	mov r0, #4
	pop {r3, pc}
_0224F844:
	mov r0, #2
	pop {r3, pc}
_0224F848:
	mov r0, #1
	pop {r3, pc}
_0224F84C:
	mov r0, #7
	pop {r3, pc}
_0224F850:
	mov r0, #6
	pop {r3, pc}
_0224F854:
	mov r0, #5
	pop {r3, pc}
_0224F858:
	mov r0, #3
	pop {r3, pc}
_0224F85C:
	bl GF_AssertFail
	mov r0, #8
	pop {r3, pc}
	thumb_func_end ov02_0224F820

	thumb_func_start ov02_0224F864
ov02_0224F864: ; 0x0224F864
	push {r4, lr}
	ldr r1, _0224F87C ; =0x00000884
	bl AllocFromHeap
	ldr r2, _0224F87C ; =0x00000884
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	nop
_0224F87C: .word 0x00000884
	thumb_func_end ov02_0224F864

	thumb_func_start ov02_0224F880
ov02_0224F880: ; 0x0224F880
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r2, r1, #0
	ldr r0, _0224F8E4 ; =0x000007E4
	mov r1, #0xdf
	add r0, r4, r0
	sub r2, r2, #1
	bl ReadWholeNarcMemberByIdPair
	ldr r0, _0224F8E8 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add r2, r0, #1
	strb r1, [r4, r2]
	add r2, r0, #3
	strb r1, [r4, r2]
	add r2, r0, #4
	ldrb r3, [r4, r2]
	mov r2, #0xf
	add r5, r4, #0
	bic r3, r2
	add r2, r0, #4
	strb r3, [r4, r2]
	add r2, r0, #2
	strb r1, [r4, r2]
	add r2, r0, #5
	strb r1, [r4, r2]
	add r0, r0, #6
	strh r1, [r4, r0]
	ldr r0, _0224F8E4 ; =0x000007E4
	ldr r2, _0224F8EC ; =0x0000FFFF
_0224F8BE:
	ldrh r3, [r5, r0]
	cmp r3, r2
	beq _0224F8CC
	add r1, r1, #1
	add r5, #8
	cmp r1, #5
	blt _0224F8BE
_0224F8CC:
	ldr r3, _0224F8F0 ; =0x0000086C
	lsl r1, r1, #0x18
	ldrb r0, [r4, r3]
	lsr r1, r1, #0x18
	mov r2, #0xf0
	lsl r1, r1, #0x1c
	bic r0, r2
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, r3]
	pop {r3, r4, r5, pc}
	nop
_0224F8E4: .word 0x000007E4
_0224F8E8: .word 0x00000868
_0224F8EC: .word 0x0000FFFF
_0224F8F0: .word 0x0000086C
	thumb_func_end ov02_0224F880

	thumb_func_start ov02_0224F8F4
ov02_0224F8F4: ; 0x0224F8F4
	ldr r3, _0224F8F8 ; =FreeToHeap
	bx r3
	.balign 4, 0
_0224F8F8: .word FreeToHeap
	thumb_func_end ov02_0224F8F4

	thumb_func_start ov02_0224F8FC
ov02_0224F8FC: ; 0x0224F8FC
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _0224FB2C ; =0x0000086C
	add r4, r1, #0
	ldrb r3, [r4, r2]
	add r5, r0, #0
	lsl r2, r3, #0x1c
	lsr r2, r2, #0x1c
	mov ip, r2
	cmp r2, #5
	blo _0224F93E
	bl ov02_02250504
	ldr r1, _0224FB30 ; =0x0000080C
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0224F920
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0224F920:
	add r0, r1, #0
	add r0, #0xa
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0224F92E
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0224F92E:
	add r1, #0xb
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0224F93A
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0224F93A:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224F93E:
	ldr r2, _0224FB2C ; =0x0000086C
	sub r2, #0x88
	add r7, r4, r2
	mov r2, ip
	lsl r2, r2, #3
	add r6, r7, r2
	ldrh r7, [r7, r2]
	ldr r2, _0224FB34 ; =0x0000FFFF
	cmp r7, r2
	bne _0224F980
	bl ov02_02250504
	ldr r1, _0224FB30 ; =0x0000080C
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0224F962
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0224F962:
	add r0, r1, #0
	add r0, #0xa
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0224F970
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0224F970:
	add r1, #0xb
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0224F97C
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0224F97C:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224F980:
	ldr r2, _0224FB2C ; =0x0000086C
	sub r2, r2, #3
	ldrb r2, [r4, r2]
	cmp r2, #7
	bls _0224F98C
	b _0224FB28
_0224F98C:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0224F998: ; jump table
	.short _0224F9A8 - _0224F998 - 2 ; case 0
	.short _0224F9CA - _0224F998 - 2 ; case 1
	.short _0224F9E8 - _0224F998 - 2 ; case 2
	.short _0224FA06 - _0224F998 - 2 ; case 3
	.short _0224FA1A - _0224F998 - 2 ; case 4
	.short _0224FA3E - _0224F998 - 2 ; case 5
	.short _0224FA50 - _0224F998 - 2 ; case 6
	.short _0224FAEE - _0224F998 - 2 ; case 7
_0224F9A8:
	add r0, r4, #0
	add r1, r6, #0
	bl ov02_0224FB44
	cmp r0, #0
	beq _0224F9CA
	add r5, #0xe4
	ldr r0, [r5]
	bl MapObject_UnpauseMovement
	ldr r0, _0224FB38 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #5
	add r0, r0, #1
	strb r1, [r4, r0]
	b _0224FB28
_0224F9CA:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov02_0224FB54
	cmp r0, #0
	beq _0224F9E8
	add r5, #0xe4
	ldr r0, [r5]
	bl MapObject_UnpauseMovement
	ldr r0, _0224FB3C ; =0x00000869
	mov r1, #2
	strb r1, [r4, r0]
	b _0224FB28
_0224F9E8:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl FollowPoke_TryPrintInteractionMessage
	cmp r0, #0
	beq _0224FA06
	add r5, #0xe4
	ldr r0, [r5]
	bl MapObject_PauseMovement
	ldr r0, _0224FB3C ; =0x00000869
	mov r1, #6
	strb r1, [r4, r0]
	b _0224FB28
_0224FA06:
	add r0, r4, #0
	add r1, r6, #0
	bl ov02_0224FC74
	cmp r0, #0
	beq _0224FA1A
	ldr r0, _0224FB3C ; =0x00000869
	mov r1, #7
	strb r1, [r4, r0]
	b _0224FB28
_0224FA1A:
	ldr r2, _0224FB2C ; =0x0000086C
	mov r1, #0xf
	ldrb r3, [r4, r2]
	add r0, r3, #0
	bic r0, r1
	lsl r1, r3, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r4, r2]
	mov r1, #0
	sub r0, r2, #3
	strb r1, [r4, r0]
	b _0224FB28
_0224FA3E:
	add r2, r7, #0
	bl ov02_02250004
	cmp r0, #0
	beq _0224FB28
	ldr r0, _0224FB3C ; =0x00000869
	mov r1, #1
	strb r1, [r4, r0]
	b _0224FB28
_0224FA50:
	ldr r0, _0224FB2C ; =0x0000086C
	add r0, r0, #2
	ldrh r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #1
	bne _0224FB28
	ldr r1, _0224FB2C ; =0x0000086C
	ldrb r2, [r4, r1]
	lsl r0, r2, #0x18
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	lsr r0, r0, #0x1c
	add r2, r2, #1
	cmp r0, r2
	ble _0224FAA8
	ldr r0, _0224FB40 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0224FB28
	add r0, r4, #0
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl RemoveWindow
	ldr r0, [r4, #0x10]
	bl String_dtor
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	bic r1, r0
	strb r1, [r5]
	ldr r0, _0224FB3C ; =0x00000869
	mov r1, #3
	strb r1, [r4, r0]
	b _0224FB28
_0224FAA8:
	add r0, r1, #0
	sub r0, #0x60
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224FABA
	mov r2, #3
	sub r0, r1, #3
	strb r2, [r4, r0]
	b _0224FB28
_0224FABA:
	ldr r0, _0224FB40 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0224FB28
	add r0, r4, #0
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl RemoveWindow
	ldr r0, [r4, #0x10]
	bl String_dtor
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	bic r1, r0
	strb r1, [r5]
	ldr r0, _0224FB3C ; =0x00000869
	mov r1, #3
	strb r1, [r4, r0]
	b _0224FB28
_0224FAEE:
	ldr r0, _0224FB2C ; =0x0000086C
	add r0, r0, #1
	ldrb r1, [r4, r0]
	ldrb r0, [r6, #7]
	cmp r1, r0
	blo _0224FB1A
	mov r0, #0xf
	bic r3, r0
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0xf
	and r0, r1
	add r1, r3, #0
	orr r1, r0
	ldr r0, _0224FB2C ; =0x0000086C
	strb r1, [r4, r0]
	mov r1, #0
	sub r0, r0, #3
	strb r1, [r4, r0]
	b _0224FB28
_0224FB1A:
	ldr r0, _0224FB2C ; =0x0000086C
	add r0, r0, #1
	ldrb r0, [r4, r0]
	add r1, r0, #1
	ldr r0, _0224FB2C ; =0x0000086C
	add r0, r0, #1
	strb r1, [r4, r0]
_0224FB28:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224FB2C: .word 0x0000086C
_0224FB30: .word 0x0000080C
_0224FB34: .word 0x0000FFFF
_0224FB38: .word 0x00000868
_0224FB3C: .word 0x00000869
_0224FB40: .word gSystem
	thumb_func_end ov02_0224F8FC

	thumb_func_start ov02_0224FB44
ov02_0224FB44: ; 0x0224FB44
	ldrh r0, [r1]
	cmp r0, #0
	beq _0224FB4E
	mov r0, #1
	bx lr
_0224FB4E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov02_0224FB44

	thumb_func_start ov02_0224FB54
ov02_0224FB54: ; 0x0224FB54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, _0224FB98 ; =0x00000882
	add r4, r2, #0
	ldrh r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BB04
	cmp r0, #0
	beq _0224FB74
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224FB74:
	ldrb r2, [r4, #6]
	cmp r2, #0
	beq _0224FB92
	cmp r2, #0xe
	bls _0224FB82
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224FB82:
	add r0, r5, #0
	add r5, #0xe4
	ldr r1, [r5]
	sub r2, r2, #1
	bl ov01_02203AB4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224FB92:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0224FB98: .word 0x00000882
	thumb_func_end ov02_0224FB54

	thumb_func_start FollowPoke_TryPrintInteractionMessage
FollowPoke_TryPrintInteractionMessage: ; 0x0224FB9C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	ldrh r0, [r6, #2]
	add r4, r1, #0
	cmp r0, #0
	beq _0224FC00
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	ldr r0, [r5, #8]
	add r1, r4, #0
	mov r2, #3
	bl sub_0205B514
	ldrh r3, [r6, #2]
	ldr r1, [r4, #0x10]
	add r0, r5, #0
	mov r2, #0xb
	sub r3, r3, #1
	bl FollowPoke_ExpandInteractionMessage
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205B564
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl sub_0205B5B4
	ldr r1, _0224FC04 ; =0x0000086E
	strh r0, [r4, r1]
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0224FC00:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224FC04: .word 0x0000086E
	thumb_func_end FollowPoke_TryPrintInteractionMessage

	thumb_func_start ov02_0224FC08
ov02_0224FC08: ; 0x0224FC08
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	lsl r0, r0, #0xa
	mov r1, #0xb
	add r6, r2, #0
	bl String_ctor
	str r0, [r4, #0x10]
	ldr r0, [r5, #8]
	add r1, r4, #0
	mov r2, #3
	bl sub_0205B514
	ldr r0, _0224FC6C ; =0x00000816
	mov r2, #0xb
	ldrb r0, [r4, r0]
	add r3, r6, #0
	str r0, [sp]
	ldr r1, [r4, #0x10]
	add r0, r5, #0
	bl ov02_0224FCE0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205B564
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl sub_0205B5B4
	ldr r1, _0224FC70 ; =0x0000086E
	strh r0, [r4, r1]
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	orr r0, r1
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0224FC6C: .word 0x00000816
_0224FC70: .word 0x0000086E
	thumb_func_end ov02_0224FC08

	thumb_func_start ov02_0224FC74
ov02_0224FC74: ; 0x0224FC74
	ldr r2, _0224FC88 ; =0x0000086D
	mov r3, #0
	strb r3, [r0, r2]
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _0224FC82
	mov r3, #1
_0224FC82:
	add r0, r3, #0
	bx lr
	nop
_0224FC88: .word 0x0000086D
	thumb_func_end ov02_0224FC74

	thumb_func_start FollowPoke_ExpandInteractionMessage
FollowPoke_ExpandInteractionMessage: ; 0x0224FC8C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	mov r1, #0x1b
	add r4, r2, #0
	add r2, r1, #0
	add r6, r0, #0
	add r7, r3, #0
	mov r0, #0
	add r2, #0xee
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r5, r0, #0
	add r0, r4, #0
	bl ScrStrBufs_new
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl FollowPoke_PlaceholdersSet
	add r0, r5, #0
	add r1, r7, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r1, [sp]
	add r0, r4, #0
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r5, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end FollowPoke_ExpandInteractionMessage

	thumb_func_start ov02_0224FCE0
ov02_0224FCE0: ; 0x0224FCE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	str r1, [sp]
	add r6, r3, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x28
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r7, r0, #0
	add r0, r4, #0
	bl ScrStrBufs_new
	add r4, r0, #0
	mov r0, #2
	tst r0, r6
	ldr r0, [r5, #0xc]
	beq _0224FD3E
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl BufferPlayersName
	mov r1, #1
	add r0, r6, #0
	tst r0, r1
	add r2, sp, #0x10
	beq _0224FD30
	ldrb r2, [r2, #0x10]
	add r0, r4, #0
	sub r2, r2, #1
	bl BufferFashionName
	mov r1, #0x20
	b _0224FD72
_0224FD30:
	ldrb r2, [r2, #0x10]
	add r0, r4, #0
	sub r2, r2, #1
	bl BufferFashionNameWithArticle
	mov r1, #0x5f
	b _0224FD72
_0224FD3E:
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	bl Mon_GetBoxMon
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl BufferPlayersName
	ldr r2, [sp, #4]
	add r0, r4, #0
	mov r1, #1
	bl BufferBoxMonNickname
	mov r0, #1
	tst r0, r6
	beq _0224FD70
	mov r1, #0x61
	b _0224FD72
_0224FD70:
	mov r1, #0x62
_0224FD72:
	add r0, r7, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, [sp]
	add r0, r4, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r7, #0
	bl DestroyMsgData
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224FCE0

	thumb_func_start ov02_0224FD9C
ov02_0224FD9C: ; 0x0224FD9C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, sp, #0
	bl MapObject_GetPositionVec
	mov r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0224FDBC
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
_0224FDBC:
	mov r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0224FDDC
	add r0, r4, #0
	bl FollowPokeObj_GetSpecies
	cmp r0, #0x32
	beq _0224FDDC
	cmp r0, #0x33
	beq _0224FDDC
	mov r1, #3
	ldrsb r1, [r5, r1]
	add r0, r4, #0
	bl ov01_021F8F74
_0224FDDC:
	mov r0, #4
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0224FDEC
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
_0224FDEC:
	add r0, r4, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov02_0224FD9C

	thumb_func_start ov02_0224FDF8
ov02_0224FDF8: ; 0x0224FDF8
	push {r4, lr}
	sub sp, #8
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0224FE32
	cmp r1, #0
	beq _0224FE32
	ldr r0, _0224FE38 ; =SEQ_SE_END
	cmp r1, r0
	bls _0224FE2C
	add r0, r0, #1
	cmp r1, r0
	bne _0224FE16
	mov r0, #0
	b _0224FE18
_0224FE16:
	mov r0, #0xb
_0224FE18:
	ldr r4, _0224FE3C ; =0x000001FF
	add r1, r2, #0
	str r4, [sp]
	str r3, [sp, #4]
	add r2, r4, #0
	add r3, r4, #0
	bl PlayCryEx
	add sp, #8
	pop {r4, pc}
_0224FE2C:
	add r0, r1, #0
	bl PlaySE
_0224FE32:
	add sp, #8
	pop {r4, pc}
	nop
_0224FE38: .word SEQ_SE_END
_0224FE3C: .word 0x000001FF
	thumb_func_end ov02_0224FDF8

	thumb_func_start ov02_0224FE40
ov02_0224FE40: ; 0x0224FE40
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldrb r0, [r5]
	add r4, r2, #0
	cmp r0, #0
	beq _0224FE6C
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	ldrb r1, [r5]
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r4, #0
	sub r1, r1, #1
	bl MapObject_ForceSetFacingDirection
	add r0, r7, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov02_0224FE70
_0224FE6C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224FE40

	thumb_func_start ov02_0224FE70
ov02_0224FE70: ; 0x0224FE70
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _0224FEFC
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r6, r0
	beq _0224FEFC
	ldr r0, _0224FF00 ; =0x0000087C
	ldrb r0, [r5, r0]
	cmp r0, #2
	beq _0224FE9E
	cmp r0, #3
	bne _0224FEFC
_0224FE9E:
	add r0, r4, #0
	bl MapObject_GetFieldSysPtr
	ldr r1, _0224FF00 ; =0x0000087C
	add r6, r0, #0
	ldrb r1, [r5, r1]
	add r0, r4, #0
	add r2, sp, #8
	add r3, sp, #4
	bl ov02_0224FF04
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r6, #0
	bl GetMetatileBehaviorAt
	add r5, r0, #0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6E8
	cmp r0, #1
	bne _0224FEE0
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0224FEE0:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _0224FEFC
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	bl ov01_021FF964
_0224FEFC:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0224FF00: .word 0x0000087C
	thumb_func_end ov02_0224FE70

	thumb_func_start ov02_0224FF04
ov02_0224FF04: ; 0x0224FF04
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r2, #0
	add r6, r1, #0
	add r5, r3, #0
	bl MapObject_GetCurrentX
	str r0, [r4]
	add r0, r7, #0
	bl MapObject_GetCurrentY
	str r0, [r5]
	cmp r6, #3
	bhi _0224FF54
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224FF2C: ; jump table
	.short _0224FF34 - _0224FF2C - 2 ; case 0
	.short _0224FF3C - _0224FF2C - 2 ; case 1
	.short _0224FF44 - _0224FF2C - 2 ; case 2
	.short _0224FF4C - _0224FF2C - 2 ; case 3
_0224FF34:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0224FF3C:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0224FF44:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0224FF4C:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0224FF54:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0224FF04

	thumb_func_start ov02_0224FF5C
ov02_0224FF5C: ; 0x0224FF5C
	push {r4, r5, r6, lr}
	ldr r3, _0224FFCC ; =0x00000818
	add r5, r0, #0
	add r2, r3, #0
	add r2, #0x53
	ldrb r2, [r5, r2]
	add r0, r5, r3
	add r3, #0x52
	lsl r2, r2, #3
	add r4, r0, r2
	ldrb r0, [r5, r3]
	add r6, r1, #0
	cmp r0, #0
	bne _0224FFA8
	add r0, r4, #0
	bl ov02_0224FD9C
	ldr r3, _0224FFD0 ; =0x0000086C
	add r0, r4, #0
	ldrb r1, [r5, r3]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x19
	add r2, r5, r1
	add r1, r3, #0
	sub r1, #0x84
	ldrh r1, [r2, r1]
	add r2, r3, #0
	add r2, #0x12
	add r3, #0x11
	ldrh r2, [r5, r2]
	ldrb r3, [r5, r3]
	bl ov02_0224FDF8
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov02_0224FE40
_0224FFA8:
	ldr r1, _0224FFD4 ; =0x0000086A
	ldrb r0, [r5, r1]
	add r0, r0, #1
	strb r0, [r5, r1]
	ldrb r2, [r5, r1]
	ldrb r0, [r4, #1]
	cmp r2, r0
	blo _0224FFC6
	add r0, r1, #1
	ldrb r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #1
	strb r2, [r5, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0224FFC6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0224FFCC: .word 0x00000818
_0224FFD0: .word 0x0000086C
_0224FFD4: .word 0x0000086A
	thumb_func_end ov02_0224FF5C

	thumb_func_start ov02_0224FFD8
ov02_0224FFD8: ; 0x0224FFD8
	ldr r2, _02250000 ; =0x0000086B
	ldrb r1, [r0, r2]
	cmp r1, #0xa
	blo _0224FFE4
	mov r0, #0
	bx lr
_0224FFE4:
	lsl r1, r1, #3
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x53
	ldrb r1, [r3, r1]
	cmp r1, #0xff
	bne _0224FFF6
	mov r0, #0
	bx lr
_0224FFF6:
	mov r3, #0
	sub r1, r2, #1
	strb r3, [r0, r1]
	mov r0, #1
	bx lr
	.balign 4, 0
_02250000: .word 0x0000086B
	thumb_func_end ov02_0224FFD8

	thumb_func_start ov02_02250004
ov02_02250004: ; 0x02250004
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #0
	bne _02250016
	bl GF_AssertFail
	mov r0, #1
	pop {r4, r5, r6, pc}
_02250016:
	ldr r0, _02250108 ; =0x00000868
	ldrb r1, [r4, r0]
	cmp r1, #4
	bhi _02250102
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225002A: ; jump table
	.short _02250034 - _0225002A - 2 ; case 0
	.short _02250040 - _0225002A - 2 ; case 1
	.short _02250082 - _0225002A - 2 ; case 2
	.short _02250098 - _0225002A - 2 ; case 3
	.short _022500AE - _0225002A - 2 ; case 4
_02250034:
	sub r0, #0x50
	add r0, r4, r0
	mov r1, #0xe0
	sub r2, r2, #1
	bl ReadWholeNarcMemberByIdPair
_02250040:
	add r0, r5, #0
	add r0, #0xe4
	mov r1, #0x87
	lsl r1, r1, #4
	ldr r0, [r0]
	add r1, r4, r1
	bl MapObject_GetPositionVec
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_GetFacingDirection
	ldr r1, _0225010C ; =0x0000087C
	strb r0, [r4, r1]
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	bl ov01_021F8F68
	add r5, #0xe4
	ldr r0, [r5]
	mov r1, #1
	bl ov01_021F8F08
	ldr r0, _02250108 ; =0x00000868
	mov r1, #2
	strb r1, [r4, r0]
	mov r1, #0
	add r0, r0, #3
	strb r1, [r4, r0]
	b _02250102
_02250082:
	add r0, r4, #0
	bl ov02_0224FFD8
	cmp r0, #0
	ldr r0, _02250108 ; =0x00000868
	bne _02250094
	mov r1, #4
	strb r1, [r4, r0]
	b _02250102
_02250094:
	mov r1, #3
	strb r1, [r4, r0]
_02250098:
	add r5, #0xe4
	ldr r1, [r5]
	add r0, r4, #0
	bl ov02_0224FF5C
	cmp r0, #0
	beq _02250102
	ldr r0, _02250108 ; =0x00000868
	mov r1, #2
	strb r1, [r4, r0]
	b _02250102
_022500AE:
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	bl ov01_021F8F68
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	bl ov01_021F8F08
	add r0, r5, #0
	add r0, #0xe4
	mov r1, #0x87
	lsl r1, r1, #4
	ldr r0, [r0]
	add r1, r4, r1
	bl MapObject_SetPositionVec
	ldr r1, _0225010C ; =0x0000087C
	add r0, r5, #0
	add r0, #0xe4
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl MapObject_ForceSetFacingDirection
	add r5, #0xe4
	ldr r1, [r5]
	add r0, r4, #0
	add r2, r6, #0
	bl ov02_0224FE70
	mov r0, #1
	pop {r4, r5, r6, pc}
_02250102:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02250108: .word 0x00000868
_0225010C: .word 0x0000087C
	thumb_func_end ov02_02250004

	thumb_func_start Task_FollowPokeInteract
Task_FollowPokeInteract: ; 0x02250110
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #5
	bls _0225012A
	b _0225047E
_0225012A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02250136: ; jump table
	.short _02250142 - _02250136 - 2 ; case 0
	.short _0225015C - _02250136 - 2 ; case 1
	.short _022501A2 - _02250136 - 2 ; case 2
	.short _02250314 - _02250136 - 2 ; case 3
	.short _02250378 - _02250136 - 2 ; case 4
	.short _02250418 - _02250136 - 2 ; case 5
_02250142:
	add r0, r4, #0
	bl ov02_0224EF94
	add r1, r0, #0
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov02_0224F880
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225047E
_0225015C:
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov02_0224F8FC
	cmp r0, #1
	bne _02250178
	add r4, #0xe4
	ldr r0, [r4]
	bl MapObject_PauseMovement
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02250178:
	cmp r0, #2
	bne _0225018E
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 ; =0x00000869
	mov r2, #0xa
	strb r2, [r1, r0]
	mov r0, #2
	str r0, [r6]
	b _0225047E
_0225018E:
	cmp r0, #3
	bne _02250198
	mov r0, #3
	str r0, [r6]
	b _0225047E
_02250198:
	cmp r0, #4
	bne _02250270
	mov r0, #4
	str r0, [r6]
	b _0225047E
_022501A2:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 ; =0x00000869
	ldrb r0, [r1, r0]
	sub r0, #0xa
	cmp r0, #3
	bhi _02250270
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022501BE: ; jump table
	.short _022501C6 - _022501BE - 2 ; case 0
	.short _022501DE - _022501BE - 2 ; case 1
	.short _02250218 - _022501BE - 2 ; case 2
	.short _02250246 - _022501BE - 2 ; case 3
_022501C6:
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov01_021F6A9C
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 ; =0x00000869
	mov r2, #0xb
	strb r2, [r1, r0]
	b _0225047E
_022501DE:
	add r0, r4, #0
	bl ov01_021F6B00
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F6B10
	cmp r5, #3
	bne _02250270
	cmp r0, #1
	bne _02250270
	mov r3, #0x12
	lsl r3, r3, #4
	ldr r5, [r4, r3]
	mov r3, #0x22
	mov r1, #3
	lsl r3, r3, #6
	add r0, r4, #0
	add r2, r1, #0
	add r3, r5, r3
	bl ov01_021F6ABC
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 ; =0x00000869
	mov r2, #0xc
	strb r2, [r1, r0]
	b _0225047E
_02250218:
	add r0, r4, #0
	bl ov01_021F6B00
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F6AEC
	cmp r5, #3
	bne _02250270
	cmp r0, #6
	bne _02250270
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov01_021F6A9C
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250484 ; =0x00000869
	mov r2, #0xd
	strb r2, [r1, r0]
	b _0225047E
_02250246:
	add r0, r4, #0
	bl ov01_021F6B00
	add r5, r0, #0
	add r0, r4, #0
	bl ov01_021F6B10
	cmp r5, #0
	bne _02250270
	cmp r0, #1
	bne _02250270
	mov r0, #0x12
	lsl r0, r0, #4
	mov r1, #0x22
	ldr r0, [r4, r0]
	lsl r1, r1, #6
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _02250272
	cmp r1, #1
	beq _022502C4
_02250270:
	b _0225047E
_02250272:
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl RemoveWindow
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x10]
	bl String_dtor
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	bic r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	mov r0, #0x12
	lsl r0, r0, #4
	mov r1, #0x81
	ldr r0, [r4, r0]
	lsl r1, r1, #4
	ldrh r1, [r0, r1]
	cmp r1, #0
	bne _022502BA
	add r4, #0xe4
	ldr r0, [r4]
	bl MapObject_PauseMovement
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022502BA:
	bl ov02_0224F880
	mov r0, #1
	str r0, [r6]
	b _0225047E
_022502C4:
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl RemoveWindow
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x10]
	bl String_dtor
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	bic r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, _02250488 ; =0x00000812
	ldrh r1, [r0, r1]
	cmp r1, #0
	bne _0225030A
	add r4, #0xe4
	ldr r0, [r4]
	bl MapObject_PauseMovement
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225030A:
	bl ov02_0224F880
	mov r0, #1
	str r0, [r6]
	b _0225047E
_02250314:
	ldr r0, [r4, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	add r7, r0, #0
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _0225048C ; =0x00000816
	ldrb r0, [r1, r0]
	sub r5, r0, #1
	bmi _02250332
	cmp r5, #0x64
	blt _02250336
_02250332:
	bl GF_AssertFail
_02250336:
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0202BA2C
	cmp r0, #0
	beq _02250364
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0202BB08
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #3
	bl ov02_0224FC08
	ldr r0, _02250490 ; =SEQ_ME_ACCE
	bl PlayFanfare
	b _02250372
_02250364:
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #2
	bl ov02_0224FC08
_02250372:
	mov r0, #5
	str r0, [r6]
	b _0225047E
_02250378:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250494 ; =0x00000817
	ldrb r0, [r1, r0]
	cmp r0, #5
	bhi _022503B2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02250392: ; jump table
	.short _022503B2 - _02250392 - 2 ; case 0
	.short _0225039E - _02250392 - 2 ; case 1
	.short _022503A2 - _02250392 - 2 ; case 2
	.short _022503A6 - _02250392 - 2 ; case 3
	.short _022503AA - _02250392 - 2 ; case 4
	.short _022503AE - _02250392 - 2 ; case 5
_0225039E:
	mov r5, #0xb5
	b _022503BA
_022503A2:
	mov r5, #0xb6
	b _022503BA
_022503A6:
	mov r5, #0xb7
	b _022503BA
_022503AA:
	mov r5, #0xb8
	b _022503BA
_022503AE:
	mov r5, #0xb9
	b _022503BA
_022503B2:
	bl GF_AssertFail
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022503BA:
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	add r1, r5, #0
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bne _02250404
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl SetFlag99C
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0]
	add r0, r7, #0
	add r1, r5, #0
	add r2, sp, #0
	bl SetMonData
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	bl ov02_0224FC08
	ldr r0, _02250490 ; =SEQ_ME_ACCE
	bl PlayFanfare
	b _02250412
_02250404:
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0
	bl ov02_0224FC08
_02250412:
	mov r0, #5
	str r0, [r6]
	b _0225047E
_02250418:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, _02250498 ; =0x0000086E
	ldrh r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #1
	bne _0225047E
	bl IsFanfarePlaying
	cmp r0, #0
	bne _0225047E
	ldr r0, _0225049C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0225047E
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl RemoveWindow
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x10]
	bl String_dtor
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	bic r1, r0
	add r0, r4, #0
	add r0, #0xd2
	add r4, #0xe4
	strb r1, [r0]
	ldr r0, [r4]
	bl MapObject_PauseMovement
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225047E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02250484: .word 0x00000869
_02250488: .word 0x00000812
_0225048C: .word 0x00000816
_02250490: .word SEQ_ME_ACCE
_02250494: .word 0x00000817
_02250498: .word 0x0000086E
_0225049C: .word gSystem
	thumb_func_end Task_FollowPokeInteract

	thumb_func_start FollowPoke_PlaceholdersSet
FollowPoke_PlaceholdersSet: ; 0x022504A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	add r6, r0, #0
	bl Mon_GetBoxMon
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0
	add r2, r7, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl BufferBoxMonSpeciesName
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl BufferPlayersName
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #3
	bl BufferLocationName
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #4
	bl BufferItemName
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end FollowPoke_PlaceholdersSet

	thumb_func_start ov02_02250504
ov02_02250504: ; 0x02250504
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	add r4, r0, #0
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl FsysUnkSub108_GetMonMood
	mov r1, #0x12
	str r0, [sp]
	lsl r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _0225058C ; =0x00000815
	ldrsb r1, [r2, r1]
	add r1, r0, r1
	str r1, [sp]
	cmp r1, #0x7f
	ble _02250538
	mov r0, #0x7f
	str r0, [sp]
	b _02250542
_02250538:
	mov r0, #0x7e
	mvn r0, r0
	cmp r1, r0
	bge _02250542
	str r0, [sp]
_02250542:
	mov r0, #0x42
	ldr r1, [sp]
	lsl r0, r0, #2
	lsl r1, r1, #0x18
	ldr r0, [r5, r0]
	asr r1, r1, #0x18
	bl FsysUnkSub108_SetMonMood
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	mov r1, #0x12
	str r0, [sp]
	lsl r1, r1, #4
	ldr r2, [r5, r1]
	ldr r1, _02250590 ; =0x00000814
	ldrsb r1, [r2, r1]
	add r0, r0, r1
	str r0, [sp]
	cmp r0, #0xff
	ble _02250576
	mov r0, #0xff
	str r0, [sp]
	b _0225057E
_02250576:
	cmp r0, #0
	bge _0225057E
	mov r0, #0
	str r0, [sp]
_0225057E:
	add r0, r4, #0
	mov r1, #9
	add r2, sp, #0
	bl SetMonData
	pop {r3, r4, r5, pc}
	nop
_0225058C: .word 0x00000815
_02250590: .word 0x00000814
	thumb_func_end ov02_02250504

	thumb_func_start ov02_02250594
ov02_02250594: ; 0x02250594
	cmp r0, #0xa
	bhi _02250622
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022505A4: ; jump table
	.short _02250622 - _022505A4 - 2 ; case 0
	.short _022505BA - _022505A4 - 2 ; case 1
	.short _022505C2 - _022505A4 - 2 ; case 2
	.short _022505CE - _022505A4 - 2 ; case 3
	.short _022505DA - _022505A4 - 2 ; case 4
	.short _022505E6 - _022505A4 - 2 ; case 5
	.short _022505F2 - _022505A4 - 2 ; case 6
	.short _022505FE - _022505A4 - 2 ; case 7
	.short _0225060A - _022505A4 - 2 ; case 8
	.short _02250612 - _022505A4 - 2 ; case 9
	.short _0225061A - _022505A4 - 2 ; case 10
_022505BA:
	cmp r1, #0xff
	bne _02250622
	mov r0, #1
	bx lr
_022505C2:
	cmp r1, #0xc8
	blt _02250622
	cmp r1, #0xff
	bge _02250622
	mov r0, #1
	bx lr
_022505CE:
	cmp r1, #0x96
	blt _02250622
	cmp r1, #0xc8
	bge _02250622
	mov r0, #1
	bx lr
_022505DA:
	cmp r1, #0x5a
	blt _02250622
	cmp r1, #0x96
	bge _02250622
	mov r0, #1
	bx lr
_022505E6:
	cmp r1, #0x3c
	blt _02250622
	cmp r1, #0x5a
	bge _02250622
	mov r0, #1
	bx lr
_022505F2:
	cmp r1, #0x1e
	blt _02250622
	cmp r1, #0x3c
	bge _02250622
	mov r0, #1
	bx lr
_022505FE:
	cmp r1, #1
	blt _02250622
	cmp r1, #0x1e
	bge _02250622
	mov r0, #1
	bx lr
_0225060A:
	cmp r1, #0
	bne _02250622
	mov r0, #1
	bx lr
_02250612:
	cmp r1, #0x5a
	blt _02250622
	mov r0, #1
	bx lr
_0225061A:
	cmp r1, #0x3c
	bge _02250622
	mov r0, #1
	bx lr
_02250622:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov02_02250594

	thumb_func_start ov02_02250628
ov02_02250628: ; 0x02250628
	cmp r0, #0xa
	bhi _022506CE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02250638: ; jump table
	.short _022506CE - _02250638 - 2 ; case 0
	.short _0225064E - _02250638 - 2 ; case 1
	.short _02250656 - _02250638 - 2 ; case 2
	.short _02250662 - _02250638 - 2 ; case 3
	.short _0225066E - _02250638 - 2 ; case 4
	.short _0225067A - _02250638 - 2 ; case 5
	.short _0225068A - _02250638 - 2 ; case 6
	.short _0225069C - _02250638 - 2 ; case 7
	.short _022506AE - _02250638 - 2 ; case 8
	.short _022506BA - _02250638 - 2 ; case 9
	.short _022506C2 - _02250638 - 2 ; case 10
_0225064E:
	cmp r1, #0x7f
	bne _022506CE
	mov r0, #1
	bx lr
_02250656:
	cmp r1, #0x64
	blt _022506CE
	cmp r1, #0x7f
	bge _022506CE
	mov r0, #1
	bx lr
_02250662:
	cmp r1, #0x32
	blt _022506CE
	cmp r1, #0x64
	bge _022506CE
	mov r0, #1
	bx lr
_0225066E:
	cmp r1, #0x1e
	blt _022506CE
	cmp r1, #0x32
	bge _022506CE
	mov r0, #1
	bx lr
_0225067A:
	mov r0, #0x1d
	mvn r0, r0
	cmp r1, r0
	ble _022506CE
	cmp r1, #0x1e
	bge _022506CE
	mov r0, #1
	bx lr
_0225068A:
	mov r0, #0x31
	mvn r0, r0
	cmp r1, r0
	ble _022506CE
	add r0, #0x14
	cmp r1, r0
	bgt _022506CE
	mov r0, #1
	bx lr
_0225069C:
	mov r0, #0x7e
	mvn r0, r0
	cmp r1, r0
	ble _022506CE
	add r0, #0x4d
	cmp r1, r0
	bgt _022506CE
	mov r0, #1
	bx lr
_022506AE:
	mov r0, #0x7e
	mvn r0, r0
	cmp r1, r0
	bne _022506CE
	mov r0, #1
	bx lr
_022506BA:
	cmp r1, #0
	blt _022506CE
	mov r0, #1
	bx lr
_022506C2:
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bgt _022506CE
	mov r0, #1
	bx lr
_022506CE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov02_02250628

	thumb_func_start ov02_022506D4
ov02_022506D4: ; 0x022506D4
	push {r3, lr}
	cmp r0, #0xf9
	bhi _022506E2
	cmp r0, r1
	bne _02250732
	mov r0, #1
	pop {r3, pc}
_022506E2:
	sub r0, #0xfa
	cmp r0, #4
	bhi _0225072A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022506F4: ; jump table
	.short _022506FE - _022506F4 - 2 ; case 0
	.short _02250706 - _022506F4 - 2 ; case 1
	.short _0225070E - _022506F4 - 2 ; case 2
	.short _0225071A - _022506F4 - 2 ; case 3
	.short _02250722 - _022506F4 - 2 ; case 4
_022506FE:
	cmp r1, #0x13
	bhi _02250732
	mov r0, #1
	pop {r3, pc}
_02250706:
	cmp r1, #0x82
	bhi _02250732
	mov r0, #1
	pop {r3, pc}
_0225070E:
	cmp r1, #0x8c
	blo _02250732
	cmp r1, #0x95
	bhi _02250732
	mov r0, #1
	pop {r3, pc}
_0225071A:
	cmp r1, #0xa0
	blo _02250732
	mov r0, #1
	pop {r3, pc}
_02250722:
	cmp r1, #0xdc
	blo _02250732
	mov r0, #1
	pop {r3, pc}
_0225072A:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02250732:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_022506D4

	thumb_func_start ov02_02250738
ov02_02250738: ; 0x02250738
	push {r4, r5}
	sub sp, #8
	ldr r4, _0225077C ; =ov02_02253A54
	add r2, sp, #0
	ldrb r5, [r4]
	add r3, sp, #0
	add r0, r2, r0
	strb r5, [r3]
	ldrb r5, [r4, #1]
	sub r0, r0, #1
	strb r5, [r3, #1]
	ldrb r5, [r4, #2]
	strb r5, [r3, #2]
	ldrb r5, [r4, #3]
	ldrb r4, [r4, #4]
	strb r5, [r3, #3]
	strb r4, [r3, #4]
	ldrb r0, [r0]
	mov r3, #0
	and r0, r1
_02250760:
	cmp r0, #0
	bne _0225076C
	add sp, #8
	mov r0, #1
	pop {r4, r5}
	bx lr
_0225076C:
	add r3, r3, #1
	cmp r3, #5
	blt _02250760
	mov r0, #0
	add sp, #8
	pop {r4, r5}
	bx lr
	nop
_0225077C: .word ov02_02253A54
	thumb_func_end ov02_02250738

	thumb_func_start ov02_02250780
ov02_02250780: ; 0x02250780
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	add r6, r0, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	cmp r4, r5
	beq _022507AC
	cmp r0, r5
	bne _022507B0
_022507AC:
	mov r0, #1
	pop {r4, r5, r6, pc}
_022507B0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02250780

	thumb_func_start ov02_022507B4
ov02_022507B4: ; 0x022507B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r4, r1, #0
	bl FollowPokeObj_GetSpecies
	sub r0, #0x32
	cmp r0, #1
	bls _022507E0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	strh r4, [r2]
	mov r0, #0
	strh r0, [r2, #2]
	ldr r0, [r5, #0x10]
	ldr r1, _022507E4 ; =ov02_022507E8
	bl TaskManager_Call
_022507E0:
	pop {r3, r4, r5, pc}
	nop
_022507E4: .word ov02_022507E8
	thumb_func_end ov02_022507B4

	thumb_func_start ov02_022507E8
ov02_022507E8: ; 0x022507E8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _022508AA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02250814: ; jump table
	.short _0225081E - _02250814 - 2 ; case 0
	.short _0225082E - _02250814 - 2 ; case 1
	.short _0225084C - _02250814 - 2 ; case 2
	.short _02250874 - _02250814 - 2 ; case 3
	.short _022508A0 - _02250814 - 2 ; case 4
_0225081E:
	add r0, r6, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_UnpauseMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0225082E:
	add r0, r6, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _022508AA
	add r6, #0xe4
	ldr r0, [r6]
	bl MapObject_PauseMovement
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _022508AA
_0225084C:
	add r0, r6, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	add r6, #0xe4
	mov r2, #0x14
	ldr r3, _022508B0 ; =ov02_02253A70
	mul r2, r1
	ldr r0, [r6]
	add r1, r3, r2
	bl EventObjectMovementMan_Create
	str r0, [r5, #4]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _022508AA
_02250874:
	ldr r0, [r5, #4]
	bl EventObjectMovementMan_IsFinish
	cmp r0, #1
	bne _022508AA
	ldr r0, [r5, #4]
	bl EventObjectMovementMan_Delete
	ldrh r0, [r5, #2]
	add r0, r0, #1
	strh r0, [r5, #2]
	ldrh r1, [r5, #2]
	ldrh r0, [r5]
	cmp r1, r0
	blo _0225089A
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _022508AA
_0225089A:
	mov r0, #0
	str r0, [r4]
	b _022508AA
_022508A0:
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_022508AA:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_022508B0: .word ov02_02253A70
	thumb_func_end ov02_022507E8

	thumb_func_start ov02_022508B4
ov02_022508B4: ; 0x022508B4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	strh r0, [r2]
	strh r0, [r2, #2]
	ldr r0, [r4, #0x10]
	ldr r1, _022508D4 ; =ov02_022508D8
	bl TaskManager_Call
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_022508D4: .word ov02_022508D8
	thumb_func_end ov02_022508B4

	thumb_func_start ov02_022508D8
ov02_022508D8: ; 0x022508D8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #3
	bls _022508FC
	b _02250A44
_022508FC:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02250908: ; jump table
	.short _02250910 - _02250908 - 2 ; case 0
	.short _0225099A - _02250908 - 2 ; case 1
	.short _022509AE - _02250908 - 2 ; case 2
	.short _02250A3A - _02250908 - 2 ; case 3
_02250910:
	ldr r3, _02250A4C ; =ov02_02253B24
	add r2, sp, #0xc
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	bl _dfltu
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02250A50 ; =0x40A00000
	mov r0, #0
	bl _dmul
	ldr r3, _02250A54 ; =0x40240000
	mov r2, #0
	bl _ddiv
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02250A58 ; =0x40B00000
	mov r0, #0
	bl _dadd
	bl _dfix
	str r0, [sp, #0xc]
	ldrh r0, [r4, #2]
	bl _dfltu
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02250A50 ; =0x40A00000
	mov r0, #0
	bl _dmul
	ldr r3, _02250A54 ; =0x40240000
	mov r2, #0
	bl _ddiv
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02250A58 ; =0x40B00000
	mov r0, #0
	bl _dadd
	bl _dfix
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x3c]
	bl ov01_021F771C
	add r1, sp, #0xc
	bl sub_02023E78
	ldrh r0, [r4, #2]
	cmp r0, #0xa
	blo _02250A44
	mov r0, #0
	strh r0, [r4, #2]
	strh r0, [r4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02250A44
_0225099A:
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0xa
	blo _02250A44
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02250A44
_022509AE:
	ldr r3, _02250A5C ; =ov02_02253B30
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	cmp r1, #0xa
	blo _022509CE
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02250A2C
_022509CE:
	mov r0, #0xa
	sub r0, r0, r1
	bl _dflt
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02250A50 ; =0x40A00000
	mov r0, #0
	bl _dmul
	ldr r3, _02250A54 ; =0x40240000
	mov r2, #0
	bl _ddiv
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02250A58 ; =0x40B00000
	mov r0, #0
	bl _dadd
	bl _dfix
	str r0, [sp]
	ldrh r1, [r4, #2]
	mov r0, #0xa
	sub r0, r0, r1
	bl _dflt
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02250A50 ; =0x40A00000
	mov r0, #0
	bl _dmul
	ldr r3, _02250A54 ; =0x40240000
	mov r2, #0
	bl _ddiv
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02250A58 ; =0x40B00000
	mov r0, #0
	bl _dadd
	bl _dfix
	str r0, [sp, #4]
_02250A2C:
	ldr r0, [r6, #0x3c]
	bl ov01_021F771C
	add r1, sp, #0
	bl sub_02023E78
	b _02250A44
_02250A3A:
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r4, r5, r6, pc}
_02250A44:
	mov r0, #0
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_02250A4C: .word ov02_02253B24
_02250A50: .word 0x40A00000
_02250A54: .word 0x40240000
_02250A58: .word 0x40B00000
_02250A5C: .word ov02_02253B30
	thumb_func_end ov02_022508D8

	thumb_func_start ov02_02250A60
ov02_02250A60: ; 0x02250A60
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x28
	bl AllocFromHeapAtEnd
	ldr r1, [r5, #4]
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x24]
	ldr r4, [r0, #0x24]
	mov r0, #4
	bl CreateCameraTranslationWrapper
	str r0, [r4, #8]
	ldr r0, _02250AC4 ; =gGameVersion
	ldrb r0, [r0]
	str r0, [r4, #0x24]
	ldr r1, [r5, #0x24]
	add r0, sp, #0xc
	bl GF_Camera_GetTarget
	add r3, sp, #0xc
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl sub_02023640
	add r3, sp, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	str r0, [r4]
	add r0, r4, #0
	bl ov02_02250BB0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_02250AC4: .word gGameVersion
	thumb_func_end ov02_02250A60

	thumb_func_start ov02_02250AC8
ov02_02250AC8: ; 0x02250AC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #8]
	bl DeleteCameraTranslationWrapper
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02250AC8

	thumb_func_start ov02_02250AE8
ov02_02250AE8: ; 0x02250AE8
	push {r3, lr}
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl ov01_021E687C
	mov r1, #1
	strb r1, [r0, #0x10]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02250AE8

	thumb_func_start ov02_02250AFC
ov02_02250AFC: ; 0x02250AFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl ov01_021E687C
	ldrb r1, [r0, #0x10]
	cmp r1, #3
	beq _02250B22
	bl GF_AssertFail
	ldr r0, [r5, #0x10]
	ldr r1, _02250B2C ; =ov02_02250B58
	mov r2, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
_02250B22:
	strb r4, [r0, #0x11]
	add r0, r5, #0
	bl ov02_02250B44
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02250B2C: .word ov02_02250B58
	thumb_func_end ov02_02250AFC

	thumb_func_start ov02_02250B30
ov02_02250B30: ; 0x02250B30
	ldr r3, _02250B3C ; =TaskManager_Call
	ldr r0, [r0, #0x10]
	ldr r1, _02250B40 ; =ov02_02251320
	mov r2, #0
	bx r3
	nop
_02250B3C: .word TaskManager_Call
_02250B40: .word ov02_02251320
	thumb_func_end ov02_02250B30

	thumb_func_start ov02_02250B44
ov02_02250B44: ; 0x02250B44
	push {r3, lr}
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl ov01_021E687C
	mov r1, #4
	strb r1, [r0, #0x10]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02250B44

	thumb_func_start ov02_02250B58
ov02_02250B58: ; 0x02250B58
	push {r4, lr}
	bl TaskManager_GetSys
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl ov01_021E687C
	ldrb r0, [r0, #0x10]
	cmp r0, #3
	bne _02250B7A
	add r0, r4, #0
	bl ov02_02250B44
	mov r0, #1
	pop {r4, pc}
_02250B7A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02250B58

	thumb_func_start ov02_02250B80
ov02_02250B80: ; 0x02250B80
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0xd8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	add r0, #0xd4
	str r1, [r0]
	mov r0, #4
	add r1, r5, #0
	add r2, r4, #0
	bl ov02_022511AC
	ldr r0, [r5, #0x10]
	ldr r1, _02250BAC ; =ov02_022512AC
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	nop
_02250BAC: .word ov02_022512AC
	thumb_func_end ov02_02250B80

	thumb_func_start ov02_02250BB0
ov02_02250BB0: ; 0x02250BB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, _02250BC0 ; =ov02_02253B4C
	bl ov01_021E67BC
	str r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
_02250BC0: .word ov02_02253B4C
	thumb_func_end ov02_02250BB0

	thumb_func_start ov02_02250BC4
ov02_02250BC4: ; 0x02250BC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r0, r1, #0
	ldr r0, [r0, #4]
	add r5, r2, #0
	ldr r0, [r0, #0x24]
	str r1, [sp, #8]
	ldr r0, [r0, #0x24]
	mov r1, #4
	strh r0, [r5, #0x12]
	add r0, r5, #0
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r5, #0
	add r0, #0x14
	mov r1, #0xae
	mov r2, #0x12
	mov r3, #4
	bl ov01_021FBCD8
	add r0, r5, #0
	add r0, #0x24
	mov r1, #0xae
	mov r2, #0x19
	mov r3, #4
	bl ov01_021FBCD8
	add r0, r5, #0
	add r0, #0x34
	mov r1, #0xae
	mov r2, #0x20
	mov r3, #4
	bl ov01_021FBCD8
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x44
	add r1, #0x14
	mov r2, #0xae
	mov r3, #0x13
	str r5, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x58
	add r1, #0x14
	mov r2, #0xae
	mov r3, #0x14
	str r5, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x6c
	add r1, #0x14
	mov r2, #0xae
	mov r3, #0x15
	str r5, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x80
	add r1, #0x24
	mov r2, #0xae
	mov r3, #0x1a
	str r5, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x94
	add r1, #0x24
	mov r2, #0xae
	mov r3, #0x1b
	str r5, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xa8
	add r1, #0x34
	mov r2, #0xae
	mov r3, #0x21
	str r5, [sp, #4]
	bl ov01_021FBE44
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xbc
	add r1, #0x14
	bl ov01_021FBF2C
	mov r0, #0x4d
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r5, r0
	add r1, #0x24
	bl ov01_021FBF2C
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xbc
	add r1, #0x44
	bl ov01_021FBF50
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xbc
	add r1, #0x58
	bl ov01_021FBF50
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xbc
	add r1, #0x6c
	bl ov01_021FBF50
	mov r0, #0x4d
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r5, r0
	add r1, #0x80
	bl ov01_021FBF50
	mov r0, #0x4d
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r5, r0
	add r1, #0x94
	bl ov01_021FBF50
	add r0, r5, #0
	add r0, #0xbc
	mov r1, #0
	bl ov01_021FC004
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov01_021FC004
	mov r0, #0x6b
	lsl r0, r0, #2
	add r4, r5, r0
	add r0, r5, #0
	str r0, [sp, #0xc]
	add r0, #0x34
	str r0, [sp, #0xc]
	add r0, r5, #0
	str r0, [sp, #0x10]
	add r0, #0xa8
	mov r6, #0
	str r0, [sp, #0x10]
_02250D16:
	mov r0, #0x78
	add r7, r6, #0
	mul r7, r0
	ldr r1, [sp, #0xc]
	add r0, r4, r7
	bl ov01_021FBF2C
	ldr r1, [sp, #0x10]
	add r0, r4, r7
	bl ov01_021FBF50
	add r0, r4, r7
	mov r1, #0
	bl ov01_021FC004
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	blo _02250D16
	add r0, r5, #0
	add r0, #0x44
	mov r1, #3
	mov r2, #0
	bl ov02_022510D4
	add r0, r5, #0
	add r0, #0x80
	mov r1, #2
	mov r2, #0
	bl ov02_022510D4
	add r0, r5, #0
	add r0, #0xa8
	mov r1, #1
	mov r2, #0
	bl ov02_022510D4
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x14
	bl MapObject_GetPositionVec
	add r0, r5, #0
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, #0xbc
	bl ov01_021FC00C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, r5, r0
	bl ov01_021FC00C
	ldrh r0, [r5, #0x12]
	cmp r0, #8
	bne _02250E04
	mov r2, #2
	ldr r1, [sp, #0x14]
	lsl r2, r2, #0x12
	add r1, r1, r2
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r3, [sp, #0x18]
	lsr r2, r2, #2
	add r2, r3, r2
	mov r3, #0x2d
	ldr r4, [sp, #0x1c]
	lsl r3, r3, #0xe
	add r0, r5, r0
	sub r3, r4, r3
	bl ov01_021FC00C
	mov r2, #2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [sp, #0x14]
	lsl r2, r2, #0x12
	sub r1, r1, r2
	ldr r3, [sp, #0x18]
	lsr r2, r2, #2
	add r2, r3, r2
	mov r3, #0x2d
	ldr r4, [sp, #0x1c]
	lsl r3, r3, #0xe
	add r0, r5, r0
	sub r3, r4, r3
	bl ov01_021FC00C
	mov r1, #0
	mov r0, #0xa7
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021FC00C
	mov r1, #0
	mov r0, #0xc5
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021FC00C
	ldr r0, _02250EA4 ; =0x00000131
	ldr r1, _02250EA8 ; =0x000004AC
	ldr r2, _02250EAC ; =ov02_02253C20
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	ldr r0, _02250EB0 ; =ov02_02253B94
	b _02250E98
_02250E04:
	mov r1, #0x32
	ldr r2, [sp, #0x14]
	lsl r1, r1, #0xe
	add r1, r2, r1
	mov r2, #0x49
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r3, [sp, #0x18]
	lsl r2, r2, #0xc
	sub r2, r3, r2
	mov r3, #9
	ldr r4, [sp, #0x1c]
	lsl r3, r3, #0x10
	add r0, r5, r0
	add r3, r4, r3
	bl ov01_021FC00C
	mov r1, #0xc6
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r2, [sp, #0x14]
	lsl r1, r1, #0xc
	sub r1, r2, r1
	mov r2, #0x49
	ldr r3, [sp, #0x18]
	lsl r2, r2, #0xc
	sub r2, r3, r2
	mov r3, #9
	ldr r4, [sp, #0x1c]
	lsl r3, r3, #0x10
	add r0, r5, r0
	add r3, r4, r3
	bl ov01_021FC00C
	mov r1, #0x32
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r2, [sp, #0x14]
	lsl r1, r1, #0xe
	add r1, r2, r1
	mov r2, #0x49
	ldr r3, [sp, #0x18]
	lsl r2, r2, #0xc
	sub r2, r3, r2
	ldr r4, [sp, #0x1c]
	ldr r3, _02250EB4 ; =0x0010E000
	add r0, r5, r0
	sub r3, r4, r3
	bl ov01_021FC00C
	mov r1, #0xc6
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r2, [sp, #0x14]
	lsl r1, r1, #0xc
	sub r1, r2, r1
	mov r2, #0x49
	ldr r3, [sp, #0x18]
	lsl r2, r2, #0xc
	sub r2, r3, r2
	ldr r4, [sp, #0x1c]
	ldr r3, _02250EB4 ; =0x0010E000
	add r0, r5, r0
	sub r3, r4, r3
	bl ov01_021FC00C
	mov r0, #0x13
	ldr r1, _02250EA8 ; =0x000004AC
	lsl r0, r0, #4
	str r0, [r5, r1]
	ldr r2, _02250EB8 ; =ov02_02253BD0
	add r0, r1, #4
	str r2, [r5, r0]
	ldr r0, _02250EBC ; =ov02_02253B64
_02250E98:
	add r1, #8
	str r0, [r5, r1]
	mov r0, #0
	strb r0, [r5, #0x10]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02250EA4: .word 0x00000131
_02250EA8: .word 0x000004AC
_02250EAC: .word ov02_02253C20
_02250EB0: .word ov02_02253B94
_02250EB4: .word 0x0010E000
_02250EB8: .word ov02_02253BD0
_02250EBC: .word ov02_02253B64
	thumb_func_end ov02_02250BC4

	thumb_func_start ov02_02250EC0
ov02_02250EC0: ; 0x02250EC0
	push {r4, lr}
	add r4, r2, #0
	add r0, r4, #0
	add r0, #0x6c
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x58
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x44
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x94
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x80
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0xa8
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x14
	bl ov01_021FBDA8
	add r0, r4, #0
	add r0, #0x24
	bl ov01_021FBDA8
	add r4, #0x34
	add r0, r4, #0
	bl ov01_021FBDA8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02250EC0

	thumb_func_start ov02_02250F1C
ov02_02250F1C: ; 0x02250F1C
	push {r4, lr}
	add r4, r2, #0
	ldrb r0, [r4, #0x10]
	cmp r0, #5
	bhi _02250FDC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02250F32: ; jump table
	.short _02250FDC - _02250F32 - 2 ; case 0
	.short _02250F3E - _02250F32 - 2 ; case 1
	.short _02250F4E - _02250F32 - 2 ; case 2
	.short _02250F68 - _02250F32 - 2 ; case 3
	.short _02250F74 - _02250F32 - 2 ; case 4
	.short _02250FA4 - _02250F32 - 2 ; case 5
_02250F3E:
	add r0, r4, #0
	add r0, #0xbc
	mov r1, #1
	bl ov01_021FC004
	mov r0, #2
	strb r0, [r4, #0x10]
	pop {r4, pc}
_02250F4E:
	add r0, r4, #0
	add r0, #0x44
	mov r1, #3
	bl ov02_022510FC
	cmp r0, #0
	beq _02250FDC
	add r0, r4, #0
	bl ov02_02251018
	mov r0, #3
	strb r0, [r4, #0x10]
	pop {r4, pc}
_02250F68:
	add r4, #0x44
	add r0, r4, #0
	mov r1, #3
	bl ov02_02251138
	pop {r4, pc}
_02250F74:
	add r0, r4, #0
	add r0, #0xbc
	mov r1, #0
	bl ov01_021FC004
	add r0, r4, #0
	mov r1, #1
	bl ov02_02251164
	add r0, r4, #0
	add r0, #0x80
	mov r1, #2
	mov r2, #0
	bl ov02_022510D4
	add r0, r4, #0
	add r0, #0xa8
	mov r1, #1
	mov r2, #0
	bl ov02_022510D4
	mov r0, #5
	strb r0, [r4, #0x10]
	pop {r4, pc}
_02250FA4:
	add r0, r4, #0
	add r0, #0x44
	mov r1, #3
	bl ov02_02251138
	add r0, r4, #0
	add r0, #0xa8
	mov r1, #1
	bl ov02_022510FC
	add r0, r4, #0
	add r0, #0x80
	mov r1, #2
	bl ov02_022510FC
	cmp r0, #0
	beq _02250FDC
	add r0, r4, #0
	mov r1, #0
	bl ov02_02251164
	add r0, r4, #0
	add r0, #0xbc
	mov r1, #1
	bl ov01_021FC004
	mov r0, #3
	strb r0, [r4, #0x10]
_02250FDC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02250F1C

	thumb_func_start ov02_02250FE0
ov02_02250FE0: ; 0x02250FE0
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r0, r4, #0
	add r0, #0xbc
	bl ov01_021FBF68
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021FBF68
	mov r0, #0x6b
	lsl r0, r0, #2
	mov r5, #0
	add r4, r4, r0
	mov r6, #0x78
_02251000:
	add r0, r5, #0
	mul r0, r6
	add r0, r4, r0
	bl ov01_021FBF68
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02251000
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov02_02250FE0

	thumb_func_start ov02_02251018
ov02_02251018: ; 0x02251018
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0xbc
	add r1, #0x44
	bl ov01_021FBF5C
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xbc
	add r1, #0x58
	bl ov01_021FBF5C
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xbc
	add r1, #0x6c
	bl ov01_021FBF5C
	add r0, r4, #0
	add r0, #0x6c
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x58
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x44
	add r1, r4, #0
	bl ov01_021FBE80
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x44
	add r1, #0x14
	mov r2, #0xae
	mov r3, #0x16
	str r4, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x58
	add r1, #0x14
	mov r2, #0xae
	mov r3, #0x17
	str r4, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x6c
	add r1, #0x14
	mov r2, #0xae
	mov r3, #0x18
	str r4, [sp, #4]
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xbc
	add r1, #0x44
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xbc
	add r1, #0x58
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xbc
	add r1, #0x6c
	bl ov01_021FBF50
	add r4, #0x44
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov02_022510D4
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov02_02251018

	thumb_func_start ov02_022510D4
ov02_022510D4: ; 0x022510D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _022510F8
_022510E2:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl ov01_021FBF20
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _022510E2
_022510F8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_022510D4

	thumb_func_start ov02_022510FC
ov02_022510FC: ; 0x022510FC
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _0225112C
_0225110A:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _02251122
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02251122:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _0225110A
_0225112C:
	cmp r5, r6
	bne _02251134
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02251134:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022510FC

	thumb_func_start ov02_02251138
ov02_02251138: ; 0x02251138
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r4, _02251160 ; =0x00000000
	beq _0225115C
	mov r7, #0x14
_02251144:
	add r0, r4, #0
	mul r0, r7
	mov r1, #1
	add r0, r5, r0
	lsl r1, r1, #0xc
	bl ov01_021FBEAC
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02251144
_0225115C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251160: .word 0x00000000
	thumb_func_end ov02_02251138

	thumb_func_start ov02_02251164
ov02_02251164: ; 0x02251164
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldrh r0, [r6, #0x12]
	add r7, r1, #0
	cmp r0, #8
	bne _02251174
	mov r5, #2
	b _02251176
_02251174:
	mov r5, #4
_02251176:
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r6, r0
	add r1, r7, #0
	bl ov01_021FC004
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _022511AA
	mov r4, #0
	cmp r5, #0
	bls _022511AA
	mov r0, #0x6b
	lsl r0, r0, #2
	add r6, r6, r0
_02251194:
	mov r0, #0x78
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl ov01_021FC004
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _02251194
_022511AA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02251164

	thumb_func_start ov02_022511AC
ov02_022511AC: ; 0x022511AC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0x10
	mov r1, #0xae
	mov r2, #0x1c
	add r3, r5, #0
	bl ov01_021FBCD8
	add r0, r4, #0
	add r1, r4, #0
	str r5, [sp]
	add r0, #0x20
	add r1, #0x10
	mov r2, #0xae
	mov r3, #0x1d
	str r4, [sp, #4]
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	str r5, [sp]
	add r0, #0x34
	add r1, #0x10
	mov r2, #0xae
	mov r3, #0x1e
	str r4, [sp, #4]
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	str r5, [sp]
	add r0, #0x48
	add r1, #0x10
	mov r2, #0xae
	mov r3, #0x1f
	str r4, [sp, #4]
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x5c
	add r1, #0x10
	bl ov01_021FBF2C
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x5c
	add r1, #0x20
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x5c
	add r1, #0x34
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x5c
	add r1, #0x48
	bl ov01_021FBF50
	add r0, r4, #0
	add r0, #0x20
	mov r1, #3
	mov r2, #0
	bl ov02_022510D4
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #8
	bl MapObject_GetPositionVec
	mov r0, #0x19
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xe
	add r2, r1, r0
	ldr r1, [sp, #0x10]
	ldr r0, _0225127C ; =0x0015E000
	str r2, [sp, #0xc]
	sub r3, r1, r0
	add r0, r4, #0
	ldr r1, [sp, #8]
	add r0, #0x5c
	str r3, [sp, #0x10]
	bl ov01_021FC00C
	add r4, #0x5c
	add r0, r4, #0
	mov r1, #1
	bl ov01_021FC004
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225127C: .word 0x0015E000
	thumb_func_end ov02_022511AC

	thumb_func_start ov02_02251280
ov02_02251280: ; 0x02251280
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x48
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x34
	add r1, r4, #0
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x20
	add r1, r4, #0
	bl ov01_021FBE80
	add r4, #0x10
	add r0, r4, #0
	bl ov01_021FBDA8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02251280

	thumb_func_start ov02_022512AC
ov02_022512AC: ; 0x022512AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _022512CA
	cmp r0, #1
	beq _02251306
	b _02251316
_022512CA:
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #2
	bne _022512E8
	ldr r0, _0225131C ; =SEQ_SE_GS_RUGIA_MENOHIKARI
	bl PlaySE
_022512E8:
	add r0, r4, #0
	add r0, #0x20
	mov r1, #3
	bl ov02_022510FC
	cmp r0, #0
	beq _022512FC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_022512FC:
	add r4, #0x5c
	add r0, r4, #0
	bl ov01_021FBF68
	b _02251316
_02251306:
	add r0, r4, #0
	bl ov02_02251280
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02251316:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0225131C: .word SEQ_SE_GS_RUGIA_MENOHIKARI
	thumb_func_end ov02_022512AC

	thumb_func_start ov02_02251320
ov02_02251320: ; 0x02251320
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl ov01_021E687C
	add r5, r0, #0
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _02251352
	cmp r0, #1
	beq _022513AE
	cmp r0, #2
	beq _02251412
	b _02251418
_02251352:
	add r0, r4, #0
	ldr r1, _02251420 ; =0x000004AC
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r5, r1]
	bl ov01_022040D0
	add r7, r0, #0
	mov r6, #0
_02251364:
	ldr r0, [r4, #0x54]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, _02251420 ; =0x000004AC
	mov r2, #1
	ldr r0, [r5, r0]
	add r3, r7, #0
	bl ov01_021E8970
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	blo _02251364
	mov r6, #0
_02251382:
	ldr r0, _02251420 ; =0x000004AC
	ldr r2, [r4, #0x54]
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl ov01_021E8B04
	add r7, r0, #0
	mov r1, #1
	bl ov01_021E8B84
	add r0, r7, #0
	bl ov01_021E8B6C
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	blo _02251382
	ldr r0, [sp, #4]
	mov r1, #1
	str r1, [r0]
	b _02251418
_022513AE:
	add r0, r4, #0
	ldr r1, _02251420 ; =0x000004AC
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r5, r1]
	bl ov01_022040D0
	add r7, r0, #0
	ldr r0, _02251420 ; =0x000004AC
	ldr r2, [r4, #0x54]
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov01_021E8B04
	bl ov01_021E8B90
	cmp r0, #0
	beq _02251418
	mov r6, #0
_022513D4:
	ldr r2, _02251420 ; =0x000004AC
	ldr r0, [r4, #0x54]
	ldr r2, [r5, r2]
	add r1, r7, #0
	add r3, r6, #0
	bl ov01_021E8A8C
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	blo _022513D4
	mov r6, #0
_022513EE:
	ldr r0, [r4, #0x54]
	add r1, r6, #2
	str r0, [sp]
	ldr r0, _02251420 ; =0x000004AC
	mov r2, #1
	ldr r0, [r5, r0]
	add r3, r7, #0
	bl ov01_021E8970
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	blo _022513EE
	ldr r0, [sp, #4]
	mov r1, #2
	str r1, [r0]
	b _02251418
_02251412:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02251418:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251420: .word 0x000004AC
	thumb_func_end ov02_02251320

	thumb_func_start ov02_02251424
ov02_02251424: ; 0x02251424
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r7, r1, #0
	ldr r6, [r0, #0x24]
	ldr r0, [r6, #4]
	bl ov01_021E687C
	add r4, r0, #0
	cmp r7, #3
	blo _02251440
	bl GF_AssertFail
_02251440:
	add r0, r6, #0
	ldr r1, [r5, #0x24]
	add r0, #0xc
	bl sub_0202365C
	add r6, #0x18
	ldr r1, [r5, #0x24]
	add r0, r6, #0
	bl sub_0202366C
	mov r0, #0x14
	add r6, r7, #0
	mul r6, r0
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	ldr r0, [r0, r6]
	bl GF_Camera_SetDistance
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	add r0, r0, r6
	add r0, r0, #4
	bl GF_Camera_SetAngle
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	add r0, r0, r6
	ldrh r0, [r0, #0xe]
	bl GF_Camera_SetPerspectiveAngle
	ldr r0, _022514C0 ; =0x000004B4
	ldr r1, [r4, r0]
	mov r0, #0xc
	mul r0, r7
	add r0, r1, r0
	ldr r1, [r5, #0x24]
	bl GF_Camera_ShiftBy
	mov r0, #0x96
	ldr r1, _022514C4 ; =0x006A4000
	ldr r2, [r5, #0x24]
	lsl r0, r0, #0xc
	bl GF_Camera_SetClipBounds
	ldr r1, [r5, #0x24]
	add r0, sp, #8
	bl GF_Camera_GetTarget
	ldr r0, [r5, #0x24]
	bl GF_Camera_GetBindTarget
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl GF_Camera_GetAngle
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_022514C0: .word 0x000004B4
_022514C4: .word 0x006A4000
	thumb_func_end ov02_02251424

	thumb_func_start ov02_022514C8
ov02_022514C8: ; 0x022514C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r0, [r0, #4]
	add r4, r1, #0
	ldr r0, [r0, #0x24]
	str r0, [sp]
	ldr r0, [r0, #4]
	bl ov01_021E687C
	add r6, r0, #0
	cmp r4, #0
	bne _022514E4
	mov r1, #0
	b _022514E6
_022514E4:
	mov r1, #3
_022514E6:
	mov r0, #0x4b
	lsl r0, r0, #4
	mov r5, #0x14
	add r3, r1, #0
	ldr r0, [r6, r0]
	mul r3, r5
	add r0, r0, r3
	ldrh r0, [r0, #4]
	add r2, sp, #4
	add r7, sp, #8
	strh r0, [r2]
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	add r0, r0, r3
	ldrh r0, [r0, #0xe]
	strh r0, [r2, #2]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r0, #4
	mov r2, #0xc
	ldr r0, [r6, r0]
	mul r2, r1
	add r2, r0, r2
	ldmia r2!, {r0, r1}
	stmia r7!, {r0, r1}
	ldr r0, [r2]
	str r0, [r7]
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	ldr r0, [r0, r3]
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r0, [r0, #0x24]
	cmp r0, #7
	bne _02251538
	cmp r4, #0
	bne _02251542
	mov r5, #0xc8
	b _02251542
_02251538:
	cmp r4, #0
	bne _02251540
	mov r5, #0xa0
	b _02251542
_02251540:
	mov r5, #0xc8
_02251542:
	ldr r0, [sp]
	add r1, sp, #4
	ldr r0, [r0, #8]
	add r2, r5, #0
	bl SetCameraTranslationPath
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_022514C8

	thumb_func_start ov02_02251554
ov02_02251554: ; 0x02251554
	ldr r3, _02251560 ; =TaskManager_Call
	ldr r0, [r0, #0x10]
	ldr r1, _02251564 ; =ov02_02251568
	mov r2, #0
	bx r3
	nop
_02251560: .word TaskManager_Call
_02251564: .word ov02_02251568
	thumb_func_end ov02_02251554

	thumb_func_start ov02_02251568
ov02_02251568: ; 0x02251568
	push {r3, r4, lr}
	sub sp, #0x14
	bl TaskManager_GetSys
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #8]
	bl IsCameraTranslationFinished
	cmp r0, #0
	beq _0225159C
	ldr r1, [r4, #0x24]
	add r0, sp, #8
	bl GF_Camera_GetTarget
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetBindTarget
	ldr r1, [r4, #0x24]
	add r0, sp, #0
	bl GF_Camera_GetAngle
	add sp, #0x14
	mov r0, #1
	pop {r3, r4, pc}
_0225159C:
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02251568

	thumb_func_start ov02_022515A4
ov02_022515A4: ; 0x022515A4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #4
	mov r1, #0xe4
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	ldr r0, _022515C8 ; =gGameVersion
	ldrb r1, [r0]
	add r0, r2, #0
	add r0, #0xe0
	strh r1, [r0]
	ldr r0, [r4, #0x10]
	ldr r1, _022515CC ; =ov02_022515D0
	bl TaskManager_Call
	pop {r4, pc}
	nop
_022515C8: .word gGameVersion
_022515CC: .word ov02_022515D0
	thumb_func_end ov02_022515A4

	thumb_func_start ov02_022515D0
ov02_022515D0: ; 0x022515D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	bl TaskManager_GetSys
	str r0, [sp, #8]
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xe0
	ldrh r0, [r0]
	cmp r0, #8
	bne _02251604
	mov r0, #SPECIES_LUGIA
	str r0, [sp, #0x10]
	mov r0, #0x12
	mov r1, #5
	str r0, [sp, #0xc]
	ldr r7, _022518D8 ; =SEQ_SE_GS_RUGIA_HABATAKI
	b _02251610
_02251604:
	mov r0, #SPECIES_HO_OH
	str r0, [sp, #0x10]
	mov r0, #0
	ldr r7, _022518DC ; =SEQ_SE_GS_HOUOU_HABATAKI
	mov r1, #5
	str r0, [sp, #0xc]
_02251610:
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r6, r0, #0
	bne _02251620
	bl GF_AssertFail
_02251620:
	ldr r0, [r5]
	cmp r0, #7
	bls _02251628
	b _022518D0
_02251628:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02251634: ; jump table
	.short _02251644 - _02251634 - 2 ; case 0
	.short _02251740 - _02251634 - 2 ; case 1
	.short _0225178A - _02251634 - 2 ; case 2
	.short _022517FE - _02251634 - 2 ; case 3
	.short _0225181E - _02251634 - 2 ; case 4
	.short _0225184E - _02251634 - 2 ; case 5
	.short _02251884 - _02251634 - 2 ; case 6
	.short _02251898 - _02251634 - 2 ; case 7
_02251644:
	add r0, r4, #0
	add r0, #0xc
	mov r1, #4
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	add r0, r4, #0
	add r0, #0x1c
	mov r1, #0xae
	mov r2, #0x22
	mov r3, #4
	bl ov01_021FBCD8
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x2c
	add r1, #0x1c
	mov r2, #0xae
	mov r3, #0x23
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x40
	add r1, #0x1c
	mov r2, #0xae
	mov r3, #0x24
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x54
	add r1, #0x1c
	mov r2, #0xae
	mov r3, #0x25
	bl ov01_021FBE44
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x1c
	bl ov01_021FBF2C
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x2c
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x40
	bl ov01_021FBF50
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x54
	bl ov01_021FBF50
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov01_021FC004
	add r0, r4, #0
	add r0, #0x2c
	mov r1, #3
	mov r2, #0
	bl ov02_022510D4
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x2c
	bl MapObject_GetPositionVec
	add r0, r4, #0
	add r0, #0xe0
	ldrh r0, [r0]
	cmp r0, #7
	bne _02251720
	mov r0, #0xa
	ldr r1, [sp, #0x30]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x30]
	mov r0, #1
	ldr r1, [sp, #0x34]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp, #0x34]
	b _0225172A
_02251720:
	mov r0, #0x46
	ldr r1, [sp, #0x34]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0x34]
_0225172A:
	add r4, #0x68
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	add r0, r4, #0
	bl ov01_021FC00C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022518D0
_02251740:
	add r0, r6, #0
	add r1, sp, #0x20
	bl MapObject_GetPositionVec
	ldr r0, [sp, #0x24]
	str r0, [r4, #4]
	add r0, r4, #0
	add r0, #0xe0
	ldrh r0, [r0]
	cmp r0, #7
	bne _0225175C
	mov r0, #0x1e
	lsl r0, r0, #0xe
	b _02251760
_0225175C:
	mov r0, #0xa
	lsl r0, r0, #0x10
_02251760:
	str r0, [r4]
	ldr r1, [sp, #0x24]
	ldr r0, [r4]
	add r0, r1, r0
	str r0, [sp, #0x24]
	add r0, r6, #0
	add r1, sp, #0x20
	bl MapObject_SetPositionVec
	add r0, r6, #0
	mov r1, #0
	bl sub_0205F690
	mov r0, #0
	strh r0, [r4, #8]
	add r4, #0xe2
	strh r0, [r4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022518D0
_0225178A:
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	ldrh r1, [r4, #8]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	blt _022517C0
	add r0, r4, #0
	add r0, #0xe2
	ldrh r0, [r0]
	cmp r0, #0
	bne _022517B2
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x18
	add r0, #0xe2
	strh r1, [r0]
_022517B2:
	add r0, r4, #0
	add r0, #0xe2
	ldrh r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0xe2
	strh r1, [r0]
_022517C0:
	add r0, r6, #0
	add r1, sp, #0x14
	mov r7, #0
	bl MapObject_GetPositionVec
	mov r0, #1
	ldr r1, [r4]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [r4]
	cmp r0, #0
	bgt _022517DE
	add r0, r7, #0
	str r0, [r4]
	mov r7, #1
_022517DE:
	ldr r1, [r4, #4]
	ldr r0, [r4]
	add r0, r1, r0
	str r0, [sp, #0x18]
	add r0, r6, #0
	add r1, sp, #0x14
	bl MapObject_SetPositionVec
	cmp r7, #0
	beq _022518D0
	mov r0, #0
	strh r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022518D0
_022517FE:
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #0x3c
	blo _022518D0
	add r0, r6, #0
	mov r1, #1
	bl sub_0205F328
	mov r0, #0
	strh r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022518D0
_0225181E:
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #0x32
	blo _022518D0
	add r0, r4, #0
	add r0, #0x68
	mov r1, #1
	bl ov01_021FC004
	ldr r0, [sp, #0x10]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlayCry
	mov r0, #0
	strh r0, [r4, #0xa]
	strh r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022518D0
_0225184E:
	add r0, r4, #0
	add r0, #0x2c
	mov r1, #3
	bl ov02_022510FC
	ldrh r1, [r4, #0xa]
	add r1, r1, #1
	strh r1, [r4, #0xa]
	cmp r0, #0
	beq _0225187A
	ldrh r0, [r4, #0xa]
	cmp r0, #0x41
	blo _0225187A
	add r0, r6, #0
	mov r1, #0
	bl sub_0205F328
	mov r0, #0
	strh r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0225187A:
	add r4, #0x68
	add r0, r4, #0
	bl ov01_021FBF68
	b _022518D0
_02251884:
	ldrh r0, [r4, #8]
	add r0, r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #0x1e
	blo _022518D0
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022518D0
_02251898:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x54
	add r1, #0xc
	bl ov01_021FBE80
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x40
	add r1, #0xc
	bl ov01_021FBE80
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x2c
	add r1, #0xc
	bl ov01_021FBE80
	add r0, r4, #0
	add r0, #0x1c
	bl ov01_021FBDA8
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x38
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022518D0:
	mov r0, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022518D8: .word SEQ_SE_GS_RUGIA_HABATAKI
_022518DC: .word SEQ_SE_GS_HOUOU_HABATAKI
	thumb_func_end ov02_022515D0

	thumb_func_start ov02_022518E0
ov02_022518E0: ; 0x022518E0
	push {r3, lr}
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x24]
	ldr r1, [r1, #0x24]
	cmp r1, #8
	bne _022518F2
	bl ov02_022518F8
	pop {r3, pc}
_022518F2:
	bl ov02_022519B0
	pop {r3, pc}
	thumb_func_end ov02_022518E0

	thumb_func_start ov02_022518F8
ov02_022518F8: ; 0x022518F8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	ldr r0, [r6, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl ov01_021E687C
	mov r4, #0xe3
	add r5, r0, #0
	lsl r4, r4, #2
	add r0, r5, r4
	mov r1, #0xae
	mov r2, #0x26
	mov r3, #4
	bl ov01_021FBCD8
	mov r0, #4
	str r0, [sp]
	add r0, r5, r4
	add r0, #0x10
	add r1, r5, r4
	mov r2, #0xae
	mov r3, #0x27
	str r5, [sp, #4]
	bl ov01_021FBE44
	mov r0, #4
	str r0, [sp]
	add r0, r5, r4
	add r0, #0x24
	add r1, r5, r4
	mov r2, #0xae
	mov r3, #0x28
	str r5, [sp, #4]
	bl ov01_021FBE44
	add r0, r5, r4
	add r0, #0x38
	add r1, r5, r4
	bl ov01_021FBF2C
	add r0, r5, r4
	add r1, r5, r4
	add r0, #0x38
	add r1, #0x10
	bl ov01_021FBF50
	add r0, r5, r4
	add r1, r5, r4
	add r0, #0x38
	add r1, #0x24
	bl ov01_021FBF50
	add r0, r5, r4
	add r0, #0x38
	mov r1, #1
	bl ov01_021FC004
	add r0, r5, r4
	add r0, #0x10
	mov r1, #2
	mov r2, #0
	bl ov02_022510D4
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #8
	bl MapObject_GetPositionVec
	add r0, r5, r4
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, #0x38
	bl ov01_021FC00C
	ldr r0, _022519A8 ; =ov02_02251BA8
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	ldr r1, _022519AC ; =0x000004A8
	str r0, [r5, r1]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_022519A8: .word ov02_02251BA8
_022519AC: .word 0x000004A8
	thumb_func_end ov02_022518F8

	thumb_func_start ov02_022519B0
ov02_022519B0: ; 0x022519B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #4]
	bl ov01_021E687C
	ldr r1, _02251AFC ; =0x0000043C
	str r0, [sp, #0x10]
	add r6, r0, r1
	ldr r0, [r4, #8]
	mov r4, #0
	str r0, [r6, #0x64]
	add r0, r6, #0
	str r0, [sp, #0x14]
	add r0, #0x18
	str r0, [sp, #0x14]
_022519D4:
	ldr r1, _02251B00 ; =ov02_02253B44
	lsl r7, r4, #2
	ldrb r1, [r1, r4]
	add r5, r6, r7
	mov r0, #4
	str r0, [sp]
	mov r0, #0xae
	mov r2, #0
	add r3, r5, #0
	bl GfGfxLoader_GetScrnData
	ldr r1, _02251B04 ; =ov02_02253B3C
	ldr r3, [sp, #0x14]
	str r0, [r5, #0x30]
	mov r0, #4
	str r0, [sp]
	ldrb r1, [r1, r4]
	mov r0, #0xae
	mov r2, #0
	add r3, r3, r7
	bl GfGfxLoader_GetScrnData
	str r0, [r5, #0x48]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _022519D4
	ldr r3, [r6]
	ldr r0, [r6, #0x64]
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #2
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r3, [r6, #0x18]
	ldr r0, [r6, #0x64]
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #3
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r6, #0x64]
	mov r1, #2
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r6, #0x64]
	mov r1, #3
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r6, #0x64]
	mov r0, #0xae
	mov r1, #0x35
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r6, #0x64]
	mov r0, #0xae
	mov r1, #0x35
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xae
	mov r1, #0x36
	mov r2, #0
	mov r3, #0xc0
	bl GfGfxLoader_GXLoadPal
	ldr r0, _02251B08 ; =ov02_02251BC4
	ldr r1, [sp, #0x10]
	mov r2, #0
	bl CreateSysTask
	ldr r2, _02251B0C ; =0x000004A8
	ldr r1, [sp, #0x10]
	str r0, [r1, r2]
	ldr r0, [r6, #0x64]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r6, #0x64]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r6, #0
	mov r1, #0
	add r0, #0x63
	strb r1, [r0]
	str r1, [r6, #0x68]
	ldr r3, _02251B10 ; =0x0400000C
	mov r1, #3
	ldrh r0, [r3]
	bic r0, r1
	strh r0, [r3]
	ldrh r2, [r3, #2]
	mov r0, #1
	bic r2, r1
	orr r0, r2
	strh r0, [r3, #2]
	sub r2, r3, #4
	ldrh r3, [r2]
	mov r0, #2
	bic r3, r1
	orr r0, r3
	strh r0, [r2]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251AFC: .word 0x0000043C
_02251B00: .word ov02_02253B44
_02251B04: .word ov02_02253B3C
_02251B08: .word ov02_02251BC4
_02251B0C: .word 0x000004A8
_02251B10: .word 0x0400000C
	thumb_func_end ov02_022519B0

	thumb_func_start ov02_02251B14
ov02_02251B14: ; 0x02251B14
	push {r3, r4, r5, lr}
	ldr r0, [r0, #4]
	ldr r5, [r0, #0x24]
	ldr r0, [r5, #4]
	bl ov01_021E687C
	add r4, r0, #0
	ldr r0, _02251B48 ; =0x000004A8
	ldr r0, [r4, r0]
	bl DestroySysTask
	ldr r0, _02251B48 ; =0x000004A8
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r5, #0x24]
	cmp r0, #8
	bne _02251B3E
	add r0, r4, #0
	bl ov02_02251B4C
	pop {r3, r4, r5, pc}
_02251B3E:
	add r0, r4, #0
	bl ov02_02251B70
	pop {r3, r4, r5, pc}
	nop
_02251B48: .word 0x000004A8
	thumb_func_end ov02_02251B14

	thumb_func_start ov02_02251B4C
ov02_02251B4C: ; 0x02251B4C
	push {r3, r4, r5, lr}
	mov r4, #0xe3
	add r5, r0, #0
	lsl r4, r4, #2
	add r0, r5, r4
	add r0, #0x24
	add r1, r5, #0
	bl ov01_021FBE80
	add r0, r5, r4
	add r0, #0x10
	add r1, r5, #0
	bl ov01_021FBE80
	add r0, r5, r4
	bl ov01_021FBDA8
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02251B4C

	thumb_func_start ov02_02251B70
ov02_02251B70: ; 0x02251B70
	push {r4, r5, r6, lr}
	ldr r1, _02251BA4 ; =0x0000043C
	add r6, r0, r1
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r4, #0
_02251B88:
	lsl r0, r4, #2
	add r5, r6, r0
	ldr r0, [r5, #0x30]
	bl FreeToHeap
	ldr r0, [r5, #0x48]
	bl FreeToHeap
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _02251B88
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02251BA4: .word 0x0000043C
	thumb_func_end ov02_02251B70

	thumb_func_start ov02_02251BA8
ov02_02251BA8: ; 0x02251BA8
	push {r3, r4, r5, lr}
	mov r4, #0xe3
	add r5, r1, #0
	lsl r4, r4, #2
	add r0, r5, r4
	add r0, #0x10
	mov r1, #2
	bl ov02_02251138
	add r0, r5, r4
	add r0, #0x38
	bl ov01_021FBF68
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02251BA8

	thumb_func_start ov02_02251BC4
ov02_02251BC4: ; 0x02251BC4
	push {r3, r4, lr}
	sub sp, #0x1c
	ldr r0, _02251CEC ; =0x0000043C
	add r4, r1, r0
	add r0, r4, #0
	add r0, #0x63
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x63
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x63
	ldrb r0, [r0]
	cmp r0, #6
	blo _02251C7E
	add r0, r4, #0
	mov r1, #0
	add r0, #0x63
	strb r1, [r0]
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	cmp r0, #6
	blt _02251BF8
	str r1, [r4, #0x68]
_02251BF8:
	mov r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x68]
	mov r2, #0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r3, r2, #0
	add r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r4, #0x64]
	mov r1, #2
	bl CopyRectToBgTilemapRect
	mov r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x68]
	mov r2, #0
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x18]
	add r3, r2, #0
	add r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r4, #0x64]
	mov r1, #3
	bl CopyRectToBgTilemapRect
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r4, #0x64]
	mov r1, #2
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	mov r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r4, #0x64]
	mov r1, #3
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r4, #0x64]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #0x64]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
_02251C7E:
	add r0, r4, #0
	add r0, #0x60
	ldrb r0, [r0]
	add r3, r4, #0
	add r3, #0x60
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x60
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x61
	ldrb r0, [r0]
	mov r2, #0
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x61
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x62
	strb r1, [r0]
	ldrb r3, [r3]
	ldr r0, [r4, #0x64]
	mov r1, #2
	bl ScheduleSetBgPosText
	add r3, r4, #0
	add r3, #0x62
	ldrb r3, [r3]
	ldr r0, [r4, #0x64]
	mov r1, #2
	mov r2, #3
	bl ScheduleSetBgPosText
	add r3, r4, #0
	add r3, #0x61
	ldrb r3, [r3]
	ldr r0, [r4, #0x64]
	mov r1, #3
	mov r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x64]
	add r4, #0x62
	mov r1, #3
	ldrb r3, [r4]
	add r2, r1, #0
	bl ScheduleSetBgPosText
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_02251CEC: .word 0x0000043C
	thumb_func_end ov02_02251BC4

	thumb_func_start ov02_02251CF0
ov02_02251CF0: ; 0x02251CF0
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x28
	bl AllocFromHeapAtEnd
	ldr r1, [r5, #4]
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	ldr r0, _02251DAC ; =gGameVersion
	ldrb r0, [r0]
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0x1a]
	cmp r0, #7
	bne _02251D1A
	bl GF_AssertFail
	add sp, #0x20
	pop {r3, r4, r5, pc}
_02251D1A:
	ldr r0, [r5, #0x24]
	bl GF_Camera_GetDistance
	str r0, [r4]
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl GF_Camera_GetAngle
	add r0, sp, #0
	ldrh r1, [r0]
	strh r1, [r4, #4]
	ldrh r1, [r0, #2]
	strh r1, [r4, #6]
	ldrh r1, [r0, #4]
	strh r1, [r4, #8]
	ldrh r0, [r0, #6]
	strh r0, [r4, #0xa]
	ldr r1, [r5, #0x24]
	add r0, sp, #8
	bl GF_Camera_GetTarget
	add r3, sp, #8
	ldmia r3!, {r0, r1}
	add r2, sp, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x24]
	bl GF_Camera_GetBindTarget
	add r2, r4, #0
	add r1, r0, #0
	add r0, sp, #0x14
	add r2, #0xc
	bl VEC_Subtract
	ldr r0, [r5, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x24]
	bl sub_02023654
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x24]
	bl sub_02023650
	str r0, [r4, #0x20]
	ldr r0, _02251DB0 ; =0x0029AEC1
	ldr r1, [r5, #0x24]
	bl GF_Camera_SetDistance
	ldr r0, _02251DB4 ; =ov02_02253C74
	ldr r1, [r5, #0x24]
	bl GF_Camera_SetAngle
	ldr r0, _02251DB8 ; =0x000005C1
	ldr r1, [r5, #0x24]
	bl GF_Camera_SetPerspectiveAngle
	ldr r0, _02251DBC ; =ov02_02253BC4
	ldr r1, [r5, #0x24]
	bl GF_Camera_ShiftBy
	mov r0, #0x96
	ldr r1, _02251DC0 ; =0x006A4000
	ldr r2, [r5, #0x24]
	lsl r0, r0, #0xc
	bl GF_Camera_SetClipBounds
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_02251DAC: .word gGameVersion
_02251DB0: .word 0x0029AEC1
_02251DB4: .word ov02_02253C74
_02251DB8: .word 0x000005C1
_02251DBC: .word ov02_02253BC4
_02251DC0: .word 0x006A4000
	thumb_func_end ov02_02251CF0

	thumb_func_start ov02_02251DC4
ov02_02251DC4: ; 0x02251DC4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldrh r0, [r0, #0x1a]
	cmp r0, #7
	bne _02251DD6
	bl GF_AssertFail
_02251DD6:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov02_02251DC4

	thumb_func_start ov02_02251DE8
ov02_02251DE8: ; 0x02251DE8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	ldrh r0, [r4, #0x1a]
	cmp r0, #7
	bne _02251E00
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, pc}
_02251E00:
	ldr r1, [r5, #0x24]
	mov r0, #4
	bl CreateCameraTranslationWrapper
	str r0, [r4, #0x24]
	add r3, r4, #0
	ldrh r1, [r4, #4]
	add r0, sp, #0
	add r3, #0xc
	strh r1, [r0]
	ldrh r1, [r4, #0x18]
	add r2, sp, #4
	strh r1, [r0, #2]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	ldr r0, [r4]
	mov r2, #0x1e
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x24]
	bl SetCameraTranslationPath
	ldr r0, [r5, #0x10]
	ldr r1, _02251E40 ; =ov02_02251E44
	add r2, r5, #0
	bl TaskManager_Call
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02251E40: .word ov02_02251E44
	thumb_func_end ov02_02251DE8

	thumb_func_start ov02_02251E44
ov02_02251E44: ; 0x02251E44
	push {r4, r5, r6, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r5, [r0, #0x24]
	ldr r6, [r5, #0x24]
	add r0, r6, #0
	bl IsCameraTranslationFinished
	cmp r0, #0
	beq _02251E70
	add r0, r6, #0
	bl DeleteCameraTranslationWrapper
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x20]
	ldr r2, [r4, #0x24]
	bl GF_Camera_SetClipBounds
	mov r0, #1
	pop {r4, r5, r6, pc}
_02251E70:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02251E44

	thumb_func_start GetPhoneBookEntryName
GetPhoneBookEntryName: ; 0x02251E74
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r0]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _02251E86
	ldrb r0, [r0, #2]
	cmp r0, #0x4b
	blo _02251E92
_02251E86:
	mov r0, #8
	add r1, r4, #0
	bl String_ctor
	add r5, r0, #0
	b _02251EB2
_02251E92:
	bl GetPhoneMessageGmm
	add r2, r0, #0
	mov r0, #1
	mov r1, #0x1b
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r1, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	bl DestroyMsgData
_02251EB2:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GetPhoneBookEntryName

	thumb_func_start ov02_02251EB8
ov02_02251EB8: ; 0x02251EB8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0x4b
	blo _02251ED0
	mov r0, #0xff
	strb r0, [r4, #2]
	strb r0, [r4, #5]
	mov r0, #0
	strb r0, [r4, #6]
	bl GF_AssertFail
	b _02251ED6
_02251ED0:
	strb r1, [r4, #2]
	strb r2, [r4, #5]
	strb r3, [r4, #6]
_02251ED6:
	ldr r0, _02251EE4 ; =0xFFFFFFF8
	add r0, sp
	ldrb r1, [r0, #0x10]
	strb r1, [r4, #3]
	ldrb r0, [r0, #0x14]
	strb r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
_02251EE4: .word 0xFFFFFFF8
	thumb_func_end ov02_02251EB8

	thumb_func_start ov02_02251EE8
ov02_02251EE8: ; 0x02251EE8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	ldrb r0, [r5, #2]
	cmp r0, #0x4b
	blo _02251F08
	bl GF_AssertFail
	mov r0, #0xff
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02251F08:
	ldrb r0, [r5, #5]
	strb r0, [r4]
	ldrb r0, [r5, #6]
	strb r0, [r4, #1]
	ldrb r0, [r5, #3]
	strb r0, [r4, #3]
	ldrb r0, [r5, #4]
	strb r0, [r4, #4]
	ldrb r0, [r5, #7]
	strb r0, [r4, #2]
	ldrb r0, [r5, #2]
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02251EE8

	thumb_func_start ov02_02251F20
ov02_02251F20: ; 0x02251F20
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x38]
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	add r4, r0, #0
	ldr r0, [r4]
	bl MapHeader_GetField14_1E
	cmp r0, #0
	bne _02251F3E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F3E:
	ldrb r0, [r5]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02251F4E
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bge _02251F52
_02251F4E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F52:
	mov r0, #4
	bl AllocAndReadPhoneBook
	add r6, r0, #0
	ldr r2, [r4]
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_022521C0
	add r7, r0, #0
	beq _02251F9C
	add r0, r6, #0
	bl FreePhoneBook
	cmp r7, #2
	bne _02251F90
	ldr r2, [r5, #0x3c]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r2, #0xd2
	orr r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x3c]
	ldr r1, _02251FD8 ; =0x000007FF
	mov r2, #0
	bl StartMapSceneScript
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02251F90:
	add r0, r5, #0
	mov r1, #1
	bl ov02_022522AC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02251F9C:
	bl MTRandom
	mov r1, #0x64
	bl _u32_div_f
	ldrh r0, [r5, #0x12]
	cmp r1, r0
	bls _02251FB8
	add r0, r6, #0
	bl FreePhoneBook
	mov r0, #0
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02251FB8:
	ldr r2, [r4]
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_02251FDC
	add r4, r0, #0
	add r0, r6, #0
	bl FreePhoneBook
	cmp r4, #0
	bne _02251FD2
	mov r0, #0
	str r0, [r5, #8]
_02251FD2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02251FD8: .word 0x000007FF
	thumb_func_end ov02_02251F20

	thumb_func_start ov02_02251FDC
ov02_02251FDC: ; 0x02251FDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #8]
	ldr r0, [r0, #0x38]
	add r6, r1, #0
	str r2, [sp, #0xc]
	bl SavArray_Flags_get
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl Sav2_Misc_get
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x30]
	bl GSPlayerMisc_FindEmptyGearPhonebookSlot
	str r0, [sp, #0x2c]
	ldr r0, [sp, #8]
	mov r1, #4
	ldr r0, [r0, #0x30]
	bl GSPlayerMisc_AllocAndCopyPhonebook
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x2c]
	mov r0, #4
	bl AllocFromHeapAtEnd
	ldr r2, [sp, #0x2c]
	mov r1, #0xff
	add r4, r0, #0
	bl MI_CpuFill8
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x7d
	lsl r0, r0, #2
	cmp r1, r0
	bhs _02252046
	mov r0, #0
	str r0, [sp, #0x24]
	b _02252058
_02252046:
	mov r0, #0x32
	lsl r0, r0, #4
	cmp r1, r0
	bhs _02252054
	mov r0, #1
	str r0, [sp, #0x24]
	b _02252058
_02252054:
	mov r0, #2
	str r0, [sp, #0x24]
_02252058:
	ldr r0, [sp, #0x2c]
	mov r7, #0
	add r2, r7, #0
	cmp r0, #0
	bls _022520A2
_02252062:
	ldr r0, [sp, #0x20]
	mov r1, #0x14
	ldrb r3, [r0, r2]
	ldr r0, [r6, #4]
	mul r1, r3
	add r5, r0, r1
	ldrb r1, [r5, #0xf]
	ldr r0, [sp, #0x24]
	cmp r0, r1
	bne _02252096
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0225208C
	cmp r0, #0xc
	beq _0225208C
	cmp r0, #0xb
	beq _0225208C
	cmp r0, #0xa
	beq _0225208C
	cmp r0, #0xe
	bne _02252096
_0225208C:
	add r1, r7, #1
	add r0, r7, #0
	lsl r1, r1, #0x18
	lsr r7, r1, #0x18
	strb r3, [r4, r0]
_02252096:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #0x2c]
	cmp r2, r0
	blo _02252062
_022520A2:
	cmp r7, #0
	bne _022520B8
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022520B8:
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x2c]
	mov r1, #0xff
	bl MI_CpuFill8
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x38]
	bl Sav2_SysInfo_RTC_get
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	bl CheckFlag996
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl sub_0202AAD4
	cmp r0, r7
	bne _022520F6
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl sub_0202AA9C
_022520F6:
	mov r5, #0
	cmp r7, #0
	bls _02252164
_022520FC:
	ldrb r2, [r4, r5]
	mov r1, #0x14
	ldr r0, [r6, #4]
	mul r1, r2
	add r0, r0, r1
	ldrh r1, [r0, #6]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _0225215A
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	bl sub_0202AA44
	cmp r0, #0
	bne _0225215A
	ldrb r0, [r4, r5]
	cmp r0, #8
	bne _02252134
	ldr r0, [sp, #0x14]
	bl sub_02095FF8
	cmp r0, #0
	bne _0225215A
	ldr r0, [sp, #0x1c]
	bl ScriptState_IsInRocketTakeover
	cmp r0, #0
	bne _0225215A
_02252134:
	ldrb r1, [r4, r5]
	mov r2, #0x14
	ldr r0, [r6, #4]
	mul r2, r1
	add r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _0225214A
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0225215A
_0225214A:
	ldr r0, [sp, #0x28]
	add r2, r0, #0
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #0x28]
	ldr r2, [sp, #0x20]
	strb r1, [r2, r0]
_0225215A:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r7
	blo _022520FC
_02252164:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _022521AC
	bl MTRandom
	ldr r2, [sp, #0x28]
	mov r1, #0x64
	mul r1, r2
	bl _u32_div_f
	add r0, r1, #0
	mov r1, #0x64
	bl _u32_div_f
	add r1, r0, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r0, #0
	lsl r1, r1, #0x18
	str r0, [sp]
	lsr r2, r1, #0x18
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #8]
	ldrb r1, [r1, r2]
	ldr r2, [sp, #0x24]
	add r3, r7, #0
	bl ov02_02251EB8
	ldr r0, [sp, #8]
	bl sub_02092DF4
	ldr r0, [sp, #8]
	mov r1, #1
	bl ov02_022522AC
_022521AC:
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0x28]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02251FDC

	thumb_func_start ov02_022521C0
ov02_022521C0: ; 0x022521C0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl ov02_02252218
	add r6, r0, #0
	cmp r6, #0xff
	bne _022521D6
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_022521D6:
	mov r0, #6
	add r4, r6, #0
	mul r4, r0
	mov r0, #3
	str r0, [sp]
	ldr r0, _0225220C ; =ov02_02253C86
	ldr r1, _02252210 ; =ov02_02253C84
	ldrh r0, [r0, r4]
	ldrb r1, [r1, r4]
	mov r2, #0xff
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r3, #0
	bl ov02_02251EB8
	add r0, r5, #0
	bl sub_02092DF4
	ldr r0, _02252214 ; =ov02_02253C88
	strb r6, [r5, #7]
	ldrb r0, [r0, r4]
	add r0, r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0225220C: .word ov02_02253C86
_02252210: .word ov02_02253C84
_02252214: .word ov02_02253C88
	thumb_func_end ov02_022521C0

	thumb_func_start ov02_02252218
ov02_02252218: ; 0x02252218
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	str r1, [sp]
	mov r0, #4
	mov r1, #0xd
	str r2, [sp, #4]
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xd
	str r0, [sp, #8]
	bl MI_CpuFill8
	mov r5, #0
	ldr r6, _022522A8 ; =ov02_02253C84
	add r4, r5, #0
_0225223A:
	lsl r1, r4, #0x18
	ldr r0, [r7, #0x34]
	lsr r1, r1, #0x18
	bl sub_0202F08C
	cmp r0, #0
	beq _02252276
	ldr r0, [sp]
	mov r1, #0x14
	ldr r2, [r0, #4]
	ldrb r0, [r6]
	mul r1, r0
	add r0, r2, r1
	ldrb r1, [r2, r1]
	cmp r1, #6
	bne _02252268
	ldr r0, [r7, #0x30]
	mov r1, #6
	bl GSPlayerMisc_IsGearNumberRegistered
	cmp r0, #0xff
	beq _02252276
	b _02252270
_02252268:
	ldrh r1, [r0, #6]
	ldr r0, [sp, #4]
	cmp r1, r0
	beq _02252276
_02252270:
	ldr r0, [sp, #8]
	strb r4, [r0, r5]
	add r5, r5, #1
_02252276:
	add r4, r4, #1
	add r6, r6, #6
	cmp r4, #0xd
	blt _0225223A
	cmp r5, #0
	bne _0225228E
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0xc
	mov r0, #0xff
	pop {r4, r5, r6, r7, pc}
_0225228E:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	ldr r0, [sp, #8]
	ldrb r4, [r0, r1]
	bl FreeToHeap
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022522A8: .word ov02_02253C84
	thumb_func_end ov02_02252218

	thumb_func_start ov02_022522AC
ov02_022522AC: ; 0x022522AC
	ldr r3, _022522B0 ; =GearPhone_ToggleRinging
	bx r3
	.balign 4, 0
_022522B0: .word GearPhone_ToggleRinging
	thumb_func_end ov02_022522AC

	thumb_func_start ov02_022522B4
ov02_022522B4: ; 0x022522B4
	push {r3, lr}
	bl SndRadio_GetSeqNo
	lsl r0, r0, #0x10
	ldr r2, _0225232C ; =SEQ_GS_RADIO_R_201
	lsr r0, r0, #0x10
	cmp r0, r2
	bgt _022522F0
	bge _0225231C
	add r1, r2, #0
	sub r1, #SEQ_GS_RADIO_R_201-SEQ_GS_HUE
	cmp r0, r1
	bgt _022522E8
	sub r2, #SEQ_GS_RADIO_R_201-SEQ_GS_RADIO_KOMORIUTA
	sub r1, r0, r2
	bmi _02252328
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022522E0: ; jump table
	.short _02252314 - _022522E0 - 2 ; case SEQ_GS_RADIO_KOMORIUTA
	.short _02252310 - _022522E0 - 2 ; case SEQ_GS_RADIO_MARCH
	.short _02252320 - _022522E0 - 2 ; case SEQ_GS_RADIO_UNKNOWN
	.short _02252324 - _022522E0 - 2 ; case SEQ_GS_HUE
_022522E8:
	ldr r1, _02252330 ; =SEQ_GS_RADIO_R_101
	cmp r0, r1
	beq _02252318
	b _02252328
_022522F0:
	add r1, r2, #0
	add r1, #SEQ_GS_P_RADIO_MARCH-SEQ_GS_RADIO_R_201
	cmp r0, r1
	bgt _02252308
	add r1, r2, #0
	add r1, #SEQ_GS_P_RADIO_MARCH-SEQ_GS_RADIO_R_201
	cmp r0, r1
	bge _02252310
	add r2, #SEQ_GS_P_RADIO_KOMORIUTA-SEQ_GS_RADIO_R_201
	cmp r0, r2
	beq _02252314
	b _02252328
_02252308:
	add r2, #SEQ_GS_P_HUE-SEQ_GS_RADIO_R_201
	cmp r0, r2
	beq _02252324
	b _02252328
_02252310:
	mov r0, #1
	pop {r3, pc}
_02252314:
	mov r0, #2
	pop {r3, pc}
_02252318:
	mov r0, #3
	pop {r3, pc}
_0225231C:
	mov r0, #4
	pop {r3, pc}
_02252320:
	mov r0, #6
	pop {r3, pc}
_02252324:
	mov r0, #5
	pop {r3, pc}
_02252328:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0225232C: .word SEQ_GS_RADIO_R_201
_02252330: .word SEQ_GS_RADIO_R_101
	thumb_func_end ov02_022522B4

	thumb_func_start ov02_02252334
ov02_02252334: ; 0x02252334
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	bne _0225234A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0225234A:
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _022523B0
	add r0, r5, #0
	add r0, #0xf4
	ldr r1, [r0]
	mov r0, #0x7b
	lsl r0, r0, #2
	cmp r1, r0
	bne _022523B0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	add r6, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r4, r0
	beq _02252392
	bl GF_AssertFail
_02252392:
	add r0, r5, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r4, r0
	beq _022523A0
	mov r0, #0
	pop {r4, r5, r6, pc}
_022523A0:
	add r5, #0xfc
	ldrh r0, [r5]
	cmp r0, #1
	bne _022523B0
	cmp r6, #0
	bne _022523B0
	mov r0, #1
	pop {r4, r5, r6, pc}
_022523B0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02252334

	thumb_func_start ov02_022523B4
ov02_022523B4: ; 0x022523B4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	ldr r1, _022523CC ; =ov02_022523D0
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_022523CC: .word ov02_022523D0
	thumb_func_end ov02_022523B4

	thumb_func_start ov02_022523D0
ov02_022523D0: ; 0x022523D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bls _022523F4
	b _02252524
_022523F4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02252400: ; jump table
	.short _0225240A - _02252400 - 2 ; case 0
	.short _02252426 - _02252400 - 2 ; case 1
	.short _0225246E - _02252400 - 2 ; case 2
	.short _022524D2 - _02252400 - 2 ; case 3
	.short _022524EE - _02252400 - 2 ; case 4
_0225240A:
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_UnpauseMovement
	ldr r0, [r4, #0x10]
	ldr r1, _0225252C ; =ov01_02205A60
	mov r2, #0
	bl TaskManager_Call
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_02252426:
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r4, #0
	bl sub_02069FB0
	cmp r0, #0
	beq _0225244A
	ldr r0, [r4, #0x44]
	add r1, sp, #0
	bl ov01_022052C4
	str r0, [r6, #4]
	mov r0, #1
	b _0225244E
_0225244A:
	mov r0, #0
	str r0, [r6, #4]
_0225244E:
	str r0, [r6, #8]
	add r0, r4, #0
	mov r2, #0
	mov r1, #0x7b
	str r2, [r6]
	add r4, #0xfb
	add r0, #0xe4
	ldrb r3, [r4]
	ldr r0, [r0]
	lsl r1, r1, #2
	bl FollowPokeMapObjectSetParams
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_0225246E:
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _02252490
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	cmp r0, #4
	blt _02252524
	add r4, #0xe4
	ldr r0, [r4]
	ldr r1, _02252530 ; =0x000003CE
	bl ov01_021FA930
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_02252490:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_0205F35C
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl MapObject_GetGfxID
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_0205E420
	add r2, r4, #0
	add r2, #0xe4
	ldr r2, [r2]
	add r0, r6, #0
	add r1, r7, #0
	bl ov01_021FA108
	add r4, #0xe4
	ldr r0, [r4]
	ldr r1, _02252530 ; =0x000003CE
	bl sub_0205E38C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_022524D2:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl ov01_021FA2D4
	cmp r0, #0
	bne _02252524
	mov r0, #0
	add r4, #0xfc
	strh r0, [r4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252524
_022524EE:
	ldr r0, [r6, #4]
	mov r5, #0
	cmp r0, #0
	bne _022524FA
	mov r5, #1
	b _0225250A
_022524FA:
	bl ov01_022052F4
	cmp r0, #0
	beq _0225250A
	ldr r0, [r6, #4]
	bl sub_02068B48
	mov r5, #1
_0225250A:
	cmp r5, #0
	beq _02252524
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_PauseMovement
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02252524:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225252C: .word ov01_02205A60
_02252530: .word 0x000003CE
	thumb_func_end ov02_022523D0

	thumb_func_start ov02_02252534
ov02_02252534: ; 0x02252534
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0xf4
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xf4
	bl MI_CpuFill8
	str r5, [r4, #8]
	ldr r0, [r5, #0x10]
	ldr r1, _02252558 ; =ov02_0225255C
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02252558: .word ov02_0225255C
	thumb_func_end ov02_02252534

	thumb_func_start ov02_0225255C
ov02_0225255C: ; 0x0225255C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetSys
	add r0, r4, #0
	bl TaskManager_GetEnv
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #5
	bls _0225257E
	b _02252698
_0225257E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225258A: ; jump table
	.short _02252596 - _0225258A - 2 ; case 0
	.short _022525B4 - _0225258A - 2 ; case 1
	.short _022525EA - _0225258A - 2 ; case 2
	.short _0225260C - _0225258A - 2 ; case 3
	.short _02252638 - _0225258A - 2 ; case 4
	.short _0225266E - _0225258A - 2 ; case 5
_02252596:
	mov r1, #4
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	ldr r3, _022526C4 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_022525B4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252698
	add r0, r4, #0
	bl ov02_02252898
	ldr r0, [r4, #8]
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069DC8
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r3, _022526C4 ; =0x00007FFF
	mov r0, #3
	mov r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_022525EA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252698
	ldr r0, [r4, #8]
	bl FollowingPokemon_GetMapObject
	bl sub_0205F484
	add r0, r4, #0
	mov r1, #1
	add r0, #0xf0
	strb r1, [r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_0225260C:
	add r1, r4, #0
	add r1, #0xf2
	ldrb r1, [r1]
	add r2, r1, #1
	add r1, r4, #0
	add r1, #0xf2
	strb r2, [r1]
	add r1, r4, #0
	add r1, #0xf2
	ldrb r1, [r1]
	cmp r1, #0x1e
	blo _02252698
	bl ov02_022526C8
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf2
	strb r1, [r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_02252638:
	add r0, #0xf2
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf2
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xf2
	ldrb r0, [r0]
	cmp r0, #0x50
	blo _02252698
	mov r0, #0x1e
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _022526C4 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02252698
_0225266E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02252698
	add r0, r4, #0
	bl ov02_022526EC
	cmp r0, #0
	beq _02252698
	add r0, r4, #0
	bl ov02_0225296C
	add r0, r4, #4
	bl ov01_021F46DC
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02252698:
	add r0, r4, #0
	add r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0
	beq _022526AA
	add r0, r4, #0
	add r0, #0x2c
	bl ov02_022529C4
_022526AA:
	add r0, r4, #0
	add r0, #0xf1
	ldrb r0, [r0]
	cmp r0, #0
	beq _022526BC
	add r4, #0x68
	add r0, r4, #0
	bl ov01_021FBF68
_022526BC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022526C4: .word 0x00007FFF
	thumb_func_end ov02_0225255C

	thumb_func_start ov02_022526C8
ov02_022526C8: ; 0x022526C8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	mov r1, #0xd
	bl ov01_021F467C
	str r0, [r4, #4]
	ldr r0, _022526E8 ; =ov02_022526FC
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	mov r0, #0
	strb r0, [r4, #2]
	pop {r4, pc}
	nop
_022526E8: .word ov02_022526FC
	thumb_func_end ov02_022526C8

	thumb_func_start ov02_022526EC
ov02_022526EC: ; 0x022526EC
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _022526F6
	mov r0, #1
	bx lr
_022526F6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov02_022526EC

	thumb_func_start ov02_022526FC
ov02_022526FC: ; 0x022526FC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xee
	ldrh r0, [r0]
	cmp r0, #0
	beq _02252716
	cmp r0, #1
	beq _02252746
	add sp, #0xc
	pop {r4, r5, pc}
_02252716:
	ldr r3, _02252760 ; =ov02_02253CE0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	add r1, sp, #0
	strh r0, [r1, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl ov02_02252764
	add r0, r4, #0
	add r0, #0xee
	ldrh r0, [r0]
	add r4, #0xee
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r4]
	pop {r4, r5, pc}
_02252746:
	add r0, r4, #0
	bl ov02_02252888
	cmp r0, #0
	beq _0225275A
	mov r0, #1
	strb r0, [r4, #2]
	add r0, r5, #0
	bl DestroySysTask
_0225275A:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02252760: .word ov02_02253CE0
	thumb_func_end ov02_022526FC

	thumb_func_start ov02_02252764
ov02_02252764: ; 0x02252764
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	strb r1, [r5, #3]
	add r0, #0xe6
	strh r1, [r0]
	add r0, r5, #0
	ldr r1, [r4]
	add r0, #0xe0
	str r1, [r0]
	add r0, r5, #0
	ldrh r1, [r5]
	add r0, #0xe4
	strh r1, [r0]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	add r1, r5, #0
	add r1, #0xea
	strh r0, [r1]
	add r0, r5, #0
	ldrh r1, [r4, #8]
	add r0, #0xec
	mov r2, #1
	strh r1, [r0]
	add r0, r5, #0
	ldr r1, [r4, #4]
	add r0, #0xe8
	strh r1, [r0]
	ldr r0, _022527AC ; =ov02_0225286C
	add r1, r5, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022527AC: .word ov02_0225286C
	thumb_func_end ov02_02252764

	thumb_func_start ov02_022527B0
ov02_022527B0: ; 0x022527B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	ldr r3, _02252864 ; =ov02_02253CD4
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #4
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x24]
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe6
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xe6
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0xe6
	ldrh r6, [r0]
	add r0, r5, #0
	add r0, #0xe8
	ldrh r7, [r0]
	add r0, r5, #0
	add r0, #0xea
	ldrh r4, [r0]
	add r0, r5, #0
	add r0, #0xec
	ldrh r0, [r0]
	sub r1, r0, r4
	add r0, r1, #0
	mul r0, r6
	add r1, r7, #0
	bl _s32_div_f
	add r4, r0, r4
	add r0, r5, #0
	add r0, #0xe0
	ldr r1, [r0]
	add r0, r1, #0
	mul r0, r6
	add r1, r7, #0
	bl _s32_div_f
	add r1, r5, #0
	add r1, #0xe4
	ldrh r1, [r1]
	ldr r3, _02252868 ; =FX_SinCosTable_
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0x10
	bl MTX_RotZ33_
	add r0, sp, #4
	add r1, sp, #0x10
	add r2, sp, #0x34
	bl MTX_MultVec33
	ldr r1, [sp]
	add r0, sp, #0x34
	bl GF_Camera_SetBindTarget
	lsl r0, r4, #0x10
	ldr r1, [sp]
	lsr r0, r0, #0x10
	bl GF_Camera_SetPerspectiveAngle
	add r0, r5, #0
	add r0, #0xe6
	add r5, #0xe8
	ldrh r1, [r0]
	ldrh r0, [r5]
	cmp r1, r0
	blo _0225285E
	add sp, #0x40
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225285E:
	mov r0, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02252864: .word ov02_02253CD4
_02252868: .word FX_SinCosTable_
	thumb_func_end ov02_022527B0

	thumb_func_start ov02_0225286C
ov02_0225286C: ; 0x0225286C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov02_022527B0
	cmp r0, #0
	beq _02252886
	mov r0, #1
	strb r0, [r4, #3]
	add r0, r5, #0
	bl DestroySysTask
_02252886:
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_0225286C

	thumb_func_start ov02_02252888
ov02_02252888: ; 0x02252888
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _02252892
	mov r0, #1
	bx lr
_02252892:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov02_02252888

	thumb_func_start ov02_02252898
ov02_02252898: ; 0x02252898
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r3, _02252968 ; =ov02_02253CEC
	str r0, [sp, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x1c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #4
	str r0, [r2]
	ldr r0, [sp, #8]
	mov r2, #0x20
	add r0, #0xc
	bl GF_ExpHeap_FndInitAllocator
	ldr r0, [sp, #8]
	mov r1, #0xae
	add r0, #0x1c
	mov r2, #0x4b
	mov r3, #4
	bl ov01_021FBCD8
	ldr r0, [sp, #8]
	ldr r4, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0xc]
	add r0, #0x1c
	mov r5, #0
	add r4, #0xc
	add r7, #0x2c
	str r0, [sp, #0xc]
_022528D6:
	mov r0, #4
	str r0, [sp]
	mov r0, #0x14
	mul r0, r5
	str r4, [sp, #4]
	lsl r6, r5, #2
	add r3, sp, #0x1c
	ldr r1, [sp, #0xc]
	ldr r3, [r3, r6]
	add r0, r7, r0
	mov r2, #0xae
	bl ov01_021FBE44
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _022528D6
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	add r0, #0x68
	add r1, #0x1c
	bl ov01_021FBF2C
	ldr r6, [sp, #8]
	ldr r4, [sp, #8]
	mov r5, #0
	add r6, #0x68
	add r4, #0x2c
	mov r7, #0x14
_02252912:
	add r1, r5, #0
	mul r1, r7
	add r0, r6, #0
	add r1, r4, r1
	bl ov01_021FBF50
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02252912
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, #0x68
	bl ov01_021FC004
	ldr r0, [sp, #8]
	mov r1, #0
	add r0, #0x2c
	bl ov02_022529A0
	ldr r0, [sp, #8]
	ldr r0, [r0, #8]
	bl FollowingPokemon_GetMapObject
	add r1, sp, #0x10
	bl MapObject_GetPositionVec
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	add r0, #0x68
	bl ov01_021FC00C
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, #0xf1
	str r0, [sp, #8]
	strb r1, [r0]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02252968: .word ov02_02253CEC
	thumb_func_end ov02_02252898

	thumb_func_start ov02_0225296C
ov02_0225296C: ; 0x0225296C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r0, #0
	str r0, [sp]
	mov r5, #0
	add r4, #0x2c
	add r6, #0xc
	mov r7, #0x14
_0225297C:
	add r0, r5, #0
	mul r0, r7
	add r0, r4, r0
	add r1, r6, #0
	bl ov01_021FBE80
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _0225297C
	ldr r0, [sp]
	add r0, #0x1c
	str r0, [sp]
	bl ov01_021FBDA8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_0225296C

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
	bl ov01_021FBF20
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
	bl ov01_021FBEE4
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
	bl TaskManager_GetSys
	add r0, r4, #0
	bl TaskManager_GetEnv
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
	bl ov01_021FC004
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
	bl ov01_021FBF68
	add r0, r4, #0
	add r0, #0xfc
	bl ov01_021FBF68
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021FBF68
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
	bl ov01_021FBCD8
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
	bl ov01_021FBCD8
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
	bl ov01_021FBE44
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
	bl ov01_021FBE44
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
	bl ov01_021FBF2C
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
	bl ov01_021FBF2C
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
	bl ov01_021FBF50
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
	bl ov01_021FBF50
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
	bl ov01_021FC004
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
	bl ov01_021FC004
	mov r1, #0x61
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #2
	mov r2, #0
	bl ov02_02252E80
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl FollowingPokemon_GetMapObject
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
	bl ov01_021FC00C
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
	bl ov01_021FC00C
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
	bl ov01_021FBE80
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _02252E22
	ldr r0, [sp]
	lsl r1, r0, #4
	ldr r0, [sp, #8]
	add r0, r0, r1
	bl ov01_021FBDA8
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
	bl ov01_021FBE80
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _02252E5C
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov01_021FBDA8
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
	bl ov01_021FBF20
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
	bl ov01_021FBEE4
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
	bl TaskManager_GetSys
	add r0, r5, #0
	bl TaskManager_GetEnv
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
	bl ov01_021FBF68
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
	bl ov01_021FBCD8
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
	bl ov01_021FBE44
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02253064
	add r0, r7, #0
	add r1, r7, #0
	add r0, #0x74
	add r1, #0x14
	bl ov01_021FBF2C
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
	bl ov01_021FBF50
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _022530AE
	add r0, r7, #0
	add r0, #0x74
	mov r1, #1
	bl ov01_021FC004
	add r0, r7, #0
	add r0, #0x24
	mov r1, #4
	mov r2, #0
	bl ov02_02252E80
	ldr r0, [r7]
	bl FollowingPokemon_GetMapObject
	add r1, sp, #0x14
	bl MapObject_GetPositionVec
	add r0, r7, #0
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, #0x74
	bl ov01_021FC00C
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
	bl ov01_021FBE80
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02253114
	add r5, #0x14
	add r0, r5, #0
	bl ov01_021FBDA8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_02253108

	thumb_func_start ov02_02253134
ov02_02253134: ; 0x02253134
	push {r3, r4, r5, r6, r7, lr}
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
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
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
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
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
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

ov02_0225321C:
	.byte 0x0B, 0x00

ov02_0225321E:
	.byte 0x04, 0x00
	.byte 0x05, 0x00

ov02_02253222:
	.byte 0x43, 0x00, 0x42, 0x00, 0x44, 0x00

ov02_02253228:
	.byte 0x45, 0x00, 0x46, 0x00, 0x47, 0x00

ov02_0225322E:
	.byte 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00

ov02_02253234:
	.byte 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00

ov02_0225323A:
	.byte 0x48, 0x00, 0x49, 0x00, 0x4A, 0x00

ov02_02253240:
	.byte 0x39, 0x00, 0x38, 0x00, 0x3A, 0x00

ov02_02253246:
	.byte 0x07, 0x00, 0x08, 0x00, 0x09, 0x00

ov02_0225324C: ; 0x0225324C
	.byte 0x01, 0x09, 0x0A, 0x0E
	.byte 0x02, 0x00, 0x80, 0x00

ov02_02253254: ; 0x02253254
	.byte 0xAE, 0x00, 0x37, 0x03
	.word ov02_02253240
	.byte 0xAE, 0x00, 0x41, 0x03
	.word ov02_02253222

ov02_02253264: ; 0x02253264
	.byte 0xAE, 0x00, 0x0A, 0x01
	.word ov02_0225321C
	.short SEQ_SE_GS_DENKI_TRAP
	.balign 4
	.byte 0xAE, 0x00, 0x03, 0x02
	.word ov02_0225321E
	.short SEQ_SE_GS_DOKU_TRAP
	.balign 4
	.byte 0xAE, 0x00, 0x06, 0x03
	.word ov02_02253246
	.short SEQ_SE_GS_IWA_TRAP
	.balign 4
ov02_02253288:
	.byte 0x1A, 0x1B, 0x00, 0x00

ov02_0225328C:
	.byte 0x16, 0x17, 0x18, 0x19

ov02_02253290: ; 0x02253290
	.byte 0x02, 0x00, 0x00, 0x00

ov02_02253294: ; 0x02253294
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov02_022532A0: ; 0x022532A0
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00

ov02_022532B4: ; 0x022532B4
	.word 0x0A, ov02_022532EC
	.word 0x05, ov02_022532DC
	.word 0x07, ov02_022532E4
	.word 0x04, ov02_0225328C
	.word 0x02, ov02_02253288

ov02_022532DC:
	.byte 0x11, 0x12, 0x13, 0x14, 0x15, 0x00, 0x00, 0x00

ov02_022532E4:
	.byte 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x00

ov02_022532EC:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x00

ov02_022532F8:
	.word ov02_02248E10

ov02_022532FC: ; 0x022532FC
	.byte 0x07, 0x00, 0x08, 0x00

ov02_02253300:
	.word ov02_0224AC28

ov02_02253304: ; 0x02253304
	.byte 0x11, 0x00, 0x14, 0x00, 0x17, 0x00

ov02_0225330A: ; 0x0225330A
	.byte 0x13, 0x00, 0x16, 0x00, 0x19, 0x00

ov02_02253310: ; 0x02253310
	.byte 0x12, 0x00, 0x15, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov02_02253320: ; 0x02253320
	.word ov02_022532F8, ov02_022534D0, 0x01, 0x0F

ov02_02253330:
	.word ov02_0224ACE0, ov02_0224ADEC, 0x00, 0x06
	.byte 0x01, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00

ov02_02253348: ; 0x02253348
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x40, 0x05, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov02_02253354: ; 0x02253354
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x80, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_02253360: ; 0x02253360
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_0225336C: ; 0x0225336C
	.byte 0x00, 0x14, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_02253378: ; 0x02253378
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov02_02253384: ; 0x02253384
	.byte 0x00, 0x80, 0x12, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_02253390: ; 0x02253390
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_0225339C: ; 0x0225339C
	.byte 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0xF0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_022533A8: ; 0x022533A8
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov02_022533B4: ; 0x022533B4
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_022533C0: ; 0x022533C0
	.word ov02_02253300
	.word ov02_02253330
	.word ov02_02253420

ov02_022533CC: ; 0x022533CC
	.byte 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_022533D8: ; 0x022533D8
	.byte 0x00, 0x80, 0x08, 0x00, 0x00, 0xF0, 0x04, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov02_022533E4: ; 0x022533E4
	.byte 0x00, 0x80, 0x08, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_022533F0: ; 0x022533F0
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_022533FC: ; 0x022533FC
	.byte 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_02253408: ; 0x02253408
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov02_02253414: ; 0x02253414
	.byte 0x00, 0x80, 0x12, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_02253420:
	.word ov02_0224AF70, ov02_0224B0E0, ov02_0224B158, ov02_0224B294

ov02_02253430: ; 0x02253430
	.byte 0x00, 0xC0, 0xFF, 0xFF, 0x00, 0xA0, 0xFF, 0xFF, 0x00, 0x90, 0xFF, 0xFF, 0x00, 0x80, 0xFF, 0xFF

ov02_02253440: ; 0x02253440
	.byte 0x08, 0x00, 0x00, 0x00
	.word ov02_0224B6D0
	.word sub_02068DD4
	.word ov02_0224B6E4
	.word sub_02068DD0

ov02_02253454: ; 0x02253454
	.byte 0x74, 0x00, 0x00, 0x00
	.word ov02_02248D98
	.word ov02_02248DE4
	.word ov02_02248DF0
	.word sub_02068DD0

ov02_02253468: ; 0x02253468
	.byte 0x24, 0x00, 0x00, 0x00
	.word ov02_0224AA80
	.word ov02_0224AAC8
	.word ov02_0224AAD4
	.word ov02_0224AB54

ov02_0225347C: ; 0x0225347C
	.byte 0x68, 0x00, 0x00, 0x00
	.word ov02_0224ABCC
	.word ov02_0224ABF8
	.word ov02_0224AC04
	.word ov02_0224AC24

ov02_02253490: ; 0x02253490
	.byte 0x0C, 0x00, 0x00, 0x00
	.word ov02_0224B7CC
	.word ov02_0224B804
	.word ov02_0224B808
	.word ov02_0224B87C

ov02_022534A4: ; 0x022534A4
	.byte 0x24, 0x00, 0x00, 0x00
	.word ov02_0224B350
	.word sub_02068DD4
	.word ov02_0224B3FC
	.word sub_02068DD0

ov02_022534B8: ; 0x022534B8
	.word ov02_0224B494
	.word ov02_0224B4AC
	.word ov02_0224B5F0
	.word ov02_0224B638
	.word ov02_0224B664
	.word ov02_0224B68C

ov02_022534D0:
	.word ov02_02248F88
	.word ov02_02249088
	.word ov02_022490BC
	.word ov02_022491A8
	.word ov02_022491CC
	.word ov02_02249290
	.word ov02_0224939C
	.word ov02_022493EC

ov02_022534F0: ; 0x022534F0
	.word ov02_022495D0
	.word ov02_02249A5C
	.word ov02_0224B938
	.word ov02_0224B964
	.word ov02_02249AD8
	.word ov02_02249AF0
	.word ov02_02249B80
	.word ov02_02249BA8
	.word ov02_02249C74
	.word ov02_02249CD8
	.word ov02_02249954
	.word ov02_0224997C

ov02_02253520: ; 0x02253520
	.byte 0x00, 0x40, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0xC0, 0xFE, 0xFF, 0x00, 0x80, 0xFE, 0xFF
	.byte 0x00, 0x60, 0xFE, 0xFF, 0x00, 0x40, 0xFE, 0xFF, 0x00, 0x40, 0xFE, 0xFF, 0x00, 0x40, 0xFE, 0xFF
	.byte 0x00, 0x60, 0xFE, 0xFF, 0x00, 0x80, 0xFE, 0xFF, 0x00, 0xA0, 0xFE, 0xFF, 0x00, 0xC0, 0xFE, 0xFF

ov02_02253550: ; 0x02253550
	.word ov02_022495B8
	.word ov02_022495E8
	.word ov02_02249658
	.word ov02_02249690
	.word ov02_022496D0
	.word ov02_02249754
	.word ov02_02249774
	.word ov02_022497C0
	.word ov02_02249838
	.word ov02_02249858
	.word ov02_022498BC
	.word ov02_02249940
	.word ov02_02249968
	.word ov02_0224997C

ov02_02253588: ; 0x02253588
	.word ov02_022495B8
	.word ov02_022499EC
	.word ov02_02249658
	.word ov02_02249690
	.word ov02_022496D0
	.word ov02_02249754
	.word ov02_02249774
	.word ov02_022497C0
	.word ov02_02249838
	.word ov02_02249858
	.word ov02_02249AC4
	.word ov02_02249AD8
	.word ov02_02249AF0
	.word ov02_02249B10
	.word ov02_02249B38
	.word ov02_02249B60
	.word ov02_02249BA8
	.word ov02_02249BD8
	.word ov02_02249C74
	.word ov02_02249CD8
	.word ov02_02249940
	.word ov02_02249968
	.word ov02_0224997C

ov02_022535E4: ; 0x022535E4
	.byte 0x00, 0xF0, 0x00, 0x00, 0x00, 0xF0, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x04, 0x00, 0x00, 0x30, 0x04, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0xD0, 0x03, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0F, 0x00, 0x00, 0x50, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0xE0, 0x04, 0x00, 0x00, 0x80, 0x01, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0xB0, 0x05, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00
	.byte 0x00, 0x60, 0x05, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x03, 0x00, 0x00, 0x40, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x05, 0x00, 0x00, 0xD0, 0x06, 0x00, 0x00, 0x80, 0x01, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x09, 0x00, 0x00, 0x40, 0x06, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x01, 0x00
	.byte 0x00, 0xE0, 0x07, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0xC0, 0x08, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0x80, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x0D, 0x00, 0x00, 0xC0, 0x07, 0x00, 0x00, 0x80, 0x01, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov02_022536E8: ; 0x022536E8
	.byte 0x21, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00

ov02_022536F0: ; 0x022536F0
	.word ov02_0224C234
	.word ov02_0224C2A8
	.word ov02_0224C2EC
	.word ov02_0224C338

ov02_02253700: ; 0x02253700
	.word ov02_0224C05C
	.word ov02_0224C0B0
	.word ov02_0224C14C
	.word ov02_0224C1B8

ov02_02253710: ; 0x02253710
	.word ov02_0224C87C
	.word ov02_0224C8D0
	.word ov02_0224C93C
	.word ov02_0224C9B8
	.word ov02_0224CA38

ov02_02253724: ; 0x02253724
	.word ov02_0224C4B4
	.word ov02_0224C4D8
	.word ov02_0224C71C
	.word ov02_0224C75C
	.word ov02_0224C7D4
	.word ov02_0224C840

ov02_0225373C: ; 0x0225373C
	.word ov02_0224C680
	.word ov02_0224C698
	.word ov02_0224C6DC
	.word ov02_0224C75C
	.word ov02_0224C7D4
	.word ov02_0224C840

ov02_02253754: ; 0x02253754
	.word ov02_0224C4B4
	.word ov02_0224C4D8
	.word ov02_0224C87C
	.word ov02_0224C8D0
	.word ov02_0224C93C
	.word ov02_0224C9B8
	.word ov02_0224CA38

ov02_02253770: ; 0x02253770
	.byte 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00
	.byte 0xFE, 0x00, 0x00, 0x00

ov02_02253794: ; 0x02253794
	.byte 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00

ov02_022537B8: ; 0x022537B8
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00

ov02_022537DC: ; 0x022537DC
	.byte 0x01, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00

ov02_02253820: ; 0x02253820
	.byte 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0xFE, 0x00, 0x00, 0x00

ov02_02253884: ; 0x02253884
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x3C, 0x00, 0x04, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0x3C, 0x00, 0x05, 0x00, 0x01, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00

ov02_022538EC: ; 0x022538EC
	.byte 0x10, 0x0F, 0x0E, 0x0B
	.byte 0x0C, 0x09, 0xB4, 0x00, 0x00, 0x00, 0x0E, 0x01, 0x5A, 0x00, 0x00, 0x00

ov02_022538FC: ; 0x022538FC
	.byte 0x00, 0x04, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.word ov02_0224D310
	.word ov02_0224D3A4
	.word ov02_0224D3B4
	.word ov02_0224D3E8

ov02_02253914: ; 0x02253914
	.byte 0x00, 0x04, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.word ov02_0224D5B4
	.word ov02_0224D648
	.word ov02_0224D658
	.word ov02_0224D670

ov02_0225392C: ; 0x0225392C
	.byte 0x00, 0x04, 0x00, 0x00, 0x14, 0x01, 0x00, 0x00
	.word ov02_0224DAA4
	.word ov02_0224DB8C
	.word ov02_0224DB9C
	.word ov02_0224DC58

ov02_02253944: ; 0x02253944
	.byte 0x00, 0x04, 0x00, 0x00, 0xCC, 0x01, 0x00, 0x00
	.word ov02_0224D43C
	.word ov02_0224D468
	.word ov02_0224D488
	.word ov02_0224D580

ov02_0225395C: ; 0x0225395C
	.byte 0x00, 0x04, 0x00, 0x00, 0x10, 0x0D, 0x00, 0x00
	.word ov02_0224D880
	.word ov02_0224D914
	.word ov02_0224D950
	.word ov02_0224D98C

ov02_02253974: ; 0x02253974
	.byte 0x00, 0x04, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.word ov02_0224D1E4
	.word ov02_0224D278
	.word ov02_0224D288
	.word ov02_0224D2BC

ov02_0225398C: ; 0x0225398C
	.byte 0x00, 0x04, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.word ov02_0224D358
	.word ov02_0224D3A4
	.word ov02_0224D3B4
	.word ov02_0224D3E8

ov02_022539A4: ; 0x022539A4
	.byte 0x00, 0x04, 0x00, 0x00, 0x14, 0x01, 0x00, 0x00
	.word ov02_0224D9C0
	.word ov02_0224DB8C
	.word ov02_0224DB9C
	.word ov02_0224DC58

ov02_022539BC: ; 0x022539BC
	.byte 0x00, 0x04, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.word ov02_0224D22C
	.word ov02_0224D278
	.word ov02_0224D288
	.word ov02_0224D2BC

ov02_022539D4: ; 0x022539D4
	.byte 0x00, 0x04, 0x00, 0x00, 0x9C, 0x0E, 0x00, 0x00
	.word ov02_0224DCB0
	.word ov02_0224DD4C
	.word ov02_0224DD8C
	.word ov02_0224DDC8

ov02_022539EC: ; 0x022539EC
	.byte 0x00, 0x04, 0x00, 0x00, 0x9C, 0x0E, 0x00, 0x00
	.word ov02_0224DD38
	.word ov02_0224DD4C
	.word ov02_0224DD8C
	.word ov02_0224DDC8

ov02_02253A04: ; 0x02253A04
	.word ov02_0224D2F0
	.word ov02_0224D41C
	.word ov02_0224D41C
	.word ov02_0224D2F0
	.word ov02_0224DC8C
	.word ov02_0224DC8C

ov02_02253A1C: ; 0x02253A1C
	.word ov02_0224D2C8
	.word ov02_0224D3F4
	.word ov02_0224D408
	.word ov02_0224D2DC
	.word ov02_0224DC64
	.word ov02_0224DC78

ov02_02253A34: ; 0x02253A34
	.word ov02_0224D2F8
	.word ov02_0224D424
	.word ov02_0224D424
	.word ov02_0224D2F8
	.word ov02_0224DC94
	.word ov02_0224DC94

ov02_02253A4C: ; 0x02253A4C
	.byte 0xFF, 0x01, 0xFF, 0x01
	.byte 0x01, 0xFF, 0x00, 0x00

ov02_02253A54: ; 0x02253A54
	.byte 0x01, 0x02, 0x04, 0x08, 0x10, 0x00, 0x00, 0x00

ov02_02253A5C: ; 0x02253A5C
	.byte 0xB5, 0x00, 0x00, 0x00
	.byte 0xB6, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00

ov02_02253A70: ; 0x02253A70
	.byte 0x49, 0x00, 0x01, 0x00, 0x30, 0x00, 0x01, 0x00, 0x3E, 0x00, 0x01, 0x00, 0x4A, 0x00, 0x01, 0x00
	.byte 0xFE, 0x00, 0x00, 0x00, 0x49, 0x00, 0x01, 0x00, 0x31, 0x00, 0x01, 0x00, 0x3E, 0x00, 0x01, 0x00
	.byte 0x4A, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x49, 0x00, 0x01, 0x00, 0x32, 0x00, 0x01, 0x00
	.byte 0x3E, 0x00, 0x01, 0x00, 0x4A, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x49, 0x00, 0x01, 0x00
	.byte 0x33, 0x00, 0x01, 0x00, 0x3E, 0x00, 0x01, 0x00, 0x4A, 0x00, 0x01, 0x00, 0xFE, 0x00, 0x00, 0x00

ov02_02253AC0: ; 0x02253AC0
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00

ov02_02253B24: ; 0x02253B24
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov02_02253B30: ; 0x02253B30
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov02_02253B3C: ; 0x02253B3C
	.byte 0x2F, 0x30, 0x31, 0x32
	.byte 0x33, 0x34, 0x00, 0x00

ov02_02253B44: ; 0x02253B44
	.byte 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x00, 0x00

ov02_02253B4C: ; 0x02253B4C
	.byte 0x03, 0x00, 0x00, 0x00, 0xB8, 0x04, 0x00, 0x00
	.word ov02_02250BC4
	.word ov02_02250EC0
	.word ov02_02250F1C
	.word ov02_02250FE0

ov02_02253B64: ; 0x02253B64
	.byte 0x00, 0xD0, 0xF3, 0xFF, 0x52, 0xB6, 0xF6, 0xFF, 0xEF, 0x2C, 0xFD, 0xFF
	.byte 0x00, 0x60, 0x0C, 0x00, 0x52, 0xB6, 0xF6, 0xFF, 0xEF, 0x2C, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xF9, 0xC3, 0xFD, 0xFF, 0x3D, 0x8F, 0xFE, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x1E, 0xFA, 0x1E, 0x00
	.byte 0xAE, 0xCB, 0x01, 0x00

ov02_02253B94: ; 0x02253B94
	.byte 0x00, 0x10, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF3, 0xFF
	.byte 0x00, 0xF0, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF3, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xFA, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xF0, 0xE4, 0xFF

ov02_02253BC4: ; 0x02253BC4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xF1, 0xFF

ov02_02253BD0: ; 0x02253BD0
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x62, 0xF5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x62, 0xF5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0x62, 0xF7, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x0C, 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00
	.byte 0xA2, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x0C, 0x00, 0x00, 0x00, 0x00

ov02_02253C20: ; 0x02253C20
	.byte 0xC1, 0xAE, 0x29, 0x00, 0xE2, 0xDF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0xE2, 0xDF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00, 0xF2, 0xDE, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x29, 0x00
	.byte 0xF2, 0xDE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0xC1, 0xAE, 0x29, 0x00

ov02_02253C74: ; 0x02253C74
	.byte 0xF2, 0xDE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x00, 0x00, 0x00

ov02_02253C84: ; 0x02253C84
	.byte 0x01, 0x00

ov02_02253C86: ; 0x02253C86
	.byte 0x0D, 0x00

ov02_02253C88: ; 0x02253C88
	.byte 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x55, 0x00, 0x01, 0x00, 0x09, 0x00, 0x5D, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00
	.byte 0x8E, 0x00, 0x01, 0x00, 0x18, 0x00, 0x8F, 0x00, 0x01, 0x00, 0x18, 0x00, 0x90, 0x00, 0x01, 0x00
	.byte 0x18, 0x00, 0x91, 0x00, 0x01, 0x00, 0x18, 0x00, 0x92, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov02_02253CD4: ; 0x02253CD4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov02_02253CE0: ; 0x02253CE0
	.byte 0x00, 0x00, 0xFF, 0xFF, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00

ov02_02253CEC: ; 0x02253CEC
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

	.data

ov02_02253D80: ; 0x02253D80
	.word ov02_0225322E

ov02_02253D84: ; 0x02253D84
	.word ov02_02253234
	.word ov02_02253228
	.word ov02_0225323A

ov02_02253D90: ; 0x02253D90
	.byte 0x00, 0xB8, 0xFF, 0xFF

ov02_02253D94: ; 0x02253D94
	.byte 0x00, 0xC0, 0x00, 0x00

ov02_02253D98: ; 0x02253D98
	.byte 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0x48, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00

ov02_02253DD8: ; 0x02253DD8
	.byte 0x00, 0xB8, 0xFF, 0xFF

ov02_02253DDC: ; 0x02253DDC
	.byte 0x00, 0xC0, 0x00, 0x00

ov02_02253DE0: ; 0x02253DE0
	.byte 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0x48, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB8, 0xFF, 0xFF
	.byte 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB8, 0xFF, 0xFF, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0x48, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00
_02253E20:
