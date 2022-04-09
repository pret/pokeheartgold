#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021F3378
ov01_021F3378: ; 0x021F3378
	add r1, r0, #0
	ldr r0, [r1, #0x10]
	cmp r0, #3
	bhi _021F33AA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F338C: ; jump table
	.short _021F3394 - _021F338C - 2 ; case 0
	.short _021F33A0 - _021F338C - 2 ; case 1
	.short _021F339A - _021F338C - 2 ; case 2
	.short _021F33A6 - _021F338C - 2 ; case 3
_021F3394:
	mov r0, #2
	str r0, [r1, #0x10]
	b _021F33AA
_021F339A:
	mov r0, #1
	str r0, [r1, #0x10]
	b _021F33AA
_021F33A0:
	mov r0, #3
	str r0, [r1, #0x10]
	b _021F33AA
_021F33A6:
	mov r0, #0
	str r0, [r1, #0x10]
_021F33AA:
	ldr r0, [r1]
	ldr r3, _021F33B4 ; =PlayerAvatar_SetFacingDirection
	ldr r0, [r0, #0x40]
	ldr r1, [r1, #0x10]
	bx r3
	.balign 4, 0
_021F33B4: .word PlayerAvatar_SetFacingDirection
	thumb_func_end ov01_021F3378

	thumb_func_start ov01_021F33B8
ov01_021F33B8: ; 0x021F33B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021F33D8
	cmp r0, #1
	beq _021F33E2
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_021F33D8:
	mov r0, #1
	str r0, [r5, #8]
	ldr r0, _021F3480 ; =SEQ_SE_DP_TELE2
	bl PlaySE
_021F33E2:
	ldr r0, [r5, #0xc]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _021F33F8
	add r0, r5, #0
	bl ov01_021F3378
_021F33F8:
	add r0, r6, #0
	add r1, sp, #0x18
	bl sub_0205F990
	ldr r4, [r5, #0xc]
	add r0, r4, #0
	bl _dflt
	str r0, [sp, #0x14]
	lsl r0, r4, #0xb
	str r1, [sp, #0x10]
	bl _dflt
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, _021F3484 ; =0x9999999A
	ldr r1, _021F3488 ; =0x40C19999
	bl _dadd
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	bl _dmul
	bl _dfix
	str r0, [sp, #0x1c]
	add r0, r6, #0
	add r1, sp, #0x18
	bl sub_0205F9A0
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0x14
	bne _021F345E
	mov r0, #6
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_021F345E:
	ble _021F347A
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021F347A
	ldr r0, [r5, #4]
	mov r1, #1
	str r1, [r0]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	bl DestroySysTask
_021F347A:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_021F3480: .word SEQ_SE_DP_TELE2
_021F3484: .word 0x9999999A
_021F3488: .word 0x40C19999
	thumb_func_end ov01_021F33B8

	thumb_func_start ov01_021F348C
ov01_021F348C: ; 0x021F348C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	ldr r1, [r5, #8]
	add r4, r0, #0
	cmp r1, #0
	beq _021F34B0
	cmp r1, #1
	beq _021F3508
	cmp r1, #2
	beq _021F3590
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_021F34B0:
	bl MapObject_UnpauseMovement
	add r0, r4, #0
	add r1, sp, #0x14
	bl sub_0205F990
	ldr r1, [r5, #0xc]
	mov r0, #0x14
	sub r6, r0, r1
	add r0, r6, #0
	bl _dflt
	str r0, [sp, #0xc]
	lsl r0, r6, #0xb
	add r7, r1, #0
	bl _dflt
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, _021F35B8 ; =0x9999999A
	ldr r1, _021F35BC ; =0x40C19999
	bl _dadd
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	bl _dmul
	bl _dfix
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r1, sp, #0x14
	bl sub_0205F9A0
	add r0, r4, #0
	bl ov01_021F92A0
	ldr r0, _021F35C0 ; =SEQ_SE_DP_TELE2
	bl PlaySE
	mov r0, #1
	str r0, [r5, #8]
_021F3508:
	ldr r0, [r5, #0xc]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _021F351E
	add r0, r5, #0
	bl ov01_021F3378
_021F351E:
	add r0, r4, #0
	add r1, sp, #0x14
	bl sub_0205F990
	ldr r1, [r5, #0xc]
	mov r0, #0x14
	sub r6, r0, r1
	add r0, r6, #0
	bl _dflt
	str r0, [sp, #0x10]
	lsl r0, r6, #0xb
	add r7, r1, #0
	bl _dflt
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, _021F35B8 ; =0x9999999A
	ldr r1, _021F35BC ; =0x40C19999
	bl _dadd
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	bl _dmul
	bl _dfix
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r1, sp, #0x14
	bl sub_0205F9A0
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	cmp r0, #2
	bne _021F3582
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	add r1, r0, #0
	add r2, r0, #0
	mov r3, #0
	bl BeginNormalPaletteFade
_021F3582:
	ldr r0, [r5, #0xc]
	cmp r0, #0x14
	ble _021F35B4
	mov r0, #2
	add sp, #0x20
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_021F3590:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021F35B4
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_SetFacingDirection
	ldr r0, [r5, #4]
	mov r1, #1
	str r1, [r0]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_021F35B4:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F35B8: .word 0x9999999A
_021F35BC: .word 0x40C19999
_021F35C0: .word SEQ_SE_DP_TELE2
	thumb_func_end ov01_021F348C

	thumb_func_start ov01_021F35C4
ov01_021F35C4: ; 0x021F35C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x14
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	str r5, [r4]
	str r7, [r4, #4]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	str r0, [r4, #0x10]
	cmp r6, #0
	beq _021F35FA
	ldr r0, _021F3608 ; =ov01_021F33B8
	add r1, r4, #0
	mov r2, #0x64
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
_021F35FA:
	ldr r0, _021F360C ; =ov01_021F348C
	add r1, r4, #0
	mov r2, #0x64
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3608: .word ov01_021F33B8
_021F360C: .word ov01_021F348C
	thumb_func_end ov01_021F35C4
