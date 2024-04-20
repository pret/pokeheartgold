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
	bl TaskManager_GetEnvironment
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
	bl TaskManager_GetFieldSystem
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
	bl Camera_SetLookAtCamTarget
	add r6, #0x18
	ldr r1, [r5, #0x24]
	add r0, r6, #0
	bl Camera_SetLookAtCamPos
	mov r0, #0x14
	add r6, r7, #0
	mul r6, r0
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	ldr r0, [r0, r6]
	bl Camera_SetDistance
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	add r0, r0, r6
	add r0, r0, #4
	bl Camera_SetAnglePos
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r5, #0x24]
	add r0, r0, r6
	ldrh r0, [r0, #0xe]
	bl Camera_SetPerspectiveAngle
	ldr r0, _022514C0 ; =0x000004B4
	ldr r1, [r4, r0]
	mov r0, #0xc
	mul r0, r7
	add r0, r1, r0
	ldr r1, [r5, #0x24]
	bl Camera_OffsetLookAtPosAndTarget
	mov r0, #0x96
	ldr r1, _022514C4 ; =0x006A4000
	ldr r2, [r5, #0x24]
	lsl r0, r0, #0xc
	bl Camera_SetPerspectiveClippingPlane
	ldr r1, [r5, #0x24]
	add r0, sp, #8
	bl Camera_GetLookAtCamTarget
	ldr r0, [r5, #0x24]
	bl Camera_GetCurrentTarget
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl Camera_GetAngle
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
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #8]
	bl IsCameraTranslationFinished
	cmp r0, #0
	beq _0225159C
	ldr r1, [r4, #0x24]
	add r0, sp, #8
	bl Camera_GetLookAtCamTarget
	ldr r0, [r4, #0x24]
	bl Camera_GetCurrentTarget
	ldr r1, [r4, #0x24]
	add r0, sp, #0
	bl Camera_GetAngle
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
	bl TaskManager_GetFieldSystem
	str r0, [sp, #8]
	add r0, r5, #0
	bl TaskManager_GetEnvironment
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
	bl MapObject_SetVisible
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
	bl SysTask_CreateOnMainQueue
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
	bl SysTask_CreateOnMainQueue
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
	bl GfGfx_EngineATogglePlanes
	mov r0, #8
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
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
	bl SysTask_Destroy
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
	bl GfGfx_EngineATogglePlanes
	mov r0, #8
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
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
	bl Camera_GetDistance
	str r0, [r4]
	ldr r1, [r5, #0x24]
	add r0, sp, #0
	bl Camera_GetAngle
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
	bl Camera_GetLookAtCamTarget
	add r3, sp, #8
	ldmia r3!, {r0, r1}
	add r2, sp, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0x24]
	bl Camera_GetCurrentTarget
	add r2, r4, #0
	add r1, r0, #0
	add r0, sp, #0x14
	add r2, #0xc
	bl VEC_Subtract
	ldr r0, [r5, #0x24]
	bl Camera_GetPerspectiveAngle
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x24]
	bl Camera_GetPerspectiveClippingPlaneNear
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x24]
	bl Camera_GetPerspectiveClippingPlaneFar
	str r0, [r4, #0x20]
	ldr r0, _02251DB0 ; =0x0029AEC1
	ldr r1, [r5, #0x24]
	bl Camera_SetDistance
	ldr r0, _02251DB4 ; =ov02_02253C74
	ldr r1, [r5, #0x24]
	bl Camera_SetAnglePos
	ldr r0, _02251DB8 ; =0x000005C1
	ldr r1, [r5, #0x24]
	bl Camera_SetPerspectiveAngle
	ldr r0, _02251DBC ; =ov02_02253BC4
	ldr r1, [r5, #0x24]
	bl Camera_OffsetLookAtPosAndTarget
	mov r0, #0x96
	ldr r1, _02251DC0 ; =0x006A4000
	ldr r2, [r5, #0x24]
	lsl r0, r0, #0xc
	bl Camera_SetPerspectiveClippingPlane
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
	bl TaskManager_GetEnvironment
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
	bl Camera_SetPerspectiveClippingPlane
	mov r0, #1
	pop {r4, r5, r6, pc}
_02251E70:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov02_02251E44

    .rodata

ov02_02253B3C: ; 0x02253B3C
	.byte 0x2F, 0x30, 0x31, 0x32
	.byte 0x33, 0x34, 0x00, 0x00

ov02_02253B44: ; 0x02253B44
	.byte 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x00, 0x00

ov02_02253B4C: ; 0x02253B4C
	.word 3
	.short 0x4B8
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
