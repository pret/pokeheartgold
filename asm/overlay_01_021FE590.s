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
	.include "overlay_01_021FE590.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FE590
ov01_021FE590: ; 0x021FE590
	push {r4, lr}
	mov r2, #0
	mov r1, #0xc
	add r3, r2, #0
	add r4, r0, #0
	bl ov01_021F1430
	str r4, [r0, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE590

	thumb_func_start ov01_021FE5A4
ov01_021FE5A4: ; 0x021FE5A4
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FE61C
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FE5A4

	thumb_func_start ov01_021FE5B4
ov01_021FE5B4: ; 0x021FE5B4
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	bx lr
	thumb_func_end ov01_021FE5B4

	thumb_func_start ov01_021FE5BC
ov01_021FE5BC: ; 0x021FE5BC
	push {r3, lr}
	ldr r1, [r0]
	sub r1, r1, #1
	str r1, [r0]
	bpl _021FE5CA
	bl GF_AssertFail
_021FE5CA:
	pop {r3, pc}
	thumb_func_end ov01_021FE5BC

	thumb_func_start ov01_021FE5CC
ov01_021FE5CC: ; 0x021FE5CC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021FE614
	mov r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	mov r1, #0xb
	mov r2, #0x80
	bl ov01_021F18D4
	ldr r0, [r4, #8]
	mov r1, #0xb
	mov r2, #0x95
	bl ov01_021F1908
	ldr r0, [r4, #8]
	mov r1, #0xc
	mov r2, #0x1a
	mov r3, #1
	bl ov01_021F1930
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021FE618 ; =ov01_022090AC
	mov r2, #0xb
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #0xd
	add r3, r2, #0
	bl ov01_021F1758
_021FE614:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021FE618: .word ov01_022090AC
	thumb_func_end ov01_021FE5CC

	thumb_func_start ov01_021FE61C
ov01_021FE61C: ; 0x021FE61C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _021FE64A
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	mov r1, #0xb
	bl ov01_021F18FC
	ldr r0, [r4, #8]
	mov r1, #0xb
	bl ov01_021F1924
	ldr r0, [r4, #8]
	mov r1, #0xc
	bl ov01_021F1970
	ldr r0, [r4, #8]
	mov r1, #0xd
	bl ov01_021F18C8
_021FE64A:
	pop {r4, pc}
	thumb_func_end ov01_021FE61C

	thumb_func_start ov01_021FE64C
ov01_021FE64C: ; 0x021FE64C
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _021FE658
	bl ov01_021FE5CC
_021FE658:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE64C

	thumb_func_start ov01_021FE65C
ov01_021FE65C: ; 0x021FE65C
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _021FE668
	bl ov01_021FE61C
_021FE668:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE65C

	thumb_func_start ov01_021FE66C
ov01_021FE66C: ; 0x021FE66C
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	bl ov01_021F146C
	add r4, r0, #0
	add r0, r5, #0
	add r1, sp, #0x14
	bl ov01_021F93AC
	mov r0, #2
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0x10
	str r4, [sp, #8]
	bl ov01_021F1450
	str r0, [sp, #0xc]
	add r0, sp, #8
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r1, _021FE6B0 ; =ov01_02209084
	add r0, r4, #0
	add r2, sp, #0x14
	mov r3, #0
	bl ov01_021F1620
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_021FE6B0: .word ov01_02209084
	thumb_func_end ov01_021FE66C

	thumb_func_start ov01_021FE6B4
ov01_021FE6B4: ; 0x021FE6B4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r0, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x10]
	bl ov01_021FE64C
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	add r2, sp, #0
	bl ov01_021F1740
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	bl ov01_021FE5B4
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov01_021FE6B4

	thumb_func_start ov01_021FE6F4
ov01_021FE6F4: ; 0x021FE6F4
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x18]
	bl sub_02023DA4
	ldr r0, [r4, #0x10]
	bl ov01_021FE5BC
	ldr r0, [r4, #0x10]
	bl ov01_021FE65C
	pop {r4, pc}
	thumb_func_end ov01_021FE6F4

	thumb_func_start ov01_021FE70C
ov01_021FE70C: ; 0x021FE70C
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _021FE764 ; =ov01_02209098
	add r2, r0, #0
	add r4, r1, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #8]
	cmp r0, #1
	bne _021FE748
	mov r1, #0
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #5
	blt _021FE742
	add r0, r2, #0
	bl ov01_021F1640
	add sp, #0x14
	pop {r4, r5, pc}
_021FE742:
	ldr r0, [r4, #0x18]
	bl sub_02023F1C
_021FE748:
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x18]
	lsl r2, r1, #2
	add r1, sp, #0
	ldr r1, [r1, r2]
	bl sub_02023F04
	cmp r0, #1
	bne _021FE75E
	mov r0, #1
	str r0, [r4, #8]
_021FE75E:
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_021FE764: .word ov01_02209098
	thumb_func_end ov01_021FE70C

	thumb_func_start ov01_021FE768
ov01_021FE768: ; 0x021FE768
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x18]
	add r1, sp, #0
	bl sub_02023E50
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_021FE768

	.rodata

ov01_02209084: ; 0x02209084
	.word 0x0000001C
	.word ov01_021FE6B4
	.word ov01_021FE6F4
	.word ov01_021FE70C
	.word ov01_021FE768

ov01_02209098: ; 0x02209098
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov01_022090AC: ; 0x022090AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
