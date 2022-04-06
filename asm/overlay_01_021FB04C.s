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

	thumb_func_start ov01_021FB04C
ov01_021FB04C: ; 0x021FB04C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	mov r2, #0x18
	add r4, r1, #0
	bl MIi_CpuClear32
	add r0, r5, #0
	mov r1, #4
	add r2, sp, #0
	bl NARC_ReadFile
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	bl NARC_ReadFile
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #4
	bl NARC_ReadFile
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #2
	add r2, #8
	bl NARC_ReadFile
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #2
	add r2, #0xc
	bl NARC_ReadFile
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #2
	add r2, #0x10
	bl NARC_ReadFile
	add r4, #0x14
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	bl NARC_ReadFile
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB04C

	thumb_func_start ov01_021FB0B0
ov01_021FB0B0: ; 0x021FB0B0
	push {r3, r4, r5, lr}
	add r3, r0, #0
	add r0, r2, #0
	ldr r2, [r0]
	mov r4, #0
	str r2, [r1, #0x10]
	ldr r2, [r3]
	lsl r2, r2, #3
	add r2, r4, r2
	ldr r4, [r0]
	add r4, r4, r2
	str r4, [r1, #0x14]
	ldr r5, [r3, #4]
	mov r4, #0xc
	mul r4, r5
	add r2, r2, r4
	ldr r4, [r0]
	add r4, r4, r2
	str r4, [r1, #4]
	ldr r4, [r3, #8]
	lsl r4, r4, #2
	add r2, r2, r4
	ldr r4, [r0]
	add r4, r4, r2
	str r4, [r1]
	ldr r4, [r3, #0xc]
	lsl r4, r4, #3
	add r2, r2, r4
	ldr r4, [r0]
	add r4, r4, r2
	str r4, [r1, #8]
	ldr r4, [r3, #0x10]
	ldr r0, [r0]
	lsl r4, r4, #3
	add r2, r2, r4
	add r0, r0, r2
	str r0, [r1, #0xc]
	ldr r0, [r3, #0x14]
	lsl r0, r0, #1
	add r1, r2, r0
	mov r0, #9
	lsl r0, r0, #0xc
	cmp r1, r0
	ble _021FB10C
	bl GF_AssertFail
_021FB10C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB0B0

	thumb_func_start ov01_021FB110
ov01_021FB110: ; 0x021FB110
	add r3, r1, #0
	ldr r1, [r2]
	ldr r2, [r3, #0x10]
	ldr r3, _021FB11C ; =NARC_ReadFile
	lsl r1, r1, #3
	bx r3
	.balign 4, 0
_021FB11C: .word NARC_ReadFile
	thumb_func_end ov01_021FB110

	thumb_func_start ov01_021FB120
ov01_021FB120: ; 0x021FB120
	ldr r2, [r2, #4]
	add r3, r1, #0
	mov r1, #0xc
	mul r1, r2
	ldr r2, [r3, #0x14]
	ldr r3, _021FB130 ; =NARC_ReadFile
	bx r3
	nop
_021FB130: .word NARC_ReadFile
	thumb_func_end ov01_021FB120

	thumb_func_start ov01_021FB134
ov01_021FB134: ; 0x021FB134
	add r3, r1, #0
	ldr r1, [r2, #8]
	ldr r2, [r3, #4]
	ldr r3, _021FB140 ; =NARC_ReadFile
	lsl r1, r1, #2
	bx r3
	.balign 4, 0
_021FB140: .word NARC_ReadFile
	thumb_func_end ov01_021FB134

	thumb_func_start ov01_021FB144
ov01_021FB144: ; 0x021FB144
	add r3, r1, #0
	ldr r1, [r2, #0xc]
	ldr r2, [r3]
	ldr r3, _021FB150 ; =NARC_ReadFile
	lsl r1, r1, #3
	bx r3
	.balign 4, 0
_021FB150: .word NARC_ReadFile
	thumb_func_end ov01_021FB144

	thumb_func_start ov01_021FB154
ov01_021FB154: ; 0x021FB154
	add r3, r1, #0
	ldr r1, [r2, #0x10]
	ldr r2, [r3, #8]
	ldr r3, _021FB160 ; =NARC_ReadFile
	lsl r1, r1, #3
	bx r3
	.balign 4, 0
_021FB160: .word NARC_ReadFile
	thumb_func_end ov01_021FB154

	thumb_func_start ov01_021FB164
ov01_021FB164: ; 0x021FB164
	add r3, r1, #0
	ldr r1, [r2, #0x14]
	ldr r2, [r3, #0xc]
	ldr r3, _021FB170 ; =NARC_ReadFile
	lsl r1, r1, #1
	bx r3
	.balign 4, 0
_021FB170: .word NARC_ReadFile
	thumb_func_end ov01_021FB164

	thumb_func_start ov01_021FB174
ov01_021FB174: ; 0x021FB174
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x74]
	cmp r0, #1
	bne _021FB188
	add r0, r4, #0
	mov r1, #2
	add r0, #0x68
	strb r1, [r0]
_021FB188:
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	cmp r0, #0
	beq _021FB19C
	cmp r0, #1
	beq _021FB1CE
	cmp r0, #2
	beq _021FB21A
	b _021FB22E
_021FB19C:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _021FB1AC
	mov r2, #0
	b _021FB22E
_021FB1AC:
	add r1, r4, #0
	ldr r0, [r4, #0x7c]
	add r1, #0x4c
	bl ov01_021FB04C
	add r2, r4, #0
	ldr r1, [r4, #0x5c]
	ldr r0, [r4, #0x70]
	add r2, #0x6c
	str r1, [r0, #0x1c]
	add r0, r4, #0
	ldr r1, [r4, #0x70]
	add r0, #0x4c
	bl ov01_021FB0B0
	mov r2, #1
	b _021FB22E
_021FB1CE:
	add r2, r4, #0
	ldr r0, [r4, #0x7c]
	ldr r1, [r4, #0x70]
	add r2, #0x4c
	bl ov01_021FB110
	add r2, r4, #0
	ldr r0, [r4, #0x7c]
	ldr r1, [r4, #0x70]
	add r2, #0x4c
	bl ov01_021FB120
	add r2, r4, #0
	ldr r0, [r4, #0x7c]
	ldr r1, [r4, #0x70]
	add r2, #0x4c
	bl ov01_021FB134
	add r2, r4, #0
	ldr r0, [r4, #0x7c]
	ldr r1, [r4, #0x70]
	add r2, #0x4c
	bl ov01_021FB144
	add r2, r4, #0
	ldr r0, [r4, #0x7c]
	ldr r1, [r4, #0x70]
	add r2, #0x4c
	bl ov01_021FB154
	add r2, r4, #0
	ldr r0, [r4, #0x7c]
	ldr r1, [r4, #0x70]
	add r2, #0x4c
	bl ov01_021FB164
	mov r2, #1
	b _021FB22E
_021FB21A:
	ldr r0, [r4, #0x78]
	mov r1, #0
	str r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
_021FB22E:
	cmp r2, #1
	bne _021FB250
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x68
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	cmp r0, #2
	bne _021FB250
	ldr r0, [r4, #0x70]
	mov r1, #1
	str r1, [r0, #0x18]
_021FB250:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB174

	thumb_func_start ov01_021FB254
ov01_021FB254: ; 0x021FB254
	push {r3, lr}
	mov r0, #4
	mov r1, #0x20
	bl AllocFromHeap
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	pop {r3, pc}
	thumb_func_end ov01_021FB254

	thumb_func_start ov01_021FB270
ov01_021FB270: ; 0x021FB270
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #4
	mov r1, #0x18
	add r5, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_021FB04C
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	str r0, [r5, #0x1c]
	add r0, r4, #0
	add r2, sp, #0x1c
	bl ov01_021FB0B0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021FB110
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021FB120
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021FB134
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021FB144
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021FB154
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021FB164
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	str r0, [r5, #0x18]
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov01_021FB270

	thumb_func_start ov01_021FB2E8
ov01_021FB2E8: ; 0x021FB2E8
	push {r3, lr}
	cmp r0, #0
	beq _021FB2F2
	bl FreeToHeap
_021FB2F2:
	pop {r3, pc}
	thumb_func_end ov01_021FB2E8

	thumb_func_start ov01_021FB2F4
ov01_021FB2F4: ; 0x021FB2F4
	cmp r0, #0
	beq _021FB306
	mov r1, #0
	str r1, [r0, #0x18]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
_021FB306:
	bx lr
	thumb_func_end ov01_021FB2F4

	thumb_func_start ov01_021FB308
ov01_021FB308: ; 0x021FB308
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #4
	mov r1, #0x88
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeapAtEnd
	add r1, r0, #0
	add r2, r1, #0
	mov r0, #0
	add r2, #0x68
	strb r0, [r2]
	add r2, r1, #0
	str r5, [r1, #0x7c]
	add r2, #0x80
	str r4, [r2]
	str r6, [r1, #0x70]
	str r7, [r1, #0x78]
	str r0, [r1, #0x74]
	str r0, [r1, #0x64]
	str r0, [r1, #0x48]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r0, [r0]
	str r0, [r1, #0x6c]
	add r0, r1, #0
	add r0, #0x84
	str r2, [r0]
	ldr r0, _021FB350 ; =ov01_021FB174
	mov r2, #1
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FB350: .word ov01_021FB174
	thumb_func_end ov01_021FB308

	thumb_func_start ov01_021FB354
ov01_021FB354: ; 0x021FB354
	push {r3, lr}
	bl sub_0201F988
	mov r1, #1
	str r1, [r0, #0x74]
	pop {r3, pc}
	thumb_func_end ov01_021FB354

	thumb_func_start ov01_021FB360
ov01_021FB360: ; 0x021FB360
	mov r1, #0
	str r1, [r0, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FB360
