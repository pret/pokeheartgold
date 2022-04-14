#include "msgdata/msg/msg_0247.h"
#include "msgdata/msg/msg_0442.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"
	.public ov60_021EAFE0
	.public sub_020342C0

	.text

	thumb_func_start ov74_02227060
ov74_02227060: ; 0x02227060
	push {r4, lr}
	ldr r1, _02227090 ; =gSystem
	add r4, r0, #0
	ldr r2, [r1, #0x48]
	ldr r0, _02227094 ; =0x00000CF3
	tst r0, r2
	beq _0222707A
	mov r0, #0x6b
	mov r2, #0
	lsl r0, r0, #2
	str r2, [r4, r0]
	ldr r0, [r1, #0x48]
	pop {r4, pc}
_0222707A:
	bl System_GetTouchNew
	cmp r0, #0
	beq _0222708C
	mov r1, #0x6b
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
_0222708C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02227090: .word gSystem
_02227094: .word 0x00000CF3
	thumb_func_end ov74_02227060

	thumb_func_start ov74_02227098
ov74_02227098: ; 0x02227098
	push {r3, r4}
	mov r3, #0
	add r4, r3, #0
_0222709E:
	add r2, r0, #0
	add r2, #0xec
	ldr r2, [r2]
	cmp r2, #0
	beq _022270B6
	add r2, r4, #0
	add r4, r4, #1
	cmp r2, r1
	bne _022270B6
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_022270B6:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #9
	blo _0222709E
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_02227098

	thumb_func_start ov74_022270C4
ov74_022270C4: ; 0x022270C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #0
	ldr r0, _02227158 ; =SEQ_SE_DP_SELECT
	bne _02227106
	bl PlaySE
	add r0, r5, #0
	add r0, #0x54
	ldrh r0, [r0]
	lsl r0, r0, #2
	add r0, r5, r0
	add r0, #0xec
	ldr r0, [r0]
	str r0, [r5, #0x58]
	cmp r0, #6
	bne _02227114
	bl CTRDG_IsPulledOut
	cmp r0, #1
	bne _02227114
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0xc
	beq _022270FE
	bl sub_02038D64
_022270FE:
	mov r0, #0x4f
	bl ShowGBACartRemovedError
	b _02227114
_02227106:
	bl PlaySE
	mov r0, #0
	str r0, [r5, #0x58]
	mov r0, #1
	bl ov74_02235390
_02227114:
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _0222712E
	ldr r1, [r5, #0x40]
	mov r0, #0x80
	orr r1, r0
	str r1, [r5, #0x40]
	mov r1, #1
	add r0, #0xc8
	str r1, [r5, r0]
	mov r0, #6
	str r0, [r4]
	b _02227144
_0222712E:
	cmp r0, #7
	bne _02227138
	mov r0, #1
	bl ov74_02235390
_02227138:
	mov r0, #0
	mov r1, #7
	add r2, r4, #0
	mov r3, #8
	bl ov74_0223539C
_02227144:
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0xd
	bne _02227152
	mov r1, #0xe
	str r1, [r5, r0]
_02227152:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02227158: .word SEQ_SE_DP_SELECT
	thumb_func_end ov74_022270C4

	thumb_func_start ov74_0222715C
ov74_0222715C: ; 0x0222715C
	push {r3, r4}
	mov r4, #0
	add r3, r4, #0
	cmp r1, #0
	ble _0222717A
_02227166:
	add r2, r0, #0
	add r2, #0xec
	ldr r2, [r2]
	cmp r2, #0
	beq _02227172
	add r4, r4, #1
_02227172:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, r1
	blt _02227166
_0222717A:
	add r0, r4, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_0222715C

	thumb_func_start ov74_02227180
ov74_02227180: ; 0x02227180
	push {r3, r4, r5, r6, r7, lr}
	add r3, r1, #0
	ldr r1, _02227238 ; =gSystem
	add r5, r0, #0
	ldr r2, [r1, #0x48]
	ldr r1, _0222723C ; =0x00000CF3
	mov r4, #0
	tst r1, r2
	beq _022271AA
	mov r7, #0x6b
	lsl r7, r7, #2
	ldr r1, [r5, r7]
	cmp r1, #1
	bne _022271AA
	str r4, [r5, r7]
	add r5, #0x54
	ldrh r1, [r5]
	bl ov74_0222841C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_022271AA:
	mov r0, #1
	tst r0, r2
	beq _022271BC
	add r0, r5, #0
	add r1, r3, #0
	mov r2, #0
	bl ov74_022270C4
	pop {r3, r4, r5, r6, r7, pc}
_022271BC:
	mov r0, #2
	tst r0, r2
	beq _022271CE
	add r0, r5, #0
	add r1, r3, #0
	mov r2, #1
	bl ov74_022270C4
	pop {r3, r4, r5, r6, r7, pc}
_022271CE:
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _022271D8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022271D8:
	add r0, r5, #0
	add r0, #0x54
	ldrh r7, [r0]
	mov r1, #0x40
	add r0, r2, #0
	tst r0, r1
	beq _02227210
	add r0, r5, #0
	sub r1, #0x41
	bl ov74_02228698
	cmp r0, #0
	beq _02227226
	add r0, r5, #0
	add r1, r7, #0
	bl ov74_0222715C
	add r6, r0, #0
	cmp r6, #7
	bne _02227206
	mov r6, #3
	mov r4, #1
	b _02227226
_02227206:
	cmp r6, #3
	bne _02227226
	mov r6, #0
	mov r4, #1
	b _02227226
_02227210:
	mov r0, #0x80
	tst r0, r2
	beq _02227226
	add r0, r5, #0
	mov r1, #1
	bl ov74_02228698
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x54
	ldrh r6, [r0]
_02227226:
	cmp r4, #0
	beq _02227232
	add r0, r5, #0
	add r1, r6, #0
	bl ov74_022286F8
_02227232:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02227238: .word gSystem
_0222723C: .word 0x00000CF3
	thumb_func_end ov74_02227180

	thumb_func_start ov74_02227240
ov74_02227240: ; 0x02227240
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r6, #0
	add r5, r0, #0
	str r1, [sp, #4]
	add r4, r2, #0
	mvn r6, r6
	mov r7, #0
	bl System_GetTouchNew
	cmp r0, #0
	bne _0222725E
	add sp, #0xc
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0222725E:
	ldr r0, [r5, #0x48]
	cmp r0, #0
	bne _02227276
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02227276
	ldr r0, _0222741C ; =_0223B2C0
	bl sub_02025224
	add r6, r0, #0
_02227276:
	cmp r6, #0
	bne _022272DA
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020249A8
	lsr r0, r0, #1
	beq _022272DA
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02024964
	add r0, r5, #0
	add r0, #0x54
	ldrh r0, [r0]
	cmp r0, #3
	bls _022272C6
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #3
	lsl r0, r0, #0x12
	cmp r1, r0
	ble _022272C6
	add r0, r5, #0
	mov r1, #3
	bl ov74_02227098
	add r1, r5, #0
	add r1, #0x54
	strh r0, [r1]
	b _022272D4
_022272C6:
	add r0, r5, #0
	mov r1, #0
	bl ov74_02227098
	add r1, r5, #0
	add r1, #0x54
	strh r0, [r1]
_022272D4:
	mov r7, #1
	str r7, [r4]
	b _02227328
_022272DA:
	cmp r6, #1
	bne _02227328
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020249A8
	lsr r0, r0, #1
	beq _02227328
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024964
	add r0, r5, #0
	add r0, #0x54
	ldrh r0, [r0]
	cmp r0, #3
	bhs _02227316
	add r0, r5, #0
	mov r1, #3
	bl ov74_02227098
	b _0222731E
_02227316:
	add r0, r5, #0
	mov r1, #7
	bl ov74_02227098
_0222731E:
	add r1, r5, #0
	add r1, #0x54
	strh r0, [r1]
	mov r7, #1
	str r7, [r4]
_02227328:
	cmp r7, #0
	beq _0222735A
	mov r0, #0x6b
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r1, r5, #0
	add r1, #0x54
	ldrh r1, [r1]
	add r0, r5, #0
	bl ov74_0222841C
	add r1, r5, #0
	add r1, #0x54
	ldrh r1, [r1]
	add r0, r5, #0
	bl ov74_022286F8
	mov r0, #0x6d
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r5, r0]
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222735A:
	ldr r1, _02227420 ; =0x0000FFFE
	add r0, sp, #8
	strh r1, [r0]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldr r2, _02227424 ; =gSystem + 0x40
	asr r6, r1, #0xb
	lsr r6, r6, #0x14
	add r6, r1, r6
	ldrh r3, [r2, #0x22]
	asr r1, r6, #0xc
	add r0, #0xc8
	add r1, r3, r1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	cmp r3, r0
	blo _02227384
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02227384:
	add r0, sp, #8
	str r0, [sp]
	ldrh r2, [r2, #0x20]
	ldr r0, [r5]
	mov r1, #0
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _0222739C
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222739C:
	mov r0, #1
	str r0, [r4]
	ldr r0, _02227424 ; =gSystem + 0x40
	mov r1, #0x30
	ldrh r0, [r0, #0x22]
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	cmp r2, #0
	bne _022273C4
	cmp r1, #0
	beq _022273DA
	sub r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	b _022273DA
_022273C4:
	mov r0, #3
	lsl r0, r0, #0x12
	cmp r2, r0
	bne _022273D4
	add r0, r1, #3
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	b _022273DA
_022273D4:
	add r0, r1, #7
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
_022273DA:
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	blt _022273EA
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_022273EA:
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov74_02227098
	add r1, r5, #0
	add r1, #0x54
	strh r0, [r1]
	mov r0, #0x6b
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r1, r5, #0
	add r1, #0x54
	ldrh r1, [r1]
	add r0, r5, #0
	bl ov74_0222841C
	ldr r1, [sp, #4]
	add r0, r5, #0
	mov r2, #0
	bl ov74_022270C4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222741C: .word _0223B2C0
_02227420: .word 0x0000FFFE
_02227424: .word gSystem + 0x40
	thumb_func_end ov74_02227240

	thumb_func_start ov74_02227428
ov74_02227428: ; 0x02227428
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r2, #0
	str r2, [sp]
	add r2, sp, #0
	add r5, r0, #0
	add r4, r1, #0
	bl ov74_02227240
	add r6, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	beq _02227460
	mov r0, #0x6b
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, #8
	ldr r0, [r5, r0]
	cmp r0, #6
	beq _0222745A
	add r0, r5, #0
	mov r1, #0xff
	bl ov74_0222841C
_0222745A:
	add sp, #4
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_02227460:
	add r0, r5, #0
	add r1, r4, #0
	bl ov74_02227180
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov74_02227428

	thumb_func_start ov74_0222746C
ov74_0222746C: ; 0x0222746C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl System_GetTouchNew
	cmp r0, #0
	bne _02227482
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02227482:
	ldr r0, _022274C8 ; =_0223B2CC
	bl sub_02025224
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _02227498
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02227498:
	ldr r1, _022274CC ; =0x0000FFFE
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _022274D0 ; =gSystem + 0x40
	ldr r0, [r5]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	mov r1, #1
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _022274BA
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_022274BA:
	mov r0, #1
	str r0, [r4]
	cmp r6, #0
	beq _022274C4
	mov r0, #2
_022274C4:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022274C8: .word _0223B2CC
_022274CC: .word 0x0000FFFE
_022274D0: .word gSystem + 0x40
	thumb_func_end ov74_0222746C

	thumb_func_start ov74_022274D4
ov74_022274D4: ; 0x022274D4
	push {r3, r4, r5, lr}
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov74_0222746C
	add r5, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	beq _022274FE
	mov r0, #0x6b
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0xff
	bl ov74_02228548
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_022274FE:
	ldr r0, _02227574 ; =gSystem
	ldr r1, [r0, #0x48]
	cmp r1, #0
	bne _0222750A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222750A:
	ldr r0, _02227578 ; =0x00000CF3
	tst r0, r1
	beq _0222752C
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	cmp r2, #1
	bne _0222752C
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	add r4, #0x56
	ldrh r1, [r4]
	bl ov74_02228548
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222752C:
	mov r0, #0xc0
	tst r0, r1
	beq _02227556
	add r0, r4, #0
	add r0, #0x56
	ldrh r1, [r0]
	mov r0, #1
	eor r1, r0
	add r0, r4, #0
	add r0, #0x56
	strh r1, [r0]
	add r0, r4, #0
	add r4, #0x56
	ldrh r1, [r4]
	bl ov74_02228548
	ldr r0, _0222757C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
_02227556:
	mov r0, #1
	add r2, r1, #0
	tst r2, r0
	beq _0222756A
	add r4, #0x56
	ldrh r1, [r4]
	cmp r1, #0
	beq _02227572
	mov r0, #2
	pop {r3, r4, r5, pc}
_0222756A:
	mov r0, #2
	tst r1, r0
	bne _02227572
	mov r0, #0
_02227572:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02227574: .word gSystem
_02227578: .word 0x00000CF3
_0222757C: .word SEQ_SE_DP_SELECT
	thumb_func_end ov74_022274D4

	thumb_func_start ov74_02227580
ov74_02227580: ; 0x02227580
	mov r0, #0
	bx lr
	thumb_func_end ov74_02227580

	thumb_func_start ov74_02227584
ov74_02227584: ; 0x02227584
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	bne _022275FC
	mov r1, #0x63
	mov r0, #0
	add r3, r5, #0
	lsl r1, r1, #2
_022275A0:
	ldr r2, [r3, r1]
	cmp r2, #1
	bne _022275F2
	lsl r1, r0, #2
	add r3, r5, r1
	mov r1, #0x63
	add r6, r0, #0
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r3, r1]
	ldr r0, _02227630 ; =0x000003F7
	mov r3, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r1, r1, #4
	ldr r7, _02227634 ; =ov74_0223BBD4
	mul r6, r3
	add r4, r7, r6
	ldr r3, [r4, #0x10]
	add r0, sp, #8
	add r1, r5, r1
	bl ov74_02235414
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	add r0, sp, #8
	mov r3, #1
	bl ov74_02235464
	ldr r0, [r4, #0x14]
	add r1, sp, #8
	str r0, [sp]
	ldr r0, [r5]
	ldr r2, [r7, r6]
	ldr r3, [r4, #4]
	bl ov74_02235568
	add sp, #0x5c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_022275F2:
	add r0, r0, #1
	add r3, r3, #4
	cmp r0, #1
	blt _022275A0
	b _0222762A
_022275FC:
	add r0, r5, #0
	bl ov74_02227060
	mov r1, #3
	tst r0, r1
	beq _02227624
	ldr r0, _02227638 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
_02227624:
	add sp, #0x5c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0222762A:
	mov r0, #0
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02227630: .word 0x000003F7
_02227634: .word ov74_0223BBD4
_02227638: .word SEQ_SE_DP_SELECT
	thumb_func_end ov74_02227584

	thumb_func_start ov74_0222763C
ov74_0222763C: ; 0x0222763C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	bl PmAgbCartridgeGetOffsets
	mov r4, #0
	str r4, [r5, #0x24]
	cmp r0, #0
	bne _022276A6
	bl PmAgbCartridge_GetVersionInternal
	cmp r0, #4
	bhi _0222767E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02227662: ; jump table
	.short _0222766C - _02227662 - 2 ; case 0
	.short _02227670 - _02227662 - 2 ; case 1
	.short _02227674 - _02227662 - 2 ; case 2
	.short _02227678 - _02227662 - 2 ; case 3
	.short _0222767C - _02227662 - 2 ; case 4
_0222766C:
	mov r4, #VERSION_RUBY
	b _0222767E
_02227670:
	mov r4, #VERSION_SAPPHIRE
	b _0222767E
_02227674:
	mov r4, #VERSION_LEAF_GREEN
	b _0222767E
_02227678:
	mov r4, #VERSION_FIRE_RED
	b _0222767E
_0222767C:
	mov r4, #VERSION_EMERALD
_0222767E:
	add r0, r4, #0
	bl sub_0201A4B0
	ldr r0, [r5, #8]
	bl Pokedex_GetNatDexFlag
	cmp r0, #0
	beq _022276A6
	bl PmAgbCartridge_GetLanguage
	ldr r1, _022276A8 ; =gGameLanguage
	ldrb r1, [r1]
	cmp r1, r0
	bne _022276A6
	bl PmAgbCartridge_GetVersionInternal
	add r0, r0, #1
	str r0, [r5, #0x24]
	bl ov74_02236074
_022276A6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022276A8: .word gGameLanguage
	thumb_func_end ov74_0222763C

	thumb_func_start ov74_022276AC
ov74_022276AC: ; 0x022276AC
	push {r4, lr}
	mov r1, #0x4f
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r0, #0xa
	cmp r0, #4
	bhi _0222779A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022276C8: ; jump table
	.short _022276D2 - _022276C8 - 2 ; case 0
	.short _022276D8 - _022276C8 - 2 ; case 1
	.short _0222779A - _022276C8 - 2 ; case 2
	.short _0222770A - _022276C8 - 2 ; case 3
	.short _0222778E - _022276C8 - 2 ; case 4
_022276D2:
	mov r0, #0xb
	str r0, [r4, r1]
	pop {r4, pc}
_022276D8:
	ldr r0, [r4, #4]
	bl sub_02038D28
	mov r1, #0x78
	add r0, r1, #0
	add r0, #0xc8
	str r1, [r4, r0]
	mov r0, #0xd
	add r1, #0xc4
	str r0, [r4, r1]
	mov r0, #0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x14]
	bl sub_0202E014
	cmp r0, #1
	bne _0222779A
	ldr r1, [r4, #0x40]
	mov r0, #1
	orr r1, r0
	str r1, [r4, #0x40]
	ldr r1, [r4, #0x44]
	orr r0, r1
	str r0, [r4, #0x44]
	pop {r4, pc}
_0222770A:
	add r1, #0xc
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0222779A
	bl sub_02038D80
	ldr r1, [r4, #0x40]
	bic r0, r1
	beq _02227770
	mov r2, #0x51
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	cmp r3, #0xf
	bne _02227770
	add r2, r2, #4
	ldr r2, [r4, r2]
	cmp r2, #0
	bne _02227770
	cmp r1, r0
	beq _02227770
	mov r2, #1
	add r1, r0, #0
	str r2, [r4, #0x48]
	tst r1, r2
	beq _02227740
	str r2, [r4, #0x34]
	add r0, r2, #0
_02227740:
	mov r1, #2
	add r2, r0, #0
	tst r2, r1
	beq _0222774E
	mov r0, #1
	str r0, [r4, #0x2c]
	add r0, r1, #0
_0222774E:
	mov r1, #4
	add r2, r0, #0
	tst r2, r1
	beq _0222775C
	mov r0, #1
	str r0, [r4, #0x30]
	add r0, r1, #0
_0222775C:
	mov r1, #3
	tst r1, r0
	beq _0222776A
	mov r1, #0x62
	mov r2, #1
	lsl r1, r1, #2
	str r2, [r4, r1]
_0222776A:
	ldr r1, [r4, #0x40]
	orr r0, r1
	str r0, [r4, #0x40]
_02227770:
	mov r0, #5
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222779A
	bl sub_02038D64
	mov r0, #0x4f
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
_0222778E:
	bl sub_02038D64
	mov r0, #0x4f
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r4, r0]
_0222779A:
	pop {r4, pc}
	thumb_func_end ov74_022276AC

	thumb_func_start ov74_0222779C
ov74_0222779C: ; 0x0222779C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	mov r1, #0x51
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	sub r2, #0xf
	cmp r2, #5
	bls _022277B0
	b _02227ABE
_022277B0:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022277BC: ; jump table
	.short _022277C8 - _022277BC - 2 ; case 0
	.short _022277F0 - _022277BC - 2 ; case 1
	.short _0222782E - _022277BC - 2 ; case 2
	.short _022279CA - _022277BC - 2 ; case 3
	.short _02227A26 - _022277BC - 2 ; case 4
	.short _02227A9E - _022277BC - 2 ; case 5
_022277C8:
	add r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022277D6
	add sp, #0x70
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022277D6:
	add r0, r1, #4
	ldr r0, [r4, r0]
	sub r2, r0, #1
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022277EA
	mov r0, #0x10
	str r0, [r4, r1]
_022277EA:
	add sp, #0x70
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022277F0:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x4f
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02227AC4 ; =0x000003F7
	mov r1, #1
	mov r3, #2
	bl LoadUserFrameGfx1
	mov r1, #1
	str r1, [sp]
	mov r0, #0x4f
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02227AC8 ; =0x000003EE
	mov r3, #3
	bl LoadUserFrameGfx1
	ldr r0, [r4]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r1, _02227ACC ; =0x00006B5A
	ldr r0, _02227AD0 ; =0x05000042
	strh r1, [r0]
	mov r0, #0x51
	mov r1, #0x11
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02227ABE
_0222782E:
	ldr r0, _02227AC4 ; =0x000003F7
	add r1, #0x10
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, sp, #0x1c
	add r1, r4, r1
	mov r2, #0
	mov r3, #0x11
	bl ov74_02235414
	ldr r1, [r4, #0x40]
	ldr r0, [r4, #0x44]
	add r6, r1, #0
	mvn r0, r0
	and r6, r0
	mov r0, #1
	add r1, r6, #0
	tst r1, r0
	beq _02227864
	ldr r1, [r4, #0x38]
	tst r0, r1
	beq _02227860
	ldr r5, _02227AD4 ; =ov74_0223BC30
	b _022278BC
_02227860:
	ldr r5, _02227AD8 ; =ov74_0223BC44
	b _022278BC
_02227864:
	mov r2, #2
	add r1, r6, #0
	tst r1, r2
	beq _0222787A
	ldr r0, [r4, #0x38]
	tst r0, r2
	beq _02227876
	ldr r5, _02227ADC ; =ov74_0223BC58
	b _022278BC
_02227876:
	ldr r5, _02227AE0 ; =ov74_0223BC6C
	b _022278BC
_0222787A:
	mov r1, #0x80
	tst r1, r6
	beq _022278BC
	str r2, [sp, #0x1c]
	ldr r5, _02227AE4 ; =ov74_0223BC80
	ldr r2, [sp, #0x50]
	mov r1, #0x1b
	mov r3, #0x4f
	bl NewMsgDataFromNarc
	ldr r1, [r5, #0x10]
	add r7, r0, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x10]
	mov r2, #0
	bl FontID_String_GetWidthMultiline
	ldr r1, [r5, #8]
	lsl r1, r1, #3
	sub r0, r1, r0
	lsr r0, r0, #1
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	mov r0, #4
	str r0, [sp, #0x40]
_022278BC:
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	add r0, sp, #0x1c
	mov r3, #0x91
	bl ov74_02235464
	mov r0, #1
	str r0, [sp, #0x48]
	ldr r0, [r5, #0x10]
	add r1, sp, #0x1c
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, [r5]
	ldr r3, [r5, #4]
	bl ov74_02235568
	ldr r0, [sp, #0x2c]
	bl GetWindowX
	add r7, r0, #0
	ldr r0, [sp, #0x2c]
	bl GetWindowY
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	bl GetWindowWidth
	add r5, r0, #0
	ldr r0, [sp, #0x2c]
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r3, [sp, #0x14]
	mov r1, #1
	add r2, r7, #0
	bl BgTilemapRectChangePalette
	mov r1, #0x80
	add r0, r6, #0
	tst r0, r1
	beq _0222799C
	mov r0, #3
	tst r0, r6
	bne _0222799C
	add r1, #0xe4
	add r0, r4, r1
	mov r6, #0
	str r0, [sp, #0xc]
	mov r7, #1
_02227926:
	ldr r0, _02227AC4 ; =0x000003F7
	ldr r1, [sp, #0xc]
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, sp, #0x1c
	mov r2, #0
	mov r3, #0x11
	bl ov74_02235414
	add r1, r6, #5
	mov r0, #0x14
	mul r0, r1
	ldr r1, _02227AD4 ; =ov74_0223BC30
	str r0, [sp, #0x18]
	add r5, r1, r0
	mov r0, #4
	str r0, [sp, #0x40]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	add r0, sp, #0x1c
	add r3, r7, #0
	bl ov74_02235464
	mov r0, #1
	str r0, [sp, #0x48]
	ldr r0, [r5, #0x10]
	ldr r3, _02227AD4 ; =ov74_0223BC30
	str r0, [sp]
	ldr r2, [sp, #0x18]
	ldr r0, [r4]
	ldr r2, [r3, r2]
	ldr r3, [r5, #4]
	add r1, sp, #0x1c
	bl ov74_02235568
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r0, #0x10
	add r7, #0x48
	str r0, [sp, #0xc]
	cmp r6, #2
	blt _02227926
	add r0, r4, #0
	mov r1, #0
	add r0, #0x56
	strh r1, [r0]
	add r0, r4, #0
	sub r1, r1, #1
	bl ov74_02228548
	mov r0, #0x51
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0x1e
	add r0, #8
	str r1, [r4, r0]
	b _022279B0
_0222799C:
	ldr r0, [r4, #0x44]
	mov r1, #0x12
	orr r0, r6
	str r0, [r4, #0x44]
	mov r0, #0x51
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0x1e
	add r0, #8
	str r1, [r4, r0]
_022279B0:
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _02227ABE
_022279CA:
	add r2, r1, #0
	add r2, #8
	ldr r2, [r4, r2]
	cmp r2, #0
	beq _022279E2
	add r0, r1, #0
	add r0, #8
	ldr r0, [r4, r0]
	add r1, #8
	sub r0, r0, #1
	str r0, [r4, r1]
	b _02227ABE
_022279E2:
	add r1, #0x68
	ldr r5, [r4, r1]
	bl ov74_02227060
	add r6, r0, #0
	mov r0, #3
	tst r0, r6
	beq _02227ABE
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r5, r0
	beq _02227A08
	add r1, r4, #0
	add r1, #0x54
	ldrh r1, [r1]
	add r0, r4, #0
	bl ov74_0222841C
_02227A08:
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x51
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0xc
	str r6, [r4, r0]
	ldr r0, _02227AE8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _02227ABE
_02227A26:
	add r2, r1, #0
	add r2, #8
	ldr r2, [r4, r2]
	cmp r2, #0
	beq _02227A4E
	add r2, r1, #0
	add r2, #8
	ldr r2, [r4, r2]
	sub r3, r2, #1
	add r2, r1, #0
	add r2, #8
	str r3, [r4, r2]
	add r1, #8
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02227ABE
	mov r1, #0
	bl ov74_02228548
	b _02227ABE
_02227A4E:
	bl ov74_022274D4
	add r5, r0, #0
	add r0, r4, #0
	bl ov74_022288C4
	mov r0, #3
	tst r0, r5
	beq _02227ABE
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x59
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	add r1, r4, #0
	add r1, #0x54
	ldrh r1, [r1]
	add r0, r4, #0
	bl ov74_0222841C
	mov r0, #0x51
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0xc
	str r5, [r4, r0]
	ldr r0, _02227AE8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _02227ABE
_02227A9E:
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x51
	mov r1, #0xf
	lsl r0, r0, #2
	str r1, [r4, r0]
_02227ABE:
	mov r0, #1
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227AC4: .word 0x000003F7
_02227AC8: .word 0x000003EE
_02227ACC: .word 0x00006B5A
_02227AD0: .word 0x05000042
_02227AD4: .word ov74_0223BC30
_02227AD8: .word ov74_0223BC44
_02227ADC: .word ov74_0223BC58
_02227AE0: .word ov74_0223BC6C
_02227AE4: .word ov74_0223BC80
_02227AE8: .word SEQ_SE_DP_SELECT
	thumb_func_end ov74_0222779C

	thumb_func_start ov74_02227AEC
ov74_02227AEC: ; 0x02227AEC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, r1
	beq _02227B74
	sub r1, r1, r0
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	asr r2, r0, #0x1f
	add r1, r0, #0
	eor r1, r2
	sub r2, r1, r2
	mov r1, #3
	lsl r1, r1, #0xe
	cmp r2, r1
	ble _02227B22
	cmp r0, #0
	ble _02227B20
	add r0, r1, #0
	b _02227B22
_02227B20:
	ldr r0, _02227B78 ; =0xFFFF4000
_02227B22:
	mov r1, #0x4d
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	add r0, r2, r0
	str r0, [r4, r1]
	add r0, r1, #4
	ldr r0, [r4, r0]
	ldr r2, [r4, r1]
	sub r2, r0, r2
	asr r3, r2, #0x1f
	eor r2, r3
	sub r3, r2, r3
	add r2, r1, #0
	add r2, #0xcc
	cmp r3, r2
	bge _02227B44
	str r0, [r4, r1]
_02227B44:
	mov r3, #0x4d
	lsl r3, r3, #2
	ldr r5, [r4, r3]
	ldr r0, [r4]
	asr r3, r5, #0xb
	lsr r3, r3, #0x14
	add r3, r5, r3
	mov r1, #0
	mov r2, #3
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	mov r3, #0x4d
	lsl r3, r3, #2
	ldr r0, [r4]
	ldr r4, [r4, r3]
	mov r1, #2
	asr r3, r4, #0xb
	lsr r3, r3, #0x14
	add r3, r4, r3
	mov r2, #3
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
_02227B74:
	pop {r3, r4, r5, pc}
	nop
_02227B78: .word 0xFFFF4000
	thumb_func_end ov74_02227AEC

	thumb_func_start ov74_02227B7C
ov74_02227B7C: ; 0x02227B7C
	push {r3, r4, r5, lr}
	sub sp, #0x40
	ldr r5, _02227C9C ; =_0223B2E8
	add r4, r0, #0
	add r3, sp, #0x18
	mov r2, #5
_02227B88:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02227B88
	ldr r3, _02227CA0 ; =_0223B2D8
	add r2, sp, #8
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, sp, #0x18
	bl GX_SetBanks
	add r0, sp, #8
	bl SetBothScreensModesAndDisable
	ldr r2, _02227CA4 ; =0x04000304
	mov r3, #0xf
	ldrh r1, [r2]
	ldr r0, _02227CA8 ; =0xFFFF7FFF
	lsl r3, r3, #0xc
	and r0, r1
	strh r0, [r2]
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	mov r2, #2
	bl ov74_02235308
	ldr r1, _02227CAC ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	mov r3, #0x4f
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strh r0, [r1]
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [sp]
	mov r1, #1
	mov r3, #0x36
	ldr r0, [r4]
	add r2, r1, #0
	lsl r3, r3, #0xa
	bl ov74_02235308
	ldr r1, _02227CB0 ; =0x0400000A
	mov r0, #3
	ldrh r2, [r1]
	mov r3, #0x4f
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strh r2, [r1]
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp]
	mov r1, #2
	mov r3, #0xe
	ldr r0, [r4]
	add r2, r1, #0
	lsl r3, r3, #0xc
	bl ov74_02235308
	ldr r1, _02227CB4 ; =0x0400000C
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	strh r2, [r1]
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x4f
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	bl ResetAllTextPrinters
	mov r0, #0
	mov r1, #0x20
	mov r2, #0x4f
	bl LoadFontPal0
	mov r0, #0
	add r1, r0, #0
	mov r2, #0x4f
	bl LoadFontPal0
	mov r2, #5
	mov r1, #0
	lsl r2, r2, #0x18
	ldr r0, _02227CB8 ; =0x00006B5A
	strh r1, [r2]
	strh r0, [r2, #0x3e]
	str r1, [sp]
	mov r0, #0x4f
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02227CBC ; =0x000003F7
	mov r3, #2
	bl LoadUserFrameGfx1
	mov r0, #1
	str r0, [sp]
	mov r0, #0x4f
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02227CC0 ; =0x000003EE
	mov r1, #0
	mov r3, #3
	bl LoadUserFrameGfx1
	ldr r1, _02227CB8 ; =0x00006B5A
	ldr r0, _02227CC4 ; =0x05000042
	strh r1, [r0]
	add sp, #0x40
	pop {r3, r4, r5, pc}
	nop
_02227C9C: .word _0223B2E8
_02227CA0: .word _0223B2D8
_02227CA4: .word 0x04000304
_02227CA8: .word 0xFFFF7FFF
_02227CAC: .word 0x04000008
_02227CB0: .word 0x0400000A
_02227CB4: .word 0x0400000C
_02227CB8: .word 0x00006B5A
_02227CBC: .word 0x000003F7
_02227CC0: .word 0x000003EE
_02227CC4: .word 0x05000042
	thumb_func_end ov74_02227B7C

	thumb_func_start ov74_02227CC8
ov74_02227CC8: ; 0x02227CC8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov74_0223563C
	bl ov74_02235690
	mov r0, #0x2d
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x2f
	mov r2, #0x2c
	mov r3, #0x2e
	bl ov74_02235728
	mov r0, #0
	mov r1, #0x1a
	str r0, [sp]
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0xec
	mov r3, #0x14
	bl ov74_02235930
	mov r1, #0x1a
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r0, #1
	mov r1, #0x69
	str r0, [sp]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r0, #0
	mov r2, #0xec
	mov r3, #0xac
	bl ov74_02235930
	mov r1, #0x69
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov74_02227CC8

	thumb_func_start ov74_02227D48
ov74_02227D48: ; 0x02227D48
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x4f
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x31
	mov r2, #0
	mov r3, #0x80
	bl GfGfxLoader_GXLoadPal
	ldr r0, _02227D84 ; =0x000003E6
	mov r1, #0x30
	str r0, [sp]
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x4f
	str r0, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0x71
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_02227D84: .word 0x000003E6
	thumb_func_end ov74_02227D48

	thumb_func_start ov74_02227D88
ov74_02227D88: ; 0x02227D88
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	mov r1, #2
	add r6, r2, #0
	add r7, r3, #0
	bl GetBgTilemapBuffer
	ldr r1, _02227DD0 ; =0x000043E6
	cmp r7, #2
	bne _02227DA2
	add r1, r1, #4
_02227DA2:
	lsl r2, r6, #5
	add r3, r4, r2
	lsl r2, r3, #1
	add r3, r3, #1
	strh r1, [r0, r2]
	add r2, r1, #1
	lsl r3, r3, #1
	strh r2, [r0, r3]
	add r2, r6, #1
	lsl r2, r2, #5
	add r4, r4, r2
	add r3, r1, #2
	lsl r2, r4, #1
	strh r3, [r0, r2]
	add r2, r1, #3
	add r1, r4, #1
	lsl r1, r1, #1
	strh r2, [r0, r1]
	ldr r0, [r5]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227DD0: .word 0x000043E6
	thumb_func_end ov74_02227D88

	thumb_func_start ov74_02227DD4
ov74_02227DD4: ; 0x02227DD4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #2
	bl GetBgTilemapBuffer
	lsl r1, r6, #5
	add r3, r4, r1
	mov r1, #0
	lsl r2, r3, #1
	strh r1, [r0, r2]
	add r2, r3, #1
	lsl r2, r2, #1
	strh r1, [r0, r2]
	add r2, r6, #1
	lsl r2, r2, #5
	add r3, r4, r2
	lsl r2, r3, #1
	strh r1, [r0, r2]
	add r2, r3, #1
	lsl r2, r2, #1
	strh r1, [r0, r2]
	ldr r0, [r5]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov74_02227DD4

	thumb_func_start ov74_02227E10
ov74_02227E10: ; 0x02227E10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r0, r2, #0
	add r7, r3, #0
	ldr r2, [sp, #0x28]
	mov r3, #0x4f
	bl ReadMsgData_ExpandPlaceholders
	add r5, r0, #0
	mov r0, #0
	mov r1, #2
	bl GetFontAttribute
	add r2, r0, #0
	mov r0, #0
	add r1, r5, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	add r0, r6, #0
	bl GetWindowWidth
	lsl r0, r0, #3
	add r4, #0x20
	sub r3, r0, r4
	ldr r0, [sp, #0x2c]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	add r0, r6, #0
	add r2, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02227E10

	thumb_func_start ov74_02227E64
ov74_02227E64: ; 0x02227E64
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	cmp r2, #0x64
	blt _02227E74
	mov r3, #3
	mov r1, #0
	b _02227E82
_02227E74:
	cmp r2, #0xa
	blt _02227E7E
	mov r3, #3
	mov r1, #1
	b _02227E82
_02227E7E:
	mov r3, #2
	mov r1, #1
_02227E82:
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02227E64

	thumb_func_start ov74_MainMenu_PrintContinueButton
ov74_MainMenu_PrintContinueButton: ; 0x02227E94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r2, [sp, #0x18]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r4, r3, #0
	ldr r2, _02228028 ; =0x000001BA
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x4f
	bl NewMsgDataFromNarc
	str r0, [sp, #0x24]
	mov r0, #0x4f
	bl ScrStrBufs_new
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0xc]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #1
	bne _02227EC8
	ldr r0, _0222802C ; =0x0003040F
	str r0, [sp, #0x1c]
	b _02227ECC
_02227EC8:
	ldr r0, _02228030 ; =0x0007080F
	str r0, [sp, #0x1c]
_02227ECC:
	ldr r0, [sp, #0x14]
	ldr r1, _02228034 ; =ov74_0223BCBC + 8
	lsl r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r2, #3
	ldr r0, [r0]
	add r3, r4, #0
	bl ov74_02235568
	ldr r4, _02228038 ; =ov74_0223BBC4
	mov r6, #1
	mov r5, #0x10
_02227EEC:
	cmp r6, #4
	bne _02227EF8
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x4c]
	cmp r0, #0
	beq _02227F28
_02227EF8:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x24]
	ldr r2, [r4]
	mov r3, #0x4f
	bl ReadMsgData_ExpandPlaceholders
	add r7, r0, #0
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r2, r7, #0
	ldr r0, [r0, #0x10]
	mov r3, #0x20
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
_02227F28:
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x10
	cmp r6, #5
	blo _02227EEC
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x28]
	ldr r2, [r2, #0xc]
	mov r1, #0
	bl BufferPlayersName
	mov r0, #0x11
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	bl ov74_02227E10
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x10]
	bl GetIGTHours
	add r1, r0, #0
	ldr r0, [sp, #0x28]
	bl ov74_02227E64
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x10]
	bl GetIGTMinutes
	add r2, r0, #0
	mov r3, #2
	ldr r0, [sp, #0x28]
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	bl BufferIntegerAsString
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	bl ov74_02227E10
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x28]
	ldr r2, [r2, #0x50]
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #0x14
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	bl ov74_02227E10
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x4c]
	cmp r0, #0
	beq _02227FEA
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #8]
	bl Pokedex_CountDexOwned
	add r1, r0, #0
	ldr r0, [sp, #0x28]
	bl ov74_02227E64
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	bl ov74_02227E10
_02227FEA:
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x18]
	ldr r0, [sp, #0x18]
	ldr r2, [r2, #0x38]
	ldr r3, [r3, #0x3c]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x10]
	mov r1, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl DrawFrameAndWindow1
	ldr r1, _0222803C ; =ov74_0223BCBC
	ldr r0, [sp, #0x20]
	ldr r2, [r1, r0]
	ldr r0, [sp, #0x14]
	lsl r1, r0, #2
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	add r0, #0xec
	str r2, [r0]
	ldr r0, [sp, #0x28]
	bl ScrStrBufs_delete
	ldr r0, [sp, #0x24]
	bl DestroyMsgData
	mov r0, #1
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02228028: .word 0x000001BA
_0222802C: .word 0x0003040F
_02228030: .word 0x0007080F
_02228034: .word ov74_0223BCBC + 8
_02228038: .word ov74_0223BBC4
_0222803C: .word ov74_0223BCBC
	thumb_func_end ov74_MainMenu_PrintContinueButton

	thumb_func_start ov74_MainMenu_PrintMigrateFromAgbButton
ov74_MainMenu_PrintMigrateFromAgbButton: ; 0x02228040
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	add r5, r1, #0
	add r1, r2, #0
	ldr r2, [r4, #0x24]
	add r6, r3, #0
	cmp r2, #0
	bne _02228058
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02228058:
	sub r2, r2, #1
	cmp r2, #4
	bhi _02228086
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0222806A: ; jump table
	.short _02228074 - _0222806A - 2 ; case 0
	.short _02228078 - _0222806A - 2 ; case 1
	.short _0222807C - _0222806A - 2 ; case 2
	.short _02228080 - _0222806A - 2 ; case 3
	.short _02228084 - _0222806A - 2 ; case 4
_02228074:
	mov r0, #msg_0442_00004
	b _02228086
_02228078:
	mov r0, #msg_0442_00005
	b _02228086
_0222807C:
	mov r0, #msg_0442_00006
	b _02228086
_02228080:
	mov r0, #msg_0442_00007
	b _02228086
_02228084:
	mov r0, #msg_0442_00008
_02228086:
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #3
	add r3, r6, #0
	bl ov74_02235568
	add r0, r4, #0
	mov r1, #0x17
	add r2, r6, #0
	bl ov74_02227DD4
	ldr r0, _022280B0 ; =ov74_0223BCBC
	lsl r1, r5, #4
	ldr r1, [r0, r1]
	lsl r0, r5, #2
	add r0, r4, r0
	add r0, #0xec
	str r1, [r0]
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022280B0: .word ov74_0223BCBC
	thumb_func_end ov74_MainMenu_PrintMigrateFromAgbButton

	thumb_func_start ov74_MainMenu_PrintMysteryGiftButton
ov74_MainMenu_PrintMysteryGiftButton: ; 0x022280B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	add r4, r1, #0
	add r7, r3, #0
	str r2, [sp, #4]
	cmp r0, #0
	bne _022280FC
	ldr r0, [r5, #0x14]
	bl sub_0202E014
	cmp r0, #1
	bne _022280D4
	mov r0, #1
	str r0, [r5, #0x34]
_022280D4:
	ldr r0, [r5, #4]
	bl Sav2_SysInfo_get
	bl Sav2_SysInfo_GetField48
	cmp r0, #1
	bne _022280E6
	mov r0, #1
	str r0, [r5, #0x34]
_022280E6:
	mov r0, #0x4f
	bl ov74_0223512C
	bl ov74_02235230
	cmp r0, #0
	beq _022280FC
	mov r0, #1
	str r0, [r5, #0x34]
	bl ov74_02236034
_022280FC:
	ldr r0, [r5, #0x34]
	cmp r0, #1
	bne _0222810C
	ldr r0, [r5, #0x4c]
	cmp r0, #0
	bne _0222810C
	mov r0, #0
	str r0, [r5, #0x34]
_0222810C:
	ldr r0, [r5, #0x34]
	cmp r0, #1
	bne _02228150
	ldr r0, _02228158 ; =ov74_0223BCBC + 8
	lsl r6, r4, #4
	ldr r0, [r0, r6]
	ldr r1, [sp, #4]
	str r0, [sp]
	ldr r0, [r5]
	mov r2, #3
	add r3, r7, #0
	bl ov74_02235568
	add r0, r5, #0
	mov r1, #0x17
	add r2, r7, #0
	bl ov74_02227DD4
	ldr r0, _0222815C ; =ov74_0223BCBC
	ldr r1, [r0, r6]
	lsl r0, r4, #2
	add r0, r5, r0
	add r0, #0xec
	str r1, [r0]
	ldr r1, [r5, #0x38]
	mov r0, #1
	orr r0, r1
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x14]
	bl sub_0202E024
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02228150:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228158: .word ov74_0223BCBC + 8
_0222815C: .word ov74_0223BCBC
	thumb_func_end ov74_MainMenu_PrintMysteryGiftButton

	thumb_func_start ov74_MainMenu_PrintConnectToRangerButton
ov74_MainMenu_PrintConnectToRangerButton: ; 0x02228160
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x2c]
	add r4, r1, #0
	add r7, r3, #0
	cmp r0, #1
	bne _022281B0
	ldr r0, [r5, #0x4c]
	cmp r0, #1
	bne _022281B0
	ldr r0, _022281B4 ; =ov74_0223BCBC + 8
	lsl r6, r4, #4
	ldr r0, [r0, r6]
	add r1, r2, #0
	str r0, [sp]
	ldr r0, [r5]
	mov r2, #3
	bl ov74_02235568
	add r0, r5, #0
	mov r1, #0x17
	add r2, r7, #0
	mov r3, #1
	bl ov74_02227D88
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x11
	mov r0, #1
	lsl r1, r1, #4
	str r0, [r2, r1]
	ldr r1, _022281B8 ; =ov74_0223BCBC
	add r2, #0xec
	ldr r1, [r1, r6]
	str r1, [r2]
	ldr r2, [r5, #0x38]
	mov r1, #2
	orr r1, r2
	str r1, [r5, #0x38]
	pop {r3, r4, r5, r6, r7, pc}
_022281B0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022281B4: .word ov74_0223BCBC + 8
_022281B8: .word ov74_0223BCBC
	thumb_func_end ov74_MainMenu_PrintConnectToRangerButton

	thumb_func_start ov74_MainMenu_PrintConnectToWiiButton
ov74_MainMenu_PrintConnectToWiiButton: ; 0x022281BC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	add r5, r1, #0
	add r7, r3, #0
	cmp r0, #1
	bne _02228200
	ldr r0, _02228204 ; =ov74_0223BCBC + 8
	lsl r6, r5, #4
	ldr r0, [r0, r6]
	add r1, r2, #0
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #3
	bl ov74_02235568
	lsl r5, r5, #2
	mov r0, #0x11
	mov r3, #1
	add r1, r4, r5
	lsl r0, r0, #4
	str r3, [r1, r0]
	add r0, r4, #0
	mov r1, #0x17
	add r2, r7, #0
	bl ov74_02227D88
	ldr r0, _02228208 ; =ov74_0223BCBC
	ldr r1, [r0, r6]
	add r0, r4, r5
	add r0, #0xec
	str r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02228200:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02228204: .word ov74_0223BCBC + 8
_02228208: .word ov74_0223BCBC
	thumb_func_end ov74_MainMenu_PrintConnectToWiiButton

	thumb_func_start ov74_MainMenu_PrintNintendoWFCSetupButton
ov74_MainMenu_PrintNintendoWFCSetupButton: ; 0x0222820C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, _0222824C ; =ov74_0223BCBC + 8
	lsl r6, r4, #4
	ldr r0, [r0, r6]
	add r1, r2, #0
	str r0, [sp]
	ldr r0, [r5]
	mov r2, #3
	add r7, r3, #0
	bl ov74_02235568
	lsl r4, r4, #2
	mov r0, #0x11
	mov r3, #2
	add r1, r5, r4
	lsl r0, r0, #4
	str r3, [r1, r0]
	add r0, r5, #0
	mov r1, #0x17
	add r2, r7, #0
	bl ov74_02227D88
	ldr r0, _02228250 ; =ov74_0223BCBC
	ldr r1, [r0, r6]
	add r0, r5, r4
	add r0, #0xec
	str r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222824C: .word ov74_0223BCBC + 8
_02228250: .word ov74_0223BCBC
	thumb_func_end ov74_MainMenu_PrintNintendoWFCSetupButton

	thumb_func_start ov74_MainMenu_PrintConnectToPokewalkerButton
ov74_MainMenu_PrintConnectToPokewalkerButton: ; 0x02228254
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	ldr r0, _02228288 ; =ov74_0223BCBC + 8
	lsl r4, r6, #4
	ldr r0, [r0, r4]
	add r1, r2, #0
	str r0, [sp]
	ldr r0, [r5]
	add r7, r3, #0
	mov r2, #3
	bl ov74_02235568
	add r0, r5, #0
	mov r1, #0x17
	add r2, r7, #0
	bl ov74_02227DD4
	ldr r0, _0222828C ; =ov74_0223BCBC
	ldr r1, [r0, r4]
	lsl r0, r6, #2
	add r0, r5, r0
	add r0, #0xec
	str r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02228288: .word ov74_0223BCBC + 8
_0222828C: .word ov74_0223BCBC
	thumb_func_end ov74_MainMenu_PrintConnectToPokewalkerButton

	thumb_func_start ov74_MainMenu_PrintWiiMessageSettingsButton
ov74_MainMenu_PrintWiiMessageSettingsButton: ; 0x02228290
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	ldr r0, _022282C4 ; =ov74_0223BCBC + 8
	lsl r4, r6, #4
	ldr r0, [r0, r4]
	add r1, r2, #0
	str r0, [sp]
	ldr r0, [r5]
	add r7, r3, #0
	mov r2, #3
	bl ov74_02235568
	add r0, r5, #0
	mov r1, #0x17
	add r2, r7, #0
	bl ov74_02227DD4
	ldr r0, _022282C8 ; =ov74_0223BCBC
	ldr r1, [r0, r4]
	lsl r0, r6, #2
	add r0, r5, r0
	add r0, #0xec
	str r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022282C4: .word ov74_0223BCBC + 8
_022282C8: .word ov74_0223BCBC
	thumb_func_end ov74_MainMenu_PrintWiiMessageSettingsButton

	thumb_func_start ov74_022282CC
ov74_022282CC: ; 0x022282CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	mov r1, #0x1b
	add r7, r0, #0
	mov r0, #0
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	str r0, [r7, r1]
	str r0, [sp, #0x10]
	add r0, r7, #0
	str r0, [sp, #8]
	add r0, #0x5c
	str r0, [sp, #8]
	add r0, r7, #0
	mov r5, #1
	str r0, [sp, #0x14]
	add r0, #0x20
	ldr r4, _02228410 ; =ov74_0223BCBC
	str r5, [r7, #0x20]
	str r7, [sp, #0x18]
	str r0, [sp, #0x14]
_022282F6:
	ldr r0, _02228414 ; =0x000003F7
	ldr r1, [sp, #8]
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r3, _02228418 ; =0x000001BA
	add r0, sp, #0x1c
	mov r2, #1
	bl ov74_02235414
	ldr r2, [r4, #4]
	ldr r3, [r7, #0x20]
	add r0, sp, #0x1c
	mov r1, #0x17
	bl ov74_02235464
	ldr r0, [r4, #0xc]
	mov ip, r0
	cmp r0, #0
	beq _02228398
	ldr r0, [sp, #0x18]
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _0222837C
	ldr r0, [sp, #0x2c]
	mov r1, #3
	bl SetWindowX
	lsl r1, r5, #0x18
	ldr r0, [sp, #0x2c]
	lsr r1, r1, #0x18
	bl SetWindowY
	ldr r2, [sp, #0x54]
	ldr r3, [sp, #0x58]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x2c]
	mov r1, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl DrawFrameAndWindow1
	mov r1, #0x11
	ldr r0, [sp, #0x18]
	lsl r1, r1, #4
	ldr r3, [r0, r1]
	cmp r3, #0
	beq _02228366
	add r0, r7, #0
	mov r1, #0x17
	add r2, r5, #0
	bl ov74_02227D88
	b _02228370
_02228366:
	add r0, r7, #0
	mov r1, #0x17
	add r2, r5, #0
	bl ov74_02227DD4
_02228370:
	ldr r0, [r4, #4]
	add r0, r0, #2
	add r5, r5, r0
	mov r0, #1
	str r0, [sp, #0xc]
	b _022283B6
_0222837C:
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	add r2, sp, #0x1c
	add r3, r5, #0
	mov r6, ip
	blx r6
	cmp r0, #1
	bne _022283B6
	ldr r0, [r4, #4]
	add r0, r0, #2
	add r5, r5, r0
	mov r0, #1
	str r0, [sp, #0xc]
	b _022283B6
_02228398:
	ldr r0, [r4, #8]
	add r1, sp, #0x1c
	str r0, [sp]
	ldr r0, [r7]
	mov r2, #3
	add r3, r5, #0
	bl ov74_02235568
	ldr r0, [sp, #0x18]
	ldr r1, [r4]
	add r0, #0xec
	str r1, [r0]
	ldr r0, [r4, #4]
	add r0, r0, #2
	add r5, r5, r0
_022283B6:
	ldr r0, [sp, #0x14]
	ldr r1, [r4, #4]
	ldr r2, [r0]
	mov r0, #0x17
	mul r0, r1
	add r1, r2, r0
	ldr r0, [sp, #0x14]
	str r1, [r0]
	ldr r0, [sp, #0x18]
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _022283DE
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	add r1, r0, #1
	mov r0, #0x1b
	lsl r0, r0, #4
	str r1, [r7, r0]
_022283DE:
	ldr r0, [sp, #8]
	add r4, #0x10
	add r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #9
	bhs _022283F8
	b _022282F6
_022283F8:
	add r0, r7, #0
	bl ov74_0222879C
	add r0, r7, #0
	add r7, #0x54
	ldrh r1, [r7]
	bl ov74_0222841C
	ldr r0, [sp, #0xc]
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228410: .word ov74_0223BCBC
_02228414: .word 0x000003F7
_02228418: .word 0x000001BA
	thumb_func_end ov74_022282CC

	thumb_func_start ov74_0222841C
ov74_0222841C: ; 0x0222841C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r7, r0, #0
	add r0, r1, #0
	add r0, r0, #5
	str r0, [sp, #0x14]
	add r0, r1, #0
	add r4, r7, #0
	sub r0, r0, #5
	str r1, [sp, #0xc]
	mov r6, #0
	add r4, #0x5c
	str r0, [sp, #0x10]
_02228436:
	add r0, r4, #0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222852C
	cmp r6, #0
	bne _02228452
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r7, r0]
	mov r0, #6
	lsl r0, r0, #0x12
	cmp r1, r0
	beq _0222852C
_02228452:
	ldr r0, [sp, #0x10]
	cmp r6, r0
	blt _0222852C
	ldr r0, [sp, #0x14]
	cmp r6, r0
	bgt _0222852C
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	cmp r0, #1
	bne _022284A8
	ldr r2, _02228540 ; =0x000003EE
	add r0, r4, #0
	mov r1, #1
	mov r3, #2
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x18]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r7]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	mov r1, #0
	bl BgTilemapRectChangePalette
	b _0222852C
_022284A8:
	ldr r0, [sp, #0xc]
	cmp r6, r0
	bne _022284EE
	ldr r2, _02228540 ; =0x000003EE
	add r0, r4, #0
	mov r1, #1
	mov r3, #3
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x24]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r7]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	mov r1, #0
	bl BgTilemapRectChangePalette
	b _0222852C
_022284EE:
	ldr r2, _02228544 ; =0x000003F7
	add r0, r4, #0
	mov r1, #1
	mov r3, #2
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x28]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x2c]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r7]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	mov r1, #0
	bl BgTilemapRectChangePalette
_0222852C:
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #9
	blo _02228436
	ldr r0, [r7]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02228540: .word 0x000003EE
_02228544: .word 0x000003F7
	thumb_func_end ov74_0222841C

	thumb_func_start ov74_02228548
ov74_02228548: ; 0x02228548
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	mov r0, #0x59
	lsl r0, r0, #2
	str r1, [sp, #0xc]
	mov r7, #0
	add r4, r6, r0
_02228558:
	add r0, r4, #0
	bl WindowIsInUse
	cmp r0, #0
	bne _02228564
	b _02228678
_02228564:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _022285AA
	ldr r2, _02228690 ; =0x000003F7
	add r0, r4, #0
	mov r1, #1
	mov r3, #2
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x10]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x14]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r6]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	mov r1, #1
	bl BgTilemapRectChangePalette
	b _02228678
_022285AA:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #1
	bne _022285F4
	ldr r2, _02228694 ; =0x000003EE
	add r0, r4, #0
	mov r1, #1
	mov r3, #2
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x18]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r6]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	mov r1, #1
	bl BgTilemapRectChangePalette
	b _02228678
_022285F4:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bne _0222863A
	ldr r2, _02228694 ; =0x000003EE
	add r0, r4, #0
	mov r1, #1
	mov r3, #3
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x24]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r6]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	mov r1, #1
	bl BgTilemapRectChangePalette
	b _02228678
_0222863A:
	ldr r2, _02228690 ; =0x000003F7
	add r0, r4, #0
	mov r1, #1
	mov r3, #2
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl GetWindowX
	str r0, [sp, #0x28]
	add r0, r4, #0
	bl GetWindowY
	str r0, [sp, #0x2c]
	add r0, r4, #0
	bl GetWindowWidth
	add r5, r0, #0
	add r0, r4, #0
	bl GetWindowHeight
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r6]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	mov r1, #1
	bl BgTilemapRectChangePalette
_02228678:
	add r7, r7, #1
	add r4, #0x10
	cmp r7, #2
	bge _02228682
	b _02228558
_02228682:
	ldr r0, [r6]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228690: .word 0x000003F7
_02228694: .word 0x000003EE
	thumb_func_end ov74_02228548

	thumb_func_start ov74_02228698
ov74_02228698: ; 0x02228698
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x54
	ldrh r6, [r0]
	mov r7, #8
	add r3, r7, #0
	add r4, r6, #0
	mov r0, #0
	sub r3, #9
_022286AA:
	add r4, r4, r1
	cmp r4, r3
	bne _022286B2
	add r4, r0, #0
_022286B2:
	cmp r4, #9
	bne _022286B8
	add r4, r7, #0
_022286B8:
	cmp r4, r6
	beq _022286CE
	lsl r2, r4, #2
	add r2, r5, r2
	add r2, #0xec
	ldr r2, [r2]
	cmp r2, #0
	beq _022286AA
	ldr r0, _022286F4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
_022286CE:
	add r0, r5, #0
	add r0, #0x54
	strh r4, [r0]
	add r0, r5, #0
	add r0, #0x54
	ldrh r1, [r0]
	cmp r1, r6
	beq _022286F0
	add r0, r5, #0
	bl ov74_0222841C
	mov r0, #0x6d
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022286F0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022286F4: .word SEQ_SE_DP_SELECT
	thumb_func_end ov74_02228698

	thumb_func_start ov74_022286F8
ov74_022286F8: ; 0x022286F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r5, #0
	add r6, #0x5c
	lsl r7, r1, #4
	add r0, r6, r7
	bl GetWindowY
	sub r0, r0, #1
	lsl r4, r0, #3
	add r0, r6, r7
	bl GetWindowHeight
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	cmp r0, r4
	bgt _0222872C
	add r0, #0xc0
	cmp r0, r4
	bgt _02228796
_0222872C:
	mov r0, #0x4e
	lsl r1, r4, #0xc
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov74_0222879C
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #6
	lsl r0, r0, #0x12
	cmp r1, r0
	bne _0222878C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #2
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r5]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0222878C:
	cmp r1, #0
	bne _02228796
	add r0, r5, #0
	bl ov74_022282CC
_02228796:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov74_022286F8

	thumb_func_start ov74_0222879C
ov74_0222879C: ; 0x0222879C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0x4e
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	ldr r5, [sp]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r7, r0, #0xc
	add r0, r7, #0
	str r0, [sp, #0xc]
	add r0, #0xc0
	ldr r6, [sp, #4]
	add r5, #0x5c
	str r0, [sp, #0xc]
_022287C6:
	add r0, r5, #0
	bl WindowIsInUse
	cmp r0, #0
	beq _022287F2
	add r0, r5, #0
	bl GetWindowY
	sub r0, r0, #1
	lsl r4, r0, #3
	add r0, r5, #0
	bl GetWindowHeight
	cmp r7, r4
	ble _022287E8
	mov r0, #1
	str r0, [sp, #8]
_022287E8:
	ldr r0, [sp, #0xc]
	cmp r0, r4
	bgt _022287F2
	mov r0, #1
	str r0, [sp, #4]
_022287F2:
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #9
	blo _022287C6
	mov r1, #0x1a
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [sp, #8]
	lsl r1, r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r1, #0x1a
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r1, #0x69
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r1, [sp, #4]
	lsl r1, r1, #1
	add r1, r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r1, #0x69
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222879C

	thumb_func_start ov74_0222883C
ov74_0222883C: ; 0x0222883C
	push {r3, r4, r5, r6, r7, lr}
	bl OverlayManager_GetData
	mov r1, #0x1a
	add r7, r0, #0
	lsl r1, r1, #4
	ldr r0, [r7, r1]
	cmp r0, #0
	bne _02228856
	add r1, r1, #4
	ldr r1, [r7, r1]
	cmp r1, #0
	beq _02228868
_02228856:
	bl sub_02024758
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_02024758
	bl ov74_022359BC
_02228868:
	add r5, r7, #0
	mov r6, #0
	add r4, r7, #0
	add r5, #0x5c
_02228870:
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _02228882
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
_02228882:
	add r6, r6, #1
	add r4, #0x10
	add r5, #0x10
	cmp r6, #9
	blo _02228870
	ldr r0, [r7]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r7]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r7]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r2, _022288C0 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, [r7]
	bl FreeToHeap
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022288C0: .word 0x04000304
	thumb_func_end ov74_0222883C

	thumb_func_start ov74_022288C4
ov74_022288C4: ; 0x022288C4
	mov r1, #0x6a
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	lsl r3, r2, #1
	ldr r2, _022288F0 ; =ov74_0223BBF0
	ldrh r2, [r2, r3]
	cmp r2, #0
	bne _022288D8
	mov r2, #0
	str r2, [r0, r1]
_022288D8:
	mov r1, #0x6a
	lsl r1, r1, #2
	ldr r3, [r0, r1]
	add r2, r3, #1
	str r2, [r0, r1]
	ldr r0, _022288F0 ; =ov74_0223BBF0
	lsl r1, r3, #1
	ldrh r1, [r0, r1]
	ldr r0, _022288F4 ; =0x0500006C
	strh r1, [r0]
	bx lr
	nop
_022288F0: .word ov74_0223BBF0
_022288F4: .word 0x0500006C
	thumb_func_end ov74_022288C4

	thumb_func_start ov74_022288F8
ov74_022288F8: ; 0x022288F8
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	add r0, r4, #0
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _02228918 ; =0x027E0000
	ldr r1, _0222891C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_02228918: .word 0x027E0000
_0222891C: .word 0x00003FF8
	thumb_func_end ov74_022288F8

	thumb_func_start ov74_MainMenu_AppInit
ov74_MainMenu_AppInit: ; 0x02228920
	push {r3, r4, r5, lr}
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x4f
	lsl r2, r2, #0x12
	bl CreateHeap
	mov r1, #0x6e
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #0x4f
	bl OverlayManager_CreateAndGetData
	mov r2, #0x6e
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	mov r0, #0x4f
	bl BgConfig_Alloc
	str r0, [r4]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	bl Save_MysteryGift_get
	str r0, [r4, #0x14]
	mov r0, #0x4d
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	bl Sav2_Pokedex_get
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	bl Sav2_PlayerData_GetIGTAddr
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	bl Pokedex_IsEnabled
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0xc]
	bl PlayerProfile_CountBadges
	str r0, [r4, #0x50]
	mov r0, #0x51
	mov r1, #0xf
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0x4f
	bl ov74_022352A0
	ldr r0, [r4, #4]
	bl Save_FileExists
	cmp r0, #0
	bne _022289C4
	mov r0, #0x61
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
_022289C4:
	mov r0, #0
	bl sub_02005AF8
	mov r0, #0
	bl sub_02004AD8
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_MainMenu_AppInit

	thumb_func_start ov74_MainMenu_AppExec
ov74_MainMenu_AppExec: ; 0x022289D4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	bl CTRDG_IsExisting
	add r0, r4, #0
	bl ov74_0222779C
	cmp r0, #1
	bne _02228A04
	add r0, r4, #0
	bl ov74_022276AC
	add r0, r4, #0
	bl ov74_02227AEC
	mov r0, #0
	pop {r4, r5, r6, pc}
_02228A04:
	add r0, r4, #0
	bl ov74_022288C4
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02228A18
	sub r1, r1, #1
	str r1, [r4, r0]
_02228A18:
	ldr r0, [r5]
	cmp r0, #9
	bls _02228A20
	b _02228B70
_02228A20:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228A2C: ; jump table
	.short _02228A40 - _02228A2C - 2 ; case 0
	.short _02228A4C - _02228A2C - 2 ; case 1
	.short _02228A72 - _02228A2C - 2 ; case 2
	.short _02228A8A - _02228A2C - 2 ; case 3
	.short _02228AB8 - _02228A2C - 2 ; case 4
	.short _02228AFC - _02228A2C - 2 ; case 5
	.short _02228B32 - _02228A2C - 2 ; case 6
	.short _02228B5A - _02228A2C - 2 ; case 7
	.short _02228B64 - _02228A2C - 2 ; case 8
	.short _02228B6C - _02228A2C - 2 ; case 9
_02228A40:
	add r0, r4, #0
	bl ov74_02227B7C
	mov r0, #1
	str r0, [r5]
	b _02228B70
_02228A4C:
	add r0, r4, #0
	bl ov74_02227580
	cmp r0, #0
	bne _02228A5C
	mov r0, #3
	str r0, [r5]
	b _02228B70
_02228A5C:
	mov r0, #1
	mov r1, #2
	add r2, r5, #0
	mov r3, #8
	bl ov74_0223539C
	mov r0, #5
	ldr r1, _02228B84 ; =0x00007D8C
	lsl r0, r0, #0x18
	strh r1, [r0]
	b _02228B70
_02228A72:
	add r0, r4, #0
	bl ov74_02227584
	cmp r0, #0
	bne _02228B70
	mov r0, #0
	mov r1, #3
	add r2, r5, #0
	mov r3, #8
	bl ov74_0223539C
	b _02228B70
_02228A8A:
	mov r0, #0x4f
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x48
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02228AAC
	mov r0, #2
	str r0, [r4, #0x58]
	mov r0, #0
	mov r1, #7
	add r2, r5, #0
	mov r3, #8
	bl ov74_0223539C
	b _02228B70
_02228AAC:
	add r0, r4, #0
	bl ov74_0222763C
	mov r0, #4
	str r0, [r5]
	b _02228B70
_02228AB8:
	add r0, r4, #0
	bl ov74_02227CC8
	add r0, r4, #0
	bl ov74_02227D48
	ldr r0, _02228B88 ; =ov74_022288F8
	ldr r1, [r4]
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov74_022282CC
	add r1, r4, #0
	add r1, #0x54
	ldrh r1, [r1]
	add r0, r4, #0
	bl ov74_0222841C
	mov r0, #1
	mov r1, #5
	add r2, r5, #0
	mov r3, #8
	bl ov74_0223539C
	mov r0, #5
	ldr r1, _02228B84 ; =0x00007D8C
	lsl r0, r0, #0x18
	strh r1, [r0]
	mov r0, #0x4f
	mov r1, #0xa
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02228B70
_02228AFC:
	add r0, r4, #0
	add r1, r5, #0
	bl ov74_02227428
	ldr r0, [r4, #0x48]
	cmp r0, #1
	bne _02228B16
	add r0, r4, #0
	bl ov74_022282CC
	mov r0, #0
	str r0, [r4, #0x48]
	b _02228B70
_02228B16:
	ldr r0, [r5]
	cmp r0, #5
	bne _02228B70
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _02228B70
	mov r1, #0
	str r1, [r4, r0]
	mov r1, #1
	sub r0, #0x40
	str r1, [r4, r0]
	b _02228B70
_02228B32:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0xf
	bne _02228B70
	add r0, #0xc
	ldr r1, [r4, r0]
	mov r0, #2
	tst r0, r1
	beq _02228B4C
	mov r0, #5
	str r0, [r5]
	b _02228B70
_02228B4C:
	mov r0, #0
	mov r1, #7
	add r2, r5, #0
	mov r3, #8
	bl ov74_0223539C
	b _02228B70
_02228B5A:
	add r0, r6, #0
	bl ov74_0222883C
	mov r0, #1
	pop {r4, r5, r6, pc}
_02228B64:
	add r0, r5, #0
	bl ov74_022353FC
	b _02228B70
_02228B6C:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02228B70:
	add r0, r4, #0
	bl ov74_022276AC
	add r0, r4, #0
	bl ov74_02227AEC
	bl ov74_022358BC
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02228B84: .word 0x00007D8C
_02228B88: .word ov74_022288F8
	thumb_func_end ov74_MainMenu_AppExec

	.public ov36_App_MainMenu_SelectOption_Continue
	.public ov36_App_MainMenu_SelectOption_NewGame
	.public gApp_MainMenu_SelectOption_NintendoWFCSetup
	.public ov112_App_MainMenu_SelectOption_ConnectToPokewalker
	.public gApp_MainMenu_SelectOption_NintendoWFCSetup
	.public ov75_App_MainMenu_SelectOption_WiiMessageSettings

	thumb_func_start ov74_MainMenu_QueueSelectedApp
ov74_MainMenu_QueueSelectedApp: ; 0x02228B8C
	push {r3, lr}
	ldr r0, [r0, #0x58]
	cmp r0, #9
	bhi _02228C22
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228BA0: ; jump table
	.short _02228C1A - _02228BA0 - 2 ; case 0
	.short _02228BB4 - _02228BA0 - 2 ; case 1
	.short _02228BBE - _02228BA0 - 2 ; case 2
	.short _02228BFE - _02228BA0 - 2 ; case 3
	.short _02228BC8 - _02228BA0 - 2 ; case 4
	.short _02228BDC - _02228BA0 - 2 ; case 5
	.short _02228BD2 - _02228BA0 - 2 ; case 6
	.short _02228BE6 - _02228BA0 - 2 ; case 7
	.short _02228BEE - _02228BA0 - 2 ; case 8
	.short _02228C0C - _02228BA0 - 2 ; case 9
_02228BB4:
	ldr r0, _02228C24 ; =FS_OVERLAY_ID(OVY_36)
	ldr r1, _02228C28 ; =ov36_App_MainMenu_SelectOption_Continue
	bl RegisterMainOverlay
	pop {r3, pc}
_02228BBE:
	ldr r0, _02228C24 ; =FS_OVERLAY_ID(OVY_36)
	ldr r1, _02228C2C ; =ov36_App_MainMenu_SelectOption_NewGame
	bl RegisterMainOverlay
	pop {r3, pc}
_02228BC8:
	ldr r0, _02228C30 ; =FS_OVERLAY_ID(OVY_74)
	ldr r1, _02228C34 ; =gApp_MainMenu_SelectOption_MysteryGift
	bl RegisterMainOverlay
	pop {r3, pc}
_02228BD2:
	ldr r0, _02228C30 ; =FS_OVERLAY_ID(OVY_74)
	ldr r1, _02228C38 ; =gApp_MainMenu_SelectOption_MigrateFromAgb
	bl RegisterMainOverlay
	pop {r3, pc}
_02228BDC:
	ldr r0, _02228C30 ; =FS_OVERLAY_ID(OVY_74)
	ldr r1, _02228C3C ; =gApp_MainMenu_SelectOption_ConnectToRanger
	bl RegisterMainOverlay
	pop {r3, pc}
_02228BE6:
	ldr r0, _02228C40 ; =ov74_0223BD4C ; "data/eoo.dat"
	bl sub_02027098
	pop {r3, pc}
_02228BEE:
	bl sub_02005FA0
	mov r0, #0
	ldr r1, _02228C44 ; =gApp_MainMenu_SelectOption_NintendoWFCSetup
	mvn r0, r0
	bl RegisterMainOverlay
	pop {r3, pc}
_02228BFE:
	bl sub_02005FA0
	ldr r0, _02228C48 ; =FS_OVERLAY_ID(OVY_112)
	ldr r1, _02228C4C ; =ov112_App_MainMenu_SelectOption_ConnectToPokewalker
	bl RegisterMainOverlay
	pop {r3, pc}
_02228C0C:
	bl sub_02005FA0
	ldr r0, _02228C50 ; =FS_OVERLAY_ID(OVY_75)
	ldr r1, _02228C54 ; =ov75_App_MainMenu_SelectOption_WiiMessageSettings
	bl RegisterMainOverlay
	pop {r3, pc}
_02228C1A:
	ldr r0, _02228C58 ; =FS_OVERLAY_ID(OVY_60)
	ldr r1, _02228C5C ; =ov60_021EAFE0
	bl RegisterMainOverlay
_02228C22:
	pop {r3, pc}
	.balign 4, 0
_02228C24: .word FS_OVERLAY_ID(OVY_36)
_02228C28: .word ov36_App_MainMenu_SelectOption_Continue
_02228C2C: .word ov36_App_MainMenu_SelectOption_NewGame
_02228C30: .word FS_OVERLAY_ID(OVY_74)
_02228C34: .word gApp_MainMenu_SelectOption_MysteryGift
_02228C38: .word gApp_MainMenu_SelectOption_MigrateFromAgb
_02228C3C: .word gApp_MainMenu_SelectOption_ConnectToRanger
_02228C40: .word ov74_0223BD4C
_02228C44: .word gApp_MainMenu_SelectOption_NintendoWFCSetup
_02228C48: .word FS_OVERLAY_ID(OVY_112)
_02228C4C: .word ov112_App_MainMenu_SelectOption_ConnectToPokewalker
_02228C50: .word FS_OVERLAY_ID(OVY_75)
_02228C54: .word ov75_App_MainMenu_SelectOption_WiiMessageSettings
_02228C58: .word FS_OVERLAY_ID(OVY_60)
_02228C5C: .word ov60_021EAFE0
	thumb_func_end ov74_MainMenu_QueueSelectedApp

	thumb_func_start ov74_MainMenu_AppExit
ov74_MainMenu_AppExit: ; 0x02228C60
	push {r4, lr}
	add r4, r0, #0
	bl OverlayManager_GetData
	bl ov74_MainMenu_QueueSelectedApp
	add r0, r4, #0
	bl OverlayManager_FreeData
	mov r0, #0x4f
	bl DestroyHeap
	mov r0, #0
	bl ov74_02236034
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_MainMenu_AppExit

	thumb_func_start ov74_02228C84
ov74_02228C84: ; 0x02228C84
	push {r3, r4}
	ldr r4, _02228CAC ; =ov74_0223BD68
	ldr r1, _02228CB0 ; =0x00000123
	mov r3, #0
_02228C8C:
	ldrh r2, [r4, #2]
	cmp r0, r2
	bne _02228C9C
	ldr r0, _02228CAC ; =ov74_0223BD68
	lsl r1, r3, #2
	ldrh r0, [r0, r1]
	pop {r3, r4}
	bx lr
_02228C9C:
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, r1
	blo _02228C8C
	mov r0, #0x3f
	pop {r3, r4}
	bx lr
	nop
_02228CAC: .word ov74_0223BD68
_02228CB0: .word 0x00000123
	thumb_func_end ov74_02228C84

	thumb_func_start ov74_IntToWstring5
ov74_IntToWstring5: ; 0x02228CB4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _02228D1C ; =0x00002710
	add r0, r4, #0
	bl _s32_div_f
	add r0, #0x30
	strh r0, [r5]
	ldr r1, _02228D1C ; =0x00002710
	add r0, r4, #0
	bl _s32_div_f
	add r4, r1, #0
	mov r1, #0xfa
	add r0, r4, #0
	lsl r1, r1, #2
	bl _s32_div_f
	add r0, #0x30
	mov r1, #0xfa
	strh r0, [r5, #2]
	add r0, r4, #0
	lsl r1, r1, #2
	bl _s32_div_f
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #0x64
	bl _s32_div_f
	add r0, #0x30
	strh r0, [r5, #4]
	add r0, r4, #0
	mov r1, #0x64
	bl _s32_div_f
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	add r0, #0x30
	strh r0, [r5, #6]
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	add r4, r1, #0
	add r4, #0x30
	strh r4, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02228D1C: .word 0x00002710
	thumb_func_end ov74_IntToWstring5

	thumb_func_start ov74_02228D20
ov74_02228D20: ; 0x02228D20
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7, #0x10]
	bl PlayerProfile_GetNamePtr
	ldr r5, _02228D58 ; =ov74_0223D080
	add r4, r0, #0
	mov r6, #0
_02228D30:
	ldrh r0, [r4]
	bl ov74_02228C84
	strh r0, [r5]
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, #2
	cmp r6, #8
	blt _02228D30
	ldr r0, [r7, #0x10]
	bl PlayerProfile_GetTrainerID_VisibleHalf
	add r1, r0, #0
	ldr r0, _02228D5C ; =ov74_0223D090
	bl ov74_IntToWstring5
	ldr r0, _02228D60 ; =ov74_0223D080
	mov r1, #0
	strh r1, [r0, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02228D58: .word ov74_0223D080
_02228D5C: .word ov74_0223D090
_02228D60: .word ov74_0223D080
	thumb_func_end ov74_02228D20

	thumb_func_start ov74_02228D64
ov74_02228D64: ; 0x02228D64
	push {r3, r4, r5, lr}
	sub sp, #0x48
	ldr r5, _02228E90 ; =_0223B340
	add r4, r0, #0
	add r3, sp, #0x20
	mov r2, #5
_02228D70:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02228D70
	ldr r3, _02228E94 ; =_0223B330
	add r2, sp, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, sp, #0x20
	bl GX_SetBanks
	add r0, sp, #0x10
	bl SetBothScreensModesAndDisable
	mov r1, #0
	str r1, [sp]
	mov r3, #0xf
	ldr r0, [r4, #4]
	mov r2, #1
	lsl r3, r3, #0xc
	bl ov74_02235308
	mov r0, #1
	lsl r0, r0, #0xe
	str r0, [sp]
	mov r1, #1
	mov r3, #0x3e
	ldr r0, [r4, #4]
	add r2, r1, #0
	lsl r3, r3, #0xa
	bl ov74_02235308
	mov r0, #0
	str r0, [sp]
	mov r3, #0x1e
	ldr r0, [r4, #4]
	mov r1, #4
	mov r2, #1
	lsl r3, r3, #0xa
	bl ov74_02235308
	mov r0, #1
	lsl r0, r0, #0xe
	str r0, [sp]
	mov r3, #7
	ldr r0, [r4, #4]
	mov r1, #5
	mov r2, #1
	lsl r3, r3, #0xc
	bl ov74_02235308
	bl ResetAllTextPrinters
	mov r0, #0
	ldr r2, [r4]
	add r1, r0, #0
	bl LoadFontPal0
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	mov r2, #1
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r3, r2, #0
	bl LoadUserFrameGfx1
	ldr r0, [r4, #0x14]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #0
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	mov r2, #0xa
	mov r3, #2
	bl LoadUserFrameGfx2
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #0x71
	add r3, r0, #0
	add r2, r1, #0
	add r3, #0x8f
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	mov r1, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4]
	add r3, r1, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	mov r0, #0x71
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r4]
	mov r1, #2
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	mov r0, #0x71
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r4, #4]
	mov r1, #1
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r4, #4]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	add r0, r4, #0
	bl ov74_02228E98
	add sp, #0x48
	pop {r3, r4, r5, pc}
	nop
_02228E90: .word _0223B340
_02228E94: .word _0223B330
	thumb_func_end ov74_02228D64

	thumb_func_start ov74_02228E98
ov74_02228E98: ; 0x02228E98
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #4
	add r3, r2, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0
	add r3, #0xfc
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, [r4]
	mov r3, #4
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	mov r0, #0x71
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #2
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	mov r0, #0x71
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r4, #4]
	mov r1, #4
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r4, #4]
	mov r1, #4
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_02228E98

	thumb_func_start ov74_02228F14
ov74_02228F14: ; 0x02228F14
	push {r3, r4, lr}
	sub sp, #0x5c
	add r4, r0, #0
	add r0, #0x18
	bl WindowIsInUse
	cmp r0, #0
	bne _02228F5E
	mov r0, #1
	str r0, [sp]
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, sp, #8
	add r1, #0x18
	mov r2, #0
	mov r3, #0x11
	bl ov74_02235414
	mov r3, #0x51
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	add r0, sp, #8
	mov r1, #0x16
	mov r2, #0x10
	bl ov74_02235464
	mov r0, #2
	str r0, [sp]
	ldr r0, [r4, #4]
	add r1, sp, #8
	mov r2, #5
	mov r3, #4
	bl ov74_02235568
	add sp, #0x5c
	mov r0, #1
	pop {r3, r4, pc}
_02228F5E:
	ldr r0, _02228F88 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _02228F80
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0
	bl sub_0200E5D4
	add r4, #0x18
	add r0, r4, #0
	bl RemoveWindow
	add sp, #0x5c
	mov r0, #0
	pop {r3, r4, pc}
_02228F80:
	mov r0, #1
	add sp, #0x5c
	pop {r3, r4, pc}
	nop
_02228F88: .word gSystem
	thumb_func_end ov74_02228F14

	thumb_func_start ov74_02228F8C
ov74_02228F8C: ; 0x02228F8C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x48
	add r1, #0x28
	mov r2, #0
	mov r3, #0xf7
	bl ov74_02235414
	mov r3, #0x51
	lsl r3, r3, #2
	add r0, r4, #0
	ldr r3, [r4, r3]
	add r0, #0x48
	mov r1, #0x1b
	mov r2, #4
	bl ov74_02235464
	add r0, r4, #0
	mov r1, #1
	add r0, #0x48
	add r2, r1, #0
	bl ov74_0223546C
	mov r0, #0x48
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
	add r0, r4, #0
	add r0, #0x48
	bl ov74_02235634
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r3, #0xf7
	add r0, r2, r0
	str r0, [r4, r1]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x9c
	add r1, #0x18
	mov r2, #0
	bl ov74_02235414
	mov r3, #0x51
	lsl r3, r3, #2
	add r0, r4, #0
	ldr r3, [r4, r3]
	add r0, #0x9c
	mov r1, #0x1e
	mov r2, #4
	bl ov74_02235464
	add r0, r4, #0
	add r0, #0x9c
	mov r1, #0
	mov r2, #1
	bl ov74_0223546C
	mov r0, #0xb
	str r0, [sp]
	add r1, r4, #0
	mov r2, #1
	ldr r0, [r4, #4]
	add r1, #0x9c
	add r3, r2, #0
	bl ov74_02235568
	add r0, r4, #0
	add r0, #0x9c
	bl ov74_02235634
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	add r0, r2, r0
	str r0, [r4, r1]
	bl ov74_0223563C
	bl ov74_02235690
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0xe
	mov r2, #0xb
	mov r3, #0xd
	bl ov74_02235728
	mov r0, #1
	str r0, [sp]
	ldr r1, _02229080 ; =0x00003170
	mov r0, #0
	ldr r1, [r4, r1]
	mov r2, #0x80
	mov r3, #0x4c
	bl ov74_02235930
	ldr r1, _02229080 ; =0x00003170
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov74_02229084
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02229080: .word 0x00003170
	thumb_func_end ov74_02228F8C

	thumb_func_start ov74_02229084
ov74_02229084: ; 0x02229084
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5]
	bl ScrStrBufs_new
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xf0
	add r1, #0x38
	mov r2, #0
	mov r3, #0xf7
	bl ov74_02235414
	mov r3, #0x51
	lsl r3, r3, #2
	add r0, r5, #0
	ldr r3, [r5, r3]
	add r0, #0xf0
	mov r1, #0x1a
	mov r2, #4
	bl ov74_02235464
	add r0, r5, #0
	add r0, #0xf0
	mov r1, #0
	mov r2, #1
	bl ov74_0223546C
	mov r0, #0x41
	lsl r0, r0, #2
	str r4, [r5, r0]
	ldr r2, [r5, #0x10]
	add r0, r4, #0
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r5, #0x10]
	bl PlayerProfile_GetTrainerID_VisibleHalf
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	add r0, r4, #0
	mov r3, #5
	str r1, [sp, #4]
	bl BufferIntegerAsString
	mov r0, #0x44
	str r0, [sp]
	add r1, r5, #0
	ldr r0, [r5, #4]
	add r1, #0xf0
	mov r2, #3
	mov r3, #0xd
	bl ov74_02235568
	add r1, r5, #0
	mov r0, #0
	add r1, #0xf8
	str r0, [r1]
	mov r1, #1
	bl GetFontAttribute
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0xf0
	mov r1, #0
	bl ov74_02235474
	mov r2, #0x46
	str r2, [sp]
	add r1, r5, #0
	sub r2, #0x47
	ldr r0, [r5, #4]
	add r1, #0xf0
	add r3, r2, #0
	bl ov74_02235568
	add r0, sp, #0x10
	bl OS_GetMacAddress
	add r0, sp, #0x10
	bl ov74_022311F4
	add r1, sp, #0x1c
	add r2, sp, #0x18
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	bl ov74_02231238
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r3, #4
	bl BufferIntegerAsString
	add r0, r5, #0
	mov r1, #1
	add r0, #0xfc
	str r1, [r0]
	mov r2, #0x47
	str r2, [sp]
	ldr r0, [r5, #4]
	add r5, #0xf0
	sub r2, #0x48
	add r1, r5, #0
	add r3, r2, #0
	bl ov74_02235568
	add r0, r4, #0
	bl ScrStrBufs_delete
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov74_02229084

	thumb_func_start ov74_02229190
ov74_02229190: ; 0x02229190
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov74_022359BC
	add r0, r4, #0
	add r0, #0x18
	bl WindowIsInUse
	cmp r0, #1
	bne _022291D8
	add r0, r4, #0
	add r0, #0x18
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x18
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x28
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x28
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x38
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x38
	bl RemoveWindow
_022291D8:
	ldr r0, [r4, #4]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov74_02229190

	thumb_func_start ov74_02229200
ov74_02229200: ; 0x02229200
	push {r3, r4, r5, lr}
	mov r3, #2
	ldr r2, _02229288 ; =0x000034DC
	mov r1, #0x53
	lsl r3, r3, #0x10
	add r5, r0, #0
	bl ov74_022352D0
	add r4, r0, #0
	mov r0, #0x53
	str r0, [r4]
	bl BgConfig_Alloc
	str r0, [r4, #4]
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	str r0, [r4, #8]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	bl Sav2_Pokedex_get
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x14]
	ldr r0, [r4]
	bl ov74_022352A0
	ldr r0, [r4, #8]
	bl Save_MysteryGift_get
	ldr r1, _0222928C ; =0x00003174
	mov r2, #0x53
	str r0, [r4, r1]
	mov r0, #9
	lsl r2, r2, #2
	str r0, [r4, r2]
	add r0, r2, #0
	mov r1, #0x28
	sub r0, #8
	str r1, [r4, r0]
	add r1, r2, #0
	mov r0, #0
	add r1, #8
	str r0, [r4, r1]
	add r1, r2, #0
	add r1, #0x10
	str r0, [r4, r1]
	add r2, #0xc
	str r0, [r4, r2]
	mov r2, #0x57
	mov r1, #0x59
	lsl r2, r2, #4
	bl CreateHeap
	ldr r1, _02229290 ; =0x0000047E
	mov r0, #9
	mov r2, #1
	bl sub_02004EC4
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02229288: .word 0x000034DC
_0222928C: .word 0x00003174
_02229290: .word 0x0000047E
	thumb_func_end ov74_02229200

	thumb_func_start ov74_02229294
ov74_02229294: ; 0x02229294
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	add r6, r0, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0xd
	bhi _022292FA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022292B4: ; jump table
	.short _022292D0 - _022292B4 - 2 ; case 0
	.short _022292F2 - _022292B4 - 2 ; case 1
	.short _02229310 - _022292B4 - 2 ; case 2
	.short _02229362 - _022292B4 - 2 ; case 3
	.short _0222938E - _022292B4 - 2 ; case 4
	.short _022293CA - _022292B4 - 2 ; case 5
	.short _02229404 - _022292B4 - 2 ; case 6
	.short _02229434 - _022292B4 - 2 ; case 7
	.short _02229434 - _022292B4 - 2 ; case 8
	.short _02229434 - _022292B4 - 2 ; case 9
	.short _02229434 - _022292B4 - 2 ; case 10
	.short _0222941A - _022292B4 - 2 ; case 11
	.short _02229422 - _022292B4 - 2 ; case 12
	.short _0222942E - _022292B4 - 2 ; case 13
_022292D0:
	bl ov74_02228D64
	ldr r0, [r4, #0xc]
	bl Pokedex_IsEnabled
	cmp r0, #0
	bne _022292EC
	mov r0, #1
	add r1, r0, #0
	add r2, r5, #0
	mov r3, #0xd
	bl ov74_0223539C
	b _02229434
_022292EC:
	mov r0, #2
	str r0, [r5]
	b _02229434
_022292F2:
	bl ov74_02228F14
	cmp r0, #0
	beq _022292FC
_022292FA:
	b _02229434
_022292FC:
	mov r0, #1
	bl ov74_02235390
	mov r0, #0
	mov r1, #0xc
	add r2, r5, #0
	mov r3, #0xd
	bl ov74_0223539C
	b _02229434
_02229310:
	bl ov74_02228F8C
	ldr r0, _02229440 ; =0x00003174
	ldr r0, [r4, r0]
	bl SaveMysteryGift_FindAvailable
	cmp r0, #0
	bne _0222934C
	add r0, r4, #0
	mov r1, #1
	add r0, #0x98
	str r1, [r0]
	mov r0, #0x16
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
	ldr r1, _02229444 ; =0x0000317C
	add r2, r5, #0
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #3
	mov r3, #0xd
	bl ov74_0223539C
	b _02229434
_0222934C:
	mov r0, #0x53
	mov r1, #7
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	mov r1, #4
	add r2, r5, #0
	mov r3, #0xd
	bl ov74_0223539C
	b _02229434
_02229362:
	ldr r0, _02229444 ; =0x0000317C
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02229434
	ldr r0, _02229448 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r1, r0
	beq _02229434
	bl ov74_02235390
	mov r0, #0
	mov r1, #0xc
	add r2, r5, #0
	mov r3, #0xd
	bl ov74_0223539C
	b _02229434
_0222938E:
	bl ov74_0222962C
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #5
	bne _022293B2
	mov r0, #1
	bl ov74_02235390
	mov r0, #0
	mov r1, #0xc
	add r2, r5, #0
	mov r3, #0xd
	bl ov74_0223539C
	b _02229434
_022293B2:
	cmp r0, #4
	bne _02229434
	mov r0, #1
	bl ov74_02235390
	mov r0, #0
	mov r1, #0xc
	add r2, r5, #0
	mov r3, #0xd
	bl ov74_0223539C
	b _02229434
_022293CA:
	bl ov74_02228E98
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r1, #0xc6
	lsl r1, r1, #6
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0x53
	bl ov74_0222EC08
	mov r0, #1
	mov r1, #6
	add r2, r5, #0
	mov r3, #0xd
	bl ov74_0223539C
	ldr r1, _0222944C ; =0x000032D2
	mov r0, #4
	ldrb r2, [r4, r1]
	bic r2, r0
	strb r2, [r4, r1]
	b _02229434
_02229404:
	ldr r0, _02229448 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _02229434
	mov r0, #0
	mov r1, #0xb
	add r2, r5, #0
	mov r3, #0xd
	bl ov74_0223539C
	b _02229434
_0222941A:
	mov r0, #0
	bl OS_ResetSystem
	b _02229434
_02229422:
	add r0, r6, #0
	bl ov74_02229190
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0222942E:
	add r0, r5, #0
	bl ov74_022353FC
_02229434:
	bl ov74_022358BC
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02229440: .word 0x00003174
_02229444: .word 0x0000317C
_02229448: .word gSystem
_0222944C: .word 0x000032D2
	thumb_func_end ov74_02229294

	thumb_func_start ov74_02229450
ov74_02229450: ; 0x02229450
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x59
	bl DestroyHeap
	ldr r0, _02229474 ; =FS_OVERLAY_ID(OVY_60)
	ldr r1, _02229478 ; =ov60_021EAFE0
	bl RegisterMainOverlay
	add r0, r4, #0
	bl OverlayManager_FreeData
	mov r0, #0x53
	bl DestroyHeap
	mov r0, #1
	pop {r4, pc}
	nop
_02229474: .word FS_OVERLAY_ID(OVY_60)
_02229478: .word ov60_021EAFE0
	thumb_func_end ov74_02229450

	thumb_func_start ov74_0222947C
ov74_0222947C: ; 0x0222947C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0xc6
	lsl r0, r0, #6
	add r4, r5, r0
	mov r2, #0xd6
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	ldr r3, [r5]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	bl NewMsgDataFromNarc
	add r6, r0, #0
	ldr r0, [r5]
	bl ScrStrBufs_new
	mov r1, #0xc6
	mov r2, #7
	lsl r1, r1, #6
	strh r2, [r5, r1]
	ldr r3, [r5]
	add r1, r6, #0
	mov r2, #0x4e
	str r0, [sp]
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0x41
	lsl r1, r1, #2
	add r7, r0, #0
	add r1, r4, r1
	mov r2, #0x24
	bl CopyStringToU16Array
	add r0, r7, #0
	bl String_dtor
	mov r0, #8
	bl ov74_02235A68
	add r7, r0, #0
	mov r0, #7
	bl ov74_02235A68
	str r0, [sp, #4]
	mov r0, #0xc
	bl ov74_02235A68
	str r0, [sp, #8]
	mov r0, #0xa
	bl ov74_02235A68
	str r0, [sp, #0xc]
	mov r0, #0xb
	bl ov74_02235A68
	ldr r1, [sp, #0xc]
	mov r2, #0x53
	orr r1, r0
	ldr r0, [sp, #8]
	lsl r2, r2, #2
	orr r1, r0
	ldr r0, [sp, #4]
	mov r3, #1
	orr r0, r1
	orr r0, r7
	str r0, [r4, r2]
	mov r1, #1
	add r0, r2, #4
	strh r1, [r4, r0]
	add r0, r2, #6
	add r1, r0, #0
	ldrb r1, [r4, r1]
	bic r1, r3
	add r3, r0, #0
	strb r1, [r4, r3]
	add r1, r0, #0
	ldrb r1, [r4, r1]
	mov r3, #2
	bic r1, r3
	add r3, r0, #0
	strb r1, [r4, r3]
	add r1, r0, #0
	ldrb r3, [r4, r1]
	mov r1, #4
	orr r3, r1
	add r1, r0, #0
	strb r3, [r4, r1]
	ldrb r3, [r4, r1]
	mov r1, #8
	orr r3, r1
	add r1, r0, #0
	strb r3, [r4, r1]
	ldrb r2, [r4, r0]
	mov r1, #0x20
	bic r2, r1
	strb r2, [r4, r0]
	ldr r0, [sp]
	ldr r3, [r5]
	add r1, r6, #0
	mov r2, #0x4d
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0x55
	lsl r1, r1, #2
	add r7, r0, #0
	add r1, r4, r1
	mov r2, #0xfa
	bl CopyStringToU16Array
	add r0, r7, #0
	bl String_dtor
	mov r0, #0xd2
	lsl r0, r0, #2
	mov r1, #0
	ldr r3, _022295C0 ; =0x000001EA
	strb r1, [r4, r0]
	add r2, r0, #2
	strh r3, [r4, r2]
	add r2, r0, #4
	strh r1, [r4, r2]
	add r2, r0, #6
	strh r1, [r4, r2]
	add r0, #8
	strb r1, [r4, r0]
	add r0, sp, #0x10
	bl GF_RTC_CopyDate
	add r0, sp, #0x10
	bl RTC_ConvertDateToDay
	mov r1, #0xd5
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp]
	bl ScrStrBufs_delete
	add r0, r6, #0
	bl DestroyMsgData
	ldr r0, _022295C4 ; =0x00003174
	add r1, r4, #0
	ldr r0, [r5, r0]
	mov r2, #3
	bl sub_0202DC2C
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl ov74_02235DC4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022295C0: .word 0x000001EA
_022295C4: .word 0x00003174
	thumb_func_end ov74_0222947C

	thumb_func_start ov74_022295C8
ov74_022295C8: ; 0x022295C8
	mov r2, #0x16
	lsl r2, r2, #4
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov74_022295C8

	thumb_func_start ov74_022295D0
ov74_022295D0: ; 0x022295D0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x16
	lsl r1, r1, #4
	add r4, r3, #0
	ldr r3, [r0, r1]
	sub r3, r3, #1
	str r3, [r0, r1]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _022295F2
	bl ov74_02231008
	mov r0, #0x17
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
_022295F2:
	cmp r2, #0
	beq _0222960A
	bl ov74_02230FD4
	cmp r0, #0
	bne _0222960A
	bl ov74_02231008
	mov r0, #0x16
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222960A:
	cmp r4, #0
	beq _02229622
	ldr r0, _02229628 ; =gSystem
	ldr r0, [r0, #0x48]
	tst r0, r4
	beq _02229622
	bl ov74_02231008
	mov r0, #0x1a
	str r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02229622:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02229628: .word gSystem
	thumb_func_end ov74_022295D0

	thumb_func_start ov74_0222962C
ov74_0222962C: ; 0x0222962C
	push {r3, r4, r5, lr}
	mov r5, #0x57
	lsl r5, r5, #2
	add r4, r0, #0
	sub r0, r5, #4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02229652
	bl ov74_02230E7C
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
	bl ov74_02230D28
	mov r0, #1
	bl ov74_022310B8
_02229652:
	ldr r0, [r4, r5]
	cmp r0, #0x1e
	bls _0222965A
	b _02229B52
_0222965A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02229666: ; jump table
	.short _022296A4 - _02229666 - 2 ; case 0
	.short _022296BA - _02229666 - 2 ; case 1
	.short _022296E0 - _02229666 - 2 ; case 2
	.short _02229702 - _02229666 - 2 ; case 3
	.short _0222972C - _02229666 - 2 ; case 4
	.short _02229B52 - _02229666 - 2 ; case 5
	.short _02229B52 - _02229666 - 2 ; case 6
	.short _0222975E - _02229666 - 2 ; case 7
	.short _022297D4 - _02229666 - 2 ; case 8
	.short _022297F2 - _02229666 - 2 ; case 9
	.short _0222983C - _02229666 - 2 ; case 10
	.short _02229878 - _02229666 - 2 ; case 11
	.short _02229892 - _02229666 - 2 ; case 12
	.short _022298C6 - _02229666 - 2 ; case 13
	.short _02229908 - _02229666 - 2 ; case 14
	.short _02229928 - _02229666 - 2 ; case 15
	.short _02229940 - _02229666 - 2 ; case 16
	.short _0222995A - _02229666 - 2 ; case 17
	.short _022299B0 - _02229666 - 2 ; case 18
	.short _02229A38 - _02229666 - 2 ; case 19
	.short _02229A80 - _02229666 - 2 ; case 20
	.short _02229B52 - _02229666 - 2 ; case 21
	.short _02229AB4 - _02229666 - 2 ; case 22
	.short _02229AB8 - _02229666 - 2 ; case 23
	.short _02229B52 - _02229666 - 2 ; case 24
	.short _02229B52 - _02229666 - 2 ; case 25
	.short _02229B20 - _02229666 - 2 ; case 26
	.short _02229B52 - _02229666 - 2 ; case 27
	.short _02229AEC - _02229666 - 2 ; case 28
	.short _0222977A - _02229666 - 2 ; case 29
	.short _022297B8 - _02229666 - 2 ; case 30
_022296A4:
	add r0, r4, #0
	bl ov74_02228D20
	bl sub_02034D8C
	mov r0, #0x52
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	str r1, [r4, r5]
	b _02229B52
_022296BA:
	bl sub_02034DB8
	cmp r0, #0
	beq _02229772
	mov r1, #0x5b
	lsl r1, r1, #2
	ldr r0, _022299FC ; =ov74_0223BD5C
	add r1, r4, r1
	bl ov74_02230A84
	mov r0, #0x56
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl sub_0203A880
	mov r0, #2
	str r0, [r4, r5]
	b _02229B52
_022296E0:
	bl ov74_02230D6C
	mov r1, #0x19
	add r0, r4, #0
	lsl r1, r1, #6
	bl ov74_022295C8
	add r0, r4, #0
	add r0, #0x28
	mov r1, #0xa
	bl sub_0200F0AC
	ldr r1, _02229A00 ; =0x000034D8
	str r0, [r4, r1]
	mov r0, #3
	str r0, [r4, r5]
	b _02229B52
_02229702:
	bl ov74_02230E94
	cmp r0, #0
	beq _0222971E
	sub r1, r0, #1
	mov r0, #0x59
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r1, _02229A04 ; =0x00000708
	add r0, r4, #0
	bl ov74_022295C8
	mov r0, #4
	str r0, [r4, r5]
_0222971E:
	add r0, r4, #0
	add r1, r4, r5
	mov r2, #0
	mov r3, #2
	bl ov74_022295D0
	b _02229B52
_0222972C:
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov74_02230DB8
	cmp r0, #0
	beq _02229750
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov74_02230DF4
	mov r0, #7
	str r0, [r4, r5]
	mov r0, #0x16
	ldr r1, _02229A04 ; =0x00000708
	lsl r0, r0, #4
	str r1, [r4, r0]
_02229750:
	add r0, r4, #0
	add r1, r4, r5
	mov r2, #0
	mov r3, #2
	bl ov74_022295D0
	b _02229B52
_0222975E:
	add r0, r4, #0
	add r1, r4, r5
	mov r2, #0
	mov r3, #2
	bl ov74_022295D0
	bl ov74_02230FD4
	cmp r0, #0
	bne _02229774
_02229772:
	b _02229B52
_02229774:
	mov r0, #0x1d
	str r0, [r4, r5]
	b _02229B52
_0222977A:
	mov r0, #0x1f
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
	ldr r0, _02229A08 ; =0x00003170
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02229A00 ; =0x000034D8
	ldr r0, [r4, r0]
	bl sub_0200F450
	ldr r0, _02229A00 ; =0x000034D8
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, _02229A0C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x16
	ldr r1, _02229A04 ; =0x00000708
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0x1e
	str r0, [r4, r5]
	b _02229B52
_022297B8:
	ldr r0, _02229A10 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _022297C6
	mov r0, #8
	str r0, [r4, r5]
_022297C6:
	add r0, r4, #0
	add r1, r4, r5
	mov r2, #1
	mov r3, #2
	bl ov74_022295D0
	b _02229B52
_022297D4:
	bl ov74_02230EB4
	mov r0, #9
	str r0, [r4, r5]
	mov r0, #0x16
	ldr r1, _02229A04 ; =0x00000708
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	add r1, r4, r5
	mov r2, #1
	mov r3, #2
	bl ov74_022295D0
	b _02229B52
_022297F2:
	bl ov74_02230F40
	cmp r0, #0
	beq _0222982E
	bl ov74_02230EE8
	mov r0, #0xa
	str r0, [r4, r5]
	mov r1, #0x32
	mov r0, #0x16
	lsl r1, r1, #6
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0x23
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
	ldr r0, _02229A0C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	ldr r0, _02229A00 ; =0x000034D8
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222982E:
	add r0, r4, #0
	add r1, r4, r5
	mov r2, #1
	mov r3, #2
	bl ov74_022295D0
	b _02229B52
_0222983C:
	bl ov74_02230F40
	cmp r0, #0
	beq _0222986A
	mov r0, #0x49
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
	ldr r0, _02229A08 ; =0x00003170
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov74_02229084
	mov r0, #0xb
	str r0, [r4, r5]
_0222986A:
	add r0, r4, #0
	add r1, r4, r5
	mov r2, #1
	mov r3, #2
	bl ov74_022295D0
	b _02229B52
_02229878:
	ldr r0, _02229A14 ; =ov74_0223C1F4
	mov r1, #0x2a
	mov r2, #1
	bl ov74_02230F14
	mov r0, #0xc
	str r0, [r4, r5]
	mov r1, #0x32
	mov r0, #0x16
	lsl r1, r1, #6
	lsl r0, r0, #4
	str r1, [r4, r0]
	b _02229B52
_02229892:
	bl ov74_02230F6C
	cmp r0, #0
	beq _022298B8
	mov r0, #0xd
	str r0, [r4, r5]
	mov r0, #0x16
	mov r1, #0x3c
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0x49
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
_022298B8:
	add r0, r4, #0
	add r1, r4, r5
	mov r2, #1
	mov r3, #2
	bl ov74_022295D0
	b _02229B52
_022298C6:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02229938
	mov r0, #0x4a
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
	add r0, r4, #0
	add r0, #0x28
	mov r1, #0xa
	bl sub_0200F0AC
	ldr r1, _02229A00 ; =0x000034D8
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov74_0222947C
	ldr r0, [r4, #8]
	bl ov74_022360A0
	mov r0, #0xe
	str r0, [r4, r5]
	b _02229B52
_02229908:
	bl ov74_022360B0
	cmp r0, #1
	bne _02229938
	mov r0, #0xf
	str r0, [r4, r5]
	bl OS_GetTickLo
	mov r1, #0x36
	bl _s32_div_f
	mov r0, #0x16
	add r1, r1, #6
	lsl r0, r0, #4
	str r1, [r4, r0]
	b _02229B52
_02229928:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222993A
_02229938:
	b _02229B52
_0222993A:
	mov r0, #0x10
	str r0, [r4, r5]
	b _02229B52
_02229940:
	ldr r0, _02229A14 ; =ov74_0223C1F4
	mov r1, #0x2a
	mov r2, #2
	bl ov74_02230F14
	mov r0, #0x11
	str r0, [r4, r5]
	mov r1, #0x4b
	mov r0, #0x16
	lsl r1, r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	b _02229B52
_0222995A:
	bl ov74_02230F98
	cmp r0, #0
	beq _02229976
	bl ov74_02236128
	mov r0, #0x12
	str r0, [r4, r5]
	mov r1, #0x32
	mov r0, #0x16
	lsl r1, r1, #4
	lsl r0, r0, #4
	str r1, [r4, r0]
	b _02229B52
_02229976:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02229996
	bl ov74_02231008
	mov r0, #0x17
	mov r1, #0x78
	str r0, [r4, r5]
	add r0, r1, #0
	add r0, #0xe8
	str r1, [r4, r0]
_02229996:
	bl ov74_02230FD4
	cmp r0, #0
	bne _02229A48
	bl ov74_02231008
	mov r0, #0x16
	mov r1, #0x78
	str r0, [r4, r5]
	add r0, r1, #0
	add r0, #0xe8
	str r1, [r4, r0]
	b _02229B52
_022299B0:
	bl ov74_0223615C
	cmp r0, #3
	bne _022299CA
	bl ov74_02231008
	mov r0, #0x16
	mov r1, #0x78
	str r0, [r4, r5]
	add r0, r1, #0
	add r0, #0xe8
	str r1, [r4, r0]
	b _02229A18
_022299CA:
	bl ov74_0223615C
	cmp r0, #2
	beq _022299D8
	bl ov74_022360B0
	b _02229A18
_022299D8:
	bl ov74_02230F6C
	cmp r0, #0
	bne _022299E8
	bl ov74_02230FD4
	cmp r0, #0
	bne _02229A18
_022299E8:
	mov r0, #0x13
	str r0, [r4, r5]
	mov r0, #0x16
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	bl ov74_02231008
	b _02229B52
	nop
_022299FC: .word ov74_0223BD5C
_02229A00: .word 0x000034D8
_02229A04: .word 0x00000708
_02229A08: .word 0x00003170
_02229A0C: .word SEQ_SE_DP_SELECT
_02229A10: .word gSystem
_02229A14: .word ov74_0223C1F4
_02229A18:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02229A38
	bl ov74_02231008
	mov r0, #0x17
	str r0, [r4, r5]
	mov r0, #0x16
	mov r1, #0xa
	lsl r0, r0, #4
	str r1, [r4, r0]
_02229A38:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02229A4A
_02229A48:
	b _02229B52
_02229A4A:
	mov r0, #0x14
	str r0, [r4, r5]
	mov r0, #0x4b
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
	ldr r0, _02229B58 ; =0x00003170
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02229B5C ; =0x000034D8
	ldr r0, [r4, r0]
	bl sub_0200F450
	ldr r0, _02229B60 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	ldr r0, _02229B5C ; =0x000034D8
	mov r1, #0
	str r1, [r4, r0]
	b _02229B52
_02229A80:
	bl ov74_02231048
	cmp r0, #0
	beq _02229B52
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02229AA2
	bl sub_02034DE0
	bl sub_0203A914
	mov r0, #0x52
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_02229AA2:
	ldr r0, _02229B64 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02229B52
	mov r0, #0x1b
	str r0, [r4, r5]
	mov r0, #4
	pop {r3, r4, r5, pc}
_02229AB4:
	mov r0, #0x17
	str r0, [r4, r5]
_02229AB8:
	mov r0, #0x4c
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x48
	mov r2, #2
	mov r3, #0x13
	bl ov74_02235568
	ldr r0, _02229B58 ; =0x00003170
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02229B5C ; =0x000034D8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02229AE0
	bl sub_0200F450
_02229AE0:
	ldr r0, _02229B5C ; =0x000034D8
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #0x1c
	str r0, [r4, r5]
	b _02229B52
_02229AEC:
	bl ov74_02231048
	cmp r0, #0
	beq _02229B52
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02229B0E
	bl sub_02034DE0
	bl sub_0203A914
	mov r0, #0x52
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_02229B0E:
	ldr r0, _02229B64 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02229B52
	mov r0, #0
	bl OS_ResetSystem
	b _02229B52
_02229B20:
	bl ov74_02231048
	cmp r0, #0
	beq _02229B52
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02229B52
	bl sub_02034DE0
	bl sub_0203A914
	mov r0, #0x52
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _02229B5C ; =0x000034D8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02229B4E
	bl sub_0200F450
_02229B4E:
	mov r0, #5
	pop {r3, r4, r5, pc}
_02229B52:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02229B58: .word 0x00003170
_02229B5C: .word 0x000034D8
_02229B60: .word SEQ_SE_DP_SELECT
_02229B64: .word gSystem
	thumb_func_end ov74_0222962C

	thumb_func_start ov74_02229B68
ov74_02229B68: ; 0x02229B68
	push {r4, lr}
	ldr r1, _02229BB8 ; =ov74_0223D0A4
	add r4, r0, #0
	ldr r1, [r1]
	cmp r1, #0
	bne _02229BB4
	bl ov74_02229E14
	mov r1, #0xf5
	mov r0, #0xf
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, _02229BB8 ; =ov74_0223D0A4
	mov r2, #0xf5
	str r0, [r1]
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	ldr r0, _02229BB8 ; =ov74_0223D0A4
	mov r1, #0x32
	ldr r0, [r0]
	mov r2, #0xa
	strh r1, [r0, #0x24]
	ldr r0, _02229BBC ; =ov74_02229CB8
	mov r1, #0
	bl CreateSysTask
	ldr r1, _02229BB8 ; =ov74_0223D0A4
	ldr r2, [r1]
	str r0, [r2, #0x1c]
	ldr r0, [r1]
	str r4, [r0]
	ldr r0, [r1]
	add r0, r0, #4
	bl sub_0203778C
_02229BB4:
	pop {r4, pc}
	nop
_02229BB8: .word ov74_0223D0A4
_02229BBC: .word ov74_02229CB8
	thumb_func_end ov74_02229B68

	thumb_func_start ov74_02229BC0
ov74_02229BC0: ; 0x02229BC0
	ldr r2, _02229BCC ; =ov74_0223D0A4
	ldr r3, [r2]
	str r0, [r3, #0x20]
	ldr r0, [r2]
	strh r1, [r0, #0x24]
	bx lr
	.balign 4, 0
_02229BCC: .word ov74_0223D0A4
	thumb_func_end ov74_02229BC0

	thumb_func_start ov74_02229BD0
ov74_02229BD0: ; 0x02229BD0
	push {r4, lr}
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _02229BFE
	mov r4, #0
	ldr r1, _02229C00 ; =ov74_0223D0A4
	ldr r0, _02229C04 ; =0x000003C1
	add r3, r4, #0
_02229BE6:
	ldr r2, [r1]
	add r2, r2, r4
	add r4, r4, #1
	strb r3, [r2, r0]
	cmp r4, #0x10
	blt _02229BE6
	bl sub_02034434
	ldr r0, _02229C08 ; =ov74_02229C0C
	mov r1, #0
	bl ov74_02229BC0
_02229BFE:
	pop {r4, pc}
	.balign 4, 0
_02229C00: .word ov74_0223D0A4
_02229C04: .word 0x000003C1
_02229C08: .word ov74_02229C0C
	thumb_func_end ov74_02229BD0

	thumb_func_start ov74_02229C0C
ov74_02229C0C: ; 0x02229C0C
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r6, _02229C40 ; =ov74_0223D0A4
	add r5, r4, #0
_02229C14:
	ldr r0, [r6]
	add r0, r0, r5
	ldr r0, [r0, #0x28]
	cmp r0, #0
	bne _02229C36
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #1
	bne _02229C36
	add r0, r4, #0
	bl sub_02034818
	ldr r1, [r6]
	add r1, r1, r5
	str r0, [r1, #0x28]
_02229C36:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _02229C14
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02229C40: .word ov74_0223D0A4
	thumb_func_end ov74_02229C0C

	thumb_func_start ov74_02229C44
ov74_02229C44: ; 0x02229C44
	push {r3, lr}
	bl sub_02034DB8
	cmp r0, #0
	beq _02229C56
	ldr r0, _02229C58 ; =ov74_02229C5C
	mov r1, #0
	bl ov74_02229BC0
_02229C56:
	pop {r3, pc}
	.balign 4, 0
_02229C58: .word ov74_02229C5C
	thumb_func_end ov74_02229C44

	thumb_func_start ov74_02229C5C
ov74_02229C5C: ; 0x02229C5C
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02229C5C

	thumb_func_start ov74_02229C60
ov74_02229C60: ; 0x02229C60
	push {r3, lr}
	ldr r0, _02229C78 ; =ov74_0223D0A4
	ldr r0, [r0]
	add r0, #0x27
	ldrb r0, [r0]
	bl sub_02037E1C
	ldr r0, _02229C7C ; =ov74_02229C80
	mov r1, #0
	bl ov74_02229BC0
	pop {r3, pc}
	.balign 4, 0
_02229C78: .word ov74_0223D0A4
_02229C7C: .word ov74_02229C80
	thumb_func_end ov74_02229C60

	thumb_func_start ov74_02229C80
ov74_02229C80: ; 0x02229C80
	push {r3, lr}
	bl sub_02037EC8
	cmp r0, #0
	beq _02229CA8
	ldr r0, _02229CAC ; =ov74_0223D0A4
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0xf
	lsl r0, r0, #6
	strb r2, [r1, r0]
	bl sub_02034434
	mov r0, #0xab
	bl sub_02037AC0
	ldr r0, _02229CB0 ; =ov74_02229CB4
	mov r1, #0
	bl ov74_02229BC0
_02229CA8:
	pop {r3, pc}
	nop
_02229CAC: .word ov74_0223D0A4
_02229CB0: .word ov74_02229CB4
	thumb_func_end ov74_02229C80

	thumb_func_start ov74_02229CB4
ov74_02229CB4: ; 0x02229CB4
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02229CB4

	thumb_func_start ov74_02229CB8
ov74_02229CB8: ; 0x02229CB8
	push {r3, lr}
	ldr r1, _02229CDC ; =ov74_0223D0A4
	ldr r2, [r1]
	cmp r2, #0
	bne _02229CC8
	bl DestroySysTask
	pop {r3, pc}
_02229CC8:
	ldr r1, [r2, #0x20]
	cmp r1, #0
	beq _02229CD8
	add r2, #0x26
	ldrb r0, [r2]
	cmp r0, #0
	bne _02229CD8
	blx r1
_02229CD8:
	pop {r3, pc}
	nop
_02229CDC: .word ov74_0223D0A4
	thumb_func_end ov74_02229CB8

	thumb_func_start ov74_02229CE0
ov74_02229CE0: ; 0x02229CE0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02037474
	cmp r0, #0
	bne _02229D06
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02038114
	add r0, r5, #0
	bl ov74_02229B68
	ldr r0, _02229D08 ; =ov74_02229BD0
	mov r1, #0
	bl ov74_02229BC0
_02229D06:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02229D08: .word ov74_02229BD0
	thumb_func_end ov74_02229CE0

	thumb_func_start ov74_02229D0C
ov74_02229D0C: ; 0x02229D0C
	add r3, r0, #0
	add r2, r1, #0
	add r1, r3, #0
	ldr r3, _02229D18 ; =sub_02037088
	mov r0, #0x16
	bx r3
	.balign 4, 0
_02229D18: .word sub_02037088
	thumb_func_end ov74_02229D0C

	thumb_func_start ov74_02229D1C
ov74_02229D1C: ; 0x02229D1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037474
	cmp r0, #0
	bne _02229D48
	bl ov74_0222CD7C
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	add r1, r4, #0
	bl sub_02038148
	add r0, r5, #0
	bl ov74_02229B68
	ldr r0, _02229D4C ; =ov74_02229C44
	mov r1, #0
	bl ov74_02229BC0
_02229D48:
	pop {r3, r4, r5, pc}
	nop
_02229D4C: .word ov74_02229C44
	thumb_func_end ov74_02229D1C

	thumb_func_start ov74_02229D50
ov74_02229D50: ; 0x02229D50
	ldr r1, _02229D60 ; =ov74_0223D0A4
	ldr r3, _02229D64 ; =ov74_02229BC0
	ldr r1, [r1]
	add r1, #0x27
	strb r0, [r1]
	ldr r0, _02229D68 ; =ov74_02229C60
	mov r1, #0
	bx r3
	.balign 4, 0
_02229D60: .word ov74_0223D0A4
_02229D64: .word ov74_02229BC0
_02229D68: .word ov74_02229C60
	thumb_func_end ov74_02229D50

	thumb_func_start ov74_02229D6C
ov74_02229D6C: ; 0x02229D6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_02229D72:
	add r0, r4, #0
	bl sub_020358D0
	add r1, r0, #0
	beq _02229D92
	add r0, #0x4c
	ldrh r0, [r0]
	cmp r0, #0
	beq _02229D92
	add r5, #0x8c
	add r0, r5, #0
	mov r2, #0x50
	bl memcpy
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_02229D92:
	add r4, r4, #1
	cmp r4, #0x10
	blt _02229D72
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov74_02229D6C

	thumb_func_start ov74_02229DA0
ov74_02229DA0: ; 0x02229DA0
	ldr r1, _02229DB8 ; =ov74_0223D0A4
	ldr r2, [r1]
	add r1, r2, #0
	add r1, #0x27
	ldrb r1, [r1]
	cmp r1, r0
	bne _02229DB6
	mov r0, #0xf
	mov r1, #1
	lsl r0, r0, #6
	strb r1, [r2, r0]
_02229DB6:
	bx lr
	.balign 4, 0
_02229DB8: .word ov74_0223D0A4
	thumb_func_end ov74_02229DA0

	thumb_func_start ov74_02229DBC
ov74_02229DBC: ; 0x02229DBC
	ldr r0, _02229DC8 ; =ov74_0223D0A4
	ldr r1, [r0]
	mov r0, #0xf
	lsl r0, r0, #6
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_02229DC8: .word ov74_0223D0A4
	thumb_func_end ov74_02229DBC

	thumb_func_start ov74_02229DCC
ov74_02229DCC: ; 0x02229DCC
	mov r0, #0xd6
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02229DCC

	thumb_func_start ov74_02229DD4
ov74_02229DD4: ; 0x02229DD4
	ldr r0, _02229DDC ; =ov74_0223D0A4
	ldr r0, [r0]
	add r0, #0x68
	bx lr
	.balign 4, 0
_02229DDC: .word ov74_0223D0A4
	thumb_func_end ov74_02229DD4

	thumb_func_start ov74_02229DE0
ov74_02229DE0: ; 0x02229DE0
	ldr r1, _02229DF0 ; =ov74_0223D0A4
	mov r2, #1
	ldr r1, [r1]
	add r1, r1, r0
	ldr r0, _02229DF4 ; =0x000003C1
	strb r2, [r1, r0]
	bx lr
	nop
_02229DF0: .word ov74_0223D0A4
_02229DF4: .word 0x000003C1
	thumb_func_end ov74_02229DE0

	thumb_func_start ov74_02229DF8
ov74_02229DF8: ; 0x02229DF8
	push {r3, lr}
	ldr r1, _02229E10 ; =ov74_0223D0A4
	mov r0, #0xf
	ldr r1, [r1]
	bl FreeToHeapExplicit
	ldr r0, _02229E10 ; =ov74_0223D0A4
	mov r1, #0
	str r1, [r0]
	bl sub_02037E9C
	pop {r3, pc}
	.balign 4, 0
_02229E10: .word ov74_0223D0A4
	thumb_func_end ov74_02229DF8

	thumb_func_start ov74_02229E14
ov74_02229E14: ; 0x02229E14
	ldr r3, _02229E20 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _02229E24 ; =_0223B368
	mov r1, #2
	bx r3
	nop
_02229E20: .word sub_0203410C
_02229E24: .word _0223B368
	thumb_func_end ov74_02229E14

	thumb_func_start ov74_02229E28
ov74_02229E28: ; 0x02229E28
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	ldr r0, _02229E5C ; =0x000029F0
	bne _02229E48
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02229E58
	add r0, r4, #0
	add r0, #0x18
	mov r1, #1
	bl sub_0200F0AC
	ldr r1, _02229E5C ; =0x000029F0
	str r0, [r4, r1]
	pop {r4, pc}
_02229E48:
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02229E52
	bl sub_0200F478
_02229E52:
	ldr r0, _02229E5C ; =0x000029F0
	mov r1, #0
	str r1, [r4, r0]
_02229E58:
	pop {r4, pc}
	nop
_02229E5C: .word 0x000029F0
	thumb_func_end ov74_02229E28

	thumb_func_start ov74_02229E60
ov74_02229E60: ; 0x02229E60
	ldr r3, _02229E64 ; =ov74_02229E28
	bx r3
	.balign 4, 0
_02229E64: .word ov74_02229E28
	thumb_func_end ov74_02229E60

	thumb_func_start ov74_02229E68
ov74_02229E68: ; 0x02229E68
	push {r3, r4, r5, r6, r7, lr}
	bl OverlayManager_GetData
	add r7, r0, #0
	bl ov74_022359BC
	ldr r0, [r7, #0x7c]
	cmp r0, #0
	beq _02229E7E
	bl ListMenuItems_dtor
_02229E7E:
	ldr r0, [r7, #0x78]
	cmp r0, #0
	beq _02229E8C
	mov r1, #0
	add r2, r1, #0
	bl DestroyListMenu
_02229E8C:
	add r0, r7, #0
	add r0, #0x18
	bl ClearWindowTilemapAndCopyToVram
	add r0, r7, #0
	add r0, #0x18
	bl RemoveWindow
	add r0, r7, #0
	add r0, #0x58
	bl WindowIsInUse
	cmp r0, #0
	beq _02229EB8
	add r0, r7, #0
	add r0, #0x58
	bl ClearWindowTilemapAndCopyToVram
	add r0, r7, #0
	add r0, #0x58
	bl RemoveWindow
_02229EB8:
	add r5, r7, #0
	mov r6, #0
	add r4, r7, #0
	add r5, #0x28
_02229EC0:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02229ED2
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
_02229ED2:
	add r6, r6, #1
	add r4, #0x10
	add r5, #0x10
	cmp r6, #3
	blt _02229EC0
	ldr r0, [r7]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r7]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r7]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r7]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r7]
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02229E68

	thumb_func_start ov74_02229F04
ov74_02229F04: ; 0x02229F04
	push {r3, lr}
	sub sp, #8
	bl ov74_0223563C
	bl ov74_02235690
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0xe
	mov r2, #0xb
	mov r3, #0xd
	bl ov74_02235728
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov74_02229F04

	thumb_func_start ov74_02229F28
ov74_02229F28: ; 0x02229F28
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _02229F4E
	str r1, [sp]
	ldr r1, _02229F5C ; =0x000005C4
	mov r0, #0
	ldr r1, [r4, r1]
	mov r2, #0x80
	mov r3, #0x64
	bl ov74_02235930
	ldr r1, _02229F5C ; =0x000005C4
	add sp, #4
	str r0, [r4, r1]
	pop {r3, r4, pc}
_02229F4E:
	ldr r0, _02229F5C ; =0x000005C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02229F5C: .word 0x000005C4
	thumb_func_end ov74_02229F28

	thumb_func_start ov74_02229F60
ov74_02229F60: ; 0x02229F60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _02229F76
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0200E5D4
_02229F76:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02229F60

	thumb_func_start ov74_02229F78
ov74_02229F78: ; 0x02229F78
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _02229F8E
	add r0, r5, #0
	add r1, r4, #0
	bl ClearFrameAndWindow2
_02229F8E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02229F78

	thumb_func_start ov74_02229F90
ov74_02229F90: ; 0x02229F90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _02229FE8 ; =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #2
	beq _02229FAE
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x18
	mov r2, #3
	bl ov74_0222AA18
_02229FAE:
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl ov74_02229F60
	ldr r0, _02229FE8 ; =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #2
	beq _02229FDE
	add r0, r4, #0
	mov r1, #0xf
	bl ov74_02229D1C
	ldr r1, _02229FEC ; =0x00001C20
	ldr r0, _02229FF0 ; =0x00000434
	str r1, [r4, r0]
	bl sub_0203A880
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229E28
	mov r0, #7
	pop {r3, r4, r5, pc}
_02229FDE:
	mov r0, #0x13
	add r4, #0x84
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_02229FE8: .word 0x000015D4
_02229FEC: .word 0x00001C20
_02229FF0: .word 0x00000434
	thumb_func_end ov74_02229F90

	thumb_func_start ov74_02229FF4
ov74_02229FF4: ; 0x02229FF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, #0x80
	ldr r1, [r0]
	cmp r1, #1
	bne _0222A00A
	mov r0, #0x31
	pop {r3, r4, r5, pc}
_0222A00A:
	sub r0, r1, #2
	cmp r0, #2
	bhi _0222A014
	mov r0, #0x31
	pop {r3, r4, r5, pc}
_0222A014:
	cmp r1, #5
	bne _0222A01C
	mov r0, #0x31
	pop {r3, r4, r5, pc}
_0222A01C:
	ldr r0, _0222A070 ; =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A02C
	ldr r0, _0222A074 ; =0x00000438
	ldr r0, [r4, r0]
	bl ov74_02229D50
_0222A02C:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x18
	mov r2, #6
	bl ov74_0222AA18
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl ov74_02229F60
	ldr r0, _0222A070 ; =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A05A
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229F28
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229E28
_0222A05A:
	ldr r0, _0222A070 ; =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A06C
	mov r0, #0xab
	bl sub_02037AC0
	mov r0, #9
	pop {r3, r4, r5, pc}
_0222A06C:
	mov r0, #0x15
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A070: .word 0x000015D4
_0222A074: .word 0x00000438
	thumb_func_end ov74_02229FF4

	thumb_func_start ov74_0222A078
ov74_0222A078: ; 0x0222A078
	push {r3, r4, r5, r6, r7, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _0222A0DC ; =0x000015D4
	add r5, r4, #0
	add r6, r4, #0
	ldr r0, [r4, r0]
	add r5, #0xdc
	add r6, #0x8c
	cmp r0, #1
	beq _0222A096
	cmp r0, #3
	beq _0222A0BC
	b _0222A0D6
_0222A096:
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl ov74_02229DD4
	mov r2, #0xd6
	add r1, r0, #0
	add r0, r5, #0
	lsl r2, r2, #2
	bl memcpy
	add r0, r4, #0
	add r4, #0xdc
	add r0, #0x8c
	add r1, r4, #0
	mov r2, #0x54
	bl ov74_02235F58
	b _0222A0D6
_0222A0BC:
	ldr r7, _0222A0E0 ; =0x000005D4
	mov r2, #0xd6
	add r1, r4, r7
	add r0, r5, #0
	add r1, #0x50
	lsl r2, r2, #2
	bl memcpy
	add r0, r6, #0
	add r1, r4, r7
	mov r2, #0x50
	bl memcpy
_0222A0D6:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A0DC: .word 0x000015D4
_0222A0E0: .word 0x000005D4
	thumb_func_end ov74_0222A078

	thumb_func_start ov74_0222A0E4
ov74_0222A0E4: ; 0x0222A0E4
	push {r3, lr}
	ldrh r1, [r0]
	cmp r1, #3
	bgt _0222A0FC
	cmp r1, #1
	blt _0222A12C
	beq _0222A10E
	cmp r1, #2
	beq _0222A10E
	cmp r1, #3
	beq _0222A104
	b _0222A12C
_0222A0FC:
	cmp r1, #0xd
	bne _0222A12C
	mov r0, #1
	pop {r3, pc}
_0222A104:
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _0222A12C
	mov r0, #1
	pop {r3, pc}
_0222A10E:
	add r0, #8
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	cmp r0, #3
	blt _0222A120
	cmp r0, #0xe
	ble _0222A128
_0222A120:
	cmp r0, #0x41
	blt _0222A12C
	cmp r0, #0x47
	bgt _0222A12C
_0222A128:
	mov r0, #1
	pop {r3, pc}
_0222A12C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov74_0222A0E4

	thumb_func_start ov74_0222A130
ov74_0222A130: ; 0x0222A130
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222A168 ; =0x000029EC
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _0222A142
	mov r1, #0
	sub r0, r0, #4
	str r1, [r4, r0]
_0222A142:
	bl ov74_022360B0
	sub r0, r0, #2
	cmp r0, #1
	bhi _0222A164
	add r0, r4, #0
	add r0, #0xdc
	bl ov74_0222A0E4
	cmp r0, #1
	beq _0222A15E
	ldr r0, _0222A16C ; =SEQ_SE_DP_SAVE
	bl PlaySE
_0222A15E:
	ldr r0, _0222A170 ; =0x000029E8
	mov r1, #0
	str r1, [r4, r0]
_0222A164:
	pop {r4, pc}
	nop
_0222A168: .word 0x000029EC
_0222A16C: .word SEQ_SE_DP_SAVE
_0222A170: .word 0x000029E8
	thumb_func_end ov74_0222A130

	thumb_func_start ov74_0222A174
ov74_0222A174: ; 0x0222A174
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r5, r0, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r4, #0x8c
	add r5, #0xdc
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _0222A1A2
	mov r6, #0
	b _0222A1CE
_0222A1A2:
	mov r1, #0x35
	add r2, r4, #0
	mov r0, #0
	lsl r1, r1, #4
	strb r0, [r5, r1]
	add r2, #0x4e
	ldrb r2, [r2]
	mov r6, #1
	lsl r2, r2, #0x1b
	lsr r2, r2, #0x1f
	bne _0222A1BC
	sub r1, #8
	strb r0, [r5, r1]
_0222A1BC:
	add r0, sp, #8
	bl GF_RTC_CopyDate
	add r0, sp, #8
	bl RTC_ConvertDateToDay
	mov r1, #0xd5
	lsl r1, r1, #2
	str r0, [r5, r1]
_0222A1CE:
	ldr r0, [sp]
	bl Save_MysteryGift_get
	add r1, r4, #0
	add r1, #0x4c
	ldrh r1, [r1]
	add r7, r0, #0
	bl sub_0202DFAC
	add r4, #0x4e
	ldrb r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222A204
	ldrh r0, [r5]
	cmp r0, #3
	bne _0222A204
	ldr r1, [r5, #4]
	ldr r0, _0222A234 ; =0x00000215
	cmp r1, r0
	bne _0222A204
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0202DD48
	b _0222A21C
_0222A204:
	cmp r6, #0
	bne _0222A214
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #3
	bl sub_0202DC2C
	b _0222A21C
_0222A214:
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0202DCAC
_0222A21C:
	ldr r0, [sp]
	bl ov74_022360A0
	ldr r1, _0222A238 ; =0x000029EC
	ldr r0, [sp, #4]
	mov r2, #0
	str r2, [r0, r1]
	ldr r2, _0222A23C ; =ov74_0222A130
	sub r1, r1, #4
	str r2, [r0, r1]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A234: .word 0x00000215
_0222A238: .word 0x000029EC
_0222A23C: .word ov74_0222A130
	thumb_func_end ov74_0222A174

	thumb_func_start ov74_0222A240
ov74_0222A240: ; 0x0222A240
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	add r4, r1, #0
	bl OverlayManager_GetData
	cmp r4, #0
	bne _0222A254
	mov r5, #4
	b _0222A258
_0222A254:
	mov r5, #0
	mvn r5, r5
_0222A258:
	ldr r1, [r0, #0x48]
	add r4, r0, #0
	add r4, #0x48
	cmp r1, #0
	bne _0222A282
	mov r1, #0xa
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r2, #0
	mov r1, #0x6b
	str r2, [sp, #0xc]
	lsl r1, r1, #2
	str r1, [sp, #0x10]
	ldr r0, [r0]
	add r1, r4, #0
	mov r3, #0x17
	bl AddWindowParameterized
_0222A282:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	ldr r1, _0222A2A0 ; =ov74_0223C260
	add r0, r6, #0
	mov r2, #2
	add r3, r4, #0
	str r5, [sp]
	bl ov74_0222A89C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222A2A0: .word ov74_0223C260
	thumb_func_end ov74_0222A240

	thumb_func_start ov74_0222A2A4
ov74_0222A2A4: ; 0x0222A2A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, #0x48
	mov r1, #0
	bl ov74_02229F60
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ov74_02229F60
	ldr r0, _0222A2DC ; =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A2D0
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
_0222A2D0:
	bl sub_0203A914
	add r0, r5, #0
	bl ov74_0222A5CC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A2DC: .word 0x000015D4
	thumb_func_end ov74_0222A2A4

	thumb_func_start ov74_0222A2E0
ov74_0222A2E0: ; 0x0222A2E0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	bl ov74_02235230
	cmp r0, #0
	beq _0222A2F8
	mov r1, #2
	b _0222A2FA
_0222A2F8:
	mov r1, #1
_0222A2FA:
	ldr r0, _0222A354 ; =0x000015D4
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x38
	mov r1, #0
	bl ov74_02229F60
	add r4, r5, #0
	ldr r0, [r5, #0x48]
	add r4, #0x48
	cmp r0, #0
	bne _0222A332
	mov r0, #0xa
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x6b
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r4, #0
	mov r3, #0x17
	bl AddWindowParameterized
_0222A332:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	mov r2, #2
	ldr r1, _0222A358 ; =ov74_0223C250
	add r0, r6, #0
	add r3, r4, #0
	str r2, [sp]
	bl ov74_0222A89C
	mov r0, #5
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0222A354: .word 0x000015D4
_0222A358: .word ov74_0223C250
	thumb_func_end ov74_0222A2E0

	thumb_func_start ov74_0222A35C
ov74_0222A35C: ; 0x0222A35C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _0222A3C4 ; =0x000015D4
	mov r1, #4
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x38
	mov r1, #0
	bl ov74_02229F60
	add r5, r4, #0
	ldr r0, [r4, #0x48]
	add r5, #0x48
	cmp r0, #0
	bne _0222A3A2
	mov r0, #0xa
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x6b
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r5, #0
	mov r3, #0x17
	bl AddWindowParameterized
_0222A3A2:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	mov r0, #0x50
	str r0, [sp]
	ldr r1, _0222A3C8 ; =ov74_0223C220
	add r0, r6, #0
	mov r2, #2
	add r3, r5, #0
	bl ov74_0222A89C
	mov r0, #5
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222A3C4: .word 0x000015D4
_0222A3C8: .word ov74_0223C220
	thumb_func_end ov74_0222A35C

	thumb_func_start ov74_0222A3CC
ov74_0222A3CC: ; 0x0222A3CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _0222A434 ; =0x000015D4
	mov r1, #3
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x38
	mov r1, #0
	bl ov74_02229F60
	add r5, r4, #0
	ldr r0, [r4, #0x48]
	add r5, #0x48
	cmp r0, #0
	bne _0222A412
	mov r0, #0xa
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x6b
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r5, #0
	mov r3, #0x17
	bl AddWindowParameterized
_0222A412:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	mov r0, #0x4f
	str r0, [sp]
	ldr r1, _0222A438 ; =ov74_0223C230
	add r0, r6, #0
	mov r2, #2
	add r3, r5, #0
	bl ov74_0222A89C
	mov r0, #5
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222A434: .word 0x000015D4
_0222A438: .word ov74_0223C230
	thumb_func_end ov74_0222A3CC

	thumb_func_start ov74_0222A43C
ov74_0222A43C: ; 0x0222A43C
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r1, [r0, #0x48]
	add r4, #0x48
	cmp r1, #0
	bne _0222A470
	mov r1, #0xa
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r2, #0
	mov r1, #0x6b
	str r2, [sp, #0xc]
	lsl r1, r1, #2
	str r1, [sp, #0x10]
	ldr r0, [r0]
	add r1, r4, #0
	mov r3, #0x17
	bl AddWindowParameterized
_0222A470:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	mov r0, #4
	str r0, [sp]
	ldr r1, _0222A490 ; =ov74_0223C240
	add r0, r5, #0
	mov r2, #2
	add r3, r4, #0
	bl ov74_0222A89C
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_0222A490: .word ov74_0223C240
	thumb_func_end ov74_0222A43C

	thumb_func_start ov74_0222A494
ov74_0222A494: ; 0x0222A494
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, #0x48
	mov r1, #0
	bl ov74_02229F60
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ov74_02229F60
	bl sub_0203A914
	ldr r0, _0222A4C8 ; =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0222A4C0
	bl ov74_02229DF8
_0222A4C0:
	add r0, r5, #0
	bl ov74_0222A5CC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A4C8: .word 0x000015D4
	thumb_func_end ov74_0222A494

	thumb_func_start ov74_0222A4CC
ov74_0222A4CC: ; 0x0222A4CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x18
	mov r2, #3
	bl ov74_0222AA18
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl ov74_02229F60
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229E28
	ldr r0, _0222A500 ; =ov74_0223D0A8
	mov r1, #0x25
	str r1, [r0, #0x10]
	mov r0, #0x20
	pop {r3, r4, r5, pc}
	nop
_0222A500: .word ov74_0223D0A8
	thumb_func_end ov74_0222A4CC

	thumb_func_start ov74_0222A504
ov74_0222A504: ; 0x0222A504
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	sub r0, r0, #2
	cmp r0, #2
	bhi _0222A51C
	mov r0, #0x31
	pop {r3, r4, r5, pc}
_0222A51C:
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl ov74_02229F60
	add r4, #0x18
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #7
	bl ov74_0222AA18
	mov r0, #0x21
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov74_0222A504

	thumb_func_start ov74_0222A538
ov74_0222A538: ; 0x0222A538
	push {r3, lr}
	ldr r0, _0222A55C ; =ov74_0223D0A8
	ldr r0, [r0, #0x10]
	cmp r0, #0x28
	beq _0222A54A
	cmp r0, #0x29
	beq _0222A54A
	cmp r0, #0x30
	bne _0222A558
_0222A54A:
	bl ov74_022365FC
	cmp r0, #0
	beq _0222A558
	ldr r0, _0222A55C ; =ov74_0223D0A8
	mov r1, #0x2b
	str r1, [r0, #0x10]
_0222A558:
	mov r0, #0x24
	pop {r3, pc}
	.balign 4, 0
_0222A55C: .word ov74_0223D0A8
	thumb_func_end ov74_0222A538

	thumb_func_start ov74_0222A560
ov74_0222A560: ; 0x0222A560
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x18
	mov r2, #3
	bl ov74_0222AA18
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229E28
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl ov74_02229F60
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229E28
	mov r1, #1
	ldr r0, _0222A5A4 ; =0x000015E0
	lsl r1, r1, #0xc
	str r1, [r4, r0]
	ldr r0, _0222A5A8 ; =0x0000267C
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #0x1b
	pop {r3, r4, r5, pc}
	nop
_0222A5A4: .word 0x000015E0
_0222A5A8: .word 0x0000267C
	thumb_func_end ov74_0222A560

	thumb_func_start ov74_0222A5AC
ov74_0222A5AC: ; 0x0222A5AC
	push {r4, lr}
	add r4, r0, #0
	bl OverlayManager_GetData
	add r0, #0x38
	mov r1, #0
	bl ov74_02229F60
	add r0, r4, #0
	mov r1, #0xc4
	mov r2, #0
	bl ov74_0222A94C
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222A5AC

	thumb_func_start ov74_0222A5CC
ov74_0222A5CC: ; 0x0222A5CC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r6, r0, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl Save_MysteryGift_get
	ldr r0, _0222A648 ; =0x000005C8
	ldr r1, [r5, r0]
	cmp r1, #0x1e
	bne _0222A5F2
	mov r1, #1
	add r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov74_0222CE10
_0222A5F2:
	add r0, r5, #0
	add r0, #0x28
	mov r1, #0
	bl ov74_02229F60
	add r4, r5, #0
	ldr r0, [r5, #0x38]
	add r4, #0x38
	cmp r0, #0
	bne _0222A626
	mov r0, #9
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x49
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r4, #0
	mov r3, #0xf
	bl AddWindowParameterized
_0222A626:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	mov r0, #1
	str r0, [sp]
	ldr r1, _0222A64C ; =ov74_0223C2B0
	add r0, r6, #0
	mov r2, #4
	add r3, r4, #0
	bl ov74_0222A89C
	mov r0, #4
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222A648: .word 0x000005C8
_0222A64C: .word ov74_0223C2B0
	thumb_func_end ov74_0222A5CC

	thumb_func_start ov74_0222A650
ov74_0222A650: ; 0x0222A650
	push {r4, lr}
	bl OverlayManager_GetData
	ldr r1, _0222A680 ; =0x000005C8
	add r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #0x1e
	bne _0222A66A
	mov r2, #1
	add r1, r1, #4
	str r2, [r4, r1]
	bl ov74_0222CE10
_0222A66A:
	ldr r2, _0222A684 ; =0x000015D8
	mov r0, #0
	ldr r2, [r4, r2]
	mov r1, #0x36
	mov r3, #2
	bl ov74_0223539C
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	nop
_0222A680: .word 0x000005C8
_0222A684: .word 0x000015D8
	thumb_func_end ov74_0222A650

	thumb_func_start ov74_0222A688
ov74_0222A688: ; 0x0222A688
	push {r4, lr}
	bl OverlayManager_GetData
	ldr r1, _0222A6B8 ; =0x000005C8
	add r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #0x1e
	bne _0222A6A2
	mov r2, #1
	add r1, r1, #4
	str r2, [r4, r1]
	bl ov74_0222CE10
_0222A6A2:
	ldr r2, _0222A6BC ; =0x000015D8
	mov r0, #0
	ldr r2, [r4, r2]
	mov r1, #0x37
	mov r3, #2
	bl ov74_0223539C
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	nop
_0222A6B8: .word 0x000005C8
_0222A6BC: .word 0x000015D8
	thumb_func_end ov74_0222A688

	thumb_func_start ov74_0222A6C0
ov74_0222A6C0: ; 0x0222A6C0
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _0222A6F0 ; =0x000005C8
	ldr r1, [r4, r0]
	cmp r1, #0x1e
	bne _0222A6D6
	mov r1, #1
	add r0, r0, #4
	str r1, [r4, r0]
_0222A6D6:
	mov r0, #1
	bl ov74_02235390
	ldr r2, _0222A6F4 ; =0x000015D8
	mov r0, #0
	ldr r2, [r4, r2]
	mov r1, #0x35
	mov r3, #2
	bl ov74_0223539C
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
_0222A6F0: .word 0x000005C8
_0222A6F4: .word 0x000015D8
	thumb_func_end ov74_0222A6C0

	thumb_func_start ov74_0222A6F8
ov74_0222A6F8: ; 0x0222A6F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r3, #0
	ldr r3, _0222A740 ; =_0223B3A0
	add r7, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	mov ip, r2
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	lsr r1, r6, #0xb
	str r0, [r2]
	add r0, sp, #0
	strb r1, [r0, #0x12]
	lsr r1, r5, #0xe
	strb r1, [r0, #0x13]
	lsl r1, r4, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	mov r2, ip
	mov r3, #0
	bl InitBgFromTemplate
	lsl r1, r4, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A740: .word _0223B3A0
	thumb_func_end ov74_0222A6F8

	thumb_func_start ov74_0222A744
ov74_0222A744: ; 0x0222A744
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r5, _0222A79C ; =_0223B390
	add r3, sp, #0
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	mov r1, #0
	mov r2, #0xf
	add r0, r4, #0
	lsl r2, r2, #0xc
	add r3, r1, #0
	bl ov74_0222A6F8
	mov r1, #1
	mov r2, #0x3e
	add r0, r4, #0
	lsl r2, r2, #0xa
	lsl r3, r1, #0xf
	bl ov74_0222A6F8
	mov r2, #0xe
	add r0, r4, #0
	mov r1, #4
	lsl r2, r2, #0xa
	mov r3, #0
	bl ov74_0222A6F8
	mov r2, #0x1e
	mov r3, #1
	add r0, r4, #0
	mov r1, #5
	lsl r2, r2, #0xa
	lsl r3, r3, #0xe
	bl ov74_0222A6F8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A79C: .word _0223B390
	thumb_func_end ov74_0222A744

	thumb_func_start ov74_0222A7A0
ov74_0222A7A0: ; 0x0222A7A0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x20
	mov r2, #4
	str r0, [sp]
	mov r0, #0x54
	add r3, r2, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0
	add r3, #0xfc
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x54
	str r0, [sp, #0xc]
	mov r0, #0x71
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x54
	str r0, [sp, #0xc]
	mov r0, #0x71
	mov r1, #2
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #8
	mov r2, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #5
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r4, #0
	mov r1, #5
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222A7A0

	thumb_func_start ov74_0222A81C
ov74_0222A81C: ; 0x0222A81C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x54
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0
	add r3, r0, #0
	add r2, r1, #0
	add r3, #0x8f
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x54
	str r0, [sp, #0xc]
	mov r0, #0x71
	add r2, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x54
	str r0, [sp, #0xc]
	mov r0, #0x71
	mov r1, #2
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #8
	mov r2, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r4, #0
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	add r0, r4, #0
	bl ov74_0222A7A0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222A81C

	thumb_func_start ov74_0222A89C
ov74_0222A89C: ; 0x0222A89C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp]
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _0222A8B8
	bl ListMenuItems_dtor
_0222A8B8:
	add r0, r7, #0
	mov r1, #0x54
	bl ListMenuItems_ctor
	str r0, [r4, #0x7c]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x54
	bl NewMsgDataFromNarc
	mov r6, #0
	str r0, [r4, #0x10]
	cmp r7, #0
	ble _0222A8EA
_0222A8D6:
	ldr r0, [r4, #0x7c]
	ldr r1, [r4, #0x10]
	ldr r2, [r5]
	ldr r3, [r5, #4]
	bl ListMenuItems_AppendFromMsgData
	add r6, r6, #1
	add r5, #8
	cmp r6, r7
	blt _0222A8D6
_0222A8EA:
	ldr r0, [r4, #0x10]
	bl DestroyMsgData
	ldr r3, _0222A948 ; =ov74_0223C270
	add r2, sp, #8
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x7c]
	str r0, [sp, #8]
	add r0, sp, #8
	strh r7, [r0, #0x12]
	ldrh r1, [r0, #0x12]
	strh r1, [r0, #0x10]
	ldr r0, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _0222A922
	mov r1, #0
	add r2, r1, #0
	bl DestroyListMenu
_0222A922:
	mov r1, #0
	add r0, sp, #8
	add r2, r1, #0
	mov r3, #0x54
	bl ListMenuInit
	str r0, [r4, #0x78]
	mov r0, #0
	ldr r2, [sp, #0x40]
	mvn r0, r0
	cmp r2, r0
	beq _0222A944
	add r4, #0x18
	ldr r0, [sp]
	add r1, r4, #0
	bl ov74_0222AA18
_0222A944:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A948: .word ov74_0223C270
	thumb_func_end ov74_0222A89C

	thumb_func_start ov74_0222A94C
ov74_0222A94C: ; 0x0222A94C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #0x14]
	add r7, r1, #0
	str r2, [sp, #0x20]
	bl OverlayManager_GetData
	str r0, [sp, #0x1c]
	ldr r0, [r0, #4]
	mov r5, #0
	bl Save_MysteryGift_get
	ldr r1, _0222AA10 ; =ov74_0223C220
	ldr r4, [sp, #0x1c]
	ldr r2, [r1, #0x70]
	ldr r1, [r1, #0x74]
	str r0, [sp, #0x18]
	add r4, #0x28
	add r5, r5, #1
	str r2, [sp, #0x24]
	str r1, [sp, #0x28]
	bl sub_0202DED8
	cmp r0, #0
	beq _0222A992
	lsl r6, r5, #3
	add r0, sp, #0x24
	add r1, r0, r6
	ldr r0, _0222AA10 ; =ov74_0223C220
	add r5, r5, #1
	ldr r3, [r0, #0x78]
	ldr r2, [r0, #0x7c]
	add r0, sp, #0x24
	str r3, [r0, r6]
	str r2, [r1, #4]
_0222A992:
	ldr r0, [sp, #0x18]
	bl sub_0202DEBC
	cmp r0, #0
	beq _0222A9B0
	lsl r6, r5, #3
	add r0, sp, #0x24
	add r1, r0, r6
	ldr r0, _0222AA14 ; =ov74_0223C2A0
	add r5, r5, #1
	ldr r3, [r0]
	ldr r2, [r0, #4]
	add r0, sp, #0x24
	str r3, [r0, r6]
	str r2, [r1, #4]
_0222A9B0:
	lsl r6, r5, #3
	add r0, sp, #0x24
	add r1, r0, r6
	ldr r0, _0222AA14 ; =ov74_0223C2A0
	ldr r3, [r0, #8]
	ldr r2, [r0, #0xc]
	add r0, sp, #0x24
	str r3, [r0, r6]
	str r2, [r1, #4]
	ldr r0, [r4]
	cmp r0, #0
	bne _0222A9EE
	mov r0, #7
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	add r0, r5, #1
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r2, #0
	lsl r0, r7, #0x10
	str r2, [sp, #0xc]
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	ldr r0, [r0]
	mov r3, #6
	bl AddWindowParameterized
_0222A9EE:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	ldr r0, [sp, #0x20]
	add r1, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r2, r5, #1
	add r3, r4, #0
	bl ov74_0222A89C
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0222AA10: .word ov74_0223C220
_0222AA14: .word ov74_0223C2A0
	thumb_func_end ov74_0222A94C

	thumb_func_start ov74_0222AA18
ov74_0222AA18: ; 0x0222AA18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r7, r2, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x54
	bl NewMsgDataFromNarc
	str r0, [r4, #0x10]
	mov r0, #0x54
	bl ScrStrBufs_new
	str r0, [r4, #0xc]
	mov r0, #1
	mov r1, #6
	bl GetFontAttribute
	add r1, r0, #0
	add r0, r5, #0
	bl FillWindowPixelBuffer
	ldr r6, [r4, #0x14]
	cmp r6, #0
	bne _0222AA60
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r2, r7, #0
	mov r3, #0x54
	bl ReadMsgData_ExpandPlaceholders
	add r6, r0, #0
_0222AA60:
	mov r3, #0
	str r3, [sp]
	ldr r0, [r4, #0x68]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, _0222AAA8 ; =0x0001020F
	add r2, r6, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	bl AddTextPrinterParameterized2
	str r0, [r4, #0x6c]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0222AA86
	add r0, r6, #0
	bl String_dtor
_0222AA86:
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	mov r3, #2
	bl DrawFrameAndWindow2
	ldr r0, [r4, #0x10]
	bl DestroyMsgData
	ldr r0, [r4, #0xc]
	bl ScrStrBufs_delete
	mov r0, #0xff
	str r0, [r4, #0x68]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222AAA8: .word 0x0001020F
	thumb_func_end ov74_0222AA18

	thumb_func_start ov74_0222AAAC
ov74_0222AAAC: ; 0x0222AAAC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r6, r2, #0
	bl OverlayManager_GetData
	mov r0, #0x25
	mov r1, #0x54
	bl String_ctor
	add r1, r6, #0
	mov r2, #0x24
	add r4, r0, #0
	bl CopyU16ArrayToStringN
	mov r0, #0
	mov r1, #6
	bl GetFontAttribute
	add r1, r0, #0
	add r0, r5, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222AB08 ; =0x0001020F
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222AB08: .word 0x0001020F
	thumb_func_end ov74_0222AAAC

	thumb_func_start ov74_0222AB0C
ov74_0222AB0C: ; 0x0222AB0C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl OverlayManager_GetData
	ldr r0, [r0, #0x78]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0222AB30
	add r0, r0, #1
	cmp r4, r0
	beq _0222AB66
	b _0222AB4A
_0222AB30:
	ldr r0, _0222AB68 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	cmp r6, #0
	beq _0222AB66
	add r0, r7, #0
	blx r6
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222AB66
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222AB4A:
	ldr r0, _0222AB68 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	cmp r4, #0
	beq _0222AB66
	ldr r0, _0222AB6C ; =ov74_0223D0A8
	str r4, [r0, #8]
	add r0, r7, #0
	blx r4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222AB66
	str r0, [r5]
_0222AB66:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222AB68: .word SEQ_SE_DP_SELECT
_0222AB6C: .word ov74_0223D0A8
	thumb_func_end ov74_0222AB0C

	thumb_func_start ov74_0222AB70
ov74_0222AB70: ; 0x0222AB70
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	bl ResetAllTextPrinters
	mov r0, #0
	add r1, r0, #0
	mov r2, #0x54
	bl LoadFontPal0
	mov r0, #0
	mov r1, #0x20
	mov r2, #0x54
	bl LoadFontPal0
	ldr r0, [r4, #8]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x54
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #0
	mov r2, #1
	mov r3, #2
	bl LoadUserFrameGfx2
	mov r0, #1
	str r0, [sp]
	mov r0, #0x54
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x1f
	mov r3, #3
	bl LoadUserFrameGfx1
	mov r0, #5
	ldr r1, _0222AC18 ; =0x00007D8C
	lsl r0, r0, #0x18
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x18
	bl WindowIsInUse
	cmp r0, #0
	bne _0222ABF4
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #0
	add r1, r4, #0
	str r2, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x18
	mov r3, #2
	bl AddWindowParameterized
_0222ABF4:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x18
	mov r2, #0
	bl ov74_0222AA18
	add r0, r5, #0
	mov r1, #0xc4
	mov r2, #0
	bl ov74_0222A94C
	ldr r0, [r4]
	bl ov74_0222A81C
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0222AC18: .word 0x00007D8C
	thumb_func_end ov74_0222AB70

	thumb_func_start ov74_0222AC1C
ov74_0222AC1C: ; 0x0222AC1C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r1, _0222ACC8 ; =0x000015E0
	add r0, r6, #0
	add r1, r4, r1
	bl ov74_02236AE0
	cmp r0, #4
	bhi _0222ACC4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222AC42: ; jump table
	.short _0222ACC4 - _0222AC42 - 2 ; case 0
	.short _0222AC4C - _0222AC42 - 2 ; case 1
	.short _0222AC78 - _0222AC42 - 2 ; case 2
	.short _0222AC78 - _0222AC42 - 2 ; case 3
	.short _0222AC8C - _0222AC42 - 2 ; case 4
_0222AC4C:
	ldr r1, _0222ACCC ; =0x00001658
	add r0, r4, #0
	mov r2, #0xea
	add r0, #0x8c
	add r1, r4, r1
	lsl r2, r2, #2
	bl memcpy
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	add r0, r4, #0
	mov r1, #0x1b
	add r0, #0x84
	str r1, [r0]
	mov r0, #0x13
	str r0, [r5]
	ldr r0, _0222ACD0 ; =0x000015DC
	mov r1, #0
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_0222AC78:
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	ldr r0, _0222ACD0 ; =0x000015DC
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #0x11
	str r0, [r5]
	pop {r4, r5, r6, pc}
_0222AC8C:
	mov r0, #0x9a
	lsl r0, r0, #6
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0x9a
	lsl r0, r0, #6
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, [r4]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r0, _0222ACD4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r6, #0
	mov r1, #0xc4
	mov r2, #0
	bl ov74_0222A94C
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #3
	str r0, [r5]
_0222ACC4:
	pop {r4, r5, r6, pc}
	nop
_0222ACC8: .word 0x000015E0
_0222ACCC: .word 0x00001658
_0222ACD0: .word 0x000015DC
_0222ACD4: .word SEQ_SE_DP_SELECT
	thumb_func_end ov74_0222AC1C

	thumb_func_start ov74_0222ACD8
ov74_0222ACD8: ; 0x0222ACD8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x5c
	add r5, r0, #0
	ldr r0, _0222AD64 ; =0x0000266C
	ldr r4, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222ACEC
	mov r4, #0xb
_0222ACEC:
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x54
	bl ScrStrBufs_new
	mov r1, #2
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r2, _0222AD68 ; =0x00002670
	mov r1, #0
	ldr r2, [r5, r2]
	mov r3, #5
	add r6, r0, #0
	bl BufferIntegerAsString
	mov r0, #0x1f
	mov r1, #0x9a
	str r0, [sp]
	mov r0, #3
	lsl r1, r1, #6
	mov r3, #0x32
	str r0, [sp, #4]
	add r0, sp, #8
	add r1, r5, r1
	mov r2, #1
	lsl r3, r3, #4
	bl ov74_02235414
	add r0, sp, #8
	mov r1, #0x18
	mov r2, #0x10
	mov r3, #0x64
	bl ov74_02235464
	add r0, sp, #8
	mov r1, #0
	mov r2, #1
	bl ov74_0223546C
	str r6, [sp, #0x1c]
	str r4, [sp]
	mov r2, #4
	ldr r0, [r5]
	add r1, sp, #8
	add r3, r2, #0
	bl ov74_02235568
	add r0, r6, #0
	bl ScrStrBufs_delete
	add sp, #0x5c
	pop {r3, r4, r5, r6, pc}
	nop
_0222AD64: .word 0x0000266C
_0222AD68: .word 0x00002670
	thumb_func_end ov74_0222ACD8

	thumb_func_start ov74_0222AD6C
ov74_0222AD6C: ; 0x0222AD6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r1, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #3
	bne _0222AD82
	mov r4, #0x16
	b _0222ADAC
_0222AD82:
	cmp r0, #4
	bne _0222AD8A
	mov r4, #0x1a
	b _0222ADAC
_0222AD8A:
	cmp r0, #2
	bne _0222AD92
	mov r4, #0x17
	b _0222ADAC
_0222AD92:
	cmp r0, #1
	bne _0222AD9A
	mov r4, #0x1c
	b _0222ADAC
_0222AD9A:
	cmp r0, #5
	bne _0222ADAC
	add r0, r5, #0
	add r1, #0x18
	mov r2, #9
	mov r3, #0x34
	bl ov74_0222ADBC
	pop {r3, r4, r5, pc}
_0222ADAC:
	add r0, r5, #0
	add r1, #0x18
	add r2, r4, #0
	mov r3, #0x33
	bl ov74_0222ADBC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov74_0222AD6C

	thumb_func_start ov74_0222ADBC
ov74_0222ADBC: ; 0x0222ADBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r6, r1, #0
	add r5, r2, #0
	add r7, r3, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	cmp r6, #0
	beq _0222AE16
	cmp r5, #0
	beq _0222AE16
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x54
	bl NewMsgDataFromNarc
	str r0, [sp, #4]
	mov r0, #0x54
	bl ScrStrBufs_new
	ldr r1, [sp, #4]
	add r2, r5, #0
	mov r3, #0x54
	str r0, [sp, #8]
	bl ReadMsgData_ExpandPlaceholders
	str r0, [r4, #0x14]
	mov r0, #1
	str r0, [r4, #0x68]
	ldr r0, [sp]
	add r1, r6, #0
	add r2, r5, #0
	bl ov74_0222AA18
	ldr r0, [sp, #8]
	str r7, [r4, #0x74]
	bl ScrStrBufs_delete
	ldr r0, [sp, #4]
	bl DestroyMsgData
	b _0222AE36
_0222AE16:
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222AE36
	ldr r0, [r4, #0x14]
	bl String_dtor
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x68]
	add sp, #0xc
	ldr r0, [r4, #0x74]
	pop {r4, r5, r6, r7, pc}
_0222AE36:
	mov r0, #0x32
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222ADBC

	thumb_func_start ov74_0222AE3C
ov74_0222AE3C: ; 0x0222AE3C
	push {r3, lr}
	ldr r1, _0222AE68 ; =0x000015D4
	ldr r0, [r0, r1]
	cmp r0, #4
	bhi _0222AE64
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222AE52: ; jump table
	.short _0222AE64 - _0222AE52 - 2 ; case 0
	.short _0222AE5C - _0222AE52 - 2 ; case 1
	.short _0222AE64 - _0222AE52 - 2 ; case 2
	.short _0222AE64 - _0222AE52 - 2 ; case 3
	.short _0222AE64 - _0222AE52 - 2 ; case 4
_0222AE5C:
	bl ov74_02229DF8
	bl sub_0203A914
_0222AE64:
	pop {r3, pc}
	nop
_0222AE68: .word 0x000015D4
	thumb_func_end ov74_0222AE3C

	thumb_func_start ov74_0222AE6C
ov74_0222AE6C: ; 0x0222AE6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov74_0222CD88
	mov r0, #3
	mov r1, #0x54
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r1, _0222AF14 ; =0x000029F8
	add r0, r5, #0
	mov r2, #0x54
	bl OverlayManager_CreateAndGetData
	ldr r2, _0222AF14 ; =0x000029F8
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x54
	bl BgConfig_Alloc
	str r0, [r4]
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	bl ov74_0222FCA4
	ldr r0, [r4]
	bl ov74_0222A744
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r1, _0222AF18 ; =0x0000047E
	mov r0, #0xa
	mov r2, #1
	bl sub_02004EC4
	mov r0, #0x54
	bl ov74_0223512C
	bl ov74_02235230
	cmp r0, #0
	beq _0222AEE8
	ldr r0, _0222AF1C ; =0x000015D4
	mov r1, #2
	str r1, [r4, r0]
	ldr r0, _0222AF20 ; =gGameVersion
	ldrb r0, [r0]
	bl sub_0201A4B0
	mov r0, #1
	bl ov74_02236034
_0222AEE8:
	ldr r0, _0222AF24 ; =0x000005C8
	mov r1, #0x1d
	str r1, [r4, r0]
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #8]
	mov r0, #0xff
	mov r2, #0x57
	str r0, [r4, #0x68]
	mov r0, #0
	mov r1, #0x59
	lsl r2, r2, #4
	bl CreateHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0222AF14: .word 0x000029F8
_0222AF18: .word 0x0000047E
_0222AF1C: .word 0x000015D4
_0222AF20: .word gGameVersion
_0222AF24: .word 0x000005C8
	thumb_func_end ov74_0222AE6C

	thumb_func_start ov74_0222AF28
ov74_0222AF28: ; 0x0222AF28
	push {r4, r5, lr}
	sub sp, #0x2c
	add r4, r0, #0
	ldr r0, _0222B0C0 ; =0x00004E21
	mov r3, #1
	str r0, [sp]
	str r3, [sp, #4]
	mov r1, #0x54
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xd8
	ldr r0, [r0, r1]
	mov r1, #0x71
	mov r2, #0x2b
	bl AddCharResObjFromNarc
	str r0, [r4, #0x58]
	ldr r0, _0222B0C0 ; =0x00004E21
	mov r1, #0x54
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	add r1, #0xdc
	ldr r0, [r0, r1]
	mov r1, #0x71
	mov r2, #0x28
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r4, #0x5c]
	ldr r0, _0222B0C0 ; =0x00004E21
	mov r1, #0x54
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xe0
	ldr r0, [r0, r1]
	mov r1, #0x71
	mov r2, #0x2a
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r4, #0x60]
	ldr r0, _0222B0C0 ; =0x00004E21
	mov r1, #0x54
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xe4
	ldr r0, [r0, r1]
	mov r1, #0x71
	mov r2, #0x29
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r4, #0x64]
	ldr r0, _0222B0C4 ; =0x00004E22
	mov r1, #0x54
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xd8
	ldr r0, [r0, r1]
	mov r1, #0x71
	mov r2, #0x2b
	mov r3, #1
	bl AddCharResObjFromNarc
	str r0, [r4, #0x70]
	ldr r0, _0222B0C4 ; =0x00004E22
	mov r1, #0x54
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	add r1, #0xdc
	ldr r0, [r0, r1]
	mov r1, #0x71
	mov r2, #0x28
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r4, #0x74]
	ldr r0, _0222B0C4 ; =0x00004E22
	mov r1, #0x54
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xe0
	ldr r0, [r0, r1]
	mov r1, #0x71
	mov r2, #0x2a
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r4, #0x78]
	ldr r0, _0222B0C4 ; =0x00004E22
	mov r1, #0x54
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xe4
	ldr r0, [r0, r1]
	mov r1, #0x71
	mov r2, #0x29
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r4, #0x7c]
	ldr r0, [r4, #0x58]
	bl sub_0200ACF0
	ldr r0, [r4, #0x70]
	bl sub_0200ACF0
	ldr r0, [r4, #0x5c]
	bl sub_0200B00C
	ldr r0, [r4, #0x74]
	bl sub_0200B00C
	mov r0, #0
	mov r5, #0x4b
	ldr r2, [r4, #0xc]
	ldr r1, _0222B0C0 ; =0x00004E21
	mvn r0, r0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r5, r5, #2
	ldr r3, [r2, r5]
	str r3, [sp, #0x14]
	add r3, r5, #4
	ldr r3, [r2, r3]
	str r3, [sp, #0x18]
	add r3, r5, #0
	add r3, #8
	ldr r3, [r2, r3]
	add r5, #0xc
	str r3, [sp, #0x1c]
	ldr r2, [r2, r5]
	add r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r4, #0
	add r0, #0x10
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r2, [r4, #0xc]
	ldr r1, _0222B0C4 ; =0x00004E22
	mov r0, #0
	mov r5, #0x4b
	add r4, #0x10
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r5, r5, #2
	ldr r3, [r2, r5]
	add r4, #0x24
	str r3, [sp, #0x14]
	add r3, r5, #4
	ldr r3, [r2, r3]
	str r3, [sp, #0x18]
	add r3, r5, #0
	add r3, #8
	ldr r3, [r2, r3]
	add r5, #0xc
	str r3, [sp, #0x1c]
	ldr r2, [r2, r5]
	add r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r4, #0
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x2c
	pop {r4, r5, pc}
	.balign 4, 0
_0222B0C0: .word 0x00004E21
_0222B0C4: .word 0x00004E22
	thumb_func_end ov74_0222AF28

	thumb_func_start ov74_0222B0C8
ov74_0222B0C8: ; 0x0222B0C8
	push {r4, lr}
	sub sp, #0x30
	cmp r1, #1
	beq _0222B0D4
	mov r3, #1
	b _0222B0D6
_0222B0D4:
	mov r3, #0
_0222B0D6:
	ldr r2, [r0, #0xc]
	add r0, #0x10
	ldr r2, [r2]
	str r2, [sp]
	mov r2, #0x24
	mul r2, r3
	add r0, r0, r2
	mov r3, #1
	lsl r3, r3, #0xc
	mov r2, #0
	str r0, [sp, #4]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	str r3, [sp, #0x1c]
	add r0, sp, #0
	strh r2, [r0, #0x20]
	lsl r0, r3, #7
	str r0, [sp, #8]
	mov r0, #0xa
	lsl r2, r3, #5
	str r0, [sp, #0x24]
	mov r0, #0x54
	str r2, [sp, #0xc]
	str r1, [sp, #0x28]
	str r0, [sp, #0x2c]
	cmp r1, #2
	bne _0222B114
	lsl r0, r3, #8
	add r0, r2, r0
	str r0, [sp, #0xc]
_0222B114:
	add r0, sp, #0
	bl CreateSprite
	add r4, r0, #0
	beq _0222B13C
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	mov r1, #0
	bl sub_02024A04
	add r0, r4, #0
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_0222B13C:
	add r0, r4, #0
	add sp, #0x30
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222B0C8

	thumb_func_start ov74_0222B144
ov74_0222B144: ; 0x0222B144
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	bl ov74_0222B0C8
	ldr r1, _0222B198 ; =0x00003014
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	bl sub_02024950
	ldr r0, _0222B198 ; =0x00003014
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020249D4
	ldr r0, _0222B198 ; =0x00003014
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0222B198 ; =0x00003014
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024ADC
	ldr r0, _0222B198 ; =0x00003014
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_0202487C
	ldr r0, _0222B198 ; =0x00003014
	ldr r0, [r4, r0]
	bl sub_020248AC
	mov r1, #2
	lsl r1, r1, #0x12
	str r1, [r0]
	mov r1, #6
	lsl r1, r1, #0x10
	str r1, [r0, #4]
	pop {r4, pc}
	.balign 4, 0
_0222B198: .word 0x00003014
	thumb_func_end ov74_0222B144

	thumb_func_start ov74_0222B19C
ov74_0222B19C: ; 0x0222B19C
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	bl ov74_0222B0C8
	ldr r1, _0222B1F0 ; =0x00003060
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #4
	bl sub_02024950
	ldr r0, _0222B1F0 ; =0x00003060
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020249D4
	ldr r0, _0222B1F0 ; =0x00003060
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0222B1F0 ; =0x00003060
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024ADC
	ldr r0, _0222B1F0 ; =0x00003060
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_0202487C
	ldr r0, _0222B1F0 ; =0x00003060
	ldr r0, [r4, r0]
	bl sub_020248AC
	mov r1, #2
	lsl r1, r1, #0x12
	str r1, [r0]
	lsl r1, r1, #1
	str r1, [r0, #4]
	pop {r4, pc}
	nop
_0222B1F0: .word 0x00003060
	thumb_func_end ov74_0222B19C

	thumb_func_start ov74_0222B1F4
ov74_0222B1F4: ; 0x0222B1F4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222B208 ; =0x00003014
	ldr r0, [r4, r0]
	bl sub_02024758
	ldr r0, _0222B208 ; =0x00003014
	mov r1, #0
	str r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0222B208: .word 0x00003014
	thumb_func_end ov74_0222B1F4

	thumb_func_start ov74_0222B20C
ov74_0222B20C: ; 0x0222B20C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222B220 ; =0x00003060
	ldr r0, [r4, r0]
	bl sub_02024758
	ldr r0, _0222B220 ; =0x00003060
	mov r1, #0
	str r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0222B220: .word 0x00003060
	thumb_func_end ov74_0222B20C

	thumb_func_start ov74_0222B224
ov74_0222B224: ; 0x0222B224
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #2
	ldr r7, _0222B27C ; =0x00001854
	str r0, [sp]
	mov r4, #0
	add r5, r0, #0
	lsl r6, r6, #0xc
_0222B232:
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _0222B242
	add r1, r6, #0
	bl sub_020249B0
_0222B242:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0222B24E
	add r1, r6, #0
	bl sub_020249B0
_0222B24E:
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #0x50
	blt _0222B232
	ldr r1, _0222B280 ; =0x00003014
	ldr r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0222B268
	mov r1, #2
	lsl r1, r1, #0xc
	bl sub_020249B0
_0222B268:
	ldr r1, _0222B284 ; =0x00003060
	ldr r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0222B27A
	mov r1, #2
	lsl r1, r1, #0xc
	bl sub_020249B0
_0222B27A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B27C: .word 0x00001854
_0222B280: .word 0x00003014
_0222B284: .word 0x00003060
	thumb_func_end ov74_0222B224

	thumb_func_start ov74_0222B288
ov74_0222B288: ; 0x0222B288
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
	mov r7, #1
_0222B292:
	add r0, r6, #0
	add r1, r7, #0
	bl ov74_0222B0C8
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #1
	bl sub_02024950
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0
	bl sub_020249D4
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #0x50
	blt _0222B292
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov74_0222B288

	thumb_func_start ov74_0222B2C4
ov74_0222B2C4: ; 0x0222B2C4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
	add r7, r4, #0
_0222B2CE:
	cmp r4, #0x14
	bge _0222B2FA
	add r0, r6, #0
	mov r1, #1
	bl ov74_0222B0C8
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #1
	bl sub_02024950
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0
	bl sub_020249D4
	b _0222B300
_0222B2FA:
	add r0, r5, #0
	add r0, #0x94
	str r7, [r0]
_0222B300:
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #0x50
	blt _0222B2CE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov74_0222B2C4

	thumb_func_start ov74_0222B30C
ov74_0222B30C: ; 0x0222B30C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, _0222B340 ; =0x00001854
	mov r4, #0
	add r5, r6, #0
_0222B316:
	add r0, r6, #0
	mov r1, #2
	bl ov74_0222B0C8
	ldr r1, _0222B340 ; =0x00001854
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #5
	bl sub_02024950
	ldr r0, [r5, r7]
	mov r1, #0
	bl sub_020249D4
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #0x50
	blt _0222B316
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B340: .word 0x00001854
	thumb_func_end ov74_0222B30C

	thumb_func_start ov74_0222B344
ov74_0222B344: ; 0x0222B344
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_0222B34C:
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _0222B36A
	bl sub_02024758
	add r0, r5, #0
	add r0, #0x94
	str r6, [r0]
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl DestroySysTask
_0222B36A:
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #0x50
	blt _0222B34C
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_0222B344

	thumb_func_start ov74_0222B374
ov74_0222B374: ; 0x0222B374
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r7, _0222B39C ; =0x00001890
	add r5, r0, #0
	add r6, r4, #0
_0222B37E:
	ldr r0, _0222B3A0 ; =0x00001854
	ldr r0, [r5, r0]
	bl sub_02024758
	ldr r0, _0222B3A0 ; =0x00001854
	str r6, [r5, r0]
	ldr r0, [r5, r7]
	bl DestroySysTask
	add r4, r4, #1
	add r5, #0x4c
	cmp r4, #0x50
	blt _0222B37E
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B39C: .word 0x00001890
_0222B3A0: .word 0x00001854
	thumb_func_end ov74_0222B374

	thumb_func_start ov74_0222B3A4
ov74_0222B3A4: ; 0x0222B3A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xb8
	add r5, r0, #0
	str r0, [sp]
	add r0, #0x88
	ldr r3, _0222B5E8 ; =_0223B3BC
	mov r4, #0
	add r7, sp, #0x64
	str r0, [sp]
	add r2, sp, #0x10
	mov r6, #0xa
_0222B3BA:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0222B3BA
	ldr r0, [r3]
	str r0, [r2]
_0222B3C6:
	mov r2, #2
	add r0, r5, #0
	mov r1, #6
	lsl r2, r2, #0x12
	add r0, #0x98
	str r2, [r0]
	add r0, r5, #0
	lsl r1, r1, #0x10
	add r0, #0x9c
	str r1, [r0]
	add r0, r5, #0
	lsr r1, r2, #5
	add r0, #0xa4
	str r1, [r0]
	mov r1, #5
	add r0, r5, #0
	lsl r1, r1, #0xc
	add r0, #0xa8
	str r1, [r0]
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r5, #0
	add r1, r2, r1
	add r0, #0xb4
	str r1, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0xbc
	str r1, [r0]
	add r0, r5, #0
	add r0, #0x8c
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	add r0, r0, #4
	cmp r0, #0
	ble _0222B42C
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222B43A
_0222B42C:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222B43A:
	bl _ffix
	add r1, r5, #0
	add r1, #0xa4
	str r0, [r1]
	cmp r4, #0x32
	ble _0222B462
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	mov r0, #0x41
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r0, r1
	add r0, r5, #0
	add r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B462:
	cmp r4, #0x28
	ble _0222B47E
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r0, r4, #0
	add r0, #0xfa
	add r1, r0, r1
	add r0, r5, #0
	add r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B47E:
	cmp r4, #0x1e
	ble _0222B49A
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r0, r4, #0
	add r0, #0xf0
	add r1, r0, r1
	add r0, r5, #0
	add r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B49A:
	cmp r4, #0x19
	ble _0222B4B6
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r0, r4, #0
	add r0, #0xe6
	add r1, r0, r1
	add r0, r5, #0
	add r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B4B6:
	cmp r4, #0x14
	ble _0222B4D2
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r0, r4, #0
	add r0, #0xdc
	add r1, r0, r1
	add r0, r5, #0
	add r0, #0xb8
	str r1, [r0]
	b _0222B4EC
_0222B4D2:
	add r6, sp, #0x10
	add r3, sp, #0x64
	mov r2, #0xa
_0222B4D8:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222B4D8
	ldr r0, [r6]
	str r0, [r3]
	add r0, r5, #0
	ldr r1, [r7]
	add r0, #0xb8
	str r1, [r0]
_0222B4EC:
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	add r1, r0, #1
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	bl _dflt
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, _0222B5EC ; =0x66666666
	ldr r1, _0222B5F0 ; =0x3FE66666
	bl _dmul
	bl _dfix
	add r1, r5, #0
	add r1, #0xb8
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xb8
	str r1, [r0]
	add r0, r5, #0
	mov r1, #0xf
	add r0, #0xc0
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xc0
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xc0
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xcc
	str r1, [r0]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020248AC
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #4
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bl LCRandom
	mov r1, #0xe0
	bl _s32_div_f
	add r1, #0x10
	cmp r1, #0
	ble _0222B586
	bl LCRandom
	mov r1, #0xe0
	bl _s32_div_f
	add r1, #0x10
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222B5A0
_0222B586:
	bl LCRandom
	mov r1, #0xe0
	bl _s32_div_f
	add r1, #0x10
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222B5A0:
	bl _ffix
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #4
	bl sub_020247D4
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _0222B5F4 ; =ov74_0222BA48
	ldr r1, [sp]
	mov r2, #6
	bl CreateSysTask
	add r1, r5, #0
	add r1, #0xd0
	str r0, [r1]
	ldr r0, [sp]
	add r4, r4, #1
	add r0, #0x4c
	add r5, #0x4c
	add r7, r7, #4
	str r0, [sp]
	cmp r4, #0x50
	bge _0222B5E4
	b _0222B3C6
_0222B5E4:
	add sp, #0xb8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B5E8: .word _0223B3BC
_0222B5EC: .word 0x66666666
_0222B5F0: .word 0x3FE66666
_0222B5F4: .word ov74_0222BA48
	thumb_func_end ov74_0222B3A4

	thumb_func_start ov74_0222B5F8
ov74_0222B5F8: ; 0x0222B5F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r5, #0
	mov r4, #0
	add r7, #0x88
_0222B604:
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	bne _0222B610
	b _0222B74C
_0222B610:
	add r1, r5, #0
	mov r0, #2
	add r1, #0x98
	lsl r0, r0, #0x12
	str r0, [r1]
	add r1, r5, #0
	mov r0, #6
	add r1, #0x9c
	lsl r0, r0, #0x10
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xa4
	lsr r0, r0, #3
	str r0, [r1]
	add r1, r5, #0
	mov r0, #1
	add r1, #0xa8
	lsl r0, r0, #0xc
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xb4
	mov r0, #0xff
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xbc
	mov r0, #0
	str r0, [r1]
	add r1, r5, #0
	add r1, #0x8c
	str r0, [r1]
	add r1, r5, #0
	add r1, #0x90
	str r0, [r1]
	cmp r4, #0x1e
	ble _0222B66A
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	add r0, r5, #0
	add r1, #0xf
	add r0, #0xb8
	str r1, [r0]
	b _0222B6AC
_0222B66A:
	cmp r4, #0x14
	ble _0222B682
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	add r0, r5, #0
	add r1, #0xa
	add r0, #0xb8
	str r1, [r0]
	b _0222B6AC
_0222B682:
	cmp r4, #0xa
	ble _0222B69A
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r0, r5, #0
	add r1, #0xa
	add r0, #0xb8
	str r1, [r0]
	b _0222B6AC
_0222B69A:
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r0, r5, #0
	add r1, r1, #5
	add r0, #0xb8
	str r1, [r0]
_0222B6AC:
	add r1, r5, #0
	add r1, #0xb8
	mov r0, #0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xc0
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xc0
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xcc
	str r1, [r0]
	bl LCRandom
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	str r1, [sp]
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1b
	sub r1, r1, r2
	mov r0, #0x1b
	ror r1, r0
	ldr r0, [sp]
	add r6, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r6, #0x40
	bl GF_SinDeg
	add r1, r5, #0
	add r1, #0x98
	ldr r1, [r1]
	mul r0, r6
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [sp]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	add r1, r5, #0
	add r1, #0x9c
	ldr r1, [r1]
	mul r0, r6
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #4
	bl sub_020247D4
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #1
	bl sub_02024950
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _0222B75C ; =ov74_0222BA48
	add r1, r7, #0
	mov r2, #6
	bl CreateSysTask
	add r1, r5, #0
	add r1, #0xd0
	str r0, [r1]
_0222B74C:
	add r4, r4, #1
	add r5, #0x4c
	add r7, #0x4c
	cmp r4, #0x50
	bge _0222B758
	b _0222B604
_0222B758:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B75C: .word ov74_0222BA48
	thumb_func_end ov74_0222B5F8

	thumb_func_start ov74_0222B760
ov74_0222B760: ; 0x0222B760
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0222B928 ; =0x00001848
	mov r4, #0
	add r6, r5, r0
_0222B76C:
	mov r1, #2
	ldr r0, _0222B92C ; =0x00001858
	lsl r1, r1, #0x12
	str r1, [r5, r0]
	mov r1, #6
	lsl r1, r1, #0x12
	add r0, r0, #4
	str r1, [r5, r0]
	mov r1, #1
	ldr r0, _0222B930 ; =0x00001864
	lsl r1, r1, #0xe
	str r1, [r5, r0]
	mov r1, #5
	lsl r1, r1, #0xc
	add r0, r0, #4
	str r1, [r5, r0]
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r1, r0, #4
	ldr r0, _0222B934 ; =0x00001874
	str r1, [r5, r0]
	mov r1, #0
	add r0, #8
	str r1, [r5, r0]
	ldr r0, _0222B938 ; =0x0000184C
	str r1, [r5, r0]
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	add r1, r0, #2
	ldr r0, _0222B93C ; =0x00001884
	str r1, [r5, r0]
	add r0, r4, #0
	mov r1, #0x1e
	bl _s32_div_f
	add r0, r0, #4
	cmp r0, #0
	ble _0222B7DE
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222B7EC
_0222B7DE:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222B7EC:
	bl _ffix
	ldr r1, _0222B930 ; =0x00001864
	cmp r4, #0x3c
	str r0, [r5, r1]
	ble _0222B812
	mov r0, #0x62
	mov r1, #5
	lsl r0, r0, #6
	str r1, [r5, r0]
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	ldr r0, _0222B940 ; =0x00001878
	add r1, #0x46
	str r1, [r5, r0]
	b _0222B8C0
_0222B812:
	cmp r4, #0x32
	ble _0222B830
	mov r0, #0x62
	mov r1, #5
	lsl r0, r0, #6
	str r1, [r5, r0]
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	ldr r0, _0222B940 ; =0x00001878
	add r1, #0x3c
	str r1, [r5, r0]
	b _0222B8C0
_0222B830:
	cmp r4, #0x28
	ble _0222B84E
	mov r0, #0x62
	mov r1, #5
	lsl r0, r0, #6
	str r1, [r5, r0]
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	ldr r0, _0222B940 ; =0x00001878
	add r1, #0x32
	str r1, [r5, r0]
	b _0222B8C0
_0222B84E:
	cmp r4, #0x1e
	ble _0222B86C
	mov r0, #0x62
	mov r1, #5
	lsl r0, r0, #6
	str r1, [r5, r0]
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	ldr r0, _0222B940 ; =0x00001878
	add r1, #0x28
	str r1, [r5, r0]
	b _0222B8C0
_0222B86C:
	cmp r4, #0x14
	ble _0222B88A
	mov r0, #0x62
	mov r1, #5
	lsl r0, r0, #6
	str r1, [r5, r0]
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	ldr r0, _0222B940 ; =0x00001878
	add r1, #0x1e
	str r1, [r5, r0]
	b _0222B8C0
_0222B88A:
	cmp r4, #0xa
	ble _0222B8A8
	mov r0, #0x62
	mov r1, #5
	lsl r0, r0, #6
	str r1, [r5, r0]
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	ldr r0, _0222B940 ; =0x00001878
	add r1, #0x14
	str r1, [r5, r0]
	b _0222B8C0
_0222B8A8:
	mov r0, #0x62
	mov r1, #5
	lsl r0, r0, #6
	str r1, [r5, r0]
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	ldr r0, _0222B940 ; =0x00001878
	add r1, #0xa
	str r1, [r5, r0]
_0222B8C0:
	mov r0, #0x62
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	add r0, #8
	str r1, [r5, r0]
	mov r0, #0x62
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	add r0, #0xc
	str r1, [r5, r0]
	ldr r0, _0222B944 ; =0x00001854
	ldr r0, [r5, r0]
	bl sub_020248AC
	add r3, r0, #0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r7, #0
	str r0, [r2]
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #0x12
	str r0, [sp, #4]
	ldr r0, _0222B944 ; =0x00001854
	ldr r0, [r5, r0]
	bl sub_020247D4
	ldr r0, _0222B944 ; =0x00001854
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0222B948 ; =ov74_0222BA48
	add r1, r6, #0
	mov r2, #6
	bl CreateSysTask
	ldr r1, _0222B94C ; =0x00001890
	add r4, r4, #1
	str r0, [r5, r1]
	add r5, #0x4c
	add r6, #0x4c
	cmp r4, #0x50
	bge _0222B924
	b _0222B76C
_0222B924:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B928: .word 0x00001848
_0222B92C: .word 0x00001858
_0222B930: .word 0x00001864
_0222B934: .word 0x00001874
_0222B938: .word 0x0000184C
_0222B93C: .word 0x00001884
_0222B940: .word 0x00001878
_0222B944: .word 0x00001854
_0222B948: .word ov74_0222BA48
_0222B94C: .word 0x00001890
	thumb_func_end ov74_0222B760

	thumb_func_start ov74_0222B950
ov74_0222B950: ; 0x0222B950
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	add r6, r3, #0
	str r1, [sp]
	str r1, [sp, #4]
	bl _fflt
	add r1, r4, #0
	bl _fsub
	str r0, [sp, #8]
	add r0, r5, #0
	bl _fflt
	add r1, r6, #0
	bl _fsub
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	add r1, r0, #0
	bl _fmul
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	add r1, r0, #0
	bl _fmul
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	mov r1, #0
	add r4, r0, #0
	bl _fgr
	ldr r0, _0222BA44 ; =0x45800000
	bls _0222B9B8
	add r1, r4, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222B9C6
_0222B9B8:
	add r1, r4, #0
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222B9C6:
	bl _ffix
	bl FX_Sqrt
	bl _fflt
	ldr r1, _0222BA44 ; =0x45800000
	bl _fdiv
	ldr r1, [sp, #0x30]
	add r4, r0, #0
	bl _fls
	blo _0222B9FE
	add r1, sp, #0x18
	mov r0, #0x1c
	ldrsh r0, [r1, r0]
	bl _fflt
	add r1, r4, #0
	bl _fgr
	bhi _0222B9FE
	mov r0, #0
	add r1, r4, #0
	bl _feq
	bne _0222BA04
_0222B9FE:
	add sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222BA04:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x30]
	bl _fmul
	add r1, r4, #0
	bl _fdiv
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x30]
	bl _fmul
	add r1, r4, #0
	bl _fdiv
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	bl _fadd
	ldr r1, [sp, #0x28]
	str r0, [r1]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #4]
	bl _fadd
	ldr r1, [sp, #0x2c]
	str r0, [r1]
	mov r0, #1
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_0222BA44: .word 0x45800000
	thumb_func_end ov74_0222B950

	thumb_func_start ov74_0222BA48
ov74_0222BA48: ; 0x0222BA48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	ldr r0, [r5, #0x30]
	cmp r0, #0
	ldr r0, [r5, #0xc]
	beq _0222BA66
	mov r1, #0
	bl sub_020249D4
	ldr r0, [r5, #0x30]
	add sp, #0x24
	sub r0, r0, #1
	str r0, [r5, #0x30]
	pop {r4, r5, r6, r7, pc}
_0222BA66:
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0xc]
	bl sub_020248AC
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x18]
	bl _fflt
	ldr r1, _0222BD90 ; =0x45800000
	bl _fdiv
	add r6, r0, #0
	ldr r0, [sp, #0x1c]
	bl _fflt
	ldr r1, _0222BD90 ; =0x45800000
	bl _fdiv
	add r7, r0, #0
	ldr r0, [r5, #0x1c]
	bl _fflt
	ldr r1, _0222BD90 ; =0x45800000
	bl _fdiv
	add r4, r0, #0
	ldr r0, [r5, #0x20]
	bl _fflt
	ldr r1, _0222BD90 ; =0x45800000
	bl _fdiv
	bl _ffix
	add r1, sp, #0x14
	str r1, [sp]
	add r1, sp, #0x10
	str r1, [sp, #4]
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	lsl r0, r0, #4
	lsl r1, r1, #4
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	add r2, r6, #0
	add r3, r7, #0
	bl ov74_0222B950
	cmp r0, #0
	beq _0222BB5A
	ldr r0, [r5, #0x24]
	cmp r0, #0
	bne _0222BB5A
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl _fgr
	ldr r0, _0222BD90 ; =0x45800000
	bls _0222BB00
	ldr r1, [sp, #0x14]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222BB0E
_0222BB00:
	ldr r1, [sp, #0x14]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222BB0E:
	bl _ffix
	ldr r1, [sp, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl _fgr
	ldr r0, _0222BD90 ; =0x45800000
	bls _0222BB36
	ldr r1, [sp, #0x10]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222BB44
_0222BB36:
	ldr r1, [sp, #0x10]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222BB44:
	bl _ffix
	ldr r1, [sp, #0x1c]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0xc]
	add r1, sp, #0x18
	bl sub_020247D4
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0222BB5A:
	ldr r0, [r5, #0x24]
	cmp r0, #0
	beq _0222BB68
	cmp r0, #1
	beq _0222BBDE
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0222BB68:
	ldr r1, [r5, #0x10]
	ldr r0, [sp, #0x18]
	sub r0, r1, r0
	cmp r0, #0
	ble _0222BB84
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222BB92
_0222BB84:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222BB92:
	add r4, r0, #0
	ldr r1, [r5, #0x14]
	ldr r0, [sp, #0x1c]
	sub r0, r1, r0
	cmp r0, #0
	ble _0222BBB0
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222BBBE
_0222BBB0:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222BBBE:
	bl _ffix
	add r6, r0, #0
	add r0, r4, #0
	bl _ffix
	add r1, r0, #0
	add r0, r6, #0
	bl FX_Atan2Idx
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x24]
	add sp, #0x24
	add r0, r0, #1
	str r0, [r5, #0x24]
	pop {r4, r5, r6, r7, pc}
_0222BBDE:
	ldr r0, [r5, #4]
	cmp r0, #0x14
	bge _0222BBEA
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222BBEE
_0222BBEA:
	mov r0, #1
	str r0, [r5, #8]
_0222BBEE:
	ldr r0, [r5, #0x28]
	add r0, #8
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	bne _0222BC44
	ldr r0, [r5, #0x34]
	mov r1, #0x5a
	add r0, #8
	lsl r1, r1, #2
	str r0, [r5, #0x34]
	bl _s32_div_f
	lsl r0, r1, #0x10
	str r1, [r5, #0x34]
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x38]
	mul r0, r1
	asr r0, r0, #0xc
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x10]
	mul r0, r1
	add r0, r2, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x14]
	mul r0, r1
	add r0, r2, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BC44:
	cmp r0, #1
	bne _0222BC92
	ldr r0, [r5, #0x34]
	mov r1, #0x5a
	add r0, #8
	lsl r1, r1, #2
	str r0, [r5, #0x34]
	bl _s32_div_f
	lsl r0, r1, #0x10
	str r1, [r5, #0x34]
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x38]
	mul r0, r1
	asr r0, r0, #0xc
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x10]
	mul r0, r1
	add r0, r2, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x14]
	mul r0, r1
	add r0, r2, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BC92:
	cmp r0, #2
	bne _0222BCF0
	ldr r0, [r5, #0x34]
	mov r1, #0x5a
	add r0, #8
	lsl r1, r1, #2
	str r0, [r5, #0x34]
	bl _s32_div_f
	lsl r0, r1, #0x10
	str r1, [r5, #0x34]
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x38]
	mul r0, r1
	asr r0, r0, #0xc
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x40]
	ldr r3, [r5, #0x10]
	add r2, r1, #0
	mul r2, r0
	mov r0, #0
	mvn r0, r0
	mul r0, r2
	add r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x44]
	ldr r3, [r5, #0x14]
	add r2, r1, #0
	mul r2, r0
	mov r0, #0
	mvn r0, r0
	mul r0, r2
	add r0, r3, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BCF0:
	cmp r0, #3
	bne _0222BD4E
	ldr r0, [r5, #0x34]
	mov r1, #0x5a
	add r0, #8
	lsl r1, r1, #2
	str r0, [r5, #0x34]
	bl _s32_div_f
	lsl r0, r1, #0x10
	str r1, [r5, #0x34]
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x38]
	mul r0, r1
	asr r0, r0, #0xc
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x40]
	ldr r3, [r5, #0x10]
	add r2, r1, #0
	mul r2, r0
	mov r0, #0
	mvn r0, r0
	mul r0, r2
	add r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x44]
	ldr r3, [r5, #0x14]
	add r2, r1, #0
	mul r2, r0
	mov r0, #0
	mvn r0, r0
	mul r0, r2
	add r0, r3, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BD4E:
	cmp r0, #4
	bne _0222BD94
	ldr r1, [r5, #0x38]
	cmp r1, #0x60
	bge _0222BD5E
	ldr r0, [r5, #0x3c]
	add r0, r1, r0
	str r0, [r5, #0x38]
_0222BD5E:
	ldr r0, [r5, #0x38]
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x38]
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x10]
	mul r0, r1
	add r0, r2, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x14]
	mul r0, r1
	add r0, r2, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
	.balign 4, 0
_0222BD90: .word 0x45800000
_0222BD94:
	cmp r0, #5
	bne _0222BDE6
	ldr r1, [r5, #0x38]
	cmp r1, #0x60
	bge _0222BDA4
	ldr r0, [r5, #0x3c]
	add r0, r1, r0
	str r0, [r5, #0x38]
_0222BDA4:
	ldr r0, [r5, #0x38]
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x38]
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x40]
	ldr r3, [r5, #0x10]
	add r2, r1, #0
	mul r2, r0
	mov r0, #0
	mvn r0, r0
	mul r0, r2
	add r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x44]
	ldr r3, [r5, #0x14]
	add r2, r1, #0
	mul r2, r0
	mov r0, #0
	mvn r0, r0
	mul r0, r2
	add r0, r3, r0
	str r0, [sp, #0x1c]
	b _0222BEBC
_0222BDE6:
	mov r0, #0xa
	str r0, [r5, #4]
	mov r0, #2
	ldr r1, [r5, #0x1c]
	lsl r0, r0, #0xa
	add r0, r1, r0
	str r0, [r5, #0x1c]
	ldr r0, [sp, #0x18]
	bl _fflt
	ldr r1, _0222BED4 ; =0x45800000
	bl _fdiv
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	bl _fflt
	ldr r1, _0222BED4 ; =0x45800000
	bl _fdiv
	add r6, r0, #0
	ldr r0, [r5, #0x1c]
	bl _fflt
	ldr r1, _0222BED4 ; =0x45800000
	bl _fdiv
	add r1, sp, #0x14
	str r1, [sp]
	add r1, sp, #0x10
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	lsl r0, r0, #4
	lsl r1, r1, #4
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	add r2, r4, #0
	add r3, r6, #0
	bl ov74_0222B950
	cmp r0, #0
	beq _0222BEB8
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl _fgr
	ldr r0, _0222BED4 ; =0x45800000
	bls _0222BE60
	ldr r1, [sp, #0x14]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222BE6E
_0222BE60:
	ldr r1, [sp, #0x14]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222BE6E:
	bl _ffix
	ldr r1, [sp, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl _fgr
	ldr r0, _0222BED4 ; =0x45800000
	bls _0222BE96
	ldr r1, [sp, #0x10]
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0222BEA4
_0222BE96:
	ldr r1, [sp, #0x10]
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0222BEA4:
	bl _ffix
	ldr r1, [sp, #0x1c]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0xc]
	add r1, sp, #0x18
	bl sub_020247D4
	b _0222BEBC
_0222BEB8:
	mov r0, #1
	str r0, [r5, #8]
_0222BEBC:
	mov r1, #0x5a
	ldr r0, [r5, #0x28]
	lsl r1, r1, #2
	bl _s32_div_f
	str r1, [r5, #0x28]
	ldr r0, [r5, #0xc]
	add r1, sp, #0x18
	bl sub_020247D4
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BED4: .word 0x45800000
	thumb_func_end ov74_0222BA48

	thumb_func_start ov74_0222BED8
ov74_0222BED8: ; 0x0222BED8
	add r3, r0, #0
	mov r2, #8
	ldrsb r2, [r3, r2]
	ldr r3, _0222BEE8 ; =G2x_SetBlendBrightness_
	ldr r0, _0222BEEC ; =0x04000050
	mov r1, #0x22
	bx r3
	nop
_0222BEE8: .word G2x_SetBlendBrightness_
_0222BEEC: .word 0x04000050
	thumb_func_end ov74_0222BED8

	thumb_func_start ov74_0222BEF0
ov74_0222BEF0: ; 0x0222BEF0
	add r3, r0, #0
	mov r2, #8
	ldrsb r2, [r3, r2]
	ldr r3, _0222BF00 ; =G2x_SetBlendBrightness_
	ldr r0, _0222BF04 ; =0x04001050
	mov r1, #0x22
	bx r3
	nop
_0222BF00: .word G2x_SetBlendBrightness_
_0222BF04: .word 0x04001050
	thumb_func_end ov74_0222BEF0

	thumb_func_start ov74_0222BF08
ov74_0222BF08: ; 0x0222BF08
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0222BED8
	add r0, r4, #0
	bl ov74_0222BEF0
	pop {r4, pc}
	thumb_func_end ov74_0222BF08

	thumb_func_start ov74_0222BF18
ov74_0222BF18: ; 0x0222BF18
	push {r3, lr}
	mov r0, #1
	mov r1, #0
	bl BG_SetMaskColor
	mov r0, #5
	mov r1, #0
	bl BG_SetMaskColor
	pop {r3, pc}
	thumb_func_end ov74_0222BF18

	thumb_func_start ov74_0222BF2C
ov74_0222BF2C: ; 0x0222BF2C
	push {r4, lr}
	mov r4, #1
	cmp r1, #0
	beq _0222BF3E
	cmp r1, #1
	beq _0222BF6A
	cmp r1, #2
	beq _0222BF84
	b _0222BF98
_0222BF3E:
	mov r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ble _0222BF58
	sub r1, r1, r2
	cmp r1, #0
	ble _0222BF52
	strb r1, [r0, #8]
	mov r4, #0
	b _0222BF98
_0222BF52:
	mov r1, #0
	strb r1, [r0, #8]
	b _0222BF98
_0222BF58:
	bge _0222BF98
	add r1, r1, r2
	bpl _0222BF64
	strb r1, [r0, #8]
	mov r4, #0
	b _0222BF98
_0222BF64:
	mov r1, #0
	strb r1, [r0, #8]
	b _0222BF98
_0222BF6A:
	mov r3, #8
	ldrsb r1, [r0, r3]
	sub r2, r1, r2
	add r1, r3, #0
	sub r1, #0x18
	cmp r2, r1
	ble _0222BF7E
	strb r2, [r0, #8]
	mov r4, #0
	b _0222BF98
_0222BF7E:
	sub r3, #0x18
	strb r3, [r0, #8]
	b _0222BF98
_0222BF84:
	mov r1, #8
	ldrsb r1, [r0, r1]
	add r1, r1, r2
	cmp r1, #0x10
	bge _0222BF94
	strb r1, [r0, #8]
	mov r4, #0
	b _0222BF98
_0222BF94:
	mov r1, #0x10
	strb r1, [r0, #8]
_0222BF98:
	bl ov74_0222BF08
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov74_0222BF2C

	thumb_func_start ov74_0222BFA0
ov74_0222BFA0: ; 0x0222BFA0
	push {r4, lr}
	mov r4, #1
	cmp r1, #0
	beq _0222BFB2
	cmp r1, #1
	beq _0222BFDE
	cmp r1, #2
	beq _0222BFF8
	b _0222C00C
_0222BFB2:
	mov r1, #8
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ble _0222BFCC
	sub r1, r1, r2
	cmp r1, #0
	ble _0222BFC6
	strb r1, [r0, #8]
	mov r4, #0
	b _0222C00C
_0222BFC6:
	mov r1, #0
	strb r1, [r0, #8]
	b _0222C00C
_0222BFCC:
	bge _0222C00C
	add r1, r1, r2
	bpl _0222BFD8
	strb r1, [r0, #8]
	mov r4, #0
	b _0222C00C
_0222BFD8:
	mov r1, #0
	strb r1, [r0, #8]
	b _0222C00C
_0222BFDE:
	mov r3, #8
	ldrsb r1, [r0, r3]
	sub r2, r1, r2
	add r1, r3, #0
	sub r1, #0x18
	cmp r2, r1
	ble _0222BFF2
	strb r2, [r0, #8]
	mov r4, #0
	b _0222C00C
_0222BFF2:
	sub r3, #0x18
	strb r3, [r0, #8]
	b _0222C00C
_0222BFF8:
	mov r1, #8
	ldrsb r1, [r0, r1]
	add r1, r1, r2
	cmp r1, #0x10
	bge _0222C008
	strb r1, [r0, #8]
	mov r4, #0
	b _0222C00C
_0222C008:
	mov r1, #0x10
	strb r1, [r0, #8]
_0222C00C:
	bl ov74_0222BED8
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov74_0222BFA0

	thumb_func_start ov74_0222C014
ov74_0222C014: ; 0x0222C014
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	strb r1, [r4, #8]
	bl ov74_0222BF08
	add r0, r4, #0
	bl ov74_0222AF28
	add r0, r4, #0
	bl ov74_0222B288
	add r0, r4, #0
	bl ov74_0222B3A4
	add r0, r4, #0
	bl ov74_0222B144
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222C014

	thumb_func_start ov74_0222C04C
ov74_0222C04C: ; 0x0222C04C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #9
	bls _0222C058
	b _0222C2BC
_0222C058:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222C064: ; jump table
	.short _0222C078 - _0222C064 - 2 ; case 0
	.short _0222C084 - _0222C064 - 2 ; case 1
	.short _0222C09A - _0222C064 - 2 ; case 2
	.short _0222C0FE - _0222C064 - 2 ; case 3
	.short _0222C126 - _0222C064 - 2 ; case 4
	.short _0222C17C - _0222C064 - 2 ; case 5
	.short _0222C19A - _0222C064 - 2 ; case 6
	.short _0222C222 - _0222C064 - 2 ; case 7
	.short _0222C294 - _0222C064 - 2 ; case 8
	.short _0222C2A8 - _0222C064 - 2 ; case 9
_0222C078:
	add r0, r4, #0
	bl ov74_0222C014
	mov r0, #1
	str r0, [r4]
	b _0222C2D0
_0222C084:
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ov74_0222BF2C
	cmp r0, #0
	bne _0222C094
	b _0222C2D0
_0222C094:
	mov r0, #2
	str r0, [r4]
	b _0222C2D0
_0222C09A:
	mov r5, #0
	mov r6, #1
	add r0, r5, #0
	add r1, r4, #0
	add r3, r5, #0
_0222C0A4:
	add r2, r1, #0
	add r2, #0x90
	ldr r2, [r2]
	cmp r2, #0
	beq _0222C0B2
	add r5, r5, #1
	b _0222C0B4
_0222C0B2:
	add r6, r3, #0
_0222C0B4:
	add r0, r0, #1
	add r1, #0x4c
	cmp r0, #0x50
	blt _0222C0A4
	cmp r5, #0x32
	ble _0222C0CC
	ldr r0, _0222C2D8 ; =0x00003014
	mov r1, #4
	ldr r0, [r4, r0]
	bl sub_02024950
	b _0222C0EA
_0222C0CC:
	cmp r5, #0x1e
	ble _0222C0DC
	ldr r0, _0222C2D8 ; =0x00003014
	mov r1, #3
	ldr r0, [r4, r0]
	bl sub_02024950
	b _0222C0EA
_0222C0DC:
	cmp r5, #7
	ble _0222C0EA
	ldr r0, _0222C2D8 ; =0x00003014
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
_0222C0EA:
	cmp r6, #0
	bne _0222C0F2
	cmp r5, #0x4f
	bne _0222C1A8
_0222C0F2:
	mov r0, #3
	str r0, [r4]
	add r0, r4, #0
	bl ov74_0222B344
	b _0222C2D0
_0222C0FE:
	ldr r0, _0222C2DC ; =0x000030A0
	ldr r0, [r4, r0]
	ldr r0, [r0]
	cmp r0, #2
	bne _0222C1A8
	add r0, r4, #0
	bl ov74_0222B2C4
	add r0, r4, #0
	bl ov74_0222B5F8
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	bl ov74_0222BF18
	mov r0, #4
	str r0, [r4]
	b _0222C2D0
_0222C126:
	mov r5, #0
	mov r6, #1
	add r1, r5, #0
	add r2, r4, #0
	add r0, r5, #0
_0222C130:
	add r3, r2, #0
	add r3, #0x94
	ldr r3, [r3]
	cmp r3, #0
	beq _0222C14A
	add r3, r2, #0
	add r3, #0x90
	ldr r3, [r3]
	cmp r3, #0
	beq _0222C148
	add r5, r5, #1
	b _0222C14A
_0222C148:
	add r6, r0, #0
_0222C14A:
	add r1, r1, #1
	add r2, #0x4c
	cmp r1, #0x50
	blt _0222C130
	mov r1, #2
	add r0, r4, #0
	add r2, r1, #0
	bl ov74_0222BFA0
	cmp r6, #0
	bne _0222C164
	cmp r5, #0x13
	bne _0222C1A8
_0222C164:
	ldr r0, _0222C2E0 ; =SEQ_SE_DP_SAVE
	bl PlaySE
	mov r0, #5
	str r0, [r4]
	add r0, r4, #0
	bl ov74_0222B344
	add r0, r4, #0
	bl ov74_0222B19C
	b _0222C2D0
_0222C17C:
	mov r1, #2
	add r0, r4, #0
	add r2, r1, #0
	bl ov74_0222BFA0
	cmp r0, #0
	beq _0222C1A8
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ov74_0222BFA0
	mov r0, #6
	str r0, [r4]
	b _0222C2D0
_0222C19A:
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ov74_0222BFA0
	cmp r0, #0
	bne _0222C1AA
_0222C1A8:
	b _0222C2D0
_0222C1AA:
	ldr r0, _0222C2D8 ; =0x00003014
	ldr r0, [r4, r0]
	bl sub_020248AC
	add r5, r0, #0
	ldr r0, _0222C2E4 ; =0x00003060
	ldr r0, [r4, r0]
	bl sub_020248AC
	mov r1, #0xe
	ldr r2, [r5, #4]
	lsl r1, r1, #0x10
	cmp r2, r1
	bge _0222C1CE
	mov r1, #2
	lsl r1, r1, #0xe
	add r1, r2, r1
	str r1, [r5, #4]
_0222C1CE:
	mov r1, #3
	ldr r2, [r5, #4]
	lsl r1, r1, #0x12
	sub r2, r2, r1
	cmp r2, #0
	ble _0222C2D0
	ldr r2, [r0, #4]
	lsl r1, r1, #1
	cmp r2, r1
	bge _0222C202
	mov r1, #2
	lsl r1, r1, #0xe
	add r1, r2, r1
	str r1, [r0, #4]
	ldr r0, _0222C2E4 ; =0x00003060
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #0
	bne _0222C2D0
	ldr r0, _0222C2E4 ; =0x00003060
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	b _0222C2D0
_0222C202:
	mov r0, #7
	str r0, [r4]
	add r0, r4, #0
	bl ov74_0222B1F4
	add r0, r4, #0
	bl ov74_0222B30C
	add r0, r4, #0
	bl ov74_0222B760
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _0222C2D0
_0222C222:
	mov r5, #0
	ldr r0, _0222C2E8 ; =0x00001850
	mov r6, #1
	add r2, r5, #0
	add r3, r4, #0
	add r7, r5, #0
_0222C22E:
	ldr r1, [r3, r0]
	cmp r1, #0
	beq _0222C238
	add r5, r5, #1
	b _0222C23A
_0222C238:
	add r6, r7, #0
_0222C23A:
	add r2, r2, #1
	add r3, #0x4c
	cmp r2, #0x50
	blt _0222C22E
	cmp r5, #7
	ble _0222C250
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl ov74_0222BF2C
_0222C250:
	cmp r5, #0x32
	ble _0222C260
	ldr r0, _0222C2E4 ; =0x00003060
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	b _0222C27E
_0222C260:
	cmp r5, #0x1e
	ble _0222C270
	ldr r0, _0222C2E4 ; =0x00003060
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_02024950
	b _0222C27E
_0222C270:
	cmp r5, #7
	ble _0222C27E
	ldr r0, _0222C2E4 ; =0x00003060
	mov r1, #3
	ldr r0, [r4, r0]
	bl sub_02024950
_0222C27E:
	cmp r6, #0
	beq _0222C2D0
	mov r0, #8
	str r0, [r4]
	add r0, r4, #0
	bl ov74_0222B374
	add r0, r4, #0
	bl ov74_0222B20C
	b _0222C2D0
_0222C294:
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl ov74_0222BF2C
	cmp r0, #0
	beq _0222C2D0
	mov r0, #9
	str r0, [r4]
	b _0222C2D0
_0222C2A8:
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov74_0222BF2C
	cmp r0, #0
	beq _0222C2D0
	mov r0, #0xff
	str r0, [r4]
	b _0222C2D0
_0222C2BC:
	ldr r1, _0222C2DC ; =0x000030A0
	mov r2, #0
	ldr r1, [r4, r1]
	str r2, [r1]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_0222C2D0:
	add r0, r4, #0
	bl ov74_0222B224
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C2D8: .word 0x00003014
_0222C2DC: .word 0x000030A0
_0222C2E0: .word SEQ_SE_DP_SAVE
_0222C2E4: .word 0x00003060
_0222C2E8: .word 0x00001850
	thumb_func_end ov74_0222C04C

	thumb_func_start ov74_0222C2EC
ov74_0222C2EC: ; 0x0222C2EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl CTRDG_IsExisting
	ldr r0, _0222C640 ; =0x000005C8
	ldr r0, [r4, r0]
	cmp r0, #0x1d
	beq _0222C30C
	add r0, r4, #0
	bl ov74_0222CE10
_0222C30C:
	ldr r3, [r5]
	cmp r3, #0x3a
	bls _0222C316
	bl _0222CD3A
_0222C316:
	add r0, r3, r3
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222C322: ; jump table
	.short _0222C398 - _0222C322 - 2 ; case 0
	.short _0222C3AA - _0222C322 - 2 ; case 1
	.short _0222C3C8 - _0222C322 - 2 ; case 2
	.short _0222C3D2 - _0222C322 - 2 ; case 3
	.short _0222C3E0 - _0222C322 - 2 ; case 4
	.short _0222C3EE - _0222C322 - 2 ; case 5
	.short _0222CD3A - _0222C322 - 2 ; case 6
	.short _0222C636 - _0222C322 - 2 ; case 7
	.short _0222C71C - _0222C322 - 2 ; case 8
	.short _0222C728 - _0222C322 - 2 ; case 9
	.short _0222C7E8 - _0222C322 - 2 ; case 10
	.short _0222C836 - _0222C322 - 2 ; case 11
	.short _0222C858 - _0222C322 - 2 ; case 12
	.short _0222C8E8 - _0222C322 - 2 ; case 13
	.short _0222C93E - _0222C322 - 2 ; case 14
	.short _0222C96A - _0222C322 - 2 ; case 15
	.short _0222C9AA - _0222C322 - 2 ; case 16
	.short _0222C9CC - _0222C322 - 2 ; case 17
	.short _0222CA04 - _0222C322 - 2 ; case 18
	.short _0222CA48 - _0222C322 - 2 ; case 19
	.short _0222CAEA - _0222C322 - 2 ; case 20
	.short _0222CAF6 - _0222C322 - 2 ; case 21
	.short _0222CAFC - _0222C322 - 2 ; case 22
	.short _0222CB32 - _0222C322 - 2 ; case 23
	.short _0222CB4C - _0222C322 - 2 ; case 24
	.short _0222CBC4 - _0222C322 - 2 ; case 25
	.short _0222CD3A - _0222C322 - 2 ; case 26
	.short _0222C3FC - _0222C322 - 2 ; case 27
	.short _0222CD3A - _0222C322 - 2 ; case 28
	.short _0222CD3A - _0222C322 - 2 ; case 29
	.short _0222CD3A - _0222C322 - 2 ; case 30
	.short _0222C4BA - _0222C322 - 2 ; case 31
	.short _0222C408 - _0222C322 - 2 ; case 32
	.short _0222C4CE - _0222C322 - 2 ; case 33
	.short _0222C570 - _0222C322 - 2 ; case 34
	.short _0222C54E - _0222C322 - 2 ; case 35
	.short _0222C612 - _0222C322 - 2 ; case 36
	.short _0222CD3A - _0222C322 - 2 ; case 37
	.short _0222CD3A - _0222C322 - 2 ; case 38
	.short _0222CD3A - _0222C322 - 2 ; case 39
	.short _0222CD3A - _0222C322 - 2 ; case 40
	.short _0222CD3A - _0222C322 - 2 ; case 41
	.short _0222CD3A - _0222C322 - 2 ; case 42
	.short _0222CD3A - _0222C322 - 2 ; case 43
	.short _0222CD3A - _0222C322 - 2 ; case 44
	.short _0222CD3A - _0222C322 - 2 ; case 45
	.short _0222CD3A - _0222C322 - 2 ; case 46
	.short _0222CD3A - _0222C322 - 2 ; case 47
	.short _0222CD3A - _0222C322 - 2 ; case 48
	.short _0222CBDE - _0222C322 - 2 ; case 49
	.short _0222CC02 - _0222C322 - 2 ; case 50
	.short _0222CC10 - _0222C322 - 2 ; case 51
	.short _0222CC2E - _0222C322 - 2 ; case 52
	.short _0222CC44 - _0222C322 - 2 ; case 53
	.short _0222CC58 - _0222C322 - 2 ; case 54
	.short _0222CC6A - _0222C322 - 2 ; case 55
	.short _0222CC7E - _0222C322 - 2 ; case 56
	.short _0222CCC0 - _0222C322 - 2 ; case 57
	.short _0222CD34 - _0222C322 - 2 ; case 58
_0222C398:
	mov r0, #0x54
	bl ov74_022352A0
	ldr r0, _0222C644 ; =0x000015D8
	str r5, [r4, r0]
	mov r0, #1
	str r0, [r5]
	bl _0222CD3A
_0222C3AA:
	add r0, r6, #0
	add r1, r4, #0
	bl ov74_0222AB70
	add r0, r4, #0
	bl ov74_02229F04
	mov r0, #1
	mov r1, #3
	add r2, r5, #0
	mov r3, #2
	bl ov74_0223539C
	bl _0222CD3A
_0222C3C8:
	add r0, r5, #0
	bl ov74_022353FC
	bl _0222CD3A
_0222C3D2:
	ldr r2, _0222C648 ; =ov74_0222A6C0
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222AB0C
	bl _0222CD3A
_0222C3E0:
	ldr r2, _0222C64C ; =ov74_0222A5AC
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222AB0C
	bl _0222CD3A
_0222C3EE:
	ldr r2, _0222C650 ; =ov74_0222A2A4
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222AB0C
	bl _0222CD3A
_0222C3FC:
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222AC1C
	bl _0222CD3A
_0222C408:
	add r0, r4, #0
	bl ov74_0222CEE0
	ldr r0, _0222C654 ; =ov74_0223D0A8
	ldr r0, [r0, #0x10]
	cmp r0, #0x2d
	bne _0222C4A0
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	add r0, r6, #0
	bl ov74_0222A078
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x8c
	bl ov74_0222FD98
	add r1, r4, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	bne _0222C44C
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	mov r0, #0x31
	str r0, [r5]
	b _0222C4A0
_0222C44C:
	add r0, r4, #0
	add r0, #0x58
	bl WindowIsInUse
	cmp r0, #0
	bne _0222C47A
	mov r0, #2
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x71
	add r1, r4, #0
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x58
	mov r3, #3
	bl AddWindowParameterized
_0222C47A:
	bl ov74_02236988
	add r1, r4, #0
	add r2, r0, #0
	add r0, r6, #0
	add r1, #0x58
	bl ov74_0222AAAC
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #4
	bl ov74_0222AA18
	add r0, r6, #0
	bl ov74_0222A43C
	mov r0, #0x1f
	str r0, [r5]
_0222C4A0:
	ldr r0, _0222C654 ; =ov74_0223D0A8
	ldr r0, [r0, #0x10]
	sub r0, #0x2e
	cmp r0, #1
	bls _0222C4AE
	bl _0222CD3A
_0222C4AE:
	bl ov74_0222CEC0
	mov r0, #0x11
	str r0, [r5]
	bl _0222CD3A
_0222C4BA:
	ldr r2, _0222C658 ; =ov74_0222A538
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222AB0C
	add r0, r4, #0
	bl ov74_0222CEE0
	bl _0222CD3A
_0222C4CE:
	add r0, r6, #0
	bl ov74_0222A078
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229E28
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229F28
	add r0, r7, #0
	bl ov74_0222A0E4
	cmp r0, #1
	bne _0222C53A
	add r0, r6, #0
	bl ov74_0222A174
	ldr r0, _0222C65C ; =0x000029F4
	mov r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	sub r1, r1, #2
	bl ov74_02229F28
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ov74_02229F60
	ldr r1, _0222C660 ; =0x000030A4
	mov r0, #0x54
	bl AllocFromHeap
	ldr r2, _0222C660 ; =0x000030A4
	mov r1, #0
	add r6, r0, #0
	bl memset
	ldr r0, _0222C65C ; =0x000029F4
	add r1, r4, r0
	ldr r0, _0222C664 ; =0x000030A0
	str r1, [r6, r0]
	bl ov74_02235708
	str r0, [r6, #0xc]
	ldr r0, _0222C668 ; =ov74_0222C04C
	add r1, r6, #0
	mov r2, #5
	bl CreateSysTask
	b _0222C548
_0222C53A:
	ldr r0, [r4]
	add r1, r7, #0
	bl ov74_02235DC4
	add r0, r6, #0
	bl ov74_0222A174
_0222C548:
	mov r0, #0x22
	str r0, [r5]
	b _0222CD3A
_0222C54E:
	ldr r0, _0222C65C ; =0x000029F4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222C5DC
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #8
	mov r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	b _0222CD3A
_0222C570:
	bl ov74_0223615C
	add r7, r0, #0
	cmp r7, #4
	bne _0222C57E
	bl ov74_02236128
_0222C57E:
	cmp r7, #2
	bne _0222C5D8
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov74_02229F28
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0
	bl ov74_02229F78
	ldr r0, [r4]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r6, r4, #0
	add r6, #0xdc
	add r0, r6, #0
	bl ov74_0222A0E4
	cmp r0, #1
	bne _0222C5CC
	ldr r0, [r4]
	add r1, r6, #0
	bl ov74_02235DC4
	ldr r0, _0222C65C ; =0x000029F4
	mov r1, #2
	str r1, [r4, r0]
	b _0222C5D2
_0222C5CC:
	ldr r0, _0222C66C ; =SEQ_SE_DP_UG_020
	bl PlaySE
_0222C5D2:
	mov r0, #0x23
	str r0, [r5]
	b _0222CD3A
_0222C5D8:
	cmp r7, #3
	beq _0222C5DE
_0222C5DC:
	b _0222CD3A
_0222C5DE:
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov74_02229F28
	add r0, r4, #0
	add r0, #0xda
	ldrb r1, [r0]
	mov r0, #4
	mov r2, #0x1b
	bic r1, r0
	add r0, r4, #0
	add r0, #0xda
	strb r1, [r0]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C612:
	add r0, r4, #0
	bl ov74_0222CEE0
	ldr r0, _0222C654 ; =ov74_0223D0A8
	ldr r1, [r0, #0x10]
	add r0, r1, #0
	sub r0, #0x2d
	cmp r0, #2
	bhi _0222C704
	cmp r1, #0x2f
	bne _0222C62C
	bl ov74_0222CEC0
_0222C62C:
	add r0, r6, #0
	bl ov74_0222A494
	str r0, [r5]
	b _0222CD3A
_0222C636:
	add r0, r4, #0
	bl ov74_02229D6C
	ldr r1, _0222C670 ; =0x00000438
	b _0222C674
	.balign 4, 0
_0222C640: .word 0x000005C8
_0222C644: .word 0x000015D8
_0222C648: .word ov74_0222A6C0
_0222C64C: .word ov74_0222A5AC
_0222C650: .word ov74_0222A2A4
_0222C654: .word ov74_0223D0A8
_0222C658: .word ov74_0222A538
_0222C65C: .word 0x000029F4
_0222C660: .word 0x000030A4
_0222C664: .word 0x000030A0
_0222C668: .word ov74_0222C04C
_0222C66C: .word SEQ_SE_DP_UG_020
_0222C670: .word 0x00000438
_0222C674:
	str r0, [r4, r1]
	mov r0, #0
	ldr r1, [r4, r1]
	mvn r0, r0
	cmp r1, r0
	beq _0222C6EC
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x8c
	bl ov74_0222FD98
	add r1, r4, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x58
	bl WindowIsInUse
	cmp r0, #0
	bne _0222C6C6
	mov r0, #2
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x71
	add r1, r4, #0
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x58
	mov r3, #3
	bl AddWindowParameterized
_0222C6C6:
	add r1, r4, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x58
	add r2, #0x8c
	bl ov74_0222AAAC
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #4
	bl ov74_0222AA18
	add r0, r6, #0
	mov r1, #0
	bl ov74_0222A240
	mov r0, #8
	str r0, [r5]
_0222C6EC:
	ldr r0, _0222CA14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	bne _0222C706
	ldr r0, _0222CA18 ; =0x00000434
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222C706
_0222C704:
	b _0222CD3A
_0222C706:
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	bl ov74_02229DF8
	bl sub_0203A914
	mov r0, #0x11
	str r0, [r5]
	b _0222CD3A
_0222C71C:
	ldr r2, _0222CA1C ; =ov74_0222A494
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222AB0C
	b _0222CD3A
_0222C728:
	bl sub_0203769C
	add r7, r0, #0
	beq _0222C780
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _0222C780
	mov r0, #0xab
	bl sub_02037B38
	cmp r0, #1
	bne _0222C7B0
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #7
	bl ov74_0222AA18
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229F28
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229E28
	mov r1, #0x96
	ldr r0, _0222CA18 ; =0x00000434
	lsl r1, r1, #2
	str r1, [r4, r0]
	mov r0, #0xa
	str r0, [r5]
	b _0222C7B0
_0222C780:
	cmp r7, #0
	beq _0222C7B0
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	bne _0222C7B0
	bl ov74_02229DF8
	bl sub_0203A914
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov74_02229F28
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	mov r0, #0x10
	str r0, [r5]
	b _0222CD3A
_0222C7B0:
	ldr r0, _0222CA14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	bne _0222C7C8
	ldr r0, _0222CA18 ; =0x00000434
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222C8B8
_0222C7C8:
	bl ov74_02229DF8
	bl sub_0203A914
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov74_02229F28
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	mov r0, #0x11
	str r0, [r5]
	b _0222CD3A
_0222C7E8:
	bl ov74_02229DBC
	cmp r0, #0
	beq _0222C7F4
	mov r0, #0xb
	str r0, [r5]
_0222C7F4:
	bl sub_0203769C
	ldr r1, _0222CA14 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #2
	tst r1, r2
	bne _0222C820
	ldr r1, _0222CA18 ; =0x00000434
	ldr r2, [r4, r1]
	sub r2, r2, #1
	str r2, [r4, r1]
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0222C820
	cmp r0, #0
	beq _0222C8B8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	bne _0222C8B8
_0222C820:
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	bl ov74_02229DF8
	bl sub_0203A914
	mov r0, #0x11
	str r0, [r5]
	b _0222CD3A
_0222C836:
	add r0, r6, #0
	bl ov74_0222A078
	add r1, r0, #0
	ldr r0, [r4]
	bl ov74_02235DC4
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	add r0, r6, #0
	bl ov74_0222A174
	mov r0, #0xc
	str r0, [r5]
	b _0222CD3A
_0222C858:
	bl sub_0203769C
	cmp r0, #0
	beq _0222C896
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	bne _0222C896
	bl ov74_02229DF8
	ldr r0, _0222CA20 ; =0x000029EC
	mov r1, #1
	str r1, [r4, r0]
	bl ov74_02236140
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	bl sub_0203A914
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov74_02229F28
	mov r0, #0xe
	str r0, [r5]
	b _0222CD3A
_0222C896:
	bl ov74_0223615C
	cmp r0, #4
	bne _0222C8B0
	mov r0, #0x93
	bl sub_02037AC0
	mov r0, #0xd
	str r0, [r5]
	ldr r0, _0222CA24 ; =0x0000043C
	mov r1, #0x78
	str r1, [r4, r0]
	b _0222CD3A
_0222C8B0:
	bl ov74_0223615C
	cmp r0, #3
	beq _0222C8BA
_0222C8B8:
	b _0222CD3A
_0222C8BA:
	bl ov74_02236140
	add r0, r4, #0
	add r0, #0xda
	ldrb r1, [r0]
	mov r0, #4
	bic r1, r0
	add r0, r4, #0
	add r0, #0xda
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #0x1b
	mov r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C8E8:
	mov r0, #0x93
	bl sub_02037B38
	cmp r0, #1
	bne _0222C902
	bl ov74_02236128
	ldr r0, _0222CA24 ; =0x0000043C
	mov r1, #0xa
	str r1, [r4, r0]
	mov r0, #0xf
	str r0, [r5]
	b _0222CD3A
_0222C902:
	ldr r0, _0222CA24 ; =0x0000043C
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CA0C
	bl ov74_02236140
	add r0, r4, #0
	add r0, #0xda
	ldrb r1, [r0]
	mov r0, #4
	bic r1, r0
	add r0, r4, #0
	add r0, #0xda
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #0x1b
	mov r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C93E:
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ov74_02229F60
	add r0, r4, #0
	add r0, #0xda
	ldrb r1, [r0]
	mov r0, #4
	mov r2, #0x1d
	bic r1, r0
	add r0, r4, #0
	add r0, #0xda
	strb r1, [r0]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C96A:
	ldr r0, _0222CA24 ; =0x0000043C
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CA0C
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	bl ov74_02229DF8
	bl sub_0203A914
	ldr r0, _0222CA28 ; =SEQ_SE_DP_UG_020
	bl PlaySE
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov74_02229F28
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #8
	mov r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222C9AA:
	ldr r0, _0222CA2C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #0x19
	bl ov74_0222AA18
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ov74_02229F60
	mov r0, #0x12
	str r0, [r5]
	b _0222CD3A
_0222C9CC:
	ldr r0, _0222CA30 ; =0x000015DC
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222C9DA
	sub r1, r1, #1
	str r1, [r4, r0]
	b _0222CD3A
_0222C9DA:
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	ldr r0, _0222CA2C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #0x18
	bl ov74_0222AA18
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ov74_02229F60
	mov r0, #0x12
	str r0, [r5]
	b _0222CD3A
_0222CA04:
	ldr r0, _0222CA14 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _0222CA0E
_0222CA0C:
	b _0222CD3A
_0222CA0E:
	ldr r0, _0222CA2C ; =SEQ_SE_DP_SELECT
	b _0222CA34
	nop
_0222CA14: .word gSystem
_0222CA18: .word 0x00000434
_0222CA1C: .word ov74_0222A494
_0222CA20: .word 0x000029EC
_0222CA24: .word 0x0000043C
_0222CA28: .word SEQ_SE_DP_UG_020
_0222CA2C: .word SEQ_SE_DP_SELECT
_0222CA30: .word 0x000015DC
_0222CA34:
	bl PlaySE
	add r0, r6, #0
	mov r1, #0xc4
	mov r2, #0
	bl ov74_0222A94C
	mov r0, #3
	str r0, [r5]
	b _0222CD3A
_0222CA48:
	ldr r0, _0222CD54 ; =0x000015DC
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222CA56
	sub r1, r1, #1
	str r1, [r4, r0]
	b _0222CD3A
_0222CA56:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r0, #0x1b
	beq _0222CA6C
	add r0, r4, #0
	mov r1, #0xea
	add r0, #0x8c
	lsl r1, r1, #2
	bl ov74_02235258
_0222CA6C:
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x8c
	bl ov74_0222FD98
	add r1, r4, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	bne _0222CA94
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	mov r0, #0x31
	str r0, [r5]
	b _0222CD3A
_0222CA94:
	add r0, r4, #0
	add r0, #0x58
	bl WindowIsInUse
	cmp r0, #0
	bne _0222CAC2
	mov r0, #2
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x71
	add r1, r4, #0
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x58
	mov r3, #3
	bl AddWindowParameterized
_0222CAC2:
	add r1, r4, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x58
	add r2, #0x8c
	bl ov74_0222AAAC
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #4
	bl ov74_0222AA18
	add r0, r6, #0
	mov r1, #0
	bl ov74_0222A240
	mov r0, #0x14
	str r0, [r5]
	b _0222CD3A
_0222CAEA:
	ldr r2, _0222CD58 ; =ov74_0222A494
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222AB0C
	b _0222CD3A
_0222CAF6:
	mov r0, #0x16
	str r0, [r5]
	b _0222CD3A
_0222CAFC:
	add r0, r6, #0
	bl ov74_0222A078
	add r1, r0, #0
	ldr r0, [r4]
	bl ov74_02235DC4
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #7
	bl ov74_0222AA18
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229F28
	add r0, r4, #0
	mov r1, #1
	bl ov74_02229E28
	ldr r0, _0222CD5C ; =0x0000043C
	mov r1, #0x3c
	str r1, [r4, r0]
	mov r0, #0x17
	str r0, [r5]
	b _0222CD3A
_0222CB32:
	ldr r0, _0222CD5C ; =0x0000043C
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CC18
	add r0, r6, #0
	bl ov74_0222A174
	mov r0, #0x18
	str r0, [r5]
	b _0222CD3A
_0222CB4C:
	bl ov74_0223615C
	cmp r0, #4
	bne _0222CB58
	bl ov74_02236128
_0222CB58:
	bl ov74_0223615C
	cmp r0, #2
	bne _0222CB90
	ldr r0, _0222CD5C ; =0x0000043C
	mov r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0
	bl ov74_02229E28
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov74_02229F28
	ldr r0, _0222CD60 ; =SEQ_SE_DP_UG_020
	bl PlaySE
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r2, #8
	mov r3, #0x19
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222CB90:
	bl ov74_0223615C
	cmp r0, #3
	bne _0222CC18
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov74_02229F28
	add r0, r4, #0
	add r0, #0xda
	ldrb r1, [r0]
	mov r0, #4
	mov r2, #0x1b
	bic r1, r0
	add r0, r4, #0
	add r0, #0xda
	strb r1, [r0]
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	mov r3, #0x38
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222CBC4:
	ldr r0, _0222CD5C ; =0x0000043C
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0222CC18
	mov r1, #1
	lsl r1, r1, #0x10
	str r1, [r4, r0]
	mov r0, #0x38
	str r0, [r5]
	b _0222CD3A
_0222CBDE:
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #5
	beq _0222CBEE
	add r0, r4, #0
	bl ov74_0222AE3C
_0222CBEE:
	add r0, r6, #0
	bl ov74_0222AD6C
	str r0, [r5]
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl ov74_02229F60
	b _0222CD3A
_0222CC02:
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl ov74_0222ADBC
	str r0, [r5]
	b _0222CD3A
_0222CC10:
	ldr r0, _0222CD64 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _0222CC1A
_0222CC18:
	b _0222CD3A
_0222CC1A:
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ov74_02229F60
	add r0, r6, #0
	bl ov74_0222A5AC
	str r0, [r5]
	b _0222CD3A
_0222CC2E:
	add r0, r6, #0
	mov r1, #1
	bl ov74_0222A240
	mov r0, #8
	str r0, [r5]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x80
	str r1, [r0]
	b _0222CD3A
_0222CC44:
	add r0, r6, #0
	bl ov74_02229E68
	mov r0, #0x11
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0222CC58:
	add r0, r6, #0
	bl ov74_02229E68
	mov r1, #0x11
	mov r0, #1
	lsl r1, r1, #6
	add sp, #0x14
	str r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_0222CC6A:
	add r0, r6, #0
	bl ov74_02229E68
	mov r0, #0x11
	mov r1, #2
	lsl r0, r0, #6
	str r1, [r4, r0]
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0222CC7E:
	ldr r0, _0222CD64 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _0222CD3A
	ldr r0, _0222CD68 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r4, #0
	add r0, #0xda
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222CCAA
	ldr r2, _0222CD6C ; =0x000015D8
	mov r0, #0
	ldr r2, [r4, r2]
	mov r1, #0x39
	mov r3, #2
	bl ov74_0223539C
	b _0222CD3A
_0222CCAA:
	mov r0, #1
	bl ov74_02235390
	ldr r2, _0222CD6C ; =0x000015D8
	mov r0, #0
	ldr r2, [r4, r2]
	mov r1, #0x3a
	mov r3, #2
	bl ov74_0223539C
	b _0222CD3A
_0222CCC0:
	ldr r0, [r4]
	bl ov74_0222A7A0
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	add r0, #0xda
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222CD08
	add r0, r4, #0
	add r0, #0xdc
	ldrh r0, [r0]
	cmp r0, #3
	bne _0222CD08
	add r0, r4, #0
	add r0, #0xe0
	ldr r1, [r0]
	ldr r0, _0222CD70 ; =0x00000215
	cmp r1, r0
	bne _0222CD08
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0xdc
	mov r2, #0x54
	bl ov74_0222FC50
	b _0222CD14
_0222CD08:
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0xdc
	mov r2, #0x54
	bl ov74_0222EC08
_0222CD14:
	ldr r2, _0222CD6C ; =0x000015D8
	mov r0, #1
	ldr r2, [r4, r2]
	mov r1, #0x38
	mov r3, #2
	bl ov74_0223539C
	add r0, r4, #0
	add r0, #0xda
	ldrb r1, [r0]
	mov r0, #4
	bic r1, r0
	add r0, r4, #0
	add r0, #0xda
	strb r1, [r0]
	b _0222CD3A
_0222CD34:
	mov r0, #0
	bl OS_ResetSystem
_0222CD3A:
	ldr r0, _0222CD74 ; =0x000029E8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222CD46
	add r0, r4, #0
	blx r1
_0222CD46:
	ldr r0, _0222CD78 ; =0x000029F4
	ldr r0, [r4, r0]
	bl ov74_022358C8
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222CD54: .word 0x000015DC
_0222CD58: .word ov74_0222A494
_0222CD5C: .word 0x0000043C
_0222CD60: .word SEQ_SE_DP_UG_020
_0222CD64: .word gSystem
_0222CD68: .word SEQ_SE_DP_SELECT
_0222CD6C: .word 0x000015D8
_0222CD70: .word 0x00000215
_0222CD74: .word 0x000029E8
_0222CD78: .word 0x000029F4
	thumb_func_end ov74_0222C2EC

	thumb_func_start ov74_0222CD7C
ov74_0222CD7C: ; 0x0222CD7C
	ldr r0, _0222CD84 ; =ov74_0223D0A8
	ldr r0, [r0]
	bx lr
	nop
_0222CD84: .word ov74_0223D0A8
	thumb_func_end ov74_0222CD7C

	thumb_func_start ov74_0222CD88
ov74_0222CD88: ; 0x0222CD88
	ldr r1, _0222CD90 ; =ov74_0223D0A8
	str r0, [r1]
	bx lr
	nop
_0222CD90: .word ov74_0223D0A8
	thumb_func_end ov74_0222CD88

	thumb_func_start ov74_0222CD94
ov74_0222CD94: ; 0x0222CD94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0x11
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CDB2
	ldr r0, _0222CDF8 ; =FS_OVERLAY_ID(OVY_60)
	ldr r1, _0222CDFC ; =ov60_021EAFE0
	bl RegisterMainOverlay
	b _0222CDCC
_0222CDB2:
	cmp r0, #1
	bne _0222CDC0
	ldr r0, _0222CE00 ; =FS_OVERLAY_ID(OVY_74)
	ldr r1, _0222CE04 ; =_0223B410
	bl RegisterMainOverlay
	b _0222CDCC
_0222CDC0:
	cmp r0, #2
	bne _0222CDCC
	ldr r0, _0222CE00 ; =FS_OVERLAY_ID(OVY_74)
	ldr r1, _0222CE08 ; =_0223B420
	bl RegisterMainOverlay
_0222CDCC:
	mov r0, #0x59
	bl DestroyHeap
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x54
	bl DestroyHeap
	ldr r0, _0222CE0C ; =0x000015D4
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _0222CDEC
	mov r0, #0
	bl sub_0201A4B0
_0222CDEC:
	mov r0, #0
	bl ov74_02236034
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0222CDF8: .word FS_OVERLAY_ID(OVY_60)
_0222CDFC: .word ov60_021EAFE0
_0222CE00: .word FS_OVERLAY_ID(OVY_74)
_0222CE04: .word _0223B410
_0222CE08: .word _0223B420
_0222CE0C: .word 0x000015D4
	thumb_func_end ov74_0222CD94

	thumb_func_start ov74_0222CE10
ov74_0222CE10: ; 0x0222CE10
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222CE64 ; =0x000005C8
	ldr r0, [r4, r0]
	cmp r0, #0x1c
	beq _0222CE26
	cmp r0, #0x1d
	beq _0222CE62
	cmp r0, #0x1e
	beq _0222CE3A
	pop {r4, pc}
_0222CE26:
	ldr r0, [r4, #4]
	bl sub_02038D28
	ldr r0, _0222CE68 ; =0x000005CC
	mov r1, #0x78
	str r1, [r4, r0]
	mov r1, #0x1e
	sub r0, r0, #4
	str r1, [r4, r0]
	pop {r4, pc}
_0222CE3A:
	bl sub_02038D80
	mov r1, #1
	tst r0, r1
	beq _0222CE4A
	mov r0, #0x5d
	lsl r0, r0, #4
	str r1, [r4, r0]
_0222CE4A:
	ldr r0, _0222CE68 ; =0x000005CC
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222CE62
	bl sub_02038D64
	ldr r0, _0222CE64 ; =0x000005C8
	mov r1, #0x1d
	str r1, [r4, r0]
_0222CE62:
	pop {r4, pc}
	.balign 4, 0
_0222CE64: .word 0x000005C8
_0222CE68: .word 0x000005CC
	thumb_func_end ov74_0222CE10

	thumb_func_start ov74_0222CE6C
ov74_0222CE6C: ; 0x0222CE6C
	cmp r0, #4
	bhi _0222CEB8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CE7C: ; jump table
	.short _0222CE86 - _0222CE7C - 2 ; case 0
	.short _0222CE8E - _0222CE7C - 2 ; case 1
	.short _0222CE96 - _0222CE7C - 2 ; case 2
	.short _0222CE9E - _0222CE7C - 2 ; case 3
	.short _0222CEB2 - _0222CE7C - 2 ; case 4
_0222CE86:
	ldr r0, _0222CEBC ; =ov74_0223D0A8
	mov r1, #0x28
	str r1, [r0, #0x10]
	bx lr
_0222CE8E:
	ldr r0, _0222CEBC ; =ov74_0223D0A8
	mov r1, #0x29
	str r1, [r0, #0x10]
	bx lr
_0222CE96:
	ldr r0, _0222CEBC ; =ov74_0223D0A8
	mov r1, #0x2a
	str r1, [r0, #0x10]
	bx lr
_0222CE9E:
	ldr r0, _0222CEBC ; =ov74_0223D0A8
	ldr r1, [r0, #0x10]
	cmp r1, #0x2a
	bne _0222CEAC
	mov r1, #0x2c
	str r1, [r0, #0x10]
	bx lr
_0222CEAC:
	mov r1, #0x2f
	str r1, [r0, #0x10]
	bx lr
_0222CEB2:
	ldr r0, _0222CEBC ; =ov74_0223D0A8
	mov r1, #0x30
	str r1, [r0, #0x10]
_0222CEB8:
	bx lr
	nop
_0222CEBC: .word ov74_0223D0A8
	thumb_func_end ov74_0222CE6C

	thumb_func_start ov74_0222CEC0
ov74_0222CEC0: ; 0x0222CEC0
	push {r3, lr}
	bl sub_02034DE0
	ldr r0, _0222CEDC ; =ov74_0223D0A8
	ldr r0, [r0, #4]
	bl FreeToHeap
	bl sub_0203A914
	ldr r0, _0222CEDC ; =ov74_0223D0A8
	mov r1, #0
	str r1, [r0, #4]
	pop {r3, pc}
	nop
_0222CEDC: .word ov74_0223D0A8
	thumb_func_end ov74_0222CEC0

	thumb_func_start ov74_0222CEE0
ov74_0222CEE0: ; 0x0222CEE0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	ldr r0, [r0, #0x10]
	cmp r0, #0x2c
	bne _0222CF06
	bl ov74_0222CEC0
	bl ov74_022368D4
	cmp r0, #0
	beq _0222CF00
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	mov r1, #0x2d
	str r1, [r0, #0x10]
	b _0222CF06
_0222CF00:
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	mov r1, #0x2e
	str r1, [r0, #0x10]
_0222CF06:
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	ldr r0, [r0, #0x10]
	cmp r0, #0x25
	beq _0222CF22
	cmp r0, #0x26
	beq _0222CF22
	cmp r0, #0x27
	beq _0222CF22
	cmp r0, #0x28
	beq _0222CF22
	cmp r0, #0x29
	beq _0222CF22
	cmp r0, #0x2b
	bne _0222CF2E
_0222CF22:
	bl WM_GetLinkLevel
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
_0222CF2E:
	ldr r1, _0222CFEC ; =ov74_0223D0A8
	ldr r0, [r1, #0x10]
	sub r0, #0x25
	cmp r0, #0xb
	bhi _0222CFA8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CF44: ; jump table
	.short _0222CF5C - _0222CF44 - 2 ; case 0
	.short _0222CF68 - _0222CF44 - 2 ; case 1
	.short _0222CFA8 - _0222CF44 - 2 ; case 2
	.short _0222CFA8 - _0222CF44 - 2 ; case 3
	.short _0222CF9E - _0222CF44 - 2 ; case 4
	.short _0222CFA8 - _0222CF44 - 2 ; case 5
	.short _0222CFA8 - _0222CF44 - 2 ; case 6
	.short _0222CFA8 - _0222CF44 - 2 ; case 7
	.short _0222CFA8 - _0222CF44 - 2 ; case 8
	.short _0222CFA8 - _0222CF44 - 2 ; case 9
	.short _0222CFA6 - _0222CF44 - 2 ; case 10
	.short _0222CFA8 - _0222CF44 - 2 ; case 11
_0222CF5C:
	bl sub_02034D8C
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	mov r1, #0x26
	str r1, [r0, #0x10]
	b _0222CFA8
_0222CF68:
	bl sub_02034DB8
	cmp r0, #1
	bne _0222CFA8
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	mov r1, #0
	str r1, [r0, #0xc]
	bl ov74_02236980
	add r1, r0, #0
	mov r0, #0x54
	bl AllocFromHeap
	add r2, r0, #0
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	ldr r1, _0222CFF0 ; =ov74_0222CE6C
	str r2, [r0, #4]
	ldr r0, _0222CFF4 ; =0x000005D4
	add r0, r4, r0
	bl ov74_02236680
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	mov r1, #0x27
	str r1, [r0, #0x10]
	bl sub_0203A880
	b _0222CFA8
_0222CF9E:
	ldr r0, [r1, #0xc]
	add r0, r0, #1
	str r0, [r1, #0xc]
	b _0222CFA8
_0222CFA6:
	pop {r4, pc}
_0222CFA8:
	ldr r0, _0222CFF8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0222CFE8
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	ldr r0, [r0, #0x10]
	sub r0, #0x28
	cmp r0, #8
	bhi _0222CFE8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CFC8: ; jump table
	.short _0222CFDA - _0222CFC8 - 2 ; case 0
	.short _0222CFDA - _0222CFC8 - 2 ; case 1
	.short _0222CFE8 - _0222CFC8 - 2 ; case 2
	.short _0222CFE8 - _0222CFC8 - 2 ; case 3
	.short _0222CFE8 - _0222CFC8 - 2 ; case 4
	.short _0222CFE8 - _0222CFC8 - 2 ; case 5
	.short _0222CFE8 - _0222CFC8 - 2 ; case 6
	.short _0222CFE8 - _0222CFC8 - 2 ; case 7
	.short _0222CFDA - _0222CFC8 - 2 ; case 8
_0222CFDA:
	bl ov74_022365FC
	cmp r0, #0
	beq _0222CFE8
	ldr r0, _0222CFEC ; =ov74_0223D0A8
	mov r1, #0x2b
	str r1, [r0, #0x10]
_0222CFE8:
	pop {r4, pc}
	nop
_0222CFEC: .word ov74_0223D0A8
_0222CFF0: .word ov74_0222CE6C
_0222CFF4: .word 0x000005D4
_0222CFF8: .word gSystem
	thumb_func_end ov74_0222CEE0

	thumb_func_start ov74_0222CFFC
ov74_0222CFFC: ; 0x0222CFFC
	push {r3, lr}
	sub sp, #8
	bl ov74_0222D024
	bl ov74_0223563C
	bl ov74_02235690
	mov r0, #0x11
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x13
	mov r2, #0x10
	mov r3, #0x12
	bl ov74_02235728
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov74_0222CFFC

	thumb_func_start ov74_0222D024
ov74_0222D024: ; 0x0222D024
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222D088 ; =0x00002DC4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D034
	bl sub_02024758
_0222D034:
	ldr r0, _0222D08C ; =0x00002DC8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D040
	bl sub_02024758
_0222D040:
	ldr r0, _0222D08C ; =0x00002DC8
	mov r1, #0
	str r1, [r4, r0]
	ldr r2, [r4, r0]
	sub r1, r0, #4
	str r2, [r4, r1]
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D058
	bl sub_02024758
_0222D058:
	ldr r0, _0222D090 ; =0x00002DD0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D064
	bl sub_02024758
_0222D064:
	ldr r0, _0222D094 ; =0x00002DD4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D070
	bl sub_02024758
_0222D070:
	ldr r1, _0222D094 ; =0x00002DD4
	mov r0, #0
	str r0, [r4, r1]
	ldr r2, [r4, r1]
	sub r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	sub r1, #8
	str r0, [r4, r1]
	bl ov74_022359BC
	pop {r4, pc}
	.balign 4, 0
_0222D088: .word 0x00002DC4
_0222D08C: .word 0x00002DC8
_0222D090: .word 0x00002DD0
_0222D094: .word 0x00002DD4
	thumb_func_end ov74_0222D024

	thumb_func_start ov74_0222D098
ov74_0222D098: ; 0x0222D098
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0222D0E0 ; =0x00003D4C
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, r1]
	mov r1, #1
	str r1, [sp]
	ldr r1, _0222D0E4 ; =0x00002DC4
	mov r2, #0x48
	ldr r1, [r4, r1]
	mov r3, #0xa8
	bl ov74_02235930
	ldr r1, _0222D0E4 ; =0x00002DC4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	bl sub_02024A04
	mov r0, #0
	ldr r1, _0222D0E8 ; =0x00002DC8
	str r0, [sp]
	ldr r1, [r4, r1]
	mov r2, #0xb8
	mov r3, #0xa8
	bl ov74_02235930
	ldr r1, _0222D0E8 ; =0x00002DC8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	bl sub_02024A04
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0222D0E0: .word 0x00003D4C
_0222D0E4: .word 0x00002DC4
_0222D0E8: .word 0x00002DC8
	thumb_func_end ov74_0222D098

	thumb_func_start ov74_0222D0EC
ov74_0222D0EC: ; 0x0222D0EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _0222D102
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0200E5D4
_0222D102:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222D0EC

	thumb_func_start ov74_0222D104
ov74_0222D104: ; 0x0222D104
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _0222D11A
	add r0, r5, #0
	add r1, r4, #0
	bl ClearFrameAndWindow2
_0222D11A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222D104

	thumb_func_start ov74_0222D11C
ov74_0222D11C: ; 0x0222D11C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, _0222D1C4 ; =0x00002BCC
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r7, r2, #0
	str r3, [sp]
	cmp r0, #0
	beq _0222D134
	bl ListMenuItems_dtor
_0222D134:
	ldr r0, _0222D1C8 ; =0x00002BC8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222D144
	mov r1, #0
	add r2, r1, #0
	bl DestroyListMenu
_0222D144:
	add r0, r7, #0
	mov r1, #0x55
	bl ListMenuItems_ctor
	ldr r1, _0222D1C4 ; =0x00002BCC
	mov r2, #0xf7
	str r0, [r5, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x55
	bl NewMsgDataFromNarc
	ldr r1, _0222D1CC ; =0x00002A04
	mov r6, #0
	str r0, [r5, r1]
	cmp r7, #0
	ble _0222D17E
_0222D166:
	ldr r0, _0222D1C4 ; =0x00002BCC
	ldr r1, _0222D1CC ; =0x00002A04
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl ListMenuItems_AppendFromMsgData
	add r6, r6, #1
	add r4, #8
	cmp r6, r7
	blt _0222D166
_0222D17E:
	ldr r0, _0222D1CC ; =0x00002A04
	ldr r0, [r5, r0]
	bl DestroyMsgData
	ldr r4, _0222D1D0 ; =ov74_0223C320
	add r3, sp, #4
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, _0222D1C4 ; =0x00002BCC
	mov r1, #0
	ldr r0, [r5, r0]
	mov r3, #0x55
	str r0, [sp, #4]
	add r0, sp, #4
	strh r7, [r0, #0x10]
	ldr r0, [sp]
	str r0, [sp, #0x10]
	add r0, r2, #0
	ldr r2, [sp, #0x38]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl ListMenuInit
	ldr r1, _0222D1C8 ; =0x00002BC8
	str r0, [r5, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222D1C4: .word 0x00002BCC
_0222D1C8: .word 0x00002BC8
_0222D1CC: .word 0x00002A04
_0222D1D0: .word ov74_0223C320
	thumb_func_end ov74_0222D11C

	thumb_func_start ov74_0222D1D4
ov74_0222D1D4: ; 0x0222D1D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x55
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r0, #0x55
	bl ScrStrBufs_new
	add r6, r0, #0
	mov r0, #1
	mov r1, #6
	bl GetFontAttribute
	add r1, r0, #0
	add r0, r5, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	mov r3, #0x55
	bl ReadMsgData_ExpandPlaceholders
	add r7, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222D244 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r7, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl CopyWindowToVram
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	bl DestroyMsgData
	add r0, r6, #0
	bl ScrStrBufs_delete
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222D244: .word 0x00010200
	thumb_func_end ov74_0222D1D4

	thumb_func_start ov74_0222D248
ov74_0222D248: ; 0x0222D248
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x55
	mov r1, #0xf
	str r0, [sp, #4]
	mov r0, #0x71
	mov r2, #0
	lsl r3, r1, #5
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x55
	mov r3, #6
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x14
	mov r2, #0
	lsl r3, r3, #6
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x55
	str r0, [sp, #0xc]
	mov r0, #0x71
	mov r1, #0x15
	add r2, r4, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x55
	str r0, [sp, #0xc]
	mov r0, #0x71
	mov r1, #0x16
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #0xc
	mov r2, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r4, #0
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov74_0222D248

	thumb_func_start ov74_0222D2D4
ov74_0222D2D4: ; 0x0222D2D4
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov74_0222D448
	ldr r0, _0222D300 ; =0x00002BD0
	mov r1, #0x2f
	add r0, r4, r0
	bl ov74_0222D1D4
	ldr r3, _0222D304 ; =0x00002BE0
	add r0, r4, #0
	add r1, r4, r3
	add r3, #0x10
	ldr r3, [r4, r3]
	mov r2, #0xa
	bl ov74_0222D9E0
	mov r0, #0xe
	pop {r4, pc}
	nop
_0222D300: .word 0x00002BD0
_0222D304: .word 0x00002BE0
	thumb_func_end ov74_0222D2D4

	thumb_func_start ov74_0222D308
ov74_0222D308: ; 0x0222D308
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov74_0222D448
	ldr r1, _0222D34C ; =0x00002BA0
	ldr r0, [r4, r1]
	add r1, #0x20
	ldr r1, [r4, r1]
	bl sub_0202DEF8
	cmp r0, #1
	ldr r0, _0222D350 ; =0x00002BD0
	bne _0222D330
	add r0, r4, r0
	mov r1, #0x3f
	bl ov74_0222D1D4
	b _0222D338
_0222D330:
	add r0, r4, r0
	mov r1, #0x3e
	bl ov74_0222D1D4
_0222D338:
	ldr r3, _0222D354 ; =0x00002BE0
	add r0, r4, #0
	add r1, r4, r3
	add r3, #0x10
	ldr r3, [r4, r3]
	mov r2, #9
	bl ov74_0222D9E0
	mov r0, #0xc
	pop {r4, pc}
	.balign 4, 0
_0222D34C: .word 0x00002BA0
_0222D350: .word 0x00002BD0
_0222D354: .word 0x00002BE0
	thumb_func_end ov74_0222D308

	thumb_func_start ov74_0222D358
ov74_0222D358: ; 0x0222D358
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov74_0222D448
	ldr r0, _0222D400 ; =0x00002BD0
	mov r1, #0x40
	add r0, r4, r0
	bl ov74_0222D1D4
	ldr r0, _0222D400 ; =0x00002BD0
	mov r1, #0x13
	add r0, r4, r0
	bl sub_0200F0AC
	ldr r1, _0222D404 ; =0x00003D50
	str r0, [r4, r1]
	ldr r1, _0222D408 ; =0x00002BA0
	ldr r0, [r4, r1]
	add r1, #0x20
	ldr r1, [r4, r1]
	bl sub_0202DEF8
	cmp r0, #1
	ldr r1, _0222D408 ; =0x00002BA0
	bne _0222D39A
	ldr r0, [r4, r1]
	add r1, #0x20
	ldr r1, [r4, r1]
	bl sub_0202DDB0
	b _0222D3A4
_0222D39A:
	ldr r0, [r4, r1]
	add r1, #0x20
	ldr r1, [r4, r1]
	bl sub_0202DDEC
_0222D3A4:
	ldr r0, _0222D40C ; =0x00002BA4
	ldr r0, [r4, r0]
	bl SaveGameNormal
	ldr r0, _0222D404 ; =0x00003D50
	ldr r0, [r4, r0]
	bl sub_0200F450
	ldr r0, _0222D408 ; =0x00002BA0
	ldr r0, [r4, r0]
	bl sub_0202DED8
	cmp r0, #0
	bne _0222D3C4
	mov r0, #0x1b
	pop {r4, pc}
_0222D3C4:
	mov r1, #0xaf
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	bl ov74_0222DAF8
	mov r1, #0xaf
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r1, #0x10
	add r0, r4, r1
	mov r1, #0x25
	bl ov74_0222D1D4
	ldr r3, _0222D410 ; =0x00002BE0
	add r0, r4, #0
	add r1, r4, r3
	add r3, #0x10
	ldr r3, [r4, r3]
	mov r2, #8
	bl ov74_0222D9E0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov74_0222D824
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
_0222D400: .word 0x00002BD0
_0222D404: .word 0x00003D50
_0222D408: .word 0x00002BA0
_0222D40C: .word 0x00002BA4
_0222D410: .word 0x00002BE0
	thumb_func_end ov74_0222D358

	thumb_func_start ov74_0222D414
ov74_0222D414: ; 0x0222D414
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov74_0222D448
	ldr r0, _0222D440 ; =0x00002BD0
	mov r1, #0x25
	add r0, r4, r0
	bl ov74_0222D1D4
	ldr r3, _0222D444 ; =0x00002BE0
	add r0, r4, #0
	add r1, r4, r3
	add r3, #0x10
	ldr r3, [r4, r3]
	mov r2, #8
	bl ov74_0222D9E0
	mov r0, #5
	pop {r4, pc}
	nop
_0222D440: .word 0x00002BD0
_0222D444: .word 0x00002BE0
	thumb_func_end ov74_0222D414

	thumb_func_start ov74_0222D448
ov74_0222D448: ; 0x0222D448
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222D484 ; =0x00002BCC
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	mov r1, #0
	ldr r0, _0222D484 ; =0x00002BCC
	add r2, r1, #0
	str r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyListMenu
	ldr r0, _0222D488 ; =0x00002BC8
	mov r1, #0
	str r1, [r4, r0]
	add r0, #0x18
	add r0, r4, r0
	bl ov74_0222D0EC
	ldr r0, _0222D48C ; =0x00002BE0
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222D48C ; =0x00002BE0
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
_0222D484: .word 0x00002BCC
_0222D488: .word 0x00002BC8
_0222D48C: .word 0x00002BE0
	thumb_func_end ov74_0222D448

	thumb_func_start ov74_0222D490
ov74_0222D490: ; 0x0222D490
	mov r0, #1
	bx lr
	thumb_func_end ov74_0222D490

	thumb_func_start ov74_0222D494
ov74_0222D494: ; 0x0222D494
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r1, #0
	ldr r1, [r5]
	mov r0, #0x25
	add r4, r2, #0
	bl String_ctor
	mov r1, #0xaf
	lsl r1, r1, #6
	ldr r2, [r5, r1]
	sub r1, #0xc
	lsl r2, r2, #2
	add r2, r5, r2
	ldr r2, [r2, r1]
	mov r1, #0x41
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #0x24
	add r6, r0, #0
	bl CopyU16ArrayToStringN
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222D494

	thumb_func_start ov74_0222D4E4
ov74_0222D4E4: ; 0x0222D4E4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #6
	add r6, r1, #0
	ldr r1, [r4, r0]
	add r5, r2, #0
	lsl r2, r1, #2
	add r3, r4, r2
	add r2, r0, #0
	sub r2, #0xc
	ldr r3, [r3, r2]
	ldr r2, _0222D558 ; =0x00000152
	ldrb r2, [r3, r2]
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1f
	bne _0222D50C
	mov r2, #0x28
	b _0222D522
_0222D50C:
	sub r0, #0x20
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222D51C
	bl sub_0202DEF8
	cmp r0, #1
	bne _0222D520
_0222D51C:
	mov r2, #0x26
	b _0222D522
_0222D520:
	mov r2, #0x27
_0222D522:
	mov r1, #0x2a
	lsl r1, r1, #8
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r3, [r4]
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r5, [sp, #8]
	add r0, r6, #0
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0222D558: .word 0x00000152
	thumb_func_end ov74_0222D4E4

	thumb_func_start ov74_0222D55C
ov74_0222D55C: ; 0x0222D55C
	push {r4, lr}
	sub sp, #0x18
	mov r1, #0xaf
	add r4, r0, #0
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	sub r1, #0xc
	lsl r2, r2, #2
	add r2, r4, r2
	ldr r2, [r2, r1]
	mov r1, #0xd5
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, sp, #8
	bl RTC_ConvertDayToDate
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x2a
	lsl r0, r0, #8
	mov r2, #0x7d
	ldr r3, [sp, #8]
	lsl r2, r2, #4
	add r2, r3, r2
	ldr r0, [r4, r0]
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	ldr r2, [sp, #0xc]
	mov r1, #1
	bl BufferMonthNameAbbr
	mov r1, #2
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x10]
	add r3, r1, #0
	bl BufferIntegerAsString
	mov r0, #1
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov74_0222D55C

	thumb_func_start ov74_0222D5C4
ov74_0222D5C4: ; 0x0222D5C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0xfb
	mov r1, #0x55
	add r4, r2, #0
	bl String_ctor
	mov r1, #0xaf
	lsl r1, r1, #6
	ldr r2, [r5, r1]
	sub r1, #0xc
	lsl r2, r2, #2
	add r2, r5, r2
	ldr r2, [r2, r1]
	mov r1, #0x55
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #0xfa
	add r6, r0, #0
	bl CopyU16ArrayToStringN
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222D5C4

	thumb_func_start ov74_0222D614
ov74_0222D614: ; 0x0222D614
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r3, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #6
	add r6, r1, #0
	ldr r1, [r3, r0]
	sub r0, #0xc
	lsl r1, r1, #2
	add r1, r3, r1
	ldr r1, [r1, r0]
	mov r0, #0xd2
	lsl r0, r0, #2
	add r5, r2, #0
	ldrb r2, [r1, r0]
	cmp r2, #0xff
	bne _0222D66C
	mov r1, #0x2a
	lsl r1, r1, #8
	ldr r0, [r3, r1]
	add r1, r1, #4
	ldr r1, [r3, r1]
	mov r2, #0x34
	mov r3, #0x55
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r5, [sp, #8]
	add r0, r6, #0
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222D66C:
	cmp r2, #0
	beq _0222D68A
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r3, r0]
	mov r3, #3
	bl BufferIntegerAsString
	add sp, #0x10
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222D68A:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_0222D614

	thumb_func_start ov74_0222D690
ov74_0222D690: ; 0x0222D690
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #0
	add r7, r1, #0
	add r1, r0, #1
	ldr r0, _0222D764 ; =ov74_0223C2D0
	ldr r2, _0222D764 ; =ov74_0223C2D0
	ldr r0, [r0, #0x30]
	ldr r2, [r2, #0x34]
	str r0, [sp, #0x14]
	mov r0, #0xaf
	lsl r0, r0, #6
	str r2, [sp, #0x18]
	ldr r2, [r5, r0]
	sub r0, #0xc
	lsl r2, r2, #2
	add r2, r5, r2
	ldr r2, [r2, r0]
	mov r0, #0xd2
	lsl r0, r0, #2
	ldrb r0, [r2, r0]
	add r4, r1, #0
	add r6, sp, #0x14
	cmp r0, #0
	beq _0222D6D6
	ldr r0, _0222D764 ; =ov74_0223C2D0
	ldr r2, _0222D764 ; =ov74_0223C2D0
	ldr r0, [r0, #0x38]
	add r4, r1, #1
	lsl r1, r1, #3
	ldr r2, [r2, #0x3c]
	add r3, r6, r1
	str r0, [r6, r1]
	str r2, [r3, #4]
_0222D6D6:
	ldr r0, _0222D764 ; =ov74_0223C2D0
	ldr r2, _0222D764 ; =ov74_0223C2D0
	ldr r0, [r0, #0x40]
	lsl r1, r4, #3
	add r6, sp, #0x14
	str r0, [r6, r1]
	ldr r2, [r2, #0x44]
	add r3, r6, r1
	add r0, r4, #1
	lsl r1, r0, #3
	str r2, [r3, #4]
	ldr r0, _0222D764 ; =ov74_0223C2D0
	ldr r2, _0222D764 ; =ov74_0223C2D0
	ldr r0, [r0, #0x48]
	ldr r2, [r2, #0x4c]
	str r0, [r6, r1]
	add r3, r6, r1
	ldr r0, _0222D768 ; =0x00002B9C
	str r2, [r3, #4]
	ldr r6, [r5, r0]
	add r0, r7, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r7, #0
	bl RemoveWindow
	add r1, r4, #2
	mov r0, #4
	sub r0, r0, r1
	ldr r1, [r6, #8]
	lsl r0, r0, #1
	add r1, r1, r0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	ldr r1, [r6, #0xc]
	mov r2, #2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	ldr r1, [r6, #0x10]
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	ldr r0, _0222D76C ; =0x00002B98
	add r1, r7, #0
	ldr r0, [r5, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222D770 ; =0x000029FC
	ldr r3, [r6, #4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #0x14
	add r2, r4, #2
	add r3, r7, #0
	bl ov74_0222D11C
	mov r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222D764: .word ov74_0223C2D0
_0222D768: .word 0x00002B9C
_0222D76C: .word 0x00002B98
_0222D770: .word 0x000029FC
	thumb_func_end ov74_0222D690

	thumb_func_start ov74_0222D774
ov74_0222D774: ; 0x0222D774
	push {r3, lr}
	add r3, r1, #0
	mov r1, #1
	str r1, [sp]
	ldr r1, _0222D788 ; =ov74_0223C2D0
	mov r2, #2
	bl ov74_0222D11C
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222D788: .word ov74_0223C2D0
	thumb_func_end ov74_0222D774

	thumb_func_start ov74_0222D78C
ov74_0222D78C: ; 0x0222D78C
	push {r3, lr}
	add r3, r1, #0
	mov r1, #0
	str r1, [sp]
	ldr r1, _0222D7A0 ; =ov74_0223C2F0
	mov r2, #2
	bl ov74_0222D11C
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222D7A0: .word ov74_0223C2F0
	thumb_func_end ov74_0222D78C

	thumb_func_start ov74_0222D7A4
ov74_0222D7A4: ; 0x0222D7A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222D7C8 ; =0x00002BD0
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #2
	bl ov74_0222D1D4
	mov r0, #0
	str r0, [sp]
	ldr r1, _0222D7CC ; =ov74_0223C2E0
	add r0, r5, #0
	mov r2, #2
	add r3, r4, #0
	bl ov74_0222D11C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222D7C8: .word 0x00002BD0
_0222D7CC: .word ov74_0223C2E0
	thumb_func_end ov74_0222D7A4

	thumb_func_start ov74_0222D7D0
ov74_0222D7D0: ; 0x0222D7D0
	push {r3, lr}
	sub sp, #8
	mov r3, #1
	str r3, [sp]
	mov r1, #0x2a
	str r3, [sp, #4]
	lsl r1, r1, #8
	ldr r0, [r0, r1]
	mov r1, #0
	add r2, r1, #0
	bl BufferIntegerAsString
	mov r0, #1
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_0222D7D0

	thumb_func_start ov74_0222D7F0
ov74_0222D7F0: ; 0x0222D7F0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x55
	str r0, [sp, #8]
	add r6, r2, #0
	mov r0, #0
	add r4, r3, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	cmp r4, #0
	beq _0222D818
	mov r0, #0x1c
	str r0, [r4]
_0222D818:
	mov r0, #0xb1
	lsl r0, r0, #6
	str r6, [r5, r0]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov74_0222D7F0

	thumb_func_start ov74_0222D824
ov74_0222D824: ; 0x0222D824
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r3, [r5]
	str r2, [sp, #0x14]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	ldr r4, _0222D9C8 ; =ov74_0223C340
	bl NewMsgDataFromNarc
	ldr r1, _0222D9CC ; =0x00002A04
	str r0, [r5, r1]
	ldr r0, [r5]
	bl ScrStrBufs_new
	mov r1, #0x2a
	lsl r1, r1, #8
	str r0, [r5, r1]
	ldr r1, _0222D9D0 ; =0x00002BC4
	ldr r0, [sp, #0x14]
	str r0, [r5, r1]
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl ov74_0222DB70
	mov r0, #0
	str r0, [sp, #0x30]
	ldr r0, _0222D9D4 ; =0x00002A08
	add r7, r4, #0
	str r5, [sp, #0x1c]
	add r6, r5, r0
_0222D864:
	ldr r1, [r7]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	beq _0222D886
	cmp r1, #2
	beq _0222D886
	ldr r1, [sp, #0x1c]
	ldr r0, _0222D9D4 ; =0x00002A08
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0222D886
	add r0, r6, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r6, #0
	bl RemoveWindow
_0222D886:
	ldr r0, [sp, #0x1c]
	add r7, #0x30
	add r0, #0x10
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x30]
	add r6, #0x10
	add r0, r0, #1
	str r0, [sp, #0x30]
	cmp r0, #0x13
	blo _0222D864
	mov r0, #0x31
	str r0, [sp, #0x2c]
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, _0222D9D4 ; =0x00002A08
	str r5, [sp, #0x24]
	str r5, [sp, #0x20]
	add r6, r5, r0
_0222D8AA:
	ldr r1, [r4]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	bne _0222D98A
	ldr r1, [sp, #0x24]
	ldr r0, _0222D9D4 ; =0x00002A08
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0222D8FA
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x20]
	ldr r0, _0222D9D8 ; =0x00002B48
	str r2, [r1, r0]
	ldr r0, [r4, #8]
	add r1, r6, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	add r0, r2, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222D9DC ; =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x18
	mov r2, #0
	lsr r3, r3, #0x18
	bl AddWindowParameterized
_0222D8FA:
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x1c]
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl GetFontAttribute
	add r1, r0, #0
	add r0, r6, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x24]
	str r0, [sp, #0x28]
	ldr r2, [sp, #0x28]
	add r0, r5, #0
	add r1, r6, #0
	blx r3
	cmp r0, #1
	bne _0222D976
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0222D976
	mov r0, #0x2a
	ldr r1, _0222D9CC ; =0x00002A04
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r5]
	bl ReadMsgData_ExpandPlaceholders
	add r7, r0, #0
	mov r0, #0
	ldr r3, [r4, #0x28]
	mvn r0, r0
	cmp r3, r0
	bne _0222D956
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x14]
	add r1, r7, #0
	mov r2, #0
	lsl r3, r3, #3
	bl FontID_String_GetCenterAlignmentX
	add r3, r0, #0
_0222D956:
	ldr r0, [r4, #0x2c]
	add r2, r7, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r4, #0x14]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
_0222D976:
	add r0, r6, #0
	bl CopyWindowToVram
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x2c]
	add r0, r0, r2
	str r0, [sp, #0x2c]
_0222D98A:
	ldr r0, [sp, #0x24]
	add r4, #0x30
	add r0, #0x10
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r6, #0x10
	add r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0x13
	blo _0222D8AA
	ldr r0, _0222D9CC ; =0x00002A04
	ldr r0, [r5, r0]
	bl DestroyMsgData
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	bl ScrStrBufs_delete
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222D9C2
	add r0, r5, #0
	bl ov74_0222DCD4
_0222D9C2:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222D9C8: .word ov74_0223C340
_0222D9CC: .word 0x00002A04
_0222D9D0: .word 0x00002BC4
_0222D9D4: .word 0x00002A08
_0222D9D8: .word 0x00002B48
_0222D9DC: .word 0x000029FC
	thumb_func_end ov74_0222D824

	thumb_func_start ov74_0222D9E0
ov74_0222D9E0: ; 0x0222D9E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r7, r3, #0
	mov r3, #0x30
	ldr r0, _0222DAE0 ; =ov74_0223C340
	mul r3, r2
	add r6, r1, #0
	add r4, r0, r3
	ldr r0, [r6]
	cmp r0, #0
	bne _0222DA2A
	ldr r0, [r4, #8]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222DAE4 ; =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
_0222DA2A:
	ldr r1, [r4, #0x1c]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0222DA58
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x55
	bl NewMsgDataFromNarc
	ldr r1, _0222DAE8 ; =0x00002A04
	str r0, [r5, r1]
	mov r0, #0x55
	bl ScrStrBufs_new
	mov r1, #0x2a
	lsl r1, r1, #8
	str r0, [r5, r1]
_0222DA58:
	ldr r0, _0222DAEC ; =0x00002B98
	ldr r2, _0222DAF0 ; =0x00010200
	str r7, [r5, r0]
	add r0, r0, #4
	str r4, [r5, r0]
	ldr r3, [r4, #0x24]
	add r0, r5, #0
	add r1, r6, #0
	blx r3
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0222DAB2
	mov r1, #0x2a
	lsl r1, r1, #8
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r3, #0x55
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0x14]
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	ldr r2, [sp, #0x14]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r4, #0x14]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
	ldr r0, _0222DAE8 ; =0x00002A04
	ldr r0, [r5, r0]
	bl DestroyMsgData
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	bl ScrStrBufs_delete
_0222DAB2:
	ldr r0, _0222DAF4 ; =0x00002BD0
	add r0, r5, r0
	cmp r6, r0
	bne _0222DAC8
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x13
	mov r3, #0xa
	bl DrawFrameAndWindow2
	b _0222DAD4
_0222DAC8:
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0xe
	bl DrawFrameAndWindow1
_0222DAD4:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	mul r0, r1
	add r0, r7, r0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222DAE0: .word ov74_0223C340
_0222DAE4: .word 0x000029FC
_0222DAE8: .word 0x00002A04
_0222DAEC: .word 0x00002B98
_0222DAF0: .word 0x00010200
_0222DAF4: .word 0x00002BD0
	thumb_func_end ov74_0222D9E0

	thumb_func_start ov74_0222DAF8
ov74_0222DAF8: ; 0x0222DAF8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r4, #0
_0222DB02:
	add r4, r4, r6
	cmp r4, #3
	bne _0222DB0A
	mov r4, #0
_0222DB0A:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222DB14
	mov r4, #2
_0222DB14:
	cmp r7, r4
	beq _0222DB26
	ldr r0, _0222DB2C ; =0x00002BA0
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl sub_0202DE90
	cmp r0, #0
	beq _0222DB02
_0222DB26:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DB2C: .word 0x00002BA0
	thumb_func_end ov74_0222DAF8

	thumb_func_start ov74_0222DB30
ov74_0222DB30: ; 0x0222DB30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	mov r2, #1
	add r5, r0, #0
	str r2, [sp]
	add r6, r3, #0
	ldr r3, [r5]
	mov r0, #0x71
	bl GfGfxLoader_LoadFromNarc
	add r1, sp, #4
	add r7, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, _0222DB6C ; =0x000029FC
	ldr r2, [sp, #4]
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r2, #0xc
	add r3, r6, #0
	bl BG_LoadScreenTilemapData
	add r0, r7, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DB6C: .word 0x000029FC
	thumb_func_end ov74_0222DB30

	thumb_func_start ov74_0222DB70
ov74_0222DB70: ; 0x0222DB70
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	ldr r0, [r5]
	mov r2, #0
	add r4, r1, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #3
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222DC5C ; =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x71
	mov r1, #6
	bl GfGfxLoader_LoadCharData
	cmp r4, #0
	beq _0222DBB6
	cmp r4, #1
	beq _0222DBD6
	b _0222DBF4
_0222DBB6:
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222DC5C ; =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x71
	mov r1, #4
	bl GfGfxLoader_LoadScrnData
	b _0222DBF4
_0222DBD6:
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222DC5C ; =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x71
	mov r1, #5
	bl GfGfxLoader_LoadScrnData
_0222DBF4:
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #0x71
	add r3, r0, #0
	add r2, r1, #0
	add r3, #0xef
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222DC5C ; =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x71
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r2, #3
	add r0, r5, #0
	mov r1, #2
	lsl r3, r2, #9
	bl ov74_0222DB30
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	ldr r0, _0222DC5C ; =0x000029FC
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #3
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, _0222DC5C ; =0x000029FC
	mov r1, #3
	ldr r0, [r5, r0]
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222DC5C: .word 0x000029FC
	thumb_func_end ov74_0222DB70

	thumb_func_start ov74_0222DC60
ov74_0222DC60: ; 0x0222DC60
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl OverlayManager_GetData
	ldr r1, _0222DCC8 ; =0x00002BC8
	ldr r0, [r0, r1]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0222DC86
	add r0, r0, #1
	cmp r4, r0
	beq _0222DCC4
	b _0222DCA0
_0222DC86:
	ldr r0, _0222DCCC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	cmp r6, #0
	beq _0222DCC4
	add r0, r7, #0
	blx r6
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222DCC4
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222DCA0:
	ldr r0, _0222DCCC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	cmp r4, #0
	beq _0222DCC4
	cmp r4, #0x1f
	bhs _0222DCB2
	str r4, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222DCB2:
	ldr r0, _0222DCD0 ; =ov74_0223D0BC
	str r4, [r0]
	add r0, r7, #0
	blx r4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222DCC4
	str r0, [r5]
_0222DCC4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DCC8: .word 0x00002BC8
_0222DCCC: .word SEQ_SE_DP_SELECT
_0222DCD0: .word ov74_0223D0BC
	thumb_func_end ov74_0222DC60

	thumb_func_start ov74_0222DCD4
ov74_0222DCD4: ; 0x0222DCD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r1, _0222DDF0 ; =0x00002DCC
	add r6, r0, #0
	ldr r0, [r6, r1]
	cmp r0, #0
	bne _0222DD34
	add r0, r1, #4
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _0222DD34
	add r1, #8
	ldr r0, [r6, r1]
	cmp r0, #0
	bne _0222DD34
	bl ov74_0223567C
	cmp r0, #1
	bne _0222DD00
	add r0, r6, #0
	bl ov74_0222D024
_0222DD00:
	bl ov74_0223563C
	bl ov74_02235690
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x1e
	mov r2, #0x1b
	mov r3, #0x1d
	bl ov74_02235728
	bl sub_02074490
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r6]
	mov r2, #1
	str r0, [sp, #4]
	mov r0, #0x14
	mov r3, #0x60
	bl GfGfxLoader_GXLoadPal
_0222DD34:
	mov r0, #0xb2
	mov r4, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0xc]
	add r5, r6, #0
	mov r7, #0x64
_0222DD40:
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	lsl r0, r0, #2
	add r1, r6, r0
	ldr r0, _0222DDF4 ; =0x00002BB4
	ldr r0, [r1, r0]
	add r1, r0, r4
	ldr r0, _0222DDF8 ; =0x0000034A
	ldrh r0, [r1, r0]
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222DD6A
	ldr r0, _0222DDF0 ; =0x00002DCC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222DDD4
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0222DDD4
_0222DD6A:
	ldr r0, [sp, #0xc]
	ldr r1, _0222DDF0 ; =0x00002DCC
	add r0, #0xa
	str r0, [sp]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x10]
	mov r0, #0
	mov r3, #0x10
	bl ov74_02235930
	ldr r1, _0222DDF0 ; =0x00002DCC
	str r0, [r5, r1]
	mov r1, #0
	ldr r0, [sp, #8]
	add r2, r1, #0
	bl GetMonIconNaixEx
	add r1, r0, #0
	ldr r0, [r6]
	mov r2, #0
	str r0, [sp]
	mov r0, #0x14
	add r3, sp, #0x18
	bl GfGfxLoader_GetCharData
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	mov r1, #2
	ldr r0, [r0, #0x14]
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r0, [sp, #0x18]
	mov r2, #2
	ldr r0, [r0, #0x14]
	lsl r1, r7, #5
	lsl r2, r2, #8
	bl GX_LoadOBJ
	mov r1, #0
	ldr r0, [sp, #8]
	add r2, r1, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	ldr r0, _0222DDF0 ; =0x00002DCC
	add r1, r1, #3
	ldr r0, [r5, r0]
	bl sub_02024A14
	ldr r0, [sp, #0x14]
	bl FreeToHeap
_0222DDD4:
	ldr r0, [sp, #0xc]
	add r4, r4, #2
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r5, r5, #4
	add r0, #0x19
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r7, #0x10
	cmp r0, #3
	blt _0222DD40
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222DDF0: .word 0x00002DCC
_0222DDF4: .word 0x00002BB4
_0222DDF8: .word 0x0000034A
	thumb_func_end ov74_0222DCD4

	thumb_func_start ov74_0222DDFC
ov74_0222DDFC: ; 0x0222DDFC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x55
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r1, _0222DE60 ; =0x00003D54
	add r0, r4, #0
	mov r2, #0x55
	bl OverlayManager_CreateAndGetData
	ldr r2, _0222DE60 ; =0x00003D54
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x55
	bl BgConfig_Alloc
	ldr r1, _0222DE64 ; =0x000029FC
	str r0, [r4, r1]
	mov r0, #0x55
	str r0, [r4]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0xaf
	mov r1, #2
	lsl r0, r0, #6
	str r1, [r4, r0]
	mov r1, #1
	add r0, #0x7c
	str r1, [r4, r0]
	mov r0, #0x55
	bl ov74_022352A0
	mov r2, #0x57
	mov r0, #0
	mov r1, #0x59
	lsl r2, r2, #4
	bl CreateHeap
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222DE60: .word 0x00003D54
_0222DE64: .word 0x000029FC
	thumb_func_end ov74_0222DDFC

	thumb_func_start ov74_0222DE68
ov74_0222DE68: ; 0x0222DE68
	push {r4, lr}
	add r4, r1, #0
	bl sub_02014AA0
	mov r0, #3
	lsl r0, r0, #0xa
	ldr r0, [r4, r0]
	bl sub_02014A60
	ldr r1, _0222DE88 ; =0x04000010
	mov r2, #8
	mov r3, #1
	bl sub_02014AB0
	pop {r4, pc}
	nop
_0222DE88: .word 0x04000010
	thumb_func_end ov74_0222DE68

	thumb_func_start ov74_0222DE8C
ov74_0222DE8C: ; 0x0222DE8C
	push {r3, r4, r5, lr}
	ldr r4, _0222DEE0 ; =0x00003130
	ldr r5, _0222DEE4 ; =0x00000C14
	add r4, r0, r4
	add r0, r5, #0
	str r1, [r4, r5]
	sub r0, #0xc
	str r2, [r4, r0]
	add r0, r5, #0
	sub r0, #8
	sub r5, #0x14
	str r3, [r4, r0]
	ldr r0, [r4, r5]
	cmp r0, #0
	bne _0222DEBE
	mov r2, #6
	lsl r2, r2, #8
	mov r0, #0x55
	add r1, r4, #0
	add r2, r4, r2
	bl sub_02014A08
	mov r1, #3
	lsl r1, r1, #0xa
	str r0, [r4, r1]
_0222DEBE:
	ldr r0, _0222DEE8 ; =0x00000C04
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222DED6
	mov r2, #1
	ldr r0, _0222DEEC ; =ov74_0222DE68
	add r1, r4, #0
	lsl r2, r2, #0xa
	bl sub_0200E33C
	ldr r1, _0222DEE8 ; =0x00000C04
	str r0, [r4, r1]
_0222DED6:
	mov r0, #0xc1
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222DEE0: .word 0x00003130
_0222DEE4: .word 0x00000C14
_0222DEE8: .word 0x00000C04
_0222DEEC: .word ov74_0222DE68
	thumb_func_end ov74_0222DE8C

	thumb_func_start ov74_0222DEF0
ov74_0222DEF0: ; 0x0222DEF0
	push {r4, lr}
	ldr r1, _0222DF24 ; =0x00003130
	add r4, r0, r1
	mov r0, #3
	lsl r0, r0, #0xa
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222DF04
	bl sub_02014A38
_0222DF04:
	ldr r0, _0222DF28 ; =0x00000C04
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222DF10
	bl DestroySysTask
_0222DF10:
	mov r0, #3
	mov r1, #0
	lsl r0, r0, #0xa
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	bl sub_02014AA0
	pop {r4, pc}
	nop
_0222DF24: .word 0x00003130
_0222DF28: .word 0x00000C04
	thumb_func_end ov74_0222DEF0

	thumb_func_start ov74_0222DF2C
ov74_0222DF2C: ; 0x0222DF2C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0222E034 ; =0x00003130
	mov r5, #0x15
	add r4, r0, r1
	mov r0, #0xc1
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	lsl r5, r5, #0xe
	cmp r1, #0
	bne _0222DF44
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222DF44:
	add r1, r0, #4
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _0222DF92
	add r1, r0, #0
	sub r1, #8
	ldr r2, [r4, r1]
	sub r1, r0, #4
	ldr r1, [r4, r1]
	add r2, r2, r1
	add r1, r0, #0
	sub r1, #8
	str r2, [r4, r1]
	sub r1, r0, #4
	ldr r2, [r4, r1]
	add r1, r2, #0
	add r2, r2, r1
	sub r1, r0, #4
	str r2, [r4, r1]
	add r1, r0, #0
	sub r1, #8
	ldr r2, [r4, r1]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r2, r1, #0xc
	mov r1, #0xfa
	lsl r1, r1, #2
	cmp r2, r1
	ble _0222DFCC
	mov r2, #0
	add r1, r0, #0
	str r2, [r4, r0]
	sub r1, #8
	str r2, [r4, r1]
	sub r0, r0, #4
	mov r5, #0xa8
	str r2, [r4, r0]
	b _0222DFCC
_0222DF92:
	add r1, r0, #0
	sub r1, #8
	ldr r2, [r4, r1]
	sub r1, r0, #4
	ldr r1, [r4, r1]
	sub r2, r2, r1
	add r1, r0, #0
	sub r1, #8
	str r2, [r4, r1]
	sub r1, r0, #4
	ldr r2, [r4, r1]
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r2, r1, #1
	sub r1, r0, #4
	str r2, [r4, r1]
	mov r2, #1
	ldr r1, [r4, r1]
	lsl r2, r2, #0xa
	cmp r1, r2
	bge _0222DFCC
	mov r1, #0
	lsl r3, r2, #2
	add r2, r0, #0
	str r1, [r4, r0]
	sub r2, #8
	str r3, [r4, r2]
	sub r0, r0, #4
	str r1, [r4, r0]
_0222DFCC:
	mov r0, #3
	lsl r0, r0, #0xa
	ldr r0, [r4, r0]
	bl sub_02014A4C
	add r2, r0, #0
	mov r0, #0x54
	add r3, r0, #0
	add r3, #0xfc
_0222DFDE:
	asr r1, r5, #0xb
	lsr r1, r1, #0x14
	add r1, r5, r1
	asr r1, r1, #0xc
	bpl _0222DFEA
	mov r1, #0
_0222DFEA:
	cmp r1, #0xa8
	ble _0222DFF0
	mov r1, #0xa8
_0222DFF0:
	lsl r6, r3, #1
	add r7, r2, r6
	sub r6, r1, r0
	strh r6, [r7, #6]
	ldrh r6, [r7, #6]
	sub r1, r0, r1
	add r3, r3, #4
	strh r6, [r7, #2]
	mov r6, #0xa8
	sub r6, r6, r0
	lsl r6, r6, #3
	add r6, r2, r6
	strh r1, [r6, #6]
	ldrh r1, [r6, #6]
	add r0, r0, #1
	strh r1, [r6, #2]
	ldr r1, _0222E038 ; =0x00000C08
	ldr r1, [r4, r1]
	add r5, r5, r1
	cmp r0, #0xa8
	blt _0222DFDE
	mov r1, #6
	add r0, r2, #0
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r0, #3
	lsl r0, r0, #0xa
	ldr r0, [r4, r0]
	bl sub_02014A8C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E034: .word 0x00003130
_0222E038: .word 0x00000C08
	thumb_func_end ov74_0222DF2C

	thumb_func_start ov74_0222E03C
ov74_0222E03C: ; 0x0222E03C
	push {r4, lr}
	add r4, r0, #0
	bl ov74_022360B0
	sub r0, r0, #2
	cmp r0, #1
	bhi _0222E056
	ldr r0, _0222E058 ; =SEQ_SE_DP_SAVE
	bl PlaySE
	ldr r0, _0222E05C ; =0x00003D48
	mov r1, #0
	str r1, [r4, r0]
_0222E056:
	pop {r4, pc}
	.balign 4, 0
_0222E058: .word SEQ_SE_DP_SAVE
_0222E05C: .word 0x00003D48
	thumb_func_end ov74_0222E03C

	thumb_func_start ov74_0222E060
ov74_0222E060: ; 0x0222E060
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #3
	blt _0222E072
	bl GF_AssertFail
_0222E072:
	mov r0, #0x1b
	bl SaveSubstruct_AssertCRC
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	sub r0, #0xc
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r2, [r1, r0]
	mov r0, #0x35
	lsl r0, r0, #4
	ldrb r1, [r2, r0]
	cmp r1, #0xff
	beq _0222E094
	add r1, r1, #1
	strb r1, [r2, r0]
_0222E094:
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	sub r0, #0xc
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r2, [r1, r0]
	mov r0, #0xd2
	lsl r0, r0, #2
	ldrb r1, [r2, r0]
	cmp r1, #0xff
	beq _0222E0B0
	sub r1, r1, #1
	strb r1, [r2, r0]
_0222E0B0:
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	ldr r0, _0222E0C8 ; =0x00002BA4
	ldr r0, [r4, r0]
	bl ov74_022360A0
	ldr r1, _0222E0CC ; =ov74_0222E03C
	ldr r0, _0222E0D0 ; =0x00003D48
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_0222E0C8: .word 0x00002BA4
_0222E0CC: .word ov74_0222E03C
_0222E0D0: .word 0x00003D48
	thumb_func_end ov74_0222E060

	thumb_func_start ov74_0222E0D4
ov74_0222E0D4: ; 0x0222E0D4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	ldr r2, _0222E1D4 ; =gSystem
	add r6, r1, #0
	ldr r3, [r2, #0x48]
	ldr r1, _0222E1D8 ; =0x00003D4C
	add r5, r0, #0
	mov r2, #0x10
	ldr r0, [r5, r1]
	tst r2, r3
	beq _0222E0F2
	cmp r0, #1
	beq _0222E0F2
	mov r2, #1
	str r2, [r5, r1]
_0222E0F2:
	ldr r1, _0222E1D4 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #0x20
	tst r1, r2
	beq _0222E108
	ldr r1, _0222E1D8 ; =0x00003D4C
	ldr r2, [r5, r1]
	cmp r2, #0
	beq _0222E108
	mov r2, #0
	str r2, [r5, r1]
_0222E108:
	ldr r1, _0222E1D8 ; =0x00003D4C
	ldr r1, [r5, r1]
	cmp r0, r1
	beq _0222E138
	cmp r1, #0
	bne _0222E118
	mov r1, #1
	b _0222E11A
_0222E118:
	mov r1, #0
_0222E11A:
	ldr r0, _0222E1DC ; =0x00002DC4
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0222E1D8 ; =0x00003D4C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222E12E
	mov r1, #1
	b _0222E130
_0222E12E:
	mov r1, #0
_0222E130:
	ldr r0, _0222E1E0 ; =0x00002DC8
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
_0222E138:
	ldr r0, _0222E1D4 ; =gSystem
	mov r4, #0
	ldr r1, [r0, #0x48]
	mov r0, #2
	add r2, r1, #0
	tst r2, r0
	beq _0222E14A
	add r4, r0, #0
	b _0222E17A
_0222E14A:
	mov r0, #1
	and r1, r0
	beq _0222E160
	cmp r6, #0
	beq _0222E160
	ldr r2, _0222E1D8 ; =0x00003D4C
	ldr r2, [r5, r2]
	cmp r2, #0
	bne _0222E160
	add r4, r0, #0
	b _0222E17A
_0222E160:
	cmp r1, #0
	beq _0222E170
	ldr r0, _0222E1D8 ; =0x00003D4C
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0222E170
	mov r4, #2
	b _0222E17A
_0222E170:
	cmp r1, #0
	beq _0222E17A
	cmp r6, #0
	bne _0222E17A
	mov r4, #3
_0222E17A:
	cmp r4, #1
	bne _0222E1B2
	ldr r0, _0222E1E4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0xab
	bl sub_02037AC0
	mov r3, #0xa
	ldr r1, _0222E1E8 ; =0x00002C34
	mov r0, #1
	str r0, [r5, r1]
	mov r0, #0x16
	sub r1, #0x64
	str r0, [r7]
	add r0, r5, #0
	add r1, r5, r1
	mov r2, #0x11
	lsl r3, r3, #6
	bl ov74_0222D9E0
	ldr r0, _0222E1EC ; =0x00002BD0
	mov r1, #0x13
	add r0, r5, r0
	bl sub_0200F0AC
	ldr r1, _0222E1F0 ; =0x00003D50
	str r0, [r5, r1]
_0222E1B2:
	cmp r4, #2
	bne _0222E1C6
	ldr r0, _0222E1E4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0x14
	bl ov74_0222EB28
_0222E1C6:
	cmp r4, #3
	bne _0222E1D0
	ldr r0, _0222E1E4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
_0222E1D0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E1D4: .word gSystem
_0222E1D8: .word 0x00003D4C
_0222E1DC: .word 0x00002DC4
_0222E1E0: .word 0x00002DC8
_0222E1E4: .word SEQ_SE_DP_SELECT
_0222E1E8: .word 0x00002C34
_0222E1EC: .word 0x00002BD0
_0222E1F0: .word 0x00003D50
	thumb_func_end ov74_0222E0D4

	thumb_func_start ov74_0222E1F4
ov74_0222E1F4: ; 0x0222E1F4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0x1e
	bls _0222E20A
	b _0222E79C
_0222E20A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222E216: ; jump table
	.short _0222E254 - _0222E216 - 2 ; case 0
	.short _0222E2C2 - _0222E216 - 2 ; case 1
	.short _0222E2D4 - _0222E216 - 2 ; case 2
	.short _0222E34A - _0222E216 - 2 ; case 3
	.short _0222E3C8 - _0222E216 - 2 ; case 4
	.short _0222E3F0 - _0222E216 - 2 ; case 5
	.short _0222E410 - _0222E216 - 2 ; case 6
	.short _0222E444 - _0222E216 - 2 ; case 7
	.short _0222E468 - _0222E216 - 2 ; case 8
	.short _0222E48E - _0222E216 - 2 ; case 9
	.short _0222E4BA - _0222E216 - 2 ; case 10
	.short _0222E4F4 - _0222E216 - 2 ; case 11
	.short _0222E518 - _0222E216 - 2 ; case 12
	.short _0222E744 - _0222E216 - 2 ; case 13
	.short _0222E524 - _0222E216 - 2 ; case 14
	.short _0222E530 - _0222E216 - 2 ; case 15
	.short _0222E540 - _0222E216 - 2 ; case 16
	.short _0222E54C - _0222E216 - 2 ; case 17
	.short _0222E58E - _0222E216 - 2 ; case 18
	.short _0222E5E8 - _0222E216 - 2 ; case 19
	.short _0222E646 - _0222E216 - 2 ; case 20
	.short _0222E652 - _0222E216 - 2 ; case 21
	.short _0222E6A2 - _0222E216 - 2 ; case 22
	.short _0222E68E - _0222E216 - 2 ; case 23
	.short _0222E6D6 - _0222E216 - 2 ; case 24
	.short _0222E6F2 - _0222E216 - 2 ; case 25
	.short _0222E734 - _0222E216 - 2 ; case 26
	.short _0222E76E - _0222E216 - 2 ; case 27
	.short _0222E77A - _0222E216 - 2 ; case 28
	.short _0222E78C - _0222E216 - 2 ; case 29
	.short _0222E79C - _0222E216 - 2 ; case 30
_0222E254:
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	ldr r1, [r0, #8]
	ldr r0, _0222E5A4 ; =0x00002BA4
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	bl Save_MysteryGift_get
	ldr r1, _0222E5A8 ; =0x00002BA0
	str r0, [r4, r1]
	add r0, r1, #4
	ldr r0, [r4, r0]
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, _0222E5AC ; =0x00002BA8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl Options_GetFrame
	ldr r1, _0222E5B0 ; =0x00002BAC
	str r0, [r4, r1]
	sub r1, #0xc
	ldr r0, [r4, r1]
	mov r1, #0
	bl SaveMysteryGift_CardGetByIdx
	ldr r1, _0222E5B4 ; =0x00002BB4
	str r0, [r4, r1]
	sub r1, #0x14
	ldr r0, [r4, r1]
	mov r1, #1
	bl SaveMysteryGift_CardGetByIdx
	ldr r1, _0222E5B8 ; =0x00002BB8
	str r0, [r4, r1]
	sub r1, #0x18
	ldr r0, [r4, r1]
	mov r1, #2
	bl SaveMysteryGift_CardGetByIdx
	ldr r1, _0222E5BC ; =0x00002BBC
	mov r2, #1
	str r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov74_0222DAF8
	mov r1, #0xaf
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #1
	str r0, [r5]
	b _0222E79C
_0222E2C2:
	bl ov74_0222FCA4
	ldr r0, _0222E5C0 ; =0x000029FC
	ldr r0, [r4, r0]
	bl ov74_0222FCC4
	mov r0, #2
	str r0, [r5]
	b _0222E79C
_0222E2D4:
	bl ResetAllTextPrinters
	add r0, r4, #0
	mov r1, #0
	bl ov74_0222DB70
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x55
	bl LoadFontPal0
	mov r1, #0
	str r1, [sp]
	mov r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222E5C0 ; =0x000029FC
	mov r2, #1
	ldr r0, [r4, r0]
	mov r3, #0xd
	bl LoadUserFrameGfx1
	mov r0, #1
	str r0, [sp]
	mov r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222E5C0 ; =0x000029FC
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #0xa
	mov r3, #0xe
	bl LoadUserFrameGfx1
	ldr r0, _0222E5B0 ; =0x00002BAC
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #0x13
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222E5C0 ; =0x000029FC
	mov r3, #0xa
	ldr r0, [r4, r0]
	bl LoadUserFrameGfx2
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov74_0222D824
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	add r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E34A:
	mov r1, #0xaf
	lsl r1, r1, #6
	ldr r6, [r4, r1]
	ldr r1, _0222E5C4 ; =gSystem
	mov r2, #0x40
	ldr r1, [r1, #0x48]
	add r3, r1, #0
	tst r3, r2
	beq _0222E368
	add r1, r6, #0
	sub r2, #0x41
	bl ov74_0222DAF8
	add r6, r0, #0
	b _0222E3A4
_0222E368:
	mov r2, #0x80
	tst r2, r1
	beq _0222E37A
	add r1, r6, #0
	mov r2, #1
	bl ov74_0222DAF8
	add r6, r0, #0
	b _0222E3A4
_0222E37A:
	mov r0, #2
	tst r0, r1
	beq _0222E394
	ldr r0, _0222E5C8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x1d
	add r3, r5, #0
	bl ov74_0222D7F0
	b _0222E3A4
_0222E394:
	mov r0, #1
	tst r0, r1
	beq _0222E3A4
	ldr r0, _0222E5C8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #4
	str r0, [r5]
_0222E3A4:
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, r6
	bne _0222E3B0
	b _0222E79C
_0222E3B0:
	ldr r0, _0222E5CC ; =SEQ_SE_DP_CARD2
	bl PlaySE
	mov r0, #0xaf
	lsl r0, r0, #6
	str r6, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov74_0222D824
	b _0222E79C
_0222E3C8:
	ldr r1, _0222E5D0 ; =0x00002BD0
	mov r3, #0xa
	add r1, r4, r1
	mov r2, #7
	lsl r3, r3, #6
	bl ov74_0222D9E0
	ldr r3, _0222E5D4 ; =0x00002BF0
	mov r2, #8
	add r1, r3, #0
	str r0, [r4, r3]
	sub r1, #0x10
	ldr r3, [r4, r3]
	add r0, r4, #0
	add r1, r4, r1
	bl ov74_0222D9E0
	mov r0, #5
	str r0, [r5]
	b _0222E79C
_0222E3F0:
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0
	bl ov74_0222DC60
	ldr r0, _0222E5C4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0222E4C2
	ldr r0, _0222E5C8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0xb
	str r0, [r5]
	b _0222E79C
_0222E410:
	ldr r0, _0222E5CC ; =SEQ_SE_DP_CARD2
	bl PlaySE
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0222E5D0 ; =0x00002BD0
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E5D8 ; =0x00002BE0
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222D0EC
	mov r1, #1
	add r0, r4, #0
	lsl r2, r1, #0xc
	mov r3, #0x66
	bl ov74_0222DE8C
	mov r0, #7
	str r0, [r5]
	b _0222E79C
_0222E444:
	bl ov74_0222DF2C
	cmp r0, #0
	beq _0222E4C2
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov74_0222D824
	ldr r2, _0222E5DC ; =0x00708000
	add r0, r4, #0
	mov r1, #0
	lsr r3, r2, #1
	bl ov74_0222DE8C
	mov r0, #8
	str r0, [r5]
	b _0222E79C
_0222E468:
	bl ov74_0222DF2C
	ldr r0, _0222E5C4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0222E4C2
	ldr r0, _0222E5CC ; =SEQ_SE_DP_CARD2
	bl PlaySE
	mov r1, #1
	add r0, r4, #0
	lsl r2, r1, #0xc
	mov r3, #0x66
	bl ov74_0222DE8C
	mov r0, #9
	str r0, [r5]
	b _0222E79C
_0222E48E:
	bl ov74_0222DF2C
	cmp r0, #0
	beq _0222E4C2
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov74_0222D824
	ldr r2, _0222E5DC ; =0x00708000
	add r0, r4, #0
	mov r1, #0
	lsr r3, r2, #1
	bl ov74_0222DE8C
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xa
	str r0, [r5]
	b _0222E79C
_0222E4BA:
	bl ov74_0222DF2C
	cmp r0, #0
	bne _0222E4C4
_0222E4C2:
	b _0222E79C
_0222E4C4:
	ldr r0, _0222E5D0 ; =0x00002BD0
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x13
	mov r3, #0xa
	bl DrawFrameAndWindow2
	ldr r0, _0222E5D8 ; =0x00002BE0
	mov r1, #0
	add r0, r4, r0
	mov r2, #0xa
	mov r3, #0xe
	bl DrawFrameAndWindow1
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov74_0222DEF0
	mov r0, #5
	str r0, [r5]
	b _0222E79C
_0222E4F4:
	bl ov74_0222D448
	ldr r0, _0222E5D0 ; =0x00002BD0
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E5D0 ; =0x00002BD0
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222E5D0 ; =0x00002BD0
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #3
	str r0, [r5]
	b _0222E79C
_0222E518:
	ldr r2, _0222E5E0 ; =ov74_0222D414
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222DC60
	b _0222E79C
_0222E524:
	ldr r2, _0222E5E0 ; =ov74_0222D414
	add r0, r6, #0
	add r1, r5, #0
	bl ov74_0222DC60
	b _0222E79C
_0222E530:
	ldr r1, _0222E5D8 ; =0x00002BE0
	ldr r2, _0222E5E4 ; =0x00010200
	add r1, r4, r1
	bl ov74_0222D7A4
	mov r0, #0xe
	str r0, [r5]
	b _0222E79C
_0222E540:
	mov r1, #0
	mov r2, #0x11
	add r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E54C:
	bl ov74_0222D448
	ldr r0, _0222E5D0 ; =0x00002BD0
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E5D0 ; =0x00002BD0
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222E5D0 ; =0x00002BD0
	add r0, r4, r0
	bl RemoveWindow
	add r0, r4, #0
	mov r1, #0
	mov r2, #3
	bl ov74_0222D824
	ldr r0, _0222E5C0 ; =0x000029FC
	ldr r0, [r4, r0]
	bl ov74_0222D248
	add r0, r4, #0
	bl ov74_0222CFFC
	add r0, r4, #0
	bl ov74_0222D098
	mov r0, #0x12
	str r0, [r5]
	b _0222E79C
_0222E58E:
	bl ov74_0222E7EC
	bl sub_0203A880
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x13
	add r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
	.balign 4, 0
_0222E5A4: .word 0x00002BA4
_0222E5A8: .word 0x00002BA0
_0222E5AC: .word 0x00002BA8
_0222E5B0: .word 0x00002BAC
_0222E5B4: .word 0x00002BB4
_0222E5B8: .word 0x00002BB8
_0222E5BC: .word 0x00002BBC
_0222E5C0: .word 0x000029FC
_0222E5C4: .word gSystem
_0222E5C8: .word SEQ_SE_DP_SELECT
_0222E5CC: .word SEQ_SE_DP_CARD2
_0222E5D0: .word 0x00002BD0
_0222E5D4: .word 0x00002BF0
_0222E5D8: .word 0x00002BE0
_0222E5DC: .word 0x00708000
_0222E5E0: .word ov74_0222D414
_0222E5E4: .word 0x00010200
_0222E5E8:
	mov r6, #0
	add r0, r6, #0
	bl sub_020373B4
	cmp r0, #0
	beq _0222E63A
	add r0, r4, #0
	add r0, #0x90
	bl sub_020358B8
	ldr r1, _0222E7C0 ; =0x00002B08
	add r0, r4, #0
	add r1, r4, r1
	bl ov74_0222E8B4
	add r6, r0, #0
	bne _0222E62A
	ldr r0, _0222E7C4 ; =0x00002C30
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222E62A
	ldr r0, _0222E7C0 ; =0x00002B08
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	ldr r0, _0222E7C0 ; =0x00002B08
	add r0, r4, r0
	bl CopyWindowToVram
	ldr r0, _0222E7C4 ; =0x00002C30
	mov r1, #0
	str r1, [r4, r0]
_0222E62A:
	ldr r1, _0222E7C8 ; =0x00002AF8
	add r0, r4, #0
	add r1, r4, r1
	add r2, r6, #0
	bl ov74_0222EA88
	ldr r0, _0222E7C4 ; =0x00002C30
	str r6, [r4, r0]
_0222E63A:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov74_0222E0D4
	b _0222E79C
_0222E646:
	mov r1, #0
	mov r2, #0x15
	add r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E652:
	bl ov74_0222D024
	ldr r0, _0222E7CC ; =0x00002BD0
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E7D0 ; =0x00002BE0
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222D0EC
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov74_0222D824
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x55
	bl LoadFontPal0
	add r0, r4, #0
	mov r1, #1
	mov r2, #4
	add r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E68E:
	bl sub_02037D78
	cmp r0, #0
	beq _0222E698
	b _0222E79C
_0222E698:
	mov r0, #0xb1
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	str r0, [r5]
	b _0222E79C
_0222E6A2:
	ldr r0, _0222E7D4 ; =0x00002C34
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222E79C
	ldr r1, _0222E7D8 ; =0x00002DD8
	add r0, r4, #0
	ldr r2, [r4]
	add r0, #0x90
	add r1, r4, r1
	bl ov74_02235ED0
	ldr r0, _0222E7D8 ; =0x00002DD8
	mov r1, #0xd6
	add r0, r4, r0
	lsl r1, r1, #2
	bl ov74_02229D0C
	add r0, r4, #0
	bl ov74_0222E060
	mov r0, #0x18
	str r0, [r5]
	b _0222E79C
_0222E6D6:
	bl ov74_0223615C
	cmp r0, #4
	bne _0222E79C
	mov r0, #0x93
	bl sub_02037AC0
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #0x19
	str r0, [r5]
	b _0222E79C
_0222E6F2:
	bl ov74_0222E898
	cmp r0, #0
	beq _0222E704
	mov r0, #0x93
	bl sub_02037B38
	cmp r0, #1
	bne _0222E79C
_0222E704:
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	bl ov74_02236128
	ldr r1, _0222E7CC ; =0x00002BD0
	mov r3, #0xa
	add r0, r4, #0
	add r1, r4, r1
	mov r2, #0x12
	lsl r3, r3, #6
	bl ov74_0222D9E0
	ldr r0, _0222E7DC ; =0x00003D50
	ldr r0, [r4, r0]
	bl sub_0200F450
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x1a
	bl ov74_0222EB28
	b _0222E79C
_0222E734:
	ldr r0, _0222E7E0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0222E79C
	mov r0, #0x14
	str r0, [r5]
	b _0222E79C
_0222E744:
	ldr r0, _0222E7E0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0222E79C
	ldr r0, _0222E7CC ; =0x00002BD0
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222D104
	ldr r0, _0222E7CC ; =0x00002BD0
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222E7CC ; =0x00002BD0
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #3
	str r0, [r5]
	b _0222E79C
_0222E76E:
	mov r1, #0
	mov r2, #0x1d
	add r3, r5, #0
	bl ov74_0222D7F0
	b _0222E79C
_0222E77A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222E79C
	mov r0, #0xb1
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	str r0, [r5]
	b _0222E79C
_0222E78C:
	bl ov74_0222D024
	add r0, r4, #0
	bl ov74_0222DEF0
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222E79C:
	ldr r0, _0222E7E4 ; =0x00002C44
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222E7A8
	bl sub_0202457C
_0222E7A8:
	bl ov74_022358BC
	ldr r0, _0222E7E8 ; =0x00003D48
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222E7B8
	add r0, r4, #0
	blx r1
_0222E7B8:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0222E7C0: .word 0x00002B08
_0222E7C4: .word 0x00002C30
_0222E7C8: .word 0x00002AF8
_0222E7CC: .word 0x00002BD0
_0222E7D0: .word 0x00002BE0
_0222E7D4: .word 0x00002C34
_0222E7D8: .word 0x00002DD8
_0222E7DC: .word 0x00003D50
_0222E7E0: .word gSystem
_0222E7E4: .word 0x00002C44
_0222E7E8: .word 0x00003D48
	thumb_func_end ov74_0222E1F4

	thumb_func_start ov74_0222E7EC
ov74_0222E7EC: ; 0x0222E7EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	mov r2, #0xd6
	lsl r1, r1, #2
	add r1, r5, r1
	sub r0, #0xc
	ldr r4, [r1, r0]
	add r0, r5, #0
	add r0, #0xe0
	add r1, r4, #0
	lsl r2, r2, #2
	bl memcpy
	mov r1, #0x41
	add r0, r5, #0
	lsl r1, r1, #2
	add r0, #0x90
	add r1, r4, r1
	mov r2, #0x50
	bl memcpy
	ldr r0, _0222E854 ; =0x00000428
	mov r1, #0
	strb r1, [r5, r0]
	add r0, r5, #0
	add r0, #0xde
	ldrb r1, [r0]
	mov r0, #0x10
	mov r2, #0xf
	bic r1, r0
	add r0, r5, #0
	add r0, #0xde
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xde
	ldrb r1, [r0]
	mov r0, #0x20
	orr r1, r0
	add r0, r5, #0
	add r0, #0xde
	strb r1, [r0]
	ldr r1, _0222E858 ; =0x00002BA4
	add r0, r5, #4
	ldr r1, [r5, r1]
	bl ov74_02229CE0
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222E854: .word 0x00000428
_0222E858: .word 0x00002BA4
	thumb_func_end ov74_0222E7EC

	thumb_func_start ov74_0222E85C
ov74_0222E85C: ; 0x0222E85C
	push {r3, r4}
	ldr r3, [r0]
	ldr r1, [r0, #4]
	add r2, r0, #0
	mov r4, #0
	cmp r1, r3
	bge _0222E870
	add r3, r1, #0
	mov r4, #1
	add r2, r0, #4
_0222E870:
	ldr r1, [r0, #8]
	cmp r1, r3
	bge _0222E87E
	add r2, r0, #0
	add r3, r1, #0
	mov r4, #2
	add r2, #8
_0222E87E:
	ldr r1, [r0, #0xc]
	cmp r1, r3
	bge _0222E88A
	add r2, r0, #0
	mov r4, #3
	add r2, #0xc
_0222E88A:
	ldr r0, _0222E894 ; =0x3FFF0001
	str r0, [r2]
	add r0, r4, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0222E894: .word 0x3FFF0001
	thumb_func_end ov74_0222E85C

	thumb_func_start ov74_0222E898
ov74_0222E898: ; 0x0222E898
	push {r3, r4, r5, lr}
	mov r5, #0
	mov r4, #1
_0222E89E:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _0222E8AA
	add r5, r5, #1
_0222E8AA:
	add r4, r4, #1
	cmp r4, #5
	blt _0222E89E
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222E898

	thumb_func_start ov74_0222E8B4
ov74_0222E8B4: ; 0x0222E8B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	mov r6, #0
	mov r0, #1
	str r1, [sp, #0x10]
	add r7, r6, #0
	str r0, [sp, #0x24]
	add r4, r5, #4
_0222E8C6:
	ldr r0, [sp, #0x24]
	bl sub_02034818
	cmp r0, #0
	bne _0222E8E8
	ldr r0, _0222EA70 ; =0x00002C08
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222E8DA
	add r7, r7, #1
_0222E8DA:
	ldr r0, _0222EA70 ; =0x00002C08
	mov r1, #0
	str r1, [r4, r0]
	ldr r1, _0222EA74 ; =0x3FFF0001
	add r0, #0x14
	str r1, [r4, r0]
	b _0222E910
_0222E8E8:
	ldr r1, _0222EA70 ; =0x00002C08
	ldr r1, [r4, r1]
	cmp r1, r0
	beq _0222E90E
	ldr r1, _0222EA70 ; =0x00002C08
	add r7, r7, #1
	str r0, [r4, r1]
	add r0, r1, #0
	add r1, #0x34
	ldr r1, [r5, r1]
	add r0, #0x34
	add r2, r1, #1
	ldr r0, [r5, r0]
	ldr r1, _0222EA78 ; =0x00002C3C
	add r6, r6, #1
	str r2, [r5, r1]
	sub r1, #0x20
	str r0, [r4, r1]
	b _0222E910
_0222E90E:
	add r6, r6, #1
_0222E910:
	ldr r0, [sp, #0x24]
	add r4, r4, #4
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #5
	blt _0222E8C6
	cmp r7, #0
	bne _0222E926
	add sp, #0x48
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E926:
	ldr r1, _0222EA7C ; =0x00002C20
	ldr r0, [r5, r1]
	str r0, [sp, #0x38]
	add r0, r1, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x3c]
	add r0, r1, #0
	add r0, #8
	ldr r0, [r5, r0]
	add r1, #0xc
	str r0, [sp, #0x40]
	ldr r0, [r5, r1]
	str r0, [sp, #0x44]
	add r0, sp, #0x38
	bl ov74_0222E85C
	str r0, [sp, #0x28]
	add r0, sp, #0x38
	bl ov74_0222E85C
	str r0, [sp, #0x2c]
	add r0, sp, #0x38
	bl ov74_0222E85C
	str r0, [sp, #0x30]
	add r0, sp, #0x38
	bl ov74_0222E85C
	str r0, [sp, #0x34]
	mov r0, #0x55
	bl ScrStrBufs_new
	add r4, r0, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x55
	bl NewMsgDataFromNarc
	str r0, [sp, #0x1c]
	mov r5, #0
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	str r0, [sp, #0x14]
	cmp r6, #0
	ble _0222EA54
	add r0, sp, #0x28
	str r0, [sp, #0x18]
_0222E98C:
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	bl sub_02034818
	add r7, r0, #0
	beq _0222EA44
	add r0, r4, #0
	mov r1, #0
	add r2, r7, #0
	bl BufferPlayersName
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	mov r2, #0x36
	mov r3, #0x55
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	str r5, [sp]
	bne _0222E9D6
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EA80 ; =0x00050600
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x20]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	b _0222E9F0
_0222E9D6:
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r1, #0
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x20]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
_0222E9F0:
	ldr r0, [sp, #0x20]
	bl String_dtor
	add r0, r7, #0
	bl PlayerProfile_GetTrainerID
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	lsr r2, r2, #0x10
	mov r3, #5
	bl BufferIntegerAsString
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	mov r2, #0x37
	mov r3, #0x55
	bl ReadMsgData_ExpandPlaceholders
	add r7, r0, #0
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EA84 ; =0x000E0F00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r2, r7, #0
	mov r3, #0x50
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r5, #0x18
_0222EA44:
	ldr r0, [sp, #0x18]
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	blt _0222E98C
_0222EA54:
	cmp r6, #0
	beq _0222EA5E
	ldr r0, [sp, #0x10]
	bl CopyWindowToVram
_0222EA5E:
	ldr r0, [sp, #0x1c]
	bl DestroyMsgData
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r6, #0
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222EA70: .word 0x00002C08
_0222EA74: .word 0x3FFF0001
_0222EA78: .word 0x00002C3C
_0222EA7C: .word 0x00002C20
_0222EA80: .word 0x00050600
_0222EA84: .word 0x000E0F00
	thumb_func_end ov74_0222E8B4

	thumb_func_start ov74_0222EA88
ov74_0222EA88: ; 0x0222EA88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0222EB1C ; =0x00002BF4
	add r4, r1, #0
	str r2, [r5, r0]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x55
	bl NewMsgDataFromNarc
	ldr r1, _0222EB20 ; =0x00002A04
	str r0, [r5, r1]
	mov r0, #0x55
	bl ScrStrBufs_new
	mov r1, #0x2a
	lsl r1, r1, #8
	str r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #1
	str r3, [sp]
	mov r0, #0x2a
	ldr r2, _0222EB1C ; =0x00002BF4
	str r3, [sp, #4]
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #0
	bl BufferIntegerAsString
	mov r1, #0x2a
	lsl r1, r1, #8
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x39
	mov r3, #0x55
	bl ReadMsgData_ExpandPlaceholders
	add r6, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EB24 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0222EB20 ; =0x00002A04
	ldr r0, [r5, r0]
	bl DestroyMsgData
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	bl ScrStrBufs_delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222EB1C: .word 0x00002BF4
_0222EB20: .word 0x00002A04
_0222EB24: .word 0x00010200
	thumb_func_end ov74_0222EA88

	thumb_func_start ov74_0222EB28
ov74_0222EB28: ; 0x0222EB28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov74_02229DF8
	bl sub_0203A914
	mov r0, #0xb1
	lsl r0, r0, #6
	str r6, [r5, r0]
	mov r0, #0x17
	str r0, [r4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_0222EB28

	thumb_func_start ov74_0222EB44
ov74_0222EB44: ; 0x0222EB44
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r7, r0, #0
	ldr r0, _0222EBF0 ; =0x00002A08
	mov r6, #0
	add r4, r7, #0
	add r5, r7, r0
_0222EB56:
	ldr r0, _0222EBF0 ; =0x00002A08
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222EB6A
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
_0222EB6A:
	add r6, r6, #1
	add r4, #0x10
	add r5, #0x10
	cmp r6, #0x13
	blo _0222EB56
	ldr r0, _0222EBF4 ; =0x00002BD0
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222EB8A
	add r0, r7, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222EBF4 ; =0x00002BD0
	add r0, r7, r0
	bl RemoveWindow
_0222EB8A:
	ldr r0, _0222EBF8 ; =0x00002BE0
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222EBA0
	add r0, r7, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222EBF8 ; =0x00002BE0
	add r0, r7, r0
	bl RemoveWindow
_0222EBA0:
	ldr r0, _0222EBFC ; =0x000029FC
	mov r1, #0
	ldr r0, [r7, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _0222EBFC ; =0x000029FC
	mov r1, #1
	ldr r0, [r7, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _0222EBFC ; =0x000029FC
	mov r1, #2
	ldr r0, [r7, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _0222EBFC ; =0x000029FC
	mov r1, #3
	ldr r0, [r7, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _0222EBFC ; =0x000029FC
	ldr r0, [r7, r0]
	bl FreeToHeap
	ldr r0, _0222EC00 ; =FS_OVERLAY_ID(OVY_74)
	ldr r1, _0222EC04 ; =gApp_MainMenu_SelectOption_MysteryGift
	bl RegisterMainOverlay
	mov r0, #0x59
	bl DestroyHeap
	ldr r0, [sp]
	bl OverlayManager_FreeData
	mov r0, #0x55
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EBF0: .word 0x00002A08
_0222EBF4: .word 0x00002BD0
_0222EBF8: .word 0x00002BE0
_0222EBFC: .word 0x000029FC
_0222EC00: .word FS_OVERLAY_ID(OVY_74)
_0222EC04: .word gApp_MainMenu_SelectOption_MysteryGift
	thumb_func_end ov74_0222EB44

	thumb_func_start ov74_0222EC08
ov74_0222EC08: ; 0x0222EC08
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	bl ov74_0222FCC4
	ldr r1, _0222EC54 ; =0x00003D54
	add r0, r5, #0
	bl AllocFromHeapAtEnd
	ldr r2, _0222EC54 ; =0x00003D54
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldr r0, _0222EC58 ; =0x000029FC
	mov r1, #0x1e
	str r6, [r4, r0]
	mov r0, #0
	lsl r1, r1, #4
	add r2, r5, #0
	str r5, [r4]
	bl LoadFontPal0
	ldr r0, _0222EC5C ; =0x00002BB4
	mov r2, #0
	str r7, [r4, r0]
	add r0, #0xc
	str r2, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl ov74_0222D824
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EC54: .word 0x00003D54
_0222EC58: .word 0x000029FC
_0222EC5C: .word 0x00002BB4
	thumb_func_end ov74_0222EC08

	thumb_func_start ov74_0222EC60
ov74_0222EC60: ; 0x0222EC60
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222ECC8 ; =0x00002D7C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222EC70
	bl sub_02024758
_0222EC70:
	mov r0, #0xb6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222EC7E
	bl sub_02024758
_0222EC7E:
	mov r0, #0xb6
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	ldr r2, [r4, r0]
	sub r1, r0, #4
	str r2, [r4, r1]
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222EC98
	bl sub_02024758
_0222EC98:
	ldr r0, _0222ECCC ; =0x00002D88
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222ECA4
	bl sub_02024758
_0222ECA4:
	ldr r0, _0222ECD0 ; =0x00002D8C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222ECB0
	bl sub_02024758
_0222ECB0:
	ldr r1, _0222ECD0 ; =0x00002D8C
	mov r0, #0
	str r0, [r4, r1]
	ldr r2, [r4, r1]
	sub r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	sub r1, #8
	str r0, [r4, r1]
	bl ov74_022359BC
	pop {r4, pc}
	.balign 4, 0
_0222ECC8: .word 0x00002D7C
_0222ECCC: .word 0x00002D88
_0222ECD0: .word 0x00002D8C
	thumb_func_end ov74_0222EC60

	thumb_func_start ov74_0222ECD4
ov74_0222ECD4: ; 0x0222ECD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _0222ECEA
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0200E5D4
_0222ECEA:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222ECD4

	thumb_func_start ov74_0222ECEC
ov74_0222ECEC: ; 0x0222ECEC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _0222ED02
	add r0, r5, #0
	add r1, r4, #0
	bl ClearFrameAndWindow2
_0222ED02:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_0222ECEC

	thumb_func_start ov74_0222ED04
ov74_0222ED04: ; 0x0222ED04
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r0, #0
	beq _0222ED1E
	bl ListMenuItems_dtor
_0222ED1E:
	ldr r0, _0222EDB4 ; =0x00002BBC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222ED2E
	mov r1, #0
	add r2, r1, #0
	bl DestroyListMenu
_0222ED2E:
	add r0, r7, #0
	mov r1, #0x55
	bl ListMenuItems_ctor
	mov r1, #0xaf
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x55
	bl NewMsgDataFromNarc
	ldr r1, _0222EDB8 ; =0x00002A04
	mov r6, #0
	str r0, [r5, r1]
	cmp r7, #0
	ble _0222ED6C
_0222ED52:
	mov r0, #0xaf
	ldr r1, _0222EDB8 ; =0x00002A04
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl ListMenuItems_AppendFromMsgData
	add r6, r6, #1
	add r4, #8
	cmp r6, r7
	blt _0222ED52
_0222ED6C:
	ldr r0, _0222EDB8 ; =0x00002A04
	ldr r0, [r5, r0]
	bl DestroyMsgData
	ldr r4, _0222EDBC ; =ov74_0223C6E0
	add r3, sp, #4
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	str r0, [sp, #4]
	add r0, sp, #4
	strh r7, [r0, #0x10]
	ldr r0, [sp]
	mov r3, #0x55
	str r0, [sp, #0x10]
	add r0, r2, #0
	ldr r2, [sp, #0x38]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl ListMenuInit
	ldr r1, _0222EDB4 ; =0x00002BBC
	str r0, [r5, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222EDB4: .word 0x00002BBC
_0222EDB8: .word 0x00002A04
_0222EDBC: .word ov74_0223C6E0
	thumb_func_end ov74_0222ED04

	thumb_func_start ov74_0222EDC0
ov74_0222EDC0: ; 0x0222EDC0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xaf
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	mov r0, #0xaf
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl DestroyListMenu
	ldr r0, _0222EE00 ; =0x00002BBC
	mov r1, #0
	str r1, [r4, r0]
	add r0, #0x18
	add r0, r4, r0
	bl ov74_0222ECD4
	ldr r0, _0222EE04 ; =0x00002BD4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222EE04 ; =0x00002BD4
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
_0222EE00: .word 0x00002BBC
_0222EE04: .word 0x00002BD4
	thumb_func_end ov74_0222EDC0

	thumb_func_start ov74_0222EE08
ov74_0222EE08: ; 0x0222EE08
	mov r0, #1
	bx lr
	thumb_func_end ov74_0222EE08

	thumb_func_start ov74_0222EE0C
ov74_0222EE0C: ; 0x0222EE0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r1, #0
	ldr r1, [r5]
	mov r0, #0x25
	add r4, r2, #0
	bl String_ctor
	ldr r1, _0222EE54 ; =0x00002BB4
	add r6, r0, #0
	ldr r2, [r5, r1]
	mov r1, #0x41
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #0x24
	bl CopyU16ArrayToStringN
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EE54: .word 0x00002BB4
	thumb_func_end ov74_0222EE0C

	thumb_func_start ov74_0222EE58
ov74_0222EE58: ; 0x0222EE58
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r3, r0, #0
	ldr r0, _0222EEAC ; =0x00002BB4
	add r6, r1, #0
	ldr r1, [r3, r0]
	mov r0, #0x35
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	add r5, r2, #0
	cmp r0, #0
	bne _0222EE74
	mov r2, #0x51
	b _0222EE76
_0222EE74:
	mov r2, #0x52
_0222EE76:
	mov r1, #0x2a
	lsl r1, r1, #8
	ldr r0, [r3, r1]
	add r1, r1, #4
	ldr r1, [r3, r1]
	ldr r3, [r3]
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r5, [sp, #8]
	add r0, r6, #0
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0222EEAC: .word 0x00002BB4
	thumb_func_end ov74_0222EE58

	thumb_func_start ov74_0222EEB0
ov74_0222EEB0: ; 0x0222EEB0
	push {r4, lr}
	sub sp, #0x18
	ldr r1, _0222EF14 ; =0x00002BB4
	add r4, r0, #0
	ldr r2, [r4, r1]
	mov r1, #0xd5
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, sp, #8
	bl RTC_ConvertDayToDate
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x2a
	lsl r0, r0, #8
	mov r2, #0x7d
	ldr r3, [sp, #8]
	lsl r2, r2, #4
	add r2, r3, r2
	ldr r0, [r4, r0]
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	mov r3, #2
	mov r0, #0x2a
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	ldr r2, [sp, #0xc]
	bl BufferIntegerAsString
	mov r1, #2
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x10]
	add r3, r1, #0
	bl BufferIntegerAsString
	mov r0, #1
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_0222EF14: .word 0x00002BB4
	thumb_func_end ov74_0222EEB0

	thumb_func_start ov74_0222EF18
ov74_0222EF18: ; 0x0222EF18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0xfb
	mov r1, #0x55
	add r4, r2, #0
	bl String_ctor
	ldr r1, _0222EF60 ; =0x00002BB4
	add r6, r0, #0
	ldr r2, [r5, r1]
	mov r1, #0x55
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #0xfa
	bl CopyU16ArrayToStringN
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EF60: .word 0x00002BB4
	thumb_func_end ov74_0222EF18

	thumb_func_start ov74_0222EF64
ov74_0222EF64: ; 0x0222EF64
	mov r0, #0
	bx lr
	thumb_func_end ov74_0222EF64

	thumb_func_start ov74_0222EF68
ov74_0222EF68: ; 0x0222EF68
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, _0222EFE0 ; =ov74_0223C6D0
	add r6, r1, #0
	ldr r1, [r0, #4]
	ldr r2, [r0]
	str r1, [sp, #0x18]
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	str r2, [sp, #0x14]
	str r0, [sp, #0x20]
	ldr r0, _0222EFE4 ; =0x00002B9C
	str r1, [sp, #0x1c]
	ldr r4, [r5, r0]
	add r0, r6, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r6, #0
	bl RemoveWindow
	ldr r0, [r4, #8]
	add r1, r6, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	ldr r0, _0222EFE8 ; =0x00002B98
	ldr r0, [r5, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222EFEC ; =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #0x14
	mov r2, #2
	add r3, r6, #0
	bl ov74_0222ED04
	mov r0, #1
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222EFE0: .word ov74_0223C6D0
_0222EFE4: .word 0x00002B9C
_0222EFE8: .word 0x00002B98
_0222EFEC: .word 0x000029FC
	thumb_func_end ov74_0222EF68

	thumb_func_start ov74_0222EFF0
ov74_0222EFF0: ; 0x0222EFF0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x55
	str r0, [sp, #8]
	add r6, r2, #0
	mov r0, #0
	add r4, r3, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	cmp r4, #0
	beq _0222F018
	mov r0, #0x1c
	str r0, [r4]
_0222F018:
	ldr r0, _0222F020 ; =0x00002BF8
	str r6, [r5, r0]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222F020: .word 0x00002BF8
	thumb_func_end ov74_0222EFF0

	thumb_func_start ov74_0222F024
ov74_0222F024: ; 0x0222F024
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r3, [r5]
	str r2, [sp, #0x14]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	ldr r4, _0222F1A4 ; =ov74_0223C700
	bl NewMsgDataFromNarc
	ldr r1, _0222F1A8 ; =0x00002A04
	str r0, [r5, r1]
	ldr r0, [r5]
	bl ScrStrBufs_new
	mov r1, #0x2a
	lsl r1, r1, #8
	str r0, [r5, r1]
	ldr r1, _0222F1AC ; =0x00002BB8
	ldr r0, [sp, #0x14]
	str r0, [r5, r1]
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl ov74_0222F314
	mov r0, #0
	str r0, [sp, #0x2c]
	ldr r0, _0222F1B0 ; =0x00002A08
	add r7, r4, #0
	str r5, [sp, #0x1c]
	add r6, r5, r0
_0222F064:
	ldr r1, [r7]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	beq _0222F086
	cmp r1, #2
	beq _0222F086
	ldr r1, [sp, #0x1c]
	ldr r0, _0222F1B0 ; =0x00002A08
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0222F086
	add r0, r6, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r6, #0
	bl RemoveWindow
_0222F086:
	ldr r0, [sp, #0x1c]
	add r7, #0x30
	add r0, #0x10
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	add r6, #0x10
	add r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, #0xb
	blo _0222F064
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, _0222F1B0 ; =0x00002A08
	mov r7, #0x31
	str r5, [sp, #0x24]
	str r5, [sp, #0x20]
	add r6, r5, r0
_0222F0A8:
	ldr r1, [r4]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	bne _0222F166
	ldr r1, [sp, #0x24]
	ldr r0, _0222F1B0 ; =0x00002A08
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0222F0F4
	ldr r1, [sp, #0x20]
	ldr r0, _0222F1B4 ; =0x00002B48
	mov r2, #0
	str r7, [r1, r0]
	ldr r0, [r4, #8]
	add r1, r6, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222F1B8 ; =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
_0222F0F4:
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x1c]
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl GetFontAttribute
	add r1, r0, #0
	add r0, r6, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x24]
	str r0, [sp, #0x28]
	ldr r2, [sp, #0x28]
	add r0, r5, #0
	add r1, r6, #0
	blx r3
	cmp r0, #1
	bne _0222F158
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0222F158
	mov r0, #0x2a
	ldr r1, _0222F1A8 ; =0x00002A04
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r5]
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r2, [sp, #0x30]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [r4, #0x14]
	ldr r3, [r4, #0x28]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x30]
	bl String_dtor
_0222F158:
	add r0, r6, #0
	bl CopyWindowToVram
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	mul r0, r1
	add r7, r7, r0
_0222F166:
	ldr r0, [sp, #0x24]
	add r4, #0x30
	add r0, #0x10
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r6, #0x10
	add r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0xb
	blo _0222F0A8
	ldr r0, _0222F1A8 ; =0x00002A04
	ldr r0, [r5, r0]
	bl DestroyMsgData
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	bl ScrStrBufs_delete
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222F19E
	add r0, r5, #0
	bl ov74_0222F478
_0222F19E:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222F1A4: .word ov74_0223C700
_0222F1A8: .word 0x00002A04
_0222F1AC: .word 0x00002BB8
_0222F1B0: .word 0x00002A08
_0222F1B4: .word 0x00002B48
_0222F1B8: .word 0x000029FC
	thumb_func_end ov74_0222F024

	thumb_func_start ov74_0222F1BC
ov74_0222F1BC: ; 0x0222F1BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r7, r3, #0
	mov r3, #0x30
	ldr r0, _0222F2BC ; =ov74_0223C700
	mul r3, r2
	add r6, r1, #0
	add r4, r0, r3
	ldr r0, [r6]
	cmp r0, #0
	bne _0222F206
	ldr r0, [r4, #8]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _0222F2C0 ; =0x000029FC
	ldr r3, [r4, #4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
_0222F206:
	ldr r1, [r4, #0x1c]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0222F234
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xf7
	mov r3, #0x55
	bl NewMsgDataFromNarc
	ldr r1, _0222F2C4 ; =0x00002A04
	str r0, [r5, r1]
	mov r0, #0x55
	bl ScrStrBufs_new
	mov r1, #0x2a
	lsl r1, r1, #8
	str r0, [r5, r1]
_0222F234:
	ldr r0, _0222F2C8 ; =0x00002B98
	ldr r2, _0222F2CC ; =0x00010200
	str r7, [r5, r0]
	add r0, r0, #4
	str r4, [r5, r0]
	ldr r3, [r4, #0x24]
	add r0, r5, #0
	add r1, r6, #0
	blx r3
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0222F28E
	mov r1, #0x2a
	lsl r1, r1, #8
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r3, #0x55
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0x14]
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	ldr r2, [sp, #0x14]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r4, #0x14]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
	ldr r0, _0222F2C4 ; =0x00002A04
	ldr r0, [r5, r0]
	bl DestroyMsgData
	mov r0, #0x2a
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	bl ScrStrBufs_delete
_0222F28E:
	ldr r0, _0222F2D0 ; =0x00002BC4
	add r0, r5, r0
	cmp r6, r0
	bne _0222F2A4
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x13
	mov r3, #0xa
	bl DrawFrameAndWindow2
	b _0222F2B0
_0222F2A4:
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0xe
	bl DrawFrameAndWindow1
_0222F2B0:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	mul r0, r1
	add r0, r7, r0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F2BC: .word ov74_0223C700
_0222F2C0: .word 0x000029FC
_0222F2C4: .word 0x00002A04
_0222F2C8: .word 0x00002B98
_0222F2CC: .word 0x00010200
_0222F2D0: .word 0x00002BC4
	thumb_func_end ov74_0222F1BC

	thumb_func_start ov74_0222F2D4
ov74_0222F2D4: ; 0x0222F2D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	mov r2, #1
	add r5, r0, #0
	str r2, [sp]
	add r6, r3, #0
	ldr r3, [r5]
	mov r0, #0x71
	bl GfGfxLoader_LoadFromNarc
	add r1, sp, #4
	add r7, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, _0222F310 ; =0x000029FC
	ldr r2, [sp, #4]
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r2, #0xc
	add r3, r6, #0
	bl BG_LoadScreenTilemapData
	add r0, r7, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F310: .word 0x000029FC
	thumb_func_end ov74_0222F2D4

	thumb_func_start ov74_0222F314
ov74_0222F314: ; 0x0222F314
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	ldr r0, [r5]
	mov r2, #0
	add r4, r1, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #7
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222F400 ; =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x71
	mov r1, #0xa
	bl GfGfxLoader_LoadCharData
	cmp r4, #0
	beq _0222F35A
	cmp r4, #1
	beq _0222F37A
	b _0222F398
_0222F35A:
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222F400 ; =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x71
	mov r1, #8
	bl GfGfxLoader_LoadScrnData
	b _0222F398
_0222F37A:
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222F400 ; =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x71
	mov r1, #9
	bl GfGfxLoader_LoadScrnData
_0222F398:
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #0x71
	add r3, r0, #0
	add r2, r1, #0
	add r3, #0xef
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, [r5]
	ldr r2, _0222F400 ; =0x000029FC
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x71
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r2, #3
	add r0, r5, #0
	mov r1, #2
	lsl r3, r2, #9
	bl ov74_0222F2D4
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	ldr r0, _0222F400 ; =0x000029FC
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #3
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, _0222F400 ; =0x000029FC
	mov r1, #3
	ldr r0, [r5, r0]
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222F400: .word 0x000029FC
	thumb_func_end ov74_0222F314

	thumb_func_start ov74_0222F404
ov74_0222F404: ; 0x0222F404
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl OverlayManager_GetData
	ldr r1, _0222F46C ; =0x00002BBC
	ldr r0, [r0, r1]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0222F42A
	add r0, r0, #1
	cmp r4, r0
	beq _0222F468
	b _0222F444
_0222F42A:
	ldr r0, _0222F470 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	cmp r6, #0
	beq _0222F468
	add r0, r7, #0
	blx r6
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222F468
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222F444:
	ldr r0, _0222F470 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	cmp r4, #0
	beq _0222F468
	cmp r4, #0x1f
	bhs _0222F456
	str r4, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222F456:
	ldr r0, _0222F474 ; =ov74_0223D0C0
	str r4, [r0]
	add r0, r7, #0
	blx r4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222F468
	str r0, [r5]
_0222F468:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F46C: .word 0x00002BBC
_0222F470: .word SEQ_SE_DP_SELECT
_0222F474: .word ov74_0223D0C0
	thumb_func_end ov74_0222F404

	thumb_func_start ov74_0222F478
ov74_0222F478: ; 0x0222F478
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r1, _0222F58C ; =0x00002D84
	add r7, r0, #0
	ldr r0, [r7, r1]
	cmp r0, #0
	bne _0222F4D8
	add r0, r1, #4
	ldr r0, [r7, r0]
	cmp r0, #0
	bne _0222F4D8
	add r1, #8
	ldr r0, [r7, r1]
	cmp r0, #0
	bne _0222F4D8
	bl ov74_0223567C
	cmp r0, #1
	bne _0222F4A4
	add r0, r7, #0
	bl ov74_0222EC60
_0222F4A4:
	bl ov74_0223563C
	bl ov74_02235690
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x1e
	mov r2, #0x1b
	mov r3, #0x1d
	bl ov74_02235728
	bl sub_02074490
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r7]
	mov r2, #1
	str r0, [sp, #4]
	mov r0, #0x14
	mov r3, #0x60
	bl GfGfxLoader_GXLoadPal
_0222F4D8:
	mov r0, #0xb2
	mov r4, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0xc]
	add r5, r7, #0
	mov r6, #0x64
_0222F4E4:
	ldr r0, _0222F590 ; =0x00002BB4
	ldr r0, [r7, r0]
	add r1, r0, r4
	ldr r0, _0222F594 ; =0x0000034A
	ldrh r0, [r1, r0]
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222F504
	ldr r0, _0222F58C ; =0x00002D84
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F56E
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0222F56E
_0222F504:
	ldr r0, [sp, #0xc]
	ldr r1, _0222F58C ; =0x00002D84
	add r0, #0xa
	str r0, [sp]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x10]
	mov r0, #0
	mov r3, #0x10
	bl ov74_02235930
	ldr r1, _0222F58C ; =0x00002D84
	str r0, [r5, r1]
	mov r1, #0
	ldr r0, [sp, #8]
	add r2, r1, #0
	bl GetMonIconNaixEx
	add r1, r0, #0
	ldr r0, [r7]
	mov r2, #0
	str r0, [sp]
	mov r0, #0x14
	add r3, sp, #0x18
	bl GfGfxLoader_GetCharData
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	mov r1, #2
	ldr r0, [r0, #0x14]
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r0, [sp, #0x18]
	mov r2, #2
	ldr r0, [r0, #0x14]
	lsl r1, r6, #5
	lsl r2, r2, #8
	bl GX_LoadOBJ
	mov r1, #0
	ldr r0, [sp, #8]
	add r2, r1, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	ldr r0, _0222F58C ; =0x00002D84
	add r1, r1, #3
	ldr r0, [r5, r0]
	bl sub_02024A14
	ldr r0, [sp, #0x14]
	bl FreeToHeap
_0222F56E:
	ldr r0, [sp, #0xc]
	add r4, r4, #2
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r5, r5, #4
	add r0, #0x19
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r6, #0x10
	cmp r0, #3
	blt _0222F4E4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0222F58C: .word 0x00002D84
_0222F590: .word 0x00002BB4
_0222F594: .word 0x0000034A
	thumb_func_end ov74_0222F478

	thumb_func_start ov74_0222F598
ov74_0222F598: ; 0x0222F598
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x55
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r1, _0222F5F4 ; =0x00003D0C
	add r0, r4, #0
	mov r2, #0x55
	bl OverlayManager_CreateAndGetData
	ldr r2, _0222F5F4 ; =0x00003D0C
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x55
	bl BgConfig_Alloc
	ldr r1, _0222F5F8 ; =0x000029FC
	str r0, [r4, r1]
	mov r0, #0x55
	str r0, [r4]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, _0222F5FC ; =0x00002BF4
	mov r1, #1
	str r1, [r4, r0]
	mov r0, #0x55
	bl ov74_022352A0
	mov r2, #0x57
	mov r0, #0
	mov r1, #0x59
	lsl r2, r2, #4
	bl CreateHeap
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222F5F4: .word 0x00003D0C
_0222F5F8: .word 0x000029FC
_0222F5FC: .word 0x00002BF4
	thumb_func_end ov74_0222F598

	thumb_func_start ov74_0222F600
ov74_0222F600: ; 0x0222F600
	push {r4, lr}
	add r4, r1, #0
	bl sub_02014AA0
	mov r0, #3
	lsl r0, r0, #0xa
	ldr r0, [r4, r0]
	bl sub_02014A60
	ldr r1, _0222F620 ; =0x04000010
	mov r2, #8
	mov r3, #1
	bl sub_02014AB0
	pop {r4, pc}
	nop
_0222F620: .word 0x04000010
	thumb_func_end ov74_0222F600

	thumb_func_start ov74_0222F624
ov74_0222F624: ; 0x0222F624
	push {r3, r4, r5, lr}
	ldr r4, _0222F678 ; =0x000030E8
	ldr r5, _0222F67C ; =0x00000C14
	add r4, r0, r4
	add r0, r5, #0
	str r1, [r4, r5]
	sub r0, #0xc
	str r2, [r4, r0]
	add r0, r5, #0
	sub r0, #8
	sub r5, #0x14
	str r3, [r4, r0]
	ldr r0, [r4, r5]
	cmp r0, #0
	bne _0222F656
	mov r2, #6
	lsl r2, r2, #8
	mov r0, #0x55
	add r1, r4, #0
	add r2, r4, r2
	bl sub_02014A08
	mov r1, #3
	lsl r1, r1, #0xa
	str r0, [r4, r1]
_0222F656:
	ldr r0, _0222F680 ; =0x00000C04
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0222F66E
	mov r2, #1
	ldr r0, _0222F684 ; =ov74_0222F600
	add r1, r4, #0
	lsl r2, r2, #0xa
	bl sub_0200E33C
	ldr r1, _0222F680 ; =0x00000C04
	str r0, [r4, r1]
_0222F66E:
	mov r0, #0xc1
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222F678: .word 0x000030E8
_0222F67C: .word 0x00000C14
_0222F680: .word 0x00000C04
_0222F684: .word ov74_0222F600
	thumb_func_end ov74_0222F624

	thumb_func_start ov74_0222F688
ov74_0222F688: ; 0x0222F688
	push {r4, lr}
	ldr r1, _0222F6BC ; =0x000030E8
	add r4, r0, r1
	mov r0, #3
	lsl r0, r0, #0xa
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222F69C
	bl sub_02014A38
_0222F69C:
	ldr r0, _0222F6C0 ; =0x00000C04
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222F6A8
	bl DestroySysTask
_0222F6A8:
	mov r0, #3
	mov r1, #0
	lsl r0, r0, #0xa
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	bl sub_02014AA0
	pop {r4, pc}
	nop
_0222F6BC: .word 0x000030E8
_0222F6C0: .word 0x00000C04
	thumb_func_end ov74_0222F688

	thumb_func_start ov74_0222F6C4
ov74_0222F6C4: ; 0x0222F6C4
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0222F7CC ; =0x000030E8
	mov r5, #0x15
	add r4, r0, r1
	mov r0, #0xc1
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	lsl r5, r5, #0xe
	cmp r1, #0
	bne _0222F6DC
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222F6DC:
	add r1, r0, #4
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _0222F72A
	add r1, r0, #0
	sub r1, #8
	ldr r2, [r4, r1]
	sub r1, r0, #4
	ldr r1, [r4, r1]
	add r2, r2, r1
	add r1, r0, #0
	sub r1, #8
	str r2, [r4, r1]
	sub r1, r0, #4
	ldr r2, [r4, r1]
	add r1, r2, #0
	add r2, r2, r1
	sub r1, r0, #4
	str r2, [r4, r1]
	add r1, r0, #0
	sub r1, #8
	ldr r2, [r4, r1]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r2, r1, #0xc
	mov r1, #0xfa
	lsl r1, r1, #2
	cmp r2, r1
	ble _0222F764
	mov r2, #0
	add r1, r0, #0
	str r2, [r4, r0]
	sub r1, #8
	str r2, [r4, r1]
	sub r0, r0, #4
	mov r5, #0xa8
	str r2, [r4, r0]
	b _0222F764
_0222F72A:
	add r1, r0, #0
	sub r1, #8
	ldr r2, [r4, r1]
	sub r1, r0, #4
	ldr r1, [r4, r1]
	sub r2, r2, r1
	add r1, r0, #0
	sub r1, #8
	str r2, [r4, r1]
	sub r1, r0, #4
	ldr r2, [r4, r1]
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r2, r1, #1
	sub r1, r0, #4
	str r2, [r4, r1]
	mov r2, #1
	ldr r1, [r4, r1]
	lsl r2, r2, #0xa
	cmp r1, r2
	bge _0222F764
	mov r1, #0
	lsl r3, r2, #2
	add r2, r0, #0
	str r1, [r4, r0]
	sub r2, #8
	str r3, [r4, r2]
	sub r0, r0, #4
	str r1, [r4, r0]
_0222F764:
	mov r0, #3
	lsl r0, r0, #0xa
	ldr r0, [r4, r0]
	bl sub_02014A4C
	add r2, r0, #0
	mov r0, #0x54
	add r3, r0, #0
	add r3, #0xfc
_0222F776:
	asr r1, r5, #0xb
	lsr r1, r1, #0x14
	add r1, r5, r1
	asr r1, r1, #0xc
	bpl _0222F782
	mov r1, #0
_0222F782:
	cmp r1, #0xa8
	ble _0222F788
	mov r1, #0xa8
_0222F788:
	lsl r6, r3, #1
	add r7, r2, r6
	sub r6, r1, r0
	strh r6, [r7, #6]
	ldrh r6, [r7, #6]
	sub r1, r0, r1
	add r3, r3, #4
	strh r6, [r7, #2]
	mov r6, #0xa8
	sub r6, r6, r0
	lsl r6, r6, #3
	add r6, r2, r6
	strh r1, [r6, #6]
	ldrh r1, [r6, #6]
	add r0, r0, #1
	strh r1, [r6, #2]
	ldr r1, _0222F7D0 ; =0x00000C08
	ldr r1, [r4, r1]
	add r5, r5, r1
	cmp r0, #0xa8
	blt _0222F776
	mov r1, #6
	add r0, r2, #0
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r0, #3
	lsl r0, r0, #0xa
	ldr r0, [r4, r0]
	bl sub_02014A8C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F7CC: .word 0x000030E8
_0222F7D0: .word 0x00000C08
	thumb_func_end ov74_0222F6C4

	thumb_func_start ov74_0222F7D4
ov74_0222F7D4: ; 0x0222F7D4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0x1e
	bls _0222F7EA
	b _0222FB2C
_0222F7EA:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222F7F6: ; jump table
	.short _0222F834 - _0222F7F6 - 2 ; case 0
	.short _0222F874 - _0222F7F6 - 2 ; case 1
	.short _0222F886 - _0222F7F6 - 2 ; case 2
	.short _0222F8FC - _0222F7F6 - 2 ; case 3
	.short _0222F92E - _0222F7F6 - 2 ; case 4
	.short _0222F956 - _0222F7F6 - 2 ; case 5
	.short _0222F976 - _0222F7F6 - 2 ; case 6
	.short _0222F9AA - _0222F7F6 - 2 ; case 7
	.short _0222F9CE - _0222F7F6 - 2 ; case 8
	.short _0222F9F4 - _0222F7F6 - 2 ; case 9
	.short _0222FA20 - _0222F7F6 - 2 ; case 10
	.short _0222FA5A - _0222F7F6 - 2 ; case 11
	.short _0222FB2C - _0222F7F6 - 2 ; case 12
	.short _0222FAD6 - _0222F7F6 - 2 ; case 13
	.short _0222FB2C - _0222F7F6 - 2 ; case 14
	.short _0222FB2C - _0222F7F6 - 2 ; case 15
	.short _0222FB2C - _0222F7F6 - 2 ; case 16
	.short _0222FB2C - _0222F7F6 - 2 ; case 17
	.short _0222FB2C - _0222F7F6 - 2 ; case 18
	.short _0222FB2C - _0222F7F6 - 2 ; case 19
	.short _0222FA7E - _0222F7F6 - 2 ; case 20
	.short _0222FA8A - _0222F7F6 - 2 ; case 21
	.short _0222FB2C - _0222F7F6 - 2 ; case 22
	.short _0222FAC6 - _0222F7F6 - 2 ; case 23
	.short _0222FB2C - _0222F7F6 - 2 ; case 24
	.short _0222FB2C - _0222F7F6 - 2 ; case 25
	.short _0222FB2C - _0222F7F6 - 2 ; case 26
	.short _0222FB00 - _0222F7F6 - 2 ; case 27
	.short _0222FB0C - _0222F7F6 - 2 ; case 28
	.short _0222FB1C - _0222F7F6 - 2 ; case 29
	.short _0222FB2C - _0222F7F6 - 2 ; case 30
_0222F834:
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	ldr r1, [r0, #8]
	ldr r0, _0222FB50 ; =0x00002BA4
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	bl Save_MysteryGift_get
	ldr r1, _0222FB54 ; =0x00002BA0
	str r0, [r4, r1]
	add r0, r1, #4
	ldr r0, [r4, r0]
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, _0222FB58 ; =0x00002BA8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl Options_GetFrame
	ldr r1, _0222FB5C ; =0x00002BAC
	str r0, [r4, r1]
	sub r1, #0xc
	ldr r0, [r4, r1]
	mov r1, #4
	bl SaveMysteryGift_CardGetByIdx
	ldr r1, _0222FB60 ; =0x00002BB4
	str r0, [r4, r1]
	mov r0, #1
	str r0, [r5]
	b _0222FB2C
_0222F874:
	bl ov74_0222FCA4
	ldr r0, _0222FB64 ; =0x000029FC
	ldr r0, [r4, r0]
	bl ov74_0222FCC4
	mov r0, #2
	str r0, [r5]
	b _0222FB2C
_0222F886:
	bl ResetAllTextPrinters
	add r0, r4, #0
	mov r1, #0
	bl ov74_0222F314
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x55
	bl LoadFontPal0
	mov r1, #0
	str r1, [sp]
	mov r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222FB64 ; =0x000029FC
	mov r2, #1
	ldr r0, [r4, r0]
	mov r3, #0xd
	bl LoadUserFrameGfx1
	mov r0, #1
	str r0, [sp]
	mov r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222FB64 ; =0x000029FC
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #0xa
	mov r3, #0xe
	bl LoadUserFrameGfx1
	ldr r0, _0222FB5C ; =0x00002BAC
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #0x13
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x55
	str r0, [sp, #4]
	ldr r0, _0222FB64 ; =0x000029FC
	mov r3, #0xa
	ldr r0, [r4, r0]
	bl LoadUserFrameGfx2
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov74_0222F024
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	add r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222F8FC:
	ldr r0, _0222FB68 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0222F91A
	ldr r0, _0222FB6C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x1d
	add r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222F91A:
	mov r0, #1
	tst r0, r1
	bne _0222F922
	b _0222FB2C
_0222F922:
	ldr r0, _0222FB6C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #4
	str r0, [r5]
	b _0222FB2C
_0222F92E:
	ldr r1, _0222FB70 ; =0x00002BC4
	mov r3, #0xa
	add r1, r4, r1
	mov r2, #7
	lsl r3, r3, #6
	bl ov74_0222F1BC
	ldr r3, _0222FB74 ; =0x00002BE4
	mov r2, #8
	add r1, r3, #0
	str r0, [r4, r3]
	sub r1, #0x10
	ldr r3, [r4, r3]
	add r0, r4, #0
	add r1, r4, r1
	bl ov74_0222F1BC
	mov r0, #5
	str r0, [r5]
	b _0222FB2C
_0222F956:
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0
	bl ov74_0222F404
	ldr r0, _0222FB68 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0222FA28
	ldr r0, _0222FB6C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0xb
	str r0, [r5]
	b _0222FB2C
_0222F976:
	ldr r0, _0222FB78 ; =SEQ_SE_DP_CARD2
	bl PlaySE
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0222FB70 ; =0x00002BC4
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222ECEC
	ldr r0, _0222FB7C ; =0x00002BD4
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222ECD4
	mov r1, #1
	add r0, r4, #0
	lsl r2, r1, #0xc
	mov r3, #0x66
	bl ov74_0222F624
	mov r0, #7
	str r0, [r5]
	b _0222FB2C
_0222F9AA:
	bl ov74_0222F6C4
	cmp r0, #0
	beq _0222FA28
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov74_0222F024
	ldr r2, _0222FB80 ; =0x00708000
	add r0, r4, #0
	mov r1, #0
	lsr r3, r2, #1
	bl ov74_0222F624
	mov r0, #8
	str r0, [r5]
	b _0222FB2C
_0222F9CE:
	bl ov74_0222F6C4
	ldr r0, _0222FB68 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0222FA28
	ldr r0, _0222FB78 ; =SEQ_SE_DP_CARD2
	bl PlaySE
	mov r1, #1
	add r0, r4, #0
	lsl r2, r1, #0xc
	mov r3, #0x66
	bl ov74_0222F624
	mov r0, #9
	str r0, [r5]
	b _0222FB2C
_0222F9F4:
	bl ov74_0222F6C4
	cmp r0, #0
	beq _0222FA28
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov74_0222F024
	ldr r2, _0222FB80 ; =0x00708000
	add r0, r4, #0
	mov r1, #0
	lsr r3, r2, #1
	bl ov74_0222F624
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xa
	str r0, [r5]
	b _0222FB2C
_0222FA20:
	bl ov74_0222F6C4
	cmp r0, #0
	bne _0222FA2A
_0222FA28:
	b _0222FB2C
_0222FA2A:
	ldr r0, _0222FB70 ; =0x00002BC4
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x13
	mov r3, #0xa
	bl DrawFrameAndWindow2
	ldr r0, _0222FB7C ; =0x00002BD4
	mov r1, #0
	add r0, r4, r0
	mov r2, #0xa
	mov r3, #0xe
	bl DrawFrameAndWindow1
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov74_0222F688
	mov r0, #5
	str r0, [r5]
	b _0222FB2C
_0222FA5A:
	bl ov74_0222EDC0
	ldr r0, _0222FB70 ; =0x00002BC4
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222ECEC
	ldr r0, _0222FB70 ; =0x00002BC4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222FB70 ; =0x00002BC4
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #3
	str r0, [r5]
	b _0222FB2C
_0222FA7E:
	mov r1, #0
	mov r2, #0x15
	add r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222FA8A:
	bl ov74_0222EC60
	ldr r0, _0222FB70 ; =0x00002BC4
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222ECEC
	ldr r0, _0222FB7C ; =0x00002BD4
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222ECD4
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov74_0222F024
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x55
	bl LoadFontPal0
	add r0, r4, #0
	mov r1, #1
	mov r2, #4
	add r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222FAC6:
	bl sub_02037D78
	cmp r0, #0
	bne _0222FB2C
	ldr r0, _0222FB84 ; =0x00002BF8
	ldr r0, [r4, r0]
	str r0, [r5]
	b _0222FB2C
_0222FAD6:
	ldr r0, _0222FB68 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0222FB2C
	ldr r0, _0222FB70 ; =0x00002BC4
	mov r1, #0
	add r0, r4, r0
	bl ov74_0222ECEC
	ldr r0, _0222FB70 ; =0x00002BC4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222FB70 ; =0x00002BC4
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #3
	str r0, [r5]
	b _0222FB2C
_0222FB00:
	mov r1, #0
	mov r2, #0x1d
	add r3, r5, #0
	bl ov74_0222EFF0
	b _0222FB2C
_0222FB0C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222FB2C
	ldr r0, _0222FB84 ; =0x00002BF8
	ldr r0, [r4, r0]
	str r0, [r5]
	b _0222FB2C
_0222FB1C:
	bl ov74_0222EC60
	add r0, r4, #0
	bl ov74_0222F688
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222FB2C:
	ldr r0, _0222FB88 ; =0x00002BFC
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222FB38
	bl sub_0202457C
_0222FB38:
	bl ov74_022358BC
	mov r0, #0x3d
	lsl r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222FB4A
	add r0, r4, #0
	blx r1
_0222FB4A:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222FB50: .word 0x00002BA4
_0222FB54: .word 0x00002BA0
_0222FB58: .word 0x00002BA8
_0222FB5C: .word 0x00002BAC
_0222FB60: .word 0x00002BB4
_0222FB64: .word 0x000029FC
_0222FB68: .word gSystem
_0222FB6C: .word SEQ_SE_DP_SELECT
_0222FB70: .word 0x00002BC4
_0222FB74: .word 0x00002BE4
_0222FB78: .word SEQ_SE_DP_CARD2
_0222FB7C: .word 0x00002BD4
_0222FB80: .word 0x00708000
_0222FB84: .word 0x00002BF8
_0222FB88: .word 0x00002BFC
	thumb_func_end ov74_0222F7D4

	thumb_func_start ov74_0222FB8C
ov74_0222FB8C: ; 0x0222FB8C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r7, r0, #0
	ldr r0, _0222FC38 ; =0x00002A08
	mov r6, #0
	add r4, r7, #0
	add r5, r7, r0
_0222FB9E:
	ldr r0, _0222FC38 ; =0x00002A08
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222FBB2
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
_0222FBB2:
	add r6, r6, #1
	add r4, #0x10
	add r5, #0x10
	cmp r6, #0xb
	blo _0222FB9E
	ldr r0, _0222FC3C ; =0x00002BC4
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222FBD2
	add r0, r7, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222FC3C ; =0x00002BC4
	add r0, r7, r0
	bl RemoveWindow
_0222FBD2:
	ldr r0, _0222FC40 ; =0x00002BD4
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222FBE8
	add r0, r7, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222FC40 ; =0x00002BD4
	add r0, r7, r0
	bl RemoveWindow
_0222FBE8:
	ldr r0, _0222FC44 ; =0x000029FC
	mov r1, #0
	ldr r0, [r7, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _0222FC44 ; =0x000029FC
	mov r1, #1
	ldr r0, [r7, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _0222FC44 ; =0x000029FC
	mov r1, #2
	ldr r0, [r7, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _0222FC44 ; =0x000029FC
	mov r1, #3
	ldr r0, [r7, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _0222FC44 ; =0x000029FC
	ldr r0, [r7, r0]
	bl FreeToHeap
	ldr r0, _0222FC48 ; =FS_OVERLAY_ID(OVY_74)
	ldr r1, _0222FC4C ; =gApp_MainMenu_SelectOption_MysteryGift
	bl RegisterMainOverlay
	mov r0, #0x59
	bl DestroyHeap
	ldr r0, [sp]
	bl OverlayManager_FreeData
	mov r0, #0x55
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FC38: .word 0x00002A08
_0222FC3C: .word 0x00002BC4
_0222FC40: .word 0x00002BD4
_0222FC44: .word 0x000029FC
_0222FC48: .word FS_OVERLAY_ID(OVY_74)
_0222FC4C: .word gApp_MainMenu_SelectOption_MysteryGift
	thumb_func_end ov74_0222FB8C

	thumb_func_start ov74_0222FC50
ov74_0222FC50: ; 0x0222FC50
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	bl ov74_0222FCC4
	ldr r1, _0222FC98 ; =0x00003D0C
	add r0, r5, #0
	bl AllocFromHeapAtEnd
	ldr r2, _0222FC98 ; =0x00003D0C
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldr r0, _0222FC9C ; =0x000029FC
	mov r1, #0x1e
	str r6, [r4, r0]
	mov r0, #0
	lsl r1, r1, #4
	add r2, r5, #0
	str r5, [r4]
	bl LoadFontPal0
	ldr r0, _0222FCA0 ; =0x00002BB4
	mov r1, #1
	str r7, [r4, r0]
	add r0, r4, #0
	mov r2, #0
	bl ov74_0222F024
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FC98: .word 0x00003D0C
_0222FC9C: .word 0x000029FC
_0222FCA0: .word 0x00002BB4
	thumb_func_end ov74_0222FC50

	thumb_func_start ov74_0222FCA4
ov74_0222FCA4: ; 0x0222FCA4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0222FCC0 ; =_0223B4B0
	add r3, sp, #0
	mov r2, #5
_0222FCAE:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222FCAE
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0222FCC0: .word _0223B4B0
	thumb_func_end ov74_0222FCA4

	thumb_func_start ov74_0222FCC4
ov74_0222FCC4: ; 0x0222FCC4
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0222FD84 ; =_0223B430
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0222FD88 ; =_0223B45C
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0222FD8C ; =_0223B494
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0222FD90 ; =_0223B478
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0222FD94 ; =_0223B440
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_0222FD84: .word _0223B430
_0222FD88: .word _0223B45C
_0222FD8C: .word _0223B494
_0222FD90: .word _0223B478
_0222FD94: .word _0223B440
	thumb_func_end ov74_0222FCC4

	thumb_func_start ov74_0222FD98
ov74_0222FD98: ; 0x0222FD98
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	bl Save_MysteryGift_get
	mov r1, #0
	ldr r4, [r5, #0x48]
	mvn r1, r1
	add r6, r0, #0
	cmp r4, r1
	bne _0222FDCC
	add r2, r5, #0
	add r2, #0x4c
	ldrh r2, [r2]
	lsr r1, r1, #0x10
	cmp r2, r1
	bne _0222FDCC
	bl Save_MysteryGift_init
	add r0, r7, #0
	mov r1, #0
	bl Save_NowWriteFile_AfterMGInit
	mov r0, #0
	bl OS_ResetSystem
_0222FDCC:
	add r0, r5, #0
	add r0, #0x4c
	ldrh r1, [r0]
	cmp r1, #0x64
	blo _0222FDE0
	cmp r1, #0x98
	bhi _0222FDE0
	mov r0, #0x46
	lsl r0, r0, #6
	orr r4, r0
_0222FDE0:
	cmp r4, #0
	bne _0222FDE8
	mov r4, #0
	mvn r4, r4
_0222FDE8:
#ifdef HEARTGOLD
	mov r0, #0x80
#else
	mov r0, #1
	lsl r0, r0, #8
#endif
	tst r0, r4
	bne _0222FDF2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222FDF2:
	add r0, r5, #0
	add r0, #0x4e
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222FE0E
	add r0, r6, #0
	bl sub_0202DF7C
	cmp r0, #1
	bne _0222FE0E
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0222FE0E:
	add r0, r5, #0
	add r0, #0x4e
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222FE2A
	add r0, r6, #0
	bl SaveMysteryGift_CardFindAvailable
	cmp r0, #0
	bne _0222FE2A
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0222FE2A:
	add r0, r6, #0
	bl SaveMysteryGift_FindAvailable
	cmp r0, #0
	bne _0222FE38
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0222FE38:
	add r5, #0x4e
	ldrb r0, [r5]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222FE48
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_0222FE48:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_0222FD98

	thumb_func_start ov74_0222FE4C
ov74_0222FE4C: ; 0x0222FE4C
	push {r3, lr}
	mov r0, #4
	bl ov74_02231070
	bl ov74_02231724
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_0222FE4C

	thumb_func_start ov74_0222FE5C
ov74_0222FE5C: ; 0x0222FE5C
	push {r3, lr}
	bl ov74_022311F4
	str r0, [sp]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_0222FE5C

	thumb_func_start ov74_0222FE68
ov74_0222FE68: ; 0x0222FE68
	push {r3, lr}
	bl ov74_02231214
	add r1, sp, #0
	strh r0, [r1]
	mov r0, #0
	ldrsh r0, [r1, r0]
	pop {r3, pc}
	thumb_func_end ov74_0222FE68

	thumb_func_start ov74_0222FE78
ov74_0222FE78: ; 0x0222FE78
	push {r4, lr}
	bl ov74_0223107C
	cmp r0, #0xc
	bne _0222FE9A
	bl ov74_0223105C
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0222FE96
	bl ov74_02231724
	mov r0, #1
	str r0, [r4, #0x1c]
_0222FE96:
	mov r0, #1
	pop {r4, pc}
_0222FE9A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222FE78

	thumb_func_start ov74_0222FEA0
ov74_0222FEA0: ; 0x0222FEA0
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0223115C
	mov r3, #0
	add r1, r3, #0
_0222FEAC:
	ldr r2, [r0]
	cmp r2, #0
	beq _0222FEBC
	ldrh r2, [r0, #6]
	cmp r4, r2
	bne _0222FEBC
	strb r1, [r0, #8]
	strb r1, [r0, #0xa]
_0222FEBC:
	add r3, r3, #1
	add r0, #0xc
	cmp r3, #8
	blt _0222FEAC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222FEA0

	thumb_func_start ov74_0222FEC8
ov74_0222FEC8: ; 0x0222FEC8
	push {r3, lr}
	bl ov74_0223115C
	add r1, r0, #0
	add r1, #0x62
	ldrh r3, [r1]
	mov r2, #1
	add r1, r3, #0
	tst r1, r2
	beq _0222FEEE
	add r1, r0, #0
	add r1, #0x62
	ldrh r3, [r1]
	mov r1, #1
	add r0, #0x62
	bic r3, r1
	strh r3, [r0]
	add r0, r2, #0
	pop {r3, pc}
_0222FEEE:
	mov r1, #0x40
	add r2, r3, #0
	tst r2, r1
	beq _0222FF08
	add r1, r0, #0
	add r1, #0x62
	ldrh r2, [r1]
	mov r1, #0x40
	add r0, #0x62
	bic r2, r1
	strh r2, [r0]
	mov r0, #7
	pop {r3, pc}
_0222FF08:
	lsl r1, r1, #6
	tst r1, r3
	beq _0222FF20
	add r1, r0, #0
	add r1, #0x62
	ldrh r2, [r1]
	ldr r1, _0222FF24 ; =0xFFFFEFFF
	add r0, #0x62
	and r1, r2
	strh r1, [r0]
	mov r0, #0xd
	pop {r3, pc}
_0222FF20:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0222FF24: .word 0xFFFFEFFF
	thumb_func_end ov74_0222FEC8

	thumb_func_start ov74_0222FF28
ov74_0222FF28: ; 0x0222FF28
	push {r4, lr}
	bl ov74_0223115C
	add r4, r0, #0
	mov r1, #1
	add r0, #0x60
	strb r1, [r0]
	bl WM_GetAllowedChannel
	add r1, r4, #0
	add r1, #0x62
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0x62
	ldrh r1, [r0]
	cmp r1, #0
	beq _0222FF52
	mov r0, #2
	lsl r0, r0, #0xe
	cmp r1, r0
	bne _0222FF56
_0222FF52:
	mov r0, #0
	pop {r4, pc}
_0222FF56:
	add r0, r4, #0
	mov r1, #0x66
	add r0, #0x61
	strb r1, [r0]
	mov r0, #0
	add r4, #0x64
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov74_0222FF28

	thumb_func_start ov74_0222FF68
ov74_0222FF68: ; 0x0222FF68
	push {r4, lr}
	bl ov74_02231054
	add r4, r0, #0
	bl WM_GetDispersionBeaconPeriod
	strh r0, [r4, #0x18]
	bl WM_GetNextTgid
	strh r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222FF68

	thumb_func_start ov74_0222FF80
ov74_0222FF80: ; 0x0222FF80
	push {r4, lr}
	bl ov74_022310C4
	add r4, r0, #0
	bl ov74_02231100
	str r0, [r4]
	bl ov74_02231054
	ldrh r0, [r0, #0x32]
	strh r0, [r4, #4]
	bl WM_GetDispersionScanPeriod
	strh r0, [r4, #6]
	mov r0, #0xff
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	pop {r4, pc}
	thumb_func_end ov74_0222FF80

	thumb_func_start ov74_0222FFAC
ov74_0222FFAC: ; 0x0222FFAC
	push {r3, r4, r5, r6, r7, lr}
	bl ov74_022310C4
	add r7, r0, #0
	bl WM_GetAllowedChannel
	add r3, r0, #0
	beq _0222FFF8
	ldrh r2, [r7, #4]
	mov r1, #0
	mov r0, #1
	mov ip, r2
	mov r4, #0x1c
_0222FFC6:
	lsr r6, r2, #0x1f
	lsl r5, r2, #0x1c
	sub r5, r5, r6
	ror r5, r4
	add r5, r6, r5
	add r6, r0, #0
	lsl r6, r5
	add r5, r3, #0
	tst r5, r6
	beq _0222FFF0
	mov r0, ip
	add r0, r0, r1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1c
	sub r1, r1, r2
	mov r0, #0x1c
	ror r1, r0
	add r0, r2, r1
	add r0, r0, #1
	strh r0, [r7, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0222FFF0:
	add r1, r1, #1
	add r2, r2, #1
	cmp r1, #0x10
	blt _0222FFC6
_0222FFF8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov74_0222FFAC

	thumb_func_start ov74_0222FFFC
ov74_0222FFFC: ; 0x0222FFFC
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #4]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #8
	bne _02230014
	bl ov74_02231448
	bl ov74_0222FE4C
_02230014:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_0222FFFC

	thumb_func_start ov74_02230018
ov74_02230018: ; 0x02230018
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223002C
	bl ov74_02231448
_0223002C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_02230018

	thumb_func_start ov74_02230030
ov74_02230030: ; 0x02230030
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _02230066
	mov r0, #2
	bl ov74_02231070
	bl ov74_0223107C
	cmp r0, #0xc
	bne _02230052
	bl ov74_022314BC
	mov r0, #2
	bl ov74_02231070
	pop {r3, pc}
_02230052:
	bl ov74_022316E8
	cmp r0, #0
	bne _0223006E
	bl ov74_022314BC
	mov r0, #2
	bl ov74_02231070
	pop {r3, pc}
_02230066:
	bl ov74_02231448
	bl ov74_022314BC
_0223006E:
	pop {r3, pc}
	thumb_func_end ov74_02230030

	thumb_func_start ov74_02230070
ov74_02230070: ; 0x02230070
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _0223009A
	bl ov74_0223107C
	cmp r0, #0xc
	bne _02230092
	bl WM_Finish
	mov r0, #0xc
	bl ov74_02231070
	mov r0, #1
	bl ov74_0223113C
	pop {r3, pc}
_02230092:
	mov r0, #1
	bl ov74_02231070
	pop {r3, pc}
_0223009A:
	bl ov74_02231448
	mov r0, #4
	bl ov74_02231070
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02230070

	thumb_func_start ov74_022300A8
ov74_022300A8: ; 0x022300A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _02230106
	bl ov74_0223115C
	add r4, r0, #0
	add r0, #0x61
	ldrh r1, [r5, #0xa]
	ldrb r0, [r0]
	cmp r0, r1
	ble _022300D0
	add r0, r4, #0
	add r0, #0x61
	strb r1, [r0]
	add r0, r4, #0
	ldrh r1, [r5, #8]
	add r0, #0x64
	strb r1, [r0]
_022300D0:
	bl ov74_0222FEC8
	cmp r0, #0
	beq _022300E6
	bl ov74_022314DC
	cmp r0, #0
	bne _0223010E
	bl ov74_0222FE4C
	pop {r3, r4, r5, pc}
_022300E6:
	add r4, #0x61
	ldrb r0, [r4]
	cmp r0, #0x66
	bhs _02230100
	bl ov74_0222FF68
	bl ov74_02231508
	cmp r0, #0
	bne _0223010E
	bl ov74_0222FE4C
	pop {r3, r4, r5, pc}
_02230100:
	bl ov74_0222FE4C
	pop {r3, r4, r5, pc}
_02230106:
	bl ov74_02231448
	bl ov74_0222FE4C
_0223010E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_022300A8

	thumb_func_start ov74_02230110
ov74_02230110: ; 0x02230110
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _0223012E
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230136
	bl ov74_02231544
	cmp r0, #0
	bne _02230136
	bl ov74_0222FE4C
	pop {r3, pc}
_0223012E:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230136:
	pop {r3, pc}
	thumb_func_end ov74_02230110

	thumb_func_start ov74_02230138
ov74_02230138: ; 0x02230138
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrh r0, [r5, #8]
	bl ov74_0223144C
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _0223014C
	b _0223025E
_0223014C:
	bl ov74_0223115C
	add r4, r0, #0
	mov r0, #8
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	beq _02230162
	b _02230266
_02230162:
	add r0, r4, #0
	add r0, #0x60
	ldrb r0, [r0]
	cmp r0, #1
	bne _02230174
	add r0, r4, #0
	mov r1, #2
	add r0, #0x60
	strb r1, [r0]
_02230174:
	ldrh r0, [r5, #8]
	cmp r0, #7
	bgt _0223018C
	bge _022301AE
	cmp r0, #2
	bgt _02230266
	cmp r0, #0
	blt _02230266
	beq _02230194
	add sp, #0xc
	cmp r0, #2
	pop {r4, r5, pc}
_0223018C:
	cmp r0, #9
	beq _02230254
	add sp, #0xc
	pop {r4, r5, pc}
_02230194:
	bl ov74_02231670
	cmp r0, #0
	bne _022301A4
	bl ov74_0222FE4C
	add sp, #0xc
	pop {r4, r5, pc}
_022301A4:
	mov r0, #0
	bl ov74_0223110C
	add sp, #0xc
	pop {r4, r5, pc}
_022301AE:
	bl ov74_0223115C
	bl ov74_02231458
	add r4, #0x60
	ldrb r0, [r4]
	cmp r0, #2
	bne _02230266
	add r4, r5, #0
	add r4, #0x14
	bl ov74_022311AC
	ldr r1, [r5, #0x14]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r0
	bne _02230266
	bl ov74_022311BC
	ldr r1, [r4]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1c
	cmp r1, r0
	bhi _02230266
	bl ov74_022311CC
	ldr r1, [r4, #4]
	lsr r1, r1, #0x10
	cmp r1, r0
	bne _02230266
	bl ov74_0223115C
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0xa
	bl ov74_0222FE5C
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xa
	bl ov74_0222FE68
	add r1, sp, #0
	strh r0, [r1]
	ldrh r0, [r1]
	ldr r2, [sp, #8]
	add r3, r4, #0
	strh r0, [r1, #2]
	mov r0, #0
_02230212:
	ldr r1, [r3]
	cmp r1, r2
	bne _0223022A
	mov r1, #0xc
	mul r1, r0
	ldrh r0, [r5, #0x10]
	add r1, r4, r1
	add sp, #0xc
	strh r0, [r1, #6]
	mov r0, #1
	strb r0, [r1, #0xa]
	pop {r4, r5, pc}
_0223022A:
	cmp r1, #0
	bne _02230248
	mov r1, #0xc
	mul r1, r0
	str r2, [r4, r1]
	add r0, sp, #0
	ldrh r0, [r0, #2]
	add r1, r4, r1
	add sp, #0xc
	strh r0, [r1, #4]
	ldrh r0, [r5, #0x10]
	strh r0, [r1, #6]
	mov r0, #1
	strb r0, [r1, #0xa]
	pop {r4, r5, pc}
_02230248:
	add r0, r0, #1
	add r3, #0xc
	cmp r0, #8
	blt _02230212
	add sp, #0xc
	pop {r4, r5, pc}
_02230254:
	ldrh r0, [r5, #0x10]
	bl ov74_0222FEA0
	add sp, #0xc
	pop {r4, r5, pc}
_0223025E:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230266:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov74_02230138

	thumb_func_start ov74_0223026C
ov74_0223026C: ; 0x0223026C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	str r0, [sp]
	bl ov74_02231154
	add r7, r0, #0
	add r0, r4, #4
	bl ov74_0222FE5C
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r4, #4
	bl ov74_0222FE68
	add r2, sp, #4
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r6, [sp, #0xc]
	add r1, r7, #0
	strh r0, [r2, #2]
	ldrh r3, [r2, #2]
	mov r0, #0
_0223029A:
	ldr r2, [r1]
	add r5, r1, #0
	add r5, #0x34
	cmp r2, r6
	bne _022302B0
	ldrh r5, [r5]
	cmp r5, r3
	bne _022302B0
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022302B0:
	cmp r2, #0
	bne _022302FC
	mov r1, #0x38
	mul r1, r0
	ldr r0, [sp, #0xc]
	add r5, r4, #0
	str r0, [r7, r1]
	add r0, r7, r1
	add r5, #0x58
	add r3, r0, #4
	mov r2, #0xc
_022302C6:
	ldrh r0, [r5]
	add r5, r5, #2
	strh r0, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _022302C6
	add r3, r7, r1
	add r4, #0x70
	add r3, #0x1c
	mov r2, #0xc
_022302DA:
	ldrh r0, [r4]
	add r4, r4, #2
	strh r0, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _022302DA
	add r0, sp, #4
	ldrh r0, [r0, #2]
	add r1, r7, r1
	strh r0, [r1, #0x34]
	ldr r0, [sp]
	add r1, #0x36
	ldrh r0, [r0, #0x12]
	add sp, #0x10
	strb r0, [r1]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022302FC:
	add r0, r0, #1
	add r1, #0x38
	cmp r0, #8
	blt _0223029A
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov74_0223026C

	thumb_func_start ov74_0223030C
ov74_0223030C: ; 0x0223030C
	push {r3, lr}
	bl ov74_0222FFAC
	bl ov74_02231560
	cmp r0, #0
	bne _0223031E
	bl ov74_0222FE4C
_0223031E:
	pop {r3, pc}
	thumb_func_end ov74_0223030C

	thumb_func_start ov74_02230320
ov74_02230320: ; 0x02230320
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov74_02231100
	add r4, r0, #0
	bl ov74_02231154
	add r5, r0, #0
	bl ov74_0222FE78
	cmp r0, #0
	beq _0223033C
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223033C:
	mov r1, #0
	add r2, r1, #0
	add r3, r5, #0
_02230342:
	ldr r0, [r3]
	cmp r0, #0
	beq _0223034C
	mov r1, #1
	b _02230354
_0223034C:
	add r2, r2, #1
	add r3, #0x38
	cmp r2, #8
	blt _02230342
_02230354:
	cmp r1, #0
	beq _02230372
	mov r0, #7
	lsl r0, r0, #6
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _02230372
	bl ov74_0223161C
	cmp r0, #0
	bne _0223036E
	bl ov74_0222FE4C
_0223036E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02230372:
	add r0, r4, #0
	mov r1, #0xc0
	bl DC_InvalidateRange
	bl ov74_02231154
	bl ov74_02231454
	ldrh r0, [r6, #0x36]
	cmp r0, #8
	blo _022303FC
	bl ov74_022311A0
	ldr r1, [r4, #0x44]
	cmp r1, r0
	bne _022303FC
	add r5, r4, #0
	add r5, #0x50
	bl ov74_022311AC
	ldr r1, [r4, #0x50]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r0
	bne _022303FC
	bl ov74_022311BC
	ldr r1, [r5]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1c
	cmp r1, r0
	bhi _022303FC
	bl ov74_022311CC
	ldr r1, [r5, #4]
	lsr r1, r1, #0x10
	cmp r1, r0
	bne _022303FC
	add r0, r6, #0
	add r1, r4, #0
	bl ov74_0223026C
	cmp r0, #0
	beq _022303EC
	bl ov74_02231154
	ldr r1, _02230400 ; =0x000001C2
	ldrb r2, [r0, r1]
	add r2, r2, #1
	strb r2, [r0, r1]
	ldrb r0, [r0, r1]
	cmp r0, #0x1c
	bls _022303FC
	bl ov74_0223161C
	cmp r0, #0
	bne _022303FC
	bl ov74_0222FE4C
	mov r0, #1
	pop {r4, r5, r6, pc}
_022303EC:
	bl ov74_0223161C
	cmp r0, #0
	bne _022303F8
	bl ov74_0222FE4C
_022303F8:
	mov r0, #1
	pop {r4, r5, r6, pc}
_022303FC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02230400: .word 0x000001C2
	thumb_func_end ov74_02230320

	thumb_func_start ov74_02230404
ov74_02230404: ; 0x02230404
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _0223046A
	bl ov74_02231100
	bl ov74_02231450
	mov r0, #6
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230472
	bl ov74_02231094
	cmp r0, #1
	bne _02230444
	bl ov74_02231154
	ldr r2, _02230474 ; =0x000001C3
	mov r1, #0xf0
	ldrb r3, [r0, r2]
	bic r3, r1
	mov r1, #0x10
	orr r1, r3
	strb r1, [r0, r2]
_02230444:
	ldrh r0, [r4, #8]
	cmp r0, #4
	beq _02230458
	cmp r0, #5
	bne _0223045E
	add r0, r4, #0
	bl ov74_02230320
	cmp r0, #0
	bne _02230472
_02230458:
	bl ov74_0223030C
	pop {r4, pc}
_0223045E:
	ldrh r0, [r4, #2]
	bl ov74_02231448
	bl ov74_0222FE4C
	pop {r4, pc}
_0223046A:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230472:
	pop {r4, pc}
	.balign 4, 0
_02230474: .word 0x000001C3
	thumb_func_end ov74_02230404

	thumb_func_start ov74_02230478
ov74_02230478: ; 0x02230478
	push {r4, r5, r6, lr}
	sub sp, #8
	bl ov74_02231100
	add r4, r0, #0
	bl ov74_02231154
	add r6, r0, #0
	bl ov74_02231054
	bl ov74_0222FE78
	cmp r0, #0
	beq _0223049A
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223049A:
	add r0, r4, #0
	mov r1, #0xc0
	bl DC_InvalidateRange
	bl ov74_02231154
	bl ov74_02231454
	ldrh r0, [r4, #0x3c]
	cmp r0, #8
	blo _02230514
	bl ov74_022311A0
	ldr r1, [r4, #0x44]
	cmp r1, r0
	bne _02230514
	add r5, r4, #0
	add r5, #0x50
	bl ov74_022311AC
	ldr r1, [r4, #0x50]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r0
	bne _02230514
	bl ov74_022311BC
	ldr r1, [r5]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1c
	cmp r1, r0
	bhi _02230514
	bl ov74_022311CC
	ldr r1, [r5, #4]
	lsr r1, r1, #0x10
	cmp r1, r0
	bne _02230514
	add r0, r4, #4
	bl ov74_0222FE5C
	ldr r1, _0223051C ; =0x000001C3
	str r0, [sp]
	ldrb r1, [r6, r1]
	str r0, [sp, #4]
	lsl r1, r1, #0x1c
	lsr r2, r1, #0x1c
	mov r1, #0x38
	mul r1, r2
	ldr r1, [r6, r1]
	cmp r1, r0
	bne _02230514
	bl ov74_0223161C
	cmp r0, #0
	bne _0223050E
	bl ov74_0222FE4C
_0223050E:
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02230514:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0223051C: .word 0x000001C3
	thumb_func_end ov74_02230478

	thumb_func_start ov74_02230520
ov74_02230520: ; 0x02230520
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _02230580
	bl ov74_02231154
	ldr r2, _0223058C ; =0x000001C3
	mov r1, #0xf0
	ldrb r3, [r0, r2]
	bic r3, r1
	mov r1, #0x20
	orr r1, r3
	strb r1, [r0, r2]
	mov r0, #6
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230588
	ldrh r0, [r4, #8]
	cmp r0, #4
	beq _02230562
	cmp r0, #5
	bne _02230574
	bl ov74_02230478
	cmp r0, #0
	bne _02230588
_02230562:
	bl ov74_0222FFAC
	bl ov74_02231584
	cmp r0, #0
	bne _02230588
	bl ov74_0222FE4C
	pop {r4, pc}
_02230574:
	ldrh r0, [r4, #2]
	bl ov74_02231448
	bl ov74_0222FE4C
	pop {r4, pc}
_02230580:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230588:
	pop {r4, pc}
	nop
_0223058C: .word 0x000001C3
	thumb_func_end ov74_02230520

	thumb_func_start ov74_02230590
ov74_02230590: ; 0x02230590
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _022305D4
	mov r0, #7
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	bne _022305DC
	bl ov74_02231094
	cmp r0, #1
	bne _022305DC
	bl ov74_02231154
	ldr r1, _022305E0 ; =0x000001C3
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #2
	bne _022305DC
	bl ov74_02231638
	cmp r0, #0
	bne _022305CC
	bl ov74_0222FE4C
	pop {r3, pc}
_022305CC:
	mov r0, #3
	bl ov74_02231070
	pop {r3, pc}
_022305D4:
	bl ov74_02231448
	bl ov74_0222FE4C
_022305DC:
	pop {r3, pc}
	nop
_022305E0: .word 0x000001C3
	thumb_func_end ov74_02230590

	thumb_func_start ov74_022305E4
ov74_022305E4: ; 0x022305E4
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _0223066A
	mov r0, #9
	bl ov74_02231070
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230672
	ldrh r0, [r4, #8]
	cmp r0, #9
	bhi _0223065E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230614: ; jump table
	.short _0223065E - _02230614 - 2 ; case 0
	.short _0223065E - _02230614 - 2 ; case 1
	.short _0223065E - _02230614 - 2 ; case 2
	.short _0223065E - _02230614 - 2 ; case 3
	.short _0223065E - _02230614 - 2 ; case 4
	.short _0223065E - _02230614 - 2 ; case 5
	.short _02230672 - _02230614 - 2 ; case 6
	.short _02230628 - _02230614 - 2 ; case 7
	.short _02230672 - _02230614 - 2 ; case 8
	.short _02230648 - _02230614 - 2 ; case 9
_02230628:
	ldrh r0, [r4, #0xa]
	bl ov74_0223110C
	mov r0, #1
	bl ov74_02231124
	mov r0, #0
	bl ov74_02231130
	bl ov74_02231670
	cmp r0, #0
	bne _02230672
	bl ov74_0222FE4C
	pop {r4, pc}
_02230648:
	bl ov74_02231118
	cmp r0, #0
	beq _02230656
	mov r0, #1
	bl ov74_02231130
_02230656:
	mov r0, #0
	bl ov74_02231124
	pop {r4, pc}
_0223065E:
	ldrh r0, [r4, #2]
	bl ov74_02231448
	bl ov74_0222FE4C
	pop {r4, pc}
_0223066A:
	bl ov74_02231448
	bl ov74_0222FE4C
_02230672:
	pop {r4, pc}
	thumb_func_end ov74_022305E4

	thumb_func_start ov74_02230674
ov74_02230674: ; 0x02230674
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _022306AE
	cmp r0, #2
	bne _022306C6
	bl ov74_0222FF28
	cmp r0, #0
	beq _022306A8
	bl ov74_0222FEC8
	bl ov74_022314DC
	cmp r0, #0
	beq _022306A8
	bl ov74_0223115C
	mov r1, #1
	add r0, #0x60
	strb r1, [r0]
	mov r0, #3
	bl ov74_02231070
	pop {r3, pc}
_022306A8:
	bl ov74_0222FE4C
	pop {r3, pc}
_022306AE:
	bl ov74_0222FF80
	bl ov74_02231560
	cmp r0, #0
	bne _022306C0
	bl ov74_0222FE4C
	pop {r3, pc}
_022306C0:
	mov r0, #3
	bl ov74_02231070
_022306C6:
	pop {r3, pc}
	thumb_func_end ov74_02230674

	thumb_func_start ov74_022306C8
ov74_022306C8: ; 0x022306C8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #4]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _02230702
	ldrh r0, [r4]
	cmp r0, #0xe
	bne _022306E6
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230712
_022306E6:
	bl ov74_02231094
	cmp r0, #1
	beq _022306FA
	cmp r0, #2
	bne _02230712
	mov r0, #0xa
	bl ov74_02231070
	pop {r4, pc}
_022306FA:
	mov r0, #0xb
	bl ov74_02231070
	pop {r4, pc}
_02230702:
	cmp r0, #9
	beq _02230712
	cmp r0, #0xd
	beq _02230712
	cmp r0, #0xf
	beq _02230712
	bl ov74_0222FE4C
_02230712:
	pop {r4, pc}
	thumb_func_end ov74_022306C8

	thumb_func_start ov74_02230714
ov74_02230714: ; 0x02230714
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov74_02231184
	add r4, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	bne _0223078A
	ldrh r1, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r5, [r4, #0xc]
	bl DC_FlushRange
	ldrh r2, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r1, [r4, #0xc]
	bl MI_CpuCopy8
	bl ov74_022311AC
	ldr r1, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r0
	bne _0223078A
	bl ov74_022311BC
	ldr r1, [r5]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1c
	cmp r1, r0
	bhi _0223078A
	ldr r0, [r4, #0xc]
	bl ov74_022313F0
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r1, r0
	bne _0223078A
	ldr r0, [r4, #0xc]
	bl ov74_0223145C
	ldr r0, [r4, #0xc]
	bl ov74_02231424
	cmp r0, #0
	beq _02230786
	ldr r0, [r5, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x18
	cmp r0, #1
	beq _02230786
	mov r0, #2
	strb r0, [r4, #0x19]
	pop {r4, r5, r6, pc}
_02230786:
	mov r0, #0
	strb r0, [r4, #0x19]
_0223078A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_02230714

	thumb_func_start ov74_0223078C
ov74_0223078C: ; 0x0223078C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov74_02231184
	add r4, r0, #0
	bl ov74_02231094
	cmp r0, #2
	bne _02230814
	ldrb r0, [r4, #0x19]
	cmp r0, #2
	beq _02230814
	ldrh r1, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r5, [r4, #0xc]
	bl DC_FlushRange
	ldrh r2, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r1, [r4, #0xc]
	bl MI_CpuCopy8
	bl ov74_022311AC
	ldr r1, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r0
	bne _02230814
	bl ov74_022311BC
	ldr r1, [r5]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1c
	cmp r1, r0
	bhi _02230814
	ldr r0, [r4, #0xc]
	bl ov74_022313F0
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0xfd
	bne _02230814
	bl ov74_0223115C
	ldrh r5, [r6, #0x12]
	mov r2, #0
	add r3, r0, #0
_022307EE:
	ldrh r1, [r3, #6]
	cmp r5, r1
	bne _0223080C
	mov r1, #0xc
	mul r1, r2
	add r1, r0, r1
	mov r2, #1
	strb r2, [r1, #8]
	mov r0, #3
	strb r0, [r1, #9]
	mov r0, #0xb4
	strb r0, [r4, #0x1a]
	mov r0, #0
	strb r0, [r4, #0x19]
	pop {r4, r5, r6, pc}
_0223080C:
	add r2, r2, #1
	add r3, #0xc
	cmp r2, #8
	blt _022307EE
_02230814:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov74_0223078C

	thumb_func_start ov74_02230818
ov74_02230818: ; 0x02230818
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov74_02231184
	add r4, r0, #0
	ldrb r0, [r4, #0x1c]
	cmp r0, #0xfd
	bne _02230830
	add r0, r6, #0
	bl ov74_0223078C
	pop {r4, r5, r6, pc}
_02230830:
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	beq _0223083C
	ldrb r0, [r4, #0x19]
	cmp r0, #3
	bne _022308D8
_0223083C:
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	bne _022308D8
	ldrh r1, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r5, [r4, #0xc]
	bl DC_FlushRange
	ldrh r2, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r1, [r4, #0xc]
	bl MI_CpuCopy8
	bl ov74_022311AC
	ldr r1, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, r0
	bne _022308D8
	bl ov74_022311BC
	ldr r1, [r5]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1c
	cmp r1, r0
	bhi _022308D8
	ldr r0, [r4, #0xc]
	bl ov74_022313F0
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r1, r0
	bne _022308D8
	ldr r0, [r4, #0xc]
	bl ov74_0223145C
	mov r0, #0
	strb r0, [r4, #0x19]
	ldr r0, [r4, #0xc]
	bl ov74_02231424
	cmp r0, #0
	beq _022308CA
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0xfd
	bne _022308AA
	add r0, r6, #0
	bl ov74_0223078C
	b _022308BC
_022308AA:
	ldr r2, [r5, #0xc]
	ldr r1, [r4, #0xc]
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	add r0, r1, r0
	ldr r1, [r4, #4]
	lsr r2, r2, #8
	bl MI_CpuCopy8
_022308BC:
	ldr r1, [r5, #8]
	ldr r0, _022308DC ; =0xFFFF00FF
	and r0, r1
	str r0, [r5, #8]
	mov r0, #4
	strb r0, [r4, #0x1b]
	pop {r4, r5, r6, pc}
_022308CA:
	ldr r1, [r5, #8]
	ldr r0, _022308DC ; =0xFFFF00FF
	and r1, r0
	mov r0, #1
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r5, #8]
_022308D8:
	pop {r4, r5, r6, pc}
	nop
_022308DC: .word 0xFFFF00FF
	thumb_func_end ov74_02230818

	thumb_func_start ov74_022308E0
ov74_022308E0: ; 0x022308E0
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #4]
	bl ov74_0223144C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _02230962
	ldrh r0, [r4, #4]
	cmp r0, #7
	beq _0223092A
	cmp r0, #9
	beq _02230938
	cmp r0, #0x15
	bne _02230962
	bl ov74_02231064
	cmp r0, #0xa
	beq _0223090A
	cmp r0, #0xb
	bne _02230962
_0223090A:
	bl ov74_02231184
	ldrb r0, [r0, #0x18]
	cmp r0, #1
	beq _0223091A
	cmp r0, #2
	beq _02230922
	pop {r4, pc}
_0223091A:
	add r0, r4, #0
	bl ov74_02230714
	pop {r4, pc}
_02230922:
	add r0, r4, #0
	bl ov74_02230818
	pop {r4, pc}
_0223092A:
	mov r0, #1
	bl ov74_02231124
	mov r0, #0
	bl ov74_02231130
	pop {r4, pc}
_02230938:
	bl ov74_02231118
	cmp r0, #0
	beq _02230946
	mov r0, #1
	bl ov74_02231130
_02230946:
	bl ov74_02231064
	cmp r0, #0xa
	beq _02230954
	cmp r0, #0xb
	beq _0223095C
	pop {r4, pc}
_02230954:
	ldrh r0, [r4, #0x12]
	bl ov74_0222FEA0
	pop {r4, pc}
_0223095C:
	mov r0, #0
	bl ov74_02231124
_02230962:
	pop {r4, pc}
	thumb_func_end ov74_022308E0

	thumb_func_start ov74_02230964
ov74_02230964: ; 0x02230964
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _0223097A
	bl ov74_0222FE78
	cmp r0, #0
	bne _02230984
	bl ov74_02230674
	pop {r3, pc}
_0223097A:
	bl ov74_02231448
	mov r0, #4
	bl ov74_02231070
_02230984:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02230964

	thumb_func_start ov74_02230988
ov74_02230988: ; 0x02230988
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _022309A0
	bl ov74_022314BC
	cmp r0, #0
	beq _022309A8
	mov r0, #2
	bl ov74_02231070
	pop {r3, pc}
_022309A0:
	bl ov74_02231448
	bl ov74_0222FE4C
_022309A8:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02230988

	thumb_func_start ov74_022309AC
ov74_022309AC: ; 0x022309AC
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _022309E2
	mov r0, #0
	bl ov74_0223110C
	bl ov74_0223107C
	cmp r0, #0xc
	bne _022309D2
	bl ov74_02231744
	cmp r0, #0
	beq _022309EC
	mov r0, #3
	bl ov74_02231070
	pop {r3, pc}
_022309D2:
	bl ov74_02231704
	cmp r0, #0
	beq _022309EC
	mov r0, #3
	bl ov74_02231070
	pop {r3, pc}
_022309E2:
	bl ov74_02231448
	mov r0, #4
	bl ov74_02231070
_022309EC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022309AC

	thumb_func_start ov74_022309F0
ov74_022309F0: ; 0x022309F0
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _02230A06
	mov r0, #0xc
	bl ov74_02231070
	mov r0, #1
	bl ov74_0223113C
	pop {r3, pc}
_02230A06:
	bl ov74_02231448
	mov r0, #4
	bl ov74_02231070
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022309F0

	thumb_func_start ov74_02230A14
ov74_02230A14: ; 0x02230A14
	push {r3, lr}
	ldr r0, _02230A30 ; =ov74_0222FFFC
	bl WM_SetIndCallback
	cmp r0, #0
	beq _02230A2A
	mov r0, #4
	bl ov74_02231070
	mov r0, #0
	pop {r3, pc}
_02230A2A:
	mov r0, #1
	pop {r3, pc}
	nop
_02230A30: .word ov74_0222FFFC
	thumb_func_end ov74_02230A14

	thumb_func_start ov74_02230A34
ov74_02230A34: ; 0x02230A34
	push {r3, lr}
	bl ov74_02231064
	cmp r0, #0
	beq _02230A46
	cmp r0, #1
	beq _02230A46
	cmp r0, #2
	bne _02230A4A
_02230A46:
	bl ov74_022314A0
_02230A4A:
	pop {r3, pc}
	thumb_func_end ov74_02230A34

	thumb_func_start ov74_02230A4C
ov74_02230A4C: ; 0x02230A4C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov74_02231054
	ldrh r0, [r0, #0x34]
	cmp r4, r0
	bhi _02230A70
	add r0, r5, #0
	add r1, r4, #0
	bl DC_FlushRange
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov74_02231460
_02230A70:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov74_02230A4C

	thumb_func_start ov74_02230A74
ov74_02230A74: ; 0x02230A74
	mov r0, #0x17
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02230A74

	thumb_func_start ov74_02230A7C
ov74_02230A7C: ; 0x02230A7C
	mov r0, #0x17
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02230A7C

	thumb_func_start ov74_02230A84
ov74_02230A84: ; 0x02230A84
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r0, #0
	bl ov74_02231054
	bl ov74_0223105C
	add r4, r0, #0
	mov r0, #0x1f
	add r1, r7, #0
	and r1, r0
	beq _02230AA2
	mov r0, #0x20
	sub r0, r0, r1
	add r7, r7, r0
_02230AA2:
	mov r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	mov r0, #4
	strb r0, [r4, #3]
	ldr r0, _02230BA8 ; =0x00400131
	str r0, [r4, #4]
	mov r0, #0xf
	strh r1, [r4, #0xc]
	lsl r0, r0, #8
	str r7, [r4, #0x34]
	add r7, r7, r0
	str r7, [r4, #0x38]
	bl ov74_02230A74
	str r0, [r4, #0x2c]
	add r7, r7, r0
	str r7, [r4, #0x3c]
	bl ov74_02230A7C
	add r7, r7, r0
	str r0, [r4, #0x30]
	add r0, r7, #0
	str r7, [r4, #0x28]
	add r0, #0xc0
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x34]
	mov r1, #2
	add r7, #0xe0
	bl WM_Init
	bl ov74_02230A14
	str r0, [r4, #0x10]
	mov r2, #0
	str r2, [r4, #0x14]
	str r2, [r4, #0x18]
	str r2, [r4, #0x1c]
	str r2, [r4, #0x20]
	ldr r0, [r4, #0x40]
	mov r6, #0xff
	bic r0, r6
	add r3, r0, #0
	mov r1, #0xf
	orr r3, r1
	ldr r0, _02230BAC ; =0xFFFFF0FF
	add r1, #0xf1
	and r0, r3
	orr r1, r0
	ldr r0, _02230BB0 ; =0xFFFF0FFF
	and r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	orr r0, r1
	str r0, [r4, #0x40]
	ldr r3, [r5]
	ldr r1, [r4, #0x44]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x18
	add r0, r4, #0
	bic r1, r6
	lsr r3, r3, #0x18
	orr r3, r1
	ldr r1, _02230BAC ; =0xFFFFF0FF
	str r3, [r4, #0x44]
	and r1, r3
	ldr r3, [r5]
	add r0, #0x44
	lsl r3, r3, #0x14
	lsr r3, r3, #0x1c
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x14
	orr r3, r1
	ldr r1, _02230BB0 ; =0xFFFF0FFF
	str r3, [r4, #0x44]
	and r1, r3
	ldr r3, [r5]
	lsl r3, r3, #0x10
	lsr r3, r3, #0x1c
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x10
	orr r1, r3
	str r1, [r4, #0x44]
	ldr r1, [r0]
	ldr r3, [r5]
	lsl r1, r1, #0x10
	lsr r3, r3, #0x10
	lsr r1, r1, #0x10
	lsl r3, r3, #0x10
	orr r1, r3
	str r1, [r0]
	ldr r0, [r5, #8]
	ldr r1, [r5, #4]
	add r3, r4, #0
	b _02230B7C
_02230B64:
	ldrh r6, [r0]
	add r5, r3, #0
	add r5, #0x48
	strh r6, [r5]
	add r5, r3, #0
	ldrh r6, [r1]
	add r5, #0x60
	add r3, r3, #2
	strh r6, [r5]
	add r2, r2, #1
	add r0, r0, #2
	add r1, r1, #2
_02230B7C:
	cmp r0, #0
	beq _02230B84
	cmp r2, #0xc
	blo _02230B64
_02230B84:
	ldr r1, [r4, #0x40]
	ldr r0, [r4, #0x44]
	str r1, [r4, #0x78]
	str r0, [r4, #0x7c]
	bl ov74_02231194
	bl ov74_02231184
	str r7, [r0, #8]
	ldr r0, [r4, #0x2c]
	add r7, r7, r0
	bl ov74_02231184
	str r7, [r0, #0xc]
	bl WM_GetNextTgid
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230BA8: .word 0x00400131
_02230BAC: .word 0xFFFFF0FF
_02230BB0: .word 0xFFFF0FFF
	thumb_func_end ov74_02230A84

	thumb_func_start ov74_02230BB4
ov74_02230BB4: ; 0x02230BB4
	push {r3, r4, r5, lr}
	bl ov74_02231184
	add r4, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	bne _02230BD2
	ldrb r0, [r4, #0x1a]
	sub r0, r0, #1
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _02230C08
	mov r0, #0
	strb r0, [r4, #0x19]
_02230BD2:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _02230C08
	bl ov74_02231260
	mov r1, #0x40
	sub r5, r1, r0
	ldrb r0, [r4, #0x1c]
	add r2, r5, #0
	mov r3, #3
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl ov74_022312C0
	bl ov74_02231260
	add r1, r0, #0
	ldr r0, [r4, #8]
	ldr r2, _02230C0C ; =0x0000FFFF
	add r1, r5, r1
	bl ov74_02230A4C
	mov r0, #1
	strb r0, [r4, #0x19]
	mov r0, #0x3c
	strb r0, [r4, #0x1a]
_02230C08:
	pop {r3, r4, r5, pc}
	nop
_02230C0C: .word 0x0000FFFF
	thumb_func_end ov74_02230BB4

	thumb_func_start ov74_02230C10
ov74_02230C10: ; 0x02230C10
	push {r3, r4, r5, r6, r7, lr}
	bl ov74_02231184
	add r4, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _02230CC6
	ldrb r0, [r4, #0x1c]
	cmp r0, #0xfd
	bne _02230C88
	bl ov74_0223115C
	add r5, r0, #0
	mov r1, #0
	add r2, r5, #0
_02230C2E:
	ldrb r0, [r2, #9]
	cmp r0, #0
	beq _02230C6E
	add r6, r1, #0
	mov r0, #0xc
	mul r6, r0
	add r0, r5, r6
	ldrh r0, [r0, #6]
	mov r1, #1
	mov r2, #0
	lsl r1, r0
	lsl r0, r1, #0x10
	lsr r7, r0, #0x10
	mov r0, #0xfd
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	add r3, r2, #0
	bl ov74_022312C0
	bl ov74_02231260
	add r1, r0, #0
	ldr r0, [r4, #8]
	add r2, r7, #0
	bl ov74_02230A4C
	add r5, #9
	ldrb r0, [r5, r6]
	sub r0, r0, #1
	strb r0, [r5, r6]
	pop {r3, r4, r5, r6, r7, pc}
_02230C6E:
	add r1, r1, #1
	add r2, #0xc
	cmp r1, #8
	blt _02230C2E
	ldrb r0, [r4, #0x1a]
	sub r0, r0, #1
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _02230CC6
	mov r0, #2
	strb r0, [r4, #0x19]
	pop {r3, r4, r5, r6, r7, pc}
_02230C88:
	bl ov74_02231260
	bl ov74_02230A74
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #8]
	lsl r0, r0, #0x10
	lsr r3, r0, #0x18
	bne _02230CAA
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	bne _02230CA6
	mov r0, #2
	strb r0, [r4, #0x19]
	pop {r3, r4, r5, r6, r7, pc}
_02230CA6:
	sub r0, r0, #1
	strb r0, [r4, #0x1b]
_02230CAA:
	ldrb r0, [r4, #0x1c]
	mov r2, #0
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl ov74_022312C0
	bl ov74_02231260
	add r1, r0, #0
	ldr r0, [r4, #8]
	ldr r2, _02230CC8 ; =0x0000FFFF
	bl ov74_02230A4C
_02230CC6:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230CC8: .word 0x0000FFFF
	thumb_func_end ov74_02230C10

	thumb_func_start ov74_02230CCC
ov74_02230CCC: ; 0x02230CCC
	push {r3, lr}
	bl ov74_02231184
	ldrb r0, [r0, #0x18]
	cmp r0, #1
	beq _02230CDE
	cmp r0, #2
	beq _02230CE4
	pop {r3, pc}
_02230CDE:
	bl ov74_02230BB4
	pop {r3, pc}
_02230CE4:
	bl ov74_02230C10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02230CCC

	thumb_func_start ov74_02230CEC
ov74_02230CEC: ; 0x02230CEC
	push {r4, lr}
	bl ov74_02231154
	add r4, r0, #0
	bl ov74_02231064
	cmp r0, #6
	beq _02230D02
	cmp r0, #0xb
	beq _02230D12
	pop {r4, pc}
_02230D02:
	mov r0, #7
	lsl r0, r0, #6
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _02230D16
	sub r1, r1, #1
	strh r1, [r4, r0]
	pop {r4, pc}
_02230D12:
	bl ov74_02230CCC
_02230D16:
	pop {r4, pc}
	thumb_func_end ov74_02230CEC

	thumb_func_start ov74_02230D18
ov74_02230D18: ; 0x02230D18
	push {r3, lr}
	bl ov74_02231064
	cmp r0, #0xa
	bne _02230D26
	bl ov74_02230CCC
_02230D26:
	pop {r3, pc}
	thumb_func_end ov74_02230D18

	thumb_func_start ov74_02230D28
ov74_02230D28: ; 0x02230D28
	push {r3, lr}
	bl ov74_02231064
	cmp r0, #0xc
	beq _02230D6A
	bl ov74_0223107C
	cmp r0, #0xc
	bne _02230D48
	bl ov74_02231064
	cmp r0, #7
	bne _02230D6A
	bl ov74_02231724
	pop {r3, pc}
_02230D48:
	bl ov74_02231094
	cmp r0, #1
	beq _02230D56
	cmp r0, #2
	beq _02230D5C
	b _02230D62
_02230D56:
	bl ov74_02230CEC
	pop {r3, pc}
_02230D5C:
	bl ov74_02230D18
	pop {r3, pc}
_02230D62:
	bl ov74_0223105C
	bl ov74_02231064
_02230D6A:
	pop {r3, pc}
	thumb_func_end ov74_02230D28

	thumb_func_start ov74_02230D6C
ov74_02230D6C: ; 0x02230D6C
	push {r3, lr}
	bl ov74_02231164
	mov r0, #1
	bl ov74_022310A0
	bl ov74_02230A34
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02230D6C

	thumb_func_start ov74_02230D80
ov74_02230D80: ; 0x02230D80
	push {r4, lr}
	bl ov74_02231094
	mov r4, #0
	cmp r0, #1
	bne _02230DAE
	bl ov74_02231154
	ldr r1, _02230DB4 ; =0x000001C3
	ldrb r1, [r0, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	cmp r1, #1
	bne _02230DAE
	add r2, r4, #0
_02230D9E:
	ldr r1, [r0]
	cmp r1, #0
	beq _02230DA6
	add r4, r4, #1
_02230DA6:
	add r2, r2, #1
	add r0, #0x38
	cmp r2, #8
	blo _02230D9E
_02230DAE:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02230DB4: .word 0x000001C3
	thumb_func_end ov74_02230D80

	thumb_func_start ov74_02230DB8
ov74_02230DB8: ; 0x02230DB8
	push {r4, lr}
	add r4, r0, #0
	bl ov74_02231094
	cmp r0, #1
	bne _02230DEA
	bl ov74_02231064
	cmp r0, #7
	bne _02230DEA
	bl ov74_02231154
	ldr r1, _02230DF0 ; =0x000001C3
	ldrb r1, [r0, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	cmp r1, #1
	bne _02230DEA
	mov r1, #0x38
	mul r1, r4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02230DEA
	mov r0, #1
	pop {r4, pc}
_02230DEA:
	mov r0, #0
	pop {r4, pc}
	nop
_02230DF0: .word 0x000001C3
	thumb_func_end ov74_02230DB8

	thumb_func_start ov74_02230DF4
ov74_02230DF4: ; 0x02230DF4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov74_02231094
	cmp r0, #1
	bne _02230E3E
	bl ov74_02231064
	cmp r0, #7
	bne _02230E3E
	bl ov74_02231154
	ldr r2, _02230E40 ; =0x000001C3
	ldrb r3, [r0, r2]
	lsl r1, r3, #0x18
	lsr r1, r1, #0x1c
	cmp r1, #1
	bne _02230E3E
	mov r1, #0x38
	add r5, r4, #0
	mul r5, r1
	ldr r5, [r0, r5]
	cmp r5, #0
	beq _02230E3E
	mov r5, #0xf
	lsl r4, r4, #0x18
	bic r3, r5
	lsr r5, r4, #0x18
	mov r4, #0xf
	and r4, r5
	orr r3, r4
	strb r3, [r0, r2]
	mov r2, #0x78
	lsl r1, r1, #3
	strh r2, [r0, r1]
	bl ov74_02231584
_02230E3E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02230E40: .word 0x000001C3
	thumb_func_end ov74_02230DF4

	thumb_func_start ov74_02230E44
ov74_02230E44: ; 0x02230E44
	push {r4, lr}
	bl ov74_02231094
	mov r4, #0
	cmp r0, #2
	bne _02230E76
	bl ov74_0223115C
	add r1, r0, #0
	add r1, #0x60
	ldrb r1, [r1]
	cmp r1, #2
	bne _02230E76
	add r2, r4, #0
_02230E60:
	ldr r1, [r0]
	cmp r1, #0
	beq _02230E6E
	ldrb r1, [r0, #0xa]
	cmp r1, #0
	beq _02230E6E
	add r4, r4, #1
_02230E6E:
	add r2, r2, #1
	add r0, #0xc
	cmp r2, #8
	blo _02230E60
_02230E76:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_02230E44

	thumb_func_start ov74_02230E7C
ov74_02230E7C: ; 0x02230E7C
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _02230E8C
	mov r0, #0
	pop {r3, pc}
_02230E8C:
	bl WM_GetLinkLevel
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02230E7C

	thumb_func_start ov74_02230E94
ov74_02230E94: ; 0x02230E94
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _02230EA4
	cmp r0, #2
	beq _02230EAA
	b _02230EB0
_02230EA4:
	bl ov74_02230D80
	pop {r3, pc}
_02230EAA:
	bl ov74_02230E44
	pop {r3, pc}
_02230EB0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02230E94

	thumb_func_start ov74_02230EB4
ov74_02230EB4: ; 0x02230EB4
	push {r3, r4, r5, lr}
	bl ov74_02231184
	add r5, r0, #0
	bl ov74_022311DC
	add r4, r0, #0
	bl ov74_02231094
	cmp r0, #1
	bne _02230EE6
	mov r0, #1
	strb r0, [r5, #0x18]
	mov r1, #0
	strb r1, [r5, #0x19]
	add r4, #8
	str r4, [r5]
	str r4, [r5, #4]
	str r1, [r5, #0x10]
	str r1, [r5, #0x14]
	mov r0, #0x78
	strb r0, [r5, #0x1a]
	strb r1, [r5, #0x1b]
	mov r0, #0xfd
	strb r0, [r5, #0x1c]
_02230EE6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02230EB4

	thumb_func_start ov74_02230EE8
ov74_02230EE8: ; 0x02230EE8
	push {r4, lr}
	bl ov74_02231184
	add r4, r0, #0
	bl ov74_022311DC
	mov r1, #1
	strb r1, [r4, #0x18]
	mov r1, #0
	strb r1, [r4, #0x19]
	add r0, #8
	str r0, [r4]
	str r0, [r4, #4]
	mov r0, #0x30
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	mov r0, #0x78
	strb r0, [r4, #0x1a]
	strb r1, [r4, #0x1b]
	mov r0, #0xfe
	strb r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov74_02230EE8

	thumb_func_start ov74_02230F14
ov74_02230F14: ; 0x02230F14
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl ov74_02231184
	cmp r4, #0xf0
	bgt _02230F3E
	mov r1, #2
	strb r1, [r0, #0x18]
	mov r1, #3
	strb r1, [r0, #0x19]
	str r5, [r0]
	str r5, [r0, #4]
	str r6, [r0, #0x10]
	mov r2, #0
	str r2, [r0, #0x14]
	mov r1, #0x78
	strb r1, [r0, #0x1a]
	strb r2, [r0, #0x1b]
	strb r4, [r0, #0x1c]
_02230F3E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_02230F14

	thumb_func_start ov74_02230F40
ov74_02230F40: ; 0x02230F40
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _02230F4E
	cmp r0, #2
	bne _02230F68
_02230F4E:
	bl ov74_02231064
	cmp r0, #0xa
	beq _02230F5A
	cmp r0, #0xb
	bne _02230F68
_02230F5A:
	bl ov74_02231184
	ldrb r0, [r0, #0x19]
	cmp r0, #2
	bne _02230F68
	mov r0, #1
	pop {r3, pc}
_02230F68:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02230F40

	thumb_func_start ov74_02230F6C
ov74_02230F6C: ; 0x02230F6C
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _02230F7A
	cmp r0, #2
	bne _02230F94
_02230F7A:
	bl ov74_02231064
	cmp r0, #0xa
	beq _02230F86
	cmp r0, #0xb
	bne _02230F94
_02230F86:
	bl ov74_02231184
	ldrb r0, [r0, #0x19]
	cmp r0, #2
	bne _02230F94
	mov r0, #1
	pop {r3, pc}
_02230F94:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02230F6C

	thumb_func_start ov74_02230F98
ov74_02230F98: ; 0x02230F98
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #1
	beq _02230FA6
	cmp r0, #2
	bne _02230FD0
_02230FA6:
	bl ov74_02231064
	cmp r0, #0xa
	beq _02230FB2
	cmp r0, #0xb
	bne _02230FD0
_02230FB2:
	bl ov74_02231184
	ldrb r1, [r0, #0x19]
	cmp r1, #0
	bne _02230FD0
	ldr r1, [r0, #0xc]
	ldr r1, [r1, #8]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x18
	bne _02230FD0
	ldrb r0, [r0, #0x1b]
	cmp r0, #4
	bhs _02230FD0
	mov r0, #1
	pop {r3, pc}
_02230FD0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov74_02230F98

	thumb_func_start ov74_02230FD4
ov74_02230FD4: ; 0x02230FD4
	push {r3, lr}
	bl ov74_02231094
	cmp r0, #2
	bne _02231000
	bl ov74_0223115C
	mov r2, #0
_02230FE4:
	ldr r1, [r0]
	cmp r1, #0
	beq _02230FF4
	ldrb r1, [r0, #0xa]
	cmp r1, #0
	beq _02230FF4
	mov r0, #1
	pop {r3, pc}
_02230FF4:
	add r2, r2, #1
	add r0, #0xc
	cmp r2, #8
	blt _02230FE4
	mov r0, #0
	pop {r3, pc}
_02231000:
	bl ov74_02231118
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02230FD4

	thumb_func_start ov74_02231008
ov74_02231008: ; 0x02231008
	push {r4, lr}
	mov r0, #0xc
	bl ov74_02231088
	bl ov74_02231064
	cmp r0, #0
	beq _02231022
	cmp r0, #1
	beq _02231022
	cmp r0, #9
	beq _0223102E
	pop {r4, pc}
_02231022:
	bl WM_Finish
	mov r0, #1
	bl ov74_0223113C
	pop {r4, pc}
_0223102E:
	bl ov74_02231118
	cmp r0, #0
	bne _02231044
	bl ov74_0223105C
	add r4, r0, #0
	bl ov74_02231724
	mov r0, #1
	str r0, [r4, #0x1c]
_02231044:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_02231008

	thumb_func_start ov74_02231048
ov74_02231048: ; 0x02231048
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x20]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02231048

	thumb_func_start ov74_02231054
ov74_02231054: ; 0x02231054
	ldr r0, _02231058 ; =ov74_0223C920
	bx lr
	.balign 4, 0
_02231058: .word ov74_0223C920
	thumb_func_end ov74_02231054

	thumb_func_start ov74_0223105C
ov74_0223105C: ; 0x0223105C
	ldr r0, _02231060 ; =ov74_0223D0C4
	bx lr
	.balign 4, 0
_02231060: .word ov74_0223D0C4
	thumb_func_end ov74_0223105C

	thumb_func_start ov74_02231064
ov74_02231064: ; 0x02231064
	push {r3, lr}
	bl ov74_0223105C
	ldrb r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02231064

	thumb_func_start ov74_02231070
ov74_02231070: ; 0x02231070
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0223105C
	strb r4, [r0]
	pop {r4, pc}
	thumb_func_end ov74_02231070

	thumb_func_start ov74_0223107C
ov74_0223107C: ; 0x0223107C
	push {r3, lr}
	bl ov74_0223105C
	ldrb r0, [r0, #1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_0223107C

	thumb_func_start ov74_02231088
ov74_02231088: ; 0x02231088
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0223105C
	strb r4, [r0, #1]
	pop {r4, pc}
	thumb_func_end ov74_02231088

	thumb_func_start ov74_02231094
ov74_02231094: ; 0x02231094
	push {r3, lr}
	bl ov74_0223105C
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02231094

	thumb_func_start ov74_022310A0
ov74_022310A0: ; 0x022310A0
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0223105C
	strb r4, [r0, #2]
	pop {r4, pc}
	thumb_func_end ov74_022310A0

	thumb_func_start ov74_022310AC
ov74_022310AC: ; 0x022310AC
	push {r3, lr}
	bl ov74_0223105C
	ldrb r0, [r0, #3]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022310AC

	thumb_func_start ov74_022310B8
ov74_022310B8: ; 0x022310B8
	push {r4, lr}
	add r4, r0, #0
	bl ov74_02231054
	strh r4, [r0, #0x32]
	pop {r4, pc}
	thumb_func_end ov74_022310B8

	thumb_func_start ov74_022310C4
ov74_022310C4: ; 0x022310C4
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x24]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022310C4

	thumb_func_start ov74_022310D0
ov74_022310D0: ; 0x022310D0
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x2c]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022310D0

	thumb_func_start ov74_022310DC
ov74_022310DC: ; 0x022310DC
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x30]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022310DC

	thumb_func_start ov74_022310E8
ov74_022310E8: ; 0x022310E8
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x38]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022310E8

	thumb_func_start ov74_022310F4
ov74_022310F4: ; 0x022310F4
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x3c]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022310F4

	thumb_func_start ov74_02231100
ov74_02231100: ; 0x02231100
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x28]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02231100

	thumb_func_start ov74_0223110C
ov74_0223110C: ; 0x0223110C
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0223105C
	strh r4, [r0, #0xc]
	pop {r4, pc}
	thumb_func_end ov74_0223110C

	thumb_func_start ov74_02231118
ov74_02231118: ; 0x02231118
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x14]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02231118

	thumb_func_start ov74_02231124
ov74_02231124: ; 0x02231124
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0223105C
	str r4, [r0, #0x14]
	pop {r4, pc}
	thumb_func_end ov74_02231124

	thumb_func_start ov74_02231130
ov74_02231130: ; 0x02231130
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0223105C
	str r4, [r0, #0x18]
	pop {r4, pc}
	thumb_func_end ov74_02231130

	thumb_func_start ov74_0223113C
ov74_0223113C: ; 0x0223113C
	push {r4, lr}
	add r4, r0, #0
	bl ov74_0223105C
	str r4, [r0, #0x20]
	pop {r4, pc}
	thumb_func_end ov74_0223113C

	thumb_func_start ov74_02231148
ov74_02231148: ; 0x02231148
	push {r3, lr}
	bl ov74_0223105C
	add r0, #0x90
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02231148

	thumb_func_start ov74_02231154
ov74_02231154: ; 0x02231154
	ldr r3, _02231158 ; =ov74_02231148
	bx r3
	.balign 4, 0
_02231158: .word ov74_02231148
	thumb_func_end ov74_02231154

	thumb_func_start ov74_0223115C
ov74_0223115C: ; 0x0223115C
	ldr r3, _02231160 ; =ov74_02231148
	bx r3
	.balign 4, 0
_02231160: .word ov74_02231148
	thumb_func_end ov74_0223115C

	thumb_func_start ov74_02231164
ov74_02231164: ; 0x02231164
	push {r4, lr}
	bl ov74_02231154
	mov r2, #0x71
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r1, #0x46
	lsl r1, r1, #2
	add r0, r1, #0
	add r0, #0xa8
	strh r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_02231164

	thumb_func_start ov74_02231184
ov74_02231184: ; 0x02231184
	push {r3, lr}
	bl ov74_0223105C
	mov r1, #0x95
	lsl r1, r1, #2
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02231184

	thumb_func_start ov74_02231194
ov74_02231194: ; 0x02231194
	push {r3, lr}
	bl ov74_02231184
	mov r1, #0
	strb r1, [r0, #0x18]
	pop {r3, pc}
	thumb_func_end ov74_02231194

	thumb_func_start ov74_022311A0
ov74_022311A0: ; 0x022311A0
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022311A0

	thumb_func_start ov74_022311AC
ov74_022311AC: ; 0x022311AC
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x40]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022311AC

	thumb_func_start ov74_022311BC
ov74_022311BC: ; 0x022311BC
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x40]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1c
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022311BC

	thumb_func_start ov74_022311CC
ov74_022311CC: ; 0x022311CC
	push {r3, lr}
	bl ov74_0223105C
	ldr r0, [r0, #0x44]
	lsr r0, r0, #0x10
	pop {r3, pc}
	thumb_func_end ov74_022311CC

	thumb_func_start ov74_022311D8
ov74_022311D8: ; 0x022311D8
	mov r0, #0x38
	bx lr
	thumb_func_end ov74_022311D8

	thumb_func_start ov74_022311DC
ov74_022311DC: ; 0x022311DC
	push {r3, lr}
	bl ov74_0223105C
	add r0, #0x40
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022311DC

	thumb_func_start ov74_022311E8
ov74_022311E8: ; 0x022311E8
	push {r3, lr}
	bl ov74_0223105C
	add r0, #0x78
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022311E8

	thumb_func_start ov74_022311F4
ov74_022311F4: ; 0x022311F4
	push {r3}
	sub sp, #4
	mov r2, #0
	str r2, [sp]
	add r3, sp, #0
_022311FE:
	add r1, r0, r2
	ldrb r1, [r1, #2]
	add r2, r2, #1
	strb r1, [r3]
	add r3, r3, #1
	cmp r2, #4
	blo _022311FE
	ldr r0, [sp]
	add sp, #4
	pop {r3}
	bx lr
	thumb_func_end ov74_022311F4

	thumb_func_start ov74_02231214
ov74_02231214: ; 0x02231214
	push {r3}
	sub sp, #4
	mov r2, #0
	add r1, sp, #0
	strh r2, [r1]
	add r3, sp, #0
_02231220:
	ldrb r1, [r0, r2]
	add r2, r2, #1
	strb r1, [r3]
	add r3, r3, #1
	cmp r2, #2
	blo _02231220
	add r1, sp, #0
	mov r0, #0
	ldrsh r0, [r1, r0]
	add sp, #4
	pop {r3}
	bx lr
	thumb_func_end ov74_02231214

	thumb_func_start ov74_02231238
ov74_02231238: ; 0x02231238
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, _0223125C ; =0x00002710
	add r6, r0, #0
	add r4, r2, #0
	bl _u32_div_f
	str r1, [r5]
	ldr r1, _0223125C ; =0x00002710
	add r0, r6, #0
	bl _u32_div_f
	ldr r1, _0223125C ; =0x00002710
	bl _u32_div_f
	str r1, [r4]
	pop {r4, r5, r6, pc}
	nop
_0223125C: .word 0x00002710
	thumb_func_end ov74_02231238

	thumb_func_start ov74_02231260
ov74_02231260: ; 0x02231260
	mov r0, #0x10
	bx lr
	thumb_func_end ov74_02231260

	thumb_func_start ov74_02231264
ov74_02231264: ; 0x02231264
	push {r4, lr}
	ldr r0, _02231278 ; =0x04000006
	ldrh r4, [r0]
	bl OS_GetTick
	add r1, r0, r4
	mov r0, #1
	bic r1, r0
	add r0, r1, #1
	pop {r4, pc}
	.balign 4, 0
_02231278: .word 0x04000006
	thumb_func_end ov74_02231264

	thumb_func_start ov74_0223127C
ov74_0223127C: ; 0x0223127C
	push {r4, r5, r6, r7}
	add r3, r0, #0
	mov r0, #0
	lsr r1, r1, #2
	beq _022312B2
	ldr r4, _022312B8 ; =0x00269EC3
_02231288:
	ldr r5, _022312BC ; =0x5D588B65
	ldr r6, _022312BC ; =0x5D588B65
	mul r5, r3
	ldr r3, _022312B8 ; =0x00269EC3
	add r0, r0, #1
	add r3, r5, r3
	lsr r5, r3, #0x10
	mul r6, r3
	add r3, r6, r4
	lsl r5, r5, #0x10
	lsr r7, r3, #0x10
	lsr r5, r5, #0x10
	lsl r7, r7, #0x10
	ldr r6, [r2]
	lsl r5, r5, #0x10
	lsr r7, r7, #0x10
	orr r5, r7
	eor r5, r6
	stmia r2!, {r5}
	cmp r0, r1
	blo _02231288
_022312B2:
	add r0, r3, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_022312B8: .word 0x00269EC3
_022312BC: .word 0x5D588B65
	thumb_func_end ov74_0223127C

	thumb_func_start ov74_022312C0
ov74_022312C0: ; 0x022312C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	str r3, [sp]
	bl ov74_022311DC
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0xff
	bic r0, r1
	ldr r1, [r4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	orr r1, r0
	ldr r0, _022313E4 ; =0xFFFFF0FF
	str r1, [r5]
	and r0, r1
	ldr r1, [r4]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1c
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x14
	orr r1, r0
	ldr r0, _022313E8 ; =0xFFFF0FFF
	str r1, [r5]
	and r0, r1
	ldr r1, [r4]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x1c
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x10
	orr r0, r1
	str r0, [r5]
	bl ov74_02231264
	ldr r1, [r5]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	lsl r0, r0, #0x10
	orr r0, r1
	str r0, [r5]
	ldr r2, [r4, #4]
	ldr r1, [r5, #4]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r0, #0xff
	lsl r2, r2, #0x18
	bic r1, r0
	lsr r2, r2, #0x18
	orr r2, r1
	ldr r1, _022313E4 ; =0xFFFFF0FF
	str r2, [r5, #4]
	and r1, r2
	ldr r2, [r4, #4]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x1c
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x14
	orr r2, r1
	ldr r1, _022313E8 ; =0xFFFF0FFF
	str r2, [r5, #4]
	and r1, r2
	ldr r2, [r4, #4]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1c
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x10
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [r5, #4]
	ldr r1, [r5, #8]
	bic r1, r0
	ldr r0, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	orr r1, r0
	ldr r0, _022313EC ; =0xFFFF00FF
	and r0, r1
	ldr r1, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r0, r1
	str r0, [r5, #8]
	mov r0, #0
	add r1, r7, #0
	add r2, r6, #0
	bl SVC_GetCRC16
	ldr r1, [r5, #8]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	orr r0, r1
	str r0, [r5, #8]
	bl ov74_02231260
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x18
	ldr r1, [r5, #0xc]
	mov r2, #0xff
	bic r1, r2
	lsr r0, r0, #0x18
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	lsl r0, r6, #8
	orr r0, r1
	str r0, [r5, #0xc]
	cmp r6, #0
	beq _022313BE
	ldr r1, [r5, #0xc]
	add r0, r7, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r1, r5, r1
	add r2, r6, #0
	bl MI_CpuCopy8
_022313BE:
	add r0, r5, #0
	bl ov74_0223145C
	ldr r0, [r4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _022313E2
	ldr r1, [r5, #0xc]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r1, r6, r1
	lsr r0, r0, #0x10
	sub r1, r1, #4
	add r2, r5, #4
	bl ov74_0223127C
_022313E2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022313E4: .word 0xFFFFF0FF
_022313E8: .word 0xFFFF0FFF
_022313EC: .word 0xFFFF00FF
	thumb_func_end ov74_022312C0

	thumb_func_start ov74_022313F0
ov74_022313F0: ; 0x022313F0
	push {r4, lr}
	add r4, r0, #0
	bl ov74_022311DC
	ldr r0, [r4]
	lsl r1, r0, #0x10
	lsr r1, r1, #0x1c
	cmp r1, #1
	bne _02231420
	lsr r0, r0, #0x10
	mov r1, #0xc
	add r2, r4, #4
	bl ov74_0223127C
	ldr r1, [r4, #0xc]
	add r4, #0x10
	lsl r2, r1, #0x18
	lsr r2, r2, #0x18
	lsr r1, r1, #8
	add r1, r2, r1
	sub r1, #0x10
	add r2, r4, #0
	bl ov74_0223127C
_02231420:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_022313F0

	thumb_func_start ov74_02231424
ov74_02231424: ; 0x02231424
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0xc]
	mov r0, #0
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	add r1, r4, r1
	lsr r2, r2, #8
	bl SVC_GetCRC16
	ldr r1, [r4, #8]
	lsr r1, r1, #0x10
	cmp r1, r0
	bne _02231444
	mov r0, #1
	pop {r4, pc}
_02231444:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov74_02231424

	thumb_func_start ov74_02231448
ov74_02231448: ; 0x02231448
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02231448

	thumb_func_start ov74_0223144C
ov74_0223144C: ; 0x0223144C
	bx lr
	.balign 4, 0
	thumb_func_end ov74_0223144C

	thumb_func_start ov74_02231450
ov74_02231450: ; 0x02231450
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02231450

	thumb_func_start ov74_02231454
ov74_02231454: ; 0x02231454
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02231454

	thumb_func_start ov74_02231458
ov74_02231458: ; 0x02231458
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02231458

	thumb_func_start ov74_0223145C
ov74_0223145C: ; 0x0223145C
	bx lr
	.balign 4, 0
	thumb_func_end ov74_0223145C

	thumb_func_start ov74_02231460
ov74_02231460: ; 0x02231460
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl ov74_022310AC
	lsl r0, r0, #0x10
	lsl r3, r5, #0x10
	lsr r0, r0, #0x10
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _0223149C ; =ov74_02230018
	mov r1, #0
	add r2, r6, #0
	lsr r3, r3, #0x10
	bl WM_SetMPDataToPortEx
	cmp r0, #2
	beq _02231496
	bl ov74_02231448
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02231496:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223149C: .word ov74_02230018
	thumb_func_end ov74_02231460

	thumb_func_start ov74_022314A0
ov74_022314A0: ; 0x022314A0
	push {r3, lr}
	ldr r0, _022314B8 ; =ov74_02230030
	bl WM_Enable
	cmp r0, #2
	beq _022314B4
	bl ov74_02231448
	mov r0, #0
	pop {r3, pc}
_022314B4:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_022314B8: .word ov74_02230030
	thumb_func_end ov74_022314A0

	thumb_func_start ov74_022314BC
ov74_022314BC: ; 0x022314BC
	push {r3, lr}
	ldr r0, _022314D8 ; =ov74_02230070
	bl WM_Disable
	cmp r0, #2
	beq _022314D4
	bl ov74_02231448
	bl OS_Terminate
	mov r0, #0
	pop {r3, pc}
_022314D4:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_022314D8: .word ov74_02230070
	thumb_func_end ov74_022314BC

	thumb_func_start ov74_022314DC
ov74_022314DC: ; 0x022314DC
	push {r3, lr}
	add r3, r0, #0
	mov r0, #0x1e
	str r0, [sp]
	lsl r3, r3, #0x10
	ldr r0, _02231504 ; =ov74_022300A8
	mov r1, #3
	mov r2, #0x11
	lsr r3, r3, #0x10
	bl WM_MeasureChannel
	cmp r0, #2
	beq _022314FE
	bl ov74_02231448
	mov r0, #0
	pop {r3, pc}
_022314FE:
	mov r0, #1
	pop {r3, pc}
	nop
_02231504: .word ov74_022300A8
	thumb_func_end ov74_022314DC

	thumb_func_start ov74_02231508
ov74_02231508: ; 0x02231508
	push {r3, r4, r5, lr}
	bl ov74_02231054
	add r5, r0, #0
	bl ov74_022311DC
	add r4, r0, #0
	bl ov74_0223115C
	add r0, #0x64
	ldrb r0, [r0]
	strh r0, [r5, #0x32]
	str r4, [r5]
	bl ov74_022311D8
	strh r0, [r5, #4]
	ldr r0, _02231540 ; =ov74_02230110
	add r1, r5, #0
	bl WM_SetParentParameter
	cmp r0, #2
	beq _0223153C
	bl ov74_02231448
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223153C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02231540: .word ov74_02230110
	thumb_func_end ov74_02231508

	thumb_func_start ov74_02231544
ov74_02231544: ; 0x02231544
	push {r3, lr}
	ldr r0, _0223155C ; =ov74_02230138
	bl WM_StartParent
	cmp r0, #2
	beq _02231558
	bl ov74_02231448
	mov r0, #0
	pop {r3, pc}
_02231558:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0223155C: .word ov74_02230138
	thumb_func_end ov74_02231544

	thumb_func_start ov74_02231560
ov74_02231560: ; 0x02231560
	push {r3, lr}
	bl ov74_022310C4
	add r1, r0, #0
	ldr r0, _02231580 ; =ov74_02230404
	bl WM_StartScan
	cmp r0, #2
	beq _0223157A
	bl ov74_02231448
	mov r0, #0
	pop {r3, pc}
_0223157A:
	mov r0, #1
	pop {r3, pc}
	nop
_02231580: .word ov74_02230404
	thumb_func_end ov74_02231560

	thumb_func_start ov74_02231584
ov74_02231584: ; 0x02231584
	push {r3, r4, r5, lr}
	bl ov74_022310C4
	add r4, r0, #0
	bl ov74_02231154
	ldr r2, _02231614 ; =0x000001C3
	mov r3, #0x38
	ldrb r1, [r0, r2]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	add r5, r1, #0
	mul r5, r3
	add r1, r0, r5
	add r1, #0x34
	ldrb r1, [r1]
	strb r1, [r4, #8]
	ldrb r1, [r0, r2]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	add r5, r1, #0
	mul r5, r3
	add r1, r0, r5
	add r1, #0x35
	ldrb r1, [r1]
	strb r1, [r4, #9]
	ldrb r1, [r0, r2]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	add r5, r1, #0
	mul r5, r3
	ldrb r1, [r0, r5]
	strb r1, [r4, #0xa]
	ldrb r1, [r0, r2]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	add r5, r1, #0
	mul r5, r3
	add r1, r0, r5
	ldrb r1, [r1, #1]
	strb r1, [r4, #0xb]
	ldrb r1, [r0, r2]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	add r5, r1, #0
	mul r5, r3
	add r1, r0, r5
	ldrb r1, [r1, #2]
	strb r1, [r4, #0xc]
	ldrb r1, [r0, r2]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	add r2, r1, #0
	mul r2, r3
	add r0, r0, r2
	ldrb r0, [r0, #3]
	strb r0, [r4, #0xd]
	bl ov74_022310C4
	add r1, r0, #0
	ldr r0, _02231618 ; =ov74_02230520
	bl WM_StartScan
	cmp r0, #2
	beq _0223160E
	bl ov74_02231448
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223160E:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02231614: .word 0x000001C3
_02231618: .word ov74_02230520
	thumb_func_end ov74_02231584

	thumb_func_start ov74_0223161C
ov74_0223161C: ; 0x0223161C
	push {r3, lr}
	ldr r0, _02231634 ; =ov74_02230590
	bl WM_EndScan
	cmp r0, #2
	beq _02231630
	bl ov74_02231448
	mov r0, #0
	pop {r3, pc}
_02231630:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02231634: .word ov74_02230590
	thumb_func_end ov74_0223161C

	thumb_func_start ov74_02231638
ov74_02231638: ; 0x02231638
	push {r3, r4, lr}
	sub sp, #4
	bl ov74_022311E8
	add r4, r0, #0
	bl ov74_02231100
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223166C ; =ov74_022305E4
	add r2, r4, #0
	mov r3, #1
	bl WM_StartConnectEx
	cmp r0, #2
	beq _02231664
	bl ov74_02231448
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_02231664:
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223166C: .word ov74_022305E4
	thumb_func_end ov74_02231638

	thumb_func_start ov74_02231670
ov74_02231670: ; 0x02231670
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _022316E0 ; =ov74_022308E0
	mov r0, #4
	mov r2, #0
	bl WM_SetPortCallback
	cmp r0, #0
	beq _0223168C
	bl ov74_02231448
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223168C:
	bl ov74_02231054
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	bne _0223169A
	mov r5, #1
	b _0223169C
_0223169A:
	mov r5, #0
_0223169C:
	bl ov74_022310F4
	add r6, r0, #0
	bl ov74_022310DC
	add r4, r0, #0
	bl ov74_022310E8
	add r7, r0, #0
	bl ov74_022310D0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	lsl r2, r4, #0x10
	ldr r0, _022316E4 ; =ov74_022306C8
	add r1, r6, #0
	lsr r2, r2, #0x10
	add r3, r7, #0
	bl WM_StartMP
	cmp r0, #2
	beq _022316DA
	bl ov74_02231448
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022316DA:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022316E0: .word ov74_022308E0
_022316E4: .word ov74_022306C8
	thumb_func_end ov74_02231670

	thumb_func_start ov74_022316E8
ov74_022316E8: ; 0x022316E8
	push {r3, lr}
	ldr r0, _02231700 ; =ov74_02230964
	bl WM_PowerOn
	cmp r0, #2
	beq _022316FC
	bl ov74_02231448
	mov r0, #0
	pop {r3, pc}
_022316FC:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02231700: .word ov74_02230964
	thumb_func_end ov74_022316E8

	thumb_func_start ov74_02231704
ov74_02231704: ; 0x02231704
	push {r3, lr}
	ldr r0, _02231720 ; =ov74_02230988
	bl WM_PowerOff
	cmp r0, #2
	beq _0223171C
	bl ov74_02231448
	bl OS_Terminate
	mov r0, #0
	pop {r3, pc}
_0223171C:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02231720: .word ov74_02230988
	thumb_func_end ov74_02231704

	thumb_func_start ov74_02231724
ov74_02231724: ; 0x02231724
	push {r3, lr}
	ldr r0, _02231740 ; =ov74_022309AC
	bl WM_Reset
	cmp r0, #2
	beq _0223173C
	bl ov74_02231448
	bl OS_Terminate
	mov r0, #0
	pop {r3, pc}
_0223173C:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02231740: .word ov74_022309AC
	thumb_func_end ov74_02231724

	thumb_func_start ov74_02231744
ov74_02231744: ; 0x02231744
	push {r3, lr}
	ldr r0, _02231760 ; =ov74_022309F0
	bl WM_End
	cmp r0, #2
	beq _0223175C
	bl ov74_02231448
	bl OS_Terminate
	mov r0, #0
	pop {r3, pc}
_0223175C:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02231760: .word ov74_022309F0
	thumb_func_end ov74_02231744

	thumb_func_start ov74_02231764
ov74_02231764: ; 0x02231764
	cmp r0, #0
	bgt _0223176C
	mov r0, #1
	bx lr
_0223176C:
	cmp r0, #0xfb
	bgt _02231774
	mov r0, #0
	bx lr
_02231774:
	ldr r1, _0223178C ; =0x00000115
	cmp r0, r1
	bge _0223177E
	mov r0, #1
	bx lr
_0223177E:
	add r1, #0x86
	cmp r0, r1
	ble _02231788
	mov r0, #1
	bx lr
_02231788:
	mov r0, #0
	bx lr
	.balign 4, 0
_0223178C: .word 0x00000115
	thumb_func_end ov74_02231764

	thumb_func_start ov74_02231790
ov74_02231790: ; 0x02231790
	push {r4, lr}
	add r4, r0, #0
	bl PmAgbCartridge_GetVersionInternal
	cmp r0, #4
	bhi _022317D0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022317A8: ; jump table
	.short _022317B2 - _022317A8 - 2 ; case 0
	.short _022317B8 - _022317A8 - 2 ; case 1
	.short _022317BE - _022317A8 - 2 ; case 2
	.short _022317C4 - _022317A8 - 2 ; case 3
	.short _022317CA - _022317A8 - 2 ; case 4
_022317B2:
	mov r0, #VERSION_RUBY
	str r0, [r4]
	pop {r4, pc}
_022317B8:
	mov r0, #VERSION_SAPPHIRE
	str r0, [r4]
	pop {r4, pc}
_022317BE:
	mov r0, #VERSION_LEAF_GREEN
	str r0, [r4]
	pop {r4, pc}
_022317C4:
	mov r0, #VERSION_FIRE_RED
	str r0, [r4]
	pop {r4, pc}
_022317CA:
	mov r0, #VERSION_EMERALD
	str r0, [r4]
	pop {r4, pc}
_022317D0:
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov74_02231790

	thumb_func_start ov74_022317D8
ov74_022317D8: ; 0x022317D8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r1, _0223192C ; =0x0000E890
	add r5, r0, #0
	add r4, r5, r1
	ldr r1, [r4]
	cmp r1, #9
	bls _022317EA
	b _02231924
_022317EA:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022317F6: ; jump table
	.short _0223180A - _022317F6 - 2 ; case 0
	.short _0223182A - _022317F6 - 2 ; case 1
	.short _02231842 - _022317F6 - 2 ; case 2
	.short _02231852 - _022317F6 - 2 ; case 3
	.short _02231862 - _022317F6 - 2 ; case 4
	.short _0223187E - _022317F6 - 2 ; case 5
	.short _02231892 - _022317F6 - 2 ; case 6
	.short _022318AE - _022317F6 - 2 ; case 7
	.short _022318DA - _022317F6 - 2 ; case 8
	.short _02231900 - _022317F6 - 2 ; case 9
_0223180A:
	bl ov74_0223195C
	ldr r0, [r5, #0x10]
	bl sub_020270F8
	add r5, r0, #0
	bl ov74_02233F68
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0202EC28
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_0223182A:
	bl OS_GetTick
	mov r2, #0x78
	mov r3, #0
	bl _ull_mod
	add r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_02231842:
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	bne _02231924
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_02231852:
	ldr r0, [r5, #0x10]
	mov r1, #2
	bl Save_PrepareForAsyncWrite
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_02231862:
	ldr r0, [r5, #0x10]
	bl Save_WriteFileAsync
	cmp r0, #3
	bne _02231872
	add sp, #0x10
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02231872:
	cmp r0, #1
	bne _02231924
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_0223187E:
	mov r0, #0
	add r1, r0, #0
	add r2, sp, #0
	mov r3, #0x10
	bl CTRDG_ReadAgbFlash
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_02231892:
	bl ov74_02233E8C
	cmp r0, #0
	bne _022318A6
	mov r0, #1
	bl Sys_ClearSleepDisableFlag
	add sp, #0x10
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_022318A6:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_022318AE:
	bl ov74_02233F14
	cmp r0, #9
	beq _02231924
	bl ov74_02233F14
	cmp r0, #0xb
	bne _022318C6
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_022318C6:
	bl ov74_02233ED4
	cmp r0, #8
	bne _02231924
	mov r0, #1
	bl Sys_ClearSleepDisableFlag
	add sp, #0x10
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_022318DA:
	ldr r0, [r5, #0x10]
	bl Save_WriteFileAsync
	cmp r0, #3
	bne _022318EA
	add sp, #0x10
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_022318EA:
	cmp r0, #2
	bne _022318DA
	bl ov74_02233ED4
	mov r0, #1
	bl Sys_SetSleepDisableFlag
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02231924
_02231900:
	bl ov74_02233ED4
	cmp r0, #8
	bne _02231914
	mov r0, #1
	bl Sys_ClearSleepDisableFlag
	add sp, #0x10
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02231914:
	cmp r0, #0
	bne _02231924
	mov r0, #1
	bl Sys_ClearSleepDisableFlag
	add sp, #0x10
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_02231924:
	mov r0, #0xa
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223192C: .word 0x0000E890
	thumb_func_end ov74_022317D8

	thumb_func_start ov74_02231930
ov74_02231930: ; 0x02231930
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl sub_020270F8
	add r4, r0, #0
	bl ov74_02233F68
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202EC28
	mov r0, #4
	bl sub_0201A728
	ldr r0, [r5, #0x10]
	bl SaveGameNormal
	mov r0, #4
	bl sub_0201A738
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02231930

	thumb_func_start ov74_0223195C
ov74_0223195C: ; 0x0223195C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xf4
	add r7, r0, #0
	ldr r0, [r7, #0x10]
	bl sub_020270F8
	str r0, [sp]
	add r0, sp, #8
	bl Mon_GetBoxMon
	add r6, r0, #0
	mov r4, #0
	add r5, r7, #0
_02231976:
	ldr r0, _022319F4 ; =0x0000E880
	mov r1, #0x3d
	lsl r1, r1, #4
	ldr r0, [r7, r0]
	ldr r2, [r5, r1]
	mov r1, #0x96
	lsl r1, r1, #4
	add r0, r0, #4
	mul r1, r2
	add r0, r0, r1
	mov r1, #0xf3
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	mov r1, #0x50
	mul r1, r2
	add r0, r0, r1
	add r1, r6, #0
	bl MigrateBoxMon
	ldr r0, [sp]
	add r1, r6, #0
	add r2, r4, #0
	bl sub_0202EC14
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #6
	blt _02231976
	mov r5, #0
	add r0, sp, #4
	strh r5, [r0]
	add r4, r7, #0
	sub r6, r5, #1
_022319B8:
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r0, #4
	ldr r1, [r4, r0]
	cmp r2, r6
	beq _022319E6
	cmp r1, #0xe
	beq _022319E6
	ldr r0, _022319F4 ; =0x0000E880
	mov r3, #0x96
	ldr r0, [r7, r0]
	lsl r3, r3, #4
	mul r3, r1
	add r0, r0, #4
	mov r1, #0x50
	mul r1, r2
	add r0, r0, r3
	add r0, r0, r1
	mov r1, #0xb
	add r2, sp, #4
	bl ov74_022348B0
_022319E6:
	add r5, r5, #1
	add r4, #0xc
	cmp r5, #6
	blt _022319B8
	add sp, #0xf4
	pop {r4, r5, r6, r7, pc}
	nop
_022319F4: .word 0x0000E880
	thumb_func_end ov74_0223195C

	thumb_func_start ov74_022319F8
ov74_022319F8: ; 0x022319F8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	tst r2, r0
	beq _02231A16
	mov r2, #0
	bl FontID_String_GetWidth
	ldr r1, [r4, #0x10]
	lsl r1, r1, #3
	sub r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	pop {r4, pc}
_02231A16:
	ldr r0, [r4, #0x18]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_022319F8

	thumb_func_start ov74_02231A1C
ov74_02231A1C: ; 0x02231A1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	ldr r7, [r5, #0x44]
	add r6, r0, #0
	add r4, r2, #0
	cmp r7, #0
	bne _02231A2E
	mov r7, #0xff
_02231A2E:
	ldr r1, [r5]
	ldr r0, [r1]
	cmp r0, #0
	bne _02231A6C
	ldr r0, [r5, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x20]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #8]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r6, #0x20]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
_02231A6C:
	mov r0, #2
	tst r0, r4
	bne _02231A7E
	ldr r1, [r5, #0x30]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
_02231A7E:
	mov r0, #0
	ldr r1, [r5, #0x34]
	mvn r0, r0
	cmp r1, r0
	beq _02231B0E
	ldr r2, _02231BB0 ; =0x0000012D
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x4c
	bl NewMsgDataFromNarc
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x40]
	str r0, [sp, #0x14]
	cmp r0, #0
	bne _02231AA6
	mov r0, #0x4c
	bl ScrStrBufs_new
	str r0, [sp, #0x14]
_02231AA6:
	ldr r0, _02231BB4 ; =0x00012608
	ldr r0, [r6, r0]
	bl StringSetEmpty
	ldr r0, _02231BB4 ; =0x00012608
	ldr r1, [r5, #0x34]
	ldr r0, [r6, r0]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	ldr r1, _02231BB4 ; =0x00012608
	ldr r0, [sp, #0x14]
	ldr r1, [r6, r1]
	ldr r2, [sp, #0x20]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x20]
	bl String_dtor
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	add r2, r4, #0
	bl ov74_022319F8
	add r3, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #0x28]
	bl AddTextPrinterParameterized2
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x40]
	cmp r0, #0
	bne _02231B02
	ldr r0, [sp, #0x14]
	bl ScrStrBufs_delete
_02231B02:
	ldr r0, [sp, #0x18]
	bl DestroyMsgData
	mov r0, #0
	mvn r0, r0
	str r0, [r5, #0x34]
_02231B0E:
	ldr r1, [r5, #0x38]
	cmp r1, #0
	beq _02231B4A
	ldr r0, _02231BB8 ; =0x0001260C
	mov r2, #0x40
	ldr r6, [r6, r0]
	add r0, r6, #0
	bl CopyU16ArrayToStringN
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov74_022319F8
	add r3, r0, #0
	ldr r0, [r5, #0x1c]
	add r2, r6, #0
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #0x28]
	bl AddTextPrinterParameterized2
	str r0, [r5, #0x48]
	mov r0, #0
	str r0, [r5, #0x38]
_02231B4A:
	ldr r1, [r5, #0x3c]
	cmp r1, #0
	beq _02231B78
	add r0, r5, #0
	add r2, r4, #0
	bl ov74_022319F8
	add r3, r0, #0
	ldr r0, [r5, #0x1c]
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x3c]
	bl AddTextPrinterParameterized2
	str r0, [r5, #0x48]
	mov r0, #0
	str r0, [r5, #0x3c]
_02231B78:
	mov r0, #4
	tst r0, r4
	bne _02231B84
	ldr r0, [r5]
	bl CopyWindowToVram
_02231B84:
	mov r0, #8
	tst r0, r4
	beq _02231BAC
	mov r0, #0x10
	tst r0, r4
	ldr r0, [r5]
	beq _02231BA0
	ldr r2, _02231BBC ; =0x000003D2
	mov r1, #0
	mov r3, #0xd
	bl DrawFrameAndWindow2
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02231BA0:
	mov r2, #0x3f
	mov r1, #0
	lsl r2, r2, #4
	mov r3, #0xe
	bl DrawFrameAndWindow1
_02231BAC:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02231BB0: .word 0x0000012D
_02231BB4: .word 0x00012608
_02231BB8: .word 0x0001260C
_02231BBC: .word 0x000003D2
	thumb_func_end ov74_02231A1C

	thumb_func_start ov74_02231BC0
ov74_02231BC0: ; 0x02231BC0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _02231BEC ; =_0223B4E8
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x4c
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_02231BEC: .word _0223B4E8
	thumb_func_end ov74_02231BC0

	thumb_func_start ov74_02231BF0
ov74_02231BF0: ; 0x02231BF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x4c
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	add r1, r6, #0
	mov r0, #0x50
	add r1, #0x2c
	mov r2, #0x4c
	bl G2dRenderer_Init
	str r0, [r6, #0x28]
	add r0, r6, #0
	mov r2, #1
	add r0, #0x2c
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0x55
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_02231C36:
	mov r0, #3
	add r1, r4, #0
	mov r2, #0x4c
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02231C36
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x4c
	str r0, [sp, #8]
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0x71
	mov r2, #0x1e
	bl AddCharResObjFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x4c
	sub r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	mov r1, #0x71
	mov r2, #0x1b
	bl AddPlttResObjFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r6, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x4c
	sub r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	mov r1, #0x71
	mov r2, #0x1d
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x4c
	sub r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	mov r1, #0x71
	mov r2, #0x1c
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r6, r1]
	sub r1, #0xc
	ldr r0, [r6, r1]
	bl sub_0200ACF0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200AF94
	bl sub_02074490
	add r1, r0, #0
	mov r0, #0
	mov r2, #1
	str r0, [sp]
	mov r0, #0x4c
	add r3, r2, #0
	str r0, [sp, #4]
	mov r0, #0x14
	add r3, #0xff
	bl GfGfxLoader_GXLoadPal
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov74_02231BF0

	thumb_func_start ov74_02231CFC
ov74_02231CFC: ; 0x02231CFC
	push {lr}
	sub sp, #0x2c
	mov r1, #0
	str r1, [sp]
	sub r2, r1, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	mov r3, #0x55
	str r1, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r0, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r0, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r0, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r0, r2]
	add r3, #0x30
	str r2, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r0, r3
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x2c
	pop {pc}
	thumb_func_end ov74_02231CFC

	thumb_func_start ov74_02231D48
ov74_02231D48: ; 0x02231D48
	ldr r2, [r1, #0x28]
	str r2, [r0]
	mov r2, #0x61
	lsl r2, r2, #2
	add r1, r1, r2
	str r1, [r0, #4]
	mov r2, #0
	mov r1, #1
	str r2, [r0, #0x10]
	lsl r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	mov r1, #0x14
	str r1, [r0, #0x24]
	str r3, [r0, #0x28]
	mov r1, #0x4c
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end ov74_02231D48

	thumb_func_start ov74_02231D70
ov74_02231D70: ; 0x02231D70
	ldr r3, _02231D8C ; =0x0000E880
	ldr r0, [r0, r3]
	add r3, r0, #4
	mov r0, #0x96
	lsl r0, r0, #4
	mul r0, r1
	add r1, r3, r0
	mov r0, #0x50
	mul r0, r2
	add r0, r1, r0
	ldr r3, _02231D90 ; =AGB_GetBoxMonData
	mov r1, #0xb
	mov r2, #0
	bx r3
	.balign 4, 0
_02231D8C: .word 0x0000E880
_02231D90: .word AGB_GetBoxMonData
	thumb_func_end ov74_02231D70

	thumb_func_start ov74_02231D94
ov74_02231D94: ; 0x02231D94
	ldr r3, _02231DB0 ; =0x0000E880
	ldr r0, [r0, r3]
	add r3, r0, #4
	mov r0, #0x96
	lsl r0, r0, #4
	mul r0, r1
	add r1, r3, r0
	mov r0, #0x50
	mul r0, r2
	add r0, r1, r0
	ldr r3, _02231DB4 ; =AGB_GetBoxMonData
	mov r1, #0x2d
	mov r2, #0
	bx r3
	.balign 4, 0
_02231DB0: .word 0x0000E880
_02231DB4: .word AGB_GetBoxMonData
	thumb_func_end ov74_02231D94

	thumb_func_start ov74_02231DB8
ov74_02231DB8: ; 0x02231DB8
	ldr r3, _02231DD4 ; =0x0000E880
	ldr r0, [r0, r3]
	add r3, r0, #4
	mov r0, #0x96
	lsl r0, r0, #4
	mul r0, r1
	add r1, r3, r0
	mov r0, #0x50
	mul r0, r2
	add r0, r1, r0
	mov r1, #0
	ldr r3, _02231DD8 ; =AGB_GetBoxMonData
	add r2, r1, #0
	bx r3
	.balign 4, 0
_02231DD4: .word 0x0000E880
_02231DD8: .word AGB_GetBoxMonData
	thumb_func_end ov74_02231DB8

	thumb_func_start ov74_02231DDC
ov74_02231DDC: ; 0x02231DDC
	push {r4, r5}
	ldr r5, [sp, #8]
	lsr r4, r5, #0x1f
	add r4, r5, r4
	asr r4, r4, #1
	sub r5, r2, r4
	strb r5, [r0]
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r5, r5, #1
	sub r3, r1, r5
	strb r3, [r0, #2]
	add r2, r2, r4
	strb r2, [r0, #1]
	add r1, r1, r5
	strb r1, [r0, #3]
	pop {r4, r5}
	bx lr
	thumb_func_end ov74_02231DDC

	thumb_func_start ov74_02231E00
ov74_02231E00: ; 0x02231E00
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #1
	add r5, r0, #0
	add r0, r3, #0
	lsl r1, r1, #0xc
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	beq _02231E34
	add r1, r5, #0
	add r2, r6, #0
	bl ReadWholeNarcMemberByIdPair
	add r0, r4, #0
	add r1, r7, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	cmp r0, #0
	bne _02231E34
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02231E34:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02231E00

	thumb_func_start ov74_02231E38
ov74_02231E38: ; 0x02231E38
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, r3, #0
	add r1, r6, #0
	bl NARC_ReadWholeMember
	add r0, r4, #0
	add r1, r5, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov74_02231E38

	thumb_func_start ov74_02231E54
ov74_02231E54: ; 0x02231E54
	push {r4, lr}
	add r3, r1, #0
	mov r4, #0
	cmp r0, #0xc9
	beq _02231E66
	ldr r1, _02231EC0 ; =0x00000182
	cmp r0, r1
	beq _02231E90
	b _02231EBA
_02231E66:
	mov r4, #3
	lsl r0, r4, #8
	add r2, r3, #0
	and r0, r3
	lsr r1, r0, #6
	lsl r0, r4, #0x18
	and r2, r4
	and r0, r3
	lsl r4, r4, #0x10
	and r3, r4
	lsr r0, r0, #0x12
	lsr r3, r3, #0xc
	orr r0, r3
	orr r0, r1
	orr r0, r2
	mov r1, #0x1c
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	b _02231EBA
_02231E90:
	cmp r2, #5
	bhi _02231EAC
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02231EA0: ; jump table
	.short _02231EAC - _02231EA0 - 2 ; case 0
	.short _02231EAC - _02231EA0 - 2 ; case 1
	.short _02231EAC - _02231EA0 - 2 ; case 2
	.short _02231EB8 - _02231EA0 - 2 ; case 3
	.short _02231EB0 - _02231EA0 - 2 ; case 4
	.short _02231EB4 - _02231EA0 - 2 ; case 5
_02231EAC:
	mov r4, #0
	b _02231EBA
_02231EB0:
	mov r4, #1
	b _02231EBA
_02231EB4:
	mov r4, #2
	b _02231EBA
_02231EB8:
	mov r4, #3
_02231EBA:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02231EC0: .word 0x00000182
	thumb_func_end ov74_02231E54

	thumb_func_start ov74_02231EC4
ov74_02231EC4: ; 0x02231EC4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	add r7, r3, #0
	add r5, r1, #0
	bl TranslateAgbSpecies
	add r1, r6, #0
	add r2, r7, #0
	add r4, r0, #0
	bl ov74_02231E54
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	add r2, r7, #0
	bl GetMonIconNaixEx
	add r1, r0, #0
	mov r0, #0x14
	add r2, sp, #0
	mov r3, #0x4c
	bl ov74_02231E00
	add r6, r0, #0
	ldr r0, [sp]
	mov r1, #2
	ldr r0, [r0, #0x14]
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r1, [sp, #0x18]
	ldr r0, [sp]
	lsl r1, r1, #4
	add r1, #0x64
	mov r2, #2
	ldr r0, [r0, #0x14]
	lsl r1, r1, #5
	lsl r2, r2, #8
	bl GX_LoadOBJ
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	ldr r0, [sp, #0x1c]
	add r1, #8
	bl sub_02024A14
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02231EC4

	thumb_func_start ov74_02231F30
ov74_02231F30: ; 0x02231F30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	ldr r1, _02231FAC ; =ov74_0223D338
	str r2, [sp]
	ldr r2, [r1]
	mov r1, #0x83
	add r5, r3, #0
	lsl r1, r1, #2
	mul r1, r5
	add r4, r2, r1
	ldr r1, [sp, #0x20]
	add r6, r0, #0
	cmp r1, #0
	beq _02231FA4
	bl ov74_02231764
	cmp r0, #0
	bne _02231F60
	add r0, r6, #0
	bl TranslateAgbSpecies
	add r6, r0, #0
	b _02231F62
_02231F60:
	mov r6, #0
_02231F62:
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r7, #0
	bl GetMonIconNaixEx
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	add r1, sp, #4
	bl ov74_02231E38
	ldr r0, [sp, #4]
	add r1, r4, #0
	mov r2, #2
	ldr r0, [r0, #0x14]
	add r1, #0xc
	lsl r2, r2, #8
	bl MIi_CpuCopyFast
	lsl r0, r5, #4
	add r0, #0x64
	lsl r0, r0, #5
	str r0, [r4]
	ldr r0, [sp, #0x20]
	ldr r1, [sp]
	str r0, [r4, #8]
	add r0, r6, #0
	add r2, r7, #0
	bl GetMonIconPaletteEx
	add r0, #8
	add sp, #8
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02231FA4:
	mov r0, #0
	str r0, [r4, #8]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231FAC: .word ov74_0223D338
	thumb_func_end ov74_02231F30

	thumb_func_start ov74_02231FB0
ov74_02231FB0: ; 0x02231FB0
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02231FF0 ; =ov74_0223D338
	mov r6, #2
	lsl r6, r6, #8
	add r7, r6, #0
	ldr r5, [r0]
	mov r4, #0
	add r7, #0xc
_02231FC0:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02231FE4
	add r0, r5, #0
	add r0, #0xc
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	ldr r1, [r5]
	add r0, #0xc
	add r2, r6, #0
	bl GX_LoadOBJ
	ldr r0, [r5, #8]
	ldr r1, [r5, #4]
	bl sub_02024A14
_02231FE4:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #0x1e
	blt _02231FC0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231FF0: .word ov74_0223D338
	thumb_func_end ov74_02231FB0

	thumb_func_start ov74_02231FF4
ov74_02231FF4: ; 0x02231FF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r0, #0
	mov r0, #0x14
	mov r1, #0x4c
	bl NARC_ctor
	mov r1, #1
	str r0, [sp, #0x10]
	mov r0, #0x4c
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	mov r7, #0
	str r0, [sp, #0x14]
	str r7, [sp, #0xc]
	add r5, r6, #0
_02232016:
	ldr r0, _02232140 ; =0x0000E880
	ldr r1, _02232144 ; =0x0000E884
	ldr r0, [r6, r0]
	ldr r2, [r6, r1]
	mov r1, #0x96
	lsl r1, r1, #4
	mul r1, r2
	add r0, r0, #4
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	mov r2, #0
	add r0, r1, r0
	mov r1, #5
	bl AGB_GetBoxMonData
	cmp r0, #0
	beq _022320DA
	ldr r1, _02232144 ; =0x0000E884
	add r0, r6, #0
	ldr r1, [r6, r1]
	add r2, r7, #0
	bl ov74_02231D70
	ldr r1, _02232144 ; =0x0000E884
	str r0, [sp, #0x1c]
	ldr r1, [r6, r1]
	add r0, r6, #0
	add r2, r7, #0
	bl ov74_02231D94
	ldr r1, _02232144 ; =0x0000E884
	str r0, [sp, #0x18]
	ldr r1, [r6, r1]
	add r0, r6, #0
	add r2, r7, #0
	bl ov74_02231DB8
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	bl TranslateAgbSpecies
	ldr r2, _02232148 ; =gSystem + 0x60
	add r1, r4, #0
	ldrb r2, [r2, #0xa]
	bl ov74_02231E54
	add r4, r0, #0
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r3, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	bl ov74_02231F30
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, _02232140 ; =0x0000E880
	ldr r1, _02232144 ; =0x0000E884
	ldr r0, [r6, r0]
	ldr r2, [r6, r1]
	mov r1, #0x96
	lsl r1, r1, #4
	mul r1, r2
	add r0, r0, #4
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	mov r2, #0
	add r0, r1, r0
	mov r1, #0xc
	bl AGB_GetBoxMonData
	cmp r0, #0
	beq _022320CC
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _0223210A
_022320CC:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0223210A
_022320DA:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	add r3, r7, #0
	bl ov74_02231F30
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0223210A:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r0, #0x50
	add r5, #0xc
	str r0, [sp, #0xc]
	cmp r7, #0x1e
	bge _0223211A
	b _02232016
_0223211A:
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	ldr r0, [sp, #0x10]
	bl NARC_dtor
	ldr r1, _0223214C ; =ov74_02231FB0
	ldr r0, _02232150 ; =0x00012604
	str r1, [r6, r0]
	ldr r1, _02232144 ; =0x0000E884
	add r0, r6, #0
	ldr r1, [r6, r1]
	bl ov74_02232678
	add r0, r6, #0
	bl ov74_0223262C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02232140: .word 0x0000E880
_02232144: .word 0x0000E884
_02232148: .word gSystem + 0x60
_0223214C: .word ov74_02231FB0
_02232150: .word 0x00012604
	thumb_func_end ov74_02231FF4

	thumb_func_start ov74_02232154
ov74_02232154: ; 0x02232154
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	mov r2, #0x61
	add r5, r0, #0
	lsl r2, r2, #2
	add r0, sp, #0x14
	add r1, r5, #0
	add r2, r5, r2
	mov r3, #1
	bl ov74_02231D48
	mov r0, #0x28
	str r0, [sp, #8]
	mov r0, #0x31
	mov r4, #0
	lsl r0, r0, #4
	str r4, [sp, #0xc]
	add r7, r5, r0
_02232178:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	mov r6, #0x1c
	lsl r0, r0, #0xc
	str r0, [sp, #4]
_02232184:
	mov r0, #0x1c
	str r0, [sp]
	ldr r2, [sp, #8]
	add r0, r7, #0
	add r1, r6, #0
	mov r3, #0x1c
	bl ov74_02231DDC
	lsl r0, r6, #0xc
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	str r0, [sp, #0x20]
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _022321B2
	add r0, sp, #0x14
	bl CreateSprite
	mov r1, #0x6a
	lsl r1, r1, #2
	str r0, [r5, r1]
_022321B2:
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x6a
	lsl r0, r0, #2
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r1, #0xa
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024A04
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6a
	lsl r0, r0, #2
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r1, #0x64
	bl sub_02024ADC
	mov r0, #6
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0x1c]
	mov r0, #3
	ldr r1, [sp, #0x20]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x20]
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223221C
	add r0, sp, #0x14
	bl CreateSprite
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r5, r1]
_0223221C:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x28
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024A04
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_02024ADC
	add r4, r4, #1
	add r7, r7, #4
	add r5, #0xc
	cmp r4, #0x1e
	beq _02232280
	ldr r0, [sp, #0x10]
	add r6, #0x28
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #6
	blt _02232184
	ldr r0, [sp, #8]
	add r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #5
	bge _02232280
	b _02232178
_02232280:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov74_02232154

	thumb_func_start ov74_02232284
ov74_02232284: ; 0x02232284
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r2, #0
	mov r2, #0x61
	add r6, r0, #0
	lsl r2, r2, #2
	add r5, r1, #0
	add r7, r3, #0
	add r0, sp, #0
	add r1, r6, #0
	add r2, r6, r2
	mov r3, #1
	bl ov74_02231D48
	lsl r0, r5, #0xc
	str r0, [sp, #8]
	lsl r0, r4, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xa
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl CreateSprite
	add r4, r0, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #1
	bl sub_02024A04
	ldr r1, [sp, #0x48]
	add r0, r4, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02232284

	thumb_func_start ov74_022322D8
ov74_022322D8: ; 0x022322D8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xe2
	lsl r0, r0, #2
	add r0, r6, r0
	mov r1, #0xe4
	mov r2, #0xb0
	mov r3, #0x32
	bl ov74_02231DDC
	mov r0, #1
	str r0, [sp]
	add r0, r6, #0
	mov r1, #0xe4
	mov r2, #0xb0
	mov r3, #6
	bl ov74_02232284
	mov r1, #0xe6
	lsl r1, r1, #2
	str r0, [r6, r1]
	sub r1, #8
	add r0, r6, r1
	mov r1, #0xb0
	mov r3, #0x20
	add r2, r1, #0
	str r3, [sp]
	bl ov74_02231DDC
	mov r0, #1
	mov r1, #0xb0
	str r0, [sp]
	add r0, r6, #0
	add r2, r1, #0
	mov r3, #3
	bl ov74_02232284
	mov r1, #0xea
	lsl r1, r1, #2
	str r0, [r6, r1]
	sub r1, #0x1c
	mov r3, #0x20
	add r0, r6, r1
	mov r1, #0x18
	mov r2, #0xb0
	str r3, [sp]
	bl ov74_02231DDC
	mov r0, #1
	str r0, [sp]
	add r0, r6, #0
	mov r1, #0x18
	mov r2, #0xb0
	mov r3, #0
	bl ov74_02232284
	mov r1, #0xee
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r7, #0
	mov r0, #0xff
	sub r1, #0x24
	strb r0, [r6, r1]
	add r4, r7, #0
	add r5, r6, #0
_0223235E:
	mov r0, #0
	str r0, [sp]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0x40
	mov r3, #9
	bl ov74_02232284
	mov r1, #0xf2
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0
	mov r0, #0xf3
	mvn r1, r1
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0xe
	add r0, r0, #4
	str r1, [r5, r0]
	add r7, r7, #1
	add r4, #0x24
	add r5, #0xc
	cmp r7, #6
	blt _0223235E
	mov r0, #0x41
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_022322D8

	thumb_func_start ov74_02232398
ov74_02232398: ; 0x02232398
	push {r3, lr}
	ldr r3, _022323CC ; =0x0000E880
	ldr r2, [r0, r3]
	add r3, r3, #4
	ldr r3, [r0, r3]
	mov r0, #0x96
	lsl r0, r0, #4
	add r2, r2, #4
	mul r0, r3
	add r2, r2, r0
	mov r0, #0x50
	mul r0, r1
	add r0, r2, r0
	mov r1, #0x41
	mov r2, #0
	bl AGB_GetBoxMonData
	mov r1, #0x67
	lsl r1, r1, #2
	cmp r0, r1
	bne _022323C6
	mov r0, #1
	pop {r3, pc}
_022323C6:
	mov r0, #0
	pop {r3, pc}
	nop
_022323CC: .word 0x0000E880
	thumb_func_end ov74_02232398

	thumb_func_start ov74_022323D0
ov74_022323D0: ; 0x022323D0
	push {r3, r4, r5, r6, r7, lr}
	ldr r3, _0223241C ; =0x0000E880
	mov r5, #0
	ldr r2, [r0, r3]
	add r3, r3, #4
	ldr r3, [r0, r3]
	mov r0, #0x96
	lsl r0, r0, #4
	add r2, r2, #4
	mul r0, r3
	add r4, r2, r0
	mov r0, #0x50
	add r6, r1, #0
	mul r6, r0
	add r7, r5, #0
_022323EE:
	add r1, r5, #0
	add r0, r4, r6
	add r1, #0xd
	add r2, r7, #0
	bl AGB_GetBoxMonData
	ldr r3, _02232420 ; =ov74_0223C998
	add r2, r0, #0
	mov r1, #0
_02232400:
	ldr r0, [r3]
	cmp r2, r0
	bne _0223240A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223240A:
	add r1, r1, #1
	add r3, r3, #4
	cmp r1, #8
	blo _02232400
	add r5, r5, #1
	cmp r5, #4
	blt _022323EE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223241C: .word 0x0000E880
_02232420: .word ov74_0223C998
	thumb_func_end ov74_022323D0

	thumb_func_start ov74_02232424
ov74_02232424: ; 0x02232424
	push {r3, lr}
	ldr r3, _02232468 ; =0x0000E880
	ldr r2, [r0, r3]
	add r3, r3, #4
	ldr r3, [r0, r3]
	mov r0, #0x96
	lsl r0, r0, #4
	add r2, r2, #4
	mul r0, r3
	add r2, r2, r0
	mov r0, #0x50
	mul r0, r1
	add r0, r2, r0
	mov r1, #0xc
	mov r2, #0
	bl AGB_GetBoxMonData
	ldr r1, _0223246C ; =ov74_0223C9A8
	ldrh r1, [r1, #0x30]
	cmp r1, #0
	beq _02232462
	ldr r2, _02232470 ; =ov74_0223C9D8
_02232450:
	ldrh r1, [r2]
	cmp r0, r1
	bne _0223245A
	mov r0, #1
	pop {r3, pc}
_0223245A:
	add r2, r2, #2
	ldrh r1, [r2]
	cmp r1, #0
	bne _02232450
_02232462:
	mov r0, #0
	pop {r3, pc}
	nop
_02232468: .word 0x0000E880
_0223246C: .word ov74_0223C9A8
_02232470: .word ov74_0223C9D8
	thumb_func_end ov74_02232424

	thumb_func_start ov74_02232474
ov74_02232474: ; 0x02232474
	push {r3, lr}
	ldr r3, _0223249C ; =0x0000E880
	ldr r2, [r0, r3]
	add r3, r3, #4
	ldr r3, [r0, r3]
	mov r0, #0x96
	lsl r0, r0, #4
	add r2, r2, #4
	mul r0, r3
	add r2, r2, r0
	mov r0, #0x50
	mul r0, r1
	add r0, r2, r0
	mov r1, #0xb
	mov r2, #0
	bl AGB_GetBoxMonData
	bl ov74_02231764
	pop {r3, pc}
	.balign 4, 0
_0223249C: .word 0x0000E880
	thumb_func_end ov74_02232474

	thumb_func_start ov74_022324A0
ov74_022324A0: ; 0x022324A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x6a
	lsl r0, r0, #2
	add r0, r4, r0
	str r0, [sp]
	add r6, r1, #0
	mov r0, #0xc
	mul r0, r6
	ldr r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022324CC
	bl sub_020248B8
	cmp r0, #0
	bne _022324CC
	add sp, #0x14
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_022324CC:
	mov r5, #0
	mov r7, #0x3d
	mvn r5, r5
	mov r2, #0
	add r3, r4, #0
	lsl r7, r7, #4
	b _022324F4
_022324DA:
	ldr r0, _02232628 ; =0x0000E884
	ldr r1, [r4, r0]
	ldr r0, [r3, r7]
	cmp r1, r0
	bne _022324F0
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	cmp r6, r0
	bne _022324F0
	add r5, r2, #0
_022324F0:
	add r3, #0xc
	add r2, r2, #1
_022324F4:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _02232500
	cmp r2, #6
	blt _022324DA
_02232500:
	add r0, r4, #0
	add r1, r6, #0
	bl ov74_02232398
	cmp r0, #1
	bne _02232512
	add sp, #0x14
	mov r0, #4
	pop {r4, r5, r6, r7, pc}
_02232512:
	add r0, r4, #0
	add r1, r6, #0
	bl ov74_022323D0
	cmp r0, #1
	bne _02232524
	add sp, #0x14
	mov r0, #5
	pop {r4, r5, r6, r7, pc}
_02232524:
	add r0, r4, #0
	add r1, r6, #0
	bl ov74_02232424
	cmp r0, #1
	bne _02232536
	add sp, #0x14
	mov r0, #6
	pop {r4, r5, r6, r7, pc}
_02232536:
	add r0, r4, #0
	add r1, r6, #0
	bl ov74_02232474
	cmp r0, #1
	bne _02232548
	add sp, #0x14
	mov r0, #7
	pop {r4, r5, r6, r7, pc}
_02232548:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _022325F0
	mov r0, #0x41
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #6
	bne _02232560
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02232560:
	mov r5, #0
	mov r0, #0xf3
	add r3, r4, #0
	lsl r0, r0, #2
	sub r1, r5, #1
_0223256A:
	ldr r2, [r3, r0]
	cmp r2, r1
	bne _022325E6
	ldr r1, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r1, r0]
	bl sub_020248AC
	add r1, r0, #0
	mov r0, #0xc
	add r7, r5, #0
	mul r7, r0
	mov r0, #0xf2
	lsl r0, r0, #2
	add r5, r4, r0
	ldr r0, [r5, r7]
	bl sub_020247D4
	ldr r0, [r5, r7]
	bl sub_020248AC
	add r3, r0, #0
	add r2, sp, #8
	ldmia r3!, {r0, r1}
	mov ip, r2
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #2
	str r0, [r2]
	ldr r0, [sp, #8]
	lsl r1, r1, #0xe
	sub r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	lsr r1, r1, #1
	sub r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [r5, r7]
	mov r1, ip
	bl sub_020247D4
	ldr r0, [r5, r7]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #0xf3
	add r3, r4, r7
	lsl r1, r1, #2
	ldr r0, _02232628 ; =0x0000E884
	str r6, [r3, r1]
	ldr r2, [r4, r0]
	add r0, r1, #4
	str r2, [r3, r0]
	add r0, r1, #0
	add r0, #0x44
	ldr r0, [r4, r0]
	add r1, #0x44
	add r0, r0, #1
	str r0, [r4, r1]
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_022325E6:
	add r5, r5, #1
	add r3, #0xc
	cmp r5, #6
	blt _0223256A
	b _02232622
_022325F0:
	mov r0, #0xc
	add r6, r5, #0
	mul r6, r0
	mov r0, #0xf2
	add r1, r4, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r2, #0
	mov r1, #0xf3
	mvn r2, r2
	add r0, r4, r6
	lsl r1, r1, #2
	str r2, [r0, r1]
	add r0, r1, #0
	add r0, #0x44
	ldr r0, [r4, r0]
	add r1, #0x44
	sub r0, r0, #1
	str r0, [r4, r1]
	add sp, #0x14
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_02232622:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02232628: .word 0x0000E884
	thumb_func_end ov74_022324A0

	thumb_func_start ov74_0223262C
ov74_0223262C: ; 0x0223262C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
	sub r7, r4, #1
_02232636:
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, r7
	beq _0223265C
	ldr r0, _02232674 ; =0x0000E884
	ldr r1, [r6, r0]
	mov r0, #0x3d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	bne _0223265C
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _02232668
_0223265C:
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_02232668:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #6
	blt _02232636
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232674: .word 0x0000E884
	thumb_func_end ov74_0223262C

	thumb_func_start ov74_02232678
ov74_02232678: ; 0x02232678
	push {r3, r4, r5, lr}
	sub sp, #0x60
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	add r3, sp, #0x14
	add r1, r0, #0
	mov r2, #4
_02232688:
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02232688
	stmia r3!, {r0, r1}
	str r0, [r3]
	ldr r0, _022326F0 ; =0x00000478
	add r0, r5, r0
	str r0, [sp, #0x14]
	mov r0, #6
	str r0, [sp, #0x1c]
	mov r0, #0x15
	str r0, [sp, #0x20]
	mov r0, #0xd
	str r0, [sp, #0x24]
	mov r0, #2
	str r0, [sp, #0x28]
	sub r0, r0, #3
	str r0, [sp, #0x48]
	mov r0, #0
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	mov r0, #1
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	ldr r0, _022326F4 ; =0x00010200
	str r0, [sp, #0x40]
	mov r0, #0xa0
	str r0, [sp, #0x34]
	bl PmAgbCartridge_GetLanguage
	add r3, r0, #0
	ldr r0, _022326F8 ; =0x0000E880
	mov r2, #9
	ldr r1, [r5, r0]
	ldr r0, _022326FC ; =0x00008344
	add r1, r1, r0
	lsl r0, r4, #3
	add r0, r4, r0
	add r0, r1, r0
	add r1, sp, #0
	bl ConvertRSStringToDPStringInternational
	add r0, sp, #0
	str r0, [sp, #0x4c]
	add r0, r5, #0
	add r1, sp, #0x14
	mov r2, #1
	bl ov74_02231A1C
	add sp, #0x60
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022326F0: .word 0x00000478
_022326F4: .word 0x00010200
_022326F8: .word 0x0000E880
_022326FC: .word 0x00008344
	thumb_func_end ov74_02232678

	thumb_func_start ov74_02232700
ov74_02232700: ; 0x02232700
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r6, r1, #0
	mov r1, #2
	bl GetBgTilemapBuffer
	add r4, r0, #0
	cmp r6, #0
	beq _02232724
	add r0, r6, #0
	mov r1, #8
	mov r2, #0
	bl AGB_GetBoxMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	b _02232726
_02232724:
	mov r1, #0
_02232726:
	mov r2, #0
	mov r0, #1
_0223272A:
	add r3, r1, #0
	tst r3, r0
	beq _02232736
	add r6, r2, #0
	add r6, #0x80
	b _0223273A
_02232736:
	add r6, r2, #0
	add r6, #0x60
_0223273A:
	add r3, r4, #0
	add r3, #0xd6
	lsl r1, r1, #0x17
	add r2, r2, #1
	strh r6, [r3]
	lsr r1, r1, #0x18
	add r4, r4, #2
	cmp r2, #4
	blt _0223272A
	ldr r0, [r5, #0x20]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov74_02232700

	thumb_func_start ov74_02232758
ov74_02232758: ; 0x02232758
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x78
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	add r3, sp, #0x2c
	add r1, r0, #0
	mov r2, #4
_02232768:
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02232768
	stmia r3!, {r0, r1}
	str r0, [r3]
	mov r1, #0x20
	str r1, [sp, #0x3c]
	mov r1, #1
	ldr r0, _02232908 ; =0x00000488
	str r1, [sp, #0x50]
	str r1, [sp, #0x54]
	mov r1, #0xbc
	str r1, [sp, #0x4c]
	ldr r1, _0223290C ; =0x000F0200
	add r0, r5, r0
	str r1, [sp, #0x58]
	mov r1, #0x2c
	str r0, [sp, #0x2c]
	mov r0, #0
	str r1, [sp, #0x60]
	mov r1, #0x90
	mov r2, #4
	str r1, [sp, #0x44]
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	str r0, [sp, #0x64]
	str r0, [sp, #0x48]
	add r0, r5, #0
	add r1, sp, #0x2c
	str r2, [sp, #0x40]
	bl ov74_02231A1C
	mov r0, #0x2b
	str r0, [sp, #0x60]
	mov r0, #0x50
	str r0, [sp, #0x44]
	mov r0, #8
	str r0, [sp, #0x48]
	add r0, r5, #0
	add r1, sp, #0x2c
	mov r2, #6
	bl ov74_02231A1C
	add r0, r5, #0
	add r1, r4, #0
	bl ov74_02232700
	cmp r4, #0
	bne _022327D6
	ldr r0, [sp, #0x2c]
	bl CopyWindowToVram
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
_022327D6:
	add r2, sp, #0x1c
	add r0, r4, #0
	mov r1, #2
	add r2, #2
	bl AGB_GetBoxMonData
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl AGB_GetBoxMonData
	add r3, r0, #0
	add r0, sp, #0x1c
	add r0, #2
	add r1, sp, #8
	mov r2, #0xb
	bl ConvertRSStringToDPStringInternational
	add r0, sp, #8
	str r0, [sp, #0x64]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x60]
	mov r0, #8
	str r0, [sp, #0x44]
	mov r0, #0
	str r0, [sp, #0x48]
	add r0, r5, #0
	add r1, sp, #0x2c
	mov r2, #6
	bl ov74_02231A1C
	mov r0, #0x40
	mov r1, #0x4c
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #0x4c
	bl NewMsgDataFromNarc
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0
	bl AGB_GetBoxMonData
	bl TranslateAgbSpecies
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x60]
	mov r0, #0x10
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, r5, #0
	add r1, sp, #0x2c
	mov r2, #6
	str r6, [sp, #0x68]
	bl ov74_02231A1C
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0
	bl AGB_GetBoxMonData
	cmp r0, #0
	beq _022328B8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl UpConvertItemId_Gen3to4
	add r7, r0, #0
	mov r0, #0x40
	mov r1, #0x4c
	bl String_ctor
	lsl r1, r7, #0x10
	lsr r1, r1, #0x10
	mov r2, #0x4c
	add r6, r0, #0
	bl GetItemNameIntoString
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x60]
	mov r0, #0x98
	str r0, [sp, #0x44]
	mov r0, #0x10
	str r0, [sp, #0x48]
	add r0, r5, #0
	add r1, sp, #0x2c
	mov r2, #6
	str r6, [sp, #0x68]
	bl ov74_02231A1C
	add r0, r6, #0
	bl String_dtor
_022328B8:
	add r0, r4, #0
	bl ov74_02234A0C
	add r6, r0, #0
	mov r0, #0xa
	mov r1, #0x4c
	bl String_ctor
	mov r3, #1
	add r1, r6, #0
	mov r2, #3
	add r4, r0, #0
	str r3, [sp]
	bl String16_FormatInteger
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x60]
	mov r0, #0x64
	str r0, [sp, #0x44]
	mov r0, #8
	str r0, [sp, #0x48]
	add r0, r5, #0
	add r1, sp, #0x2c
	mov r2, #2
	str r4, [sp, #0x68]
	bl ov74_02231A1C
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #4]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlayCry
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232908: .word 0x00000488
_0223290C: .word 0x000F0200
	thumb_func_end ov74_02232758

	thumb_func_start ov74_02232910
ov74_02232910: ; 0x02232910
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4c
	str r0, [sp, #8]
	add r6, r2, #0
	mov r0, #0
	add r4, r3, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	cmp r4, #0
	beq _02232938
	mov r0, #0x17
	str r0, [r4]
_02232938:
	str r6, [r5, #0x24]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov74_02232910

	thumb_func_start ov74_02232940
ov74_02232940: ; 0x02232940
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	add r4, r3, #0
	str r0, [sp, #4]
	mov r0, #0x4c
	add r6, r2, #0
	str r0, [sp, #8]
	ldr r3, _02232970 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	cmp r4, #0
	beq _02232968
	mov r0, #0x17
	str r0, [r4]
_02232968:
	str r6, [r5, #0x24]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02232970: .word 0x00007FFF
	thumb_func_end ov74_02232940

	thumb_func_start ov74_02232974
ov74_02232974: ; 0x02232974
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _02232A34 ; =_0223B4F8
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _02232A38 ; =_0223B508
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02232A3C ; =_0223B524
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02232A40 ; =_0223B540
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02232A44 ; =_0223B55C
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_02232A34: .word _0223B4F8
_02232A38: .word _0223B508
_02232A3C: .word _0223B524
_02232A40: .word _0223B540
_02232A44: .word _0223B55C
	thumb_func_end ov74_02232974

	thumb_func_start ov74_02232A48
ov74_02232A48: ; 0x02232A48
	push {r3, r4, r5, lr}
	sub sp, #0x38
	ldr r5, _02232AC0 ; =_0223B578
	add r4, r0, #0
	add r3, sp, #0x10
	mov r2, #5
_02232A54:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02232A54
	add r0, sp, #0x10
	bl GX_SetBanks
	ldr r0, [r4, #0x20]
	bl ov74_02232974
	ldr r0, _02232AC4 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	bl ResetAllTextPrinters
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x4c
	bl LoadFontPal0
	mov r0, #0xc0
	str r0, [sp]
	mov r0, #0x4c
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x17
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4c
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x20]
	mov r0, #0x71
	mov r1, #0x1a
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #2
	mov r1, #0x4c
	bl FontID_Alloc
	add sp, #0x38
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02232AC0: .word _0223B578
_02232AC4: .word gSystem + 0x60
	thumb_func_end ov74_02232A48

	thumb_func_start ov74_02232AC8
ov74_02232AC8: ; 0x02232AC8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4c
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x20]
	mov r0, #0x71
	mov r1, #0x18
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r2, #0
	ldr r1, [r4]
	ldr r0, _02232B14 ; =ov74_0223C960
	add r3, r2, #0
	ldrb r0, [r0, r1]
	mov r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, #0x20]
	bl BgTilemapRectChangePalette
	ldr r0, [r4, #0x20]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_02232B14: .word ov74_0223C960
	thumb_func_end ov74_02232AC8

	thumb_func_start ov74_02232B18
ov74_02232B18: ; 0x02232B18
	push {r4, lr}
	sub sp, #8
	mov r1, #7
	add r4, r0, #0
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x4c
	bl LoadFontPal0
	mov r1, #0
	mov r2, #0x3f
	str r1, [sp]
	mov r0, #0x4c
	str r0, [sp, #4]
	ldr r0, [r4, #0x20]
	lsl r2, r2, #4
	mov r3, #0xe
	bl LoadUserFrameGfx1
	ldr r0, [r4, #0x1c]
	ldr r2, _02232BC0 ; =0x000003D2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x4c
	str r0, [sp, #4]
	ldr r0, [r4, #0x20]
	mov r1, #0
	mov r3, #0xd
	bl LoadUserFrameGfx2
	ldr r0, _02232BC4 ; =0x0000042C
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x4c
	bl memset
	ldr r0, _02232BC8 ; =0x00000498
	mov r3, #0x1b
	add r1, r0, #0
	add r2, r4, r0
	sub r1, #0x6c
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #2
	sub r1, #0x64
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #1
	sub r1, #0x60
	str r2, [r4, r1]
	add r1, r0, #0
	sub r1, #0x5c
	str r3, [r4, r1]
	add r1, r0, #0
	mov r3, #4
	sub r1, #0x58
	str r3, [r4, r1]
	add r3, r0, #0
	mov r1, #0
	sub r3, #0x48
	str r1, [r4, r3]
	add r3, r0, #0
	sub r3, #0x44
	str r2, [r4, r3]
	add r3, r0, #0
	sub r3, #0x4c
	str r2, [r4, r3]
	add r2, r0, #0
	ldr r3, _02232BCC ; =0x0001020F
	sub r2, #0x40
	str r3, [r4, r2]
	add r2, r0, #0
	ldr r3, _02232BD0 ; =0x000F020F
	sub r2, #0x3c
	str r3, [r4, r2]
	add r2, r0, #0
	sub r2, #0x34
	str r1, [r4, r2]
	sub r0, #0x30
	str r1, [r4, r0]
	add sp, #8
	pop {r4, pc}
	nop
_02232BC0: .word 0x000003D2
_02232BC4: .word 0x0000042C
_02232BC8: .word 0x00000498
_02232BCC: .word 0x0001020F
_02232BD0: .word 0x000F020F
	thumb_func_end ov74_02232B18

	thumb_func_start ov74_02232BD4
ov74_02232BD4: ; 0x02232BD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r6, r0, #0
	mov r7, #0x6b
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02232BE2:
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, r7]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r5, r5, #1
	add r4, #0xc
	cmp r5, #0x1e
	blt _02232BE2
	mov r7, #0xf2
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02232C06:
	ldr r0, [r4, r7]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r5, r5, #1
	add r4, #0xc
	cmp r5, #6
	blt _02232C06
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r2, #0x61
	lsl r2, r2, #2
	add r0, sp, #0x1c
	add r1, r6, #0
	add r2, r6, r2
	mov r3, #1
	bl ov74_02231D48
	mov r0, #0x1c
	mov r7, #0
	str r0, [sp, #0x10]
	add r4, r6, #0
	add r5, r6, #0
_02232C54:
	ldr r0, [sp, #0x10]
	lsl r0, r0, #0xc
	str r0, [sp, #0x24]
	mov r0, #0x8e
	lsl r0, r0, #0xc
	str r0, [sp, #0x28]
	add r0, sp, #0x1c
	bl CreateSprite
	ldr r1, _02232D94 ; =0x00000414
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02232D94 ; =0x00000414
	add r1, r7, #0
	ldr r0, [r4, r0]
	add r1, #0xa
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02232D94 ; =0x00000414
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, _02232D94 ; =0x00000414
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	mov r1, #0x3d
	mov r2, #0xf3
	lsl r1, r1, #4
	lsl r2, r2, #2
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r0, r6, #0
	bl ov74_02231D70
	mov r1, #0x3d
	mov r2, #0xf3
	lsl r1, r1, #4
	lsl r2, r2, #2
	str r0, [sp, #0x14]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r0, r6, #0
	bl ov74_02231D94
	mov r1, #0x3d
	mov r2, #0xf3
	lsl r1, r1, #4
	lsl r2, r2, #2
	str r0, [sp, #0x18]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r0, r6, #0
	bl ov74_02231DB8
	add r2, r0, #0
	ldr r0, _02232D94 ; =0x00000414
	str r7, [sp]
	ldr r0, [r4, r0]
	ldr r3, _02232D98 ; =gSystem + 0x60
	str r0, [sp, #4]
	ldrb r3, [r3, #0xa]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl ov74_02231EC4
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	add r0, #0x28
	str r0, [sp, #0x10]
	add r4, r4, #4
	add r5, #0xc
	cmp r7, #6
	blt _02232C54
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4c
	str r0, [sp, #0xc]
	ldr r2, [r6, #0x20]
	mov r0, #0x71
	mov r1, #0x19
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r2, #0
	ldr r1, [r6]
	ldr r0, _02232D9C ; =ov74_0223C960
	add r3, r2, #0
	ldrb r0, [r0, r1]
	mov r1, #2
	str r0, [sp, #8]
	ldr r0, [r6, #0x20]
	bl BgTilemapRectChangePalette
	ldr r0, [r6, #0x20]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r1, #7
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x4c
	bl LoadFontPal0
	mov r1, #0
	mov r2, #0x3f
	str r1, [sp]
	mov r0, #0x4c
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	lsl r2, r2, #4
	mov r3, #0xe
	bl LoadUserFrameGfx1
	ldr r0, [r6, #0x1c]
	ldr r2, _02232DA0 ; =0x000003D2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x4c
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	mov r1, #0
	mov r3, #0xd
	bl LoadUserFrameGfx2
	add r0, r6, #0
	bl ov74_02232B18
	mov r1, #0x46
	mov r0, #0xa
	lsl r1, r1, #4
	str r0, [r6, r1]
	sub r1, #0x34
	add r0, r6, #0
	add r1, r6, r1
	mov r2, #0x18
	bl ov74_02231A1C
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02232D94: .word 0x00000414
_02232D98: .word gSystem + 0x60
_02232D9C: .word ov74_0223C960
_02232DA0: .word 0x000003D2
	thumb_func_end ov74_02232BD4

	thumb_func_start ov74_02232DA4
ov74_02232DA4: ; 0x02232DA4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02232DC0
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl RemoveWindow
_02232DC0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov74_02232DA4

	thumb_func_start ov74_02232DC4
ov74_02232DC4: ; 0x02232DC4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, _02232E34 ; =0x00000414
	mov r4, #0
	add r5, r6, #0
_02232DCE:
	ldr r0, [r5, r7]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02232DCE
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _02232E38 ; =0x00000498
	add r0, r6, r0
	bl ov74_02232DA4
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf3
	mov r5, #0
	lsl r0, r0, #2
	add r4, r6, #0
	sub r3, r5, #1
	mov r2, #0xe
	add r1, r0, #4
_02232E1E:
	str r3, [r4, r0]
	str r2, [r4, r1]
	add r5, r5, #1
	add r4, #0xc
	cmp r5, #6
	blt _02232E1E
	mov r0, #0x41
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02232E34: .word 0x00000414
_02232E38: .word 0x00000498
	thumb_func_end ov74_02232DC4

	thumb_func_start ov74_02232E3C
ov74_02232E3C: ; 0x02232E3C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r7, #0x6a
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_02232E50:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02232E5A
	bl sub_02024758
_02232E5A:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02232E68
	bl sub_02024758
_02232E68:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #0x1e
	blt _02232E50
	mov r7, #0xf2
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02232E78:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02232E82
	bl sub_02024758
_02232E82:
	add r5, r5, #1
	add r4, #0xc
	cmp r5, #6
	blt _02232E78
	mov r0, #0xe6
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02232E98
	bl sub_02024758
_02232E98:
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02232EA6
	bl sub_02024758
_02232EA6:
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02232EB4
	bl sub_02024758
_02232EB4:
	ldr r0, _02232F48 ; =0x00000478
	add r0, r6, r0
	bl ov74_02232DA4
	ldr r0, _02232F4C ; =0x00000488
	add r0, r6, r0
	bl ov74_02232DA4
	ldr r0, _02232F50 ; =0x00000498
	add r0, r6, r0
	bl ov74_02232DA4
	mov r0, #2
	bl FontID_Release
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r7, #0x55
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02232EEE:
	ldr r0, [r4, r7]
	bl Destroy2DGfxResObjMan
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blt _02232EEE
	ldr r0, [r6, #0x28]
	bl sub_02024504
	mov r0, #0
	str r0, [r6, #0x28]
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	ldr r0, _02232F54 ; =0x0000E88C
	ldr r0, [r6, r0]
	bl sub_02016624
	ldr r0, _02232F58 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r0, [r6, #0x20]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r6, #0x20]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r6, #0x20]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r6, #0x20]
	mov r1, #3
	bl FreeBgTilemapBuffer
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232F48: .word 0x00000478
_02232F4C: .word 0x00000488
_02232F50: .word 0x00000498
_02232F54: .word 0x0000E88C
_02232F58: .word gSystem + 0x60
	thumb_func_end ov74_02232E3C

	thumb_func_start ov74_02232F5C
ov74_02232F5C: ; 0x02232F5C
	push {lr}
	sub sp, #0x14
	ldr r1, [r0, #0x20]
	mov r3, #0
	str r1, [sp]
	mov r1, #2
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #8
	str r1, [sp, #0xc]
	str r3, [sp, #4]
	mov r1, #0x19
	add r2, sp, #0
	strb r1, [r2, #0x10]
	mov r1, #7
	strb r1, [r2, #0x11]
	strb r3, [r2, #0x13]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf0
	bic r3, r1
	mov r1, #0x10
	orr r1, r3
	strb r1, [r2, #0x12]
	ldr r1, _02232F98 ; =0x0000E88C
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl sub_020166FC
	add sp, #0x14
	pop {pc}
	.balign 4, 0
_02232F98: .word 0x0000E88C
	thumb_func_end ov74_02232F5C

	thumb_func_start ov74_02232F9C
ov74_02232F9C: ; 0x02232F9C
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl ov74_02233F84
	add r4, r0, #0
	bl PmAgbCartridge_GetLanguage
	add r3, r0, #0
	add r0, r4, #0
	add r1, sp, #8
	mov r2, #8
	bl ConvertRSStringToDPStringInternational
	mov r0, #0x4c
	bl ScrStrBufs_new
	add r4, r0, #0
	mov r0, #8
	mov r1, #0x4c
	bl String_ctor
	add r1, sp, #8
	add r6, r0, #0
	bl CopyU16ArrayToString
	mov r1, #1
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0
	bl BufferString
	add r0, r5, #0
	bl ov74_02232B18
	ldr r0, [r5]
	mov r2, #0x18
	lsl r1, r0, #2
	ldr r0, _02233020 ; =ov74_0223C980
	ldr r0, [r0, r1]
	mov r1, #0x46
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #0xc
	sub r1, #0x34
	str r4, [r5, r0]
	add r0, r5, #0
	add r1, r5, r1
	bl ov74_02231A1C
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r5, #0
	bl ov74_02232F5C
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_02233020: .word ov74_0223C980
	thumb_func_end ov74_02232F9C

	thumb_func_start ov74_02233024
ov74_02233024: ; 0x02233024
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02233054 ; =0x00012604
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02233038
	blx r0
	ldr r0, _02233054 ; =0x00012604
	mov r1, #0
	str r1, [r4, r0]
_02233038:
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r0, [r4, #0x20]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _02233058 ; =0x027E0000
	ldr r1, _0223305C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_02233054: .word 0x00012604
_02233058: .word 0x027E0000
_0223305C: .word 0x00003FF8
	thumb_func_end ov74_02233024

	thumb_func_start ov74_02233060
ov74_02233060: ; 0x02233060
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [r0, #0x10]
	bl sub_020270F8
	mov r6, #0
	str r0, [sp, #8]
	str r6, [sp, #4]
	add r7, r6, #0
_02233074:
	mov r4, #0
	add r5, r4, #0
_02233078:
	ldr r1, [sp]
	ldr r0, _022330CC ; =0x0000E880
	mov r2, #0
	ldr r0, [r1, r0]
	mov r1, #5
	add r0, r0, #4
	add r0, r0, r7
	add r0, r0, r5
	bl AGB_GetBoxMonData
	cmp r0, #0
	beq _02233092
	add r6, r6, #1
_02233092:
	add r4, r4, #1
	add r5, #0x50
	cmp r4, #0x1e
	blt _02233078
	mov r0, #0x96
	lsl r0, r0, #4
	add r7, r7, r0
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0xe
	blt _02233074
	cmp r6, #6
	bge _022330B4
	add sp, #0xc
	mov r0, #5
	pop {r4, r5, r6, r7, pc}
_022330B4:
	ldr r0, [sp, #8]
	bl sub_0202EC98
	cmp r0, #0
	beq _022330C4
	add sp, #0xc
	mov r0, #6
	pop {r4, r5, r6, r7, pc}
_022330C4:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022330CC: .word 0x0000E880
	thumb_func_end ov74_02233060

	thumb_func_start ov74_022330D0
ov74_022330D0: ; 0x022330D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _0223310C
	bl ov74_02232B18
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _0223312C ; =ov74_0223C9B8
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	mov r1, #0x46
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	sub r1, #0x34
	mov r2, #1
	add r0, #0x10
	str r2, [r5, r0]
	add r0, r5, #0
	add r1, r5, r1
	mov r2, #0x18
	bl ov74_02231A1C
	mov r0, #0
	str r0, [r5, #4]
	b _02233126
_0223310C:
	ldr r0, _02233130 ; =0x00000474
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02233126
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	pop {r3, r4, r5, pc}
_02233126:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223312C: .word ov74_0223C9B8
_02233130: .word 0x00000474
	thumb_func_end ov74_022330D0

	thumb_func_start ov74_02233134
ov74_02233134: ; 0x02233134
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _02233170
	bl ov74_02232B18
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _02233194 ; =ov74_0223C9B8
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	mov r1, #0x46
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	sub r1, #0x34
	mov r2, #1
	add r0, #0x10
	str r2, [r5, r0]
	add r0, r5, #0
	add r1, r5, r1
	mov r2, #0x18
	bl ov74_02231A1C
	mov r0, #0
	str r0, [r5, #4]
	b _02233190
_02233170:
	ldr r0, _02233198 ; =0x00000474
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02233190
	add r0, r5, #0
	bl ov74_02232F5C
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	pop {r3, r4, r5, pc}
_02233190:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02233194: .word ov74_0223C9B8
_02233198: .word 0x00000474
	thumb_func_end ov74_02233134

	thumb_func_start ov74_0223319C
ov74_0223319C: ; 0x0223319C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	ldr r2, [r5, #8]
	mvn r1, r1
	cmp r2, r1
	beq _022331DE
	bl ov74_02232B18
	mov r0, #1
	bl sub_02002B8C
	mov r1, #0x46
	ldr r0, [r5, #8]
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #0x10
	sub r1, #0x34
	str r4, [r5, r0]
	add r0, r5, #0
	add r1, r5, r1
	mov r2, #0x18
	bl ov74_02231A1C
	mov r0, #0
	mvn r0, r0
	str r0, [r5, #8]
	ldr r0, _02233220 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _0223321C
_022331DE:
	cmp r4, #0
	beq _022331FC
	ldr r0, _02233224 ; =0x00000474
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223321C
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	pop {r3, r4, r5, pc}
_022331FC:
	ldr r0, _02233228 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _0223320C
	ldr r0, _0223322C ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _0223321C
_0223320C:
	mov r0, #0
	bl sub_02002B8C
	ldr r0, _02233220 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223321C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02233220: .word SEQ_SE_DP_SELECT
_02233224: .word 0x00000474
_02233228: .word gSystem + 0x40
_0223322C: .word gSystem
	thumb_func_end ov74_0223319C

	thumb_func_start ov74_02233230
ov74_02233230: ; 0x02233230
	push {r3, r4, r5, lr}
	mov r2, #0xe
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x4c
	lsl r2, r2, #0xe
	bl CreateHeap
	ldr r1, _022332D8 ; =0x00012610
	add r0, r5, #0
	mov r2, #0x4c
	bl OverlayManager_CreateAndGetData
	ldr r2, _022332D8 ; =0x00012610
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x4c
	bl BgConfig_Alloc
	str r0, [r4, #0x20]
	mov r0, #0x4c
	bl sub_0201660C
	ldr r1, _022332DC ; =0x0000E88C
	str r0, [r4, r1]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	str r0, [r4, #0x10]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x18]
	bl Options_GetFrame
	str r0, [r4, #0x1c]
	mov r0, #6
	lsl r0, r0, #6
	mov r1, #0x4c
	bl String_ctor
	ldr r1, _022332E0 ; =0x00012608
	str r0, [r4, r1]
	mov r0, #6
	lsl r0, r0, #6
	mov r1, #0x4c
	bl String_ctor
	ldr r1, _022332E4 ; =0x0001260C
	mov r2, #1
	str r0, [r4, r1]
	ldr r1, _022332E8 ; =0x0000047E
	mov r0, #9
	bl sub_02004EC4
	bl OS_IsTickAvailable
	cmp r0, #0
	bne _022332C6
	bl OS_InitTick
_022332C6:
	bl ov74_02236074
	ldr r0, _022332EC ; =0x0000E89C
	add r1, r4, r0
	ldr r0, _022332F0 ; =ov74_0223D338
	str r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_022332D8: .word 0x00012610
_022332DC: .word 0x0000E88C
_022332E0: .word 0x00012608
_022332E4: .word 0x0001260C
_022332E8: .word 0x0000047E
_022332EC: .word 0x0000E89C
_022332F0: .word ov74_0223D338
	thumb_func_end ov74_02233230

	thumb_func_start ov74_022332F4
ov74_022332F4: ; 0x022332F4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl CTRDG_IsExisting
	bl CTRDG_IsPulledOut
	cmp r0, #1
	beq _02233312
	ldr r0, _02233618 ; =_02111864
	ldr r0, [r0]
	cmp r0, #0
	beq _02233328
_02233312:
	ldr r0, _0223361C ; =0x0000E890
	ldr r0, [r4, r0]
	sub r0, r0, #3
	cmp r0, #1
	bhi _02233322
	ldr r0, [r4, #0x10]
	bl Save_Cancel
_02233322:
	mov r0, #0x4c
	bl ShowGBACartRemovedError
_02233328:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r5]
	cmp r0, #0x18
	bhi _02233424
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233340: ; jump table
	.short _02233372 - _02233340 - 2 ; case 0
	.short _022333BA - _02233340 - 2 ; case 1
	.short _02233400 - _02233340 - 2 ; case 2
	.short _02233414 - _02233340 - 2 ; case 3
	.short _0223344E - _02233340 - 2 ; case 4
	.short _02233466 - _02233340 - 2 ; case 5
	.short _022334BC - _02233340 - 2 ; case 6
	.short _022334CE - _02233340 - 2 ; case 7
	.short _022334EC - _02233340 - 2 ; case 8
	.short _022334FE - _02233340 - 2 ; case 9
	.short _0223355C - _02233340 - 2 ; case 10
	.short _02233574 - _02233340 - 2 ; case 11
	.short _02233588 - _02233340 - 2 ; case 12
	.short _022335C8 - _02233340 - 2 ; case 13
	.short _022336F6 - _02233340 - 2 ; case 14
	.short _02233710 - _02233340 - 2 ; case 15
	.short _0223372C - _02233340 - 2 ; case 16
	.short _02233746 - _02233340 - 2 ; case 17
	.short _0223377C - _02233340 - 2 ; case 18
	.short _022337A2 - _02233340 - 2 ; case 19
	.short _0223380C - _02233340 - 2 ; case 20
	.short _02233818 - _02233340 - 2 ; case 21
	.short _0223385A - _02233340 - 2 ; case 22
	.short _0223387E - _02233340 - 2 ; case 23
	.short _0223388C - _02233340 - 2 ; case 24
_02233372:
	bl PmAgbCartridgeUnlinkSpec
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r4, r0
	bl PmAgbCartridgeGetOffsets
	ldr r1, _02233620 ; =0x000004A8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _022333AE
	bl ov74_02233CE4
	ldr r1, _02233624 ; =0x000004AC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _022333AA
	bl ov74_02233F4C
	ldr r1, _02233628 ; =0x0000E880
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldrb r2, [r0]
	add r0, r1, #4
	str r2, [r4, r0]
	b _022333AE
_022333AA:
	mov r0, #1
	str r0, [r4, #4]
_022333AE:
	add r0, r4, #0
	bl ov74_02231790
	mov r0, #1
	str r0, [r5]
	b _02233896
_022333BA:
	add r0, r4, #0
	bl ov74_02232A48
	bl ov74_02231BC0
	add r0, r4, #0
	bl ov74_02231BF0
	add r0, r4, #0
	bl ov74_02231CFC
	add r0, r4, #0
	bl ov74_022322D8
	ldr r0, _0223362C ; =ov74_02233024
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _022333FA
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xb
	add r3, r5, #0
	bl ov74_02232910
	b _02233896
_022333FA:
	mov r0, #2
	str r0, [r5]
	b _02233896
_02233400:
	add r0, r4, #0
	bl ov74_02232F9C
	add r0, r4, #0
	mov r1, #1
	mov r2, #3
	add r3, r5, #0
	bl ov74_02232910
	b _02233896
_02233414:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02233426
	cmp r0, #2
	beq _02233438
_02233424:
	b _02233896
_02233426:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
#ifdef HEARTGOLD
	mov r0, #0x22
#else
	mov r0, #0x23
#endif
	str r0, [r4, #8]
	mov r0, #4
	str r0, [r5]
	b _02233896
_02233438:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x18
	add r3, r5, #0
	bl ov74_02232940
	b _02233896
_0223344E:
	add r0, r4, #0
	mov r1, #1
	bl ov74_0223319C
	cmp r0, #0
	beq _02233476
	add r0, r4, #0
	bl ov74_02232F5C
	mov r0, #5
	str r0, [r5]
	b _02233896
_02233466:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02233478
	cmp r0, #2
	beq _022334A6
_02233476:
	b _02233896
_02233478:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	bl ov74_02233060
	str r0, [r4, #4]
	cmp r0, #0
	beq _0223349E
	sub r0, r0, #3
	cmp r0, #1
	bhi _02233498
	mov r0, #8
	str r0, [r5]
	b _02233896
_02233498:
	mov r0, #0xb
	str r0, [r5]
	b _02233896
_0223349E:
	mov r0, #6
	str r0, [r4, #8]
	str r0, [r5]
	b _02233896
_022334A6:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x18
	add r3, r5, #0
	bl ov74_02232940
	b _02233896
_022334BC:
	add r0, r4, #0
	mov r1, #1
	bl ov74_0223319C
	cmp r0, #0
	beq _0223350E
	mov r0, #7
	str r0, [r5]
	b _02233896
_022334CE:
	ldr r0, _02233634 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _022334DE
	ldr r0, _02233638 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _0223350E
_022334DE:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	add r3, r5, #0
	bl ov74_02232910
	b _02233896
_022334EC:
	ldr r1, [r4, #4]
	add r0, r4, #0
	bl ov74_02233134
	cmp r0, #0
	beq _0223350E
	mov r0, #9
	str r0, [r5]
	b _02233896
_022334FE:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02233510
	cmp r0, #2
	beq _02233546
_0223350E:
	b _02233896
_02233510:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	mov r1, #0x47
	lsl r1, r1, #4
	mov r2, #0
	add r0, r1, #0
	str r2, [r4, r1]
	sub r1, #0x44
	mov r3, #0x28
	sub r0, #0x10
	str r3, [r4, r0]
	add r0, r4, #0
	add r1, r4, r1
	bl ov74_02231A1C
	ldr r1, _0223363C ; =0x00000498
	add r0, r4, r1
	sub r1, #0xc6
	bl sub_0200F0AC
	ldr r1, _02233640 ; =0x0000E898
	str r0, [r4, r1]
	mov r0, #0xa
	str r0, [r5]
	b _02233896
_02233546:
	ldr r0, _02233630 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x18
	add r3, r5, #0
	bl ov74_02232940
	b _02233896
_0223355C:
	add r0, r4, #0
	bl ov74_02231930
	ldr r0, _02233640 ; =0x0000E898
	ldr r0, [r4, r0]
	bl sub_0200F450
	mov r0, #7
	str r0, [r4, #4]
	mov r0, #0xb
	str r0, [r5]
	b _02233896
_02233574:
	ldr r1, [r4, #4]
	add r0, r4, #0
	bl ov74_022330D0
	cmp r0, #0
	bne _02233582
	b _02233896
_02233582:
	mov r0, #0x16
	str r0, [r5]
	b _02233896
_02233588:
	ldr r0, _0223363C ; =0x00000498
	add r0, r4, r0
	bl ov74_02232DA4
	add r0, r4, #0
	bl ov74_02232AC8
	add r0, r4, #0
	bl ov74_02232154
	add r0, r4, #0
	bl ov74_02231FF4
	ldr r0, _0223362C ; =ov74_02233024
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #0
	bl ov74_02232758
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xd
	add r3, r5, #0
	bl ov74_02232910
	b _02233896
_022335C8:
	mov r0, #0x31
	lsl r0, r0, #4
	add r0, r4, r0
	bl sub_02025224
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _022336A2
	cmp r6, #0x1e
	bge _02233698
	add r0, r4, #0
	add r1, r6, #0
	bl ov74_022324A0
	cmp r0, #1
	bne _02233652
	ldr r2, _02233628 ; =0x0000E880
	add r0, r4, #0
	ldr r1, [r4, r2]
	add r2, r2, #4
	ldr r3, [r4, r2]
	mov r2, #0x96
	lsl r2, r2, #4
	add r1, r1, #4
	mul r2, r3
	add r2, r1, r2
	mov r1, #0x50
	mul r1, r6
	add r1, r2, r1
	bl ov74_02232758
	mov r0, #0x41
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #6
	bne _022336A2
	ldr r0, _02233644 ; =0x0000E888
	b _02233648
	.balign 4, 0
_02233618: .word _02111864
_0223361C: .word 0x0000E890
_02233620: .word 0x000004A8
_02233624: .word 0x000004AC
_02233628: .word 0x0000E880
_0223362C: .word ov74_02233024
_02233630: .word 0x0000E88C
_02233634: .word gSystem + 0x40
_02233638: .word gSystem
_0223363C: .word 0x00000498
_02233640: .word 0x0000E898
_02233644: .word 0x0000E888
_02233648:
	mov r1, #0x2d
	str r1, [r4, r0]
	mov r0, #0xf
	str r0, [r5]
	b _02233896
_02233652:
	cmp r0, #2
	bne _02233660
	add r0, r4, #0
	mov r1, #0
	bl ov74_02232758
	b _02233896
_02233660:
	cmp r0, #4
	bne _0223366E
	mov r0, #8
	str r0, [r4, #8]
	mov r0, #0xe
	str r0, [r5]
	b _02233896
_0223366E:
	cmp r0, #5
	bne _0223367C
	mov r0, #9
	str r0, [r4, #8]
	mov r0, #0xe
	str r0, [r5]
	b _02233896
_0223367C:
	cmp r0, #6
	bne _0223368A
	mov r0, #0x26
	str r0, [r4, #8]
	mov r0, #0xe
	str r0, [r5]
	b _02233896
_0223368A:
	cmp r0, #7
	bne _022336A2
	mov r0, #0x26
	str r0, [r4, #8]
	mov r0, #0xe
	str r0, [r5]
	b _02233896
_02233698:
	beq _022336E2
	cmp r6, #0x1f
	beq _022336A4
	cmp r6, #0x20
	beq _022336C2
_022336A2:
	b _02233896
_022336A4:
	ldr r0, _022338A4 ; =0x0000E884
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _022336B0
	mov r1, #0xd
	b _022336B2
_022336B0:
	sub r1, r1, #1
_022336B2:
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov74_02231FF4
	ldr r0, _022338A8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _02233896
_022336C2:
	ldr r0, _022338A4 ; =0x0000E884
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0xe
	bne _022336D4
	mov r1, #0
	str r1, [r4, r0]
_022336D4:
	add r0, r4, #0
	bl ov74_02231FF4
	ldr r0, _022338A8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _02233896
_022336E2:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x18
	add r3, r5, #0
	bl ov74_02232940
	ldr r0, _022338A8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _02233896
_022336F6:
	add r0, r4, #0
	mov r1, #0
	bl ov74_0223319C
	cmp r0, #0
	beq _02233756
	ldr r0, _022338AC ; =0x00000498
	add r0, r4, r0
	bl ov74_02232DA4
	mov r0, #0xd
	str r0, [r5]
	b _02233896
_02233710:
	ldr r0, _022338B0 ; =0x0000E888
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02233756
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x10
	add r3, r5, #0
	bl ov74_02232910
	b _02233896
_0223372C:
	add r0, r4, #0
	bl ov74_02232BD4
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x11
	add r3, r5, #0
	bl ov74_02232910
	add r0, r4, #0
	bl ov74_02232F5C
	b _02233896
_02233746:
	ldr r0, _022338B4 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02233758
	cmp r0, #2
	beq _02233766
_02233756:
	b _02233896
_02233758:
	ldr r0, _022338B4 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	mov r0, #0x12
	str r0, [r5]
	b _02233896
_02233766:
	ldr r0, _022338B4 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x14
	add r3, r5, #0
	bl ov74_02232910
	b _02233896
_0223377C:
	mov r1, #0x46
	mov r0, #0xb
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r1, #0x34
	add r0, r4, #0
	add r1, r4, r1
	mov r2, #0
	bl ov74_02231A1C
	add r0, r4, #0
	bl ov74_02232F5C
	ldr r0, _022338A8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x13
	str r0, [r5]
	b _02233896
_022337A2:
	ldr r0, _022338B4 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _022337B4
	cmp r0, #2
	beq _022337F6
	b _02233896
_022337B4:
	ldr r0, [r4]
	mov r2, #0
	lsl r1, r0, #2
	ldr r0, _022338B8 ; =ov74_0223C968
	ldr r0, [r0, r1]
	mov r1, #0x46
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r1, #0x34
	add r0, r4, #0
	add r1, r4, r1
	bl ov74_02231A1C
	ldr r0, _022338B4 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	ldr r0, _022338BC ; =0x0000E890
	mov r1, #0
	str r1, [r4, r0]
	ldr r1, _022338AC ; =0x00000498
	add r0, r4, r1
	sub r1, #0xc6
	bl sub_0200F0AC
	ldr r1, _022338C0 ; =0x0000E898
	str r0, [r4, r1]
	mov r0, #0x15
	str r0, [r5]
	mov r0, #4
	bl sub_0201A728
	b _02233896
_022337F6:
	ldr r0, _022338B4 ; =0x0000E88C
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x14
	add r3, r5, #0
	bl ov74_02232910
	b _02233896
_0223380C:
	add r0, r4, #0
	bl ov74_02232DC4
	mov r0, #0xc
	str r0, [r5]
	b _02233896
_02233818:
	add r0, r4, #0
	bl ov74_022317D8
	add r6, r0, #0
	cmp r6, #0xa
	beq _02233896
	ldr r0, _022338C0 ; =0x0000E898
	ldr r0, [r4, r0]
	bl sub_0200F450
	ldr r0, _022338C4 ; =SEQ_SE_DP_SAVE
	bl PlaySE
	cmp r6, #0xb
	bne _0223383A
#ifdef HEARTGOLD
	mov r1, #0x1d
#else
	mov r1, #0x1e
#endif
	b _0223383C
_0223383A:
	mov r1, #0x24
_0223383C:
	mov r0, #0x46
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _022338C8 ; =0x0000042C
	add r0, r4, #0
	add r1, r4, r1
	mov r2, #0
	bl ov74_02231A1C
	mov r0, #0x16
	str r0, [r5]
	mov r0, #4
	bl sub_0201A738
	b _02233896
_0223385A:
	ldr r0, _022338CC ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _0223386A
	ldr r0, _022338D0 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _02233896
_0223386A:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x18
	add r3, r5, #0
	bl ov74_02232940
	ldr r0, _022338A8 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _02233896
_0223387E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02233896
	ldr r0, [r4, #0x24]
	str r0, [r5]
	b _02233896
_0223388C:
	add r0, r4, #0
	bl ov74_02232E3C
	mov r0, #1
	pop {r4, r5, r6, pc}
_02233896:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _022338A0
	bl sub_0202457C
_022338A0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022338A4: .word 0x0000E884
_022338A8: .word SEQ_SE_DP_SELECT
_022338AC: .word 0x00000498
_022338B0: .word 0x0000E888
_022338B4: .word 0x0000E88C
_022338B8: .word ov74_0223C968
_022338BC: .word 0x0000E890
_022338C0: .word 0x0000E898
_022338C4: .word SEQ_SE_DP_SAVE
_022338C8: .word 0x0000042C
_022338CC: .word gSystem + 0x40
_022338D0: .word gSystem
	thumb_func_end ov74_022332F4

	thumb_func_start ov74_022338D4
ov74_022338D4: ; 0x022338D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _02233914 ; =0x00012608
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _02233918 ; =0x0001260C
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, [r4, #0x20]
	bl FreeToHeap
	ldr r0, _0223391C ; =FS_OVERLAY_ID(OVY_60)
	ldr r1, _02233920 ; =ov60_021EAFE0
	bl RegisterMainOverlay
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x4c
	bl DestroyHeap
	mov r0, #0
	bl ov74_02236034
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02233914: .word 0x00012608
_02233918: .word 0x0001260C
_0223391C: .word FS_OVERLAY_ID(OVY_60)
_02233920: .word ov60_021EAFE0
	thumb_func_end ov74_022338D4

	thumb_func_start PmAgbCartridgeHasFlash
PmAgbCartridgeHasFlash: ; 0x02233924
	push {r3, lr}
	mov r0, #1
	bl CTRDG_IdentifyAgbBackup
	cmp r0, #0
	bne _02233934
	mov r0, #1
	pop {r3, pc}
_02233934:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end PmAgbCartridgeHasFlash

	thumb_func_start PmAgbCartridgeGetOffsets
PmAgbCartridgeGetOffsets: ; 0x02233938
	push {r3, lr}
	ldr r1, _02233994 ; =ov74_0223D33C
	str r0, [r1, #8]
	ldr r0, _02233998 ; =sPmAgbCartridgeSpec
	ldr r0, [r0]
	cmp r0, #0
	beq _0223394A
	mov r0, #0xc
	pop {r3, pc}
_0223394A:
	ldr r0, _0223399C ; =sPmAgbRomCodeMappings
	mov r1, #0x1e
	bl IdentifyPmAgbCartridge
	cmp r0, #0
	bne _02233992
	ldr r0, _02233998 ; =sPmAgbCartridgeSpec
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0223397A
	mov r0, #0x89
	ldr r1, _022339A0 ; =sPmAgbRomHeader + 0x68
	lsl r0, r0, #4
	str r0, [r1, #0x20]
	mov r0, #0xeb
	lsl r0, r0, #6
	str r0, [r1, #0x24]
	ldr r2, _022339A4 ; =0x00001220
	ldr r0, _02233994 ; =ov74_0223D33C
	str r2, [r0, #0x68]
	mov r0, #9
	str r0, [r1, #0x30]
	b _02233984
_0223397A:
	ldr r0, _022339A8 ; =0x08000100
	ldr r1, _022339AC ; =sPmAgbRomHeader
	mov r2, #0xfc
	bl CTRDG_CpuCopy32
_02233984:
	bl PmAgbCartridgeHasFlash
	cmp r0, #0
	bne _02233990
	mov r0, #3
	pop {r3, pc}
_02233990:
	mov r0, #0
_02233992:
	pop {r3, pc}
	.balign 4, 0
_02233994: .word ov74_0223D33C
_02233998: .word sPmAgbCartridgeSpec
_0223399C: .word sPmAgbRomCodeMappings
_022339A0: .word sPmAgbRomHeader + 0x68
_022339A4: .word 0x00001220
_022339A8: .word 0x08000100
_022339AC: .word sPmAgbRomHeader
	thumb_func_end PmAgbCartridgeGetOffsets

	thumb_func_start PmAgbCartridgeUnlinkSpec
PmAgbCartridgeUnlinkSpec: ; 0x022339B0
	ldr r0, _022339B8 ; =sPmAgbCartridgeSpec
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
_022339B8: .word sPmAgbCartridgeSpec
	thumb_func_end PmAgbCartridgeUnlinkSpec

	thumb_func_start PmAgbCartridge_GetVersionInternal
PmAgbCartridge_GetVersionInternal: ; 0x022339BC
	ldr r0, _022339C4 ; =sPmAgbCartridgeSpec
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	bx lr
	.balign 4, 0
_022339C4: .word sPmAgbCartridgeSpec
	thumb_func_end PmAgbCartridge_GetVersionInternal

	thumb_func_start PmAgbCartridge_GetLanguage
PmAgbCartridge_GetLanguage: ; 0x022339C8
	ldr r0, _022339D0 ; =sPmAgbCartridgeSpec
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	bx lr
	.balign 4, 0
_022339D0: .word sPmAgbCartridgeSpec
	thumb_func_end PmAgbCartridge_GetLanguage

	thumb_func_start IdentifyPmAgbCartridge
IdentifyPmAgbCartridge: ; 0x022339D4
	push {r3, r4, r5, lr}
	sub sp, #0xc0
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _02233A80 ; =sPmAgbCartridgeSpec
	mov r1, #0
	str r1, [r0]
	bl CTRDG_IsAgbCartridge
	cmp r0, #0
	bne _022339F0
	add sp, #0xc0
	mov r0, #1
	pop {r3, r4, r5, pc}
_022339F0:
	bl CTRDG_GetAgbGameCode
	mov r2, #0
	cmp r4, #0
	ble _02233A14
	add r3, r5, #0
_022339FC:
	ldr r1, [r3]
	cmp r0, r1
	bne _02233A0C
	lsl r0, r2, #3
	add r1, r5, r0
	ldr r0, _02233A80 ; =sPmAgbCartridgeSpec
	str r1, [r0]
	b _02233A14
_02233A0C:
	add r2, r2, #1
	add r3, #8
	cmp r2, r4
	blt _022339FC
_02233A14:
	ldr r0, _02233A80 ; =sPmAgbCartridgeSpec
	ldr r0, [r0]
	cmp r0, #0
	bne _02233A22
	add sp, #0xc0
	mov r0, #2
	pop {r3, r4, r5, pc}
_02233A22:
	mov r0, #1
	bl CTRDG_Enable
	add r4, sp, #0
	mov r0, #2
	lsl r0, r0, #0x1a
	add r1, r4, #0
	mov r2, #0xc0
	bl CTRDG_CpuCopy32
	ldr r3, _02233A84 ; =sAgbCartNintendoLogo
	mov r2, #0
_02233A3A:
	add r0, r4, r2
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	beq _02233A4A
	add sp, #0xc0
	mov r0, #4
	pop {r3, r4, r5, pc}
_02233A4A:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #0x9c
	blo _02233A3A
	mov r2, #0
	mov r1, #0xa0
_02233A56:
	ldrb r0, [r4, r1]
	add r1, r1, #1
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r1, #0xbc
	ble _02233A56
	add r2, #0x19
	neg r0, r2
	lsl r0, r0, #0x18
	add r4, #0xbd
	lsr r1, r0, #0x18
	ldrb r0, [r4]
	cmp r0, r1
	beq _02233A7A
	add sp, #0xc0
	mov r0, #4
	pop {r3, r4, r5, pc}
_02233A7A:
	mov r0, #0
	add sp, #0xc0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02233A80: .word sPmAgbCartridgeSpec
_02233A84: .word sAgbCartNintendoLogo
	thumb_func_end IdentifyPmAgbCartridge

	thumb_func_start ov74_02233A88
ov74_02233A88: ; 0x02233A88
	push {r3, r4}
	mov r2, #0
	lsr r4, r1, #2
	add r3, r2, #0
	cmp r4, #0
	ble _02233AA4
_02233A94:
	ldr r1, [r0]
	add r0, r0, #4
	add r2, r2, r1
	add r1, r3, #1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	cmp r3, r4
	blt _02233A94
_02233AA4:
	lsr r0, r2, #0x10
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_02233A88

	thumb_func_start ov74_02233AB8
ov74_02233AB8: ; 0x02233AB8
	push {r3, lr}
	lsl r0, r0, #0x10
	mov r3, #1
	add r2, r1, #0
	lsr r0, r0, #0x10
	mov r1, #0
	lsl r3, r3, #0xc
	bl CTRDG_ReadAgbFlash
	pop {r3, pc}
	thumb_func_end ov74_02233AB8

	thumb_func_start ov74_02233ACC
ov74_02233ACC: ; 0x02233ACC
	cmp r0, #0
	bne _02233ADA
	ldr r0, _02233B00 ; =sPmAgbRomHeader + 0x68
	ldr r0, [r0, #0x20]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
_02233ADA:
	cmp r0, #4
	bne _02233AEE
	ldr r0, _02233B00 ; =sPmAgbRomHeader + 0x68
	ldr r1, [r0, #0x24]
	mov r0, #0xba
	lsl r0, r0, #6
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
_02233AEE:
	cmp r0, #0xd
	bne _02233AF8
	mov r0, #0x7d
	lsl r0, r0, #4
	bx lr
_02233AF8:
	mov r0, #0x3e
	lsl r0, r0, #6
	bx lr
	nop
_02233B00: .word sPmAgbRomHeader + 0x68
	thumb_func_end ov74_02233ACC

	thumb_func_start ov74_02233B04
ov74_02233B04: ; 0x02233B04
	cmp r0, #0
	bne _02233B14
	ldr r0, _02233B54 ; =ov74_0223D33C
	ldr r1, [r0, #8]
	mov r0, #1
	lsl r0, r0, #0xc
	add r0, r1, r0
	bx lr
_02233B14:
	cmp r0, #1
	blt _02233B32
	cmp r0, #4
	bgt _02233B32
	ldr r1, _02233B54 ; =ov74_0223D33C
	ldr r2, [r1, #8]
	mov r1, #2
	lsl r1, r1, #0xc
	add r2, r2, r1
	sub r1, r0, #1
	mov r0, #0x3e
	lsl r0, r0, #6
	mul r0, r1
	add r0, r2, r0
	bx lr
_02233B32:
	cmp r0, #5
	blt _02233B50
	cmp r0, #0xe
	bge _02233B50
	ldr r1, _02233B54 ; =ov74_0223D33C
	ldr r2, [r1, #8]
	mov r1, #6
	lsl r1, r1, #0xc
	add r2, r2, r1
	sub r1, r0, #5
	mov r0, #0x3e
	lsl r0, r0, #6
	mul r0, r1
	add r0, r2, r0
	bx lr
_02233B50:
	mov r0, #0
	bx lr
	.balign 4, 0
_02233B54: .word ov74_0223D33C
	thumb_func_end ov74_02233B04

	thumb_func_start ov74_02233B58
ov74_02233B58: ; 0x02233B58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r6, #0
	add r5, r1, #0
	str r6, [sp, #4]
	add r1, r2, #0
	str r6, [r1]
	ldr r1, _02233BEC ; =ov74_0223D33C
	add r7, r0, #0
	str r6, [r1, #4]
	mov r1, #0xe
	str r2, [sp]
	add r4, r6, #0
	mul r7, r1
_02233B74:
	add r0, r4, #0
	mov r1, #0xe
	bl _s32_div_f
	add r0, r1, r7
	add r1, r5, #0
	bl ov74_02233AB8
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl DC_FlushRange
	ldr r0, _02233BF0 ; =0x00000FF8
	ldr r1, [r5, r0]
	ldr r0, _02233BF4 ; =0x08012025
	cmp r1, r0
	bne _02233BC6
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _02233BF8 ; =0x00000FF4
	ldrh r0, [r5, r0]
	bl ov74_02233ACC
	add r1, r0, #0
	add r0, r5, #0
	bl ov74_02233A88
	ldr r1, _02233BFC ; =0x00000FF6
	ldrh r1, [r5, r1]
	cmp r1, r0
	bne _02233BC6
	ldr r0, _02233C00 ; =0x00000FFC
	ldr r1, [r5, r0]
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, _02233BF8 ; =0x00000FF4
	ldrh r1, [r5, r0]
	mov r0, #1
	lsl r0, r1
	orr r6, r0
_02233BC6:
	add r4, r4, #1
	cmp r4, #0xe
	blt _02233B74
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02233BE4
	ldr r0, _02233C04 ; =0x00003FFF
	cmp r6, r0
	bne _02233BDE
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02233BDE:
	add sp, #8
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_02233BE4:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02233BEC: .word ov74_0223D33C
_02233BF0: .word 0x00000FF8
_02233BF4: .word 0x08012025
_02233BF8: .word 0x00000FF4
_02233BFC: .word 0x00000FF6
_02233C00: .word 0x00000FFC
_02233C04: .word 0x00003FFF
	thumb_func_end ov74_02233B58

	thumb_func_start ov74_02233C08
ov74_02233C08: ; 0x02233C08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	mov r0, #0
	add r1, r7, #0
	add r2, sp, #4
	bl ov74_02233B58
	add r6, r0, #0
	mov r0, #1
	add r1, r7, #0
	add r2, sp, #0
	bl ov74_02233B58
	cmp r6, #1
	bne _02233C80
	cmp r0, #1
	bne _02233C80
	mov r1, #0
	ldr r0, [sp, #4]
	mvn r1, r1
	cmp r0, r1
	bne _02233C40
	ldr r3, [sp]
	cmp r3, #0
	beq _02233C4E
_02233C40:
	cmp r0, #0
	bne _02233C66
	mov r1, #0
	ldr r3, [sp]
	mvn r1, r1
	cmp r3, r1
	bne _02233C66
_02233C4E:
	add r2, r0, #1
	add r1, r3, #1
	cmp r2, r1
	bhs _02233C5E
	str r3, [r4]
	mov r0, #1
	str r0, [r5]
	b _02233C7A
_02233C5E:
	str r0, [r4]
	mov r0, #0
	str r0, [r5]
	b _02233C7A
_02233C66:
	ldr r1, [sp]
	cmp r0, r1
	bhs _02233C74
	str r1, [r4]
	mov r0, #1
	str r0, [r5]
	b _02233C7A
_02233C74:
	str r0, [r4]
	mov r0, #0
	str r0, [r5]
_02233C7A:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02233C80:
	cmp r6, #1
	bne _02233CA4
	cmp r0, #1
	beq _02233CA4
	ldr r1, [sp, #4]
	cmp r0, #0xff
	str r1, [r4]
	bne _02233C9A
	mov r0, #0
	str r0, [r5]
	add sp, #8
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_02233C9A:
	mov r0, #0
	str r0, [r5]
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02233CA4:
	cmp r0, #1
	bne _02233CC6
	cmp r6, #1
	beq _02233CC6
	ldr r0, [sp]
	cmp r6, #0xff
	str r0, [r4]
	bne _02233CBE
	mov r0, #1
	str r0, [r5]
	add sp, #8
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_02233CBE:
	mov r0, #1
	add sp, #8
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02233CC6:
	cmp r6, #0
	bne _02233CD8
	cmp r0, #0
	bne _02233CD8
	mov r0, #0
	str r0, [r4]
	add sp, #8
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02233CD8:
	mov r0, #0
	str r0, [r4]
	str r0, [r5]
	mov r0, #2
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_02233C08

	thumb_func_start ov74_02233CE4
ov74_02233CE4: ; 0x02233CE4
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02233D98 ; =ov74_0223D33C
	ldr r1, _02233D9C ; =ov74_0223D33C
	ldr r0, [r0, #8]
	ldr r2, _02233DA0 ; =ov74_0223D34C
	bl ov74_02233C08
	cmp r0, #1
	beq _02233D0E
	cmp r0, #0
	beq _02233D06
	cmp r0, #2
	beq _02233D0A
	cmp r0, #0xff
	bne _02233D0E
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_02233D06:
	mov r0, #7
	pop {r3, r4, r5, r6, r7, pc}
_02233D0A:
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_02233D0E:
	ldr r7, _02233D98 ; =ov74_0223D33C
	ldr r0, [r7]
	cmp r0, #1
	bhi _02233D92
	mov r6, #0
	ldr r5, [r7, #8]
	add r4, r6, #0
_02233D1C:
	ldr r1, [r7]
	mov r0, #0xe
	mul r0, r1
	add r0, r4, r0
	add r1, r5, #0
	bl ov74_02233AB8
	ldr r0, _02233DA4 ; =0x00000FF8
	ldr r1, [r5, r0]
	ldr r0, _02233DA8 ; =0x08012025
	cmp r1, r0
	bne _02233D7E
	ldr r0, _02233DAC ; =0x00000FF4
	ldrh r0, [r5, r0]
	bl ov74_02233ACC
	add r1, r0, #0
	add r0, r5, #0
	bl ov74_02233A88
	ldr r1, _02233DB0 ; =0x00000FF6
	ldrh r1, [r5, r1]
	cmp r1, r0
	bne _02233D7E
	ldr r0, _02233DB4 ; =0x00000FFC
	mov r1, #1
	ldr r0, [r5, r0]
	str r0, [r7, #0x10]
	ldr r0, _02233DAC ; =0x00000FF4
	ldrh r0, [r5, r0]
	lsl r1, r0
	orr r6, r1
	bl ov74_02233ACC
	str r0, [sp]
	ldr r0, _02233DAC ; =0x00000FF4
	ldrh r0, [r5, r0]
	bl ov74_02233B04
	add r1, r0, #0
	ldr r2, [sp]
	add r0, r5, #0
	bl MIi_CpuCopy32
	ldr r0, _02233DAC ; =0x00000FF4
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _02233D7E
	str r4, [r7, #0xc]
_02233D7E:
	add r4, r4, #1
	cmp r4, #0xe
	blt _02233D1C
	ldr r0, _02233DB8 ; =0x00003FFF
	cmp r6, r0
	bne _02233D8E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02233D8E:
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02233D92:
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02233D98: .word ov74_0223D33C
_02233D9C: .word ov74_0223D33C
_02233DA0: .word ov74_0223D34C
_02233DA4: .word 0x00000FF8
_02233DA8: .word 0x08012025
_02233DAC: .word 0x00000FF4
_02233DB0: .word 0x00000FF6
_02233DB4: .word 0x00000FFC
_02233DB8: .word 0x00003FFF
	thumb_func_end ov74_02233CE4

	thumb_func_start ov74_02233DBC
ov74_02233DBC: ; 0x02233DBC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _02233E38 ; =ov74_0223D33C
	mov r2, #1
	ldr r5, [r0, #8]
	str r2, [r0, #0x14]
	mov r0, #0
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl MIi_CpuClear32
	add r0, r6, #0
	bl ov74_02233ACC
	add r4, r0, #0
	add r0, r6, #0
	bl ov74_02233B04
	add r1, r5, #0
	add r2, r4, #0
	bl MIi_CpuCopy32
	ldr r0, _02233E38 ; =ov74_0223D33C
	ldr r1, [r0, #0x10]
	ldr r0, _02233E3C ; =0x00000FFC
	str r1, [r5, r0]
	add r1, r0, #0
	sub r1, #8
	strh r6, [r5, r1]
	ldr r1, _02233E40 ; =0x08012025
	sub r0, r0, #4
	str r1, [r5, r0]
	add r0, r6, #0
	bl ov74_02233ACC
	add r1, r0, #0
	add r0, r5, #0
	bl ov74_02233A88
	ldr r1, _02233E44 ; =0x00000FF6
	strh r0, [r5, r1]
	ldr r0, _02233E38 ; =ov74_0223D33C
	mov r1, #0xe
	ldr r0, [r0, #0xc]
	add r0, r6, r0
	add r0, r0, #1
	bl _s32_div_f
	ldr r0, _02233E48 ; =sPmAgbCartridgeSpec
	ldr r3, _02233E4C ; =ov74_02233E50
	ldr r2, [r0, #4]
	mov r0, #0xe
	mul r0, r2
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r5, #0
	mov r2, #4
	bl CTRDG_WriteAndVerifyAgbFlashAsync
	pop {r4, r5, r6, pc}
	nop
_02233E38: .word ov74_0223D33C
_02233E3C: .word 0x00000FFC
_02233E40: .word 0x08012025
_02233E44: .word 0x00000FF6
_02233E48: .word sPmAgbCartridgeSpec
_02233E4C: .word ov74_02233E50
	thumb_func_end ov74_02233DBC

	thumb_func_start ov74_02233E50
ov74_02233E50: ; 0x02233E50
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02233E7C
	ldr r1, _02233E88 ; =ov74_0223D33C
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
	cmp r0, #0xe
	blt _02233E6A
	mov r0, #0
	str r0, [r1, #4]
	str r0, [r1, #0x14]
	bx lr
_02233E6A:
	cmp r0, #0xd
	bne _02233E76
	mov r0, #2
	str r0, [r1, #0x14]
	mov r0, #0
	bx lr
_02233E76:
	mov r0, #3
	str r0, [r1, #0x14]
	b _02233E82
_02233E7C:
	ldr r0, _02233E88 ; =ov74_0223D33C
	mov r1, #4
	str r1, [r0, #0x14]
_02233E82:
	mov r0, #0
	bx lr
	nop
_02233E88: .word ov74_0223D33C
	thumb_func_end ov74_02233E50

	thumb_func_start ov74_02233E8C
ov74_02233E8C: ; 0x02233E8C
	push {r3, lr}
	ldr r1, _02233ECC ; =ov74_0223D33C
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _02233EB2
	ldr r1, [r1]
	cmp r1, #1
	bne _02233EA2
	mov r2, #0
	ldr r1, _02233ED0 ; =sPmAgbCartridgeSpec
	b _02233EA6
_02233EA2:
	ldr r1, _02233ED0 ; =sPmAgbCartridgeSpec
	mov r2, #1
_02233EA6:
	str r2, [r1, #4]
	ldr r1, _02233ECC ; =ov74_0223D33C
	ldr r2, [r1, #0x10]
	add r2, r2, #1
	str r2, [r1, #0x10]
	b _02233EB6
_02233EB2:
	mov r0, #0
	pop {r3, pc}
_02233EB6:
	ldr r1, _02233ED0 ; =sPmAgbCartridgeSpec
	ldr r1, [r1, #4]
	cmp r1, #0
	bge _02233EC2
	mov r0, #0
	pop {r3, pc}
_02233EC2:
	bl ov74_02233DBC
	mov r0, #1
	pop {r3, pc}
	nop
_02233ECC: .word ov74_0223D33C
_02233ED0: .word sPmAgbCartridgeSpec
	thumb_func_end ov74_02233E8C

	thumb_func_start ov74_02233ED4
ov74_02233ED4: ; 0x02233ED4
	push {r3, lr}
	ldr r1, _02233F10 ; =ov74_0223D33C
	ldr r0, [r1, #0x14]
	cmp r0, #4
	bhi _02233F0C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233EEA: ; jump table
	.short _02233F0C - _02233EEA - 2 ; case 0
	.short _02233F04 - _02233EEA - 2 ; case 1
	.short _02233EF4 - _02233EEA - 2 ; case 2
	.short _02233EFE - _02233EEA - 2 ; case 3
	.short _02233F08 - _02233EEA - 2 ; case 4
_02233EF4:
	ldr r0, [r1, #4]
	bl ov74_02233DBC
	mov r0, #0
	pop {r3, pc}
_02233EFE:
	ldr r0, [r1, #4]
	bl ov74_02233DBC
_02233F04:
	mov r0, #0xa
	pop {r3, pc}
_02233F08:
	mov r0, #8
	pop {r3, pc}
_02233F0C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02233F10: .word ov74_0223D33C
	thumb_func_end ov74_02233ED4

	thumb_func_start ov74_02233F14
ov74_02233F14: ; 0x02233F14
	ldr r0, _02233F48 ; =ov74_0223D33C
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bhi _02233F42
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233F28: ; jump table
	.short _02233F42 - _02233F28 - 2 ; case 0
	.short _02233F3A - _02233F28 - 2 ; case 1
	.short _02233F32 - _02233F28 - 2 ; case 2
	.short _02233F36 - _02233F28 - 2 ; case 3
	.short _02233F3E - _02233F28 - 2 ; case 4
_02233F32:
	mov r0, #0xb
	bx lr
_02233F36:
	mov r0, #0xa
	bx lr
_02233F3A:
	mov r0, #9
	bx lr
_02233F3E:
	mov r0, #8
	bx lr
_02233F42:
	mov r0, #0
	bx lr
	nop
_02233F48: .word ov74_0223D33C
	thumb_func_end ov74_02233F14

	thumb_func_start ov74_02233F4C
ov74_02233F4C: ; 0x02233F4C
	ldr r0, _02233F58 ; =ov74_0223D33C
	ldr r1, [r0, #8]
	mov r0, #6
	lsl r0, r0, #0xc
	add r0, r1, r0
	bx lr
	.balign 4, 0
_02233F58: .word ov74_0223D33C
	thumb_func_end ov74_02233F4C

	thumb_func_start ov74_02233F5C
ov74_02233F5C: ; 0x02233F5C
	ldr r3, _02233F64 ; =ov74_02233B04
	mov r0, #0
	bx r3
	nop
_02233F64: .word ov74_02233B04
	thumb_func_end ov74_02233F5C

	thumb_func_start ov74_02233F68
ov74_02233F68: ; 0x02233F68
	push {r3, lr}
	bl ov74_02233F5C
	ldrb r2, [r0, #0xb]
	ldrb r1, [r0, #0xa]
	lsl r3, r2, #8
	ldrb r2, [r0, #0xd]
	ldrb r0, [r0, #0xc]
	lsl r2, r2, #0x18
	lsl r0, r0, #0x10
	orr r0, r2
	orr r0, r3
	orr r0, r1
	pop {r3, pc}
	thumb_func_end ov74_02233F68

	thumb_func_start ov74_02233F84
ov74_02233F84: ; 0x02233F84
	ldr r3, _02233F88 ; =ov74_02233F5C
	bx r3
	.balign 4, 0
_02233F88: .word ov74_02233F5C
	thumb_func_end ov74_02233F84

	thumb_func_start ov74_02233F8C
ov74_02233F8C: ; 0x02233F8C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0x18
	add r5, r2, #0
	mov r6, #0
	bl _u32_div_f
	cmp r1, #0x17
	bhi _02233FE2
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233FAC: ; jump table
	.short _02233FDC - _02233FAC - 2 ; case 0
	.short _0223400E - _02233FAC - 2 ; case 1
	.short _0223403E - _02233FAC - 2 ; case 2
	.short _0223406E - _02233FAC - 2 ; case 3
	.short _0223409E - _02233FAC - 2 ; case 4
	.short _022340CE - _02233FAC - 2 ; case 5
	.short _022340FE - _02233FAC - 2 ; case 6
	.short _02234130 - _02233FAC - 2 ; case 7
	.short _02234160 - _02233FAC - 2 ; case 8
	.short _02234190 - _02233FAC - 2 ; case 9
	.short _022341C0 - _02233FAC - 2 ; case 10
	.short _022341F0 - _02233FAC - 2 ; case 11
	.short _02234220 - _02233FAC - 2 ; case 12
	.short _02234252 - _02233FAC - 2 ; case 13
	.short _02234282 - _02233FAC - 2 ; case 14
	.short _022342B2 - _02233FAC - 2 ; case 15
	.short _022342E2 - _02233FAC - 2 ; case 16
	.short _02234312 - _02233FAC - 2 ; case 17
	.short _02234342 - _02233FAC - 2 ; case 18
	.short _02234374 - _02233FAC - 2 ; case 19
	.short _022343A4 - _02233FAC - 2 ; case 20
	.short _022343D4 - _02233FAC - 2 ; case 21
	.short _02234404 - _02233FAC - 2 ; case 22
	.short _02234434 - _02233FAC - 2 ; case 23
_02233FDC:
	add r4, #0x20
	cmp r5, #3
	bls _02233FE4
_02233FE2:
	b _02234462
_02233FE4:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233FF0: ; jump table
	.short _02233FF8 - _02233FF0 - 2 ; case 0
	.short _02233FFC - _02233FF0 - 2 ; case 1
	.short _02234002 - _02233FF0 - 2 ; case 2
	.short _02234008 - _02233FF0 - 2 ; case 3
_02233FF8:
	add r6, r4, #0
	b _02234462
_02233FFC:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234002:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234008:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_0223400E:
	add r4, #0x20
	cmp r5, #3
	bhi _02234104
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234020: ; jump table
	.short _02234028 - _02234020 - 2 ; case 0
	.short _0223402C - _02234020 - 2 ; case 1
	.short _02234032 - _02234020 - 2 ; case 2
	.short _02234038 - _02234020 - 2 ; case 3
_02234028:
	add r6, r4, #0
	b _02234462
_0223402C:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234032:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234038:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_0223403E:
	add r4, #0x20
	cmp r5, #3
	bhi _02234104
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234050: ; jump table
	.short _02234058 - _02234050 - 2 ; case 0
	.short _0223405C - _02234050 - 2 ; case 1
	.short _02234062 - _02234050 - 2 ; case 2
	.short _02234068 - _02234050 - 2 ; case 3
_02234058:
	add r6, r4, #0
	b _02234462
_0223405C:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234062:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234068:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_0223406E:
	add r4, #0x20
	cmp r5, #3
	bhi _02234104
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234080: ; jump table
	.short _02234088 - _02234080 - 2 ; case 0
	.short _0223408C - _02234080 - 2 ; case 1
	.short _02234092 - _02234080 - 2 ; case 2
	.short _02234098 - _02234080 - 2 ; case 3
_02234088:
	add r6, r4, #0
	b _02234462
_0223408C:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234092:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234098:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_0223409E:
	add r4, #0x20
	cmp r5, #3
	bhi _02234104
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022340B0: ; jump table
	.short _022340B8 - _022340B0 - 2 ; case 0
	.short _022340BC - _022340B0 - 2 ; case 1
	.short _022340C2 - _022340B0 - 2 ; case 2
	.short _022340C8 - _022340B0 - 2 ; case 3
_022340B8:
	add r6, r4, #0
	b _02234462
_022340BC:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_022340C2:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_022340C8:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_022340CE:
	add r4, #0x20
	cmp r5, #3
	bhi _02234104
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022340E0: ; jump table
	.short _022340E8 - _022340E0 - 2 ; case 0
	.short _022340EC - _022340E0 - 2 ; case 1
	.short _022340F2 - _022340E0 - 2 ; case 2
	.short _022340F8 - _022340E0 - 2 ; case 3
_022340E8:
	add r6, r4, #0
	b _02234462
_022340EC:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_022340F2:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_022340F8:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_022340FE:
	add r4, #0x20
	cmp r5, #3
	bls _02234106
_02234104:
	b _02234462
_02234106:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234112: ; jump table
	.short _0223411A - _02234112 - 2 ; case 0
	.short _02234120 - _02234112 - 2 ; case 1
	.short _02234124 - _02234112 - 2 ; case 2
	.short _0223412A - _02234112 - 2 ; case 3
_0223411A:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234120:
	add r6, r4, #0
	b _02234462
_02234124:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_0223412A:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234130:
	add r4, #0x20
	cmp r5, #3
	bhi _02234226
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234142: ; jump table
	.short _0223414A - _02234142 - 2 ; case 0
	.short _02234150 - _02234142 - 2 ; case 1
	.short _02234154 - _02234142 - 2 ; case 2
	.short _0223415A - _02234142 - 2 ; case 3
_0223414A:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234150:
	add r6, r4, #0
	b _02234462
_02234154:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_0223415A:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234160:
	add r4, #0x20
	cmp r5, #3
	bhi _02234226
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234172: ; jump table
	.short _0223417A - _02234172 - 2 ; case 0
	.short _02234180 - _02234172 - 2 ; case 1
	.short _02234184 - _02234172 - 2 ; case 2
	.short _0223418A - _02234172 - 2 ; case 3
_0223417A:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234180:
	add r6, r4, #0
	b _02234462
_02234184:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_0223418A:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234190:
	add r4, #0x20
	cmp r5, #3
	bhi _02234226
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022341A2: ; jump table
	.short _022341AA - _022341A2 - 2 ; case 0
	.short _022341B0 - _022341A2 - 2 ; case 1
	.short _022341B4 - _022341A2 - 2 ; case 2
	.short _022341BA - _022341A2 - 2 ; case 3
_022341AA:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_022341B0:
	add r6, r4, #0
	b _02234462
_022341B4:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_022341BA:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_022341C0:
	add r4, #0x20
	cmp r5, #3
	bhi _02234226
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022341D2: ; jump table
	.short _022341DA - _022341D2 - 2 ; case 0
	.short _022341E0 - _022341D2 - 2 ; case 1
	.short _022341E4 - _022341D2 - 2 ; case 2
	.short _022341EA - _022341D2 - 2 ; case 3
_022341DA:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_022341E0:
	add r6, r4, #0
	b _02234462
_022341E4:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_022341EA:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_022341F0:
	add r4, #0x20
	cmp r5, #3
	bhi _02234226
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234202: ; jump table
	.short _0223420A - _02234202 - 2 ; case 0
	.short _02234210 - _02234202 - 2 ; case 1
	.short _02234214 - _02234202 - 2 ; case 2
	.short _0223421A - _02234202 - 2 ; case 3
_0223420A:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234210:
	add r6, r4, #0
	b _02234462
_02234214:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_0223421A:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234220:
	add r4, #0x20
	cmp r5, #3
	bls _02234228
_02234226:
	b _02234462
_02234228:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234234: ; jump table
	.short _0223423C - _02234234 - 2 ; case 0
	.short _02234242 - _02234234 - 2 ; case 1
	.short _02234248 - _02234234 - 2 ; case 2
	.short _0223424C - _02234234 - 2 ; case 3
_0223423C:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234242:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234248:
	add r6, r4, #0
	b _02234462
_0223424C:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234252:
	add r4, #0x20
	cmp r5, #3
	bhi _02234348
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234264: ; jump table
	.short _0223426C - _02234264 - 2 ; case 0
	.short _02234272 - _02234264 - 2 ; case 1
	.short _02234278 - _02234264 - 2 ; case 2
	.short _0223427C - _02234264 - 2 ; case 3
_0223426C:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234272:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234278:
	add r6, r4, #0
	b _02234462
_0223427C:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234282:
	add r4, #0x20
	cmp r5, #3
	bhi _02234348
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234294: ; jump table
	.short _0223429C - _02234294 - 2 ; case 0
	.short _022342A2 - _02234294 - 2 ; case 1
	.short _022342A8 - _02234294 - 2 ; case 2
	.short _022342AC - _02234294 - 2 ; case 3
_0223429C:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_022342A2:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_022342A8:
	add r6, r4, #0
	b _02234462
_022342AC:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_022342B2:
	add r4, #0x20
	cmp r5, #3
	bhi _02234348
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022342C4: ; jump table
	.short _022342CC - _022342C4 - 2 ; case 0
	.short _022342D2 - _022342C4 - 2 ; case 1
	.short _022342D8 - _022342C4 - 2 ; case 2
	.short _022342DC - _022342C4 - 2 ; case 3
_022342CC:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_022342D2:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_022342D8:
	add r6, r4, #0
	b _02234462
_022342DC:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_022342E2:
	add r4, #0x20
	cmp r5, #3
	bhi _02234348
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022342F4: ; jump table
	.short _022342FC - _022342F4 - 2 ; case 0
	.short _02234302 - _022342F4 - 2 ; case 1
	.short _02234308 - _022342F4 - 2 ; case 2
	.short _0223430C - _022342F4 - 2 ; case 3
_022342FC:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234302:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234308:
	add r6, r4, #0
	b _02234462
_0223430C:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234312:
	add r4, #0x20
	cmp r5, #3
	bhi _02234348
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234324: ; jump table
	.short _0223432C - _02234324 - 2 ; case 0
	.short _02234332 - _02234324 - 2 ; case 1
	.short _02234338 - _02234324 - 2 ; case 2
	.short _0223433C - _02234324 - 2 ; case 3
_0223432C:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234332:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234338:
	add r6, r4, #0
	b _02234462
_0223433C:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234342:
	add r4, #0x20
	cmp r5, #3
	bls _0223434A
_02234348:
	b _02234462
_0223434A:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234356: ; jump table
	.short _0223435E - _02234356 - 2 ; case 0
	.short _02234364 - _02234356 - 2 ; case 1
	.short _0223436A - _02234356 - 2 ; case 2
	.short _02234370 - _02234356 - 2 ; case 3
_0223435E:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234364:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_0223436A:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234370:
	add r6, r4, #0
	b _02234462
_02234374:
	add r4, #0x20
	cmp r5, #3
	bhi _02234462
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234386: ; jump table
	.short _0223438E - _02234386 - 2 ; case 0
	.short _02234394 - _02234386 - 2 ; case 1
	.short _0223439A - _02234386 - 2 ; case 2
	.short _022343A0 - _02234386 - 2 ; case 3
_0223438E:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234394:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_0223439A:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_022343A0:
	add r6, r4, #0
	b _02234462
_022343A4:
	add r4, #0x20
	cmp r5, #3
	bhi _02234462
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022343B6: ; jump table
	.short _022343BE - _022343B6 - 2 ; case 0
	.short _022343C4 - _022343B6 - 2 ; case 1
	.short _022343CA - _022343B6 - 2 ; case 2
	.short _022343D0 - _022343B6 - 2 ; case 3
_022343BE:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_022343C4:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_022343CA:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_022343D0:
	add r6, r4, #0
	b _02234462
_022343D4:
	add r4, #0x20
	cmp r5, #3
	bhi _02234462
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022343E6: ; jump table
	.short _022343EE - _022343E6 - 2 ; case 0
	.short _022343F4 - _022343E6 - 2 ; case 1
	.short _022343FA - _022343E6 - 2 ; case 2
	.short _02234400 - _022343E6 - 2 ; case 3
_022343EE:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_022343F4:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_022343FA:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234400:
	add r6, r4, #0
	b _02234462
_02234404:
	add r4, #0x20
	cmp r5, #3
	bhi _02234462
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234416: ; jump table
	.short _0223441E - _02234416 - 2 ; case 0
	.short _02234424 - _02234416 - 2 ; case 1
	.short _0223442A - _02234416 - 2 ; case 2
	.short _02234430 - _02234416 - 2 ; case 3
_0223441E:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_02234424:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_0223442A:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234430:
	add r6, r4, #0
	b _02234462
_02234434:
	add r4, #0x20
	cmp r5, #3
	bhi _02234462
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234446: ; jump table
	.short _0223444E - _02234446 - 2 ; case 0
	.short _02234454 - _02234446 - 2 ; case 1
	.short _0223445A - _02234446 - 2 ; case 2
	.short _02234460 - _02234446 - 2 ; case 3
_0223444E:
	add r6, r4, #0
	add r6, #0x24
	b _02234462
_02234454:
	add r6, r4, #0
	add r6, #0x18
	b _02234462
_0223445A:
	add r6, r4, #0
	add r6, #0xc
	b _02234462
_02234460:
	add r6, r4, #0
_02234462:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov74_02233F8C

	thumb_func_start ov74_02234468
ov74_02234468: ; 0x02234468
	push {r3, r4}
	add r4, r0, #0
	mov r3, #0
	add r4, #0x20
_02234470:
	ldr r2, [r4]
	ldr r1, [r0, #4]
	add r3, r3, #1
	eor r2, r1
	str r2, [r4]
	ldr r1, [r0]
	eor r1, r2
	stmia r4!, {r1}
	cmp r3, #0xc
	blo _02234470
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_02234468

	thumb_func_start ov74_02234488
ov74_02234488: ; 0x02234488
	push {r3, r4}
	add r4, r0, #0
	mov r3, #0
	add r4, #0x20
_02234490:
	ldr r2, [r4]
	ldr r1, [r0]
	add r3, r3, #1
	eor r2, r1
	str r2, [r4]
	ldr r1, [r0, #4]
	eor r1, r2
	stmia r4!, {r1}
	cmp r3, #0xc
	blo _02234490
	pop {r3, r4}
	bx lr
	thumb_func_end ov74_02234488

	thumb_func_start ov74_022344A8
ov74_022344A8: ; 0x022344A8
	push {r3, r4, r5, r6, r7, lr}
	add r1, r0, #0
	mov r4, #0
	ldr r1, [r1]
	str r0, [sp]
	add r2, r4, #0
	bl ov74_02233F8C
	add r5, r0, #0
	ldr r0, [sp]
	mov r2, #1
	add r1, r0, #0
	ldr r1, [r1]
	bl ov74_02233F8C
	add r6, r0, #0
	ldr r0, [sp]
	mov r2, #2
	add r1, r0, #0
	ldr r1, [r1]
	bl ov74_02233F8C
	add r7, r0, #0
	ldr r0, [sp]
	mov r2, #3
	add r1, r0, #0
	ldr r1, [r1]
	bl ov74_02233F8C
	add r1, r4, #0
_022344E4:
	ldrh r2, [r5]
	add r1, r1, #1
	add r5, r5, #2
	add r2, r4, r2
	lsl r2, r2, #0x10
	lsr r4, r2, #0x10
	cmp r1, #6
	blt _022344E4
	mov r2, #0
_022344F6:
	ldrh r1, [r6]
	add r2, r2, #1
	add r6, r6, #2
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r2, #6
	blt _022344F6
	mov r2, #0
_02234508:
	ldrh r1, [r7]
	add r2, r2, #1
	add r7, r7, #2
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r2, #6
	blt _02234508
	mov r2, #0
_0223451A:
	ldrh r1, [r0]
	add r2, r2, #1
	add r0, r0, #2
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r2, #6
	blt _0223451A
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov74_022344A8

	thumb_func_start AGB_GetBoxMonData
AGB_GetBoxMonData: ; 0x02234530
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r6, r0, #0
	str r1, [sp]
	add r7, r2, #0
	add r5, r4, #0
	str r4, [sp, #0xc]
	str r4, [sp, #8]
	str r4, [sp, #4]
	cmp r1, #0xa
	ble _022345A6
	ldr r1, [r6]
	add r2, r4, #0
	bl ov74_02233F8C
	str r0, [sp, #0xc]
	ldr r1, [r6]
	add r0, r6, #0
	mov r2, #1
	bl ov74_02233F8C
	str r0, [sp, #8]
	ldr r1, [r6]
	add r0, r6, #0
	mov r2, #2
	bl ov74_02233F8C
	str r0, [sp, #4]
	ldr r1, [r6]
	add r0, r6, #0
	mov r2, #3
	bl ov74_02233F8C
	add r5, r0, #0
	add r0, r6, #0
	bl ov74_02234468
	add r0, r6, #0
	bl ov74_022344A8
	ldrh r1, [r6, #0x1c]
	cmp r0, r1
	beq _022345A6
	ldrb r0, [r6, #0x13]
	mov r1, #1
	bic r0, r1
	mov r1, #1
	orr r0, r1
	strb r0, [r6, #0x13]
	ldrb r1, [r6, #0x13]
	mov r0, #4
	orr r0, r1
	strb r0, [r6, #0x13]
	mov r0, #1
	ldr r1, [r5, #4]
	lsl r0, r0, #0x1e
	orr r0, r1
	str r0, [r5, #4]
_022345A6:
	ldr r0, [sp]
	cmp r0, #0x50
	bls _022345AE
	b _0223489C
_022345AE:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022345BA: ; jump table
	.short _0223465C - _022345BA - 2 ; case 0
	.short _02234660 - _022345BA - 2 ; case 1
	.short _02234664 - _022345BA - 2 ; case 2
	.short _02234684 - _022345BA - 2 ; case 3
	.short _02234688 - _022345BA - 2 ; case 4
	.short _02234690 - _022345BA - 2 ; case 5
	.short _02234698 - _022345BA - 2 ; case 6
	.short _022346A0 - _022345BA - 2 ; case 7
	.short _022346B4 - _022345BA - 2 ; case 8
	.short _022346B8 - _022345BA - 2 ; case 9
	.short _022346BC - _022345BA - 2 ; case 10
	.short _022346C0 - _022345BA - 2 ; case 11
	.short _022346D4 - _022345BA - 2 ; case 12
	.short _022346EC - _022345BA - 2 ; case 13
	.short _022346EC - _022345BA - 2 ; case 14
	.short _022346EC - _022345BA - 2 ; case 15
	.short _022346EC - _022345BA - 2 ; case 16
	.short _022346F8 - _022345BA - 2 ; case 17
	.short _022346F8 - _022345BA - 2 ; case 18
	.short _022346F8 - _022345BA - 2 ; case 19
	.short _022346F8 - _022345BA - 2 ; case 20
	.short _022346E0 - _022345BA - 2 ; case 21
	.short _02234728 - _022345BA - 2 ; case 22
	.short _0223472E - _022345BA - 2 ; case 23
	.short _02234734 - _022345BA - 2 ; case 24
	.short _022346DA - _022345BA - 2 ; case 25
	.short _02234704 - _022345BA - 2 ; case 26
	.short _0223470A - _022345BA - 2 ; case 27
	.short _02234710 - _022345BA - 2 ; case 28
	.short _02234716 - _022345BA - 2 ; case 29
	.short _0223471C - _022345BA - 2 ; case 30
	.short _02234722 - _022345BA - 2 ; case 31
	.short _022346E6 - _022345BA - 2 ; case 32
	.short _0223473A - _022345BA - 2 ; case 33
	.short _0223474C - _022345BA - 2 ; case 34
	.short _02234754 - _022345BA - 2 ; case 35
	.short _0223475C - _022345BA - 2 ; case 36
	.short _02234764 - _022345BA - 2 ; case 37
	.short _0223476C - _022345BA - 2 ; case 38
	.short _0223477A - _022345BA - 2 ; case 39
	.short _02234782 - _022345BA - 2 ; case 40
	.short _0223478A - _022345BA - 2 ; case 41
	.short _02234792 - _022345BA - 2 ; case 42
	.short _0223479A - _022345BA - 2 ; case 43
	.short _022347A2 - _022345BA - 2 ; case 44
	.short _022347AA - _022345BA - 2 ; case 45
	.short _022347B2 - _022345BA - 2 ; case 46
	.short _02234740 - _022345BA - 2 ; case 47
	.short _02234746 - _022345BA - 2 ; case 48
	.short _02234774 - _022345BA - 2 ; case 49
	.short _022347B8 - _022345BA - 2 ; case 50
	.short _022347C0 - _022345BA - 2 ; case 51
	.short _022347C8 - _022345BA - 2 ; case 52
	.short _022347D0 - _022345BA - 2 ; case 53
	.short _022347D8 - _022345BA - 2 ; case 54
	.short _0223489C - _022345BA - 2 ; case 55
	.short _0223489C - _022345BA - 2 ; case 56
	.short _0223489C - _022345BA - 2 ; case 57
	.short _0223489C - _022345BA - 2 ; case 58
	.short _0223489C - _022345BA - 2 ; case 59
	.short _0223489C - _022345BA - 2 ; case 60
	.short _0223489C - _022345BA - 2 ; case 61
	.short _0223489C - _022345BA - 2 ; case 62
	.short _0223489C - _022345BA - 2 ; case 63
	.short _0223489C - _022345BA - 2 ; case 64
	.short _0223484E - _022345BA - 2 ; case 65
	.short _0223486C - _022345BA - 2 ; case 66
	.short _022347E0 - _022345BA - 2 ; case 67
	.short _022347E8 - _022345BA - 2 ; case 68
	.short _022347F0 - _022345BA - 2 ; case 69
	.short _022347F8 - _022345BA - 2 ; case 70
	.short _02234800 - _022345BA - 2 ; case 71
	.short _02234808 - _022345BA - 2 ; case 72
	.short _02234810 - _022345BA - 2 ; case 73
	.short _02234818 - _022345BA - 2 ; case 74
	.short _02234820 - _022345BA - 2 ; case 75
	.short _02234828 - _022345BA - 2 ; case 76
	.short _02234830 - _022345BA - 2 ; case 77
	.short _02234838 - _022345BA - 2 ; case 78
	.short _02234840 - _022345BA - 2 ; case 79
	.short _02234848 - _022345BA - 2 ; case 80
_0223465C:
	ldr r4, [r6]
	b _0223489C
_02234660:
	ldr r4, [r6, #4]
	b _0223489C
_02234664:
	ldrb r0, [r6, #0x13]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02234670
	mov r4, #0
	b _0223467E
_02234670:
	mov r4, #0
_02234672:
	add r0, r6, r4
	ldrb r0, [r0, #8]
	strb r0, [r7, r4]
	add r4, r4, #1
	cmp r4, #0xa
	blo _02234672
_0223467E:
	mov r0, #0xff
	strb r0, [r7, r4]
	b _0223489C
_02234684:
	ldrb r4, [r6, #0x12]
	b _0223489C
_02234688:
	ldrb r0, [r6, #0x13]
	lsl r0, r0, #0x1f
	lsr r4, r0, #0x1f
	b _0223489C
_02234690:
	ldrb r0, [r6, #0x13]
	lsl r0, r0, #0x1e
	lsr r4, r0, #0x1f
	b _0223489C
_02234698:
	ldrb r0, [r6, #0x13]
	lsl r0, r0, #0x1d
	lsr r4, r0, #0x1f
	b _0223489C
_022346A0:
	mov r4, #0
_022346A2:
	add r0, r6, r4
	ldrb r0, [r0, #0x14]
	strb r0, [r7, r4]
	add r4, r4, #1
	cmp r4, #7
	blo _022346A2
	mov r0, #0xff
	strb r0, [r7, r4]
	b _0223489C
_022346B4:
	ldrb r4, [r6, #0x1b]
	b _0223489C
_022346B8:
	ldrh r4, [r6, #0x1c]
	b _0223489C
_022346BC:
	ldrh r4, [r6, #0x1e]
	b _0223489C
_022346C0:
	ldrb r0, [r6, #0x13]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _022346CE
	mov r4, #0x67
	lsl r4, r4, #2
	b _0223489C
_022346CE:
	ldr r0, [sp, #0xc]
	ldrh r4, [r0]
	b _0223489C
_022346D4:
	ldr r0, [sp, #0xc]
	ldrh r4, [r0, #2]
	b _0223489C
_022346DA:
	ldr r0, [sp, #0xc]
	ldr r4, [r0, #4]
	b _0223489C
_022346E0:
	ldr r0, [sp, #0xc]
	ldrb r4, [r0, #8]
	b _0223489C
_022346E6:
	ldr r0, [sp, #0xc]
	ldrb r4, [r0, #9]
	b _0223489C
_022346EC:
	ldr r0, [sp]
	sub r0, #0xd
	lsl r1, r0, #1
	ldr r0, [sp, #8]
	ldrh r4, [r0, r1]
	b _0223489C
_022346F8:
	ldr r1, [sp]
	ldr r0, [sp, #8]
	sub r1, #0x11
	add r0, r0, r1
	ldrb r4, [r0, #8]
	b _0223489C
_02234704:
	ldr r0, [sp, #4]
	ldrb r4, [r0]
	b _0223489C
_0223470A:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #1]
	b _0223489C
_02234710:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #2]
	b _0223489C
_02234716:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #3]
	b _0223489C
_0223471C:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #4]
	b _0223489C
_02234722:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #5]
	b _0223489C
_02234728:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #6]
	b _0223489C
_0223472E:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #7]
	b _0223489C
_02234734:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #8]
	b _0223489C
_0223473A:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #9]
	b _0223489C
_02234740:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #0xa]
	b _0223489C
_02234746:
	ldr r0, [sp, #4]
	ldrb r4, [r0, #0xb]
	b _0223489C
_0223474C:
	ldr r0, [r5]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	b _0223489C
_02234754:
	ldr r0, [r5]
	lsl r0, r0, #0x10
	lsr r4, r0, #0x18
	b _0223489C
_0223475C:
	ldr r0, [r5]
	lsl r0, r0, #9
	lsr r4, r0, #0x19
	b _0223489C
_02234764:
	ldr r0, [r5]
	lsl r0, r0, #5
	lsr r4, r0, #0x1c
	b _0223489C
_0223476C:
	ldr r0, [r5]
	lsl r0, r0, #1
	lsr r4, r0, #0x1c
	b _0223489C
_02234774:
	ldr r0, [r5]
	lsr r4, r0, #0x1f
	b _0223489C
_0223477A:
	ldr r0, [r5, #4]
	lsl r0, r0, #0x1b
	lsr r4, r0, #0x1b
	b _0223489C
_02234782:
	ldr r0, [r5, #4]
	lsl r0, r0, #0x16
	lsr r4, r0, #0x1b
	b _0223489C
_0223478A:
	ldr r0, [r5, #4]
	lsl r0, r0, #0x11
	lsr r4, r0, #0x1b
	b _0223489C
_02234792:
	ldr r0, [r5, #4]
	lsl r0, r0, #0xc
	lsr r4, r0, #0x1b
	b _0223489C
_0223479A:
	ldr r0, [r5, #4]
	lsl r0, r0, #7
	lsr r4, r0, #0x1b
	b _0223489C
_022347A2:
	ldr r0, [r5, #4]
	lsl r0, r0, #2
	lsr r4, r0, #0x1b
	b _0223489C
_022347AA:
	ldr r0, [r5, #4]
	lsl r0, r0, #1
	lsr r4, r0, #0x1f
	b _0223489C
_022347B2:
	ldr r0, [r5, #4]
	lsr r4, r0, #0x1f
	b _0223489C
_022347B8:
	ldr r0, [r5, #8]
	lsl r0, r0, #0x1d
	lsr r4, r0, #0x1d
	b _0223489C
_022347C0:
	ldr r0, [r5, #8]
	lsl r0, r0, #0x1a
	lsr r4, r0, #0x1d
	b _0223489C
_022347C8:
	ldr r0, [r5, #8]
	lsl r0, r0, #0x17
	lsr r4, r0, #0x1d
	b _0223489C
_022347D0:
	ldr r0, [r5, #8]
	lsl r0, r0, #0x14
	lsr r4, r0, #0x1d
	b _0223489C
_022347D8:
	ldr r0, [r5, #8]
	lsl r0, r0, #0x11
	lsr r4, r0, #0x1d
	b _0223489C
_022347E0:
	ldr r0, [r5, #8]
	lsl r0, r0, #0x10
	lsr r4, r0, #0x1f
	b _0223489C
_022347E8:
	ldr r0, [r5, #8]
	lsl r0, r0, #0xf
	lsr r4, r0, #0x1f
	b _0223489C
_022347F0:
	ldr r0, [r5, #8]
	lsl r0, r0, #0xe
	lsr r4, r0, #0x1f
	b _0223489C
_022347F8:
	ldr r0, [r5, #8]
	lsl r0, r0, #0xd
	lsr r4, r0, #0x1f
	b _0223489C
_02234800:
	ldr r0, [r5, #8]
	lsl r0, r0, #0xc
	lsr r4, r0, #0x1f
	b _0223489C
_02234808:
	ldr r0, [r5, #8]
	lsl r0, r0, #0xb
	lsr r4, r0, #0x1f
	b _0223489C
_02234810:
	ldr r0, [r5, #8]
	lsl r0, r0, #0xa
	lsr r4, r0, #0x1f
	b _0223489C
_02234818:
	ldr r0, [r5, #8]
	lsl r0, r0, #9
	lsr r4, r0, #0x1f
	b _0223489C
_02234820:
	ldr r0, [r5, #8]
	lsl r0, r0, #8
	lsr r4, r0, #0x1f
	b _0223489C
_02234828:
	ldr r0, [r5, #8]
	lsl r0, r0, #7
	lsr r4, r0, #0x1f
	b _0223489C
_02234830:
	ldr r0, [r5, #8]
	lsl r0, r0, #6
	lsr r4, r0, #0x1f
	b _0223489C
_02234838:
	ldr r0, [r5, #8]
	lsl r0, r0, #5
	lsr r4, r0, #0x1f
	b _0223489C
_02234840:
	ldr r0, [r5, #8]
	lsl r0, r0, #1
	lsr r4, r0, #0x1c
	b _0223489C
_02234848:
	ldr r0, [r5, #8]
	lsr r4, r0, #0x1f
	b _0223489C
_0223484E:
	ldr r0, [sp, #0xc]
	ldrh r4, [r0]
	cmp r4, #0
	beq _0223489C
	ldr r0, [r5, #4]
	lsl r0, r0, #1
	lsr r0, r0, #0x1f
	bne _02234866
	ldrb r0, [r6, #0x13]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0223489C
_02234866:
	mov r4, #0x67
	lsl r4, r4, #2
	b _0223489C
_0223486C:
	ldr r4, [r5, #4]
	lsl r0, r4, #2
	lsr r0, r0, #0x1b
	lsl r5, r0, #0x19
	lsl r0, r4, #7
	lsr r0, r0, #0x1b
	lsl r3, r0, #0x14
	lsl r0, r4, #0xc
	lsr r0, r0, #0x1b
	lsl r2, r0, #0xf
	lsl r0, r4, #0x11
	lsr r0, r0, #0x1b
	lsl r1, r0, #0xa
	lsl r0, r4, #0x1b
	lsl r4, r4, #0x16
	lsr r4, r4, #0x1b
	lsr r0, r0, #0x1b
	lsl r4, r4, #5
	orr r0, r4
	orr r0, r1
	orr r0, r2
	orr r0, r3
	add r4, r5, #0
	orr r4, r0
_0223489C:
	ldr r0, [sp]
	cmp r0, #0xa
	ble _022348A8
	add r0, r6, #0
	bl ov74_02234488
_022348A8:
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end AGB_GetBoxMonData

	thumb_func_start ov74_022348B0
ov74_022348B0: ; 0x022348B0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r4, r0, #0
	add r5, r2, #0
	mov r7, #0
	cmp r6, #0xa
	ble _02234924
	ldr r1, [r4]
	add r2, r7, #0
	bl ov74_02233F8C
	add r7, r0, #0
	ldr r1, [r4]
	add r0, r4, #0
	mov r2, #1
	bl ov74_02233F8C
	ldr r1, [r4]
	add r0, r4, #0
	mov r2, #2
	bl ov74_02233F8C
	ldr r1, [r4]
	add r0, r4, #0
	mov r2, #3
	bl ov74_02233F8C
	str r0, [sp]
	add r0, r4, #0
	bl ov74_02234468
	add r0, r4, #0
	bl ov74_022344A8
	ldrh r1, [r4, #0x1c]
	cmp r0, r1
	beq _02234924
	ldrb r1, [r4, #0x13]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #0x13]
	ldrb r1, [r4, #0x13]
	mov r0, #4
	orr r0, r1
	strb r0, [r4, #0x13]
	ldr r0, [sp]
	ldr r1, [r0, #4]
	mov r0, #1
	lsl r0, r0, #0x1e
	orr r1, r0
	ldr r0, [sp]
	str r1, [r0, #4]
	add r0, r4, #0
	bl ov74_02234488
	pop {r3, r4, r5, r6, r7, pc}
_02234924:
	cmp r6, #0xb
	bhi _022349C8
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234934: ; jump table
	.short _022349C8 - _02234934 - 2 ; case 0
	.short _022349C8 - _02234934 - 2 ; case 1
	.short _0223494C - _02234934 - 2 ; case 2
	.short _0223495C - _02234934 - 2 ; case 3
	.short _02234962 - _02234934 - 2 ; case 4
	.short _02234974 - _02234934 - 2 ; case 5
	.short _02234986 - _02234934 - 2 ; case 6
	.short _02234998 - _02234934 - 2 ; case 7
	.short _022349C8 - _02234934 - 2 ; case 8
	.short _022349C8 - _02234934 - 2 ; case 9
	.short _022349C8 - _02234934 - 2 ; case 10
	.short _022349A8 - _02234934 - 2 ; case 11
_0223494C:
	mov r2, #0
_0223494E:
	ldrb r1, [r5, r2]
	add r0, r4, r2
	add r2, r2, #1
	strb r1, [r0, #8]
	cmp r2, #0xa
	blt _0223494E
	b _022349C8
_0223495C:
	ldrb r0, [r5]
	strb r0, [r4, #0x12]
	b _022349C8
_02234962:
	ldrb r0, [r4, #0x13]
	ldrb r2, [r5]
	mov r1, #1
	bic r0, r1
	mov r1, #1
	and r1, r2
	orr r0, r1
	strb r0, [r4, #0x13]
	b _022349C8
_02234974:
	ldrb r0, [r4, #0x13]
	mov r1, #2
	bic r0, r1
	ldrb r1, [r5]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1e
	orr r0, r1
	strb r0, [r4, #0x13]
	b _022349C8
_02234986:
	ldrb r0, [r4, #0x13]
	mov r1, #4
	bic r0, r1
	ldrb r1, [r5]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1d
	orr r0, r1
	strb r0, [r4, #0x13]
	b _022349C8
_02234998:
	mov r2, #0
_0223499A:
	ldrb r1, [r5, r2]
	add r0, r4, r2
	add r2, r2, #1
	strb r1, [r0, #0x14]
	cmp r2, #7
	blt _0223499A
	b _022349C8
_022349A8:
	ldrb r0, [r5, #1]
	ldrb r1, [r5]
	lsl r0, r0, #8
	add r0, r1, r0
	strh r0, [r7]
	ldrh r0, [r7]
	ldrb r1, [r4, #0x13]
	cmp r0, #0
	beq _022349C2
	mov r0, #2
	orr r0, r1
	strb r0, [r4, #0x13]
	b _022349C8
_022349C2:
	mov r0, #2
	bic r1, r0
	strb r1, [r4, #0x13]
_022349C8:
	cmp r6, #0xa
	ble _022349DA
	add r0, r4, #0
	bl ov74_022344A8
	strh r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov74_02234488
_022349DA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov74_022348B0

	thumb_func_start TranslateAgbSpecies
TranslateAgbSpecies: ; 0x022349DC
	ldr r1, _02234A00 ; =0x00000115
	cmp r0, r1
	blt _022349FC
	ldr r3, _02234A04 ; =ov74_0223CC5C
	mov r2, #0
_022349E6:
	ldrh r1, [r3]
	cmp r0, r1
	bne _022349F4
	ldr r0, _02234A08 ; =ov74_0223CC5E
	lsl r1, r2, #2
	ldrh r0, [r0, r1]
	bx lr
_022349F4:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x90
	blo _022349E6
_022349FC:
	bx lr
	nop
_02234A00: .word 0x00000115
_02234A04: .word ov74_0223CC5C
_02234A08: .word ov74_0223CC5E
	thumb_func_end TranslateAgbSpecies

	thumb_func_start ov74_02234A0C
ov74_02234A0C: ; 0x02234A0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0xb
	mov r2, #0
	bl AGB_GetBoxMonData
	bl TranslateAgbSpecies
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x19
	mov r2, #0
	bl AGB_GetBoxMonData
	add r1, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl CalcLevelBySpeciesAndExp
	pop {r3, r4, r5, pc}
	thumb_func_end ov74_02234A0C

	thumb_func_start AGB_GetBoxMonAbility
AGB_GetBoxMonAbility: ; 0x02234A34
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	mov r1, #0x2e
	mov r2, #0
	bl AGB_GetBoxMonData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x19
	bl GetMonBaseStat
	cmp r0, #0
	beq _02234A8E
	ldr r2, _02234A98 ; =ov74_0223CBA0
	mov r4, #0
_02234A62:
	ldrh r1, [r2]
	cmp r5, r1
	bne _02234A72
	add r0, r5, #0
	mov r1, #0x18
	bl GetMonBaseStat
	b _02234A7A
_02234A72:
	add r4, r4, #1
	add r2, r2, #2
	cmp r4, #0x5e
	blo _02234A62
_02234A7A:
	cmp r4, #0x5e
	bne _02234A96
	mov r1, #1
	tst r1, r6
	bne _02234A96
	add r0, r5, #0
	mov r1, #0x18
	bl GetMonBaseStat
	pop {r4, r5, r6, pc}
_02234A8E:
	add r0, r5, #0
	mov r1, #0x18
	bl GetMonBaseStat
_02234A96:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02234A98: .word ov74_0223CBA0
	thumb_func_end AGB_GetBoxMonAbility

	thumb_func_start MigrateBoxMon
MigrateBoxMon: ; 0x02234A9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r6, r0, #0
	add r0, r4, #0
	bl ZeroBoxMonData
	add r0, r4, #0
	bl AcquireBoxMonLock
	mov r1, #0
	str r0, [sp]
	add r0, r6, #0
	add r2, r1, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0xb
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	bl TranslateAgbSpecies
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #5
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0xc
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	cmp r0, #0
	beq _02234AFE
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl UpConvertItemId_Gen3to4
	str r0, [sp, #8]
_02234AFE:
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #1
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #7
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x19
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #8
	bl SetBoxMonData
	mov r0, #0x46
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #9
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	add r1, r4, #0
	bl AGB_GetBoxMonAbility
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xa
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #8
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xb
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #3
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xc
	add r2, sp, #4
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x1a
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xd
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x1b
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xe
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x1c
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xf
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x1d
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x10
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x1e
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x11
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x1f
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x12
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x16
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x13
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x17
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x14
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x18
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x15
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x21
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x16
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x2f
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x17
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x30
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x18
	add r2, sp, #8
	bl SetBoxMonData
	mov r5, #0
	add r7, r5, #0
_02234C8E:
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0xd
	mov r2, #0
	bl AGB_GetBoxMonData
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, #0x36
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x15
	mov r2, #0
	bl AGB_GetBoxMonData
	mov r1, #3
	lsl r1, r7
	str r0, [sp, #8]
	and r0, r1
	lsr r0, r7
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, #0x3e
	add r2, sp, #8
	bl SetBoxMonData
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x42
	mov r2, #0
	bl GetBoxMonData
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, #0x3a
	add r2, sp, #8
	bl SetBoxMonData
	add r5, r5, #1
	add r7, r7, #2
	cmp r5, #4
	blt _02234C8E
	add r0, r6, #0
	mov r1, #0x27
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x46
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x28
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x47
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x29
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x48
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x2a
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x49
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x2b
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x4a
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x2c
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x4b
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x2d
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x4c
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x32
	mov r2, #0
	bl AGB_GetBoxMonData
	add r7, r0, #0
	cmp r7, #4
	bgt _02234DB2
	mov r5, #0
	cmp r7, #0
	ble _02234DB2
_02234D9C:
	mov r0, #1
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, #0x4e
	add r2, sp, #8
	bl SetBoxMonData
	add r5, r5, #1
	cmp r5, r7
	blt _02234D9C
_02234DB2:
	add r0, r6, #0
	mov r1, #0x33
	mov r2, #0
	bl AGB_GetBoxMonData
	add r7, r0, #0
	cmp r7, #4
	bgt _02234DDE
	mov r5, #0
	cmp r7, #0
	ble _02234DDE
_02234DC8:
	mov r0, #1
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, #0x52
	add r2, sp, #8
	bl SetBoxMonData
	add r5, r5, #1
	cmp r5, r7
	blt _02234DC8
_02234DDE:
	add r0, r6, #0
	mov r1, #0x34
	mov r2, #0
	bl AGB_GetBoxMonData
	add r7, r0, #0
	cmp r7, #4
	bgt _02234E0A
	mov r5, #0
	cmp r7, #0
	ble _02234E0A
_02234DF4:
	mov r0, #1
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, #0x56
	add r2, sp, #8
	bl SetBoxMonData
	add r5, r5, #1
	cmp r5, r7
	blt _02234DF4
_02234E0A:
	add r0, r6, #0
	mov r1, #0x35
	mov r2, #0
	bl AGB_GetBoxMonData
	add r7, r0, #0
	cmp r7, #4
	bgt _02234E36
	mov r5, #0
	cmp r7, #0
	ble _02234E36
_02234E20:
	mov r0, #1
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, #0x5a
	add r2, sp, #8
	bl SetBoxMonData
	add r5, r5, #1
	cmp r5, r7
	blt _02234E20
_02234E36:
	add r0, r6, #0
	mov r1, #0x36
	mov r2, #0
	bl AGB_GetBoxMonData
	add r7, r0, #0
	cmp r7, #4
	bgt _02234E62
	mov r5, #0
	cmp r7, #0
	ble _02234E62
_02234E4C:
	mov r0, #1
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, #0x5e
	add r2, sp, #8
	bl SetBoxMonData
	add r5, r5, #1
	cmp r5, r7
	blt _02234E4C
_02234E62:
	add r0, r6, #0
	mov r1, #0x43
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x62
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x44
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x63
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x45
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x64
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x46
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x65
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x47
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x66
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x48
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x67
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x49
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x68
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x4a
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x69
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x4b
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x6a
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x6b
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x4d
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x6c
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x4e
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x6d
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x50
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x6e
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r4, #0
	bl GetBoxMonGender
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x6f
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0xc9
	bne _02234FDE
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl AGB_GetBoxMonData
	add r3, r0, #0
	mov r7, #3
	lsl r0, r7, #8
	and r0, r3
	lsr r1, r0, #6
	lsl r0, r7, #0x18
	and r0, r3
	lsr r5, r0, #0x12
	lsl r0, r7, #0x10
	and r0, r3
	lsr r0, r0, #0xc
	add r2, r3, #0
	orr r0, r5
	orr r0, r1
	and r2, r7
	str r3, [sp, #8]
	orr r0, r2
	mov r1, #0x1c
	bl _u32_div_f
	str r1, [sp, #8]
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #8
	bl SetBoxMonData
_02234FDE:
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	ldr r1, _02235120 ; =0x00000182
	cmp r0, r1
	bne _0223502E
	ldr r0, _02235124 ; =gSystem + 0x60
	ldrb r0, [r0, #0xa]
	cmp r0, #5
	bhi _0223500E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02235002: ; jump table
	.short _0223500E - _02235002 - 2 ; case 0
	.short _0223500E - _02235002 - 2 ; case 1
	.short _0223500E - _02235002 - 2 ; case 2
	.short _02235020 - _02235002 - 2 ; case 3
	.short _02235014 - _02235002 - 2 ; case 4
	.short _0223501A - _02235002 - 2 ; case 5
_0223500E:
	mov r0, #0
	str r0, [sp, #8]
	b _02235024
_02235014:
	mov r0, #1
	str r0, [sp, #8]
	b _02235024
_0223501A:
	mov r0, #2
	str r0, [sp, #8]
	b _02235024
_02235020:
	mov r0, #3
	str r0, [sp, #8]
_02235024:
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #8
	bl SetBoxMonData
_0223502E:
	add r0, r6, #0
	mov r1, #2
	add r2, sp, #0x24
	bl AGB_GetBoxMonData
	ldr r3, [sp, #4]
	add r0, sp, #0x24
	add r1, sp, #0xc
	mov r2, #0xc
	bl ConvertRSStringToDPStringInternational
	add r0, r4, #0
	mov r1, #0x76
	add r2, sp, #0xc
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #3
	mov r2, #0
	bl AGB_GetBoxMonData
	ldr r1, _02235128 ; =gGameLanguage
	ldrb r1, [r1]
	cmp r1, r0
	beq _0223506E
	mov r0, #1
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x4d
	add r2, sp, #8
	bl SetBoxMonData
_0223506E:
	add r0, r6, #0
	mov r1, #0x25
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x7a
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #7
	add r2, sp, #0x24
	bl AGB_GetBoxMonData
	ldr r3, [sp, #4]
	add r0, sp, #0x24
	add r1, sp, #0xc
	mov r2, #8
	bl ConvertRSStringToDPStringInternational
	add r0, r4, #0
	mov r1, #0x90
	add r2, sp, #0xc
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x23
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x99
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x22
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x9a
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x26
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x9b
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x24
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x9c
	add r2, sp, #8
	bl SetBoxMonData
	add r0, r6, #0
	mov r1, #0x31
	mov r2, #0
	bl AGB_GetBoxMonData
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x9d
	add r2, sp, #8
	bl SetBoxMonData
	ldr r1, [sp]
	add r0, r4, #0
	bl ReleaseBoxMonLock
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235120: .word 0x00000182
_02235124: .word gSystem + 0x60
_02235128: .word gGameLanguage
	thumb_func_end MigrateBoxMon

	thumb_func_start ov74_0223512C
ov74_0223512C: ; 0x0223512C
	ldr r1, _02235134 ; =ov74_0223D450
	str r0, [r1]
	bx lr
	nop
_02235134: .word ov74_0223D450
	thumb_func_end ov74_0223512C

	thumb_func_start ov74_02235138
ov74_02235138: ; 0x02235138
	add r1, r0, #0
	ldr r0, _02235144 ; =ov74_0223D450
	ldr r3, _02235148 ; =AllocFromHeap
	ldr r0, [r0]
	bx r3
	nop
_02235144: .word ov74_0223D450
_02235148: .word AllocFromHeap
	thumb_func_end ov74_02235138

	thumb_func_start ov74_0223514C
ov74_0223514C: ; 0x0223514C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x130
	bl CTRDG_GetAgbGameCode
	lsr r1, r0, #0x18
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	lsr r1, r0, #0x10
	lsl r3, r0, #0x18
	lsr r0, r0, #8
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #8
	lsr r1, r1, #0x10
	orr r0, r3
	orr r0, r1
	add r6, r2, #0
	orr r6, r0
	ldr r0, _022351E0 ; =ov74_0223CE9C
	mov r4, #0
	ldr r0, [r0]
	cmp r0, #0
	bls _022351D6
	ldr r5, _022351E4 ; =ov74_0223CE9C
	add r7, sp, #0x80
_02235182:
	ldr r0, [r5]
	cmp r6, r0
	bne _022351CC
	mov r0, #1
	bl CTRDG_Enable
	mov r0, #0x81
	ldr r2, _022351E8 ; =0x000004A8
	lsl r0, r0, #0x14
	add r1, r7, #0
	bl CTRDG_CpuCopy8
	ldr r0, _022351EC ; =0x08020000
	add r1, sp, #0
	mov r2, #0x80
	bl CTRDG_CpuCopy8
	mov r0, #0
	bl CTRDG_Enable
	ldr r0, _022351F0 ; =ov74_02235138
	ldr r1, _022351F4 ; =FreeToHeap
	bl CRYPTO_SetAllocator
	ldr r1, _022351E8 ; =0x000004A8
	ldr r3, _022351F8 ; =_0223B690
	add r0, r7, #0
	add r2, sp, #0
	bl CRYPTO_VerifySignature
	cmp r0, #0
	beq _022351CC
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x130
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022351CC:
	add r5, r5, #4
	ldr r0, [r5]
	add r4, r4, #1
	cmp r4, r0
	blo _02235182
_022351D6:
	mov r0, #0
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x130
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022351E0: .word ov74_0223CE9C
_022351E4: .word ov74_0223CE9C
_022351E8: .word 0x000004A8
_022351EC: .word 0x08020000
_022351F0: .word ov74_02235138
_022351F4: .word FreeToHeap
_022351F8: .word _0223B690
	thumb_func_end ov74_0223514C

	thumb_func_start ov74_022351FC
ov74_022351FC: ; 0x022351FC
	push {r3, lr}
	bl CTRDG_Init
	bl CTRDG_IsAgbCartridge
	cmp r0, #0
	bne _0223520E
	mov r0, #0
	pop {r3, pc}
_0223520E:
	bl CTRDG_GetAgbMakerCode
	ldr r1, _0223522C ; =0x00003130
	cmp r0, r1
	beq _0223521C
	mov r0, #0
	pop {r3, pc}
_0223521C:
	bl ov74_0223514C
	cmp r0, #0
	beq _02235228
	mov r0, #1
	pop {r3, pc}
_02235228:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0223522C: .word 0x00003130
	thumb_func_end ov74_022351FC

	thumb_func_start ov74_02235230
ov74_02235230: ; 0x02235230
	push {r3, lr}
	bl ov74_022351FC
	cmp r0, #0
	bne _0223523E
	mov r0, #0
	pop {r3, pc}
_0223523E:
	mov r0, #1
	bl CTRDG_Enable
	mov r0, #0x81
	lsl r0, r0, #0x14
	add r1, sp, #0
	bl CTRDG_Read32
	mov r0, #0
	bl CTRDG_Enable
	ldr r0, [sp]
	pop {r3, pc}
	thumb_func_end ov74_02235230

	thumb_func_start ov74_02235258
ov74_02235258: ; 0x02235258
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov74_022351FC
	cmp r0, #0
	bne _0223526A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223526A:
	cmp r4, #0
	bne _02235274
	bl ov74_02235230
	add r4, r0, #0
_02235274:
	mov r0, #1
	bl CTRDG_Enable
	ldr r0, _0223529C ; =0x08100100
	add r1, r5, #0
	add r2, r4, #0
	bl CTRDG_CpuCopy16
	add r4, r0, #0
	mov r0, #0
	bl CTRDG_Enable
	bl CTRDG_IsExisting
	cmp r0, #0
	bne _02235298
	mov r0, #0
	pop {r3, r4, r5, pc}
_02235298:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223529C: .word 0x08100100
	thumb_func_end ov74_02235258

	thumb_func_start ov74_022352A0
ov74_022352A0: ; 0x022352A0
	push {r3, r4, r5, r6}
	add r4, r0, #0
	mov r0, #0
	ldr r6, _022352C8 ; =ov74_0223D454
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	mov r5, #0x75
_022352B0:
	stmia r6!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	sub r5, r5, #1
	bne _022352B0
	stmia r6!, {r0, r1}
	ldr r0, _022352CC ; =ov74_0223D454
	mov r1, #1
	str r1, [r0, #4]
	str r4, [r0, #8]
	pop {r3, r4, r5, r6}
	bx lr
	nop
_022352C8: .word ov74_0223D454
_022352CC: .word ov74_0223D454
	thumb_func_end ov74_022352A0

	thumb_func_start ov74_022352D0
ov74_022352D0: ; 0x022352D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r1, #0
	mov r0, #3
	add r2, r3, #0
	bl CreateHeap
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	add r2, r4, #0
	add r5, r0, #0
	bl memset
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov74_022352D0

	thumb_func_start ov74_02235308
ov74_02235308: ; 0x02235308
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r5, _0223538C ; =_0223B720
	add r6, r3, #0
	add r7, r0, #0
	add r4, r1, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	cmp r2, #4
	str r0, [r3]
	add r0, sp, #0
	strb r2, [r0, #0x10]
	bhi _02235362
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223533A: ; jump table
	.short _02235362 - _0223533A - 2 ; case 0
	.short _02235344 - _0223533A - 2 ; case 1
	.short _0223534C - _0223533A - 2 ; case 2
	.short _02235354 - _0223533A - 2 ; case 3
	.short _0223535C - _0223533A - 2 ; case 4
_02235344:
	mov r0, #2
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	b _02235362
_0223534C:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	b _02235362
_02235354:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	b _02235362
_0223535C:
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #8]
_02235362:
	lsr r1, r6, #0xb
	add r0, sp, #0
	strb r1, [r0, #0x12]
	ldr r1, [sp, #0x30]
	add r2, sp, #0
	lsr r1, r1, #0xe
	strb r1, [r0, #0x13]
	lsl r1, r4, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	mov r3, #0
	bl InitBgFromTemplate
	lsl r1, r4, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223538C: .word _0223B720
	thumb_func_end ov74_02235308

	thumb_func_start ov74_02235390
ov74_02235390: ; 0x02235390
	ldr r1, _02235398 ; =ov74_0223D454
	str r0, [r1, #0x10]
	bx lr
	nop
_02235398: .word ov74_0223D454
	thumb_func_end ov74_02235390

	thumb_func_start ov74_0223539C
ov74_0223539C: ; 0x0223539C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp, #0xc]
	ldr r0, _022353F0 ; =ov74_0223D454
	add r5, r1, #0
	ldr r0, [r0, #0x10]
	add r4, r2, #0
	add r6, r3, #0
	ldr r7, _022353F4 ; =ov74_0223D454
	cmp r0, #0
	bne _022353CC
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r7, #8]
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _022353E4
_022353CC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r7, #8]
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	ldr r3, _022353F8 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
_022353E4:
	cmp r4, #0
	beq _022353EA
	str r6, [r4]
_022353EA:
	str r5, [r7, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022353F0: .word ov74_0223D454
_022353F4: .word ov74_0223D454
_022353F8: .word 0x00007FFF
	thumb_func_end ov74_0223539C

	thumb_func_start ov74_022353FC
ov74_022353FC: ; 0x022353FC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r5, _02235410 ; =ov74_0223D454
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223540E
	ldr r0, [r5, #0xc]
	str r0, [r4]
_0223540E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02235410: .word ov74_0223D454
	thumb_func_end ov74_022353FC

	thumb_func_start ov74_02235414
ov74_02235414: ; 0x02235414
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #0
	mov r2, #0x54
	add r5, r0, #0
	add r7, r3, #0
	bl memset
	mov r0, #1
	str r0, [r5, #4]
	str r0, [r5, #8]
	sub r0, r0, #2
	str r0, [r5, #0x4c]
	str r4, [r5, #0x10]
	str r6, [r5, #0x30]
	ldr r0, [sp, #0x18]
	str r7, [r5, #0x34]
	str r0, [r5, #0x38]
	ldr r0, [sp, #0x1c]
	mov r2, #0
	str r0, [r5, #0x3c]
	str r2, [r5, #0x2c]
	ldr r0, _02235460 ; =0x0001020F
	str r2, [r5, #0x40]
	str r0, [r5, #0x44]
	add r0, r5, #0
	mov r1, #0xf
	add r0, #0x48
	strb r1, [r0]
	str r2, [r5]
	str r2, [r5, #0x24]
	str r2, [r5, #0x20]
	str r2, [r5, #0x14]
	mov r0, #0xff
	str r0, [r5, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235460: .word 0x0001020F
	thumb_func_end ov74_02235414

	thumb_func_start ov74_02235464
ov74_02235464: ; 0x02235464
	str r1, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r3, [r0, #0x28]
	bx lr
	thumb_func_end ov74_02235464

	thumb_func_start ov74_0223546C
ov74_0223546C: ; 0x0223546C
	str r1, [r0]
	str r2, [r0, #0x40]
	bx lr
	.balign 4, 0
	thumb_func_end ov74_0223546C

	thumb_func_start ov74_02235474
ov74_02235474: ; 0x02235474
	str r1, [r0, #0x20]
	str r2, [r0, #0x24]
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02235474

	thumb_func_start ov74_0223547C
ov74_0223547C: ; 0x0223547C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	ldr r4, _02235564 ; =ov74_0223D454
	cmp r1, r0
	beq _0223555A
	ldr r0, [r5, #0x4c]
	cmp r0, r1
	beq _0223555A
	str r1, [r5, #0x4c]
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _022354A6
	add r1, r5, #0
	add r1, #0x48
	ldrb r1, [r1]
	ldr r0, [r5, #0x10]
	bl FillWindowPixelBuffer
_022354A6:
	mov r0, #0
	ldr r1, [r5, #0x4c]
	mvn r0, r0
	cmp r1, r0
	beq _0223555A
	ldr r2, [r5, #0x34]
	ldr r3, [r4, #8]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	ldr r6, [r5, #0x14]
	str r0, [sp, #0x10]
	cmp r6, #0
	bne _022354CC
	ldr r0, [r4, #8]
	bl ScrStrBufs_new
	add r6, r0, #0
_022354CC:
	ldr r1, [sp, #0x10]
	ldr r2, [r5, #0x4c]
	ldr r3, [r4, #8]
	add r0, r6, #0
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _02235500
	ldr r0, [r5, #0x24]
	add r2, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x50]
	str r0, [sp, #4]
	ldr r0, [r5, #0x44]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x40]
	ldr r3, [r5, #0x20]
	bl AddTextPrinterParameterized2
	add r7, r0, #0
	b _02235542
_02235500:
	ldr r0, [r5, #0x40]
	mov r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl GetFontAttribute
	add r2, r0, #0
	ldr r0, [r5, #0x40]
	add r1, r4, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	ldr r0, [r5, #0x10]
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r3, r0, r7
	ldr r0, [r5, #0x24]
	add r2, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0x50]
	str r0, [sp, #4]
	ldr r0, [r5, #0x44]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x40]
	bl AddTextPrinterParameterized2
	add r7, r0, #0
	mov r0, #0
	str r0, [r5, #0xc]
_02235542:
	add r0, r4, #0
	bl String_dtor
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _02235554
	add r0, r6, #0
	bl ScrStrBufs_delete
_02235554:
	ldr r0, [sp, #0x10]
	bl DestroyMsgData
_0223555A:
	mov r0, #0xff
	str r0, [r5, #0x50]
	add r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02235564: .word ov74_0223D454
	thumb_func_end ov74_0223547C

	thumb_func_start ov74_02235568
ov74_02235568: ; 0x02235568
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r4, r1, #0
	ldr r1, [r4, #0x10]
	add r6, r2, #0
	ldr r2, [r1]
	add r5, r3, #0
	cmp r2, #0
	bne _022355BA
	lsl r2, r5, #0x18
	lsr r2, r2, #0x18
	str r2, [sp]
	ldr r2, [r4, #0x18]
	lsl r3, r6, #0x18
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #4]
	ldr r2, [r4, #0x1c]
	lsr r3, r3, #0x18
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #8]
	ldr r2, [r4, #0x30]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #0xc]
	ldr r2, [r4, #0x28]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	str r2, [sp, #0x10]
	ldr r2, [r4, #0x2c]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl AddWindowParameterized
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	bl ov74_0223547C
	add r5, r0, #0
	b _022355E8
_022355BA:
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _022355CC
	add r0, r1, #0
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	bl SetWindowX
_022355CC:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _022355DE
	lsl r1, r5, #0x18
	ldr r0, [r4, #0x10]
	lsr r1, r1, #0x18
	bl SetWindowY
_022355DE:
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	bl ov74_0223547C
	add r5, r0, #0
_022355E8:
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _0223562E
	ldr r0, [r4]
	cmp r0, #0
	beq _022355FC
	cmp r0, #1
	beq _02235612
	cmp r0, #2
	b _02235628
_022355FC:
	ldr r2, [r4, #0x38]
	ldr r3, [r4, #0x3c]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r4, #0x10]
	mov r1, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl DrawFrameAndWindow1
	b _0223562E
_02235612:
	ldr r2, [r4, #0x38]
	ldr r3, [r4, #0x3c]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r4, #0x10]
	mov r1, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl DrawFrameAndWindow2
	b _0223562E
_02235628:
	ldr r0, [r4, #0x10]
	bl CopyWindowToVram
_0223562E:
	add r0, r5, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov74_02235568

	thumb_func_start ov74_02235634
ov74_02235634: ; 0x02235634
	ldr r1, [r0, #0x18]
	ldr r0, [r0, #0x1c]
	mul r0, r1
	bx lr
	thumb_func_end ov74_02235634

	thumb_func_start ov74_0223563C
ov74_0223563C: ; 0x0223563C
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _02235674 ; =_0223B710
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, _02235678 ; =ov74_0223D454
	mov r1, #0x10
	ldr r0, [r0, #8]
	str r0, [sp, #0xc]
	add r0, r2, #0
	add r2, r1, #0
	bl sub_020215C0
	ldr r1, _02235678 ; =ov74_0223D454
	mov r0, #0x1e
	ldr r1, [r1, #8]
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_02235674: .word _0223B710
_02235678: .word ov74_0223D454
	thumb_func_end ov74_0223563C

	thumb_func_start ov74_0223567C
ov74_0223567C: ; 0x0223567C
	ldr r0, _0223568C ; =ov74_0223D454
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _02235688
	mov r0, #1
	bx lr
_02235688:
	mov r0, #0
	bx lr
	.balign 4, 0
_0223568C: .word ov74_0223D454
	thumb_func_end ov74_0223567C

	thumb_func_start ov74_02235690
ov74_02235690: ; 0x02235690
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r6, _022356F8 ; =ov74_0223D454
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	ldr r2, _022356FC ; =ov74_0223D454
	str r3, [sp, #0xc]
	ldr r2, [r2, #8]
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	ldr r2, _022356FC ; =ov74_0223D454
	ldr r1, _02235700 ; =ov74_0223D48C
	ldr r2, [r2, #8]
	mov r0, #0x80
	bl G2dRenderer_Init
	ldr r1, _022356FC ; =ov74_0223D454
	mov r2, #1
	str r0, [r1, #0x34]
	ldr r0, _02235700 ; =ov74_0223D48C
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r1, #3
	mov r7, #0x16
	ldr r0, _02235704 ; =ov74_0223D654
	lsl r1, r1, #0x12
	str r1, [r0, #0x10]
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #4
_022356E0:
	ldr r2, [r6, #8]
	mov r0, #0x20
	add r1, r4, #0
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _022356E0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022356F8: .word ov74_0223D454
_022356FC: .word ov74_0223D454
_02235700: .word ov74_0223D48C
_02235704: .word ov74_0223D654
	thumb_func_end ov74_02235690

	thumb_func_start ov74_02235708
ov74_02235708: ; 0x02235708
	push {r4, lr}
	ldr r0, _02235720 ; =ov74_0223D454
	ldr r4, _02235724 ; =ov74_0223D454
	ldr r0, [r0, #0x34]
	cmp r0, #0
	bne _02235718
	bl GF_AssertFail
_02235718:
	add r4, #0x34
	add r0, r4, #0
	pop {r4, pc}
	nop
_02235720: .word ov74_0223D454
_02235724: .word ov74_0223D454
	thumb_func_end ov74_02235708

	thumb_func_start ov74_02235728
ov74_02235728: ; 0x02235728
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r4, [sp, #0x54]
	add r6, r0, #0
	mov ip, r1
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	ldr r5, _02235894 ; =ov74_0223D454
	cmp r4, #0
	bne _02235740
	mov r7, #1
	b _02235742
_02235740:
	mov r7, #2
_02235742:
	mov r0, #1
	str r0, [sp, #0x34]
	cmp r6, #0x12
	bne _0223574E
	mov r0, #0
	str r0, [sp, #0x34]
_0223574E:
	mov r1, #0
	mvn r1, r1
	mov r0, ip
	cmp r0, r1
	beq _0223577C
	str r4, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x34]
	str r0, [sp, #8]
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	mov r2, ip
	bl AddCharResObjFromNarc
	mov r1, #0x18
	mul r1, r4
	add r2, r5, r1
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r2, r1]
_0223577C:
	mov r1, #0
	ldr r0, [sp, #0x2c]
	mvn r1, r1
	cmp r0, r1
	beq _022357AE
	str r4, [sp]
	str r7, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x2c]
	str r0, [sp, #0xc]
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x18
	mul r1, r4
	add r2, r5, r1
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r2, r1]
_022357AE:
	mov r1, #0
	ldr r0, [sp, #0x30]
	mvn r1, r1
	cmp r0, r1
	beq _022357DE
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x34]
	add r1, r6, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x18
	add r2, r4, #0
	mul r2, r1
	add r2, r5, r2
	lsl r1, r1, #4
	str r0, [r2, r1]
_022357DE:
	mov r0, #0
	ldr r2, [sp, #0x50]
	mvn r0, r0
	cmp r2, r0
	beq _0223580C
	str r4, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x34]
	str r0, [sp, #8]
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x18
	mul r1, r4
	add r2, r5, r1
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r2, r1]
_0223580C:
	mov r0, #0x18
	add r6, r4, #0
	mul r6, r0
	mov r0, #0x5e
	add r1, r5, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_0200ACF0
	mov r0, #0x5f
	add r1, r5, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_0200B00C
	mov r0, #0
	mov r2, #0x16
	str r4, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r2, r2, #4
	ldr r1, [r5, r2]
	add r3, r4, #0
	str r1, [sp, #0x14]
	add r1, r2, #4
	ldr r1, [r5, r1]
	str r1, [sp, #0x18]
	add r1, r2, #0
	add r1, #8
	ldr r1, [r5, r1]
	str r1, [sp, #0x1c]
	add r1, r2, #0
	add r1, #0xc
	ldr r1, [r5, r1]
	add r2, #0x48
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	mov r0, #0x24
	add r1, r5, r2
	mul r0, r4
	add r0, r1, r0
	add r1, r4, #0
	add r2, r4, #0
	bl CreateSpriteResourcesHeader
	cmp r4, #0
	bne _0223587E
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _02235886
_0223587E:
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
_02235886:
	ldr r0, _02235898 ; =ov74_02235A74
	mov r1, #0
	bl Main_SetVBlankIntrCB
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235894: .word ov74_0223D454
_02235898: .word ov74_02235A74
	thumb_func_end ov74_02235728

	thumb_func_start ov74_0223589C
ov74_0223589C: ; 0x0223589C
	push {r4, lr}
	add r2, r0, #0
	add r4, r1, #0
	add r1, r2, #0
	ldr r0, _022358B4 ; =ov74_0223D48C
	add r2, r4, #0
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r0, _022358B8 ; =ov74_0223D654
	str r4, [r0, #0x10]
	pop {r4, pc}
	nop
_022358B4: .word ov74_0223D48C
_022358B8: .word ov74_0223D654
	thumb_func_end ov74_0223589C

	thumb_func_start ov74_022358BC
ov74_022358BC: ; 0x022358BC
	ldr r3, _022358C4 ; =ov74_022358C8
	mov r0, #0
	bx r3
	nop
_022358C4: .word ov74_022358C8
	thumb_func_end ov74_022358BC

	thumb_func_start ov74_022358C8
ov74_022358C8: ; 0x022358C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02235928 ; =ov74_0223D654
	ldr r4, _0223592C ; =ov74_0223D454
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0223591C
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _02235918
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #0
	bne _022358FC
	cmp r5, #0
	bne _022358FC
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_022358FC:
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020248AC
	mov r1, #6
	ldr r2, [r0, #4]
	lsl r1, r1, #0x12
	cmp r2, r1
	bge _0223591C
	lsr r1, r1, #7
	add r1, r2, r1
	str r1, [r0, #4]
	b _0223591C
_02235918:
	sub r1, r1, #1
	str r1, [r4, r0]
_0223591C:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _02235926
	bl sub_0202457C
_02235926:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02235928: .word ov74_0223D654
_0223592C: .word ov74_0223D454
	thumb_func_end ov74_022358C8

	thumb_func_start ov74_02235930
ov74_02235930: ; 0x02235930
	push {r3, r4, r5, lr}
	sub sp, #0x30
	add r4, r1, #0
	ldr r1, _022359B8 ; =ov74_0223D454
	bne _02235992
	ldr r4, [r1, #0x34]
	lsl r2, r2, #0xc
	str r4, [sp]
	mov r4, #0x6a
	lsl r4, r4, #2
	add r5, r1, r4
	mov r4, #0x24
	mul r4, r0
	add r4, r5, r4
	str r4, [sp, #4]
	mov r4, #1
	lsl r4, r4, #0xc
	mov r5, #0
	str r5, [sp, #0x10]
	str r4, [sp, #0x14]
	str r4, [sp, #0x18]
	str r4, [sp, #0x1c]
	add r4, sp, #0
	strh r5, [r4, #0x20]
	str r2, [sp, #8]
	lsl r2, r3, #0xc
	str r2, [sp, #0xc]
	mov r2, #0xa
	str r2, [sp, #0x24]
	cmp r0, #0
	bne _02235972
	mov r2, #1
	b _02235974
_02235972:
	mov r2, #2
_02235974:
	ldr r0, [r1, #8]
	str r2, [sp, #0x28]
	str r0, [sp, #0x2c]
	cmp r2, #2
	bne _0223598A
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r2, [sp, #0xc]
	ldr r0, [r1, r0]
	add r0, r2, r0
	str r0, [sp, #0xc]
_0223598A:
	add r0, sp, #0
	bl CreateSprite
	add r4, r0, #0
_02235992:
	add r0, r4, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	mov r1, #0
	bl sub_02024A04
	ldr r1, [sp, #0x40]
	add r0, r4, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022359B8: .word ov74_0223D454
	thumb_func_end ov74_02235930

	thumb_func_start ov74_022359BC
ov74_022359BC: ; 0x022359BC
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02235A5C ; =ov74_0223D654
	ldr r4, _02235A60 ; =ov74_0223D454
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022359DA
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r0, #0x82
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_022359DA:
	mov r1, #0x51
	ldr r0, _02235A64 ; =ov74_0223D488
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _022359EA
	bl sub_0200AEB0
_022359EA:
	mov r1, #0x57
	ldr r0, _02235A64 ; =ov74_0223D488
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _022359FA
	bl sub_0200AEB0
_022359FA:
	mov r1, #0x52
	ldr r0, _02235A64 ; =ov74_0223D488
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02235A0A
	bl sub_0200B0A8
_02235A0A:
	mov r1, #0x16
	ldr r0, _02235A64 ; =ov74_0223D488
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02235A1A
	bl sub_0200B0A8
_02235A1A:
	mov r4, #0
	mov r7, #0x4b
	ldr r5, _02235A64 ; =ov74_0223D488
	add r6, r4, #0
	lsl r7, r7, #2
_02235A24:
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Destroy2DGfxResObjMan
	str r6, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02235A24
	ldr r0, _02235A64 ; =ov74_0223D488
	ldr r0, [r0]
	bl sub_02024504
	ldr r0, _02235A64 ; =ov74_0223D488
	mov r1, #0
	str r1, [r0]
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02235A5C: .word ov74_0223D654
_02235A60: .word ov74_0223D454
_02235A64: .word ov74_0223D488
	thumb_func_end ov74_022359BC

	thumb_func_start ov74_02235A68
ov74_02235A68: ; 0x02235A68
	mov r1, #1
	sub r0, #0xa
	lsl r1, r0
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02235A68

	thumb_func_start ov74_02235A74
ov74_02235A74: ; 0x02235A74
	push {r4, lr}
	ldr r0, _02235AB0 ; =ov74_0223E2D4
	ldr r4, _02235AB4 ; =ov74_0223D454
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _02235A8E
	ldr r1, _02235AB8 ; =0x00000EA4
	add r0, r4, #0
	ldr r1, [r4, r1]
	blx r1
	ldr r0, _02235AB8 ; =0x00000EA4
	mov r1, #0
	str r1, [r4, r0]
_02235A8E:
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r0, [r4]
	cmp r0, #0
	beq _02235AA0
	bl BgConfig_HandleScheduledScrollAndTransferOps
_02235AA0:
	ldr r3, _02235ABC ; =0x027E0000
	ldr r1, _02235AC0 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02235AB0: .word ov74_0223E2D4
_02235AB4: .word ov74_0223D454
_02235AB8: .word 0x00000EA4
_02235ABC: .word 0x027E0000
_02235AC0: .word 0x00003FF8
	thumb_func_end ov74_02235A74

	thumb_func_start ov74_02235AC4
ov74_02235AC4: ; 0x02235AC4
	push {r4}
	sub sp, #0x24
	ldr r4, _02235B10 ; =_0223B73C
	add r3, sp, #0
	mov r2, #0x22
_02235ACE:
	ldrb r1, [r4]
	add r4, r4, #1
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _02235ACE
	add r1, sp, #0
	ldrb r2, [r1]
	mov r3, #0
	sub r1, r3, #1
	cmp r2, r1
	beq _02235B08
	add r4, sp, #0
	sub r1, r3, #1
_02235AEA:
	ldrb r2, [r4]
	cmp r0, r2
	bne _02235AFE
	add r0, sp, #0
	lsl r1, r3, #1
	add r0, #1
	add sp, #0x24
	ldrb r0, [r0, r1]
	pop {r4}
	bx lr
_02235AFE:
	add r4, r4, #2
	ldrb r2, [r4]
	add r3, r3, #1
	cmp r2, r1
	bne _02235AEA
_02235B08:
	mov r0, #0
	add sp, #0x24
	pop {r4}
	bx lr
	.balign 4, 0
_02235B10: .word _0223B73C
	thumb_func_end ov74_02235AC4

	thumb_func_start ov74_02235B14
ov74_02235B14: ; 0x02235B14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r1, #0
	str r0, [sp, #0x20]
	add r0, r6, #0
	add r5, r2, #0
	add r7, r3, #0
	ldr r4, [sp, #0x44]
	bl GetMonGender
	str r0, [sp, #0x24]
	add r0, r6, #0
	bl MonIsShiny
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	lsl r0, r7, #0x18
	ldr r2, [sp, #0x24]
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0
	lsl r1, r5, #0x10
	lsl r2, r2, #0x18
	str r0, [sp, #8]
	add r0, r4, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	mov r3, #2
	bl GetMonSpriteCharAndPlttNarcIdsEx
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	mov r3, #0
	str r3, [sp]
	mov r1, #0xa
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #0x40]
	ldr r2, _02235BCC ; =ov74_0223D454
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, #2
	str r0, [sp, #0x18]
	str r5, [sp, #0x1c]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r2, [r2, #8]
	bl sub_02014494
	mov r1, #0x32
	ldr r0, [sp, #0x40]
	lsl r1, r1, #6
	bl DC_FlushRange
	ldr r0, [sp, #0x20]
	bl sub_02024B1C
	mov r1, #2
	bl NNS_G2dGetImageLocation
	mov r2, #0x32
	add r1, r0, #0
	lsl r2, r2, #6
	ldr r0, [sp, #0x40]
	add r1, r1, r2
	bl GXS_LoadOBJ
	ldr r0, [sp, #0x20]
	bl sub_02024B34
	mov r1, #2
	bl NNS_G2dGetImagePaletteLocation
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, _02235BCC ; =ov74_0223D454
	mov r2, #5
	ldr r0, [r0, #8]
	add r3, #0x60
	str r0, [sp, #4]
	ldrh r0, [r4]
	ldrh r1, [r4, #4]
	bl GfGfxLoader_GXLoadPal
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02235BCC: .word ov74_0223D454
	thumb_func_end ov74_02235B14

	thumb_func_start ov74_02235BD0
ov74_02235BD0: ; 0x02235BD0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x25
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x27
	mov r2, #0x24
	mov r3, #0x26
	bl ov74_02235728
	mov r1, #1
	mov r0, #0
	lsl r1, r1, #0x14
	bl ov74_0223589C
	mov r3, #0
	mov r1, #0x82
	str r3, [sp]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r0, #1
	mov r2, #0x80
	bl ov74_02235930
	mov r1, #0x82
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov74_02235BD0

	thumb_func_start ov74_02235C10
ov74_02235C10: ; 0x02235C10
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0xc
	str r0, [sp]
	mov r0, #1
	add r4, r1, #0
	add r6, r2, #0
	str r0, [sp, #4]
	mov r0, #0x34
	mov r1, #0xa
	mov r2, #0
	mov r3, #0xb
	bl ov74_02235728
	mov r1, #1
	mov r0, #0
	lsl r1, r1, #0x14
	bl ov74_0223589C
	mov r0, #1
	mov r1, #0x82
	str r0, [sp]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #0x80
	mov r3, #0
	bl ov74_02235930
	mov r2, #0x82
	lsl r2, r2, #2
	add r6, #8
	str r0, [r5, r2]
	cmp r4, #7
	bgt _02235C68
	cmp r4, #1
	blt _02235CDA
	beq _02235C6C
	cmp r4, #2
	beq _02235CA2
	cmp r4, #7
	beq _02235CC0
	add sp, #8
	pop {r4, r5, r6, pc}
_02235C68:
	cmp r4, #0xd
	bne _02235CDA
_02235C6C:
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #0x85
	lsl r1, r1, #2
	add r3, r0, #0
	add r0, r5, r1
	str r0, [sp]
	ldr r0, _02235CE0 ; =0x00000E94
	sub r1, #0xc
	add r0, r5, r0
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r6, #0
	add r2, r4, #0
	bl ov74_02235B14
	add sp, #8
	pop {r4, r5, r6, pc}
_02235CA2:
	add r0, r2, #0
	add r0, #0xc
	add r0, r5, r0
	str r0, [sp]
	ldr r0, _02235CE0 ; =0x00000E94
	add r1, r6, #0
	add r0, r5, r0
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	sub r2, #0x1a
	mov r3, #0
	bl ov74_02235B14
	add sp, #8
	pop {r4, r5, r6, pc}
_02235CC0:
	add r0, r2, #0
	add r0, #0xc
	add r0, r5, r0
	str r0, [sp]
	ldr r0, _02235CE0 ; =0x00000E94
	add r1, r6, #0
	add r0, r5, r0
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	sub r2, #0x1a
	mov r3, #1
	bl ov74_02235B14
_02235CDA:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02235CE0: .word 0x00000E94
	thumb_func_end ov74_02235C10

	thumb_func_start ov74_02235CE4
ov74_02235CE4: ; 0x02235CE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	cmp r1, #0xf
	bhi _02235D36
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02235CFA: ; jump table
	.short _02235D36 - _02235CFA - 2 ; case 0
	.short _02235D36 - _02235CFA - 2 ; case 1
	.short _02235D36 - _02235CFA - 2 ; case 2
	.short _02235D1A - _02235CFA - 2 ; case 3
	.short _02235D36 - _02235CFA - 2 ; case 4
	.short _02235D36 - _02235CFA - 2 ; case 5
	.short _02235D36 - _02235CFA - 2 ; case 6
	.short _02235D36 - _02235CFA - 2 ; case 7
	.short _02235D1E - _02235CFA - 2 ; case 8
	.short _02235D22 - _02235CFA - 2 ; case 9
	.short _02235D28 - _02235CFA - 2 ; case 10
	.short _02235D36 - _02235CFA - 2 ; case 11
	.short _02235D2C - _02235CFA - 2 ; case 12
	.short _02235D36 - _02235CFA - 2 ; case 13
	.short _02235D30 - _02235CFA - 2 ; case 14
	.short _02235D34 - _02235CFA - 2 ; case 15
_02235D1A:
	ldr r4, [r2, #4]
	b _02235D36
_02235D1E:
	ldr r4, _02235D90 ; =0x000001C6
	b _02235D36
_02235D22:
	mov r4, #0x71
	lsl r4, r4, #2
	b _02235D36
_02235D28:
	ldr r4, _02235D94 ; =0x000001C7
	b _02235D36
_02235D2C:
	ldr r4, _02235D98 ; =0x000001D3
	b _02235D36
_02235D30:
	ldr r4, _02235D9C ; =0x000001BA
	b _02235D36
_02235D34:
	ldr r4, _02235DA0 ; =0x000001F5
_02235D36:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	bl GetItemIndexMapping
	add r7, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	mov r1, #2
	bl GetItemIndexMapping
	add r4, r0, #0
	bl GetItemIconCell
	add r6, r0, #0
	bl GetItemIconAnim
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x12
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov74_02235728
	mov r1, #1
	mov r0, #0
	lsl r1, r1, #0x14
	bl ov74_0223589C
	mov r3, #0
	mov r1, #0x82
	str r3, [sp]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r0, #1
	mov r2, #0x80
	bl ov74_02235930
	mov r1, #0x82
	lsl r1, r1, #2
	str r0, [r5, r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02235D90: .word 0x000001C6
_02235D94: .word 0x000001C7
_02235D98: .word 0x000001D3
_02235D9C: .word 0x000001BA
_02235DA0: .word 0x000001F5
	thumb_func_end ov74_02235CE4

	thumb_func_start ov74_02235DA4
ov74_02235DA4: ; 0x02235DA4
	push {r3, lr}
	sub sp, #8
	mov r1, #0xc0
	str r1, [sp]
	ldr r0, [r0, #8]
	mov r2, #4
	add r3, r2, #0
	str r0, [sp, #4]
	mov r0, #0x71
	mov r1, #0x21
	add r3, #0xfc
	bl GfGfxLoader_GXLoadPal
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_02235DA4

	thumb_func_start ov74_02235DC4
ov74_02235DC4: ; 0x02235DC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r1, #0
	ldrh r4, [r6]
	add r5, r0, #0
	add r0, r4, #0
	bl ov74_02235AC4
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _02235EC0 ; =ov74_0223D454
	mov r1, #0x22
	ldr r0, [r0, #8]
	add r2, r5, #0
	str r0, [sp, #0xc]
	mov r0, #0x71
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r2, #1
	ldr r3, _02235EC0 ; =ov74_0223D454
	str r2, [sp]
	ldr r3, [r3, #8]
	mov r0, #0x71
	mov r1, #0x23
	bl GfGfxLoader_LoadFromNarc
	add r1, sp, #0x14
	str r0, [sp, #0x10]
	bl NNS_G2dGetUnpackedScreenData
	ldr r2, [sp, #0x14]
	mov r3, #6
	add r0, r5, #0
	mov r1, #5
	add r2, #0xc
	lsl r3, r3, #8
	bl BG_LoadScreenTilemapData
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	mov r2, #0
	add r7, #8
	str r0, [sp, #4]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #5
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r5, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, _02235EC4 ; =ov74_02235DA4
	ldr r0, _02235EC8 ; =ov74_0223E2D4
	cmp r4, #0xf
	str r1, [r0, #0x24]
	ldr r0, _02235EC0 ; =ov74_0223D454
	str r5, [r0]
	bhi _02235EAE
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02235E62: ; jump table
	.short _02235EAE - _02235E62 - 2 ; case 0
	.short _02235E98 - _02235E62 - 2 ; case 1
	.short _02235E98 - _02235E62 - 2 ; case 2
	.short _02235EA4 - _02235E62 - 2 ; case 3
	.short _02235E82 - _02235E62 - 2 ; case 4
	.short _02235E82 - _02235E62 - 2 ; case 5
	.short _02235E82 - _02235E62 - 2 ; case 6
	.short _02235E8E - _02235E62 - 2 ; case 7
	.short _02235EA4 - _02235E62 - 2 ; case 8
	.short _02235EA4 - _02235E62 - 2 ; case 9
	.short _02235EA4 - _02235E62 - 2 ; case 10
	.short _02235E82 - _02235E62 - 2 ; case 11
	.short _02235EA4 - _02235E62 - 2 ; case 12
	.short _02235E98 - _02235E62 - 2 ; case 13
	.short _02235EA4 - _02235E62 - 2 ; case 14
	.short _02235EA4 - _02235E62 - 2 ; case 15
_02235E82:
	ldr r0, _02235ECC ; =ov74_0223D454
	add r1, r4, #0
	add r2, r6, #0
	bl ov74_02235BD0
	b _02235EAE
_02235E8E:
	mov r1, #0x83
	ldr r0, _02235ECC ; =ov74_0223D454
	mov r2, #0x78
	lsl r1, r1, #2
	str r2, [r0, r1]
_02235E98:
	ldr r0, _02235ECC ; =ov74_0223D454
	add r1, r4, #0
	add r2, r6, #0
	bl ov74_02235C10
	b _02235EAE
_02235EA4:
	ldr r0, _02235ECC ; =ov74_0223D454
	add r1, r4, #0
	add r2, r6, #0
	bl ov74_02235CE4
_02235EAE:
	mov r1, #0x82
	ldr r0, _02235ECC ; =ov74_0223D454
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02235EC0: .word ov74_0223D454
_02235EC4: .word ov74_02235DA4
_02235EC8: .word ov74_0223E2D4
_02235ECC: .word ov74_0223D454
	thumb_func_end ov74_02235DC4

	thumb_func_start ov74_02235ED0
ov74_02235ED0: ; 0x02235ED0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	mov r1, #2
	add r5, r0, #0
	add r0, r2, #0
	lsl r1, r1, #8
	str r2, [sp]
	bl AllocFromHeap
	ldr r1, _02235F50 ; =0x0000A001
	add r4, r0, #0
	bl MATHi_CRC16InitTableRev
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x50
	bl MATH_CalcCRC16
	add r6, r0, #0
	add r0, r4, #0
	bl FreeToHeap
	add r0, sp, #4
	bl OS_GetMacAddress
	add r0, sp, #4
	ldrh r1, [r0, #2]
	mov r2, #0
	add r3, sp, #4
	strh r1, [r0, #6]
	ldr r1, _02235F54 ; =0x0000D679
	strh r6, [r0, #2]
_02235F12:
	ldrh r0, [r3]
	add r2, r2, #1
	eor r0, r1
	strh r0, [r3]
	ldrh r1, [r3]
	add r3, r3, #2
	cmp r2, #4
	blt _02235F12
	mov r1, #0x41
	ldr r0, [sp]
	lsl r1, r1, #2
	bl AllocFromHeap
	add r1, sp, #4
	mov r2, #8
	add r4, r0, #0
	bl CRYPTO_RC4Init
	add r5, #0x50
	mov r2, #0xd6
	add r0, r4, #0
	add r1, r5, #0
	lsl r2, r2, #2
	add r3, r7, #0
	bl CRYPTO_RC4Encrypt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02235F50: .word 0x0000A001
_02235F54: .word 0x0000D679
	thumb_func_end ov74_02235ED0

	thumb_func_start ov74_02235F58
ov74_02235F58: ; 0x02235F58
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	mov r1, #2
	add r5, r0, #0
	add r0, r2, #0
	lsl r1, r1, #8
	str r2, [sp]
	bl AllocFromHeap
	ldr r1, _02235FF0 ; =0x0000A001
	add r4, r0, #0
	bl MATHi_CRC16InitTableRev
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x50
	bl MATH_CalcCRC16
	add r6, r0, #0
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	bl sub_02035754
	ldrb r2, [r0, #4]
	add r1, sp, #4
	mov r3, #0
	strb r2, [r1]
	ldrb r2, [r0, #5]
	strb r2, [r1, #1]
	ldrb r2, [r0, #6]
	strb r2, [r1, #2]
	ldrb r2, [r0, #7]
	strb r2, [r1, #3]
	ldrb r2, [r0, #8]
	strb r2, [r1, #4]
	ldrb r0, [r0, #9]
	strb r0, [r1, #5]
	add r0, sp, #4
	ldrh r2, [r0, #2]
	strh r2, [r0, #6]
	ldr r2, _02235FF4 ; =0x0000D679
	strh r6, [r0, #2]
_02235FB2:
	ldrh r0, [r1]
	add r3, r3, #1
	eor r0, r2
	strh r0, [r1]
	ldrh r2, [r1]
	add r1, r1, #2
	cmp r3, #4
	blt _02235FB2
	mov r1, #0x41
	ldr r0, [sp]
	lsl r1, r1, #2
	bl AllocFromHeap
	add r1, sp, #4
	mov r2, #8
	add r4, r0, #0
	bl CRYPTO_RC4Init
	add r5, #0x50
	mov r2, #0xd6
	add r0, r4, #0
	add r1, r5, #0
	lsl r2, r2, #2
	add r3, r7, #0
	bl CRYPTO_RC4Encrypt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02235FF0: .word 0x0000A001
_02235FF4: .word 0x0000D679
	thumb_func_end ov74_02235F58

	thumb_func_start ov74_02235FF8
ov74_02235FF8: ; 0x02235FF8
	push {r3, lr}
	cmp r2, #0
	beq _02236002
	cmp r2, #1
	pop {r3, pc}
_02236002:
	ldr r0, _0223600C ; =SEQ_SE_DP_SELECT
	bl PlaySE
	pop {r3, pc}
	nop
_0223600C: .word SEQ_SE_DP_SELECT
	thumb_func_end ov74_02235FF8

	thumb_func_start ov74_02236010
ov74_02236010: ; 0x02236010
	push {r3, lr}
	ldr r0, _02236030 ; =0x027FFFA8
	ldrh r1, [r0]
	mov r0, #2
	lsl r0, r0, #0xe
	and r0, r1
	asr r0, r0, #0xf
	bne _0223602C
	bl CTRDG_IsAgbCartridge
	cmp r0, #0
	bne _0223602C
	bl CTRDG_TerminateForPulledOut
_0223602C:
	pop {r3, pc}
	nop
_02236030: .word 0x027FFFA8
	thumb_func_end ov74_02236010

	thumb_func_start ov74_02236034
ov74_02236034: ; 0x02236034
	push {r3, lr}
	cmp r0, #1
	bne _0223605C
	ldr r1, _02236068 ; =0x04000208
	ldrh r0, [r1]
	mov r0, #0
	strh r0, [r1]
	lsr r0, r1, #0xd
	ldr r1, _0223606C ; =ov74_02236010
	bl OS_SetIrqFunction
	mov r0, #2
	lsl r0, r0, #0xc
	bl OS_EnableIrqMask
	ldr r1, _02236068 ; =0x04000208
	ldrh r0, [r1]
	mov r0, #1
	strh r0, [r1]
	pop {r3, pc}
_0223605C:
	mov r0, #2
	lsl r0, r0, #0xc
	bl OS_DisableIrqMask
	pop {r3, pc}
	nop
_02236068: .word 0x04000208
_0223606C: .word ov74_02236010
	thumb_func_end ov74_02236034

	thumb_func_start ov74_02236070
ov74_02236070: ; 0x02236070
	bx lr
	.balign 4, 0
	thumb_func_end ov74_02236070

	thumb_func_start ov74_02236074
ov74_02236074: ; 0x02236074
	push {r3, lr}
	ldr r1, _02236098 ; =0x04000208
	ldrh r0, [r1]
	mov r0, #0
	strh r0, [r1]
	lsr r0, r1, #0xd
	ldr r1, _0223609C ; =ov74_02236070
	bl OS_SetIrqFunction
	mov r0, #2
	lsl r0, r0, #0xc
	bl OS_EnableIrqMask
	ldr r1, _02236098 ; =0x04000208
	ldrh r0, [r1]
	mov r0, #1
	strh r0, [r1]
	pop {r3, pc}
	.balign 4, 0
_02236098: .word 0x04000208
_0223609C: .word ov74_02236070
	thumb_func_end ov74_02236074

	thumb_func_start ov74_022360A0
ov74_022360A0: ; 0x022360A0
	ldr r1, _022360AC ; =ov74_0223D454
	str r0, [r1, #0x18]
	mov r0, #0
	str r0, [r1, #0x14]
	bx lr
	nop
_022360AC: .word ov74_0223D454
	thumb_func_end ov74_022360A0

	thumb_func_start ov74_022360B0
ov74_022360B0: ; 0x022360B0
	push {r3, r4, r5, lr}
	ldr r0, _02236120 ; =ov74_0223D454
	ldr r4, _02236124 ; =ov74_0223D454
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bhi _0223611C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022360C8: ; jump table
	.short _022360D2 - _022360C8 - 2 ; case 0
	.short _022360E8 - _022360C8 - 2 ; case 1
	.short _0223611C - _022360C8 - 2 ; case 2
	.short _0223611C - _022360C8 - 2 ; case 3
	.short _0223611C - _022360C8 - 2 ; case 4
_022360D2:
	mov r0, #4
	bl sub_0201A728
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl Save_PrepareForAsyncWrite
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	b _0223611C
_022360E8:
	ldr r0, [r4, #0x18]
	bl Save_WriteFileAsync
	add r5, r0, #0
	cmp r5, #3
	bne _022360FA
	mov r0, #3
	str r0, [r4, #0x14]
	b _0223610C
_022360FA:
	cmp r5, #2
	bne _02236104
	mov r0, #2
	str r0, [r4, #0x14]
	b _0223610C
_02236104:
	cmp r5, #1
	bne _0223610C
	mov r0, #4
	str r0, [r4, #0x14]
_0223610C:
	sub r0, r5, #2
	cmp r0, #1
	bhi _02236118
	mov r0, #4
	bl sub_0201A738
_02236118:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_0223611C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236120: .word ov74_0223D454
_02236124: .word ov74_0223D454
	thumb_func_end ov74_022360B0

	thumb_func_start ov74_02236128
ov74_02236128: ; 0x02236128
	ldr r0, _02236138 ; =ov74_0223D454
	ldr r1, _0223613C ; =ov74_0223D454
	ldr r0, [r0, #0x14]
	cmp r0, #4
	bne _02236136
	mov r0, #1
	str r0, [r1, #0x14]
_02236136:
	bx lr
	.balign 4, 0
_02236138: .word ov74_0223D454
_0223613C: .word ov74_0223D454
	thumb_func_end ov74_02236128

	thumb_func_start ov74_02236140
ov74_02236140: ; 0x02236140
	push {r3, lr}
	ldr r0, _02236158 ; =ov74_0223D454
	ldr r0, [r0, #0x18]
	bl Save_Cancel
	ldr r0, _02236158 ; =ov74_0223D454
	mov r1, #3
	str r1, [r0, #0x14]
	mov r0, #4
	bl sub_0201A738
	pop {r3, pc}
	.balign 4, 0
_02236158: .word ov74_0223D454
	thumb_func_end ov74_02236140

	thumb_func_start ov74_0223615C
ov74_0223615C: ; 0x0223615C
	ldr r0, _02236164 ; =ov74_0223D454
	ldr r0, [r0, #0x14]
	bx lr
	nop
_02236164: .word ov74_0223D454
	thumb_func_end ov74_0223615C

	thumb_func_start ov74_02236168
ov74_02236168: ; 0x02236168
	push {r4, lr}
	ldr r1, _022361A4 ; =ov74_0223E2FC
	add r4, r0, #0
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _02236184
	ldr r3, [r1]
	ldr r1, _022361A8 ; =0x00001150
	ldr r0, _022361AC ; =ov74_0223D00C
	ldr r1, [r3, r1]
	lsl r3, r1, #2
	ldr r1, _022361B0 ; =ov74_0223CFE4
	ldr r1, [r1, r3]
	blx r2
_02236184:
	ldr r3, _022361A4 ; =ov74_0223E2FC
	ldr r1, _022361A8 ; =0x00001150
	ldr r0, [r3]
	str r4, [r0, r1]
	ldr r2, [r3, #4]
	cmp r2, #0
	beq _022361A0
	ldr r3, [r3]
	ldr r0, _022361B4 ; =ov74_0223D014
	ldr r1, [r3, r1]
	lsl r3, r1, #2
	ldr r1, _022361B0 ; =ov74_0223CFE4
	ldr r1, [r1, r3]
	blx r2
_022361A0:
	pop {r4, pc}
	nop
_022361A4: .word ov74_0223E2FC
_022361A8: .word 0x00001150
_022361AC: .word ov74_0223D00C
_022361B0: .word ov74_0223CFE4
_022361B4: .word ov74_0223D014
	thumb_func_end ov74_02236168

	thumb_func_start ov74_022361B8
ov74_022361B8: ; 0x022361B8
	ldr r1, _022361CC ; =ov74_0223E2FC
	ldr r3, [r1]
	ldr r1, _022361D0 ; =0x00001150
	ldr r2, [r3, r1]
	sub r2, #9
	cmp r2, #1
	bls _022361CA
	add r1, r1, #4
	str r0, [r3, r1]
_022361CA:
	bx lr
	.balign 4, 0
_022361CC: .word ov74_0223E2FC
_022361D0: .word 0x00001150
	thumb_func_end ov74_022361B8

	thumb_func_start ov74_022361D4
ov74_022361D4: ; 0x022361D4
	push {r4, lr}
	ldr r0, _02236240 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _02236244 ; =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #4
	bne _022361E6
	bl OS_Terminate
_022361E6:
	mov r0, #2
	bl ov74_02236168
	ldr r3, _02236240 ; =ov74_0223E2FC
	ldr r0, _02236248 ; =0x0000FFFF
	ldr r2, [r3]
	ldr r1, _0223624C ; =0x00000FCC
	strh r0, [r2, r1]
	sub r2, r1, #2
	ldr r4, [r3]
	sub r1, r1, #4
	strh r0, [r4, r2]
	ldr r2, [r3]
	strh r0, [r2, r1]
	bl ov74_02236258
	cmp r0, #0
	bne _02236224
	mov r0, #9
	bl ov74_02236168
	ldr r0, _02236240 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _02236250 ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236220
	mov r0, #4
	blx r1
_02236220:
	mov r0, #0
	pop {r4, pc}
_02236224:
	ldr r1, _02236240 ; =ov74_0223E2FC
	ldr r0, _02236254 ; =0x00001158
	ldr r2, [r1]
	mov r3, #2
	strh r3, [r2, r0]
	ldr r1, [r1]
	add r0, #0x24
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _0223623C
	mov r0, #0
	blx r1
_0223623C:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02236240: .word ov74_0223E2FC
_02236244: .word 0x00001150
_02236248: .word 0x0000FFFF
_0223624C: .word 0x00000FCC
_02236250: .word 0x0000117C
_02236254: .word 0x00001158
	thumb_func_end ov74_022361D4

	thumb_func_start ov74_02236258
ov74_02236258: ; 0x02236258
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02236330 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _02236334 ; =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #2
	beq _0223626C
	bl OS_Terminate
	mov r0, #0
_0223626C:
	bl WM_GetAllowedChannel
	add r4, r0, #0
	mov r0, #2
	lsl r0, r0, #0xe
	cmp r4, r0
	bne _02236284
	mov r0, #3
	bl ov74_022361B8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02236284:
	cmp r4, #0
	bne _02236292
	mov r0, #0x16
	bl ov74_022361B8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02236292:
	ldr r0, _02236330 ; =ov74_0223E2FC
	ldr r2, [r0]
	ldr r0, _02236338 ; =0x00001176
	ldrh r1, [r2, r0]
	cmp r1, #0x10
	blo _022362D4
	sub r1, #0x10
	mov r5, #0
	mov r7, #0xd
	mov r6, #1
	b _022362BA
_022362A8:
	add r0, r1, #1
	add r1, r7, #0
	bl _s32_div_f
	add r0, r6, #0
	lsl r0, r1
	tst r0, r4
	bne _022362BE
	add r5, r5, #1
_022362BA:
	cmp r5, #0xd
	blt _022362A8
_022362BE:
	ldr r2, _02236330 ; =ov74_0223E2FC
	add r4, r1, #0
	ldr r3, [r2]
	ldr r0, _02236338 ; =0x00001176
	add r4, #0x10
	strh r4, [r3, r0]
	add r3, r1, #1
	ldr r1, [r2]
	ldr r0, _0223633C ; =0x00000FC4
	strh r3, [r1, r0]
	b _022362D8
_022362D4:
	ldr r0, _0223633C ; =0x00000FC4
	strh r1, [r2, r0]
_022362D8:
	ldr r2, _02236330 ; =ov74_0223E2FC
	ldr r0, _02236340 ; =0x00000FC6
	ldr r1, [r2]
	mov r3, #0xdc
	strh r3, [r1, r0]
	add r1, r0, #0
	ldr r3, [r2]
	sub r1, #0xc6
	add r1, r3, r1
	sub r0, r0, #6
	str r1, [r3, r0]
	ldr r1, [r2]
	ldr r0, _02236344 ; =0x00001158
	ldrh r0, [r1, r0]
	cmp r0, #3
	bne _0223630E
	mov r5, #0
	ldr r0, _02236348 ; =0x00001170
	ldr r1, _0223634C ; =0x00000FC8
	b _0223630A
_02236300:
	ldr r3, [r2]
	add r4, r3, r5
	ldrb r3, [r4, r0]
	add r5, r5, #1
	strb r3, [r4, r1]
_0223630A:
	cmp r5, #6
	blt _02236300
_0223630E:
	ldr r1, _02236330 ; =ov74_0223E2FC
	ldr r0, _02236350 ; =ov74_02236354
	ldr r2, [r1]
	mov r1, #0x3f
	lsl r1, r1, #6
	add r1, r2, r1
	bl WM_StartScan
	cmp r0, #2
	beq _0223632A
	bl ov74_022361B8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223632A:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02236330: .word ov74_0223E2FC
_02236334: .word 0x00001150
_02236338: .word 0x00001176
_0223633C: .word 0x00000FC4
_02236340: .word 0x00000FC6
_02236344: .word 0x00001158
_02236348: .word 0x00001170
_0223634C: .word 0x00000FC8
_02236350: .word ov74_02236354
	thumb_func_end ov74_02236258

	thumb_func_start ov74_02236354
ov74_02236354: ; 0x02236354
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223637A
	bl ov74_022361B8
	mov r0, #9
	bl ov74_02236168
	ldr r0, _02236468 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _0223646C ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236466
	mov r0, #4
	blx r1
	pop {r3, r4, r5, pc}
_0223637A:
	ldr r0, _02236468 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _02236470 ; =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #2
	beq _022363A6
	bl ov74_0223648C
	cmp r0, #0
	bne _02236466
	mov r0, #9
	bl ov74_02236168
	ldr r0, _02236468 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _0223646C ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236466
	mov r0, #4
	blx r1
	pop {r3, r4, r5, pc}
_022363A6:
	ldrh r0, [r4, #8]
	cmp r0, #3
	beq _02236466
	cmp r0, #4
	beq _02236448
	cmp r0, #5
	bne _02236448
	mov r0, #0xf
	lsl r0, r0, #8
	add r0, r1, r0
	mov r1, #0xc0
	bl DC_InvalidateRange
	ldrh r0, [r4, #0x36]
	cmp r0, #8
	blo _022363CE
	ldr r1, [r4, #0x3c]
	ldr r0, _02236474 ; =0x00400318
	cmp r1, r0
	beq _022363E0
_022363CE:
	ldr r0, _02236468 ; =ov74_0223E2FC
	ldr r3, [r0, #4]
	cmp r3, #0
	beq _02236448
	ldr r0, _02236478 ; =ov74_0223D018
	ldr r1, [r4, #0x3c]
	ldr r2, _02236474 ; =0x00400318
	blx r3
	b _02236448
_022363E0:
	ldr r1, _02236468 ; =ov74_0223E2FC
	ldrh r3, [r4, #0x12]
	ldr r2, [r1]
	ldr r0, _0223647C ; =0x0000116C
	str r3, [r2, r0]
	ldr r1, [r1]
	sub r0, #0x14
	ldrh r0, [r1, r0]
	cmp r0, #2
	bne _0223642C
	add r0, r4, #0
	add r0, #0x48
	bl ov74_022366E8
	ldr r2, _02236468 ; =ov74_0223E2FC
	ldr r1, _02236480 ; =0x00001170
	mov r0, #0
_02236402:
	add r3, r4, r0
	ldrb r5, [r3, #0xa]
	ldr r3, [r2]
	add r3, r3, r0
	add r0, r0, #1
	strb r5, [r3, r1]
	cmp r0, #6
	blt _02236402
	ldr r1, _02236468 ; =ov74_0223E2FC
	ldr r0, _02236484 ; =0x00001176
	ldr r3, [r1]
	ldrh r2, [r3, r0]
	sub r2, #0xf
	strh r2, [r3, r0]
	ldr r1, [r1]
	add r0, r0, #6
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _0223642C
	mov r0, #1
	blx r1
_0223642C:
	add r4, #0x48
	add r0, r4, #0
	bl ov74_02236768
	cmp r0, #0
	beq _02236448
	ldr r0, _02236468 ; =ov74_0223E2FC
	mov r2, #4
	ldr r1, [r0]
	ldr r0, _02236488 ; =0x00001158
	strh r2, [r1, r0]
	bl ov74_022365FC
	pop {r3, r4, r5, pc}
_02236448:
	bl ov74_02236258
	cmp r0, #0
	bne _02236466
	mov r0, #9
	bl ov74_02236168
	ldr r0, _02236468 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _0223646C ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236466
	mov r0, #4
	blx r1
_02236466:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236468: .word ov74_0223E2FC
_0223646C: .word 0x0000117C
_02236470: .word 0x00001150
_02236474: .word 0x00400318
_02236478: .word ov74_0223D018
_0223647C: .word 0x0000116C
_02236480: .word 0x00001170
_02236484: .word 0x00001176
_02236488: .word 0x00001158
	thumb_func_end ov74_02236354

	thumb_func_start ov74_0223648C
ov74_0223648C: ; 0x0223648C
	push {r3, lr}
	ldr r0, _022364A4 ; =ov74_022364A8
	bl WM_EndScan
	cmp r0, #2
	beq _022364A0
	bl ov74_022361B8
	mov r0, #0
	pop {r3, pc}
_022364A0:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_022364A4: .word ov74_022364A8
	thumb_func_end ov74_0223648C

	thumb_func_start ov74_022364A8
ov74_022364A8: ; 0x022364A8
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _022364B6
	bl ov74_022361B8
	pop {r3, pc}
_022364B6:
	mov r0, #1
	bl ov74_02236168
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov74_022364A8

	thumb_func_start ov74_022364C0
ov74_022364C0: ; 0x022364C0
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _022364D0
	mov r0, #0xa
	bl ov74_02236168
	pop {r3, pc}
_022364D0:
	mov r0, #0
	bl ov74_02236168
	ldr r0, _022364E8 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _022364EC ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _022364E6
	mov r0, #3
	blx r1
_022364E6:
	pop {r3, pc}
	.balign 4, 0
_022364E8: .word ov74_0223E2FC
_022364EC: .word 0x0000117C
	thumb_func_end ov74_022364C0

	thumb_func_start ov74_022364F0
ov74_022364F0: ; 0x022364F0
	push {r3, lr}
	ldr r0, _0223650C ; =ov74_0223E2FC
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _02236510 ; =0x00001154
	str r2, [r1, r0]
	bl ov74_0223653C
	cmp r0, #0
	beq _02236508
	mov r0, #1
	pop {r3, pc}
_02236508:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0223650C: .word ov74_0223E2FC
_02236510: .word 0x00001154
	thumb_func_end ov74_022364F0

	thumb_func_start ov74_02236514
ov74_02236514: ; 0x02236514
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #8
	bne _02236532
	mov r0, #9
	bl ov74_02236168
	ldr r0, _02236534 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _02236538 ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236532
	mov r0, #4
	blx r1
_02236532:
	pop {r3, pc}
	.balign 4, 0
_02236534: .word ov74_0223E2FC
_02236538: .word 0x0000117C
	thumb_func_end ov74_02236514

	thumb_func_start ov74_0223653C
ov74_0223653C: ; 0x0223653C
	push {r3, lr}
	mov r0, #3
	bl ov74_02236168
	ldr r0, _02236568 ; =ov74_0223E2FC
	ldr r1, _0223656C ; =ov74_02236570
	ldr r0, [r0]
	mov r2, #2
	bl WM_Initialize
	cmp r0, #2
	beq _02236562
	bl ov74_022361B8
	mov r0, #0xa
	bl ov74_02236168
	mov r0, #0
	pop {r3, pc}
_02236562:
	mov r0, #1
	pop {r3, pc}
	nop
_02236568: .word ov74_0223E2FC
_0223656C: .word ov74_02236570
	thumb_func_end ov74_0223653C

	thumb_func_start ov74_02236570
ov74_02236570: ; 0x02236570
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02236584
	bl ov74_022361B8
	mov r0, #0xa
	bl ov74_02236168
	pop {r3, pc}
_02236584:
	ldr r0, _022365A8 ; =ov74_02236514
	bl WM_SetIndCallback
	cmp r0, #0
	beq _0223659A
	bl ov74_022361B8
	mov r0, #0xa
	bl ov74_02236168
	pop {r3, pc}
_0223659A:
	mov r0, #1
	bl ov74_02236168
	bl ov74_022361D4
	pop {r3, pc}
	nop
_022365A8: .word ov74_02236514
	thumb_func_end ov74_02236570

	thumb_func_start ov74_022365AC
ov74_022365AC: ; 0x022365AC
	push {r3, lr}
	ldr r0, _022365EC ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _022365F0 ; =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #1
	beq _022365BE
	bl OS_Terminate
_022365BE:
	mov r0, #3
	bl ov74_02236168
	ldr r0, _022365F4 ; =ov74_022364C0
	bl WM_End
	cmp r0, #2
	beq _022365E8
	mov r0, #9
	bl ov74_02236168
	ldr r0, _022365EC ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _022365F8 ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _022365E4
	mov r0, #4
	blx r1
_022365E4:
	mov r0, #0
	pop {r3, pc}
_022365E8:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_022365EC: .word ov74_0223E2FC
_022365F0: .word 0x00001150
_022365F4: .word ov74_022364C0
_022365F8: .word 0x0000117C
	thumb_func_end ov74_022365AC

	thumb_func_start ov74_022365FC
ov74_022365FC: ; 0x022365FC
	push {r3, lr}
	ldr r0, _02236618 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _0223661C ; =0x00001150
	ldr r0, [r1, r0]
	cmp r0, #1
	bne _02236610
	bl ov74_022365AC
	pop {r3, pc}
_02236610:
	bl ov74_02236620
	pop {r3, pc}
	nop
_02236618: .word ov74_0223E2FC
_0223661C: .word 0x00001150
	thumb_func_end ov74_022365FC

	thumb_func_start ov74_02236620
ov74_02236620: ; 0x02236620
	push {r3, lr}
	mov r0, #3
	bl ov74_02236168
	ldr r0, _02236640 ; =ov74_02236644
	bl WM_Reset
	cmp r0, #2
	beq _0223663A
	bl ov74_022361B8
	mov r0, #0
	pop {r3, pc}
_0223663A:
	mov r0, #1
	pop {r3, pc}
	nop
_02236640: .word ov74_02236644
	thumb_func_end ov74_02236620

	thumb_func_start ov74_02236644
ov74_02236644: ; 0x02236644
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0223666C
	mov r0, #9
	bl ov74_02236168
	ldrh r0, [r4, #2]
	bl ov74_022361B8
	ldr r0, _02236678 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _0223667C ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02236676
	mov r0, #4
	blx r1
	pop {r4, pc}
_0223666C:
	mov r0, #1
	bl ov74_02236168
	bl ov74_022365AC
_02236676:
	pop {r4, pc}
	.balign 4, 0
_02236678: .word ov74_0223E2FC
_0223667C: .word 0x0000117C
	thumb_func_end ov74_02236644

	thumb_func_start ov74_02236680
ov74_02236680: ; 0x02236680
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r2, #0x1f
	mov r0, #0x1f
	bic r2, r0
	ldr r4, _022366DC ; =ov74_0223E2FC
	ldr r3, _022366E0 ; =0x00001150
	str r2, [r4]
	mov r0, #0
	str r0, [r2, r3]
	add r2, r3, #0
	ldr r5, [r4]
	mov r6, #1
	add r2, #8
	strh r6, [r5, r2]
	add r2, r3, #0
	ldr r5, [r4]
	add r2, #0x28
	str r7, [r5, r2]
	add r2, r3, #0
	ldr r5, [r4]
	add r2, #0xc
	strh r0, [r5, r2]
	add r2, r3, #0
	ldr r5, [r4]
	add r2, #0xe
	strh r0, [r5, r2]
	add r2, r3, #0
	ldr r5, [r4]
	add r2, #0x2c
	str r1, [r5, r2]
	add r2, r3, #0
	ldr r5, [r4]
	mov r1, #0x10
	add r2, #0x26
	strh r1, [r5, r2]
	ldr r5, [r4]
	ldr r2, _022366E4 ; =0x00001048
	sub r1, #0x11
	str r0, [r5, r2]
	ldr r0, [r4]
	add r3, #0x1c
	str r1, [r0, r3]
	bl ov74_022364F0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022366DC: .word ov74_0223E2FC
_022366E0: .word 0x00001150
_022366E4: .word 0x00001048
	thumb_func_end ov74_02236680

	thumb_func_start ov74_022366E8
ov74_022366E8: ; 0x022366E8
	push {r4, r5, r6, lr}
	ldr r3, _02236758 ; =ov74_0223E2FC
	ldr r1, _0223675C ; =0x00001048
	ldr r2, [r3]
	mov r4, #0
	str r4, [r2, r1]
	ldr r1, [r3]
	ldr r2, _02236760 ; =0x00001158
	mov r4, #3
	strh r4, [r1, r2]
	ldrh r5, [r0]
	ldr r4, [r3]
	add r1, r2, #2
	strh r5, [r4, r1]
	ldr r4, [r0, #4]
	add r0, r2, #0
	ldr r1, [r3]
	add r0, #8
	str r4, [r1, r0]
	ldr r4, [r3]
	add r2, #8
	ldr r0, [r4, r2]
	mov r1, #0x68
	sub r0, r0, #1
	bl _u32_div_f
	ldr r2, _02236764 ; =0x0000115C
	add r0, r0, #1
	strh r0, [r4, r2]
	ldr r4, _02236758 ; =ov74_0223E2FC
	mov r0, #0
	ldr r3, [r4]
	add r1, r2, #2
	strh r0, [r3, r1]
	add r1, r2, #0
	ldr r3, [r4]
	add r1, #8
	str r0, [r3, r1]
	ldr r1, [r4]
	ldrh r2, [r1, r2]
	cmp r2, #0
	ble _02236754
	mov r2, #0x46
	lsl r2, r2, #6
	add r3, r2, #0
	add r6, r0, #0
	sub r3, #0x24
_02236746:
	add r1, r1, r0
	strb r6, [r1, r2]
	ldr r1, [r4]
	add r0, r0, #1
	ldrh r5, [r1, r3]
	cmp r0, r5
	blt _02236746
_02236754:
	pop {r4, r5, r6, pc}
	nop
_02236758: .word ov74_0223E2FC
_0223675C: .word 0x00001048
_02236760: .word 0x00001158
_02236764: .word 0x0000115C
	thumb_func_end ov74_022366E8

	thumb_func_start ov74_02236768
ov74_02236768: ; 0x02236768
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02236884 ; =ov74_0223E2FC
	ldrh r1, [r4]
	ldr r3, [r0]
	ldr r0, _02236888 ; =0x0000115A
	ldrh r2, [r3, r0]
	cmp r2, r1
	bne _02236784
	add r0, r0, #6
	ldr r1, [r3, r0]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _022367B0
_02236784:
	ldr r0, _02236884 ; =ov74_0223E2FC
	ldr r3, [r0]
	ldr r0, _0223688C ; =0x00001164
	ldr r2, [r3, r0]
	add r1, r2, #1
	str r1, [r3, r0]
	cmp r2, #0x10
	blo _022367AC
	add r0, r4, #0
	bl ov74_022366E8
	ldr r0, _02236884 ; =ov74_0223E2FC
	ldr r1, [r0]
	ldr r0, _02236890 ; =0x0000117C
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _022367B0
	mov r0, #5
	blx r1
	b _022367B0
_022367AC:
	mov r0, #0
	pop {r3, r4, r5, pc}
_022367B0:
	ldrh r3, [r4, #2]
	ldr r0, _02236894 ; =0x0000FFFF
	cmp r3, r0
	bne _022367D8
	ldr r1, _02236884 ; =ov74_0223E2FC
	add r4, #8
	ldr r2, [r1]
	mov r1, #0xfe
	lsl r1, r1, #4
	add r1, r2, r1
	add r0, r4, #0
	mov r2, #0x68
	bl MIi_CpuCopy32
	ldr r0, _02236884 ; =ov74_0223E2FC
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _02236898 ; =0x00001048
	str r2, [r1, r0]
	b _02236880
_022367D8:
	ldr r1, _02236884 ; =ov74_0223E2FC
	ldr r0, _0223689C ; =0x00001168
	ldr r2, [r1]
	str r3, [r2, r0]
	ldr r3, [r1]
	add r1, r0, #0
	sub r1, #0xc
	ldrh r2, [r4, #2]
	ldrh r1, [r3, r1]
	cmp r2, r1
	blo _02236800
	add r0, #0x14
	ldr r1, [r3, r0]
	cmp r1, #0
	beq _022367FA
	mov r0, #4
	blx r1
_022367FA:
	mov r0, #9
	bl ov74_02236168
_02236800:
	ldr r0, _02236884 ; =ov74_0223E2FC
	mov r2, #0x46
	ldr r1, [r0]
	lsl r2, r2, #6
	ldrh r3, [r4, #2]
	add r5, r1, r2
	ldrb r1, [r5, r3]
	cmp r1, #0
	bne _02236880
	mov r1, #1
	strb r1, [r5, r3]
	ldr r5, [r0]
	add r0, r2, #0
	sub r0, #0x24
	ldrh r0, [r5, r0]
	ldrh r1, [r4, #2]
	sub r0, r0, #1
	cmp r1, r0
	bne _02236844
	add r3, r1, #0
	add r1, r2, #0
	sub r1, #8
	sub r2, #0x20
	mov r0, #0x68
	ldr r1, [r5, r1]
	mul r3, r0
	ldr r2, [r5, r2]
	add r4, #8
	add r0, r4, #0
	add r1, r1, r3
	sub r2, r2, r3
	bl MIi_CpuCopy32
	b _02236858
_02236844:
	add r4, #8
	sub r2, #8
	add r0, r4, #0
	ldr r4, [r5, r2]
	mov r2, #0x68
	add r3, r1, #0
	mul r3, r2
	add r1, r4, r3
	bl MIi_CpuCopy32
_02236858:
	ldr r1, _02236884 ; =ov74_0223E2FC
	ldr r0, _022368A0 ; =0x0000115E
	ldr r3, [r1]
	ldrh r2, [r3, r0]
	add r2, r2, #1
	strh r2, [r3, r0]
	ldr r3, [r1]
	sub r1, r0, #2
	ldrh r2, [r3, r0]
	ldrh r1, [r3, r1]
	cmp r2, r1
	bne _02236880
	add r0, #0x1e
	ldr r1, [r3, r0]
	cmp r1, #0
	beq _0223687C
	mov r0, #2
	blx r1
_0223687C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02236880:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236884: .word ov74_0223E2FC
_02236888: .word 0x0000115A
_0223688C: .word 0x00001164
_02236890: .word 0x0000117C
_02236894: .word 0x0000FFFF
_02236898: .word 0x00001048
_0223689C: .word 0x00001168
_022368A0: .word 0x0000115E
	thumb_func_end ov74_02236768

	thumb_func_start ov74_022368A4
ov74_022368A4: ; 0x022368A4
	push {r3, r4}
	mov r2, #0
	add r3, r2, #0
	lsr r1, r1, #1
	beq _022368CC
_022368AE:
	lsl r4, r3, #1
	ldrh r4, [r0, r4]
	add r3, r3, #1
	lsl r3, r3, #0x10
	add r2, r2, r4
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	lsl r4, r2, #1
	asr r2, r2, #0xf
	orr r2, r4
	lsl r2, r2, #0x10
	lsr r3, r3, #0x10
	lsr r2, r2, #0x10
	cmp r3, r1
	blo _022368AE
_022368CC:
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov74_022368A4

	thumb_func_start ov74_022368D4
ov74_022368D4: ; 0x022368D4
	push {r4, lr}
	sub sp, #8
	ldr r0, _02236968 ; =ov74_0223E2FC
	add r1, sp, #0
	ldr r4, [r0]
	ldr r0, _0223696C ; =0x00001170
	add r3, r4, r0
	ldrh r2, [r3]
	sub r0, #0x16
	strh r2, [r1]
	ldrh r2, [r3, #2]
	strh r2, [r1, #6]
	ldrh r2, [r3, #4]
	add r3, sp, #0
	strh r2, [r1, #4]
	ldrh r0, [r4, r0]
	ldr r2, _02236970 ; =0x00003FA2
	strh r0, [r1, #2]
	mov r1, #0
_022368FA:
	ldrh r0, [r3]
	add r1, r1, #1
	eor r0, r2
	strh r0, [r3]
	ldrh r2, [r3]
	add r3, r3, #2
	cmp r1, #4
	blt _022368FA
	ldr r0, _02236968 ; =ov74_0223E2FC
	mov r2, #8
	ldr r1, [r0]
	ldr r0, _02236974 ; =0x0000104C
	add r0, r1, r0
	add r1, sp, #0
	bl CRYPTO_RC4Init
	ldr r0, _02236968 ; =ov74_0223E2FC
	ldr r2, _02236978 ; =0x00001178
	ldr r3, [r0]
	ldr r0, _02236974 ; =0x0000104C
	ldr r1, [r3, r2]
	sub r2, #0x18
	ldr r2, [r3, r2]
	add r0, r3, r0
	add r3, r1, #0
	bl CRYPTO_RC4Encrypt
	ldr r1, _02236968 ; =ov74_0223E2FC
	ldr r2, _02236974 ; =0x0000104C
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, r2
	lsr r2, r2, #4
	bl MIi_CpuClear32
	ldr r0, _02236968 ; =ov74_0223E2FC
	ldr r1, _02236978 ; =0x00001178
	ldr r2, [r0]
	ldr r0, [r2, r1]
	sub r1, #0x18
	ldr r1, [r2, r1]
	bl ov74_022368A4
	ldr r1, _02236968 ; =ov74_0223E2FC
	ldr r2, [r1]
	ldr r1, _0223697C ; =0x0000115A
	ldrh r1, [r2, r1]
	cmp r1, r0
	bne _02236962
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_02236962:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02236968: .word ov74_0223E2FC
_0223696C: .word 0x00001170
_02236970: .word 0x00003FA2
_02236974: .word 0x0000104C
_02236978: .word 0x00001178
_0223697C: .word 0x0000115A
	thumb_func_end ov74_022368D4

	thumb_func_start ov74_02236980
ov74_02236980: ; 0x02236980
	ldr r0, _02236984 ; =0x000016A0
	bx lr
	.balign 4, 0
_02236984: .word 0x000016A0
	thumb_func_end ov74_02236980

	thumb_func_start ov74_02236988
ov74_02236988: ; 0x02236988
	ldr r0, _022369A0 ; =ov74_0223E2FC
	ldr r2, [r0]
	ldr r0, _022369A4 ; =0x00001048
	ldr r1, [r2, r0]
	cmp r1, #0
	beq _0223699A
	sub r0, #0x68
	add r0, r2, r0
	bx lr
_0223699A:
	mov r0, #0
	bx lr
	nop
_022369A0: .word ov74_0223E2FC
_022369A4: .word 0x00001048
	thumb_func_end ov74_02236988

	thumb_func_start ov74_022369A8
ov74_022369A8: ; 0x022369A8
	push {r3, lr}
	add r1, #0x24
	mov r0, #0x1f
	bic r1, r0
	add r1, #0x20
	mov r0, #0x54
	bl AllocFromHeap
	add r2, r0, #0
	add r2, #0x20
	mov r1, #0x1f
	bic r2, r1
	sub r1, r2, #4
	str r0, [r1]
	add r0, r2, #0
	pop {r3, pc}
	thumb_func_end ov74_022369A8

	thumb_func_start ov74_022369C8
ov74_022369C8: ; 0x022369C8
	push {r3, lr}
	cmp r1, #0
	beq _022369D6
	sub r0, r1, #4
	ldr r0, [r0]
	bl FreeToHeap
_022369D6:
	pop {r3, pc}
	thumb_func_end ov74_022369C8

	thumb_func_start ov74_022369D8
ov74_022369D8: ; 0x022369D8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, sp, #0
	add r1, sp, #4
	bl ov00_021EC11C
	ldr r0, [sp]
	ldr r1, [sp, #4]
	neg r0, r0
	bl ov00_021E6A70
	ldr r2, _02236A20 ; =0x0000266C
	str r0, [r4, r2]
	ldr r0, [sp]
	neg r1, r0
	add r0, r2, #4
	str r1, [r4, r0]
	add r0, r2, #0
	ldr r1, [sp, #4]
	add r0, #8
	str r1, [r4, r0]
	sub r0, r2, #4
	mov r1, #1
	str r1, [r4, r0]
	ldr r0, _02236A24 ; =ov74_0223E304
	add r2, #0x10
	str r1, [r0, #0x10]
	mov r1, #0
	add r0, r4, #0
	str r1, [r4, r2]
	bl ov74_02229E60
	ldr r0, _02236A28 ; =0x0000100F
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02236A20: .word 0x0000266C
_02236A24: .word ov74_0223E304
_02236A28: .word 0x0000100F
	thumb_func_end ov74_022369D8

	thumb_func_start ov74_02236A2C
ov74_02236A2C: ; 0x02236A2C
	push {lr}
	sub sp, #0x3c
	bl ov00_021EC724
	cmp r0, #4
	beq _02236A40
	cmp r0, #7
	beq _02236A4C
	cmp r0, #8
	b _02236A4C
_02236A40:
	add r0, sp, #0
	bl ov00_021EC9E0
	add sp, #0x3c
	mov r0, #1
	pop {pc}
_02236A4C:
	mov r0, #0
	add sp, #0x3c
	pop {pc}
	.balign 4, 0
	thumb_func_end ov74_02236A2C

	thumb_func_start ov74_02236A54
ov74_02236A54: ; 0x02236A54
	push {r3, r4}
	ldr r3, _02236A6C ; =ov74_0223E304
	mov r4, #0
	str r4, [r3]
	str r4, [r3, #0xc]
	ldr r3, _02236A70 ; =0x00001650
	str r2, [r0, r3]
	ldr r0, _02236A74 ; =0x00001012
	str r0, [r1]
	pop {r3, r4}
	bx lr
	nop
_02236A6C: .word ov74_0223E304
_02236A70: .word 0x00001650
_02236A74: .word 0x00001012
	thumb_func_end ov74_02236A54

	thumb_func_start ov74_02236A78
ov74_02236A78: ; 0x02236A78
	push {r3, r4, r5, lr}
	add r4, r2, #0
	ldr r2, _02236A9C ; =ov74_0223E304
	mov r5, #0
	str r5, [r2, #4]
	str r1, [r2, #8]
	ldr r1, _02236AA0 ; =0x00001650
	str r3, [r0, r1]
	ldr r0, _02236AA4 ; =0x00001013
	str r0, [r4]
	ldr r0, _02236AA8 ; =ov74_02236ABC
	bl ov00_021ED308
	cmp r0, #0
	bne _02236A9A
	ldr r0, [sp, #0x10]
	str r0, [r4]
_02236A9A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236A9C: .word ov74_0223E304
_02236AA0: .word 0x00001650
_02236AA4: .word 0x00001013
_02236AA8: .word ov74_02236ABC
	thumb_func_end ov74_02236A78

	thumb_func_start ov74_02236AAC
ov74_02236AAC: ; 0x02236AAC
	ldr r0, _02236AB8 ; =ov74_0223E304
	mov r2, #1
	str r2, [r0]
	str r1, [r0, #0xc]
	bx lr
	nop
_02236AB8: .word ov74_0223E304
	thumb_func_end ov74_02236AAC

	thumb_func_start ov74_02236ABC
ov74_02236ABC: ; 0x02236ABC
	ldr r0, _02236AC4 ; =ov74_0223E304
	mov r1, #1
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
_02236AC4: .word ov74_0223E304
	thumb_func_end ov74_02236ABC

	thumb_func_start ov74_02236AC8
ov74_02236AC8: ; 0x02236AC8
	push {r3, lr}
	bl sub_0203A914
	bl sub_020394F4
	bl UnloadOVY38
	bl UnloadDwcOverlay
	bl sub_02034DE0
	pop {r3, pc}
	thumb_func_end ov74_02236AC8

	thumb_func_start ov74_02236AE0
ov74_02236AE0: ; 0x02236AE0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _02236DE8 ; =0x0000267C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02236B00
	blx r0
	cmp r0, #1
	bne _02236B00
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
_02236B00:
	mov r3, #1
	ldr r0, [r5]
	lsl r3, r3, #0xc
	sub r0, r0, r3
	cmp r0, #0x13
	bls _02236B0E
	b _02236F0A
_02236B0E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236B1A: ; jump table
	.short _02236B42 - _02236B1A - 2 ; case 0
	.short _02236B5A - _02236B1A - 2 ; case 1
	.short _02236B76 - _02236B1A - 2 ; case 2
	.short _02236B9E - _02236B1A - 2 ; case 3
	.short _02236BE8 - _02236B1A - 2 ; case 4
	.short _02236C00 - _02236B1A - 2 ; case 5
	.short _02236C46 - _02236B1A - 2 ; case 6
	.short _02236C6A - _02236B1A - 2 ; case 7
	.short _02236CA0 - _02236B1A - 2 ; case 8
	.short _02236CC2 - _02236B1A - 2 ; case 9
	.short _02236CFE - _02236B1A - 2 ; case 10
	.short _02236D24 - _02236B1A - 2 ; case 11
	.short _02236DAA - _02236B1A - 2 ; case 12
	.short _02236DC8 - _02236B1A - 2 ; case 13
	.short _02236F0A - _02236B1A - 2 ; case 14
	.short _02236DE2 - _02236B1A - 2 ; case 15
	.short _02236E94 - _02236B1A - 2 ; case 16
	.short _02236E8A - _02236B1A - 2 ; case 17
	.short _02236EB0 - _02236B1A - 2 ; case 18
	.short _02236EE6 - _02236B1A - 2 ; case 19
_02236B42:
	bl sub_02034D8C
	bl LoadDwcOverlay
	bl LoadOVY38
	mov r0, #3
	bl sub_02039FD8
	ldr r0, _02236DEC ; =0x00001001
	str r0, [r5]
	b _02236F0A
_02236B5A:
	bl sub_02034DB8
	cmp r0, #0
	beq _02236C3E
	ldr r0, _02236DF0 ; =ov74_022369A8
	ldr r1, _02236DF4 ; =ov74_022369C8
	bl ov00_021EC294
	ldr r0, [r4, #4]
	bl sub_020394A0
	ldr r0, _02236DF8 ; =0x00001002
	str r0, [r5]
	b _02236F0A
_02236B76:
	ldr r0, _02236DFC ; =0x000015E8
	mov r1, #2
	add r0, r4, r0
	mov r2, #1
	mov r3, #0x14
	bl ov00_021EC3F0
	mov r0, #2
	bl ov00_021EC454
	bl ov00_021EC4A4
	bl sub_0203A880
	ldr r0, _02236E00 ; =0x00001003
	mov r1, #0
	str r0, [r5]
	ldr r0, _02236E04 ; =0x00002678
	str r1, [r4, r0]
	b _02236F0A
_02236B9E:
	bl ov00_021EC60C
	bl ov00_021EC5B4
	cmp r0, #0
	beq _02236BD6
	add r0, r4, #0
	bl ov74_02236A2C
	cmp r0, #1
	bne _02236BCE
	ldr r0, _02236E04 ; =0x00002678
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02236BC8
	ldr r0, _02236E08 ; =ov74_0223E304
	mov r1, #3
	str r1, [r0, #8]
	ldr r0, _02236E0C ; =0x0000100D
	str r0, [r5]
	b _02236BD6
_02236BC8:
	ldr r0, _02236E10 ; =0x00001004
	str r0, [r5]
	b _02236BD6
_02236BCE:
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
_02236BD6:
	ldr r0, _02236E14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02236C3E
	ldr r0, _02236E04 ; =0x00002678
	mov r1, #1
	str r1, [r4, r0]
	b _02236F0A
_02236BE8:
	bl ov00_021ECD04
	cmp r0, #0
	bne _02236BFA
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236BFA:
	ldr r0, _02236E18 ; =0x00001005
	str r0, [r5]
	b _02236F0A
_02236C00:
	bl ov00_021ECDC8
	cmp r0, #3
	bne _02236C14
	ldr r0, _02236E1C ; =0x00001006
	ldr r1, _02236E20 ; =ov00_021ECB40
	str r0, [r5]
	ldr r0, _02236DE8 ; =0x0000267C
	str r1, [r4, r0]
	b _02236C34
_02236C14:
	cmp r0, #4
	bne _02236C26
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	bl ov00_021EC8D8
	b _02236C34
_02236C26:
	cmp r0, #5
	bne _02236C34
	ldr r0, _02236E08 ; =ov74_0223E304
	mov r1, #3
	str r1, [r0, #8]
	ldr r0, _02236E0C ; =0x0000100D
	str r0, [r5]
_02236C34:
	ldr r0, _02236E14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	bne _02236C40
_02236C3E:
	b _02236F0A
_02236C40:
	bl ov00_021ECEC0
	b _02236F0A
_02236C46:
	ldr r0, _02236E24 ; =ov74_02236AAC
	ldr r1, _02236E28 ; =ov74_0223D038
	ldr r2, _02236E2C ; =ov74_0223D040
	bl ov00_021ED1F0
	cmp r0, #0
	bne _02236C5E
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236C5E:
	ldr r2, _02236E30 ; =0x00001007
	add r0, r4, #0
	add r1, r5, #0
	bl ov74_02236A54
	b _02236F0A
_02236C6A:
	ldr r0, _02236E04 ; =0x00002678
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02236C82
	add r3, #0xc
	add r0, r4, #0
	mov r1, #3
	add r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236C82:
	ldr r0, _02236E34 ; =ov74_0223D054
	add r1, r0, #0
	add r2, r0, #0
	bl ov00_021ED354
	cmp r0, #0
	bne _02236C9A
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236C9A:
	ldr r0, _02236E38 ; =0x00001008
	str r0, [r5]
	b _02236F0A
_02236CA0:
	ldr r0, _02236E3C ; =0x00001654
	add r0, r4, r0
	bl ov00_021ED388
	cmp r0, #0
	bne _02236CB6
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236CB6:
	ldr r2, _02236E40 ; =0x00001009
	add r0, r4, #0
	add r1, r5, #0
	bl ov74_02236A54
	b _02236F0A
_02236CC2:
	ldr r0, _02236E3C ; =0x00001654
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _02236CDA
	add r3, #0xd
	add r0, r4, #0
	mov r1, #2
	add r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236CDA:
	ldr r0, _02236E44 ; =ov74_0223E318
	mov r1, #0
	mov r2, #0xa
	bl ov00_021ED3AC
	cmp r0, #0
	bne _02236CF2
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236CF2:
	ldr r2, _02236E48 ; =0x0000100A
	add r0, r4, #0
	add r1, r5, #0
	bl ov74_02236A54
	b _02236F0A
_02236CFE:
	ldr r1, _02236E4C ; =0x00001658
	ldr r0, _02236E44 ; =ov74_0223E318
	add r1, r4, r1
	add r2, r3, #0
	bl ov00_021ED3F4
	cmp r0, #0
	bne _02236D18
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236D18:
	ldr r0, _02236E50 ; =0x0000100B
	mov r1, #0
	str r0, [r5]
	ldr r0, _02236E54 ; =0x00002664
	str r1, [r4, r0]
	b _02236F0A
_02236D24:
	ldr r0, _02236E08 ; =ov74_0223E304
	ldr r1, [r0]
	cmp r1, #0
	bne _02236D72
	ldr r0, _02236E14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02236D46
	add r3, #0xc
	add r0, r4, #0
	mov r1, #3
	add r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236D46:
	ldr r1, _02236E58 ; =0x0000265C
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	bl ov00_021ED444
	cmp r0, #1
	bne _02236DD0
	ldr r1, _02236E58 ; =0x0000265C
	mov r0, #0x64
	ldr r2, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mul r0, r2
	bl _u32_div_f
	ldr r1, _02236E54 ; =0x00002664
	ldr r2, [r4, r1]
	cmp r2, r0
	beq _02236DD0
	str r0, [r4, r1]
	b _02236F0A
_02236D72:
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _02236D82
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236D82:
	ldr r0, _02236E04 ; =0x00002678
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02236D9A
	add r3, #0xd
	add r0, r4, #0
	mov r1, #1
	add r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236D9A:
	add r3, #0xd
	add r0, r4, #0
	mov r1, #3
	add r2, r5, #0
	str r3, [sp]
	bl ov74_02236A78
	b _02236F0A
_02236DAA:
	bl ov00_021ED428
	cmp r0, #0
	bne _02236DB8
	ldr r0, _02236E0C ; =0x0000100D
	str r0, [r5]
	b _02236F0A
_02236DB8:
	ldr r0, _02236DE8 ; =0x0000267C
	mov r1, #0
	str r1, [r4, r0]
	bl ov74_02236AC8
	ldr r0, _02236E08 ; =ov74_0223E304
	ldr r0, [r0, #8]
	pop {r3, r4, r5, pc}
_02236DC8:
	bl ov00_021EC938
	cmp r0, #1
	beq _02236DD2
_02236DD0:
	b _02236F0A
_02236DD2:
	ldr r0, _02236DE8 ; =0x0000267C
	mov r1, #0
	str r1, [r4, r0]
	bl ov74_02236AC8
	ldr r0, _02236E08 ; =ov74_0223E304
	ldr r0, [r0, #8]
	pop {r3, r4, r5, pc}
_02236DE2:
	ldr r0, _02236E08 ; =ov74_0223E304
	b _02236E5C
	nop
_02236DE8: .word 0x0000267C
_02236DEC: .word 0x00001001
_02236DF0: .word ov74_022369A8
_02236DF4: .word ov74_022369C8
_02236DF8: .word 0x00001002
_02236DFC: .word 0x000015E8
_02236E00: .word 0x00001003
_02236E04: .word 0x00002678
_02236E08: .word ov74_0223E304
_02236E0C: .word 0x0000100D
_02236E10: .word 0x00001004
_02236E14: .word gSystem
_02236E18: .word 0x00001005
_02236E1C: .word 0x00001006
_02236E20: .word ov00_021ECB40
_02236E24: .word ov74_02236AAC
_02236E28: .word ov74_0223D038
_02236E2C: .word ov74_0223D040
_02236E30: .word 0x00001007
_02236E34: .word ov74_0223D054
_02236E38: .word 0x00001008
_02236E3C: .word 0x00001654
_02236E40: .word 0x00001009
_02236E44: .word ov74_0223E318
_02236E48: .word 0x0000100A
_02236E4C: .word 0x00001658
_02236E50: .word 0x0000100B
_02236E54: .word 0x00002664
_02236E58: .word 0x0000265C
_02236E5C:
	ldr r0, [r0, #0x10]
	cmp r0, #1
	bne _02236F0A
	add r0, r4, #0
	bl ov74_0222ACD8
	ldr r0, _02236F10 ; =0x00002674
	ldr r0, [r4, r0]
	sub r0, r0, #5
	cmp r0, #1
	bhi _02236E84
	ldr r3, _02236F14 ; =0x00001010
	add r0, r4, #0
	str r3, [sp]
	mov r1, #3
	add r2, r5, #0
	add r3, r3, #1
	bl ov74_02236A78
	b _02236F0A
_02236E84:
	ldr r0, _02236F18 ; =0x00001011
	str r0, [r5]
	b _02236F0A
_02236E8A:
	bl ov00_021EC8D8
	ldr r0, _02236F14 ; =0x00001010
	str r0, [r5]
	b _02236F0A
_02236E94:
	ldr r0, _02236F1C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02236F0A
	ldr r0, _02236F20 ; =0x0000267C
	mov r1, #0
	str r1, [r4, r0]
	bl ov00_021EC210
	bl ov74_02236AC8
	mov r0, #4
	pop {r3, r4, r5, pc}
_02236EB0:
	ldr r0, _02236F24 ; =ov74_0223E304
	ldr r1, [r0]
	cmp r1, #1
	bne _02236ED4
	mov r1, #0
	str r1, [r0]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _02236ECC
	add r0, r4, #0
	bl ov74_022369D8
	str r0, [r5]
	b _02236F0A
_02236ECC:
	ldr r0, _02236F28 ; =0x00001650
	ldr r0, [r4, r0]
	str r0, [r5]
	b _02236F0A
_02236ED4:
	ldr r0, _02236F1C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02236F0A
	ldr r0, _02236F2C ; =0x00002678
	mov r1, #1
	str r1, [r4, r0]
	b _02236F0A
_02236EE6:
	ldr r0, _02236F24 ; =ov74_0223E304
	ldr r1, [r0, #4]
	cmp r1, #1
	bne _02236EFA
	mov r1, #0
	str r1, [r0, #4]
	ldr r0, _02236F28 ; =0x00001650
	ldr r0, [r4, r0]
	str r0, [r5]
	b _02236F0A
_02236EFA:
	ldr r0, _02236F1C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02236F0A
	ldr r0, _02236F2C ; =0x00002678
	mov r1, #1
	str r1, [r4, r0]
_02236F0A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02236F10: .word 0x00002674
_02236F14: .word 0x00001010
_02236F18: .word 0x00001011
_02236F1C: .word gSystem
_02236F20: .word 0x0000267C
_02236F24: .word ov74_0223E304
_02236F28: .word 0x00001650
_02236F2C: .word 0x00002678
	thumb_func_end ov74_02236AE0

	thumb_func_start ov74_02236F30
ov74_02236F30: ; 0x02236F30
	cmp r0, #1
	bne _02236F38
	mov r0, #1
	b _02236F3A
_02236F38:
	ldr r0, _02236F40 ; =0x000001DE
_02236F3A:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	.balign 4, 0
_02236F40: .word 0x000001DE
	thumb_func_end ov74_02236F30

	thumb_func_start ov74_02236F44
ov74_02236F44: ; 0x02236F44
	cmp r0, #7
	bhi _02236F64
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236F54: ; jump table
	.short _02236F64 - _02236F54 - 2 ; case 0
	.short _02236F64 - _02236F54 - 2 ; case 1
	.short _02236F68 - _02236F54 - 2 ; case 2
	.short _02236F6E - _02236F54 - 2 ; case 3
	.short _02236F68 - _02236F54 - 2 ; case 4
	.short _02236F72 - _02236F54 - 2 ; case 5
	.short _02236F64 - _02236F54 - 2 ; case 6
	.short _02236F68 - _02236F54 - 2 ; case 7
_02236F64:
	mov r0, #0xea
	bx lr
_02236F68:
	mov r0, #0x6d
	lsl r0, r0, #2
	bx lr
_02236F6E:
	ldr r0, _02236F78 ; =0x000001B7
	bx lr
_02236F72:
	ldr r0, _02236F7C ; =0x000001B6
	bx lr
	nop
_02236F78: .word 0x000001B7
_02236F7C: .word 0x000001B6
	thumb_func_end ov74_02236F44

	thumb_func_start ov74_02236F80
ov74_02236F80: ; 0x02236F80
	cmp r0, #7
	bhi _02236FA0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236F90: ; jump table
	.short _02236FA0 - _02236F90 - 2 ; case 0
	.short _02236FA0 - _02236F90 - 2 ; case 1
	.short _02236FA4 - _02236F90 - 2 ; case 2
	.short _02236FA8 - _02236F90 - 2 ; case 3
	.short _02236FA4 - _02236F90 - 2 ; case 4
	.short _02236FAE - _02236F90 - 2 ; case 5
	.short _02236FA0 - _02236F90 - 2 ; case 6
	.short _02236FA4 - _02236F90 - 2 ; case 7
_02236FA0:
	mov r0, #0xeb
	bx lr
_02236FA4:
	ldr r0, _02236FB4 ; =0x000001B5
	bx lr
_02236FA8:
	mov r0, #0x6e
	lsl r0, r0, #2
	bx lr
_02236FAE:
	mov r0, #0x6d
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
_02236FB4: .word 0x000001B5
	thumb_func_end ov74_02236F80

	thumb_func_start ConvertRSStringToDPStringInternational
ConvertRSStringToDPStringInternational: ; 0x02236FB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r3, #0
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	cmp r5, #1
	beq _02236FCC
	mov r2, #1
	b _02236FCE
_02236FCC:
	mov r2, #0
_02236FCE:
	ldr r0, [sp, #8]
	mov r6, #0
	sub r0, r0, #1
	str r0, [sp, #0xc]
	beq _02237056
	ldr r1, _02237064 ; =_0223B760
	lsl r0, r2, #1
	ldr r4, [sp, #4]
	add r7, r1, r0
_02236FE0:
	ldr r0, [sp]
	ldrb r0, [r0, r6]
	cmp r0, #0xff
	beq _02237056
	cmp r0, #0xf7
	blo _0223701A
	ldr r0, [sp, #8]
	sub r3, r0, #1
	cmp r3, #0xa
	blo _02236FF6
	mov r3, #0xa
_02236FF6:
	mov r1, #0
	cmp r3, #0
	ble _0223700C
	mov r0, #0x6b
	ldr r2, [sp, #4]
	lsl r0, r0, #2
_02237002:
	add r1, r1, #1
	strh r0, [r2]
	add r2, r2, #2
	cmp r1, r3
	blt _02237002
_0223700C:
	ldr r0, [sp, #4]
	ldr r2, _02237068 ; =0x0000FFFF
	lsl r1, r1, #1
	strh r2, [r0, r1]
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223701A:
	lsl r0, r0, #2
	ldrh r0, [r7, r0]
	cmp r0, #1
	beq _0223702C
	cmp r0, #0xea
	beq _02237036
	cmp r0, #0xeb
	beq _02237040
	b _0223704A
_0223702C:
	add r0, r5, #0
	bl ov74_02236F30
	strh r0, [r4]
	b _0223704C
_02237036:
	add r0, r5, #0
	bl ov74_02236F44
	strh r0, [r4]
	b _0223704C
_02237040:
	add r0, r5, #0
	bl ov74_02236F80
	strh r0, [r4]
	b _0223704C
_0223704A:
	strh r0, [r4]
_0223704C:
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, r0
	blo _02236FE0
_02237056:
	ldr r2, _02237068 ; =0x0000FFFF
	ldr r0, [sp, #4]
	lsl r1, r6, #1
	strh r2, [r0, r1]
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02237064: .word _0223B760
_02237068: .word 0x0000FFFF
	thumb_func_end ConvertRSStringToDPStringInternational

	.rodata

_0223B2C0:
	.byte 0x06, 0x22, 0xDE, 0xFA, 0x9E, 0xBA, 0xDE, 0xFA, 0xFF, 0x00, 0x00, 0x00
_0223B2CC:
	.byte 0x70, 0x88, 0x20, 0xE0
	.byte 0x98, 0xB0, 0x20, 0xE0, 0xFF, 0x00, 0x00, 0x00
_0223B2D8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B2E8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

	.public gApp_MainMenu
gApp_MainMenu:
	.word ov74_MainMenu_AppInit, ov74_MainMenu_AppExec, ov74_MainMenu_AppExit, 0xFFFFFFFF
gApp_MainMenu_SelectOption_ConnectToRanger:
	.word ov74_02229200, ov74_02229294, ov74_02229450, 0xFFFFFFFF
_0223B330:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B340:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_0223B368:
	.word ov74_02229DA0
	.word ov74_02229DCC
	.word ov74_02229DD4
	.word ov74_02229DE0
	.word sub_020342C0
	.word 0
gApp_MainMenu_SelectOption_MysteryGift:
	.word ov74_0222AE6C, ov74_0222C2EC, ov74_0222CD94, 0xFFFFFFFF
_0223B390:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B3A0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B3BC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00
	.byte 0x96, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00
	.byte 0xD2, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00
_0223B410:
	.word ov74_0222DDFC, ov74_0222E1F4, ov74_0222EB44, 0xFFFFFFFF
_0223B420:
	.word ov74_0222F598, ov74_0222F7D4, ov74_0222FB8C, 0xFFFFFFFF
_0223B430:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B440:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x03, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B45C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B478:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_0223B494:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B4B0:
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
gApp_MainMenu_SelectOption_MigrateFromAgb:
	.word ov74_02233230, ov74_022332F4, ov74_022338D4, 0xFFFFFFFF
_0223B4E8:
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00
_0223B4F8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B508:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_0223B524:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B540:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B55C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B578:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
sPmAgbRomCodeMappings:
	; Ruby
	.balign 4, 0
	.ascii "AXVJ"
	.byte 0x00, 0x00
	.short LANGUAGE_JAPANESE
	.balign 4, 0
	.ascii "AXVE"
	.byte 0x00, 0x00
	.short LANGUAGE_ENGLISH
	.balign 4, 0
	.ascii "AXVF"
	.byte 0x00, 0x00
	.short LANGUAGE_FRENCH
	.balign 4, 0
	.ascii "AXVD"
	.byte 0x00, 0x00
	.short LANGUAGE_GERMAN
	.balign 4, 0
	.ascii "AXVS"
	.byte 0x00, 0x00
	.short LANGUAGE_SPANISH
	.balign 4, 0
	.ascii "AXVI"
	.byte 0x00, 0x00
	.short LANGUAGE_ITALIAN

	; Sapphire
	.balign 4, 0
	.ascii "AXPJ"
	.byte 0x00, 0x01
	.short LANGUAGE_JAPANESE
	.balign 4, 0
	.ascii "AXPE"
	.byte 0x00, 0x01
	.short LANGUAGE_ENGLISH
	.balign 4, 0
	.ascii "AXPF"
	.byte 0x00, 0x01
	.short LANGUAGE_FRENCH
	.balign 4, 0
	.ascii "AXPD"
	.byte 0x00, 0x01
	.short LANGUAGE_GERMAN
	.balign 4, 0
	.ascii "AXPS"
	.byte 0x00, 0x01
	.short LANGUAGE_SPANISH
	.balign 4, 0
	.ascii "AXPI"
	.byte 0x00, 0x01
	.short LANGUAGE_ITALIAN

	; FireRed
	.balign 4, 0
	.ascii "BPRJ"
	.byte 0x01, 0x03
	.short LANGUAGE_JAPANESE
	.balign 4, 0
	.ascii "BPRE"
	.byte 0x01, 0x03
	.short LANGUAGE_ENGLISH
	.balign 4, 0
	.ascii "BPRF"
	.byte 0x01, 0x03
	.short LANGUAGE_FRENCH
	.balign 4, 0
	.ascii "BPRD"
	.byte 0x01, 0x03
	.short LANGUAGE_GERMAN
	.balign 4, 0
	.ascii "BPRS"
	.byte 0x01, 0x03
	.short LANGUAGE_SPANISH
	.balign 4, 0
	.ascii "BPRI"
	.byte 0x01, 0x03
	.short LANGUAGE_ITALIAN

	; LeafGreen
	.balign 4, 0
	.ascii "BPGJ"
	.byte 0x01, 0x02
	.short LANGUAGE_JAPANESE
	.balign 4, 0
	.ascii "BPGE"
	.byte 0x01, 0x02
	.short LANGUAGE_ENGLISH
	.balign 4, 0
	.ascii "BPGF"
	.byte 0x01, 0x02
	.short LANGUAGE_FRENCH
	.balign 4, 0
	.ascii "BPGD"
	.byte 0x01, 0x02
	.short LANGUAGE_GERMAN
	.balign 4, 0
	.ascii "BPGS"
	.byte 0x01, 0x02
	.short LANGUAGE_SPANISH
	.balign 4, 0
	.ascii "BPGI"
	.byte 0x01, 0x02
	.short LANGUAGE_ITALIAN

	; Emerald
	.balign 4, 0
	.ascii "BPEJ"
	.byte 0x02, 0x04
	.short LANGUAGE_JAPANESE
	.balign 4, 0
	.ascii "BPEE"
	.byte 0x02, 0x04
	.short LANGUAGE_ENGLISH
	.balign 4, 0
	.ascii "BPEF"
	.byte 0x02, 0x04
	.short LANGUAGE_FRENCH
	.balign 4, 0
	.ascii "BPED"
	.byte 0x02, 0x04
	.short LANGUAGE_GERMAN
	.balign 4, 0
	.ascii "BPES"
	.byte 0x02, 0x04
	.short LANGUAGE_SPANISH
	.balign 4, 0
	.ascii "BPEI"
	.byte 0x02, 0x04
	.short LANGUAGE_ITALIAN
	.balign 4, 0
_0223B690:
	.byte 0xC8, 0x7E, 0x66, 0x71, 0x46, 0x0B, 0xE6, 0x6F, 0x17, 0x8A, 0x5C, 0x7D, 0xEA, 0xE1, 0x93, 0xFD
	.byte 0xEE, 0xFA, 0x99, 0x84, 0xFE, 0x35, 0x02, 0xB9, 0x7F, 0x4F, 0xF1, 0x19, 0x74, 0xA2, 0x0F, 0x65
	.byte 0x8A, 0x9C, 0x44, 0x81, 0x0C, 0x1F, 0x94, 0xE4, 0xC0, 0xB6, 0xD7, 0x20, 0xEE, 0x11, 0x9A, 0x8D
	.byte 0x27, 0x33, 0x9B, 0x7B, 0x02, 0xE9, 0x33, 0x11, 0xDC, 0xCF, 0x72, 0xD9, 0xA8, 0x78, 0x12, 0x8C
	.byte 0x3B, 0x60, 0xD5, 0x24, 0xB8, 0xD9, 0xFC, 0x8D, 0x15, 0xBA, 0x0B, 0x90, 0xA3, 0xBD, 0x3A, 0xE4
	.byte 0x01, 0x18, 0xBA, 0xF9, 0x65, 0xA5, 0x15, 0x37, 0xDC, 0x7A, 0x48, 0x5C, 0x3A, 0x55, 0x35, 0x43
	.byte 0xE2, 0xC6, 0x66, 0xBA, 0x21, 0xEA, 0x67, 0x2E, 0xA8, 0x29, 0x03, 0xD7, 0x1F, 0x0F, 0xC6, 0xDE
	.byte 0x1B, 0xE2, 0xA1, 0xCA, 0x21, 0x51, 0xFE, 0xB9, 0x68, 0x17, 0x3C, 0xEB, 0x04, 0x54, 0xE0, 0xBD
_0223B710:
	.byte 0x28, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B720:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0223B73C:
	.byte 0x00, 0x00, 0x01, 0x01
	.byte 0x02, 0x01, 0x03, 0x02, 0x04, 0x03, 0x05, 0x02, 0x06, 0x02, 0x07, 0x00, 0x08, 0x05, 0x09, 0x05
	.byte 0x0A, 0x05, 0x0B, 0x04, 0x0C, 0x05, 0x0D, 0x05, 0x0E, 0x02, 0x0F, 0x02, 0xFF, 0x00, 0x00, 0x00
_0223B760:
	.byte 0x01, 0x00, 0x01, 0x00, 0x03, 0x00, 0x03, 0x00, 0x05, 0x00, 0x05, 0x00, 0x07, 0x00, 0x07, 0x00
	.byte 0x09, 0x00, 0x09, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0E, 0x00
	.byte 0x10, 0x00, 0x10, 0x00, 0x12, 0x00, 0x12, 0x00, 0x14, 0x00, 0x14, 0x00, 0x16, 0x00, 0x16, 0x00
	.byte 0x18, 0x00, 0x18, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1E, 0x00, 0x1E, 0x00
	.byte 0x20, 0x00, 0x20, 0x00, 0x22, 0x00, 0x22, 0x00, 0x25, 0x00, 0x25, 0x00, 0x27, 0x00, 0x27, 0x00
	.byte 0x29, 0x00, 0x29, 0x00, 0x2B, 0x00, 0x2B, 0x00, 0x2C, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2D, 0x00
	.byte 0x2E, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x30, 0x00, 0x33, 0x00, 0x33, 0x00
	.byte 0x36, 0x00, 0x36, 0x00, 0x39, 0x00, 0x39, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x3F, 0x00, 0x3F, 0x00
	.byte 0x40, 0x00, 0x40, 0x00, 0x41, 0x00, 0x41, 0x00, 0x42, 0x00, 0x42, 0x00, 0x43, 0x00, 0x43, 0x00
	.byte 0x45, 0x00, 0x45, 0x00, 0x47, 0x00, 0x47, 0x00, 0x49, 0x00, 0x49, 0x00, 0x4A, 0x00, 0x4A, 0x00
	.byte 0x4B, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x4C, 0x00, 0x4D, 0x00, 0x4D, 0x00, 0x4E, 0x00, 0x4E, 0x00
	.byte 0x4F, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x50, 0x00, 0x51, 0x00, 0x51, 0x00, 0x02, 0x00, 0x02, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x06, 0x00, 0x06, 0x00, 0x08, 0x00, 0x08, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x44, 0x00, 0x44, 0x00, 0x46, 0x00, 0x46, 0x00, 0x48, 0x00, 0x48, 0x00, 0x0D, 0x00, 0x0D, 0x00
	.byte 0x0F, 0x00, 0x0F, 0x00, 0x11, 0x00, 0x11, 0x00, 0x13, 0x00, 0x13, 0x00, 0x15, 0x00, 0x15, 0x00
	.byte 0x17, 0x00, 0x17, 0x00, 0x19, 0x00, 0x19, 0x00, 0x1B, 0x00, 0x1B, 0x00, 0x1D, 0x00, 0x1D, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x21, 0x00, 0x21, 0x00, 0x23, 0x00, 0x23, 0x00, 0x26, 0x00, 0x26, 0x00
	.byte 0x28, 0x00, 0x28, 0x00, 0x2A, 0x00, 0x2A, 0x00, 0x31, 0x00, 0x31, 0x00, 0x34, 0x00, 0x34, 0x00
	.byte 0x37, 0x00, 0x37, 0x00, 0x3A, 0x00, 0x3A, 0x00, 0x3D, 0x00, 0x3D, 0x00, 0x32, 0x00, 0x32, 0x00
	.byte 0x35, 0x00, 0x35, 0x00, 0x38, 0x00, 0x38, 0x00, 0x3B, 0x00, 0x3B, 0x00, 0x3E, 0x00, 0x3E, 0x00
	.byte 0x24, 0x00, 0x24, 0x00, 0x53, 0x00, 0x53, 0x00, 0x55, 0x00, 0x55, 0x00, 0x57, 0x00, 0x57, 0x00
	.byte 0x59, 0x00, 0x59, 0x00, 0x5B, 0x00, 0x5B, 0x00, 0x5C, 0x00, 0x5C, 0x00, 0x5E, 0x00, 0x5E, 0x00
	.byte 0x60, 0x00, 0x60, 0x00, 0x62, 0x00, 0x62, 0x00, 0x64, 0x00, 0x64, 0x00, 0x66, 0x00, 0x66, 0x00
	.byte 0x68, 0x00, 0x68, 0x00, 0x6A, 0x00, 0x6A, 0x00, 0x6C, 0x00, 0x6C, 0x00, 0x6E, 0x00, 0x6E, 0x00
	.byte 0x70, 0x00, 0x70, 0x00, 0x72, 0x00, 0x72, 0x00, 0x75, 0x00, 0x75, 0x00, 0x77, 0x00, 0x77, 0x00
	.byte 0x79, 0x00, 0x79, 0x00, 0x7B, 0x00, 0x7B, 0x00, 0x7C, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7D, 0x00
	.byte 0x7E, 0x00, 0x7E, 0x00, 0x7F, 0x00, 0x7F, 0x00, 0x80, 0x00, 0x80, 0x00, 0x83, 0x00, 0x83, 0x00
	.byte 0x86, 0x00, 0x86, 0x00, 0x89, 0x00, 0x89, 0x00, 0x8C, 0x00, 0x8C, 0x00, 0x8F, 0x00, 0x8F, 0x00
	.byte 0x90, 0x00, 0x90, 0x00, 0x91, 0x00, 0x91, 0x00, 0x92, 0x00, 0x92, 0x00, 0x93, 0x00, 0x93, 0x00
	.byte 0x95, 0x00, 0x95, 0x00, 0x97, 0x00, 0x97, 0x00, 0x99, 0x00, 0x99, 0x00, 0x9A, 0x00, 0x9A, 0x00
	.byte 0x9B, 0x00, 0x9B, 0x00, 0x9C, 0x00, 0x9C, 0x00, 0x9D, 0x00, 0x9D, 0x00, 0x9E, 0x00, 0x9E, 0x00
	.byte 0x9F, 0x00, 0x9F, 0x00, 0xA0, 0x00, 0xA0, 0x00, 0xA1, 0x00, 0xA1, 0x00, 0x52, 0x00, 0x52, 0x00
	.byte 0x54, 0x00, 0x54, 0x00, 0x56, 0x00, 0x56, 0x00, 0x58, 0x00, 0x58, 0x00, 0x5A, 0x00, 0x5A, 0x00
	.byte 0x94, 0x00, 0x94, 0x00, 0x96, 0x00, 0x96, 0x00, 0x98, 0x00, 0x98, 0x00, 0x5D, 0x00, 0x5D, 0x00
	.byte 0x5F, 0x00, 0x5F, 0x00, 0x61, 0x00, 0x61, 0x00, 0x63, 0x00, 0x63, 0x00, 0x65, 0x00, 0x65, 0x00
	.byte 0x67, 0x00, 0x67, 0x00, 0x69, 0x00, 0x69, 0x00, 0x6B, 0x00, 0x6B, 0x00, 0x6D, 0x00, 0x6D, 0x00
	.byte 0x6F, 0x00, 0x6F, 0x00, 0x71, 0x00, 0x71, 0x00, 0x73, 0x00, 0x73, 0x00, 0x76, 0x00, 0x76, 0x00
	.byte 0x78, 0x00, 0x78, 0x00, 0x7A, 0x00, 0x7A, 0x00, 0x81, 0x00, 0x81, 0x00, 0x84, 0x00, 0x84, 0x00
	.byte 0x87, 0x00, 0x87, 0x00, 0x8A, 0x00, 0x8A, 0x00, 0x8D, 0x00, 0x8D, 0x00, 0x82, 0x00, 0x82, 0x00
	.byte 0x85, 0x00, 0x85, 0x00, 0x88, 0x00, 0x88, 0x00, 0x8B, 0x00, 0x8B, 0x00, 0x8E, 0x00, 0x8E, 0x00
	.byte 0x74, 0x00, 0x74, 0x00, 0xA2, 0x00, 0x21, 0x01, 0xA3, 0x00, 0x22, 0x01, 0xA4, 0x00, 0x23, 0x01
	.byte 0xA5, 0x00, 0x24, 0x01, 0xA6, 0x00, 0x25, 0x01, 0xA7, 0x00, 0x26, 0x01, 0xA8, 0x00, 0x27, 0x01
	.byte 0xA9, 0x00, 0x28, 0x01, 0xAA, 0x00, 0x29, 0x01, 0xAB, 0x00, 0x2A, 0x01, 0xE1, 0x00, 0xAB, 0x01
	.byte 0xE2, 0x00, 0xAC, 0x01, 0xE4, 0x00, 0xAE, 0x01, 0xF1, 0x00, 0xBE, 0x01, 0xE6, 0x00, 0xB0, 0x01
	.byte 0xE5, 0x00, 0xAF, 0x01, 0xEA, 0x00, 0xEA, 0x00, 0xEB, 0x00, 0xEB, 0x00, 0xE8, 0x00, 0xB2, 0x01
	.byte 0xE9, 0x00, 0xB3, 0x01, 0xEE, 0x00, 0xBB, 0x01, 0xEF, 0x00, 0xBC, 0x01, 0x12, 0x01, 0x12, 0x01
	.byte 0xE3, 0x00, 0xAD, 0x01, 0xF2, 0x00, 0x76, 0x01, 0xE7, 0x00, 0xB1, 0x01, 0xAC, 0x00, 0x2B, 0x01
	.byte 0xAD, 0x00, 0x2C, 0x01, 0xAE, 0x00, 0x2D, 0x01, 0xAF, 0x00, 0x2E, 0x01, 0xB0, 0x00, 0x2F, 0x01
	.byte 0xB1, 0x00, 0x30, 0x01, 0xB2, 0x00, 0x31, 0x01, 0xB3, 0x00, 0x32, 0x01, 0xB4, 0x00, 0x33, 0x01
	.byte 0xB5, 0x00, 0x34, 0x01, 0xB6, 0x00, 0x35, 0x01, 0xB7, 0x00, 0x36, 0x01, 0xB8, 0x00, 0x37, 0x01
	.byte 0xB9, 0x00, 0x38, 0x01, 0xBA, 0x00, 0x39, 0x01, 0xBB, 0x00, 0x3A, 0x01, 0xBC, 0x00, 0x3B, 0x01
	.byte 0xBD, 0x00, 0x3C, 0x01, 0xBE, 0x00, 0x3D, 0x01, 0xBF, 0x00, 0x3E, 0x01, 0xC0, 0x00, 0x3F, 0x01
	.byte 0xC1, 0x00, 0x40, 0x01, 0xC2, 0x00, 0x41, 0x01, 0xC3, 0x00, 0x42, 0x01, 0xC4, 0x00, 0x43, 0x01
	.byte 0xC5, 0x00, 0x44, 0x01, 0xC6, 0x00, 0x45, 0x01, 0xC7, 0x00, 0x46, 0x01, 0xC8, 0x00, 0x47, 0x01
	.byte 0xC9, 0x00, 0x48, 0x01, 0xCA, 0x00, 0x49, 0x01, 0xCB, 0x00, 0x4A, 0x01, 0xCC, 0x00, 0x4B, 0x01
	.byte 0xCD, 0x00, 0x4C, 0x01, 0xCE, 0x00, 0x4D, 0x01, 0xCF, 0x00, 0x4E, 0x01, 0xD0, 0x00, 0x4F, 0x01
	.byte 0xD1, 0x00, 0x50, 0x01, 0xD2, 0x00, 0x51, 0x01, 0xD3, 0x00, 0x52, 0x01, 0xD4, 0x00, 0x53, 0x01
	.byte 0xD5, 0x00, 0x54, 0x01, 0xD6, 0x00, 0x55, 0x01, 0xD7, 0x00, 0x56, 0x01, 0xD8, 0x00, 0x57, 0x01
	.byte 0xD9, 0x00, 0x58, 0x01, 0xDA, 0x00, 0x59, 0x01, 0xDB, 0x00, 0x5A, 0x01, 0xDC, 0x00, 0x5B, 0x01
	.byte 0xDD, 0x00, 0x5C, 0x01, 0xDE, 0x00, 0x5D, 0x01, 0xDF, 0x00, 0x5E, 0x01, 0x1F, 0x01, 0x1F, 0x01
	.byte 0xF6, 0x00, 0xC4, 0x01, 0x63, 0x01, 0x63, 0x01, 0x75, 0x01, 0x75, 0x01, 0x7B, 0x01, 0x7B, 0x01
	.byte 0x83, 0x01, 0x83, 0x01, 0x95, 0x01, 0x95, 0x01, 0x9B, 0x01, 0x9B, 0x01

	.data

_0223BBC0:
	.byte 0x00, 0x00, 0x00, 0x00

ov74_0223BBC4: ; 0x0223BBC4
	.word msg_0442_00013
	.word msg_0442_00014
	.word msg_0442_00016
	.word msg_0442_00015

ov74_0223BBD4: ; 0x0223BBD4
	.byte 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov74_0223BBF0: ; 0x0223BBF0
	.byte 0x81, 0x53, 0x83, 0x53, 0x85, 0x53, 0x87, 0x53, 0x89, 0x53, 0x8B, 0x53, 0x8D, 0x53, 0x8F, 0x53
	.byte 0x91, 0x53, 0x93, 0x53, 0x95, 0x53, 0x97, 0x53, 0x99, 0x53, 0x9B, 0x53, 0x9D, 0x53, 0x9F, 0x53
	.byte 0x9D, 0x53, 0x9B, 0x53, 0x99, 0x53, 0x97, 0x53, 0x95, 0x53, 0x93, 0x53, 0x91, 0x53, 0x8F, 0x53
	.byte 0x8D, 0x53, 0x8B, 0x53, 0x89, 0x53, 0x87, 0x53, 0x85, 0x53, 0x83, 0x53, 0x00, 0x00, 0x00, 0x00

ov74_0223BC30: ; 0x0223BC30
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov74_0223BC44: ; 0x0223BC44
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov74_0223BC58: ; 0x0223BC58
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov74_0223BC6C: ; 0x0223BC6C
	.byte 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov74_0223BC80: ; 0x0223BC80
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00

ov74_0223BCBC: ; 0x0223BCBC
	; internal code, button height, button text, print function
	.word 1, 10, msg_0442_00000, ov74_MainMenu_PrintContinueButton
	.word 2,  4, msg_0442_00001, 0 ; New Game
	.word 3,  4, msg_0442_00009, ov74_MainMenu_PrintConnectToPokewalkerButton
	.word 4,  4, msg_0442_00002, ov74_MainMenu_PrintMysteryGiftButton
	.word 5,  4, msg_0442_00003, ov74_MainMenu_PrintConnectToRangerButton
	.word 6,  4, msg_0442_00000, ov74_MainMenu_PrintMigrateFromAgbButton ; 4, 5, 6, 7, or 8 depending on crtdg
	.word 7,  4, msg_0442_00011, ov74_MainMenu_PrintConnectToWiiButton
	.word 8,  4, msg_0442_00012, ov74_MainMenu_PrintNintendoWFCSetupButton
	.word 9,  4, msg_0442_00010, ov74_MainMenu_PrintWiiMessageSettingsButton

ov74_0223BD4C: ; 0x0223BD4C
	.asciz "data/eoo.dat"
	.balign 4, 0

ov74_0223BD5C: ; 0x0223BD5C
	.word 0x00150116 ; bitfield
	.word ov74_0223D090
	.word ov74_0223D080

ov74_0223BD68: ; 0x0223BD68
	.byte 0x00, 0x00, 0xFF, 0xFF, 0x21, 0x00, 0xE1, 0x00
	.byte 0x23, 0x00, 0xC0, 0x01, 0x25, 0x00, 0xD2, 0x01, 0x27, 0x00, 0xEA, 0x00, 0x28, 0x00, 0xEB, 0x00
	.byte 0x29, 0x00, 0xBF, 0x01, 0x2A, 0x00, 0xBD, 0x01, 0x2B, 0x00, 0xAD, 0x01, 0x2C, 0x00, 0xBE, 0x01
	.byte 0x2E, 0x00, 0xB1, 0x01, 0x30, 0x00, 0xA2, 0x00, 0x31, 0x00, 0xA3, 0x00, 0x32, 0x00, 0xA4, 0x00
	.byte 0x33, 0x00, 0xA5, 0x00, 0x34, 0x00, 0xA6, 0x00, 0x35, 0x00, 0xA7, 0x00, 0x36, 0x00, 0xA8, 0x00
	.byte 0x37, 0x00, 0xA9, 0x00, 0x38, 0x00, 0xAA, 0x00, 0x39, 0x00, 0xAB, 0x00, 0x3A, 0x00, 0xC4, 0x01
	.byte 0x3B, 0x00, 0xC5, 0x01, 0x3C, 0x00, 0xEC, 0x00, 0x3E, 0x00, 0xED, 0x00, 0x3F, 0x00, 0xAC, 0x01
	.byte 0x41, 0x00, 0xAC, 0x00, 0x42, 0x00, 0xAD, 0x00, 0x43, 0x00, 0xAE, 0x00, 0x44, 0x00, 0xAF, 0x00
	.byte 0x45, 0x00, 0xB0, 0x00, 0x46, 0x00, 0xB1, 0x00, 0x47, 0x00, 0xB2, 0x00, 0x48, 0x00, 0xB3, 0x00
	.byte 0x49, 0x00, 0xB4, 0x00, 0x4A, 0x00, 0xB5, 0x00, 0x4B, 0x00, 0xB6, 0x00, 0x4C, 0x00, 0xB7, 0x00
	.byte 0x4D, 0x00, 0xB8, 0x00, 0x4E, 0x00, 0xB9, 0x00, 0x4F, 0x00, 0xBA, 0x00, 0x50, 0x00, 0xBB, 0x00
	.byte 0x51, 0x00, 0xBC, 0x00, 0x52, 0x00, 0xBD, 0x00, 0x53, 0x00, 0xBE, 0x00, 0x54, 0x00, 0xBF, 0x00
	.byte 0x55, 0x00, 0xC0, 0x00, 0x56, 0x00, 0xC1, 0x00, 0x57, 0x00, 0xC2, 0x00, 0x58, 0x00, 0xC3, 0x00
	.byte 0x59, 0x00, 0xC4, 0x00, 0x5A, 0x00, 0xC5, 0x00, 0x61, 0x00, 0xC6, 0x00, 0x62, 0x00, 0xC7, 0x00
	.byte 0x63, 0x00, 0xC8, 0x00, 0x64, 0x00, 0xC9, 0x00, 0x65, 0x00, 0xCA, 0x00, 0x66, 0x00, 0xCB, 0x00
	.byte 0x67, 0x00, 0xCC, 0x00, 0x68, 0x00, 0xCD, 0x00, 0x69, 0x00, 0xCE, 0x00, 0x6A, 0x00, 0xCF, 0x00
	.byte 0x6B, 0x00, 0xD0, 0x00, 0x6C, 0x00, 0xD1, 0x00, 0x6D, 0x00, 0xD2, 0x00, 0x6E, 0x00, 0xD3, 0x00
	.byte 0x6F, 0x00, 0xD4, 0x00, 0x70, 0x00, 0xD5, 0x00, 0x71, 0x00, 0xD6, 0x00, 0x72, 0x00, 0xD7, 0x00
	.byte 0x73, 0x00, 0xD8, 0x00, 0x74, 0x00, 0xD9, 0x00, 0x75, 0x00, 0xDA, 0x00, 0x76, 0x00, 0xDB, 0x00
	.byte 0x77, 0x00, 0xDC, 0x00, 0x78, 0x00, 0xDD, 0x00, 0x79, 0x00, 0xDE, 0x00, 0x7A, 0x00, 0xDF, 0x00
	.byte 0x81, 0x00, 0x02, 0x00, 0x82, 0x00, 0x03, 0x00, 0x83, 0x00, 0x04, 0x00, 0x84, 0x00, 0x05, 0x00
	.byte 0x85, 0x00, 0x06, 0x00, 0x86, 0x00, 0x07, 0x00, 0x87, 0x00, 0x08, 0x00, 0x88, 0x00, 0x09, 0x00
	.byte 0x89, 0x00, 0x0A, 0x00, 0x8A, 0x00, 0x0B, 0x00, 0x8B, 0x00, 0x0C, 0x00, 0x8C, 0x00, 0x0D, 0x00
	.byte 0x8D, 0x00, 0x0E, 0x00, 0x8E, 0x00, 0x0F, 0x00, 0x8F, 0x00, 0x10, 0x00, 0x90, 0x00, 0x11, 0x00
	.byte 0x91, 0x00, 0x12, 0x00, 0x92, 0x00, 0x13, 0x00, 0x93, 0x00, 0x14, 0x00, 0x94, 0x00, 0x15, 0x00
	.byte 0x95, 0x00, 0x16, 0x00, 0x96, 0x00, 0x17, 0x00, 0x97, 0x00, 0x18, 0x00, 0x98, 0x00, 0x19, 0x00
	.byte 0x99, 0x00, 0x1A, 0x00, 0x9A, 0x00, 0x1B, 0x00, 0x9B, 0x00, 0x1C, 0x00, 0x9C, 0x00, 0x1D, 0x00
	.byte 0x9D, 0x00, 0x1E, 0x00, 0x9E, 0x00, 0x1F, 0x00, 0x9F, 0x00, 0x20, 0x00, 0xA0, 0x00, 0x21, 0x00
	.byte 0xA1, 0x00, 0x22, 0x00, 0xA2, 0x00, 0x23, 0x00, 0xA3, 0x00, 0x24, 0x00, 0xA4, 0x00, 0x25, 0x00
	.byte 0xA5, 0x00, 0x26, 0x00, 0xA6, 0x00, 0x27, 0x00, 0xA7, 0x00, 0x28, 0x00, 0xA8, 0x00, 0x29, 0x00
	.byte 0xA9, 0x00, 0x2A, 0x00, 0xAA, 0x00, 0x2B, 0x00, 0xAB, 0x00, 0x2C, 0x00, 0xAC, 0x00, 0x2D, 0x00
	.byte 0xAD, 0x00, 0x2E, 0x00, 0xAE, 0x00, 0x2F, 0x00, 0xAF, 0x00, 0x30, 0x00, 0xB0, 0x00, 0x31, 0x00
	.byte 0xB1, 0x00, 0x32, 0x00, 0xB2, 0x00, 0x33, 0x00, 0xB3, 0x00, 0x34, 0x00, 0xB4, 0x00, 0x35, 0x00
	.byte 0xB5, 0x00, 0x36, 0x00, 0xB6, 0x00, 0x37, 0x00, 0xB7, 0x00, 0x38, 0x00, 0xB8, 0x00, 0x39, 0x00
	.byte 0xB9, 0x00, 0x3A, 0x00, 0xBA, 0x00, 0x3B, 0x00, 0xBB, 0x00, 0x3C, 0x00, 0xBC, 0x00, 0x3D, 0x00
	.byte 0xBD, 0x00, 0x3E, 0x00, 0xBE, 0x00, 0x3F, 0x00, 0xBF, 0x00, 0x40, 0x00, 0xC0, 0x00, 0x41, 0x00
	.byte 0xC1, 0x00, 0x42, 0x00, 0xC2, 0x00, 0x43, 0x00, 0xC3, 0x00, 0x44, 0x00, 0xC4, 0x00, 0x45, 0x00
	.byte 0xC5, 0x00, 0x46, 0x00, 0xC6, 0x00, 0x47, 0x00, 0xC7, 0x00, 0x48, 0x00, 0xC8, 0x00, 0x49, 0x00
	.byte 0xC9, 0x00, 0x4A, 0x00, 0xCA, 0x00, 0x4B, 0x00, 0xCB, 0x00, 0x4C, 0x00, 0xCC, 0x00, 0x4D, 0x00
	.byte 0xCD, 0x00, 0x4E, 0x00, 0xCF, 0x00, 0x4F, 0x00, 0xD2, 0x00, 0x50, 0x00, 0xD3, 0x00, 0x51, 0x00
	.byte 0xE1, 0x00, 0x52, 0x00, 0xE2, 0x00, 0x53, 0x00, 0xE3, 0x00, 0x54, 0x00, 0xE4, 0x00, 0x55, 0x00
	.byte 0xE5, 0x00, 0x56, 0x00, 0xE6, 0x00, 0x57, 0x00, 0xE7, 0x00, 0x58, 0x00, 0xE8, 0x00, 0x59, 0x00
	.byte 0xE9, 0x00, 0x5A, 0x00, 0xEA, 0x00, 0x5B, 0x00, 0xEB, 0x00, 0x5C, 0x00, 0xEC, 0x00, 0x5D, 0x00
	.byte 0xED, 0x00, 0x5E, 0x00, 0xEE, 0x00, 0x5F, 0x00, 0xEF, 0x00, 0x60, 0x00, 0xF0, 0x00, 0x61, 0x00
	.byte 0xF1, 0x00, 0x62, 0x00, 0xF2, 0x00, 0x63, 0x00, 0xF3, 0x00, 0x64, 0x00, 0xF4, 0x00, 0x65, 0x00
	.byte 0xF5, 0x00, 0x66, 0x00, 0xF6, 0x00, 0x67, 0x00, 0xF7, 0x00, 0x68, 0x00, 0xF8, 0x00, 0x69, 0x00
	.byte 0xF9, 0x00, 0x6A, 0x00, 0xFA, 0x00, 0x6B, 0x00, 0xFB, 0x00, 0x6C, 0x00, 0xFC, 0x00, 0x6D, 0x00
	.byte 0xFD, 0x00, 0x6E, 0x00, 0xFE, 0x00, 0x6F, 0x00, 0xFF, 0x00, 0x70, 0x00, 0x00, 0x01, 0x71, 0x00
	.byte 0x01, 0x01, 0x72, 0x00, 0x02, 0x01, 0x73, 0x00, 0x03, 0x01, 0x74, 0x00, 0x04, 0x01, 0x75, 0x00
	.byte 0x05, 0x01, 0x76, 0x00, 0x06, 0x01, 0x77, 0x00, 0x07, 0x01, 0x78, 0x00, 0x08, 0x01, 0x79, 0x00
	.byte 0x09, 0x01, 0x7A, 0x00, 0x0A, 0x01, 0x7B, 0x00, 0x0B, 0x01, 0x7C, 0x00, 0x0C, 0x01, 0x7D, 0x00
	.byte 0x0D, 0x01, 0x7E, 0x00, 0x0E, 0x01, 0x7F, 0x00, 0x0F, 0x01, 0x80, 0x00, 0x10, 0x01, 0x81, 0x00
	.byte 0x11, 0x01, 0x82, 0x00, 0x12, 0x01, 0x83, 0x00, 0x13, 0x01, 0x84, 0x00, 0x14, 0x01, 0x85, 0x00
	.byte 0x15, 0x01, 0x86, 0x00, 0x16, 0x01, 0x87, 0x00, 0x17, 0x01, 0x88, 0x00, 0x18, 0x01, 0x89, 0x00
	.byte 0x19, 0x01, 0x8A, 0x00, 0x1A, 0x01, 0x8B, 0x00, 0x1B, 0x01, 0x8C, 0x00, 0x1C, 0x01, 0x8D, 0x00
	.byte 0x1D, 0x01, 0x8E, 0x00, 0x1E, 0x01, 0x8F, 0x00, 0x1F, 0x01, 0x90, 0x00, 0x20, 0x01, 0x91, 0x00
	.byte 0x21, 0x01, 0x92, 0x00, 0x22, 0x01, 0x93, 0x00, 0x23, 0x01, 0x94, 0x00, 0x24, 0x01, 0x95, 0x00
	.byte 0x25, 0x01, 0x96, 0x00, 0x26, 0x01, 0x97, 0x00, 0x27, 0x01, 0x98, 0x00, 0x28, 0x01, 0x99, 0x00
	.byte 0x29, 0x01, 0x9A, 0x00, 0x2A, 0x01, 0x9B, 0x00, 0x2B, 0x01, 0x9C, 0x00, 0x2C, 0x01, 0x9D, 0x00
	.byte 0x2D, 0x01, 0x9E, 0x00, 0x2F, 0x01, 0x9F, 0x00, 0x32, 0x01, 0xA0, 0x00, 0x33, 0x01, 0xA1, 0x00
	.byte 0x40, 0x01, 0xEA, 0x00, 0x41, 0x01, 0xEB, 0x00, 0x42, 0x01, 0xE8, 0x00, 0x43, 0x01, 0xE9, 0x00
	.byte 0x46, 0x01, 0xE6, 0x00, 0x47, 0x01, 0xE5, 0x00, 0x48, 0x01, 0xEE, 0x00, 0x49, 0x01, 0xEF, 0x00
	.byte 0x4A, 0x01, 0xE4, 0x00, 0x4B, 0x01, 0x12, 0x01, 0x4D, 0x01, 0x1C, 0x01, 0x4E, 0x01, 0x1E, 0x01
	.byte 0x4F, 0x01, 0x1D, 0x01, 0x50, 0x01, 0x1B, 0x01, 0x7C, 0x01, 0x9F, 0x01, 0x7D, 0x01, 0xA0, 0x01
	.byte 0x80, 0x01, 0x5F, 0x01, 0x81, 0x01, 0x60, 0x01, 0x82, 0x01, 0x61, 0x01, 0x84, 0x01, 0x63, 0x01
	.byte 0x87, 0x01, 0x66, 0x01, 0x89, 0x01, 0x68, 0x01, 0x8A, 0x01, 0x69, 0x01, 0x8B, 0x01, 0x6A, 0x01
	.byte 0x8C, 0x01, 0x6B, 0x01, 0x8D, 0x01, 0x6C, 0x01, 0x8E, 0x01, 0x6D, 0x01, 0x8F, 0x01, 0x6E, 0x01
	.byte 0x93, 0x01, 0x72, 0x01, 0x94, 0x01, 0x73, 0x01, 0x96, 0x01, 0x75, 0x01, 0x9A, 0x01, 0x79, 0x01
	.byte 0x9B, 0x01, 0x7A, 0x01, 0x9C, 0x01, 0x7B, 0x01, 0x9F, 0x01, 0x7E, 0x01, 0xA0, 0x01, 0x7F, 0x01
	.byte 0xA1, 0x01, 0x80, 0x01, 0xA2, 0x01, 0x81, 0x01, 0xA4, 0x01, 0x83, 0x01, 0xA7, 0x01, 0x86, 0x01
	.byte 0xA9, 0x01, 0x88, 0x01, 0xAA, 0x01, 0x89, 0x01, 0xAB, 0x01, 0x8A, 0x01, 0xAC, 0x01, 0x8B, 0x01
	.byte 0xAD, 0x01, 0x8C, 0x01, 0xAE, 0x01, 0x8D, 0x01, 0xAF, 0x01, 0x8E, 0x01, 0xB3, 0x01, 0x92, 0x01
	.byte 0xB4, 0x01, 0x93, 0x01, 0xB6, 0x01, 0x95, 0x01, 0xBA, 0x01, 0x99, 0x01, 0xBB, 0x01, 0x9A, 0x01
	.byte 0xBC, 0x01, 0x9B, 0x01

ov74_0223C1F4: ; 0x0223C1F4
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov74_0223C220: ; 0x0223C220
	.word 0x00000012, ov74_0222A560
	.word 0x00000013, ov74_0222A2A4

ov74_0223C230: ; 0x0223C230
	.word 0x00000012, ov74_0222A4CC
	.word 0x00000013, ov74_0222A2A4

ov74_0223C240: ; 0x0223C240
	.word 0x00000012, ov74_0222A504
	.word 0x00000013, ov74_0222A538

ov74_0223C250: ; 0x0223C250
	.word 0x00000012, ov74_02229F90
	.word 0x00000013, ov74_0222A2A4

ov74_0223C260: ; 0x0223C260
	.word 0x00000012, ov74_02229FF4
	.word 0x00000013, ov74_0222A494

ov74_0223C270: ; 0x0223C270
	.word 0
	.word ov74_02235FF8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x00, 0x0C, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.word msg_0247_00012, ov74_0222A5CC
	.word msg_0247_00013, ov74_0222A650

ov74_0223C2A0: ; 0x0223C2A0
	.word msg_0247_00021, ov74_0222A688
	.word msg_0247_00014, ov74_0222A6C0

ov74_0223C2B0: ; 0x0223C2B0
	.word msg_0247_00015, ov74_0222A2E0
	.word msg_0247_00020, ov74_0222A3CC
	.word msg_0247_00016, ov74_0222A35C
	.word msg_0247_00017, ov74_0222A5AC

ov74_0223C2D0: ; 0x0223C2D0
	.word msg_0247_00065, ov74_0222D358
	.word msg_0247_00066, ov74_0222D414

ov74_0223C2E0: ; 0x0223C2E0
	.word msg_0247_00065, 16
	.word msg_0247_00066, ov74_0222D414

ov74_0223C2F0: ; 0x0223C2F0
	.word msg_0247_00065, 15
	.word msg_0247_00066, ov74_0222D414
	.word msg_0247_00043, 6
	.word msg_0247_00044, ov74_0222D2D4
	.word msg_0247_00045, ov74_0222D308
	.word msg_0247_00046, 11

ov74_0223C320: ; 0x0223C320
	.word 0
	.word ov74_02235FF8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x00, 0x0C, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00

ov74_0223C340: ; 0x0223C340
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x25, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x29, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222D4E4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222D494
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x32, 0x00, 0x00, 0x00
	.word ov74_0222D55C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222D5C4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x2A, 0x00, 0x00, 0x00
	.word ov74_0222D614
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222D690
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222D774
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222D78C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x35, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x38, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x3A, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x3B, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x39, 0x00, 0x00, 0x00
	.word ov74_0222D7D0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x3C, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x3D, 0x00, 0x00, 0x00
	.word ov74_0222D490
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov74_0223C6D0: ; 0x0223C6D0
	.byte 0x2B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00

ov74_0223C6E0: ; 0x0223C6E0
	.word 0
	.word ov74_02235FF8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x00, 0x0C, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00

ov74_0223C700: ; 0x0223C700
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x25, 0x00, 0x00, 0x00
	.word ov74_0222EE08
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x29, 0x00, 0x00, 0x00
	.word ov74_0222EE08
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222EE58
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222EE0C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x32, 0x00, 0x00, 0x00
	.word ov74_0222EEB0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222EF18
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x2A, 0x00, 0x00, 0x00
	.word ov74_0222EF64
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00
	.word ov74_0222EE08
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov74_0222EF68
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov74_0223C920: ; 0x0223C920
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x01, 0x40, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov74_0223C960: ; 0x0223C960
	.byte 0x00, 0x02, 0x01, 0x03, 0x04, 0x05, 0x00, 0x00

ov74_0223C968: ; 0x0223C968
	.byte 0x00, 0x00, 0x00, 0x00
#ifdef HEARTGOLD
	.byte 0x14, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00
#else
	.byte 0x15, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
#endif

ov74_0223C980: ; 0x0223C980
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov74_0223C998: ; 0x0223C998
	.byte 0x0F, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x39, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00

ov74_0223C9A8: ; 0x0223C9A8
	.byte 0x94, 0x00, 0x00, 0x00, 0xF9, 0x00, 0x00, 0x00
	.byte 0x7F, 0x00, 0x00, 0x00, 0x23, 0x01, 0x00, 0x00

ov74_0223C9B8: ; 0x0223C9B8
	.byte 0x00, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00

ov74_0223C9D8: ; 0x0223C9D8
	.byte 0x05, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00
	.byte 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00
	.byte 0x48, 0x00, 0x52, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00, 0x5B, 0x00, 0x5C, 0x00
	.byte 0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00, 0x69, 0x00, 0x70, 0x00, 0x71, 0x00, 0x72, 0x00
	.byte 0x73, 0x00, 0x74, 0x00, 0x75, 0x00, 0x76, 0x00, 0x77, 0x00, 0x78, 0x00, 0x79, 0x00, 0x7A, 0x00
	.byte 0x7B, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7E, 0x00, 0x7F, 0x00, 0x80, 0x00, 0x81, 0x00, 0x82, 0x00
	.byte 0x83, 0x00, 0x84, 0x00, 0xB0, 0x00, 0xB1, 0x00, 0xB2, 0x00, 0xE2, 0x00, 0xE3, 0x00, 0xE4, 0x00
	.byte 0xE5, 0x00, 0xE6, 0x00, 0xE7, 0x00, 0xE8, 0x00, 0xE9, 0x00, 0xEA, 0x00, 0xEB, 0x00, 0xEC, 0x00
	.byte 0xED, 0x00, 0xEE, 0x00, 0xEF, 0x00, 0xF0, 0x00, 0xF1, 0x00, 0xF2, 0x00, 0xF3, 0x00, 0xF4, 0x00
	.byte 0xF5, 0x00, 0xF6, 0x00, 0xF7, 0x00, 0xF8, 0x00, 0xF9, 0x00, 0xFA, 0x00, 0xFB, 0x00, 0xFC, 0x00
	.byte 0xFD, 0x00, 0x03, 0x01, 0x04, 0x01, 0x05, 0x01, 0x06, 0x01, 0x07, 0x01, 0x08, 0x01, 0x09, 0x01
	.byte 0x0A, 0x01, 0x0B, 0x01, 0x0C, 0x01, 0x0D, 0x01, 0x0E, 0x01, 0x0F, 0x01, 0x10, 0x01, 0x11, 0x01
	.byte 0x12, 0x01, 0x13, 0x01, 0x14, 0x01, 0x15, 0x01, 0x16, 0x01, 0x17, 0x01, 0x18, 0x01, 0x19, 0x01
	.byte 0x1A, 0x01, 0x1B, 0x01, 0x1C, 0x01, 0x1D, 0x01, 0x1E, 0x01, 0x1F, 0x01, 0x20, 0x01, 0x53, 0x01
	.byte 0x54, 0x01, 0x55, 0x01, 0x56, 0x01, 0x57, 0x01, 0x58, 0x01, 0x59, 0x01, 0x5A, 0x01, 0x5B, 0x01
	.byte 0x5C, 0x01, 0x5D, 0x01, 0x5E, 0x01, 0x5F, 0x01, 0x60, 0x01, 0x61, 0x01, 0x62, 0x01, 0x63, 0x01
	.byte 0x64, 0x01, 0x65, 0x01, 0x66, 0x01, 0x67, 0x01, 0x68, 0x01, 0x69, 0x01, 0x6A, 0x01, 0x6B, 0x01
	.byte 0x6C, 0x01, 0x6D, 0x01, 0x6E, 0x01, 0x6F, 0x01, 0x70, 0x01, 0x71, 0x01, 0x72, 0x01, 0x73, 0x01
	.byte 0x74, 0x01, 0x75, 0x01, 0x76, 0x01, 0x77, 0x01, 0x78, 0x01, 0x00, 0x00

sPmAgbCartridgeSpec: ; 0x0223CAFC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF

sAgbCartNintendoLogo: ; 0x0223CB04
	.byte 0x24, 0xFF, 0xAE, 0x51, 0x69, 0x9A, 0xA2, 0x21, 0x3D, 0x84, 0x82, 0x0A
	.byte 0x84, 0xE4, 0x09, 0xAD, 0x11, 0x24, 0x8B, 0x98, 0xC0, 0x81, 0x7F, 0x21, 0xA3, 0x52, 0xBE, 0x19
	.byte 0x93, 0x09, 0xCE, 0x20, 0x10, 0x46, 0x4A, 0x4A, 0xF8, 0x27, 0x31, 0xEC, 0x58, 0xC7, 0xE8, 0x33
	.byte 0x82, 0xE3, 0xCE, 0xBF, 0x85, 0xF4, 0xDF, 0x94, 0xCE, 0x4B, 0x09, 0xC1, 0x94, 0x56, 0x8A, 0xC0
	.byte 0x13, 0x72, 0xA7, 0xFC, 0x9F, 0x84, 0x4D, 0x73, 0xA3, 0xCA, 0x9A, 0x61, 0x58, 0x97, 0xA3, 0x27
	.byte 0xFC, 0x03, 0x98, 0x76, 0x23, 0x1D, 0xC7, 0x61, 0x03, 0x04, 0xAE, 0x56, 0xBF, 0x38, 0x84, 0x00
	.byte 0x40, 0xA7, 0x0E, 0xFD, 0xFF, 0x52, 0xFE, 0x03, 0x6F, 0x95, 0x30, 0xF1, 0x97, 0xFB, 0xC0, 0x85
	.byte 0x60, 0xD6, 0x80, 0x25, 0xA9, 0x63, 0xBE, 0x03, 0x01, 0x4E, 0x38, 0xE2, 0xF9, 0xA2, 0x34, 0xFF
	.byte 0xBB, 0x3E, 0x03, 0x44, 0x78, 0x00, 0x90, 0xCB, 0x88, 0x11, 0x3A, 0x94, 0x65, 0xC0, 0x7C, 0x63
	.byte 0x87, 0xF0, 0x3C, 0xAF, 0xD6, 0x25, 0xE4, 0x8B, 0x38, 0x0A, 0xAC, 0x72, 0x21, 0xD4, 0xF8, 0x07

ov74_0223CBA0: ; 0x0223CBA0
	.byte 0x10, 0x00, 0x11, 0x00, 0x12, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x21, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00, 0x34, 0x00
	.byte 0x35, 0x00, 0x38, 0x00, 0x39, 0x00, 0x42, 0x00, 0x43, 0x00, 0x44, 0x00, 0x56, 0x00, 0x57, 0x00
	.byte 0x5A, 0x00, 0x5B, 0x00, 0x60, 0x00, 0x61, 0x00, 0x6A, 0x00, 0x6B, 0x00, 0x72, 0x00, 0x73, 0x00
	.byte 0x74, 0x00, 0x75, 0x00, 0x7A, 0x00, 0x7B, 0x00, 0x7C, 0x00, 0x7F, 0x00, 0x80, 0x00, 0x85, 0x00
	.byte 0x86, 0x00, 0x87, 0x00, 0x88, 0x00, 0x89, 0x00, 0xAD, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00
	.byte 0xBF, 0x00, 0xC0, 0x00, 0xC4, 0x00, 0xC5, 0x00, 0xC6, 0x00, 0xD2, 0x00, 0xD4, 0x00, 0xD5, 0x00
	.byte 0xD8, 0x00, 0xD9, 0x00, 0xDC, 0x00, 0xDD, 0x00, 0xDF, 0x00, 0xE0, 0x00, 0xE6, 0x00, 0xE9, 0x00
	.byte 0xEA, 0x00, 0xEB, 0x00, 0xEC, 0x00, 0xED, 0x00, 0xEE, 0x00, 0xF1, 0x00, 0x05, 0x01, 0x06, 0x01
	.byte 0x07, 0x01, 0x08, 0x01, 0x1D, 0x01, 0x1E, 0x01, 0x2C, 0x01, 0x2D, 0x01, 0x2E, 0x01, 0x3A, 0x01
	.byte 0x42, 0x01, 0x43, 0x01, 0x47, 0x01, 0x53, 0x01, 0x54, 0x01, 0x61, 0x01, 0x62, 0x01, 0x65, 0x01
	.byte 0x67, 0x01, 0x69, 0x01, 0x6A, 0x01, 0x6B, 0x01, 0x6C, 0x01, 0x6D, 0x01

ov74_0223CC5C: ; 0x0223CC5C
	.byte 0x15, 0x01

ov74_0223CC5E: ; 0x0223CC5E
	.byte 0xFC, 0x00
	.byte 0x16, 0x01, 0xFD, 0x00, 0x17, 0x01, 0xFE, 0x00, 0x18, 0x01, 0xFF, 0x00, 0x19, 0x01, 0x00, 0x01
	.byte 0x1A, 0x01, 0x01, 0x01, 0x1B, 0x01, 0x02, 0x01, 0x1C, 0x01, 0x03, 0x01, 0x1D, 0x01, 0x04, 0x01
	.byte 0x1E, 0x01, 0x05, 0x01, 0x1F, 0x01, 0x06, 0x01, 0x20, 0x01, 0x07, 0x01, 0x21, 0x01, 0x08, 0x01
	.byte 0x22, 0x01, 0x09, 0x01, 0x23, 0x01, 0x0A, 0x01, 0x24, 0x01, 0x0B, 0x01, 0x25, 0x01, 0x0C, 0x01
	.byte 0x26, 0x01, 0x0D, 0x01, 0x27, 0x01, 0x0E, 0x01, 0x28, 0x01, 0x0F, 0x01, 0x29, 0x01, 0x10, 0x01
	.byte 0x2A, 0x01, 0x11, 0x01, 0x2B, 0x01, 0x12, 0x01, 0x2C, 0x01, 0x13, 0x01, 0x2D, 0x01, 0x22, 0x01
	.byte 0x2E, 0x01, 0x23, 0x01, 0x2F, 0x01, 0x24, 0x01, 0x30, 0x01, 0x14, 0x01, 0x31, 0x01, 0x15, 0x01
	.byte 0x32, 0x01, 0x1D, 0x01, 0x33, 0x01, 0x1E, 0x01, 0x34, 0x01, 0x47, 0x01, 0x35, 0x01, 0x16, 0x01
	.byte 0x36, 0x01, 0x17, 0x01, 0x37, 0x01, 0x1B, 0x01, 0x38, 0x01, 0x1C, 0x01, 0x39, 0x01, 0x40, 0x01
	.byte 0x3A, 0x01, 0x41, 0x01, 0x3B, 0x01, 0x2C, 0x01, 0x3C, 0x01, 0x2D, 0x01, 0x3D, 0x01, 0x60, 0x01
	.byte 0x3E, 0x01, 0x57, 0x01, 0x3F, 0x01, 0x58, 0x01, 0x40, 0x01, 0x2B, 0x01, 0x41, 0x01, 0x44, 0x01
	.byte 0x42, 0x01, 0x2E, 0x01, 0x43, 0x01, 0x53, 0x01, 0x44, 0x01, 0x54, 0x01, 0x45, 0x01, 0x72, 0x01
	.byte 0x46, 0x01, 0x55, 0x01, 0x47, 0x01, 0x56, 0x01, 0x48, 0x01, 0x5D, 0x01, 0x49, 0x01, 0x5E, 0x01
	.byte 0x4A, 0x01, 0x3E, 0x01, 0x4B, 0x01, 0x3F, 0x01, 0x4C, 0x01, 0x48, 0x01, 0x4D, 0x01, 0x49, 0x01
	.byte 0x4E, 0x01, 0x4A, 0x01, 0x4F, 0x01, 0x28, 0x01, 0x50, 0x01, 0x29, 0x01, 0x51, 0x01, 0x35, 0x01
	.byte 0x52, 0x01, 0x36, 0x01, 0x53, 0x01, 0x42, 0x01, 0x54, 0x01, 0x43, 0x01, 0x55, 0x01, 0x6B, 0x01
	.byte 0x56, 0x01, 0x6C, 0x01, 0x57, 0x01, 0x6D, 0x01, 0x58, 0x01, 0x4B, 0x01, 0x59, 0x01, 0x4C, 0x01
	.byte 0x5A, 0x01, 0x69, 0x01, 0x5B, 0x01, 0x6A, 0x01, 0x5C, 0x01, 0x51, 0x01, 0x5D, 0x01, 0x52, 0x01
	.byte 0x5E, 0x01, 0x2A, 0x01, 0x5F, 0x01, 0x45, 0x01, 0x60, 0x01, 0x46, 0x01, 0x61, 0x01, 0x37, 0x01
	.byte 0x62, 0x01, 0x38, 0x01, 0x63, 0x01, 0x2F, 0x01, 0x64, 0x01, 0x33, 0x01, 0x65, 0x01, 0x34, 0x01
	.byte 0x66, 0x01, 0x4D, 0x01, 0x67, 0x01, 0x4E, 0x01, 0x68, 0x01, 0x68, 0x01, 0x69, 0x01, 0x63, 0x01
	.byte 0x6A, 0x01, 0x64, 0x01, 0x6B, 0x01, 0x3B, 0x01, 0x6C, 0x01, 0x1F, 0x01, 0x6D, 0x01, 0x20, 0x01
	.byte 0x6E, 0x01, 0x21, 0x01, 0x6F, 0x01, 0x3C, 0x01, 0x70, 0x01, 0x3D, 0x01, 0x71, 0x01, 0x65, 0x01
	.byte 0x72, 0x01, 0x25, 0x01, 0x73, 0x01, 0x26, 0x01, 0x74, 0x01, 0x27, 0x01, 0x75, 0x01, 0x6E, 0x01
	.byte 0x76, 0x01, 0x6F, 0x01, 0x77, 0x01, 0x70, 0x01, 0x78, 0x01, 0x67, 0x01, 0x79, 0x01, 0x61, 0x01
	.byte 0x7A, 0x01, 0x62, 0x01, 0x7B, 0x01, 0x50, 0x01, 0x7C, 0x01, 0x4F, 0x01, 0x7D, 0x01, 0x71, 0x01
	.byte 0x7E, 0x01, 0x30, 0x01, 0x7F, 0x01, 0x31, 0x01, 0x80, 0x01, 0x32, 0x01, 0x81, 0x01, 0x5F, 0x01
	.byte 0x82, 0x01, 0x39, 0x01, 0x83, 0x01, 0x3A, 0x01, 0x84, 0x01, 0x59, 0x01, 0x85, 0x01, 0x5A, 0x01
	.byte 0x86, 0x01, 0x5B, 0x01, 0x87, 0x01, 0x5C, 0x01, 0x88, 0x01, 0x18, 0x01, 0x89, 0x01, 0x19, 0x01
	.byte 0x8A, 0x01, 0x1A, 0x01, 0x8B, 0x01, 0x73, 0x01, 0x8C, 0x01, 0x74, 0x01, 0x8D, 0x01, 0x75, 0x01
	.byte 0x8E, 0x01, 0x76, 0x01, 0x8F, 0x01, 0x77, 0x01, 0x90, 0x01, 0x78, 0x01, 0x91, 0x01, 0x79, 0x01
	.byte 0x92, 0x01, 0x7A, 0x01, 0x93, 0x01, 0x7B, 0x01, 0x94, 0x01, 0x7E, 0x01, 0x95, 0x01, 0x7F, 0x01
	.byte 0x96, 0x01, 0x80, 0x01, 0x97, 0x01, 0x7C, 0x01, 0x98, 0x01, 0x7D, 0x01, 0x99, 0x01, 0x81, 0x01
	.byte 0x9A, 0x01, 0x82, 0x01, 0x9B, 0x01, 0x66, 0x01, 0x9C, 0x01, 0x9C, 0x01, 0x9D, 0x01, 0x9D, 0x01
	.byte 0x9E, 0x01, 0x9E, 0x01, 0x9F, 0x01, 0x9F, 0x01, 0xA0, 0x01, 0xA0, 0x01, 0xA1, 0x01, 0xA1, 0x01
	.byte 0xA2, 0x01, 0xA2, 0x01, 0xA3, 0x01, 0xA3, 0x01, 0xA4, 0x01, 0xA4, 0x01

ov74_0223CE9C: ; 0x0223CE9C
	.ascii "EB5B"
	.ascii "EC5B"
	.ascii "ED5B"
	.ascii "EE5B"
	.ascii "EF5B"
	.ascii "EG5B"
	.ascii "EH5B"
	.ascii "EI5B"
	.ascii "EJ5B"
	.ascii "EK5B"
	.ascii "EL5B"
	.ascii "EM5B"
	.ascii "EP5B"
	.ascii "EQ5B"
	.ascii "ER5B"
	.ascii "ES5B"
	.ascii "ET5B"
	.ascii "EU5B"
	.ascii "EV5B"
	.ascii "EW5B"
	.ascii "\x00\x00\x00\x00"
ov74_0223CEF0:
	.asciz "mywh_SYSSTATE_IDLE"
	.balign 4, 0
ov74_0223CF04:
	.asciz "mywh_SYSSTATE_BUSY"
	.balign 4, 0
ov74_0223CF18:
	.asciz "mywh_SYSSTATE_STOP"
	.balign 4, 0
ov74_0223CF2C:
	.asciz "mywh_SYSSTATE_ERROR"
	.balign 4, 0
ov74_0223CF40:
	.asciz "mywh_SYSSTATE_SCANNING"
	.balign 4, 0
ov74_0223CF58:
	.asciz "mywh_SYSSTATE_CONNECTED"
	.balign 4, 0
ov74_0223CF70:
	.asciz "mywh_SYSSTATE_KEYSHARING"
	.balign 4, 0
ov74_0223CF8C:
	.asciz "mywh_SYSSTATE_DATASHARING"
	.balign 4, 0
ov74_0223CFA8:
	.asciz "mywh_SYSSTATE_CONNECT_FAIL"
	.balign 4, 0
ov74_0223CFC4:
	.asciz "mywh_SYSSTATE_MEASURECHANNEL"
	.balign 4, 0

ov74_0223CFE4: ; 0x0223CFE4
	.word ov74_0223CF18
	.word ov74_0223CEF0
	.word ov74_0223CF40
	.word ov74_0223CF04
	.word ov74_0223CF58
	.word ov74_0223CF8C
	.word ov74_0223CF70
	.word ov74_0223CFC4
	.word ov74_0223CFA8
	.word ov74_0223CF2C

ov74_0223D00C: ; 0x0223D00C
	.asciz "%s -> "
	.balign 4, 0

ov74_0223D014: ; 0x0223D014
	.asciz "%s\n"
	.balign 4, 0

ov74_0223D018: ; 0x0223D018
	.asciz "not my parent ggid (%d != %d)\n"
	.balign 4, 0

ov74_0223D038: ; 0x0223D038
	.asciz "IPGE"
	.balign 4, 0

ov74_0223D040: ; 0x0223D040
	.asciz "K5WfPEw9T3cvqzHa"
	.balign 4, 0

ov74_0223D054: ; 0x0223D054
	.byte 0x00, 0x00, 0x00, 0x00

	.bss

ov74_0223D080:
	.space 0x10

ov74_0223D090: ; 0x0223D090
	.space 0x14

ov74_0223D0A4: ; 0x0223D0A4
	.space 0x4

ov74_0223D0A8: ; 0x0223D0A8
	.space 0x14

ov74_0223D0BC: ; 0x0223D0BC
	.space 0x4

ov74_0223D0C0: ; 0x0223D0C0
	.space 0x4

ov74_0223D0C4: ; 0x0223D0C4
	.space 0x274

ov74_0223D338: ; 0x0223D338
	.space 0x4

ov74_0223D33C: ; 0x0223D33C
	.space 0x10

ov74_0223D34C: ; 0x0223D34C
	.space 0x8

sPmAgbRomHeader: ; 0x0223D354
	.space 0xFC

ov74_0223D450: ; 0x0223D450
	.space 0x4

ov74_0223D454: ; 0x0223D454
	.space 0x34

ov74_0223D488: ; 0x0223D488
	.space 0x4

ov74_0223D48C: ; 0x0223D48C
	.space 0x1C8

ov74_0223D654: ; 0x0223D654
	.space 0xC80

ov74_0223E2D4: ; 0x0223E2D4
	.space 0x28

ov74_0223E2FC: ; 0x0223E2FC
	.space 0x8

ov74_0223E304: ; 0x0223E304
	.space 0x14

ov74_0223E318: ; 0x0223E318
	.space 0x6e0
