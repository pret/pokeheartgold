#include "config.h"
	.include "asm/macros.inc"
	.include "unk_02030A98.inc"
	.include "global.inc"

	.bss

_021D2AFC:
	.space 0x1628

	.text

	thumb_func_start sub_02030A98
sub_02030A98: ; 0x02030A98
	ldr r3, _02030AA0 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_02030AA0: .word MI_CpuFill8
	thumb_func_end sub_02030A98

	thumb_func_start sub_02030AA4
sub_02030AA4: ; 0x02030AA4
	push {r3, r4}
	cmp r1, #0xa
	bne _02030ACE
	ldrb r1, [r3]
	cmp r1, #1
	blo _02030ABE
	mov r1, #1
	ldrb r3, [r0]
	lsl r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_02030ABE:
	mov r1, #1
	add r3, r1, #0
	ldrb r4, [r0]
	lsl r3, r2
	mov r1, #0xff
	eor r1, r3
	and r1, r4
	strb r1, [r0]
_02030ACE:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02030AA4

	thumb_func_start sub_02030AD4
sub_02030AD4: ; 0x02030AD4
	cmp r1, #0xa
	bne _02030AE4
	ldrb r0, [r0]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	bx lr
_02030AE4:
	mov r0, #0
	bx lr
	thumb_func_end sub_02030AD4

	thumb_func_start sub_02030AE8
sub_02030AE8: ; 0x02030AE8
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _02030AF4 ; =0x00001618
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_02030AF4: .word 0x00001618
	thumb_func_end sub_02030AE8

	thumb_func_start sub_02030AF8
sub_02030AF8: ; 0x02030AF8
	ldr r3, _02030B00 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x54
	bx r3
	.balign 4, 0
_02030B00: .word MI_CpuFill8
	thumb_func_end sub_02030AF8

	thumb_func_start sub_02030B04
sub_02030B04: ; 0x02030B04
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030B04

	thumb_func_start sub_02030B14
sub_02030B14: ; 0x02030B14
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_02030B14

	thumb_func_start sub_02030B1C
sub_02030B1C: ; 0x02030B1C
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #8
	lsr r1, r1, #0x1c
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_02030B1C

	thumb_func_start sub_02030B30
sub_02030B30: ; 0x02030B30
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #4
	bhi _02030B82
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030B44: ; jump table
	.short _02030B4E - _02030B44 - 2 ; case 0
	.short _02030B60 - _02030B44 - 2 ; case 1
	.short _02030B66 - _02030B44 - 2 ; case 2
	.short _02030B70 - _02030B44 - 2 ; case 3
	.short _02030B78 - _02030B44 - 2 ; case 4
