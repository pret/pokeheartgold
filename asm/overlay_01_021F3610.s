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
	.include "overlay_01_021F3610.inc"
	.include "global.inc"

	.extern ov01_021F3B84

	.text

	thumb_func_start MapPropManager_LoadOne
MapPropManager_LoadOne: ; 0x021F3C0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r4, _021F3C98 ; =ov01_02206A78
	add r7, r2, #0
	add r6, r0, #0
	mov ip, r1
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r4, #0
	str r0, [r3]
	mov r0, #0x38
_021F3C28:
	add r1, r4, #0
	mul r1, r0
	add r5, r6, r1
	ldr r1, [r5, #4]
	cmp r1, #0
	bne _021F3C84
	mov r0, #1
	str r0, [r5, #4]
	add r3, r5, #0
	add r3, #0x14
	ldmia r7!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r7]
	cmp r2, #0
	str r0, [r3]
	beq _021F3C5A
	mov r0, #1
	str r0, [r5, #0xc]
	add r3, r5, #0
	ldmia r2!, {r0, r1}
	add r3, #0x20
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	b _021F3C5E
_021F3C5A:
	mov r0, #0
	str r0, [r5, #0xc]
_021F3C5E:
	add r2, sp, #0
	add r3, r5, #0
	ldmia r2!, {r0, r1}
	add r3, #0x2c
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	mov r1, ip
	str r0, [r3]
	mov r0, ip
	str r0, [r5]
	mov r0, #7
	lsl r0, r0, #8
	ldr r0, [r6, r0]
	bl ov01_022040F8
	str r0, [r5, #0x10]
	add sp, #0xc
	add r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_021F3C84:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #0x20
	blo _021F3C28
	bl GF_AssertFail
	mov r0, #0x20
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F3C98: .word ov01_02206A78
	thumb_func_end MapPropManager_LoadOne

	thumb_func_start ov01_021F3C9C
ov01_021F3C9C: ; 0x021F3C9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r4, _021F3D34 ; =ov01_02206AB4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r3, sp, #0x14
	mov r2, #4
_021F3CAA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F3CAA
	ldr r0, [r4]
	mov r4, #0
	str r0, [r3]
	add r7, sp, #0x14
_021F3CBA:
	mov r0, #0x38
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	add r5, r0, r1
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F3D24
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _021F3D24
	ldr r0, [sp, #0xc]
	bl ov01_021FB9F4
	add r6, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	add r2, sp, #0x10
	bl ov01_021EA7F8
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021F3CF2
	add r1, r5, #0
	add r0, r7, #0
	add r1, #0x20
	bl sub_02020D2C
_021F3CF2:
	add r0, sp, #0x10
	ldrh r0, [r0]
	cmp r0, #0
	bne _021F3D0C
	add r1, r5, #0
	ldr r0, [r5, #0x10]
	add r5, #0x2c
	add r1, #0x14
	add r2, r7, #0
	add r3, r5, #0
	bl GF3dRender_DrawModel
	b _021F3D24
_021F3D0C:
	str r6, [sp]
	ldr r0, [r5]
	add r1, r5, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	add r5, #0x2c
	ldr r0, [r0, #0x54]
	add r1, #0x14
	add r2, r7, #0
	add r3, r5, #0
	bl ov01_021F3B84
_021F3D24:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x20
	blo _021F3CBA
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3D34: .word ov01_02206AB4
	thumb_func_end ov01_021F3C9C

	.rodata

	.public ov01_02206A78
ov01_02206A78: ; 0x02206A78
	.word 0x1000
	.word 0x1000
	.word 0x1000

	.public ov01_02206A84
ov01_02206A84: ; 0x02206A84
	.word 0x1000
	.word 0x1000
	.word 0x1000

	.public ov01_02206A90
ov01_02206A90: ; 0x02206A90
	.word 0x1000, 0x0000, 0x0000
	.word 0x0000, 0x1000, 0x0000
	.word 0x0000, 0x0000, 0x1000

	.public ov01_02206AB4
ov01_02206AB4: ; 0x02206AB4
	.word 0x1000, 0x0000, 0x0000
	.word 0x0000, 0x1000, 0x0000
	.word 0x0000, 0x0000, 0x1000