_02030B4E:
	ldrb r4, [r0]
	ldrb r2, [r3]
	mov r1, #7
	bic r4, r1
	mov r1, #7
	and r1, r2
	orr r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030B60:
	ldrb r1, [r3]
	strb r1, [r0, #1]
	pop {r4, pc}
_02030B66:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #4]
	pop {r4, pc}
_02030B70:
	ldrb r1, [r3]
	add r0, r0, r2
	strb r1, [r0, #2]
	pop {r4, pc}
_02030B78:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x2c]
	pop {r4, pc}
_02030B82:
	bl GF_AssertFail
	pop {r4, pc}
	thumb_func_end sub_02030B30

	thumb_func_start sub_02030B88
sub_02030B88: ; 0x02030B88
	push {r3, lr}
	cmp r1, #4
	bhi _02030BC6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030B9A: ; jump table
	.short _02030BA4 - _02030B9A - 2 ; case 0
	.short _02030BAC - _02030B9A - 2 ; case 1
	.short _02030BB0 - _02030B9A - 2 ; case 2
	.short _02030BB8 - _02030B9A - 2 ; case 3
	.short _02030BBE - _02030B9A - 2 ; case 4
_02030BA4:
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	pop {r3, pc}
_02030BAC:
	ldrb r0, [r0, #1]
	pop {r3, pc}
_02030BB0:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #4]
	pop {r3, pc}
_02030BB8:
	add r0, r0, r2
	ldrb r0, [r0, #2]
	pop {r3, pc}
_02030BBE:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x2c]
	pop {r3, pc}
_02030BC6:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030B88

	thumb_func_start sub_02030BD0
sub_02030BD0: ; 0x02030BD0
	lsl r2, r0, #0x17
	lsr r2, r2, #0x18
	ldrb r3, [r1, r2]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r1, r3, #0
	asr r1, r0
	mov r0, #0xf
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_02030BD0

	thumb_func_start sub_02030BF4
sub_02030BF4: ; 0x02030BF4
	push {r3, r4, r5, r6}
	lsr r5, r0, #0x1f
	lsl r4, r0, #0x1f
	lsl r3, r0, #0x17
	sub r4, r4, r5
	mov r0, #0x1f
	ror r4, r0
	add r0, r5, r4
	lsl r0, r0, #0x18
	lsr r3, r3, #0x18
	lsr r0, r0, #0x18
	bne _02030C14
	add r4, r1, r3
	ldrb r6, [r1, r3]
	mov r5, #0xf0
	b _02030C1A
_02030C14:
	ldrb r6, [r1, r3]
	add r4, r1, r3
	mov r5, #0xf
_02030C1A:
	and r5, r6
	strb r5, [r1, r3]
	lsl r0, r0, #2
	add r1, r2, #0
	lsl r1, r0
	lsl r0, r1, #0x18
	ldrb r3, [r4]
	lsr r0, r0, #0x18
	orr r0, r3
	strb r0, [r4]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02030BF4

	thumb_func_start sub_02030C34
sub_02030C34: ; 0x02030C34
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_02030C3C:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r5, #0
	add r2, r6, #0
	bl sub_02030BF4
	add r4, r4, #1
	cmp r4, #0x12
	blt _02030C3C
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02030C34

	thumb_func_start sub_02030C50
sub_02030C50: ; 0x02030C50
	ldr r3, _02030C58 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_02030C58: .word MI_CpuFill8
	thumb_func_end sub_02030C50

	thumb_func_start sub_02030C5C
sub_02030C5C: ; 0x02030C5C
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _02030C68 ; =0x0000161C
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_02030C68: .word 0x0000161C
	thumb_func_end sub_02030C5C

	thumb_func_start sub_02030C6C
sub_02030C6C: ; 0x02030C6C
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #5
	bne _02030C98
	ldrb r1, [r3]
	cmp r1, #1
	blo _02030C86
	mov r1, #1
	ldrb r3, [r0]
	lsl r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r4, pc}
_02030C86:
	mov r1, #1
	add r3, r1, #0
	ldrb r4, [r0]
	lsl r3, r2
	mov r1, #0xff
	eor r1, r3
	and r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030C98:
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02030C6C

	thumb_func_start sub_02030CA0
sub_02030CA0: ; 0x02030CA0
	push {r3, lr}
	cmp r1, #5
	bne _02030CB2
	ldrb r0, [r0]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	pop {r3, pc}
_02030CB2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030CA0

	thumb_func_start sub_02030CBC
sub_02030CBC: ; 0x02030CBC
	ldr r3, _02030CC4 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x74
	bx r3
	.balign 4, 0
_02030CC4: .word MI_CpuFill8
	thumb_func_end sub_02030CBC

	thumb_func_start sub_02030CC8
sub_02030CC8: ; 0x02030CC8
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030CC8

	thumb_func_start sub_02030CD8
sub_02030CD8: ; 0x02030CD8
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_02030CD8

	thumb_func_start sub_02030CE0
sub_02030CE0: ; 0x02030CE0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #8
	lsr r1, r1, #0x1c
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_02030CE0

	thumb_func_start sub_02030CF4
sub_02030CF4: ; 0x02030CF4
	push {r4, lr}
	ldr r4, [sp, #8]
	cmp r1, #8
	bhi _02030D7E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030D08: ; jump table
	.short _02030D1A - _02030D08 - 2 ; case 0
	.short _02030D2C - _02030D08 - 2 ; case 1
	.short _02030D32 - _02030D08 - 2 ; case 2
	.short _02030D3C - _02030D08 - 2 ; case 3
	.short _02030D4A - _02030D08 - 2 ; case 4
	.short _02030D54 - _02030D08 - 2 ; case 5
	.short _02030D60 - _02030D08 - 2 ; case 6
	.short _02030D6A - _02030D08 - 2 ; case 7
	.short _02030D72 - _02030D08 - 2 ; case 8
_02030D1A:
	ldrb r3, [r0]
	ldrb r2, [r4]
	mov r1, #7
	bic r3, r1
	mov r1, #7
	and r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r4, pc}
_02030D2C:
	ldrb r1, [r4]
	strb r1, [r0, #1]
	pop {r4, pc}
_02030D32:
	ldrh r3, [r4]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x22]
	pop {r4, pc}
_02030D3C:
	lsl r1, r2, #2
	add r0, r0, r1
	add r0, r0, r3
	ldrb r4, [r4]
	add r0, #0x2a
	strb r4, [r0]
	pop {r4, pc}
_02030D4A:
	lsl r1, r2, #2
	ldr r3, [r4]
	add r0, r0, r1
	str r3, [r0, #0x3c]
	pop {r4, pc}
_02030D54:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r3, [r4]
	add r0, #0x4c
	strh r3, [r0]
	pop {r4, pc}
_02030D60:
	ldrh r3, [r4]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #6]
	pop {r4, pc}
_02030D6A:
	ldrb r1, [r4]
	add r0, r0, r2
	strb r1, [r0, #3]
	pop {r4, pc}
_02030D72:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r3, [r4]
	add r0, #0x54
	strh r3, [r0]
	pop {r4, pc}
_02030D7E:
	bl GF_AssertFail
	pop {r4, pc}
	thumb_func_end sub_02030CF4

	thumb_func_start sub_02030D84
sub_02030D84: ; 0x02030D84
	push {r3, lr}
	cmp r1, #8
	bhi _02030DF2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030D96: ; jump table
	.short _02030DA8 - _02030D96 - 2 ; case 0
	.short _02030DB0 - _02030D96 - 2 ; case 1
	.short _02030DB4 - _02030D96 - 2 ; case 2
	.short _02030DBC - _02030D96 - 2 ; case 3
	.short _02030DC8 - _02030D96 - 2 ; case 4
	.short _02030DD0 - _02030D96 - 2 ; case 5
	.short _02030DDA - _02030D96 - 2 ; case 6
	.short _02030DE2 - _02030D96 - 2 ; case 7
	.short _02030DE8 - _02030D96 - 2 ; case 8
_02030DA8:
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	pop {r3, pc}
_02030DB0:
	ldrb r0, [r0, #1]
	pop {r3, pc}
_02030DB4:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x22]
	pop {r3, pc}
_02030DBC:
	lsl r1, r2, #2
	add r0, r0, r1
	add r0, r0, r3
	add r0, #0x2a
	ldrb r0, [r0]
	pop {r3, pc}
_02030DC8:
	lsl r1, r2, #2
	add r0, r0, r1
	ldr r0, [r0, #0x3c]
	pop {r3, pc}
_02030DD0:
	lsl r1, r2, #1
	add r0, r0, r1
	add r0, #0x4c
	ldrh r0, [r0]
	pop {r3, pc}
_02030DDA:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #6]
	pop {r3, pc}
_02030DE2:
	add r0, r0, r2
	ldrb r0, [r0, #3]
	pop {r3, pc}
_02030DE8:
	lsl r1, r2, #1
	add r0, r0, r1
	add r0, #0x54
	ldrh r0, [r0]
	pop {r3, pc}
_02030DF2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030D84

	thumb_func_start sub_02030DFC
sub_02030DFC: ; 0x02030DFC
	ldr r3, _02030E04 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_02030E04: .word MI_CpuFill8
	thumb_func_end sub_02030DFC

	thumb_func_start sub_02030E08
sub_02030E08: ; 0x02030E08
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _02030E14 ; =0x00001620
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_02030E14: .word 0x00001620
	thumb_func_end sub_02030E08

	thumb_func_start sub_02030E18
sub_02030E18: ; 0x02030E18
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #9
	beq _02030E26
	cmp r1, #0xa
	beq _02030E4A
	b _02030E50
_02030E26:
	ldrb r1, [r3]
	cmp r1, #1
	blo _02030E38
	mov r1, #1
	ldrb r3, [r0]
	lsl r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r4, pc}
_02030E38:
	mov r1, #1
	add r3, r1, #0
	ldrb r4, [r0]
	lsl r3, r2
	mov r1, #0xff
	eor r1, r3
	and r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030E4A:
	mov r1, #1
	strb r1, [r0, #1]
	pop {r4, pc}
_02030E50:
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02030E18

	thumb_func_start sub_02030E58
sub_02030E58: ; 0x02030E58
	push {r3, lr}
	cmp r1, #9
	beq _02030E64
	cmp r1, #0xa
	beq _02030E70
	b _02030E74
_02030E64:
	ldrb r0, [r0]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	pop {r3, pc}
_02030E70:
	ldrb r0, [r0, #1]
	pop {r3, pc}
_02030E74:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02030E58

	thumb_func_start sub_02030E7C
sub_02030E7C: ; 0x02030E7C
	ldr r3, _02030E84 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x48
	bx r3
	.balign 4, 0
_02030E84: .word MI_CpuFill8
	thumb_func_end sub_02030E7C

	thumb_func_start sub_02030E88
sub_02030E88: ; 0x02030E88
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030E88

	thumb_func_start sub_02030E98
sub_02030E98: ; 0x02030E98
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_02030E98

	thumb_func_start sub_02030EA0
sub_02030EA0: ; 0x02030EA0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #8
	lsr r1, r1, #0x1c
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_02030EA0

	thumb_func_start sub_02030EB4
sub_02030EB4: ; 0x02030EB4
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #7
	bhi _02030F2E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030EC8: ; jump table
	.short _02030ED8 - _02030EC8 - 2 ; case 0
	.short _02030EEA - _02030EC8 - 2 ; case 1
	.short _02030EFC - _02030EC8 - 2 ; case 2
	.short _02030F02 - _02030EC8 - 2 ; case 3
	.short _02030F08 - _02030EC8 - 2 ; case 4
	.short _02030F12 - _02030EC8 - 2 ; case 5
	.short _02030F1C - _02030EC8 - 2 ; case 6
	.short _02030F24 - _02030EC8 - 2 ; case 7
_02030ED8:
	ldrb r4, [r0]
	ldrb r2, [r3]
	mov r1, #7
	bic r4, r1
	mov r1, #7
	and r1, r2
	orr r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030EEA:
	ldrb r2, [r0]
	mov r1, #0x10
	bic r2, r1
	ldrb r1, [r3]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1b
	orr r1, r2
	strb r1, [r0]
	pop {r4, pc}
_02030EFC:
	ldrb r1, [r3]
	strb r1, [r0, #1]
	pop {r4, pc}
_02030F02:
	ldrb r1, [r3]
	strb r1, [r0, #2]
	pop {r4, pc}
_02030F08:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #6]
	pop {r4, pc}
_02030F12:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0xe]
	pop {r4, pc}
_02030F1C:
	ldrb r1, [r3]
	add r0, r0, r2
	strb r1, [r0, #3]
	pop {r4, pc}
_02030F24:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x2a]
	pop {r4, pc}
_02030F2E:
	bl GF_AssertFail
	pop {r4, pc}
	thumb_func_end sub_02030EB4

	thumb_func_start sub_02030F34
sub_02030F34: ; 0x02030F34
	push {r3, lr}
	cmp r1, #7
	bhi _02030F8C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030F46: ; jump table
	.short _02030F56 - _02030F46 - 2 ; case 0
	.short _02030F5E - _02030F46 - 2 ; case 1
	.short _02030F66 - _02030F46 - 2 ; case 2
	.short _02030F6A - _02030F46 - 2 ; case 3
	.short _02030F6E - _02030F46 - 2 ; case 4
	.short _02030F76 - _02030F46 - 2 ; case 5
	.short _02030F7E - _02030F46 - 2 ; case 6
	.short _02030F84 - _02030F46 - 2 ; case 7
_02030F56:
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	pop {r3, pc}
_02030F5E:
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02030F66:
	ldrb r0, [r0, #1]
	pop {r3, pc}
_02030F6A:
	ldrb r0, [r0, #2]
	pop {r3, pc}
_02030F6E:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #6]
	pop {r3, pc}
_02030F76:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0xe]
	pop {r3, pc}
_02030F7E:
	add r0, r0, r2
	ldrb r0, [r0, #3]
	pop {r3, pc}
_02030F84:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x2a]
	pop {r3, pc}
_02030F8C:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02030F34

	thumb_func_start sub_02030F94
sub_02030F94: ; 0x02030F94
	ldr r3, _02030F9C ; =MI_CpuFill8
	mov r1, #0
	mov r2, #4
	bx r3
	.balign 4, 0
_02030F9C: .word MI_CpuFill8
	thumb_func_end sub_02030F94

	thumb_func_start sub_02030FA0
sub_02030FA0: ; 0x02030FA0
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _02030FAC ; =0x00001624
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_02030FAC: .word 0x00001624
	thumb_func_end sub_02030FA0

	thumb_func_start sub_02030FB0
sub_02030FB0: ; 0x02030FB0
	push {r4, lr}
	ldr r3, [sp, #8]
	cmp r1, #8
	bne _02030FDC
	ldrb r1, [r3]
	cmp r1, #1
	blo _02030FCA
	mov r1, #1
	ldrb r3, [r0]
	lsl r1, r2
	orr r1, r3
	strb r1, [r0]
	pop {r4, pc}
_02030FCA:
	mov r1, #1
	add r3, r1, #0
	ldrb r4, [r0]
	lsl r3, r2
	mov r1, #0xff
	eor r1, r3
	and r1, r4
	strb r1, [r0]
	pop {r4, pc}
_02030FDC:
	bl GF_AssertFail
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02030FB0

	thumb_func_start sub_02030FE4
sub_02030FE4: ; 0x02030FE4
	push {r3, lr}
	cmp r1, #8
	bne _02030FF6
	ldrb r0, [r0]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	pop {r3, pc}
_02030FF6:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02030FE4

	thumb_func_start sub_02031000
sub_02031000: ; 0x02031000
	ldr r0, _02031004 ; =0x00001628
	bx lr
	.balign 4, 0
_02031004: .word 0x00001628
	thumb_func_end sub_02031000

	thumb_func_start sub_02031008
sub_02031008: ; 0x02031008
	push {r4, lr}
	ldr r2, _02031058 ; =0x00001628
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, _0203105C ; =0x00000954
	add r0, r4, r0
	bl sub_0202D240
	ldr r0, _02031060 ; =0x00000ABC
	add r0, r4, r0
	bl sub_0202D254
	ldr r0, _02031064 ; =0x00000ADC
	add r0, r4, r0
	bl sub_0202D274
	ldr r0, _02031068 ; =0x00001618
	add r0, r4, r0
	bl sub_02030A98
	ldr r0, _0203106C ; =0x0000161C
	add r0, r4, r0
	bl sub_02030C50
	ldr r0, _02031070 ; =0x00001620
	add r0, r4, r0
	bl sub_02030DFC
	ldr r0, _02031074 ; =0x00001624
	add r0, r4, r0
	bl sub_02030F94
	ldr r1, _02031078 ; =_021D2AFC
	ldr r2, _02031058 ; =0x00001628
	add r0, r4, #0
	bl MI_CpuCopy8
	pop {r4, pc}
	.balign 4, 0
_02031058: .word 0x00001628
_0203105C: .word 0x00000954
_02031060: .word 0x00000ABC
_02031064: .word 0x00000ADC
_02031068: .word 0x00001618
_0203106C: .word 0x0000161C
_02031070: .word 0x00001620
_02031074: .word 0x00001624
_02031078: .word _021D2AFC
	thumb_func_end sub_02031008

	thumb_func_start sub_0203107C
sub_0203107C: ; 0x0203107C
	ldr r0, _02031080 ; =_021D2AFC
	bx lr
	.balign 4, 0
_02031080: .word _021D2AFC
	thumb_func_end sub_0203107C

	thumb_func_start sub_02031084
sub_02031084: ; 0x02031084
	push {r3, lr}
	mov r1, #0x13
	bl SaveArray_Get
	add r1, r0, #0
	ldr r0, _02031098 ; =_021D2AFC
	ldr r2, _0203109C ; =0x00001628
	bl MI_CpuCopy8
	pop {r3, pc}
	.balign 4, 0
_02031098: .word _021D2AFC
_0203109C: .word 0x00001628
	thumb_func_end sub_02031084

	thumb_func_start sub_020310A0
sub_020310A0: ; 0x020310A0
	push {r3, lr}
	mov r1, #0x13
	bl SaveArray_Get
	ldr r1, _020310B4 ; =_021D2AFC
	ldr r2, _020310B8 ; =0x00001628
	bl MI_CpuCopy8
	pop {r3, pc}
	nop
_020310B4: .word _021D2AFC
_020310B8: .word 0x00001628
	thumb_func_end sub_020310A0

	thumb_func_start sub_020310BC
sub_020310BC: ; 0x020310BC
	push {r3, lr}
	cmp r1, #0x70
	bge _020310E6
	cmp r1, #0x64
	blt _020310E0
	cmp r2, #0x10
	blt _020310CE
	add r1, r1, #1
	sub r2, #0x10
_020310CE:
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
	add r1, r0, #0
	asr r1, r2
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
_020310E0:
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
	pop {r3, pc}
_020310E6:
	mov r3, #0
	mvn r3, r3
	cmp r2, r3
	bne _020310F6
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_020310F6:
	lsl r2, r2, #6
	sub r1, #0x70
	add r2, r0, r2
	lsl r0, r1, #1
	add r0, r2, r0
	add r0, #0xe0
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020310BC

	thumb_func_start sub_02031108
sub_02031108: ; 0x02031108
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02031180 ; =0x0000270F
	add r7, r3, #0
	add r5, r1, #0
	add r4, r2, #0
	cmp r7, r0
	bls _0203111A
	add r7, r0, #0
_0203111A:
	cmp r5, #0x70
	bge _02031166
	cmp r5, #0x64
	blt _02031158
	cmp r4, #0xff
	bne _0203112A
	bl GF_AssertFail
_0203112A:
	cmp r4, #0x10
	blt _02031132
	add r5, r5, #1
	sub r4, #0x10
_02031132:
	cmp r7, #0
	bne _0203114A
	mov r2, #1
	add r3, r2, #0
	lsl r1, r5, #1
	ldrh r0, [r6, r1]
	lsl r3, r4
	ldr r2, _02031184 ; =0x0000FFFF
	eor r2, r3
	and r0, r2
	strh r0, [r6, r1]
	b _0203117C
_0203114A:
	lsl r2, r5, #1
	mov r0, #1
	ldrh r1, [r6, r2]
	lsl r0, r4
	orr r0, r1
	strh r0, [r6, r2]
	b _0203117C
_02031158:
	cmp r4, #0xff
	beq _02031160
	bl GF_AssertFail
_02031160:
	lsl r0, r5, #1
	strh r7, [r6, r0]
	b _0203117C
_02031166:
	cmp r4, #0xff
	bne _0203116E
	bl GF_AssertFail
_0203116E:
	lsl r0, r4, #6
	sub r5, #0x70
	add r1, r6, r0
	lsl r0, r5, #1
	add r0, r1, r0
	add r0, #0xe0
	strh r7, [r0]
_0203117C:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02031180: .word 0x0000270F
_02031184: .word 0x0000FFFF
	thumb_func_end sub_02031108

	thumb_func_start sub_02031188
sub_02031188: ; 0x02031188
	push {r4, lr}
	mov r2, #2
	add r4, r0, #0
	add r0, #0xe0
	mov r1, #0
	lsl r2, r2, #0xa
	bl MI_CpuFill8
	mov r1, #0x64
	add r4, #0xc8
	mov r0, #0
_0203119E:
	add r1, r1, #1
	strh r0, [r4]
	add r4, r4, #2
	cmp r1, #0x6f
	ble _0203119E
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02031188

	thumb_func_start sub_020311AC
sub_020311AC: ; 0x020311AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	cmp r5, #0xff
	bne _020311BA
	bl GF_AssertFail
_020311BA:
	cmp r5, #0x1f
	bge _02031200
	add r0, r6, #0
	str r0, [sp]
	add r0, #0xe0
	lsl r1, r5, #6
	str r0, [sp]
	add r7, r0, r1
_020311CA:
	add r0, r5, #1
	lsl r1, r0, #6
	ldr r0, [sp]
	mov r2, #0x40
	add r0, r0, r1
	add r1, r7, #0
	bl MI_CpuCopy8
	mov r4, #0x64
_020311DC:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #1
	bl sub_020310BC
	add r3, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02031108
	add r4, r4, #2
	cmp r4, #0x6f
	blt _020311DC
	add r5, r5, #1
	add r7, #0x40
	cmp r5, #0x1f
	blt _020311CA
_02031200:
	mov r0, #0x1f
	add r6, #0xe0
	lsl r0, r0, #6
	add r0, r6, r0
	mov r1, #0
	mov r2, #0x40
	bl MI_CpuFill8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020311AC

	thumb_func_start sub_02031214
sub_02031214: ; 0x02031214
	ldr r3, _02031224 ; =MI_CpuFill8
	add r0, #0xe0
	lsl r1, r1, #6
	add r0, r0, r1
	mov r1, #0
	mov r2, #0x40
	bx r3
	nop
_02031224: .word MI_CpuFill8
	thumb_func_end sub_02031214

	thumb_func_start sub_02031228
sub_02031228: ; 0x02031228
	push {r3, r4, r5, r6, r7, lr}
	add r4, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl sub_020310BC
	add r0, r0, r4
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02031108
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02031228

	thumb_func_start sub_02031248
sub_02031248: ; 0x02031248
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_020310BC
	sub r3, r0, r4
	bpl _0203125C
	mov r3, #0
_0203125C:
	lsl r3, r3, #0x10
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	lsr r3, r3, #0x10
	bl sub_02031108
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02031248

	thumb_func_start sub_0203126C
sub_0203126C: ; 0x0203126C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_020310BC
	cmp r0, r4
	bhs _0203128C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	add r3, r4, #0
	bl sub_02031108
	pop {r3, r4, r5, r6, r7, pc}
_0203128C:
	ldr r3, _020312A0 ; =0x0000270F
	cmp r0, r3
	bls _0203129C
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02031108
_0203129C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020312A0: .word 0x0000270F
	thumb_func_end sub_0203126C

	thumb_func_start sub_020312A4
sub_020312A4: ; 0x020312A4
	mov r0, #0xba
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020312A4

	thumb_func_start sub_020312AC
sub_020312AC: ; 0x020312AC
	push {r4, lr}
	mov r2, #0xba
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020312AC

	thumb_func_start sub_020312C4
sub_020312C4: ; 0x020312C4
	ldr r3, _020312C8 ; =sub_02027144
	bx r3
	.balign 4, 0
_020312C8: .word sub_02027144
	thumb_func_end sub_020312C4

	thumb_func_start sub_020312CC
sub_020312CC: ; 0x020312CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02027158
	add r4, r0, #0
	add r0, r5, #0
	bl SaveGameNormal
	orr r0, r4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020312CC

	thumb_func_start sub_020312E0
sub_020312E0: ; 0x020312E0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl Save_CheckExtraChunksExist
	cmp r0, #0
	bne _020312F4
	mov r0, #0
	pop {r4, r5, r6, pc}
_020312F4:
	cmp r4, #0
	beq _02031302
	cmp r4, #1
	beq _0203130A
	cmp r4, #2
	beq _02031314
	b _02031320
_02031302:
	lsl r0, r6, #1
	add r0, r5, r0
	ldrh r0, [r0, #4]
	pop {r4, r5, r6, pc}
_0203130A:
	lsl r0, r6, #1
	add r1, r5, r0
	ldr r0, _02031328 ; =0x000003E2
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, pc}
_02031314:
	lsl r0, r6, #1
	add r1, r5, r0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, pc}
_02031320:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02031328: .word 0x000003E2
	thumb_func_end sub_020312E0

	thumb_func_start sub_0203132C
sub_0203132C: ; 0x0203132C
	push {r4, lr}
	ldr r4, _02031370 ; =0x0000270F
	cmp r3, r4
	bls _02031336
	add r3, r4, #0
_02031336:
	cmp r1, #0
	beq _02031344
	cmp r1, #1
	beq _0203134C
	cmp r1, #2
	beq _02031356
	b _02031362
_02031344:
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #4]
	b _0203136A
_0203134C:
	lsl r1, r2, #1
	add r1, r0, r1
	ldr r0, _02031374 ; =0x000003E2
	strh r3, [r1, r0]
	b _0203136A
_02031356:
	lsl r1, r2, #1
	add r1, r0, r1
	mov r0, #0x1f
	lsl r0, r0, #6
	strh r3, [r1, r0]
	b _0203136A
_02031362:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0203136A:
	add r0, r3, #0
	pop {r4, pc}
	nop
_02031370: .word 0x0000270F
_02031374: .word 0x000003E2
	thumb_func_end sub_0203132C

	thumb_func_start sub_02031378
sub_02031378: ; 0x02031378
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl Save_CheckExtraChunksExist
	cmp r0, #0
	bne _0203138E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203138E:
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_020312E0
	add r1, sp, #8
	ldrh r3, [r1, #0x10]
	cmp r0, r3
	bhs _020313AE
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0203132C
	pop {r3, r4, r5, r6, r7, pc}
_020313AE:
	ldr r3, _020313C0 ; =0x0000270F
	cmp r0, r3
	bls _020313BE
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0203132C
_020313BE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020313C0: .word 0x0000270F
	thumb_func_end sub_02031378

	thumb_func_start sub_020313C4
sub_020313C4: ; 0x020313C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0
	add r6, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r4, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	str r0, [sp, #0xc]
	cmp r6, #0x22
	blt _020313E0
	cmp r6, #0x3c
	ble _020313E4
_020313E0:
	bl GF_AssertFail
_020313E4:
	ldr r1, [sp, #4]
	mov r0, #0
	sub r1, #0x24
	cmp r1, #0x18
	bhi _020313FC
	mov r3, #1
	add r2, r3, #0
	lsl r2, r1
	ldr r1, _020314A0 ; =0x01001001
	tst r1, r2
	beq _020313FC
	add r0, r3, #0
_020313FC:
	cmp r0, #0
	bne _02031404
	bl GF_AssertFail
_02031404:
	mov r0, #1
	str r0, [r4]
	mov r0, #2
	str r0, [r7]
	ldr r0, [sp, #8]
	cmp r0, #0xff
	beq _02031418
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02031418:
	add r0, r5, #0
	bl Save_CheckExtraChunksExist
	cmp r0, #0
	bne _02031428
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02031428:
	add r0, r5, #0
	bl sub_0203107C
	ldr r2, [sp, #8]
	str r0, [sp, #0x18]
	add r1, r6, #0
	bl sub_020310BC
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_020310BC
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x34]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020312C4
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #1
	beq _0203145C
	mov r4, #0
	b _0203146A
_0203145C:
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020312E0
	add r4, r0, #0
_0203146A:
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x30]
	str r0, [sp]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02031378
	ldr r0, [sp, #0x14]
	cmp r0, r4
	beq _0203148E
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020312CC
	str r0, [r7]
	mov r0, #1
	str r0, [sp, #0xc]
_0203148E:
	cmp r6, #0
	beq _02031498
	add r0, r6, #0
	bl FreeToHeap
_02031498:
	ldr r0, [sp, #0xc]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_020314A0: .word 0x01001001
	thumb_func_end sub_020313C4

	thumb_func_start sub_020314A4
sub_020314A4: ; 0x020314A4
	push {r4, lr}
	mov r1, #0x80
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x80
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020314A4

	thumb_func_start sub_020314BC
sub_020314BC: ; 0x020314BC
	ldr r3, _020314C0 ; =FreeToHeap
	bx r3
	.balign 4, 0
_020314C0: .word FreeToHeap
	thumb_func_end sub_020314BC

	thumb_func_start sub_020314C4
sub_020314C4: ; 0x020314C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl Save_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202CA44
	str r0, [sp]
	add r0, r6, #0
	bl Save_SysInfo_Get
	add r0, r6, #0
	bl Save_Misc_Const_Get
	add r7, r0, #0
	add r0, sp, #0x10
	bl OS_GetOwnerInfo
	add r0, r7, #0
	add r1, sp, #0xc
	add r2, sp, #8
	add r3, sp, #4
	bl SaveMisc_GetFavoriteMon
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x80
	bl MI_CpuFill8
	add r0, r4, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r5, #0
	bl CopyU16StringArray
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r5, #0x10]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r5, #0x14]
	ldr r0, [sp, #0xc]
	mov r1, #0xfe
	strh r0, [r5, #0x1c]
	ldrb r0, [r5, #0x1b]
	bic r0, r1
	ldr r1, [sp, #8]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x19
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r5, #0x1b]
	ldrb r0, [r5, #0x1b]
	mov r1, #1
	bic r0, r1
	ldr r1, [sp, #4]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #1
	and r1, r2
	orr r0, r1
	strb r0, [r5, #0x1b]
	ldr r0, [sp]
	bl sub_0202CA8C
	strb r0, [r5, #0x17]
	ldr r0, [sp]
	bl sub_0202CA90
	strb r0, [r5, #0x18]
	ldr r0, _020315B4 ; =0x0000FFFF
	mov r1, #0
	add r2, r5, #0
_02031566:
	add r1, r1, #1
	strh r0, [r2, #0x20]
	add r2, r2, #2
	cmp r1, #0x28
	blt _02031566
	add r1, r5, #0
	add r0, r7, #0
	add r1, #0x20
	bl SaveMisc_GetBattleGreeting
	add r0, sp, #4
	ldrb r0, [r0, #0xe]
	strb r0, [r5, #0x15]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r7, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetAvatar
	add r1, r0, #0
	add r0, r7, #0
	mov r2, #0
	bl GetUnionRoomAvatarAttrBySprite
	strb r0, [r5, #0x16]
	mov r0, #GAME_VERSION
	strb r0, [r5, #0x19]
	mov r0, #2
	strb r0, [r5, #0x1a]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0x7c
	bl SaveArray_CalcCRC16
	add r5, #0x7c
	strh r0, [r5]
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020315B4: .word 0x0000FFFF
	thumb_func_end sub_020314C4

	thumb_func_start sub_020315B8
sub_020315B8: ; 0x020315B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xf
	bl String_New
	add r1, r5, #0
	mov r2, #0xf
	add r4, r0, #0
	bl CopyU16ArrayToStringN
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020315B8

	thumb_func_start sub_020315D0
sub_020315D0: ; 0x020315D0
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _020315DC
	cmp r0, #1
	beq _020315DC
	mov r0, #0
_020315DC:
	bx lr
	.balign 4, 0
	thumb_func_end sub_020315D0

	thumb_func_start sub_020315E0
sub_020315E0: ; 0x020315E0
	ldrh r0, [r0, #0x1c]
	ldr r1, _020315EC ; =0x000001EF
	cmp r0, r1
	blo _020315EA
	mov r0, #0
_020315EA:
	bx lr
	.balign 4, 0
_020315EC: .word 0x000001EF
	thumb_func_end sub_020315E0

	thumb_func_start sub_020315F0
sub_020315F0: ; 0x020315F0
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #0x1c]
	ldr r1, _0203160C ; =0x000001EF
	cmp r0, r1
	blo _02031600
	mov r0, #0
	pop {r3, pc}
_02031600:
	ldrb r1, [r2, #0x1b]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	bl sub_02070438
	pop {r3, pc}
	.balign 4, 0
_0203160C: .word 0x000001EF
	thumb_func_end sub_020315F0

	thumb_func_start sub_02031610
sub_02031610: ; 0x02031610
	ldrb r0, [r0, #0x1b]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bls _0203161C
	mov r0, #1
_0203161C:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031610

	thumb_func_start sub_02031620
sub_02031620: ; 0x02031620
	ldrb r0, [r0, #0x17]
	cmp r0, #0xea
	blo _02031628
	mov r0, #0
_02031628:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031620

	thumb_func_start sub_0203162C
sub_0203162C: ; 0x0203162C
	push {r4, lr}
	ldrb r1, [r0, #0x17]
	cmp r1, #0xea
	blo _02031638
	mov r0, #0
	pop {r4, pc}
_02031638:
	ldrb r4, [r0, #0x18]
	add r0, r1, #0
	bl LocationGmmDatRegionCountGetByCountryMsgNo
	cmp r0, r4
	bhs _02031646
	mov r4, #0
_02031646:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203162C

	thumb_func_start sub_0203164C
sub_0203164C: ; 0x0203164C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #0x1e]
	add r4, r1, #0
	mov r6, #0
	cmp r0, #0
	bne _020316CE
	ldrh r0, [r5, #0x20]
	strh r0, [r4]
	ldrh r0, [r5, #0x22]
	strh r0, [r4, #2]
	ldrh r0, [r5, #0x24]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x26]
	strh r0, [r4, #6]
	ldrh r0, [r4]
	cmp r0, #5
	blo _02031676
	add r6, r6, #1
	b _020316AA
_02031676:
	ldrh r0, [r4, #2]
	cmp r0, #0x13
	bls _02031680
	add r6, r6, #1
	b _020316AA
_02031680:
	ldrh r0, [r4, #4]
	ldr r1, _020316E8 ; =0x0000FFFF
	cmp r0, r1
	beq _02031694
	add r1, sp, #4
	add r2, sp, #0
	bl GetCategoryAndMsgNoByECWordIdx
	cmp r0, #0
	beq _020316A8
_02031694:
	ldrh r0, [r4, #6]
	ldr r1, _020316E8 ; =0x0000FFFF
	cmp r0, r1
	beq _020316AA
	add r1, sp, #4
	add r2, sp, #0
	bl GetCategoryAndMsgNoByECWordIdx
	cmp r0, #0
	bne _020316AA
_020316A8:
	add r6, r6, #1
_020316AA:
	cmp r6, #0
	ble _020316C8
	add r0, r4, #0
	mov r1, #4
	bl MailMsg_Init_WithBank
	mov r0, #0
	strh r0, [r4, #2]
	ldr r0, _020316EC ; =0x0000011F
	mov r1, #0x63
	bl GetECWordIndexByPair
	strh r0, [r4, #4]
	ldr r0, _020316E8 ; =0x0000FFFF
	strh r0, [r4, #6]
_020316C8:
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_020316CE:
	mov r0, #0x28
	add r1, r2, #0
	bl String_New
	add r5, #0x20
	add r1, r5, #0
	mov r2, #0x28
	add r4, r0, #0
	bl CopyU16ArrayToStringN
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020316E8: .word 0x0000FFFF
_020316EC: .word 0x0000011F
	thumb_func_end sub_0203164C

	thumb_func_start sub_020316F0
sub_020316F0: ; 0x020316F0
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	blo _020316FA
	cmp r0, #0xc
	bls _020316FC
_020316FA:
	mov r0, #1
_020316FC:
	bx lr
	.balign 4, 0
	thumb_func_end sub_020316F0

	thumb_func_start sub_02031700
sub_02031700: ; 0x02031700
	ldrb r0, [r0, #0x16]
	cmp r0, #0xf
	bls _02031708
	mov r0, #0
_02031708:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031700
