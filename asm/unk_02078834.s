#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public _020FF639
	.public _021D43B0

	.text

	thumb_func_start sub_02078834
sub_02078834: ; 0x02078834
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0x19
	bls _0207884E
	b _02078B1C
_0207884E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0207885A: ; jump table
	.short _0207888E - _0207885A - 2 ; case 0
	.short _02078894 - _0207885A - 2 ; case 1
	.short _020788B8 - _0207885A - 2 ; case 2
	.short _020788CA - _0207885A - 2 ; case 3
	.short _0207899C - _0207885A - 2 ; case 4
	.short _020789B2 - _0207885A - 2 ; case 5
	.short _020789B8 - _0207885A - 2 ; case 6
	.short _020789C6 - _0207885A - 2 ; case 7
	.short _020789CC - _0207885A - 2 ; case 8
	.short _020789E8 - _0207885A - 2 ; case 9
	.short _020789E8 - _0207885A - 2 ; case 10
	.short _020789E8 - _0207885A - 2 ; case 11
	.short _020789FE - _0207885A - 2 ; case 12
	.short _02078A16 - _0207885A - 2 ; case 13
	.short _02078A2C - _0207885A - 2 ; case 14
	.short _02078A3E - _0207885A - 2 ; case 15
	.short _02078A52 - _0207885A - 2 ; case 16
	.short _02078A66 - _0207885A - 2 ; case 17
	.short _02078A7C - _0207885A - 2 ; case 18
	.short _02078A8E - _0207885A - 2 ; case 19
	.short _02078AA2 - _0207885A - 2 ; case 20
	.short _02078AB6 - _0207885A - 2 ; case 21
	.short _02078ACC - _0207885A - 2 ; case 22
	.short _02078ADE - _0207885A - 2 ; case 23
	.short _02078AF2 - _0207885A - 2 ; case 24
	.short _02078B06 - _0207885A - 2 ; case 25
_0207888E:
	ldr r1, [r5, #0xc]
	ldr r0, [r4]
	str r1, [r0]
_02078894:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #1
	bne _020788E6
	ldr r0, [r5, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _020788E6
	mov r0, #0xa
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	mov r1, #0
	strh r1, [r0]
	b _02078B20
_020788B8:
	ldr r1, _02078B24 ; =_02101290
	ldr r2, [r4]
	add r0, r6, #0
	bl sub_02050624
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_020788CA:
	ldr r0, [r5, #0xc]
	bl sub_0203A05C
	cmp r0, #0
	beq _020788DE
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066950
_020788DE:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #0xf
	bls _020788E8
_020788E6:
	b _02078B20
_020788E8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020788F4: ; jump table
	.short _02078B20 - _020788F4 - 2 ; case 0
	.short _02078920 - _020788F4 - 2 ; case 1
	.short _0207892E - _020788F4 - 2 ; case 2
	.short _02078914 - _020788F4 - 2 ; case 3
	.short _0207894A - _020788F4 - 2 ; case 4
	.short _02078958 - _020788F4 - 2 ; case 5
	.short _0207893C - _020788F4 - 2 ; case 6
	.short _02078966 - _020788F4 - 2 ; case 7
	.short _02078978 - _020788F4 - 2 ; case 8
	.short _02078996 - _020788F4 - 2 ; case 9
	.short _0207896C - _020788F4 - 2 ; case 10
	.short _02078B20 - _020788F4 - 2 ; case 11
	.short _0207897E - _020788F4 - 2 ; case 12
	.short _02078984 - _020788F4 - 2 ; case 13
	.short _0207898A - _020788F4 - 2 ; case 14
	.short _02078990 - _020788F4 - 2 ; case 15
_02078914:
	mov r0, #0
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_02078920:
	mov r0, #0x32
	strb r0, [r4, #0xc]
	mov r0, #0
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_0207892E:
	mov r0, #0x64
	strb r0, [r4, #0xc]
	mov r0, #0
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_0207893C:
	mov r0, #0
	strb r0, [r4, #0xc]
	mov r0, #1
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_0207894A:
	mov r0, #0x32
	strb r0, [r4, #0xc]
	mov r0, #1
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_02078958:
	mov r0, #0x64
	strb r0, [r4, #0xc]
	mov r0, #1
	strb r0, [r4, #0xd]
	mov r0, #4
	str r0, [r4, #4]
	b _02078B20
_02078966:
	mov r0, #6
	str r0, [r4, #4]
	b _02078B20
_0207896C:
	ldr r0, [r4, #8]
	mov r1, #1
	strh r1, [r0]
	mov r0, #0xb
	str r0, [r4, #4]
	b _02078B20
_02078978:
	mov r0, #9
	str r0, [r4, #4]
	b _02078B20
_0207897E:
	mov r0, #0xc
	str r0, [r4, #4]
	b _02078B20
_02078984:
	mov r0, #0xe
	str r0, [r4, #4]
	b _02078B20
_0207898A:
	mov r0, #0x12
	str r0, [r4, #4]
	b _02078B20
_02078990:
	mov r0, #0x16
	str r0, [r4, #4]
	b _02078B20
_02078996:
	mov r0, #8
	str r0, [r4, #4]
	b _02078B20
_0207899C:
	ldr r1, [r4]
	ldrb r2, [r4, #0xc]
	ldrb r3, [r4, #0xd]
	ldr r1, [r1, #8]
	add r0, r6, #0
	bl sub_020514A4
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_020789B2:
	mov r0, #2
	str r0, [r4, #4]
	b _02078B20
_020789B8:
	add r0, r6, #0
	bl sub_0203F4A8
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_020789C6:
	mov r0, #2
	str r0, [r4, #4]
	b _02078B20
_020789CC:
	ldr r2, _02078B28 ; =0x00040100
	mov r0, #3
	mov r1, #0x35
	bl CreateHeap
	bl LoadOVY13
	mov r0, #0x35
	bl ov13_0221BA00
	mov r0, #0
	bl OS_ResetSystem
	b _02078B20
_020789E8:
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_020789FE:
	mov r0, #0
	bl sub_020378E4
	add r0, r5, #0
	mov r1, #0
	bl sub_020968B0
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078A16:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02078B20
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #2
	str r0, [r4, #4]
	b _02078B20
_02078A2C:
	add r1, r5, #0
	mov r2, #0xb
	mov r3, #1
	bl sub_02078B9C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078A3E:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02078B20
	add r0, r4, #0
	bl sub_02078BD8
	str r0, [r4, #4]
	b _02078B20
_02078A52:
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #0xb
	bl sub_02078C18
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078A66:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02078B20
	mov r0, #2
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl sub_02078C60
	b _02078B20
_02078A7C:
	add r1, r5, #0
	mov r2, #0xb
	mov r3, #2
	bl sub_02078B9C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078A8E:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02078B20
	add r0, r4, #0
	bl sub_02078BD8
	str r0, [r4, #4]
	b _02078B20
_02078AA2:
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #0xb
	bl sub_02078C74
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078AB6:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02078B20
	mov r0, #2
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl sub_02078CB4
	b _02078B20
_02078ACC:
	add r1, r5, #0
	mov r2, #0xb
	mov r3, #3
	bl sub_02078B9C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078ADE:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02078B20
	add r0, r4, #0
	bl sub_02078BD8
	str r0, [r4, #4]
	b _02078B20
_02078AF2:
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #0xb
	bl sub_02078CC8
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02078B20
_02078B06:
	add r0, r5, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02078B20
	mov r0, #2
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl sub_02078D10
	b _02078B20
_02078B1C:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02078B20:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078B24: .word _02101290
_02078B28: .word 0x00040100
	thumb_func_end sub_02078834

	thumb_func_start sub_02078B2C
sub_02078B2C: ; 0x02078B2C
	push {r4, lr}
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x18
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xc
	str r0, [r4]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02078B2C

	thumb_func_start sub_02078B58
sub_02078B58: ; 0x02078B58
	push {r4, lr}
	add r4, r0, #0
	bl sub_02078B2C
	add r2, r0, #0
	ldr r0, [r2]
	mov r1, #2
	str r1, [r0, #4]
	ldr r1, _02078B74 ; =sub_02078834
	add r0, r4, #0
	bl sub_02050530
	pop {r4, pc}
	nop
_02078B74: .word sub_02078834
	thumb_func_end sub_02078B58

	thumb_func_start sub_02078B78
sub_02078B78: ; 0x02078B78
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02078B2C
	add r2, r0, #0
	ldr r0, [r2]
	mov r1, #1
	str r1, [r0, #4]
	ldr r1, _02078B98 ; =sub_02078834
	add r0, r5, #0
	str r4, [r2, #8]
	bl sub_02050530
	pop {r3, r4, r5, pc}
	nop
_02078B98: .word sub_02078834
	thumb_func_end sub_02078B78

	thumb_func_start sub_02078B9C
sub_02078B9C: ; 0x02078B9C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	mov r1, #0xc
	add r4, r3, #0
	bl AllocFromHeap
	add r2, r0, #0
	strb r4, [r2]
	mov r0, #2
	strb r0, [r2, #1]
	ldr r0, _02078BD0 ; =_0210125C
	ldr r1, _02078BD4 ; =_02101280
	ldrb r0, [r0, r4]
	strb r0, [r2, #2]
	mov r0, #0
	strb r0, [r2, #3]
	strb r0, [r2, #4]
	ldr r0, [r5, #0xc]
	str r0, [r2, #8]
	add r0, r5, #0
	str r2, [r6, #0x10]
	bl ScrUnk80_AddOvyMan
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078BD0: .word _0210125C
_02078BD4: .word _02101280
	thumb_func_end sub_02078B9C

	thumb_func_start sub_02078BD8
sub_02078BD8: ; 0x02078BD8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	ldrb r1, [r0, #3]
	cmp r1, #1
	bne _02078C04
	ldrb r1, [r0]
	cmp r1, #1
	beq _02078BF2
	cmp r1, #2
	beq _02078BF8
	cmp r1, #3
	b _02078BFE
_02078BF2:
	mov r1, #0x10
	str r1, [r4, #4]
	b _02078C08
_02078BF8:
	mov r1, #0x14
	str r1, [r4, #4]
	b _02078C08
_02078BFE:
	mov r1, #0x18
	str r1, [r4, #4]
	b _02078C08
_02078C04:
	mov r1, #1
	str r1, [r4, #4]
_02078C08:
	ldrb r0, [r0, #4]
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	ldr r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02078BD8

	thumb_func_start sub_02078C18
sub_02078C18: ; 0x02078C18
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x3c
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x3c
	bl memset
	add r0, r4, #0
	add r0, #0x38
	strb r6, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x39
	strb r1, [r0]
	ldr r0, [r5, #0xc]
	mov r1, #2
	str r0, [r4, #0x34]
	ldr r0, _02078C58 ; =SDK_OVERLAY_OVY_90_ID
	bl HandleLoadOverlay
	ldr r1, _02078C5C ; =_02101260
	add r0, r5, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078C58: .word SDK_OVERLAY_OVY_90_ID
_02078C5C: .word _02101260
	thumb_func_end sub_02078C18

	thumb_func_start sub_02078C60
sub_02078C60: ; 0x02078C60
	push {r3, lr}
	bl FreeToHeap
	ldr r0, _02078C70 ; =SDK_OVERLAY_OVY_90_ID
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_02078C70: .word SDK_OVERLAY_OVY_90_ID
	thumb_func_end sub_02078C60

	thumb_func_start sub_02078C74
sub_02078C74: ; 0x02078C74
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x40
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x40
	bl memset
	str r6, [r4, #0x3c]
	mov r0, #0
	str r0, [r4, #0x38]
	ldr r0, [r5, #0xc]
	mov r1, #2
	str r0, [r4, #0x34]
	ldr r0, _02078CAC ; =SDK_OVERLAY_OVY_90_ID
	bl HandleLoadOverlay
	ldr r1, _02078CB0 ; =_02101270
	add r0, r5, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078CAC: .word SDK_OVERLAY_OVY_90_ID
_02078CB0: .word _02101270
	thumb_func_end sub_02078C74

	thumb_func_start sub_02078CB4
sub_02078CB4: ; 0x02078CB4
	push {r3, lr}
	bl FreeToHeap
	ldr r0, _02078CC4 ; =SDK_OVERLAY_OVY_90_ID
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_02078CC4: .word SDK_OVERLAY_OVY_90_ID
	thumb_func_end sub_02078CB4

	thumb_func_start sub_02078CC8
sub_02078CC8: ; 0x02078CC8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x3c
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x3c
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0x38
	strb r6, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x39
	strb r1, [r0]
	ldr r0, [r5, #0xc]
	mov r1, #2
	str r0, [r4, #0x34]
	ldr r0, _02078D08 ; =SDK_OVERLAY_OVY_90_ID
	bl HandleLoadOverlay
	ldr r1, _02078D0C ; =_021012A0
	add r0, r5, #0
	add r2, r4, #0
	bl ScrUnk80_AddOvyMan
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02078D08: .word SDK_OVERLAY_OVY_90_ID
_02078D0C: .word _021012A0
	thumb_func_end sub_02078CC8

	thumb_func_start sub_02078D10
sub_02078D10: ; 0x02078D10
	push {r3, lr}
	bl FreeToHeap
	ldr r0, _02078D20 ; =SDK_OVERLAY_OVY_90_ID
	bl UnloadOverlayByID
	pop {r3, pc}
	nop
_02078D20: .word SDK_OVERLAY_OVY_90_ID
	thumb_func_end sub_02078D10

	thumb_func_start sub_02078D24
sub_02078D24: ; 0x02078D24
	push {r4, lr}
	add r4, r0, #0
	bl sub_020398C8
	mov r1, #0x24
	ldrb r2, [r0, #0x1b]
	mul r1, r4
	add r0, r0, r1
	add r0, #0x3f
	ldrb r0, [r0]
	cmp r2, #0xc
	bne _02078D44
	cmp r0, #5
	bne _02078D44
	mov r0, #1
	pop {r4, pc}
_02078D44:
	cmp r2, #0xd
	bne _02078D50
	cmp r0, #6
	bne _02078D50
	mov r0, #1
	pop {r4, pc}
_02078D50:
	cmp r2, #0xe
	bne _02078D5C
	cmp r0, #7
	bne _02078D5C
	mov r0, #1
	pop {r4, pc}
_02078D5C:
	cmp r2, #9
	bne _02078D68
	cmp r0, #2
	bne _02078D68
	mov r0, #1
	pop {r4, pc}
_02078D68:
	cmp r2, #0xa
	bne _02078D74
	cmp r0, #3
	bne _02078D74
	mov r0, #1
	pop {r4, pc}
_02078D74:
	cmp r2, #0xb
	bne _02078D80
	cmp r0, #4
	bne _02078D80
	mov r0, #1
	pop {r4, pc}
_02078D80:
	cmp r2, #0xf
	bne _02078D8C
	cmp r0, #8
	bne _02078D8C
	mov r0, #1
	pop {r4, pc}
_02078D8C:
	cmp r2, #0x13
	bne _02078D98
	cmp r0, #0x12
	bne _02078D98
	mov r0, #1
	pop {r4, pc}
_02078D98:
	cmp r2, #0x15
	bne _02078DA4
	cmp r0, #0x14
	bne _02078DA4
	mov r0, #1
	pop {r4, pc}
_02078DA4:
	cmp r2, #0x17
	bne _02078DB0
	cmp r0, #0x16
	bne _02078DB0
	mov r0, #1
	pop {r4, pc}
_02078DB0:
	cmp r2, #0x19
	bne _02078DBC
	cmp r0, #0x18
	bne _02078DBC
	mov r0, #1
	pop {r4, pc}
_02078DBC:
	cmp r2, #0x1b
	bne _02078DC8
	cmp r0, #0x1a
	bne _02078DC8
	mov r0, #1
	pop {r4, pc}
_02078DC8:
	cmp r2, #0x10
	bne _02078DD4
	cmp r0, #1
	bne _02078DD4
	mov r0, #1
	pop {r4, pc}
_02078DD4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02078D24

	thumb_func_start sub_02078DD8
sub_02078DD8: ; 0x02078DD8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x24
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl memset
	mov r0, #0x1c
	strb r0, [r4, #0x1b]
	add r0, r5, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #0x1e]
	add r0, r5, #0
	bl PlayerProfile_GetAvatar
	strb r0, [r4, #0x1d]
	add r0, r5, #0
	bl PlayerProfile_GetVersion
	strb r0, [r4, #0x18]
	add r0, r5, #0
	bl PlayerProfile_GetLanguage
	strb r0, [r4, #0x19]
	add r0, r4, #0
	mov r1, #0x24
	bl ov00_021E6D60
	cmp r0, #1
	beq _02078E22
	bl GF_AssertFail
_02078E22:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02078DD8

	thumb_func_start sub_02078E28
sub_02078E28: ; 0x02078E28
	ldr r3, _02078E2C ; =FreeToHeap
	bx r3
	.balign 4, 0
_02078E2C: .word FreeToHeap
	thumb_func_end sub_02078E28

	thumb_func_start sub_02078E30
sub_02078E30: ; 0x02078E30
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl sub_0201A108
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02079014 ; =0xFFFFE0FF
	ldr r3, _02079018 ; =0x04001000
	and r2, r1
	str r2, [r0]
	ldr r2, [r3]
	add r0, #0x50
	and r1, r2
	str r1, [r3]
	mov r1, #0
	strh r1, [r0]
	add r3, #0x50
	ldr r2, _0207901C ; =0x04000304
	strh r1, [r3]
	ldrh r1, [r2]
	ldr r0, _02079020 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r1, #0xc
	mov r0, #3
	lsl r2, r1, #0xe
	bl CreateHeap
	mov r0, #0x15
	mov r1, #0xc
	bl NARC_ctor
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02079BD8
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xc
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	mov r3, #0
	bl sub_0200FA24
	add r0, r5, #0
	bl sub_02079CE4
	bl sub_02079700
	ldr r0, [r5]
	bl sub_02079758
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079A14
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	mov r1, #0
	mov r0, #0x39
	add r2, r1, #0
	bl sub_02004EC4
	add r0, r5, #0
	bl sub_0207CF98
	add r0, r5, #0
	bl sub_0207CDCC
	add r0, r5, #0
	bl sub_0207EB24
	add r0, r5, #0
	bl sub_0207EDD4
	add r0, r5, #0
	bl sub_02079D38
	add r0, r5, #0
	bl sub_0207A22C
	ldr r1, _02079024 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r2, #1
	bl sub_0207B51C
	ldr r1, _02079028 ; =0x00000654
	ldr r3, [r5, r1]
	add r0, r3, #0
	add r0, #0x24
	ldrb r2, [r0]
	cmp r2, #5
	beq _02078F1C
	cmp r2, #0x10
	bne _02078F32
_02078F1C:
	ldrh r0, [r3, #0x28]
	bl sub_020817C4
	cmp r0, #0
	bne _02078FE4
	add r0, r5, #0
	mov r1, #0x21
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F32:
	cmp r2, #6
	bne _02078F42
	add r0, r5, #0
	mov r1, #0x22
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F42:
	cmp r2, #9
	beq _02078F4A
	cmp r2, #0xe
	bne _02078F56
_02078F4A:
	add r0, r5, #0
	mov r1, #0x20
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F56:
	cmp r2, #7
	beq _02078F6A
	cmp r2, #8
	beq _02078F6A
	add r0, r2, #0
	add r0, #0xf5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02078F76
_02078F6A:
	ldr r0, _0207902C ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0200DD08
	b _02078FE4
_02078F76:
	cmp r2, #2
	beq _02078F7E
	cmp r2, #0x11
	bne _02078F8A
_02078F7E:
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F8A:
	cmp r2, #0xf
	bne _02078F9A
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078F9A:
	cmp r2, #0x15
	bne _02078FAA
	add r0, r5, #0
	mov r1, #0xb8
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078FAA:
	cmp r2, #0x16
	bne _02078FBA
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078FBA:
	cmp r2, #0x17
	bne _02078FCA
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078FCA:
	cmp r2, #0xa
	beq _02078FDA
	add r0, r5, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	b _02078FE4
_02078FDA:
	add r1, #0x24
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_0200DD08
_02078FE4:
	add r0, r5, #0
	bl sub_0207A89C
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _02079030 ; =sub_020796B8
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	mov r0, #2
	bl sub_0203A994
	mov r0, #4
	mov r1, #0xc
	bl sub_02002CEC
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02079014: .word 0xFFFFE0FF
_02079018: .word 0x04001000
_0207901C: .word 0x04000304
_02079020: .word 0xFFFF7FFF
_02079024: .word 0x00000C65
_02079028: .word 0x00000654
_0207902C: .word 0x00000678
_02079030: .word sub_020796B8
	thumb_func_end sub_02078E30

	thumb_func_start sub_02079034
sub_02079034: ; 0x02079034
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0x21
	bhi _020790AE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02079050: ; jump table
	.short _02079094 - _02079050 - 2 ; case 0
	.short _0207909C - _02079050 - 2 ; case 1
	.short _020790A4 - _02079050 - 2 ; case 2
	.short _020790B6 - _02079050 - 2 ; case 3
	.short _020790BE - _02079050 - 2 ; case 4
	.short _020790C6 - _02079050 - 2 ; case 5
	.short _020790D0 - _02079050 - 2 ; case 6
	.short _020790D8 - _02079050 - 2 ; case 7
	.short _020790E0 - _02079050 - 2 ; case 8
	.short _020790E8 - _02079050 - 2 ; case 9
	.short _020790F0 - _02079050 - 2 ; case 10
	.short _020790F8 - _02079050 - 2 ; case 11
	.short _02079100 - _02079050 - 2 ; case 12
	.short _02079108 - _02079050 - 2 ; case 13
	.short _02079110 - _02079050 - 2 ; case 14
	.short _02079118 - _02079050 - 2 ; case 15
	.short _02079120 - _02079050 - 2 ; case 16
	.short _02079128 - _02079050 - 2 ; case 17
	.short _02079130 - _02079050 - 2 ; case 18
	.short _02079138 - _02079050 - 2 ; case 19
	.short _02079140 - _02079050 - 2 ; case 20
	.short _02079148 - _02079050 - 2 ; case 21
	.short _02079150 - _02079050 - 2 ; case 22
	.short _02079158 - _02079050 - 2 ; case 23
	.short _02079160 - _02079050 - 2 ; case 24
	.short _02079168 - _02079050 - 2 ; case 25
	.short _02079170 - _02079050 - 2 ; case 26
	.short _02079178 - _02079050 - 2 ; case 27
	.short _02079180 - _02079050 - 2 ; case 28
	.short _02079198 - _02079050 - 2 ; case 29
	.short _020791A6 - _02079050 - 2 ; case 30
	.short _020791AE - _02079050 - 2 ; case 31
	.short _020791C8 - _02079050 - 2 ; case 32
	.short _020791D6 - _02079050 - 2 ; case 33
_02079094:
	bl sub_02079280
	str r0, [r4]
	b _020791EE
_0207909C:
	bl sub_02079308
	str r0, [r4]
	b _020791EE
_020790A4:
	add r1, r4, #0
	bl sub_0207BC1C
	cmp r0, #1
	beq _020790B0
_020790AE:
	b _020791EE
_020790B0:
	mov r0, #1
	str r0, [r4]
	b _020791EE
_020790B6:
	bl sub_02080B74
	str r0, [r4]
	b _020791EE
_020790BE:
	bl sub_020793C0
	str r0, [r4]
	b _020791EE
_020790C6:
	ldr r1, _02079214 ; =0x00000C54
	ldr r1, [r5, r1]
	blx r1
	str r0, [r4]
	b _020791EE
_020790D0:
	bl sub_02082738
	str r0, [r4]
	b _020791EE
_020790D8:
	bl sub_02081820
	str r0, [r4]
	b _020791EE
_020790E0:
	bl sub_02079400
	str r0, [r4]
	b _020791EE
_020790E8:
	bl sub_0207C728
	str r0, [r4]
	b _020791EE
_020790F0:
	bl sub_0207C74C
	str r0, [r4]
	b _020791EE
_020790F8:
	bl sub_0207C6BC
	str r0, [r4]
	b _020791EE
_02079100:
	bl sub_0207C6DC
	str r0, [r4]
	b _020791EE
_02079108:
	bl sub_0207C70C
	str r0, [r4]
	b _020791EE
_02079110:
	bl sub_0207C908
	str r0, [r4]
	b _020791EE
_02079118:
	bl sub_02079440
	str r0, [r4]
	b _020791EE
_02079120:
	bl sub_0207C400
	str r0, [r4]
	b _020791EE
_02079128:
	bl sub_0207F694
	str r0, [r4]
	b _020791EE
_02079130:
	bl sub_0207F6E8
	str r0, [r4]
	b _020791EE
_02079138:
	bl sub_0207F720
	str r0, [r4]
	b _020791EE
_02079140:
	bl sub_0207FA08
	str r0, [r4]
	b _020791EE
_02079148:
	bl sub_02079550
	str r0, [r4]
	b _020791EE
_02079150:
	bl sub_02082370
	str r0, [r4]
	b _020791EE
_02079158:
	bl sub_02080610
	str r0, [r4]
	b _020791EE
_02079160:
	bl sub_020794C8
	str r0, [r4]
	b _020791EE
_02079168:
	bl sub_020794EC
	str r0, [r4]
	b _020791EE
_02079170:
	bl sub_020794F0
	str r0, [r4]
	b _020791EE
_02079178:
	bl sub_020794FC
	str r0, [r4]
	b _020791EE
_02079180:
	bl sub_0207B600
	cmp r0, #0
	bne _0207918E
	mov r0, #0x1d
	str r0, [r4]
	b _020791EE
_0207918E:
	cmp r0, #3
	bne _020791EE
	mov r0, #1
	str r0, [r4]
	b _020791EE
_02079198:
	bl sub_0207FD6C
	cmp r0, #1
	bne _020791EE
	mov r0, #1
	str r0, [r4]
	b _020791EE
_020791A6:
	bl sub_0207BD78
	str r0, [r4]
	b _020791EE
_020791AE:
	bl ov94_021E593C
	cmp r0, #1
	bne _020791C2
	add r0, r5, #0
	bl sub_0207CB6C
	mov r0, #0x19
	str r0, [r4]
	b _020791EE
_020791C2:
	mov r0, #0x1f
	str r0, [r4]
	b _020791EE
_020791C8:
	mov r0, #1
	mov r1, #0xc
	bl sub_020880CC
	mov r0, #0x21
	str r0, [r4]
	b _020791EE
_020791D6:
	bl sub_0200FB5C
	cmp r0, #1
	bne _020791EE
	ldr r0, _02079218 ; =0x00000C65
	ldrb r1, [r5, r0]
	ldr r0, _0207921C ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x26
	strb r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_020791EE:
	add r0, r5, #0
	bl sub_0207F178
	add r0, r5, #0
	bl sub_0207F2F8
	add r0, r5, #0
	bl sub_0207AC20
	add r0, r5, #0
	bl sub_02079230
	ldr r0, _02079220 ; =0x0000065C
	ldr r0, [r5, r0]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02079214: .word 0x00000C54
_02079218: .word 0x00000C65
_0207921C: .word 0x00000654
_02079220: .word 0x0000065C
	thumb_func_end sub_02079034

	thumb_func_start sub_02079224
sub_02079224: ; 0x02079224
	ldr r2, _0207922C ; =0x00000C7C
	str r1, [r0, r2]
	bx lr
	nop
_0207922C: .word 0x00000C7C
	thumb_func_end sub_02079224

	thumb_func_start sub_02079230
sub_02079230: ; 0x02079230
	push {r3, lr}
	ldr r1, _02079278 ; =0x00000C7C
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _02079258
	sub r2, r1, #4
	ldr r3, [r0, r2]
	add r3, #0xc
	str r3, [r0, r2]
	ldr r2, [r0, r2]
	cmp r2, #0x28
	ble _0207924E
	mov r2, #0x28
	sub r1, r1, #4
	str r2, [r0, r1]
_0207924E:
	ldr r1, _0207927C ; =0x00000C78
	ldr r1, [r0, r1]
	bl sub_0207F334
	pop {r3, pc}
_02079258:
	sub r2, r1, #4
	ldr r3, [r0, r2]
	sub r3, #0xc
	str r3, [r0, r2]
	ldr r2, [r0, r2]
	cmp r2, #0
	bge _0207926C
	mov r2, #0
	sub r1, r1, #4
	str r2, [r0, r1]
_0207926C:
	ldr r1, _0207927C ; =0x00000C78
	ldr r1, [r0, r1]
	bl sub_0207F334
	pop {r3, pc}
	nop
_02079278: .word 0x00000C7C
_0207927C: .word 0x00000C78
	thumb_func_end sub_02079230

	thumb_func_start sub_02079280
sub_02079280: ; 0x02079280
	push {r4, lr}
	add r4, r0, #0
	bl sub_0200FB5C
	cmp r0, #1
	bne _020792FA
	ldr r0, _02079300 ; =0x00000654
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x24
	ldrb r1, [r0]
	cmp r1, #5
	beq _0207929E
	cmp r1, #0x10
	bne _020792B6
_0207929E:
	ldrh r0, [r2, #0x28]
	bl sub_020817C4
	cmp r0, #1
	bne _020792B2
	ldr r0, _02079304 ; =0x00000C62
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #7
	pop {r4, pc}
_020792B2:
	mov r0, #4
	pop {r4, pc}
_020792B6:
	cmp r1, #6
	bne _020792BE
	mov r0, #0x15
	pop {r4, pc}
_020792BE:
	cmp r1, #7
	bne _020792CA
	add r0, r4, #0
	bl sub_020822CC
	pop {r4, pc}
_020792CA:
	cmp r1, #8
	bne _020792D6
	add r0, r4, #0
	bl sub_02081ED0
	pop {r4, pc}
_020792D6:
	add r0, r1, #0
	add r0, #0xf5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _020792E6
	mov r0, #0xe
	pop {r4, pc}
_020792E6:
	cmp r1, #9
	bne _020792EE
	mov r0, #8
	pop {r4, pc}
_020792EE:
	cmp r1, #0xa
	bne _020792F6
	mov r0, #0x10
	pop {r4, pc}
_020792F6:
	mov r0, #1
	pop {r4, pc}
_020792FA:
	mov r0, #0
	pop {r4, pc}
	nop
_02079300: .word 0x00000654
_02079304: .word 0x00000C62
	thumb_func_end sub_02079280

	thumb_func_start sub_02079308
sub_02079308: ; 0x02079308
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207ADB8
	cmp r0, #4
	bhi _020793B6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02079320: ; jump table
	.short _0207932A - _02079320 - 2 ; case 0
	.short _020793B6 - _02079320 - 2 ; case 1
	.short _0207938C - _02079320 - 2 ; case 2
	.short _0207937E - _02079320 - 2 ; case 3
	.short _02079376 - _02079320 - 2 ; case 4
_0207932A:
	ldr r0, _020793BC ; =0x00000654
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #3
	bgt _0207933C
	beq _0207934E
	b _0207936A
_0207933C:
	cmp r0, #0x14
	bgt _0207936A
	cmp r0, #0xe
	blt _0207936A
	beq _02079358
	cmp r0, #0x13
	beq _02079362
	cmp r0, #0x14
	bne _0207936A
_0207934E:
	mov r0, #0
	add r1, #0x27
	strb r0, [r1]
	mov r0, #0x20
	pop {r4, pc}
_02079358:
	add r0, r4, #0
	bl sub_02082868
	mov r0, #0x18
	pop {r4, pc}
_02079362:
	add r0, r4, #0
	bl sub_0207CA30
	pop {r4, pc}
_0207936A:
	add r0, r4, #0
	mov r1, #1
	bl sub_02079224
	mov r0, #2
	pop {r4, pc}
_02079376:
	add r0, r4, #0
	bl sub_0207B7E0
	pop {r4, pc}
_0207937E:
	ldr r0, _020793BC ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_0207938C:
	ldr r0, _020793BC ; =0x00000654
	ldr r2, [r4, r0]
	add r1, r2, #0
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0xf
	beq _020793A4
	mov r0, #1
	add r2, #0x27
	strb r0, [r2]
	mov r0, #0x20
	pop {r4, pc}
_020793A4:
	add r0, #0x24
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DD08
	add r0, r4, #0
	bl sub_020807AC
	pop {r4, pc}
_020793B6:
	mov r0, #1
	pop {r4, pc}
	nop
_020793BC: .word 0x00000654
	thumb_func_end sub_02079308

	thumb_func_start sub_020793C0
sub_020793C0: ; 0x020793C0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207C0DC
	cmp r0, #0
	beq _020793D0
	cmp r0, #2
	bne _020793E2
_020793D0:
	ldr r0, _020793F8 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	bl sub_0207C288
	pop {r4, pc}
_020793E2:
	cmp r0, #3
	bne _020793F4
	ldr r0, _020793FC ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_020793F4:
	mov r0, #4
	pop {r4, pc}
	.balign 4, 0
_020793F8: .word 0x00000678
_020793FC: .word 0x00000654
	thumb_func_end sub_020793C0

	thumb_func_start sub_02079400
sub_02079400: ; 0x02079400
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207C0DC
	cmp r0, #0
	beq _02079410
	cmp r0, #2
	bne _02079422
_02079410:
	ldr r0, _02079438 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	bl sub_0207C400
	pop {r4, pc}
_02079422:
	cmp r0, #3
	bne _02079434
	ldr r0, _0207943C ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_02079434:
	mov r0, #8
	pop {r4, pc}
	.balign 4, 0
_02079438: .word 0x00000678
_0207943C: .word 0x00000654
	thumb_func_end sub_02079400

	thumb_func_start sub_02079440
sub_02079440: ; 0x02079440
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _020794C0 ; =0x00000824
	add r4, r0, #0
	ldr r1, [r4, r1]
	bl sub_0207E93C
	add r2, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r2, r0
	beq _02079460
	add r0, r0, #1
	cmp r2, r0
	beq _020794BA
	b _020794AE
_02079460:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl sub_0200E5D4
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D8E4
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	add r0, r4, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _020794C4 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_020794AE:
	add r0, r4, #0
	add r1, sp, #0
	blx r2
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, pc}
_020794BA:
	mov r0, #0xf
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_020794C0: .word 0x00000824
_020794C4: .word 0x00000678
	thumb_func_end sub_02079440

	thumb_func_start sub_020794C8
sub_020794C8: ; 0x020794C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020794E4 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _020794DE
	ldr r0, _020794E8 ; =0x00000C62
	ldrb r0, [r4, r0]
	pop {r4, pc}
_020794DE:
	mov r0, #0x18
	pop {r4, pc}
	nop
_020794E4: .word 0x00000C64
_020794E8: .word 0x00000C62
	thumb_func_end sub_020794C8

	thumb_func_start sub_020794EC
sub_020794EC: ; 0x020794EC
	mov r0, #0x20
	bx lr
	thumb_func_end sub_020794EC

	thumb_func_start sub_020794F0
sub_020794F0: ; 0x020794F0
	push {r3, lr}
	bl sub_0207DBCC
	mov r0, #0x1b
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020794F0

	thumb_func_start sub_020794FC
sub_020794FC: ; 0x020794FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02079544 ; =0x00000C88
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02079512
	cmp r0, #2
	beq _02079528
	b _0207953E
_02079512:
	ldr r0, _02079544 ; =0x00000C88
	ldr r0, [r4, r0]
	bl sub_02016624
	bl sub_0207CB90
	ldr r1, _02079548 ; =0x00000C58
	add r0, r4, #0
	ldr r1, [r4, r1]
	blx r1
	pop {r4, pc}
_02079528:
	ldr r0, _02079544 ; =0x00000C88
	ldr r0, [r4, r0]
	bl sub_02016624
	bl sub_0207CB90
	ldr r1, _0207954C ; =0x00000C5C
	add r0, r4, #0
	ldr r1, [r4, r1]
	blx r1
	pop {r4, pc}
_0207953E:
	mov r0, #0x1b
	pop {r4, pc}
	nop
_02079544: .word 0x00000C88
_02079548: .word 0x00000C58
_0207954C: .word 0x00000C5C
	thumb_func_end sub_020794FC

	thumb_func_start sub_02079550
sub_02079550: ; 0x02079550
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207C0DC
	cmp r0, #0
	beq _02079560
	cmp r0, #2
	bne _020795B4
_02079560:
	ldr r0, _020795CC ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _020795D0 ; =0x00000C65
	mov r1, #0x30
	ldrb r0, [r4, r0]
	add r2, r0, #0
	mul r2, r1
	ldr r0, _020795D4 ; =0x00000838
	add r2, r4, r2
	ldrb r0, [r2, r0]
	cmp r0, #1
	beq _02079586
	add r0, r4, #0
	bl sub_02082134
	pop {r4, pc}
_02079586:
	add r0, r4, #0
	sub r1, #0x31
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020795D8 ; =0x00000654
	mov r2, #0x1f
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020795DC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x66
	bl ReadMsgDataIntoString
	mov r0, #0x18
	pop {r4, pc}
_020795B4:
	cmp r0, #3
	bne _020795C6
	ldr r0, _020795D8 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_020795C6:
	mov r0, #0x15
	pop {r4, pc}
	nop
_020795CC: .word 0x00000678
_020795D0: .word 0x00000C65
_020795D4: .word 0x00000838
_020795D8: .word 0x00000654
_020795DC: .word 0x00000C62
	thumb_func_end sub_02079550

	thumb_func_start sub_020795E0
sub_020795E0: ; 0x020795E0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r6, r0, #0
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl sub_0207EFA4
	add r0, r6, #0
	bl sub_0207CF68
	ldr r0, [r6]
	bl sub_020798C4
	bl sub_02021238
	bl sub_020205AC
	ldr r7, _0207969C ; =0x00000828
	mov r4, #0
	add r5, r6, #0
_02079618:
	ldr r0, [r5, r7]
	bl String_dtor
	add r4, r4, #1
	add r5, #0x30
	cmp r4, #6
	blo _02079618
	ldr r0, _020796A0 ; =0x000007C8
	ldr r0, [r6, r0]
	bl String_dtor
	ldr r0, _020796A4 ; =0x000007CC
	ldr r0, [r6, r0]
	bl String_dtor
	mov r7, #0x7d
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #4
_0207963E:
	ldr r0, [r4, r7]
	bl String_dtor
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x14
	blo _0207963E
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	bl DestroyMsgData
	ldr r0, _020796A8 ; =0x000007BC
	ldr r0, [r6, r0]
	bl MessagePrinter_delete
	ldr r0, _020796AC ; =0x000007C4
	ldr r0, [r6, r0]
	bl ScrStrBufs_delete
	ldr r0, _020796B0 ; =0x00000C74
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _02079672
	bl sub_0207495C
_02079672:
	ldr r0, _020796B4 ; =0x00000654
	ldr r0, [r6, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _02079682
	bl sub_02004B10
_02079682:
	mov r0, #4
	bl sub_02002DB4
	ldr r0, [sp]
	bl OverlayManager_FreeData
	mov r0, #0xc
	bl DestroyHeap
	bl sub_0203A964
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207969C: .word 0x00000828
_020796A0: .word 0x000007C8
_020796A4: .word 0x000007CC
_020796A8: .word 0x000007BC
_020796AC: .word 0x000007C4
_020796B0: .word 0x00000C74
_020796B4: .word 0x00000654
	thumb_func_end sub_020795E0

	thumb_func_start sub_020796B8
sub_020796B8: ; 0x020796B8
	push {r4, lr}
	ldr r3, _020796F4 ; =0x00000C78
	add r4, r0, #0
	ldr r0, [r4]
	ldr r3, [r4, r3]
	mov r1, #4
	mov r2, #3
	bl sub_0201BC8C
	ldr r3, _020796F4 ; =0x00000C78
	ldr r0, [r4]
	ldr r3, [r4, r3]
	mov r1, #6
	mov r2, #3
	bl sub_0201BC8C
	ldr r0, [r4]
	bl sub_0201EEB4
	bl sub_0202061C
	bl sub_0200D034
	ldr r3, _020796F8 ; =OS_IRQTable
	ldr r1, _020796FC ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_020796F4: .word 0x00000C78
_020796F8: .word OS_IRQTable
_020796FC: .word 0x00003FF8
	thumb_func_end sub_020796B8

	thumb_func_start sub_02079700
sub_02079700: ; 0x02079700
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0207971C ; =_021013E4
	add r3, sp, #0
	mov r2, #5
_0207970A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0207970A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0207971C: .word _021013E4
	thumb_func_end sub_02079700

	thumb_func_start sub_02079720
sub_02079720: ; 0x02079720
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _02079754 ; =_02101370
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0
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
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_02079754: .word _02101370
	thumb_func_end sub_02079720

	thumb_func_start sub_02079758
sub_02079758: ; 0x02079758
	push {r4, r5, lr}
	sub sp, #0xd4
	ldr r5, _020798A4 ; =_021012BC
	add r3, sp, #0xc4
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _020798A8 ; =_02101354
	add r3, sp, #0xa8
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
	ldr r5, _020798AC ; =_021013A8
	add r3, sp, #0x8c
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
	ldr r5, _020798B0 ; =_0210131C
	add r3, sp, #0x70
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
	ldr r5, _020798B4 ; =_021012E4
	add r3, sp, #0x54
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
	ldr r5, _020798B8 ; =_02101338
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020798BC ; =_0210138C
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020798C0 ; =_02101300
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0xc
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xc
	bl BG_ClearCharDataRange
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xc
	bl BG_ClearCharDataRange
	add sp, #0xd4
	pop {r4, r5, pc}
	nop
_020798A4: .word _021012BC
_020798A8: .word _02101354
_020798AC: .word _021013A8
_020798B0: .word _0210131C
_020798B4: .word _021012E4
_020798B8: .word _02101338
_020798BC: .word _0210138C
_020798C0: .word _02101300
	thumb_func_end sub_02079758

	thumb_func_start sub_020798C4
sub_020798C4: ; 0x020798C4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x13
	mov r1, #0
	bl sub_02022CC8
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	mov r0, #0xc
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020798C4

	thumb_func_start sub_0207991C
sub_0207991C: ; 0x0207991C
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	bne _0207994A
	mov r0, #0
	add r1, r0, #0
	bl sub_0201BC28
	ldr r0, [r4]
	mov r1, #0
	bl FreeBgTilemapBuffer
	mov r0, #1
	mov r1, #0
	add r2, r0, #0
	bl GX_SetGraphicsMode
	mov r0, #0xc
	bl sub_0207997C
	ldr r1, _02079978 ; =0x00000C84
	str r0, [r4, r1]
	pop {r4, pc}
_0207994A:
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02079978 ; =0x00000C84
	ldr r0, [r4, r0]
	bl sub_02079A0C
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	ldr r0, [r4]
	bl sub_02079720
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0xc
	bl BG_ClearCharDataRange
	pop {r4, pc}
	.balign 4, 0
_02079978: .word 0x00000C84
	thumb_func_end sub_0207991C

	thumb_func_start sub_0207997C
sub_0207997C: ; 0x0207997C
	push {r3, lr}
	sub sp, #8
	mov r1, #2
	str r1, [sp]
	ldr r1, _02079998 ; =sub_0207999C
	mov r2, #1
	str r1, [sp, #4]
	mov r1, #0
	add r3, r1, #0
	bl sub_02026EB4
	add sp, #8
	pop {r3, pc}
	nop
_02079998: .word sub_0207999C
	thumb_func_end sub_0207997C

	thumb_func_start sub_0207999C
sub_0207999C: ; 0x0207999C
	push {r3, lr}
	ldr r0, _020799F4 ; =0x04000060
	ldr r1, _020799F8 ; =0xFFFFCFFD
	ldrh r2, [r0]
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _020799FC ; =0x0000CFFB
	and r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	sub r2, #0x1c
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _02079A00 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _02079A04 ; =0xBFFF0000
	ldr r0, _02079A08 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	nop
_020799F4: .word 0x04000060
_020799F8: .word 0xFFFFCFFD
_020799FC: .word 0x0000CFFB
_02079A00: .word 0x00007FFF
_02079A04: .word 0xBFFF0000
_02079A08: .word 0x04000580
	thumb_func_end sub_0207999C

	thumb_func_start sub_02079A0C
sub_02079A0C: ; 0x02079A0C
	ldr r3, _02079A10 ; =sub_02026F54
	bx r3
	.balign 4, 0
_02079A10: .word sub_02026F54
	thumb_func_end sub_02079A0C

	thumb_func_start sub_02079A14
sub_02079A14: ; 0x02079A14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	add r4, r1, #0
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0xf
	mov r3, #3
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x11
	mov r3, #3
	bl sub_02007B68
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0xc
	bl NARC_AllocAndReadWholeMember
	add r1, sp, #0x10
	add r7, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	ldr r1, [sp, #0x10]
	mov r0, #0xc
	ldr r1, [r1, #8]
	bl AllocFromHeap
	ldr r2, [sp, #0x10]
	add r6, r0, #0
	ldr r1, [r2, #0xc]
	ldr r2, [r2, #8]
	bl memcpy
	mov r3, #0
	strh r3, [r6]
	ldr r2, [sp, #0x10]
	mov r0, #3
	ldr r2, [r2, #8]
	add r1, r6, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl BG_LoadPlttData
	add r0, r6, #0
	bl FreeToHeap
	ldr r1, [sp, #0x10]
	ldr r0, _02079BCC ; =0x00000554
	ldr r1, [r1, #0xc]
	mov r2, #1
	add r0, r5, r0
	add r1, #0x60
	lsl r2, r2, #8
	bl memcpy
	add r0, r7, #0
	bl FreeToHeap
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0xc
	bl sub_0200304C
	mov r0, #4
	mov r1, #0x40
	mov r2, #0xc
	bl sub_0200304C
	mov r1, #0
	str r1, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r2, #1
	mov r3, #0xe
	bl sub_0200E3DC
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x1a
	bl sub_02007B44
	ldr r0, _02079BD0 ; =0x00000654
	ldr r0, [r5, r0]
	ldr r0, [r0, #0xc]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r1, #0
	mov r2, #0x2a
	mov r3, #0xf
	bl sub_0200E644
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #3
	mov r3, #4
	bl sub_02007B44
	mov r3, #0x20
	mov r1, #4
	str r3, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	bl sub_02007B8C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0xc
	str r1, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r3, #5
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0xe
	mov r3, #5
	bl sub_02007B68
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x18
	mov r3, #4
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x19
	mov r3, #4
	bl sub_02007B68
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #4
	mov r3, #0
	bl sub_02007B8C
	mov r2, #0xc5
	lsl r2, r2, #2
	ldr r3, _02079BD4 ; =0x00000494
	add r1, r5, r2
	add r2, #0xc0
	mov r0, #0xc
	add r2, r5, r2
	add r3, r5, r3
	bl sub_0207CAAC
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02079BCC: .word 0x00000554
_02079BD0: .word 0x00000654
_02079BD4: .word 0x00000494
	thumb_func_end sub_02079A14

	thumb_func_start sub_02079BD8
sub_02079BD8: ; 0x02079BD8
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02079CC4 ; =0x00000CA8
	mov r2, #0xc
	add r5, r0, #0
	bl OverlayManager_CreateAndGetData
	ldr r2, _02079CC4 ; =0x00000CA8
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetField18
	ldr r1, _02079CC8 ; =0x00000654
	str r0, [r4, r1]
	mov r0, #0xc
	bl BgConfig_Alloc
	str r0, [r4]
	ldr r0, _02079CC8 ; =0x00000654
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	bne _02079C20
	ldr r0, [r1, #0x14]
	cmp r0, #0
	beq _02079C20
	mov r0, #0xc
	bl sub_02074944
	ldr r1, _02079CCC ; =0x00000C74
	str r0, [r4, r1]
	b _02079C26
_02079C20:
	ldr r0, _02079CCC ; =0x00000C74
	mov r1, #0
	str r1, [r4, r0]
_02079C26:
	mov r2, #0x4b
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #2
	mov r3, #0xc
	bl NewMsgDataFromNarc
	mov r1, #0x1f
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xf
	mov r1, #0xe
	mov r2, #0
	mov r3, #0xc
	bl MessagePrinter_new
	ldr r1, _02079CD0 ; =0x000007BC
	str r0, [r4, r1]
	mov r0, #0xc
	bl ScrStrBufs_new
	ldr r1, _02079CD4 ; =0x000007C4
	mov r6, #0
	add r7, r1, #0
	str r0, [r4, r1]
	add r5, r4, #0
	add r7, #0x64
_02079C5C:
	mov r0, #0xb
	mov r1, #0xc
	bl String_ctor
	str r0, [r5, r7]
	add r6, r6, #1
	add r5, #0x30
	cmp r6, #6
	blo _02079C5C
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0xc
	bl String_ctor
	ldr r1, _02079CD8 ; =0x000007C8
	str r0, [r4, r1]
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0xc
	bl String_ctor
	ldr r1, _02079CDC ; =0x000007CC
	mov r6, #0
	str r0, [r4, r1]
	add r5, r4, #0
	add r7, r1, #4
_02079C90:
	mov r0, #0x20
	mov r1, #0xc
	bl String_ctor
	str r0, [r5, r7]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0x14
	blo _02079C90
	ldr r1, _02079CE0 ; =0x00000C7C
	mov r0, #0
	str r0, [r4, r1]
	ldr r0, _02079CC8 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x26
	ldrb r2, [r0]
	add r0, r1, #0
	sub r0, #0x17
	strb r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0x17
	ldrb r0, [r4, r0]
	sub r1, #0x16
	strb r0, [r4, r1]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02079CC4: .word 0x00000CA8
_02079CC8: .word 0x00000654
_02079CCC: .word 0x00000C74
_02079CD0: .word 0x000007BC
_02079CD4: .word 0x000007C4
_02079CD8: .word 0x000007C8
_02079CDC: .word 0x000007CC
_02079CE0: .word 0x00000C7C
	thumb_func_end sub_02079BD8

	thumb_func_start sub_02079CE4
sub_02079CE4: ; 0x02079CE4
	push {r3, r4}
	ldr r2, _02079D30 ; =0x00000654
	mov r3, #0x80
	ldr r1, [r0, r2]
	add r1, #0x24
	ldrb r4, [r1]
	add r1, r4, #0
	tst r1, r3
	beq _02079D10
	ldr r1, _02079D34 ; =0x00000C63
	ldrb r4, [r0, r1]
	orr r4, r3
	strb r4, [r0, r1]
	ldr r1, [r0, r2]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	add r1, #0x24
	eor r0, r3
	strb r0, [r1]
	pop {r3, r4}
	bx lr
_02079D10:
	cmp r4, #0x15
	bne _02079D20
	ldr r1, _02079D34 ; =0x00000C63
	ldrb r2, [r0, r1]
	orr r2, r3
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
_02079D20:
	ldr r2, _02079D34 ; =0x00000C63
	mov r1, #0x80
	ldrb r3, [r0, r2]
	bic r3, r1
	strb r3, [r0, r2]
	pop {r3, r4}
	bx lr
	nop
_02079D30: .word 0x00000654
_02079D34: .word 0x00000C63
	thumb_func_end sub_02079CE4

	thumb_func_start sub_02079D38
sub_02079D38: ; 0x02079D38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02079E0C ; =0x00000654
	mov r4, #3
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #2
	bne _02079D54
	ldr r1, _02079E10 ; =_0210144C
	ldr r0, _02079E14 ; =0x00000948
	str r1, [r5, r0]
	b _02079D84
_02079D54:
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #2
	beq _02079D6C
	cmp r1, #0x11
	beq _02079D6C
	add r0, r1, #0
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02079D74
_02079D6C:
	ldr r1, _02079E18 ; =_0210148C
	ldr r0, _02079E14 ; =0x00000948
	str r1, [r5, r0]
	b _02079D84
_02079D74:
	cmp r1, #0x15
	ldr r0, _02079E14 ; =0x00000948
	bne _02079D80
	ldr r1, _02079E1C ; =_021014CC
	str r1, [r5, r0]
	b _02079D84
_02079D80:
	ldr r1, _02079E20 ; =_0210140C
	str r1, [r5, r0]
_02079D84:
	ldr r0, _02079E0C ; =0x00000654
	ldr r1, [r5, r0]
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #2
	beq _02079DDE
	cmp r1, #0x11
	beq _02079DDE
	cmp r1, #0x17
	beq _02079DDE
	cmp r1, #0x16
	beq _02079DDE
	add r0, #0x2c
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
	ldr r0, _02079E24 ; =0x00000684
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020248F0
	ldr r0, _02079E24 ; =0x00000684
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	ldr r0, _02079E24 ; =0x00000684
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	sub r2, #8
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r0, #1
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02079DDE:
	ldr r0, _02079E0C ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #4
	beq _02079DEE
	cmp r0, #0x15
	bne _02079E00
_02079DEE:
	ldr r0, _02079E24 ; =0x00000684
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	mov r0, #2
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02079E00:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D998
	pop {r3, r4, r5, pc}
	nop
_02079E0C: .word 0x00000654
_02079E10: .word _0210144C
_02079E14: .word 0x00000948
_02079E18: .word _0210148C
_02079E1C: .word _021014CC
_02079E20: .word _0210140C
_02079E24: .word 0x00000684
	thumb_func_end sub_02079D38

	thumb_func_start sub_02079E28
sub_02079E28: ; 0x02079E28
	mov r2, #0x30
	mul r2, r1
	add r1, r0, r2
	ldr r0, _02079E34 ; =0x00000855
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_02079E34: .word 0x00000855
	thumb_func_end sub_02079E28

	thumb_func_start sub_02079E38
sub_02079E38: ; 0x02079E38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp]
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #0x30
	add r4, r0, #0
	ldr r0, _02079F84 ; =0x00000855
	mul r4, r1
	add r0, r5, r0
	mov r1, #0
	str r0, [sp, #8]
	strb r1, [r0, r4]
	ldr r0, _02079F88 ; =0x00000654
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyCount
	ldr r1, [sp]
	cmp r0, r1
	bgt _02079E68
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02079E68:
	ldr r0, _02079F88 ; =0x00000654
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	bne _02079E8A
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02079E8A:
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0207D294
	ldr r0, [sp]
	mov r1, #0x30
	add r6, r0, #0
	mul r6, r1
	ldr r1, _02079F8C ; =0x0000082C
	ldr r0, [sp, #4]
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, _02079F90 ; =0x0000082E
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	mov r1, #0x83
	add r2, r5, r6
	lsl r1, r1, #4
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldr r1, _02079F94 ; =0x00000832
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	ldr r1, _02079F98 ; =0x00000834
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xa2
	mov r2, #0
	bl GetMonData
	ldr r1, _02079F9C ; =0x0000083A
	add r2, r5, r6
	strh r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	ldr r1, _02079FA0 ; =0x00000838
	add r2, r5, r6
	strb r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	ldr r1, _02079FA4 ; =0x00000839
	add r2, r5, r6
	strb r0, [r2, r1]
	add r0, r7, #0
	mov r1, #0xb0
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	ldr r0, _02079FA8 ; =0x00000836
	bne _02079F30
	add r2, r5, r0
	ldrh r1, [r2, r4]
	ldr r0, _02079FAC ; =0xFFFFEFFF
	and r0, r1
	b _02079F3A
_02079F30:
	add r2, r5, r0
	ldrh r1, [r2, r4]
	mov r0, #1
	lsl r0, r0, #0xc
	orr r0, r1
_02079F3A:
	strh r0, [r2, r4]
	ldr r0, _02079FA8 ; =0x00000836
	add r6, r5, r0
	add r0, r7, #0
	bl GetMonGender
	lsl r0, r0, #0x1e
	ldrh r2, [r6, r4]
	ldr r1, _02079FB0 ; =0xFFFF9FFF
	lsr r0, r0, #0x11
	and r1, r2
	orr r0, r1
	strh r0, [r6, r4]
	ldr r0, [sp, #8]
	mov r1, #1
	strb r1, [r0, r4]
	add r0, r7, #0
	bl sub_0208AD64
	lsl r0, r0, #0x18
	ldrh r1, [r6, r4]
	ldr r2, _02079FB4 ; =0xFFFFF000
	lsr r0, r0, #0x18
	and r1, r2
	lsr r2, r2, #0x14
	and r0, r2
	orr r0, r1
	strh r0, [r6, r4]
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02079FB8
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02079F84: .word 0x00000855
_02079F88: .word 0x00000654
_02079F8C: .word 0x0000082C
_02079F90: .word 0x0000082E
_02079F94: .word 0x00000832
_02079F98: .word 0x00000834
_02079F9C: .word 0x0000083A
_02079FA0: .word 0x00000838
_02079FA4: .word 0x00000839
_02079FA8: .word 0x00000836
_02079FAC: .word 0xFFFFEFFF
_02079FB0: .word 0xFFFF9FFF
_02079FB4: .word 0xFFFFF000
	thumb_func_end sub_02079E38

	thumb_func_start sub_02079FB8
sub_02079FB8: ; 0x02079FB8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0207A048 ; =0x00000654
	add r5, r1, #0
	ldr r1, [r7, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _0207A044
	mov r0, #0x30
	add r6, r2, #0
	mul r6, r0
	ldr r0, _0207A04C ; =0x00000838
	add r3, r7, r6
	ldrb r2, [r3, r0]
	cmp r2, #1
	beq _02079FE4
	sub r0, #0xa
	ldrh r0, [r3, r0]
	cmp r0, #0
	bne _02079FF2
_02079FE4:
	ldr r0, _0207A050 ; =0x00000836
	add r2, r7, r0
	ldrh r1, [r2, r6]
	ldr r0, _0207A054 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2, r6]
	pop {r3, r4, r5, r6, r7, pc}
_02079FF2:
	add r1, #0x2e
	ldrb r1, [r1]
	add r0, r5, #0
	bl sub_0207A058
	str r0, [sp]
	mov r4, #0
_0207A000:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0207A016
	add r4, r4, #1
	cmp r4, #4
	blo _0207A000
_0207A016:
	ldr r0, _0207A048 ; =0x00000654
	ldr r0, [r7, r0]
	add r0, #0x2f
	ldrb r1, [r0]
	ldr r0, [sp]
	cmp r1, r0
	bhi _0207A038
	cmp r4, #2
	blo _0207A038
	ldr r0, _0207A050 ; =0x00000836
	add r2, r7, r0
	ldrh r1, [r2, r6]
	mov r0, #2
	lsl r0, r0, #0xe
	orr r0, r1
	strh r0, [r2, r6]
	pop {r3, r4, r5, r6, r7, pc}
_0207A038:
	ldr r0, _0207A050 ; =0x00000836
	add r2, r7, r0
	ldrh r1, [r2, r6]
	ldr r0, _0207A054 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2, r6]
_0207A044:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207A048: .word 0x00000654
_0207A04C: .word 0x00000838
_0207A050: .word 0x00000836
_0207A054: .word 0xFFFF7FFF
	thumb_func_end sub_02079FB8

	thumb_func_start sub_0207A058
sub_0207A058: ; 0x0207A058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #4
	bls _0207A062
	b _0207A166
_0207A062:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0207A06E: ; jump table
	.short _0207A078 - _0207A06E - 2 ; case 0
	.short _0207A0A8 - _0207A06E - 2 ; case 1
	.short _0207A0D8 - _0207A06E - 2 ; case 2
	.short _0207A108 - _0207A06E - 2 ; case 3
	.short _0207A138 - _0207A06E - 2 ; case 4
_0207A078:
	mov r1, #0x7b
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x7c
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x7d
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x7e
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	b _0207A166
_0207A0A8:
	mov r1, #0x7f
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x80
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x81
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x82
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	b _0207A166
_0207A0D8:
	mov r1, #0x83
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x84
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x85
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x86
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	b _0207A166
_0207A108:
	mov r1, #0x87
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x88
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x89
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x8a
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	b _0207A166
_0207A138:
	mov r1, #0x8b
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x8c
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x8d
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x8e
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
_0207A166:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0207A058

	thumb_func_start sub_0207A16C
sub_0207A16C: ; 0x0207A16C
	mov r1, #0x11
	lsl r1, r1, #6
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0207A16C

	thumb_func_start sub_0207A174
sub_0207A174: ; 0x0207A174
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0
	beq _0207A194
	ldr r0, _0207A224 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207A19C
	cmp r4, #1
	bne _0207A19C
_0207A194:
	mov r0, #0xc5
	lsl r0, r0, #2
	add r0, r5, r0
	b _0207A1A2
_0207A19C:
	mov r0, #0xf5
	lsl r0, r0, #2
	add r0, r5, r0
_0207A1A2:
	mov r1, #0x30
	mul r1, r4
	ldr r2, _0207A228 ; =0x0000083C
	add r1, r5, r1
	strb r6, [r1, r2]
	add r2, r2, #1
	strb r7, [r1, r2]
	mov r2, #0x10
	str r2, [sp]
	mov r1, #6
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5]
	mov r1, #2
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0201C4EC
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _0207A1FC
	add r0, r7, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x10
	add r3, r6, #6
	str r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [r5]
	mov r1, #2
	mov r2, #0x4b
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
_0207A1FC:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r4, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #2
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0201CA4C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A7F4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207A224: .word 0x00000654
_0207A228: .word 0x0000083C
	thumb_func_end sub_0207A174

	thumb_func_start sub_0207A22C
sub_0207A22C: ; 0x0207A22C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207A2A0 ; =0x00000654
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #2
	bne _0207A242
	ldr r1, _0207A2A4 ; =_02101554
	b _0207A244
_0207A242:
	ldr r1, _0207A2A8 ; =_0210150C
_0207A244:
	add r2, #0x24
	ldrb r0, [r2]
	cmp r0, #0x10
	bne _0207A254
	add r0, r4, #0
	bl sub_0207A3C8
	b _0207A28C
_0207A254:
	cmp r0, #6
	bne _0207A260
	add r0, r4, #0
	bl sub_0207A4B4
	b _0207A28C
_0207A260:
	cmp r0, #0xd
	bne _0207A26C
	add r0, r4, #0
	bl sub_0207A5A0
	b _0207A28C
_0207A26C:
	cmp r0, #2
	beq _0207A27E
	cmp r0, #0x11
	beq _0207A27E
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207A286
_0207A27E:
	add r0, r4, #0
	bl sub_0207A68C
	b _0207A28C
_0207A286:
	add r0, r4, #0
	bl sub_0207A2AC
_0207A28C:
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	nop
_0207A2A0: .word 0x00000654
_0207A2A4: .word _02101554
_0207A2A8: .word _0210150C
	thumb_func_end sub_0207A22C

	thumb_func_start sub_0207A2AC
sub_0207A2AC: ; 0x0207A2AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A2C0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A392
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207A3BC ; =0x00000838
	str r1, [sp, #4]
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207A2FE
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	mov r0, #0
	str r0, [sp]
	add r3, r6, r2
	ldrh r2, [r6, r2]
	ldrh r3, [r3, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	b _0207A31E
_0207A2FE:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	mov r0, #1
	str r0, [sp]
	add r3, r6, r2
	ldrh r2, [r6, r2]
	ldrh r3, [r3, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
_0207A31E:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D5DC
	mov r0, #0xc
	mul r0, r4
	add r7, r6, r0
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r7, #4]
	ldrh r3, [r7, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r7, #8]
	ldrh r3, [r7, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	ldr r3, [sp, #4]
	ldr r2, _0207A3C0 ; =0x00000834
	add r0, r5, #0
	ldrh r2, [r3, r2]
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r7, r2]
	ldrsh r3, [r7, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	mov r2, #0x30
	mul r2, r4
	add r3, r5, r2
	ldr r2, _0207A3C4 ; =0x00000836
	add r0, r5, #0
	ldrh r2, [r3, r2]
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A3A8
_0207A392:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	add r7, r6, r2
	mov r3, #2
	ldrsh r2, [r6, r2]
	ldrsh r3, [r7, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A3A8:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A2C0
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207A3BC: .word 0x00000838
_0207A3C0: .word 0x00000834
_0207A3C4: .word 0x00000836
	thumb_func_end sub_0207A2AC

	thumb_func_start sub_0207A3C8
sub_0207A3C8: ; 0x0207A3C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A3DC:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A47C
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r6, r0, r2
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r3, r2]
	ldrh r3, [r6, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D710
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r6, #4]
	ldrh r3, [r6, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	mov r0, #0x30
	add r7, r4, #0
	mul r7, r0
	ldr r2, _0207A4AC ; =0x00000834
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	ldr r2, _0207A4B0 ; =0x00000836
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A496
_0207A47C:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r6, [sp, #4]
	add r3, r0, r2
	ldrsh r2, [r6, r2]
	mov r6, #2
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A496:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A3DC
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0207A4AC: .word 0x00000834
_0207A4B0: .word 0x00000836
	thumb_func_end sub_0207A3C8

	thumb_func_start sub_0207A4B4
sub_0207A4B4: ; 0x0207A4B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A4C8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A568
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r6, r0, r2
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r3, r2]
	ldrh r3, [r6, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D7A8
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r6, #4]
	ldrh r3, [r6, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	mov r0, #0x30
	add r7, r4, #0
	mul r7, r0
	ldr r2, _0207A598 ; =0x00000834
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	ldr r2, _0207A59C ; =0x00000836
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A582
_0207A568:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r6, [sp, #4]
	add r3, r0, r2
	ldrsh r2, [r6, r2]
	mov r6, #2
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A582:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A4C8
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0207A598: .word 0x00000834
_0207A59C: .word 0x00000836
	thumb_func_end sub_0207A4B4

	thumb_func_start sub_0207A5A0
sub_0207A5A0: ; 0x0207A5A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A5B4:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A654
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r6, r0, r2
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r3, r2]
	ldrh r3, [r6, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D840
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r6, #4]
	ldrh r3, [r6, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	mov r0, #0x30
	add r7, r4, #0
	mul r7, r0
	ldr r2, _0207A684 ; =0x00000834
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	ldr r2, _0207A688 ; =0x00000836
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A66E
_0207A654:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r6, [sp, #4]
	add r3, r0, r2
	ldrsh r2, [r6, r2]
	mov r6, #2
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A66E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A5B4
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0207A684: .word 0x00000834
_0207A688: .word 0x00000836
	thumb_func_end sub_0207A5A0

	thumb_func_start sub_0207A68C
sub_0207A68C: ; 0x0207A68C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #8]
	mov r4, #0
_0207A6A0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E38
	cmp r0, #1
	bne _0207A748
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r3, [sp, #4]
	add r6, r0, r2
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r3, r2]
	ldrh r3, [r6, #2]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0207A174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D8A4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D8EC
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	ldrh r2, [r6, #4]
	ldrh r3, [r6, #6]
	add r0, r5, #0
	bl sub_0207EBE4
	ldrh r2, [r6, #8]
	ldrh r3, [r6, #0xa]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207EF5C
	mov r0, #0x30
	add r7, r4, #0
	mul r7, r0
	ldr r2, _0207A778 ; =0x00000834
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F004
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F064
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F0C8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207F098
	ldr r2, _0207A77C ; =0x00000836
	add r3, r5, r7
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	b _0207A762
_0207A748:
	mov r0, #0xc
	add r2, r4, #0
	mul r2, r0
	ldr r0, [sp, #4]
	ldr r6, [sp, #4]
	add r3, r0, r2
	ldrsh r2, [r6, r2]
	mov r6, #2
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A780
_0207A762:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _0207A6A0
	ldr r0, [sp, #8]
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0207A778: .word 0x00000834
_0207A77C: .word 0x00000836
	thumb_func_end sub_0207A68C

	thumb_func_start sub_0207A780
sub_0207A780: ; 0x0207A780
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r1, #0
	add r4, r2, #0
	mov r1, #0x10
	add r5, r0, #0
	ldr r2, _0207A7F0 ; =0x00000494
	str r1, [sp]
	mov r0, #6
	add r6, r3, #0
	lsl r3, r6, #0x18
	str r0, [sp, #4]
	add r2, r5, r2
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r0, [sp, #0x18]
	lsl r2, r4, #0x18
	ldr r0, [r5]
	mov r1, #2
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0201C4EC
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r5]
	mov r1, #2
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0201CA4C
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #7
	bl sub_0207EFC4
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl sub_0207F004
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0207F0C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207A7F0: .word 0x00000494
	thumb_func_end sub_0207A780

	thumb_func_start sub_0207A7F4
sub_0207A7F4: ; 0x0207A7F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207A870 ; =0x00000654
	add r6, r1, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldr r1, _0207A874 ; =0x00000C63
	ldrb r2, [r5, r1]
	lsl r3, r2, #0x19
	lsr r3, r3, #0x1f
	cmp r3, #1
	bne _0207A824
	add r1, r1, #2
	ldrb r1, [r5, r1]
	cmp r6, r1
	beq _0207A820
	lsl r1, r2, #0x1a
	lsr r1, r1, #0x1a
	cmp r6, r1
	bne _0207A824
_0207A820:
	mov r4, #7
	b _0207A858
_0207A824:
	ldr r1, _0207A878 ; =0x00000C65
	ldrb r1, [r5, r1]
	cmp r6, r1
	bne _0207A830
	mov r4, #4
	b _0207A832
_0207A830:
	mov r4, #0
_0207A832:
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0207A846
	add r0, r4, #2
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	b _0207A858
_0207A846:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207A880
	cmp r0, #1
	bne _0207A858
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0207A858:
	ldr r1, _0207A87C ; =0x00000554
	add r3, r6, #3
	add r2, r5, r1
	lsl r1, r4, #5
	lsl r3, r3, #0x15
	add r1, r2, r1
	mov r0, #2
	mov r2, #0x10
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207A870: .word 0x00000654
_0207A874: .word 0x00000C63
_0207A878: .word 0x00000C65
_0207A87C: .word 0x00000554
	thumb_func_end sub_0207A7F4

	thumb_func_start sub_0207A880
sub_0207A880: ; 0x0207A880
	ldr r2, _0207A898 ; =0x00000654
	ldr r0, [r0, r2]
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #2
	bne _0207A892
	mov r0, #1
	tst r1, r0
	bne _0207A894
_0207A892:
	mov r0, #0
_0207A894:
	bx lr
	nop
_0207A898: .word 0x00000654
	thumb_func_end sub_0207A880

	thumb_func_start sub_0207A89C
sub_0207A89C: ; 0x0207A89C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r3, #0
	ldr r0, _0207A8EC ; =0x00000C65
	str r3, [sp]
	ldrb r0, [r4, r0]
	add r1, sp, #0xc
	add r1, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _0207A8F0 ; =0x00000948
	add r2, sp, #0xc
	ldr r0, [r4, r0]
	bl sub_02020A24
	ldr r0, _0207A8F4 ; =0x00000654
	ldr r1, _0207A8EC ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	add r0, #0x25
	ldrb r0, [r0]
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207A8F8 ; =0x00000678
	ldr r0, [r4, r0]
	bl sub_020248F0
	ldr r0, _0207A8F8 ; =0x00000678
	add r2, sp, #0xc
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r4, r0]
	bl sub_0200DD88
	add sp, #0x10
	pop {r4, pc}
	nop
_0207A8EC: .word 0x00000C65
_0207A8F0: .word 0x00000948
_0207A8F4: .word 0x00000654
_0207A8F8: .word 0x00000678
	thumb_func_end sub_0207A89C

	thumb_func_start sub_0207A8FC
sub_0207A8FC: ; 0x0207A8FC
	push {r3, lr}
	bl sub_0207A99C
	cmp r0, #1
	bne _0207A90A
	mov r0, #1
	pop {r3, pc}
_0207A90A:
	mov r0, #5
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0207A8FC

	thumb_func_start sub_0207A910
sub_0207A910: ; 0x0207A910
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	sub r0, r4, #6
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #1
	bhi _0207A92C
	ldr r0, _0207A97C ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	b _0207A960
_0207A92C:
	ldr r0, _0207A980 ; =0x00000654
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r0, #0x25
	ldrb r0, [r0]
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207A97C ; =0x00000678
	ldr r0, [r5, r0]
	bl sub_020248F0
	ldr r0, _0207A97C ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0207A97C ; =0x00000678
	lsl r1, r6, #0x10
	lsl r2, r7, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
_0207A960:
	ldr r0, _0207A984 ; =0x00000C65
	mov r2, #0
	ldrb r1, [r5, r0]
	strb r4, [r5, r0]
	add r0, r5, #0
	bl sub_0207B51C
	ldr r1, _0207A984 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r2, #1
	bl sub_0207B51C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207A97C: .word 0x00000678
_0207A980: .word 0x00000654
_0207A984: .word 0x00000C65
	thumb_func_end sub_0207A910

	thumb_func_start sub_0207A988
sub_0207A988: ; 0x0207A988
	push {r3, lr}
	bl sub_0207A910
	ldr r0, _0207A998 ; =0x000005DC
	bl PlaySE
	pop {r3, pc}
	nop
_0207A998: .word 0x000005DC
	thumb_func_end sub_0207A988

	thumb_func_start sub_0207A99C
sub_0207A99C: ; 0x0207A99C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _0207AABC ; =gMain
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	mov r3, #4
	tst r1, r0
	beq _0207A9B2
	mov r3, #0
	b _0207A9CE
_0207A9B2:
	mov r1, #0x80
	tst r1, r0
	beq _0207A9BC
	mov r3, #1
	b _0207A9CE
_0207A9BC:
	mov r1, #0x20
	tst r1, r0
	beq _0207A9C6
	mov r3, #2
	b _0207A9CE
_0207A9C6:
	mov r1, #0x10
	tst r0, r1
	beq _0207A9CE
	mov r3, #3
_0207A9CE:
	cmp r3, #4
	bne _0207A9D8
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0207A9D8:
	ldr r5, _0207AAC0 ; =0x00000C65
	ldrb r0, [r4, r5]
	cmp r0, #6
	bne _0207AA14
	cmp r3, #0
	add r1, sp, #0
	bne _0207AA06
	add r5, r5, #1
	ldrb r6, [r4, r5]
	mov r5, #1
	ldr r3, _0207AAC4 ; =_021012CC
	and r5, r6
	add r6, r5, #2
	mov r5, #6
	mul r5, r6
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	add r3, r3, r5
	bl sub_0207AB20
	add r1, r0, #0
	b _0207AA96
_0207AA06:
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	bl sub_0207AAD0
	add r1, r0, #0
	b _0207AA96
_0207AA14:
	cmp r0, #7
	bne _0207AA88
	ldr r0, _0207AAC8 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207AA56
	cmp r0, #0x11
	beq _0207AA56
	cmp r0, #0x17
	beq _0207AA56
	cmp r0, #0x16
	beq _0207AA56
	cmp r3, #0
	bne _0207AA56
	add r5, r5, #1
	ldrb r6, [r4, r5]
	mov r5, #1
	add r1, sp, #0
	and r5, r6
	add r6, r5, #2
	mov r5, #6
	ldr r3, _0207AAC4 ; =_021012CC
	mul r5, r6
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	add r3, r3, r5
	bl sub_0207AB20
	add r1, r0, #0
	b _0207AA96
_0207AA56:
	cmp r3, #1
	add r1, sp, #0
	bne _0207AA7A
	ldr r5, _0207AACC ; =0x00000C66
	ldr r3, _0207AAC4 ; =_021012CC
	ldrb r6, [r4, r5]
	mov r5, #1
	add r0, r4, #0
	and r6, r5
	mov r5, #6
	mul r5, r6
	add r1, #1
	add r2, sp, #0
	add r3, r3, r5
	bl sub_0207AB20
	add r1, r0, #0
	b _0207AA96
_0207AA7A:
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	bl sub_0207AAD0
	add r1, r0, #0
	b _0207AA96
_0207AA88:
	add r1, sp, #0
	add r0, r4, #0
	add r1, #1
	add r2, sp, #0
	bl sub_0207AAD0
	add r1, r0, #0
_0207AA96:
	ldr r0, _0207AAC0 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _0207AAB4
	cmp r1, #0xff
	beq _0207AAB4
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	add r0, r4, #0
	bl sub_0207A988
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0207AAB4:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0207AABC: .word gMain
_0207AAC0: .word 0x00000C65
_0207AAC4: .word _021012CC
_0207AAC8: .word 0x00000654
_0207AACC: .word 0x00000C66
	thumb_func_end sub_0207A99C

	thumb_func_start sub_0207AAD0
sub_0207AAD0: ; 0x0207AAD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0207AB18 ; =0x00000C65
	add r7, r1, #0
	ldrb r4, [r5, r0]
	str r2, [sp, #0xc]
	add r6, r3, #0
_0207AAE0:
	mov r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, _0207AB1C ; =0x00000948
	str r6, [sp, #8]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0xc]
	add r1, r7, #0
	mov r3, #0
	bl sub_02020A24
	add r4, r0, #0
	cmp r4, #6
	beq _0207AB10
	cmp r4, #7
	beq _0207AB10
	cmp r4, #0xff
	beq _0207AB10
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02079E28
	cmp r0, #0
	beq _0207AAE0
_0207AB10:
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207AB18: .word 0x00000C65
_0207AB1C: .word 0x00000948
	thumb_func_end sub_0207AAD0

	thumb_func_start sub_0207AB20
sub_0207AB20: ; 0x0207AB20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp, #0xc]
	add r5, r3, #0
	mov r4, #0
_0207AB2E:
	cmp r4, #6
	beq _0207AB64
	ldrb r1, [r5, r4]
	add r0, r6, #0
	bl sub_02079E28
	cmp r0, #0
	beq _0207AB5C
	mov r3, #0
	str r3, [sp]
	ldrb r0, [r5, r4]
	ldr r2, [sp, #0xc]
	add r1, r7, #0
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _0207AB80 ; =0x00000948
	ldr r0, [r6, r0]
	bl sub_02020A24
	add sp, #0x10
	ldrb r0, [r5, r4]
	pop {r3, r4, r5, r6, r7, pc}
_0207AB5C:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	b _0207AB2E
_0207AB64:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _0207AB80 ; =0x00000948
	ldr r2, [sp, #0xc]
	ldr r0, [r6, r0]
	add r1, r7, #0
	bl sub_02020A24
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207AB80: .word 0x00000948
	thumb_func_end sub_0207AB20

	thumb_func_start sub_0207AB84
sub_0207AB84: ; 0x0207AB84
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xfa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207ABA4
	ldr r0, _0207AC10 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	b _0207ABF0
_0207ABA4:
	mov r3, #0
	ldr r0, _0207AC14 ; =0x00000C65
	str r3, [sp]
	ldrb r0, [r5, r0]
	add r1, sp, #0xc
	add r1, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _0207AC18 ; =0x00000948
	add r2, sp, #0xc
	ldr r0, [r5, r0]
	bl sub_02020A24
	ldr r0, _0207AC1C ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r0, #0x25
	ldrb r0, [r0]
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207AC10 ; =0x00000678
	ldr r0, [r5, r0]
	bl sub_020248F0
	ldr r0, _0207AC10 ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0207AC10 ; =0x00000678
	add r2, sp, #0xc
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DD88
_0207ABF0:
	ldr r0, _0207AC14 ; =0x00000C65
	mov r2, #0
	ldrb r1, [r5, r0]
	strb r4, [r5, r0]
	add r0, r5, #0
	bl sub_0207B51C
	ldr r1, _0207AC14 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r2, #1
	bl sub_0207B51C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0207AC10: .word 0x00000678
_0207AC14: .word 0x00000C65
_0207AC18: .word 0x00000948
_0207AC1C: .word 0x00000654
	thumb_func_end sub_0207AB84

	thumb_func_start sub_0207AC20
sub_0207AC20: ; 0x0207AC20
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0xc6
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0207AC6C
	cmp r1, #1
	beq _0207AC3C
	cmp r1, #2
	beq _0207AC68
	add sp, #4
	pop {r3, r4, pc}
_0207AC3C:
	add r0, r0, #1
	ldrb r0, [r4, r0]
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0207BBFC
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, r4, #0
	bl sub_0207F2A8
	mov r0, #0xc6
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add sp, #4
	add r1, r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, pc}
_0207AC68:
	mov r1, #0
	strb r1, [r4, r0]
_0207AC6C:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0207AC20

	thumb_func_start sub_0207AC70
sub_0207AC70: ; 0x0207AC70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _0207AD50 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0207AD54 ; =0x00000C65
	ldrb r1, [r5, r0]
	cmp r1, #6
	bne _0207AC88
	mov r0, #4
	pop {r3, r4, r5, pc}
_0207AC88:
	cmp r1, #7
	bne _0207ACAA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _0207AD58 ; =0x00000C63
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207AD4A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207CB3C
	mov r0, #3
	pop {r3, r4, r5, pc}
_0207ACAA:
	ldr r0, _0207AD5C ; =0x00000654
	ldr r2, [r5, r0]
	add r2, #0x24
	ldrb r2, [r2]
	cmp r2, #3
	beq _0207ACBA
	cmp r2, #0x13
	bne _0207ACC4
_0207ACBA:
	ldr r0, _0207AD60 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
_0207ACC4:
	cmp r2, #0x14
	beq _0207ACCC
	cmp r2, #0xe
	bne _0207ACEE
_0207ACCC:
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207AD64 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0207ACE4
	ldr r0, _0207AD60 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
_0207ACE4:
	ldr r0, _0207AD68 ; =0x000005F2
	bl PlaySE
	mov r0, #5
	pop {r3, r4, r5, pc}
_0207ACEE:
	cmp r2, #0xf
	bne _0207AD2A
	mov r2, #0x30
	mul r2, r1
	ldr r1, _0207AD64 ; =0x00000838
	add r2, r5, r2
	ldrb r1, [r2, r1]
	cmp r1, #0
	bne _0207AD20
	sub r0, #0x78
	bl PlaySE
	add r0, r5, #0
	bl sub_0207E068
	ldr r1, _0207AD54 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207F3A4
	add r0, r5, #0
	bl sub_0207AFC4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0207AD20:
	sub r0, #0x62
	bl PlaySE
	mov r0, #5
	pop {r3, r4, r5, pc}
_0207AD2A:
	sub r0, #0x78
	bl PlaySE
	add r0, r5, #0
	bl sub_0207E068
	ldr r1, _0207AD54 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207F3A4
	add r0, r5, #0
	bl sub_0207AFC4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0207AD4A:
	mov r0, #5
	pop {r3, r4, r5, pc}
	nop
_0207AD50: .word 0x04000050
_0207AD54: .word 0x00000C65
_0207AD58: .word 0x00000C63
_0207AD5C: .word 0x00000654
_0207AD60: .word 0x000005DC
_0207AD64: .word 0x00000838
_0207AD68: .word 0x000005F2
	thumb_func_end sub_0207AC70

	thumb_func_start sub_0207AD6C
sub_0207AD6C: ; 0x0207AD6C
	push {r3, lr}
	ldr r2, _0207ADAC ; =0x00000654
	mov r1, #0
	ldr r2, [r0, r2]
	add r0, r2, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207AD8C
	cmp r0, #0x11
	beq _0207AD8C
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207AD94
_0207AD8C:
	ldr r0, _0207ADB0 ; =_02110104
	bl sub_02025224
	pop {r3, pc}
_0207AD94:
	add r2, #0x25
	ldrb r0, [r2]
	cmp r0, #2
	bne _0207AD9E
	mov r1, #1
_0207AD9E:
	ldr r2, _0207ADB4 ; =_02110128
	lsl r0, r1, #5
	add r0, r2, r0
	bl sub_02025224
	pop {r3, pc}
	nop
_0207ADAC: .word 0x00000654
_0207ADB0: .word _02110104
_0207ADB4: .word _02110128
	thumb_func_end sub_0207AD6C

	thumb_func_start sub_0207ADB8
sub_0207ADB8: ; 0x0207ADB8
	push {r4, r5, r6, lr}
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r1, [r5, #0xc]
	cmp r1, #1
	bne _0207ADDC
	bl sub_0207CC24
	cmp r0, #0
	bne _0207ADD8
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207ADD8:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207ADDC:
	bl sub_0207AD6C
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0207AEBE
	cmp r5, #7
	bhi _0207AE44
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207ADFA: ; jump table
	.short _0207AE0A - _0207ADFA - 2 ; case 0
	.short _0207AE0A - _0207ADFA - 2 ; case 1
	.short _0207AE0A - _0207ADFA - 2 ; case 2
	.short _0207AE0A - _0207ADFA - 2 ; case 3
	.short _0207AE0A - _0207ADFA - 2 ; case 4
	.short _0207AE0A - _0207ADFA - 2 ; case 5
	.short _0207AE3A - _0207ADFA - 2 ; case 6
	.short _0207AE90 - _0207ADFA - 2 ; case 7
_0207AE0A:
	ldr r0, _0207AFAC ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r5, r0
	bhs _0207AE44
	ldr r0, _0207AFB0 ; =0x00000948
	lsl r3, r5, #3
	ldr r6, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r6, r3]
	add r3, r6, r3
	ldrb r3, [r3, #1]
	add r1, r5, #0
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #1
	bl sub_0207AC70
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207AE3A:
	ldr r0, _0207AFB4 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0207AE46
_0207AE44:
	b _0207AFA6
_0207AE46:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _0207AFB8 ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl sub_0207CB3C
	ldr r0, _0207AFBC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0207AFB0 ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AE90:
	ldr r0, _0207AFB0 ; =0x00000948
	mov r1, #6
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x30
	add r3, #0x31
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A988
	add r0, r4, #0
	mov r1, #1
	bl sub_0207AC70
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #8
	mov r3, #1
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AEBE:
	ldr r0, _0207AFC0 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207AF36
	ldr r0, _0207AFB8 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #7
	bne _0207AEFA
	ldr r0, _0207AFB0 ; =0x00000948
	lsl r5, r1, #3
	ldr r3, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r3, r5]
	add r3, r3, r5
	ldrb r3, [r3, #1]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #0
	bl sub_0207AC70
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #9
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AEFA:
	cmp r1, #6
	bne _0207AF28
	ldr r0, _0207AFB0 ; =0x00000948
	lsl r5, r1, #3
	ldr r3, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r3, r5]
	add r3, r3, r5
	ldrb r3, [r3, #1]
	bl sub_0207A988
	add r0, r4, #0
	mov r1, #0
	bl sub_0207AC70
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #8
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AF28:
	add r0, r4, #0
	mov r1, #0
	bl sub_0207AC70
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207AF36:
	mov r0, #2
	tst r0, r1
	beq _0207AF9E
	ldr r0, _0207AFB4 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207AF9E
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	add r0, r4, #0
	mov r1, #0
	bl sub_0207CB3C
	ldr r0, _0207AFBC ; =0x04000050
	mov r3, #0
	strh r3, [r0]
	ldr r0, _0207AFB8 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	bne _0207AF78
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	bl sub_0207CBD0
	b _0207AF9A
_0207AF78:
	ldr r0, _0207AFB0 ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
_0207AF9A:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207AF9E:
	add r0, r4, #0
	bl sub_0207A8FC
	add r6, r0, #0
_0207AFA6:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0207AFAC: .word 0x00000654
_0207AFB0: .word 0x00000948
_0207AFB4: .word 0x00000C63
_0207AFB8: .word 0x00000C65
_0207AFBC: .word 0x04000050
_0207AFC0: .word gMain
	thumb_func_end sub_0207ADB8

	thumb_func_start sub_0207AFC4
sub_0207AFC4: ; 0x0207AFC4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0xc
	mov r1, #8
	bl AllocFromHeap
	add r5, r0, #0
	ldr r0, _0207B0A8 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xf
	bgt _0207AFFC
	bge _0207B034
	cmp r0, #2
	bgt _0207B070
	cmp r0, #0
	blt _0207B070
	beq _0207B01C
	cmp r0, #2
	beq _0207B028
	b _0207B070
_0207AFFC:
	sub r0, #0x11
	cmp r0, #6
	bhi _0207B070
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B00E: ; jump table
	.short _0207B028 - _0207B00E - 2 ; case 0
	.short _0207B040 - _0207B00E - 2 ; case 1
	.short _0207B070 - _0207B00E - 2 ; case 2
	.short _0207B070 - _0207B00E - 2 ; case 3
	.short _0207B04C - _0207B00E - 2 ; case 4
	.short _0207B058 - _0207B00E - 2 ; case 5
	.short _0207B064 - _0207B00E - 2 ; case 6
_0207B01C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B0B0
	add r2, r0, #0
	b _0207B07A
_0207B028:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B23C
	add r2, r0, #0
	b _0207B07A
_0207B034:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B1BC
	add r2, r0, #0
	b _0207B07A
_0207B040:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B1C8
	add r2, r0, #0
	b _0207B07A
_0207B04C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B32C
	add r2, r0, #0
	b _0207B07A
_0207B058:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B28C
	add r2, r0, #0
	b _0207B07A
_0207B064:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B2DC
	add r2, r0, #0
	b _0207B07A
_0207B070:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207B200
	add r2, r0, #0
_0207B07A:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207D0E4
	mov r0, #0xc
	add r1, r5, #0
	bl FreeToHeapExplicit
	add r0, r4, #0
	bl sub_0207D1C8
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAD8
	ldr r0, _0207B0AC ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207B0A8: .word 0x00000654
_0207B0AC: .word 0x00000678
	thumb_func_end sub_0207AFC4

	thumb_func_start sub_0207B0B0
sub_0207B0B0: ; 0x0207B0B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	ldr r1, _0207B1B0 ; =0x00000654
	str r0, [sp]
	ldr r0, [r0, r1]
	ldr r2, _0207B1B4 ; =0x00000C65
	ldr r1, [sp]
	ldr r0, [r0]
	ldrb r1, [r1, r2]
	bl GetPartyMonByIndex
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	mov r1, #1
	strb r1, [r0]
	mov r4, #0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r1, _0207B1B0 ; =0x00000654
	ldr r0, [sp]
	ldr r0, [r0, r1]
	ldr r0, [r0, #0x1c]
	bl sub_02067584
	cmp r0, #0
	bne _0207B19E
	ldr r0, _0207B1B4 ; =0x00000C65
	ldr r1, [sp]
	ldrb r2, [r1, r0]
	mov r1, #0x30
	add r3, r2, #0
	ldr r2, [sp]
	mul r3, r1
	add r3, r2, r3
	ldr r2, _0207B1B8 ; =0x00000838
	ldrb r3, [r3, r2]
	cmp r3, #0
	bne _0207B184
	ldr r3, [sp, #4]
	add r6, r4, #0
	strb r6, [r3, r5]
	add r3, r5, #1
	lsl r3, r3, #0x18
	lsr r5, r3, #0x18
	ldr r3, [sp]
	ldrb r0, [r3, r0]
	mul r1, r0
	add r0, r3, #0
	add r1, r0, r1
	sub r0, r2, #4
	ldrh r0, [r1, r0]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207B128
	mov r1, #5
	ldr r0, [sp, #4]
	b _0207B12C
_0207B128:
	ldr r0, [sp, #4]
	mov r1, #2
_0207B12C:
	strb r1, [r0, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #4]
	mov r1, #9
	strb r1, [r0, r2]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	mov r6, #0
_0207B142:
	add r1, r6, #0
	ldr r0, [sp, #8]
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	beq _0207B1AA
	add r0, r7, #0
	bl sub_0207BCC0
	cmp r0, #0xff
	beq _0207B178
	ldr r1, [sp, #4]
	add r2, r4, #0
	strb r0, [r1, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp]
	add r1, r7, #0
	bl sub_0207D0A0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0207B178:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	blo _0207B142
	b _0207B1AA
_0207B184:
	ldr r0, [sp, #4]
	add r1, r4, #0
	strb r1, [r0, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #4]
	mov r1, #9
	strb r1, [r0, r2]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	b _0207B1AA
_0207B19E:
	ldr r0, [sp, #4]
	mov r1, #9
	strb r1, [r0, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_0207B1AA:
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207B1B0: .word 0x00000654
_0207B1B4: .word 0x00000C65
_0207B1B8: .word 0x00000838
	thumb_func_end sub_0207B0B0

	thumb_func_start sub_0207B1BC
sub_0207B1BC: ; 0x0207B1BC
	mov r0, #0xe
	strb r0, [r1]
	mov r0, #9
	strb r0, [r1, #1]
	mov r0, #2
	bx lr
	thumb_func_end sub_0207B1BC

	thumb_func_start sub_0207B1C8
sub_0207B1C8: ; 0x0207B1C8
	ldr r2, _0207B1F8 ; =0x00000C65
	ldrb r3, [r0, r2]
	mov r2, #0x30
	mul r2, r3
	add r2, r0, r2
	ldr r0, _0207B1FC ; =0x00000838
	ldrb r0, [r2, r0]
	cmp r0, #0
	bne _0207B1EA
	mov r0, #8
	strb r0, [r1]
	mov r0, #1
	strb r0, [r1, #1]
	mov r0, #9
	strb r0, [r1, #2]
	mov r0, #3
	bx lr
_0207B1EA:
	mov r0, #1
	strb r0, [r1]
	mov r0, #9
	strb r0, [r1, #1]
	mov r0, #2
	bx lr
	nop
_0207B1F8: .word 0x00000C65
_0207B1FC: .word 0x00000838
	thumb_func_end sub_0207B1C8

	thumb_func_start sub_0207B200
sub_0207B200: ; 0x0207B200
	ldr r2, _0207B234 ; =0x00000C65
	ldrb r3, [r0, r2]
	mov r2, #0x30
	mul r2, r3
	add r2, r0, r2
	ldr r0, _0207B238 ; =0x00000836
	ldrh r0, [r2, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0207B226
	mov r0, #0xd
	strb r0, [r1]
	mov r0, #1
	strb r0, [r1, #1]
	mov r0, #9
	strb r0, [r1, #2]
	mov r0, #3
	bx lr
_0207B226:
	mov r0, #1
	strb r0, [r1]
	mov r0, #9
	strb r0, [r1, #1]
	mov r0, #2
	bx lr
	nop
_0207B234: .word 0x00000C65
_0207B238: .word 0x00000836
	thumb_func_end sub_0207B200

	thumb_func_start sub_0207B23C
sub_0207B23C: ; 0x0207B23C
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0207B288 ; =0x00000C65
	ldrb r1, [r0, r1]
	bl sub_0207B364
	cmp r0, #0
	beq _0207B256
	cmp r0, #1
	beq _0207B262
	cmp r0, #2
	beq _0207B272
	b _0207B282
_0207B256:
	mov r0, #1
	strb r0, [r4]
	mov r0, #9
	strb r0, [r4, #1]
	mov r0, #2
	pop {r4, pc}
_0207B262:
	mov r0, #0xb
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B272:
	mov r0, #0xc
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B282:
	mov r0, #0
	pop {r4, pc}
	nop
_0207B288: .word 0x00000C65
	thumb_func_end sub_0207B23C

	thumb_func_start sub_0207B28C
sub_0207B28C: ; 0x0207B28C
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0207B2D8 ; =0x00000C65
	ldrb r1, [r0, r1]
	bl sub_0207B418
	cmp r0, #0
	beq _0207B2A6
	cmp r0, #1
	beq _0207B2B2
	cmp r0, #2
	beq _0207B2C2
	b _0207B2D2
_0207B2A6:
	mov r0, #1
	strb r0, [r4]
	mov r0, #9
	strb r0, [r4, #1]
	mov r0, #2
	pop {r4, pc}
_0207B2B2:
	mov r0, #0xb
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B2C2:
	mov r0, #0xc
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B2D2:
	mov r0, #0
	pop {r4, pc}
	nop
_0207B2D8: .word 0x00000C65
	thumb_func_end sub_0207B28C

	thumb_func_start sub_0207B2DC
sub_0207B2DC: ; 0x0207B2DC
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0207B328 ; =0x00000C65
	ldrb r1, [r0, r1]
	bl sub_0207B4A0
	cmp r0, #0
	beq _0207B2F6
	cmp r0, #1
	beq _0207B302
	cmp r0, #2
	beq _0207B312
	b _0207B322
_0207B2F6:
	mov r0, #1
	strb r0, [r4]
	mov r0, #9
	strb r0, [r4, #1]
	mov r0, #2
	pop {r4, pc}
_0207B302:
	mov r0, #0xb
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B312:
	mov r0, #0xc
	strb r0, [r4]
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #9
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, pc}
_0207B322:
	mov r0, #0
	pop {r4, pc}
	nop
_0207B328: .word 0x00000C65
	thumb_func_end sub_0207B2DC

	thumb_func_start sub_0207B32C
sub_0207B32C: ; 0x0207B32C
	ldr r2, _0207B35C ; =0x00000C65
	ldrb r3, [r0, r2]
	mov r2, #0x30
	mul r2, r3
	add r2, r0, r2
	ldr r0, _0207B360 ; =0x00000838
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _0207B34E
	mov r0, #1
	strb r0, [r1]
	mov r0, #0xf
	strb r0, [r1, #1]
	mov r0, #9
	strb r0, [r1, #2]
	mov r0, #3
	bx lr
_0207B34E:
	mov r0, #1
	strb r0, [r1]
	mov r0, #9
	strb r0, [r1, #1]
	mov r0, #2
	bx lr
	nop
_0207B35C: .word 0x00000C65
_0207B360: .word 0x00000838
	thumb_func_end sub_0207B32C

	thumb_func_start sub_0207B364
sub_0207B364: ; 0x0207B364
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207B408 ; =0x00000654
	add r4, r1, #0
	ldr r2, [r5, r0]
	ldr r0, [r2, #0x14]
	cmp r0, #0
	beq _0207B392
	ldr r0, [r2]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, _0207B408 ; =0x00000654
	ldr r2, _0207B40C ; =0x00000C74
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	ldr r0, [r0, #0x14]
	bl sub_0207496C
	cmp r0, #0
	bne _0207B392
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B392:
	ldr r0, _0207B408 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0207B3B8
	mov r0, #0x30
	mul r0, r4
	ldr r1, _0207B410 ; =0x0000082C
	add r2, r5, r0
	ldrh r0, [r2, r1]
	add r1, #0xd
	ldrb r1, [r2, r1]
	bl sub_020726F8
	cmp r0, #1
	bne _0207B3B8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B3B8:
	ldr r1, _0207B408 ; =0x00000654
	mov r0, #0
	ldr r2, [r5, r1]
	add r1, r2, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x1c
	beq _0207B3E4
	add r1, r4, #1
_0207B3CC:
	add r6, r2, r0
	add r6, #0x30
	ldrb r6, [r6]
	cmp r1, r6
	bne _0207B3DA
	mov r0, #2
	pop {r4, r5, r6, pc}
_0207B3DA:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r3
	blo _0207B3CC
_0207B3E4:
	mov r0, #0x30
	mul r0, r4
	add r3, r5, r0
	ldr r0, _0207B414 ; =0x00000838
	ldrb r1, [r3, r0]
	cmp r1, #1
	beq _0207B3FE
	sub r0, r0, #6
	add r2, #0x37
	ldrh r1, [r3, r0]
	ldrb r0, [r2]
	cmp r1, r0
	ble _0207B402
_0207B3FE:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B402:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0207B408: .word 0x00000654
_0207B40C: .word 0x00000C74
_0207B410: .word 0x0000082C
_0207B414: .word 0x00000838
	thumb_func_end sub_0207B364

	thumb_func_start sub_0207B418
sub_0207B418: ; 0x0207B418
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207B494 ; =0x00000654
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _0207B444
	mov r0, #0x30
	mul r0, r4
	ldr r1, _0207B498 ; =0x0000082C
	add r2, r5, r0
	ldrh r0, [r2, r1]
	add r1, #0xd
	ldrb r1, [r2, r1]
	bl sub_020726F8
	cmp r0, #1
	bne _0207B444
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B444:
	ldr r1, _0207B494 ; =0x00000654
	mov r0, #0
	ldr r2, [r5, r1]
	add r1, r2, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x1c
	beq _0207B470
	add r1, r4, #1
_0207B458:
	add r6, r2, r0
	add r6, #0x30
	ldrb r6, [r6]
	cmp r1, r6
	bne _0207B466
	mov r0, #2
	pop {r4, r5, r6, pc}
_0207B466:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r3
	blo _0207B458
_0207B470:
	mov r0, #0x30
	mul r0, r4
	add r3, r5, r0
	ldr r0, _0207B49C ; =0x00000838
	ldrb r1, [r3, r0]
	cmp r1, #1
	beq _0207B48A
	sub r0, r0, #6
	add r2, #0x37
	ldrh r1, [r3, r0]
	ldrb r0, [r2]
	cmp r1, r0
	bge _0207B48E
_0207B48A:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B48E:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0207B494: .word 0x00000654
_0207B498: .word 0x0000082C
_0207B49C: .word 0x00000838
	thumb_func_end sub_0207B418

	thumb_func_start sub_0207B4A0
sub_0207B4A0: ; 0x0207B4A0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207B510 ; =0x00000654
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0207B4CC
	mov r0, #0x30
	mul r0, r4
	ldr r1, _0207B514 ; =0x0000082C
	add r2, r5, r0
	ldrh r0, [r2, r1]
	add r1, #0xd
	ldrb r1, [r2, r1]
	bl sub_020726F8
	cmp r0, #1
	bne _0207B4CC
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B4CC:
	ldr r1, _0207B510 ; =0x00000654
	mov r0, #0
	ldr r2, [r5, r1]
	add r1, r2, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x1c
	beq _0207B4F8
	add r1, r4, #1
_0207B4E0:
	add r6, r2, r0
	add r6, #0x30
	ldrb r6, [r6]
	cmp r1, r6
	bne _0207B4EE
	mov r0, #2
	pop {r4, r5, r6, pc}
_0207B4EE:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r3
	blo _0207B4E0
_0207B4F8:
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207B518 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207B50A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207B50A:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0207B510: .word 0x00000654
_0207B514: .word 0x0000082C
_0207B518: .word 0x00000838
	thumb_func_end sub_0207B4A0

	thumb_func_start sub_0207B51C
sub_0207B51C: ; 0x0207B51C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #6
	bne _0207B556
	mov r0, #0x1a
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020249A8
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r6, #0
	bne _0207B540
	mov r0, #2
	and r0, r1
	b _0207B546
_0207B540:
	mov r0, #2
	and r0, r1
	add r0, r0, #1
_0207B546:
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x1a
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020248F0
	pop {r4, r5, r6, pc}
_0207B556:
	cmp r4, #7
	bne _0207B584
	ldr r0, _0207B5E4 ; =0x00000684
	ldr r0, [r5, r0]
	bl sub_020249A8
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r6, #0
	bne _0207B570
	mov r0, #2
	and r0, r1
	b _0207B576
_0207B570:
	mov r0, #2
	and r0, r1
	add r0, r0, #1
_0207B576:
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _0207B5E4 ; =0x00000684
	ldr r0, [r5, r0]
	bl sub_020248F0
	pop {r4, r5, r6, pc}
_0207B584:
	cmp r6, #0
	ldr r1, _0207B5E8 ; =0x0000083E
	bne _0207B5B2
	mov r0, #0x30
	add r3, r5, r1
	mul r0, r4
	ldrsh r2, [r3, r0]
	add r1, r1, #2
	sub r2, r2, #2
	strh r2, [r3, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r0]
	sub r1, r1, #2
	strh r1, [r2, r0]
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_020248F0
	b _0207B5D8
_0207B5B2:
	mov r0, #0x30
	add r3, r5, r1
	mul r0, r4
	ldrsh r2, [r3, r0]
	add r1, r1, #2
	add r2, r2, #2
	strh r2, [r3, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r0]
	add r1, r1, #2
	strh r1, [r2, r0]
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_020248F0
_0207B5D8:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207A7F4
	pop {r4, r5, r6, pc}
	nop
_0207B5E4: .word 0x00000684
_0207B5E8: .word 0x0000083E
	thumb_func_end sub_0207B51C

	thumb_func_start sub_0207B5EC
sub_0207B5EC: ; 0x0207B5EC
	cmp r1, #0
	beq _0207B5F8
	cmp r0, #0
	beq _0207B5FC
	cmp r1, #1
	bne _0207B5FC
_0207B5F8:
	mov r0, #1
	bx lr
_0207B5FC:
	mov r0, #0
	bx lr
	thumb_func_end sub_0207B5EC

	thumb_func_start sub_0207B600
sub_0207B600: ; 0x0207B600
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r1, [r5, #0xc]
	cmp r1, #1
	bne _0207B640
	bl sub_0207CC24
	cmp r0, #0
	bne _0207B63C
	ldr r0, _0207B7C4 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	beq _0207B634
	ldr r0, _0207B7C8 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020249D4
	ldr r0, _0207B7C8 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020248F0
_0207B634:
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0207B63C:
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_0207B640:
	bl sub_0207AD6C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _0207B746
	cmp r6, #6
	bhi _0207B67A
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B65E: ; jump table
	.short _0207B66C - _0207B65E - 2 ; case 0
	.short _0207B66C - _0207B65E - 2 ; case 1
	.short _0207B66C - _0207B65E - 2 ; case 2
	.short _0207B66C - _0207B65E - 2 ; case 3
	.short _0207B66C - _0207B65E - 2 ; case 4
	.short _0207B66C - _0207B65E - 2 ; case 5
	.short _0207B728 - _0207B65E - 2 ; case 6
_0207B66C:
	ldr r0, _0207B7CC ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r6, r0
	blo _0207B67C
_0207B67A:
	b _0207B7C0
_0207B67C:
	ldr r0, _0207B7C4 ; =0x00000C65
	ldrb r5, [r4, r0]
	strb r6, [r4, r0]
	ldr r0, _0207B7D0 ; =0x000005DC
	bl PlaySE
	ldr r0, _0207B7D4 ; =0x00000C63
	ldrb r1, [r4, r0]
	add r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	cmp r0, r1
	bne _0207B6D2
	cmp r5, r0
	beq _0207B6C8
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0207B51C
	ldr r1, _0207B7C4 ; =0x00000C65
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r2, #1
	bl sub_0207B51C
	ldr r0, _0207B7D8 ; =0x00000948
	lsl r3, r6, #3
	ldr r5, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r5, r3]
	add r3, r5, r3
	ldrb r3, [r3, #1]
	add r1, r6, #0
	bl sub_0207A910
_0207B6C8:
	add r0, r4, #0
	bl sub_0207FBC8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0207B6D2:
	cmp r5, r0
	beq _0207B6E6
	cmp r5, r1
	beq _0207B6E6
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0207B51C
_0207B6E6:
	ldr r0, _0207B7D4 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1a
	lsr r1, r0, #0x1a
	cmp r5, r1
	bne _0207B6FA
	add r0, r4, #0
	mov r2, #0
	bl sub_0207B51C
_0207B6FA:
	ldr r0, _0207B7C4 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r5, r1
	beq _0207B70A
	add r0, r4, #0
	mov r2, #1
	bl sub_0207B51C
_0207B70A:
	ldr r0, _0207B7D8 ; =0x00000948
	lsl r3, r6, #3
	ldr r5, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r5, r3]
	add r3, r5, r3
	ldrb r3, [r3, #1]
	add r1, r6, #0
	bl sub_0207A910
	add r0, r4, #0
	bl sub_0207FC1C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0207B728:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_0207B746:
	ldr r0, _0207B7DC ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207B7A0
	ldr r0, _0207B7C4 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #7
	blo _0207B776
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_0207B776:
	sub r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	cmp r1, r0
	ldr r0, _0207B7D0 ; =0x000005DC
	bne _0207B792
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0207B792:
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FC1C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0207B7A0:
	mov r0, #2
	tst r0, r1
	beq _0207B7B8
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0207B7B8:
	add r0, r4, #0
	bl sub_0207A8FC
	add r7, r0, #0
_0207B7C0:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207B7C4: .word 0x00000C65
_0207B7C8: .word 0x00000684
_0207B7CC: .word 0x00000654
_0207B7D0: .word 0x000005DC
_0207B7D4: .word 0x00000C63
_0207B7D8: .word 0x00000948
_0207B7DC: .word gMain
	thumb_func_end sub_0207B600

	thumb_func_start sub_0207B7E0
sub_0207B7E0: ; 0x0207B7E0
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r1, _0207BA64 ; =0x00000654
	add r4, r0, #0
	ldr r3, [r4, r1]
	mov r0, #0
	add r1, r3, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	beq _0207B88A
_0207B7F8:
	add r2, r3, r0
	add r2, #0x30
	ldrb r2, [r2]
	cmp r2, #0
	bne _0207B880
	add r3, #0x36
	ldrb r0, [r3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #6
	bhi _0207B864
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B81A: ; jump table
	.short _0207B864 - _0207B81A - 2 ; case 0
	.short _0207B864 - _0207B81A - 2 ; case 1
	.short _0207B828 - _0207B81A - 2 ; case 2
	.short _0207B834 - _0207B81A - 2 ; case 3
	.short _0207B840 - _0207B81A - 2 ; case 4
	.short _0207B84C - _0207B81A - 2 ; case 5
	.short _0207B858 - _0207B81A - 2 ; case 6
_0207B828:
	add r0, r4, #0
	mov r1, #0x67
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B834:
	add r0, r4, #0
	mov r1, #0x6c
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B840:
	add r0, r4, #0
	mov r1, #0x6d
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B84C:
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B858:
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B864:
	add r0, r4, #0
	mov r1, #0x1e
	mov r2, #1
	bl sub_0207DAEC
_0207B86E:
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B880:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r1
	blo _0207B7F8
_0207B88A:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	beq _0207B98E
	ldr r2, _0207BA70 ; =0x00000C74
	ldr r1, [r3]
	ldr r2, [r4, r2]
	add r3, #0x30
	bl sub_02074A6C
	cmp r0, #8
	bhi _0207B98E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B8AC: ; jump table
	.short _0207B98E - _0207B8AC - 2 ; case 0
	.short _0207B8BE - _0207B8AC - 2 ; case 1
	.short _0207B91E - _0207B8AC - 2 ; case 2
	.short _0207B93A - _0207B8AC - 2 ; case 3
	.short _0207B98E - _0207B8AC - 2 ; case 4
	.short _0207B98E - _0207B8AC - 2 ; case 5
	.short _0207B956 - _0207B8AC - 2 ; case 6
	.short _0207B98E - _0207B8AC - 2 ; case 7
	.short _0207B972 - _0207B8AC - 2 ; case 8
_0207B8BE:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0xa7
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _0207BA64 ; =0x00000654
	mov r1, #3
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x14]
	bl sub_020290FC
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0207BA74 ; =0x000007C4
	mov r3, #3
	ldr r0, [r4, r0]
	bl BufferIntegerAsString
	ldr r1, _0207BA74 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B91E:
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B93A:
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B956:
	add r0, r4, #0
	mov r1, #0xa8
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B972:
	add r0, r4, #0
	mov r1, #0xbf
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B98E:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0207B9E6
	add r0, r4, #0
	bl sub_0207BA78
	cmp r0, #0
	beq _0207B9E6
	cmp r0, #1
	beq _0207B9AE
	cmp r0, #2
	beq _0207B9CA
	b _0207B9E6
_0207B9AE:
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B9CA:
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B9E6:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _0207BA1C
	add r0, r4, #0
	bl sub_0207BB14
	cmp r0, #0
	beq _0207BA1C
	cmp r0, #1
	bne _0207BA1C
	add r0, r4, #0
	mov r1, #0xbb
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207BA1C:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0207BA52
	add r0, r4, #0
	bl sub_0207BB88
	cmp r0, #0
	beq _0207BA52
	cmp r0, #1
	bne _0207BA52
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207BA52:
	ldr r0, _0207BA64 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0207BA64: .word 0x00000654
_0207BA68: .word 0x00000C62
_0207BA6C: .word 0x000005F2
_0207BA70: .word 0x00000C74
_0207BA74: .word 0x000007C4
	thumb_func_end sub_0207B7E0

	thumb_func_start sub_0207BA78
sub_0207BA78: ; 0x0207BA78
	push {r4, r5, r6, r7}
	add r5, r0, #0
	mov r0, #0
	mov ip, r0
	ldr r0, _0207BB08 ; =0x00000654
	ldr r4, [r5, r0]
_0207BA84:
	mov r0, ip
	add r0, r4, r0
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207BB02
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #6
	bhs _0207BAF4
	mov r0, ip
	add r7, r4, r0
_0207BAA0:
	add r0, r4, r3
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207BAF4
	add r0, r4, r3
	add r0, #0x30
	ldrb r1, [r0]
	mov r0, #0x30
	ldr r6, _0207BB0C ; =0x000007FC
	mul r0, r1
	add r2, r5, r0
	add r0, r7, #0
	add r0, #0x30
	ldrb r1, [r0]
	mov r0, #0x30
	ldrh r6, [r2, r6]
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207BB0C ; =0x000007FC
	ldrh r0, [r1, r0]
	cmp r0, r6
	bne _0207BAD4
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BAD4:
	ldr r0, _0207BB10 ; =0x00000804
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _0207BAEA
	ldr r1, _0207BB10 ; =0x00000804
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207BAEA
	mov r0, #2
	pop {r4, r5, r6, r7}
	bx lr
_0207BAEA:
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #6
	blo _0207BAA0
_0207BAF4:
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	cmp r0, #5
	blo _0207BA84
_0207BB02:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BB08: .word 0x00000654
_0207BB0C: .word 0x000007FC
_0207BB10: .word 0x00000804
	thumb_func_end sub_0207BA78

	thumb_func_start sub_0207BB14
sub_0207BB14: ; 0x0207BB14
	push {r4, r5, r6, r7}
	ldr r1, _0207BB80 ; =0x00000654
	mov r3, #0
	ldr r5, [r0, r1]
_0207BB1C:
	add r1, r5, r3
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BB7A
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	bhs _0207BB70
	add r2, r5, r3
_0207BB32:
	add r1, r5, r4
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BB70
	add r1, r2, #0
	add r1, #0x30
	ldrb r6, [r1]
	mov r1, #0x30
	mul r1, r6
	add r6, r0, r1
	ldr r1, _0207BB84 ; =0x000007FC
	ldrh r1, [r6, r1]
	add r6, r5, r4
	add r6, #0x30
	ldrb r7, [r6]
	mov r6, #0x30
	mul r6, r7
	add r7, r0, r6
	ldr r6, _0207BB84 ; =0x000007FC
	ldrh r6, [r7, r6]
	cmp r1, r6
	beq _0207BB66
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BB66:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	blo _0207BB32
_0207BB70:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #5
	blo _0207BB1C
_0207BB7A:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BB80: .word 0x00000654
_0207BB84: .word 0x000007FC
	thumb_func_end sub_0207BB14

	thumb_func_start sub_0207BB88
sub_0207BB88: ; 0x0207BB88
	push {r4, r5, r6, r7}
	ldr r1, _0207BBF4 ; =0x00000654
	mov r3, #0
	ldr r5, [r0, r1]
_0207BB90:
	add r1, r5, r3
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BBEE
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	bhs _0207BBE4
	add r2, r5, r3
_0207BBA6:
	add r1, r5, r4
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BBE4
	add r1, r2, #0
	add r1, #0x30
	ldrb r6, [r1]
	mov r1, #0x30
	mul r1, r6
	add r6, r0, r1
	ldr r1, _0207BBF8 ; =0x000007FC
	ldrh r1, [r6, r1]
	add r6, r5, r4
	add r6, #0x30
	ldrb r7, [r6]
	mov r6, #0x30
	mul r6, r7
	add r7, r0, r6
	ldr r6, _0207BBF8 ; =0x000007FC
	ldrh r6, [r7, r6]
	cmp r1, r6
	bne _0207BBDA
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BBDA:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	blo _0207BBA6
_0207BBE4:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #5
	blo _0207BB90
_0207BBEE:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BBF4: .word 0x00000654
_0207BBF8: .word 0x000007FC
	thumb_func_end sub_0207BB88

	thumb_func_start sub_0207BBFC
sub_0207BBFC: ; 0x0207BBFC
	lsl r3, r0, #1
	ldr r0, _0207BC14 ; =_021012B0
	ldrb r0, [r0, r3]
	lsl r0, r0, #3
	add r0, #0x14
	strh r0, [r1]
	ldr r0, _0207BC18 ; =_021012B0 + 1
	ldrb r0, [r0, r3]
	lsl r0, r0, #3
	add r0, #0x14
	strh r0, [r2]
	bx lr
	.balign 4, 0
_0207BC14: .word _021012B0
_0207BC18: .word _021012B0 + 1
	thumb_func_end sub_0207BBFC

	thumb_func_start sub_0207BC1C
sub_0207BC1C: ; 0x0207BC1C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _0207BCB4 ; =0x00000824
	add r5, r0, #0
	ldr r1, [r5, r1]
	bl sub_0207E778
	add r2, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r2, r0
	beq _0207BC3C
	add r0, r0, #1
	cmp r2, r0
	beq _0207BCB0
	b _0207BCAA
_0207BC3C:
	add r0, r5, #0
	mov r1, #0
	bl sub_02079224
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207BCB8 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r1, [r0]
	cmp r1, #2
	beq _0207BC76
	cmp r1, #0x11
	beq _0207BC76
	add r0, r1, #0
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207BC82
_0207BC76:
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _0207BC9C
_0207BC82:
	cmp r1, #0x15
	bne _0207BC92
	add r0, r5, #0
	mov r1, #0xb8
	mov r2, #1
	bl sub_0207DAC4
	b _0207BC9C
_0207BC92:
	add r0, r5, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
_0207BC9C:
	ldr r0, _0207BCBC ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	mov r0, #1
	pop {r3, r4, r5, pc}
_0207BCAA:
	add r0, r5, #0
	add r1, r4, #0
	blx r2
_0207BCB0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207BCB4: .word 0x00000824
_0207BCB8: .word 0x00000654
_0207BCBC: .word 0x00000678
	thumb_func_end sub_0207BC1C

	thumb_func_start sub_0207BCC0
sub_0207BCC0: ; 0x0207BCC0
	ldr r2, _0207BCE4 ; =_021013C4
	mov r3, #0
_0207BCC4:
	lsl r1, r3, #1
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207BCD4
	add r3, #0x10
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	bx lr
_0207BCD4:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #0x10
	blo _0207BCC4
	mov r0, #0xff
	bx lr
	nop
_0207BCE4: .word _021013C4
	thumb_func_end sub_0207BCC0

	thumb_func_start sub_0207BCE8
sub_0207BCE8: ; 0x0207BCE8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207BFD8
	cmp r0, #0
	beq _0207BCFE
	cmp r0, #1
	beq _0207BD40
	cmp r0, #2
	beq _0207BD50
	b _0207BD5A
_0207BCFE:
	ldr r0, _0207BD60 ; =0x000005EC
	bl PlaySE
	ldr r0, _0207BD64 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _0207BD68 ; =0x00000C65
	mov r1, #0x30
	ldrb r2, [r4, r0]
	mul r1, r2
	add r3, r4, r1
	mov r1, #0x83
	lsl r1, r1, #4
	ldrh r2, [r3, r1]
	sub r1, r1, #2
	ldrh r1, [r3, r1]
	sub r2, r2, r1
	add r1, r0, #3
	ldrh r1, [r4, r1]
	cmp r2, r1
	bge _0207BD30
	add r0, r0, #3
	strh r2, [r4, r0]
_0207BD30:
	ldr r0, _0207BD6C ; =0x00000C6A
	mov r1, #2
	strh r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	mov r0, #0x1e
	pop {r4, pc}
_0207BD40:
	ldr r0, _0207BD70 ; =0x000005DC
	bl PlaySE
	ldr r0, _0207BD6C ; =0x00000C6A
	mov r1, #1
	strh r1, [r4, r0]
	mov r0, #0x18
	pop {r4, pc}
_0207BD50:
	ldr r0, _0207BD74 ; =0x000005F2
	bl PlaySE
	mov r0, #0x1e
	pop {r4, pc}
_0207BD5A:
	mov r0, #0x1e
	pop {r4, pc}
	nop
_0207BD60: .word 0x000005EC
_0207BD64: .word 0x00000678
_0207BD68: .word 0x00000C65
_0207BD6C: .word 0x00000C6A
_0207BD70: .word 0x000005DC
_0207BD74: .word 0x000005F2
	thumb_func_end sub_0207BCE8

	thumb_func_start sub_0207BD78
sub_0207BD78: ; 0x0207BD78
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r2, [r5, #0xc]
	cmp r2, #1
	bne _0207BDBA
	bl sub_0207CC24
	cmp r0, #0
	bne _0207BDB4
	ldr r0, _0207BFB0 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	beq _0207BDAE
	ldr r0, _0207BFB4 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020249D4
	ldr r0, _0207BFB4 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020248F0
_0207BDAE:
	add sp, #8
	ldr r0, [r5, #8]
	pop {r4, r5, r6, pc}
_0207BDB4:
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BDBA:
	add r2, r1, #0
	sub r2, #0x26
	ldrh r2, [r4, r2]
	cmp r2, #4
	bhi _0207BE14
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0207BDD0: ; jump table
	.short _0207BDDA - _0207BDD0 - 2 ; case 0
	.short _0207BEB2 - _0207BDD0 - 2 ; case 1
	.short _0207BEDA - _0207BDD0 - 2 ; case 2
	.short _0207BF02 - _0207BDD0 - 2 ; case 3
	.short _0207BF88 - _0207BDD0 - 2 ; case 4
_0207BDDA:
	bl sub_0207AD6C
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0207BE54
	cmp r5, #6
	bhi _0207BE14
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207BDF8: ; jump table
	.short _0207BE06 - _0207BDF8 - 2 ; case 0
	.short _0207BE06 - _0207BDF8 - 2 ; case 1
	.short _0207BE06 - _0207BDF8 - 2 ; case 2
	.short _0207BE06 - _0207BDF8 - 2 ; case 3
	.short _0207BE06 - _0207BDF8 - 2 ; case 4
	.short _0207BE06 - _0207BDF8 - 2 ; case 5
	.short _0207BE34 - _0207BDF8 - 2 ; case 6
_0207BE06:
	ldr r0, _0207BFB8 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r5, r0
	blo _0207BE16
_0207BE14:
	b _0207BFAA
_0207BE16:
	ldr r0, _0207BFBC ; =0x00000948
	lsl r3, r5, #3
	ldr r6, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r6, r3]
	add r3, r6, r3
	ldrb r3, [r3, #1]
	add r1, r5, #0
	bl sub_0207A910
	add r0, r4, #0
	bl sub_0207BCE8
	add sp, #8
	pop {r4, r5, r6, pc}
_0207BE34:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #1
	mov r3, #0
	bl sub_0207CBD0
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BE54:
	ldr r0, _0207BFC0 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207BE90
	ldr r0, _0207BFB0 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _0207BE86
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #1
	mov r3, #0
	bl sub_0207CBD0
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BE86:
	add r0, r4, #0
	bl sub_0207BCE8
	add sp, #8
	pop {r4, r5, r6, pc}
_0207BE90:
	mov r0, #2
	tst r0, r1
	beq _0207BEAA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0207BEAA:
	add r0, r4, #0
	bl sub_0207A8FC
	b _0207BFAA
_0207BEB2:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _0207BFC4 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #0
	strh r1, [r4, r0]
	b _0207BFAA
_0207BEDA:
	sub r1, #0x2d
	ldrb r1, [r4, r1]
	mov r2, #0
	mvn r2, r2
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207C048
	cmp r0, #1
	bne _0207BFAA
	ldr r0, _0207BFCC ; =0x000005EC
	bl PlaySE
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #3
	strh r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	b _0207BFAA
_0207BF02:
	sub r1, #0x2b
	ldrb r1, [r4, r1]
	mov r2, #1
	bl sub_0207C048
	cmp r0, #1
	bne _0207BFAA
	ldr r0, _0207BFB8 ; =0x00000654
	ldr r1, _0207BFB0 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x41
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207BFD0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r2, _0207BFD4 ; =0x00000C6C
	str r1, [sp, #4]
	ldr r0, _0207BFD0 ; =0x000007C4
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, _0207BFD0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #4
	strh r1, [r4, r0]
	mov r1, #0x1e
	sub r0, #8
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #0x18
	pop {r4, r5, r6, pc}
_0207BF88:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _0207BFC4 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	bl sub_0207FBC8
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0207BFAA:
	mov r0, #0x1e
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207BFB0: .word 0x00000C65
_0207BFB4: .word 0x00000684
_0207BFB8: .word 0x00000654
_0207BFBC: .word 0x00000948
_0207BFC0: .word gMain
_0207BFC4: .word 0x00000678
_0207BFC8: .word 0x00000C6A
_0207BFCC: .word 0x000005EC
_0207BFD0: .word 0x000007C4
_0207BFD4: .word 0x00000C6C
	thumb_func_end sub_0207BD78

	thumb_func_start sub_0207BFD8
sub_0207BFD8: ; 0x0207BFD8
	push {r3, r4, r5, lr}
	ldr r2, _0207C038 ; =0x00000C65
	add r4, r0, #0
	ldrb r1, [r4, r2]
	mov r0, #0x30
	ldr r3, _0207C03C ; =0x00000838
	mul r0, r1
	add r0, r4, r0
	ldrb r5, [r0, r3]
	cmp r5, #0
	beq _0207BFF2
	mov r0, #2
	pop {r3, r4, r5, pc}
_0207BFF2:
	sub r2, r2, #2
	ldrb r2, [r4, r2]
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1a
	cmp r1, r2
	beq _0207C010
	add r1, r3, #0
	sub r1, #0xa
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _0207C010
	sub r3, #8
	ldrh r0, [r0, r3]
	cmp r1, r0
	bne _0207C032
_0207C010:
	ldr r0, _0207C040 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0x78
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _0207C044 ; =0x00000C6A
	mov r0, #1
	strh r0, [r4, r1]
	mov r2, #0x1e
	sub r1, #8
	strb r2, [r4, r1]
	pop {r3, r4, r5, pc}
_0207C032:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0207C038: .word 0x00000C65
_0207C03C: .word 0x00000838
_0207C040: .word 0x00000678
_0207C044: .word 0x00000C6A
	thumb_func_end sub_0207BFD8

	thumb_func_start sub_0207C048
sub_0207C048: ; 0x0207C048
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r3, #0x30
	add r4, r6, #0
	mul r4, r3
	ldr r3, _0207C0CC ; =0x0000082E
	add r5, r0, #0
	add r7, r5, r3
	lsl r2, r2, #0x10
	ldrh r3, [r7, r4]
	lsr r2, r2, #0x10
	add r2, r3, r2
	ldr r3, _0207C0D0 ; =0x00000C6C
	strh r2, [r7, r4]
	ldrh r2, [r5, r3]
	add r2, r2, #1
	strh r2, [r5, r3]
	bl sub_0207D480
	lsl r1, r6, #2
	add r1, r6, r1
	add r1, r1, #3
	add r0, r5, #4
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D440
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D4EC
	ldr r1, _0207C0D4 ; =0x00000C68
	ldrh r0, [r5, r1]
	add r1, r1, #4
	ldrh r1, [r5, r1]
	cmp r0, r1
	beq _0207C0AA
	mov r1, #0x83
	add r2, r5, r4
	lsl r1, r1, #4
	ldrh r0, [r7, r4]
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207C0C6
_0207C0AA:
	ldr r0, _0207C0D8 ; =0x00000654
	add r1, r6, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldrh r1, [r7, r4]
	add r2, sp, #0
	str r1, [sp]
	mov r1, #0xa3
	bl SetMonData
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207C0C6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207C0CC: .word 0x0000082E
_0207C0D0: .word 0x00000C6C
_0207C0D4: .word 0x00000C68
_0207C0D8: .word 0x00000654
	thumb_func_end sub_0207C048

	thumb_func_start sub_0207C0DC
sub_0207C0DC: ; 0x0207C0DC
	push {r4, r5, r6, lr}
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r1, [r5, #0xc]
	cmp r1, #1
	bne _0207C100
	bl sub_0207CC24
	cmp r0, #0
	bne _0207C0FC
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207C0FC:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C100:
	bl sub_0207AD6C
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0207C1AE
	cmp r5, #6
	bhi _0207C204
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207C11E: ; jump table
	.short _0207C12C - _0207C11E - 2 ; case 0
	.short _0207C12C - _0207C11E - 2 ; case 1
	.short _0207C12C - _0207C11E - 2 ; case 2
	.short _0207C12C - _0207C11E - 2 ; case 3
	.short _0207C12C - _0207C11E - 2 ; case 4
	.short _0207C12C - _0207C11E - 2 ; case 5
	.short _0207C176 - _0207C11E - 2 ; case 6
_0207C12C:
	ldr r0, _0207C268 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r5, r0
	bhs _0207C204
	ldr r0, _0207C26C ; =0x00000948
	lsl r3, r5, #3
	ldr r6, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r6, r3]
	add r3, r6, r3
	ldrb r3, [r3, #1]
	add r1, r5, #0
	bl sub_0207A910
	ldr r0, _0207C270 ; =0x00000C65
	strb r5, [r4, r0]
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207C274 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0207C16C
	ldr r0, _0207C278 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207C16C:
	ldr r0, _0207C27C ; =0x000005F2
	bl PlaySE
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C176:
	ldr r0, _0207C280 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C204
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _0207C26C ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C1AE:
	ldr r0, _0207C284 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207C204
	ldr r0, _0207C270 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #7
	bne _0207C1E2
	sub r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C200
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C1E2:
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207C274 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0207C1FA
	ldr r0, _0207C278 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207C1FA:
	ldr r0, _0207C27C ; =0x000005F2
	bl PlaySE
_0207C200:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C204:
	ldr r0, _0207C284 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0207C260
	ldr r0, _0207C280 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C25C
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _0207C270 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	bne _0207C236
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	b _0207C258
_0207C236:
	ldr r0, _0207C26C ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
_0207C258:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C25C:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C260:
	add r0, r4, #0
	bl sub_0207A8FC
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207C268: .word 0x00000654
_0207C26C: .word 0x00000948
_0207C270: .word 0x00000C65
_0207C274: .word 0x00000838
_0207C278: .word 0x000005DC
_0207C27C: .word 0x000005F2
_0207C280: .word 0x00000C63
_0207C284: .word gMain
	thumb_func_end sub_0207C0DC

	thumb_func_start sub_0207C288
sub_0207C288: ; 0x0207C288
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #0xc
	ldrh r0, [r0, #0x28]
	bl LoadItemDataOrGfx
	add r4, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r2, [r5, r0]
	ldr r0, _0207C3C4 ; =0x000001D2
	ldrh r1, [r2, #0x28]
	cmp r1, r0
	bne _0207C2D2
	ldr r1, _0207C3C8 ; =0x00000C65
	ldr r0, [r2]
	ldrb r1, [r5, r1]
	bl GetPartyMonByIndex
	bl Mon_CanUseGracidea
	cmp r0, #1
	bne _0207C2D2
	ldr r0, _0207C3C0 ; =0x00000654
	mov r1, #1
	ldr r0, [r5, r0]
	strh r1, [r0, #0x3c]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl sub_0207CB54
	mov r0, #0x1f
	pop {r3, r4, r5, pc}
_0207C2D2:
	add r0, r4, #0
	mov r1, #0x22
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0207C2EA
	add r0, r4, #0
	mov r1, #0x23
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C2FC
_0207C2EA:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0
	bl sub_02082654
	mov r0, #6
	pop {r3, r4, r5, pc}
_0207C2FC:
	add r0, r4, #0
	mov r1, #0x24
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C326
	add r0, r4, #0
	mov r1, #0x25
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0207C326
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #1
	bl sub_02082654
	mov r0, #6
	pop {r3, r4, r5, pc}
_0207C326:
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r2, _0207C3C8 ; =0x00000C65
	ldr r1, [r5, r0]
	mov r0, #0xc
	str r0, [sp]
	ldr r0, [r1]
	ldrh r1, [r1, #0x28]
	ldrb r2, [r5, r2]
	mov r3, #0
	bl CanUseItemOnMonInParty
	cmp r0, #1
	bne _0207C3A0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r2, #1
	ldr r1, [r5, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	add r0, r4, #0
	mov r1, #0x1a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C398
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r1, _0207C3C8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r2, #3
	ldr r3, [r5, r0]
	add r0, r3, #0
	add r0, #0x40
	str r0, [sp]
	ldrh r3, [r3, #0x28]
	mov r0, #0
	bl GetMonEvolution
	ldr r1, _0207C3C0 ; =0x00000654
	ldr r2, [r5, r1]
	strh r0, [r2, #0x3c]
	ldr r0, [r5, r1]
	mov r2, #8
	add r0, #0x27
	strb r2, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x20
	pop {r3, r4, r5, pc}
_0207C398:
	add r0, r5, #0
	bl sub_020812E8
	b _0207C3B6
_0207C3A0:
	add r0, r5, #0
	mov r1, #0x66
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207C3C8 ; =0x00000C65
	mov r1, #7
	strb r1, [r5, r0]
	ldr r1, _0207C3CC ; =sub_02081378
	sub r0, #0x11
	str r1, [r5, r0]
_0207C3B6:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207C3C0: .word 0x00000654
_0207C3C4: .word 0x000001D2
_0207C3C8: .word 0x00000C65
_0207C3CC: .word sub_02081378
	thumb_func_end sub_0207C288

	thumb_func_start sub_0207C3D0
sub_0207C3D0: ; 0x0207C3D0
	push {r3, lr}
	ldr r1, _0207C3F8 ; =0x00000C65
	ldrb r2, [r0, r1]
	mov r1, #0x30
	mul r1, r2
	add r1, r0, r1
	ldr r0, _0207C3FC ; =0x00000834
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207C3E8
	mov r0, #0
	pop {r3, pc}
_0207C3E8:
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C3F4
	mov r0, #2
	pop {r3, pc}
_0207C3F4:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0207C3F8: .word 0x00000C65
_0207C3FC: .word 0x00000834
	thumb_func_end sub_0207C3D0

	thumb_func_start sub_0207C400
sub_0207C400: ; 0x0207C400
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0207C5C4 ; =0x00000654
	ldr r1, _0207C5C8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	mov r4, #0
	ldr r0, [r0]
	mvn r4, r4
	bl GetPartyMonByIndex
	ldr r1, _0207C5C4 ; =0x00000654
	add r7, r0, #0
	ldr r1, [r5, r1]
	ldr r6, [r1, #0x1c]
	ldrh r1, [r1, #0x28]
	cmp r1, #0x70
	bne _0207C4B6
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _0207C5CC ; =0x000001E7
	cmp r0, r1
	beq _0207C478
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0xbd
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemNameWithIndefArticle
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #0xb
	b _0207C4B6
_0207C478:
	cmp r6, #0
	beq _0207C4B6
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	cmp r0, #2
	bne _0207C4B6
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0xbe
	bl ReadMsgDataIntoString
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #0
	bl BufferItemName
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #0xb
_0207C4B6:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0207C59E
	add r0, r5, #0
	bl sub_0207C3D0
	cmp r0, #0
	beq _0207C4D2
	cmp r0, #1
	beq _0207C53E
	cmp r0, #2
	beq _0207C58C
	b _0207C59E
_0207C4D2:
	ldr r0, _0207C5C4 ; =0x00000654
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C4EE
	ldr r0, _0207C5C4 ; =0x00000654
	mov r1, #6
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0207C4EE:
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0
	bl sub_0207C5D4
	mov r2, #0x1f
	lsl r2, r2, #6
	add r4, r0, #0
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x6b
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207C59E
_0207C53E:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x4f
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C8 ; =0x00000C65
	ldr r3, _0207C5D0 ; =0x000007C4
	ldrb r4, [r5, r2]
	mov r2, #0x30
	ldr r0, [r5, r3]
	mul r2, r4
	add r2, r5, r2
	add r3, #0x70
	ldrh r2, [r2, r3]
	mov r1, #1
	bl BufferItemNameWithIndefArticle
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #9
	b _0207C59E
_0207C58C:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x4e
	bl ReadMsgDataIntoString
	mov r4, #0xb
_0207C59E:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207C5C4: .word 0x00000654
_0207C5C8: .word 0x00000C65
_0207C5CC: .word 0x000001E7
_0207C5D0: .word 0x000007C4
	thumb_func_end sub_0207C400

	thumb_func_start sub_0207C5D4
sub_0207C5D4: ; 0x0207C5D4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _0207C64C ; =0x00000654
	add r6, r1, #0
	ldr r1, [r5, r0]
	add r4, r2, #0
	ldrh r1, [r1, #0x28]
	mov r2, #1
	mov r3, #0xc
	str r1, [sp]
	ldr r1, [r5, r0]
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	add r0, r6, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r6, #0
	bl sub_02071BC8
	add r0, r6, #0
	bl Mon_UpdateGiratinaForme
	str r0, [r4]
	ldr r1, _0207C650 ; =0x00000C65
	ldr r0, _0207C64C ; =0x00000654
	ldrb r3, [r5, r1]
	ldr r0, [r5, r0]
	mov r2, #0x30
	add r6, r3, #0
	mul r6, r2
	ldrh r0, [r0, #0x28]
	ldr r3, _0207C654 ; =0x00000834
	add r6, r5, r6
	strh r0, [r6, r3]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	mul r2, r1
	add r2, r5, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	ldr r0, [sp]
	cmp r0, #0x70
	bne _0207C646
	mov r0, #0
	ldr r1, [r4]
	mvn r0, r0
	cmp r1, r0
	beq _0207C646
	add sp, #4
	mov r0, #0xc
	pop {r3, r4, r5, r6, pc}
_0207C646:
	mov r0, #0xb
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0207C64C: .word 0x00000654
_0207C650: .word 0x00000C65
_0207C654: .word 0x00000834
	thumb_func_end sub_0207C5D4

	thumb_func_start sub_0207C658
sub_0207C658: ; 0x0207C658
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0207C6B0 ; =0x00000654
	add r5, r1, #0
	ldr r0, [r4, r0]
	lsl r1, r2, #0x10
	ldr r0, [r0, #4]
	lsr r1, r1, #0x10
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	add r0, r5, #0
	mov r1, #6
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r5, #0
	bl sub_02071BC8
	add r0, r5, #0
	bl Mon_UpdateGiratinaForme
	ldr r1, _0207C6B4 ; =0x00000C65
	mov r2, #0x30
	ldrb r3, [r4, r1]
	ldr r0, [sp, #0x1c]
	add r5, r3, #0
	mul r5, r2
	ldr r3, _0207C6B8 ; =0x00000834
	add r5, r4, r5
	strh r0, [r5, r3]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0207C6B0: .word 0x00000654
_0207C6B4: .word 0x00000C65
_0207C6B8: .word 0x00000834
	thumb_func_end sub_0207C658

	thumb_func_start sub_0207C6BC
sub_0207C6BC: ; 0x0207C6BC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C6D8 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _0207C6D4
	add r0, r4, #0
	bl sub_0207C8B4
	pop {r4, pc}
_0207C6D4:
	mov r0, #0xb
	pop {r4, pc}
	.balign 4, 0
_0207C6D8: .word 0x00000C64
	thumb_func_end sub_0207C6BC

	thumb_func_start sub_0207C6DC
sub_0207C6DC: ; 0x0207C6DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C708 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _0207C702
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB54
	mov r0, #0xd
	pop {r4, pc}
_0207C702:
	mov r0, #0xc
	pop {r4, pc}
	nop
_0207C708: .word 0x00000C64
	thumb_func_end sub_0207C6DC

	thumb_func_start sub_0207C70C
sub_0207C70C: ; 0x0207C70C
	push {r4, lr}
	add r4, r0, #0
	bl ov94_021E593C
	cmp r0, #1
	bne _0207C722
	add r0, r4, #0
	bl sub_0207CB6C
	mov r0, #0xb
	pop {r4, pc}
_0207C722:
	mov r0, #0xd
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207C70C

	thumb_func_start sub_0207C728
sub_0207C728: ; 0x0207C728
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C748 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _0207C742
	add r0, r4, #0
	bl sub_0207DBCC
	mov r0, #0xa
	pop {r4, pc}
_0207C742:
	mov r0, #9
	pop {r4, pc}
	nop
_0207C748: .word 0x00000C64
	thumb_func_end sub_0207C728

	thumb_func_start sub_0207C74C
sub_0207C74C: ; 0x0207C74C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _0207C766
	cmp r0, #2
	bne _0207C764
	b _0207C882
_0207C764:
	b _0207C898
_0207C766:
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl sub_02016624
	bl sub_0207CB90
	ldr r0, _0207C8A4 ; =0x00000654
	ldr r1, _0207C8A8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	str r0, [sp]
	ldr r0, _0207C8A4 ; =0x00000654
	add r2, sp, #4
	ldr r0, [r5, r0]
	ldrh r6, [r0, #0x28]
	ldr r0, _0207C8A8 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207C8AC ; =0x00000834
	ldrh r4, [r1, r0]
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0207C5D4
	add r7, r0, #0
	ldr r0, _0207C8A4 ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	mov r2, #1
	ldr r0, [r0, #4]
	mov r3, #0xc
	bl Bag_AddItem
	cmp r0, #0
	bne _0207C7D6
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0207C658
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x54
	bl ReadMsgDataIntoString
	mov r7, #0xb
	b _0207C86A
_0207C7D6:
	ldr r0, _0207C8A4 ; =0x00000654
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C812
	ldr r0, _0207C8A4 ; =0x00000654
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_TakeItem
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0207C658
	ldr r0, _0207C8A4 ; =0x00000654
	mov r1, #6
	ldr r0, [r5, r0]
	add sp, #8
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0207C812:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x55
	bl ReadMsgDataIntoString
	ldr r0, _0207C8B0 ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferItemName
	ldr r0, _0207C8B0 ; =0x000007C4
	mov r1, #2
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl BufferItemName
	ldr r2, _0207C8B0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	cmp r6, #0x70
	beq _0207C860
	cmp r4, #0x70
	bne _0207C860
	mov r0, #0
	ldr r1, [sp, #4]
	mvn r0, r0
	cmp r1, r0
	beq _0207C860
	mov r7, #0xc
	b _0207C86A
_0207C860:
	cmp r6, #0x70
	bne _0207C86A
	cmp r4, #0x70
	bne _0207C86A
	mov r7, #0xb
_0207C86A:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	add sp, #8
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0207C882:
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl sub_02016624
	bl sub_0207CB90
	add r0, r5, #0
	bl sub_0207C8B4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0207C898:
	mov r0, #0xa
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207C8A0: .word 0x00000C88
_0207C8A4: .word 0x00000654
_0207C8A8: .word 0x00000C65
_0207C8AC: .word 0x00000834
_0207C8B0: .word 0x000007C4
	thumb_func_end sub_0207C74C

	thumb_func_start sub_0207C8B4
sub_0207C8B4: ; 0x0207C8B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C900 ; =0x00000654
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0207C8F4
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207C904 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _0207C900 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x24
	strb r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0207C8F4:
	mov r0, #0xa
	add r1, #0x27
	strb r0, [r1]
	mov r0, #0x20
	pop {r4, pc}
	nop
_0207C900: .word 0x00000654
_0207C904: .word 0x00000678
	thumb_func_end sub_0207C8B4

	thumb_func_start sub_0207C908
sub_0207C908: ; 0x0207C908
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0207CA20 ; =0x00000654
	ldr r1, _0207CA24 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r7, r0, #0
	ldr r0, _0207CA20 ; =0x00000654
	add r2, sp, #4
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	str r0, [sp]
	ldr r0, _0207CA24 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207CA28 ; =0x00000834
	ldrh r4, [r1, r0]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0207C5D4
	add r6, r0, #0
	cmp r4, #0x70
	bne _0207C950
	cmp r6, #0xb
	bne _0207C950
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0207C950
	mov r6, #0xc
_0207C950:
	cmp r4, #0
	bne _0207C998
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x6b
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207CA2C ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207CA20 ; =0x00000654
	ldr r0, _0207CA2C ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207CA2C ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207C9E2
_0207C998:
	ldr r0, _0207CA20 ; =0x00000654
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x55
	bl ReadMsgDataIntoString
	ldr r0, _0207CA2C ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferItemName
	ldr r0, _0207CA2C ; =0x000007C4
	ldr r2, [sp]
	ldr r0, [r5, r0]
	mov r1, #2
	bl BufferItemName
	ldr r2, _0207CA2C ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
_0207C9E2:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	ldr r0, _0207CA20 ; =0x00000654
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0207CA18
	mov r0, #0xa
	add r1, #0x24
	strb r0, [r1]
_0207CA18:
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207CA20: .word 0x00000654
_0207CA24: .word 0x00000C65
_0207CA28: .word 0x00000834
_0207CA2C: .word 0x000007C4
	thumb_func_end sub_0207C908

	thumb_func_start sub_0207CA30
sub_0207CA30: ; 0x0207CA30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207CA80 ; =0x00000C65
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207CA84 ; =0x0000083A
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207CA54
	ldr r0, _0207CA88 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_0207CA54:
	ldr r0, _0207CA8C ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0xb3
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207CA90 ; =sub_0207FAA8
	ldr r1, _0207CA94 ; =0x00000C58
	ldr r2, _0207CA98 ; =sub_0207FAD4
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r4, pc}
	nop
_0207CA80: .word 0x00000C65
_0207CA84: .word 0x0000083A
_0207CA88: .word 0x00000654
_0207CA8C: .word 0x00000678
_0207CA90: .word sub_0207FAA8
_0207CA94: .word 0x00000C58
_0207CA98: .word sub_0207FAD4
	thumb_func_end sub_0207CA30

	thumb_func_start sub_0207CA9C
sub_0207CA9C: ; 0x0207CA9C
	mov r0, #0x14
	bx lr
	thumb_func_end sub_0207CA9C

	thumb_func_start sub_0207CAA0
sub_0207CAA0: ; 0x0207CAA0
	mov r0, #0x15
	bx lr
	thumb_func_end sub_0207CAA0

	thumb_func_start sub_0207CAA4
sub_0207CAA4: ; 0x0207CAA4
	mov r0, #0x13
	bx lr
	thumb_func_end sub_0207CAA4

	thumb_func_start sub_0207CAA8
sub_0207CAA8: ; 0x0207CAA8
	mov r0, #0x12
	bx lr
	thumb_func_end sub_0207CAA8

	thumb_func_start sub_0207CAAC
sub_0207CAAC: ; 0x0207CAAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	mov r0, #0x15
	mov r1, #0x16
	add r2, r4, #0
	add r7, r3, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	str r0, [sp, #8]
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, [sp, #0xc]
	mov r4, #0
	str r0, [sp, #4]
	add r0, #0xc
	str r0, [sp, #4]
	str r0, [sp]
_0207CAD6:
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #0x20
	bl memcpy
	add r1, r4, #6
	lsl r2, r1, #6
	ldr r1, [sp, #4]
	add r0, r6, #0
	add r1, r1, r2
	mov r2, #0x20
	bl memcpy
	add r1, r4, #0
	add r1, #0xc
	lsl r2, r1, #6
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r1, r1, r2
	mov r2, #0x20
	bl memcpy
	ldr r0, [sp]
	add r4, r4, #1
	add r0, #0x40
	str r0, [sp]
	add r5, #0x20
	add r6, #0x20
	add r7, #0x20
	cmp r4, #6
	blo _0207CAD6
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0207CAAC

	thumb_func_start sub_0207CB20
sub_0207CB20: ; 0x0207CB20
	push {r4, lr}
	ldr r1, _0207CB38 ; =0x00000824
	add r4, r0, #0
	ldr r1, [r4, r1]
	bl sub_0207E618
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	pop {r4, pc}
	.balign 4, 0
_0207CB38: .word 0x00000824
	thumb_func_end sub_0207CB20

	thumb_func_start sub_0207CB3C
sub_0207CB3C: ; 0x0207CB3C
	push {r3, lr}
	ldr r2, _0207CB50 ; =0x00000654
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _0207CB4C
	bl sub_02018410
_0207CB4C:
	pop {r3, pc}
	nop
_0207CB50: .word 0x00000654
	thumb_func_end sub_0207CB3C

	thumb_func_start sub_0207CB54
sub_0207CB54: ; 0x0207CB54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207CB68 ; =SDK_OVERLAY_OVY_94_ID
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r4, #0
	bl ov94_021E5900
	pop {r4, pc}
	.balign 4, 0
_0207CB68: .word SDK_OVERLAY_OVY_94_ID
	thumb_func_end sub_0207CB54

	thumb_func_start sub_0207CB6C
sub_0207CB6C: ; 0x0207CB6C
	ldr r3, _0207CB74 ; =UnloadOverlayByID
	ldr r0, _0207CB78 ; =SDK_OVERLAY_OVY_94_ID
	bx r3
	nop
_0207CB74: .word UnloadOverlayByID
_0207CB78: .word SDK_OVERLAY_OVY_94_ID
	thumb_func_end sub_0207CB6C

	thumb_func_start sub_0207CB7C
sub_0207CB7C: ; 0x0207CB7C
	ldr r3, _0207CB88 ; =G2x_SetBlendBrightness_
	ldr r0, _0207CB8C ; =0x04000050
	mov r1, #0x1e
	mov r2, #8
	bx r3
	nop
_0207CB88: .word G2x_SetBlendBrightness_
_0207CB8C: .word 0x04000050
	thumb_func_end sub_0207CB7C

	thumb_func_start sub_0207CB90
sub_0207CB90: ; 0x0207CB90
	ldr r0, _0207CB98 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
_0207CB98: .word 0x04000050
	thumb_func_end sub_0207CB90

	thumb_func_start sub_0207CB9C
sub_0207CB9C: ; 0x0207CB9C
	push {r3, r4}
	mov r3, #0xc9
	lsl r3, r3, #4
	add r0, r0, r3
	ldrb r4, [r0, #6]
	mov r3, #0xf
	bic r4, r3
	strb r4, [r0, #6]
	ldrb r4, [r0, #6]
	mov r3, #0xf0
	bic r4, r3
	strb r4, [r0, #6]
	add r3, r1, #4
	str r3, [r0]
	ldrb r3, [r1, #2]
	strb r3, [r0, #4]
	ldrb r3, [r1, #1]
	strb r3, [r0, #5]
	ldrb r1, [r1, #3]
	strb r1, [r0, #7]
	str r2, [r0, #8]
	mov r1, #1
	str r1, [r0, #0xc]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0207CB9C

	thumb_func_start sub_0207CBD0
sub_0207CBD0: ; 0x0207CBD0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	mov r2, #0xc9
	lsl r2, r2, #4
	add r5, r0, r2
	str r3, [sp]
	ldrb r3, [r5, #6]
	mov r2, #0xf
	lsl r4, r1, #2
	bic r3, r2
	strb r3, [r5, #6]
	ldrb r3, [r5, #6]
	mov r2, #0xf0
	bic r3, r2
	strb r3, [r5, #6]
	mov r2, #0
	str r2, [r5]
	strb r1, [r5, #5]
	mov r1, #0x66
	lsl r1, r1, #4
	add r6, r0, r1
	ldr r0, [r6, r4]
	bl sub_020249A8
	mov r1, #2
	and r0, r1
	strb r0, [r5, #7]
	ldr r0, [sp]
	cmp r0, #1
	bne _0207CC1C
	ldr r0, [r6, r4]
	mov r1, #0
	bl sub_020249D4
	ldrb r1, [r5, #7]
	ldr r0, [r6, r4]
	bl sub_020248F0
_0207CC1C:
	str r7, [r5, #8]
	mov r0, #1
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207CBD0

	thumb_func_start sub_0207CC24
sub_0207CC24: ; 0x0207CC24
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0xc9
	add r5, r0, #0
	lsl r1, r1, #4
	add r4, r5, r1
	ldrb r2, [r4, #6]
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1c
	beq _0207CC44
	cmp r1, #1
	beq _0207CCB6
	cmp r1, #2
	bne _0207CC42
	b _0207CD54
_0207CC42:
	b _0207CD7E
_0207CC44:
	ldr r1, [r4]
	cmp r1, #0
	beq _0207CC76
	mov r1, #2
	str r1, [sp]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	ldrb r3, [r4, #7]
	bl sub_0207E3A8
	ldrb r0, [r4, #7]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #5]
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_0207E28C
	ldr r0, [r5]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	b _0207CC9A
_0207CC76:
	ldrb r0, [r4, #5]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_020249D4
	ldrb r0, [r4, #5]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldrb r1, [r4, #7]
	bl sub_020248F0
_0207CC9A:
	ldrb r2, [r4, #6]
	mov r1, #0xf0
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, #6]
	b _0207CD7E
_0207CCB6:
	add r1, r2, #0
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	add r2, r2, #1
	mov r3, #0xf
	lsl r2, r2, #0x18
	bic r1, r3
	lsr r3, r2, #0x18
	mov r2, #0xf
	and r2, r3
	orr r1, r2
	strb r1, [r4, #6]
	ldrb r1, [r4, #6]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #2
	bne _0207CD7E
	ldr r1, [r4]
	cmp r1, #0
	beq _0207CD0A
	mov r1, #1
	str r1, [sp]
	ldrb r1, [r4, #4]
	ldrb r2, [r4, #5]
	ldrb r3, [r4, #7]
	bl sub_0207E3A8
	ldrb r0, [r4, #7]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #5]
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_0207E28C
	ldr r0, [r5]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	b _0207CD30
_0207CD0A:
	ldrb r0, [r4, #5]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_020249D4
	ldrb r0, [r4, #5]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldrb r1, [r4, #7]
	add r1, r1, #1
	bl sub_020248F0
_0207CD30:
	ldrb r1, [r4, #6]
	mov r0, #0xf
	bic r1, r0
	strb r1, [r4, #6]
	ldrb r2, [r4, #6]
	mov r1, #0xf0
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, #6]
	b _0207CD7E
_0207CD54:
	mov r1, #0xf
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r4, #6]
	ldrb r0, [r4, #6]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #2
	bne _0207CD7E
	mov r0, #0
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0207CD7E:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207CC24

	thumb_func_start sub_0207CD84
sub_0207CD84: ; 0x0207CD84
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	bl AddWindow
	add r1, r5, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x10
	add r2, #8
	bl AddWindow
	add r1, r5, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x20
	add r2, #0x10
	bl AddWindow
	add r1, r5, #0
	add r2, r4, #0
	add r0, r6, #0
	add r1, #0x30
	add r2, #0x18
	bl AddWindow
	add r5, #0x40
	add r4, #0x20
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0207CD84

	thumb_func_start sub_0207CDCC
sub_0207CDCC: ; 0x0207CDCC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, _0207CF38 ; =_02101734
	ldr r0, [r5]
	add r1, r5, #4
	add r2, r4, #0
	bl sub_0207CD84
	add r1, r5, #0
	ldr r0, [r5]
	ldr r2, _0207CF3C ; =_02101734 + 0x50
	add r1, #0xa4
	bl sub_0207CD84
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF40 ; =_02101734 + 0xA0
	add r1, r5, r1
	bl sub_0207CD84
	ldr r0, _0207CF44 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #2
	ldr r0, [r5]
	bne _0207CE34
	add r1, r5, #0
	add r2, r4, #0
	add r1, #0x54
	add r2, #0xf0
	bl sub_0207CD84
	mov r2, #0x46
	add r1, r5, #0
	lsl r2, r2, #2
	ldr r0, [r5]
	add r1, #0xf4
	add r2, r4, r2
	bl sub_0207CD84
	mov r2, #0x65
	lsl r2, r2, #2
	add r1, r5, r2
	sub r2, #0x54
	ldr r0, [r5]
	add r2, r4, r2
	bl sub_0207CD84
	b _0207CE5E
_0207CE34:
	add r1, r5, #0
	add r2, r4, #0
	add r1, #0x54
	add r2, #0x28
	bl sub_0207CD84
	add r1, r5, #0
	add r2, r4, #0
	ldr r0, [r5]
	add r1, #0xf4
	add r2, #0x78
	bl sub_0207CD84
	mov r1, #0x65
	lsl r1, r1, #2
	add r2, r4, #0
	ldr r0, [r5]
	add r1, r5, r1
	add r2, #0xc8
	bl sub_0207CD84
_0207CE5E:
	mov r2, #0x95
	lsl r2, r2, #2
	add r1, r5, r2
	sub r2, #0xec
	ldr r0, [r5]
	add r2, r4, r2
	bl AddWindow
	mov r2, #0x99
	lsl r2, r2, #2
	add r1, r5, r2
	sub r2, #0xf4
	ldr r0, [r5]
	add r2, r4, r2
	bl AddWindow
	mov r2, #0x9d
	lsl r2, r2, #2
	add r1, r5, r2
	sub r2, #0xfc
	ldr r0, [r5]
	add r2, r4, r2
	bl AddWindow
	ldr r0, _0207CF44 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207CEA8
	cmp r0, #0x11
	beq _0207CEA8
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207CED0
_0207CEA8:
	ldr r1, _0207CF48 ; =_021015EC
	add r0, sp, #0
	ldrh r3, [r1, #0x30]
	add r2, sp, #0
	strh r3, [r0]
	ldrh r3, [r1, #0x32]
	strh r3, [r0, #2]
	ldrh r3, [r1, #0x34]
	ldrh r1, [r1, #0x36]
	strh r3, [r0, #4]
	strh r1, [r0, #6]
	mov r1, #0x16
	strb r1, [r0, #2]
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r0, [r5]
	add r1, r5, r1
	bl AddWindow
	b _0207CEDE
_0207CED0:
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF4C ; =_0210161C
	add r1, r5, r1
	bl AddWindow
_0207CEDE:
	mov r1, #0x79
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF50 ; =_02101624
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x81
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF54 ; =_0210162C
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF58 ; =_02101634
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF5C ; =_0210163C
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF60 ; =_02101644
	add r1, r5, r1
	bl AddWindow
	mov r1, #0x91
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r2, _0207CF64 ; =_0210164C
	add r1, r5, r1
	bl AddWindow
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0207CF38: .word _02101734
_0207CF3C: .word _02101734 + 0x50
_0207CF40: .word _02101734 + 0xA0
_0207CF44: .word 0x00000654
_0207CF48: .word _021015EC
_0207CF4C: .word _0210161C
_0207CF50: .word _02101624
_0207CF54: .word _0210162C
_0207CF58: .word _02101634
_0207CF5C: .word _0210163C
_0207CF60: .word _02101644
_0207CF64: .word _0210164C
	thumb_func_end sub_0207CDCC

	thumb_func_start sub_0207CF68
sub_0207CF68: ; 0x0207CF68
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r5, #0
	add r4, r6, #4
_0207CF70:
	lsl r0, r5, #4
	add r0, r4, r0
	bl RemoveWindow
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x28
	blo _0207CF70
	mov r4, #0xa1
	lsl r4, r4, #2
	add r0, r6, r4
	bl WindowIsInUse
	cmp r0, #1
	bne _0207CF96
	add r0, r6, r4
	bl RemoveWindow
_0207CF96:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0207CF68

	thumb_func_start sub_0207CF98
sub_0207CF98: ; 0x0207CF98
	push {r4, lr}
	mov r2, #0x1f
	add r4, r0, #0
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x10
	ldr r2, [r4, r2]
	mov r1, #0x80
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x14
	ldr r2, [r4, r2]
	mov r1, #0x81
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x18
	ldr r2, [r4, r2]
	mov r1, #0x82
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x1c
	ldr r2, [r4, r2]
	mov r1, #0x8f
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x20
	ldr r2, [r4, r2]
	mov r1, #0x90
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x24
	ldr r2, [r4, r2]
	mov r1, #0x83
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x28
	ldr r2, [r4, r2]
	mov r1, #0x84
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x2c
	ldr r2, [r4, r2]
	mov r1, #0x85
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x30
	ldr r2, [r4, r2]
	mov r1, #0x86
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x34
	ldr r2, [r4, r2]
	mov r1, #0x87
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x38
	ldr r2, [r4, r2]
	mov r1, #0x88
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x3c
	ldr r2, [r4, r2]
	mov r1, #0x89
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x40
	ldr r2, [r4, r2]
	mov r1, #0x8a
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x44
	ldr r2, [r4, r2]
	mov r1, #0x89
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x48
	ldr r2, [r4, r2]
	mov r1, #0x95
	bl ReadMsgDataIntoString
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #0x4c
	ldr r2, [r4, r2]
	mov r1, #0xba
	bl ReadMsgDataIntoString
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207CF98

	thumb_func_start sub_0207D0A0
sub_0207D0A0: ; 0x0207D0A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	add r4, r2, #0
	add r7, r1, #0
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r1, #0x8b
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, _0207D0E0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r7, #0
	bl BufferMoveName
	ldr r1, _0207D0E0 ; =0x000007C4
	add r4, #0x10
	lsl r2, r4, #2
	ldr r0, [r5, r1]
	add r2, r5, r2
	add r1, #0xc
	ldr r1, [r2, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207D0E0: .word 0x000007C4
	thumb_func_end sub_0207D0A0

	thumb_func_start sub_0207D0E4
sub_0207D0E4: ; 0x0207D0E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	add r0, r2, #0
	mov r1, #0xc
	str r2, [sp, #4]
	bl ListMenuItems_ctor
	mov r1, #0x82
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r6, #0
	ldr r0, [sp, #4]
	add r4, r6, #0
	cmp r0, #0
	ble _0207D156
_0207D106:
	ldrb r0, [r7, r4]
	cmp r0, #0x10
	blo _0207D12E
	bl sub_0207F42C
	lsl r1, r6, #2
	add r2, r0, #0
	mov r0, #0x82
	add r3, r5, r1
	mov r1, #0x81
	lsl r0, r0, #4
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r3, r1]
	bl ListMenuItems_AddItem
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	b _0207D14A
_0207D12E:
	bl sub_0207F42C
	ldrb r1, [r7, r4]
	add r2, r0, #0
	mov r0, #0x82
	lsl r1, r1, #2
	add r3, r5, r1
	mov r1, #0x7d
	lsl r0, r0, #4
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r3, r1]
	bl ListMenuItems_AddItem
_0207D14A:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #4]
	cmp r4, r0
	blt _0207D106
_0207D156:
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0xc]
	add r0, sp, #8
	strb r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #9]
	ldr r1, [sp, #4]
	strb r1, [r0, #0xa]
	ldrb r2, [r0, #0xb]
	mov r1, #0xf
	bic r2, r1
	strb r2, [r0, #0xb]
	ldrb r2, [r0, #0xb]
	mov r1, #0x30
	bic r2, r1
	strb r2, [r0, #0xb]
	ldr r1, [sp, #4]
	ldrb r2, [r0, #0xb]
	cmp r1, #4
	blo _0207D198
	mov r1, #0xc0
	bic r2, r1
	mov r1, #0x40
	orr r1, r2
	strb r1, [r0, #0xb]
	b _0207D19E
_0207D198:
	mov r1, #0xc0
	bic r2, r1
	strb r2, [r0, #0xb]
_0207D19E:
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	mov r2, #0
	add r0, r5, #0
	add r3, r2, #0
	bl sub_0207E54C
	mov r2, #0
	add r0, r5, #0
	add r1, sp, #8
	mov r3, #0xc
	str r2, [sp]
	bl sub_0207E590
	ldr r1, _0207D1C4 ; =0x00000824
	str r0, [r5, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0207D1C4: .word 0x00000824
	thumb_func_end sub_0207D0E4

	thumb_func_start sub_0207D1C8
sub_0207D1C8: ; 0x0207D1C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207D258 ; =0x00000654
	ldr r0, [r5, r0]
	add r1, r0, #0
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0xf
	bne _0207D1EC
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x2b
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
_0207D1EC:
	cmp r1, #0x15
	bne _0207D214
	ldr r1, _0207D25C ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	ldr r2, _0207D260 ; =0x00000838
	add r1, r5, r1
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _0207D214
	add r0, r2, #0
	sub r0, #0x78
	sub r2, #0x70
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #0xb7
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
_0207D214:
	ldr r1, _0207D25C ; =0x00000C65
	ldr r0, [r0]
	ldrb r1, [r5, r1]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x26
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207D264 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _0207D264 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
	nop
_0207D258: .word 0x00000654
_0207D25C: .word 0x00000C65
_0207D260: .word 0x00000838
_0207D264: .word 0x000007C4
	thumb_func_end sub_0207D1C8

	thumb_func_start sub_0207D268
sub_0207D268: ; 0x0207D268
	push {r3, r4, lr}
	sub sp, #4
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	ldr r0, _0207D290 ; =0x000007BC
	add r4, r1, #0
	ldr r0, [r2, r0]
	add r3, r2, #4
	lsl r2, r4, #2
	add r2, r4, r2
	add r2, r2, #2
	lsl r2, r2, #4
	add r2, r3, r2
	mov r1, #0
	mov r3, #0x1c
	bl sub_0200CDAC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0207D290: .word 0x000007BC
	thumb_func_end sub_0207D268

	thumb_func_start sub_0207D294
sub_0207D294: ; 0x0207D294
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r4, r2, #0
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r1, _0207D2DC ; =_021015BC
	lsl r2, r4, #3
	ldrh r1, [r1, r2]
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207D2E0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207D2E0 ; =0x000007C4
	mov r1, #0x30
	mul r1, r4
	ldr r0, [r5, r2]
	add r1, r5, r1
	add r2, #0x64
	ldr r1, [r1, r2]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207D2DC: .word _021015BC
_0207D2E0: .word 0x000007C4
	thumb_func_end sub_0207D294

	thumb_func_start sub_0207D2E4
sub_0207D2E4: ; 0x0207D2E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	lsl r6, r0, #4
	add r7, r1, #0
	mov r0, #0x30
	mul r7, r0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207D3C8 ; =0x000F0E00
	ldr r2, _0207D3CC ; =0x00000828
	str r0, [sp, #8]
	add r4, r5, #4
	str r1, [sp, #0xc]
	add r3, r5, r7
	ldr r2, [r3, r2]
	add r0, r4, r6
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, _0207D3D0 ; =0x00000838
	add r1, r5, r7
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207D328
	add r0, r4, r6
	bl sub_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0207D328:
	mov r0, #0x99
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _0207D3C8 ; =0x000F0E00
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r2, _0207D3D4 ; =0x000007D8
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #2
	bl AddTextPrinterParameterized2
	ldr r2, _0207D3D8 ; =0x00000836
	add r0, r5, r2
	ldrh r0, [r0, r7]
	lsl r1, r0, #0x13
	lsr r1, r1, #0x1f
	bne _0207D3BE
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1e
	bne _0207D390
	add r0, r2, #0
	sub r0, #0x76
	sub r2, #0x6a
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #0x1b
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	ldr r2, _0207D3DC ; =0x000007CC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, r6
	mov r3, #0x40
	bl AddTextPrinterParameterized2
	b _0207D3BE
_0207D390:
	cmp r0, #1
	bne _0207D3BE
	add r0, r2, #0
	sub r0, #0x76
	sub r2, #0x6a
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #0x1c
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207D3E0 ; =0x00050600
	ldr r2, _0207D3DC ; =0x000007CC
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, r6
	mov r3, #0x40
	bl AddTextPrinterParameterized2
_0207D3BE:
	add r0, r4, r6
	bl sub_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207D3C8: .word 0x000F0E00
_0207D3CC: .word 0x00000828
_0207D3D0: .word 0x00000838
_0207D3D4: .word 0x000007D8
_0207D3D8: .word 0x00000836
_0207D3DC: .word 0x000007CC
_0207D3E0: .word 0x00050600
	thumb_func_end sub_0207D2E4

	thumb_func_start sub_0207D3E4
sub_0207D3E4: ; 0x0207D3E4
	push {r4, lr}
	sub sp, #0x10
	lsl r2, r1, #2
	add r2, r1, r2
	add r2, r2, #1
	add r3, r0, #4
	lsl r2, r2, #4
	add r4, r3, r2
	mov r2, #0x30
	mul r2, r1
	ldr r3, _0207D43C ; =0x00000836
	add r2, r0, r2
	ldrh r1, [r2, r3]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x14
	cmp r1, #7
	beq _0207D410
	add r0, r4, #0
	bl sub_0201D5C8
	add sp, #0x10
	pop {r4, pc}
_0207D410:
	mov r1, #0
	str r1, [sp]
	str r4, [sp, #4]
	mov r1, #5
	str r1, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	add r1, r3, #0
	sub r3, r3, #4
	sub r1, #0x7a
	ldrh r2, [r2, r3]
	ldr r0, [r0, r1]
	mov r1, #1
	mov r3, #3
	bl sub_0200CE7C
	add r0, r4, #0
	bl sub_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	nop
_0207D43C: .word 0x00000836
	thumb_func_end sub_0207D3E4

	thumb_func_start sub_0207D440
sub_0207D440: ; 0x0207D440
	push {r4, r5, lr}
	sub sp, #0xc
	add r2, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #2
	add r3, r2, #4
	lsl r0, r0, #4
	add r4, r3, r0
	mov r3, #0x30
	mul r3, r1
	add r1, r2, r3
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	ldr r5, _0207D47C ; =0x000007BC
	str r0, [sp, #8]
	ldr r0, [r2, r5]
	add r5, #0x72
	ldrh r1, [r1, r5]
	mov r2, #3
	mov r3, #1
	bl sub_0200CDF0
	add r0, r4, #0
	bl sub_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0207D47C: .word 0x000007BC
	thumb_func_end sub_0207D440

	thumb_func_start sub_0207D480
sub_0207D480: ; 0x0207D480
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #4
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #2
	mov r1, #0
	lsl r4, r0, #4
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r5, r4
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	add r0, r5, r4
	bl sub_0201D5C8
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207D480

	thumb_func_start sub_0207D4AC
sub_0207D4AC: ; 0x0207D4AC
	push {r4, r5, lr}
	sub sp, #0xc
	add r2, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #2
	add r3, r2, #4
	lsl r0, r0, #4
	add r4, r3, r0
	mov r3, #0x30
	mul r3, r1
	add r1, r2, r3
	str r4, [sp]
	mov r0, #0x24
	str r0, [sp, #4]
	mov r0, #2
	ldr r5, _0207D4E8 ; =0x000007BC
	str r0, [sp, #8]
	ldr r0, [r2, r5]
	add r5, #0x74
	ldrh r1, [r1, r5]
	mov r2, #3
	mov r3, #0
	bl sub_0200CDF0
	add r0, r4, #0
	bl sub_0201D5C8
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0207D4E8: .word 0x000007BC
	thumb_func_end sub_0207D4AC

	thumb_func_start sub_0207D4EC
sub_0207D4EC: ; 0x0207D4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	lsl r2, r1, #2
	add r2, r1, r2
	add r5, r0, #0
	add r2, r2, #3
	add r0, r5, #4
	lsl r2, r2, #4
	add r4, r0, r2
	mov r0, #0x83
	lsl r0, r0, #4
	add r7, r5, r0
	sub r0, r0, #2
	add r0, r5, r0
	mov r2, #0x30
	add r6, r1, #0
	mul r6, r2
	str r0, [sp, #8]
	ldrh r0, [r0, r6]
	ldrh r1, [r7, r6]
	bl sub_020880B0
	cmp r0, #4
	bhi _0207D582
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207D528: ; jump table
	.short _0207D532 - _0207D528 - 2 ; case 0
	.short _0207D56C - _0207D528 - 2 ; case 1
	.short _0207D554 - _0207D528 - 2 ; case 2
	.short _0207D53C - _0207D528 - 2 ; case 3
	.short _0207D53C - _0207D528 - 2 ; case 4
_0207D532:
	add r0, r4, #0
	bl sub_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0207D53C:
	ldrb r3, [r4, #9]
	ldr r1, _0207D5D0 ; =0x00000566
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	b _0207D582
_0207D554:
	ldrb r3, [r4, #9]
	ldr r1, _0207D5D4 ; =0x00000586
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	b _0207D582
_0207D56C:
	ldrb r3, [r4, #9]
	ldr r1, _0207D5D8 ; =0x000005A6
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
_0207D582:
	ldr r0, [sp, #8]
	ldrh r1, [r7, r6]
	ldrh r0, [r0, r6]
	mov r2, #0x30
	bl sub_02088068
	add r5, r0, #0
	str r5, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	mov r3, #2
	bl FillWindowPixelRect
	str r5, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	mov r3, #3
	bl FillWindowPixelRect
	str r5, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	mov r3, #5
	bl FillWindowPixelRect
	add r0, r4, #0
	bl sub_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207D5D0: .word 0x00000566
_0207D5D4: .word 0x00000586
_0207D5D8: .word 0x000005A6
	thumb_func_end sub_0207D4EC

	thumb_func_start sub_0207D5DC
sub_0207D5DC: ; 0x0207D5DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r1, #0
	add r5, r0, #0
	lsl r0, r6, #2
	add r4, r6, r0
	add r0, r5, #4
	str r0, [sp]
	lsl r0, r4, #4
	ldr r1, [sp]
	str r0, [sp, #4]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #1
	lsl r0, r0, #4
	add r7, r5, #4
	str r0, [sp, #8]
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r7, #0
	str r0, [sp, #0xc]
	add r0, r4, #2
	lsl r0, r0, #4
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r7, #0
	str r0, [sp, #0x14]
	add r0, r4, #3
	lsl r4, r0, #4
	ldr r0, [sp, #0x14]
	mov r1, #0
	add r0, r0, r4
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D2E4
	mov r0, #0x30
	mul r0, r6
	add r1, r5, r0
	ldr r0, _0207D69C ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207D66E
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r0, r1, r0
	bl sub_0201D5C8
	ldr r0, [sp, #8]
	add r0, r7, r0
	bl sub_0201D5C8
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	bl sub_0201D5C8
	ldr r0, [sp, #0x14]
	add r0, r0, r4
	bl sub_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0207D66E:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D268
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D3E4
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D440
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D4AC
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D4EC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207D69C: .word 0x00000838
	thumb_func_end sub_0207D5DC

	thumb_func_start sub_0207D6A0
sub_0207D6A0: ; 0x0207D6A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r0, r1, #2
	add r4, r1, r0
	add r1, r5, #4
	lsl r0, r4, #4
	add r0, r1, r0
	bl sub_0201D8A0
	add r0, r4, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D8A0
	add r0, r4, #2
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D8A0
	add r0, r4, #3
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D8A0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207D6A0

	thumb_func_start sub_0207D6D8
sub_0207D6D8: ; 0x0207D6D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r0, r1, #2
	add r4, r1, r0
	add r1, r5, #4
	lsl r0, r4, #4
	add r0, r1, r0
	bl sub_0201D8E4
	add r0, r4, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D8E4
	add r0, r4, #2
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D8E4
	add r0, r4, #3
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D8E4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207D6D8

	thumb_func_start sub_0207D710
sub_0207D710: ; 0x0207D710
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r6, r4, r0
	add r1, r5, #4
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D2E4
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207D7A0 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207D75A
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0207DC20
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0207D75A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D3E4
	ldr r0, _0207D7A4 ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	mov r0, #0
	ldr r3, _0207D7A4 ; =0x00000654
	str r0, [sp]
	ldr r3, [r5, r3]
	mov r2, #3
	ldrh r3, [r3, #0x28]
	bl GetMonEvolution
	cmp r0, #0
	bne _0207D792
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0207DC20
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0207D792:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_0207DC20
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0207D7A0: .word 0x00000838
_0207D7A4: .word 0x00000654
	thumb_func_end sub_0207D710

	thumb_func_start sub_0207D7A8
sub_0207D7A8: ; 0x0207D7A8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r6, r4, r0
	add r1, r5, #4
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D2E4
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207D838 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0207D7EE
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0207DC90
	pop {r4, r5, r6, pc}
_0207D7EE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D3E4
	ldr r0, _0207D83C ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020820DC
	cmp r0, #0xff
	bne _0207D81A
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0207DC90
	pop {r4, r5, r6, pc}
_0207D81A:
	cmp r0, #0xfd
	bne _0207D82A
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	bl sub_0207DC90
	pop {r4, r5, r6, pc}
_0207D82A:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_0207DC90
	pop {r4, r5, r6, pc}
	nop
_0207D838: .word 0x00000838
_0207D83C: .word 0x00000654
	thumb_func_end sub_0207D7A8

	thumb_func_start sub_0207D840
sub_0207D840: ; 0x0207D840
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r6, r4, r0
	add r1, r5, #4
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D2E4
	mov r0, #0x30
	add r6, r4, #0
	mul r6, r0
	ldr r0, _0207D89C ; =0x00000838
	add r1, r5, r6
	ldrb r0, [r1, r0]
	cmp r0, #1
	beq _0207D884
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D3E4
_0207D884:
	ldr r2, _0207D8A0 ; =0x00000836
	add r3, r5, r6
	ldrh r2, [r3, r2]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1f
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207DD14
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207D89C: .word 0x00000838
_0207D8A0: .word 0x00000836
	thumb_func_end sub_0207D840

	thumb_func_start sub_0207D8A4
sub_0207D8A4: ; 0x0207D8A4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r6, r4, r0
	add r1, r5, #4
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	add r1, r5, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D2E4
	mov r0, #0x30
	mul r0, r4
	add r1, r5, r0
	ldr r0, _0207D8E8 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	beq _0207D8E6
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D3E4
_0207D8E6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207D8E8: .word 0x00000838
	thumb_func_end sub_0207D8A4

	thumb_func_start sub_0207D8EC
sub_0207D8EC: ; 0x0207D8EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0207D984 ; =0x00000654
	add r4, r1, #0
	ldr r1, [r5, r0]
	mov r2, #0
	add r0, r1, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r3, r0, #0x1c
	beq _0207D924
	add r0, r4, #1
_0207D906:
	add r6, r1, r2
	add r6, #0x30
	ldrb r6, [r6]
	cmp r0, r6
	bne _0207D91A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
_0207D91A:
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	cmp r2, r3
	blo _0207D906
_0207D924:
	add r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x16
	bne _0207D944
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207B418
	cmp r0, #0
	bne _0207D978
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
_0207D944:
	cmp r0, #0x17
	bne _0207D960
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207B4A0
	cmp r0, #0
	bne _0207D978
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
_0207D960:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207B364
	cmp r0, #0
	bne _0207D978
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
_0207D978:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #7
	bl sub_0207DD7C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207D984: .word 0x00000654
	thumb_func_end sub_0207D8EC

	thumb_func_start sub_0207D988
sub_0207D988: ; 0x0207D988
	push {r4, lr}
	add r4, r2, #0
	mov r2, #0
	bl sub_02002F30
	sub r0, r4, r0
	lsr r0, r0, #1
	pop {r4, pc}
	thumb_func_end sub_0207D988

	thumb_func_start sub_0207D998
sub_0207D998: ; 0x0207D998
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x79
	lsl r0, r0, #2
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	tst r0, r4
	beq _0207DA04
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r2, _0207DA54 ; =0x000001EB
	ldr r1, _0207DA58 ; =0x000007CC
	ldrb r2, [r5, r2]
	ldr r1, [r5, r1]
	mov r0, #0
	lsl r2, r2, #3
	bl sub_0207D988
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0207DA5C ; =0x000F0E00
	add r2, #0xe5
	str r0, [sp, #8]
	add r0, r5, r2
	ldr r2, _0207DA58 ; =0x000007CC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	bl AddTextPrinterParameterized2
	mov r0, #0x79
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
_0207DA04:
	mov r0, #2
	tst r0, r4
	beq _0207DA50
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #1
	bl ReadMsgDataIntoString
	ldr r2, _0207DA60 ; =0x000001FB
	ldr r1, _0207DA58 ; =0x000007CC
	ldrb r2, [r5, r2]
	ldr r1, [r5, r1]
	mov r0, #0
	lsl r2, r2, #3
	bl sub_0207D988
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0207DA5C ; =0x000F0E00
	add r2, #0xf5
	str r0, [sp, #8]
	add r0, r5, r2
	ldr r2, _0207DA58 ; =0x000007CC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	bl AddTextPrinterParameterized2
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
_0207DA50:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207DA54: .word 0x000001EB
_0207DA58: .word 0x000007CC
_0207DA5C: .word 0x000F0E00
_0207DA60: .word 0x000001FB
	thumb_func_end sub_0207D998

	thumb_func_start sub_0207DA64
sub_0207DA64: ; 0x0207DA64
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r3, #1
	bne _0207DA7E
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
_0207DA7E:
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _0207DA9E
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r6, #0
	bl ReadMsgDataIntoString
_0207DA9E:
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0207DAC0 ; =0x000007C8
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl sub_0201D5C8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0207DAC0: .word 0x000007C8
	thumb_func_end sub_0207DA64

	thumb_func_start sub_0207DAC4
sub_0207DAC4: ; 0x0207DAC4
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x81
	lsl r1, r1, #2
	add r3, r2, #0
	add r1, r0, r1
	add r2, r4, #0
	bl sub_0207DA64
	pop {r4, pc}
	thumb_func_end sub_0207DAC4

	thumb_func_start sub_0207DAD8
sub_0207DAD8: ; 0x0207DAD8
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x85
	lsl r1, r1, #2
	add r3, r2, #0
	add r1, r0, r1
	add r2, r4, #0
	bl sub_0207DA64
	pop {r4, pc}
	thumb_func_end sub_0207DAD8

	thumb_func_start sub_0207DAEC
sub_0207DAEC: ; 0x0207DAEC
	push {r4, r5, r6, lr}
	mov r6, #0x89
	add r5, r0, #0
	add r4, r1, #0
	lsl r6, r6, #2
	cmp r2, #1
	bne _0207DB06
	add r0, r5, r6
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
_0207DB06:
	add r0, r5, r6
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0207DB26
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r4, #0
	bl ReadMsgDataIntoString
_0207DB26:
	add r0, r5, #0
	bl sub_0207DB30
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0207DAEC

	thumb_func_start sub_0207DB30
sub_0207DB30: ; 0x0207DB30
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	ldr r0, _0207DB70 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0, #0xc]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0207DB74 ; =sub_0207DB80
	ldr r2, _0207DB78 ; =0x000007C8
	str r0, [sp, #8]
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r2, [r4, r2]
	add r0, r4, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0207DB7C ; =0x00000C64
	strb r0, [r4, r1]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0207DB70: .word 0x00000654
_0207DB74: .word sub_0207DB80
_0207DB78: .word 0x000007C8
_0207DB7C: .word 0x00000C64
	thumb_func_end sub_0207DB30

	thumb_func_start sub_0207DB80
sub_0207DB80: ; 0x0207DB80
	push {r3, lr}
	cmp r1, #5
	bhi _0207DBC4
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207DB92: ; jump table
	.short _0207DBC4 - _0207DB92 - 2 ; case 0
	.short _0207DB9E - _0207DB92 - 2 ; case 1
	.short _0207DBA4 - _0207DB92 - 2 ; case 2
	.short _0207DBAA - _0207DB92 - 2 ; case 3
	.short _0207DBB2 - _0207DB92 - 2 ; case 4
	.short _0207DBBC - _0207DB92 - 2 ; case 5
_0207DB9E:
	bl sub_02006198
	pop {r3, pc}
_0207DBA4:
	bl sub_02006BCC
	pop {r3, pc}
_0207DBAA:
	ldr r0, _0207DBC8 ; =0x000005E6
	bl PlaySE
	b _0207DBC4
_0207DBB2:
	mov r0, #0x4a
	lsl r0, r0, #4
	bl sub_02006B24
	b _0207DBC4
_0207DBBC:
	ldr r0, _0207DBC8 ; =0x000005E6
	bl sub_02006184
	pop {r3, pc}
_0207DBC4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0207DBC8: .word 0x000005E6
	thumb_func_end sub_0207DB80

	thumb_func_start sub_0207DBCC
sub_0207DBCC: ; 0x0207DBCC
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0xc
	bl sub_0201660C
	ldr r2, _0207DC1C ; =0x00000C88
	mov r1, #0x26
	str r0, [r4, r2]
	ldr r0, [r4]
	lsl r1, r1, #4
	str r0, [sp]
	mov r0, #0
	str r1, [sp, #8]
	mov r1, #0xb
	str r1, [sp, #0xc]
	str r0, [sp, #4]
	mov r1, #0x19
	add r3, sp, #0
	strb r1, [r3, #0x10]
	mov r1, #0xa
	strb r1, [r3, #0x11]
	ldrb r5, [r3, #0x12]
	mov r1, #0xf
	bic r5, r1
	strb r5, [r3, #0x12]
	ldrb r5, [r3, #0x12]
	mov r1, #0xf0
	bic r5, r1
	strb r5, [r3, #0x12]
	strb r0, [r3, #0x13]
	ldr r0, [r4, r2]
	add r1, sp, #0
	bl sub_020166FC
	bl sub_0207CB7C
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0207DC1C: .word 0x00000C88
	thumb_func_end sub_0207DBCC

	thumb_func_start sub_0207DC20
sub_0207DC20: ; 0x0207DC20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #4
	add r4, r5, #4
	lsl r6, r0, #4
	add r0, r4, r6
	mov r1, #0
	add r7, r2, #0
	bl FillWindowPixelBuffer
	cmp r7, #0
	beq _0207DC44
	cmp r7, #1
	beq _0207DC54
	b _0207DC62
_0207DC44:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa1
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	b _0207DC62
_0207DC54:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa2
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
_0207DC62:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207DC8C ; =0x000F0E00
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	add r0, r4, r6
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r4, r6
	bl sub_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0207DC8C: .word 0x000F0E00
	thumb_func_end sub_0207DC20

	thumb_func_start sub_0207DC90
sub_0207DC90: ; 0x0207DC90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #4
	add r4, r5, #4
	lsl r7, r0, #4
	add r0, r4, r7
	mov r1, #0
	add r6, r2, #0
	bl FillWindowPixelBuffer
	cmp r6, #0
	beq _0207DCB8
	cmp r6, #1
	beq _0207DCC8
	cmp r6, #2
	beq _0207DCD8
	b _0207DCE6
_0207DCB8:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x9e
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	b _0207DCE6
_0207DCC8:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x9f
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	b _0207DCE6
_0207DCD8:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa0
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
_0207DCE6:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207DD10 ; =0x000F0E00
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	add r0, r4, r7
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r4, r7
	bl sub_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0207DD10: .word 0x000F0E00
	thumb_func_end sub_0207DC90

	thumb_func_start sub_0207DD14
sub_0207DD14: ; 0x0207DD14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #4
	add r4, r5, #4
	lsl r6, r0, #4
	add r0, r4, r6
	mov r1, #0
	add r7, r2, #0
	bl FillWindowPixelBuffer
	cmp r7, #0
	bne _0207DD40
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa4
	bl NewString_ReadMsgData
	b _0207DD4C
_0207DD40:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xa3
	bl NewString_ReadMsgData
_0207DD4C:
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207DD78 ; =0x000F0E00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r6
	bl sub_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207DD78: .word 0x000F0E00
	thumb_func_end sub_0207DD14

	thumb_func_start sub_0207DD7C
sub_0207DD7C: ; 0x0207DD7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r0, #4
	add r4, r5, #4
	lsl r7, r0, #4
	add r0, r4, r7
	mov r1, #0
	add r6, r2, #0
	bl FillWindowPixelBuffer
	cmp r6, #6
	bhs _0207DDAC
	mov r0, #0x1f
	lsl r0, r0, #6
	add r6, #0x98
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0207DDCE
_0207DDAC:
	cmp r6, #7
	bne _0207DDC0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x96
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0207DDCE
_0207DDC0:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x97
	bl NewString_ReadMsgData
	add r5, r0, #0
_0207DDCE:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207DDF8 ; =0x000F0E00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r7
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r7
	bl sub_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207DDF8: .word 0x000F0E00
	thumb_func_end sub_0207DD7C

	thumb_func_start sub_0207DDFC
sub_0207DDFC: ; 0x0207DDFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, _0207DF84 ; =0x00000654
	ldr r1, _0207DF88 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa4
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1]
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #2]
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #4]
	add r0, r4, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #6]
	add r0, r4, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #8]
	add r0, r4, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	strh r0, [r1, #0xa]
	mov r3, #1
	mov r1, #0x26
	str r3, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	lsl r1, r1, #4
	str r1, [sp, #0x10]
	add r1, #0x24
	ldr r0, [r5]
	add r1, r5, r1
	bl AddWindowParameterized
	mov r0, #0xa1
	lsl r0, r0, #2
	mov r1, #1
	add r0, r5, r0
	add r2, r1, #0
	mov r3, #0xe
	bl DrawFrameAndWindow1
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xaf
	bl NewString_ReadMsgData
	mov r4, #0
	str r0, [sp, #0x18]
	str r4, [sp, #0x14]
	add r7, r5, #0
	add r6, sp, #0x24
_0207DEB6:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r1, [sp, #0x14]
	ldr r0, [r5, r0]
	add r1, #0xa9
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	mov r1, #0
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r2, [sp, #0x1c]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x1c]
	bl String_dtor
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r2, [sp, #0x18]
	add r0, r5, r0
	mov r1, #0
	mov r3, #0x50
	bl AddTextPrinterParameterized
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xb0
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, _0207DF8C ; =0x00000C68
	ldr r0, _0207DF90 ; =0x000007C4
	ldrh r3, [r6]
	ldrh r2, [r7, r2]
	ldr r0, [r5, r0]
	mov r1, #0
	sub r2, r3, r2
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, _0207DF90 ; =0x000007C4
	ldr r1, _0207DF94 ; =0x000007C8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x20]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x20]
	bl String_dtor
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r2, _0207DF94 ; =0x000007C8
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #0
	mov r3, #0x5e
	bl AddTextPrinterParameterized
	ldrh r1, [r6]
	ldr r0, _0207DF8C ; =0x00000C68
	add r4, #0x10
	strh r1, [r7, r0]
	ldr r0, [sp, #0x14]
	add r7, r7, #2
	add r0, r0, #1
	add r6, r6, #2
	str r0, [sp, #0x14]
	cmp r0, #6
	blo _0207DEB6
	ldr r0, [sp, #0x18]
	bl String_dtor
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207DF84: .word 0x00000654
_0207DF88: .word 0x00000C65
_0207DF8C: .word 0x00000C68
_0207DF90: .word 0x000007C4
_0207DF94: .word 0x000007C8
	thumb_func_end sub_0207DDFC

	thumb_func_start sub_0207DF98
sub_0207DF98: ; 0x0207DF98
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x70
	str r0, [sp, #4]
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	mov r2, #0x50
	mov r3, #0
	bl FillWindowPixelRect
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xb0
	bl NewString_ReadMsgData
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	add r6, r5, #0
	add r4, r0, #0
_0207DFCC:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, _0207E040 ; =0x00000C68
	ldr r0, _0207E044 ; =0x000007C4
	ldrh r2, [r6, r2]
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0207E044 ; =0x000007C4
	ldr r1, _0207E048 ; =0x000007C8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0xc]
	bl StringExpandPlaceholders
	ldr r1, _0207E048 ; =0x000007C8
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl sub_02002F30
	add r7, r0, #0
	mov r3, #0x68
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r2, _0207E048 ; =0x000007C8
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #0
	sub r3, r3, r7
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x10]
	add r6, r6, #2
	add r0, r0, #1
	add r4, #0x10
	str r0, [sp, #0x10]
	cmp r0, #6
	blo _0207DFCC
	ldr r0, [sp, #0xc]
	bl String_dtor
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207E040: .word 0x00000C68
_0207E044: .word 0x000007C4
_0207E048: .word 0x000007C8
	thumb_func_end sub_0207DF98

	thumb_func_start sub_0207E04C
sub_0207E04C: ; 0x0207E04C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0xa1
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end sub_0207E04C

	thumb_func_start sub_0207E068
sub_0207E068: ; 0x0207E068
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x9d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0207E168 ; =0x00000654
	ldr r1, _0207E16C ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #8
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207E170 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _0207E170 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207E174 ; =0x000F0E00
	ldr r2, _0207E178 ; =0x000007C8
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	ldr r0, _0207E168 ; =0x00000654
	ldr r1, _0207E16C ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0xb6
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, _0207E170 ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	bl BufferItemName
	ldr r1, _0207E170 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0207E174 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r2, _0207E178 ; =0x000007C8
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #2
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	mov r0, #0x95
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
	mov r0, #0x9d
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207E168: .word 0x00000654
_0207E16C: .word 0x00000C65
_0207E170: .word 0x000007C4
_0207E174: .word 0x000F0E00
_0207E178: .word 0x000007C8
	thumb_func_end sub_0207E068

	thumb_func_start sub_0207E17C
sub_0207E17C: ; 0x0207E17C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r4, r2, #0
	str r0, [sp]
	cmp r7, #8
	ble _0207E18C
	bl GF_AssertFail
_0207E18C:
	mov r6, #0
	cmp r7, #0
	ble _0207E1D2
	sub r0, r7, #1
	ldr r1, _0207E1D4 ; =_021016B4
	lsl r0, r0, #4
	add r1, r1, r0
	lsl r0, r4, #3
	add r5, r1, r0
	mov r1, #0xa5
	ldr r0, [sp]
	lsl r1, r1, #2
	add r4, r0, r1
_0207E1A6:
	mov r0, #0
	ldrsb r2, [r5, r0]
	ldr r0, [sp]
	lsl r1, r2, #4
	lsl r3, r2, #3
	ldr r2, _0207E1D8 ; =_02101654
	ldr r0, [r0]
	add r1, r4, r1
	add r2, r2, r3
	bl AddWindow
	mov r0, #0
	ldrsb r0, [r5, r0]
	mov r1, #4
	lsl r0, r0, #4
	add r0, r4, r0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r5, r5, #1
	cmp r6, r7
	blt _0207E1A6
_0207E1D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207E1D4: .word _021016B4
_0207E1D8: .word _02101654
	thumb_func_end sub_0207E17C

	thumb_func_start sub_0207E1DC
sub_0207E1DC: ; 0x0207E1DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r5, r2, #0
	str r0, [sp, #0x10]
	cmp r6, #8
	ble _0207E1EE
	bl GF_AssertFail
_0207E1EE:
	mov r4, #0
	cmp r6, #0
	ble _0207E21C
	sub r0, r6, #1
	ldr r1, _0207E260 ; =_021016B4
	lsl r0, r0, #4
	add r1, r1, r0
	lsl r0, r5, #3
	add r5, r1, r0
	mov r1, #0xa5
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	add r7, r0, r1
_0207E208:
	mov r0, #0
	ldrsb r0, [r5, r0]
	lsl r0, r0, #4
	add r0, r7, r0
	bl RemoveWindow
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, r6
	blt _0207E208
_0207E21C:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	ldr r0, [r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r0, #0x13
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r1, #0
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0x19
	bl FillBgTilemapRect
	ldr r0, [sp, #0x10]
	mov r1, #0
	ldr r0, [r0]
	bl BgCommitTilemapBufferToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207E260: .word _021016B4
	thumb_func_end sub_0207E1DC

	thumb_func_start sub_0207E264
sub_0207E264: ; 0x0207E264
	cmp r0, #4
	bge _0207E26C
	ldr r0, _0207E270 ; =0x000E0F0B
	bx lr
_0207E26C:
	ldr r0, _0207E274 ; =0x00090A0B
	bx lr
	.balign 4, 0
_0207E270: .word 0x000E0F0B
_0207E274: .word 0x00090A0B
	thumb_func_end sub_0207E264

	thumb_func_start sub_0207E278
sub_0207E278: ; 0x0207E278
	cmp r0, #4
	bge _0207E280
	ldr r0, _0207E284 ; =0x000E0F04
	bx lr
_0207E280:
	ldr r0, _0207E288 ; =0x00090A04
	bx lr
	.balign 4, 0
_0207E284: .word 0x000E0F04
_0207E288: .word 0x00090A04
	thumb_func_end sub_0207E278

	thumb_func_start sub_0207E28C
sub_0207E28C: ; 0x0207E28C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #0x14]
	sub r0, r2, #1
	add r5, r3, #0
	lsl r3, r0, #4
	ldr r2, _0207E34C ; =_021016B4
	ldr r0, [sp, #0x38]
	str r1, [sp, #0x10]
	lsl r1, r0, #3
	add r0, r2, r3
	add r0, r1, r0
	ldrb r7, [r5, r0]
	cmp r7, #7
	bne _0207E2EC
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0207E2BC
	ldr r0, _0207E350 ; =0x000E0F04
	mov r6, #4
	str r0, [sp, #0x1c]
	b _0207E2C2
_0207E2BC:
	ldr r0, _0207E354 ; =0x000E0F0B
	mov r6, #0xb
	str r0, [sp, #0x1c]
_0207E2C2:
	mov r0, #4
	str r0, [sp, #0x18]
	mov r0, #0xa5
	lsl r0, r0, #2
	add r1, r4, r0
	lsl r0, r7, #4
	add r0, r1, r0
	bl GetWindowWidth
	add r3, r0, #0
	ldr r1, [sp, #0x10]
	mov r0, #4
	ldr r2, [r1]
	lsl r1, r5, #3
	ldr r1, [r2, r1]
	mov r2, #0
	lsl r3, r3, #3
	bl sub_020030A0
	str r0, [sp, #0x14]
	b _0207E30C
_0207E2EC:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0207E2FE
	add r0, r5, #0
	mov r6, #4
	bl sub_0207E278
	str r0, [sp, #0x1c]
	b _0207E308
_0207E2FE:
	add r0, r5, #0
	mov r6, #0xb
	bl sub_0207E264
	str r0, [sp, #0x1c]
_0207E308:
	mov r0, #0
	str r0, [sp, #0x18]
_0207E30C:
	mov r0, #0xa5
	lsl r0, r0, #2
	lsl r1, r6, #0x18
	add r4, r4, r0
	lsl r7, r7, #4
	add r0, r4, r7
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [r2]
	lsl r2, r5, #3
	ldr r2, [r3, r2]
	ldr r3, [sp, #0x14]
	add r0, r4, r7
	bl AddTextPrinterParameterized2
	add r0, r4, r7
	bl sub_0201D5C8
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E34C: .word _021016B4
_0207E350: .word 0x000E0F04
_0207E354: .word 0x000E0F0B
	thumb_func_end sub_0207E28C

	thumb_func_start sub_0207E358
sub_0207E358: ; 0x0207E358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r2, #0
	add r7, r0, #0
	str r1, [sp, #8]
	str r3, [sp, #0xc]
	ldr r6, [sp, #0x28]
	cmp r5, #8
	ble _0207E36E
	bl GF_AssertFail
_0207E36E:
	mov r4, #0
	cmp r5, #0
	ble _0207E3A4
_0207E374:
	ldr r0, [sp, #0xc]
	cmp r0, r4
	str r6, [sp]
	bne _0207E38E
	mov r0, #1
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r2, r5, #0
	add r3, r4, #0
	bl sub_0207E28C
	b _0207E39E
_0207E38E:
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r2, r5, #0
	add r3, r4, #0
	bl sub_0207E28C
_0207E39E:
	add r4, r4, #1
	cmp r4, r5
	blt _0207E374
_0207E3A4:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207E358

	thumb_func_start sub_0207E3A8
sub_0207E3A8: ; 0x0207E3A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	sub r1, r1, #1
	lsl r4, r1, #4
	ldr r1, _0207E538 ; =_021016B4
	lsl r3, r3, #3
	add r1, r1, r4
	add r1, r3, r1
	ldrsb r1, [r2, r1]
	add r5, r0, #0
	ldr r0, _0207E53C ; =_021015EC
	lsl r1, r1, #2
	add r4, r0, r1
	ldr r0, [sp, #0x38]
	cmp r0, #0
	bne _0207E3CE
	mov r2, #2
	lsl r2, r2, #0xc
	b _0207E3D8
_0207E3CE:
	cmp r0, #1
	bne _0207E3D6
	ldr r2, _0207E540 ; =0x00002009
	b _0207E3D8
_0207E3D6:
	ldr r2, _0207E544 ; =0x00002012
_0207E3D8:
	ldr r6, _0207E548 ; =_021015AC
	mov r1, #0
	add r2, #0xa
	add r7, sp, #0x10
_0207E3E0:
	lsl r0, r1, #1
	ldrh r3, [r6, r0]
	add r3, r2, r3
	strh r3, [r7, r0]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #8
	blo _0207E3E0
	ldrb r0, [r4, #1]
	mov r1, #0
	add r2, r7, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r3, [r4]
	ldr r0, [r5]
	bl sub_0201C4C4
	ldrb r0, [r4, #1]
	add r2, sp, #0x10
	mov r1, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r6, [r4]
	ldrb r3, [r4, #2]
	ldr r0, [r5]
	add r2, #2
	add r3, r6, r3
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl sub_0201C4C4
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #3]
	add r2, sp, #0x14
	add r0, r1, r0
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r3, [r4]
	ldr r0, [r5]
	mov r1, #0
	bl sub_0201C4C4
	add r2, sp, #0x14
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #3]
	add r2, #2
	add r0, r1, r0
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r6, [r4]
	ldrb r3, [r4, #2]
	ldr r0, [r5]
	mov r1, #0
	add r3, r6, r3
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl sub_0201C4C4
	ldrb r0, [r4, #1]
	add r2, sp, #0x10
	mov r1, #0
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r0, [r4, #3]
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrh r2, [r2, #8]
	ldrb r3, [r4]
	ldr r0, [r5]
	bl FillBgTilemapRect
	ldrb r0, [r4, #1]
	add r2, sp, #0x10
	mov r1, #0
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r0, [r4, #3]
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrb r6, [r4]
	ldrb r3, [r4, #2]
	ldrh r2, [r2, #0xa]
	ldr r0, [r5]
	add r3, r6, r3
	sub r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r0, [r4, #1]
	add r2, sp, #0x10
	mov r1, #0
	str r0, [sp]
	ldrb r0, [r4, #2]
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrb r3, [r4]
	ldrh r2, [r2, #0xc]
	ldr r0, [r5]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #3]
	add r2, sp, #0x10
	add r0, r1, r0
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r4, #2]
	mov r1, #0
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrb r3, [r4]
	ldrh r2, [r2, #0xe]
	ldr r0, [r5]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E538: .word _021016B4
_0207E53C: .word _021015EC
_0207E540: .word 0x00002009
_0207E544: .word 0x00002012
_0207E548: .word _021015AC
	thumb_func_end sub_0207E3A8

	thumb_func_start sub_0207E54C
sub_0207E54C: ; 0x0207E54C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	str r2, [sp, #4]
	add r7, r3, #0
	mov r4, #0
	cmp r5, #0
	ble _0207E58C
_0207E55E:
	ldr r0, [sp, #4]
	cmp r0, r4
	bne _0207E576
	mov r0, #1
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0207E3A8
	b _0207E586
_0207E576:
	mov r0, #0
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_0207E3A8
_0207E586:
	add r4, r4, #1
	cmp r4, r5
	blt _0207E55E
_0207E58C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207E54C

	thumb_func_start sub_0207E590
sub_0207E590: ; 0x0207E590
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	mov r1, #0x10
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	ldmia r6!, {r0, r1}
	add r2, r4, #4
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	str r0, [r2]
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #2]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r0, [sp, #0x18]
	strb r0, [r4, #3]
	ldrb r1, [r4, #0xe]
	ldrb r2, [r4, #3]
	add r0, r5, #0
	bl sub_0207E17C
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	ldrb r2, [r4, #0xe]
	ldrb r3, [r4]
	add r0, r5, #0
	bl sub_0207E358
	bl sub_0207CB7C
	ldr r0, _0207E610 ; =0x00000684
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0207E614 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207E5FE
	cmp r0, #0x11
	beq _0207E5FE
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207E60A
_0207E5FE:
	mov r0, #0x1a
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
_0207E60A:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E610: .word 0x00000684
_0207E614: .word 0x00000654
	thumb_func_end sub_0207E590

	thumb_func_start sub_0207E618
sub_0207E618: ; 0x0207E618
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	add r4, r0, #0
	bl sub_0207E1DC
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, _0207E67C ; =0x00000654
	ldr r1, [r4, r0]
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #4
	beq _0207E63C
	cmp r1, #0x15
	bne _0207E648
_0207E63C:
	ldr r0, _0207E680 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	b _0207E652
_0207E648:
	add r0, #0x30
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
_0207E652:
	ldr r0, _0207E67C ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0207E66C
	cmp r0, #0x11
	beq _0207E66C
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207E678
_0207E66C:
	mov r0, #0x1a
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
_0207E678:
	pop {r3, r4, r5, pc}
	nop
_0207E67C: .word 0x00000654
_0207E680: .word 0x00000684
	thumb_func_end sub_0207E618

	thumb_func_start sub_0207E684
sub_0207E684: ; 0x0207E684
	push {r3, r4}
	sub r1, r1, #1
	ldr r4, _0207E6B0 ; =_021016B4
	lsl r1, r1, #4
	mov r3, #0
	add r1, r4, r1
	lsl r0, r0, #3
	add r4, r1, r0
	add r0, r3, #0
_0207E696:
	ldrsb r1, [r4, r0]
	cmp r2, r1
	bne _0207E6A2
	mov r0, #1
	pop {r3, r4}
	bx lr
_0207E6A2:
	add r3, r3, #1
	add r4, r4, #1
	cmp r3, #8
	blt _0207E696
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0207E6B0: .word _021016B4
	thumb_func_end sub_0207E684

	thumb_func_start sub_0207E6B4
sub_0207E6B4: ; 0x0207E6B4
	push {r3, r4}
	sub r1, r1, #1
	ldr r4, _0207E6E4 ; =_021016B4
	lsl r1, r1, #4
	mov r3, #0
	add r1, r4, r1
	lsl r0, r0, #3
	add r4, r1, r0
	add r0, r3, #0
_0207E6C6:
	ldrsb r1, [r4, r0]
	cmp r2, r1
	bne _0207E6D2
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_0207E6D2:
	add r3, r3, #1
	add r4, r4, #1
	cmp r3, #8
	blt _0207E6C6
	mov r0, #0
	mvn r0, r0
	pop {r3, r4}
	bx lr
	nop
_0207E6E4: .word _021016B4
	thumb_func_end sub_0207E6B4

	thumb_func_start sub_0207E6E8
sub_0207E6E8: ; 0x0207E6E8
	push {r3, r4}
	sub r1, r1, #1
	lsl r4, r1, #4
	ldr r3, _0207E710 ; =_021016B4
	lsl r1, r0, #3
	add r0, r3, r4
	add r0, r1, r0
	ldrsb r1, [r2, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0207E70A
	cmp r1, #7
	beq _0207E70A
	mov r0, #1
	pop {r3, r4}
	bx lr
_0207E70A:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0207E710: .word _021016B4
	thumb_func_end sub_0207E6E8

	thumb_func_start sub_0207E714
sub_0207E714: ; 0x0207E714
	push {r3, r4, r5, r6}
	sub r3, r1, #2
	add r6, r3, #0
	ldrb r3, [r0]
	mov r1, #0x60
	mul r6, r1
	ldr r4, _0207E744 ; =_02110244
	add r5, r3, #0
	mov r1, #0xc
	mul r5, r1
	add r4, r4, r6
	lsl r3, r2, #2
	add r2, r5, r4
	ldr r2, [r3, r2]
	sub r1, #0xd
	cmp r2, r1
	beq _0207E73E
	strb r2, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_0207E73E:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0207E744: .word _02110244
	thumb_func_end sub_0207E714

	thumb_func_start sub_0207E748
sub_0207E748: ; 0x0207E748
	push {r3, r4, r5, r6}
	sub r3, r1, #2
	add r6, r3, #0
	ldrb r3, [r0]
	mov r1, #0x28
	mul r6, r1
	ldr r4, _0207E774 ; =_021101A4
	lsl r5, r3, #3
	add r4, r4, r6
	lsl r3, r2, #2
	add r2, r5, r4
	ldr r2, [r3, r2]
	sub r1, #0x29
	cmp r2, r1
	beq _0207E76E
	strb r2, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_0207E76E:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0207E774: .word _021101A4
	thumb_func_end sub_0207E748

	thumb_func_start sub_0207E778
sub_0207E778: ; 0x0207E778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0xc9
	add r6, r0, #0
	lsl r1, r1, #4
	add r7, r6, r1
	ldr r1, [r7, #0xc]
	mov r4, #0
	cmp r1, #1
	bne _0207E7A2
	bl sub_0207CC24
	cmp r0, #0
	bne _0207E79C
	add sp, #8
	ldr r0, [r7, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0207E79C:
	add sp, #8
	sub r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E7A2:
	ldr r0, _0207E930 ; =_02110180
	bl sub_02025224
	add r7, r0, #0
	sub r0, r4, #1
	cmp r7, r0
	beq _0207E81E
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	add r2, r7, #0
	bl sub_0207E684
	cmp r0, #1
	beq _0207E7C0
	b _0207E900
_0207E7C0:
	cmp r7, #7
	bne _0207E7CE
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207E7D4
_0207E7CE:
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
_0207E7D4:
	mov r0, #0
	str r0, [sp]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E3A8
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E28C
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	add r2, r7, #0
	bl sub_0207E6B4
	strb r0, [r5, #1]
	ldrb r2, [r5, #1]
	ldr r3, [r5, #4]
	add r0, r6, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r5, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207E81E:
	ldr r0, _0207E938 ; =gMain
	mov r2, #0x40
	ldr r1, [r0, #0x4c]
	tst r2, r1
	beq _0207E83A
	ldrb r1, [r5, #2]
	add r0, r5, #1
	add r2, r4, #0
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E83A:
	mov r2, #0x80
	tst r2, r1
	beq _0207E852
	ldrb r1, [r5, #2]
	add r0, r5, #1
	mov r2, #1
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E852:
	mov r2, #0x20
	tst r2, r1
	bne _0207E85E
	mov r2, #0x10
	tst r1, r2
	beq _0207E870
_0207E85E:
	ldrb r1, [r5, #2]
	add r0, r5, #1
	mov r2, #2
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E870:
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207E8B2
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	mov r2, #7
	bl sub_0207E6B4
	ldrb r1, [r5, #1]
	cmp r1, r0
	bne _0207E892
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207E898
_0207E892:
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
_0207E898:
	ldrb r2, [r5, #1]
	ldr r3, [r5, #4]
	add r0, r6, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r5, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207E8B2:
	mov r0, #2
	tst r0, r1
	beq _0207E900
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	str r0, [sp]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E3A8
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E28C
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	mov r2, #7
	bl sub_0207E6B4
	strb r0, [r5, #1]
	add r0, r6, #0
	add r1, r5, #0
	sub r2, r4, #2
	bl sub_0207CB9C
	add sp, #8
	sub r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E900:
	cmp r4, #0
	beq _0207E926
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E54C
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E358
_0207E926:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E930: .word _02110180
_0207E934: .word 0x000005DC
_0207E938: .word gMain
	thumb_func_end sub_0207E778

	thumb_func_start sub_0207E93C
sub_0207E93C: ; 0x0207E93C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #0xc9
	add r5, r0, #0
	lsl r1, r1, #4
	add r7, r5, r1
	ldr r1, [r7, #0xc]
	mov r6, #0
	cmp r1, #1
	bne _0207E966
	bl sub_0207CC24
	cmp r0, #0
	bne _0207E960
	add sp, #8
	ldr r0, [r7, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0207E960:
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E966:
	ldr r0, _0207EB18 ; =_02110168
	bl sub_02025224
	add r7, r0, #0
	sub r0, r6, #1
	cmp r7, r0
	beq _0207EA0E
	cmp r7, #4
	bne _0207E9BA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r0, [r4, #2]
	add r1, r4, #0
	sub r2, r6, #2
	sub r0, r0, #1
	strb r0, [r4, #1]
	add r0, r5, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E9BA:
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	add r2, r7, #0
	bl sub_0207E6E8
	cmp r0, #1
	beq _0207E9CA
	b _0207EAEA
_0207E9CA:
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	strb r7, [r4, #1]
	ldrb r2, [r4, #1]
	ldr r3, [r4, #4]
	add r0, r5, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r4, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207EA0E:
	ldr r2, _0207EB20 ; =gMain
	mov r1, #0x40
	ldr r0, [r2, #0x4c]
	tst r1, r0
	beq _0207EA2A
	ldrb r1, [r4, #2]
	add r0, r4, #1
	add r2, r6, #0
	bl sub_0207E748
	cmp r0, #0
	beq _0207EAEA
	add r6, r6, #1
	b _0207EAEA
_0207EA2A:
	mov r1, #0x80
	tst r0, r1
	beq _0207EA42
	ldrb r1, [r4, #2]
	add r0, r4, #1
	mov r2, #1
	bl sub_0207E748
	cmp r0, #0
	beq _0207EAEA
	add r6, r6, #1
	b _0207EAEA
_0207EA42:
	ldr r1, [r2, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207EAA2
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #1]
	sub r0, r0, #1
	cmp r1, r0
	bne _0207EA5E
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207EA64
_0207EA5E:
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
_0207EA64:
	mov r0, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r2, [r4, #1]
	ldr r3, [r4, #4]
	add r0, r5, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r4, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207EAA2:
	mov r0, #2
	tst r0, r1
	beq _0207EAEA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r0, [r4, #2]
	add r1, r4, #0
	sub r2, r6, #2
	sub r0, r0, #1
	strb r0, [r4, #1]
	add r0, r5, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207EAEA:
	cmp r6, #0
	beq _0207EB10
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E54C
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E358
_0207EB10:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207EB18: .word _02110168
_0207EB1C: .word 0x000005DC
_0207EB20: .word gMain
	thumb_func_end sub_0207E93C

	thumb_func_start sub_0207EB24
sub_0207EB24: ; 0x0207EB24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl sub_02022CC8
	mov r0, #0x20
	mov r1, #0xc
	bl sub_0202055C
	mov r0, #0xc
	bl sub_0200CF18
	ldr r1, _0207EBD0 ; =0x00000658
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	ldr r7, _0207EBD4 ; =0x0000065C
	add r2, sp, #0x24
	ldr r3, _0207EBD8 ; =_021018D8
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _0207EBDC ; =_021018C4
	stmia r2!, {r0, r1}
	add r3, sp, #0x10
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r4, r0]
	mov r3, #0x20
	bl sub_0200CF70
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x31
	bl sub_0200CFF4
	sub r0, r7, #4
	ldr r0, [r4, r0]
	bl sub_0200CF6C
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x14
	bl sub_02009FC8
	ldr r3, _0207EBE0 ; =_021018B4
	add r2, sp, #0
	mov r1, #7
_0207EBB0:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0207EBB0
	ldr r1, _0207EBD0 ; =0x00000658
	add r2, sp, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D294
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0207EBD0: .word 0x00000658
_0207EBD4: .word 0x0000065C
_0207EBD8: .word _021018D8
_0207EBDC: .word _021018C4
_0207EBE0: .word _021018B4
	thumb_func_end sub_0207EB24

	thumb_func_start sub_0207EBE4
sub_0207EBE4: ; 0x0207EBE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	ldr r0, _0207ECCC ; =0x00000654
	str r3, [sp, #8]
	ldr r0, [r5, r0]
	add r4, r2, #0
	ldr r0, [r0]
	add r7, r1, #0
	bl GetPartyMonByIndex
	lsl r1, r4, #0x10
	asr r6, r1, #0x10
	add r4, r7, #0
	mov r1, #0x30
	mul r4, r1
	ldr r2, _0207ECD0 ; =0x0000083E
	add r3, r5, r4
	strh r6, [r3, r2]
	ldr r1, [sp, #8]
	add r2, r2, #2
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #0xc]
	ldr r1, [sp, #0xc]
	str r0, [sp, #0x10]
	strh r1, [r3, r2]
	add r7, r7, #4
	bl sub_020741B0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r1, _0207ECD4 ; =0x00000658
	str r7, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x58]
	bl sub_0200E2B8
	ldr r0, [sp, #0x10]
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x14]
	str r7, [sp, #0x1c]
	add r1, sp, #0x1c
	strh r6, [r1, #4]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x14]
	strh r0, [r1, #6]
	mov r0, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	str r0, [sp, #0x28]
	ldr r0, _0207ECD8 ; =0x00000839
	add r7, r5, r0
	sub r0, #0xd
	add r0, r5, r0
	str r0, [sp, #0x18]
	ldrh r0, [r0, r4]
	ldrb r1, [r7, r4]
	bl sub_02074364
	add r0, r0, #3
	str r0, [sp, #0x2c]
	mov r0, #1
	str r0, [sp, #0x30]
	mov r0, #0
	ldr r1, _0207ECD4 ; =0x00000658
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0x1c
	bl sub_0200D2B4
	ldr r1, _0207ECDC ; =0x0000084C
	add r2, r5, r4
	str r0, [r2, r1]
	mov r0, #1
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x18]
	ldrb r1, [r7, r4]
	ldrh r0, [r0, r4]
	ldr r2, [sp, #0x14]
	bl sub_02074364
	add r0, r0, #1
	str r0, [sp, #0x2c]
	add r2, sp, #0x1c
	strh r6, [r2, #4]
	mov r1, #1
	ldr r0, [sp, #8]
	lsl r1, r1, #8
	add r0, r0, r1
	strh r0, [r2, #6]
	ldr r1, _0207ECD4 ; =0x00000658
	add r2, sp, #0x1c
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	mov r1, #0x85
	add r2, r5, r4
	lsl r1, r1, #4
	str r0, [r2, r1]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0207ECCC: .word 0x00000654
_0207ECD0: .word 0x0000083E
_0207ECD4: .word 0x00000658
_0207ECD8: .word 0x00000839
_0207ECDC: .word 0x0000084C
	thumb_func_end sub_0207EBE4

	thumb_func_start sub_0207ECE0
sub_0207ECE0: ; 0x0207ECE0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0207EDCC ; =0x00000654
	add r6, r1, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r7, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	mov r0, #0x14
	mov r1, #0xc
	bl NARC_ctor
	str r0, [sp, #0x10]
	mov r0, #0x30
	add r4, r6, #0
	mul r4, r0
	ldr r0, _0207EDD0 ; =0x0000084C
	add r6, r5, r0
	ldr r0, [r6, r4]
	bl sub_02024B1C
	mov r1, #1
	bl NNS_G2dGetImageLocation
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl sub_020741B0
	add r1, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r2, #0
	mov r3, #0xc
	bl sub_02007C98
	add r1, sp, #0x18
	str r0, [sp, #4]
	bl NNS_G2dGetUnpackedCharacterData
	cmp r0, #0
	beq _0207ED8E
	ldr r1, [sp, #0x18]
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	bl DC_FlushRange
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x14]
	ldr r0, [r2, #0x14]
	ldr r2, [r2, #0x10]
	bl GX_LoadOBJ
	mov r0, #0x85
	add r1, r5, r4
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl sub_02024B1C
	mov r1, #2
	bl NNS_G2dGetImageLocation
	ldr r1, [sp, #0x18]
	add r7, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	bl DC_FlushRange
	ldr r2, [sp, #0x18]
	add r1, r7, #0
	ldr r0, [r2, #0x14]
	ldr r2, [r2, #0x10]
	bl GXS_LoadOBJ
_0207ED8E:
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	mov r2, #0
	bl sub_02074364
	add r1, r0, #0
	ldr r0, [r6, r4]
	add r1, r1, #3
	bl sub_0200DD08
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	mov r2, #0
	bl sub_02074364
	add r2, r0, #0
	mov r0, #0x85
	add r1, r5, r4
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r2, #1
	bl sub_0200DD08
	ldr r0, [sp, #0x10]
	bl NARC_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207EDCC: .word 0x00000654
_0207EDD0: .word 0x0000084C
	thumb_func_end sub_0207ECE0

	thumb_func_start sub_0207EDD4
sub_0207EDD4: ; 0x0207EDD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r1, _0207EF1C ; =0x00000658
	add r5, r0, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _0207EF20 ; =_021018F8
	bl sub_0200D2B4
	ldr r1, _0207EF24 ; =0x00000678
	ldr r2, _0207EF28 ; =_02101920
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x20
	sub r1, #0x1c
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	ldr r1, _0207EF2C ; =0x0000067C
	ldr r2, _0207EF30 ; =_02101948
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x24
	sub r1, #0x20
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	mov r1, #0x1a
	lsl r1, r1, #6
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x28
	sub r1, #0x24
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _0207EF34 ; =_02101970
	bl sub_0200D2B4
	ldr r1, _0207EF38 ; =0x00000684
	ldr r2, _0207EF3C ; =_02101C68
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x2c
	sub r1, #0x28
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	mov r1, #0x6d
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, _0207EF20 ; =_021018F8
	mov r4, #0
	str r4, [sp, #4]
	add r6, r5, #0
	str r0, [sp]
	add r7, r5, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
_0207EE52:
	ldr r0, _0207EF1C ; =0x00000658
	ldr r1, _0207EF40 ; =0x0000065C
	add r3, r4, #0
	ldr r2, [sp, #8]
	add r3, #0xa0
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r2, r3
	bl sub_0200D2B4
	ldr r1, _0207EF44 ; =0x00000688
	str r0, [r6, r1]
	ldr r1, [sp]
	mov r0, #0xa4
	ldrsh r1, [r1, r0]
	ldr r0, _0207EF48 ; =0x00000842
	strh r1, [r7, r0]
	ldr r1, [sp]
	mov r0, #0xa6
	ldrsh r1, [r1, r0]
	ldr r0, _0207EF4C ; =0x00000844
	strh r1, [r7, r0]
	ldr r0, _0207EF44 ; =0x00000688
	mov r1, #0
	ldr r0, [r6, r0]
	bl sub_02024830
	mov r2, #0x19
	ldr r0, _0207EF1C ; =0x00000658
	ldr r1, _0207EF40 ; =0x0000065C
	lsl r2, r2, #4
	add r3, r4, r2
	ldr r2, [sp, #0xc]
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r2, r3
	bl sub_0200D2B4
	mov r1, #0x6a
	lsl r1, r1, #4
	mov r2, #0xa
	str r0, [r6, r1]
	add r0, r1, #0
	lsl r2, r2, #6
	sub r0, #0x48
	sub r1, #0x44
	add r3, r4, r2
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r2, r3
	bl sub_0200D2B4
	ldr r1, _0207EF50 ; =0x000006B8
	add r4, #0x28
	str r0, [r6, r1]
	ldr r0, [sp]
	add r6, r6, #4
	add r0, #0x28
	str r0, [sp]
	ldr r0, [sp, #4]
	add r7, #0x30
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #6
	blo _0207EE52
	add r7, r1, #0
	mov r6, #0
	add r4, r5, #0
	add r7, #0x90
_0207EEDE:
	ldr r0, _0207EF1C ; =0x00000658
	ldr r1, _0207EF40 ; =0x0000065C
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _0207EF54 ; =_02101C90
	bl sub_0200D2B4
	ldr r1, _0207EF58 ; =0x00000748
	str r0, [r4, r1]
	ldr r0, [r4, r7]
	mov r1, #0
	bl sub_02024830
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blo _0207EEDE
	ldr r0, _0207EF2C ; =0x0000067C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0207EF1C: .word 0x00000658
_0207EF20: .word _021018F8
_0207EF24: .word 0x00000678
_0207EF28: .word _02101920
_0207EF2C: .word 0x0000067C
_0207EF30: .word _02101948
_0207EF34: .word _02101970
_0207EF38: .word 0x00000684
_0207EF3C: .word _02101C68
_0207EF40: .word 0x0000065C
_0207EF44: .word 0x00000688
_0207EF48: .word 0x00000842
_0207EF4C: .word 0x00000844
_0207EF50: .word 0x000006B8
_0207EF54: .word _02101C90
_0207EF58: .word 0x00000748
	thumb_func_end sub_0207EDD4

	thumb_func_start sub_0207EF5C
sub_0207EF5C: ; 0x0207EF5C
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	add r0, sp, #0
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r0, #1
	str r1, [sp, #0x10]
	str r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	str r1, [sp, #0x20]
	str r1, [sp, #0x24]
	ldr r1, _0207EFA0 ; =0x00000658
	str r0, [sp, #0xc]
	str r0, [sp, #0x14]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl sub_0200D2B4
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x66
	lsl r1, r1, #4
	str r0, [r2, r1]
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0207EFA0: .word 0x00000658
	thumb_func_end sub_0207EF5C

	thumb_func_start sub_0207EFA4
sub_0207EFA4: ; 0x0207EFA4
	push {r4, lr}
	ldr r1, _0207EFC0 ; =0x00000658
	add r4, r0, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D0E4
	ldr r0, _0207EFC0 ; =0x00000658
	ldr r0, [r4, r0]
	bl sub_0200D108
	pop {r4, pc}
	nop
_0207EFC0: .word 0x00000658
	thumb_func_end sub_0207EFA4

	thumb_func_start sub_0207EFC4
sub_0207EFC4: ; 0x0207EFC4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	mov r2, #0x66
	lsl r2, r2, #4
	add r3, r1, #0
	add r5, r0, r2
	add r3, #0xa
	add r2, #0xe8
	add r7, r0, r2
	lsl r0, r1, #2
	lsl r4, r3, #2
	str r0, [sp]
	cmp r6, #7
	ldr r0, [r5, r4]
	bne _0207EFEA
	mov r1, #0
	bl sub_02024830
	pop {r3, r4, r5, r6, r7, pc}
_0207EFEA:
	add r1, r6, #0
	bl sub_020248F0
	ldr r0, [sp]
	add r1, r6, #0
	ldr r0, [r7, r0]
	bl sub_020248F0
	ldr r0, [r5, r4]
	mov r1, #1
	bl sub_02024830
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0207EFC4

	thumb_func_start sub_0207F004
sub_0207F004: ; 0x0207F004
	push {r3, r4, r5, lr}
	mov r3, #0x66
	lsl r3, r3, #4
	add r1, #0x10
	add r5, r0, r3
	lsl r4, r1, #2
	cmp r2, #0
	bne _0207F01E
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_02024830
	pop {r3, r4, r5, pc}
_0207F01E:
	add r0, r2, #0
	bl ItemIdIsMail
	cmp r0, #1
	ldr r0, [r5, r4]
	bne _0207F032
	mov r1, #1
	bl sub_020248F0
	b _0207F038
_0207F032:
	mov r1, #0
	bl sub_020248F0
_0207F038:
	ldr r0, [r5, r4]
	mov r1, #1
	bl sub_02024830
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0207F004

	thumb_func_start sub_0207F044
sub_0207F044: ; 0x0207F044
	push {r3, r4, r5, lr}
	mov r2, #0x66
	lsl r2, r2, #4
	add r1, #0x10
	lsl r4, r1, #2
	add r5, r0, r2
	ldr r0, [r5, r4]
	mov r1, #1
	bl sub_020248F0
	ldr r0, [r5, r4]
	mov r1, #1
	bl sub_02024830
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0207F044

	thumb_func_start sub_0207F064
sub_0207F064: ; 0x0207F064
	push {r4, r5, r6, lr}
	ldr r6, _0207F094 ; =0x00000846
	add r5, r1, #0
	mov r4, #0x30
	mul r5, r4
	add r1, #0x10
	lsl r1, r1, #2
	add r4, r0, r6
	add r2, #8
	strh r2, [r4, r5]
	add r2, r6, #2
	add r2, r0, r2
	add r3, #8
	add r1, r0, r1
	mov r0, #0x66
	strh r3, [r2, r5]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldrsh r1, [r4, r5]
	ldrsh r2, [r2, r5]
	bl sub_0200DD88
	pop {r4, r5, r6, pc}
	nop
_0207F094: .word 0x00000846
	thumb_func_end sub_0207F064

	thumb_func_start sub_0207F098
sub_0207F098: ; 0x0207F098
	add r2, r0, #0
	add r3, r1, #0
	mov r0, #0x30
	mul r3, r0
	add r1, #0x16
	lsl r0, r1, #2
	add r1, r2, r0
	mov r0, #0x66
	add r3, r2, r3
	lsl r0, r0, #4
	ldr r2, _0207F0C0 ; =0x00000846
	ldr r0, [r1, r0]
	ldrsh r1, [r3, r2]
	add r2, r2, #2
	ldrsh r2, [r3, r2]
	add r1, #8
	lsl r1, r1, #0x10
	ldr r3, _0207F0C4 ; =sub_0200DD88
	asr r1, r1, #0x10
	bx r3
	.balign 4, 0
_0207F0C0: .word 0x00000846
_0207F0C4: .word sub_0200DD88
	thumb_func_end sub_0207F098

	thumb_func_start sub_0207F0C8
sub_0207F0C8: ; 0x0207F0C8
	push {r4, lr}
	mov r2, #0x66
	mov r4, #0x30
	lsl r2, r2, #4
	add r3, r0, r2
	add r2, r1, #0
	mul r4, r1
	add r1, r0, r4
	ldr r0, _0207F0F8 ; =0x0000083A
	add r2, #0x16
	ldrh r0, [r1, r0]
	lsl r2, r2, #2
	cmp r0, #0
	ldr r0, [r3, r2]
	bne _0207F0EE
	mov r1, #0
	bl sub_02024830
	pop {r4, pc}
_0207F0EE:
	mov r1, #1
	bl sub_02024830
	pop {r4, pc}
	nop
_0207F0F8: .word 0x0000083A
	thumb_func_end sub_0207F0C8

	thumb_func_start sub_0207F0FC
sub_0207F0FC: ; 0x0207F0FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020249A8
	cmp r4, r0
	beq _0207F11A
	add r0, r5, #0
	mov r1, #0
	bl sub_020249D4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020248F0
_0207F11A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0207F0FC

	thumb_func_start sub_0207F11C
sub_0207F11C: ; 0x0207F11C
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _0207F12A
	mov r0, #0
	pop {r3, pc}
_0207F12A:
	ldrh r1, [r2, #0xe]
	lsl r1, r1, #0x14
	lsr r1, r1, #0x14
	cmp r1, #7
	beq _0207F140
	cmp r1, #0
	beq _0207F140
	cmp r1, #6
	beq _0207F140
	mov r0, #5
	pop {r3, pc}
_0207F140:
	ldrh r1, [r2, #8]
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _0207F172
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207F158: ; jump table
	.short _0207F172 - _0207F158 - 2 ; case 0
	.short _0207F16E - _0207F158 - 2 ; case 1
	.short _0207F16A - _0207F158 - 2 ; case 2
	.short _0207F166 - _0207F158 - 2 ; case 3
	.short _0207F162 - _0207F158 - 2 ; case 4
_0207F162:
	mov r0, #1
	pop {r3, pc}
_0207F166:
	mov r0, #2
	pop {r3, pc}
_0207F16A:
	mov r0, #3
	pop {r3, pc}
_0207F16E:
	mov r0, #4
	pop {r3, pc}
_0207F172:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0207F11C

	thumb_func_start sub_0207F178
sub_0207F178: ; 0x0207F178
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0207F230 ; =0x00000828
	mov r5, #0
	add r0, r6, r0
	str r0, [sp]
_0207F184:
	mov r0, #0x30
	add r1, r5, #0
	mul r1, r0
	ldr r0, [sp]
	add r4, r0, r1
	add r0, r4, #0
	add r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207F224
	mov r0, #0xc5
	lsl r0, r0, #4
	ldrb r0, [r6, r0]
	cmp r0, #1
	bne _0207F1B6
	ldr r0, _0207F234 ; =0x00000C4C
	ldrb r0, [r6, r0]
	cmp r0, r5
	beq _0207F1B2
	ldr r0, _0207F238 ; =0x00000C4D
	ldrb r0, [r6, r0]
	cmp r0, r5
	bne _0207F1B6
_0207F1B2:
	mov r7, #0
	b _0207F1BE
_0207F1B6:
	add r0, r4, #0
	bl sub_0207F11C
	add r7, r0, #0
_0207F1BE:
	lsl r1, r7, #0x18
	ldr r0, [r4, #0x24]
	lsr r1, r1, #0x18
	bl sub_0207F0FC
	mov r1, #1
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, _0207F23C ; =0x00000C65
	ldrb r0, [r6, r0]
	cmp r0, r5
	bne _0207F216
	cmp r7, #0
	beq _0207F216
	cmp r7, #5
	beq _0207F216
	ldr r0, [r4, #0x24]
	bl sub_020249F8
	cmp r0, #0
	ldr r0, [r4, #0x24]
	bne _0207F202
	mov r2, #0x18
	ldrsh r2, [r4, r2]
	mov r1, #0x16
	ldrsh r1, [r4, r1]
	sub r2, r2, #3
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	b _0207F224
_0207F202:
	mov r2, #0x18
	ldrsh r2, [r4, r2]
	mov r1, #0x16
	ldrsh r1, [r4, r1]
	add r2, r2, #1
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	b _0207F224
_0207F216:
	mov r1, #0x16
	mov r2, #0x18
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	bl sub_0200DD88
_0207F224:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #6
	blo _0207F184
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207F230: .word 0x00000828
_0207F234: .word 0x00000C4C
_0207F238: .word 0x00000C4D
_0207F23C: .word 0x00000C65
	thumb_func_end sub_0207F178

	thumb_func_start sub_0207F240
sub_0207F240: ; 0x0207F240
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _0207F29C ; =0x00000948
	add r4, r1, #0
	ldr r1, [r5, r0]
	lsl r0, r4, #3
	add r0, r1, r0
	add r1, sp, #0
	add r6, r2, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	ldr r0, _0207F2A0 ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r0, #0x25
	ldrb r0, [r0]
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207F2A4 ; =0x00000678
	ldr r0, [r5, r0]
	bl sub_020248F0
	ldr r0, _0207F2A4 ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0207F2A4 ; =0x00000678
	add r2, sp, #0
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DD88
	ldr r0, _0207F2A4 ; =0x00000678
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0207F29C: .word 0x00000948
_0207F2A0: .word 0x00000654
_0207F2A4: .word 0x00000678
	thumb_func_end sub_0207F240

	thumb_func_start sub_0207F2A8
sub_0207F2A8: ; 0x0207F2A8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	lsl r0, r1, #0xc
	str r0, [sp]
	mov r0, #1
	lsl r1, r2, #0xc
	lsl r0, r0, #0x14
	str r1, [sp, #4]
	add r0, r1, r0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl sub_020247D4
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020249D4
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020248F0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207F2A8

	thumb_func_start sub_0207F2F8
sub_0207F2F8: ; 0x0207F2F8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #1
	bne _0207F332
	mov r0, #0x6d
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020249F8
	cmp r0, #2
	bne _0207F332
	mov r0, #0x6d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024830
_0207F332:
	pop {r4, pc}
	thumb_func_end sub_0207F2F8

	thumb_func_start sub_0207F334
sub_0207F334: ; 0x0207F334
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, _0207F39C ; =0x00000654
	str r1, [sp]
	ldr r0, [r7, r0]
	mov r4, #0
	ldr r0, [r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0207F398
	mov r0, #0x72
	ldr r1, [sp]
	lsl r0, r0, #2
	sub r1, r0, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	ldr r2, [sp]
	add r0, #0x14
	sub r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r6, r7, #0
	add r5, r7, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
_0207F36A:
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	ldr r2, [sp, #4]
	mov r1, #0x1e
	bl sub_0200DD88
	ldr r0, _0207F3A0 ; =0x00000748
	ldr r2, [sp, #8]
	ldr r0, [r5, r0]
	mov r1, #0x32
	bl sub_0200DD88
	ldr r0, _0207F39C ; =0x00000654
	add r6, #0x30
	ldr r0, [r7, r0]
	add r5, r5, #4
	ldr r0, [r0]
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0207F36A
_0207F398:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0207F39C: .word 0x00000654
_0207F3A0: .word 0x00000748
	thumb_func_end sub_0207F334

	thumb_func_start sub_0207F3A4
sub_0207F3A4: ; 0x0207F3A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0207F420 ; =0x00000654
	str r1, [sp]
	ldr r0, [r7, r0]
	mov r4, #0
	ldr r0, [r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0207F3E8
	add r6, r7, #0
	add r5, r7, #0
_0207F3BE:
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_02024830
	ldr r0, _0207F424 ; =0x00000748
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0207F420 ; =0x00000654
	add r6, #0x30
	ldr r0, [r7, r0]
	add r5, r5, #4
	ldr r0, [r0]
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0207F3BE
_0207F3E8:
	ldr r0, [sp]
	mov r1, #0x30
	add r4, r0, #0
	mul r4, r1
	mov r0, #0x85
	add r1, r7, r4
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024830
	ldr r1, _0207F428 ; =0x00000836
	add r0, r7, r4
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x14
	cmp r0, #7
	beq _0207F41C
	ldr r0, [sp]
	sub r1, #0xee
	lsl r0, r0, #2
	add r0, r7, r0
	ldr r0, [r0, r1]
	mov r1, #1
	bl sub_02024830
_0207F41C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207F420: .word 0x00000654
_0207F424: .word 0x00000748
_0207F428: .word 0x00000836
	thumb_func_end sub_0207F3A4

	thumb_func_start sub_0207F42C
sub_0207F42C: ; 0x0207F42C
	lsl r1, r0, #2
	ldr r0, _0207F434 ; =_02101CB8
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_0207F434: .word _02101CB8
	thumb_func_end sub_0207F42C

	thumb_func_start sub_0207F438
sub_0207F438: ; 0x0207F438
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	add r0, r5, #0
	mov r1, #0x27
	mov r2, #0
	bl sub_0207DAD8
	mov r0, #3
	mov r1, #0xc
	bl ListMenuItems_ctor
	mov r1, #0x82
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #3
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x44
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #4
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x40
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #9
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x2c
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #8]
	add r1, sp, #4
	strb r2, [r1, #8]
	mov r3, #1
	strb r3, [r1, #9]
	mov r0, #3
	strb r0, [r1, #0xa]
	ldrb r6, [r1, #0xb]
	mov r0, #0xf
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r6, [r1, #0xb]
	mov r0, #0x30
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r6, [r1, #0xb]
	mov r0, #0xc0
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r1, [r1, #0xa]
	add r0, r5, #0
	bl sub_0207E54C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #4
	mov r2, #0
	mov r3, #0xc
	bl sub_0207E590
	ldr r1, _0207F4F8 ; =0x00000824
	str r0, [r5, r1]
	mov r0, #0xf
	str r0, [r4]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207F4F8: .word 0x00000824
	thumb_func_end sub_0207F438

	thumb_func_start sub_0207F4FC
sub_0207F4FC: ; 0x0207F4FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207F51C ; =0x00000654
	mov r1, #3
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207F51C: .word 0x00000654
	thumb_func_end sub_0207F4FC

	thumb_func_start sub_0207F520
sub_0207F520: ; 0x0207F520
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	add r7, r1, #0
	add r0, r5, r0
	mov r1, #1
	mov r4, #0x11
	bl sub_0200E5D4
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207F684 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r2, r5, r0
	ldr r0, _0207F688 ; =0x00000834
	ldrh r2, [r2, r0]
	ldr r0, _0207F68C ; =0x00000654
	cmp r2, #0
	bne _0207F590
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r2, #0x1f
	lsl r2, r2, #6
	add r6, r0, #0
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x52
	bl ReadMsgDataIntoString
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207F690 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207F690 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207F65E
_0207F590:
	ldr r0, [r5, r0]
	add r1, r2, #0
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	cmp r0, #1
	bne _0207F64E
	ldr r0, _0207F68C ; =0x00000654
	ldr r1, _0207F684 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0
	str r1, [sp]
	add r6, r0, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r6, #0
	bl sub_02071BC8
	add r0, r6, #0
	bl Mon_UpdateGiratinaForme
	ldr r1, _0207F684 ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	add r2, r5, r1
	ldr r1, _0207F688 ; =0x00000834
	ldrh r1, [r2, r1]
	cmp r1, #0x70
	bne _0207F5E2
	cmp r0, #0
	bne _0207F5E2
	mov r4, #0x12
_0207F5E2:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x53
	bl ReadMsgDataIntoString
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207F690 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207F684 ; =0x00000C65
	ldr r3, _0207F690 ; =0x000007C4
	ldrb r6, [r5, r2]
	mov r2, #0x30
	ldr r0, [r5, r3]
	mul r2, r6
	add r2, r5, r2
	add r3, #0x70
	ldrh r2, [r2, r3]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207F690 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	ldr r6, _0207F684 ; =0x00000C65
	mov r3, #0x30
	ldrb r1, [r5, r6]
	mov r0, #0
	add r2, r1, #0
	mul r2, r3
	add r1, r5, r2
	ldr r2, _0207F688 ; =0x00000834
	strh r0, [r1, r2]
	ldrb r1, [r5, r6]
	add r0, r5, #0
	mul r3, r1
	add r3, r5, r3
	ldrh r2, [r3, r2]
	bl sub_0207F004
	b _0207F65E
_0207F64E:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x54
	bl ReadMsgDataIntoString
_0207F65E:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	str r4, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207F684: .word 0x00000C65
_0207F688: .word 0x00000834
_0207F68C: .word 0x00000654
_0207F690: .word 0x000007C4
	thumb_func_end sub_0207F520

	thumb_func_start sub_0207F694
sub_0207F694: ; 0x0207F694
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207F6DC ; =0x00000C64
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _0207F6D6
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207F6E0 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _0207F6E4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0207F6D6:
	mov r0, #0x11
	pop {r4, pc}
	nop
_0207F6DC: .word 0x00000C64
_0207F6E0: .word 0x00000678
_0207F6E4: .word 0x04000050
	thumb_func_end sub_0207F694

	thumb_func_start sub_0207F6E8
sub_0207F6E8: ; 0x0207F6E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207F71C ; =0x00000C64
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _0207F716
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB54
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	mov r0, #0x13
	pop {r4, pc}
_0207F716:
	mov r0, #0x12
	pop {r4, pc}
	nop
_0207F71C: .word 0x00000C64
	thumb_func_end sub_0207F6E8

	thumb_func_start sub_0207F720
sub_0207F720: ; 0x0207F720
	push {r4, lr}
	add r4, r0, #0
	bl ov94_021E593C
	cmp r0, #1
	bne _0207F736
	add r0, r4, #0
	bl sub_0207CB6C
	mov r0, #0x11
	pop {r4, pc}
_0207F736:
	mov r0, #0x13
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207F720

	thumb_func_start sub_0207F73C
sub_0207F73C: ; 0x0207F73C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	add r0, r5, #0
	mov r1, #0x28
	mov r2, #0
	bl sub_0207DAD8
	mov r0, #3
	mov r1, #0xc
	bl ListMenuItems_ctor
	mov r1, #0x82
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #6
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x38
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #7
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x34
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #9
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x2c
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #8]
	add r1, sp, #4
	strb r2, [r1, #8]
	mov r3, #1
	strb r3, [r1, #9]
	mov r0, #3
	strb r0, [r1, #0xa]
	ldrb r6, [r1, #0xb]
	mov r0, #0xf
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r6, [r1, #0xb]
	mov r0, #0x30
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r6, [r1, #0xb]
	mov r0, #0xc0
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r1, [r1, #0xa]
	add r0, r5, #0
	bl sub_0207E54C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #4
	mov r2, #0
	mov r3, #0xc
	bl sub_0207E590
	ldr r1, _0207F7FC ; =0x00000824
	str r0, [r5, r1]
	mov r0, #0xf
	str r0, [r4]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207F7FC: .word 0x00000824
	thumb_func_end sub_0207F73C

	thumb_func_start sub_0207F800
sub_0207F800: ; 0x0207F800
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207F820 ; =0x00000654
	mov r1, #7
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207F820: .word 0x00000654
	thumb_func_end sub_0207F800

	thumb_func_start sub_0207F824
sub_0207F824: ; 0x0207F824
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0x2c
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207F864 ; =sub_0207F870
	ldr r1, _0207F868 ; =0x00000C58
	ldr r2, _0207F86C ; =sub_0207F8F4
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207F864: .word sub_0207F870
_0207F868: .word 0x00000C58
_0207F86C: .word sub_0207F8F4
	thumb_func_end sub_0207F824

	thumb_func_start sub_0207F870
sub_0207F870: ; 0x0207F870
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0207F8E0 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0207F8E4 ; =0x00000654
	ldr r1, _0207F8E8 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, _0207F8E4 ; =0x00000654
	mov r2, #0xc
	ldr r0, [r4, r0]
	ldr r0, [r0, #8]
	bl sub_02090FA8
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0207F8CA
	ldr r1, _0207F8E8 ; =0x00000C65
	mov r2, #0x30
	ldrb r3, [r4, r1]
	mov r0, #0
	add r5, r3, #0
	mul r5, r2
	ldr r3, _0207F8EC ; =0x00000834
	add r5, r4, r5
	strh r0, [r5, r3]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0
	bl sub_0207DAEC
	b _0207F8D4
_0207F8CA:
	add r0, r4, #0
	mov r1, #0x33
	mov r2, #0
	bl sub_0207DAEC
_0207F8D4:
	ldr r0, _0207F8F0 ; =0x00000C62
	mov r1, #0x14
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_0207F8E0: .word 0x04000050
_0207F8E4: .word 0x00000654
_0207F8E8: .word 0x00000C65
_0207F8EC: .word 0x00000834
_0207F8F0: .word 0x00000C62
	thumb_func_end sub_0207F870

	thumb_func_start sub_0207F8F4
sub_0207F8F4: ; 0x0207F8F4
	push {r4, lr}
	mov r1, #0x30
	mov r2, #0
	add r4, r0, #0
	bl sub_0207DAEC
	ldr r0, _0207F918 ; =sub_0207F924
	ldr r1, _0207F91C ; =0x00000C58
	ldr r2, _0207F920 ; =sub_0207F9CC
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r4, pc}
	nop
_0207F918: .word sub_0207F924
_0207F91C: .word 0x00000C58
_0207F920: .word sub_0207F9CC
	thumb_func_end sub_0207F8F4

	thumb_func_start sub_0207F924
sub_0207F924: ; 0x0207F924
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0207F9B8 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r1, _0207F9BC ; =0x00000C65
	ldr r0, _0207F9C0 ; =0x00000654
	ldrb r2, [r4, r1]
	mov r1, #0x30
	ldr r0, [r4, r0]
	mul r1, r2
	add r2, r4, r1
	ldr r1, _0207F9C4 ; =0x00000834
	ldr r0, [r0, #4]
	ldrh r1, [r2, r1]
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	cmp r0, #1
	bne _0207F9A2
	ldr r0, _0207F9C0 ; =0x00000654
	ldr r1, _0207F9BC ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0
	str r1, [sp]
	add r5, r0, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	bl sub_02071BC8
	add r0, r5, #0
	bl Mon_UpdateGiratinaForme
	ldr r1, _0207F9BC ; =0x00000C65
	mov r2, #0x30
	ldrb r3, [r4, r1]
	mov r0, #0
	add r5, r3, #0
	mul r5, r2
	ldr r3, _0207F9C4 ; =0x00000834
	add r5, r4, r5
	strh r0, [r5, r3]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	add r0, r4, #0
	mov r1, #0x34
	mov r2, #0
	bl sub_0207DAEC
	b _0207F9AC
_0207F9A2:
	add r0, r4, #0
	mov r1, #0x54
	mov r2, #0
	bl sub_0207DAEC
_0207F9AC:
	ldr r0, _0207F9C8 ; =0x00000C62
	mov r1, #0x14
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_0207F9B8: .word 0x04000050
_0207F9BC: .word 0x00000C65
_0207F9C0: .word 0x00000654
_0207F9C4: .word 0x00000834
_0207F9C8: .word 0x00000C62
	thumb_func_end sub_0207F924

	thumb_func_start sub_0207F9CC
sub_0207F9CC: ; 0x0207F9CC
	push {r4, lr}
	ldr r2, _0207FA00 ; =0x04000050
	mov r1, #0
	add r4, r0, #0
	strh r1, [r2]
	bl sub_02079224
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207FA04 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	mov r0, #1
	pop {r4, pc}
	nop
_0207FA00: .word 0x04000050
_0207FA04: .word 0x00000678
	thumb_func_end sub_0207F9CC

	thumb_func_start sub_0207FA08
sub_0207FA08: ; 0x0207FA08
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207FA38 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0207FA38: .word 0x00000678
	thumb_func_end sub_0207FA08

	thumb_func_start sub_0207FA3C
sub_0207FA3C: ; 0x0207FA3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207FA90 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207FA94 ; =0x0000083A
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207FA6C
	ldr r0, _0207FA98 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0207FA6C:
	add r0, r5, #0
	mov r1, #0xb3
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207FA9C ; =sub_0207FAA8
	ldr r1, _0207FAA0 ; =0x00000C58
	ldr r2, _0207FAA4 ; =sub_0207FAD4
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207FA90: .word 0x00000C65
_0207FA94: .word 0x0000083A
_0207FA98: .word 0x00000654
_0207FA9C: .word sub_0207FAA8
_0207FAA0: .word 0x00000C58
_0207FAA4: .word sub_0207FAD4
	thumb_func_end sub_0207FA3C

	thumb_func_start sub_0207FAA8
sub_0207FAA8: ; 0x0207FAA8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207FACC ; =0x00000654
	ldr r1, _0207FAD0 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	bl sub_02072894
	ldr r0, _0207FACC ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
	.balign 4, 0
_0207FACC: .word 0x00000654
_0207FAD0: .word 0x00000C65
	thumb_func_end sub_0207FAA8

	thumb_func_start sub_0207FAD4
sub_0207FAD4: ; 0x0207FAD4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207FB04 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207FB08 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	mov r0, #1
	pop {r4, pc}
	nop
_0207FB04: .word 0x04000050
_0207FB08: .word 0x00000678
	thumb_func_end sub_0207FAD4

	thumb_func_start sub_0207FB0C
sub_0207FB0C: ; 0x0207FB0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0207FBB8 ; =0x00000C63
	add r4, r1, #0
	ldrb r2, [r5, r0]
	mov r1, #0x40
	orr r1, r2
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	mov r2, #0x3f
	bic r1, r2
	add r2, r0, #2
	ldrb r3, [r5, r2]
	mov r2, #0x3f
	and r2, r3
	orr r1, r2
	strb r1, [r5, r0]
	ldr r0, _0207FBBC ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	ldr r0, _0207FBBC ; =0x00000678
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	ldr r0, _0207FBC0 ; =0x0000067C
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl sub_0200DD88
	ldr r0, _0207FBC4 ; =0x00000654
	ldr r1, _0207FBB8 ; =0x00000C63
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	add r0, #0x25
	ldrb r0, [r0]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207FBC0 ; =0x0000067C
	add r1, r1, #2
	ldr r0, [r5, r0]
	bl sub_020248F0
	ldr r0, _0207FBC0 ; =0x0000067C
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r1, _0207FBB8 ; =0x00000C63
	add r0, r5, #0
	ldrb r1, [r5, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0x1f
	mov r2, #1
	bl sub_0207DAC4
	mov r0, #0x1c
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207FBB8: .word 0x00000C63
_0207FBBC: .word 0x00000678
_0207FBC0: .word 0x0000067C
_0207FBC4: .word 0x00000654
	thumb_func_end sub_0207FB0C

	thumb_func_start sub_0207FBC8
sub_0207FBC8: ; 0x0207FBC8
	push {r4, lr}
	ldr r1, _0207FC10 ; =0x00000C63
	add r4, r0, #0
	ldrb r2, [r4, r1]
	mov r0, #0x40
	bic r2, r0
	strb r2, [r4, r1]
	ldr r0, _0207FC14 ; =0x0000067C
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _0207FC18 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #6
	bhs _0207FBEE
	add r0, r4, #0
	bl sub_0207A7F4
_0207FBEE:
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r1, _0207FC10 ; =0x00000C63
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	pop {r4, pc}
	.balign 4, 0
_0207FC10: .word 0x00000C63
_0207FC14: .word 0x0000067C
_0207FC18: .word 0x00000C65
	thumb_func_end sub_0207FBC8

	thumb_func_start sub_0207FC1C
sub_0207FC1C: ; 0x0207FC1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r2, _0207FD44 ; =0x00000C65
	add r6, r0, #0
	ldrb r1, [r6, r2]
	add r0, r2, #0
	sub r0, #0x19
	strb r1, [r6, r0]
	sub r0, r2, #2
	ldrb r0, [r6, r0]
	add r3, r2, #0
	sub r3, #0x13
	lsl r0, r0, #0x1a
	lsr r1, r0, #0x1a
	add r0, r2, #0
	sub r0, #0x18
	strb r1, [r6, r0]
	add r0, r2, #0
	mov r1, #1
	sub r0, #0x15
	strb r1, [r6, r0]
	mov r0, #0
	strb r0, [r6, r3]
	add r3, r2, #0
	sub r3, #0x14
	strb r0, [r6, r3]
	add r3, r2, #0
	sub r3, #0x19
	ldrb r3, [r6, r3]
	tst r3, r1
	beq _0207FC60
	sub r2, #0x17
	strb r1, [r6, r2]
	b _0207FC64
_0207FC60:
	sub r2, #0x17
	strb r0, [r6, r2]
_0207FC64:
	ldr r0, _0207FD48 ; =0x00000C4D
	mov r1, #1
	ldrb r2, [r6, r0]
	tst r2, r1
	beq _0207FC70
	b _0207FC72
_0207FC70:
	mov r1, #0
_0207FC72:
	add r0, r0, #2
	strb r1, [r6, r0]
	ldr r0, [r6]
	mov r1, #2
	bl GetBgTilemapBuffer
	str r0, [sp, #0x14]
	ldr r0, [r6]
	mov r1, #1
	bl GetBgTilemapBuffer
	ldr r1, _0207FD4C ; =0x00000C4C
	str r0, [sp, #0x10]
	ldrb r3, [r6, r1]
	add r1, r1, #1
	mov r2, #0x30
	add r0, r3, #0
	ldrb r3, [r6, r1]
	mul r0, r2
	mov r4, #0
	add r1, r3, #0
	add r3, r6, r0
	ldr r0, _0207FD50 ; =0x0000083D
	mul r1, r2
	ldrsb r2, [r3, r0]
	str r2, [sp, #0xc]
	sub r2, r0, #1
	ldrsb r2, [r3, r2]
	str r2, [sp, #8]
	add r2, r6, r1
	ldrsb r1, [r2, r0]
	sub r0, r0, #1
	ldrsb r0, [r2, r0]
	str r1, [sp, #4]
	str r0, [sp]
	ldr r0, _0207FD54 ; =0x0000094C
	add r0, r6, r0
	str r0, [sp, #0x18]
	ldr r0, _0207FD58 ; =0x00000ACC
	add r0, r6, r0
	str r0, [sp, #0x1c]
	ldr r0, _0207FD5C ; =0x00000A0C
	add r0, r6, r0
	str r0, [sp, #0x20]
	ldr r0, _0207FD60 ; =0x00000B8C
	add r0, r6, r0
	str r0, [sp, #0x24]
_0207FCD0:
	ldr r0, [sp, #0xc]
	lsl r5, r4, #5
	add r0, r0, r4
	lsl r1, r0, #5
	ldr r0, [sp, #8]
	mov r2, #0x20
	add r0, r0, r1
	lsl r7, r0, #1
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r0, r0, r5
	add r1, r1, r7
	bl memcpy
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	add r0, r0, r5
	add r1, r1, r7
	mov r2, #0x20
	bl memcpy
	ldr r0, [sp, #4]
	mov r2, #0x20
	add r0, r0, r4
	lsl r1, r0, #5
	ldr r0, [sp]
	add r0, r0, r1
	lsl r7, r0, #1
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x14]
	add r0, r0, r5
	add r1, r1, r7
	bl memcpy
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x10]
	add r0, r0, r5
	add r1, r1, r7
	mov r2, #0x20
	bl memcpy
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _0207FCD0
	ldr r0, _0207FD64 ; =0x00000678
	mov r1, #0
	ldr r0, [r6, r0]
	bl sub_02024830
	ldr r0, _0207FD68 ; =0x0000067C
	mov r1, #0
	ldr r0, [r6, r0]
	bl sub_02024830
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207FD44: .word 0x00000C65
_0207FD48: .word 0x00000C4D
_0207FD4C: .word 0x00000C4C
_0207FD50: .word 0x0000083D
_0207FD54: .word 0x0000094C
_0207FD58: .word 0x00000ACC
_0207FD5C: .word 0x00000A0C
_0207FD60: .word 0x00000B8C
_0207FD64: .word 0x00000678
_0207FD68: .word 0x0000067C
	thumb_func_end sub_0207FC1C

	thumb_func_start sub_0207FD6C
sub_0207FD6C: ; 0x0207FD6C
	push {r3, r4, r5, lr}
	ldr r1, _0207FEC4 ; =0x0000094C
	add r5, r0, #0
	ldr r2, _0207FEC8 ; =0x00000305
	add r4, r5, r1
	ldrb r1, [r4, r2]
	cmp r1, #4
	bls _0207FD7E
	b _0207FEBE
_0207FD7E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0207FD8A: ; jump table
	.short _0207FD94 - _0207FD8A - 2 ; case 0
	.short _0207FDAA - _0207FD8A - 2 ; case 1
	.short _0207FDFA - _0207FD8A - 2 ; case 2
	.short _0207FE0C - _0207FD8A - 2 ; case 3
	.short _0207FE6A - _0207FD8A - 2 ; case 4
_0207FD94:
	ldr r0, _0207FECC ; =0x0000069F
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _0207FEC8 ; =0x00000305
	mov r1, #1
	strb r1, [r4, r0]
	b _0207FEBE
_0207FDAA:
	add r1, r2, #1
	ldrb r1, [r4, r1]
	add r3, r1, #1
	add r1, r2, #1
	strb r3, [r4, r1]
	mov r1, #0
	bl sub_0207FEE8
	add r0, r5, #0
	mov r1, #1
	bl sub_0207FEE8
	ldr r2, _0207FED0 ; =0x00000302
	add r0, r5, #0
	ldrb r2, [r4, r2]
	mov r1, #0
	bl sub_02080040
	ldr r2, _0207FED4 ; =0x00000303
	add r0, r5, #0
	ldrb r2, [r4, r2]
	mov r1, #1
	bl sub_02080040
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0207FED8 ; =0x00000306
	ldrb r1, [r4, r0]
	cmp r1, #0x10
	bne _0207FEBE
	mov r1, #2
	sub r0, r0, #1
	strb r1, [r4, r0]
	b _0207FEBE
_0207FDFA:
	bl sub_02080198
	ldr r0, _0207FECC ; =0x0000069F
	bl PlaySE
	ldr r0, _0207FEC8 ; =0x00000305
	mov r1, #3
	strb r1, [r4, r0]
	b _0207FEBE
_0207FE0C:
	add r1, r2, #1
	ldrb r1, [r4, r1]
	sub r3, r1, #1
	add r1, r2, #1
	strb r3, [r4, r1]
	mov r1, #0
	bl sub_0207FEE8
	add r0, r5, #0
	mov r1, #1
	bl sub_0207FEE8
	ldr r2, _0207FED0 ; =0x00000302
	add r0, r5, #0
	ldrb r3, [r4, r2]
	mov r2, #1
	mov r1, #0
	eor r2, r3
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_02080040
	ldr r2, _0207FED4 ; =0x00000303
	mov r1, #1
	ldrb r2, [r4, r2]
	add r0, r5, #0
	eor r2, r1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_02080040
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0207FED8 ; =0x00000306
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _0207FEBE
	mov r1, #4
	sub r0, r0, #1
	strb r1, [r4, r0]
	b _0207FEBE
_0207FE6A:
	ldr r0, _0207FEDC ; =0x00000654
	sub r1, r2, #5
	ldr r0, [r5, r0]
	sub r2, r2, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldr r0, [r0]
	bl sub_020747BC
	ldr r0, _0207FEE0 ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024830
	mov r0, #0xc1
	mov r1, #0
	lsl r0, r0, #2
	strb r1, [r4, r0]
	ldr r1, _0207FEE4 ; =0x00000C63
	mov r0, #0x40
	ldrb r2, [r5, r1]
	bic r2, r0
	strb r2, [r5, r1]
	add r1, r1, #2
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207A7F4
	ldr r1, _0207FEE4 ; =0x00000C63
	add r0, r5, #0
	ldrb r1, [r5, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	add r0, r5, #0
	mov r1, #0x1d
	mov r2, #0
	bl sub_0207DAC4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0207FEBE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0207FEC4: .word 0x0000094C
_0207FEC8: .word 0x00000305
_0207FECC: .word 0x0000069F
_0207FED0: .word 0x00000302
_0207FED4: .word 0x00000303
_0207FED8: .word 0x00000306
_0207FEDC: .word 0x00000654
_0207FEE0: .word 0x00000678
_0207FEE4: .word 0x00000C63
	thumb_func_end sub_0207FD6C

	thumb_func_start sub_0207FEE8
sub_0207FEE8: ; 0x0207FEE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, _02080030 ; =0x0000094C
	add r7, r1, #0
	add r4, r5, r0
	mov r0, #3
	add r1, r4, r7
	lsl r0, r0, #8
	ldrb r1, [r1, r0]
	mov r0, #0x30
	mul r0, r1
	ldr r1, _02080034 ; =0x0000083C
	add r2, r5, r0
	ldrsb r0, [r2, r1]
	str r0, [sp, #0x28]
	add r0, r1, #1
	ldrb r6, [r2, r0]
	ldr r0, [sp, #0x28]
	mov r1, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	str r6, [sp]
	str r1, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5]
	ldr r3, [sp, #0x1c]
	mov r1, #2
	mov r2, #0
	bl FillBgTilemapRect
	str r6, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5]
	ldr r3, [sp, #0x1c]
	mov r1, #1
	mov r2, #0
	bl FillBgTilemapRect
	ldr r1, _02080038 ; =0x00000302
	add r0, r4, r7
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _0207FFB8
	add r0, r1, #4
	ldrb r2, [r4, r0]
	mov r0, #0xc0
	mul r0, r7
	str r0, [sp, #0x24]
	mov r0, #0x10
	sub r1, r0, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	ldr r3, [sp, #0x24]
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	add r3, r4, r3
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5]
	ldr r2, [sp, #0x1c]
	mov r1, #2
	add r3, r6, #0
	bl sub_0201C4EC
	ldr r0, _0208003C ; =0x00000306
	ldrb r2, [r4, r0]
	mov r0, #0x10
	sub r1, r0, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #6
	lsl r3, r1, #6
	add r4, r4, r3
	ldr r3, [sp, #0x24]
	str r1, [sp, #4]
	add r3, r4, r3
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5]
	ldr r2, [sp, #0x1c]
	mov r1, #1
	add r3, r6, #0
	bl sub_0201C4EC
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_0207FFB8:
	mov r0, #0xc0
	mul r0, r7
	str r0, [sp, #0x20]
	add r0, r1, #4
	ldrb r2, [r4, r0]
	mov r0, #0x10
	ldr r3, [sp, #0x20]
	sub r1, r0, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	add r3, r4, r3
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r3, [sp, #0x28]
	ldr r0, [r5]
	add r2, r3, r2
	lsl r2, r2, #0x18
	mov r1, #2
	lsr r2, r2, #0x18
	add r3, r6, #0
	bl sub_0201C4EC
	ldr r0, _0208003C ; =0x00000306
	ldrb r2, [r4, r0]
	mov r0, #0x10
	sub r1, r0, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #6
	lsl r3, r1, #6
	add r4, r4, r3
	ldr r3, [sp, #0x20]
	str r1, [sp, #4]
	add r3, r4, r3
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r3, [sp, #0x28]
	ldr r0, [r5]
	add r2, r3, r2
	lsl r2, r2, #0x18
	mov r1, #1
	lsr r2, r2, #0x18
	add r3, r6, #0
	bl sub_0201C4EC
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02080030: .word 0x0000094C
_02080034: .word 0x0000083C
_02080038: .word 0x00000302
_0208003C: .word 0x00000306
	thumb_func_end sub_0207FEE8

	thumb_func_start sub_02080040
sub_02080040: ; 0x02080040
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02080184 ; =0x0000094C
	add r4, r1, #0
	add r1, r5, r0
	mov r0, #3
	lsl r0, r0, #8
	add r6, r1, r0
	ldrb r0, [r6, r4]
	add r7, r2, #0
	add r2, sp, #0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r1, #2
	bl sub_0200DE00
	cmp r7, #0
	ldr r0, _02080188 ; =0x0000083E
	bne _020800A8
	ldrb r3, [r6, r4]
	mov r7, #0x30
	add r2, r5, r0
	add r1, r3, #0
	mul r1, r7
	ldrsh r3, [r2, r1]
	sub r3, #8
	strh r3, [r2, r1]
	ldrb r3, [r6, r4]
	add r1, r0, #4
	add r2, r5, r1
	add r1, r3, #0
	mul r1, r7
	ldrsh r3, [r2, r1]
	add r0, #8
	add r0, r5, r0
	sub r3, #8
	strh r3, [r2, r1]
	ldrb r1, [r6, r4]
	add r2, r1, #0
	mul r2, r7
	ldrsh r1, [r0, r2]
	sub r1, #8
	strh r1, [r0, r2]
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	sub r0, #8
	b _020800E0
_020800A8:
	ldrb r3, [r6, r4]
	mov r7, #0x30
	add r2, r5, r0
	add r1, r3, #0
	mul r1, r7
	ldrsh r3, [r2, r1]
	add r3, #8
	strh r3, [r2, r1]
	ldrb r3, [r6, r4]
	add r1, r0, #4
	add r2, r5, r1
	add r1, r3, #0
	mul r1, r7
	ldrsh r3, [r2, r1]
	add r0, #8
	add r0, r5, r0
	add r3, #8
	strh r3, [r2, r1]
	ldrb r1, [r6, r4]
	add r2, r1, #0
	mul r2, r7
	ldrsh r1, [r0, r2]
	add r1, #8
	strh r1, [r0, r2]
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r0, #8
_020800E0:
	strh r0, [r1, #2]
	ldrb r1, [r6, r4]
	mov r0, #0x30
	ldr r2, _0208018C ; =0x0000084C
	mul r0, r1
	add r3, r5, r0
	add r1, r2, #0
	ldr r0, [r3, r2]
	sub r1, #0xe
	sub r2, #0xc
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl sub_0200DD88
	ldrb r2, [r6, r4]
	mov r0, #0x30
	ldr r3, _02080190 ; =0x00000842
	add r1, r2, #0
	add r2, #0xa
	mul r1, r0
	lsl r0, r2, #2
	add r2, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r3]
	add r3, r3, #2
	ldrsh r2, [r2, r3]
	bl sub_0200DD88
	ldrb r2, [r6, r4]
	mov r0, #0x30
	ldr r3, _02080194 ; =0x00000846
	add r1, r2, #0
	add r2, #0x10
	mul r1, r0
	lsl r0, r2, #2
	add r2, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r3]
	add r3, r3, #2
	ldrsh r2, [r2, r3]
	bl sub_0200DD88
	ldrb r2, [r6, r4]
	mov r0, #0x30
	ldr r3, _02080194 ; =0x00000846
	add r1, r2, #0
	add r2, #0x16
	mul r1, r0
	lsl r0, r2, #2
	add r2, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r3]
	add r3, r3, #2
	ldrsh r2, [r2, r3]
	add r1, #8
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl sub_0200DD88
	ldrb r0, [r6, r4]
	add r3, sp, #0
	mov r2, #0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl sub_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02080184: .word 0x0000094C
_02080188: .word 0x0000083E
_0208018C: .word 0x0000084C
_02080190: .word 0x00000842
_02080194: .word 0x00000846
	thumb_func_end sub_02080040

	thumb_func_start sub_02080198
sub_02080198: ; 0x02080198
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _02080464 ; =0x0000094C
	mov r1, #0x30
	add r4, r5, r0
	mov r0, #0xc
	bl AllocFromHeap
	add r7, r0, #0
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r0, #0x30
	add r3, r7, #0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02080468 ; =0x00000828
	mov r2, #6
	add r6, r1, r0
_020801C0:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020801C0
	mov r1, #3
	lsl r1, r1, #8
	ldrb r0, [r4, r1]
	add r1, r1, #1
	ldrb r1, [r4, r1]
	mov r2, #0x30
	add r3, r0, #0
	mul r3, r2
	mul r2, r1
	ldr r1, _02080468 ; =0x00000828
	add r0, r5, r3
	add r2, r5, r2
	add r6, r2, r1
	add r3, r0, r1
	mov r2, #6
_020801E6:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020801E6
	ldr r0, _0208046C ; =0x00000301
	add r6, r7, #0
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mov r2, #6
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02080468 ; =0x00000828
	add r3, r1, r0
_02080200:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02080200
	mov r0, #0xc
	add r1, r7, #0
	bl FreeToHeapExplicit
	mov r1, #3
	lsl r1, r1, #8
	ldrb r3, [r4, r1]
	ldr r0, _02080470 ; =0x0000083E
	add r2, r5, r0
	mov r0, #0x30
	add r7, r3, #0
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	mul r6, r0
	ldr r3, _02080470 ; =0x0000083E
	add r6, r5, r6
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, [sp]
	ldr r2, _02080470 ; =0x0000083E
	strh r3, [r6, r2]
	add r2, r2, #2
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #4]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #2
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #2
	ldr r3, [sp, #4]
	strh r3, [r2, r6]
	ldr r2, _02080470 ; =0x0000083E
	add r2, r2, #4
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #8]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #4
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #4
	ldr r3, [sp, #8]
	strh r3, [r2, r6]
	ldr r2, _02080470 ; =0x0000083E
	add r2, r2, #6
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #0xc]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #6
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #6
	ldr r3, [sp, #0xc]
	strh r3, [r2, r6]
	ldrb r3, [r4, r1]
	ldr r2, _02080470 ; =0x0000083E
	add r2, #8
	add r7, r3, #0
	add r2, r5, r2
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp, #0x10]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	ldr r3, _02080470 ; =0x0000083E
	mul r6, r0
	add r6, r5, r6
	add r3, #8
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	ldr r2, [sp, #0x10]
	add r3, #8
	strh r2, [r6, r3]
	ldrb r3, [r4, r1]
	ldr r2, _02080470 ; =0x0000083E
	add r2, #0xa
	add r7, r3, #0
	add r2, r5, r2
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp, #0x14]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	ldr r3, _02080470 ; =0x0000083E
	mul r6, r0
	add r6, r5, r6
	add r3, #0xa
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	ldr r2, [sp, #0x14]
	add r3, #0xa
	strh r2, [r6, r3]
	ldr r2, _02080470 ; =0x0000083E
	sub r2, r2, #2
	add r6, r5, r2
	ldrb r2, [r4, r1]
	add r3, r2, #0
	mul r3, r0
	add r3, r6, r3
	mov r2, #0
	ldrsb r7, [r3, r2]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	sub r6, r6, #2
	ldrsb r2, [r2, r6]
	strb r2, [r3]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	sub r3, r3, #2
	strb r7, [r2, r3]
	ldr r2, _02080470 ; =0x0000083E
	sub r2, r2, #1
	add r6, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsb r2, [r6, r7]
	mov ip, r2
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	ldr r2, _02080470 ; =0x0000083E
	mul r3, r0
	add r3, r5, r3
	sub r2, r2, #1
	ldrsb r2, [r3, r2]
	strb r2, [r6, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	mul r0, r2
	ldr r2, _02080470 ; =0x0000083E
	add r0, r5, r0
	sub r3, r2, #1
	mov r2, ip
	strb r2, [r0, r3]
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0207D5DC
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl sub_0207D5DC
	mov r1, #3
	lsl r1, r1, #8
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0207D6D8
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl sub_0207D6D8
	add r0, r5, #0
	mov r1, #0
	bl sub_0208047C
	add r0, r5, #0
	mov r1, #1
	bl sub_0208047C
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r2, #0x30
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080474 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	ldr r0, _0208046C ; =0x00000301
	mov r2, #0x30
	ldrb r1, [r4, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080474 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r2, #0x30
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080478 ; =0x00000834
	ldrh r2, [r3, r2]
	bl sub_0207F004
	ldr r0, _0208046C ; =0x00000301
	mov r2, #0x30
	ldrb r1, [r4, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080478 ; =0x00000834
	ldrh r2, [r3, r2]
	bl sub_0207F004
	mov r1, #3
	lsl r1, r1, #8
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0207F0C8
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl sub_0207F0C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02080464: .word 0x0000094C
_02080468: .word 0x00000828
_0208046C: .word 0x00000301
_02080470: .word 0x0000083E
_02080474: .word 0x00000836
_02080478: .word 0x00000834
	thumb_func_end sub_02080198

	thumb_func_start sub_0208047C
sub_0208047C: ; 0x0208047C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r1, _02080500 ; =0x0000094C
	add r6, r0, #0
	add r4, r6, r1
	mov r1, #0xc0
	mul r1, r7
	add r5, r4, r1
	bl sub_0207A16C
	add r3, r0, #0
	mov r0, #3
	add r1, r4, r7
	lsl r0, r0, #8
	ldrb r1, [r1, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r6, r0
	ldr r0, _02080504 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _020804D2
	mov r3, #0xf
	mov r1, #0
	lsl r3, r3, #0xc
	mov r4, #0x4b
_020804B0:
	lsl r0, r1, #1
	add r2, r5, r0
	add r2, #0x6c
	ldrh r2, [r2]
	add r0, r5, r0
	add r0, #0x6c
	and r2, r3
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	orr r2, r4
	strh r2, [r0]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #9
	blo _020804B0
	pop {r3, r4, r5, r6, r7, pc}
_020804D2:
	mov r6, #0xf
	ldr r0, _02080508 ; =0x00000FFF
	mov r4, #0
	lsl r6, r6, #0xc
_020804DA:
	lsl r2, r4, #1
	add r1, r5, r2
	add r1, #0x6c
	ldrh r1, [r1]
	ldrh r7, [r3, r2]
	and r1, r6
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	and r7, r0
	orr r7, r1
	add r1, r5, r2
	add r1, #0x6c
	strh r7, [r1]
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #9
	blo _020804DA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02080500: .word 0x0000094C
_02080504: .word 0x00000838
_02080508: .word 0x00000FFF
	thumb_func_end sub_0208047C

	thumb_func_start sub_0208050C
sub_0208050C: ; 0x0208050C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	add r6, r1, #0
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _02080600 ; =0x00000654
	mov r4, #0
	ldr r0, [r5, r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	beq _0208059E
_02080542:
	add r2, r0, r4
	add r2, #0x30
	ldrb r2, [r2]
	cmp r2, #0
	bne _02080594
	ldr r1, _02080604 ; =0x00000C65
	add r0, r0, r4
	ldrb r2, [r5, r1]
	add r0, #0x30
	add r2, r2, #1
	strb r2, [r0]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D8EC
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080608 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	ldr r0, _02080600 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	sub r0, r0, #1
	cmp r4, r0
	bne _0208058E
	add r0, r5, #0
	mov r1, #6
	bl sub_0207AB84
_0208058E:
	mov r0, #1
	str r0, [r6]
	pop {r4, r5, r6, pc}
_02080594:
	add r2, r4, #1
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	cmp r4, r1
	blo _02080542
_0208059E:
	cmp r1, #5
	bhi _020805F4
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020805AE: ; jump table
	.short _020805F4 - _020805AE - 2 ; case 0
	.short _020805BA - _020805AE - 2 ; case 1
	.short _020805C6 - _020805AE - 2 ; case 2
	.short _020805D2 - _020805AE - 2 ; case 3
	.short _020805DE - _020805AE - 2 ; case 4
	.short _020805EA - _020805AE - 2 ; case 5
_020805BA:
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805C6:
	add r0, r5, #0
	mov r1, #0x63
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805D2:
	add r0, r5, #0
	mov r1, #0x71
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805DE:
	add r0, r5, #0
	mov r1, #0x72
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805EA:
	add r0, r5, #0
	mov r1, #0x73
	mov r2, #1
	bl sub_0207DAEC
_020805F4:
	ldr r0, _0208060C ; =0x00000C62
	mov r1, #0x17
	strb r1, [r5, r0]
	mov r0, #0x18
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02080600: .word 0x00000654
_02080604: .word 0x00000C65
_02080608: .word 0x00000678
_0208060C: .word 0x00000C62
	thumb_func_end sub_0208050C

	thumb_func_start sub_02080610
sub_02080610: ; 0x02080610
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080638 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02080638: .word 0x00000678
	thumb_func_end sub_02080610

	thumb_func_start sub_0208063C
sub_0208063C: ; 0x0208063C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	mov r1, #0
	add r5, r0, #0
	bl sub_02079224
	ldr r0, _02080718 ; =0x00000654
	mov r4, #0
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x1c
	beq _020806C2
	ldr r0, _0208071C ; =0x00000C65
	ldrb r0, [r5, r0]
	add r0, r0, #1
_02080660:
	add r3, r1, r4
	add r3, #0x30
	ldrb r3, [r3]
	cmp r0, r3
	bne _020806B8
	add r0, r1, r4
	mov r2, #0
	add r0, #0x30
	strb r2, [r0]
	ldr r0, _02080718 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r6, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	sub r0, r0, #1
	cmp r4, r0
	bge _020806C2
	ldr r0, _02080718 ; =0x00000654
	add r1, r0, #0
_0208068A:
	add r3, r6, r4
	add r3, #0x31
	ldrb r3, [r3]
	add r6, r6, r4
	add r6, #0x30
	strb r3, [r6]
	ldr r3, [r5, r0]
	add r3, r3, r4
	add r3, #0x31
	strb r2, [r3]
	add r3, r4, #1
	lsl r3, r3, #0x18
	ldr r6, [r5, r1]
	lsr r4, r3, #0x18
	add r3, r6, #0
	add r3, #0x36
	ldrb r3, [r3]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	sub r3, r3, #1
	cmp r4, r3
	blt _0208068A
	b _020806C2
_020806B8:
	add r3, r4, #1
	lsl r3, r3, #0x18
	lsr r4, r3, #0x18
	cmp r4, r2
	blo _02080660
_020806C2:
	ldr r6, _02080720 ; =0x00000855
	mov r4, #0
	mov r7, #0x30
_020806C8:
	add r0, r4, #0
	mul r0, r7
	add r0, r5, r0
	ldrb r0, [r0, r6]
	cmp r0, #0
	beq _020806DC
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D8EC
_020806DC:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _020806C8
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080724 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	ldr r0, [sp]
	mov r1, #1
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02080718: .word 0x00000654
_0208071C: .word 0x00000C65
_02080720: .word 0x00000855
_02080724: .word 0x00000678
	thumb_func_end sub_0208063C

	thumb_func_start sub_02080728
sub_02080728: ; 0x02080728
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080744 ; =0x00000654
	mov r2, #0
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080744: .word 0x00000654
	thumb_func_end sub_02080728

	thumb_func_start sub_02080748
sub_02080748: ; 0x02080748
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080764 ; =0x00000654
	mov r2, #0
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080764: .word 0x00000654
	thumb_func_end sub_02080748

	thumb_func_start sub_02080768
sub_02080768: ; 0x02080768
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080784 ; =0x00000654
	mov r2, #1
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080784: .word 0x00000654
	thumb_func_end sub_02080768

	thumb_func_start sub_02080788
sub_02080788: ; 0x02080788
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_020807AC
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02080788

	thumb_func_start sub_020807AC
sub_020807AC: ; 0x020807AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02080828 ; =0x00000654
	ldr r1, _0208082C ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa2
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _020807F2
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x76
	bl ReadMsgDataIntoString
	ldr r0, _0208082C ; =0x00000C65
	ldrb r0, [r4, r0]
	add r0, #0x16
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024830
	b _02080808
_020807F2:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x77
	bl ReadMsgDataIntoString
	ldr r0, _0208082C ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
_02080808:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02080828 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02080830 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r4, pc}
	.balign 4, 0
_02080828: .word 0x00000654
_0208082C: .word 0x00000C65
_02080830: .word 0x00000C62
	thumb_func_end sub_020807AC

	thumb_func_start sub_02080834
sub_02080834: ; 0x02080834
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r4, r0, #0
	ldr r1, _020808C8 ; =0x00000654
	mov r0, #1
	ldr r1, [r4, r1]
	add r1, #0x27
	ldrb r1, [r1]
	sub r1, #0xb
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02067DF4
	add r1, r0, #0
	beq _0208085C
	ldr r0, _020808C8 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x18]
	blx r1
	b _0208085E
_0208085C:
	mov r0, #1
_0208085E:
	cmp r0, #5
	bhi _0208089C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208086E: ; jump table
	.short _0208087A - _0208086E - 2 ; case 0
	.short _0208088A - _0208086E - 2 ; case 1
	.short _0208088E - _0208086E - 2 ; case 2
	.short _02080892 - _0208086E - 2 ; case 3
	.short _02080896 - _0208086E - 2 ; case 4
	.short _0208089A - _0208086E - 2 ; case 5
_0208087A:
	add r0, r4, #0
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x20
	str r0, [r6]
	pop {r4, r5, r6, pc}
_0208088A:
	mov r5, #0x65
	b _0208089C
_0208088E:
	mov r5, #0x4d
	b _0208089C
_02080892:
	mov r5, #0xb4
	b _0208089C
_02080896:
	mov r5, #0x64
	b _0208089C
_0208089A:
	mov r5, #0xb5
_0208089C:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020808CC ; =0x00000C62
	mov r1, #3
	strb r1, [r4, r0]
	mov r0, #0x18
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020808C8: .word 0x00000654
_020808CC: .word 0x00000C62
	thumb_func_end sub_02080834

	thumb_func_start sub_020808D0
sub_020808D0: ; 0x020808D0
	ldr r2, _020808E0 ; =0x00000654
	mov r3, #0xb
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020808E4 ; =sub_02080834
	bx r3
	nop
_020808E0: .word 0x00000654
_020808E4: .word sub_02080834
	thumb_func_end sub_020808D0

	thumb_func_start sub_020808E8
sub_020808E8: ; 0x020808E8
	ldr r2, _020808F8 ; =0x00000654
	mov r3, #0xf
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020808FC ; =sub_02080834
	bx r3
	nop
_020808F8: .word 0x00000654
_020808FC: .word sub_02080834
	thumb_func_end sub_020808E8

	thumb_func_start sub_02080900
sub_02080900: ; 0x02080900
	ldr r2, _02080910 ; =0x00000654
	mov r3, #0xe
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080914 ; =sub_02080834
	bx r3
	nop
_02080910: .word 0x00000654
_02080914: .word sub_02080834
	thumb_func_end sub_02080900

	thumb_func_start sub_02080918
sub_02080918: ; 0x02080918
	ldr r2, _02080928 ; =0x00000654
	mov r3, #0xd
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208092C ; =sub_02080834
	bx r3
	nop
_02080928: .word 0x00000654
_0208092C: .word sub_02080834
	thumb_func_end sub_02080918

	thumb_func_start sub_02080930
sub_02080930: ; 0x02080930
	ldr r2, _02080940 ; =0x00000654
	mov r3, #0x11
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080944 ; =sub_02080834
	bx r3
	nop
_02080940: .word 0x00000654
_02080944: .word sub_02080834
	thumb_func_end sub_02080930

	thumb_func_start sub_02080948
sub_02080948: ; 0x02080948
	ldr r2, _02080958 ; =0x00000654
	mov r3, #0xc
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208095C ; =sub_02080834
	bx r3
	nop
_02080958: .word 0x00000654
_0208095C: .word sub_02080834
	thumb_func_end sub_02080948

	thumb_func_start sub_02080960
sub_02080960: ; 0x02080960
	ldr r2, _02080970 ; =0x00000654
	mov r3, #0x10
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080974 ; =sub_02080834
	bx r3
	nop
_02080970: .word 0x00000654
_02080974: .word sub_02080834
	thumb_func_end sub_02080960

	thumb_func_start sub_02080978
sub_02080978: ; 0x02080978
	ldr r2, _02080988 ; =0x00000654
	mov r3, #0x17
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208098C ; =sub_02080834
	bx r3
	nop
_02080988: .word 0x00000654
_0208098C: .word sub_02080834
	thumb_func_end sub_02080978

	thumb_func_start sub_02080990
sub_02080990: ; 0x02080990
	ldr r2, _020809A0 ; =0x00000654
	mov r3, #0x12
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809A4 ; =sub_02080834
	bx r3
	nop
_020809A0: .word 0x00000654
_020809A4: .word sub_02080834
	thumb_func_end sub_02080990

	thumb_func_start sub_020809A8
sub_020809A8: ; 0x020809A8
	ldr r2, _020809B8 ; =0x00000654
	mov r3, #0x13
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809BC ; =sub_02080834
	bx r3
	nop
_020809B8: .word 0x00000654
_020809BC: .word sub_02080834
	thumb_func_end sub_020809A8

	thumb_func_start sub_020809C0
sub_020809C0: ; 0x020809C0
	ldr r2, _020809D0 ; =0x00000654
	mov r3, #0x14
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809D4 ; =sub_02080834
	bx r3
	nop
_020809D0: .word 0x00000654
_020809D4: .word sub_02080834
	thumb_func_end sub_020809C0

	thumb_func_start sub_020809D8
sub_020809D8: ; 0x020809D8
	ldr r2, _020809E8 ; =0x00000654
	mov r3, #0x15
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809EC ; =sub_02080834
	bx r3
	nop
_020809E8: .word 0x00000654
_020809EC: .word sub_02080834
	thumb_func_end sub_020809D8

	thumb_func_start sub_020809F0
sub_020809F0: ; 0x020809F0
	ldr r2, _02080A00 ; =0x00000654
	mov r3, #0x16
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080A04 ; =sub_02080834
	bx r3
	nop
_02080A00: .word 0x00000654
_02080A04: .word sub_02080834
	thumb_func_end sub_020809F0

	thumb_func_start sub_02080A08
sub_02080A08: ; 0x02080A08
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_02080A58
	str r0, [r5]
	cmp r0, #0x1e
	bne _02080A1E
	ldr r0, _02080A20 ; =0x00000C6E
	mov r1, #0xe
	strh r1, [r4, r0]
_02080A1E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02080A20: .word 0x00000C6E
	thumb_func_end sub_02080A08

	thumb_func_start sub_02080A24
sub_02080A24: ; 0x02080A24
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_02080A58
	str r0, [r5]
	cmp r0, #0x1e
	bne _02080A3A
	ldr r0, _02080A3C ; =0x00000C6E
	mov r1, #0xf
	strh r1, [r4, r0]
_02080A3A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02080A3C: .word 0x00000C6E
	thumb_func_end sub_02080A24

	thumb_func_start sub_02080A40
sub_02080A40: ; 0x02080A40
	ldr r2, _02080A50 ; =0x00000654
	mov r3, #0x18
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080A54 ; =sub_02080834
	bx r3
	nop
_02080A50: .word 0x00000654
_02080A54: .word sub_02080834
	thumb_func_end sub_02080A40

	thumb_func_start sub_02080A58
sub_02080A58: ; 0x02080A58
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _02080B50 ; =0x00000C65
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	mov r0, #0x83
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	mov r1, #5
	bl _s32_div_f
	ldr r1, _02080B54 ; =0x00000C68
	strh r0, [r4, r1]
	sub r0, r1, #3
	ldrb r2, [r4, r0]
	mov r0, #0x30
	mul r0, r2
	add r2, r4, r0
	ldr r0, _02080B58 ; =0x0000082E
	ldrh r2, [r2, r0]
	ldrh r0, [r4, r1]
	cmp r2, r0
	bhi _02080AB8
	add r0, r4, #0
	mov r1, #0x7f
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02080B5C ; =0x00000C62
	mov r1, #3
	strb r1, [r4, r0]
	add sp, #4
	mov r0, #0x18
	pop {r3, r4, pc}
_02080AB8:
	sub r0, r1, #5
	ldrb r2, [r4, r0]
	mov r0, #0x40
	orr r2, r0
	sub r0, r1, #5
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	mov r2, #0x3f
	bic r0, r2
	sub r2, r1, #3
	ldrb r3, [r4, r2]
	mov r2, #0x3f
	and r2, r3
	orr r2, r0
	sub r0, r1, #5
	strb r2, [r4, r0]
	ldr r0, _02080B60 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _02080B60 ; =0x00000678
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	ldr r0, _02080B64 ; =0x0000067C
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, r0]
	bl sub_0200DD88
	ldr r0, _02080B68 ; =0x00000654
	ldr r1, _02080B6C ; =0x00000C63
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	add r0, #0x25
	ldrb r0, [r0]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _02080B64 ; =0x0000067C
	add r1, r1, #2
	ldr r0, [r4, r0]
	bl sub_020248F0
	ldr r0, _02080B64 ; =0x0000067C
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r1, _02080B6C ; =0x00000C63
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080B70 ; =0x00000C6A
	mov r1, #0
	strh r1, [r4, r0]
	mov r0, #0x1e
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02080B50: .word 0x00000C65
_02080B54: .word 0x00000C68
_02080B58: .word 0x0000082E
_02080B5C: .word 0x00000C62
_02080B60: .word 0x00000678
_02080B64: .word 0x0000067C
_02080B68: .word 0x00000654
_02080B6C: .word 0x00000C63
_02080B70: .word 0x00000C6A
	thumb_func_end sub_02080A58

	thumb_func_start sub_02080B74
sub_02080B74: ; 0x02080B74
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _02080BAC ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _02080BB0 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
	nop
_02080BAC: .word 0x00000678
_02080BB0: .word 0x04000050
	thumb_func_end sub_02080B74

	thumb_func_start sub_02080BB4
sub_02080BB4: ; 0x02080BB4
	push {r3, r4, r5, lr}
	mov r1, #0
	mov r2, #0xc
	bl LoadItemDataOrGfx
	mov r1, #0xe
	add r4, r0, #0
	bl GetItemAttr_PreloadedItemData
	cmp r0, #1
	beq _02080BD4
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1c
	pop {r3, r4, r5, pc}
_02080BD4:
	add r0, r4, #0
	mov r1, #0x1b
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x1c
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x1d
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x1e
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x1f
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x20
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x21
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080C32
_02080C28:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
_02080C32:
	add r0, r4, #0
	mov r1, #0x18
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080C48
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02080C48:
	add r0, r4, #0
	mov r1, #0x19
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080C5E
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #2
	pop {r3, r4, r5, pc}
_02080C5E:
	add r0, r4, #0
	mov r1, #0xf
	bl GetItemAttr_PreloadedItemData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #1
	add r5, r5, r0
	add r0, r4, #0
	mov r1, #0x11
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #2
	add r5, r5, r0
	add r0, r4, #0
	mov r1, #0x12
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #3
	add r5, r5, r0
	add r0, r4, #0
	mov r1, #0x13
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #4
	add r5, r5, r0
	add r0, r4, #0
	mov r1, #0x14
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #5
	add r5, r5, r0
	cmp r5, #0x10
	bgt _02080CCC
	bge _02080D02
	cmp r5, #8
	bhi _02080D36
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02080CBA: ; jump table
	.short _02080D36 - _02080CBA - 2 ; case 0
	.short _02080CDA - _02080CBA - 2 ; case 1
	.short _02080CE4 - _02080CBA - 2 ; case 2
	.short _02080D36 - _02080CBA - 2 ; case 3
	.short _02080CEE - _02080CBA - 2 ; case 4
	.short _02080D36 - _02080CBA - 2 ; case 5
	.short _02080D36 - _02080CBA - 2 ; case 6
	.short _02080D36 - _02080CBA - 2 ; case 7
	.short _02080CF8 - _02080CBA - 2 ; case 8
_02080CCC:
	cmp r5, #0x20
	bgt _02080CD4
	beq _02080D0C
	b _02080D36
_02080CD4:
	cmp r5, #0x3f
	beq _02080D16
	b _02080D36
_02080CDA:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #3
	pop {r3, r4, r5, pc}
_02080CE4:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #4
	pop {r3, r4, r5, pc}
_02080CEE:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #5
	pop {r3, r4, r5, pc}
_02080CF8:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #6
	pop {r3, r4, r5, pc}
_02080D02:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #7
	pop {r3, r4, r5, pc}
_02080D0C:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #8
	pop {r3, r4, r5, pc}
_02080D16:
	add r0, r4, #0
	mov r1, #0x26
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080D2C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_02080D2C:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #9
	pop {r3, r4, r5, pc}
_02080D36:
	add r0, r4, #0
	mov r1, #0x15
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080D4C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_02080D4C:
	add r0, r4, #0
	mov r1, #0x26
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080D62
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_02080D62:
	add r0, r4, #0
	mov r1, #0x30
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080D78
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02080D78:
	bge _02080D84
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x12
	pop {r3, r4, r5, pc}
_02080D84:
	add r0, r4, #0
	mov r1, #0x31
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080D9A
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xd
	pop {r3, r4, r5, pc}
_02080D9A:
	bge _02080DA6
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x13
	pop {r3, r4, r5, pc}
_02080DA6:
	add r0, r4, #0
	mov r1, #0x32
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080DBC
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xe
	pop {r3, r4, r5, pc}
_02080DBC:
	bge _02080DC8
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x14
	pop {r3, r4, r5, pc}
_02080DC8:
	add r0, r4, #0
	mov r1, #0x33
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080DDE
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xf
	pop {r3, r4, r5, pc}
_02080DDE:
	bge _02080DEA
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x15
	pop {r3, r4, r5, pc}
_02080DEA:
	add r0, r4, #0
	mov r1, #0x34
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080E00
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x10
	pop {r3, r4, r5, pc}
_02080E00:
	bge _02080E0C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_02080E0C:
	add r0, r4, #0
	mov r1, #0x35
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080E22
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x11
	pop {r3, r4, r5, pc}
_02080E22:
	bge _02080E2E
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x17
	pop {r3, r4, r5, pc}
_02080E2E:
	add r0, r4, #0
	mov r1, #0x1a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080E44
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_02080E44:
	add r0, r4, #0
	mov r1, #0x22
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080E5A
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x19
	pop {r3, r4, r5, pc}
_02080E5A:
	add r0, r4, #0
	mov r1, #0x23
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080E70
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1a
	pop {r3, r4, r5, pc}
_02080E70:
	add r0, r4, #0
	mov r1, #0x24
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080E88
	add r0, r4, #0
	mov r1, #0x25
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080E92
_02080E88:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1b
	pop {r3, r4, r5, pc}
_02080E92:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1c
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02080BB4

	thumb_func_start sub_02080E9C
sub_02080E9C: ; 0x02080E9C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _0208123C ; =0x00000654
	add r6, r1, #0
	ldr r1, _02081240 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	add r5, r2, #0
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	add r0, r6, #0
	bl sub_02080BB4
	cmp r0, #0x1b
	bls _02080ECE
	b _020812D0
_02080ECE:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02080EDA: ; jump table
	.short _020812D0 - _02080EDA - 2 ; case 0
	.short _020812D0 - _02080EDA - 2 ; case 1
	.short _020812D0 - _02080EDA - 2 ; case 2
	.short _02080F36 - _02080EDA - 2 ; case 3
	.short _02080F12 - _02080EDA - 2 ; case 4
	.short _02080F5A - _02080EDA - 2 ; case 5
	.short _02080F7E - _02080EDA - 2 ; case 6
	.short _02080FA2 - _02080EDA - 2 ; case 7
	.short _02080FC6 - _02080EDA - 2 ; case 8
	.short _0208100E - _02080EDA - 2 ; case 9
	.short _02080FEA - _02080EDA - 2 ; case 10
	.short _020812D0 - _02080EDA - 2 ; case 11
	.short _02081032 - _02080EDA - 2 ; case 12
	.short _02081062 - _02080EDA - 2 ; case 13
	.short _02081092 - _02080EDA - 2 ; case 14
	.short _020810C2 - _02080EDA - 2 ; case 15
	.short _020810F2 - _02080EDA - 2 ; case 16
	.short _02081122 - _02080EDA - 2 ; case 17
	.short _02081152 - _02080EDA - 2 ; case 18
	.short _02081184 - _02080EDA - 2 ; case 19
	.short _020811B6 - _02080EDA - 2 ; case 20
	.short _020811E8 - _02080EDA - 2 ; case 21
	.short _0208121A - _02080EDA - 2 ; case 22
	.short _0208125C - _02080EDA - 2 ; case 23
	.short _020812D0 - _02080EDA - 2 ; case 24
	.short _0208128E - _02080EDA - 2 ; case 25
	.short _0208128E - _02080EDA - 2 ; case 26
	.short _020812BE - _02080EDA - 2 ; case 27
_02080F12:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x42
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080F36:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x5c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080F5A:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x44
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080F7E:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x45
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080FA2:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x43
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080FC6:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4a
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080FEA:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4b
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_0208100E:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x48
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081032:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #0
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081062:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081092:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #2
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020810C2:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #3
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020810F2:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #4
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081122:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #5
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081152:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #0
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081184:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020811B6:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #2
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020811E8:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #3
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_0208121A:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #4
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	b _02081248
	nop
_0208123C: .word 0x00000654
_02081240: .word 0x00000C65
_02081244: .word 0x000007C4
_02081248:
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_0208125C:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _020812E4 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #5
	bl BufferStatName
	ldr r1, _020812E4 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_0208128E:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x49
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, _020812E4 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r5, #0
	bl BufferMoveName
	ldr r1, _020812E4 ; =0x000007C4
	add r2, r6, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020812BE:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x46
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
_020812D0:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x66
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
	nop
_020812E4: .word 0x000007C4
	thumb_func_end sub_02080E9C

	thumb_func_start sub_020812E8
sub_020812E8: ; 0x020812E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02081360 ; =0x00000654
	ldr r0, [r4, r0]
	ldrh r0, [r0, #0x28]
	bl sub_02080BB4
	cmp r0, #0x1c
	bhi _0208135E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02081306: ; jump table
	.short _0208135E - _02081306 - 2 ; case 0
	.short _0208135E - _02081306 - 2 ; case 1
	.short _02081340 - _02081306 - 2 ; case 2
	.short _02081348 - _02081306 - 2 ; case 3
	.short _02081348 - _02081306 - 2 ; case 4
	.short _02081348 - _02081306 - 2 ; case 5
	.short _02081348 - _02081306 - 2 ; case 6
	.short _02081348 - _02081306 - 2 ; case 7
	.short _02081348 - _02081306 - 2 ; case 8
	.short _02081348 - _02081306 - 2 ; case 9
	.short _02081348 - _02081306 - 2 ; case 10
	.short _02081358 - _02081306 - 2 ; case 11
	.short _02081348 - _02081306 - 2 ; case 12
	.short _02081348 - _02081306 - 2 ; case 13
	.short _02081348 - _02081306 - 2 ; case 14
	.short _02081348 - _02081306 - 2 ; case 15
	.short _02081348 - _02081306 - 2 ; case 16
	.short _02081348 - _02081306 - 2 ; case 17
	.short _02081350 - _02081306 - 2 ; case 18
	.short _02081350 - _02081306 - 2 ; case 19
	.short _02081350 - _02081306 - 2 ; case 20
	.short _02081350 - _02081306 - 2 ; case 21
	.short _02081350 - _02081306 - 2 ; case 22
	.short _02081350 - _02081306 - 2 ; case 23
	.short _0208135E - _02081306 - 2 ; case 24
	.short _02081348 - _02081306 - 2 ; case 25
	.short _02081348 - _02081306 - 2 ; case 26
	.short _02081348 - _02081306 - 2 ; case 27
	.short _0208135E - _02081306 - 2 ; case 28
_02081340:
	ldr r1, _02081364 ; =sub_02081A74
	ldr r0, _02081368 ; =0x00000C54
	str r1, [r4, r0]
	pop {r4, pc}
_02081348:
	ldr r1, _0208136C ; =sub_020813A4
	ldr r0, _02081368 ; =0x00000C54
	str r1, [r4, r0]
	pop {r4, pc}
_02081350:
	ldr r1, _02081370 ; =sub_02081444
	ldr r0, _02081368 ; =0x00000C54
	str r1, [r4, r0]
	pop {r4, pc}
_02081358:
	ldr r1, _02081374 ; =sub_020815E4
	ldr r0, _02081368 ; =0x00000C54
	str r1, [r4, r0]
_0208135E:
	pop {r4, pc}
	.balign 4, 0
_02081360: .word 0x00000654
_02081364: .word sub_02081A74
_02081368: .word 0x00000C54
_0208136C: .word sub_020813A4
_02081370: .word sub_02081444
_02081374: .word sub_020815E4
	thumb_func_end sub_020812E8

	thumb_func_start sub_02081378
sub_02081378: ; 0x02081378
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208139C ; =0x00000C64
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	beq _0208138C
	mov r0, #5
	pop {r4, pc}
_0208138C:
	ldr r0, _020813A0 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
	nop
_0208139C: .word 0x00000C64
_020813A0: .word 0x00000654
	thumb_func_end sub_02081378

	thumb_func_start sub_020813A4
sub_020813A4: ; 0x020813A4
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r1, _0208142C ; =0x00000654
	add r5, r0, #0
	ldr r4, [r5, r1]
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _02081430 ; =0x00000C65
	ldrh r1, [r4, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r4]
	mov r3, #0
	bl UseItemOnMonInParty
	ldr r1, _02081430 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_02079E38
	ldr r1, _02081430 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D5DC
	ldr r1, _02081430 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D6A0
	ldr r0, _02081430 ; =0x00000C65
	mov r2, #0x30
	ldrb r1, [r5, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02081434 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	ldr r1, _0208142C ; =0x00000654
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #0
	ldrh r1, [r1, #0x28]
	bl sub_02080E9C
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02081438 ; =0x000005EC
	bl PlaySE
	ldr r1, _0208143C ; =sub_02081378
	ldr r0, _02081440 ; =0x00000C54
	str r1, [r5, r0]
	mov r0, #5
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208142C: .word 0x00000654
_02081430: .word 0x00000C65
_02081434: .word 0x00000836
_02081438: .word 0x000005EC
_0208143C: .word sub_02081378
_02081440: .word 0x00000C54
	thumb_func_end sub_020813A4

	thumb_func_start sub_02081444
sub_02081444: ; 0x02081444
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, _020815D0 ; =0x00000654
	ldr r1, _020815D4 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xd
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, _020815D0 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r5, #0
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _020815D4 ; =0x00000C65
	ldrh r1, [r6, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r6]
	mov r3, #0
	bl UseItemOnMonInParty
	ldr r1, _020815D4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_02079E38
	ldr r1, _020815D4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D5DC
	ldr r1, _020815D4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D6A0
	ldr r0, _020815D4 ; =0x00000C65
	mov r2, #0x30
	ldrb r1, [r5, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _020815D8 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x14]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x10]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _020815AA
_0208157E:
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	ldr r1, _020815D0 ; =0x00000654
	beq _0208159C
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrh r1, [r1, #0x28]
	mov r2, #0
	bl sub_02080E9C
	b _020815B8
_0208159C:
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrh r1, [r1, #0x28]
	mov r2, #1
	bl sub_02080E9C
	b _020815B8
_020815AA:
	ldr r1, _020815D0 ; =0x00000654
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #2
	ldrh r1, [r1, #0x28]
	bl sub_02080E9C
_020815B8:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _020815DC ; =sub_02081378
	ldr r0, _020815E0 ; =0x00000C54
	str r1, [r5, r0]
	mov r0, #5
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020815D0: .word 0x00000654
_020815D4: .word 0x00000C65
_020815D8: .word 0x00000836
_020815DC: .word sub_02081378
_020815E0: .word 0x00000C54
	thumb_func_end sub_02081444

	thumb_func_start sub_020815E4
sub_020815E4: ; 0x020815E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _020816FC ; =0x00000654
	add r5, r0, #0
	ldr r4, [r5, r1]
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _02081700 ; =0x00000C65
	ldrh r1, [r4, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r4]
	mov r3, #0
	bl UseItemOnMonInParty
	ldr r0, _020816FC ; =0x00000654
	ldr r1, _02081700 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	str r0, [sp, #8]
	bl GetMonData
	add r4, r0, #0
	ldr r0, _02081700 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02081704 ; =0x0000082E
	ldrh r1, [r1, r0]
	cmp r1, #0
	bne _02081640
	sub r0, #0x6e
	ldr r0, [r5, r0]
	mov r1, #0x47
	bl NewString_ReadMsgData
	add r7, r0, #0
	b _0208165E
_02081640:
	cmp r4, r1
	bne _02081652
	sub r0, #0x6e
	ldr r0, [r5, r0]
	mov r1, #0x48
	bl NewString_ReadMsgData
	add r7, r0, #0
	b _0208165E
_02081652:
	sub r0, #0x6e
	ldr r0, [r5, r0]
	mov r1, #0x41
	bl NewString_ReadMsgData
	add r7, r0, #0
_0208165E:
	ldr r0, [sp, #8]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081708 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r2, _02081700 ; =0x00000C65
	str r1, [sp, #4]
	ldrb r6, [r5, r2]
	ldr r3, _02081708 ; =0x000007C4
	mov r2, #0x30
	mul r2, r6
	ldr r0, [r5, r3]
	add r2, r5, r2
	add r3, #0x6a
	ldrh r2, [r2, r3]
	mov r3, #3
	sub r2, r4, r2
	bl BufferIntegerAsString
	ldr r1, _02081708 ; =0x000007C4
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #8]
	bl sub_0208AD64
	add r4, r0, #0
	ldr r1, _02081700 ; =0x00000C65
	lsl r2, r4, #0x18
	ldrb r1, [r5, r1]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	cmp r4, #7
	bne _020816E0
	ldr r1, _02081700 ; =0x00000C65
	ldr r0, _0208170C ; =0x00000836
	ldrb r3, [r5, r1]
	add r2, r5, r0
	mov r0, #0x30
	mul r0, r3
	ldrh r4, [r2, r0]
	ldr r3, _02081710 ; =0xFFFFF000
	and r4, r3
	mov r3, #7
	orr r3, r4
	strh r3, [r2, r0]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D3E4
_020816E0:
	ldr r1, _02081700 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207A7F4
	ldr r1, _02081714 ; =sub_02081720
	ldr r0, _02081718 ; =0x00000C54
	str r1, [r5, r0]
	ldr r0, _0208171C ; =0x000005EC
	bl PlaySE
	mov r0, #5
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020816FC: .word 0x00000654
_02081700: .word 0x00000C65
_02081704: .word 0x0000082E
_02081708: .word 0x000007C4
_0208170C: .word 0x00000836
_02081710: .word 0xFFFFF000
_02081714: .word sub_02081720
_02081718: .word 0x00000C54
_0208171C: .word 0x000005EC
	thumb_func_end sub_020815E4

	thumb_func_start sub_02081720
sub_02081720: ; 0x02081720
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020817B0 ; =0x00000654
	ldr r1, _020817B4 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, _020817B4 ; =0x00000C65
	add r4, r0, #0
	ldrb r2, [r5, r1]
	ldr r0, _020817B8 ; =0x0000082E
	mov r1, #0x30
	add r3, r2, #0
	add r0, r5, r0
	mul r3, r1
	ldrh r1, [r0, r3]
	cmp r4, r1
	beq _02081754
	add r1, r1, #1
	strh r1, [r0, r3]
_02081754:
	ldr r1, _020817B4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D480
	ldr r1, _020817B4 ; =0x00000C65
	add r0, r5, #4
	ldrb r2, [r5, r1]
	lsl r1, r2, #2
	add r1, r2, r1
	add r1, r1, #3
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _020817B4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D440
	ldr r1, _020817B4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D4EC
	ldr r0, _020817B4 ; =0x00000C65
	mov r1, #0x30
	ldrb r0, [r5, r0]
	add r2, r0, #0
	mul r2, r1
	ldr r0, _020817B8 ; =0x0000082E
	add r2, r5, r2
	ldrh r0, [r2, r0]
	cmp r4, r0
	bne _020817AC
	add r0, r5, #0
	sub r1, #0x31
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _020817BC ; =sub_02081378
	ldr r0, _020817C0 ; =0x00000C54
	str r1, [r5, r0]
_020817AC:
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020817B0: .word 0x00000654
_020817B4: .word 0x00000C65
_020817B8: .word 0x0000082E
_020817BC: .word sub_02081378
_020817C0: .word 0x00000C54
	thumb_func_end sub_02081720

	thumb_func_start sub_020817C4
sub_020817C4: ; 0x020817C4
	push {r3, lr}
	mov r1, #0x18
	mov r2, #0xc
	bl GetItemAttr
	cmp r0, #0
	beq _020817D6
	mov r0, #1
	pop {r3, pc}
_020817D6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020817C4

	thumb_func_start sub_020817DC
sub_020817DC: ; 0x020817DC
	push {r3, r4, r5, r6}
	cmp r1, #6
	blo _020817E8
	mov r0, #0xff
	pop {r3, r4, r5, r6}
	bx lr
_020817E8:
	bhs _02081814
	ldr r2, _0208181C ; =0x0000082E
	mov r3, #0x30
	add r4, r2, #0
	add r4, #0x27
_020817F2:
	add r5, r1, #0
	mul r5, r3
	add r6, r0, r5
	ldrb r5, [r6, r4]
	cmp r5, #0
	beq _0208180A
	ldrh r5, [r6, r2]
	cmp r5, #0
	bne _0208180A
	add r0, r1, #0
	pop {r3, r4, r5, r6}
	bx lr
_0208180A:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #6
	blo _020817F2
_02081814:
	mov r0, #0xff
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0208181C: .word 0x0000082E
	thumb_func_end sub_020817DC

	thumb_func_start sub_02081820
sub_02081820: ; 0x02081820
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02081A4C ; =0x00000C62
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #3
	bls _0208182E
	b _02081A46
_0208182E:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0208183A: ; jump table
	.short _02081842 - _0208183A - 2 ; case 0
	.short _02081894 - _0208183A - 2 ; case 1
	.short _0208195C - _0208183A - 2 ; case 2
	.short _020819E0 - _0208183A - 2 ; case 3
_02081842:
	mov r1, #0
	bl sub_020817DC
	ldr r1, _02081A50 ; =0x00000C65
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #0xff
	bne _02081888
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x66
	bl ReadMsgDataIntoString
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _02081A54 ; =sub_02081378
	ldr r0, _02081A58 ; =0x00000C54
	mov r2, #1
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0
	bl sub_0207F240
	ldr r0, _02081A50 ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_02081888:
	cmp r0, #0
	beq _02081894
	add r0, r4, #0
	mov r1, #0
	bl sub_0207A7F4
_02081894:
	ldr r0, _02081A5C ; =0x00000654
	ldr r1, _02081A50 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020828EC
	add r3, r0, #0
	mov r0, #0xc
	str r0, [sp]
	ldr r1, _02081A5C ; =0x00000654
	add r0, r5, #0
	ldr r1, [r4, r1]
	mov r2, #0
	ldrh r1, [r1, #0x28]
	bl UseItemOnPokemon
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x47
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081A60 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r1, _02081A60 ; =0x000007C4
	add r2, r6, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	ldr r7, _02081A50 ; =0x00000C65
	ldr r3, _02081A64 ; =0x00000836
	ldrb r5, [r4, r7]
	mov r2, #0x30
	add r1, r4, r3
	add r0, r5, #0
	mul r0, r2
	ldrh r6, [r1, r0]
	ldr r5, _02081A68 ; =0xFFFFF000
	and r6, r5
	mov r5, #7
	orr r5, r6
	strh r5, [r1, r0]
	ldrb r1, [r4, r7]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	add r1, r7, #0
	ldrb r1, [r4, r1]
	add r0, r4, #0
	bl sub_0207D3E4
	add r1, r7, #0
	ldrb r1, [r4, r1]
	add r0, r4, #0
	bl sub_0207A7F4
	add r1, r7, #0
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	bl sub_0207F240
	ldr r0, _02081A6C ; =0x000005EC
	bl PlaySE
	sub r0, r7, #3
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02081A46
_0208195C:
	ldr r0, _02081A5C ; =0x00000654
	add r1, r1, #3
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r2, _02081A50 ; =0x00000C65
	add r5, r0, #0
	ldr r0, _02081A70 ; =0x0000082E
	ldrb r3, [r4, r2]
	add r1, r4, r0
	mov r0, #0x30
	mul r0, r3
	ldrh r3, [r1, r0]
	add r3, r3, #1
	strh r3, [r1, r0]
	ldrb r1, [r4, r2]
	add r0, r4, #0
	bl sub_0207D480
	ldr r1, _02081A50 ; =0x00000C65
	add r0, r4, #4
	ldrb r2, [r4, r1]
	lsl r1, r2, #2
	add r1, r2, r1
	add r1, r1, #3
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _02081A50 ; =0x00000C65
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl sub_0207D440
	ldr r1, _02081A50 ; =0x00000C65
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl sub_0207D4EC
	ldr r0, _02081A50 ; =0x00000C65
	mov r1, #0x30
	ldrb r0, [r4, r0]
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02081A70 ; =0x0000082E
	add r2, r4, r2
	ldrh r0, [r2, r0]
	cmp r5, r0
	bne _02081A46
	add r0, r4, #0
	sub r1, #0x31
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02081A4C ; =0x00000C62
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02081A46
_020819E0:
	add r0, r1, #2
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _02081A46
	ldr r0, _02081A50 ; =0x00000C65
	ldrb r5, [r4, r0]
	add r0, r4, #0
	add r1, r5, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020817DC
	ldr r1, _02081A50 ; =0x00000C65
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #0xff
	beq _02081A22
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207A7F4
	ldr r0, _02081A4C ; =0x00000C62
	mov r1, #1
	strb r1, [r4, r0]
	b _02081A46
_02081A22:
	ldr r0, _02081A5C ; =0x00000654
	mov r2, #1
	ldr r1, [r4, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	ldr r0, _02081A5C ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02081A50 ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_02081A46:
	mov r0, #7
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02081A4C: .word 0x00000C62
_02081A50: .word 0x00000C65
_02081A54: .word sub_02081378
_02081A58: .word 0x00000C54
_02081A5C: .word 0x00000654
_02081A60: .word 0x000007C4
_02081A64: .word 0x00000836
_02081A68: .word 0xFFFFF000
_02081A6C: .word 0x000005EC
_02081A70: .word 0x0000082E
	thumb_func_end sub_02081820

	thumb_func_start sub_02081A74
sub_02081A74: ; 0x02081A74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02081C14 ; =0x00000654
	ldr r1, _02081C18 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa4
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	ldr r1, _02081C1C ; =0x00000C68
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa5
	bl GetMonData
	ldr r1, _02081C20 ; =0x00000C6A
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa6
	bl GetMonData
	ldr r1, _02081C24 ; =0x00000C6C
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa8
	bl GetMonData
	ldr r1, _02081C28 ; =0x00000C6E
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa9
	bl GetMonData
	mov r1, #0xc7
	lsl r1, r1, #4
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	ldr r1, _02081C2C ; =0x00000C72
	strh r0, [r5, r1]
	ldr r0, _02081C14 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r5, #0
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _02081C18 ; =0x00000C65
	ldrh r1, [r6, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r6]
	mov r3, #0
	bl UseItemOnMonInParty
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldr r1, _02081C18 ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02081C30 ; =0x00000832
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, _02081C18 ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02081C34 ; =0x0000082E
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	ldr r1, _02081C18 ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	add r2, r5, r1
	mov r1, #0x83
	lsl r1, r1, #4
	strh r0, [r2, r1]
	sub r1, #0x70
	ldr r0, [r5, r1]
	mov r1, #0xb1
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r4, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081C38 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r2, _02081C18 ; =0x00000C65
	str r1, [sp, #4]
	ldrb r6, [r5, r2]
	ldr r3, _02081C38 ; =0x000007C4
	mov r2, #0x30
	mul r2, r6
	ldr r0, [r5, r3]
	add r2, r5, r2
	add r3, #0x6e
	ldrh r2, [r2, r3]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, _02081C38 ; =0x000007C4
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	bl sub_0208AD64
	add r4, r0, #0
	ldr r1, _02081C18 ; =0x00000C65
	lsl r2, r4, #0x18
	ldrb r1, [r5, r1]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	cmp r4, #7
	bne _02081BD2
	ldr r1, _02081C18 ; =0x00000C65
	ldr r0, _02081C3C ; =0x00000836
	ldrb r3, [r5, r1]
	add r2, r5, r0
	mov r0, #0x30
	mul r0, r3
	ldrh r4, [r2, r0]
	ldr r3, _02081C40 ; =0xFFFFF000
	and r4, r3
	mov r3, #7
	orr r3, r4
	strh r3, [r2, r0]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D3E4
_02081BD2:
	ldr r1, _02081C18 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207A7F4
	ldr r0, _02081C44 ; =sub_02081720
	ldr r1, _02081C48 ; =0x00000C54
	str r0, [r5, r1]
	add r1, #0x11
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D5DC
	ldr r1, _02081C18 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D6A0
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _02081C4C ; =sub_02081C50
	ldr r0, _02081C48 ; =0x00000C54
	str r1, [r5, r0]
	mov r1, #0
	add r0, #0x13
	strb r1, [r5, r0]
	mov r0, #5
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02081C14: .word 0x00000654
_02081C18: .word 0x00000C65
_02081C1C: .word 0x00000C68
_02081C20: .word 0x00000C6A
_02081C24: .word 0x00000C6C
_02081C28: .word 0x00000C6E
_02081C2C: .word 0x00000C72
_02081C30: .word 0x00000832
_02081C34: .word 0x0000082E
_02081C38: .word 0x000007C4
_02081C3C: .word 0x00000836
_02081C40: .word 0xFFFFF000
_02081C44: .word sub_02081720
_02081C48: .word 0x00000C54
_02081C4C: .word sub_02081C50
	thumb_func_end sub_02081A74

	thumb_func_start sub_02081C50
sub_02081C50: ; 0x02081C50
	push {r3, r4, r5, lr}
	ldr r1, _02081EAC ; =0x00000C67
	add r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #6
	bhi _02081D0C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02081C68: ; jump table
	.short _02081C76 - _02081C68 - 2 ; case 0
	.short _02081C90 - _02081C68 - 2 ; case 1
	.short _02081CB6 - _02081C68 - 2 ; case 2
	.short _02081CE4 - _02081C68 - 2 ; case 3
	.short _02081DDC - _02081C68 - 2 ; case 4
	.short _02081DF0 - _02081C68 - 2 ; case 5
	.short _02081E54 - _02081C68 - 2 ; case 6
_02081C76:
	sub r0, r1, #3
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _02081D0C
	add r0, r4, #0
	bl sub_0207DDFC
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #1
	strb r1, [r4, r0]
	b _02081EA8
_02081C90:
	ldr r0, _02081EB0 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02081CA2
	bl sub_02025358
	cmp r0, #1
	bne _02081D0C
_02081CA2:
	ldr r0, _02081EB4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0207DF98
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #2
	strb r1, [r4, r0]
	b _02081EA8
_02081CB6:
	ldr r0, _02081EB0 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02081CC8
	bl sub_02025358
	cmp r0, #1
	bne _02081D0C
_02081CC8:
	ldr r0, _02081EB4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0207E04C
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #3
	strb r1, [r4, r0]
	ldr r0, _02081EB8 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	str r1, [r0, #0x38]
	b _02081EA8
_02081CE4:
	ldr r0, _02081EB8 ; =0x00000654
	sub r1, r1, #2
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldr r1, _02081EB8 ; =0x00000654
	add r5, r0, #0
	ldr r2, [r4, r1]
	add r1, r2, #0
	add r1, #0x38
	add r2, #0x2a
	bl MonTryLearnMoveOnLevelUp
	cmp r0, #0
	beq _02081D16
	ldr r1, _02081EBC ; =0x0000FFFE
	cmp r0, r1
	bne _02081D0E
_02081D0C:
	b _02081EA8
_02081D0E:
	add r1, r1, #1
	cmp r0, r1
	beq _02081D1E
	b _02081D84
_02081D16:
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #6
	strb r1, [r4, r0]
	b _02081EA8
_02081D1E:
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081EC0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r2, _02081EB8 ; =0x00000654
	ldr r0, _02081EC0 ; =0x000007C4
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	ldrh r2, [r2, #0x2a]
	mov r1, #1
	bl BufferMoveName
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081EC0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02081EC4 ; =sub_02081F8C
	ldr r1, _02081EC8 ; =0x00000C58
	ldr r2, _02081ECC ; =sub_02081FE0
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_02081D84:
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081EC0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r2, _02081EB8 ; =0x00000654
	ldr r0, _02081EC0 ; =0x000007C4
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	ldrh r2, [r2, #0x2a]
	mov r1, #1
	bl BufferMoveName
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0xb2
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081EC0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #4
	strb r1, [r4, r0]
	b _02081EA8
_02081DDC:
	sub r0, r1, #3
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _02081EA8
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #3
	strb r1, [r4, r0]
	b _02081EA8
_02081DF0:
	ldr r0, _02081EB8 ; =0x00000654
	sub r1, r1, #2
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldr r2, _02081EB8 ; =0x00000654
	add r1, r0, #0
	ldr r2, [r4, r2]
	add r0, r4, #0
	add r2, #0x2c
	ldrb r2, [r2]
	bl sub_0208254C
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3e
	bl NewString_ReadMsgData
	ldr r2, _02081EB8 ; =0x00000654
	add r5, r0, #0
	ldr r2, [r4, r2]
	ldr r0, _02081EC0 ; =0x000007C4
	ldrh r2, [r2, #0x2a]
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferMoveName
	ldr r1, _02081EC0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #4
	strb r1, [r4, r0]
	b _02081EA8
_02081E54:
	ldr r0, _02081EB8 ; =0x00000654
	sub r1, r1, #2
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	ldr r0, _02081EB8 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x1c]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapEvolutionMethod
	add r3, r0, #0
	ldr r0, _02081EB8 ; =0x00000654
	lsl r3, r3, #0x10
	ldr r1, [r4, r0]
	mov r2, #0
	add r0, r1, #0
	add r0, #0x40
	str r0, [sp]
	ldr r0, [r1]
	add r1, r5, #0
	lsr r3, r3, #0x10
	bl GetMonEvolution
	ldr r1, _02081EB8 ; =0x00000654
	ldr r2, [r4, r1]
	strh r0, [r2, #0x3c]
	ldr r1, [r4, r1]
	ldrh r0, [r1, #0x3c]
	cmp r0, #0
	beq _02081E9E
	mov r0, #9
	b _02081EA0
_02081E9E:
	mov r0, #0
_02081EA0:
	add r1, #0x27
	strb r0, [r1]
	mov r0, #0x20
	pop {r3, r4, r5, pc}
_02081EA8:
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02081EAC: .word 0x00000C67
_02081EB0: .word gMain
_02081EB4: .word 0x000005DC
_02081EB8: .word 0x00000654
_02081EBC: .word 0x0000FFFE
_02081EC0: .word 0x000007C4
_02081EC4: .word sub_02081F8C
_02081EC8: .word 0x00000C58
_02081ECC: .word sub_02081FE0
	thumb_func_end sub_02081C50

	thumb_func_start sub_02081ED0
sub_02081ED0: ; 0x02081ED0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02081F78 ; =sub_02081C50
	ldr r1, _02081F7C ; =0x00000C54
	mov r2, #3
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x13
	strb r2, [r4, r0]
	ldr r0, _02081F80 ; =0x00000654
	add r1, #0x11
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081F84 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r0, _02081F80 ; =0x00000654
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x2c
	ldrb r1, [r0]
	cmp r1, #4
	bne _02081F24
	ldr r0, _02081F84 ; =0x000007C4
	ldrh r2, [r2, #0x2a]
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferMoveName
	add r0, r4, #0
	bl sub_02081FE0
	pop {r3, r4, r5, pc}
_02081F24:
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, _02081F84 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	bl BufferMoveName
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3d
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081F84 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02081F88 ; =0x00000C62
	mov r1, #5
	strb r1, [r4, r0]
	add r0, r0, #5
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_02081F78: .word sub_02081C50
_02081F7C: .word 0x00000C54
_02081F80: .word 0x00000654
_02081F84: .word 0x000007C4
_02081F88: .word 0x00000C62
	thumb_func_end sub_02081ED0

	thumb_func_start sub_02081F8C
sub_02081F8C: ; 0x02081F8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3c
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _02081FD4 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02081FD8 ; =0x00000654
	mov r1, #5
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02081FDC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_02081FD4: .word 0x000007C4
_02081FD8: .word 0x00000654
_02081FDC: .word 0x00000C62
	thumb_func_end sub_02081F8C

	thumb_func_start sub_02081FE0
sub_02081FE0: ; 0x02081FE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x38
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _02082028 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0208202C ; =sub_02082038
	ldr r1, _02082030 ; =0x00000C58
	ldr r2, _02082034 ; =sub_02082084
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082028: .word 0x000007C4
_0208202C: .word sub_02082038
_02082030: .word 0x00000C58
_02082034: .word sub_02082084
	thumb_func_end sub_02081FE0

	thumb_func_start sub_02082038
sub_02082038: ; 0x02082038
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3b
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _0208207C ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02082080 ; =0x00000C62
	mov r1, #5
	strb r1, [r5, r0]
	mov r1, #4
	add r0, r0, #5
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_0208207C: .word 0x000007C4
_02082080: .word 0x00000C62
	thumb_func_end sub_02082038

	thumb_func_start sub_02082084
sub_02082084: ; 0x02082084
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _020820CC ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _020820D0 ; =sub_02081F8C
	ldr r1, _020820D4 ; =0x00000C58
	ldr r2, _020820D8 ; =sub_02081FE0
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020820CC: .word 0x000007C4
_020820D0: .word sub_02081F8C
_020820D4: .word 0x00000C58
_020820D8: .word sub_02081FE0
	thumb_func_end sub_02082084

	thumb_func_start sub_020820DC
sub_020820DC: ; 0x020820DC
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02082130 ; =0x00000654
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_020820E6:
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r0, [r5, r7]
	ldrh r1, [r0, #0x2a]
	cmp r2, r1
	bne _02082102
	mov r0, #0xfd
	pop {r3, r4, r5, r6, r7, pc}
_02082102:
	cmp r2, #0
	beq _02082110
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #4
	blo _020820E6
_02082110:
	ldrh r0, [r0, #0x28]
	bl ItemToTMHMId
	add r1, r0, #0
	add r0, r6, #0
	bl sub_0207224C
	cmp r0, #0
	bne _02082126
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_02082126:
	cmp r4, #4
	bne _0208212C
	mov r4, #0xfe
_0208212C:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02082130: .word 0x00000654
	thumb_func_end sub_020820DC

	thumb_func_start sub_02082134
sub_02082134: ; 0x02082134
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _020822B0 ; =0x00000654
	ldr r1, _020822B4 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020820DC
	add r5, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _020822B8 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r2, _020822B0 ; =0x00000654
	ldr r0, _020822B8 ; =0x000007C4
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	ldrh r2, [r2, #0x2a]
	mov r1, #1
	bl BufferMoveName
	cmp r5, #0xfd
	bhi _02082192
	bhs _020821EA
	cmp r5, #3
	bhi _02082198
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208218A: ; jump table
	.short _020821A0 - _0208218A - 2 ; case 0
	.short _020821A0 - _0208218A - 2 ; case 1
	.short _020821A0 - _0208218A - 2 ; case 2
	.short _020821A0 - _0208218A - 2 ; case 3
_02082192:
	cmp r5, #0xfe
	bhi _0208219A
	beq _0208222A
_02082198:
	b _020822AA
_0208219A:
	cmp r5, #0xff
	beq _0208226C
	b _020822AA
_020821A0:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0208254C
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3e
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _020822B8 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020822B0 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020822BC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	b _020822AA
_020821EA:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x40
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _020822B8 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020822B0 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020822BC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	b _020822AA
_0208222A:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _020822B8 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020822C0 ; =sub_020823F4
	ldr r1, _020822C4 ; =0x00000C58
	ldr r2, _020822C8 ; =sub_02082448
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	b _020822AA
_0208226C:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3f
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _020822B8 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020822B0 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020822BC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
_020822AA:
	mov r0, #0x18
	pop {r4, r5, r6, pc}
	nop
_020822B0: .word 0x00000654
_020822B4: .word 0x00000C65
_020822B8: .word 0x000007C4
_020822BC: .word 0x00000C62
_020822C0: .word sub_020823F4
_020822C4: .word 0x00000C58
_020822C8: .word sub_02082448
	thumb_func_end sub_02082134

	thumb_func_start sub_020822CC
sub_020822CC: ; 0x020822CC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02082360 ; =0x00000654
	ldr r1, _02082364 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02082368 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r0, _02082360 ; =0x00000654
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x2c
	ldrb r1, [r0]
	cmp r1, #4
	bne _02082312
	ldr r0, _02082368 ; =0x000007C4
	ldrh r2, [r2, #0x2a]
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferMoveName
	add r0, r4, #0
	bl sub_02082448
	pop {r3, r4, r5, pc}
_02082312:
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, _02082368 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	bl BufferMoveName
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3d
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02082368 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0208236C ; =0x00000C62
	mov r1, #0x16
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082360: .word 0x00000654
_02082364: .word 0x00000C65
_02082368: .word 0x000007C4
_0208236C: .word 0x00000C62
	thumb_func_end sub_020822CC

	thumb_func_start sub_02082370
sub_02082370: ; 0x02082370
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020823E4 ; =0x00000654
	ldr r1, _020823E8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldr r2, _020823E4 ; =0x00000654
	add r1, r0, #0
	ldr r2, [r5, r2]
	add r0, r5, #0
	add r2, #0x2c
	ldrb r2, [r2]
	bl sub_0208254C
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3e
	bl NewString_ReadMsgData
	ldr r2, _020823E4 ; =0x00000654
	add r4, r0, #0
	ldr r2, [r5, r2]
	ldr r0, _020823EC ; =0x000007C4
	ldrh r2, [r2, #0x2a]
	ldr r0, [r5, r0]
	mov r1, #1
	bl BufferMoveName
	ldr r1, _020823EC ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _020823E4 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020823F0 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020823E4: .word 0x00000654
_020823E8: .word 0x00000C65
_020823EC: .word 0x000007C4
_020823F0: .word 0x00000C62
	thumb_func_end sub_02082370

	thumb_func_start sub_020823F4
sub_020823F4: ; 0x020823F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3c
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _0208243C ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02082440 ; =0x00000654
	mov r1, #4
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02082444 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_0208243C: .word 0x000007C4
_02082440: .word 0x00000654
_02082444: .word 0x00000C62
	thumb_func_end sub_020823F4

	thumb_func_start sub_02082448
sub_02082448: ; 0x02082448
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x38
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _02082490 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02082494 ; =sub_020824A0
	ldr r1, _02082498 ; =0x00000C58
	ldr r2, _0208249C ; =sub_020824F4
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082490: .word 0x000007C4
_02082494: .word sub_020824A0
_02082498: .word 0x00000C58
_0208249C: .word sub_020824F4
	thumb_func_end sub_02082448

	thumb_func_start sub_020824A0
sub_020824A0: ; 0x020824A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3b
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _020824E8 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _020824EC ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020824F0 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_020824E8: .word 0x000007C4
_020824EC: .word 0x00000654
_020824F0: .word 0x00000C62
	thumb_func_end sub_020824A0

	thumb_func_start sub_020824F4
sub_020824F4: ; 0x020824F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _0208253C ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02082540 ; =sub_020823F4
	ldr r1, _02082544 ; =0x00000C58
	ldr r2, _02082548 ; =sub_02082448
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208253C: .word 0x000007C4
_02082540: .word sub_020823F4
_02082544: .word 0x00000C58
_02082548: .word sub_02082448
	thumb_func_end sub_020824F4

	thumb_func_start sub_0208254C
sub_0208254C: ; 0x0208254C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _020825D4 ; =0x00000654
	add r6, r2, #0
	ldr r0, [r5, r0]
	add r4, r1, #0
	ldrh r0, [r0, #0x2a]
	add r1, r6, #0
	add r1, #0x36
	str r0, [sp]
	add r0, r4, #0
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	add r1, r6, #0
	str r0, [sp]
	add r0, r4, #0
	add r1, #0x3e
	add r2, sp, #0
	bl SetMonData
	ldr r0, _020825D4 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x2a]
	bl WazaGetMaxPp
	add r6, #0x3a
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #0
	bl SetMonData
	ldr r0, _020825D4 ; =0x00000654
	ldr r1, [r5, r0]
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	beq _020825D0
	ldrh r0, [r1, #0x2a]
	bl MoveIsHM
	cmp r0, #0
	bne _020825B8
	ldr r0, _020825D4 ; =0x00000654
	mov r2, #1
	ldr r1, [r5, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
_020825B8:
	add r0, r5, #0
	bl sub_020828EC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #4
	bl MonApplyFriendshipMod
	add r0, r4, #0
	mov r1, #3
	bl sub_02097F0C
_020825D0:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020825D4: .word 0x00000654
	thumb_func_end sub_0208254C

	thumb_func_start sub_020825D8
sub_020825D8: ; 0x020825D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02082648 ; =0x00000654
	add r6, r1, #0
	ldr r1, _0208264C ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x1f
	lsl r0, r0, #6
	add r1, r6, #0
	ldr r0, [r5, r0]
	add r1, #0x91
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, _02082650 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferMoveName
	ldr r1, _02082650 ; =0x000007C4
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, #8
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	cmp r4, #0
	bne _02082632
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02082632:
	mov r1, #0x82
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	sub r1, #0x54
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ListMenuItems_AddItem
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02082648: .word 0x00000654
_0208264C: .word 0x00000C65
_02082650: .word 0x000007C4
	thumb_func_end sub_020825D8

	thumb_func_start sub_02082654
sub_02082654: ; 0x02082654
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	cmp r4, #0
	bne _02082678
	add r0, r5, #0
	mov r1, #0x2a
	mov r2, #1
	bl sub_0207DAD8
	b _02082682
_02082678:
	add r0, r5, #0
	mov r1, #0x29
	mov r2, #1
	bl sub_0207DAD8
_02082682:
	mov r0, #5
	mov r1, #0xc
	bl ListMenuItems_ctor
	mov r1, #0x82
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r5, #0
	mov r1, #0
	bl sub_020825D8
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_020825D8
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	mov r1, #2
	bl sub_020825D8
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	mov r1, #3
	bl sub_020825D8
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	mov r0, #9
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x2c
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x91
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #8]
	add r1, sp, #4
	strb r2, [r1, #8]
	mov r3, #1
	strb r3, [r1, #9]
	add r0, r4, #1
	strb r0, [r1, #0xa]
	ldrb r4, [r1, #0xb]
	mov r0, #0xf
	bic r4, r0
	strb r4, [r1, #0xb]
	ldrb r4, [r1, #0xb]
	mov r0, #0x30
	bic r4, r0
	strb r4, [r1, #0xb]
	ldrb r4, [r1, #0xb]
	mov r0, #0xc0
	bic r4, r0
	mov r0, #0x40
	orr r0, r4
	strb r0, [r1, #0xb]
	ldrb r1, [r1, #0xa]
	add r0, r5, #0
	bl sub_0207E54C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #4
	mov r2, #0
	mov r3, #0xc
	bl sub_0207E590
	ldr r1, _02082734 ; =0x00000824
	str r0, [r5, r1]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082734: .word 0x00000824
	thumb_func_end sub_02082654

	thumb_func_start sub_02082738
sub_02082738: ; 0x02082738
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _02082850 ; =0x00000824
	add r5, r0, #0
	ldr r1, [r5, r1]
	bl sub_0207E93C
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02082758
	add r0, r0, #1
	cmp r4, r0
	beq _0208284A
	b _02082794
_02082758:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0x91
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0x21
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02082854 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	add sp, #8
	mov r0, #4
	pop {r4, r5, r6, pc}
_02082794:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0x91
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _02082858 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r5, #0
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _0208285C ; =0x00000C65
	lsl r3, r4, #0x18
	ldrh r1, [r6, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r6]
	lsr r3, r3, #0x18
	bl UseItemOnMonInParty
	cmp r0, #1
	bne _02082818
	ldr r0, _02082858 ; =0x00000654
	ldr r1, _0208285C ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r4, #0x36
	add r1, r4, #0
	mov r2, #0
	bl GetMonData
	ldr r1, _02082858 ; =0x00000654
	add r2, r0, #0
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrh r1, [r1, #0x28]
	bl sub_02080E9C
	ldr r0, _02082858 ; =0x00000654
	mov r2, #1
	ldr r1, [r5, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	ldr r0, _02082860 ; =0x000005EC
	bl PlaySE
	b _02082828
_02082818:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x66
	bl ReadMsgDataIntoString
_02082828:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02082858 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add sp, #8
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02082864 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r4, r5, r6, pc}
_0208284A:
	mov r0, #6
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02082850: .word 0x00000824
_02082854: .word 0x00000678
_02082858: .word 0x00000654
_0208285C: .word 0x00000C65
_02082860: .word 0x000005EC
_02082864: .word 0x00000C62
	thumb_func_end sub_02082738

	thumb_func_start sub_02082868
sub_02082868: ; 0x02082868
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _020828DC ; =0x00000C65
	ldr r2, _020828E0 ; =0x00000834
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r0, r4, r0
	ldrh r0, [r0, r2]
	cmp r0, #0
	bne _020828A6
	add r0, r2, #0
	sub r0, #0x74
	sub r2, #0x6c
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	mov r1, #0x74
	bl ReadMsgDataIntoString
	ldr r1, _020828DC ; =0x00000C65
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl sub_0207F044
	b _020828BC
_020828A6:
	add r0, r2, #0
	sub r0, #0x74
	sub r2, #0x6c
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	mov r1, #0x75
	bl ReadMsgDataIntoString
	ldr r0, _020828DC ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
_020828BC:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020828E4 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020828E8 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	pop {r4, pc}
	nop
_020828DC: .word 0x00000C65
_020828E0: .word 0x00000834
_020828E4: .word 0x00000654
_020828E8: .word 0x00000C62
	thumb_func_end sub_02082868

	thumb_func_start sub_020828EC
sub_020828EC: ; 0x020828EC
	push {r3, lr}
	ldr r1, _02082904 ; =0x00000654
	ldr r0, [r0, r1]
	ldr r0, [r0, #0x1c]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	nop
_02082904: .word 0x00000654
	thumb_func_end sub_020828EC

	thumb_func_start sub_02082908
sub_02082908: ; 0x02082908
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _0208291E
	cmp r1, #1
	bne _0208291C
	b _02082A88
_0208291C:
	b _02082AC2
_0208291E:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl sub_0201A108
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02082AC8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02082ACC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r2, #0xa
	mov r0, #3
	mov r1, #0x12
	lsl r2, r2, #0xe
	bl CreateHeap
	ldr r1, _02082AD0 ; =0x000005D4
	add r0, r6, #0
	mov r2, #0x12
	bl OverlayManager_CreateAndGetData
	ldr r2, _02082AD0 ; =0x000005D4
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x12
	bl BgConfig_Alloc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0x1f
	mov r1, #0x12
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #0x12
	bl ScrStrBufs_new
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xf9
	mov r3, #0x12
	bl NewMsgDataFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xfe
	mov r3, #0x12
	bl NewMsgDataFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xc5
	mov r3, #0x12
	bl NewMsgDataFromNarc
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	bl sub_02083184
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020831A4
	add r0, r6, #0
	bl OverlayManager_GetField18
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02083160
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02083654
	mov r0, #2
	mov r1, #0x12
	bl sub_02002CEC
	ldr r0, _02082AD4 ; =sub_02083140
	mov r1, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02083334
	mov r0, #0
	mov r1, #0x12
	bl sub_02002D40
	bl sub_0208377C
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020837AC
	add r0, r4, #0
	bl sub_020839EC
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02083F9C
	ldr r0, _02082AD8 ; =0x000004C4
	mov r3, #0x5f
	add r1, r4, r0
	lsl r3, r3, #2
	str r1, [sp]
	ldr r1, [r4, r3]
	add r2, r3, #0
	str r1, [sp, #4]
	sub r2, #0x24
	sub r0, #0xcc
	add r1, r4, #0
	sub r3, #0x22
	ldrh r2, [r4, r2]
	add r0, r4, r0
	add r1, #0xd8
	add r3, r4, r3
	bl sub_02084740
	mov r1, #0
	mov r0, #0x34
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #0x10
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl sub_0200FA24
	mov r0, #1
	bl sub_020832E4
	ldr r0, _02082ADC ; =gMain + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	add r0, r7, #0
	bl NARC_dtor
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02082AC2
_02082A88:
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #1
	bne _02082AA4
	ldr r1, _02082AE0 ; =0x000004B8
	ldr r2, [r4, #4]
	ldr r0, [r4, r1]
	add r1, #8
	ldr r1, [r4, r1]
	ldr r3, [r4, #8]
	bl sub_02082AEC
_02082AA4:
	ldr r0, _02082AE4 ; =_021D43B0
	mov r1, #1
	str r4, [r0]
	mov r0, #0
	mov r2, #0xc
	mov r3, #0x12
	bl sub_020163E0
	ldr r1, _02082AE8 ; =0x000005C4
	add sp, #0xc
	str r0, [r4, r1]
	mov r0, #0
	str r0, [r5]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02082AC2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02082AC8: .word 0xFFFFE0FF
_02082ACC: .word 0x04001000
_02082AD0: .word 0x000005D4
_02082AD4: .word sub_02083140
_02082AD8: .word 0x000004C4
_02082ADC: .word gMain + 0x60
_02082AE0: .word 0x000004B8
_02082AE4: .word _021D43B0
_02082AE8: .word 0x000005C4
	thumb_func_end sub_02082908

	thumb_func_start sub_02082AEC
sub_02082AEC: ; 0x02082AEC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r2, #0
	mov r2, #2
	ldr r0, [r0, #0x14]
	ldr r1, _02082B1C ; =0x000057E0
	add r6, r3, #0
	lsl r2, r2, #8
	bl GX_LoadOBJ
	ldr r4, [r4, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl sub_02074364
	lsl r0, r0, #5
	add r0, r4, r0
	mov r1, #0xc0
	mov r2, #0x20
	bl GX_LoadOBJPltt
	pop {r4, r5, r6, pc}
	nop
_02082B1C: .word 0x000057E0
	thumb_func_end sub_02082AEC

	thumb_func_start sub_02082B20
sub_02082B20: ; 0x02082B20
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r6, r0, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #3
	bhi _02082B84
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02082B40: ; jump table
	.short _02082B48 - _02082B40 - 2 ; case 0
	.short _02082B5C - _02082B40 - 2 ; case 1
	.short _02082B90 - _02082B40 - 2 ; case 2
	.short _02082CBE - _02082B40 - 2 ; case 3
_02082B48:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02082B84
	mov r0, #1
	str r0, [r5]
	ldr r0, _02082CDC ; =0x000005CC
	mov r1, #0
	str r1, [r4, r0]
	b _02082CCC
_02082B5C:
	ldr r1, _02082CDC ; =0x000005CC
	ldr r2, [r4, r1]
	add r2, r2, #1
	str r2, [r4, r1]
	bl sub_02084FCC
	mov r2, #0x49
	lsl r2, r2, #4
	add r0, r4, r2
	mov r1, #0xcb
	sub r2, #0x30
	lsl r1, r1, #2
	ldr r2, [r4, r2]
	add r1, r4, r1
	bl sub_02084F3C
	ldr r0, _02082CDC ; =0x000005CC
	ldr r1, [r4, r0]
	cmp r1, #5
	bgt _02082B86
_02082B84:
	b _02082CCC
_02082B86:
	mov r1, #2
	str r1, [r5]
	mov r1, #0
	str r1, [r4, r0]
	b _02082CCC
_02082B90:
	ldr r3, _02082CE0 ; =0x0000045C
	ldr r2, [r4, r3]
	cmp r2, #7
	bhi _02082C6A
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02082BA4: ; jump table
	.short _02082C6A - _02082BA4 - 2 ; case 0
	.short _02082C6A - _02082BA4 - 2 ; case 1
	.short _02082C6A - _02082BA4 - 2 ; case 2
	.short _02082C6A - _02082BA4 - 2 ; case 3
	.short _02082BB4 - _02082BA4 - 2 ; case 4
	.short _02082BC8 - _02082BA4 - 2 ; case 5
	.short _02082C14 - _02082BA4 - 2 ; case 6
	.short _02082C40 - _02082BA4 - 2 ; case 7
_02082BB4:
	ldr r2, [r4, #0x34]
	cmp r2, #0
	bne _02082BC0
	bl sub_02082CF8
	str r0, [r5]
_02082BC0:
	add r0, r4, #0
	bl sub_02084FCC
	b _02082C6A
_02082BC8:
	add r1, r6, #0
	bl sub_020834FC
	ldr r0, _02082CE4 ; =0x00000448
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	ldr r0, _02082CE4 ; =0x00000448
	mov r2, #1
	add r0, r4, r0
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0xa
	bl DrawFrameAndWindow2
	mov r3, #0
	mov r2, #6
	ldr r0, _02082CE4 ; =0x00000448
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	str r3, [sp, #8]
	lsl r2, r2, #6
	ldr r2, [r4, r2]
	add r0, r4, r0
	bl AddTextPrinterParameterized
	ldr r1, _02082CE8 ; =0x00000458
	str r0, [r4, r1]
	sub r1, #0x10
	add r0, r4, r1
	bl CopyWindowToVram
	ldr r0, _02082CE0 ; =0x0000045C
	mov r1, #6
	str r1, [r4, r0]
	b _02082C6A
_02082C14:
	sub r0, r3, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02020094
	cmp r0, #0
	bne _02082C6A
	ldr r0, _02082CEC ; =0x000005E2
	bl PlaySE
	ldr r1, _02082CF0 ; =0x000004A8
	mov r2, #0
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	ldr r0, _02082CDC ; =0x000005CC
	sub r1, #0x4c
	str r2, [r4, r0]
	mov r0, #7
	str r0, [r4, r1]
	b _02082C6A
_02082C40:
	ldr r0, _02082CDC ; =0x000005CC
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	ble _02082C6A
	mov r0, #0x10
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	add r3, r1, #0
	bl sub_0200FA24
	mov r0, #3
	str r0, [r5]
_02082C6A:
	ldr r3, _02082CF4 ; =0x00000464
	mov r1, #0xcb
	add r0, r4, r3
	str r0, [sp]
	add r0, r3, #4
	add r0, r4, r0
	lsl r1, r1, #2
	str r0, [sp, #4]
	add r0, r4, r1
	str r0, [sp, #8]
	add r0, r3, #0
	add r0, #0x4c
	ldr r0, [r4, r0]
	add r2, r3, #0
	ldr r0, [r0, #0x14]
	add r1, #0x8c
	str r0, [sp, #0xc]
	mov r0, #0x16
	lsl r0, r0, #4
	sub r3, r3, #4
	sub r2, #8
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	add r1, r4, r1
	add r2, r4, r2
	bl sub_02083D34
	mov r2, #0x49
	lsl r2, r2, #4
	add r0, r4, r2
	mov r1, #0xcb
	sub r2, #0x30
	lsl r1, r1, #2
	ldr r2, [r4, r2]
	add r1, r4, r1
	bl sub_02084F3C
	add r0, r4, #0
	add r0, #0x38
	bl sub_02084500
	b _02082CCC
_02082CBE:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02082CCC
	add sp, #0x10
	mov r0, #1
	pop {r4, r5, r6, pc}
_02082CCC:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202457C
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02082CDC: .word 0x000005CC
_02082CE0: .word 0x0000045C
_02082CE4: .word 0x00000448
_02082CE8: .word 0x00000458
_02082CEC: .word 0x000005E2
_02082CF0: .word 0x000004A8
_02082CF4: .word 0x00000464
	thumb_func_end sub_02082B20

	thumb_func_start sub_02082CF8
sub_02082CF8: ; 0x02082CF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0208432C
	ldr r0, _02082E10 ; =gMain
	mov r1, #4
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02082D9C
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020248B8
	cmp r0, #0
	bne _02082D2A
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_02082D2A:
	ldr r0, [r5]
	cmp r0, #4
	beq _02082D74
	ldr r1, _02082E14 ; =0x0000045C
	mov r0, #0
	str r0, [r5, r1]
	add r2, r1, #4
	ldr r2, [r5, r2]
	add r3, r2, #1
	add r2, r1, #4
	str r3, [r5, r2]
	ldr r2, [r5, r2]
	cmp r2, #3
	blt _02082D4A
	add r1, r1, #4
	str r0, [r5, r1]
_02082D4A:
	mov r2, #0x49
	lsl r2, r2, #4
	add r1, r2, #0
	sub r1, #0x30
	ldr r1, [r5, r1]
	add r0, r5, r2
	lsl r3, r1, #2
	ldr r1, [r0, r3]
	sub r2, #0x30
	add r1, r1, #1
	str r1, [r0, r3]
	add r0, r5, #0
	ldr r1, [r5, r2]
	add r0, #0x3a
	bl sub_02084830
	ldr r0, _02082E18 ; =0x0000069D
	bl PlaySE
	mov r0, #1
	str r0, [r5, #0x30]
_02082D74:
	mov r2, #0x49
	lsl r2, r2, #4
	add r1, r2, #0
	sub r1, #0x30
	ldr r1, [r5, r1]
	add r0, r5, r2
	lsl r3, r1, #2
	ldr r1, [r0, r3]
	sub r2, #0x30
	add r1, r1, #1
	str r1, [r0, r3]
	add r0, r5, #0
	ldr r1, [r5, r2]
	add r0, #0x3a
	bl sub_02084830
	ldr r0, _02082E18 ; =0x0000069D
	bl PlaySE
	b _02082E0A
_02082D9C:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _02082DC2
	ldr r3, [r5, #0x20]
	mov r1, #0x1a
	mul r1, r3
	add r3, r5, r1
	ldr r1, [r5, #0x1c]
	add r0, r5, #0
	lsl r1, r1, #1
	add r1, r3, r1
	ldrh r1, [r1, #0x3a]
	bl sub_02084884
	add r4, r0, #0
	mov r0, #1
	str r0, [r5, #0x30]
	b _02082E0A
_02082DC2:
	ldr r1, _02082E1C ; =0x000005C8
	ldr r1, [r5, r1]
	cmp r1, #1
	bne _02082DE6
	ldr r2, [r5, #0x20]
	mov r1, #0x1a
	mul r1, r2
	add r2, r5, r1
	ldr r1, [r5, #0x1c]
	add r0, r5, #0
	lsl r1, r1, #1
	add r1, r2, r1
	ldrh r1, [r1, #0x3a]
	mov r2, #0
	bl sub_02084884
	add r4, r0, #0
	b _02082E0A
_02082DE6:
	mov r1, #2
	add r3, r0, #0
	tst r3, r1
	beq _02082DFA
	ldr r1, _02082E20 ; =0x0000E007
	add r0, r5, #0
	bl sub_02084884
	add r4, r0, #0
	b _02082E0A
_02082DFA:
	add r1, #0xfe
	tst r0, r1
	beq _02082E0A
	ldr r1, _02082E24 ; =0x0000E006
	add r0, r5, #0
	bl sub_02084884
	add r4, r0, #0
_02082E0A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02082E10: .word gMain
_02082E14: .word 0x0000045C
_02082E18: .word 0x0000069D
_02082E1C: .word 0x000005C8
_02082E20: .word 0x0000E007
_02082E24: .word 0x0000E006
	thumb_func_end sub_02082CF8

	thumb_func_start sub_02082E28
sub_02082E28: ; 0x02082E28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	bne _02082E8A
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02082E52
	bl LCRandom
	mov r1, #0x12
	bl _s32_div_f
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
#ifndef HEARTGOLD
	add r1, #0x2A
#endif
	bl NewString_ReadMsgData
	add r6, r0, #0
	b _02082E6E
_02082E52:
	cmp r0, #1
	bne _02082E6E
	bl LCRandom
	mov r1, #0x12
	bl _s32_div_f
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
#ifdef HEARTGOLD
	add r1, #0x12
#else
	add r1, #0x3C
#endif
	bl NewString_ReadMsgData
	add r6, r0, #0
_02082E6E:
	ldr r0, [r4, #0x18]
	add r1, r6, #0
	bl StringCopy
	add r0, r6, #0
	bl String_dtor
	ldr r0, [r4, #0x18]
	add r4, #0x1c
	add r1, r4, #0
	mov r2, #0xa
	bl CopyStringToU16Array
	pop {r4, r5, r6, pc}
_02082E8A:
	cmp r0, #3
	bne _02082EB8
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
#ifdef HEARTGOLD
	mov r1, #0x54
#else
	mov r1, #0x55
#endif
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl StringCopy
	add r0, r5, #0
	bl String_dtor
	ldr r0, [r4, #0x18]
	add r4, #0x1c
	add r1, r4, #0
	mov r2, #0xa
	bl CopyStringToU16Array
	pop {r4, r5, r6, pc}
_02082EB8:
	mov r0, #1
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02082E28

	thumb_func_start sub_02082EC0
sub_02082EC0: ; 0x02082EC0
	push {r4, r5}
	ldr r1, _02082EE0 ; =0x000001DE
	ldr r2, _02082EE4 ; =0x0000FFFF
	mov r5, #1
	mov r3, #0
_02082ECA:
	ldrh r4, [r0]
	cmp r4, r2
	beq _02082EDA
	cmp r4, r1
	beq _02082ED6
	add r5, r3, #0
_02082ED6:
	add r0, r0, #2
	b _02082ECA
_02082EDA:
	add r0, r5, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02082EE0: .word 0x000001DE
_02082EE4: .word 0x0000FFFF
	thumb_func_end sub_02082EC0

	thumb_func_start sub_02082EE8
sub_02082EE8: ; 0x02082EE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	bl OverlayManager_GetField18
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	ldr r1, _020830C0 ; =0x0000FFFF
	lsl r0, r0, #1
	add r0, r4, r0
	add r0, #0xd8
	strh r1, [r0]
	ldr r0, [r4]
	cmp r0, #1
	bne _02082F32
	mov r0, #0x12
	bl AllocMonZeroed
	mov r3, #0xa
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r4, #4]
	add r6, r0, #0
	mov r2, #5
	bl CreateMon
	add r0, r6, #0
	bl FreeToHeap
_02082F32:
	mov r1, #0x56
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	cmp r0, #0
	beq _02082F58
	add r0, r4, #0
	sub r1, #0x40
	add r0, #0xd8
	add r1, r4, r1
	bl StringNotEqual
	cmp r0, #0
	beq _02082F58
	add r0, r4, #0
	add r0, #0xd8
	bl sub_02082EC0
	cmp r0, #0
	beq _02082F62
_02082F58:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02082E28
	b _02082F86
_02082F62:
	mov r0, #0x46
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0xd8
	bl CopyU16StringArray
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x1c
	add r1, #0xd8
	bl CopyU16StringArray
	add r1, r4, #0
	ldr r0, [r5, #0x18]
	add r1, #0xd8
	bl CopyU16ArrayToString
_02082F86:
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r7, #0xe7
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_02082F98:
	ldr r0, [r5, r7]
	bl sub_02007234
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #7
	blt _02082F98
	mov r0, #0xb1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200AEB0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200AEB0
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200B0A8
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200B0A8
	mov r7, #0xad
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_02082FD6:
	ldr r0, [r5, r7]
	bl sub_0200A0D0
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _02082FD6
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024504
	bl sub_0200B244
	ldr r1, _020830C4 ; =0x000004AC
	mov r0, #0x12
	ldr r1, [r4, r1]
	bl FreeToHeapExplicit
	ldr r0, [r4]
	cmp r0, #1
	bne _02083016
	ldr r1, _020830C8 ; =0x000004B4
	mov r0, #0x12
	ldr r1, [r4, r1]
	bl FreeToHeapExplicit
	ldr r1, _020830CC ; =0x000004BC
	mov r0, #0x12
	ldr r1, [r4, r1]
	bl FreeToHeapExplicit
_02083016:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #7
	bl FreeBgTilemapBuffer
	bl sub_0202168C
	bl sub_02022608
	mov r0, #0x16
	lsl r0, r0, #4
	mov r1, #0xee
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	add r1, r4, r1
	bl sub_02083614
	mov r0, #0
	bl sub_02002D7C
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _020830D0 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	mov r0, #2
	bl sub_02002DB4
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02083060
	bl String_dtor
_02083060:
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	ldr r0, [sp, #0x10]
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x12
	bl DestroyHeap
	ldr r0, _020830D4 ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020830C0: .word 0x0000FFFF
_020830C4: .word 0x000004AC
_020830C8: .word 0x000004B4
_020830CC: .word 0x000004BC
_020830D0: .word 0xFFFF1FFF
_020830D4: .word gMain + 0x60
	thumb_func_end sub_02082EE8

	thumb_func_start sub_020830D8
sub_020830D8: ; 0x020830D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x54
	str r0, [sp]
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r0, _02083118 ; =0x0000FFFF
	ldr r1, [sp]
	strh r0, [r4, #0x1c]
	mov r0, #0x20
	bl String_ctor
	str r0, [r4, #0x18]
	mov r1, #0
	str r1, [r4, #0x44]
	str r1, [r4, #0x48]
	ldr r0, [sp, #0x18]
	str r1, [r4, #0x10]
	str r0, [r4, #0x4c]
	ldr r0, [sp, #0x1c]
	str r1, [r4, #8]
	str r0, [r4, #0x50]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02083118: .word 0x0000FFFF
	thumb_func_end sub_020830D8

	thumb_func_start sub_0208311C
sub_0208311C: ; 0x0208311C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _0208312A
	bl GF_AssertFail
_0208312A:
	cmp r4, #0
	bne _02083132
	bl GF_AssertFail
_02083132:
	ldr r0, [r4, #0x18]
	bl String_dtor
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_0208311C

	thumb_func_start sub_02083140
sub_02083140: ; 0x02083140
	push {r3, lr}
	bl sub_0202061C
	bl sub_0200B224
	ldr r3, _02083158 ; =OS_IRQTable
	ldr r1, _0208315C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	.balign 4, 0
_02083158: .word OS_IRQTable
_0208315C: .word 0x00003FF8
	thumb_func_end sub_02083140

	thumb_func_start sub_02083160
sub_02083160: ; 0x02083160
	ldr r2, [r1]
	str r2, [r0]
	ldr r2, [r1, #4]
	str r2, [r0, #4]
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	ldr r2, [r1, #0xc]
	str r2, [r0, #0xc]
	ldr r2, [r1, #0x10]
	str r2, [r0, #0x10]
	ldr r2, [r1, #0x4c]
	str r2, [r0, #0x18]
	ldr r2, [r1, #0x50]
	mov r1, #0x5d
	lsl r1, r1, #4
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02083160

	thumb_func_start sub_02083184
sub_02083184: ; 0x02083184
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _020831A0 ; =_02102140
	add r3, sp, #0
	mov r2, #5
_0208318E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0208318E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_020831A0: .word _02102140
	thumb_func_end sub_02083184

	thumb_func_start sub_020831A4
sub_020831A4: ; 0x020831A4
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _020832C8 ; =_02101D60
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _020832CC ; =_02101ED4
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
	ldr r5, _020832D0 ; =_02101FB4
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
	ldr r5, _020832D4 ; =_02102078
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
	ldr r5, _020832D8 ; =_02101E10
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	bl sub_020832E4
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x12
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x12
	bl BG_ClearCharDataRange
	mov r0, #1
	lsl r0, r0, #0x1a
	add r4, r0, #0
	ldr r2, [r0]
	ldr r1, _020832DC ; =0xFFFF1FFF
	add r4, #0x48
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	ldrh r3, [r4]
	mov r2, #0x3f
	mov r1, #0x14
	bic r3, r2
	orr r1, r3
	mov r3, #0x20
	orr r1, r3
	strh r1, [r4]
	add r4, r0, #0
	add r4, #0x4a
	ldrh r5, [r4]
	mov r1, #0x1f
	bic r5, r2
	orr r1, r5
	orr r1, r3
	strh r1, [r4]
	add r1, r0, #0
	mov r2, #0xff
	add r1, #0x40
	strh r2, [r1]
	mov r1, #0x40
	add r0, #0x44
	strh r1, [r0]
	ldr r0, _020832E0 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020832C8: .word _02101D60
_020832CC: .word _02101ED4
_020832D0: .word _02101FB4
_020832D4: .word _02102078
_020832D8: .word _02101E10
_020832DC: .word 0xFFFF1FFF
_020832E0: .word 0x04001050
	thumb_func_end sub_020831A4

	thumb_func_start sub_020832E4
sub_020832E4: ; 0x020832E4
	push {r4, lr}
	add r4, r0, #0
	lsl r1, r4, #0x18
	mov r0, #1
	lsr r1, r1, #0x18
	bl GX_EngineAToggleLayers
	lsl r1, r4, #0x18
	mov r0, #2
	lsr r1, r1, #0x18
	bl GX_EngineAToggleLayers
	lsl r1, r4, #0x18
	mov r0, #4
	lsr r1, r1, #0x18
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	lsl r1, r4, #0x18
	mov r0, #0x10
	lsr r1, r1, #0x18
	bl GX_EngineAToggleLayers
	lsl r1, r4, #0x18
	mov r0, #1
	lsr r1, r1, #0x18
	bl sub_02022CC8
	mov r0, #2
	mov r1, #0
	bl sub_02022CC8
	mov r0, #0x10
	mov r1, #0
	bl sub_02022CC8
	pop {r4, pc}
	thumb_func_end sub_020832E4

	thumb_func_start sub_02083334
sub_02083334: ; 0x02083334
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, r1, #0
	bl OverlayManager_GetField18
	add r7, r0, #0
	ldr r0, _020834E4 ; =0x0000045C
	mov r1, #4
	str r1, [r4, r0]
	add r0, #0xc
	add r0, r4, r0
	mov r1, #0
	bl sub_0208423C
	ldr r6, _020834E8 ; =0x00000464
	mov r0, #0x16
	ldr r3, [r4, r6]
	mov r5, #0xc
	lsl r0, r0, #4
	lsl r1, r3, #0x18
	mul r5, r3
	add r3, r4, r5
	add r5, r6, #4
	ldr r0, [r4, r0]
	ldr r3, [r3, r5]
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0201BC8C
	ldr r3, [r4, r6]
	mov r5, #0xc
	mov r0, #0x16
	lsl r0, r0, #4
	lsl r1, r3, #0x18
	mul r5, r3
	add r3, r4, r5
	add r6, #8
	ldr r0, [r4, r0]
	ldr r3, [r3, r6]
	lsr r1, r1, #0x18
	mov r2, #3
	bl sub_0201BC8C
	ldr r6, _020834E8 ; =0x00000464
	mov r0, #1
	ldr r1, [r4, r6]
	mov r5, #0xc
	add r3, r1, #0
	eor r3, r0
	mov r0, #0x16
	lsl r0, r0, #4
	lsl r1, r3, #0x18
	mul r5, r3
	add r3, r4, r5
	add r5, r6, #4
	ldr r0, [r4, r0]
	ldr r3, [r3, r5]
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0201BC8C
	ldr r1, [r4, r6]
	mov r0, #1
	add r3, r1, #0
	eor r3, r0
	mov r5, #0xc
	mov r0, #0x16
	lsl r0, r0, #4
	lsl r1, r3, #0x18
	mul r5, r3
	add r3, r4, r5
	add r6, #8
	ldr r0, [r4, r0]
	ldr r3, [r3, r6]
	lsr r1, r1, #0x18
	mov r2, #3
	bl sub_0201BC8C
	mov r1, #0x46
	ldr r0, _020834EC ; =0x0000FFFF
	lsl r1, r1, #2
	strh r0, [r4, r1]
	ldr r0, [r7, #0x18]
	cmp r0, #0
	beq _020833E8
	add r1, r4, r1
	mov r2, #0x20
	bl CopyStringToU16Array
_020833E8:
	add r1, r4, #0
	mov r0, #1
	add r1, #0xd8
	mov r2, #0x40
	bl MIi_CpuClear16
	ldr r0, [r4]
	cmp r0, #1
	bne _0208342E
	mov r0, #0x12
	bl AllocMonZeroed
	mov r3, #0xa
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r4, #4]
	add r5, r0, #0
	mov r2, #5
	bl CreateMon
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferBoxMonSpeciesName
	add r0, r5, #0
	bl FreeToHeap
_0208342E:
	ldr r0, [r7, #0x44]
	cmp r0, #0
	beq _02083438
	mov r0, #1
	str r0, [r4, #0x14]
_02083438:
	ldr r2, [r4]
	mov r1, #0x5a
	lsl r1, r1, #2
	lsl r3, r2, #2
	ldr r2, _020834F0 ; =_021020B4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r2, [r2, r3]
	ldr r1, [r4, r1]
	mov r3, #0x12
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x10
	sub r1, #0xc
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #9
	mov r3, #0x12
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x10
	ldr r0, [r4, r1]
	mov r1, #7
	bl NewString_ReadMsgData
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x6c
	add r0, r4, r1
	bl StringLength
	mov r1, #0x56
	lsl r1, r1, #2
	strh r0, [r4, r1]
	mov r0, #0
	mov r2, #1
	str r0, [r4, #0x1c]
	str r2, [r4, #0x20]
	sub r1, r2, #2
	str r1, [r4, #0x24]
	str r1, [r4, #0x28]
	str r2, [r4, #0x30]
	ldr r2, _020834F4 ; =0x00000484
	str r0, [r4, #0x34]
	str r1, [r4, r2]
	add r1, r2, #4
	str r0, [r4, r1]
	add r2, #8
	str r0, [r4, r2]
	ldr r1, [r4, #0xc]
	ldr r2, _020834EC ; =0x0000FFFF
	lsl r1, r1, #1
	add r1, r4, r1
	add r1, #0xd8
	strh r2, [r1]
	mov r1, #0x49
	add r3, r4, #0
	add r2, r0, #0
	lsl r1, r1, #4
_020834BE:
	add r0, r0, #1
	str r2, [r3, r1]
	add r3, r3, #4
	cmp r0, #7
	blt _020834BE
	ldr r0, [r4]
	cmp r0, #4
	bne _020834D8
	ldr r0, _020834F8 ; =0x0000049C
	mov r1, #1
	add sp, #0x10
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020834D8:
	mov r0, #0x49
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020834E4: .word 0x0000045C
_020834E8: .word 0x00000464
_020834EC: .word 0x0000FFFF
_020834F0: .word _021020B4
_020834F4: .word 0x00000484
_020834F8: .word 0x0000049C
	thumb_func_end sub_02083334

	thumb_func_start sub_020834FC
sub_020834FC: ; 0x020834FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, r1, #0
	bl OverlayManager_GetField18
	add r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0208360C
	mov r0, #0xc8
	mov r1, #0x12
	bl String_ctor
	add r7, r0, #0
	mov r0, #6
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r5, r0]
	ldr r0, [r4, #0x48]
	bl PCStorage_GetActiveBox
	add r6, r0, #0
	ldr r0, [r4, #0x48]
	bl PCStorage_FindFirstBoxWithEmptySlot
	str r0, [sp, #0x10]
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x48]
	mov r1, #1
	add r3, r6, #0
	bl sub_0200C490
	ldr r0, [sp, #0x10]
	cmp r6, r0
	beq _02083560
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x48]
	ldr r3, [sp, #0x10]
	mov r1, #2
	bl sub_0200C490
	ldr r0, [r4, #0x44]
	add r0, r0, #2
	str r0, [r4, #0x44]
	b _02083570
_02083560:
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x48]
	mov r1, #2
	add r3, r6, #0
	bl sub_0200C490
_02083570:
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _02083586
	add r0, r5, #0
	add r0, #0xd8
	bl sub_02082EC0
	cmp r0, #0
	beq _020835BC
_02083586:
	mov r0, #0x12
	bl AllocMonZeroed
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r5, #4]
	add r6, r0, #0
	mov r2, #1
	bl CreateMon
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl BufferBoxMonSpeciesName
	add r0, r6, #0
	bl FreeToHeap
	b _020835EA
_020835BC:
	mov r1, #0x56
	lsl r1, r1, #2
	ldrh r1, [r5, r1]
	ldr r0, _02083610 ; =0x0000FFFF
	lsl r1, r1, #1
	add r1, r5, r1
	add r1, #0xd8
	strh r0, [r1]
	add r1, r5, #0
	add r0, r7, #0
	add r1, #0xd8
	bl CopyU16ArrayToString
	mov r1, #0
	str r1, [sp]
	mov r0, #0x5a
	str r1, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r7, #0
	add r3, r1, #0
	bl BufferString
_020835EA:
	mov r1, #0x5a
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, #0xc
	ldr r1, [r5, r1]
	ldr r2, [r4, #0x44]
	mov r3, #0x12
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #1
	str r0, [r5, #0x14]
	add r0, r7, #0
	bl String_dtor
_0208360C:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02083610: .word 0x0000FFFF
	thumb_func_end sub_020834FC

	thumb_func_start sub_02083614
sub_02083614: ; 0x02083614
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
_0208361C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xa
	blt _0208361C
	add r0, r6, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r6, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r6, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r6, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	mov r0, #0x12
	add r1, r6, #0
	bl FreeToHeapExplicit
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02083614

	thumb_func_start sub_02083654
sub_02083654: ; 0x02083654
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r6, [r5, r0]
	mov r0, #0x60
	add r4, r1, #0
	mov r1, #0
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02007B8C
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0xe
	mov r1, #0x47
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x12
	mov r1, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #4
	add r2, r6, #0
	mov r3, #2
	bl sub_02007B68
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	add r2, r6, #0
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	mov r0, #0xe
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #6
	add r2, r6, #0
	bl sub_02007B68
	mov r3, #0
	mov r0, #0xe
	str r3, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #7
	add r2, r6, #0
	bl sub_02007B68
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x12
	bl sub_0200304C
	ldr r0, [r5, #0x18]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x16
	lsl r0, r0, #4
	mov r1, #4
	add r2, r1, #0
	ldr r0, [r5, r0]
	add r2, #0xfc
	mov r3, #0xa
	bl sub_0200E644
	mov r1, #6
	mov r0, #4
	lsl r1, r1, #6
	mov r2, #0x12
	bl sub_0200304C
	mov r3, #0x4b
	mov r0, #0x12
	lsl r3, r3, #4
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #1
	add r3, r5, r3
	bl sub_02007C10
	ldr r1, _02083778 ; =0x000004AC
	str r0, [r5, r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02083778: .word 0x000004AC
	thumb_func_end sub_02083654

	thumb_func_start sub_0208377C
sub_0208377C: ; 0x0208377C
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _020837A8 ; =_02101D70
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x12
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_020837A8: .word _02101D70
	thumb_func_end sub_0208377C

	thumb_func_start sub_020837AC
sub_020837AC: ; 0x020837AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	bl NNS_G2dInitOamManagerModule
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _020839A4 ; =0xFFCFFFEF
	add r3, r1, #0
	and r3, r0
	mov r1, #0x10
	orr r3, r1
	str r3, [r2]
	ldr r3, _020839A8 ; =0x04001000
	ldr r2, [r3]
	and r0, r2
	orr r0, r1
	str r0, [r3]
	mov r0, #0
	str r0, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x12
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl sub_0200B150
	mov r1, #0x63
	lsl r1, r1, #2
	mov r0, #0x2c
	add r1, r5, r1
	mov r2, #0x12
	bl sub_02009F40
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #4
	mov r2, #1
	add r0, r5, r0
	mov r1, #0
	lsl r2, r2, #0x14
	bl sub_02009FC8
	mov r6, #0
	add r4, r5, #0
_02083812:
	mov r0, #2
	add r1, r6, #0
	mov r2, #0x12
	bl sub_0200A090
	mov r1, #0xad
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02083812
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	add r0, r1, #0
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #0xa
	bl sub_0200A3C8
	mov r1, #0xb1
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #0x12
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	bl sub_0200A480
	mov r1, #0xb2
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x12
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xc
	mov r3, #1
	bl sub_0200A540
	mov r1, #0xb3
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x12
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xe
	mov r3, #1
	bl sub_0200A540
	mov r1, #0x2d
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5]
	cmp r0, #1
	bne _020838FC
	ldr r0, [r5, #4]
	ldr r2, [r5, #8]
	mov r1, #0
	bl sub_020741BC
	ldr r3, _020839AC ; =0x000004B8
	add r1, r0, #0
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x14
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetCharData
	ldr r1, _020839B0 ; =0x000004B4
	str r0, [r5, r1]
	add r0, r1, #4
	mov r1, #2
	ldr r0, [r5, r0]
	lsl r1, r1, #8
	bl DC_FlushRange
	bl sub_02074490
	mov r2, #0x13
	lsl r2, r2, #6
	add r1, r0, #0
	mov r0, #0x14
	add r2, r5, r2
	mov r3, #0x12
	bl GfGfxLoader_GetPlttData
	ldr r1, _020839B4 ; =0x000004BC
	str r0, [r5, r1]
	add r0, r1, #4
	ldr r0, [r5, r0]
	mov r1, #0x80
	bl DC_FlushRange
_020838FC:
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #0xb
	bl sub_0200A3C8
	mov r1, #0xb5
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #1
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x12
	sub r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r3, #0
	bl sub_0200A480
	mov r1, #0xb6
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x12
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xd
	bl sub_0200A540
	mov r1, #0xb7
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x12
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xf
	bl sub_0200A540
	mov r1, #0x2e
	lsl r1, r1, #4
	str r0, [r5, r1]
	sub r1, #0x1c
	ldr r0, [r5, r1]
	bl sub_0200ACF0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200ACF0
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020839A4: .word 0xFFCFFFEF
_020839A8: .word 0x04001000
_020839AC: .word 0x000004B8
_020839B0: .word 0x000004B4
_020839B4: .word 0x000004BC
	thumb_func_end sub_020837AC

	thumb_func_start sub_020839B8
sub_020839B8: ; 0x020839B8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r0, [r4]
	bl sub_020248AC
	ldr r1, [r0]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsl r1, r0, #4
	ldr r0, _020839E8 ; =_021021E8 + 4
	ldr r0, [r0, r1]
	add r1, sp, #0
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_020839E8: .word _021021E8 + 4
	thumb_func_end sub_020839B8

	thumb_func_start sub_020839EC
sub_020839EC: ; 0x020839EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r2, #0xad
	str r1, [sp, #0xc]
	mov r0, #1
	lsl r2, r2, #2
	str r0, [sp, #0x10]
	ldr r0, [r6, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r6, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r6, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r6, r0]
	add r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r6, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl sub_02009D48
	mov r1, #1
	mov r3, #0xad
	str r1, [sp]
	sub r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r6, r2]
	add r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, r3
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02009D48
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #2
	str r0, [sp, #0x2c]
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r6, r0
	str r0, [sp, #0x30]
	mov r0, #6
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	str r0, [sp, #0x38]
	lsr r0, r1, #5
	mov r7, #0
	str r1, [sp, #0x34]
	str r7, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r7, [r0, #0x20]
	mov r0, #1
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	mov r0, #0x12
	ldr r4, _02083BAC ; =_021021E8
	str r0, [sp, #0x58]
	add r5, r6, #0
_02083AA8:
	ldr r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r4, #4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl sub_02024624
	mov r1, #0xcb
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0202484C
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r4, #8]
	bl sub_020248F0
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r4, #0xc]
	bl sub_02024ADC
	add r7, r7, #1
	add r4, #0x10
	add r5, r5, #4
	cmp r7, #9
	blt _02083AA8
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_02024830
	ldr r7, _02083BAC ; =_021021E8
	mov r5, #0
	add r4, r6, #0
_02083AFE:
	ldr r0, _02083BB0 ; =sub_020839B8
	mov r1, #0x10
	mov r2, #5
	mov r3, #0x12
	bl sub_02007200
	mov r1, #0xe7
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	bl sub_0201F988
	mov r1, #0xd2
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	str r1, [r0]
	mov r1, #0xcb
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r4, r4, #4
	str r1, [r0, #4]
	ldr r1, [r7]
	add r7, #0x10
	lsl r1, r1, #0xc
	str r1, [r0, #8]
	str r5, [r0, #0xc]
	add r5, r5, #1
	cmp r5, #7
	blt _02083AFE
	ldr r2, [r6, #0xc]
	mov r7, #0
	cmp r2, #0
	ble _02083B7E
	mov r5, #0x50
	add r4, r6, #0
_02083B46:
	lsl r0, r5, #0xc
	str r0, [sp, #0x34]
	mov r0, #0x27
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl sub_02024624
	mov r1, #0xd9
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0202484C
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x2b
	bl sub_020248F0
	ldr r2, [r6, #0xc]
	add r7, r7, #1
	add r5, #0xc
	add r4, r4, #4
	cmp r7, r2
	blt _02083B46
_02083B7E:
	mov r1, #0x56
	lsl r1, r1, #2
	mov r0, #0xd9
	lsl r0, r0, #2
	ldrh r1, [r6, r1]
	add r0, r6, r0
	bl sub_02084E18
	add r0, r6, #0
	add r1, sp, #0x2c
	bl sub_02083BB4
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl sub_02022CC8
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02083BAC: .word _021021E8
_02083BB0: .word sub_020839B8
	thumb_func_end sub_020839EC

	thumb_func_start sub_02083BB4
sub_02083BB4: ; 0x02083BB4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #6
	add r5, r1, #0
	lsl r0, r0, #0xe
	str r0, [r5, #8]
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [r5, #0xc]
	add r0, r5, #0
	bl sub_02024624
	mov r1, #0xe5
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl sub_0202484C
	ldr r0, [r4]
	cmp r0, #7
	bhi _02083CAA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02083BEC: ; jump table
	.short _02083BFC - _02083BEC - 2 ; case 0
	.short _02083C64 - _02083BEC - 2 ; case 1
	.short _02083C56 - _02083BEC - 2 ; case 2
	.short _02083C1E - _02083BEC - 2 ; case 3
	.short _02083C48 - _02083BEC - 2 ; case 4
	.short _02083C3A - _02083BEC - 2 ; case 5
	.short _02083C2C - _02083BEC - 2 ; case 6
	.short _02083C48 - _02083BEC - 2 ; case 7
_02083BFC:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02083C10
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x30
	bl sub_020248F0
	pop {r3, r4, r5, pc}
_02083C10:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x31
	bl sub_020248F0
	pop {r3, r4, r5, pc}
_02083C1E:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x33
	bl sub_020248F0
	pop {r3, r4, r5, pc}
_02083C2C:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x37
	bl sub_020248F0
	pop {r3, r4, r5, pc}
_02083C3A:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x36
	bl sub_020248F0
	pop {r3, r4, r5, pc}
_02083C48:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl sub_020248F0
	pop {r3, r4, r5, pc}
_02083C56:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x2f
	bl sub_020248F0
	pop {r3, r4, r5, pc}
_02083C64:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x32
	bl sub_020248F0
	ldr r0, [r4, #0x10]
	cmp r0, #2
	beq _02083CAA
	ldr r1, [r4, #0xc]
	mov r0, #0xd
	mul r0, r1
	add r0, #0x50
	lsl r0, r0, #0xc
	str r0, [r5, #8]
	mov r0, #0x1b
	lsl r0, r0, #0xc
	str r0, [r5, #0xc]
	add r0, r5, #0
	bl sub_02024624
	mov r1, #0xe6
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	ldr r0, [r4, r1]
	bne _02083CA4
	mov r1, #0x2d
	bl sub_020248F0
	pop {r3, r4, r5, pc}
_02083CA4:
	mov r1, #0x2e
	bl sub_020248F0
_02083CAA:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02083BB4

	thumb_func_start sub_02083CAC
sub_02083CAC: ; 0x02083CAC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	cmp r0, #6
	bhi _02083D2A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02083CCE: ; jump table
	.short _02083CDC - _02083CCE - 2 ; case 0
	.short _02083D2A - _02083CCE - 2 ; case 1
	.short _02083CF0 - _02083CCE - 2 ; case 2
	.short _02083D2A - _02083CCE - 2 ; case 3
	.short _02083D04 - _02083CCE - 2 ; case 4
	.short _02083D2A - _02083CCE - 2 ; case 5
	.short _02083D18 - _02083CCE - 2 ; case 6
_02083CDC:
	mov r0, #1
	ldr r1, [r4, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r4]
	add r1, sp, #0
	bl sub_020247D4
	b _02083D2A
_02083CF0:
	mov r0, #3
	ldr r1, [r4, #8]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp]
	ldr r0, [r4]
	add r1, sp, #0
	bl sub_020247D4
	b _02083D2A
_02083D04:
	mov r0, #2
	ldr r1, [r4, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r4]
	add r1, sp, #0
	bl sub_020247D4
	b _02083D2A
_02083D18:
	ldr r0, [r4, #8]
	add r1, sp, #0
	str r0, [sp]
	ldr r0, [r4]
	bl sub_020247D4
	add r0, r5, #0
	bl sub_02007234
_02083D2A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02083CAC

	thumb_func_start sub_02083D34
sub_02083D34: ; 0x02083D34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x40]
	add r5, r2, #0
	str r1, [sp, #0x40]
	ldr r1, [sp, #0x48]
	mov r2, #1
	str r1, [sp, #0x48]
	ldr r1, [sp, #0x40]
	str r0, [sp, #0x10]
	ldr r6, [r1]
	add r7, r3, #0
	add r1, r6, #0
	eor r1, r2
	str r1, [sp, #0x18]
	ldr r1, [r5]
	ldr r4, [sp, #0x44]
	cmp r1, #4
	bls _02083D5E
	b _02083F02
_02083D5E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02083D6A: ; jump table
	.short _02083D74 - _02083D6A - 2 ; case 0
	.short _02083DC0 - _02083D6A - 2 ; case 1
	.short _02083DE6 - _02083D6A - 2 ; case 2
	.short _02083E80 - _02083D6A - 2 ; case 3
	.short _02083F02 - _02083D6A - 2 ; case 4
_02083D74:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xe
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	mov r0, #0x1f
	add r1, r7, #6
	add r3, r6, #0
	bl GfGfxLoader_LoadScrnData
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0208423C
	ldr r0, _02083F08 ; =_02101D40
	lsl r2, r6, #4
	ldrb r1, [r0, r7]
	ldr r0, [sp, #0x4c]
	ldr r3, _02083F0C ; =0x000E0F00
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r0, r0, r2
	lsl r2, r1, #4
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	add r2, r7, #0
	bl sub_02084E54
	ldr r0, [r5]
	add sp, #0x28
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02083DC0:
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	mov r2, #0
	mov r3, #0xee
	bl sub_0201BC8C
	mov r2, #3
	lsl r1, r6, #0x18
	add r3, r2, #0
	ldr r0, [sp, #0x10]
	lsr r1, r1, #0x18
	sub r3, #0x53
	bl sub_0201BC8C
	ldr r0, [r5]
	add sp, #0x28
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02083DE6:
	mov r1, #0xc
	add r0, r6, #0
	mul r0, r1
	ldr r2, [r4, r0]
	str r0, [sp, #0x1c]
	sub r2, #0x18
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	sub r1, #0xd
	cmp r0, r1
	bge _02083E3E
	ldr r0, _02083F10 ; =sub_02083CAC
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x12
	bl sub_02007200
	bl sub_0201F988
	add r7, r0, #0
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x1c]
	str r0, [r7]
	mov r0, #0
	str r0, [r7, #4]
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x1c]
	bl sub_020248AC
	ldr r0, [r0]
	str r0, [r7, #8]
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x1c]
	bl sub_020248AC
	ldr r0, [r0, #4]
	mov r1, #0xa
	str r0, [r7, #0xc]
	ldr r0, [sp, #0x1c]
	mvn r1, r1
	str r1, [r4, r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_02083E3E:
	ldr r0, [sp, #0x18]
	mov r1, #0xc
	add r7, r0, #0
	add r5, r4, #4
	mul r7, r1
	ldr r0, [r5, r7]
	sub r0, #0xa
	str r0, [r5, r7]
	add r0, r1, #0
	ldr r2, [r5, r7]
	sub r0, #0xd0
	cmp r2, r0
	bge _02083E5C
	sub r1, #0xd0
	str r1, [r5, r7]
_02083E5C:
	ldr r3, [sp, #0x1c]
	lsl r1, r6, #0x18
	ldr r0, [sp, #0x10]
	ldr r3, [r4, r3]
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0201BC8C
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	lsl r1, r1, #0x18
	ldr r3, [r5, r7]
	lsr r1, r1, #0x18
	mov r2, #3
	bl sub_0201BC8C
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_02083E80:
	ldr r1, [sp, #0x18]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	str r2, [sp, #0x20]
	add r7, r4, #4
	ldr r2, [r7, r2]
	ldr r1, [sp, #0x20]
	sub r2, #0xa
	str r2, [r7, r1]
	ldr r2, [r7, r1]
	add r1, r0, #0
	sub r1, #0xd0
	cmp r2, r1
	bge _02083EA4
	ldr r1, [sp, #0x20]
	sub r0, #0xd0
	str r0, [r7, r1]
_02083EA4:
	mov r0, #0xc
	mul r0, r6
	str r0, [sp, #0x24]
	ldr r3, [sp, #0x24]
	lsl r1, r6, #0x18
	ldr r0, [sp, #0x10]
	ldr r3, [r4, r3]
	lsr r1, r1, #0x18
	mov r2, #0
	bl sub_0201BC8C
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x20]
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x10]
	ldr r3, [r7, r3]
	lsr r1, r1, #0x18
	mov r2, #3
	bl sub_0201BC8C
	ldr r0, [sp, #0x24]
	mov r1, #0xa
	ldr r0, [r4, r0]
	mvn r1, r1
	cmp r0, r1
	bne _02083F02
	ldr r0, [sp, #0x20]
	sub r1, #0xb9
	ldr r0, [r7, r0]
	cmp r0, r1
	bne _02083F02
	ldr r0, [r5]
	add r2, r4, #0
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [sp, #0x40]
	ldr r1, [r0]
	mov r0, #1
	eor r1, r0
	ldr r0, [sp, #0x40]
	str r1, [r0]
	ldr r0, [sp, #0x10]
	bl sub_0208421C
	ldr r0, _02083F14 ; =0x0000069A
	bl PlaySE
_02083F02:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02083F08: .word _02101D40
_02083F0C: .word 0x000E0F00
_02083F10: .word sub_02083CAC
_02083F14: .word 0x0000069A
	thumb_func_end sub_02083D34

	thumb_func_start sub_02083F18
sub_02083F18: ; 0x02083F18
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0xa
	add r5, r0, #0
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02083F18

	thumb_func_start sub_02083F48
sub_02083F48: ; 0x02083F48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r2, #0
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	mov r4, #0x10
	bl sub_02002F30
	add r6, r0, #0
	add r0, r5, #0
	bl GetWindowWidth
	lsl r1, r0, #3
	add r0, r6, #0
	add r0, #0x10
	cmp r0, r1
	ble _02083F70
	sub r4, r1, r6
_02083F70:
	add r0, r5, #0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _02083F98 ; =0x000E0F01
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r7, #0
	add r3, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02083F98: .word 0x000E0F01
	thumb_func_end sub_02083F48

	thumb_func_start sub_02083F9C
sub_02083F9C: ; 0x02083F9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	mov r1, #1
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, #0xf4
	str r0, [sp, #0x10]
	mov r0, #0x16
	lsl r0, r0, #4
	mov r1, #0xee
	lsl r1, r1, #2
	add r4, r2, #0
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r2, #1
	mov r1, #0xf2
	lsl r1, r1, #2
	str r2, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x8e
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	sub r0, #0xd8
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, [r5]
	cmp r0, #4
	bne _02084040
	mov r0, #0
	str r0, [sp]
	mov r0, #0xe
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r3, #1
	mov r2, #0x16
	str r3, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #9
	bl sub_02007B68
	mov r0, #0x46
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x3a
	bl sub_02084830
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	sub r0, #0xe8
	ldr r1, [r1, #0x14]
	ldr r3, _02084200 ; =0x000E0F00
	str r1, [sp]
	ldr r1, _02084204 ; =0x00000A0A
	add r0, r5, r0
	mov r2, #4
	bl sub_02084E54
	b _0208406A
_02084040:
	mov r0, #0x46
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x3a
	bl sub_02084830
	mov r1, #0x4b
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	ldr r3, _02084200 ; =0x000E0F00
	ldr r0, [r0, #0x14]
	mov r2, #0
	str r0, [sp]
	add r0, r1, #0
	sub r0, #0xe8
	add r0, r5, r0
	sub r1, #0xac
	bl sub_02084E54
_0208406A:
	mov r2, #2
	str r2, [sp]
	mov r3, #0x16
	str r3, [sp, #4]
	mov r1, #0x37
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r1, r1, #4
	str r1, [sp, #0x10]
	lsl r0, r3, #4
	add r1, #0x68
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #7
	bl AddWindowParameterized
	ldr r1, [r5, #0xc]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	asr r0, r0, #3
	add r4, r0, #1
	mov r0, #3
	str r0, [sp]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r2, #2
	mov r1, #0xe7
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	mov r0, #0x16
	str r1, [sp, #0x10]
	lsl r0, r0, #4
	add r1, #0x4c
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #0xa
	bl AddWindowParameterized
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #3
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r2, #2
	mov r1, #0xf
	add r4, #9
	lsl r3, r4, #0x18
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r1, r1, #6
	mov r0, #0x16
	str r1, [sp, #0x10]
	lsl r0, r0, #4
	add r1, #0x78
	ldr r0, [r5, r0]
	add r1, r5, r1
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, _02084208 ; =0x00000438
	mov r1, #1
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r1, [r5]
	cmp r1, #5
	bne _02084122
	mov r2, #0x61
	ldr r0, _02084208 ; =0x00000438
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl sub_02083F48
	ldr r0, _02084208 ; =0x00000438
	add r0, r5, r0
	bl CopyWindowToVram
_02084122:
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	ldr r1, _0208420C ; =0x00000448
	str r2, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0x84
	str r0, [sp, #0x10]
	add r0, #0xdc
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _0208420C ; =0x00000448
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r2, #0x5e
	ldr r0, _0208420C ; =0x00000448
	lsl r2, r2, #2
	ldr r1, [r5]
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl sub_02083F18
	add r0, r6, #0
	bl OverlayManager_GetField18
	mov r1, #0x46
	lsl r1, r1, #2
	ldrh r2, [r5, r1]
	ldr r0, _02084210 ; =0x0000FFFF
	cmp r2, r0
	beq _02084198
	add r0, r5, #0
	add r0, #0xd8
	add r1, r5, r1
	bl CopyU16StringArray
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	add r1, r5, #0
	ldr r0, _02084214 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
_02084198:
	mov r0, #0xee
	lsl r0, r0, #2
	mov r4, #0
	add r7, r5, r0
_020841A0:
	add r0, r4, #4
	lsl r6, r0, #4
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x78
	str r0, [sp, #0x10]
	add r0, #0xe8
	ldr r0, [r5, r0]
	add r1, r7, r6
	mov r2, #2
	mov r3, #0
	bl AddWindowParameterized
	add r0, r7, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	cmp r4, #3
	blt _020841A0
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	ldr r1, _02084218 ; =0x00000428
	str r3, [sp, #0xc]
	mov r0, #0x84
	str r0, [sp, #0x10]
	add r0, #0xdc
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl AddWindowParameterized
	ldr r0, _02084218 ; =0x00000428
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02084200: .word 0x000E0F00
_02084204: .word 0x00000A0A
_02084208: .word 0x00000438
_0208420C: .word 0x00000448
_02084210: .word 0x0000FFFF
_02084214: .word 0x000E0F01
_02084218: .word 0x00000428
	thumb_func_end sub_02083F9C

	thumb_func_start sub_0208421C
sub_0208421C: ; 0x0208421C
	push {r4, lr}
	add r4, r1, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	mov r1, #1
	bl sub_0201BB68
	mov r0, #1
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #2
	bl sub_0201BB68
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208421C

	thumb_func_start sub_0208423C
sub_0208423C: ; 0x0208423C
	push {r3, r4}
	mov r3, #0xc
	add r4, r1, #0
	mul r4, r3
	mov r2, #0xee
	str r2, [r0, r4]
	add r2, r3, #0
	sub r2, #0x5c
	add r4, r0, r4
	str r2, [r4, #4]
	mov r4, #1
	eor r1, r4
	mul r3, r1
	sub r4, #0xc
	str r4, [r0, r3]
	add r0, r0, r3
	str r2, [r0, #4]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208423C

	thumb_func_start sub_02084264
sub_02084264: ; 0x02084264
	cmp r0, r2
	blt _0208426A
	add r0, r1, #0
_0208426A:
	cmp r0, r1
	bge _02084270
	sub r0, r2, #1
_02084270:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02084264

	thumb_func_start sub_02084274
sub_02084274: ; 0x02084274
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	cmp r1, #0
	beq _02084318
	ldr r3, [r5, #0x20]
	mov r2, #0x1a
	mul r2, r3
	ldr r0, [r5, #0x1c]
	add r3, r5, r2
	lsl r2, r0, #1
	add r2, r3, r2
	ldrh r2, [r2, #0x3a]
	lsl r6, r1, #3
	ldr r1, _0208431C ; =_02102168
	str r2, [sp]
	ldr r1, [r1, r6]
	mov r2, #0xd
	add r0, r0, r1
	mov r1, #0
	bl sub_02084264
	add r4, r0, #0
	ldr r0, _02084320 ; =_02102168 + 4
	ldr r1, [r5, #0x20]
	ldr r0, [r0, r6]
	mov r2, #6
	add r0, r1, r0
	mov r1, #0
	bl sub_02084264
	add r7, r0, #0
	ldr r0, _0208431C ; =_02102168
	add r6, r0, r6
	b _020842F6
_020842B8:
	ldr r1, [r5, #0x28]
	cmp r1, #0
	bne _020842DA
	ldr r1, _02084324 ; =0x0000D004
	cmp r0, r1
	bne _020842DA
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _020842DA
	ldr r0, [r5, #0x2c]
	mov r1, #0
	add r0, r4, r0
	mov r2, #0xd
	bl sub_02084264
	add r4, r0, #0
	b _020842F6
_020842DA:
	ldr r0, [r6]
	mov r1, #0
	add r0, r4, r0
	mov r2, #0xd
	bl sub_02084264
	add r4, r0, #0
	ldr r0, [r6, #4]
	mov r1, #0
	add r0, r7, r0
	mov r2, #6
	bl sub_02084264
	add r7, r0, #0
_020842F6:
	mov r0, #0x1a
	mul r0, r7
	lsl r1, r4, #1
	add r0, r5, r0
	add r0, r1, r0
	ldrh r0, [r0, #0x3a]
	ldr r1, _02084324 ; =0x0000D004
	cmp r0, r1
	beq _020842B8
	ldr r1, [sp]
	cmp r1, r0
	bne _02084314
	ldr r1, _02084328 ; =0x0000E001
	cmp r0, r1
	bhi _020842B8
_02084314:
	str r4, [r5, #0x1c]
	str r7, [r5, #0x20]
_02084318:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208431C: .word _02102168
_02084320: .word _02102168 + 4
_02084324: .word 0x0000D004
_02084328: .word 0x0000E001
	thumb_func_end sub_02084274

	thumb_func_start sub_0208432C
sub_0208432C: ; 0x0208432C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xd3
	lsl r0, r0, #2
	mov r4, #0
	ldr r0, [r5, r0]
	add r6, r4, #0
	add r7, r4, #0
	bl sub_020248B8
	cmp r0, #0
	bne _02084346
	mov r7, #1
_02084346:
	ldr r0, _02084424 ; =gMain
	ldr r1, [r0, #0x4c]
	mov r0, #0x40
	tst r0, r1
	beq _02084366
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	mov r6, #1
	add r4, r4, #1
_02084366:
	ldr r0, _02084424 ; =gMain
	ldr r1, [r0, #0x4c]
	mov r0, #0x80
	tst r0, r1
	beq _02084386
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	mov r6, #2
	add r4, r4, #1
_02084386:
	ldr r0, _02084424 ; =gMain
	ldr r1, [r0, #0x4c]
	mov r0, #0x20
	tst r0, r1
	beq _020843A6
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	mov r6, #3
	add r4, r4, #1
_020843A6:
	ldr r0, _02084424 ; =gMain
	ldr r1, [r0, #0x4c]
	mov r0, #0x10
	tst r0, r1
	beq _020843C6
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	mov r6, #4
	add r4, r4, #1
_020843C6:
	ldr r0, _02084424 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r0, r1
	beq _020843EC
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	mov r0, #0xc
	str r0, [r5, #0x1c]
	mov r0, #0
	str r0, [r5, #0x20]
	add r4, r4, #1
_020843EC:
	add r0, r5, #0
	bl sub_0208503C
	ldr r1, _0208442C ; =0x000005C8
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #1
	bne _02084400
	mov r6, #0
	add r4, r4, #1
_02084400:
	cmp r7, #1
	bne _0208440E
	add r0, r5, #0
	add r1, r6, #0
	mov r4, #0
	bl sub_02084430
_0208440E:
	cmp r4, #0
	beq _02084422
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02084274
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02084430
_02084422:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084424: .word gMain
_02084428: .word 0x000005DC
_0208442C: .word 0x000005C8
	thumb_func_end sub_0208432C

	thumb_func_start sub_02084430
sub_02084430: ; 0x02084430
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x20]
	cmp r1, #0
	beq _0208448A
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _02084454
	cmp r0, r1
	beq _02084454
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x27
	bl sub_020248F0
_02084454:
	cmp r4, #0
	beq _02084464
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x27
	bl sub_020248F0
_02084464:
	ldr r0, [r5, #0x1c]
	lsl r0, r0, #4
	add r0, #0x1a
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x20]
	sub r1, r0, #1
	mov r0, #0x13
	mul r0, r1
	add r0, #0x5b
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0xc
	bl sub_020247D4
	b _020844C6
_0208448A:
	mov r0, #0x1a
	mul r0, r1
	add r1, r5, r0
	ldr r0, [r5, #0x1c]
	lsl r0, r0, #1
	add r0, r1, r0
	ldrh r1, [r0, #0x3a]
	ldr r0, _020844F0 ; =0x0000E002
	sub r1, r1, r0
	ldr r0, _020844F4 ; =_02101D80
	lsl r2, r1, #1
	ldrh r0, [r0, r2]
	ldr r2, _020844F8 ; =_02101D4C
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldrb r1, [r2, r1]
	ldr r0, [r5, r0]
	bl sub_020248F0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
_020844C6:
	mov r0, #0xb4
	strh r0, [r5, #0x38]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020249D4
	ldr r0, [r5, #0x1c]
	lsl r1, r4, #3
	str r0, [r5, #0x24]
	ldr r0, [r5, #0x20]
	str r0, [r5, #0x28]
	ldr r0, _020844FC ; =_02102168
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _020844EA
	str r0, [r5, #0x2c]
_020844EA:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_020844F0: .word 0x0000E002
_020844F4: .word _02101D80
_020844F8: .word _02101D4C
_020844FC: .word _02102168
	thumb_func_end sub_02084430

	thumb_func_start sub_02084500
sub_02084500: ; 0x02084500
	push {r3, lr}
	ldrh r1, [r0]
	add r1, #0x14
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r2, r1
	bls _02084516
	mov r1, #0
	strh r1, [r0]
_02084516:
	ldrh r0, [r0]
	bl sub_0201FCAC
	mov r1, #0xa
	mul r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	add r0, #0xf
	lsl r1, r0, #5
	mov r0, #0x1d
	orr r1, r0
	add r0, sp, #0
	strh r1, [r0]
	add r0, sp, #0
	mov r1, #0x3a
	mov r2, #2
	bl GX_LoadOBJPltt
	pop {r3, pc}
	thumb_func_end sub_02084500

	thumb_func_start sub_02084540
sub_02084540: ; 0x02084540
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x18]
	add r7, r1, #0
	mov r0, #2
	mov r1, #0x12
	str r2, [sp, #0x1c]
	str r3, [sp, #0x20]
	mov r4, #0
	bl String_ctor
	str r0, [sp, #0x28]
	ldrh r1, [r7]
	ldr r0, _02084630 ; =0x0000FFFF
	cmp r1, r0
	beq _02084626
	ldr r0, [sp, #0x54]
	ldr r6, [sp, #0x50]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x58]
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x20]
	add r0, r0, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0x30]
_02084578:
	lsl r0, r4, #1
	ldrh r1, [r7, r0]
	ldr r0, _02084634 ; =0x00002FFF
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #2
	bhi _020845C4
	mov r0, #0xc
	str r0, [sp]
	str r0, [sp, #4]
	add r2, r4, #0
	ldr r0, [sp, #0x1c]
	mul r2, r6
	add r0, r0, r2
	ldr r2, _02084638 ; =0x0000D001
	lsl r0, r0, #0x10
	sub r1, r1, r2
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r2, r1, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	lsr r1, r2, #0x1f
	add r1, r2, r1
	str r0, [sp, #0xc]
	mov r0, #0xc
	asr r2, r1, #1
	ldr r1, [sp, #0x30]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r1, r1, r2
	mov r2, #0
	ldr r0, [sp, #0x18]
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	b _0208461A
_020845C4:
	ldr r0, _0208463C ; =0x0000D004
	cmp r1, r0
	bne _020845CE
	add r4, r4, #1
	b _0208461C
_020845CE:
	add r0, sp, #0x38
	strh r1, [r0]
	ldr r1, _02084630 ; =0x0000FFFF
	strh r1, [r0, #2]
	mov r0, #0
	add r1, sp, #0x38
	add r2, r0, #0
	bl sub_02002EC8
	add r5, r0, #0
	ldr r0, [sp, #0x28]
	add r1, sp, #0x38
	bl CopyU16ArrayToString
	ldr r0, [sp, #0x20]
	sub r3, r6, r5
	str r0, [sp]
	ldr r0, [sp, #0x24]
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r3, r5, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	mov ip, r3
	add r5, r4, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	mul r5, r6
	add r3, r3, r5
	mov r5, ip
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x28]
	mov r1, #0
	add r3, r5, r3
	bl AddTextPrinterParameterized2
_0208461A:
	add r4, r4, #1
_0208461C:
	lsl r0, r4, #1
	ldrh r1, [r7, r0]
	ldr r0, _02084630 ; =0x0000FFFF
	cmp r1, r0
	bne _02084578
_02084626:
	ldr r0, [sp, #0x28]
	bl String_dtor
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02084630: .word 0x0000FFFF
_02084634: .word 0x00002FFF
_02084638: .word 0x0000D001
_0208463C: .word 0x0000D004
	thumb_func_end sub_02084540

	thumb_func_start sub_02084640
sub_02084640: ; 0x02084640
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r5, #0
	add r6, r1, #0
	str r5, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	add r1, r2, #0
	add r2, r6, #0
	add r3, r5, #0
	add r4, r0, #0
	str r5, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [r4, #0xc]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02084640

	thumb_func_start sub_02084664
sub_02084664: ; 0x02084664
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r6, r0, #0
	str r1, [sp, #8]
	add r0, #0x30
	mov r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	ldr r3, _02084730 ; =0x000D0E0F
	add r0, #0x30
	add r1, r4, #0
	mov r2, #2
	bl sub_02084640
	mov r1, #2
	lsl r1, r1, #0xa
	bl DC_FlushRange
	add r7, r6, #0
	mov r4, #0
	add r7, #0x30
_02084694:
	mov r0, #0
	str r0, [sp]
	add r0, r7, #0
	mov r1, #4
	mov r2, #2
	lsl r3, r4, #2
	str r5, [sp, #4]
	bl sub_02013A50
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r1, _02084734 ; =_02101D3C
	mov r2, #1
	ldrb r1, [r1, r4]
	add r0, r5, #0
	lsl r2, r2, #8
	lsl r1, r1, #5
	bl GXS_LoadOBJ
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _02084694
	mov r0, #0x15
	mov r1, #0x12
	bl String_ctor
	add r4, r0, #0
	mov r5, #0
_020846D6:
	ldr r0, [sp, #8]
	lsl r1, r5, #1
	ldrh r1, [r0, r1]
	add r0, sp, #0xc
	lsl r7, r5, #4
	strh r1, [r0]
	ldr r1, _02084738 ; =0x0000FFFF
	strh r1, [r0, #2]
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r1, sp, #0xc
	bl CopyU16ArrayToString
	ldr r3, _02084730 ; =0x000D0E0F
	add r0, r6, r7
	add r1, r4, #0
	mov r2, #2
	bl sub_02084640
	mov r1, #0x80
	add r7, r0, #0
	bl DC_FlushRange
	ldr r1, _0208473C ; =_02101D54
	lsl r2, r5, #2
	ldr r1, [r1, r2]
	add r0, r7, #0
	lsl r1, r1, #5
	mov r2, #0x80
	bl GXS_LoadOBJ
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _020846D6
	add r0, r4, #0
	bl String_dtor
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02084730: .word 0x000D0E0F
_02084734: .word _02101D3C
_02084738: .word 0x0000FFFF
_0208473C: .word _02101D54
	thumb_func_end sub_02084664

	thumb_func_start sub_02084740
sub_02084740: ; 0x02084740
	push {r3, r4, r5, lr}
	cmp r2, #0
	bne _0208474A
	ldr r1, _0208481C ; =0x0000D003
	b _02084750
_0208474A:
	sub r2, r2, #1
	lsl r2, r2, #1
	ldrh r1, [r1, r2]
_02084750:
	ldr r4, _02084820 ; =0x0000E003
	cmp r1, r4
	bgt _02084780
	bge _020847A6
	ldr r2, _02084824 ; =0x0000D004
	cmp r1, r2
	bgt _02084778
	sub r2, r2, #3
	sub r2, r1, r2
	bmi _020847A8
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02084770: ; jump table
	.short _020847A6 - _02084770 - 2 ; case 0
	.short _020847A6 - _02084770 - 2 ; case 1
	.short _020847A6 - _02084770 - 2 ; case 2
	.short _020847A6 - _02084770 - 2 ; case 3
_02084778:
	ldr r2, _02084828 ; =0x0000E002
	cmp r1, r2
	beq _020847A6
	b _020847A8
_02084780:
	add r2, r4, #1
	cmp r1, r2
	bgt _0208478A
	beq _020847A6
	b _020847A8
_0208478A:
	add r2, r4, #2
	sub r2, r1, r2
	cmp r2, #3
	bhi _020847A8
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0208479E: ; jump table
	.short _020847A6 - _0208479E - 2 ; case 0
	.short _020847A6 - _0208479E - 2 ; case 1
	.short _020847A6 - _0208479E - 2 ; case 2
	.short _020847A6 - _0208479E - 2 ; case 3
_020847A6:
	mov r1, #1
_020847A8:
	mov r4, #0
	add r5, r3, #0
	mov r2, #1
_020847AE:
	add r4, r4, #1
	strh r2, [r5]
	add r5, r5, #2
	cmp r4, #3
	blt _020847AE
	strh r1, [r3]
	cmp r1, #1
	beq _0208480E
	ldr r5, _0208482C ; =_02102422
	mov r2, #0
_020847C2:
	ldrh r4, [r5]
	cmp r1, r4
	bne _020847E4
	mov r4, #6
	ldr r5, _0208482C ; =_02102422
	mul r4, r2
	add r4, r5, r4
	mov r1, #0
	add r5, r3, #0
_020847D4:
	ldrh r2, [r4]
	add r1, r1, #1
	add r4, r4, #2
	strh r2, [r5]
	add r5, r5, #2
	cmp r1, #3
	blt _020847D4
	b _0208480E
_020847E4:
	ldrh r4, [r5, #4]
	cmp r1, r4
	bne _02084806
	mov r4, #6
	ldr r5, _0208482C ; =_02102422
	mul r4, r2
	add r4, r5, r4
	mov r1, #0
	add r5, r3, #0
_020847F6:
	ldrh r2, [r4]
	add r1, r1, #1
	add r4, r4, #2
	strh r2, [r5]
	add r5, r5, #2
	cmp r1, #3
	blt _020847F6
	b _0208480E
_02084806:
	add r2, r2, #1
	add r5, r5, #6
	cmp r2, #0x52
	blo _020847C2
_0208480E:
	add r1, r3, #0
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl sub_02084664
	pop {r3, r4, r5, pc}
	nop
_0208481C: .word 0x0000D003
_02084820: .word 0x0000E003
_02084824: .word 0x0000D004
_02084828: .word 0x0000E002
_0208482C: .word _02102422
	thumb_func_end sub_02084740

	thumb_func_start sub_02084830
sub_02084830: ; 0x02084830
	push {r4, r5, r6, r7}
	mov r4, #0
	ldr r3, _0208487C ; =_021104E4
	add r5, r4, #0
	add r6, r0, #0
	lsl r2, r1, #2
_0208483C:
	ldr r7, [r3, r2]
	add r4, r4, #1
	ldrh r7, [r7, r5]
	add r5, r5, #2
	strh r7, [r6]
	add r6, r6, #2
	cmp r4, #0xd
	blt _0208483C
	mov r3, #0x14
	ldr r4, _02084880 ; =_021104F8
	mul r3, r1
	mov r2, #0
	add r3, r4, r3
	add r1, r2, #0
_02084858:
	add r6, r1, #0
	add r4, r1, #0
	add r5, r0, #0
_0208485E:
	ldr r7, [r3]
	add r6, r6, #1
	ldrh r7, [r7, r4]
	add r4, r4, #2
	strh r7, [r5, #0x1a]
	add r5, r5, #2
	cmp r6, #0xd
	blt _0208485E
	add r2, r2, #1
	add r3, r3, #4
	add r0, #0x1a
	cmp r2, #5
	blt _02084858
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0208487C: .word _021104E4
_02084880: .word _021104F8
	thumb_func_end sub_02084830

	thumb_func_start sub_02084884
sub_02084884: ; 0x02084884
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _02084BBC ; =0x00002FFD
	add r5, r1, #0
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r6, r2, #0
	cmp r0, #1
	bhi _0208489C
	mov r5, #1
_0208489C:
	ldr r0, [r4]
	cmp r0, #4
	bne _020848B0
	ldr r0, _02084BC0 ; =0x00001FFE
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #3
	bhi _020848B0
	mov r5, #1
_020848B0:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #0
	bne _020848D8
	ldr r0, _02084BC4 ; =gMain + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _020848D8
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
	add sp, #0x10
	mov r0, #2
	pop {r4, r5, r6, pc}
_020848D8:
	ldr r0, _02084BC8 ; =0x0000E002
	cmp r5, r0
	bgt _020848F6
	blt _020848E2
	b _02084A0A
_020848E2:
	ldr r3, _02084BCC ; =0x0000D002
	cmp r5, r3
	bgt _020848F4
	sub r0, r3, #1
	cmp r5, r0
	blt _020848F4
	beq _02084918
	cmp r5, r3
	beq _0208496A
_020848F4:
	b _02084B2E
_020848F6:
	add r0, r0, #1
	sub r0, r5, r0
	cmp r0, #5
	bls _02084900
	b _02084B2E
_02084900:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208490C: ; jump table
	.short _02084A0A - _0208490C - 2 ; case 0
	.short _02084A0A - _0208490C - 2 ; case 1
	.short _02084A0A - _0208490C - 2 ; case 2
	.short _020849B8 - _0208490C - 2 ; case 3
	.short _02084A40 - _0208490C - 2 ; case 4
	.short _02084AE4 - _0208490C - 2 ; case 5
_02084918:
	add r0, r4, #0
	add r0, #0xd8
	str r0, [sp]
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	ldr r3, _02084BD0 ; =0x0000D001
	mov r1, #0x52
	str r0, [sp, #4]
	mov r0, #0x2a
	mov r2, #1
	bl sub_02084D04
	cmp r0, #0
	bne _02084938
	b _02084C4E
_02084938:
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	add r4, #0xd8
	add r1, r4, #0
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
	ldr r0, _02084BD8 ; =0x000005EB
	bl PlaySE
	b _02084C4E
_0208496A:
	add r0, r4, #0
	add r0, #0xd8
	str r0, [sp]
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	mov r1, #0x52
	mov r2, #2
	str r0, [sp, #4]
	mov r0, #0x48
	bl sub_02084D04
	cmp r0, #0
	beq _02084A4A
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	add r4, #0xd8
	add r1, r4, #0
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
	ldr r0, _02084BD8 ; =0x000005EB
	bl PlaySE
	b _02084C4E
_020849B8:
	mov r3, #0x56
	lsl r3, r3, #2
	ldrh r3, [r4, r3]
	add r2, r4, #0
	mov r0, #0
	mov r1, #0x52
	add r2, #0xd8
	bl sub_02084C98
	cmp r0, #0
	beq _02084A4A
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	add r1, r4, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
	mov r0, #0x4a
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r0, _02084BD8 ; =0x000005EB
	bl PlaySE
	b _02084C4E
_02084A0A:
	mov r1, #0x46
	lsl r1, r1, #4
	ldr r0, _02084BC8 ; =0x0000E002
	ldr r2, [r4, r1]
	sub r5, r5, r0
	cmp r2, r5
	beq _02084A4A
	mov r2, #0
	sub r0, r1, #4
	str r2, [r4, r0]
	str r5, [r4, r1]
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x3a
	bl sub_02084830
	mov r0, #0x49
	lsl r0, r0, #4
	add r2, r4, r0
	lsl r1, r5, #2
	ldr r0, [r2, r1]
	add r0, r0, #1
	str r0, [r2, r1]
	ldr r0, _02084BDC ; =0x0000069D
	bl PlaySE
	b _02084C4E
_02084A40:
	mov r1, #0x56
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	cmp r0, #0
	bne _02084A4C
_02084A4A:
	b _02084C4E
_02084A4C:
	sub r0, r0, #1
	lsl r0, r0, #1
	add r0, r4, r0
	ldr r2, _02084BE0 ; =0x0000FFFF
	add r0, #0xd8
	strh r2, [r0]
	ldrh r0, [r4, r1]
	sub r0, r0, #1
	strh r0, [r4, r1]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _02084A80
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	bl CopyWindowToVram
	b _02084A9E
_02084A80:
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
_02084A9E:
	ldr r0, _02084BE4 ; =0x000004C4
	mov r3, #0x5f
	add r1, r4, r0
	lsl r3, r3, #2
	str r1, [sp]
	ldr r1, [r4, r3]
	add r2, r3, #0
	str r1, [sp, #4]
	sub r2, #0x24
	sub r0, #0xcc
	add r1, r4, #0
	sub r3, #0x22
	ldrh r2, [r4, r2]
	add r0, r4, r0
	add r1, #0xd8
	add r3, r4, r3
	bl sub_02084740
	mov r1, #0x56
	lsl r1, r1, #2
	mov r0, #0xd9
	lsl r0, r0, #2
	ldrh r1, [r4, r1]
	ldr r2, [r4, #0xc]
	add r0, r4, r0
	bl sub_02084E18
	ldr r0, _02084BE8 ; =0x000004A4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r0, _02084BEC ; =0x000005DC
	bl PlaySE
	b _02084C4E
_02084AE4:
	ldr r0, _02084BF0 ; =0x000005C4
	ldr r0, [r4, r0]
	bl sub_020164C4
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02084B26
	ldr r0, _02084BF4 ; =0x000005E2
	bl PlaySE
	ldr r0, _02084BF8 ; =0x000004A8
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	mov r1, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	add r3, r1, #0
	bl sub_0200FA24
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02084C58
	add sp, #0x10
	mov r0, #3
	pop {r4, r5, r6, pc}
_02084B26:
	ldr r0, _02084BFC ; =0x0000045C
	mov r1, #5
	str r1, [r4, r0]
	b _02084C4E
_02084B2E:
	mov r0, #0x46
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #4
	bne _02084B42
	cmp r5, #1
	bne _02084B42
	add sp, #0x10
	mov r0, #2
	pop {r4, r5, r6, pc}
_02084B42:
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	beq _02084C4E
	lsl r0, r1, #1
	add r0, r4, r0
	add r0, #0xd8
	strh r5, [r0]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	add r1, r4, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
	mov r1, #0x56
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	add r0, r0, #1
	strh r0, [r4, r1]
	mov r0, #0xd9
	lsl r0, r0, #2
	ldrh r1, [r4, r1]
	ldr r2, [r4, #0xc]
	add r0, r4, r0
	bl sub_02084E18
	ldr r0, _02084BD8 ; =0x000005EB
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	mov r3, #8
	ldr r0, _02084C00 ; =0x04000050
	b _02084C04
	.balign 4, 0
_02084BBC: .word 0x00002FFD
_02084BC0: .word 0x00001FFE
_02084BC4: .word gMain + 0x40
_02084BC8: .word 0x0000E002
_02084BCC: .word 0x0000D002
_02084BD0: .word 0x0000D001
_02084BD4: .word 0x000E0F01
_02084BD8: .word 0x000005EB
_02084BDC: .word 0x0000069D
_02084BE0: .word 0x0000FFFF
_02084BE4: .word 0x000004C4
_02084BE8: .word 0x000004A4
_02084BEC: .word 0x000005DC
_02084BF0: .word 0x000005C4
_02084BF4: .word 0x000005E2
_02084BF8: .word 0x000004A8
_02084BFC: .word 0x0000045C
_02084C00: .word 0x04000050
_02084C04:
	mov r1, #0
	mov r2, #7
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x3c
	bl sub_020248F0
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	bne _02084C2A
	mov r0, #1
	str r0, [r4, #0x34]
_02084C2A:
	ldr r0, _02084C54 ; =0x000004C4
	mov r3, #0x5f
	add r1, r4, r0
	lsl r3, r3, #2
	str r1, [sp]
	ldr r1, [r4, r3]
	add r2, r3, #0
	str r1, [sp, #4]
	sub r2, #0x24
	sub r0, #0xcc
	add r1, r4, #0
	sub r3, #0x22
	ldrh r2, [r4, r2]
	add r0, r4, r0
	add r1, #0xd8
	add r3, r4, r3
	bl sub_02084740
_02084C4E:
	mov r0, #2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02084C54: .word 0x000004C4
	thumb_func_end sub_02084884

	thumb_func_start sub_02084C58
sub_02084C58: ; 0x02084C58
	push {r3, lr}
	mov r2, #0x5d
	lsl r2, r2, #4
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _02084C76
	cmp r1, #1
	bne _02084C70
	mov r1, #0
	bl sub_02018410
	pop {r3, pc}
_02084C70:
	mov r1, #1
	bl sub_02018410
_02084C76:
	pop {r3, pc}
	thumb_func_end sub_02084C58

	thumb_func_start sub_02084C78
sub_02084C78: ; 0x02084C78
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #3
_02084C80:
	add r0, r1, #1
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02084264
	add r1, r0, #0
	lsl r0, r1, #1
	ldrh r0, [r5, r0]
	cmp r0, #1
	beq _02084C80
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02084C78

	thumb_func_start sub_02084C98
sub_02084C98: ; 0x02084C98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r1, #0
	str r2, [sp]
	cmp r3, #0
	bne _02084CAC
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02084CAC:
	sub r1, r3, #1
	lsl r1, r1, #1
	str r1, [sp, #4]
	ldrh r3, [r2, r1]
	cmp r4, r0
	bge _02084CFA
	mov r1, #6
	ldr r2, _02084D00 ; =_02102422
	mul r1, r4
	add r5, r2, r1
	mov r7, #0
_02084CC2:
	add r2, r7, #0
	add r6, r5, #0
_02084CC6:
	ldrh r1, [r6]
	cmp r3, r1
	bne _02084CEA
	cmp r3, #1
	beq _02084CEA
	mov r0, #6
	ldr r1, _02084D00 ; =_02102422
	mul r0, r4
	add r0, r1, r0
	add r1, r2, #0
	bl sub_02084C78
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add sp, #8
	strh r0, [r2, r1]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084CEA:
	add r2, r2, #1
	add r6, r6, #2
	cmp r2, #3
	blt _02084CC6
	add r4, r4, #1
	add r5, r5, #6
	cmp r4, r0
	blt _02084CC2
_02084CFA:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084D00: .word _02102422
	thumb_func_end sub_02084C98

	thumb_func_start sub_02084D04
sub_02084D04: ; 0x02084D04
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, r1, #0
	ldr r1, [sp, #0x1c]
	mov lr, r2
	mov ip, r3
	cmp r1, #0
	beq _02084D20
	sub r1, r1, #1
	ldr r6, [sp, #0x18]
	lsl r7, r1, #1
	ldrh r5, [r6, r7]
	cmp r5, #1
	bne _02084D24
_02084D20:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02084D24:
	add r2, r4, #0
	cmp r4, r0
	bge _02084D56
	mov r1, #6
	ldr r3, _02084DFC ; =_02102422
	mul r1, r4
	add r3, r3, r1
_02084D32:
	ldrh r1, [r3]
	cmp r5, r1
	bne _02084D4E
	add r3, r2, #0
	mov r0, #6
	mul r3, r0
	mov r0, lr
	ldr r2, _02084DFC ; =_02102422
	lsl r1, r0, #1
	add r0, r2, r3
	ldrh r0, [r1, r0]
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084D4E:
	add r2, r2, #1
	add r3, r3, #6
	cmp r2, r0
	blt _02084D32
_02084D56:
	cmp r4, r0
	bge _02084D86
	mov r2, lr
	ldr r1, _02084DFC ; =_02102422
	lsl r2, r2, #1
	add r1, r1, r2
	mov r2, #6
	mul r2, r4
	add r2, r1, r2
_02084D68:
	ldrh r1, [r2]
	cmp r5, r1
	bne _02084D7E
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, _02084DFC ; =_02102422
	ldrh r0, [r0, r1]
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084D7E:
	add r4, r4, #1
	add r2, r2, #6
	cmp r4, r0
	blt _02084D68
_02084D86:
	ldr r1, _02084E00 ; =0x0000D001
	mov r0, ip
	cmp r0, r1
	beq _02084DA0
	add r1, r1, #1
	mov r0, ip
	cmp r0, r1
	beq _02084DC0
	ldr r1, _02084E04 ; =0x0000E006
	mov r0, ip
	cmp r0, r1
	beq _02084DE0
	b _02084DF8
_02084DA0:
	ldr r1, _02084E08 ; =_021021B8
	mov r2, #0
_02084DA4:
	ldrh r0, [r1]
	cmp r5, r0
	bne _02084DB6
	ldr r0, _02084E0C ; =_021021B8 + 2
	lsl r1, r2, #2
	ldrh r0, [r0, r1]
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084DB6:
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, #0xc
	blo _02084DA4
	b _02084DF8
_02084DC0:
	ldr r1, _02084E10 ; =_02102190
	mov r2, #0
_02084DC4:
	ldrh r0, [r1]
	cmp r5, r0
	bne _02084DD6
	ldr r0, _02084E14 ; =_02102190 + 2
	lsl r1, r2, #2
	ldrh r0, [r0, r1]
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084DD6:
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, #0xa
	blo _02084DC4
	b _02084DF8
_02084DE0:
	cmp r5, #0x26
	bne _02084DEC
	mov r0, #0x24
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084DEC:
	cmp r5, #0x76
	bne _02084DF8
	mov r0, #0x74
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084DF8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084DFC: .word _02102422
_02084E00: .word 0x0000D001
_02084E04: .word 0x0000E006
_02084E08: .word _021021B8
_02084E0C: .word _021021B8 + 2
_02084E10: .word _02102190
_02084E14: .word _02102190 + 2
	thumb_func_end sub_02084D04

	thumb_func_start sub_02084E18
sub_02084E18: ; 0x02084E18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	mov r4, #0
	str r0, [sp]
	str r1, [sp, #4]
	cmp r6, #0
	ble _02084E3C
	add r5, r0, #0
	mov r7, #0x2b
_02084E2C:
	ldr r0, [r5]
	add r1, r7, #0
	bl sub_020248F0
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02084E2C
_02084E3C:
	ldr r0, [sp, #4]
	cmp r0, r6
	beq _02084E4E
	lsl r1, r0, #2
	ldr r0, [sp]
	ldr r0, [r0, r1]
	mov r1, #0x2c
	bl sub_020248F0
_02084E4E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02084E18

	thumb_func_start sub_02084E54
sub_02084E54: ; 0x02084E54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r2, [sp, #0x10]
	ldr r2, [sp, #0x30]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r5, r0, #0
	str r3, [sp, #0x14]
	str r2, [sp, #0x30]
	bl FillWindowPixelBuffer
	ldr r1, _02084F34 ; =_02101D44
	ldr r0, [sp, #0x10]
	mov r7, #0
	ldrb r4, [r1, r0]
	mov r6, #0x10
_02084E74:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0
	bl FillWindowPixelRect
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0x26
	bl FillWindowPixelRect
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0x4c
	bl FillWindowPixelRect
	add r7, r7, #1
	add r6, #0x20
	cmp r7, #6
	blt _02084E74
	mov r7, #0
	add r6, r7, #0
_02084EC2:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0x13
	bl FillWindowPixelRect
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0x39
	bl FillWindowPixelRect
	add r7, r7, #1
	add r6, #0x20
	cmp r7, #7
	blt _02084EC2
	ldr r0, [sp, #0x10]
	mov r1, #0x14
	ldr r2, _02084F38 ; =_021104F8
	mul r1, r0
	mov r7, #0
	mov r6, #4
	add r4, r2, r1
_02084F04:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r2, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	add r3, r6, #0
	str r0, [sp, #0xc]
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_02084540
	add r7, r7, #1
	add r6, #0x13
	add r4, r4, #4
	cmp r7, #5
	blt _02084F04
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084F34: .word _02101D44
_02084F38: .word _021104F8
	thumb_func_end sub_02084E54

	thumb_func_start sub_02084F3C
sub_02084F3C: ; 0x02084F3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	str r0, [sp]
	mov r7, #0
	add r1, r0, #0
_02084F48:
	ldr r0, [r1]
	cmp r0, #0
	beq _02084F7E
	mov r0, #0
	ldr r4, _02084FC0 ; =_021021E8
	str r0, [sp, #4]
	add r5, r6, #0
_02084F56:
	ldr r0, [r5]
	ldr r1, [r4, #8]
	bl sub_020248F0
	ldr r0, [sp, #4]
	add r4, #0x10
	add r0, r0, #1
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r0, #3
	blt _02084F56
	ldr r1, _02084FC4 ; =_021021E8 + 8
	lsl r2, r7, #4
	lsl r0, r7, #2
	ldr r1, [r1, r2]
	ldr r0, [r6, r0]
	sub r1, r1, #3
	bl sub_020248F0
	b _02084F86
_02084F7E:
	add r7, r7, #1
	add r1, r1, #4
	cmp r7, #3
	blt _02084F48
_02084F86:
	ldr r4, [sp]
	ldr r5, _02084FC8 ; =_02102238
	mov r7, #5
	add r4, #0x14
	add r6, #0x14
_02084F90:
	ldr r0, [r4]
	cmp r0, #0
	beq _02084FA0
	ldr r1, [r5, #8]
	ldr r0, [r6]
	add r1, r1, #1
	bl sub_020248F0
_02084FA0:
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x10
	add r6, r6, #4
	cmp r7, #7
	blt _02084F90
	mov r2, #0
	add r1, r2, #0
_02084FB0:
	ldr r0, [sp]
	add r2, r2, #1
	stmia r0!, {r1}
	str r0, [sp]
	cmp r2, #7
	blt _02084FB0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084FC0: .word _021021E8
_02084FC4: .word _021021E8 + 8
_02084FC8: .word _02102238
	thumb_func_end sub_02084F3C

	thumb_func_start sub_02084FCC
sub_02084FCC: ; 0x02084FCC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _02085038
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	bne _02085004
	mov r0, #0xc
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x20]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x27
	bl sub_020248F0
	mov r0, #0
	str r0, [r4, #0x34]
	b _02085010
_02085004:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x27
	bl sub_020248F0
_02085010:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _02085024
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024830
	b _0208502C
_02085024:
	add r0, r4, #0
	mov r1, #0
	bl sub_02084430
_0208502C:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024B78
_02085038:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02084FCC

	thumb_func_start sub_0208503C
sub_0208503C: ; 0x0208503C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r0, #0
	mov ip, r0
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #4
	bne _02085050
	mov r0, #4
	mov ip, r0
_02085050:
	ldr r2, _020850EC ; =gMain + 0x40
	ldrh r0, [r2, #0x24]
	cmp r0, #0
	beq _020850E6
	ldrh r0, [r2, #0x20]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov lr, r0
	ldrh r0, [r2, #0x22]
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	mov r0, ip
	cmp r0, #0x47
	bhs _020850E6
	mov r0, #6
	mov r2, ip
	mul r0, r2
	ldr r2, _020850F0 ; =_02102278
	add r2, r2, r0
	add r3, r2, #0
_02085078:
	ldrh r4, [r3, #2]
	ldrb r0, [r2]
	ldrb r6, [r2, #1]
	lsl r4, r4, #0x1e
	lsr r4, r4, #0x1e
	beq _0208508E
	cmp r4, #1
	beq _02085094
	cmp r4, #2
	beq _0208509A
	b _0208509E
_0208508E:
	mov r5, #0x1f
	mov r1, #0x16
	b _0208509E
_02085094:
	mov r5, #0x20
	mov r1, #0x16
	b _0208509E
_0208509A:
	mov r5, #0x10
	mov r1, #0x13
_0208509E:
	mov r4, lr
	cmp r4, r0
	blo _020850D8
	cmp r7, r6
	blo _020850D8
	add r4, r0, r5
	mov r0, lr
	cmp r0, r4
	bgt _020850D8
	add r0, r6, r1
	cmp r7, r0
	bgt _020850D8
	ldr r2, _020850F0 ; =_02102278
	mov r1, #6
	mov r0, ip
	mul r1, r0
	add r2, r2, r1
	ldrb r0, [r2, #4]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1b
	ldr r0, [sp]
	str r1, [r0, #0x1c]
	ldrb r0, [r2, #5]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1b
	ldr r0, [sp]
	str r1, [r0, #0x20]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020850D8:
	mov r0, ip
	add r0, r0, #1
	add r2, r2, #6
	add r3, r3, #6
	mov ip, r0
	cmp r0, #0x47
	blo _02085078
_020850E6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020850EC: .word gMain + 0x40
_020850F0: .word _02102278
	thumb_func_end sub_0208503C

	thumb_func_start sub_020850F4
sub_020850F4: ; 0x020850F4
	push {r3, r4, r5, lr}
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x6c
	lsl r2, r2, #0x12
	bl CreateHeap
	mov r1, #0xfd
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #0x6c
	bl OverlayManager_CreateAndGetData
	mov r2, #0xfd
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetField18
	add r5, r0, #0
	mov r0, #0xee
	lsl r0, r0, #2
	add r3, r4, r0
	mov r2, #6
_0208512C:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0208512C
	ldr r0, [r5]
	str r0, [r3]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl sub_0201A108
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02085238 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0208523C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0xbe
	mov r1, #0x6c
	bl NARC_ctor
	mov r1, #0xbb
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x6c
	bl BgConfig_Alloc
	mov r1, #0xbe
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x6c
	bl sub_020030E8
	mov r1, #0xbf
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl sub_02003B50
	mov r2, #0xbf
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	mov r1, #0
	sub r2, #0xfc
	mov r3, #0x6c
	bl PaletteData_AllocBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r2, r1, #9
	mov r3, #0x6c
	bl PaletteData_AllocBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	mov r1, #2
	ldr r0, [r4, r0]
	lsl r2, r1, #8
	mov r3, #0x6c
	bl PaletteData_AllocBuffers
	mov r2, #0xbf
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	mov r1, #3
	sub r2, #0xfc
	mov r3, #0x6c
	bl PaletteData_AllocBuffers
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0208545C
	add r0, r4, #0
	bl sub_020863F4
	add r0, r4, #0
	bl sub_02085688
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r4, #0
	bl sub_020860B8
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0208520A
	bl sub_0203A880
	mov r0, #1
	mov r1, #0x6c
	bl sub_0203A948
_0208520A:
	mov r0, #7
	str r0, [sp]
	ldr r0, _02085240 ; =0x04000050
	mov r1, #0
	mov r2, #6
	mov r3, #0xf
	bl G2x_SetBlendAlpha_
	mov r0, #8
	str r0, [sp]
	ldr r0, _02085244 ; =0x04001050
	mov r1, #0
	mov r2, #0xe
	mov r3, #7
	bl G2x_SetBlendAlpha_
	ldr r0, _02085248 ; =sub_020855CC
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02085238: .word 0xFFFFE0FF
_0208523C: .word 0x04001000
_02085240: .word 0x04000050
_02085244: .word 0x04001050
_02085248: .word sub_020855CC
	thumb_func_end sub_020850F4

	thumb_func_start sub_0208524C
sub_0208524C: ; 0x0208524C
	push {r3, r4, r5, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_02085BEC
	add r5, r0, #0
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02085270
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
_02085270:
	cmp r5, #0
	beq _02085278
	mov r0, #1
	pop {r3, r4, r5, pc}
_02085278:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208524C

	thumb_func_start sub_0208527C
sub_0208527C: ; 0x0208527C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02085294
	bl sub_0203A914
_02085294:
	add r0, r4, #0
	bl sub_020866CC
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl sub_02022CC8
	mov r0, #2
	mov r1, #0
	bl sub_02022CC8
	mov r0, #4
	mov r1, #0
	bl sub_02022CC8
	mov r0, #8
	mov r1, #0
	bl sub_02022CC8
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #5
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl FreeBgTilemapBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl PaletteData_FreeBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl PaletteData_FreeBuffers
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02003104
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl NARC_dtor
	bl sub_02021238
	mov r1, #0x2f
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D998
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200D108
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl sub_02026CAC
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x6c
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0208527C

	thumb_func_start sub_020853B4
sub_020853B4: ; 0x020853B4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	str r0, [sp]
	mov r1, #0x34
	add r5, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	ldr r1, [sp]
	add r0, r6, #1
	str r6, [r4]
	bl String_ctor
	str r0, [r4, #0x1c]
	str r7, [r4, #0x20]
	mov r2, #0
	add r1, r5, #0
	add r3, r4, #0
_020853DA:
	ldr r0, [r1]
	add r2, r2, #1
	str r0, [r3, #4]
	add r1, r1, #4
	add r3, r3, #4
	cmp r2, #4
	blt _020853DA
	sub r0, r2, #1
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	lsl r0, r2, #2
	add r0, r4, r0
	str r1, [r0, #4]
	ldr r0, [sp, #0x18]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x30]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020853B4

	thumb_func_start sub_02085400
sub_02085400: ; 0x02085400
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_020853B4
	mov r1, #0
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02085400

	thumb_func_start sub_0208541C
sub_0208541C: ; 0x0208541C
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_020853B4
	ldr r1, [sp, #0x18]
	str r1, [r0, #0x24]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x28]
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_0208541C

	thumb_func_start sub_02085438
sub_02085438: ; 0x02085438
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _02085446
	bl GF_AssertFail
_02085446:
	cmp r4, #0
	bne _0208544E
	bl GF_AssertFail
_0208544E:
	ldr r0, [r4, #0x1c]
	bl String_dtor
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02085438

	thumb_func_start sub_0208545C
sub_0208545C: ; 0x0208545C
	push {r4, r5, lr}
	sub sp, #0xec
	add r4, r0, #0
	bl GX_DisableEngineALayers
	ldr r5, _020855BC ; =_02102630
	add r3, sp, #0
	mov r2, #5
_0208546C:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0208546C
	add r0, sp, #0
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	ldr r5, _020855C0 ; =_02102658
	add r3, sp, #0x98
	mov r2, #0xa
_020854B8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020854B8
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	add r2, sp, #0x98
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0xb4
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #0xd0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r5, _020855C4 ; =_021026AC
	add r3, sp, #0x28
	mov r2, #0xe
_02085526:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02085526
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #0x28
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	add r2, sp, #0x44
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0x60
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	add r2, sp, #0x7c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	add r1, r0, #0
	bl sub_02022CC8
	mov r0, #2
	mov r1, #1
	bl sub_02022CC8
	mov r0, #4
	mov r1, #0
	bl sub_02022CC8
	mov r0, #8
	mov r1, #0
	bl sub_02022CC8
	ldr r0, _020855C8 ; =gMain + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl sub_02022CC8
	add sp, #0xec
	pop {r4, r5, pc}
	.balign 4, 0
_020855BC: .word _02102630
_020855C0: .word _02102658
_020855C4: .word _021026AC
_020855C8: .word gMain + 0x60
	thumb_func_end sub_0208545C

	thumb_func_start sub_020855CC
sub_020855CC: ; 0x020855CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0202061C
	bl sub_0200D034
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200398C
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0201EEB4
	ldr r3, _020855FC ; =OS_IRQTable
	ldr r1, _02085600 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_020855FC: .word OS_IRQTable
_02085600: .word 0x00003FF8
	thumb_func_end sub_020855CC

	thumb_func_start sub_02085604
sub_02085604: ; 0x02085604
	push {r3, r4}
	mov r2, #0xb5
	lsl r2, r2, #2
	ldr r4, [r0, r2]
	add r3, r2, #4
	str r4, [r0, r3]
	str r1, [r0, r2]
	add r1, r2, #0
	mov r3, #0
	add r1, #8
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0xc
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x10
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x14
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _02085656
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x2a
	ldrh r3, [r3, r1]
	add r1, r2, #0
	add r1, #8
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x28
	ldrh r1, [r3, r1]
	add r2, #0xc
	str r1, [r0, r2]
_02085656:
	mov r2, #0xb6
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _02085684
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x2e
	ldrh r3, [r3, r1]
	add r1, r2, #0
	add r1, #0xc
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x2c
	ldrh r1, [r3, r1]
	add r2, #0x10
	str r1, [r0, r2]
_02085684:
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02085604

	thumb_func_start sub_02085688
sub_02085688: ; 0x02085688
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r0, #0xdd
	lsl r0, r0, #2
	mov r1, #1
	str r1, [r4, r0]
	add r7, r0, #0
	mov r5, #0
	mov r1, #0xab
	add r3, r5, #0
	add r6, r4, #0
	sub r7, #0xca
	add r0, #0x48
	lsl r1, r1, #2
_020856A4:
	strh r5, [r6, r7]
	ldr r2, [r6, r0]
	add r3, r3, #1
	add r2, r5, r2
	lsl r2, r2, #0x10
	lsr r5, r2, #0x10
	strh r5, [r6, r1]
	add r6, r6, #4
	cmp r3, #5
	blt _020856A4
	mov r1, #0xf7
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r1, r1, #1
	bl sub_02085604
	mov r1, #0xfb
	lsl r1, r1, #2
	mov r0, #0x2d
	add r7, r1, #0
	mov r6, #0
	add r5, r4, #0
	lsl r0, r0, #4
	sub r7, #0x30
_020856D6:
	ldr r3, [r5, r7]
	cmp r3, #0
	beq _020856F0
	ldr r2, [r4, r0]
	add r6, r6, #1
	add r2, r2, r3
	str r2, [r4, r0]
	ldr r2, [r4, r1]
	add r5, r5, #4
	add r2, r2, #1
	str r2, [r4, r1]
	cmp r6, #4
	blt _020856D6
_020856F0:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r7, _02085804 ; =0x000002A2
	sub r1, r1, #1
	str r1, [r4, r0]
	mov r1, #0x2d
	lsl r1, r1, #4
	ldr r2, [r4, r1]
	ldr r0, [r4, r0]
	sub r1, #0x30
	add r0, r2, r0
	lsl r2, r0, #3
	lsr r0, r2, #0x1f
	add r0, r2, r0
	asr r2, r0, #1
	mov r0, #0x70
	sub r0, r0, r2
	strh r0, [r4, r1]
	mov r6, #0
	add r3, r4, #0
	add r5, r4, #0
_0208571C:
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r2, [r3, r0]
	add r0, #0x30
	ldr r0, [r4, r0]
	add r6, r6, #1
	lsl r1, r0, #3
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r3, r3, #4
	sub r0, r0, r2
	lsl r0, r0, #3
	lsl r2, r2, #5
	add r0, r0, r2
	add r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	mov r0, #0x70
	sub r0, r0, r1
	strh r0, [r5, r7]
	add r5, r5, #2
	cmp r6, #4
	blt _0208571C
	ldr r0, _02085804 ; =0x000002A2
	ldrsh r1, [r4, r0]
	add r1, #0xc
	strh r1, [r4, r0]
	mov r1, #0xfb
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r4, r1]
	add r3, r0, #0
	cmp r1, #0
	ble _02085788
	mov r7, #7
	mov r6, #0xfb
	add r1, r4, #0
	add r2, r4, #0
	lsl r7, r7, #6
	lsl r6, r6, #2
_02085770:
	mov r5, #0xef
	lsl r5, r5, #2
	ldr r5, [r1, r5]
	add r3, r3, #1
	add r0, r0, r5
	sub r5, r0, #1
	str r5, [r2, r7]
	ldr r5, [r4, r6]
	add r1, r1, #4
	add r2, #0x1c
	cmp r3, r5
	blt _02085770
_02085788:
	mov r3, #0
	mov ip, r3
	str r4, [sp]
	add r2, r4, #0
_02085790:
	mov r1, #0xef
	ldr r5, [sp]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r0, #0
	cmp r1, #0
	ble _020857BE
	mov r5, ip
	lsl r5, r5, #2
	add r7, r4, r5
	mov r5, ip
	add r1, r2, #0
	add r6, r5, #1
_020857AA:
	mov r5, #0xef
	str r6, [r1, #4]
	lsl r5, r5, #2
	ldr r5, [r7, r5]
	add r0, r0, #1
	add r1, #0x1c
	add r2, #0x1c
	add r3, r3, #1
	cmp r0, r5
	blt _020857AA
_020857BE:
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r3, r0
	blt _02085790
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	cmp r0, #0
	ble _02085800
	mov r5, #0x3f
	lsl r5, r5, #4
	add r2, r5, #0
	add r3, r5, #0
	add r0, r4, #0
	sub r2, #0x34
	sub r3, #0x14
_020857EE:
	ldr r6, [r0, r2]
	ldr r7, [r4, r5]
	add r1, r1, #1
	add r6, r7, r6
	str r6, [r4, r5]
	ldr r6, [r4, r3]
	add r0, r0, #4
	cmp r1, r6
	blt _020857EE
_02085800:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02085804: .word 0x000002A2
	thumb_func_end sub_02085688

	thumb_func_start sub_02085808
sub_02085808: ; 0x02085808
	mov r2, #0xb
	lsl r2, r2, #6
	str r1, [r0, r2]
	mov r3, #0
	add r1, r2, #4
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #8
	str r3, [r0, r1]
	add r2, #0xc
	str r3, [r0, r2]
	bx lr
	thumb_func_end sub_02085808

	thumb_func_start sub_02085820
sub_02085820: ; 0x02085820
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl sub_02086490
	add r0, r5, #0
	bl sub_02086DA4
	add r0, r5, #0
	bl sub_02086758
	add r0, r5, #0
	mov r1, #0
	bl sub_02086DE4
	add r0, r5, #0
	bl sub_020868A0
	add r0, r5, #0
	bl sub_020869BC
	add r0, r5, #0
	bl sub_02086F44
	add r0, r5, #0
	bl sub_02086FCC
	add r0, r5, #0
	bl sub_02087064
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	mov r1, #0xf9
	str r3, [sp, #8]
	mov r0, #0x64
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	mov r2, #4
	str r0, [sp, #0x10]
	add r0, r1, #0
	sub r0, #0xec
	sub r1, #0x48
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl sub_020871C4
	mov r0, #0xfa
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020858B8
	mov r0, #0x6c
	bl sub_0203A4AC
	add r1, sp, #0x14
	add r4, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xbf
	ldr r1, [sp, #0x14]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r1, #0xc]
	mov r2, #3
	mov r3, #0xe0
	bl PaletteData_LoadPalette
	add r0, r4, #0
	bl FreeToHeap
_020858B8:
	add r0, r5, #0
	mov r1, #1
	bl sub_02085808
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x6c
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl sub_0200FA24
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02085820

	thumb_func_start sub_020858DC
sub_020858DC: ; 0x020858DC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _020858F2
	cmp r0, #1
	beq _02085916
	b _0208592A
_020858F2:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6c
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _02085930
_02085916:
	bl sub_0200FB5C
	cmp r0, #1
	bne _02085930
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _02085930
_0208592A:
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_02085930:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_020858DC

	thumb_func_start sub_02085938
sub_02085938: ; 0x02085938
	push {r4, lr}
	mov r1, #0xb2
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _0208595A
	bl sub_0200FB5C
	cmp r0, #1
	bne _0208596E
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0208596E
_0208595A:
	bl sub_02086328
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl sub_02026CC4
	add r0, r4, #0
	bl sub_02085C20
_0208596E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02085938

	thumb_func_start sub_02085974
sub_02085974: ; 0x02085974
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0xb2
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	cmp r2, #0
	beq _0208598A
	cmp r2, #1
	bne _02085988
	b _02085AF0
_02085988:
	b _02085B84
_0208598A:
	mov r1, #0
	add r2, r1, #0
	bl sub_02086AB4
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _02085A1C
	ldr r7, _02085BE0 ; =_0211055C
	add r4, r5, #0
_020859A2:
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	beq _02085A0E
	mov r1, #0x14
	mov r2, #0x16
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	bl sub_0200DED0
	ldrb r0, [r4, #0x18]
	sub r0, r0, #1
	strb r0, [r4, #0x18]
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	blt _020859E4
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _020859E4
	ldrb r0, [r4, #0x19]
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_020859E4:
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	blt _02085A0E
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02085A0E
	ldrb r0, [r4, #0x19]
	ldr r1, _02085BE4 ; =_02110578
	lsl r2, r0, #2
	ldr r1, [r1, r2]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_02085A0E:
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _020859A2
_02085A1C:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _02085A64
	mov r7, #0x76
	add r4, r5, #0
	lsl r7, r7, #2
_02085A2E:
	ldrb r0, [r4, r7]
	cmp r0, #0
	beq _02085A56
	mov r1, #0x75
	ldr r2, _02085BE8 ; =0x000001D6
	mov r0, #0x73
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, r0]
	bl sub_0200DED0
	mov r0, #0x76
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	sub r1, r0, #1
	mov r0, #0x76
	lsl r0, r0, #2
	strb r1, [r4, r0]
_02085A56:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085A2E
_02085A64:
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _02085AE4
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02085AA2
	mov r0, #0x1c
	mul r0, r6
	mov r7, #0x2e
	add r4, r5, r0
	lsl r7, r7, #4
_02085A82:
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl sub_02086D98
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200DC4C
	ldr r0, [r4, #0xc]
	bl sub_0200DC18
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085A82
_02085AA2:
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02085ADA
	mov r0, #0x1c
	mul r0, r6
	mov r7, #0xba
	add r4, r5, r0
	lsl r7, r7, #2
_02085ABA:
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl sub_02086D98
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200DC4C
	ldr r0, [r4, #0xc]
	bl sub_0200DC18
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085ABA
_02085ADA:
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
_02085AE4:
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	b _02085BDA
_02085AF0:
	add r0, r1, #0
	add r0, #0x14
	add r1, #0x18
	ldr r6, [r5, r0]
	ldr r0, [r5, r1]
	cmp r6, r0
	bge _02085B2C
	mov r0, #0x1c
	mul r0, r6
	ldr r7, _02085BE0 ; =_0211055C
	add r4, r5, r0
_02085B06:
	ldrb r0, [r4, #0x19]
	cmp r0, #6
	beq _02085B1E
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_02085B1E:
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085B06
_02085B2C:
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02085B68
	mov r0, #0x1c
	mul r0, r6
	ldr r7, _02085BE4 ; =_02110578
	add r4, r5, r0
_02085B42:
	ldrb r0, [r4, #0x19]
	cmp r0, #6
	beq _02085B5A
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_02085B5A:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02085B42
_02085B68:
	mov r1, #0xb3
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #6
	bne _02085BDA
	sub r0, r1, #4
	ldr r0, [r5, r0]
	add r2, r0, #1
	sub r0, r1, #4
	str r2, [r5, r0]
	b _02085BDA
_02085B84:
	bl sub_02086F44
	mov r1, #0xed
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _02085BA6
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl sub_02086398
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02086AE4
	b _02085BB8
_02085BA6:
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl sub_020863C0
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02086AE4
_02085BB8:
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02085BCC
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl sub_02086AB4
_02085BCC:
	add r0, r5, #0
	bl sub_02086384
	add r0, r5, #0
	mov r1, #1
	bl sub_02085808
_02085BDA:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02085BE0: .word _0211055C
_02085BE4: .word _02110578
_02085BE8: .word 0x000001D6
	thumb_func_end sub_02085974

	thumb_func_start sub_02085BEC
sub_02085BEC: ; 0x02085BEC
	push {r3, r4, r5, lr}
	mov r1, #0xb
	add r5, r0, #0
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	lsl r2, r1, #2
	ldr r1, _02085C1C ; =_0210271C
	ldr r1, [r1, r2]
	blx r1
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02086BB4
	add r0, r5, #0
	bl sub_02086C8C
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D020
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02085C1C: .word _0210271C
	thumb_func_end sub_02085BEC

	thumb_func_start sub_02085C20
sub_02085C20: ; 0x02085C20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	ldr r5, _02085F00 ; =_0210272C
	add r4, r0, #0
	add r3, sp, #4
	mov r2, #7
_02085C2C:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02085C2C
	ldr r0, [r5]
	mov r1, #0x14
	str r0, [r3]
	mov r3, #0x91
	lsl r3, r3, #2
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	ldrsh r7, [r4, r3]
	mov r6, #0
	mov ip, r0
	mul r1, r0
	add r0, sp, #4
	lsl r2, r7, #2
	add r0, r0, r1
	ldr r5, [r2, r0]
	add r0, r3, #0
	add r0, #0x7c
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02085C80
	mov r2, #0xeb
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	cmp r0, #1
	beq _02085C80
	add r0, r2, #0
	sub r0, #0x38
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02085CBC
	ldr r0, _02085F04 ; =gMain
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _02085C80
	bl sub_0202534C
	cmp r0, #0
	beq _02085C82
_02085C80:
	b _02085F78
_02085C82:
	mov r0, #0xdd
	add r1, r6, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02086B2C
	sub r5, #0xa
	cmp r5, #1
	bhi _02085CAA
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #2
	beq _02085D8C
	mov r1, #2
	add sp, #0x40
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02085CAA:
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #1
	beq _02085D8C
	mov r1, #1
	add sp, #0x40
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02085CBC:
	ldr r0, _02085F04 ; =gMain
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	beq _02085CDE
	mov r0, ip
	cmp r0, #0
	ble _02085CD4
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	sub r1, r0, #1
	b _02085CD6
_02085CD4:
	mov r1, #2
_02085CD6:
	add r0, r3, #2
	strh r1, [r4, r0]
	mov r6, #1
	b _02085F2A
_02085CDE:
	mov r1, #0x80
	tst r1, r0
	beq _02085CFE
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #2
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	mov r1, #3
	bl _s32_div_f
	ldr r0, _02085F08 ; =0x00000246
	mov r6, #1
	strh r1, [r4, r0]
	b _02085F2A
_02085CFE:
	mov r1, #0x10
	tst r1, r0
	beq _02085D2C
	cmp r5, #0xa
	bne _02085D0E
	mov r0, #3
	strh r0, [r4, r3]
	b _02085D28
_02085D0E:
	cmp r5, #0xb
	bne _02085D16
	strh r6, [r4, r3]
	b _02085D28
_02085D16:
	add r0, r7, #1
	strh r0, [r4, r3]
	ldrsh r0, [r4, r3]
	mov r1, #5
	bl _s32_div_f
	mov r0, #0x91
	lsl r0, r0, #2
	strh r1, [r4, r0]
_02085D28:
	mov r6, #1
	b _02085F2A
_02085D2C:
	mov r1, #0x20
	tst r1, r0
	beq _02085D56
	cmp r5, #0xa
	bne _02085D3C
	mov r0, #3
	strh r0, [r4, r3]
	b _02085D52
_02085D3C:
	cmp r5, #0xb
	bne _02085D44
	strh r6, [r4, r3]
	b _02085D52
_02085D44:
	cmp r7, #0
	ble _02085D4E
	sub r0, r7, #1
	strh r0, [r4, r3]
	b _02085D52
_02085D4E:
	mov r0, #4
	strh r0, [r4, r3]
_02085D52:
	mov r6, #1
	b _02085F2A
_02085D56:
	ldr r1, _02085F04 ; =gMain
	ldr r7, [r1, #0x48]
	mov r1, #1
	tst r1, r7
	beq _02085E3C
	cmp r5, #0xa
	bne _02085D72
	add r0, r4, #0
	bl sub_02085FFC
	ldr r0, _02085F0C ; =0x000005E5
	bl PlaySE
	b _02085F2A
_02085D72:
	cmp r5, #0xb
	bne _02085D84
	add r0, r4, #0
	bl sub_02085F80
	ldr r0, _02085F10 ; =0x000005E2
	bl PlaySE
	b _02085F2A
_02085D84:
	sub r2, #0xd8
	ldr r0, [r4, r2]
	cmp r0, #0
	bne _02085D8E
_02085D8C:
	b _02085F78
_02085D8E:
	sub r3, #0x30
	ldr r0, [r4, r3]
	mov r1, #0x1c
	add r7, r0, #0
	str r0, [sp]
	mul r7, r1
	add r0, r5, #1
	str r0, [r4, r7]
	add r0, r4, #0
	mov r1, #1
	add r2, r6, #0
	bl sub_02086AB4
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl sub_02086AB4
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl sub_02086B6C
	add r1, r4, r7
	ldr r0, [r4, r7]
	ldr r1, [r1, #8]
	bl sub_02086D98
	add r1, r0, #0
	add r0, r4, r7
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	add r0, r4, r7
	ldr r3, [r0, #4]
	ldr r0, [sp]
	add r2, r0, #1
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r2, r1
	bne _02085E0E
	add r1, r0, #0
	mov r6, #1
	add r1, #0xdc
	str r6, [r4, r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0xe0
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #3
	sub r1, #0x8c
	strh r2, [r4, r1]
	mov r1, #2
	sub r0, #0x8a
	strh r1, [r4, r0]
	b _02085F2A
_02085E0E:
	mov r1, #0x1c
	mul r1, r2
	add r1, r4, r1
	ldr r1, [r1, #4]
	cmp r3, r1
	beq _02085E28
	add r2, r0, #0
	mov r3, #1
	add r2, #0xdc
	str r3, [r4, r2]
	add r0, #0xe0
	str r1, [r4, r0]
	b _02085E34
_02085E28:
	add r1, r0, #0
	mov r3, #2
	add r1, #0xdc
	str r3, [r4, r1]
	add r0, #0xe0
	str r2, [r4, r0]
_02085E34:
	ldr r0, _02085F0C ; =0x000005E5
	bl PlaySE
	b _02085F2A
_02085E3C:
	mov r1, #2
	add r5, r7, #0
	tst r5, r1
	beq _02085E52
	add r0, r4, #0
	bl sub_02085FFC
	ldr r0, _02085F0C ; =0x000005E5
	bl PlaySE
	b _02085F2A
_02085E52:
	lsl r5, r1, #8
	tst r5, r0
	beq _02085EB6
	add r0, r3, #0
	sub r0, #0x30
	ldr r1, [r4, r0]
	add r0, r2, #0
	add r0, #0x44
	ldr r0, [r4, r0]
	cmp r1, r0
	bne _02085E6E
	sub r2, #0xdc
	ldr r0, [r4, r2]
	b _02085E74
_02085E6E:
	add r0, r3, #0
	sub r0, #0x30
	ldr r0, [r4, r0]
_02085E74:
	sub r0, r0, #1
	sub r3, #0x30
	str r0, [r4, r3]
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1c
	mul r1, r0
	add r2, r4, r1
	ldr r1, [r2, #8]
	cmp r1, #1
	bne _02085E9A
	mov r1, #0xeb
	mov r2, #2
	lsl r1, r1, #2
	str r2, [r4, r1]
	add r1, r1, #4
	str r0, [r4, r1]
	b _02085EAC
_02085E9A:
	mov r1, #0xeb
	lsl r1, r1, #2
	mov r3, #1
	str r3, [r4, r1]
	add r0, r1, #4
	ldr r2, [r2, #4]
	add r1, #8
	str r2, [r4, r0]
	str r3, [r4, r1]
_02085EAC:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	b _02085F2A
_02085EB6:
	add r1, #0xfe
	tst r0, r1
	beq _02085F2A
	add r1, r2, #0
	add r0, r3, #0
	sub r1, #0xdc
	sub r0, #0x30
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	sub r1, r1, #1
	cmp r0, r1
	bne _02085ED4
	add r2, #0x44
	ldr r0, [r4, r2]
	b _02085EDC
_02085ED4:
	add r0, r3, #0
	sub r0, #0x30
	ldr r0, [r4, r0]
	add r0, r0, #1
_02085EDC:
	sub r3, #0x30
	str r0, [r4, r3]
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1c
	mul r1, r0
	add r2, r4, r1
	ldr r1, [r2, #8]
	cmp r1, #1
	bne _02085F14
	mov r1, #0xeb
	mov r2, #2
	lsl r1, r1, #2
	str r2, [r4, r1]
	add r1, r1, #4
	str r0, [r4, r1]
	b _02085F22
	.balign 4, 0
_02085F00: .word _0210272C
_02085F04: .word gMain
_02085F08: .word 0x00000246
_02085F0C: .word 0x000005E5
_02085F10: .word 0x000005E2
_02085F14:
	mov r0, #0xeb
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r1, [r2, #4]
	add r0, r0, #4
	str r1, [r4, r0]
_02085F22:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
_02085F2A:
	cmp r6, #1
	bne _02085F78
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r1, _02085F7C ; =0x00000246
	mov r0, #0x14
	ldrsh r2, [r4, r1]
	sub r1, r1, #2
	ldrsh r1, [r4, r1]
	mul r0, r2
	add r2, sp, #4
	lsl r1, r1, #2
	add r0, r2, r0
	ldr r5, [r1, r0]
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02086B2C
	sub r5, #0xa
	cmp r5, #1
	bhi _02085F6A
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #2
	beq _02085F78
	mov r1, #2
	add sp, #0x40
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02085F6A:
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #1
	beq _02085F78
	mov r1, #1
	str r1, [r4, r0]
_02085F78:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02085F7C: .word 0x00000246
	thumb_func_end sub_02085C20

	thumb_func_start sub_02085F80
sub_02085F80: ; 0x02085F80
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x64
	mov r1, #0x6c
	bl String_ctor
	mov r1, #0xa1
	add r7, r0, #0
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r0, r1, #0
	mov r4, #0
	add r0, #0x18
	add r1, #0x4c
	strb r4, [r6, r0]
	ldr r0, [r6, r1]
	cmp r0, #0
	ble _02085FEC
	add r5, r6, #0
_02085FA8:
	ldr r0, [r5]
	cmp r0, #0
	bne _02085FC0
	mov r0, #1
	str r0, [r5]
	ldr r1, [r5, #8]
	bl sub_02086D98
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0200DC4C
_02085FC0:
	mov r0, #1
	str r0, [sp]
	ldr r1, [r5]
	mov r2, #1
	add r0, r7, #0
	sub r1, r1, #1
	add r3, r2, #0
	bl String16_FormatInteger
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r1, r7, #0
	bl StringCat
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, r0
	blt _02085FA8
_02085FEC:
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	mov r1, #3
	bl sub_02085808
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02085F80

	thumb_func_start sub_02085FFC
sub_02085FFC: ; 0x02085FFC
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0x9a
	lsl r2, r2, #2
	add r5, r0, #0
	mov r1, #1
	add r3, r2, #0
	str r1, [r5, r2]
	mov r0, #0
	add r3, #0x18
	strb r0, [r5, r3]
	add r3, r2, #0
	add r3, #0x6c
	ldr r3, [r5, r3]
	cmp r3, #0
	bne _02086044
	add r0, r2, #0
	add r0, #0x68
	ldr r0, [r5, r0]
	sub r3, r0, #1
	add r0, r2, #0
	sub r0, #0x54
	str r3, [r5, r0]
	sub r2, #0x54
	ldr r2, [r5, r2]
	mov r0, #0x1c
	mul r0, r2
	add r0, r5, r0
	mov r2, #0xeb
	ldr r3, [r0, #4]
	lsl r2, r2, #2
	str r1, [r5, r2]
	add r0, r2, #4
	str r3, [r5, r0]
	add r2, #8
	str r1, [r5, r2]
	pop {r3, r4, r5, r6, r7, pc}
_02086044:
	sub r2, #0x54
	ldr r6, [r5, r2]
	mov r1, #0x1c
	add r4, r6, #0
	mul r4, r1
	str r0, [r5, r4]
	add r1, r5, r4
	ldr r0, [r5, r4]
	ldr r1, [r1, #8]
	bl sub_02086D98
	add r1, r0, #0
	add r0, r5, r4
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	add r0, r5, r4
	ldr r7, [r0, #4]
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	ble _020860B6
	sub r1, r6, #1
	mov r0, #0x1c
	add r4, r1, #0
	mul r4, r0
	add r1, r5, r4
	ldr r0, [r5, r4]
	ldr r1, [r1, #8]
	bl sub_02086D98
	add r1, r0, #0
	add r0, r5, r4
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	add r0, r5, r4
	ldr r3, [r0, #4]
	cmp r7, r3
	beq _020860A8
	mov r1, #0xeb
	lsl r1, r1, #2
	mov r2, #1
	str r2, [r5, r1]
	add r0, r1, #4
	str r3, [r5, r0]
	add r1, #8
	str r2, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
_020860A8:
	mov r0, #0xeb
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r1, r6, #1
	add r0, r0, #4
	str r1, [r5, r0]
_020860B6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02085FFC

	thumb_func_start sub_020860B8
sub_020860B8: ; 0x020860B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	str r0, [sp, #4]
	mov r2, #0xc1
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r2, [sp, #4]
	mov r0, #0
_020860CA:
	add r0, r0, #1
	str r1, [r2, #0x10]
	add r1, r1, #4
	add r2, #0x1c
	cmp r0, #0x10
	blt _020860CA
	ldr r4, _0208616C ; =_02102768
	add r3, sp, #8
	mov r2, #0x30
_020860DC:
	ldrh r1, [r4]
	add r4, r4, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020860DC
	cmp r0, #0x1c
	bge _0208614A
	add r2, sp, #8
	lsl r1, r0, #3
	add r1, r2, r1
	mov r7, #0x7f
	ldr r2, [sp, #4]
	lsl r3, r0, #2
	mvn r7, r7
	add r2, r2, r3
	ldr r4, _02086170 ; =0x00000307
	add r3, r7, #4
_02086100:
	mov r5, #0x7d
	mov r6, #0x79
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	add r0, r0, #1
	sub r6, r5, r6
	mov r5, #0xc1
	lsl r5, r5, #2
	strb r6, [r2, r5]
	mov r5, #0x7f
	mov r6, #0x7b
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	sub r6, r5, r6
	ldr r5, _02086174 ; =0x00000306
	strb r6, [r2, r5]
	mov r5, #0x7d
	mov r6, #0x79
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	add r6, r5, r6
	ldr r5, _02086178 ; =0x00000305
	strb r6, [r2, r5]
	ldrsh r6, [r1, r7]
	ldrsh r5, [r1, r3]
	add r1, #8
	add r5, r6, r5
	strb r5, [r2, r4]
	add r2, r2, #4
	cmp r0, #0x1c
	blt _02086100
_0208614A:
	mov r0, #0x6c
	str r0, [sp]
	mov r1, #0xc1
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r2, _0208617C ; =sub_02086180
	ldr r3, [sp, #4]
	mov r1, #0x1c
	bl sub_02026C44
	mov r2, #3
	ldr r1, [sp, #4]
	lsl r2, r2, #8
	str r0, [r1, r2]
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208616C: .word _02102768
_02086170: .word 0x00000307
_02086174: .word 0x00000306
_02086178: .word 0x00000305
_0208617C: .word sub_02086180
	thumb_func_end sub_020860B8

	thumb_func_start sub_02086180
sub_02086180: ; 0x02086180
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0xb
	lsl r2, r2, #6
	add r5, r0, #0
	ldr r0, [r4, r2]
	cmp r0, #1
	bne _020861B4
	add r0, r2, #0
	add r0, #0xb4
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _020861A0
	mov r0, #1
	add r2, #0xb4
	str r0, [r4, r2]
_020861A0:
	cmp r1, #0
	beq _020861A6
	b _0208631A
_020861A6:
	cmp r5, #0x10
	bhs _020861E6
	mov r1, #0x3f
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	cmp r5, r0
	bhs _020861B6
_020861B4:
	b _0208631A
_020861B6:
	mov r0, #0x1c
	mul r0, r5
	add r3, r4, r0
	ldr r0, [r3, #8]
	cmp r0, #1
	bne _020861D0
	add r0, r1, #0
	mov r2, #2
	sub r0, #0x44
	str r2, [r4, r0]
	sub r1, #0x40
	str r5, [r4, r1]
	b _020861DE
_020861D0:
	add r0, r1, #0
	mov r2, #1
	sub r0, #0x44
	str r2, [r4, r0]
	ldr r0, [r3, #4]
	sub r1, #0x40
	str r0, [r4, r1]
_020861DE:
	ldr r0, _0208631C ; =0x000005E5
	bl PlaySE
	pop {r3, r4, r5, r6, r7, pc}
_020861E6:
	cmp r5, #0x1a
	bne _02086200
	mov r0, #0x91
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r4, r0]
	mov r1, #2
	add r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _0208631C ; =0x000005E5
	bl PlaySE
	b _0208623E
_02086200:
	cmp r5, #0x1b
	bne _0208621A
	mov r0, #0x91
	mov r1, #3
	lsl r0, r0, #2
	strh r1, [r4, r0]
	mov r1, #2
	add r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _02086320 ; =0x000005E2
	bl PlaySE
	b _0208623E
_0208621A:
	add r0, r5, #0
	sub r0, #0x10
	mov r1, #5
	bl _u32_div_f
	mov r0, #0x91
	lsl r0, r0, #2
	strh r1, [r4, r0]
	add r0, r5, #0
	sub r0, #0x10
	mov r1, #5
	bl _u32_div_f
	ldr r1, _02086324 ; =0x00000246
	strh r0, [r4, r1]
	ldr r0, _0208631C ; =0x000005E5
	bl PlaySE
_0208623E:
	cmp r5, #0x10
	blo _02086308
	cmp r5, #0x19
	bhi _02086308
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0208631A
	sub r0, #0xc0
	ldr r7, [r4, r0]
	mov r0, #0x1c
	add r6, r7, #0
	mul r6, r0
	add r0, r5, #0
	sub r0, #0xf
	str r0, [r4, r6]
	add r1, r4, r6
	ldr r0, [r4, r6]
	ldr r1, [r1, #8]
	bl sub_02086D98
	add r1, r0, #0
	add r0, r4, r6
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl sub_02086AB4
	sub r5, #0x10
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02086B2C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl sub_02086AB4
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl sub_02086AB4
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl sub_02086B6C
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	add r0, r4, r6
	ldr r2, [r0, #4]
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r3, [r4, r0]
	add r1, r7, #1
	cmp r1, r3
	bne _020862D8
	add r1, r0, #0
	mov r2, #1
	add r1, #0xdc
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0xe0
	str r2, [r4, r1]
	add r0, #0xe4
	str r2, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020862D8:
	mov r3, #0x1c
	mul r3, r1
	add r3, r4, r3
	ldr r3, [r3, #4]
	cmp r2, r3
	beq _020862FA
	add r1, r0, #0
	mov r2, #1
	add r1, #0xdc
	str r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xe0
	str r3, [r4, r1]
	mov r1, #0
	add r0, #0xe4
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020862FA:
	add r2, r0, #0
	mov r3, #2
	add r2, #0xdc
	str r3, [r4, r2]
	add r0, #0xe0
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02086308:
	cmp r5, #0x1a
	bne _02086314
	add r0, r4, #0
	bl sub_02085FFC
	pop {r3, r4, r5, r6, r7, pc}
_02086314:
	add r0, r4, #0
	bl sub_02085F80
_0208631A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208631C: .word 0x000005E5
_02086320: .word 0x000005E2
_02086324: .word 0x00000246
	thumb_func_end sub_02086180

	thumb_func_start sub_02086328
sub_02086328: ; 0x02086328
	push {r4, lr}
	mov r1, #0xeb
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #2
	bgt _02086346
	cmp r2, #0
	blt _02086380
	beq _02086380
	cmp r2, #1
	beq _0208634A
	cmp r2, #2
	beq _02086372
	pop {r4, pc}
_02086346:
	cmp r2, #0xff
	pop {r4, pc}
_0208634A:
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_02085604
	add r0, r4, #0
	bl sub_02086DA4
	add r0, r4, #0
	mov r1, #1
	bl sub_02086DE4
	add r0, r4, #0
	mov r1, #2
	bl sub_02085808
	mov r0, #0xeb
	mov r1, #0xff
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
_02086372:
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_02086AE4
	add r0, r4, #0
	bl sub_02086384
_02086380:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02086328

	thumb_func_start sub_02086384
sub_02086384: ; 0x02086384
	mov r2, #0xeb
	lsl r2, r2, #2
	mov r3, #0
	str r3, [r0, r2]
	add r1, r2, #4
	str r3, [r0, r1]
	add r2, #8
	str r3, [r0, r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02086384

	thumb_func_start sub_02086398
sub_02086398: ; 0x02086398
	push {r3, r4}
	mov r2, #0x2d
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	mov r3, #0
	cmp r4, #0
	ble _020863BA
_020863A6:
	ldr r2, [r0, #4]
	cmp r1, r2
	bne _020863B2
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_020863B2:
	add r3, r3, #1
	add r0, #0x1c
	cmp r3, r4
	blt _020863A6
_020863BA:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02086398

	thumb_func_start sub_020863C0
sub_020863C0: ; 0x020863C0
	push {r3, r4, r5, r6}
	mov r2, #0x2d
	lsl r2, r2, #4
	ldr r6, [r0, r2]
	mov r5, #0
	add r4, r5, #0
	cmp r6, #0
	ble _020863EE
	mov r2, #1
_020863D2:
	ldr r3, [r0, #4]
	cmp r1, r3
	bne _020863DC
	add r5, r2, #0
	b _020863E6
_020863DC:
	cmp r5, #1
	bne _020863E6
	sub r0, r4, #1
	pop {r3, r4, r5, r6}
	bx lr
_020863E6:
	add r4, r4, #1
	add r0, #0x1c
	cmp r4, r6
	blt _020863D2
_020863EE:
	sub r0, r6, #1
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_020863C0

	thumb_func_start sub_020863F4
sub_020863F4: ; 0x020863F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r0, #0x6c
	bl sub_0200CF18
	mov r7, #0x2f
	lsl r7, r7, #4
	add r2, sp, #0x2c
	ldr r3, _02086484 ; =_021027F4
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _02086488 ; =_021027C8
	stmia r2!, {r0, r1}
	add r3, sp, #0x18
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r3]
	ldr r0, [r4, r7]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _0208648C ; =_021027DC
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r7, #0
	ldr r0, [r4, r0]
	bl sub_0200CF38
	add r1, r7, #4
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x80
	bl sub_0200CFF4
	cmp r0, #0
	bne _02086468
	bl GF_AssertFail
_02086468:
	mov r1, #0x2f
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0
	bl sub_0200D3F8
	cmp r0, #0
	bne _02086480
	bl GF_AssertFail
_02086480:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02086484: .word _021027F4
_02086488: .word _021027C8
_0208648C: .word _021027DC
	thumb_func_end sub_020863F4

	thumb_func_start sub_02086490
sub_02086490: ; 0x02086490
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r1, #0x2f
	lsl r1, r1, #4
	add r7, r0, #0
	add r0, r1, #4
	ldr r5, [r7, r0]
	add r0, r1, #0
	add r0, #0xc
	ldr r0, [r7, r0]
	ldr r6, [r7, r1]
	str r0, [sp, #0x18]
	add r0, r1, #0
	add r0, #8
	ldr r0, [r7, r0]
	mov r3, #1
	str r0, [sp, #0x1c]
	sub r0, r1, #4
	ldr r4, [r7, r0]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6c
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0xc
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6c
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0xe
	mov r3, #1
	bl sub_02007B68
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r1, #0xbe
	mov r2, #0xd
	mov r3, #0x6c
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6c
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0xf
	mov r3, #5
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6c
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0x11
	mov r3, #5
	bl sub_02007B68
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r1, #0xbe
	mov r2, #0x10
	mov r3, #0x6c
	bl PaletteData_LoadNarc
	str r4, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0xfa
	str r1, [sp, #0x10]
	lsl r0, r0, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	mov r1, #2
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #2
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #3
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _020866C4 ; =0x000003E9
	mov r1, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _020866C4 ; =0x000003E9
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #4
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _020866C4 ; =0x000003E9
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #6
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _020866C4 ; =0x000003E9
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #7
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _020866C8 ; =0x000003EA
	add r2, r6, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _020866C8 ; =0x000003EA
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #8
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _020866C8 ; =0x000003EA
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0xa
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _020866C8 ; =0x000003EA
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0xb
	bl sub_0200D71C
	mov r0, #0xf6
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl Options_GetFrame
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x6c
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	mov r1, #4
	mov r2, #1
	mov r3, #0xa
	bl sub_0200E644
	add r0, r4, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xb0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r1, #0x26
	mov r3, #0x6c
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xc0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x6c
	bl PaletteData_LoadNarc
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020866C4: .word 0x000003E9
_020866C8: .word 0x000003EA
	thumb_func_end sub_02086490

	thumb_func_start sub_020866CC
sub_020866CC: ; 0x020866CC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	ble _020866F2
	mov r7, #0x2d
	add r5, r6, #0
	lsl r7, r7, #4
_020866E2:
	ldr r0, [r5, #0xc]
	bl sub_0200D9DC
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, r0
	blt _020866E2
_020866F2:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r5, #0
	cmp r0, #0
	ble _02086718
	mov r7, #0xfb
	add r4, r6, #0
	lsl r7, r7, #2
_02086704:
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	ldr r0, [r6, r7]
	add r5, r5, #1
	add r4, #0x1c
	cmp r5, r0
	blt _02086704
_02086718:
	mov r7, #0x9d
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02086720:
	ldr r0, [r4, r7]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, #0x1c
	cmp r5, #2
	blt _02086720
	mov r7, #0x22
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #4
_02086736:
	ldr r0, [r4, r7]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, #0x1c
	cmp r5, #3
	blt _02086736
	add r0, r6, #0
	bl sub_02086FE8
	mov r0, #0xe7
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020866CC

	thumb_func_start sub_02086758
sub_02086758: ; 0x02086758
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r1, [sp]
	add r2, r0, #4
	ldr r1, [r1, r0]
	str r1, [sp, #8]
	ldr r1, [sp]
	ldr r1, [r1, r2]
	add r2, sp, #0x10
	str r1, [sp, #4]
	ldr r1, [sp, #0xc]
	strh r1, [r2]
	strh r1, [r2, #2]
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	mov r1, #0xa
	str r1, [sp, #0x18]
	ldr r1, [sp, #0xc]
	mov r2, #1
	str r1, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r1, [sp, #0x1c]
	add r1, r0, #0
	add r1, #0xf8
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r1, [sp, #0x30]
	sub r1, r2, #2
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	ldr r1, [sp]
	str r2, [sp, #0x20]
	add r0, #0xf0
	ldr r4, [r1, r0]
	mov r1, #0x3f
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	sub r6, r0, #1
	bmi _020867DC
	mov r0, #0x1c
	add r1, r6, #0
	mul r1, r0
	ldr r0, [sp]
	mov r7, #0xa
	add r5, r0, r1
_020867C0:
	add r0, r4, #0
	add r1, r7, #0
	bl _u32_div_f
	add r0, r1, #1
	str r0, [r5]
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
	sub r5, #0x1c
	sub r6, r6, #1
	bpl _020867C0
_020867DC:
	mov r1, #0xfb
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r2, #0x2d
	ldr r1, [sp]
	lsl r2, r2, #4
	ldr r1, [r1, r2]
	mov r6, #0
	add r1, r1, r0
	cmp r1, #0
	ble _0208689C
	ldr r4, [sp]
	mov r7, #0x4c
	add r5, r4, #0
_020867FA:
	cmp r0, #0
	beq _0208684C
	mov r0, #7
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	add r0, r0, #1
	cmp r6, r0
	bne _0208684C
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r2, sp, #0x10
	bl sub_0200D734
	mov r1, #0x73
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	lsl r1, r7, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	mov r2, #0x18
	bl sub_0200DDB8
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x16
	bl sub_0200DC4C
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200DC18
	ldr r0, [sp, #0xc]
	add r4, #0x1c
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _02086882
_0208684C:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r2, sp, #0x10
	bl sub_0200D734
	lsl r1, r7, #0x10
	str r0, [r5, #0xc]
	asr r1, r1, #0x10
	mov r2, #0x18
	bl sub_0200DDB8
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl sub_02086D98
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0200DC4C
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r5, #0xc]
	bl sub_0200DC18
	add r5, #0x1c
_02086882:
	ldr r1, [sp]
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r2, r1, #0
	mov r1, #0x2d
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	add r6, r6, #1
	add r1, r1, r0
	add r7, #8
	cmp r6, r1
	blt _020867FA
_0208689C:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02086758

	thumb_func_start sub_020868A0
sub_020868A0: ; 0x020868A0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	mov r1, #0x2f
	lsl r1, r1, #4
	add r5, r0, #0
	add r0, r1, #4
	ldr r6, [r5, r1]
	ldr r4, [r5, r0]
	mov r2, #0
	add r0, sp, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	add r1, #0xf9
	mov r0, #1
	str r0, [sp, #0x10]
	sub r0, r0, #2
	str r2, [sp, #8]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r2, [sp, #0xc]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0x8f
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0x96
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0x3f
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl sub_02086AE4
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r2, #0x91
	lsl r2, r2, #2
	mov r1, #0
	strh r1, [r5, r2]
	add r0, r2, #2
	strh r1, [r5, r0]
	mov r0, #1
	sub r2, #0x14
	str r0, [r5, r2]
	add r0, r5, #0
	bl sub_02086B2C
	mov r1, #0x8f
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, #0xc
	ldr r1, [r5, r1]
	bl sub_0200DC4C
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200E0FC
	mov r2, #0x26
	lsl r2, r2, #4
	mov r1, #0
	strh r1, [r5, r2]
	add r0, r2, #2
	strh r1, [r5, r0]
	mov r0, #1
	sub r2, #0x14
	str r0, [r5, r2]
	add r0, r5, #0
	bl sub_02086B2C
	mov r1, #0x96
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, #0xc
	ldr r1, [r5, r1]
	bl sub_0200DC4C
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200E0FC
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl sub_02086AB4
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl sub_02086AB4
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020868A0

	thumb_func_start sub_020869BC
sub_020869BC: ; 0x020869BC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	mov r2, #0x2f
	lsl r2, r2, #4
	add r5, r0, #0
	add r0, r2, #4
	ldr r6, [r5, r2]
	ldr r4, [r5, r0]
	mov r0, #0
	add r1, sp, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	add r2, #0xfa
	mov r1, #0xa
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0x10]
	sub r1, r1, #2
	str r0, [sp, #0xc]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	str r0, [sp, #0xc]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r2, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0x9d
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0
	bl sub_0200D734
	mov r2, #0x29
	lsl r2, r2, #4
	add r1, r2, #0
	str r0, [r5, r2]
	add r1, #0xde
	ldrb r3, [r5, r1]
	add r1, r2, #0
	add r1, #0xdf
	ldrb r1, [r5, r1]
	add r0, r2, #0
	sub r0, #0x1c
	add r3, r3, r1
	lsr r1, r3, #0x1f
	add r1, r3, r1
	add r3, r2, #0
	add r3, #0xdc
	add r2, #0xdd
	lsl r1, r1, #0xf
	ldrb r3, [r5, r3]
	ldrb r2, [r5, r2]
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	add r3, r3, r2
	lsr r2, r3, #0x1f
	add r2, r3, r2
	lsl r2, r2, #0xf
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r2, #0x29
	lsl r2, r2, #4
	add r1, r2, #0
	add r1, #0xe2
	ldrb r3, [r5, r1]
	add r1, r2, #0
	add r1, #0xe3
	ldrb r1, [r5, r1]
	ldr r0, [r5, r2]
	add r3, r3, r1
	lsr r1, r3, #0x1f
	add r1, r3, r1
	add r3, r2, #0
	add r3, #0xe0
	add r2, #0xe1
	lsl r1, r1, #0xf
	ldrb r3, [r5, r3]
	ldrb r2, [r5, r2]
	asr r1, r1, #0x10
	add r3, r3, r2
	lsr r2, r3, #0x1f
	add r2, r3, r2
	lsl r2, r2, #0xf
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200DC18
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020869BC

	thumb_func_start sub_02086AB4
sub_02086AB4: ; 0x02086AB4
	push {r3, lr}
	cmp r2, #1
	bne _02086ACE
	mov r2, #0x1c
	mul r2, r1
	add r1, r0, r2
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, pc}
_02086ACE:
	mov r2, #0x1c
	mul r2, r1
	add r1, r0, r2
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02086AB4

	thumb_func_start sub_02086AE4
sub_02086AE4: ; 0x02086AE4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r1, r0
	blt _02086B26
	mov r0, #0x1c
	mul r0, r1
	add r0, r4, r0
	mov r2, #0x85
	ldr r0, [r0, #0xc]
	lsl r2, r2, #2
	str r1, [r4, r2]
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	mov r0, #0x22
	lsl r0, r0, #4
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
_02086B26:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02086AE4

	thumb_func_start sub_02086B2C
sub_02086B2C: ; 0x02086B2C
	push {r4, lr}
	add r1, #0x10
	mov r2, #0x8f
	add r3, r0, #0
	lsl r2, r2, #2
	lsl r1, r1, #2
	ldr r0, [r3, r2]
	add r3, r3, r1
	add r1, r2, #0
	add r1, #0xca
	ldrb r4, [r3, r1]
	add r1, r2, #0
	add r1, #0xcb
	ldrb r1, [r3, r1]
	add r4, r4, r1
	lsr r1, r4, #0x1f
	add r1, r4, r1
	add r4, r2, #0
	add r4, #0xc8
	add r2, #0xc9
	lsl r1, r1, #0xf
	ldrb r4, [r3, r4]
	ldrb r2, [r3, r2]
	asr r1, r1, #0x10
	add r3, r4, r2
	lsr r2, r3, #0x1f
	add r2, r3, r2
	lsl r2, r2, #0xf
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r4, pc}
	thumb_func_end sub_02086B2C

	thumb_func_start sub_02086B6C
sub_02086B6C: ; 0x02086B6C
	push {r4, lr}
	add r3, r0, #0
	mov r0, #0x1c
	mul r0, r2
	add r1, #0x10
	mov r2, #0x22
	lsl r1, r1, #2
	add r0, r3, r0
	lsl r2, r2, #4
	add r3, r3, r1
	add r1, r2, #0
	add r1, #0xe6
	ldrb r4, [r3, r1]
	add r1, r2, #0
	add r1, #0xe7
	ldrb r1, [r3, r1]
	ldr r0, [r0, r2]
	add r4, r4, r1
	lsr r1, r4, #0x1f
	add r1, r4, r1
	add r4, r2, #0
	add r4, #0xe4
	add r2, #0xe5
	lsl r1, r1, #0xf
	ldrb r4, [r3, r4]
	ldrb r2, [r3, r2]
	asr r1, r1, #0x10
	add r3, r4, r2
	lsr r2, r3, #0x1f
	add r2, r3, r2
	lsl r2, r2, #0xf
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02086B6C

	thumb_func_start sub_02086BB4
sub_02086BB4: ; 0x02086BB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	add r4, r5, #0
	mov r7, #0x22
	mov r6, #1
	add r4, #0x1c
	lsl r7, r7, #4
_02086BE0:
	ldr r0, [r4, r7]
	bl sub_0200DC64
	cmp r0, #3
	bne _02086C34
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200DCA0
	cmp r0, #0
	bne _02086C76
	mov r0, #0x22
	mov r1, #0x85
	lsl r0, r0, #4
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl sub_0200DC4C
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02086C1E
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl sub_02086AB4
	b _02086C28
_02086C1E:
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl sub_02086AB4
_02086C28:
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl sub_02086AB4
	b _02086C76
_02086C34:
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r0, r1
	beq _02086C48
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200DC4C
_02086C48:
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC64
	cmp r0, #3
	beq _02086C76
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02086C6C
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl sub_02086AB4
	b _02086C76
_02086C6C:
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl sub_02086AB4
_02086C76:
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, #3
	blt _02086BE0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02086BB4

	thumb_func_start sub_02086C80
sub_02086C80: ; 0x02086C80
	push {r3, lr}
	cmp r0, #0
	beq _02086C8A
	bl sub_020136B4
_02086C8A:
	pop {r3, pc}
	thumb_func_end sub_02086C80

	thumb_func_start sub_02086C8C
sub_02086C8C: ; 0x02086C8C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	add r4, r5, #0
_02086C96:
	ldr r0, _02086D94 ; =0x0000036E
	ldrb r1, [r5, r0]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	add r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	asr r0, r0, #0x10
	sub r0, #0x28
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	mov r0, #0xdb
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	add r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	asr r0, r0, #0x10
	sub r0, r0, #7
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02086CD8
	cmp r0, #1
	beq _02086CE2
	b _02086D60
_02086CD8:
	mov r0, #0xa
	mov r1, #0
	lsl r0, r0, #6
	strb r1, [r4, r0]
	b _02086D82
_02086CE2:
	mov r0, #0xa
	lsl r0, r0, #6
	ldrb r0, [r4, r0]
	add r1, r0, #1
	mov r0, #0xa
	lsl r0, r0, #6
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _02086D12
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DC4C
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_02086C80
	b _02086D82
_02086D12:
	cmp r0, #2
	bne _02086D32
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_0200DC4C
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	sub r2, r6, #1
	bl sub_02086C80
	b _02086D82
_02086D32:
	cmp r0, #0xa
	bne _02086D82
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_02086C80
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r0, #1
	mov r0, #0x9a
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02086D82
_02086D60:
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_02086C80
	mov r0, #0x9a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_02086D82:
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	add r4, #0x1c
	str r0, [sp]
	cmp r0, #2
	blt _02086C96
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02086D94: .word 0x0000036E
	thumb_func_end sub_02086C8C

	thumb_func_start sub_02086D98
sub_02086D98: ; 0x02086D98
	mov r2, #0
	cmp r1, #0
	bne _02086DA0
	mov r2, #0xb
_02086DA0:
	add r0, r2, r0
	bx lr
	thumb_func_end sub_02086D98

	thumb_func_start sub_02086DA4
sub_02086DA4: ; 0x02086DA4
	push {r4, r5, r6, r7}
	mov r1, #0x2d
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r3, #0
	cmp r1, #0
	ble _02086DDE
	mov r6, #0x2e
	lsl r6, r6, #4
	add r4, r0, #0
	add r1, r3, #0
	mov r2, #1
	sub r7, r6, #4
_02086DBE:
	ldr r5, [r0, r7]
	cmp r3, r5
	blt _02086DCE
	ldr r5, [r0, r6]
	cmp r3, r5
	bge _02086DCE
	str r2, [r4, #8]
	b _02086DD0
_02086DCE:
	str r1, [r4, #8]
_02086DD0:
	mov r5, #0x2d
	lsl r5, r5, #4
	ldr r5, [r0, r5]
	add r3, r3, #1
	add r4, #0x1c
	cmp r3, r5
	blt _02086DBE
_02086DDE:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02086DA4

	thumb_func_start sub_02086DE4
sub_02086DE4: ; 0x02086DE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	mov r1, #0xb5
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	mov r4, #0
	lsl r2, r0, #1
	ldr r0, [sp]
	str r4, [sp, #8]
	add r2, r0, r2
	add r0, r1, #0
	sub r0, #0x34
	ldrsh r5, [r2, r0]
	ldr r0, [sp]
	sub r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	bgt _02086E0E
	b _02086F3E
_02086E0E:
	ldr r7, [sp]
	add r6, r7, #0
_02086E12:
	mov r0, #0xb7
	ldr r1, [sp]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r4, r0
	blt _02086E3E
	add r2, r1, #0
	mov r1, #0x2e
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	cmp r4, r1
	bge _02086E3E
	cmp r4, r0
	bne _02086E36
	add r5, #0x14
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _02086E50
_02086E36:
	add r5, #0x20
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _02086E50
_02086E3E:
	cmp r4, #0
	bne _02086E4A
	add r5, #0x14
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _02086E50
_02086E4A:
	add r5, #8
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
_02086E50:
	add r1, sp, #0xc
	ldr r0, [r7, #0xc]
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02086E72
	add r3, sp, #0xc
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r7, #0xc]
	add r1, r5, #0
	bl sub_0200DDB8
	b _02086E8E
_02086E72:
	add r1, sp, #0xc
	mov r0, #2
	ldrsh r0, [r1, r0]
	sub r1, r5, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r7, #0x14]
	mov r0, #0
	strh r0, [r7, #0x16]
	mov r0, #2
	strb r0, [r7, #0x18]
	mov r0, #0
	strb r0, [r7, #0x19]
_02086E8E:
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	cmp r4, r0
	bne _02086F2C
	mov r0, #0xfb
	ldr r1, [sp]
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	ldr r0, [sp, #8]
	cmp r0, r1
	beq _02086F2C
	mov r0, #0x73
	lsl r0, r0, #2
	add r1, sp, #0xc
	ldr r0, [r6, r0]
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	ldr r1, [sp]
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r2, r1, #0
	mov r1, #0xb7
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	cmp r1, r0
	bne _02086ED2
	add r5, #8
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _02086EE8
_02086ED2:
	cmp r4, r1
	ble _02086EE2
	cmp r4, r0
	bge _02086EE2
	add r5, #0x14
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _02086EE8
_02086EE2:
	add r5, #8
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
_02086EE8:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _02086F02
	mov r0, #0x73
	lsl r0, r0, #2
	add r3, sp, #0xc
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r6, r0]
	add r1, r5, #0
	bl sub_0200DDB8
	b _02086F24
_02086F02:
	add r1, sp, #0xc
	mov r0, #2
	ldrsh r0, [r1, r0]
	sub r1, r5, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	mov r0, #0x75
	lsl r0, r0, #2
	strh r1, [r6, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r6, r0]
	mov r0, #0x76
	mov r1, #2
	lsl r0, r0, #2
	strb r1, [r6, r0]
_02086F24:
	ldr r0, [sp, #8]
	add r6, #0x1c
	add r0, r0, #1
	str r0, [sp, #8]
_02086F2C:
	mov r0, #0x2d
	ldr r1, [sp]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r4, r4, #1
	add r7, #0x1c
	cmp r4, r0
	bge _02086F3E
	b _02086E12
_02086F3E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02086DE4

	thumb_func_start sub_02086F44
sub_02086F44: ; 0x02086F44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	ble _02086FC8
	add r5, r6, #0
_02086F58:
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r4, r0
	blt _02086F74
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	cmp r4, r0
	bge _02086F74
	mov r0, #0x10
	str r0, [sp]
	add r7, r0, #0
	b _02086F7A
_02086F74:
	mov r0, #4
	str r0, [sp]
	mov r7, #8
_02086F7A:
	add r2, sp, #4
	ldr r0, [r5, #0xc]
	add r1, sp, #4
	add r2, #2
	bl sub_0200DE44
	add r1, sp, #4
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r4, r4, #1
	sub r1, r0, r7
	ldr r0, [r5, #0x10]
	strb r1, [r0]
	add r1, sp, #4
	mov r0, #0
	ldrsh r1, [r1, r0]
	ldr r0, [sp]
	sub r1, r1, r0
	ldr r0, [r5, #0x10]
	strb r1, [r0, #2]
	add r1, sp, #4
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r1, r0, r7
	ldr r0, [r5, #0x10]
	strb r1, [r0, #1]
	add r1, sp, #4
	mov r0, #0
	ldrsh r1, [r1, r0]
	ldr r0, [sp]
	add r1, r1, r0
	ldr r0, [r5, #0x10]
	add r5, #0x1c
	strb r1, [r0, #3]
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	cmp r4, r0
	blt _02086F58
_02086FC8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02086F44

	thumb_func_start sub_02086FCC
sub_02086FCC: ; 0x02086FCC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	mov r1, #0x6c
	bl sub_02013534
	mov r1, #0xde
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #2
	mov r1, #0x6c
	bl sub_02002CEC
	pop {r4, pc}
	thumb_func_end sub_02086FCC

	thumb_func_start sub_02086FE8
sub_02086FE8: ; 0x02086FE8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	bl sub_02002DB4
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02013660
	mov r0, #0xe1
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_02021B5C
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02013660
	mov r0, #0x39
	lsl r0, r0, #4
	add r0, r4, r0
	bl sub_02021B5C
	mov r0, #0xde
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020135AC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02086FE8

	thumb_func_start sub_02087028
sub_02087028: ; 0x02087028
	push {r4, lr}
	sub sp, #0x18
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	ldr r4, _02087060 ; =0x000003EB
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r2, r4, #0
	str r4, [sp, #0x14]
	sub r0, #0xef
	sub r2, #0xfb
	sub r4, #0xf7
	ldr r0, [r3, r0]
	ldr r2, [r3, r2]
	ldr r3, [r3, r4]
	mov r1, #2
	bl sub_0200D644
	add sp, #0x18
	pop {r4, pc}
	nop
_02087060: .word 0x000003EB
	thumb_func_end sub_02087028

	thumb_func_start sub_02087064
sub_02087064: ; 0x02087064
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_02087028
	mov r1, #0
	add r0, r4, #0
	mov r2, #0x4e
	mov r3, #0xa5
	str r1, [sp]
	bl sub_02087090
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xac
	mov r3, #0xa5
	bl sub_02087090
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_02087064

	thumb_func_start sub_02087090
sub_02087090: ; 0x02087090
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x26
	mov r3, #0x6c
	bl NewMsgDataFromNarc
	add r1, r4, #2
	str r0, [sp, #0x14]
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	add r0, sp, #0x1c
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x1c
	mov r2, #0xa
	mov r3, #2
	bl sub_0201D494
	ldr r1, [sp, #0x18]
	mov r0, #2
	mov r2, #0
	mov r3, #0x50
	bl sub_020030A0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _020871BC ; =0x000F0D02
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #0x1c
	mov r1, #2
	bl AddTextPrinterParameterized2
	add r0, sp, #0x1c
	mov r1, #1
	mov r2, #0x6c
	bl sub_02013688
	mov r3, #0xe1
	lsl r3, r3, #2
	mov r1, #0xc
	add r6, r4, #0
	mul r6, r1
	mov r1, #1
	add r3, r5, r3
	add r2, r1, #0
	add r3, r3, r6
	bl sub_02021AC8
	add r0, r4, #0
	add r0, #0x1a
	lsl r0, r0, #2
	add r3, r5, r0
	ldr r0, _020871C0 ; =0x00000306
	add r2, r0, #1
	ldrb r1, [r3, r0]
	ldrb r2, [r3, r2]
	add r2, r1, r2
	lsr r1, r2, #0x1f
	add r1, r2, r1
	lsl r1, r1, #0xf
	asr r7, r1, #0x10
	sub r1, r0, #2
	ldrb r2, [r3, r1]
	sub r1, r0, #1
	ldrb r1, [r3, r1]
	add r2, r2, r1
	lsr r1, r2, #0x1f
	add r1, r2, r1
	lsl r1, r1, #0xf
	asr r1, r1, #0x10
	str r1, [sp, #0x10]
	add r1, r0, #0
	add r1, #0x72
	ldr r1, [r5, r1]
	sub r0, #0x12
	str r1, [sp, #0x2c]
	add r1, sp, #0x1c
	str r1, [sp, #0x30]
	ldr r0, [r5, r0]
	bl sub_0200E2B0
	mov r1, #0xbd
	lsl r1, r1, #2
	str r0, [sp, #0x34]
	ldr r0, [r5, r1]
	add r1, #0xf7
	bl sub_0200D934
	str r0, [sp, #0x38]
	mov r1, #0
	mov r0, #0xe2
	str r1, [sp, #0x3c]
	add r2, r5, r6
	lsl r0, r0, #2
	ldr r2, [r2, r0]
	sub r0, #0xc
	add r5, r5, r0
	sub r7, #0x28
	str r2, [sp, #0x40]
	lsl r2, r7, #0x10
	asr r2, r2, #0x10
	str r2, [sp, #0x44]
	ldr r2, [sp, #0x10]
	lsl r4, r4, #2
	sub r2, r2, #7
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	str r1, [sp, #0x4c]
	str r1, [sp, #0x50]
	mov r1, #1
	str r1, [sp, #0x54]
	mov r1, #0x6c
	str r2, [sp, #0x48]
	str r1, [sp, #0x58]
	add r0, sp, #0x2c
	bl sub_020135D8
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	ldr r1, [sp, #0x70]
	bl sub_020138E0
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl DestroyMsgData
	add r0, sp, #0x1c
	bl RemoveWindow
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_020871BC: .word 0x000F0D02
_020871C0: .word 0x00000306
	thumb_func_end sub_02087090

	thumb_func_start sub_020871C4
sub_020871C4: ; 0x020871C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	add r6, r3, #0
	bl InitWindow
	ldr r0, [sp, #0x28]
	lsl r2, r4, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	lsl r3, r6, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	lsr r2, r2, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r7, #0
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0xb
	bl DrawFrameAndWindow2
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl CopyWindowToVram
	ldr r1, [sp, #0x38]
	add r0, r5, #0
	bl sub_02087230
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020871C4

	thumb_func_start sub_02087230
sub_02087230: ; 0x02087230
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	mov r1, #0xf
	add r4, r0, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x26
	mov r3, #0x6c
	bl NewMsgDataFromNarc
	add r1, r5, #0
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	add r0, r4, #0
	mov r1, #1
	add r2, r5, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r5, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02087230

	thumb_func_start sub_02087284
sub_02087284: ; 0x02087284
	push {r0, r1, r2, r3}
	push {r4, lr}
	ldr r4, [sp, #0xc]
	mov r1, #0x42
	add r0, r4, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, [sp, #8]
	mov r3, #0
	str r1, [r0, #0x10]
	ldr r1, [sp, #0x10]
	str r4, [r0, #0x14]
	str r1, [r0, #0x18]
	ldr r1, [sp, #0x14]
	mov r2, #0xf
	str r1, [r0, #0x1c]
	ldr r1, [sp, #0x18]
	str r1, [r0, #0x20]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #4]
	ldr r1, [sp, #0x20]
	str r1, [r0, #8]
	ldr r1, [sp, #0x24]
	str r1, [r0, #0xc]
	add r1, r0, #0
	add r1, #0xe4
	str r3, [r1]
	add r1, r0, #0
	add r1, #0xfc
	str r2, [r1]
	add r1, r2, #0
	add r1, #0xf1
	str r2, [r0, r1]
	add r1, r0, #0
	add r1, #0xf4
	str r3, [r1]
	add r1, r0, #0
	add r1, #0xf0
	str r3, [r1]
	pop {r4}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end sub_02087284

	thumb_func_start sub_020872DC
sub_020872DC: ; 0x020872DC
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
	ldr r0, _020873D0 ; =0x45800000
	bls _02087344
	add r1, r4, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02087352
_02087344:
	add r1, r4, #0
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02087352:
	bl _ffix
	bl FX_Sqrt
	bl _fflt
	ldr r1, _020873D0 ; =0x45800000
	bl _fdiv
	ldr r1, [sp, #0x30]
	add r4, r0, #0
	bl _fls
	blo _0208738A
	add r1, sp, #0x18
	mov r0, #0x1c
	ldrsh r0, [r1, r0]
	bl _fflt
	add r1, r4, #0
	bl _fgr
	bhi _0208738A
	mov r0, #0
	add r1, r4, #0
	bl _feq
	bne _02087390
_0208738A:
	add sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, pc}
_02087390:
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
_020873D0: .word 0x45800000
	thumb_func_end sub_020872DC

	thumb_func_start sub_020873D4
sub_020873D4: ; 0x020873D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r6, r1, #0
	add r0, r6, #0
	add r0, #0xf0
	ldr r0, [r0]
	cmp r0, #0
	bne _020873E6
	b _02087632
_020873E6:
	ldr r0, [r6, #0x10]
	mov r4, #0
	str r4, [sp, #0x1c]
	cmp r0, #0
	bgt _020873F2
	b _02087632
_020873F2:
	add r0, r6, #0
	mov r7, #0x3f
	str r0, [sp, #0x30]
	add r0, #0xec
	add r5, r6, #0
	lsl r7, r7, #0x18
	str r0, [sp, #0x30]
_02087400:
	cmp r4, #0
	beq _02087410
	mov r0, #0x18
	ldrsh r0, [r5, r0]
	strh r0, [r5, #0x28]
	mov r0, #0x1a
	ldrsh r0, [r5, r0]
	strh r0, [r5, #0x2a]
_02087410:
	ldr r0, [r5, #0x24]
	ldr r3, [r6, #0x20]
	add r1, sp, #0x4c
	add r2, sp, #0x48
	bl sub_0200DF70
	ldr r0, [sp, #0x4c]
	bl _fflt
	ldr r1, _02087638 ; =0x45800000
	bl _fdiv
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x48]
	bl _fflt
	ldr r1, _02087638 ; =0x45800000
	bl _fdiv
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	sub r0, r4, r0
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x41
	lsl r0, r0, #0x18
	bl _fsub
	mov r1, #1
	lsl r1, r1, #0x1e
	bl _fdiv
	add r1, sp, #0x44
	str r1, [sp]
	add r1, sp, #0x40
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x28
	mov r1, #0x2a
	ldrsh r0, [r5, r0]
	ldrsh r1, [r5, r1]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl sub_020872DC
	cmp r0, #0
	beq _020874EE
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	bne _020874EE
	ldr r0, [sp, #0x40]
	mov r1, #0
	bl _fgr
	ldr r0, _02087638 ; =0x45800000
	bls _020874A0
	ldr r1, [sp, #0x40]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	str r0, [sp, #0x14]
	b _020874AE
_020874A0:
	ldr r1, [sp, #0x40]
	bl _fmul
	add r1, r7, #0
	bl _fsub
	str r0, [sp, #0x14]
_020874AE:
	ldr r0, [sp, #0x44]
	mov r1, #0
	bl _fgr
	ldr r0, _02087638 ; =0x45800000
	bls _020874CA
	ldr r1, [sp, #0x44]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	b _020874D6
_020874CA:
	ldr r1, [sp, #0x44]
	bl _fmul
	add r1, r7, #0
	bl _fsub
_020874D6:
	bl _ffix
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x14]
	bl _ffix
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_0200DEDC
	b _02087626
_020874EE:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _020874FA
	cmp r0, #1
	beq _020875CA
	b _02087620
_020874FA:
	add r1, sp, #0x3c
	ldr r0, [r5, #0x24]
	ldr r3, [r6, #0x20]
	add r1, #2
	add r2, sp, #0x3c
	bl sub_0200DE94
	add r0, r6, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x18]
	cmp r0, #0xff
	bne _0208758E
	add r0, r6, #0
	add r0, #0xe8
	str r4, [r0]
	mov r0, #0x28
	add r2, sp, #0x3c
	mov r1, #2
	ldrsh r0, [r6, r0]
	ldrsh r1, [r2, r1]
	sub r0, r0, r1
	cmp r0, #0
	ble _0208753C
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	str r0, [sp, #0x10]
	b _0208754A
_0208753C:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r7, #0
	bl _fsub
	str r0, [sp, #0x10]
_0208754A:
	mov r0, #0x2a
	add r2, sp, #0x3c
	mov r1, #0
	ldrsh r0, [r6, r0]
	ldrsh r1, [r2, r1]
	sub r0, r0, r1
	cmp r0, #0
	ble _0208756A
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	b _02087576
_0208756A:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r7, #0
	bl _fsub
_02087576:
	bl _ffix
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	bl _ffix
	add r1, r0, #0
	ldr r0, [sp, #0x2c]
	bl FX_Atan2Idx
	str r0, [r5, #0x30]
	b _020875AC
_0208758E:
	mov r0, #0x2d
	ldr r1, [r6, #0x10]
	lsl r0, r0, #4
	bl _s32_div_f
	ldr r1, [sp, #0x18]
	add r2, r6, #0
	lsl r1, r1, #4
	add r2, #0xec
	add r1, r6, r1
	ldr r2, [r2]
	ldr r1, [r1, #0x30]
	mul r2, r0
	sub r0, r1, r2
	str r0, [r5, #0x30]
_020875AC:
	mov r1, #0x2d
	ldr r0, [r5, #0x30]
	lsl r1, r1, #4
	bl _s32_div_f
	ldr r0, [sp, #0x30]
	str r1, [r5, #0x30]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x30]
	str r1, [r0]
	ldr r0, [r5, #0x2c]
	add r0, r0, #1
	str r0, [r5, #0x2c]
	b _02087620
_020875CA:
	ldr r0, [r5, #0x30]
	mov r1, #0x2d
	add r0, r0, #4
	lsl r1, r1, #4
	str r0, [r5, #0x30]
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r1, [r5, #0x30]
	bl sub_0201FCAC
	mov r1, #0x28
	ldrsh r1, [r6, r1]
	lsl r1, r1, #0xc
	str r1, [sp, #0x34]
	add r1, r6, #0
	add r1, #0xfc
	ldr r1, [r1]
	mul r0, r1
	str r0, [sp, #0x38]
	ldr r0, [r5, #0x30]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0201FCC0
	mov r1, #0x2a
	ldrsh r1, [r6, r1]
	ldr r2, [sp, #0x34]
	lsl r3, r1, #0xc
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r6, r1]
	mul r0, r1
	ldr r1, [sp, #0x38]
	mov ip, r0
	add r1, r2, r1
	mov r2, ip
	add r2, r3, r2
	ldr r0, [r5, #0x24]
	ldr r3, [r6, #0x20]
	bl sub_0200DF44
_02087620:
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
_02087626:
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	bge _02087632
	b _02087400
_02087632:
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02087638: .word 0x45800000
	thumb_func_end sub_020873D4

	thumb_func_start sub_0208763C
sub_0208763C: ; 0x0208763C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r1, #0
	ldr r1, [r0, #4]
	ldr r5, [r0, #8]
	str r1, [sp, #0x18]
	ldr r1, _020876A4 ; =0x000056CF
	ldr r7, [r0, #0xc]
	ldr r4, [r0]
	add r0, r5, #0
	bl sub_0200D968
	ldr r1, _020876A8 ; =0x000056D0
	add r0, r5, #0
	bl sub_0200D968
	ldr r0, _020876AC ; =_02102814
	lsl r1, r6, #2
	ldr r6, [r0, r1]
	str r4, [sp]
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _020876A4 ; =0x000056CF
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x14]
	add r0, r7, #0
	mov r1, #2
	add r3, r5, #0
	bl sub_0200D68C
	str r4, [sp]
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _020876A8 ; =0x000056D0
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x14]
	add r0, r7, #0
	mov r1, #3
	add r3, r5, #0
	bl sub_0200D68C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020876A4: .word 0x000056CF
_020876A8: .word 0x000056D0
_020876AC: .word _02102814
	thumb_func_end sub_0208763C

	thumb_func_start sub_020876B0
sub_020876B0: ; 0x020876B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r2, r1, #0
	ldr r3, [r0, #0x18]
	ldr r1, _020877AC ; =0x000056CE
	ldr r7, [r0, #4]
	add r5, r3, r1
	ldr r6, [r0, #8]
	ldr r1, [r0, #0xc]
	ldr r4, [r0]
	cmp r3, #1
	ldr r0, [r0, #0x1c]
	bne _02087726
	cmp r0, #0
	str r4, [sp]
	bne _020876F2
	ldr r0, _020877B0 ; =_02102814
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	add r2, r7, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #2
	add r3, r6, #0
	str r5, [sp, #0x14]
	bl sub_0200D68C
	b _0208770E
_020876F2:
	mov r0, #0x60
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #2
	add r2, r7, #0
	add r3, r6, #0
	str r5, [sp, #0x14]
	bl sub_0200D68C
_0208770E:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x5f
	str r5, [sp, #8]
	bl sub_0200D504
	b _02087784
_02087726:
	cmp r0, #0
	str r4, [sp]
	bne _02087750
	ldr r0, _020877B0 ; =_02102814
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	add r2, r7, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #3
	add r3, r6, #0
	str r5, [sp, #0x14]
	bl sub_0200D68C
	b _0208776E
_02087750:
	mov r0, #0x60
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #3
	add r2, r7, #0
	add r3, r6, #0
	str r5, [sp, #0x14]
	bl sub_0200D68C
_0208776E:
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x5f
	str r5, [sp, #8]
	bl sub_0200D504
_02087784:
	mov r0, #0
	str r0, [sp]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x5d
	str r5, [sp, #4]
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x5e
	str r5, [sp, #4]
	bl sub_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020877AC: .word 0x000056CE
_020877B0: .word _02102814
	thumb_func_end sub_020876B0

	thumb_func_start sub_020877B4
sub_020877B4: ; 0x020877B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r7, [r5, #8]
	str r0, [sp]
	mov r1, #0x80
	add r0, sp, #4
	strh r1, [r0]
	mov r1, #0x60
	strh r1, [r0, #2]
	mov r6, #0
	strh r6, [r0, #4]
	strh r6, [r0, #6]
	str r6, [sp, #0xc]
	ldr r0, [r5, #0x18]
	str r0, [sp, #0x14]
	str r6, [sp, #0x30]
	str r6, [sp, #0x34]
	str r6, [sp, #0x10]
	ldr r1, [r5, #0x18]
	ldr r0, _0208782C ; =0x000056CE
	add r1, r1, r0
	str r1, [sp, #0x18]
	ldr r1, [r5, #0x18]
	add r1, r1, r0
	str r1, [sp, #0x1c]
	ldr r1, [r5, #0x18]
	add r1, r1, r0
	str r1, [sp, #0x20]
	ldr r1, [r5, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x24]
	sub r0, r6, #1
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _02087828
	add r4, r5, #0
_02087804:
	ldr r0, [sp]
	add r1, r7, #0
	add r2, sp, #4
	bl sub_0200D734
	str r0, [r4, #0x24]
	bl sub_0200DC18
	ldr r0, [r4, #0x24]
	mov r1, #0x80
	mov r2, #0x60
	bl sub_0200DDB8
	ldr r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02087804
_02087828:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208782C: .word 0x000056CE
	thumb_func_end sub_020877B4

	thumb_func_start sub_02087830
sub_02087830: ; 0x02087830
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	mov r6, #0
	cmp r0, #0
	ble _02087872
	ldr r7, _02087874 ; =0x000056CE
	add r4, r5, #0
_02087840:
	ldr r2, [r5, #0x18]
	ldr r1, _02087874 ; =0x000056CE
	ldr r0, [r5, #8]
	add r1, r2, r1
	bl sub_0200D958
	ldr r2, [r5, #0x18]
	ldr r1, _02087874 ; =0x000056CE
	ldr r0, [r5, #8]
	add r1, r2, r1
	bl sub_0200D978
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #8]
	add r1, r1, r7
	bl sub_0200D988
	ldr r0, [r4, #0x24]
	bl sub_0200D9DC
	ldr r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02087840
_02087872:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02087874: .word 0x000056CE
	thumb_func_end sub_02087830

	thumb_func_start sub_02087878
sub_02087878: ; 0x02087878
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x14]
	mov r0, #0xbf
	bl NARC_ctor
	str r0, [r5]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020876B0
	add r0, r5, #0
	bl sub_020877B4
	mov r2, #1
	ldr r0, _020878AC ; =sub_020873D4
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl sub_0200E33C
	add r5, #0xf4
	str r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020878AC: .word sub_020873D4
	thumb_func_end sub_02087878

	thumb_func_start sub_020878B0
sub_020878B0: ; 0x020878B0
	add r0, #0xf0
	str r1, [r0]
	mov r0, #1
	bx lr
	thumb_func_end sub_020878B0

	thumb_func_start sub_020878B8
sub_020878B8: ; 0x020878B8
	push {r3, r4}
	strh r1, [r0, #0x28]
	add r1, r0, #0
	strh r2, [r0, #0x2a]
	mov r2, #0xff
	add r1, #0xe8
	str r2, [r1]
	add r1, r0, #0
	mov r3, #0
	add r1, #0xec
	str r3, [r1]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ble _020878E4
	add r4, r0, #0
	add r2, r3, #0
_020878D8:
	str r2, [r4, #0x2c]
	ldr r1, [r0, #0x10]
	add r3, r3, #1
	add r4, #0x10
	cmp r3, r1
	blt _020878D8
_020878E4:
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020878B8

	thumb_func_start sub_020878EC
sub_020878EC: ; 0x020878EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02087930
	cmp r0, #0
	bne _02087900
	mov r0, #0
	pop {r4, r5, r6, pc}
_02087900:
	strh r4, [r5, #0x28]
	add r0, r5, #0
	strh r6, [r5, #0x2a]
	mov r1, #0xff
	add r0, #0xe8
	str r1, [r0]
	add r0, r5, #0
	mov r2, #0
	add r0, #0xec
	str r2, [r0]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _0208792A
	add r3, r5, #0
	add r1, r2, #0
_0208791E:
	str r1, [r3, #0x2c]
	ldr r0, [r5, #0x10]
	add r2, r2, #1
	add r3, #0x10
	cmp r2, r0
	blt _0208791E
_0208792A:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020878EC

	thumb_func_start sub_02087930
sub_02087930: ; 0x02087930
	mov r3, #0x28
	ldrsh r3, [r0, r3]
	cmp r3, r1
	bne _02087944
	mov r1, #0x2a
	ldrsh r0, [r0, r1]
	cmp r0, r2
	bne _02087944
	mov r0, #0
	bx lr
_02087944:
	mov r0, #1
	bx lr
	thumb_func_end sub_02087930

	thumb_func_start sub_02087948
sub_02087948: ; 0x02087948
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	str r2, [sp]
	mov r1, #0xff
	add r0, #0xe8
	str r1, [r0]
	add r0, r5, #0
	mov r7, #0
	add r0, #0xec
	str r7, [r0]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _02087982
	add r4, r5, #0
_02087966:
	strh r6, [r4, #0x28]
	ldr r0, [sp]
	add r1, r6, #0
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x24]
	ldr r2, [sp]
	ldr r3, [r5, #0x20]
	bl sub_0200DDF4
	ldr r0, [r5, #0x10]
	add r7, r7, #1
	add r4, #0x10
	cmp r7, r0
	blt _02087966
_02087982:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02087948

	thumb_func_start sub_02087988
sub_02087988: ; 0x02087988
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	cmp r1, #0
	beq _0208799C
	cmp r1, #1
	beq _020879B0
	b _020879C6
_0208799C:
	mov r1, #0
	bl sub_020878B0
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r4, #0xe4
	add r0, r0, #1
	str r0, [r4]
	b _020879DA
_020879B0:
	add r0, #0xf4
	ldr r0, [r0]
	bl sub_0200E390
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r4, #0xe4
	add r0, r0, #1
	str r0, [r4]
	b _020879DA
_020879C6:
	bl sub_02087830
	ldr r0, [r4]
	bl NARC_dtor
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
_020879DA:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02087988

	thumb_func_start sub_020879E0
sub_020879E0: ; 0x020879E0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x10]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _02087A02
	add r5, r6, #0
_020879F0:
	ldr r0, [r5, #0x24]
	add r1, r7, #0
	bl sub_0200DCE8
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _020879F0
_02087A02:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020879E0

	thumb_func_start sub_02087A08
sub_02087A08: ; 0x02087A08
	cmp r1, #0
	beq _02087A1E
	cmp r2, #0
	beq _02087A1E
	add r3, r0, #0
	add r3, #0xfc
	str r1, [r3]
	mov r1, #1
	lsl r1, r1, #8
	str r2, [r0, r1]
	bx lr
_02087A1E:
	add r1, r0, #0
	mov r2, #0xf
	add r1, #0xfc
	str r2, [r1]
	add r1, r2, #0
	add r1, #0xf1
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02087A08

	thumb_func_start sub_02087A30
sub_02087A30: ; 0x02087A30
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _02087A52
	add r5, r6, #0
	mov r7, #1
_02087A40:
	ldr r0, [r5, #0x24]
	add r1, r7, #0
	bl sub_0200DC4C
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _02087A40
_02087A52:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02087A30

	thumb_func_start sub_02087A54
sub_02087A54: ; 0x02087A54
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _02087A76
	add r5, r6, #0
	add r7, r4, #0
_02087A64:
	ldr r0, [r5, #0x24]
	add r1, r7, #0
	bl sub_0200DC4C
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _02087A64
_02087A76:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02087A54

	thumb_func_start sub_02087A78
sub_02087A78: ; 0x02087A78
	push {r3, lr}
	bl OverlayManager_GetField18
	ldr r0, [r0, #0x14]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02087A78

	thumb_func_start sub_02087A84
sub_02087A84: ; 0x02087A84
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02087A84

	thumb_func_start sub_02087A8C
sub_02087A8C: ; 0x02087A8C
	push {r4, r5, r6, lr}
	mov r2, #1
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #3
	mov r1, #0x7e
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x2c
	mov r2, #0x7e
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x2c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_GetField18
	str r0, [r4, #0x28]
	ldr r0, [r0, #0xc]
	ldr r1, _02087B00 ; =0x00004170
	str r0, [r4, #0xc]
	mov r0, #0x7e
	bl AllocFromHeap
	ldr r2, _02087B00 ; =0x00004170
	str r0, [r4, #0x14]
	mov r1, #0
	bl MI_CpuFill8
	add r2, r4, #0
	ldr r1, [r4, #0x14]
	ldr r0, _02087B04 ; =0x00000868
	add r2, #0x18
	str r2, [r1, r0]
	ldr r2, [r4, #0xc]
	ldr r1, [r4, #0x14]
	sub r0, #0x38
	str r2, [r1, r0]
	ldr r0, [r4, #0x14]
	str r6, [r0]
	ldr r4, [r4, #0x14]
	ldr r1, [r4]
	add r0, r4, #0
	bl sub_02087FF8
	ldr r1, _02087B08 ; =0x000006D8
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	add r2, r4, r1
	ldr r1, _02087B0C ; =0x0000081C
	str r0, [r2, r1]
	pop {r4, r5, r6, pc}
	nop
_02087B00: .word 0x00004170
_02087B04: .word 0x00000868
_02087B08: .word 0x000006D8
_02087B0C: .word 0x0000081C
	thumb_func_end sub_02087A8C

	thumb_func_start sub_02087B10
sub_02087B10: ; 0x02087B10
	push {r3, lr}
	mov r1, #0
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B10

	thumb_func_start sub_02087B1C
sub_02087B1C: ; 0x02087B1C
	push {r3, lr}
	mov r1, #1
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B1C

	thumb_func_start sub_02087B28
sub_02087B28: ; 0x02087B28
	push {r3, lr}
	mov r1, #2
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B28

	thumb_func_start sub_02087B34
sub_02087B34: ; 0x02087B34
	push {r3, lr}
	mov r1, #3
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B34

	thumb_func_start sub_02087B40
sub_02087B40: ; 0x02087B40
	push {r3, lr}
	mov r1, #4
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B40

	thumb_func_start sub_02087B4C
sub_02087B4C: ; 0x02087B4C
	push {r3, lr}
	mov r1, #5
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B4C

	thumb_func_start sub_02087B58
sub_02087B58: ; 0x02087B58
	push {r3, lr}
	mov r1, #6
	bl sub_02087A8C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02087B58

	thumb_func_start sub_02087B64
sub_02087B64: ; 0x02087B64
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0
	beq _02087B7A
	cmp r1, #1
	beq _02087B98
	b _02087BA8
_02087B7A:
	mov r1, #0x7e
	bl sub_02087BE8
	cmp r0, #0
	beq _02087BA8
	ldr r0, [r4, #0x18]
	cmp r0, #1
	bne _02087B94
	mov r0, #1
	str r0, [r5]
	mov r0, #0
	str r0, [r4]
	b _02087BA8
_02087B94:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02087B98:
	mov r1, #0x7e
	bl sub_02087C38
	cmp r0, #0
	beq _02087BA8
	mov r0, #0
	str r0, [r5]
	str r0, [r4]
_02087BA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02087B64

	thumb_func_start sub_02087BAC
sub_02087BAC: ; 0x02087BAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_0202FC48
	cmp r0, #1
	bne _02087BC2
	bl sub_0202FC24
_02087BC2:
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #1
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	mov r0, #7
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	mov r0, #0x7e
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02087BAC

	thumb_func_start sub_02087BE8
sub_02087BE8: ; 0x02087BE8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	add r2, r1, #0
	cmp r0, #0
	bne _02087C18
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	cmp r0, #0
	bne _02087C06
	ldr r0, _02087C30 ; =_021028B4
	add r1, r4, #0
	bl OverlayManager_new
	b _02087C0E
_02087C06:
	ldr r0, _02087C34 ; =_021028C4
	add r1, r4, #0
	bl OverlayManager_new
_02087C0E:
	str r0, [r4, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02087C2C
_02087C18:
	ldr r0, [r4, #8]
	bl OverlayManager_run
	cmp r0, #0
	beq _02087C2C
	ldr r0, [r4, #8]
	bl OverlayManager_delete
	mov r0, #1
	pop {r4, pc}
_02087C2C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02087C30: .word _021028B4
_02087C34: .word _021028C4
	thumb_func_end sub_02087BE8

	thumb_func_start sub_02087C38
sub_02087C38: ; 0x02087C38
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	beq _02087C50
	cmp r0, #1
	beq _02087C6A
	cmp r0, #2
	beq _02087D0C
	b _02087D5A
_02087C50:
	ldr r0, [r5, #0x14]
	ldr r0, [r0]
	cmp r0, #0
	beq _02087C62
	ldr r0, _02087DF4 ; =SDK_OVERLAY_OVY_39_ID
	bl UnloadOverlayByID
	bl UnloadOVY38
_02087C62:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02087DEC
_02087C6A:
	add r0, r4, #0
	mov r1, #0
	bl sub_020518D8
	str r0, [r5, #0x10]
	bl sub_0202FC48
	cmp r0, #0
	bne _02087C92
	ldr r1, [r5, #0x14]
	ldr r0, _02087DF8 ; =0x0000086C
	add r2, sp, #4
	ldr r0, [r1, r0]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	ldr r3, [r5, #0x10]
	bl sub_0202FC90
	b _02087C9E
_02087C92:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	bl sub_020304F0
	mov r0, #1
	str r0, [sp, #4]
_02087C9E:
	add r0, r4, #0
	bl BagCursor_new
	mov r1, #0x43
	ldr r2, [r5, #0x10]
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x51
	ldr r2, [r5, #0x10]
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r6, _02087DFC ; =SDK_OVERLAY_OVY_40_ID
	mov r1, #2
	add r0, r6, #0
	bl HandleLoadOverlay
	cmp r0, #1
	bne _02087CDA
	bl sub_0202FC5C
	ldr r1, [r5, #0x10]
	add r2, r4, #0
	bl ov40_02244920
	add r0, r6, #0
	bl UnloadOverlayByID
_02087CDA:
	ldr r1, [r5, #0x14]
	ldr r0, _02087E00 ; =0x00000874
	mov r2, #1
	str r2, [r1, r0]
	ldr r0, [sp, #4]
	cmp r0, #1
	beq _02087D04
	mov r0, #0x43
	ldr r1, [r5, #0x10]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	bl sub_02051BF8
	mov r0, #0
	str r0, [r5]
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02087D04:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02087DEC
_02087D0C:
	mov r0, #1
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	mov r0, #7
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	mov r0, #1
	bl sub_02005B68
	ldr r0, [r5, #0x10]
	add r0, #0x5d
	ldrb r0, [r0]
	bl sub_02087E34
	cmp r0, #1
	bne _02087D3C
	ldr r1, _02087E04 ; =0x0000047B
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	b _02087D46
_02087D3C:
	ldr r1, _02087E08 ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
_02087D46:
	ldr r0, _02087E0C ; =_020FA484
	ldr r1, [r5, #0x10]
	add r2, r4, #0
	bl OverlayManager_new
	str r0, [r5, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02087DEC
_02087D5A:
	ldr r0, [r5, #8]
	bl OverlayManager_run
	cmp r0, #0
	beq _02087DEC
	mov r0, #0x71
	ldr r1, [r5, #0x10]
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	ldr r1, [r5, #0x14]
	ldr r0, _02087E00 ; =0x00000874
	str r2, [r1, r0]
	ldr r2, [r5, #0x14]
	ldr r1, [r2]
	cmp r1, #0
	beq _02087D88
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _02087D88
	add r0, r0, #4
	ldr r0, [r2, r0]
	mov r1, #1
	strb r1, [r0]
_02087D88:
	mov r0, #0x43
	ldr r1, [r5, #0x10]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	bl sub_02051BF8
	ldr r0, [r5, #8]
	bl OverlayManager_delete
	mov r0, #0
	bl sub_02005B68
	mov r0, #0
	bl sub_02004AD8
	ldr r0, [r5, #0x28]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl sub_02054F60
	add r4, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl GetMapMusic
	bl sub_02004AC8
	mov r0, #0
	add r1, r4, #0
	bl sub_02055198
	mov r0, #0
	str r0, [r5]
	ldr r0, [r5, #0x14]
	ldr r0, [r0]
	cmp r0, #0
	beq _02087DE6
	bl LoadOVY38
	ldr r0, _02087DF4 ; =SDK_OVERLAY_OVY_39_ID
	mov r1, #2
	bl HandleLoadOverlay
_02087DE6:
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02087DEC:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02087DF4: .word SDK_OVERLAY_OVY_39_ID
_02087DF8: .word 0x0000086C
_02087DFC: .word SDK_OVERLAY_OVY_40_ID
_02087E00: .word 0x00000874
_02087E04: .word 0x0000047B
_02087E08: .word 0x0000045D
_02087E0C: .word _020FA484
	thumb_func_end sub_02087C38

	thumb_func_start sub_02087E10
sub_02087E10: ; 0x02087E10
	lsl r1, r0, #2
	ldr r0, _02087E18 ; =_02110594
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02087E18: .word _02110594
	thumb_func_end sub_02087E10

	thumb_func_start sub_02087E1C
sub_02087E1C: ; 0x02087E1C
	push {r3, lr}
	mov r1, #0x83
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl SavArray_Flags_get
	mov r1, #2
	mov r2, #0x1b
	bl sub_02066930
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02087E1C

	thumb_func_start sub_02087E34
sub_02087E34: ; 0x02087E34
	push {r3, r4, r5}
	sub sp, #0x14
	ldr r5, _02087E6C ; =_021028A0
	add r3, r0, #0
	ldmia r5!, {r0, r1}
	add r4, sp, #0
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r4]
_02087E4E:
	ldr r0, [r2]
	cmp r3, r0
	bne _02087E5C
	add sp, #0x14
	mov r0, #1
	pop {r3, r4, r5}
	bx lr
_02087E5C:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #5
	blo _02087E4E
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, r5}
	bx lr
	.balign 4, 0
_02087E6C: .word _021028A0
	thumb_func_end sub_02087E34

	thumb_func_start sub_02087E70
sub_02087E70: ; 0x02087E70
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0
	add r5, r2, #0
	bl sub_0200616C
	mov r2, #0x55
	mov r0, #3
	mov r1, #0x6d
	lsl r2, r2, #0xc
	bl CreateHeap
	add r0, r4, #0
	bl sub_02087A78
	add r4, r0, #0
	bl ov40_0222C480
	mov r0, #1
	mov r1, #0x2a
	bl GF_SndHandleSetPlayerVolume
	mov r0, #7
	mov r1, #0x2a
	bl GF_SndHandleSetPlayerVolume
	cmp r5, #0
	beq _02087EB0
	ldr r1, _02087EF0 ; =0x00000482
	mov r0, #0
	bl sub_02055198
_02087EB0:
	cmp r5, #0
	bne _02087EE2
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Sav2_Misc_get
	add r1, r4, #0
	add r1, #0x5c
	bl sub_0202AC0C
	add r0, r4, #0
	add r0, #0x5c
	ldrb r0, [r0]
	cmp r0, #7
	blo _02087ED8
	add r0, r4, #0
	mov r1, #0
	add r0, #0x5c
	strb r1, [r0]
_02087ED8:
	add r0, r4, #0
	bl ov40_0222DAC0
	str r0, [r4, #0x58]
	b _02087EE6
_02087EE2:
	ldr r0, _02087EF4 ; =0x00007FDD
	str r0, [r4, #0x58]
_02087EE6:
	add r0, r4, #0
	bl ov40_0222B6E0
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02087EF0: .word 0x00000482
_02087EF4: .word 0x00007FDD
	thumb_func_end sub_02087E70

	thumb_func_start sub_02087EF8
sub_02087EF8: ; 0x02087EF8
	ldr r3, _02087F00 ; =sub_02087E70
	mov r2, #0
	bx r3
	nop
_02087F00: .word sub_02087E70
	thumb_func_end sub_02087EF8

	thumb_func_start sub_02087F04
sub_02087F04: ; 0x02087F04
	ldr r3, _02087F0C ; =sub_02087E70
	mov r2, #1
	bx r3
	nop
_02087F0C: .word sub_02087E70
	thumb_func_end sub_02087F04

	thumb_func_start sub_02087F10
sub_02087F10: ; 0x02087F10
	push {r4, lr}
	add r4, r1, #0
	bl sub_02087A78
	add r1, r4, #0
	str r4, [r0, #0x10]
	bl ov40_0222BD30
	cmp r0, #0
	beq _02087F28
	mov r0, #1
	pop {r4, pc}
_02087F28:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02087F10

	thumb_func_start sub_02087F2C
sub_02087F2C: ; 0x02087F2C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl sub_02087A78
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #3
	bhi _02087F9E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02087F48: ; jump table
	.short _02087F50 - _02087F48 - 2 ; case 0
	.short _02087F5C - _02087F48 - 2 ; case 1
	.short _02087F74 - _02087F48 - 2 ; case 2
	.short _02087F8A - _02087F48 - 2 ; case 3
_02087F50:
	bl ov40_0222CABC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02087FC2
_02087F5C:
	bl ov40_0222CA8C
	add r0, r5, #0
	bl ov40_0222CF94
	add r0, r5, #0
	bl ov40_0222D55C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02087FC2
_02087F74:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02087988
	cmp r0, #0
	bne _02087FC2
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02087FC2
_02087F8A:
	ldr r0, _02087FC8 ; =0x000006F4
	ldr r0, [r5, r0]
	bl sub_02087988
	cmp r0, #0
	bne _02087FC2
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02087FC2
_02087F9E:
	add r0, r5, #0
	bl ov40_0222B934
	mov r0, #0x6d
	bl DestroyHeap
	ldr r0, _02087FCC ; =SDK_OVERLAY_OVY_40_ID
	bl UnloadOverlayByID
	ldr r0, _02087FD0 ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	bl sub_0203E354
	mov r0, #1
	pop {r3, r4, r5, pc}
_02087FC2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02087FC8: .word 0x000006F4
_02087FCC: .word SDK_OVERLAY_OVY_40_ID
_02087FD0: .word gMain + 0x60
	thumb_func_end sub_02087F2C

	thumb_func_start sub_02087FD4
sub_02087FD4: ; 0x02087FD4
	push {r3, lr}
	cmp r0, #7
	blt _02087FE6
	blt _02087FE0
	bl GF_AssertFail
_02087FE0:
	ldr r0, _02087FF0 ; =_02103754
	ldr r0, [r0, #0x64]
	pop {r3, pc}
_02087FE6:
	mov r1, #0x24
	mul r1, r0
	ldr r0, _02087FF4 ; =_021037B8
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_02087FF0: .word _02103754
_02087FF4: .word _021037B8
	thumb_func_end sub_02087FD4

	thumb_func_start sub_02087FF8
sub_02087FF8: ; 0x02087FF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _0208800C
	bl sub_02087E1C
	cmp r0, #0
	bne _0208800C
	ldr r0, _02088028 ; =_0210357C
	pop {r3, r4, r5, pc}
_0208800C:
	cmp r4, #3
	bne _0208801E
	add r0, r5, #0
	bl sub_02087E1C
	cmp r0, #0
	bne _0208801E
	ldr r0, _0208802C ; =_02102DC0
	pop {r3, r4, r5, pc}
_0208801E:
	add r0, r4, #0
	bl sub_02087FD4
	pop {r3, r4, r5, pc}
	nop
_02088028: .word _0210357C
_0208802C: .word _02102DC0
	thumb_func_end sub_02087FF8

	thumb_func_start sub_02088030
sub_02088030: ; 0x02088030
	push {r3, r4}
	ldr r1, _02088058 ; =0x00000818
	mov r3, #0
	ldr r4, [r0, r1]
	mov r1, #0x6e
	lsl r1, r1, #4
	str r3, [r0, r1]
_0208803E:
	ldr r2, [r4]
	cmp r2, #0
	beq _0208804A
	ldr r2, [r0, r1]
	add r2, r2, #1
	str r2, [r0, r1]
_0208804A:
	add r3, r3, #1
	add r4, #0x24
	cmp r3, #5
	blt _0208803E
	pop {r3, r4}
	bx lr
	nop
_02088058: .word 0x00000818
	thumb_func_end sub_02088030

	thumb_func_start sub_0208805C
sub_0208805C: ; 0x0208805C
	lsl r1, r0, #1
	ldr r0, _02088064 ; =_02103894
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_02088064: .word _02103894
	thumb_func_end sub_0208805C

	thumb_func_start sub_02088068
sub_02088068: ; 0x02088068
	push {r4, lr}
	add r4, r0, #0
	mul r0, r2
	bl _u32_div_f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bne _0208807E
	cmp r4, #0
	beq _0208807E
	mov r0, #1
_0208807E:
	pop {r4, pc}
	thumb_func_end sub_02088068

	thumb_func_start sub_02088080
sub_02088080: ; 0x02088080
	push {r4, lr}
	add r4, r0, #0
	lsl r0, r1, #8
	lsl r4, r4, #8
	lsr r1, r0, #1
	cmp r4, r1
	bls _02088092
	mov r0, #3
	pop {r4, pc}
_02088092:
	mov r1, #5
	bl _u32_div_f
	cmp r4, r0
	bls _020880A0
	mov r0, #2
	pop {r4, pc}
_020880A0:
	cmp r4, #0
	beq _020880A8
	mov r0, #1
	b _020880AA
_020880A8:
	mov r0, #0
_020880AA:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
	thumb_func_end sub_02088080

	thumb_func_start sub_020880B0
sub_020880B0: ; 0x020880B0
	push {r4, lr}
	add r4, r2, #0
	cmp r0, r1
	bne _020880BC
	mov r0, #4
	pop {r4, pc}
_020880BC:
	lsl r2, r4, #0x18
	lsr r2, r2, #0x18
	bl sub_02088068
	add r1, r4, #0
	bl sub_02088080
	pop {r4, pc}
	thumb_func_end sub_020880B0

	thumb_func_start sub_020880CC
sub_020880CC: ; 0x020880CC
	push {lr}
	sub sp, #0xc
	cmp r0, #0
	bne _020880EC
	mov r0, #6
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #0
	str r1, [sp, #8]
	add r1, r2, #0
	add r3, r0, #0
	bl sub_0200FA24
	add sp, #0xc
	pop {pc}
_020880EC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r1, [sp, #8]
	mov r1, #8
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_020880CC

	thumb_func_start sub_02088108
sub_02088108: ; 0x02088108
	push {r4, r5}
	mov r5, #0
	ldrsh r3, [r0, r5]
	cmp r2, #1
	bgt _0208812A
	sub r4, r5, #1
	cmp r2, r4
	blt _02088120
	beq _02088130
	cmp r2, #1
	beq _02088174
	b _020881B8
_02088120:
	add r1, r5, #0
	sub r1, #0xa
	cmp r2, r1
	beq _02088150
	b _020881B8
_0208812A:
	cmp r2, #0xa
	beq _02088196
	b _020881B8
_02088130:
	sub r2, r3, #1
	strh r2, [r0]
	ldrsh r2, [r0, r5]
	cmp r2, #0
	bgt _0208813C
	strh r1, [r0]
_0208813C:
	mov r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r3
	bne _0208814A
	add r0, r1, #0
	pop {r4, r5}
	bx lr
_0208814A:
	mov r0, #2
	pop {r4, r5}
	bx lr
_02088150:
	add r1, r3, #0
	sub r1, #0xa
	strh r1, [r0]
	ldrsh r1, [r0, r5]
	cmp r1, #0
	bgt _02088160
	mov r1, #1
	strh r1, [r0]
_02088160:
	mov r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r3
	bne _0208816E
	add r0, r1, #0
	pop {r4, r5}
	bx lr
_0208816E:
	mov r0, #2
	pop {r4, r5}
	bx lr
_02088174:
	add r2, r3, #1
	strh r2, [r0]
	ldrsh r2, [r0, r5]
	cmp r2, r1
	ble _02088182
	mov r1, #1
	strh r1, [r0]
_02088182:
	mov r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r3
	bne _02088190
	add r0, r1, #0
	pop {r4, r5}
	bx lr
_02088190:
	mov r0, #1
	pop {r4, r5}
	bx lr
_02088196:
	add r2, r3, #0
	add r2, #0xa
	strh r2, [r0]
	ldrsh r2, [r0, r5]
	cmp r2, r1
	ble _020881A4
	strh r1, [r0]
_020881A4:
	mov r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r3
	bne _020881B2
	add r0, r1, #0
	pop {r4, r5}
	bx lr
_020881B2:
	mov r0, #1
	pop {r4, r5}
	bx lr
_020881B8:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02088108

	thumb_func_start sub_020881C0
sub_020881C0: ; 0x020881C0
	push {r4, lr}
	ldr r2, _02088208 ; =gMain
	ldr r3, [r2, #0x4c]
	mov r2, #0x40
	tst r2, r3
	beq _020881D4
	mov r2, #1
	bl sub_02088108
	pop {r4, pc}
_020881D4:
	mov r2, #0x80
	add r4, r3, #0
	tst r4, r2
	beq _020881E4
	sub r2, #0x81
	bl sub_02088108
	pop {r4, pc}
_020881E4:
	mov r2, #0x20
	add r4, r3, #0
	tst r4, r2
	beq _020881F4
	sub r2, #0x2a
	bl sub_02088108
	pop {r4, pc}
_020881F4:
	mov r2, #0x10
	tst r2, r3
	beq _02088202
	mov r2, #0xa
	bl sub_02088108
	pop {r4, pc}
_02088202:
	mov r0, #0
	pop {r4, pc}
	nop
_02088208: .word gMain
	thumb_func_end sub_020881C0

	thumb_func_start sub_0208820C
sub_0208820C: ; 0x0208820C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, [sp, #0x28]
	add r5, r0, #0
	ldr r4, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	cmp r6, #0
	beq _0208822A
	cmp r6, #1
	beq _02088244
	cmp r6, #2
	beq _0208825E
	add sp, #0x10
	pop {r4, r5, r6, pc}
_0208822A:
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r2, #0
	ldr r3, [sp, #0x24]
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02007B44
	add sp, #0x10
	pop {r4, r5, r6, pc}
_02088244:
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r2, #0
	ldr r3, [sp, #0x24]
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02007B68
	add sp, #0x10
	pop {r4, r5, r6, pc}
_0208825E:
	ldr r5, [sp, #0x24]
	str r0, [sp]
	cmp r5, #3
	bgt _02088276
	str r1, [sp, #4]
	add r0, r2, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_02007B8C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_02088276:
	str r1, [sp, #4]
	add r0, r2, #0
	add r1, r4, #0
	mov r2, #4
	bl sub_02007B8C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208820C

	thumb_func_start sub_02088288
sub_02088288: ; 0x02088288
	mov r0, #1
	bx lr
	thumb_func_end sub_02088288

	thumb_func_start sub_0208828C
sub_0208828C: ; 0x0208828C
	push {r3, lr}
	bl SavArray_Flags_get
	bl sub_020669F0
	pop {r3, pc}
	thumb_func_end sub_0208828C

	thumb_func_start sub_02088298
sub_02088298: ; 0x02088298
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl sub_0201A108
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _02088408 ; =0xFFFFE0FF
	and r0, r2
	str r0, [r1]
	ldr r0, _0208840C ; =0x04001000
	ldr r3, [r0]
	and r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _02088410 ; =0xFFFF1FFF
	and r3, r2
	str r3, [r1]
	ldr r3, [r0]
	add r1, #0x50
	and r2, r3
	str r2, [r0]
	mov r2, #0
	strh r2, [r1]
	add r0, #0x50
	strh r2, [r0]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r2, #0x45
	mov r0, #3
	mov r1, #0x13
	lsl r2, r2, #0xc
	bl CreateHeap
	mov r0, #0x27
	mov r1, #0x13
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #0xa2
	mov r1, #0x13
	bl NARC_ctor
	add r5, r0, #0
	ldr r1, _02088414 ; =0x000007D8
	add r0, r6, #0
	mov r2, #0x13
	bl OverlayManager_CreateAndGetData
	ldr r2, _02088414 ; =0x000007D8
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r6, #0
	bl OverlayManager_GetField18
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x13
	bl BgConfig_Alloc
	str r0, [r4]
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	str r1, [r0, #0x38]
	mov r1, #1
	mov r0, #0x13
	add r2, r1, #0
	bl sub_02016EDC
	mov r1, #0xb3
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xb4
	mov r1, #0x13
	bl NARC_ctor
	ldr r1, _02088418 ; =0x000007B8
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x13
	bl sub_02002D40
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	bl sub_02088610
	ldr r0, [r4]
	bl sub_02088630
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl sub_020887C4
	bl sub_0208887C
	add r0, r4, #0
	bl sub_0208DE40
	mov r0, #4
	mov r1, #0x13
	bl sub_02002CEC
	add r0, r4, #0
	bl sub_02088894
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020889D0
	add r0, r4, #0
	bl sub_020897C0
	add r0, r4, #0
	bl sub_0208B1AC
	add r0, r4, #0
	bl sub_0208B2C0
	add r0, r4, #0
	bl sub_0208E3AC
	add r0, r4, #0
	bl sub_0208B48C
	add r0, r4, #0
	bl sub_0208B4EC
	add r0, r4, #0
	bl sub_0208BECC
	add r0, r4, #0
	bl sub_0208C3E4
	add r0, r4, #0
	bl sub_02089CB4
	add r0, r4, #0
	bl sub_0208DF2C
	ldr r0, _0208841C ; =sub_020885DC
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r2, _02088420 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	bl GX_BothDispOn
	mov r1, #0
	mov r0, #0x3d
	add r2, r1, #0
	bl sub_02004EC4
	bl sub_0203A964
	add r0, r5, #0
	bl NARC_dtor
	add r0, r7, #0
	bl NARC_dtor
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02088408: .word 0xFFFFE0FF
_0208840C: .word 0x04001000
_02088410: .word 0xFFFF1FFF
_02088414: .word 0x000007D8
_02088418: .word 0x000007B8
_0208841C: .word sub_020885DC
_02088420: .word 0x04000304
	thumb_func_end sub_02088298

	thumb_func_start sub_02088424
sub_02088424: ; 0x02088424
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0x16
	bls _02088436
	b _0208854A
_02088436:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02088442: ; jump table
	.short _02088470 - _02088442 - 2 ; case 0
	.short _0208848C - _02088442 - 2 ; case 1
	.short _02088494 - _02088442 - 2 ; case 2
	.short _0208849C - _02088442 - 2 ; case 3
	.short _020884A4 - _02088442 - 2 ; case 4
	.short _020884AC - _02088442 - 2 ; case 5
	.short _020884BC - _02088442 - 2 ; case 6
	.short _020884B4 - _02088442 - 2 ; case 7
	.short _020884C4 - _02088442 - 2 ; case 8
	.short _020884CC - _02088442 - 2 ; case 9
	.short _020884D4 - _02088442 - 2 ; case 10
	.short _020884DC - _02088442 - 2 ; case 11
	.short _020884E4 - _02088442 - 2 ; case 12
	.short _020884EC - _02088442 - 2 ; case 13
	.short _020884F4 - _02088442 - 2 ; case 14
	.short _020884FC - _02088442 - 2 ; case 15
	.short _02088504 - _02088442 - 2 ; case 16
	.short _0208850C - _02088442 - 2 ; case 17
	.short _02088514 - _02088442 - 2 ; case 18
	.short _02088530 - _02088442 - 2 ; case 19
	.short _02088544 - _02088442 - 2 ; case 20
	.short _0208851C - _02088442 - 2 ; case 21
	.short _02088524 - _02088442 - 2 ; case 22
_02088470:
	mov r0, #0
	mov r1, #0x13
	bl sub_020880CC
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	mov r0, #1
	str r0, [r4]
	b _0208854A
_0208848C:
	bl sub_02088B08
	str r0, [r4]
	b _0208854A
_02088494:
	bl sub_02088B40
	str r0, [r4]
	b _0208854A
_0208849C:
	bl sub_02088D18
	str r0, [r4]
	b _0208854A
_020884A4:
	bl sub_02088D34
	str r0, [r4]
	b _0208854A
_020884AC:
	bl sub_02088D48
	str r0, [r4]
	b _0208854A
_020884B4:
	bl sub_02088E68
	str r0, [r4]
	b _0208854A
_020884BC:
	bl sub_02088E98
	str r0, [r4]
	b _0208854A
_020884C4:
	bl sub_02089028
	str r0, [r4]
	b _0208854A
_020884CC:
	bl sub_02089208
	str r0, [r4]
	b _0208854A
_020884D4:
	bl sub_020892F4
	str r0, [r4]
	b _0208854A
_020884DC:
	bl sub_02089308
	str r0, [r4]
	b _0208854A
_020884E4:
	bl sub_0208931C
	str r0, [r4]
	b _0208854A
_020884EC:
	bl sub_0208942C
	str r0, [r4]
	b _0208854A
_020884F4:
	bl sub_02089454
	str r0, [r4]
	b _0208854A
_020884FC:
	bl sub_02089698
	str r0, [r4]
	b _0208854A
_02088504:
	bl sub_02089478
	str r0, [r4]
	b _0208854A
_0208850C:
	bl sub_02089608
	str r0, [r4]
	b _0208854A
_02088514:
	bl sub_02089658
	str r0, [r4]
	b _0208854A
_0208851C:
	bl sub_02089670
	str r0, [r4]
	b _0208854A
_02088524:
	bl sub_02089680
	cmp r0, #1
	bne _0208854A
	mov r0, #1
	pop {r3, r4, r5, pc}
_02088530:
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	mov r0, #2
	str r0, [r4]
	b _0208854A
_02088544:
	bl sub_02089794
	str r0, [r4]
_0208854A:
	add r0, r5, #0
	bl sub_0208B278
	add r0, r5, #0
	bl sub_0208C3C0
	mov r0, #1
	lsl r0, r0, #0xa
	ldr r0, [r5, r0]
	bl sub_0200D020
	add r0, r5, #0
	bl sub_0208DEDC
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02088424

	thumb_func_start sub_0208856C
sub_0208856C: ; 0x0208856C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl sub_0208DEFC
	add r0, r4, #0
	bl sub_0208B258
	add r0, r4, #0
	bl sub_0208C560
	ldr r0, [r4]
	bl sub_0208877C
	bl sub_02021238
	bl sub_020205AC
	add r0, r4, #0
	bl sub_02088AF8
	add r0, r4, #0
	bl sub_0208895C
	mov r0, #4
	bl sub_02002DB4
	ldr r0, _020885D4 ; =0x000007B8
	ldr r0, [r4, r0]
	bl NARC_dtor
	mov r0, #0
	bl sub_02002D7C
	ldr r0, _020885D8 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x13
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020885D4: .word 0x000007B8
_020885D8: .word 0x04000050
	thumb_func_end sub_0208856C

	thumb_func_start sub_020885DC
sub_020885DC: ; 0x020885DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0201EEB4
	mov r0, #0x2a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02009418
	bl sub_0202061C
	bl sub_0200D034
	ldr r3, _02088608 ; =OS_IRQTable
	ldr r1, _0208860C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02088608: .word OS_IRQTable
_0208860C: .word 0x00003FF8
	thumb_func_end sub_020885DC

	thumb_func_start sub_02088610
sub_02088610: ; 0x02088610
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0208862C ; =_02103990
	add r3, sp, #0
	mov r2, #5
_0208861A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0208861A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0208862C: .word _02103990
	thumb_func_end sub_02088610

	thumb_func_start sub_02088630
sub_02088630: ; 0x02088630
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	ldr r5, _02088760 ; =_021038C4
	add r3, sp, #0xa8
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _02088764 ; =_021038E8
	add r3, sp, #0x8c
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
	ldr r5, _02088768 ; =_02103904
	add r3, sp, #0x70
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
	mov r2, #0
	add r0, r4, #0
	mov r1, #2
	add r3, r2, #0
	bl sub_0201F238
	add r0, r4, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl sub_0201F238
	ldr r5, _0208876C ; =_02103920
	add r3, sp, #0x54
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
	ldr r5, _02088770 ; =_0210393C
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	mov r1, #4
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02088774 ; =_02103958
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02088778 ; =_02103974
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x13
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x13
	bl BG_ClearCharDataRange
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_02088760: .word _021038C4
_02088764: .word _021038E8
_02088768: .word _02103904
_0208876C: .word _02103920
_02088770: .word _0210393C
_02088774: .word _02103958
_02088778: .word _02103974
	thumb_func_end sub_02088630

	thumb_func_start sub_0208877C
sub_0208877C: ; 0x0208877C
	push {r4, lr}
	add r4, r0, #0
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	mov r0, #0x13
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208877C

	thumb_func_start sub_020887C4
sub_020887C4: ; 0x020887C4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x13
	mov r1, #0
	add r4, r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02007B8C
	mov r1, #0
	mov r0, #0x11
	str r1, [sp]
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #2
	mov r3, #3
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0xd
	mov r3, #3
	bl sub_02007B68
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x13
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #4
	add r3, r1, #0
	bl sub_02007B8C
	mov r1, #0
	mov r0, #0x11
	str r1, [sp]
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #1
	mov r3, #6
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x14
	mov r3, #5
	bl sub_02007B44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x15
	mov r3, #5
	bl sub_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020887C4

	thumb_func_start sub_0208887C
sub_0208887C: ; 0x0208887C
	push {r3, lr}
	mov r0, #8
	str r0, [sp]
	ldr r0, _02088890 ; =0x04000050
	mov r1, #1
	mov r2, #0x1e
	mov r3, #0x17
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_02088890: .word 0x04000050
	thumb_func_end sub_0208887C

	thumb_func_start sub_02088894
sub_02088894: ; 0x02088894
	push {r4, lr}
	ldr r2, _02088940 ; =0x0000012E
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x13
	bl NewMsgDataFromNarc
	mov r1, #0x7a
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r2, #0x6a
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #2
	mov r3, #0x13
	bl NewMsgDataFromNarc
	ldr r1, _02088944 ; =0x000007A4
	mov r2, #0
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #2
	mov r3, #0x13
	bl MessagePrinter_new
	ldr r1, _02088948 ; =0x0000079C
	str r0, [r4, r1]
	mov r0, #0x13
	bl ScrStrBufs_new
	ldr r1, _0208894C ; =0x000007A8
	str r0, [r4, r1]
	mov r0, #0xc
	mov r1, #0x13
	bl String_ctor
	mov r1, #0x23
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0xc
	mov r1, #0x13
	bl String_ctor
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #8
	mov r1, #0x13
	bl String_ctor
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x80
	mov r1, #0x13
	bl String_ctor
	ldr r1, _02088950 ; =0x000007AC
	ldr r2, _02088954 ; =0x000002EE
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x13
	bl NewMsgDataFromNarc
	ldr r1, _02088958 ; =0x000007B4
	str r0, [r4, r1]
	mov r0, #8
	mov r1, #0x13
	bl String_ctor
	mov r2, #0x7b
	lsl r2, r2, #4
	str r0, [r4, r2]
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0208893C
	ldr r0, [r4, r2]
	bl CopyU16ArrayToString
_0208893C:
	pop {r4, pc}
	nop
_02088940: .word 0x0000012E
_02088944: .word 0x000007A4
_02088948: .word 0x0000079C
_0208894C: .word 0x000007A8
_02088950: .word 0x000007AC
_02088954: .word 0x000002EE
_02088958: .word 0x000007B4
	thumb_func_end sub_02088894

	thumb_func_start sub_0208895C
sub_0208895C: ; 0x0208895C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020889BC ; =0x000007B4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _020889C0 ; =0x000007A4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _020889C4 ; =0x0000079C
	ldr r0, [r4, r0]
	bl MessagePrinter_delete
	ldr r0, _020889C8 ; =0x000007A8
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _020889CC ; =0x000007AC
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x7b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	.balign 4, 0
_020889BC: .word 0x000007B4
_020889C0: .word 0x000007A4
_020889C4: .word 0x0000079C
_020889C8: .word 0x000007A8
_020889CC: .word 0x000007AC
	thumb_func_end sub_0208895C

	thumb_func_start sub_020889D0
sub_020889D0: ; 0x020889D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	mov r1, #2
	mov r2, #7
	mov r3, #0x13
	bl sub_0201956C
	mov r1, #0x7d
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r2, #6
	str r2, [sp]
	ldr r0, [r5, r1]
	mov r1, #0
	mov r3, #0x11
	bl sub_020195F4
	mov r1, #0
	mov r0, #0x7d
	str r1, [sp]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r2, r4, #0
	mov r3, #0x45
	bl sub_020196B8
	mov r2, #6
	mov r0, #0x7d
	str r2, [sp]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	mov r3, #0x11
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	add r2, r4, #0
	mov r3, #0x46
	bl sub_020196B8
	mov r0, #4
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #2
	mov r2, #6
	mov r3, #0xa
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #2
	add r2, r4, #0
	mov r3, #0x47
	bl sub_020196B8
	mov r0, #4
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	mov r2, #6
	mov r3, #0xa
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	add r2, r4, #0
	mov r3, #0x48
	bl sub_020196B8
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #4
	mov r2, #6
	mov r3, #0xb
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #4
	add r2, r4, #0
	mov r3, #0x49
	bl sub_020196B8
	mov r0, #3
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	mov r2, #6
	ldr r0, [r5, r0]
	mov r1, #5
	add r3, r2, #0
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #5
	add r2, r4, #0
	mov r3, #0x4a
	bl sub_020196B8
	mov r1, #6
	mov r0, #3
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020195F4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #6
	add r2, r4, #0
	mov r3, #0x4b
	bl sub_020196B8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020889D0

	thumb_func_start sub_02088AF8
sub_02088AF8: ; 0x02088AF8
	mov r1, #0x7d
	lsl r1, r1, #4
	ldr r3, _02088B04 ; =sub_020195C0
	ldr r0, [r0, r1]
	bx r3
	nop
_02088B04: .word sub_020195C0
	thumb_func_end sub_02088AF8

	thumb_func_start sub_02088B08
sub_02088B08: ; 0x02088B08
	push {r4, lr}
	add r4, r0, #0
	bl sub_0200FB5C
	cmp r0, #1
	bne _02088B3C
	add r0, r4, #0
	bl sub_0208E444
	add r0, r4, #0
	bl sub_02089C50
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bne _02088B30
	mov r0, #8
	pop {r4, pc}
_02088B30:
	cmp r0, #4
	bne _02088B38
	mov r0, #0x10
	pop {r4, pc}
_02088B38:
	mov r0, #2
	pop {r4, pc}
_02088B3C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02088B08

	thumb_func_start sub_02088B40
sub_02088B40: ; 0x02088B40
	push {r4, r5, r6, lr}
	ldr r2, _02088CF8 ; =0x000007BF
	add r5, r0, #0
	ldrb r1, [r5, r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	cmp r1, #1
	bne _02088B5E
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	strb r1, [r0, #0x17]
	mov r0, #0x15
	pop {r4, r5, r6, pc}
_02088B5E:
	ldr r3, _02088CFC ; =gMain
	mov r1, #0x20
	ldr r4, [r3, #0x4c]
	add r6, r4, #0
	tst r6, r1
	beq _02088B74
	sub r1, #0x21
	bl sub_02089E30
	mov r0, #2
	pop {r4, r5, r6, pc}
_02088B74:
	mov r1, #0x10
	tst r1, r4
	beq _02088B84
	mov r1, #1
	bl sub_02089E30
	mov r0, #2
	pop {r4, r5, r6, pc}
_02088B84:
	mov r1, #0x40
	add r6, r4, #0
	tst r6, r1
	beq _02088B96
	sub r1, #0x41
	bl sub_0208A2C0
	mov r0, #0x13
	pop {r4, r5, r6, pc}
_02088B96:
	mov r1, #0x80
	tst r1, r4
	beq _02088BA6
	mov r1, #1
	bl sub_0208A2C0
	mov r0, #0x13
	pop {r4, r5, r6, pc}
_02088BA6:
	ldr r1, [r3, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02088BD2
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	strb r1, [r0, #0x17]
	add r0, r5, #0
	mov r1, #0
	bl sub_0208ADB8
	add r0, r5, #0
	mov r1, #0x15
	bl sub_0208B044
	pop {r4, r5, r6, pc}
_02088BD2:
	mov r0, #1
	tst r0, r1
	beq _02088C12
	sub r0, r2, #3
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _02088BE6
	cmp r0, #2
	beq _02088BFA
	b _02088C12
_02088BE6:
	ldr r0, _02088D00 ; =0x0000069B
	bl PlaySE
	ldr r1, _02088D04 ; =0x000007BD
	mov r0, #0xf
	ldrb r2, [r5, r1]
	bic r2, r0
	strb r2, [r5, r1]
	mov r0, #3
	pop {r4, r5, r6, pc}
_02088BFA:
	add r0, r2, #7
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _02088C12
	ldr r0, _02088D08 ; =0x000005DD
	bl PlaySE
	ldr r0, _02088D0C ; =0x000007C4
	mov r1, #0
	strb r1, [r5, r0]
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_02088C12:
	ldr r0, _02088D10 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _02088C56
	add r0, r5, #0
	bl sub_0208ADCC
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02088C56
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0x99
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02088C56
	ldr r0, _02088D00 ; =0x0000069B
	bl PlaySE
	ldr r2, _02088D04 ; =0x000007BD
	mov r1, #0xf
	ldrb r0, [r5, r2]
	bic r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	mov r0, #3
	pop {r4, r5, r6, pc}
_02088C56:
	ldr r0, _02088D10 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #2
	bne _02088C88
	add r0, r5, #0
	bl sub_0208AEC4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02088C88
	cmp r4, #9
	bge _02088C88
	ldr r0, _02088D14 ; =0x000007C6
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _02088C88
	ldr r0, _02088D08 ; =0x000005DD
	bl PlaySE
	ldr r0, _02088D0C ; =0x000007C4
	strb r4, [r5, r0]
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_02088C88:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _02088CF0
	add r0, r5, #0
	bl sub_0208AEB4
	cmp r0, #0
	bne _02088CC6
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl sub_0208A2E0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02088CC2
	ldr r0, _02088D08 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x14
	bl sub_0208B0B0
	pop {r4, r5, r6, pc}
_02088CC2:
	mov r0, #2
	pop {r4, r5, r6, pc}
_02088CC6:
	cmp r0, #1
	bne _02088CF0
	add r0, r5, #0
	mov r1, #1
	bl sub_0208A2E0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02088CEC
	ldr r0, _02088D08 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x14
	bl sub_0208B0B0
	pop {r4, r5, r6, pc}
_02088CEC:
	mov r0, #2
	pop {r4, r5, r6, pc}
_02088CF0:
	add r0, r5, #0
	bl sub_02089E98
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02088CF8: .word 0x000007BF
_02088CFC: .word gMain
_02088D00: .word 0x0000069B
_02088D04: .word 0x000007BD
_02088D08: .word 0x000005DD
_02088D0C: .word 0x000007C4
_02088D10: .word 0x000007BC
_02088D14: .word 0x000007C6
	thumb_func_end sub_02088B40

	thumb_func_start sub_02088D18
sub_02088D18: ; 0x02088D18
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208A564
	cmp r0, #1
	bne _02088D30
	add r0, r4, #0
	mov r1, #1
	bl sub_0208AFA0
	mov r0, #5
	pop {r4, pc}
_02088D30:
	mov r0, #3
	pop {r4, pc}
	thumb_func_end sub_02088D18

	thumb_func_start sub_02088D34
sub_02088D34: ; 0x02088D34
	push {r3, lr}
	bl sub_0208A63C
	cmp r0, #1
	bne _02088D42
	mov r0, #2
	pop {r3, pc}
_02088D42:
	mov r0, #4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02088D34

	thumb_func_start sub_02088D48
sub_02088D48: ; 0x02088D48
	push {r4, lr}
	ldr r1, _02088E58 ; =gMain
	add r4, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #0x40
	add r3, r2, #0
	tst r3, r1
	beq _02088D72
	sub r1, #0x41
	bl sub_0208A71C
	cmp r0, #1
	bne _02088D6E
	ldr r0, _02088E5C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0208A79C
_02088D6E:
	mov r0, #5
	pop {r4, pc}
_02088D72:
	mov r1, #0x80
	tst r1, r2
	beq _02088D92
	mov r1, #1
	bl sub_0208A71C
	cmp r0, #1
	bne _02088D8E
	ldr r0, _02088E5C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0208A79C
_02088D8E:
	mov r0, #5
	pop {r4, pc}
_02088D92:
	mov r0, #1
	tst r0, r2
	beq _02088DB4
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #1
	beq _02088DB4
	ldr r0, _02088E60 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #7
	bl sub_0208B08C
	pop {r4, pc}
_02088DB4:
	mov r0, #2
	tst r0, r2
	beq _02088DD4
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AFA0
	add r0, r4, #0
	mov r1, #4
	bl sub_0208B044
	pop {r4, pc}
_02088DD4:
	add r0, r4, #0
	bl sub_0208AE08
	cmp r0, #4
	bne _02088DFA
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #1
	beq _02088E52
	ldr r0, _02088E60 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #7
	bl sub_0208B08C
	pop {r4, pc}
_02088DFA:
	cmp r0, #5
	bne _02088E18
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AFA0
	add r0, r4, #0
	mov r1, #4
	bl sub_0208B044
	pop {r4, pc}
_02088E18:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02088E52
	lsl r1, r0, #1
	add r2, r4, r1
	mov r1, #0x99
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _02088E52
	ldr r3, _02088E64 ; =0x000007BD
	mov r2, #0xf
	ldrb r1, [r4, r3]
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #0xf
	and r0, r2
	orr r0, r1
	strb r0, [r4, r3]
	ldr r0, _02088E5C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0208A79C
	mov r0, #5
	pop {r4, pc}
_02088E52:
	mov r0, #5
	pop {r4, pc}
	nop
_02088E58: .word gMain
_02088E5C: .word 0x000005DC
_02088E60: .word 0x000005DD
_02088E64: .word 0x000007BD
	thumb_func_end sub_02088D48

	thumb_func_start sub_02088E68
sub_02088E68: ; 0x02088E68
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl sub_0208AFA0
	add r0, r4, #0
	bl sub_0208BC78
	ldr r2, _02088E94 ; =0x000007BD
	mov r1, #0xf0
	ldrb r3, [r4, r2]
	add r0, r3, #0
	bic r0, r1
	lsl r1, r3, #0x1c
	lsr r1, r1, #0x1c
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, r2]
	mov r0, #6
	pop {r4, pc}
	nop
_02088E94: .word 0x000007BD
	thumb_func_end sub_02088E68

	thumb_func_start sub_02088E98
sub_02088E98: ; 0x02088E98
	push {r3, r4, r5, lr}
	ldr r1, _02089014 ; =gMain
	add r5, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #0x40
	add r3, r2, #0
	tst r3, r1
	beq _02088EC2
	sub r1, #0x41
	bl sub_0208A71C
	cmp r0, #1
	bne _02088EBE
	ldr r0, _02089018 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A79C
_02088EBE:
	mov r0, #6
	pop {r3, r4, r5, pc}
_02088EC2:
	mov r1, #0x80
	tst r1, r2
	beq _02088EE2
	mov r1, #1
	bl sub_0208A71C
	cmp r0, #1
	bne _02088EDE
	ldr r0, _02089018 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A79C
_02088EDE:
	mov r0, #6
	pop {r3, r4, r5, pc}
_02088EE2:
	mov r1, #1
	add r3, r2, #0
	tst r3, r1
	beq _02088F3E
	bl sub_0208AFA0
	ldr r0, _0208901C ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _02089020 ; =0x000007BD
	ldrb r0, [r5, r0]
	lsl r1, r0, #0x1c
	lsl r0, r0, #0x18
	lsr r1, r1, #0x1c
	lsr r0, r0, #0x1c
	cmp r1, r0
	beq _02088F34
	ldr r0, _02089024 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A834
	ldr r1, _02089020 ; =0x000007BD
	add r0, r5, #0
	ldrb r2, [r5, r1]
	lsl r1, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x1c
	bl sub_0208BB24
	add r0, r5, #0
	bl sub_0208DB64
	add r0, r5, #0
	bl sub_0208A79C
	b _02088F3A
_02088F34:
	ldr r0, _02089018 ; =0x000005DC
	bl PlaySE
_02088F3A:
	mov r0, #5
	pop {r3, r4, r5, pc}
_02088F3E:
	mov r1, #2
	tst r1, r2
	beq _02088F68
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl sub_0208AFA0
	ldr r0, _0208901C ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	add r0, r5, #0
	mov r1, #5
	bl sub_0208B044
	pop {r3, r4, r5, pc}
_02088F68:
	bl sub_0208ADDC
	add r4, r0, #0
	cmp r4, #4
	bne _02088F96
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl sub_0208AFA0
	ldr r0, _0208901C ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	add r0, r5, #0
	mov r1, #5
	bl sub_0208B044
	pop {r3, r4, r5, pc}
_02088F96:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02089010
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0x99
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02089010
	add r0, r5, #0
	mov r1, #1
	bl sub_0208AFA0
	ldr r0, _0208901C ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r2, _02089020 ; =0x000007BD
	ldrb r0, [r5, r2]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1c
	cmp r4, r1
	beq _02089006
	mov r1, #0xf
	bic r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	ldr r0, _02089024 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A834
	ldr r1, _02089020 ; =0x000007BD
	add r0, r5, #0
	ldrb r2, [r5, r1]
	lsl r1, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x1c
	bl sub_0208BB24
	add r0, r5, #0
	bl sub_0208DB64
	add r0, r5, #0
	bl sub_0208A79C
	b _0208900C
_02089006:
	ldr r0, _02089018 ; =0x000005DC
	bl PlaySE
_0208900C:
	mov r0, #5
	pop {r3, r4, r5, pc}
_02089010:
	mov r0, #6
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02089014: .word gMain
_02089018: .word 0x000005DC
_0208901C: .word 0x0000042C
_02089020: .word 0x000007BD
_02089024: .word 0x000005DD
	thumb_func_end sub_02088E98

	thumb_func_start sub_02089028
sub_02089028: ; 0x02089028
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _020891F4 ; =gMain
	add r5, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #0x40
	add r3, r2, #0
	tst r3, r1
	beq _02089052
	sub r1, #0x41
	bl sub_0208A71C
	cmp r0, #1
	bne _0208904E
	ldr r0, _020891F8 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A79C
_0208904E:
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_02089052:
	mov r1, #0x80
	tst r1, r2
	beq _02089072
	mov r1, #1
	bl sub_0208A71C
	cmp r0, #1
	bne _0208906E
	ldr r0, _020891F8 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl sub_0208A79C
_0208906E:
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_02089072:
	mov r1, #1
	tst r1, r2
	beq _020890D8
	ldr r0, _020891FC ; =0x000005DD
	bl PlaySE
	ldr r0, _02089200 ; =0x000007BD
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #4
	bne _0208909E
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r2, #4
	strb r2, [r1, #0x16]
	ldr r0, [r5, r0]
	mov r1, #0
	strb r1, [r0, #0x17]
	mov r0, #0x15
	pop {r3, r4, r5, r6, r7, pc}
_0208909E:
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0x99
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	bl MoveIsHM
	cmp r0, #1
	bne _020890D0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _020890D0
	ldr r0, _02089204 ; =0x0000044C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	add r0, r5, #0
	bl sub_0208DBF0
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_020890D0:
	add r0, r5, #0
	bl sub_0208AED4
	pop {r3, r4, r5, r6, r7, pc}
_020890D8:
	mov r1, #2
	tst r1, r2
	beq _02089100
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r2, #4
	strb r2, [r1, #0x16]
	ldr r0, [r5, r0]
	mov r1, #1
	strb r1, [r0, #0x17]
	add r0, r5, #0
	mov r1, #0x15
	bl sub_0208B044
	pop {r3, r4, r5, r6, r7, pc}
_02089100:
	bl sub_0208AE48
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _020891F0
	cmp r4, #4
	beq _02089118
	cmp r4, #5
	beq _02089140
	b _02089170
_02089118:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _020891F0
	ldr r0, _020891FC ; =0x000005DD
	bl PlaySE
	ldr r1, _02089200 ; =0x000007BD
	mov r0, #0xf
	ldrb r2, [r5, r1]
	bic r2, r0
	mov r0, #4
	orr r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	bl sub_0208A79C
	b _020891F0
_02089140:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r1, _02089200 ; =0x000007BD
	mov r0, #0xf
	ldrb r2, [r5, r1]
	bic r2, r0
	mov r0, #5
	orr r0, r2
	strb r0, [r5, r1]
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r2, #4
	strb r2, [r1, #0x16]
	ldr r0, [r5, r0]
	mov r1, #0
	strb r1, [r0, #0x17]
	add r0, r5, #0
	mov r1, #0x15
	bl sub_0208B044
	pop {r3, r4, r5, r6, r7, pc}
_02089170:
	mov r0, #0x99
	lsl r0, r0, #2
	add r6, r5, r0
	lsl r7, r4, #1
	ldrh r0, [r6, r7]
	bl MoveIsHM
	cmp r0, #1
	bne _020891C2
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _020891C2
	ldr r0, _020891FC ; =0x000005DD
	bl PlaySE
	ldr r2, _02089200 ; =0x000007BD
	mov r1, #0xf
	ldrb r0, [r5, r2]
	bic r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	ldr r0, _02089204 ; =0x0000044C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	add r0, r5, #0
	bl sub_0208BBDC
	add r0, r5, #0
	bl sub_0208DBF0
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_020891C2:
	ldrh r0, [r6, r7]
	cmp r0, #0
	beq _020891F0
	ldr r0, _020891FC ; =0x000005DD
	bl PlaySE
	ldr r2, _02089200 ; =0x000007BD
	mov r1, #0xf
	ldrb r0, [r5, r2]
	bic r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	add r0, r5, #0
	bl sub_0208A79C
	add r0, r5, #0
	bl sub_0208AED4
	pop {r3, r4, r5, r6, r7, pc}
_020891F0:
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020891F4: .word gMain
_020891F8: .word 0x000005DC
_020891FC: .word 0x000005DD
_02089200: .word 0x000007BD
_02089204: .word 0x0000044C
	thumb_func_end sub_02089028

	thumb_func_start sub_02089208
sub_02089208: ; 0x02089208
	push {r4, lr}
	ldr r1, _020892E0 ; =gMain
	add r4, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #1
	tst r1, r2
	beq _0208923C
	ldr r0, _020892E4 ; =0x000005DD
	bl PlaySE
	ldr r0, _020892E8 ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x1c
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	strb r2, [r1, #0x16]
	ldr r0, [r4, r0]
	mov r1, #0
	strb r1, [r0, #0x17]
	add r0, r4, #0
	mov r1, #0x15
	bl sub_0208B068
	pop {r4, pc}
_0208923C:
	mov r1, #2
	tst r1, r2
	beq _02089270
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _020892EC ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020248F0
	ldr r0, _020892F0 ; =0x0000042C
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AF08
	add r0, r4, #0
	mov r1, #8
	bl sub_0208B044
	pop {r4, pc}
_02089270:
	bl sub_0208AE88
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _020892DA
	cmp r0, #0
	beq _02089286
	cmp r0, #1
	beq _020892AC
	b _020892DA
_02089286:
	ldr r0, _020892E4 ; =0x000005DD
	bl PlaySE
	ldr r0, _020892E8 ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x1c
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	strb r2, [r1, #0x16]
	ldr r0, [r4, r0]
	mov r1, #0
	strb r1, [r0, #0x17]
	add r0, r4, #0
	mov r1, #0x15
	bl sub_0208B068
	pop {r4, pc}
_020892AC:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _020892EC ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020248F0
	ldr r0, _020892F0 ; =0x0000042C
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AF08
	add r0, r4, #0
	mov r1, #8
	bl sub_0208B044
	pop {r4, pc}
_020892DA:
	mov r0, #9
	pop {r4, pc}
	nop
_020892E0: .word gMain
_020892E4: .word 0x000005DD
_020892E8: .word 0x000007BD
_020892EC: .word 0x00000428
_020892F0: .word 0x0000042C
	thumb_func_end sub_02089208

	thumb_func_start sub_020892F4
sub_020892F4: ; 0x020892F4
	push {r3, lr}
	bl sub_0208A9C4
	cmp r0, #1
	bne _02089302
	mov r0, #0xc
	pop {r3, pc}
_02089302:
	mov r0, #0xa
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020892F4

	thumb_func_start sub_02089308
sub_02089308: ; 0x02089308
	push {r3, lr}
	bl sub_0208AA9C
	cmp r0, #1
	bne _02089316
	mov r0, #2
	pop {r3, pc}
_02089316:
	mov r0, #0xb
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02089308

	thumb_func_start sub_0208931C
sub_0208931C: ; 0x0208931C
	push {r3, r4, r5, lr}
	ldr r3, _02089418 ; =gMain
	mov r1, #0x20
	ldr r2, [r3, #0x4c]
	add r4, r0, #0
	add r5, r2, #0
	tst r5, r1
	beq _02089336
	sub r1, #0x21
	bl sub_0208AB58
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089336:
	mov r1, #0x10
	tst r1, r2
	beq _02089346
	mov r1, #1
	bl sub_0208AB58
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089346:
	mov r1, #0x40
	add r5, r2, #0
	tst r5, r1
	beq _02089358
	sub r1, #0x43
	bl sub_0208AB58
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089358:
	mov r1, #0x80
	tst r1, r2
	beq _02089368
	mov r1, #3
	bl sub_0208AB58
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089368:
	ldr r2, [r3, #0x48]
	mov r1, #3
	tst r1, r2
	beq _02089382
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xb
	bl sub_0208B0F4
	pop {r3, r4, r5, pc}
_02089382:
	bl sub_0208AEC4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bgt _02089392
	beq _02089414
	b _020893F8
_02089392:
	cmp r0, #0xb
	bgt _020893F8
	cmp r0, #9
	blt _020893F8
	beq _020893A6
	cmp r0, #0xa
	beq _020893C6
	cmp r0, #0xb
	beq _020893E6
	b _020893F8
_020893A6:
	ldr r0, _0208941C ; =0x00000504
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #1
	bne _02089414
	ldr r0, _02089420 ; =0x000005DC
	bl PlaySE
	ldr r0, _0208941C ; =0x00000504
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_020248F0
	mov r0, #0xd
	pop {r3, r4, r5, pc}
_020893C6:
	ldr r0, _02089424 ; =0x00000508
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #1
	bne _02089414
	ldr r0, _02089420 ; =0x000005DC
	bl PlaySE
	ldr r0, _02089424 ; =0x00000508
	mov r1, #3
	ldr r0, [r4, r0]
	bl sub_020248F0
	mov r0, #0xe
	pop {r3, r4, r5, pc}
_020893E6:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xb
	bl sub_0208B0F4
	pop {r3, r4, r5, pc}
_020893F8:
	ldr r1, _02089428 ; =0x000007C4
	ldrb r2, [r4, r1]
	cmp r2, r0
	beq _02089410
	strb r0, [r4, r1]
	ldr r0, _02089420 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AB58
_02089410:
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02089414:
	mov r0, #0xc
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02089418: .word gMain
_0208941C: .word 0x00000504
_02089420: .word 0x000005DC
_02089424: .word 0x00000508
_02089428: .word 0x000007C4
	thumb_func_end sub_0208931C

	thumb_func_start sub_0208942C
sub_0208942C: ; 0x0208942C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02089450 ; =0x00000504
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _0208944A
	mov r1, #8
	add r0, r4, #0
	mvn r1, r1
	bl sub_0208AB58
	mov r0, #0xc
	pop {r4, pc}
_0208944A:
	mov r0, #0xd
	pop {r4, pc}
	nop
_02089450: .word 0x00000504
	thumb_func_end sub_0208942C

	thumb_func_start sub_02089454
sub_02089454: ; 0x02089454
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02089474 ; =0x00000508
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _02089470
	add r0, r4, #0
	mov r1, #9
	bl sub_0208AB58
	mov r0, #0xc
	pop {r4, pc}
_02089470:
	mov r0, #0xe
	pop {r4, pc}
	.balign 4, 0
_02089474: .word 0x00000508
	thumb_func_end sub_02089454

	thumb_func_start sub_02089478
sub_02089478: ; 0x02089478
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _020895E8 ; =gMain
	add r5, r0, #0
	ldr r2, [r1, #0x48]
	mov r1, #3
	tst r1, r2
	bne _0208948A
	b _020895E0
_0208948A:
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldrb r1, [r1, #0x11]
	cmp r1, #2
	bne _020894AE
	bl sub_0208A520
	add r6, r0, #0
	mov r0, #0x13
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	b _020894B4
_020894AE:
	bl sub_0208A520
	add r4, r0, #0
_020894B4:
	ldr r0, _020895EC ; =0x000007BE
	mov r2, #0
	strb r2, [r5, r0]
	ldr r0, _020895F0 ; =0x00000275
	mov r1, #0x13
	ldrb r6, [r5, r0]
	add r0, r4, #0
	bl GetMonData
	ldr r1, _020895F0 ; =0x00000275
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _020894DA
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #1
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_020894DA:
	ldr r0, _020895F4 ; =0x00000276
	mov r1, #0x14
	ldrb r6, [r5, r0]
	add r0, r4, #0
	mov r2, #0
	bl GetMonData
	ldr r1, _020895F4 ; =0x00000276
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _020894FC
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #2
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_020894FC:
	ldr r0, _020895F8 ; =0x00000277
	mov r1, #0x15
	ldrb r6, [r5, r0]
	add r0, r4, #0
	mov r2, #0
	bl GetMonData
	ldr r1, _020895F8 ; =0x00000277
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _0208951E
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #4
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_0208951E:
	mov r0, #0x9e
	lsl r0, r0, #2
	ldrb r6, [r5, r0]
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0
	bl GetMonData
	mov r1, #0x9e
	lsl r1, r1, #2
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _02089544
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #8
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_02089544:
	ldr r0, _020895FC ; =0x00000279
	mov r1, #0x17
	ldrb r6, [r5, r0]
	add r0, r4, #0
	mov r2, #0
	bl GetMonData
	ldr r1, _020895FC ; =0x00000279
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r6, r0
	beq _02089566
	ldr r1, _020895EC ; =0x000007BE
	mov r0, #0x10
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
_02089566:
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0
	bl GetMonData
	ldr r1, _02089600 ; =0x0000027A
	strb r0, [r5, r1]
	sub r1, #0x4e
	ldr r0, [r5, r1]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _02089584
	add r0, r4, #0
	bl FreeToHeap
_02089584:
	mov r1, #7
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x13
	bl sub_0200304C
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r0, [r0, #4]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r2, _02089604 ; =0x000003E2
	mov r1, #1
	mov r3, #0xd
	bl sub_0200E644
	ldr r0, _020895EC ; =0x000007BE
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _020895C8
	add r0, r5, #0
	mov r1, #0xfe
	bl sub_0208DDA0
	add sp, #8
	mov r0, #0x12
	pop {r4, r5, r6, pc}
_020895C8:
	add r0, r5, #0
	bl sub_0208E174
	add r0, r5, #0
	bl sub_0208BCD4
	add r0, r5, #0
	bl sub_0208BDC8
	add sp, #8
	mov r0, #0x11
	pop {r4, r5, r6, pc}
_020895E0:
	mov r0, #0x10
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_020895E8: .word gMain
_020895EC: .word 0x000007BE
_020895F0: .word 0x00000275
_020895F4: .word 0x00000276
_020895F8: .word 0x00000277
_020895FC: .word 0x00000279
_02089600: .word 0x0000027A
_02089604: .word 0x000003E2
	thumb_func_end sub_02089478

	thumb_func_start sub_02089608
sub_02089608: ; 0x02089608
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02089650 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0208964A
	ldr r0, _02089654 ; =0x000007BE
	mov r1, #0
	ldrb r2, [r5, r0]
	mov r0, #1
_0208961E:
	add r4, r0, #0
	lsl r4, r1
	add r3, r2, #0
	tst r3, r4
	beq _02089640
	add r0, r5, #0
	bl sub_0208DDA0
	ldr r0, _02089654 ; =0x000007BE
	ldrb r1, [r5, r0]
	eor r1, r4
	strb r1, [r5, r0]
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0208964A
	mov r0, #0x12
	pop {r3, r4, r5, pc}
_02089640:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #5
	blo _0208961E
_0208964A:
	mov r0, #0x11
	pop {r3, r4, r5, pc}
	nop
_02089650: .word gMain
_02089654: .word 0x000007BE
	thumb_func_end sub_02089608

	thumb_func_start sub_02089658
sub_02089658: ; 0x02089658
	ldr r0, _0208966C ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _02089666
	mov r0, #0x15
	bx lr
_02089666:
	mov r0, #0x12
	bx lr
	nop
_0208966C: .word gMain
	thumb_func_end sub_02089658

	thumb_func_start sub_02089670
sub_02089670: ; 0x02089670
	push {r3, lr}
	mov r0, #1
	mov r1, #0x13
	bl sub_020880CC
	mov r0, #0x16
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02089670

	thumb_func_start sub_02089680
sub_02089680: ; 0x02089680
	push {r3, lr}
	bl sub_0200FB5C
	cmp r0, #1
	bne _0208968E
	mov r0, #1
	b _02089690
_0208968E:
	mov r0, #0
_02089690:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02089680

	thumb_func_start sub_02089698
sub_02089698: ; 0x02089698
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r3, _02089788 ; =0x000007BE
	add r4, r0, #0
	ldrb r0, [r4, r3]
	cmp r0, #0
	beq _020896B0
	cmp r0, #1
	beq _020896F6
	cmp r0, #2
	beq _0208975E
	b _02089782
_020896B0:
	add r0, r3, #0
	add r0, #0xc
	ldrb r0, [r4, r0]
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp]
	add r0, r3, #0
	add r0, #0xd
	ldrb r0, [r4, r0]
	add r1, #0xf
	add r2, #0xa
	str r0, [sp, #4]
	add r0, r3, #0
	add r0, #0xe
	ldrb r0, [r4, r0]
	add r3, #0xb
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4]
	bl sub_0201CA4C
	ldr r1, _0208978C ; =0x000007CD
	ldr r0, [r4]
	ldrb r1, [r4, r1]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _02089788 ; =0x000007BE
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02089782
_020896F6:
	add r0, r3, #0
	add r0, #0x10
	ldrb r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #0
	add r0, #0x10
	strb r1, [r4, r0]
	add r0, r3, #0
	add r0, #0x10
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _02089782
	add r0, r3, #0
	add r0, #0xc
	ldrb r0, [r4, r0]
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp]
	add r0, r3, #0
	add r0, #0xd
	ldrb r0, [r4, r0]
	add r1, #0xf
	add r2, #0xa
	str r0, [sp, #4]
	add r0, r3, #0
	add r0, #0xe
	ldrb r0, [r4, r0]
	add r3, #0xb
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4]
	bl sub_0201CA4C
	ldr r1, _0208978C ; =0x000007CD
	ldr r0, [r4]
	ldrb r1, [r4, r1]
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, _02089790 ; =0x000007CE
	mov r0, #0
	strb r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x10
	ldrb r0, [r4, r0]
	sub r1, #0x10
	add r0, r0, #1
	strb r0, [r4, r1]
	b _02089782
_0208975E:
	add r0, r3, #0
	add r0, #0x10
	ldrb r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #0
	add r0, #0x10
	strb r1, [r4, r0]
	add r0, r3, #0
	add r0, #0x10
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _02089782
	mov r0, #0
	strb r0, [r4, r3]
	add r3, #0x11
	add sp, #0xc
	ldrb r0, [r4, r3]
	pop {r3, r4, pc}
_02089782:
	mov r0, #0xf
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02089788: .word 0x000007BE
_0208978C: .word 0x000007CD
_02089790: .word 0x000007CE
	thumb_func_end sub_02089698

	thumb_func_start sub_02089794
sub_02089794: ; 0x02089794
	push {r4, lr}
	ldr r1, _020897BC ; =0x000007C9
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #5
	bne _020897AA
	mov r1, #0
	mvn r1, r1
	bl sub_0208A2C0
	b _020897B0
_020897AA:
	mov r1, #1
	bl sub_0208A2C0
_020897B0:
	add r0, r4, #0
	bl sub_0208B118
	mov r0, #0x13
	pop {r4, pc}
	nop
_020897BC: .word 0x000007C9
	thumb_func_end sub_02089794

	thumb_func_start sub_020897C0
sub_020897C0: ; 0x020897C0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208A520
	mov r2, #0x8b
	lsl r2, r2, #2
	add r1, r0, #0
	ldr r0, [r4, r2]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _020897E2
	add r2, r2, #4
	add r0, r4, #0
	add r2, r4, r2
	bl sub_020897F0
	pop {r4, pc}
_020897E2:
	add r2, r2, #4
	add r0, r4, #0
	add r2, r4, r2
	bl sub_0208981C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020897C0

	thumb_func_start sub_020897F0
sub_020897F0: ; 0x020897F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x13
	add r6, r1, #0
	add r7, r2, #0
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0208981C
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020897F0

	thumb_func_start sub_0208981C
sub_0208981C: ; 0x0208981C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	bl AcquireMonLock
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xc]
	add r0, r5, #0
	bl Mon_GetBoxMon
	mov r2, #0x7a
	lsl r2, r2, #4
	add r6, r0, #0
	ldr r0, [r7, r2]
	add r2, #0xc
	ldr r2, [r7, r2]
	mov r1, #0xb
	bl ReadMsgDataIntoString
	ldr r0, _02089BC0 ; =0x000007A8
	mov r1, #0
	ldr r0, [r7, r0]
	add r2, r6, #0
	bl BufferBoxMonSpeciesName
	ldr r2, _02089BC0 ; =0x000007A8
	mov r1, #0x23
	ldr r0, [r7, r2]
	lsl r1, r1, #4
	add r2, r2, #4
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	bl StringExpandPlaceholders
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r7, r2]
	add r2, #0xc
	ldr r2, [r7, r2]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, _02089BC0 ; =0x000007A8
	mov r1, #0
	ldr r0, [r7, r0]
	add r2, r6, #0
	bl BufferBoxMonNickname
	ldr r2, _02089BC0 ; =0x000007A8
	mov r1, #0x8d
	ldr r0, [r7, r2]
	lsl r1, r1, #2
	add r2, r2, #4
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	bl StringExpandPlaceholders
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r7, r2]
	add r2, #0xc
	ldr r2, [r7, r2]
	mov r1, #0xe
	bl ReadMsgDataIntoString
	ldr r0, _02089BC0 ; =0x000007A8
	mov r1, #0
	ldr r0, [r7, r0]
	add r2, r6, #0
	bl BufferBoxMonOTName
	ldr r2, _02089BC0 ; =0x000007A8
	mov r1, #0x8e
	ldr r0, [r7, r2]
	lsl r1, r1, #2
	add r2, r2, #4
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	bl StringExpandPlaceholders
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xe]
	add r0, r5, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldrb r1, [r4, #0x12]
	mov r2, #0x7f
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #0x7f
	and r0, r2
	orr r0, r1
	strb r0, [r4, #0x12]
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x1f
	ldr r2, [r4, #0x50]
	ldr r1, _02089BC4 ; =0xEFFFFFFF
	lsr r0, r0, #3
	and r1, r2
	orr r0, r1
	str r0, [r4, #0x50]
	add r0, r5, #0
	mov r1, #0xb0
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208992C
	ldr r0, [r4, #0x50]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _0208992C
	ldrb r1, [r4, #0x12]
	mov r0, #0x80
	bic r1, r0
	strb r1, [r4, #0x12]
	b _02089934
_0208992C:
	ldrb r1, [r4, #0x12]
	mov r0, #0x80
	orr r0, r1
	strb r0, [r4, #0x12]
_02089934:
	add r0, r5, #0
	bl GetMonGender
	ldrb r1, [r4, #0x13]
	mov r2, #3
	bic r1, r2
	mov r2, #3
	and r0, r2
	orr r0, r1
	strb r0, [r4, #0x13]
	add r0, r5, #0
	mov r1, #0x9b
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1a
	ldrb r1, [r4, #0x13]
	mov r2, #0xfc
	lsr r0, r0, #0x18
	bic r1, r2
	orr r0, r1
	strb r0, [r4, #0x13]
	add r0, r5, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	strb r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	strb r0, [r4, #0x11]
	add r0, r5, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [r4, #0x14]
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl GetMonData
	str r0, [r4, #0x18]
	add r0, r5, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x44
	strb r0, [r1]
	ldrb r1, [r4, #0x12]
	ldrh r0, [r4, #0xc]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	bl GetMonExpBySpeciesAndLevel
	str r0, [r4, #0x1c]
	ldrb r0, [r4, #0x12]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	cmp r1, #0x64
	bne _020899C0
	ldr r0, [r4, #0x1c]
	b _020899C8
_020899C0:
	ldrh r0, [r4, #0xc]
	add r1, r1, #1
	bl GetMonExpBySpeciesAndLevel
_020899C8:
	str r0, [r4, #0x20]
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x24]
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x26]
	add r0, r5, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x28]
	add r0, r5, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x2a]
	add r0, r5, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x2c]
	add r0, r5, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x2e]
	add r0, r5, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x30]
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x32
	strb r0, [r1]
	add r0, r5, #0
	bl GetMonNature
	add r1, r4, #0
	add r1, #0x33
	strb r0, [r1]
	mov r6, #0
_02089A3C:
	lsl r0, r6, #1
	add r0, r4, r0
	add r1, r6, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	ldr r1, [sp]
	mov r2, #0
	strh r0, [r1, #0x34]
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x3a
	bl GetMonData
	add r1, r4, r6
	add r1, #0x3c
	strb r0, [r1]
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x3e
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp]
	ldrh r0, [r0, #0x34]
	bl WazaGetMaxPp
	add r1, r4, r6
	add r1, #0x40
	strb r0, [r1]
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _02089A3C
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x45
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x46
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x15
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x47
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x16
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x48
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x17
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x49
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x4a
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #5
	add r0, #0x4b
	strb r1, [r0]
	mov r6, #0
_02089AF6:
	add r0, r5, #0
	add r1, r6, #0
	bl MonGetFlavorPreference
	cmp r0, #1
	bne _02089B0A
	add r0, r4, #0
	add r0, #0x4b
	strb r6, [r0]
	b _02089B14
_02089B0A:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #5
	blo _02089AF6
_02089B14:
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x4c
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x4e
	strh r0, [r1]
	add r0, r5, #0
	bl sub_0208AD64
	mov r1, #0xf
	ldr r2, [r4, #0x50]
	lsl r1, r1, #0x1c
	and r2, r1
	ldr r1, _02089BC8 ; =0x0FFFFFFF
	and r0, r1
	orr r0, r2
	str r0, [r4, #0x50]
	add r0, r5, #0
	bl Pokemon_IsImmuneToPokerus
	cmp r0, #1
	bne _02089B64
	ldr r1, [r4, #0x50]
	ldr r0, _02089BCC ; =0x3FFFFFFF
	and r1, r0
	mov r0, #2
	lsl r0, r0, #0x1e
	orr r0, r1
	str r0, [r4, #0x50]
	b _02089B9A
_02089B64:
	add r0, r5, #0
	bl Pokemon_HasPokerus
	cmp r0, #1
	bne _02089B92
	ldr r2, [r4, #0x50]
	ldr r1, _02089BCC ; =0x3FFFFFFF
	add r0, r4, #0
	and r2, r1
	add r1, r1, #1
	orr r1, r2
	str r1, [r4, #0x50]
	lsl r1, r1, #4
	lsr r1, r1, #4
	add r0, #0x50
	cmp r1, #7
	bne _02089B9A
	mov r1, #0xf
	ldr r2, [r0]
	lsl r1, r1, #0x1c
	and r1, r2
	str r1, [r0]
	b _02089B9A
_02089B92:
	ldr r1, [r4, #0x50]
	ldr r0, _02089BCC ; =0x3FFFFFFF
	and r0, r1
	str r0, [r4, #0x50]
_02089B9A:
	add r0, r5, #0
	bl MonIsShiny
	cmp r0, #1
	ldr r1, [r4, #0x50]
	bne _02089BAE
	mov r0, #2
	lsl r0, r0, #0x1c
	orr r0, r1
	b _02089BB2
_02089BAE:
	ldr r0, _02089BD0 ; =0xDFFFFFFF
	and r0, r1
_02089BB2:
	str r0, [r4, #0x50]
	mov r6, #0
	str r6, [r4, #0x54]
	str r6, [r4, #0x58]
	str r6, [r4, #0x5c]
	ldr r0, _02089BD4 ; =0x000007C6
	b _02089BD8
	.balign 4, 0
_02089BC0: .word 0x000007A8
_02089BC4: .word 0xEFFFFFFF
_02089BC8: .word 0x0FFFFFFF
_02089BCC: .word 0x3FFFFFFF
_02089BD0: .word 0xDFFFFFFF
_02089BD4: .word 0x000007C6
_02089BD8:
	str r6, [r4, #0x60]
	strb r6, [r7, r0]
_02089BDC:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl sub_0208E55C
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02089C14
	lsr r0, r6, #5
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0x1f
	add r2, r6, #0
	and r2, r1
	mov r1, #1
	ldr r3, [r0, #0x54]
	lsl r1, r2
	orr r1, r3
	str r1, [r0, #0x54]
	ldr r0, _02089C4C ; =0x000007C6
	ldrb r0, [r7, r0]
	add r1, r0, #1
	ldr r0, _02089C4C ; =0x000007C6
	strb r1, [r7, r0]
_02089C14:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #0x50
	blo _02089BDC
	mov r6, #0xa5
	mov r4, #0
	lsl r6, r6, #2
_02089C24:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xb5
	mov r2, #0
	bl GetMonData
	add r1, r7, r4
	strb r0, [r1, r6]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _02089C24
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ReleaseMonLock
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02089C4C: .word 0x000007C6
	thumb_func_end sub_0208981C

	thumb_func_start sub_02089C50
sub_02089C50: ; 0x02089C50
	push {r4, lr}
	sub sp, #8
	mov r2, #0xa
	add r4, r0, #0
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _02089CAA
	ldr r0, _02089CB0 ; =0x000007B8
	sub r2, #0x44
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	add r1, sp, #4
	mov r3, #1
	bl sub_020729A4
	mov r2, #0x8f
	lsl r2, r2, #2
	add r1, r2, #0
	ldrh r0, [r4, r2]
	sub r1, #0x83
	cmp r0, r1
	bne _02089C9A
	add r0, sp, #4
	ldrb r0, [r0]
	mov r1, #0
	sub r2, #0x10
	str r0, [sp]
	ldr r0, [r4, r2]
	mov r2, #0x64
	ldr r0, [r0, #0x28]
	add r3, r1, #0
	bl sub_02006EA0
	add sp, #8
	pop {r4, pc}
_02089C9A:
	add r2, #0x42
	ldrh r2, [r4, r2]
	add r1, sp, #4
	ldrb r1, [r1]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_020062E0
_02089CAA:
	add sp, #8
	pop {r4, pc}
	nop
_02089CB0: .word 0x000007B8
	thumb_func_end sub_02089C50

	thumb_func_start sub_02089CB4
sub_02089CB4: ; 0x02089CB4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _02089CCE
	cmp r0, #1
	beq _02089CCE
	cmp r0, #2
	beq _02089CD6
	b _02089CDC
_02089CCE:
	ldr r0, _02089D3C ; =0x000007BC
	mov r1, #0
	strb r1, [r4, r0]
	b _02089CDC
_02089CD6:
	ldr r0, _02089D3C ; =0x000007BC
	mov r1, #1
	strb r1, [r4, r0]
_02089CDC:
	add r0, r4, #0
	bl sub_0208B448
	add r0, r4, #0
	bl sub_0208B5A8
	add r0, r4, #0
	bl sub_0208C2A0
	add r0, r4, #0
	bl sub_0208BD38
	add r0, r4, #0
	bl sub_0208BCD4
	add r0, r4, #0
	bl sub_0208C42C
	add r0, r4, #0
	bl sub_0208CBD4
	add r0, r4, #0
	bl sub_02089F98
	add r0, r4, #0
	bl sub_0208B9C8
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bne _02089D26
	add r0, r4, #0
	bl sub_0208A8F4
	pop {r4, pc}
_02089D26:
	add r0, r4, #0
	bl sub_0208B400
	add r0, r4, #0
	bl sub_0208BF9C
	add r0, r4, #0
	bl sub_0208BFD0
	pop {r4, pc}
	nop
_02089D3C: .word 0x000007BC
	thumb_func_end sub_02089CB4

	thumb_func_start sub_02089D40
sub_02089D40: ; 0x02089D40
	push {r3, r4, r5, r6}
	mov r6, #0
	strb r6, [r0, #0x15]
	add r0, #0x15
	mov r3, #1
_02089D4A:
	ldrb r5, [r1, r6]
	cmp r5, #4
	beq _02089D64
	add r2, r3, #0
	ldrb r4, [r0]
	lsl r2, r5
	orr r2, r4
	strb r2, [r0]
	add r2, r6, #1
	lsl r2, r2, #0x18
	lsr r6, r2, #0x18
	cmp r6, #4
	blo _02089D4A
_02089D64:
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_02089D40

	thumb_func_start sub_02089D68
sub_02089D68: ; 0x02089D68
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r1, _02089E10 ; =0x000007BC
	add r5, r0, #0
	ldrsb r1, [r5, r1]
	cmp r1, r4
	beq _02089E0C
	bl sub_0208C4E0
	ldr r0, _02089E10 ; =0x000007BC
	strb r4, [r5, r0]
	add r0, r5, #0
	bl sub_0208B448
	add r0, r5, #0
	bl sub_0208B5A8
	add r0, r5, #0
	bl sub_0208B89C
	add r0, r5, #0
	bl sub_0208B9C8
	add r0, r5, #0
	bl sub_0208C2A0
	add r0, r5, #0
	bl sub_0208BCD4
	add r0, r5, #0
	bl sub_0208C42C
	mov r0, #3
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x14
	mov r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r5]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	mov r0, #3
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x14
	mov r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #4
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r5]
	mov r1, #4
	bl BgCommitTilemapBufferToVram
	add r0, r5, #0
	bl sub_0208CBD4
	add r0, r5, #0
	bl sub_02089F98
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bne _02089E0C
	add r0, r5, #0
	bl sub_0208A950
_02089E0C:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02089E10: .word 0x000007BC
	thumb_func_end sub_02089D68

	thumb_func_start sub_02089E14
sub_02089E14: ; 0x02089E14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02089E2C ; =0x000005E1
	add r4, r1, #0
	bl PlaySE
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02089D68
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02089E2C: .word 0x000005E1
	thumb_func_end sub_02089E14

	thumb_func_start sub_02089E30
sub_02089E30: ; 0x02089E30
	push {r3, r4, r5, r6, r7, lr}
	add r3, r0, #0
	ldr r0, _02089E7C ; =0x000007BC
	add r2, r1, #0
	ldrsb r1, [r3, r0]
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r4, [r3, r0]
	mov ip, r1
	lsl r4, r4, #3
	lsr r4, r4, #0x1f
	bne _02089E7A
	sub r0, #0x54
	ldr r0, [r3, r0]
	mov r7, #0
	ldrb r0, [r0, #0x15]
	mov r6, #2
	mov r4, #1
_02089E54:
	add r1, r1, r2
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bpl _02089E60
	add r1, r6, #0
	b _02089E66
_02089E60:
	cmp r1, #2
	ble _02089E66
	add r1, r7, #0
_02089E66:
	add r5, r4, #0
	lsl r5, r1
	tst r5, r0
	beq _02089E54
	mov r0, ip
	cmp r1, r0
	beq _02089E7A
	add r0, r3, #0
	bl sub_02089E14
_02089E7A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02089E7C: .word 0x000007BC
	thumb_func_end sub_02089E30

	thumb_func_start sub_02089E80
sub_02089E80: ; 0x02089E80
	mov r2, #0x8b
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	ldrb r3, [r0, #0x15]
	mov r0, #1
	add r2, r0, #0
	lsl r2, r1
	add r1, r3, #0
	tst r1, r2
	bne _02089E96
	mov r0, #0
_02089E96:
	bx lr
	thumb_func_end sub_02089E80

	thumb_func_start sub_02089E98
sub_02089E98: ; 0x02089E98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0208E544
	add r5, r0, #0
	cmp r5, #0xff
	bne _02089EAA
	mov r0, #2
	pop {r3, r4, r5, pc}
_02089EAA:
	cmp r5, #9
	bhi _02089F4C
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02089EBA: ; jump table
	.short _02089ECE - _02089EBA - 2 ; case 0
	.short _02089EE6 - _02089EBA - 2 ; case 1
	.short _02089EE6 - _02089EBA - 2 ; case 2
	.short _02089F0A - _02089EBA - 2 ; case 3
	.short _02089F24 - _02089EBA - 2 ; case 4
	.short _02089F24 - _02089EBA - 2 ; case 5
	.short _02089F24 - _02089EBA - 2 ; case 6
	.short _02089F24 - _02089EBA - 2 ; case 7
	.short _02089F24 - _02089EBA - 2 ; case 8
	.short _02089F24 - _02089EBA - 2 ; case 9
_02089ECE:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02089E80
	cmp r0, #0
	beq _02089F4C
	lsl r1, r5, #0x18
	add r0, r4, #0
	asr r1, r1, #0x18
	bl sub_02089E14
	b _02089F4C
_02089EE6:
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _02089F4C
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02089E80
	cmp r0, #0
	beq _02089F4C
	lsl r1, r5, #0x18
	add r0, r4, #0
	asr r1, r1, #0x18
	bl sub_02089E14
	b _02089F4C
_02089F0A:
	add r0, r4, #0
	mov r1, #1
	bl sub_0208ADB8
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x15
	bl sub_0208B044
	pop {r3, r4, r5, pc}
_02089F24:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	sub r5, r5, #4
	ldrb r0, [r0, #0x14]
	cmp r0, r5
	beq _02089F4C
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0208A310
	cmp r0, #0
	beq _02089F4C
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_0208A234
	mov r0, #0x13
	pop {r3, r4, r5, pc}
_02089F4C:
	mov r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02089E98

	thumb_func_start sub_02089F50
sub_02089F50: ; 0x02089F50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	add r1, r2, #0
	mov r0, #0xa2
	mov r2, #0x13
	add r4, r3, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	add r7, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	mov r3, #0
	lsl r1, r4, #0x18
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r0, [r5]
	lsr r1, r1, #0x18
	add r2, #0xc
	bl sub_0201C4C4
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02089F50

	thumb_func_start sub_02089F98
sub_02089F98: ; 0x02089F98
	push {r3, r4, r5, lr}
	mov r1, #0x8b
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _02089FBC
	ldr r1, _0208A0DC ; =0x000007BC
	ldrsb r1, [r4, r1]
	cmp r1, #2
	bne _02089FBC
	ldr r1, [r4]
	mov r2, #0xb
	mov r3, #3
	bl sub_02089F50
	b _02089FD4
_02089FBC:
	ldr r2, _0208A0DC ; =0x000007BC
	ldr r1, [r4]
	ldrsb r3, [r4, r2]
	mov r2, #0xc
	add r0, r4, #0
	add r5, r3, #0
	mul r5, r2
	ldr r2, _0208A0E0 ; =_021039B8
	mov r3, #3
	ldr r2, [r2, r5]
	bl sub_02089F50
_02089FD4:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldrb r1, [r1, #0x12]
	cmp r1, #2
	bne _0208A024
	ldr r2, _0208A0DC ; =0x000007BC
	ldr r1, [r4]
	ldrsb r3, [r4, r2]
	mov r2, #0xc
	add r0, r4, #0
	add r5, r3, #0
	mul r5, r2
	ldr r2, _0208A0E4 ; =_021039B8 + 8
	mov r3, #6
	ldr r2, [r2, r5]
	bl sub_02089F50
	ldr r0, [r4]
	mov r1, #5
	mov r2, #0
	mov r3, #0x80
	bl sub_0201F238
	ldr r0, [r4]
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl sub_0201F238
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	bne _0208A090
	add r0, r4, #0
	bl sub_0208AF70
	b _0208A090
_0208A024:
	add r0, #0x54
	ldr r0, [r4, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	beq _0208A048
	ldr r2, _0208A0DC ; =0x000007BC
	ldr r1, [r4]
	ldrsb r3, [r4, r2]
	mov r2, #0xc
	add r0, r4, #0
	add r5, r3, #0
	mul r5, r2
	ldr r2, _0208A0E4 ; =_021039B8 + 8
	mov r3, #6
	ldr r2, [r2, r5]
	bl sub_02089F50
	b _0208A090
_0208A048:
	add r0, r4, #0
	mov r1, #2
	bl sub_02089E80
	cmp r0, #0
	beq _0208A06E
	ldr r2, _0208A0DC ; =0x000007BC
	ldr r1, [r4]
	ldrsb r3, [r4, r2]
	mov r2, #0xc
	add r0, r4, #0
	add r5, r3, #0
	mul r5, r2
	ldr r2, _0208A0E8 ; =_021039B8 + 4
	mov r3, #6
	ldr r2, [r2, r5]
	bl sub_02089F50
	b _0208A090
_0208A06E:
	ldr r0, _0208A0DC ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0208A084
	ldr r1, [r4]
	add r0, r4, #0
	mov r2, #0x4d
	mov r3, #6
	bl sub_02089F50
	b _0208A090
_0208A084:
	ldr r1, [r4]
	add r0, r4, #0
	mov r2, #0x4e
	mov r3, #6
	bl sub_02089F50
_0208A090:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _0208A0B2
	mov r0, #0x7d
	lsl r0, r0, #4
	mov r1, #4
	ldr r0, [r4, r0]
	mov r2, #0x14
	add r3, r1, #0
	bl sub_020196E8
	add r0, r4, #0
	bl sub_0208B118
_0208A0B2:
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _0208A0D8
	ldr r0, _0208A0DC ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0208A0CE
	add r0, r4, #0
	bl sub_0208A1A0
	pop {r3, r4, r5, pc}
_0208A0CE:
	cmp r0, #1
	bne _0208A0D8
	add r0, r4, #0
	bl sub_0208A0EC
_0208A0D8:
	pop {r3, r4, r5, pc}
	nop
_0208A0DC: .word 0x000007BC
_0208A0E0: .word _021039B8
_0208A0E4: .word _021039B8 + 8
_0208A0E8: .word _021039B8 + 4
	thumb_func_end sub_02089F98

	thumb_func_start sub_0208A0EC
sub_0208A0EC: ; 0x0208A0EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #0x95
	add r6, r0, #0
	lsl r1, r1, #2
	ldrh r0, [r6, r1]
	add r1, r1, #2
	ldrh r1, [r6, r1]
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _0208A126
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208A112: ; jump table
	.short _0208A11C - _0208A112 - 2 ; case 0
	.short _0208A124 - _0208A112 - 2 ; case 1
	.short _0208A120 - _0208A112 - 2 ; case 2
	.short _0208A11C - _0208A112 - 2 ; case 3
	.short _0208A11C - _0208A112 - 2 ; case 4
_0208A11C:
	ldr r7, _0208A194 ; =0x0000F097
	b _0208A126
_0208A120:
	ldr r7, _0208A198 ; =0x0000F0B7
	b _0208A126
_0208A124:
	ldr r7, _0208A19C ; =0x0000F0D7
_0208A126:
	mov r1, #0x95
	lsl r1, r1, #2
	ldrh r0, [r6, r1]
	add r1, r1, #2
	ldrh r1, [r6, r1]
	mov r2, #0x30
	bl sub_02088068
	add r4, r0, #0
	add r0, r7, #0
	add r0, #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r5, #0
	str r0, [sp, #0x10]
_0208A144:
	cmp r4, #8
	blo _0208A14C
	ldr r2, [sp, #0x10]
	b _0208A152
_0208A14C:
	add r0, r7, r4
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_0208A152:
	mov r0, #5
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r3, r5, #0
	str r0, [sp, #8]
	mov r0, #0x11
	add r3, #0xa
	str r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [r6]
	mov r1, #3
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	cmp r4, #8
	bhs _0208A178
	mov r4, #0
	b _0208A17E
_0208A178:
	sub r4, #8
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_0208A17E:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #6
	blo _0208A144
	ldr r0, [r6]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0208A194: .word 0x0000F097
_0208A198: .word 0x0000F0B7
_0208A19C: .word 0x0000F0D7
	thumb_func_end sub_0208A0EC

	thumb_func_start sub_0208A1A0
sub_0208A1A0: ; 0x0208A1A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r2, _0208A228 ; =0x00000242
	add r6, r0, #0
	ldrb r0, [r6, r2]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	cmp r0, #0x64
	bhs _0208A1C8
	add r0, r2, #0
	add r1, r2, #0
	add r0, #0xa
	add r1, #0xe
	add r2, r2, #6
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	ldr r2, [r6, r2]
	sub r1, r1, r0
	sub r0, r2, r0
	b _0208A1CC
_0208A1C8:
	mov r1, #0
	add r0, r1, #0
_0208A1CC:
	mov r2, #0x38
	bl sub_02088068
	add r4, r0, #0
	mov r5, #0
	mov r7, #0x13
_0208A1D8:
	cmp r4, #8
	blo _0208A1E0
	ldr r2, _0208A22C ; =0x0000E03F
	b _0208A1E8
_0208A1E0:
	ldr r0, _0208A230 ; =0x0000E037
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_0208A1E8:
	str r7, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r3, r5, #0
	str r0, [sp, #8]
	mov r0, #0x11
	add r3, #9
	str r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [r6]
	mov r1, #6
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	cmp r4, #8
	bhs _0208A20C
	mov r4, #0
	b _0208A212
_0208A20C:
	sub r4, #8
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_0208A212:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #7
	blo _0208A1D8
	ldr r0, [r6]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208A228: .word 0x00000242
_0208A22C: .word 0x0000E03F
_0208A230: .word 0x0000E037
	thumb_func_end sub_0208A1A0

	thumb_func_start sub_0208A234
sub_0208A234: ; 0x0208A234
	push {r4, lr}
	mov r2, #0x8b
	add r4, r0, #0
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	strb r1, [r2, #0x14]
	bl sub_020897C0
	add r0, r4, #0
	bl sub_02089C50
	add r0, r4, #0
	bl sub_0208C57C
	add r0, r4, #0
	bl sub_0208C614
	add r0, r4, #0
	bl sub_0208C6B4
	add r0, r4, #0
	bl sub_02089F98
	add r0, r4, #0
	bl sub_0208E4B4
	add r0, r4, #0
	bl sub_0208B448
	add r0, r4, #0
	bl sub_0208BA60
	add r0, r4, #0
	bl sub_0208B5A8
	add r0, r4, #0
	bl sub_0208B89C
	add r0, r4, #0
	bl sub_0208B9C8
	add r0, r4, #0
	bl sub_0208C2A0
	add r0, r4, #0
	bl sub_0208BE70
	add r0, r4, #0
	bl sub_0208B48C
	add r0, r4, #0
	bl sub_0208B4EC
	add r0, r4, #0
	bl sub_0208BCD4
	add r0, r4, #0
	bl sub_0208BD38
	add r0, r4, #0
	bl sub_0208CBD4
	add r0, r4, #0
	bl sub_0208B400
	add r0, r4, #0
	bl sub_0208BFD0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208A234

	thumb_func_start sub_0208A2C0
sub_0208A2C0: ; 0x0208A2C0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208A2E0
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0208A2DC
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_0208A234
_0208A2DC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208A2C0

	thumb_func_start sub_0208A2E0
sub_0208A2E0: ; 0x0208A2E0
	push {r3, lr}
	mov r2, #0x8b
	lsl r2, r2, #2
	ldr r2, [r0, r2]
	ldrb r2, [r2, #0x11]
	cmp r2, #0
	beq _0208A2F8
	cmp r2, #1
	beq _0208A2FE
	cmp r2, #2
	beq _0208A304
	b _0208A30A
_0208A2F8:
	bl sub_0208A3F4
	pop {r3, pc}
_0208A2FE:
	bl sub_0208A45C
	pop {r3, pc}
_0208A304:
	bl sub_0208A4B8
	pop {r3, pc}
_0208A30A:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	thumb_func_end sub_0208A2E0

	thumb_func_start sub_0208A310
sub_0208A310: ; 0x0208A310
	push {r4, r5, r6, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r5, r1, #0
	ldrb r0, [r2, #0x11]
	cmp r0, #0
	beq _0208A32C
	cmp r0, #1
	beq _0208A35C
	cmp r0, #2
	beq _0208A396
	b _0208A3C6
_0208A32C:
	bl sub_02070D90
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r6, r5, #0
	ldr r4, [r1]
	mul r6, r0
	add r0, r4, r6
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A3C6
	add r0, r4, r6
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A3C6
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208A35C:
	ldrb r0, [r2, #0x13]
	cmp r5, r0
	bge _0208A3C6
	ldr r0, [r2]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A3C6
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A392
	add r0, r4, #0
	bl sub_0208A3CC
	cmp r0, #1
	bne _0208A3C6
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208A392:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208A396:
	bl sub_02070D94
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r6, r5, #0
	ldr r4, [r1]
	mul r6, r0
	add r0, r4, r6
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208A3C6
	add r0, r4, r6
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208A3C6
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208A3C6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208A310

	thumb_func_start sub_0208A3CC
sub_0208A3CC: ; 0x0208A3CC
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	ldrb r1, [r1, #0x12]
	cmp r1, #3
	bne _0208A3DC
	mov r0, #0
	bx lr
_0208A3DC:
	ldr r1, _0208A3F0 ; =0x000007BC
	ldrsb r0, [r0, r1]
	cmp r0, #0
	beq _0208A3EC
	cmp r0, #3
	beq _0208A3EC
	mov r0, #0
	bx lr
_0208A3EC:
	mov r0, #1
	bx lr
	.balign 4, 0
_0208A3F0: .word 0x000007BC
	thumb_func_end sub_0208A3CC

	thumb_func_start sub_0208A3F4
sub_0208A3F4: ; 0x0208A3F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	str r1, [sp]
	ldr r1, [r5, r0]
	mov r0, #0x14
	ldrsb r4, [r1, r0]
_0208A404:
	ldr r0, [sp]
	add r0, r4, r0
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
	bmi _0208A41A
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x13]
	cmp r4, r0
	blt _0208A420
_0208A41A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0208A420:
	bl sub_02070D90
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r7, r4, #0
	ldr r6, [r1]
	mul r7, r0
	add r0, r6, r7
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A404
	add r0, r6, r7
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A456
	add r0, r5, #0
	bl sub_0208A3CC
	cmp r0, #1
	bne _0208A404
_0208A456:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0208A3F4

	thumb_func_start sub_0208A45C
sub_0208A45C: ; 0x0208A45C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	add r7, r1, #0
	ldr r1, [r5, r0]
	mov r0, #0x14
	ldrsb r4, [r1, r0]
_0208A46C:
	add r0, r4, r7
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
	bmi _0208A480
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrb r0, [r1, #0x13]
	cmp r4, r0
	blt _0208A486
_0208A480:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0208A486:
	ldr r0, [r1]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A46C
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0208A4B4
	add r0, r5, #0
	bl sub_0208A3CC
	cmp r0, #1
	bne _0208A46C
_0208A4B4:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0208A45C

	thumb_func_start sub_0208A4B8
sub_0208A4B8: ; 0x0208A4B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	str r1, [sp]
	ldr r1, [r5, r0]
	mov r0, #0x14
	ldrsb r4, [r1, r0]
_0208A4C8:
	ldr r0, [sp]
	add r0, r4, r0
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
	bmi _0208A4DE
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x13]
	cmp r4, r0
	blt _0208A4E4
_0208A4DE:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0208A4E4:
	bl sub_02070D94
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r7, r4, #0
	ldr r6, [r1]
	mul r7, r0
	add r0, r6, r7
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208A4C8
	add r0, r6, r7
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208A51A
	add r0, r5, #0
	bl sub_0208A3CC
	cmp r0, #1
	bne _0208A4C8
_0208A51A:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0208A4B8

	thumb_func_start sub_0208A520
sub_0208A520: ; 0x0208A520
	push {r4, lr}
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r4, [r0, r1]
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	beq _0208A538
	cmp r0, #1
	beq _0208A546
	cmp r0, #2
	beq _0208A550
	b _0208A55E
_0208A538:
	bl sub_02070D90
	ldrb r1, [r4, #0x14]
	ldr r2, [r4]
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_0208A546:
	ldrb r1, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyMonByIndex
	pop {r4, pc}
_0208A550:
	bl sub_02070D94
	ldrb r1, [r4, #0x14]
	ldr r2, [r4]
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_0208A55E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208A520

	thumb_func_start sub_0208A564
sub_0208A564: ; 0x0208A564
	push {r4, lr}
	ldr r1, _0208A630 ; =0x000007BE
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0208A57A
	cmp r1, #1
	beq _0208A5B6
	cmp r1, #2
	beq _0208A5E2
	b _0208A62A
_0208A57A:
	ldr r0, _0208A634 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _0208A634 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020248F0
	mov r2, #0
	ldr r0, [r4]
	mov r1, #5
	add r3, r2, #0
	bl sub_0201F238
	ldr r0, [r4]
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl sub_0201F238
	add r0, r4, #0
	add r0, #0x44
	bl sub_0201D8E4
	ldr r0, _0208A630 ; =0x000007BE
	mov r1, #1
	strb r1, [r4, r0]
	b _0208A62A
_0208A5B6:
	ldr r0, [r4]
	mov r1, #5
	bl sub_0201BDF4
	cmp r0, #0x80
	ldr r0, [r4]
	blt _0208A5D6
	mov r1, #5
	mov r2, #0
	mov r3, #0x80
	bl sub_0201F238
	ldr r0, _0208A630 ; =0x000007BE
	mov r1, #2
	strb r1, [r4, r0]
	b _0208A62A
_0208A5D6:
	mov r1, #5
	mov r2, #1
	mov r3, #0x40
	bl sub_0201F238
	b _0208A62A
_0208A5E2:
	bl sub_0208DB1C
	add r0, r4, #0
	bl sub_0208A79C
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE0
	add r0, r4, #0
	bl sub_0208C068
	mov r0, #9
	lsl r0, r0, #6
	ldrb r1, [r4, r0]
	add r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _0208A616
	ldr r0, _0208A638 ; =0x00000434
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DCE0
_0208A616:
	ldr r0, _0208A634 ; =0x00000428
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _0208A630 ; =0x000007BE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0208A62A:
	mov r0, #0
	pop {r4, pc}
	nop
_0208A630: .word 0x000007BE
_0208A634: .word 0x00000428
_0208A638: .word 0x00000434
	thumb_func_end sub_0208A564

	thumb_func_start sub_0208A63C
sub_0208A63C: ; 0x0208A63C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208A70C ; =0x000007BE
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0208A652
	cmp r0, #1
	beq _0208A69C
	cmp r0, #2
	beq _0208A6C8
	b _0208A706
_0208A652:
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE0
	ldr r0, _0208A710 ; =0x00000434
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCE0
	ldr r0, _0208A714 ; =0x0000044C
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCE0
	mov r0, #0x45
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE0
	ldr r0, _0208A718 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	add r0, r4, #0
	bl sub_0208DB58
	add r0, r4, #0
	bl sub_0208DAD4
	ldr r0, _0208A70C ; =0x000007BE
	mov r1, #1
	strb r1, [r4, r0]
	b _0208A706
_0208A69C:
	ldr r0, [r4]
	mov r1, #5
	bl sub_0201BDF4
	cmp r0, #0x80
	ldr r0, [r4]
	bgt _0208A6BC
	mov r2, #0
	mov r1, #5
	add r3, r2, #0
	bl sub_0201F238
	ldr r0, _0208A70C ; =0x000007BE
	mov r1, #2
	strb r1, [r4, r0]
	b _0208A706
_0208A6BC:
	mov r1, #5
	mov r2, #2
	mov r3, #0x40
	bl sub_0201F238
	b _0208A706
_0208A6C8:
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0x64
	bl sub_0201D5C8
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0x44
	bl sub_0201D5C8
	ldr r0, _0208A718 ; =0x00000428
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	add r0, r4, #0
	bl sub_0208B400
	ldr r0, _0208A70C ; =0x000007BE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0208A706:
	mov r0, #0
	pop {r4, pc}
	nop
_0208A70C: .word 0x000007BE
_0208A710: .word 0x00000434
_0208A714: .word 0x0000044C
_0208A718: .word 0x00000428
	thumb_func_end sub_0208A63C

	thumb_func_start sub_0208A71C
sub_0208A71C: ; 0x0208A71C
	push {r4, r5, r6, r7}
	add r5, r0, #0
	ldr r0, _0208A798 ; =0x000007BD
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1c
	lsr r4, r0, #0x1c
	lsl r0, r4, #0x18
	asr r2, r0, #0x18
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	ldrb r0, [r3, #0x12]
	cmp r0, #2
	bne _0208A746
	ldrh r0, [r3, #0x18]
	cmp r0, #0
	beq _0208A742
	mov r3, #4
	b _0208A748
_0208A742:
	mov r3, #3
	b _0208A748
_0208A746:
	mov r3, #3
_0208A748:
	mov r6, #0x99
	mov r0, #0
	lsl r6, r6, #2
_0208A74E:
	add r2, r2, r1
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bpl _0208A75A
	add r2, r3, #0
	b _0208A760
_0208A75A:
	cmp r2, r3
	ble _0208A760
	add r2, r0, #0
_0208A760:
	cmp r2, #4
	beq _0208A772
	lsl r7, r2, #1
	add r7, r5, r7
	ldrh r7, [r7, r6]
	cmp r7, #0
	bne _0208A772
	cmp r2, r4
	bne _0208A74E
_0208A772:
	cmp r2, r4
	beq _0208A790
	ldr r3, _0208A798 ; =0x000007BD
	mov r1, #0xf
	ldrb r0, [r5, r3]
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r5, r3]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0208A790:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0208A798: .word 0x000007BD
	thumb_func_end sub_0208A71C

	thumb_func_start sub_0208A79C
sub_0208A79C: ; 0x0208A79C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208BBDC
	ldr r0, _0208A7F4 ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	cmp r1, #4
	bne _0208A7D0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrh r1, [r0, #0x18]
	cmp r1, #0
	beq _0208A7C4
	add r0, r4, #0
	bl sub_0208A7F8
	pop {r4, pc}
_0208A7C4:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0208A7F8
	pop {r4, pc}
_0208A7D0:
	cmp r1, #5
	bne _0208A7E0
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0208A7F8
	pop {r4, pc}
_0208A7E0:
	lsl r1, r1, #1
	add r2, r4, r1
	mov r1, #0x99
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	add r0, r4, #0
	bl sub_0208A7F8
	pop {r4, pc}
	nop
_0208A7F4: .word 0x000007BD
	thumb_func_end sub_0208A79C

	thumb_func_start sub_0208A7F8
sub_0208A7F8: ; 0x0208A7F8
	push {r3, r4, r5, lr}
	mov r2, #0
	add r4, r1, #0
	mvn r2, r2
	add r5, r0, #0
	cmp r4, r2
	bne _0208A816
	bl sub_0208DAD4
	ldr r0, _0208A830 ; =0x0000044C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	pop {r3, r4, r5, pc}
_0208A816:
	bl sub_0208D9A0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0208BB8C
	ldr r0, _0208A830 ; =0x0000044C
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	pop {r3, r4, r5, pc}
	nop
_0208A830: .word 0x0000044C
	thumb_func_end sub_0208A7F8

	thumb_func_start sub_0208A834
sub_0208A834: ; 0x0208A834
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl sub_0208A520
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldrb r1, [r1, #0x11]
	cmp r1, #2
	ldr r1, _0208A8F0 ; =0x000007BD
	bne _0208A85A
	ldrb r2, [r4, r1]
	lsl r1, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x1c
	bl BoxMonSwapMoves
	b _0208A868
_0208A85A:
	ldrb r2, [r4, r1]
	lsl r1, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r1, r1, #0x1c
	lsr r2, r2, #0x1c
	bl MonSwapMoves
_0208A868:
	ldr r0, _0208A8F0 ; =0x000007BD
	mov r1, #0x99
	ldrb r6, [r4, r0]
	lsl r1, r1, #2
	add r5, r4, r1
	lsl r2, r6, #0x1c
	lsl r6, r6, #0x18
	lsr r6, r6, #0x1c
	lsl r6, r6, #1
	lsr r3, r2, #0x1b
	add r6, r4, r6
	ldrh r2, [r5, r3]
	ldrh r6, [r6, r1]
	strh r6, [r5, r3]
	ldrb r3, [r4, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	lsl r3, r3, #1
	add r3, r4, r3
	strh r2, [r3, r1]
	add r2, r1, #0
	add r2, #8
	ldrb r6, [r4, r0]
	add r5, r4, r2
	lsl r2, r6, #0x1c
	lsl r6, r6, #0x18
	lsr r6, r6, #0x1c
	add r7, r4, r6
	add r6, r1, #0
	lsr r3, r2, #0x1c
	add r6, #8
	ldrb r2, [r5, r3]
	ldrb r6, [r7, r6]
	strb r6, [r5, r3]
	ldrb r3, [r4, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	add r5, r4, r3
	add r3, r1, #0
	add r3, #8
	strb r2, [r5, r3]
	add r2, r1, #0
	add r2, #0xc
	ldrb r6, [r4, r0]
	add r5, r4, r2
	lsl r2, r6, #0x1c
	lsl r6, r6, #0x18
	lsr r6, r6, #0x1c
	add r7, r4, r6
	add r6, r1, #0
	lsr r3, r2, #0x1c
	add r6, #0xc
	ldrb r2, [r5, r3]
	ldrb r6, [r7, r6]
	strb r6, [r5, r3]
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r3, r4, r0
	add r0, r1, #0
	add r0, #0xc
	strb r2, [r3, r0]
	sub r1, #0x38
	ldr r0, [r4, r1]
	mov r2, #1
	str r2, [r0, #0x38]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208A8F0: .word 0x000007BD
	thumb_func_end sub_0208A834

	thumb_func_start sub_0208A8F4
sub_0208A8F4: ; 0x0208A8F4
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0
	ldr r0, [r4]
	mov r1, #2
	add r3, r2, #0
	bl sub_0201F238
	add r0, r4, #0
	bl sub_0208DB1C
	add r0, r4, #0
	bl sub_0208A79C
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE0
	add r0, r4, #0
	bl sub_0208C068
	mov r0, #9
	lsl r0, r0, #6
	ldrb r1, [r4, r0]
	add r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _0208A93A
	ldr r0, _0208A948 ; =0x00000434
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DCE0
_0208A93A:
	ldr r0, _0208A94C ; =0x00000428
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	pop {r4, pc}
	nop
_0208A948: .word 0x00000434
_0208A94C: .word 0x00000428
	thumb_func_end sub_0208A8F4

	thumb_func_start sub_0208A950
sub_0208A950: ; 0x0208A950
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208DB1C
	add r0, r4, #0
	bl sub_0208A79C
	add r0, r4, #0
	bl sub_0208C068
	ldr r0, _0208A9BC ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _0208A9A4
	add r0, r4, #0
	bl sub_0208C208
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE0
	mov r0, #9
	lsl r0, r0, #6
	ldrb r1, [r4, r0]
	add r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _0208A996
	ldr r0, _0208A9C0 ; =0x00000434
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DCE0
_0208A996:
	ldr r0, [r4]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl sub_0201F238
	pop {r4, pc}
_0208A9A4:
	add r0, r4, #0
	bl sub_0208C0E8
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4]
	mov r1, #2
	add r3, #0xfd
	bl sub_0201F238
	pop {r4, pc}
	nop
_0208A9BC: .word 0x000007BC
_0208A9C0: .word 0x00000434
	thumb_func_end sub_0208A950

	thumb_func_start sub_0208A9C4
sub_0208A9C4: ; 0x0208A9C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208AA8C ; =0x000007BE
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0208A9DA
	cmp r0, #1
	beq _0208AA32
	cmp r0, #2
	beq _0208AA5E
	b _0208AA86
_0208A9DA:
	mov r2, #0
	ldr r0, [r4]
	mov r1, #5
	add r3, r2, #0
	bl sub_0201F238
	ldr r0, [r4]
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl sub_0201F238
	ldr r0, _0208AA90 ; =0x00000428
	mov r1, #3
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, _0208AA90 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D8E4
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0201D8E4
	ldr r0, _0208AA94 ; =0x000007C5
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #1
	sub r0, r0, #7
	strb r1, [r4, r0]
	b _0208AA86
_0208AA32:
	ldr r0, [r4]
	mov r1, #5
	bl sub_0201BE00
	cmp r0, #0x48
	ldr r0, [r4]
	blt _0208AA52
	mov r1, #5
	mov r2, #3
	mov r3, #0x48
	bl sub_0201F238
	ldr r0, _0208AA8C ; =0x000007BE
	mov r1, #2
	strb r1, [r4, r0]
	b _0208AA86
_0208AA52:
	mov r1, #5
	mov r2, #4
	mov r3, #0x24
	bl sub_0201F238
	b _0208AA86
_0208AA5E:
	mov r0, #5
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
	ldr r0, _0208AA98 ; =0x0000050C
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	add r0, r4, #0
	mov r1, #0
	bl sub_0208AB58
	ldr r0, _0208AA8C ; =0x000007BE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0208AA86:
	mov r0, #0
	pop {r4, pc}
	nop
_0208AA8C: .word 0x000007BE
_0208AA90: .word 0x00000428
_0208AA94: .word 0x000007C5
_0208AA98: .word 0x0000050C
	thumb_func_end sub_0208A9C4

	thumb_func_start sub_0208AA9C
sub_0208AA9C: ; 0x0208AA9C
	push {r4, lr}
	ldr r1, _0208AB50 ; =0x000007BE
	add r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0208AAB2
	cmp r0, #1
	beq _0208AAE2
	cmp r0, #2
	beq _0208AB0E
	b _0208AB4A
_0208AAB2:
	mov r2, #0
	add r0, r1, #6
	strb r2, [r4, r0]
	add r0, r1, #7
	strb r2, [r4, r0]
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl sub_0201D8E4
	add r0, r4, #0
	bl sub_0208C2A0
	ldr r0, _0208AB50 ; =0x000007BE
	mov r1, #1
	strb r1, [r4, r0]
	b _0208AB4A
_0208AAE2:
	ldr r0, [r4]
	mov r1, #5
	bl sub_0201BE00
	cmp r0, #0
	ldr r0, [r4]
	bgt _0208AB02
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl sub_0201F238
	ldr r0, _0208AB50 ; =0x000007BE
	mov r1, #2
	strb r1, [r4, r0]
	b _0208AB4A
_0208AB02:
	mov r1, #5
	add r2, r1, #0
	mov r3, #0x24
	bl sub_0201F238
	b _0208AB4A
_0208AB0E:
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0201D5C8
	ldr r0, _0208AB54 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, _0208AB54 ; =0x00000428
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _0208AB50 ; =0x000007BE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0208AB4A:
	mov r0, #0
	pop {r4, pc}
	nop
_0208AB50: .word 0x000007BE
_0208AB54: .word 0x00000428
	thumb_func_end sub_0208AA9C

	thumb_func_start sub_0208AB58
sub_0208AB58: ; 0x0208AB58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0208ACC4 ; =0x000007C4
	add r4, r1, #0
	add r1, r0, #1
	ldrb r7, [r5, r0]
	ldrb r6, [r5, r1]
	cmp r4, #1
	bne _0208AB80
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	cmp r1, #2
	beq _0208AB94
	ldr r0, _0208ACC4 ; =0x000007C4
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	b _0208AC34
_0208AB80:
	mov r2, #0
	mvn r2, r2
	cmp r4, r2
	bne _0208ABA0
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	cmp r1, #0
	bne _0208AB96
_0208AB94:
	b _0208ACC0
_0208AB96:
	ldr r0, _0208ACC4 ; =0x000007C4
	ldrb r1, [r5, r0]
	sub r1, r1, #1
	strb r1, [r5, r0]
	b _0208AC34
_0208ABA0:
	cmp r4, #3
	bne _0208ABD4
	cmp r7, #6
	blo _0208ABCE
	add r2, r6, #1
	lsl r1, r2, #3
	add r1, r2, r1
	add r2, r0, #2
	ldrb r2, [r5, r2]
	cmp r1, r2
	bge _0208AC34
	add r1, r0, #1
	ldrb r1, [r5, r1]
	add r2, r1, #1
	add r1, r0, #1
	strb r2, [r5, r1]
	ldrb r0, [r5, r0]
	mov r1, #3
	bl _s32_div_f
	ldr r0, _0208ACC4 ; =0x000007C4
	strb r1, [r5, r0]
	b _0208AC34
_0208ABCE:
	add r1, r7, #3
	strb r1, [r5, r0]
	b _0208AC34
_0208ABD4:
	sub r1, r2, #2
	cmp r4, r1
	bne _0208AC02
	cmp r7, #2
	bhi _0208ABFC
	cmp r6, #0
	beq _0208AC34
	add r1, r0, #1
	ldrb r1, [r5, r1]
	sub r2, r1, #1
	add r1, r0, #1
	strb r2, [r5, r1]
	ldrb r0, [r5, r0]
	mov r1, #3
	bl _s32_div_f
	ldr r0, _0208ACC4 ; =0x000007C4
	add r1, r1, #6
	strb r1, [r5, r0]
	b _0208AC34
_0208ABFC:
	sub r1, r7, #3
	strb r1, [r5, r0]
	b _0208AC34
_0208AC02:
	cmp r4, #9
	bne _0208AC20
	add r2, r6, #1
	lsl r1, r2, #3
	add r1, r2, r1
	add r2, r0, #2
	ldrb r2, [r5, r2]
	cmp r1, r2
	bge _0208AC34
	add r1, r0, #1
	ldrb r1, [r5, r1]
	add r0, r0, #1
	add r1, r1, #1
	strb r1, [r5, r0]
	b _0208AC34
_0208AC20:
	sub r2, #8
	cmp r4, r2
	bne _0208AC34
	cmp r6, #0
	beq _0208AC34
	add r1, r0, #1
	ldrb r1, [r5, r1]
	add r0, r0, #1
	sub r1, r1, #1
	strb r1, [r5, r0]
_0208AC34:
	ldr r0, _0208ACC4 ; =0x000007C4
	ldrb r1, [r5, r0]
	cmp r7, r1
	bne _0208AC44
	add r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r6, r0
	beq _0208AC56
_0208AC44:
	cmp r4, #9
	beq _0208AC56
	mov r0, #8
	mvn r0, r0
	cmp r4, r0
	beq _0208AC56
	ldr r0, _0208ACC8 ; =0x000005DC
	bl PlaySE
_0208AC56:
	ldr r1, _0208ACC4 ; =0x000007C4
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0208ACDC
	ldr r1, _0208ACCC ; =0x000007C7
	strb r0, [r5, r1]
	add r0, r5, #0
	bl sub_0208C380
	ldr r0, _0208ACD0 ; =0x000007C5
	ldrb r0, [r5, r0]
	cmp r6, r0
	beq _0208AC78
	add r0, r5, #0
	bl sub_0208C320
_0208AC78:
	add r0, r5, #0
	bl sub_0208D7C4
	ldr r0, _0208ACD0 ; =0x000007C5
	ldrb r0, [r5, r0]
	cmp r0, #0
	ldr r0, _0208ACD4 ; =0x00000504
	beq _0208AC92
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	b _0208AC9A
_0208AC92:
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
_0208AC9A:
	ldr r0, _0208ACD0 ; =0x000007C5
	ldrb r1, [r5, r0]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	add r2, r1, #1
	lsl r1, r2, #3
	add r1, r2, r1
	cmp r1, r0
	ldr r0, _0208ACD8 ; =0x00000508
	bge _0208ACB8
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024830
	pop {r3, r4, r5, r6, r7, pc}
_0208ACB8:
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
_0208ACC0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208ACC4: .word 0x000007C4
_0208ACC8: .word 0x000005DC
_0208ACCC: .word 0x000007C7
_0208ACD0: .word 0x000007C5
_0208ACD4: .word 0x00000504
_0208ACD8: .word 0x00000508
	thumb_func_end sub_0208AB58

	thumb_func_start sub_0208ACDC
sub_0208ACDC: ; 0x0208ACDC
	push {r4, r5, r6, r7}
	ldr r2, _0208AD30 ; =0x000007C5
	mov r6, #0
	ldrb r3, [r0, r2]
	add r4, r6, #0
	lsl r2, r3, #3
	add r2, r3, r2
	add r1, r1, r2
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	mov r1, #0xa1
	mov r2, #1
	lsl r1, r1, #2
_0208ACF6:
	mov r3, #0x1f
	add r7, r4, #0
	and r7, r3
	add r3, r2, #0
	lsl r3, r7
	lsr r7, r4, #5
	lsl r7, r7, #2
	add r7, r0, r7
	ldr r7, [r7, r1]
	tst r3, r7
	beq _0208AD1E
	cmp r5, r6
	bne _0208AD18
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, r7}
	bx lr
_0208AD18:
	add r3, r6, #1
	lsl r3, r3, #0x18
	lsr r6, r3, #0x18
_0208AD1E:
	add r3, r4, #1
	lsl r3, r3, #0x10
	lsr r4, r3, #0x10
	cmp r4, #0x50
	blo _0208ACF6
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0208AD30: .word 0x000007C5
	thumb_func_end sub_0208ACDC

	thumb_func_start sub_0208AD34
sub_0208AD34: ; 0x0208AD34
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetNamePtr
	str r0, [r5, #8]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r5, #0x10]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208AD34

	thumb_func_start sub_0208AD54
sub_0208AD54: ; 0x0208AD54
	mov r0, #0x40
	bx lr
	thumb_func_end sub_0208AD54

	thumb_func_start sub_0208AD58
sub_0208AD58: ; 0x0208AD58
	mov r0, #0x41
	bx lr
	thumb_func_end sub_0208AD58

	thumb_func_start sub_0208AD5C
sub_0208AD5C: ; 0x0208AD5C
	mov r0, #0x3f
	bx lr
	thumb_func_end sub_0208AD5C

	thumb_func_start sub_0208AD60
sub_0208AD60: ; 0x0208AD60
	mov r0, #0x3e
	bx lr
	thumb_func_end sub_0208AD60

	thumb_func_start sub_0208AD64
sub_0208AD64: ; 0x0208AD64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0208AD84
	mov r0, #6
	pop {r3, r4, r5, pc}
_0208AD84:
	mov r0, #0x88
	tst r0, r4
	beq _0208AD8E
	mov r0, #4
	pop {r3, r4, r5, pc}
_0208AD8E:
	mov r0, #7
	add r1, r4, #0
	tst r1, r0
	beq _0208AD9A
	mov r0, #3
	pop {r3, r4, r5, pc}
_0208AD9A:
	mov r1, #0x10
	tst r1, r4
	beq _0208ADA4
	mov r0, #5
	pop {r3, r4, r5, pc}
_0208ADA4:
	mov r1, #0x20
	tst r1, r4
	beq _0208ADAE
	mov r0, #2
	pop {r3, r4, r5, pc}
_0208ADAE:
	mov r1, #0x40
	tst r1, r4
	beq _0208ADB6
	mov r0, #1
_0208ADB6:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208AD64

	thumb_func_start sub_0208ADB8
sub_0208ADB8: ; 0x0208ADB8
	push {r3, lr}
	mov r2, #0x8b
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _0208ADCA
	bl sub_02018410
_0208ADCA:
	pop {r3, pc}
	thumb_func_end sub_0208ADB8

	thumb_func_start sub_0208ADCC
sub_0208ADCC: ; 0x0208ADCC
	ldr r3, _0208ADD4 ; =sub_02025224
	ldr r0, _0208ADD8 ; =_021038D4
	bx r3
	nop
_0208ADD4: .word sub_02025224
_0208ADD8: .word _021038D4
	thumb_func_end sub_0208ADCC

	thumb_func_start sub_0208ADDC
sub_0208ADDC: ; 0x0208ADDC
	push {r3, lr}
	ldr r0, _0208AE00 ; =_021038D4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0208ADFE
	ldr r0, _0208AE04 ; =_021038AC
	bl sub_02025320
	cmp r0, #1
	bne _0208ADFA
	mov r0, #4
	pop {r3, pc}
_0208ADFA:
	mov r0, #0
	mvn r0, r0
_0208ADFE:
	pop {r3, pc}
	.balign 4, 0
_0208AE00: .word _021038D4
_0208AE04: .word _021038AC
	thumb_func_end sub_0208ADDC

	thumb_func_start sub_0208AE08
sub_0208AE08: ; 0x0208AE08
	push {r3, lr}
	ldr r0, _0208AE3C ; =_021038D4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0208AE38
	ldr r0, _0208AE40 ; =_021038B0
	bl sub_02025320
	cmp r0, #1
	bne _0208AE26
	mov r0, #4
	pop {r3, pc}
_0208AE26:
	ldr r0, _0208AE44 ; =_021038AC
	bl sub_02025320
	cmp r0, #1
	bne _0208AE34
	mov r0, #5
	pop {r3, pc}
_0208AE34:
	mov r0, #0
	mvn r0, r0
_0208AE38:
	pop {r3, pc}
	nop
_0208AE3C: .word _021038D4
_0208AE40: .word _021038B0
_0208AE44: .word _021038AC
	thumb_func_end sub_0208AE08

	thumb_func_start sub_0208AE48
sub_0208AE48: ; 0x0208AE48
	push {r3, lr}
	ldr r0, _0208AE7C ; =_021038D4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0208AE78
	ldr r0, _0208AE80 ; =_021038B4
	bl sub_02025320
	cmp r0, #1
	bne _0208AE66
	mov r0, #4
	pop {r3, pc}
_0208AE66:
	ldr r0, _0208AE84 ; =_021038AC
	bl sub_02025320
	cmp r0, #1
	bne _0208AE74
	mov r0, #5
	pop {r3, pc}
_0208AE74:
	mov r0, #0
	mvn r0, r0
_0208AE78:
	pop {r3, pc}
	nop
_0208AE7C: .word _021038D4
_0208AE80: .word _021038B4
_0208AE84: .word _021038AC
	thumb_func_end sub_0208AE48

	thumb_func_start sub_0208AE88
sub_0208AE88: ; 0x0208AE88
	push {r3, lr}
	ldr r0, _0208AEAC ; =_021038B4
	bl sub_02025320
	cmp r0, #1
	bne _0208AE98
	mov r0, #0
	pop {r3, pc}
_0208AE98:
	ldr r0, _0208AEB0 ; =_021038AC
	bl sub_02025320
	cmp r0, #1
	bne _0208AEA6
	mov r0, #1
	pop {r3, pc}
_0208AEA6:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	.balign 4, 0
_0208AEAC: .word _021038B4
_0208AEB0: .word _021038AC
	thumb_func_end sub_0208AE88

	thumb_func_start sub_0208AEB4
sub_0208AEB4: ; 0x0208AEB4
	ldr r3, _0208AEBC ; =sub_02025224
	ldr r0, _0208AEC0 ; =_021038B8
	bx r3
	nop
_0208AEBC: .word sub_02025224
_0208AEC0: .word _021038B8
	thumb_func_end sub_0208AEB4

	thumb_func_start sub_0208AEC4
sub_0208AEC4: ; 0x0208AEC4
	ldr r3, _0208AECC ; =sub_02025224
	ldr r0, _0208AED0 ; =_021039E8
	bx r3
	nop
_0208AECC: .word sub_02025224
_0208AED0: .word _021039E8
	thumb_func_end sub_0208AEC4

	thumb_func_start sub_0208AED4
sub_0208AED4: ; 0x0208AED4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208AF00 ; =0x00000428
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_020248F0
	ldr r0, _0208AF04 ; =0x0000042C
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	add r0, r4, #0
	bl sub_0208BCB4
	add r0, r4, #0
	mov r1, #1
	bl sub_0208AF08
	mov r0, #9
	pop {r4, pc}
	nop
_0208AF00: .word 0x00000428
_0208AF04: .word 0x0000042C
	thumb_func_end sub_0208AED4

	thumb_func_start sub_0208AF08
sub_0208AF08: ; 0x0208AF08
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	bne _0208AF34
	mov r0, #0x7d
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	mov r3, #0x12
	bl sub_020196E8
	ldr r0, _0208AF6C ; =0x00000448
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	add r0, r4, #0
	mov r1, #1
	bl sub_0208DC68
	pop {r4, pc}
_0208AF34:
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldrh r1, [r1, #0x18]
	cmp r1, #0
	beq _0208AF5C
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	mov r2, #0
	mov r3, #0x12
	bl sub_020196E8
	ldr r0, _0208AF6C ; =0x00000448
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	b _0208AF60
_0208AF5C:
	bl sub_0208AF70
_0208AF60:
	add r0, r4, #0
	mov r1, #0
	bl sub_0208DC68
	pop {r4, pc}
	nop
_0208AF6C: .word 0x00000448
	thumb_func_end sub_0208AF08

	thumb_func_start sub_0208AF70
sub_0208AF70: ; 0x0208AF70
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	mov r1, #6
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4]
	ldr r2, _0208AF9C ; =0x00003006
	mov r3, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	nop
_0208AF9C: .word 0x00003006
	thumb_func_end sub_0208AF70

	thumb_func_start sub_0208AFA0
sub_0208AFA0: ; 0x0208AFA0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #1
	beq _0208AFE6
	cmp r1, #1
	bne _0208AFCE
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #2
	mov r2, #1
	mov r3, #0x10
	bl sub_020196E8
	add r0, r4, #0
	mov r1, #1
	bl sub_0208DD20
	pop {r4, pc}
_0208AFCE:
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #3
	mov r2, #1
	mov r3, #0x10
	bl sub_020196E8
	add r0, r4, #0
	mov r1, #0
	bl sub_0208DD20
_0208AFE6:
	pop {r4, pc}
	thumb_func_end sub_0208AFA0

	thumb_func_start sub_0208AFE8
sub_0208AFE8: ; 0x0208AFE8
	push {r3, r4, r5, r6}
	ldr r5, _0208B040 ; =0x000007C8
	add r4, r0, #0
	strb r2, [r4, r5]
	add r0, r5, #1
	strb r3, [r4, r0]
	add r2, sp, #0
	ldrb r3, [r2, #0x10]
	add r0, r5, #2
	strb r3, [r4, r0]
	ldrb r3, [r2, #0x14]
	add r0, r5, #3
	strb r3, [r4, r0]
	add r0, r5, #4
	ldrb r3, [r4, r0]
	mov r0, #0xf
	ldrb r6, [r2, #0x18]
	bic r3, r0
	mov r0, #0xf
	and r6, r0
	orr r6, r3
	add r3, r5, #4
	strb r6, [r4, r3]
	ldrb r2, [r2, #0x1c]
	ldrb r3, [r4, r3]
	mov r6, #0xf0
	lsl r2, r2, #0x1c
	bic r3, r6
	lsr r2, r2, #0x18
	orr r3, r2
	add r2, r5, #4
	strb r3, [r4, r2]
	add r2, r5, #5
	strb r1, [r4, r2]
	mov r2, #0
	add r1, r5, #6
	strb r2, [r4, r1]
	add r1, sp, #0x20
	ldrb r2, [r1]
	add r1, r5, #7
	strb r2, [r4, r1]
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0208B040: .word 0x000007C8
	thumb_func_end sub_0208AFE8

	thumb_func_start sub_0208B044
sub_0208B044: ; 0x0208B044
	push {lr}
	sub sp, #0x14
	mov r2, #9
	str r2, [sp]
	mov r2, #4
	str r2, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #6
	mov r2, #0x17
	mov r3, #0x14
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	thumb_func_end sub_0208B044

	thumb_func_start sub_0208B068
sub_0208B068: ; 0x0208B068
	push {lr}
	sub sp, #0x14
	mov r2, #0xf
	str r2, [sp]
	mov r2, #4
	str r2, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #6
	mov r3, #0x13
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_0208B068

	thumb_func_start sub_0208B08C
sub_0208B08C: ; 0x0208B08C
	push {lr}
	sub sp, #0x14
	mov r2, #0xa
	str r2, [sp]
	mov r2, #2
	str r2, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #6
	mov r3, #0x11
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_0208B08C

	thumb_func_start sub_0208B0B0
sub_0208B0B0: ; 0x0208B0B0
	push {lr}
	sub sp, #0x14
	cmp r1, #0
	bne _0208B0D6
	mov r1, #6
	str r1, [sp]
	mov r3, #3
	str r3, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r2, #0x18
	mov r3, #5
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
_0208B0D6:
	mov r1, #6
	str r1, [sp]
	mov r3, #3
	str r3, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r2, #0x18
	mov r3, #0xd
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	thumb_func_end sub_0208B0B0

	thumb_func_start sub_0208B0F4
sub_0208B0F4: ; 0x0208B0F4
	push {lr}
	sub sp, #0x14
	mov r2, #6
	str r2, [sp]
	mov r2, #4
	str r2, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #5
	mov r2, #0x1a
	mov r3, #0x1d
	bl sub_0208AFE8
	add sp, #0x14
	pop {pc}
	thumb_func_end sub_0208B0F4

	thumb_func_start sub_0208B118
sub_0208B118: ; 0x0208B118
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	mvn r1, r1
	add r4, r0, #0
	bl sub_0208A2E0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0208B140
	mov r0, #0x7d
	lsl r0, r0, #4
	mov r1, #5
	ldr r0, [r4, r0]
	mov r2, #0x18
	add r3, r1, #0
	bl sub_020196E8
	b _0208B162
_0208B140:
	mov r0, #5
	str r0, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r2, #1
	mov r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
_0208B162:
	add r0, r4, #0
	mov r1, #1
	bl sub_0208A2E0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0208B186
	mov r0, #0x7d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #6
	mov r2, #0x18
	mov r3, #0xd
	bl sub_020196E8
	add sp, #0x10
	pop {r4, pc}
_0208B186:
	mov r0, #0xd
	str r0, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r2, #1
	mov r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0208B118

	thumb_func_start sub_0208B1AC
sub_0208B1AC: ; 0x0208B1AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl sub_02022CC8
	mov r0, #0x20
	mov r1, #0x13
	bl sub_0202055C
	mov r0, #0x13
	bl sub_0200CF18
	mov r1, #0xff
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	mov r7, #1
	lsl r7, r7, #0xa
	add r2, sp, #0x24
	ldr r3, _0208B24C ; =_02103A50
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _0208B250 ; =_02103A3C
	stmia r2!, {r0, r1}
	add r3, sp, #0x10
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r4, r0]
	mov r3, #0x20
	bl sub_0200CF70
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x73
	bl sub_0200CFF4
	ldr r3, _0208B254 ; =_02103A2C
	add r2, sp, #0
	mov r1, #7
_0208B22A:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0208B22A
	mov r1, #0xff
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0
	bl sub_0200D294
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0208B24C: .word _02103A50
_0208B250: .word _02103A3C
_0208B254: .word _02103A2C
	thumb_func_end sub_0208B1AC

	thumb_func_start sub_0208B258
sub_0208B258: ; 0x0208B258
	push {r4, lr}
	mov r1, #0xff
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D0E4
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D108
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208B258

	thumb_func_start sub_0208B278
sub_0208B278: ; 0x0208B278
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208B2B0 ; =0x00000458
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, _0208B2B4 ; =0x0000045C
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, _0208B2B8 ; =0x00000504
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, _0208B2BC ; =0x00000508
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
	pop {r4, pc}
	nop
_0208B2B0: .word 0x00000458
_0208B2B4: .word 0x0000045C
_0208B2B8: .word 0x00000504
_0208B2BC: .word 0x00000508
	thumb_func_end sub_0208B278

	thumb_func_start sub_0208B2C0
sub_0208B2C0: ; 0x0208B2C0
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _0208B3C4 ; =_02103A70
	ldr r7, _0208B3C8 ; =0x00000404
	add r5, r0, #0
	mov r4, #0
_0208B2CA:
	mov r0, #0xff
	mov r1, #1
	lsl r0, r0, #2
	lsl r1, r1, #0xa
	mov r2, #0x28
	mul r2, r4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, r2
	bl sub_0200D2B4
	lsl r1, r4, #2
	add r1, r5, r1
	str r0, [r1, r7]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x73
	blo _0208B2CA
	add r0, r5, #0
	bl sub_0208B55C
	ldr r0, _0208B3CC ; =0x0000042C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B3D0 ; =0x000004A8
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B3D4 ; =0x000004AC
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
	ldr r0, _0208B3D8 ; =0x000004B4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B3DC ; =0x000004B8
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B3E0 ; =0x000004BC
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	mov r0, #0x13
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
	ldr r0, _0208B3E4 ; =0x000004C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B3E8 ; =0x000004C8
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B3EC ; =0x000004CC
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
	mov r0, #0x51
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
	ldr r0, _0208B3F0 ; =0x00000514
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B3F4 ; =0x00000518
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B3F8 ; =0x0000051C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	mov r0, #0x52
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024830
	add r0, r5, #0
	bl sub_0208B714
	add r0, r5, #0
	bl sub_0208B74C
	ldr r0, _0208B3FC ; =0x00000524
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208B3C4: .word _02103A70
_0208B3C8: .word 0x00000404
_0208B3CC: .word 0x0000042C
_0208B3D0: .word 0x000004A8
_0208B3D4: .word 0x000004AC
_0208B3D8: .word 0x000004B4
_0208B3DC: .word 0x000004B8
_0208B3E0: .word 0x000004BC
_0208B3E4: .word 0x000004C4
_0208B3E8: .word 0x000004C8
_0208B3EC: .word 0x000004CC
_0208B3F0: .word 0x00000514
_0208B3F4: .word 0x00000518
_0208B3F8: .word 0x0000051C
_0208B3FC: .word 0x00000524
	thumb_func_end sub_0208B2C0

	thumb_func_start sub_0208B400
sub_0208B400: ; 0x0208B400
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldrb r0, [r1, #0x11]
	cmp r0, #2
	beq _0208B430
	ldrb r0, [r1, #0x14]
	ldr r1, _0208B43C ; =_021105B0
	ldr r2, _0208B440 ; =_021105B0 + 1
	lsl r3, r0, #1
	ldr r0, _0208B444 ; =0x00000428
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, r0]
	bl sub_0200DD88
	ldr r0, _0208B444 ; =0x00000428
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_020248F0
	pop {r4, pc}
_0208B430:
	ldr r0, _0208B444 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	pop {r4, pc}
	.balign 4, 0
_0208B43C: .word _021105B0
_0208B440: .word _021105B0 + 1
_0208B444: .word 0x00000428
	thumb_func_end sub_0208B400

	thumb_func_start sub_0208B448
sub_0208B448: ; 0x0208B448
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0208B480 ; =0x00000404
	mov r5, #0
	add r4, r7, r0
	add r6, r5, #0
_0208B454:
	lsl r0, r5, #2
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl sub_02024830
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #8
	blo _0208B454
	ldr r0, _0208B484 ; =0x00000458
	mov r1, #0
	ldr r0, [r7, r0]
	bl sub_02024830
	ldr r0, _0208B488 ; =0x0000045C
	mov r1, #0
	ldr r0, [r7, r0]
	bl sub_02024830
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208B480: .word 0x00000404
_0208B484: .word 0x00000458
_0208B488: .word 0x0000045C
	thumb_func_end sub_0208B448

	thumb_func_start sub_0208B48C
sub_0208B48C: ; 0x0208B48C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _0208B4E4 ; =0x00000243
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r3, r0, #0x1a
	bne _0208B4A0
	mov r3, #0x19
	b _0208B4A2
_0208B4A0:
	add r3, #0x18
_0208B4A2:
	mov r0, #0
	mov r1, #0xff
	str r0, [sp]
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0xa2
	bl sub_0200E248
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	mov r1, #0xff
	ldr r3, _0208B4E4 ; =0x00000243
	str r0, [sp, #4]
	ldrb r3, [r4, r3]
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	lsl r3, r3, #0x18
	ldr r1, [r4, r1]
	lsr r4, r3, #0x1a
	ldr r3, _0208B4E8 ; =_02104C68
	mov r2, #0xa2
	ldrb r3, [r3, r4]
	add r3, #0x31
	bl sub_0200E27C
	add sp, #8
	pop {r4, pc}
	nop
_0208B4E4: .word 0x00000243
_0208B4E8: .word _02104C68
	thumb_func_end sub_0208B48C

	thumb_func_start sub_0208B4EC
sub_0208B4EC: ; 0x0208B4EC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	lsr r0, r0, #4
	cmp r0, #7
	bne _0208B514
	ldr r0, _0208B554 ; =0x00000454
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _0208B558 ; =0x00000524
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	pop {r4, pc}
_0208B514:
	cmp r0, #0
	ldr r0, _0208B558 ; =0x00000524
	beq _0208B540
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024830
	ldr r0, _0208B554 ; =0x00000454
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	mov r1, #0xa
	lsl r1, r1, #6
	ldr r0, _0208B554 ; =0x00000454
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	lsl r1, r1, #4
	lsr r1, r1, #4
	bl sub_020248F0
	pop {r4, pc}
_0208B540:
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
	ldr r0, _0208B554 ; =0x00000454
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	pop {r4, pc}
	.balign 4, 0
_0208B554: .word 0x00000454
_0208B558: .word 0x00000524
	thumb_func_end sub_0208B4EC

	thumb_func_start sub_0208B55C
sub_0208B55C: ; 0x0208B55C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0208BA60
	mov r6, #0x99
	mov r4, #0
	mov r7, #3
	lsl r6, r6, #2
_0208B56C:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, r6]
	cmp r0, #0
	beq _0208B596
	add r1, r7, #0
	bl GetWazaAttr
	add r3, r0, #0
	add r1, r4, #0
	add r1, #0xd
	add r2, r4, #5
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0208BA88
_0208B596:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _0208B56C
	add r0, r5, #0
	bl sub_0208BE70
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0208B55C

	thumb_func_start sub_0208B5A8
sub_0208B5A8: ; 0x0208B5A8
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _0208B6FC ; =0x00000404
	add r5, r0, #0
	mov r4, #0xb
	mov r7, #0
_0208B5B2:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	add r1, r7, #0
	bl sub_0200DCE0
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x13
	bls _0208B5B2
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	beq _0208B5D6
	b _0208B6F8
_0208B5D6:
	ldr r0, _0208B700 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0208B5E4
	cmp r0, #1
	beq _0208B634
	pop {r3, r4, r5, r6, r7, pc}
_0208B5E4:
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE0
	mov r0, #9
	lsl r0, r0, #6
	ldrb r1, [r5, r0]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r1, r0
	bne _0208B60E
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x6c
	mov r2, #0x30
	bl sub_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
_0208B60E:
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5b
	mov r2, #0x30
	bl sub_0200DD88
	ldr r0, _0208B704 ; =0x00000434
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	ldr r0, _0208B704 ; =0x00000434
	mov r1, #0x7d
	ldr r0, [r5, r0]
	mov r2, #0x30
	bl sub_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
_0208B634:
	mov r7, #0x99
	mov r4, #0
	lsl r7, r7, #2
_0208B63A:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, r7]
	cmp r0, #0
	beq _0208B684
	mov r1, #3
	bl GetWazaAttr
	add r3, r0, #0
	add r1, r4, #0
	add r1, #0xd
	add r2, r4, #5
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0208BA88
	lsl r0, r4, #2
	add r6, r5, r0
	ldr r0, _0208B708 ; =0x00000438
	mov r1, #1
	ldr r0, [r6, r0]
	bl sub_0200DCE0
	ldr r0, _0208B708 ; =0x00000438
	lsl r2, r4, #5
	add r2, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r6, r0]
	mov r1, #0x18
	asr r2, r2, #0x10
	bl sub_0200DD88
_0208B684:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _0208B63A
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	beq _0208B6C8
	mov r1, #3
	bl GetWazaAttr
	add r3, r0, #0
	lsl r3, r3, #0x18
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #9
	lsr r3, r3, #0x18
	bl sub_0208BA88
	ldr r0, _0208B70C ; =0x00000448
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	ldr r0, _0208B70C ; =0x00000448
	mov r1, #0x18
	ldr r0, [r5, r0]
	mov r2, #0xa0
	bl sub_0200DD88
	b _0208B6D2
_0208B6C8:
	ldr r0, _0208B70C ; =0x00000448
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE0
_0208B6D2:
	mov r0, #0x43
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0xc8
	mov r2, #0x18
	bl sub_0200DD88
	ldr r0, _0208B704 ; =0x00000434
	mov r1, #0xea
	ldr r0, [r5, r0]
	mov r2, #0x18
	bl sub_0200DD88
	ldr r0, _0208B710 ; =0x0000044C
	mov r1, #0xe8
	ldr r0, [r5, r0]
	mov r2, #0x28
	bl sub_0200DD88
_0208B6F8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208B6FC: .word 0x00000404
_0208B700: .word 0x000007BC
_0208B704: .word 0x00000434
_0208B708: .word 0x00000438
_0208B70C: .word 0x00000448
_0208B710: .word 0x0000044C
	thumb_func_end sub_0208B5A8

	thumb_func_start sub_0208B714
sub_0208B714: ; 0x0208B714
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r7, #0x15
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #6
_0208B720:
	ldr r0, [r4, r7]
	mov r1, #0
	bl sub_02024830
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x19
	blt _0208B720
	mov r4, #0
	ldr r6, _0208B748 ; =0x000005A4
	add r7, r4, #0
_0208B736:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_02024830
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _0208B736
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208B748: .word 0x000005A4
	thumb_func_end sub_0208B714

	thumb_func_start sub_0208B74C
sub_0208B74C: ; 0x0208B74C
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0208B77C ; =0x000005B8
	add r5, r0, #0
	mov r4, #0
	mov r6, #6
_0208B756:
	ldr r0, _0208B77C ; =0x000005B8
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	ldr r0, _0208B77C ; =0x000005B8
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0202484C
	ldr r0, [r5, r7]
	sub r1, r6, r4
	bl sub_02024ADC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _0208B756
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208B77C: .word 0x000005B8
	thumb_func_end sub_0208B74C

	thumb_func_start sub_0208B780
sub_0208B780: ; 0x0208B780
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	ldr r0, [sp, #0x2c]
	add r5, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	str r0, [sp]
	ldr r3, [sp, #0x28]
	add r0, sp, #8
	bl sub_0208B85C
	str r0, [sp, #4]
	lsl r0, r5, #2
	mov r6, #0
	add r4, sp, #8
	add r5, r7, r0
_0208B7A2:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0208B7B2
	ldr r0, [r5]
	mov r1, #0
	bl sub_02024830
	b _0208B808
_0208B7B2:
	cmp r0, #1
	bne _0208B7C8
	ldr r0, [r5]
	mov r1, #1
	bl sub_02024830
	ldr r0, [r5]
	mov r1, #3
	bl sub_020248F0
	b _0208B808
_0208B7C8:
	cmp r0, #2
	bne _0208B7DE
	ldr r0, [r5]
	mov r1, #1
	bl sub_02024830
	ldr r0, [r5]
	mov r1, #0
	bl sub_020248F0
	b _0208B808
_0208B7DE:
	cmp r0, #3
	bne _0208B7F4
	ldr r0, [r5]
	mov r1, #1
	bl sub_02024830
	ldr r0, [r5]
	mov r1, #1
	bl sub_020248F0
	b _0208B808
_0208B7F4:
	cmp r0, #4
	bne _0208B808
	ldr r0, [r5]
	mov r1, #1
	bl sub_02024830
	ldr r0, [r5]
	mov r1, #2
	bl sub_020248F0
_0208B808:
	add r6, r6, #1
	add r4, r4, #1
	add r5, r5, #4
	cmp r6, #5
	blt _0208B7A2
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0208B828
	ldr r0, [sp, #0x30]
	mov r1, #0
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_02024830
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0208B828:
	ble _0208B842
	ldr r0, [sp, #0x30]
	mov r1, #1
	lsl r4, r0, #2
	ldr r0, [r7, r4]
	bl sub_02024830
	ldr r0, [r7, r4]
	mov r1, #4
	bl sub_020248F0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0208B842:
	bge _0208B858
	ldr r0, [sp, #0x30]
	mov r1, #1
	lsl r4, r0, #2
	ldr r0, [r7, r4]
	bl sub_02024830
	ldr r0, [r7, r4]
	mov r1, #5
	bl sub_020248F0
_0208B858:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0208B780

	thumb_func_start sub_0208B85C
sub_0208B85C: ; 0x0208B85C
	push {r3, r4, r5, r6}
	add r3, r3, #2
	mov r4, #0
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	mov r5, #1
	add r6, r4, #0
_0208B86A:
	cmp r4, r1
	ble _0208B872
	strb r6, [r0, r4]
	b _0208B87C
_0208B872:
	cmp r4, r2
	ble _0208B87A
	strb r5, [r0, r4]
	b _0208B87C
_0208B87A:
	strb r3, [r0, r4]
_0208B87C:
	add r4, r4, #1
	cmp r4, #5
	blt _0208B86A
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _0208B88E
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_0208B88E:
	bge _0208B894
	mov r0, #1
	b _0208B896
_0208B894:
	mov r0, #0
_0208B896:
	neg r0, r0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_0208B85C

	thumb_func_start sub_0208B89C
sub_0208B89C: ; 0x0208B89C
	push {r3, r4, r5, lr}
	sub sp, #0x30
	ldr r1, _0208B9C0 ; =0x000007BC
	add r5, r0, #0
	ldrsb r1, [r5, r1]
	cmp r1, #2
	beq _0208B8AC
	b _0208B9B6
_0208B8AC:
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r1, [r1, #0x34]
	cmp r1, #0
	beq _0208B9B6
	bl sub_0208A520
	add r4, r0, #0
	add r0, sp, #0x14
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	add r1, sp, #0x18
	add r0, r4, #0
	add r1, #2
	bl CalcBoxMonPokeathlonPerformance
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	ldrb r0, [r2, #0x11]
	cmp r0, #1
	bne _0208B8E8
	ldr r0, [r2]
	ldrb r2, [r2, #0x14]
	add r1, sp, #0x14
	bl sub_02074670
_0208B8E8:
	add r0, sp, #0xc
	add r1, r4, #0
	add r2, sp, #0x14
	mov r3, #0x13
	bl sub_02073248
	add r3, sp, #0xc
	ldrb r0, [r3, #6]
	mov r1, #0x4f
	str r0, [sp]
	mov r0, #0xc
	ldrsb r0, [r3, r0]
	str r0, [sp, #4]
	mov r0, #0x68
	str r0, [sp, #8]
	ldrh r2, [r3, #0x1e]
	ldrh r3, [r3]
	ldr r0, _0208B9C4 ; =0x00000404
	lsl r2, r2, #0x1a
	lsl r3, r3, #0x11
	add r0, r5, r0
	lsr r2, r2, #0x1d
	lsr r3, r3, #0x1d
	bl sub_0208B780
	add r3, sp, #0xc
	ldrb r0, [r3, #2]
	mov r1, #0x54
	str r0, [sp]
	mov r0, #8
	ldrsb r0, [r3, r0]
	str r0, [sp, #4]
	mov r0, #0x69
	str r0, [sp, #8]
	ldrh r2, [r3, #0xe]
	ldrh r3, [r3]
	ldr r0, _0208B9C4 ; =0x00000404
	lsl r2, r2, #0x1a
	lsl r3, r3, #0x1d
	add r0, r5, r0
	lsr r2, r2, #0x1d
	lsr r3, r3, #0x1d
	bl sub_0208B780
	add r3, sp, #0xc
	ldrb r0, [r3, #4]
	mov r1, #0x59
	str r0, [sp]
	mov r0, #0xa
	ldrsb r0, [r3, r0]
	str r0, [sp, #4]
	mov r0, #0x6a
	str r0, [sp, #8]
	ldrh r2, [r3, #0x16]
	ldrh r3, [r3]
	ldr r0, _0208B9C4 ; =0x00000404
	lsl r2, r2, #0x1a
	lsl r3, r3, #0x17
	add r0, r5, r0
	lsr r2, r2, #0x1d
	lsr r3, r3, #0x1d
	bl sub_0208B780
	add r3, sp, #0xc
	ldrb r0, [r3, #3]
	mov r1, #0x5e
	str r0, [sp]
	mov r0, #9
	ldrsb r0, [r3, r0]
	str r0, [sp, #4]
	mov r0, #0x6b
	str r0, [sp, #8]
	ldrh r2, [r3, #0x12]
	ldrh r3, [r3]
	ldr r0, _0208B9C4 ; =0x00000404
	lsl r2, r2, #0x1a
	lsl r3, r3, #0x1a
	add r0, r5, r0
	lsr r2, r2, #0x1d
	lsr r3, r3, #0x1d
	bl sub_0208B780
	add r3, sp, #0xc
	ldrb r0, [r3, #5]
	mov r1, #0x63
	str r0, [sp]
	mov r0, #0xb
	ldrsb r0, [r3, r0]
	str r0, [sp, #4]
	mov r0, #0x6c
	str r0, [sp, #8]
	ldrh r2, [r3, #0x1a]
	ldrh r3, [r3]
	ldr r0, _0208B9C4 ; =0x00000404
	lsl r2, r2, #0x1a
	lsl r3, r3, #0x14
	add r0, r5, r0
	lsr r2, r2, #0x1d
	lsr r3, r3, #0x1d
	bl sub_0208B780
	add sp, #0x30
	pop {r3, r4, r5, pc}
_0208B9B6:
	add r0, r5, #0
	bl sub_0208B714
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208B9C0: .word 0x000007BC
_0208B9C4: .word 0x00000404
	thumb_func_end sub_0208B89C

	thumb_func_start sub_0208B9C8
sub_0208B9C8: ; 0x0208B9C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0208BA50 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0208BA36
	ldr r0, _0208BA54 ; =0x00000299
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _0208B9FE
	ldr r0, _0208BA58 ; =0x000005CC
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02024830
	mov r4, #0
	ldr r6, _0208BA5C ; =0x000005B8
	add r7, r4, #0
_0208B9EC:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_02024830
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _0208B9EC
	pop {r3, r4, r5, r6, r7, pc}
_0208B9FE:
	mov r7, #0xa5
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_0208BA06:
	add r0, r5, r6
	ldrb r0, [r0, r7]
	cmp r0, #0
	ldr r0, _0208BA5C ; =0x000005B8
	beq _0208BA1A
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
	b _0208BA22
_0208BA1A:
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024830
_0208BA22:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _0208BA06
	ldr r0, _0208BA58 ; =0x000005CC
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_02024830
	pop {r3, r4, r5, r6, r7, pc}
_0208BA36:
	mov r4, #0
	ldr r6, _0208BA5C ; =0x000005B8
	add r7, r4, #0
_0208BA3C:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_02024830
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _0208BA3C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208BA50: .word 0x000007BC
_0208BA54: .word 0x00000299
_0208BA58: .word 0x000005CC
_0208BA5C: .word 0x000005B8
	thumb_func_end sub_0208B9C8

	thumb_func_start sub_0208BA60
sub_0208BA60: ; 0x0208BA60
	push {r4, lr}
	mov r3, #9
	add r4, r0, #0
	lsl r3, r3, #6
	ldrb r3, [r4, r3]
	mov r1, #0xb
	mov r2, #3
	bl sub_0208BA88
	ldr r3, _0208BA84 ; =0x00000241
	add r0, r4, #0
	ldrb r3, [r4, r3]
	mov r1, #0xc
	mov r2, #4
	bl sub_0208BA88
	pop {r4, pc}
	nop
_0208BA84: .word 0x00000241
	thumb_func_end sub_0208BA60

	thumb_func_start sub_0208BA88
sub_0208BA88: ; 0x0208BA88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r3, #0
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020776B4
	str r0, [sp, #8]
	add r0, r7, #0
	bl sub_02077678
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r1, #0xff
	str r6, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [sp, #8]
	bl sub_0200E248
	add r0, r7, #0
	bl sub_0207769C
	add r2, r0, #0
	lsl r0, r4, #2
	add r1, r5, r0
	ldr r0, _0208BAD4 ; =0x00000404
	ldr r0, [r1, r0]
	add r1, r2, #3
	bl sub_0200DD08
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0208BAD4: .word 0x00000404
	thumb_func_end sub_0208BA88

	thumb_func_start sub_0208BAD8
sub_0208BAD8: ; 0x0208BAD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	ldrb r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	lsl r0, r0, #5
	add r0, #0x10
	lsl r0, r0, #0x10
	add r4, r3, #0
	asr r7, r0, #0x10
	mov r6, #0
_0208BAF2:
	ldr r0, _0208BB20 ; =0x00000438
	ldr r1, [sp, #4]
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl sub_0200DE00
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r7, r0
	bne _0208BB0E
	ldr r0, [sp]
	add sp, #8
	strb r6, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_0208BB0E:
	add r0, r6, #1
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	add r5, r5, #4
	cmp r6, #4
	blt _0208BAF2
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208BB20: .word 0x00000438
	thumb_func_end sub_0208BAD8

	thumb_func_start sub_0208BB24
sub_0208BB24: ; 0x0208BB24
	push {r0, r1, r2, r3}
	push {r4, lr}
	sub sp, #8
	add r2, sp, #4
	add r1, sp, #0x14
	add r2, #2
	add r3, sp, #4
	add r4, r0, #0
	bl sub_0208BAD8
	add r2, sp, #0
	add r0, r4, #0
	add r1, sp, #0x18
	add r2, #2
	add r3, sp, #0
	bl sub_0208BAD8
	add r0, sp, #0x10
	ldrb r0, [r0, #4]
	add r3, sp, #0
	mov r2, #0
	add r0, #0xd
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0208BB88 ; =0x00000404
	ldrsh r2, [r3, r2]
	ldr r0, [r1, r0]
	mov r1, #2
	ldrsh r1, [r3, r1]
	bl sub_0200DD88
	add r0, sp, #0x10
	ldrb r0, [r0, #8]
	add r3, sp, #0
	mov r2, #4
	add r0, #0xd
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0208BB88 ; =0x00000404
	ldrsh r2, [r3, r2]
	ldr r0, [r1, r0]
	mov r1, #6
	ldrsh r1, [r3, r1]
	bl sub_0200DD88
	add sp, #8
	pop {r4}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0208BB88: .word 0x00000404
	thumb_func_end sub_0208BB24

	thumb_func_start sub_0208BB8C
sub_0208BB8C: ; 0x0208BB8C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl GetWazaAttr
	add r4, r0, #0
	bl sub_02077830
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02077800
	add r3, r0, #0
	mov r0, #1
	mov r1, #0xff
	str r0, [sp]
	mov r0, #0xa
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl sub_0200E248
	add r0, r4, #0
	bl sub_02077818
	add r1, r0, #0
	ldr r0, _0208BBD8 ; =0x0000044C
	add r1, r1, #3
	ldr r0, [r5, r0]
	bl sub_0200DD08
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208BBD8: .word 0x0000044C
	thumb_func_end sub_0208BB8C

	thumb_func_start sub_0208BBDC
sub_0208BBDC: ; 0x0208BBDC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208BC70 ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x1c
	cmp r2, #4
	beq _0208BBF2
	cmp r2, #5
	beq _0208BC2E
	b _0208BC52
_0208BBF2:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	ldr r0, _0208BC74 ; =0x00000428
	bne _0208BC12
	lsl r2, r2, #5
	add r2, #0x28
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	mov r1, #0x44
	asr r2, r2, #0x10
	bl sub_0200DD88
	b _0208BC22
_0208BC12:
	lsl r2, r2, #5
	add r2, #0x18
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	mov r1, #0x44
	asr r2, r2, #0x10
	bl sub_0200DD88
_0208BC22:
	ldr r0, _0208BC74 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020248F0
	pop {r4, pc}
_0208BC2E:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bne _0208BC6E
	ldr r0, _0208BC74 ; =0x00000428
	mov r1, #0xdc
	ldr r0, [r4, r0]
	mov r2, #0xb0
	bl sub_0200DD88
	ldr r0, _0208BC74 ; =0x00000428
	mov r1, #3
	ldr r0, [r4, r0]
	bl sub_020248F0
	pop {r4, pc}
_0208BC52:
	ldr r0, _0208BC74 ; =0x00000428
	lsl r2, r2, #5
	add r2, #0x18
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	mov r1, #0x44
	asr r2, r2, #0x10
	bl sub_0200DD88
	ldr r0, _0208BC74 ; =0x00000428
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020248F0
_0208BC6E:
	pop {r4, pc}
	.balign 4, 0
_0208BC70: .word 0x000007BD
_0208BC74: .word 0x00000428
	thumb_func_end sub_0208BBDC

	thumb_func_start sub_0208BC78
sub_0208BC78: ; 0x0208BC78
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _0208BCAC ; =0x00000428
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	ldr r0, _0208BCB0 ; =0x0000042C
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, r0]
	bl sub_0200DD88
	ldr r0, _0208BCB0 ; =0x0000042C
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0208BCAC: .word 0x00000428
_0208BCB0: .word 0x0000042C
	thumb_func_end sub_0208BC78

	thumb_func_start sub_0208BCB4
sub_0208BCB4: ; 0x0208BCB4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208BCD0 ; =0x0000042C
	mov r1, #0x44
	ldr r0, [r4, r0]
	mov r2, #0xa8
	bl sub_0200DD88
	ldr r0, _0208BCD0 ; =0x0000042C
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020248F0
	pop {r4, pc}
	.balign 4, 0
_0208BCD0: .word 0x0000042C
	thumb_func_end sub_0208BCB4

	thumb_func_start sub_0208BCD4
sub_0208BCD4: ; 0x0208BCD4
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0x1f
	lsl r2, r2, #6
	mov r1, #0
	strb r1, [r0, r2]
	add r3, r2, #3
	strb r1, [r0, r3]
	add r3, r2, #2
	strb r1, [r0, r3]
	ldr r3, _0208BD30 ; =0x0000027A
	ldrb r3, [r0, r3]
	cmp r3, #0
	bne _0208BCF4
	add r2, r2, #1
	strb r1, [r0, r2]
	b _0208BD0A
_0208BCF4:
	cmp r3, #0xff
	bne _0208BD00
	mov r3, #0xc
	add r1, r2, #1
	strb r3, [r0, r1]
	b _0208BD0A
_0208BD00:
	mov r1, #0xc
	mul r1, r3
	asr r3, r1, #8
	add r1, r2, #1
	strb r3, [r0, r1]
_0208BD0A:
	ldr r7, _0208BD34 ; =0x00000404
	add r5, r0, #0
	mov r4, #0x1d
	add r5, #0x74
	add r6, r7, #0
_0208BD14:
	ldr r0, [r5, r7]
	mov r1, #0
	bl sub_02024830
	ldr r0, [r5, r6]
	mov r1, #0
	bl sub_020249D4
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x28
	bls _0208BD14
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208BD30: .word 0x0000027A
_0208BD34: .word 0x00000404
	thumb_func_end sub_0208BCD4

	thumb_func_start sub_0208BD38
sub_0208BD38: ; 0x0208BD38
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
	mov r7, #1
_0208BD42:
	mov r0, #0x9f
	lsl r0, r0, #2
	ldrh r1, [r6, r0]
	add r0, r7, #0
	lsl r0, r4
	tst r0, r1
	beq _0208BD5E
	mov r0, #0x46
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl sub_020248F0
	b _0208BD6A
_0208BD5E:
	mov r0, #0x46
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020248F0
_0208BD6A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blo _0208BD42
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	lsl r1, r0, #2
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0208BD92
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _0208BD92
	ldr r0, _0208BDC0 ; =0x000004D4
	mov r1, #1
	ldr r0, [r6, r0]
	bl sub_0200DCE0
	b _0208BD9C
_0208BD92:
	ldr r0, _0208BDC0 ; =0x000004D4
	mov r1, #0
	ldr r0, [r6, r0]
	bl sub_0200DCE0
_0208BD9C:
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	lsr r0, r0, #0x1e
	cmp r0, #2
	ldr r0, _0208BDC4 ; =0x000004D8
	bne _0208BDB4
	ldr r0, [r6, r0]
	mov r1, #1
	bl sub_0200DCE0
	pop {r3, r4, r5, r6, r7, pc}
_0208BDB4:
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200DCE0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208BDC0: .word 0x000004D4
_0208BDC4: .word 0x000004D8
	thumb_func_end sub_0208BD38

	thumb_func_start sub_0208BDC8
sub_0208BDC8: ; 0x0208BDC8
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0208BDF8 ; =0x000007BE
	add r5, r0, #0
	mov r4, #0
	mov r6, #1
_0208BDD2:
	add r0, r6, #0
	ldrb r1, [r5, r7]
	lsl r0, r4
	tst r0, r1
	beq _0208BDEA
	lsl r0, r4, #2
	add r1, r5, r0
	ldr r0, _0208BDFC ; =0x000004A8
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl sub_02024830
_0208BDEA:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _0208BDD2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208BDF8: .word 0x000007BE
_0208BDFC: .word 0x000004A8
	thumb_func_end sub_0208BDC8

	thumb_func_start sub_0208BE00
sub_0208BE00: ; 0x0208BE00
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	lsl r0, r2, #2
	add r4, r1, #0
	add r1, r5, r0
	ldr r0, _0208BE6C ; =0x00000404
	ldr r0, [r1, r0]
	bl sub_02024B1C
	mov r1, #2
	bl NNS_G2dGetImageLocation
	add r6, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _0208BE30
	add r0, r4, #0
	bl sub_02074170
	b _0208BE36
_0208BE30:
	add r0, r4, #0
	bl sub_020741B0
_0208BE36:
	add r1, r0, #0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x14
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetCharData
	add r4, r0, #0
	ldr r0, [sp, #4]
	mov r1, #2
	ldr r0, [r0, #0x14]
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r0, [sp, #4]
	mov r2, #2
	ldr r0, [r0, #0x14]
	add r1, r6, #0
	lsl r2, r2, #8
	bl GXS_LoadOBJ
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208BE6C: .word 0x00000404
	thumb_func_end sub_0208BE00

	thumb_func_start sub_0208BE70
sub_0208BE70: ; 0x0208BE70
	push {r4, lr}
	add r4, r0, #0
	bl sub_0208A520
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0x13
	bl sub_0208BE00
	mov r2, #0x8f
	lsl r2, r2, #2
	add r1, r2, #0
	ldrh r0, [r4, r2]
	add r2, #0x44
	add r1, #0x42
	ldr r2, [r4, r2]
	ldrh r1, [r4, r1]
	lsl r2, r2, #3
	lsr r2, r2, #0x1f
	bl sub_02074364
	add r1, r0, #0
	mov r0, #0x45
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, #0xc
	bl sub_0200DD08
	mov r1, #0x8f
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	add r1, #0x42
	ldrh r1, [r4, r1]
	mov r2, #0x1c
	bl GetMonBaseStat_HandleAlternateForme
	add r2, r0, #0
	mov r0, #0x45
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	eor r1, r2
	bl sub_02024890
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208BE70

	thumb_func_start sub_0208BECC
sub_0208BECC: ; 0x0208BECC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0208A520
	add r7, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	ldrb r0, [r1, #0x11]
	cmp r0, #0
	beq _0208BEEC
	cmp r0, #1
	beq _0208BEF8
	cmp r0, #2
	beq _0208BEF2
	b _0208BEFC
_0208BEEC:
	mov r0, #1
	str r0, [sp]
	b _0208BEFC
_0208BEF2:
	mov r0, #0
	str r0, [sp]
	b _0208BEFC
_0208BEF8:
	ldrb r0, [r1, #0x13]
	str r0, [sp]
_0208BEFC:
	ldr r0, [sp]
	mov r4, #0
	cmp r0, #0
	ble _0208BF7A
	add r5, r6, #0
_0208BF06:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	ldrb r0, [r1, #0x11]
	cmp r0, #0
	beq _0208BF1C
	cmp r0, #1
	beq _0208BF4A
	cmp r0, #2
	beq _0208BF36
	b _0208BF64
_0208BF1C:
	add r0, r6, #0
	bl sub_0208A520
	add r7, r0, #0
	bl sub_02074484
	add r1, r0, #0
	ldr r0, _0208BF98 ; =0x00000528
	add r1, #0xc
	ldr r0, [r5, r0]
	bl sub_0200DD08
	b _0208BF64
_0208BF36:
	add r0, r7, #0
	bl sub_02074444
	add r1, r0, #0
	ldr r0, _0208BF98 ; =0x00000528
	add r1, #0xc
	ldr r0, [r5, r0]
	bl sub_0200DD08
	b _0208BF64
_0208BF4A:
	ldr r0, [r1]
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r7, r0, #0
	bl sub_02074484
	add r1, r0, #0
	ldr r0, _0208BF98 ; =0x00000528
	add r1, #0xc
	ldr r0, [r5, r0]
	bl sub_0200DD08
_0208BF64:
	add r2, r4, #0
	add r0, r6, #0
	add r1, r7, #0
	add r2, #0x49
	bl sub_0208BE00
	ldr r0, [sp]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0208BF06
_0208BF7A:
	cmp r4, #6
	bge _0208BF96
	lsl r0, r4, #2
	add r5, r6, r0
	ldr r6, _0208BF98 ; =0x00000528
	mov r7, #0
_0208BF86:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_0200DCE0
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _0208BF86
_0208BF96:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208BF98: .word 0x00000528
	thumb_func_end sub_0208BECC

	thumb_func_start sub_0208BF9C
sub_0208BF9C: ; 0x0208BF9C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _0208BFC4
	ldr r0, _0208BFC8 ; =0x00000528
	mov r1, #0xd7
	ldr r0, [r4, r0]
	mov r2, #0x50
	bl sub_0200DD88
	ldr r0, _0208BFCC ; =0x0000052C
	mov r1, #0xd7
	ldr r0, [r4, r0]
	mov r2, #0x50
	bl sub_0200DD88
_0208BFC4:
	pop {r4, pc}
	nop
_0208BFC8: .word 0x00000528
_0208BFCC: .word 0x0000052C
	thumb_func_end sub_0208BF9C

	thumb_func_start sub_0208BFD0
sub_0208BFD0: ; 0x0208BFD0
	push {r3, r4, r5, lr}
	mov r1, #0x8b
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldrb r1, [r1, #0x11]
	cmp r1, #2
	bne _0208C058
	bl sub_0208A520
	add r4, r0, #0
	ldr r0, _0208C05C ; =0x000007D4
	ldr r0, [r5, r0]
	cmp r0, #0
	ldr r0, _0208C060 ; =0x00000528
	bne _0208C020
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE0
	ldr r0, _0208C064 ; =0x0000052C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x49
	bl sub_0208BE00
	add r0, r4, #0
	bl sub_02074444
	add r1, r0, #0
	ldr r0, _0208C060 ; =0x00000528
	add r1, #0xc
	ldr r0, [r5, r0]
	bl sub_0200DD08
	b _0208C04E
_0208C020:
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE0
	ldr r0, _0208C064 ; =0x0000052C
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0200DCE0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x4a
	bl sub_0208BE00
	add r0, r4, #0
	bl sub_02074444
	add r1, r0, #0
	ldr r0, _0208C064 ; =0x0000052C
	add r1, #0xc
	ldr r0, [r5, r0]
	bl sub_0200DD08
_0208C04E:
	ldr r1, _0208C05C ; =0x000007D4
	mov r0, #1
	ldr r2, [r5, r1]
	eor r0, r2
	str r0, [r5, r1]
_0208C058:
	pop {r3, r4, r5, pc}
	nop
_0208C05C: .word 0x000007D4
_0208C060: .word 0x00000528
_0208C064: .word 0x0000052C
	thumb_func_end sub_0208BFD0

	thumb_func_start sub_0208C068
sub_0208C068: ; 0x0208C068
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208C0A0 ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _0208C084
	mov r0, #0x45
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0xa0
	mov r2, #0x10
	bl sub_0200DD88
	b _0208C092
_0208C084:
	mov r0, #0x45
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x20
	mov r2, #0x44
	bl sub_0200DD88
_0208C092:
	mov r0, #0x45
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE0
	pop {r4, pc}
	.balign 4, 0
_0208C0A0: .word 0x000007BC
	thumb_func_end sub_0208C068

	thumb_func_start sub_0208C0A4
sub_0208C0A4: ; 0x0208C0A4
	push {r4, lr}
	add r4, r2, #0
	cmp r4, r1
	ble _0208C0CA
	add r0, #0x2c
	sub r1, r4, r1
	mul r1, r0
	lsl r0, r1, #0x10
	mov r1, #0x4b
	lsl r1, r1, #2
	bl _u32_div_f
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	sub r0, r4, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r4, pc}
_0208C0CA:
	add r0, #0x2c
	sub r1, r1, r4
	mul r1, r0
	lsl r0, r1, #0x10
	mov r1, #0x4b
	lsl r1, r1, #2
	bl _u32_div_f
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r0, r4, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r4, pc}
	thumb_func_end sub_0208C0A4

	thumb_func_start sub_0208C0E8
sub_0208C0E8: ; 0x0208C0E8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0208C1EC ; =0x00000275
	mov r1, #0x58
	ldrb r0, [r4, r0]
	add r2, r1, #0
	bl sub_0208C0A4
	add r5, r0, #0
	ldr r0, _0208C1EC ; =0x00000275
	mov r1, #0x31
	ldrb r0, [r4, r0]
	mov r2, #0x49
	bl sub_0208C0A4
	add r2, r0, #0
	mov r0, #0x13
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl sub_0200DD88
	ldr r0, _0208C1F0 ; =0x00000276
	mov r1, #0x6e
	ldrb r0, [r4, r0]
	mov r2, #0x58
	bl sub_0208C0A4
	add r5, r0, #0
	ldr r0, _0208C1F0 ; =0x00000276
	mov r1, #0x41
	ldrb r0, [r4, r0]
	mov r2, #0x49
	bl sub_0208C0A4
	add r2, r0, #0
	ldr r0, _0208C1F4 ; =0x000004C4
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl sub_0200DD88
	ldr r0, _0208C1F8 ; =0x00000277
	mov r1, #0x67
	ldrb r0, [r4, r0]
	mov r2, #0x58
	bl sub_0208C0A4
	add r5, r0, #0
	ldr r0, _0208C1F8 ; =0x00000277
	mov r1, #0x5c
	ldrb r0, [r4, r0]
	mov r2, #0x49
	bl sub_0208C0A4
	add r2, r0, #0
	ldr r0, _0208C1FC ; =0x000004C8
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl sub_0200DD88
	mov r0, #0x9e
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	mov r1, #0x48
	mov r2, #0x57
	bl sub_0208C0A4
	add r5, r0, #0
	mov r0, #0x9e
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	mov r1, #0x5c
	mov r2, #0x49
	bl sub_0208C0A4
	add r2, r0, #0
	ldr r0, _0208C200 ; =0x000004CC
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl sub_0200DD88
	ldr r0, _0208C204 ; =0x00000279
	mov r1, #0x41
	ldrb r0, [r4, r0]
	mov r2, #0x57
	bl sub_0208C0A4
	add r5, r0, #0
	ldr r0, _0208C204 ; =0x00000279
	mov r1, #0x41
	ldrb r0, [r4, r0]
	mov r2, #0x49
	bl sub_0208C0A4
	add r2, r0, #0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl sub_0200DD88
	mov r0, #0x13
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
	ldr r0, _0208C1F4 ; =0x000004C4
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _0208C1FC ; =0x000004C8
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _0208C200 ; =0x000004CC
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024830
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024830
	pop {r3, r4, r5, pc}
	nop
_0208C1EC: .word 0x00000275
_0208C1F0: .word 0x00000276
_0208C1F4: .word 0x000004C4
_0208C1F8: .word 0x00000277
_0208C1FC: .word 0x000004C8
_0208C200: .word 0x000004CC
_0208C204: .word 0x00000279
	thumb_func_end sub_0208C0E8

	thumb_func_start sub_0208C208
sub_0208C208: ; 0x0208C208
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x13
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024830
	ldr r0, _0208C244 ; =0x000004C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _0208C248 ; =0x000004C8
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	ldr r0, _0208C24C ; =0x000004CC
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_02024830
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024830
	pop {r4, pc}
	.balign 4, 0
_0208C244: .word 0x000004C4
_0208C248: .word 0x000004C8
_0208C24C: .word 0x000004CC
	thumb_func_end sub_0208C208

	thumb_func_start sub_0208C250
sub_0208C250: ; 0x0208C250
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #1
	add r4, r2, #0
	bl sub_0208E55C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0x19
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x27
	bl sub_0200E248
	add r0, r6, #0
	mov r1, #2
	bl sub_0208E55C
	add r4, #0x36
	add r2, r0, #0
	lsl r0, r4, #2
	add r1, r5, r0
	ldr r0, _0208C29C ; =0x00000404
	ldr r0, [r1, r0]
	add r1, r2, #7
	bl sub_0200DD08
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208C29C: .word 0x00000404
	thumb_func_end sub_0208C250

	thumb_func_start sub_0208C2A0
sub_0208C2A0: ; 0x0208C2A0
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _0208C30C ; =0x00000404
	add r5, r0, #0
	mov r4, #0x36
	mov r7, #0
_0208C2AA:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	add r1, r7, #0
	bl sub_02024830
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x42
	bls _0208C2AA
	ldr r0, _0208C310 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #2
	bne _0208C30A
	ldr r7, _0208C314 ; =0x000004DC
	ldr r6, _0208C318 ; =0x000007C6
	mov r4, #0
_0208C2CE:
	ldrb r0, [r5, r6]
	cmp r4, r0
	bge _0208C2F6
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r7]
	mov r1, #1
	bl sub_02024830
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0208ACDC
	lsl r2, r4, #0x18
	add r1, r0, #0
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0208C250
_0208C2F6:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #9
	blo _0208C2CE
	ldr r0, _0208C31C ; =0x0000050C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020248F0
_0208C30A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C30C: .word 0x00000404
_0208C310: .word 0x000007BC
_0208C314: .word 0x000004DC
_0208C318: .word 0x000007C6
_0208C31C: .word 0x0000050C
	thumb_func_end sub_0208C2A0

	thumb_func_start sub_0208C320
sub_0208C320: ; 0x0208C320
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0208C378 ; =0x000007C5
	add r5, r0, #0
	mov r4, #0
	add r6, r7, #1
_0208C32A:
	ldrb r1, [r5, r7]
	lsl r0, r1, #3
	add r0, r1, r0
	add r1, r4, r0
	ldrb r0, [r5, r6]
	cmp r1, r0
	bge _0208C35E
	lsl r0, r4, #2
	add r1, r5, r0
	ldr r0, _0208C37C ; =0x000004DC
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024830
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0208ACDC
	lsl r2, r4, #0x18
	add r1, r0, #0
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0208C250
	b _0208C36C
_0208C35E:
	lsl r0, r4, #2
	add r1, r5, r0
	ldr r0, _0208C37C ; =0x000004DC
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_02024830
_0208C36C:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #9
	blo _0208C32A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C378: .word 0x000007C5
_0208C37C: .word 0x000004DC
	thumb_func_end sub_0208C320

	thumb_func_start sub_0208C380
sub_0208C380: ; 0x0208C380
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0208C3BC ; =0x000007C4
	mov r1, #3
	ldrb r6, [r5, r0]
	add r0, r6, #0
	bl _s32_div_f
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #3
	bl _s32_div_f
	add r2, r0, #0
	mov r3, #0x28
	mov r0, #5
	lsl r1, r4, #5
	mul r3, r2
	lsl r0, r0, #8
	add r1, #0x20
	add r3, #0x18
	lsl r1, r1, #0x10
	lsl r2, r3, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	pop {r4, r5, r6, pc}
	nop
_0208C3BC: .word 0x000007C4
	thumb_func_end sub_0208C380

	thumb_func_start sub_0208C3C0
sub_0208C3C0: ; 0x0208C3C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208C3E0 ; =0x0000050C
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #1
	bne _0208C3DC
	ldr r0, _0208C3E0 ; =0x0000050C
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
_0208C3DC:
	pop {r4, pc}
	nop
_0208C3E0: .word 0x0000050C
	thumb_func_end sub_0208C3C0

	thumb_func_start sub_0208C3E4
sub_0208C3E4: ; 0x0208C3E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r5, #0
	add r4, r7, #4
_0208C3EC:
	ldr r2, _0208C428 ; =_02104D94
	lsl r6, r5, #4
	lsl r3, r5, #3
	ldr r0, [r7]
	add r1, r4, r6
	add r2, r2, r3
	bl AddWindow
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x22
	blo _0208C3EC
	add r0, r7, #0
	bl sub_0208C9A4
	add r0, r7, #0
	bl sub_0208C57C
	add r0, r7, #0
	bl sub_0208C614
	add r0, r7, #0
	bl sub_0208C6B4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C428: .word _02104D94
	thumb_func_end sub_0208C3E4

	thumb_func_start sub_0208C42C
sub_0208C42C: ; 0x0208C42C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _0208C4D0 ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #3
	bhi _0208C4CE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208C444: ; jump table
	.short _0208C44C - _0208C444 - 2 ; case 0
	.short _0208C458 - _0208C444 - 2 ; case 1
	.short _0208C464 - _0208C444 - 2 ; case 2
	.short _0208C470 - _0208C444 - 2 ; case 3
_0208C44C:
	mov r0, #0x8a
	mov r1, #8
	lsl r0, r0, #2
	ldr r7, _0208C4D4 ; =_02104CC4
	str r1, [r4, r0]
	b _0208C48C
_0208C458:
	mov r0, #0x8a
	mov r1, #0x12
	lsl r0, r0, #2
	ldr r7, _0208C4D8 ; =_02104D04
	str r1, [r4, r0]
	b _0208C48C
_0208C464:
	mov r0, #0x8a
	mov r1, #8
	lsl r0, r0, #2
	ldr r7, _0208C4DC ; =_02104C84
	str r1, [r4, r0]
	b _0208C48C
_0208C470:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #3
	beq _0208C480
	cmp r0, #4
	bne _0208C4CE
_0208C480:
	mov r0, #0x8a
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0208C48C
_0208C48A:
	pop {r3, r4, r5, r6, r7, pc}
_0208C48C:
	mov r1, #0x8a
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r0, #0x13
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl AllocWindows
	mov r1, #0x89
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #4
	ldr r0, [r4, r0]
	mov r5, #0
	cmp r0, #0
	bls _0208C4CE
	add r6, r5, #0
_0208C4AE:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, [r4]
	add r1, r1, r6
	add r2, r7, #0
	bl AddWindow
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r5, r5, #1
	add r7, #8
	add r6, #0x10
	cmp r5, r0
	blo _0208C4AE
_0208C4CE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C4D0: .word 0x000007BC
_0208C4D4: .word _02104CC4
_0208C4D8: .word _02104D04
_0208C4DC: .word _02104C84
	thumb_func_end sub_0208C42C

	thumb_func_start sub_0208C4E0
sub_0208C4E0: ; 0x0208C4E0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _0208C55C ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #3
	bhi _0208C55A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208C4F8: ; jump table
	.short _0208C500 - _0208C4F8 - 2 ; case 0
	.short _0208C500 - _0208C4F8 - 2 ; case 1
	.short _0208C52A - _0208C4F8 - 2 ; case 2
	.short _0208C536 - _0208C4F8 - 2 ; case 3
_0208C500:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r6, #0
	cmp r0, #0
	bls _0208C548
	mov r7, #0x8a
	add r5, r6, #0
	lsl r7, r7, #2
_0208C512:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r4, r7]
	add r6, r6, #1
	add r5, #0x10
	cmp r6, r0
	blo _0208C512
	b _0208C548
_0208C52A:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ClearWindowTilemapAndCopyToVram
	b _0208C548
_0208C536:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #3
	beq _0208C548
	cmp r0, #4
	beq _0208C548
	pop {r3, r4, r5, r6, r7, pc}
_0208C548:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0201D54C
_0208C55A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C55C: .word 0x000007BC
	thumb_func_end sub_0208C4E0

	thumb_func_start sub_0208C560
sub_0208C560: ; 0x0208C560
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0208C4E0
	mov r4, #0
	add r5, r5, #4
_0208C56C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x22
	blo _0208C56C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208C560

	thumb_func_start sub_0208C57C
sub_0208C57C: ; 0x0208C57C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r4, #0x85
	add r5, r0, #0
	lsl r4, r4, #2
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	add r2, r4, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208C60C ; =0x000E0F00
	add r2, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r4
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r0, #0x2e
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	bne _0208C600
	add r0, r0, #1
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	bne _0208C5E0
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #1
	bl ReadMsgDataIntoString
	mov r2, #0xc1
	add r0, r5, #0
	add r1, r5, r4
	lsl r2, r2, #0xa
	mov r3, #1
	bl sub_0208C778
	b _0208C600
_0208C5E0:
	cmp r0, #1
	bne _0208C600
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #2
	bl ReadMsgDataIntoString
	ldr r2, _0208C610 ; =0x00050600
	add r0, r5, #0
	add r1, r5, r4
	mov r3, #1
	bl sub_0208C778
_0208C600:
	add r0, r5, r4
	bl sub_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0208C60C: .word 0x000E0F00
_0208C610: .word 0x00050600
	thumb_func_end sub_0208C57C

	thumb_func_start sub_0208C614
sub_0208C614: ; 0x0208C614
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r6, #0x81
	add r5, r0, #0
	lsl r6, r6, #2
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r0, #0x7c
	ldr r0, [r5, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	bne _0208C69C
	mov r0, #5
	str r0, [sp]
	ldr r0, _0208C6A8 ; =0x0000079C
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r5, r6
	mov r3, #0
	bl sub_0200CDAC
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	add r2, r6, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, #0x3e
	ldrb r2, [r5, r2]
	ldr r0, _0208C6AC ; =0x000007A8
	mov r3, #3
	lsl r2, r2, #0x19
	ldr r0, [r5, r0]
	lsr r2, r2, #0x19
	bl BufferIntegerAsString
	ldr r1, _0208C6AC ; =0x000007A8
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	lsl r0, r6, #7
	str r0, [sp, #8]
	ldr r2, _0208C6B0 ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r6
	mov r3, #0x10
	bl AddTextPrinterParameterized2
_0208C69C:
	add r0, r5, r6
	bl sub_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0208C6A8: .word 0x0000079C
_0208C6AC: .word 0x000007A8
_0208C6B0: .word 0x000007AC
	thumb_func_end sub_0208C614

	thumb_func_start sub_0208C6B4
sub_0208C6B4: ; 0x0208C6B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0208C730 ; =0x0000023E
	ldrh r2, [r5, r0]
	cmp r2, #0
	beq _0208C6FA
	ldr r0, _0208C734 ; =0x000007A8
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferItemName
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #5
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _0208C734 ; =0x000007A8
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0208C70A
_0208C6FA:
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #6
	bl ReadMsgDataIntoString
_0208C70A:
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r2, _0208C738 ; =0x00010200
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #0
	bl sub_0208C778
	add r0, r5, #0
	add r0, #0x64
	bl sub_0201D5C8
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
	pop {r3, r4, r5, pc}
	nop
_0208C730: .word 0x0000023E
_0208C734: .word 0x000007A8
_0208C738: .word 0x00010200
	thumb_func_end sub_0208C6B4

	thumb_func_start sub_0208C73C
sub_0208C73C: ; 0x0208C73C
	push {r4, lr}
	mov r3, #0x8b
	lsl r3, r3, #2
	add r1, r0, #0
	add r2, r3, #0
	add r2, #0x18
	ldr r0, [r1, r3]
	ldr r4, [r1, r2]
	ldr r2, [r0, #0xc]
	cmp r4, r2
	bne _0208C774
	add r2, r3, #0
	add r2, #0x48
	ldrb r2, [r1, r2]
	ldrb r0, [r0, #0x10]
	cmp r2, r0
	bne _0208C774
	mov r2, #0x7b
	add r3, #0xc
	lsl r2, r2, #4
	ldr r0, [r1, r3]
	ldr r1, [r1, r2]
	bl StringCompare
	cmp r0, #0
	bne _0208C774
	mov r0, #1
	pop {r4, pc}
_0208C774:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0208C73C

	thumb_func_start sub_0208C778
sub_0208C778: ; 0x0208C778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	cmp r3, #0
	beq _0208C790
	cmp r3, #1
	beq _0208C794
	cmp r3, #2
	beq _0208C7B6
	b _0208C7DA
_0208C790:
	mov r3, #0
	b _0208C7DA
_0208C794:
	ldr r1, _0208C7F4 ; =0x000007AC
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	bl sub_02002F30
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	bl GetWindowWidth
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	sub r0, r0, r5
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	b _0208C7DA
_0208C7B6:
	ldr r1, _0208C7F4 ; =0x000007AC
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	bl sub_02002F30
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	bl GetWindowWidth
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	sub r1, r0, r5
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0x17
	lsr r3, r0, #0x18
_0208C7DA:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r2, _0208C7F4 ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C7F4: .word 0x000007AC
	thumb_func_end sub_0208C778

	thumb_func_start sub_0208C7F8
sub_0208C7F8: ; 0x0208C7F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0208C83C ; =0x00000263
	add r6, r1, #0
	ldrb r1, [r5, r0]
	ldr r4, _0208C840 ; =0x000E0F00
	lsl r0, r1, #2
	add r1, r1, r0
	ldr r0, _0208C844 ; =_020FF639
	add r0, r0, r1
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bge _0208C816
	ldr r4, _0208C848 ; =0x000E0800
	b _0208C81A
_0208C816:
	ble _0208C81A
	ldr r4, _0208C84C ; =0x000E0700
_0208C81A:
	mov r3, #0x7a
	lsl r3, r3, #4
	ldr r0, [r5, r3]
	add r3, #0xc
	add r1, r2, #0
	ldr r2, [r5, r3]
	bl ReadMsgDataIntoString
	add r2, r5, #4
	lsl r1, r6, #4
	add r1, r2, r1
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0208C778
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208C83C: .word 0x00000263
_0208C840: .word 0x000E0F00
_0208C844: .word _020FF639
_0208C848: .word 0x000E0800
_0208C84C: .word 0x000E0700
	thumb_func_end sub_0208C7F8

	thumb_func_start sub_0208C850
sub_0208C850: ; 0x0208C850
	push {r4, r5, r6, lr}
	add r6, r3, #0
	mov r3, #0x7a
	add r5, r0, #0
	lsl r3, r3, #4
	ldr r0, [r5, r3]
	add r4, r1, #0
	add r3, #0xc
	add r1, r2, #0
	ldr r2, [r5, r3]
	bl ReadMsgDataIntoString
	add r2, r5, #4
	lsl r1, r4, #4
	add r1, r2, r1
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r2, r6, #0
	bl sub_0208C778
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208C850

	thumb_func_start sub_0208C87C
sub_0208C87C: ; 0x0208C87C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r2, #0
	add r7, r3, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	mov r1, #0
	add r2, r6, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0208C8C4 ; =0x000007A8
	add r3, r7, #0
	ldr r0, [r5, r0]
	bl BufferIntegerAsString
	ldr r1, _0208C8C4 ; =0x000007A8
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208C8C4: .word 0x000007A8
	thumb_func_end sub_0208C87C

	thumb_func_start sub_0208C8C8
sub_0208C8C8: ; 0x0208C8C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	str r3, [sp, #0x10]
	mov r0, #0x89
	mov r3, #0x7a
	lsl r0, r0, #2
	lsl r7, r1, #4
	lsl r3, r3, #4
	ldr r5, [r4, r0]
	ldr r0, [r4, r3]
	add r3, #0xc
	add r1, r2, #0
	ldr r2, [r4, r3]
	bl ReadMsgDataIntoString
	ldr r1, _0208C99C ; =0x000007AC
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	bl sub_02002F30
	add r1, sp, #0x48
	ldrb r2, [r1]
	lsr r1, r0, #1
	sub r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	add r0, r1, r0
	str r1, [sp, #0x14]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	add r0, sp, #0x4c
	ldrb r0, [r0]
	mov r1, #0
	ldr r2, _0208C99C ; =0x000007AC
	str r0, [sp, #0x1c]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208C9A0 ; =0x00010200
	ldr r3, [sp, #0x14]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r5, r7
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp]
	add r3, sp, #0x28
	ldrh r2, [r3, #0x14]
	ldrb r3, [r3, #0x1c]
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	bl sub_0208C87C
	ldr r1, _0208C99C ; =0x000007AC
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	bl sub_02002F30
	mov ip, r0
	ldr r0, [sp, #0x1c]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208C9A0 ; =0x00010200
	ldr r2, _0208C99C ; =0x000007AC
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r3, [sp, #0x14]
	mov r6, ip
	ldr r2, [r4, r2]
	add r0, r5, r7
	sub r3, r3, r6
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp]
	add r3, sp, #0x28
	ldrh r2, [r3, #0x18]
	ldrb r3, [r3, #0x1c]
	ldr r1, [sp, #0x38]
	add r0, r4, #0
	bl sub_0208C87C
	ldr r0, [sp, #0x1c]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208C9A0 ; =0x00010200
	ldr r2, _0208C99C ; =0x000007AC
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	ldr r3, [sp, #0x18]
	add r0, r5, r7
	bl AddTextPrinterParameterized2
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208C99C: .word 0x000007AC
_0208C9A0: .word 0x00010200
	thumb_func_end sub_0208C8C8

	thumb_func_start sub_0208C9A4
sub_0208C9A4: ; 0x0208C9A4
	push {r4, lr}
	sub sp, #0x10
	ldr r3, _0208CBC8 ; =0x000E0F00
	mov r1, #0
	mov r2, #7
	add r4, r0, #0
	str r1, [sp]
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x17
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #2
	mov r2, #0x6d
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x7e
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #4
	mov r2, #0x80
	bl sub_0208C850
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _0208CA14
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #5
	mov r2, #0x9d
	bl sub_0208C850
	b _0208CA1E
_0208CA14:
	add r0, r4, #0
	add r0, #0x54
	mov r1, #0
	bl FillWindowPixelBuffer
_0208CA1E:
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #6
	mov r2, #4
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #7
	mov r2, #8
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #8
	mov r2, #0xa
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #9
	mov r2, #0xc
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0xd
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0xf
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0x11
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0x13
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0x6e
	bl sub_0208C850
	mov r3, #0
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0x6f
	str r3, [sp]
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0x70
	mov r3, #1
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0x71
	mov r3, #3
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0x72
	mov r3, #4
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #0x73
	mov r3, #2
	bl sub_0208C7F8
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0x74
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0208CBC8 ; =0x000E0F00
	add r2, #0x55
	str r0, [sp, #8]
	add r0, r4, r2
	ldr r2, _0208CBCC ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	mov r3, #3
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0x92
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r0, _0208CBC8 ; =0x000E0F00
	ldr r2, _0208CBCC ; =0x000007AC
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r1, #0x75
	add r0, r4, r1
	ldr r2, [r4, r2]
	mov r1, #4
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0x95
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x19
	mov r2, #0x93
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x1a
	mov r2, #0x94
	bl sub_0208C850
	mov r0, #2
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x1b
	mov r2, #0xa2
	bl sub_0208C850
	mov r0, #2
	str r0, [sp]
	ldr r3, _0208CBD0 ; =0x00010200
	add r0, r4, #0
	mov r1, #0x1c
	mov r2, #0xa0
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBD0 ; =0x00010200
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #0xb6
	bl sub_0208C850
	mov r0, #0
	str r0, [sp]
	ldr r3, _0208CBC8 ; =0x000E0F00
	add r0, r4, #0
	mov r1, #0x1e
	mov r2, #0xb3
	bl sub_0208C850
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0208CBC8: .word 0x000E0F00
_0208CBCC: .word 0x000007AC
_0208CBD0: .word 0x00010200
	thumb_func_end sub_0208C9A4

	thumb_func_start sub_0208CBD4
sub_0208CBD4: ; 0x0208CBD4
	push {r4, lr}
	sub sp, #0x10
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r0, #2
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x16
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r2, #0
	ldr r0, [r4]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r0, #1
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r2, #0
	ldr r0, [r4]
	mov r1, #4
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, _0208CC84 ; =0x000007BC
	ldrsb r0, [r4, r0]
	cmp r0, #3
	bhi _0208CC7E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208CC40: ; jump table
	.short _0208CC48 - _0208CC40 - 2 ; case 0
	.short _0208CC58 - _0208CC40 - 2 ; case 1
	.short _0208CC68 - _0208CC40 - 2 ; case 2
	.short _0208CC78 - _0208CC40 - 2 ; case 3
_0208CC48:
	add r0, r4, #0
	bl sub_0208CC88
	add r0, r4, #0
	bl sub_0208D0A4
	add sp, #0x10
	pop {r4, pc}
_0208CC58:
	add r0, r4, #0
	bl sub_0208D178
	add r0, r4, #0
	bl sub_0208D474
	add sp, #0x10
	pop {r4, pc}
_0208CC68:
	add r0, r4, #0
	bl sub_0208D520
	add r0, r4, #0
	bl sub_0208D6B8
	add sp, #0x10
	pop {r4, pc}
_0208CC78:
	add r0, r4, #0
	bl sub_0208D728
_0208CC7E:
	add sp, #0x10
	pop {r4, pc}
	nop
_0208CC84: .word 0x000007BC
	thumb_func_end sub_0208CBD4

	thumb_func_start sub_0208CC88
sub_0208CC88: ; 0x0208CC88
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	beq _0208CD34
	add r0, r4, #4
	bl sub_0201D8E4
	add r0, r4, #0
	add r0, #0x74
	bl sub_0201D8E4
	add r0, r4, #0
	add r0, #0x84
	bl sub_0201D8E4
	add r0, r4, #0
	add r0, #0x94
	bl sub_0201D8E4
	add r0, r4, #0
	add r0, #0xa4
	bl sub_0201D8E4
	add r0, r4, #0
	add r0, #0xb4
	bl sub_0201D8E4
	add r0, r4, #0
	add r0, #0xc4
	bl sub_0201D8E4
	add r0, r4, #0
	add r0, #0xd4
	bl sub_0201D8E4
	add r0, r4, #0
	add r0, #0xe4
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x30
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x40
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x50
	bl sub_0201D8E4
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0208CD34:
	add r0, r4, #4
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0x74
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0x84
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0x94
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0xa4
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0xb4
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0xc4
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0xd4
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0xe4
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x10
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x20
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x30
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x10
	ldrh r1, [r4, r1]
	ldr r0, [r0, #0x1c]
	bl sub_02074930
	add r2, r0, #0
	beq _0208CDF0
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #9
	mov r3, #3
	bl sub_0208C87C
	b _0208CE00
_0208CDF0:
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0x16
	bl ReadMsgDataIntoString
_0208CE00:
	mov r1, #0xa
	lsl r1, r1, #6
	ldr r0, [r4, r1]
	lsl r0, r0, #2
	lsr r0, r0, #0x1f
	bne _0208CE1C
	sub r1, #0x5c
	ldr r1, [r4, r1]
	ldr r2, _0208CFA8 ; =0x00010200
	add r0, r4, #0
	mov r3, #2
	bl sub_0208C778
	b _0208CE2A
_0208CE1C:
	sub r1, #0x5c
	ldr r1, [r4, r1]
	ldr r2, _0208CFAC ; =0x00050600
	add r0, r4, #0
	mov r3, #2
	bl sub_0208C778
_0208CE2A:
	mov r1, #0x23
	lsl r1, r1, #4
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	mov r3, #0x48
	bl sub_020030A0
	mov r1, #0
	add r3, r0, #0
	mov r2, #0x89
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208CFA8 ; =0x00010200
	lsl r2, r2, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	add r0, #0x10
	bl AddTextPrinterParameterized2
	mov r1, #0x9d
	lsl r1, r1, #2
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _0208CE96
	sub r1, #0x3c
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	mov r3, #0x48
	bl sub_020030A0
	mov r1, #0
	add r3, r0, #0
	mov r2, #0x89
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	add r2, #0x14
	ldr r2, [r4, r2]
	add r0, #0x20
	bl AddTextPrinterParameterized2
	b _0208CEC4
_0208CE96:
	sub r1, #0x3c
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	mov r3, #0x48
	bl sub_020030A0
	mov r1, #0
	add r3, r0, #0
	mov r2, #0x89
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208CFAC ; =0x00050600
	lsl r2, r2, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, r2]
	add r2, #0x14
	ldr r2, [r4, r2]
	add r0, #0x20
	bl AddTextPrinterParameterized2
_0208CEC4:
	mov r0, #2
	mov r2, #0x91
	str r0, [sp]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r4, #0
	lsl r2, r2, #0x10
	mov r1, #0x10
	lsr r2, r2, #0x10
	mov r3, #5
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208CFA8 ; =0x00010200
	add r0, r4, #0
	add r1, #0x30
	mov r3, #2
	bl sub_0208C778
	mov r0, #0
	mov r2, #0x92
	str r0, [sp]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x12
	mov r3, #7
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208CFA8 ; =0x00010200
	add r0, r4, #0
	add r1, #0x40
	mov r3, #1
	bl sub_0208C778
	ldr r3, _0208CFB0 ; =0x00000242
	ldrb r0, [r4, r3]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	cmp r0, #0x64
	bhs _0208CF3C
	mov r0, #0
	add r2, r3, #0
	str r0, [sp]
	add r2, #0xe
	ldr r5, [r4, r2]
	add r2, r3, #6
	ldr r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x15
	sub r2, r5, r2
	mov r3, #7
	bl sub_0208C87C
	b _0208CF4A
_0208CF3C:
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x15
	mov r3, #7
	str r2, [sp]
	bl sub_0208C87C
_0208CF4A:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208CFA8 ; =0x00010200
	add r0, r4, #0
	add r1, #0x50
	mov r3, #1
	bl sub_0208C778
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x30
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x40
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x50
	bl sub_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0208CFA8: .word 0x00010200
_0208CFAC: .word 0x00050600
_0208CFB0: .word 0x00000242
	thumb_func_end sub_0208CC88

	thumb_func_start sub_0208CFB4
sub_0208CFB4: ; 0x0208CFB4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0x13
	bl sub_0208E600
	add r4, r0, #0
	ldr r2, [r4, #0x18]
	cmp r2, #0
	beq _0208CFE8
	ldr r0, [r4, #0x14]
	mov r1, #0
	sub r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D074 ; =0x00010200
	mov r3, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0208CFE8:
	ldr r2, [r4, #0x20]
	cmp r2, #0
	beq _0208D00A
	ldr r0, [r4, #0x1c]
	mov r1, #0
	sub r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D074 ; =0x00010200
	mov r3, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0208D00A:
	ldr r2, [r4, #0x28]
	cmp r2, #0
	beq _0208D02C
	ldr r0, [r4, #0x24]
	mov r1, #0
	sub r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D074 ; =0x00010200
	mov r3, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0208D02C:
	ldr r2, [r4, #0x38]
	cmp r2, #0
	beq _0208D04E
	ldr r0, [r4, #0x34]
	mov r1, #0
	sub r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D074 ; =0x00010200
	mov r3, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0208D04E:
	mov r0, #5
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #1
	mov r3, #0x10
	bl FillBgTilemapRect
	add r0, r4, #0
	bl sub_0208E994
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0208D074: .word 0x00010200
	thumb_func_end sub_0208CFB4

	thumb_func_start sub_0208D078
sub_0208D078: ; 0x0208D078
	push {r3, r4, r5, r6}
	ldr r6, _0208D0A0 ; =0x00000299
	sub r1, r6, #1
	ldrb r4, [r0, r1]
	sub r1, r6, #2
	ldrb r3, [r0, r1]
	sub r1, r6, #3
	ldrb r2, [r0, r1]
	sub r1, r6, #5
	ldrb r5, [r0, r6]
	sub r6, r6, #4
	ldrb r1, [r0, r1]
	ldrb r0, [r0, r6]
	add r0, r1, r0
	add r0, r2, r0
	add r0, r3, r0
	add r0, r4, r0
	add r0, r5, r0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0208D0A0: .word 0x00000299
	thumb_func_end sub_0208D078

	thumb_func_start sub_0208D0A4
sub_0208D0A4: ; 0x0208D0A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x14
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0x60
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0208A520
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0208C73C
	add r7, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrb r1, [r1, #0x11]
	cmp r1, #2
	bne _0208D102
	mov r0, #0x13
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r0, #0x60
	add r2, r7, #0
	bl sub_0208CFB4
	add r0, r4, #0
	bl FreeToHeap
	b _0208D110
_0208D102:
	sub r0, #8
	ldr r0, [r5, r0]
	add r1, r6, #0
	add r0, #0x60
	add r2, r7, #0
	bl sub_0208CFB4
_0208D110:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x60
	bl sub_0201D5C8
	add r0, r5, #0
	bl sub_0208D078
	cmp r0, #0
	beq _0208D170
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0x70
	bl FillWindowPixelBuffer
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0xc0
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	ldr r0, _0208D174 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r4, #0
	add r0, #0x70
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x70
	bl sub_0201D5C8
	add r0, r4, #0
	bl String_dtor
_0208D170:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208D174: .word 0x00010200
	thumb_func_end sub_0208D0A4

	thumb_func_start sub_0208D178
sub_0208D178: ; 0x0208D178
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r3, #0
	mov r1, #0x10
	mov r2, #0x6f
	add r4, r0, #0
	str r3, [sp]
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0x70
	mov r3, #1
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0x71
	mov r3, #3
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0x72
	mov r3, #4
	bl sub_0208C7F8
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #0x73
	mov r3, #2
	bl sub_0208C7F8
	add r0, r4, #0
	add r0, #0x24
	bl sub_0201D5C8
	add r0, r4, #0
	add r0, #0xf4
	bl sub_0201D5C8
	mov r0, #0x41
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x49
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x4d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x10
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x20
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x30
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x60
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x70
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl GetWindowWidth
	mov r1, #0x76
	str r1, [sp]
	mov r1, #0x95
	lsl r1, r1, #2
	ldrh r2, [r4, r1]
	lsl r0, r0, #0x1a
	add r1, r1, #2
	str r2, [sp, #4]
	ldrh r1, [r4, r1]
	lsr r0, r0, #0x18
	mov r2, #0x75
	str r1, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r1, #0
	add r0, r4, #0
	mov r3, #0x77
	str r1, [sp, #0x14]
	bl sub_0208C8C8
	mov r0, #0
	mov r2, #0x96
	str r0, [sp]
	lsl r2, r2, #2
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x78
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x10
	mov r3, #1
	bl sub_0208C778
	mov r0, #0
	str r0, [sp]
	ldr r2, _0208D45C ; =0x0000025A
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #0x79
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x20
	mov r3, #1
	bl sub_0208C778
	mov r0, #0
	mov r2, #0x97
	str r0, [sp]
	lsl r2, r2, #2
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x7a
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x30
	mov r3, #1
	bl sub_0208C778
	mov r0, #0
	str r0, [sp]
	ldr r2, _0208D460 ; =0x0000025E
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #0x7b
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x40
	mov r3, #1
	bl sub_0208C778
	mov r0, #0
	mov r2, #0x26
	str r0, [sp]
	lsl r2, r2, #4
	ldrh r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0x7c
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x50
	mov r3, #1
	bl sub_0208C778
	ldr r2, _0208D464 ; =0x00000262
	ldr r0, _0208D468 ; =0x000007A8
	ldrb r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferAbilityName
	mov r0, #0x7a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x7d
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _0208D468 ; =0x000007A8
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D458 ; =0x00010200
	add r0, r4, #0
	add r1, #0x60
	mov r3, #0
	bl sub_0208C778
	ldr r2, _0208D46C ; =0x000002D2
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x13
	bl NewMsgDataFromNarc
	ldr r1, _0208D464 ; =0x00000262
	ldr r2, _0208D470 ; =0x000007AC
	ldrb r1, [r4, r1]
	ldr r2, [r4, r2]
	add r5, r0, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl DestroyMsgData
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D458 ; =0x00010200
	ldr r2, _0208D470 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x70
	mov r3, #3
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x30
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x40
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x50
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x60
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x70
	bl sub_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0208D458: .word 0x00010200
_0208D45C: .word 0x0000025A
_0208D460: .word 0x0000025E
_0208D464: .word 0x00000262
_0208D468: .word 0x000007A8
_0208D46C: .word 0x000002D2
_0208D470: .word 0x000007AC
	thumb_func_end sub_0208D178

	thumb_func_start sub_0208D474
sub_0208D474: ; 0x0208D474
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	beq _0208D48C
	add r0, r4, #0
	add r0, #0x44
	bl sub_0201D5C8
_0208D48C:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x80
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x90
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0xa0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0xb0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #0
	bl sub_0208D884
	add r0, r4, #0
	mov r1, #1
	bl sub_0208D884
	add r0, r4, #0
	mov r1, #2
	bl sub_0208D884
	add r0, r4, #0
	mov r1, #3
	bl sub_0208D884
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x80
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x90
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xa0
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xb0
	bl sub_0201D5C8
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	pop {r4, pc}
	thumb_func_end sub_0208D474

	thumb_func_start sub_0208D520
sub_0208D520: ; 0x0208D520
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x54
	bl sub_0201D5C8
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _0208D53A
	b _0208D6AA
_0208D53A:
	sub r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x30
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x60
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x70
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbb
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x30
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbc
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x40
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbd
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x50
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbe
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x60
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xbf
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D6B0 ; =0x00010200
	ldr r2, _0208D6B4 ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x70
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x30
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x40
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x50
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x60
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x70
	bl sub_0201D5C8
_0208D6AA:
	add sp, #0x10
	pop {r4, pc}
	nop
_0208D6B0: .word 0x00010200
_0208D6B4: .word 0x000007AC
	thumb_func_end sub_0208D520

	thumb_func_start sub_0208D6B8
sub_0208D6B8: ; 0x0208D6B8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x79
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	ldr r2, _0208D720 ; =0x000007C6
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #0xb7
	mov r3, #3
	bl sub_0208C87C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D724 ; =0x00010200
	add r0, r4, #0
	mov r3, #0
	bl sub_0208C778
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0201D5C8
	ldr r0, [r4]
	mov r1, #4
	bl BgCommitTilemapBufferToVram
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0208D720: .word 0x000007C6
_0208D724: .word 0x00010200
	thumb_func_end sub_0208D6B8

	thumb_func_start sub_0208D728
sub_0208D728: ; 0x0208D728
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #3
	beq _0208D73E
	cmp r0, #4
	bne _0208D7B0
_0208D73E:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x10
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xa5
	bl ReadMsgDataIntoString
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D7B4 ; =0x000E0F00
	add r0, r4, #0
	add r1, #0x10
	mov r3, #0
	bl sub_0208C778
	ldr r1, _0208D7B8 ; =0x0000027B
	mov r2, #0x7a
	lsl r2, r2, #4
	ldrb r1, [r4, r1]
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	add r1, #0xa6
	bl ReadMsgDataIntoString
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D7BC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0x89
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r2, _0208D7C0 ; =0x000007AC
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	add r0, #0x10
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl sub_0201D5C8
_0208D7B0:
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0208D7B4: .word 0x000E0F00
_0208D7B8: .word 0x0000027B
_0208D7BC: .word 0x00010200
_0208D7C0: .word 0x000007AC
	thumb_func_end sub_0208D728

	thumb_func_start sub_0208D7C4
sub_0208D7C4: ; 0x0208D7C4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x10
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x20
	bl FillWindowPixelBuffer
	ldr r0, _0208D870 ; =0x000007C4
	add r1, r0, #1
	ldrb r2, [r4, r1]
	ldrb r3, [r4, r0]
	lsl r1, r2, #3
	add r1, r2, r1
	add r2, r3, r1
	add r1, r0, #2
	ldrb r1, [r4, r1]
	cmp r2, r1
	bge _0208D854
	add r0, r0, #3
	ldrb r0, [r4, r0]
	mov r1, #3
	bl sub_0208E55C
	ldr r2, _0208D874 ; =0x000007A4
	add r1, r0, #0
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D878 ; =0x000E0F00
	add r0, r4, #0
	add r1, #0x10
	mov r3, #0
	bl sub_0208C778
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, _0208D87C ; =0x000007C7
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0, #0x20]
	bl sub_0208E5C0
	ldr r2, _0208D874 ; =0x000007A4
	add r1, r0, #0
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, _0208D880 ; =0x00010200
	add r0, r4, #0
	add r1, #0x20
	mov r3, #0
	bl sub_0208C778
_0208D854:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x10
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x20
	bl sub_0201D5C8
	pop {r4, pc}
	nop
_0208D870: .word 0x000007C4
_0208D874: .word 0x000007A4
_0208D878: .word 0x000E0F00
_0208D87C: .word 0x000007C7
_0208D880: .word 0x00010200
	thumb_func_end sub_0208D7C4

	thumb_func_start sub_0208D884
sub_0208D884: ; 0x0208D884
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0x89
	add r4, r1, #0
	lsl r0, r0, #2
	add r1, #8
	lsl r7, r1, #4
	ldr r6, [r5, r0]
	cmp r4, #4
	beq _0208D8B8
	lsl r1, r4, #1
	add r2, r5, r1
	add r1, r0, #0
	add r1, #0x40
	ldrh r1, [r2, r1]
	add r2, r0, #0
	add r2, #0x48
	str r1, [sp, #0x20]
	add r1, r5, r4
	ldrb r2, [r1, r2]
	add r0, #0x4c
	str r2, [sp, #0x1c]
	ldrb r0, [r1, r0]
	str r0, [sp, #0x18]
	b _0208D8CA
_0208D8B8:
	add r0, #8
	ldr r0, [r5, r0]
	mov r1, #0
	ldrh r0, [r0, #0x18]
	str r0, [sp, #0x20]
	bl WazaGetMaxPp
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
_0208D8CA:
	ldr r2, _0208D994 ; =0x000007B4
	ldr r1, [sp, #0x20]
	ldr r0, [r5, r2]
	sub r2, #8
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #2
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D998 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _0208D99C ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	mov r3, #1
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0208D952
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x87
	bl ReadMsgDataIntoString
	mov r3, #0x10
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D998 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _0208D99C ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x8d
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	add r4, #0x88
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r1, #8
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x3c
	str r0, [sp, #0x10]
	mov r0, #0x10
	str r0, [sp, #0x14]
	add r0, r5, #0
	mov r2, #0x75
	add r3, r4, #0
	bl sub_0208C8C8
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0208D952:
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x99
	bl ReadMsgDataIntoString
	ldr r1, _0208D99C ; =0x000007AC
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl sub_02002F30
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208D998 ; =0x00010200
	lsr r4, r3, #1
	str r0, [sp, #8]
	mov r1, #0
	mov r3, #0x3c
	ldr r2, _0208D99C ; =0x000007AC
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	sub r3, r3, r4
	bl AddTextPrinterParameterized2
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0208D994: .word 0x000007B4
_0208D998: .word 0x00010200
_0208D99C: .word 0x000007AC
	thumb_func_end sub_0208D884

	thumb_func_start sub_0208D9A0
sub_0208D9A0: ; 0x0208D9A0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	add r4, r1, #0
	bl sub_0201D5C8
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
	mov r0, #0x69
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0xd0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0xe0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, #0xf0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #2
	bl GetWazaAttr
	add r2, r0, #0
	cmp r2, #1
	bhi _0208DA10
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x9a
	bl ReadMsgDataIntoString
	b _0208DA1E
_0208DA10:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x96
	mov r3, #3
	bl sub_0208C87C
_0208DA1E:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, _0208DAC8 ; =0x00010200
	add r0, r5, #0
	add r1, #0xd0
	mov r3, #1
	bl sub_0208C778
	add r0, r4, #0
	mov r1, #4
	bl GetWazaAttr
	add r2, r0, #0
	bne _0208DA4E
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x9a
	bl ReadMsgDataIntoString
	b _0208DA5C
_0208DA4E:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x97
	mov r3, #3
	bl sub_0208C87C
_0208DA5C:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, _0208DAC8 ; =0x00010200
	add r0, r5, #0
	add r1, #0xe0
	mov r3, #1
	bl sub_0208C778
	ldr r2, _0208DACC ; =0x000002ED
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x13
	bl NewMsgDataFromNarc
	ldr r2, _0208DAD0 ; =0x000007AC
	add r1, r4, #0
	ldr r2, [r5, r2]
	add r6, r0, #0
	bl ReadMsgDataIntoString
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, _0208DAC8 ; =0x00010200
	add r0, r5, #0
	add r1, #0xf0
	mov r3, #0
	bl sub_0208C778
	add r0, r6, #0
	bl DestroyMsgData
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xd0
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xe0
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xf0
	bl sub_0201D5C8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0208DAC8: .word 0x00010200
_0208DACC: .word 0x000002ED
_0208DAD0: .word 0x000007AC
	thumb_func_end sub_0208D9A0

	thumb_func_start sub_0208DAD4
sub_0208DAD4: ; 0x0208DAD4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D8E4
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D8E4
	mov r0, #0x69
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xd0
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xe0
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xf0
	bl sub_0201D8E4
	pop {r4, pc}
	thumb_func_end sub_0208DAD4

	thumb_func_start sub_0208DB1C
sub_0208DB1C: ; 0x0208DB1C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldrh r1, [r1, #0x18]
	cmp r1, #0
	beq _0208DB4E
	sub r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0xc0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #4
	bl sub_0208D884
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xc0
	bl sub_0201D5C8
	pop {r4, pc}
_0208DB4E:
	sub r0, #0xb8
	add r0, r4, r0
	bl sub_0201D5C8
	pop {r4, pc}
	thumb_func_end sub_0208DB1C

	thumb_func_start sub_0208DB58
sub_0208DB58: ; 0x0208DB58
	ldr r3, _0208DB60 ; =ScheduleBgTilemapBufferTransfer
	ldr r0, [r0]
	mov r1, #1
	bx r3
	.balign 4, 0
_0208DB60: .word ScheduleBgTilemapBufferTransfer
	thumb_func_end sub_0208DB58

	thumb_func_start sub_0208DB64
sub_0208DB64: ; 0x0208DB64
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _0208DBEC ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _0208DBEC ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _0208DBEC ; =0x000007BD
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0208D884
	ldr r1, _0208DBEC ; =0x000007BD
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl sub_0208D884
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _0208DBEC ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D5C8
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, _0208DBEC ; =0x000007BD
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D5C8
	pop {r4, pc}
	nop
_0208DBEC: .word 0x000007BD
	thumb_func_end sub_0208DB64

	thumb_func_start sub_0208DBF0
sub_0208DBF0: ; 0x0208DBF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0208DC60 ; =0x000007BC
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0208DC2A
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xd0
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xe0
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0xf0
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r4, #0xf0
	b _0208DC32
_0208DC2A:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r4, #0x50
_0208DC32:
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x9c
	bl ReadMsgDataIntoString
	ldr r2, _0208DC64 ; =0x00010200
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl sub_0208C778
	add r0, r4, #0
	bl sub_0201D5C8
	pop {r3, r4, r5, pc}
	nop
_0208DC60: .word 0x000007BC
_0208DC64: .word 0x00010200
	thumb_func_end sub_0208DBF0

	thumb_func_start sub_0208DC68
sub_0208DC68: ; 0x0208DC68
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #1
	bne _0208DCD6
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xc1
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r2, #0xff
	ldr r0, _0208DD18 ; =0x000E0F00
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x89
	str r3, [sp, #0xc]
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, r2, #1
	ldr r2, _0208DD1C ; =0x000007AC
	add r0, r1, r0
	ldr r2, [r4, r2]
	mov r1, #4
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xc0
	bl sub_0201D8E4
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	bl sub_0201D5C8
	add sp, #0x10
	pop {r4, pc}
_0208DCD6:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	bl sub_0201D8E4
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldrh r1, [r1, #0x18]
	cmp r1, #0
	beq _0208DD12
	sub r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0xc0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #4
	bl sub_0208D884
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0xc0
	bl sub_0201D5C8
_0208DD12:
	add sp, #0x10
	pop {r4, pc}
	nop
_0208DD18: .word 0x000E0F00
_0208DD1C: .word 0x000007AC
	thumb_func_end sub_0208DC68

	thumb_func_start sub_0208DD20
sub_0208DD20: ; 0x0208DD20
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #1
	bne _0208DD82
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	mov r1, #0xc2
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r0, _0208DD98 ; =0x000E0F00
	ldr r2, _0208DD9C ; =0x000007AC
	str r0, [sp, #8]
	mov r0, #0x89
	str r3, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, #0x11
	add r0, r0, r1
	ldr r2, [r4, r2]
	mov r1, #4
	bl AddTextPrinterParameterized2
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D5C8
	add sp, #0x10
	pop {r4, pc}
_0208DD82:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_0201D8E4
	add sp, #0x10
	pop {r4, pc}
	nop
_0208DD98: .word 0x000E0F00
_0208DD9C: .word 0x000007AC
	thumb_func_end sub_0208DD20

	thumb_func_start sub_0208DDA0
sub_0208DDA0: ; 0x0208DDA0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #4
	bgt _0208DDC4
	cmp r1, #0
	blt _0208DDE2
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208DDBA: ; jump table
	.short _0208DDCA - _0208DDBA - 2 ; case 0
	.short _0208DDCE - _0208DDBA - 2 ; case 1
	.short _0208DDD2 - _0208DDBA - 2 ; case 2
	.short _0208DDD6 - _0208DDBA - 2 ; case 3
	.short _0208DDDA - _0208DDBA - 2 ; case 4
_0208DDC4:
	cmp r1, #0xfe
	beq _0208DDDE
	b _0208DDE2
_0208DDCA:
	mov r5, #0xac
	b _0208DDE4
_0208DDCE:
	mov r5, #0xae
	b _0208DDE4
_0208DDD2:
	mov r5, #0xaf
	b _0208DDE4
_0208DDD6:
	mov r5, #0xb0
	b _0208DDE4
_0208DDDA:
	mov r5, #0xad
	b _0208DDE4
_0208DDDE:
	mov r5, #0xb1
	b _0208DDE4
_0208DDE2:
	mov r5, #0xb2
_0208DDE4:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r6, [r4, r0]
	ldr r2, _0208DE34 ; =0x000003E2
	add r6, #0x20
	add r0, r6, #0
	mov r1, #1
	mov r3, #0xd
	bl DrawFrameAndWindow2
	add r0, r6, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r2, #0x7a
	lsl r2, r2, #4
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r2, [r4, r2]
	add r1, r5, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0208DE38 ; =0x0001020F
	ldr r2, _0208DE3C ; =0x000007AC
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r6, #0
	mov r1, #1
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl sub_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208DE34: .word 0x000003E2
_0208DE38: .word 0x0001020F
_0208DE3C: .word 0x000007AC
	thumb_func_end sub_0208DDA0

	thumb_func_start sub_0208DE40
sub_0208DE40: ; 0x0208DE40
	push {r3, r4, lr}
	sub sp, #4
	bl NNS_G3dInit
	bl G3X_Init
	bl G3X_InitMtxStack
	ldr r0, _0208DEC0 ; =0x04000060
	ldr r1, _0208DEC4 ; =0xFFFFCFFD
	ldrh r2, [r0]
	ldr r3, _0208DEC8 ; =0x0000CFFB
	and r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r4, [r0]
	add r1, r1, #2
	sub r3, #0x1c
	and r4, r2
	mov r2, #8
	orr r2, r4
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x10
	orr r1, r2
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r3
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _0208DECC ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _0208DED0 ; =0x04000540
	mov r0, #0
	str r0, [r1]
	ldr r0, _0208DED4 ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r1, _0208DED8 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0208DEC0: .word 0x04000060
_0208DEC4: .word 0xFFFFCFFD
_0208DEC8: .word 0x0000CFFB
_0208DECC: .word 0x00007FFF
_0208DED0: .word 0x04000540
_0208DED4: .word 0xBFFF0000
_0208DED8: .word 0x04000008
	thumb_func_end sub_0208DE40

	thumb_func_start sub_0208DEDC
sub_0208DEDC: ; 0x0208DEDC
	push {r4, lr}
	add r4, r0, #0
	bl NNS_G2dSetupSoftwareSpriteCamera
	mov r0, #0x2a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02008120
	ldr r0, _0208DEF8 ; =0x04000540
	mov r1, #1
	str r1, [r0]
	pop {r4, pc}
	nop
_0208DEF8: .word 0x04000540
	thumb_func_end sub_0208DEDC

	thumb_func_start sub_0208DEFC
sub_0208DEFC: ; 0x0208DEFC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02023120
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02017088
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016F2C
	mov r0, #0x2a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02008524
	pop {r4, pc}
	thumb_func_end sub_0208DEFC

	thumb_func_start sub_0208DF2C
sub_0208DF2C: ; 0x0208DF2C
	push {r3, r4, lr}
	sub sp, #0x1c
	ldr r3, _0208DF94 ; =_02104EA4
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x10
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #8
	str r0, [r2]
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	mov r0, #0x13
	bl sub_02023114
	mov r1, #0xa7
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r2, #1
	str r2, [sp]
	ldr r0, [r4, r1]
	lsl r1, r2, #0x10
	str r0, [sp, #4]
	ldr r3, _0208DF98 ; =0x000005C1
	add r0, sp, #0x10
	add r2, sp, #8
	bl sub_020232BC
	mov r2, #0xa7
	lsl r2, r2, #2
	mov r1, #0x19
	ldr r2, [r4, r2]
	mov r0, #0
	lsl r1, r1, #0xe
	bl sub_02023240
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02023234
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202313C
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_0208DF94: .word _02104EA4
_0208DF98: .word 0x000005C1
	thumb_func_end sub_0208DF2C

	thumb_func_start sub_0208DF9C
sub_0208DF9C: ; 0x0208DF9C
	push {r4, r5}
	cmp r2, #0xff
	bne _0208DFB2
	ldrh r2, [r0]
	strh r2, [r1]
	ldrh r2, [r0, #2]
	strh r2, [r1, #2]
	ldrh r0, [r0, #4]
	strh r0, [r1, #4]
	pop {r4, r5}
	bx lr
_0208DFB2:
	cmp r2, #0
	bne _0208DFC6
	ldrh r2, [r0, #6]
	strh r2, [r1]
	ldrh r2, [r0, #8]
	strh r2, [r1, #2]
	ldrh r0, [r0, #0xa]
	strh r0, [r1, #4]
	pop {r4, r5}
	bx lr
_0208DFC6:
	mov r3, #6
	ldrsh r5, [r0, r3]
	mov r3, #0xc
	ldrsh r3, [r0, r3]
	add r4, r3, #0
	mul r4, r2
	add r3, r5, r4
	strh r3, [r1]
	mov r3, #8
	ldrsh r5, [r0, r3]
	mov r3, #0xe
	ldrsh r3, [r0, r3]
	add r4, r3, #0
	mul r4, r2
	add r3, r5, r4
	strh r3, [r1, #2]
	mov r3, #0xa
	ldrsh r4, [r0, r3]
	mov r3, #0x10
	ldrsh r0, [r0, r3]
	mul r2, r0
	add r0, r4, r2
	strh r0, [r1, #4]
	pop {r4, r5}
	bx lr
	thumb_func_end sub_0208DF9C

	thumb_func_start sub_0208DFF8
sub_0208DFF8: ; 0x0208DFF8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	ldrsh r1, [r4, r0]
	ldrsh r0, [r5, r0]
	add r6, r2, #0
	sub r7, r1, r0
	add r0, r7, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _0208E04C
	add r0, r7, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0208E16C ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	b _0208E072
_0208E04C:
	add r0, r7, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0208E16C ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	bl _ffix
_0208E072:
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	strh r0, [r6]
	mov r0, #2
	ldrsh r1, [r4, r0]
	ldrsh r0, [r5, r0]
	sub r7, r1, r0
	add r0, r7, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _0208E0C4
	add r0, r7, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0208E16C ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	b _0208E0EA
_0208E0C4:
	add r0, r7, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0208E16C ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	bl _ffix
_0208E0EA:
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	strh r0, [r6, #2]
	mov r0, #4
	ldrsh r1, [r4, r0]
	ldrsh r0, [r5, r0]
	sub r4, r1, r0
	add r0, r4, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _0208E13C
	add r0, r4, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0208E16C ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	b _0208E162
_0208E13C:
	add r0, r4, #0
	bl _fflt
	ldr r1, _0208E16C ; =0x45800000
	bl _fdiv
	ldr r1, _0208E170 ; =0x40800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0208E16C ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	bl _ffix
_0208E162:
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	strh r0, [r6, #4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208E16C: .word 0x45800000
_0208E170: .word 0x40800000
	thumb_func_end sub_0208DFF8

	thumb_func_start sub_0208E174
sub_0208E174: ; 0x0208E174
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r2, _0208E33C ; =0x00000275
	add r5, r0, #0
	mov r1, #0xe6
	lsl r1, r1, #2
	ldrb r2, [r5, r2]
	ldr r0, _0208E340 ; =_02104EB0
	add r1, r5, r1
	bl sub_0208DF9C
	ldr r2, _0208E344 ; =0x00000276
	ldr r1, _0208E348 ; =0x0000039E
	ldrb r2, [r5, r2]
	ldr r0, _0208E34C ; =_02104EC2
	add r1, r5, r1
	bl sub_0208DF9C
	ldr r2, _0208E350 ; =0x00000277
	ldr r1, _0208E354 ; =0x000003AA
	ldrb r2, [r5, r2]
	ldr r0, _0208E358 ; =_02104ED4
	add r1, r5, r1
	bl sub_0208DF9C
	mov r1, #0xe9
	lsl r1, r1, #2
	ldr r0, _0208E35C ; =_02104EE6
	add r1, r5, r1
	mov r2, #0
	bl sub_0208DF9C
	ldr r2, _0208E360 ; =0x00000279
	mov r1, #0x3b
	lsl r1, r1, #4
	ldrb r2, [r5, r2]
	ldr r0, _0208E364 ; =_02104EF8
	add r1, r5, r1
	bl sub_0208DF9C
	ldr r2, _0208E33C ; =0x00000275
	ldr r1, _0208E368 ; =0x000003B6
	ldrb r2, [r5, r2]
	ldr r0, _0208E36C ; =_02104F0A
	add r1, r5, r1
	bl sub_0208DF9C
	ldr r1, _0208E370 ; =0x000003C2
	ldr r0, _0208E374 ; =_02104F1C
	add r1, r5, r1
	mov r2, #0
	bl sub_0208DF9C
	mov r2, #0x9e
	lsl r2, r2, #2
	mov r1, #0xef
	lsl r1, r1, #2
	ldrb r2, [r5, r2]
	ldr r0, _0208E378 ; =_02104F2E
	add r1, r5, r1
	bl sub_0208DF9C
	ldr r2, _0208E360 ; =0x00000279
	mov r1, #0xf2
	lsl r1, r1, #2
	ldrb r2, [r5, r2]
	ldr r0, _0208E37C ; =_02104F40
	add r1, r5, r1
	bl sub_0208DF9C
	ldr r1, _0208E380 ; =0x000003CE
	ldr r0, _0208E384 ; =_02104F52
	add r1, r5, r1
	mov r2, #0
	bl sub_0208DF9C
	ldr r2, _0208E350 ; =0x00000277
	ldr r1, _0208E388 ; =0x000003DA
	ldrb r2, [r5, r2]
	ldr r0, _0208E38C ; =_02104F64
	add r1, r5, r1
	bl sub_0208DF9C
	mov r2, #0x9e
	lsl r2, r2, #2
	mov r1, #0xf5
	lsl r1, r1, #2
	ldrb r2, [r5, r2]
	ldr r0, _0208E390 ; =_02104F76
	add r1, r5, r1
	bl sub_0208DF9C
	mov r1, #0x3e
	lsl r1, r1, #4
	ldr r0, _0208E394 ; =_02104F88
	add r1, r5, r1
	mov r2, #0
	bl sub_0208DF9C
	ldr r2, _0208E344 ; =0x00000276
	ldr r1, _0208E398 ; =0x000003E6
	ldrb r2, [r5, r2]
	ldr r0, _0208E39C ; =_02104F9A
	add r1, r5, r1
	bl sub_0208DF9C
	ldr r2, _0208E350 ; =0x00000277
	ldr r1, _0208E3A0 ; =0x000003F2
	ldrb r2, [r5, r2]
	ldr r0, _0208E3A4 ; =_02104FAC
	add r1, r5, r1
	bl sub_0208DF9C
	mov r2, #0x9e
	lsl r2, r2, #2
	mov r1, #0xfb
	lsl r1, r1, #2
	ldrb r2, [r5, r2]
	ldr r0, _0208E3A8 ; =_02104FBE
	add r1, r5, r1
	bl sub_0208DF9C
	mov r0, #0
	str r0, [sp, #0x24]
	mov r0, #0xce
	lsl r0, r0, #2
	add r1, r5, r0
	str r1, [sp, #0x20]
	add r1, r0, #0
	add r1, #0x60
	add r1, r5, r1
	str r1, [sp, #0x1c]
	add r1, r0, #0
	sub r1, #0x60
	add r1, r5, r1
	str r1, [sp, #0x18]
	add r1, r0, #6
	add r1, r5, r1
	str r1, [sp, #0x14]
	add r1, r0, #0
	add r1, #0x66
	add r1, r5, r1
	str r1, [sp, #0x10]
	add r1, r0, #0
	sub r1, #0x5a
	add r1, r5, r1
	str r1, [sp, #0xc]
	add r1, r0, #0
	add r1, #0xc
	add r1, r5, r1
	str r1, [sp, #8]
	add r1, r0, #0
	add r1, #0x6c
	add r1, r5, r1
	str r1, [sp, #4]
	add r1, r0, #0
	sub r1, #0x54
	add r1, r5, r1
	str r1, [sp]
	add r1, r0, #0
	add r1, #0x12
	add r7, r5, r1
	add r1, r0, #0
	add r1, #0x72
	sub r0, #0x4e
	add r6, r5, r1
	add r4, r5, r0
_0208E2C2:
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	bl sub_0208DFF8
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl sub_0208DFF8
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_0208DFF8
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0208DFF8
	ldr r0, [sp, #0x20]
	add r7, #0x18
	add r0, #0x18
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r6, #0x18
	add r0, #0x18
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r4, #0x18
	add r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #4
	blo _0208E2C2
	mov r0, #0xfe
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208E33C: .word 0x00000275
_0208E340: .word _02104EB0
_0208E344: .word 0x00000276
_0208E348: .word 0x0000039E
_0208E34C: .word _02104EC2
_0208E350: .word 0x00000277
_0208E354: .word 0x000003AA
_0208E358: .word _02104ED4
_0208E35C: .word _02104EE6
_0208E360: .word 0x00000279
_0208E364: .word _02104EF8
_0208E368: .word 0x000003B6
_0208E36C: .word _02104F0A
_0208E370: .word 0x000003C2
_0208E374: .word _02104F1C
_0208E378: .word _02104F2E
_0208E37C: .word _02104F40
_0208E380: .word 0x000003CE
_0208E384: .word _02104F52
_0208E388: .word 0x000003DA
_0208E38C: .word _02104F64
_0208E390: .word _02104F76
_0208E394: .word _02104F88
_0208E398: .word 0x000003E6
_0208E39C: .word _02104F9A
_0208E3A0: .word 0x000003F2
_0208E3A4: .word _02104FAC
_0208E3A8: .word _02104FBE
	thumb_func_end sub_0208E174

	thumb_func_start sub_0208E3AC
sub_0208E3AC: ; 0x0208E3AC
	push {r4, lr}
	sub sp, #0x20
	add r4, r0, #0
	mov r0, #0x13
	bl sub_02007FD4
	mov r1, #0x2a
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r4, #0
	bl sub_0208A520
	add r1, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	add r0, sp, #0x10
	bne _0208E3DE
	mov r2, #2
	mov r3, #0
	bl sub_0207013C
	b _0208E3E4
_0208E3DE:
	mov r2, #2
	bl sub_02070124
_0208E3E4:
	mov r2, #0xa9
	lsl r2, r2, #2
	ldr r0, _0208E440 ; =0x000007B8
	add r1, r4, r2
	sub r2, #0x68
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r3, #1
	bl sub_02072914
	mov r1, #0xb5
	lsl r1, r1, #2
	mov r2, #0
	str r2, [r4, r1]
	add r0, r1, #0
	str r2, [sp]
	sub r0, #0x30
	str r2, [sp, #4]
	add r0, r4, r0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	sub r1, #0x34
	ldr r0, [r4, r1]
	add r1, sp, #0x10
	mov r2, #0xd0
	mov r3, #0x68
	bl sub_020085EC
	mov r1, #0x2d
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x23
	mov r2, #0
	bl sub_020087A4
	add sp, #0x20
	pop {r4, pc}
	nop
_0208E440: .word 0x000007B8
	thumb_func_end sub_0208E3AC

	thumb_func_start sub_0208E444
sub_0208E444: ; 0x0208E444
	push {r3, r4, lr}
	sub sp, #0xc
	mov r2, #0xa
	add r4, r0, #0
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	lsl r0, r0, #3
	lsr r0, r0, #0x1f
	beq _0208E47C
	mov r0, #2
	str r0, [sp]
	add r0, r2, #0
	add r0, #0x54
	ldr r0, [r4, r0]
	add r1, r2, #0
	str r0, [sp, #4]
	mov r3, #0
	ldr r0, _0208E4B0 ; =0x000007B8
	str r3, [sp, #8]
	add r1, #0x4c
	add r2, #0x50
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl sub_0207294C
	add sp, #0xc
	pop {r3, r4, pc}
_0208E47C:
	add r2, #0x50
	ldr r0, [r4, r2]
	mov r1, #1
	bl sub_02008550
	mov r3, #0xb5
	lsl r3, r3, #2
	mov r0, #2
	str r0, [sp]
	ldr r0, [r4, r3]
	add r1, r3, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	sub r2, r3, #4
	ldr r0, _0208E4B0 ; =0x000007B8
	sub r3, #0x98
	sub r1, #8
	ldrh r3, [r4, r3]
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl sub_0207294C
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0208E4B0: .word 0x000007B8
	thumb_func_end sub_0208E444

	thumb_func_start sub_0208E4B4
sub_0208E4B4: ; 0x0208E4B4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02017088
	mov r0, #0x2a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02008524
	add r0, r4, #0
	bl sub_0208E3AC
	add r0, r4, #0
	bl sub_0208E444
	pop {r4, pc}
	thumb_func_end sub_0208E4B4

	thumb_func_start sub_0208E4DC
sub_0208E4DC: ; 0x0208E4DC
	push {r3, lr}
	ldr r1, _0208E538 ; =0x000007BF
	ldrb r1, [r0, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #0xf
	bne _0208E4F0
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
_0208E4F0:
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	beq _0208E512
	ldr r0, _0208E53C ; =_02104FFC
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0208E534
	lsl r1, r0, #2
	ldr r0, _0208E540 ; =_02104FD0
	ldrb r0, [r0, r1]
	pop {r3, pc}
_0208E512:
	ldr r0, _0208E53C ; =_02104FFC
	bl sub_02025224
	cmp r0, #4
	blt _0208E526
	cmp r0, #9
	bgt _0208E526
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
_0208E526:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0208E534
	lsl r1, r0, #2
	ldr r0, _0208E540 ; =_02104FD0
	ldrb r0, [r0, r1]
_0208E534:
	pop {r3, pc}
	nop
_0208E538: .word 0x000007BF
_0208E53C: .word _02104FFC
_0208E540: .word _02104FD0
	thumb_func_end sub_0208E4DC

	thumb_func_start sub_0208E544
sub_0208E544: ; 0x0208E544
	push {r3, lr}
	bl sub_0208E4DC
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0208E558
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
_0208E558:
	mov r0, #0xff
	pop {r3, pc}
	thumb_func_end sub_0208E544

	thumb_func_start sub_0208E55C
sub_0208E55C: ; 0x0208E55C
	cmp r1, #4
	bhi _0208E5A8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0208E56C: ; jump table
	.short _0208E576 - _0208E56C - 2 ; case 0
	.short _0208E580 - _0208E56C - 2 ; case 1
	.short _0208E58A - _0208E56C - 2 ; case 2
	.short _0208E594 - _0208E56C - 2 ; case 3
	.short _0208E59E - _0208E56C - 2 ; case 4
_0208E576:
	mov r1, #0xc
	mul r1, r0
	ldr r0, _0208E5AC ; =_02105028
	ldr r0, [r0, r1]
	bx lr
_0208E580:
	mov r1, #0xc
	mul r1, r0
	ldr r0, _0208E5B0 ; =_02105028 + 4
	ldrh r0, [r0, r1]
	bx lr
_0208E58A:
	mov r1, #0xc
	mul r1, r0
	ldr r0, _0208E5B4 ; =_02105028 + 6
	ldrh r0, [r0, r1]
	bx lr
_0208E594:
	mov r1, #0xc
	mul r1, r0
	ldr r0, _0208E5B8 ; =_02105028 + 8
	ldrh r0, [r0, r1]
	bx lr
_0208E59E:
	mov r1, #0xc
	mul r1, r0
	ldr r0, _0208E5BC ; =_02105028 + 10
	ldrh r0, [r0, r1]
	bx lr
_0208E5A8:
	mov r0, #0
	bx lr
	.balign 4, 0
_0208E5AC: .word _02105028
_0208E5B0: .word _02105028 + 4
_0208E5B4: .word _02105028 + 6
_0208E5B8: .word _02105028 + 8
_0208E5BC: .word _02105028 + 10
	thumb_func_end sub_0208E55C

	thumb_func_start sub_0208E5C0
sub_0208E5C0: ; 0x0208E5C0
	mov r2, #0xc
	mul r2, r1
	ldr r1, _0208E5DC ; =_02105028 + 10
	ldrh r2, [r1, r2]
	mov r1, #2
	lsl r1, r1, #0xe
	tst r1, r2
	beq _0208E5D8
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	ldrb r2, [r0, r1]
	add r2, #0x92
_0208E5D8:
	add r0, r2, #0
	bx lr
	.balign 4, 0
_0208E5DC: .word _02105028 + 10
	thumb_func_end sub_0208E5C0

	thumb_func_start sub_0208E5E0
sub_0208E5E0: ; 0x0208E5E0
	mov r1, #0xc
	mul r1, r0
	ldr r0, _0208E5FC ; =_02105028 + 10
	ldrh r1, [r0, r1]
	mov r0, #2
	lsl r0, r0, #0xe
	tst r0, r1
	beq _0208E5F6
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	bx lr
_0208E5F6:
	mov r0, #0xff
	bx lr
	nop
_0208E5FC: .word _02105028 + 10
	thumb_func_end sub_0208E5E0

	thumb_func_start sub_0208E600
sub_0208E600: ; 0x0208E600
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r7, #0
	mov r1, #0x3c
	bl AllocFromHeap
	add r4, r0, #0
	ldr r2, _0208E974 ; =0x0000012E
	str r7, [r4]
	mov r0, #1
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	str r0, [r4, #4]
	ldr r2, [r4]
	mov r0, #9
	mov r1, #0x20
	bl ScrStrBufs_new_custom
	str r0, [r4, #8]
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl sub_0208F070
	cmp r0, #0x14
	bls _0208E656
	b _0208E990
_0208E656:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208E662: ; jump table
	.short _0208E68C - _0208E662 - 2 ; case 0
	.short _0208E6B8 - _0208E662 - 2 ; case 1
	.short _0208E6E4 - _0208E662 - 2 ; case 2
	.short _0208E710 - _0208E662 - 2 ; case 3
	.short _0208E73C - _0208E662 - 2 ; case 4
	.short _0208E768 - _0208E662 - 2 ; case 5
	.short _0208E794 - _0208E662 - 2 ; case 6
	.short _0208E7C0 - _0208E662 - 2 ; case 7
	.short _0208E7EC - _0208E662 - 2 ; case 8
	.short _0208E818 - _0208E662 - 2 ; case 9
	.short _0208E83A - _0208E662 - 2 ; case 10
	.short _0208E85C - _0208E662 - 2 ; case 11
	.short _0208E87E - _0208E662 - 2 ; case 12
	.short _0208E8A0 - _0208E662 - 2 ; case 13
	.short _0208E8C2 - _0208E662 - 2 ; case 14
	.short _0208E8E4 - _0208E662 - 2 ; case 15
	.short _0208E910 - _0208E662 - 2 ; case 16
	.short _0208E92A - _0208E662 - 2 ; case 17
	.short _0208E942 - _0208E662 - 2 ; case 18
	.short _0208E95C - _0208E662 - 2 ; case 19
	.short _0208E978 - _0208E662 - 2 ; case 20
_0208E68C:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x31
	bl sub_0208EA84
	mov r0, #6
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #7
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E6B8:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x32
	bl sub_0208EA84
	mov r0, #6
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #7
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E6E4:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x33
	bl sub_0208EA84
	mov r0, #6
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #7
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E710:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x34
	bl sub_0208EA84
	mov r0, #8
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #9
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E73C:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x35
	bl sub_0208EA84
	mov r0, #8
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #9
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E768:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x36
	bl sub_0208EA84
	mov r0, #8
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #9
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E794:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x37
	bl sub_0208EA84
	mov r0, #8
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #9
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E7C0:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x38
	bl sub_0208EA84
	mov r0, #7
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #8
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E7EC:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x39
	bl sub_0208EA84
	mov r0, #7
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #8
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E818:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3a
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E83A:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3b
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E85C:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3c
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E87E:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3d
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E8A0:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3e
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E8C2:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3f
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E8E4:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x40
	bl sub_0208EBA4
	mov r0, #6
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #7
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E910:
	mov r0, #1
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x65
	mov r2, #0
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
	b _0208E990
_0208E92A:
	mov r2, #1
	add r0, r4, #0
	mov r1, #0x66
	str r2, [r4, #0x1c]
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
	b _0208E990
_0208E942:
	mov r0, #1
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x67
	mov r2, #0
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
	b _0208E990
_0208E95C:
	mov r2, #1
	add r0, r4, #0
	mov r1, #0x67
	str r2, [r4, #0x1c]
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
	b _0208E990
	.balign 4, 0
_0208E974: .word 0x0000012E
_0208E978:
	mov r0, #1
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x68
	mov r2, #0
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
_0208E990:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0208E600

	thumb_func_start sub_0208E994
sub_0208E994: ; 0x0208E994
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0208E9A2
	bl FreeToHeap
_0208E9A2:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0208E9AC
	bl FreeToHeap
_0208E9AC:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0208E9B6
	bl FreeToHeap
_0208E9B6:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _0208E9C0
	bl FreeToHeap
_0208E9C0:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0208E9CA
	bl FreeToHeap
_0208E9CA:
	ldr r0, [r4, #8]
	bl ScrStrBufs_delete
	ldr r0, [r4, #4]
	bl DestroyMsgData
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208E994

	thumb_func_start sub_0208E9E0
sub_0208E9E0: ; 0x0208E9E0
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r4, r0, #0
	add r0, r6, #0
	add r1, r2, #0
	bl sub_0208F070
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0xf9
	lsl r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	cmp r1, #1
	bhi _0208EA14
	cmp r4, #1
	beq _0208EA14
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208EA14:
	cmp r4, #3
	bhi _0208EA58
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0208EA24: ; jump table
	.short _0208EA58 - _0208EA24 - 2 ; case 0
	.short _0208EA2C - _0208EA24 - 2 ; case 1
	.short _0208EA58 - _0208EA24 - 2 ; case 2
	.short _0208EA58 - _0208EA24 - 2 ; case 3
_0208EA2C:
	cmp r5, #1
	bne _0208EA58
	cmp r0, #0xa
	beq _0208EA3C
	cmp r0, #0xb
	beq _0208EA3C
	cmp r0, #0xc
	bne _0208EA58
_0208EA3C:
	add r0, r6, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x56
	bl sub_02017FE4
	cmp r4, r0
	bne _0208EA58
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208EA58:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0208E9E0

	thumb_func_start sub_0208EA5C
sub_0208EA5C: ; 0x0208EA5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl GetMonNature
	add r4, r0, #0
	cmp r4, #0x18
	bgt _0208EA82
	ldr r1, [r5]
	mov r0, #0x48
	bl String_ctor
	str r0, [r5, #0x18]
	add r4, #0x18
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x18]
	add r1, r4, #0
	bl ReadMsgDataIntoString
_0208EA82:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208EA5C

	thumb_func_start sub_0208EA84
sub_0208EA84: ; 0x0208EA84
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #9
	ldr r1, [r5]
	lsl r0, r0, #6
	bl String_ctor
	add r4, r0, #0
	mov r0, #9
	ldr r1, [r5]
	lsl r0, r0, #6
	bl String_ctor
	str r0, [r5, #0x20]
	ldr r0, [r5, #4]
	add r1, r6, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0xc]
	mov r1, #0x95
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #0
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x96
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #1
	bl BufferMonthNameAbbr
	ldr r0, [r5, #0xc]
	mov r1, #0x97
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #2
	ldr r0, [r5, #8]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x9c
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #3
	ldr r0, [r5, #8]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #4
	bl BufferLocationName
	ldr r0, [r5, #0xc]
	mov r1, #0x92
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #5
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x93
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #6
	bl BufferMonthNameAbbr
	ldr r0, [r5, #0xc]
	mov r1, #0x94
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #7
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #8
	bl BufferLocationName
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x20]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0208EA84

	thumb_func_start sub_0208EBA4
sub_0208EBA4: ; 0x0208EBA4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r6, r1, #0
	mov r0, #0x12
	ldr r1, [r4]
	lsl r0, r0, #4
	bl String_ctor
	add r5, r0, #0
	mov r0, #0x12
	ldr r1, [r4]
	lsl r0, r0, #4
	bl String_ctor
	str r0, [r4, #0x20]
	ldr r0, [r4, #4]
	add r1, r6, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0xc]
	mov r1, #0x95
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	mov r1, #0
	bl BufferIntegerAsString
	ldr r0, [r4, #0xc]
	mov r1, #0x96
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #1
	bl BufferMonthNameAbbr
	ldr r0, [r4, #0xc]
	mov r1, #0x97
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #2
	ldr r0, [r4, #8]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r4, #0xc]
	mov r1, #0x9c
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #3
	ldr r0, [r4, #8]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r4, #0xc]
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	cmp r0, #0xf
	bhi _0208EC74
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208EC54: ; jump table
	.short _0208EC74 - _0208EC54 - 2 ; case 0
	.short _0208ECB0 - _0208EC54 - 2 ; case 1
	.short _0208ECB0 - _0208EC54 - 2 ; case 2
	.short _0208ECB0 - _0208EC54 - 2 ; case 3
	.short _0208EC88 - _0208EC54 - 2 ; case 4
	.short _0208EC88 - _0208EC54 - 2 ; case 5
	.short _0208EC74 - _0208EC54 - 2 ; case 6
	.short _0208EC9C - _0208EC54 - 2 ; case 7
	.short _0208EC9C - _0208EC54 - 2 ; case 8
	.short _0208EC74 - _0208EC54 - 2 ; case 9
	.short _0208ECD8 - _0208EC54 - 2 ; case 10
	.short _0208ECD8 - _0208EC54 - 2 ; case 11
	.short _0208ECD8 - _0208EC54 - 2 ; case 12
	.short _0208EC74 - _0208EC54 - 2 ; case 13
	.short _0208EC74 - _0208EC54 - 2 ; case 14
	.short _0208ECC4 - _0208EC54 - 2 ; case 15
_0208EC74:
	mov r0, #1
	mov r1, #7
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208EC88:
	mov r0, #1
	mov r1, #3
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208EC9C:
	mov r0, #1
	mov r1, #4
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208ECB0:
	mov r0, #1
	mov r1, #5
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208ECC4:
	mov r0, #1
	mov r1, #8
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208ECD8:
	mov r0, #1
	mov r1, #7
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
_0208ECEA:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x20]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208EBA4

	thumb_func_start sub_0208ED00
sub_0208ED00: ; 0x0208ED00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0x5a
	ldr r1, [r5]
	lsl r0, r0, #2
	add r6, r2, #0
	bl String_ctor
	add r4, r0, #0
	mov r0, #0x5a
	ldr r1, [r5]
	lsl r0, r0, #2
	bl String_ctor
	str r0, [r5, #0x20]
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	cmp r6, #0
	ldr r0, [r5, #0xc]
	bne _0208ED94
	mov r1, #0x92
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #5
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x93
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #6
	bl BufferMonthNameAbbr
	ldr r0, [r5, #0xc]
	mov r1, #0x94
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #7
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #8
	bl BufferLocationName
	b _0208EDF4
_0208ED94:
	mov r1, #0x95
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #5
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x96
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #6
	bl BufferMonthNameAbbr
	ldr r0, [r5, #0xc]
	mov r1, #0x97
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #7
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #8
	bl BufferLocationName
_0208EDF4:
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x20]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0208ED00

	thumb_func_start sub_0208EE08
sub_0208EE08: ; 0x0208EE08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x48
	bl String_ctor
	str r0, [r4, #0x28]
	ldr r0, [r4, #0xc]
	mov r1, #0x46
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	ldr r0, [r4, #0xc]
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	mov r1, #0x48
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	mov r1, #0x49
	mov r2, #0
	bl GetMonData
	str r0, [sp]
	ldr r0, [r4, #0xc]
	mov r1, #0x4a
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0x4b
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r1, #0
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl GetMonData
	mov r1, #6
	bl _u32_div_f
	cmp r1, #5
	bhi _0208EE8C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208EE80: ; jump table
	.short _0208EE8C - _0208EE80 - 2 ; case 0
	.short _0208EEC4 - _0208EE80 - 2 ; case 1
	.short _0208EEFA - _0208EE80 - 2 ; case 2
	.short _0208EF30 - _0208EE80 - 2 ; case 3
	.short _0208EF66 - _0208EE80 - 2 ; case 4
	.short _0208EF9C - _0208EE80 - 2 ; case 5
_0208EE8C:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	add r2, r0, #0
	mov r5, #0
	cmp r2, r1
	bge _0208EE9C
	mov r5, #1
	add r0, r1, #0
_0208EE9C:
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _0208EEA6
	mov r5, #2
	add r0, r1, #0
_0208EEA6:
	ldr r1, [sp]
	cmp r0, r1
	bge _0208EEB0
	mov r5, #3
	add r0, r1, #0
_0208EEB0:
	cmp r0, r7
	bge _0208EEB8
	mov r5, #4
	add r0, r7, #0
_0208EEB8:
	cmp r0, r6
	blt _0208EEBE
	b _0208EFD0
_0208EEBE:
	mov r5, #5
	add r0, r6, #0
	b _0208EFD0
_0208EEC4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r2, r0, #0
	mov r5, #1
	cmp r2, r1
	bge _0208EED4
	mov r5, #2
	add r0, r1, #0
_0208EED4:
	ldr r1, [sp]
	cmp r0, r1
	bge _0208EEDE
	mov r5, #3
	add r0, r1, #0
_0208EEDE:
	cmp r0, r7
	bge _0208EEE6
	mov r5, #4
	add r0, r7, #0
_0208EEE6:
	cmp r0, r6
	bge _0208EEEE
	mov r5, #5
	add r0, r6, #0
_0208EEEE:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0208EFD0
	mov r5, #0
	add r0, r1, #0
	b _0208EFD0
_0208EEFA:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	add r2, r0, #0
	mov r5, #2
	cmp r2, r1
	bge _0208EF0A
	mov r5, #3
	add r0, r1, #0
_0208EF0A:
	cmp r0, r7
	bge _0208EF12
	mov r5, #4
	add r0, r7, #0
_0208EF12:
	cmp r0, r6
	bge _0208EF1A
	mov r5, #5
	add r0, r6, #0
_0208EF1A:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0208EF24
	mov r5, #0
	add r0, r1, #0
_0208EF24:
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0208EFD0
	mov r5, #1
	add r0, r1, #0
	b _0208EFD0
_0208EF30:
	ldr r0, [sp]
	mov r5, #3
	add r1, r0, #0
	cmp r1, r7
	bge _0208EF3E
	mov r5, #4
	add r0, r7, #0
_0208EF3E:
	cmp r0, r6
	bge _0208EF46
	mov r5, #5
	add r0, r6, #0
_0208EF46:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0208EF50
	mov r5, #0
	add r0, r1, #0
_0208EF50:
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0208EF5A
	mov r5, #1
	add r0, r1, #0
_0208EF5A:
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _0208EFD0
	mov r5, #2
	add r0, r1, #0
	b _0208EFD0
_0208EF66:
	mov r5, #4
	add r0, r7, #0
	cmp r7, r6
	bge _0208EF72
	mov r5, #5
	add r0, r6, #0
_0208EF72:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0208EF7C
	mov r5, #0
	add r0, r1, #0
_0208EF7C:
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0208EF86
	mov r5, #1
	add r0, r1, #0
_0208EF86:
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _0208EF90
	mov r5, #2
	add r0, r1, #0
_0208EF90:
	ldr r1, [sp]
	cmp r0, r1
	bge _0208EFD0
	mov r5, #3
	add r0, r1, #0
	b _0208EFD0
_0208EF9C:
	ldr r1, [sp, #0xc]
	mov r5, #5
	add r0, r6, #0
	cmp r6, r1
	bge _0208EFAA
	mov r5, #0
	add r0, r1, #0
_0208EFAA:
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0208EFB4
	mov r5, #1
	add r0, r1, #0
_0208EFB4:
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _0208EFBE
	mov r5, #2
	add r0, r1, #0
_0208EFBE:
	ldr r1, [sp]
	cmp r0, r1
	bge _0208EFC8
	mov r5, #3
	add r0, r1, #0
_0208EFC8:
	cmp r0, r7
	bge _0208EFD0
	mov r5, #4
	add r0, r7, #0
_0208EFD0:
	mov r1, #5
	bl _s32_div_f
	mov r2, #0xa
	add r6, r5, #0
	mul r6, r2
	ldr r3, _0208EFF0 ; =_021053F4
	lsl r2, r1, #1
	add r1, r3, r6
	ldrh r1, [r2, r1]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ReadMsgDataIntoString
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208EFF0: .word _021053F4
	thumb_func_end sub_0208EE08

	thumb_func_start sub_0208EFF4
sub_0208EFF4: ; 0x0208EFF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x48
	bl String_ctor
	mov r6, #0
	str r0, [r5, #0x30]
	add r4, r6, #0
_0208F006:
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl MonGetFlavorPreference
	cmp r0, #1
	bne _0208F014
	add r6, r4, #1
_0208F014:
	add r4, r4, #1
	cmp r4, #5
	blt _0208F006
	ldr r1, _0208F02C ; =_021053E8
	lsl r2, r6, #1
	ldrh r1, [r1, r2]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x30]
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
	nop
_0208F02C: .word _021053E8
	thumb_func_end sub_0208EFF4

	thumb_func_start sub_0208F030
sub_0208F030: ; 0x0208F030
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #9
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	mov r0, #0x12
	ldr r1, [r5]
	lsl r0, r0, #4
	bl String_ctor
	str r0, [r5, #0x38]
	cmp r4, #5
	bgt _0208F054
	mov r1, #0x69
	b _0208F066
_0208F054:
	cmp r4, #0xa
	bgt _0208F05C
	mov r1, #0x6a
	b _0208F066
_0208F05C:
	cmp r4, #0x28
	bgt _0208F064
	mov r1, #0x6b
	b _0208F066
_0208F064:
	mov r1, #0x6c
_0208F066:
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x38]
	bl ReadMsgDataIntoString
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208F030

	thumb_func_start sub_0208F070
sub_0208F070: ; 0x0208F070
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0x4c
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0208F084
	b _0208F212
_0208F084:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0208F0F0
	add r0, r5, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #0
	mov r1, #0x37
	bl sub_02017FE4
	cmp r6, r0
	bne _0208F0AE
	mov r0, #0xf
	pop {r4, r5, r6, pc}
_0208F0AE:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F0C8
	cmp r4, #1
	bne _0208F0C4
	mov r0, #7
	pop {r4, r5, r6, pc}
_0208F0C4:
	mov r0, #8
	pop {r4, r5, r6, pc}
_0208F0C8:
	add r0, r5, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F0E4
	mov r0, #2
	pop {r4, r5, r6, pc}
_0208F0E4:
	cmp r4, #1
	bne _0208F0EC
	mov r0, #0
	pop {r4, r5, r6, pc}
_0208F0EC:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208F0F0:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F152
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #2
	bl sub_02017FE4
	cmp r6, r0
	bne _0208F122
	cmp r4, #1
	bne _0208F11E
	mov r0, #0xd
	pop {r4, r5, r6, pc}
_0208F11E:
	mov r0, #0xe
	pop {r4, r5, r6, pc}
_0208F122:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #2
	mov r1, #1
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F146
	cmp r4, #1
	bne _0208F142
	mov r0, #0xb
	pop {r4, r5, r6, pc}
_0208F142:
	mov r0, #0xc
	pop {r4, r5, r6, pc}
_0208F146:
	cmp r4, #1
	bne _0208F14E
	mov r0, #9
	pop {r4, r5, r6, pc}
_0208F14E:
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_0208F152:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #9
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xa
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xb
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xd
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #1
	mov r1, #0xe
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F206
_0208F1FA:
	cmp r4, #1
	bne _0208F202
	mov r0, #5
	pop {r4, r5, r6, pc}
_0208F202:
	mov r0, #6
	pop {r4, r5, r6, pc}
_0208F206:
	cmp r4, #1
	bne _0208F20E
	mov r0, #3
	pop {r4, r5, r6, pc}
_0208F20E:
	mov r0, #4
	pop {r4, r5, r6, pc}
_0208F212:
	cmp r4, #1
	bne _0208F248
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F244
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	mov r0, #2
	mov r1, #1
	bl sub_02017FE4
	cmp r4, r0
	bne _0208F240
	mov r0, #0x14
	pop {r4, r5, r6, pc}
_0208F240:
	mov r0, #0x12
	pop {r4, r5, r6, pc}
_0208F244:
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_0208F248:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F25A
	mov r0, #0x13
	pop {r4, r5, r6, pc}
_0208F25A:
	mov r0, #0x11
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208F070

	thumb_func_start sub_0208F260
sub_0208F260: ; 0x0208F260
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl sub_0208F270
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0208F260

	thumb_func_start sub_0208F270
sub_0208F270: ; 0x0208F270
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r7, r1, #0
	add r5, r3, #0
	ldr r6, [sp, #0x18]
	cmp r2, #7
	bls _0208F280
	b _0208F500
_0208F280:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0208F28C: ; jump table
	.short _0208F29C - _0208F28C - 2 ; case 0
	.short _0208F34A - _0208F28C - 2 ; case 1
	.short _0208F394 - _0208F28C - 2 ; case 2
	.short _0208F3B4 - _0208F28C - 2 ; case 3
	.short _0208F3D0 - _0208F28C - 2 ; case 4
	.short _0208F458 - _0208F28C - 2 ; case 5
	.short _0208F478 - _0208F28C - 2 ; case 6
	.short _0208F2F8 - _0208F28C - 2 ; case 7
_0208F29C:
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r5, r0
	ble _0208F2B2
	mov r0, #2
	add r1, r0, #0
	bl sub_02017FE4
	add r5, r0, #0
_0208F2B2:
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F2DA
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	b _0208F2EC
_0208F2DA:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0208F550
	add r0, r4, #0
	mov r1, #1
	bl sub_0208F5C8
_0208F2EC:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0208F504
	pop {r3, r4, r5, r6, r7, pc}
_0208F2F8:
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r5, r0
	ble _0208F30E
	mov r0, #2
	add r1, r0, #0
	bl sub_02017FE4
	add r5, r0, #0
_0208F30E:
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F336
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	pop {r3, r4, r5, r6, r7, pc}
_0208F336:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0208F550
	add r0, r4, #0
	mov r1, #1
	bl sub_0208F5C8
	pop {r3, r4, r5, r6, r7, pc}
_0208F34A:
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F378
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	pop {r3, r4, r5, r6, r7, pc}
_0208F378:
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_0208F550
	pop {r3, r4, r5, r6, r7, pc}
_0208F394:
	mov r1, #0
	bl sub_0208F5C8
	mov r0, #0
	mov r1, #0x37
	bl sub_02017FE4
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	pop {r3, r4, r5, r6, r7, pc}
_0208F3B4:
	add r1, r5, #0
	mov r2, #0
	bl sub_0208F550
	add r0, r4, #0
	mov r1, #1
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0208F504
	pop {r3, r4, r5, r6, r7, pc}
_0208F3D0:
	add r2, r6, #0
	bl sub_02072788
	cmp r0, #1
	bne _0208F416
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F402
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	b _0208F450
_0208F402:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0208F550
	add r0, r4, #0
	mov r1, #1
	bl sub_0208F5C8
	b _0208F450
_0208F416:
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F43E
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	b _0208F450
_0208F43E:
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
_0208F450:
	add r0, r4, #0
	bl sub_0208F648
	pop {r3, r4, r5, r6, r7, pc}
_0208F458:
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208F500
	mov r0, #1
	mov r1, #2
	bl sub_02017FE4
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_0208F550
	pop {r3, r4, r5, r6, r7, pc}
_0208F478:
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r5, r0
	ble _0208F486
	mov r5, #0
_0208F486:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_02072788
	cmp r0, #0
	bne _0208F4EC
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x98
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x95
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x92
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x96
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x93
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x97
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x94
	add r2, sp, #0
	bl SetBoxMonData
_0208F4EC:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0208F504
_0208F500:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0208F270

	thumb_func_start sub_0208F504
sub_0208F504: ; 0x0208F504
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl PlayerProfile_GetTrainerID
	str r0, [sp, #4]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	bl PlayerProfile_GetPlayerName_NewString
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #7
	add r2, sp, #4
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x9d
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x91
	add r2, r4, #0
	bl SetBoxMonData
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0208F504

	thumb_func_start sub_0208F550
sub_0208F550: ; 0x0208F550
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, sp, #0
	add r4, r2, #0
	bl GF_RTC_CopyDate
	cmp r4, #0
	add r2, sp, #0x24
	bne _0208F596
	add r0, r5, #0
	mov r1, #0x98
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x92
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x93
	add r2, sp, #4
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x94
	add r2, sp, #8
	bl SetBoxMonData
	add sp, #0x10
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
_0208F596:
	add r0, r5, #0
	mov r1, #0x99
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x95
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x96
	add r2, sp, #4
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x97
	add r2, sp, #8
	bl SetBoxMonData
	add sp, #0x10
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end sub_0208F550

	thumb_func_start sub_0208F5C8
sub_0208F5C8: ; 0x0208F5C8
	push {r3, r4, lr}
	sub sp, #4
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	cmp r1, #0
	add r2, sp, #0
	bne _0208F600
	mov r1, #0x98
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x92
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x93
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x94
	add r2, sp, #0
	bl SetBoxMonData
	add sp, #4
	pop {r3, r4, pc}
_0208F600:
	mov r1, #0x99
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x95
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x96
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x97
	add r2, sp, #0
	bl SetBoxMonData
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0208F5C8

	thumb_func_start sub_0208F628
sub_0208F628: ; 0x0208F628
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x9c
	add r2, sp, #0
	bl SetBoxMonData
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208F628

	thumb_func_start sub_0208F648
sub_0208F648: ; 0x0208F648
	push {r3, lr}
	mov r1, #1
	str r1, [sp]
	mov r1, #0x6e
	add r2, sp, #0
	bl SetBoxMonData
	pop {r3, pc}
	thumb_func_end sub_0208F648

	thumb_func_start sub_0208F658
sub_0208F658: ; 0x0208F658
	ldr r3, _0208F664 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _0208F668 ; =_02105430
	mov r1, #0xb
	bx r3
	nop
_0208F664: .word sub_0203410C
_0208F668: .word _02105430
	thumb_func_end sub_0208F658

	thumb_func_start sub_0208F66C
sub_0208F66C: ; 0x0208F66C
	cmp r0, #0xc
	bne _0208F674
	mov r0, #0xc
	bx lr
_0208F674:
	cmp r0, #6
	bhs _0208F67C
	add r0, r0, #6
	bx lr
_0208F67C:
	sub r0, r0, #6
	bx lr
	thumb_func_end sub_0208F66C

	thumb_func_start sub_0208F680
sub_0208F680: ; 0x0208F680
	push {r4, r5, r6, lr}
	add r3, #0x88
	add r5, r0, #0
	add r6, r2, #0
	ldr r4, [r3]
	bl sub_0203769C
	cmp r5, r0
	beq _0208F6EA
	ldr r0, _0208F6EC ; =0x00002228
	mov r2, #0x59
	ldr r0, [r4, r0]
	add r1, r6, #0
	lsl r2, r2, #4
	bl memcpy
	ldr r0, [r4, #0x64]
	add r2, r0, #1
	mov r0, #0x59
	lsl r0, r0, #4
	add r1, r2, #0
	mul r1, r0
	str r2, [r4, #0x64]
	cmp r1, r0
	blt _0208F6D6
	bl sub_0203769C
	cmp r0, #1
	bne _0208F6C6
	add r0, r4, #0
	mov r1, #0x1b
	mov r2, #0
	bl ov65_0221DE24
	b _0208F6E4
_0208F6C6:
	bl sub_0203769C
	ldr r1, _0208F6F0 ; =0x00002224
	ldr r2, [r4, #0x5c]
	ldr r1, [r4, r1]
	bl ov65_0221DE64
	b _0208F6E4
_0208F6D6:
	bl sub_0203769C
	ldr r1, _0208F6F0 ; =0x00002224
	ldr r2, [r4, #0x5c]
	ldr r1, [r4, r1]
	bl ov65_0221DE64
_0208F6E4:
	ldr r0, [r4, #0x5c]
	add r0, r0, #1
	str r0, [r4, #0x5c]
_0208F6EA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208F6EC: .word 0x00002228
_0208F6F0: .word 0x00002224
	thumb_func_end sub_0208F680

	thumb_func_start sub_0208F6F4
sub_0208F6F4: ; 0x0208F6F4
	push {r4, r5, r6, lr}
	add r3, #0x88
	add r5, r0, #0
	add r6, r2, #0
	ldr r4, [r3]
	bl sub_0203769C
	cmp r5, r0
	beq _0208F710
	ldrb r0, [r6]
	bl sub_0208F66C
	add r4, #0x98
	str r0, [r4]
_0208F710:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208F6F4

	thumb_func_start sub_0208F714
sub_0208F714: ; 0x0208F714
	add r3, #0x88
	ldrb r2, [r2]
	ldr r1, [r3]
	lsl r0, r0, #2
	add r0, r1, r0
	str r2, [r0, #0x6c]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F714

	thumb_func_start sub_0208F724
sub_0208F724: ; 0x0208F724
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F724

	thumb_func_start sub_0208F728
sub_0208F728: ; 0x0208F728
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F728

	thumb_func_start sub_0208F72C
sub_0208F72C: ; 0x0208F72C
	add r3, #0x88
	ldr r0, [r3]
	mov r1, #2
	str r1, [r0, #0x60]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F72C

	thumb_func_start sub_0208F738
sub_0208F738: ; 0x0208F738
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F738

	thumb_func_start sub_0208F73C
sub_0208F73C: ; 0x0208F73C
	add r3, #0x88
	ldrb r2, [r2]
	ldr r1, [r3]
	ldr r0, _0208F748 ; =0x000022CC
	str r2, [r1, r0]
	bx lr
	.balign 4, 0
_0208F748: .word 0x000022CC
	thumb_func_end sub_0208F73C

	thumb_func_start sub_0208F74C
sub_0208F74C: ; 0x0208F74C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r3, #0xc]
	add r5, r2, #0
	bl sub_0202D95C
	add r4, r0, #0
	bl sub_0203769C
	cmp r6, r0
	beq _0208F778
	mov r2, #0
_0208F764:
	ldrb r1, [r5, r2]
	cmp r1, #0
	beq _0208F772
	ldrb r0, [r4, r2]
	cmp r0, r1
	beq _0208F772
	strb r1, [r4, r2]
_0208F772:
	add r2, r2, #1
	cmp r2, #0xe
	blt _0208F764
_0208F778:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208F74C

	thumb_func_start sub_0208F77C
sub_0208F77C: ; 0x0208F77C
	push {r4, r5, r6, lr}
	add r3, #0x88
	add r5, r0, #0
	add r6, r2, #0
	ldr r4, [r3]
	bl sub_0203769C
	cmp r5, r0
	beq _0208F7A0
	ldr r0, _0208F7A4 ; =0x00002230
	add r1, r6, #0
	ldr r0, [r4, r0]
	mov r2, #1
	mov r3, #0x1a
	bl sub_0202AF28
	mov r0, #3
	str r0, [r4, #0x60]
_0208F7A0:
	pop {r4, r5, r6, pc}
	nop
_0208F7A4: .word 0x00002230
	thumb_func_end sub_0208F77C

	thumb_func_start sub_0208F7A8
sub_0208F7A8: ; 0x0208F7A8
	push {r4, r5, r6, lr}
	add r3, #0x88
	add r5, r0, #0
	add r6, r2, #0
	ldr r4, [r3]
	bl sub_0203769C
	cmp r5, r0
	beq _0208F7DA
	ldr r1, _0208F7DC ; =0x00002E20
	mov r2, #0xfb
	add r3, r4, r1
	lsl r2, r2, #2
	add r1, r5, #0
	mul r1, r2
	add r0, r6, #0
	add r1, r3, r1
	sub r2, r2, #4
	bl MIi_CpuCopyFast
	mov r0, #4
	str r0, [r4, #0x60]
	mov r0, #0
	bl sub_020378E4
_0208F7DA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0208F7DC: .word 0x00002E20
	thumb_func_end sub_0208F7A8

	thumb_func_start sub_0208F7E0
sub_0208F7E0: ; 0x0208F7E0
	add r0, #0x88
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F7E0

	thumb_func_start sub_0208F7E8
sub_0208F7E8: ; 0x0208F7E8
	mov r0, #0xfb
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F7E8

	thumb_func_start sub_0208F7F0
sub_0208F7F0: ; 0x0208F7F0
	mov r0, #0xe
	bx lr
	thumb_func_end sub_0208F7F0

	thumb_func_start sub_0208F7F4
sub_0208F7F4: ; 0x0208F7F4
	mov r0, #0x88
	bx lr
	thumb_func_end sub_0208F7F4

	thumb_func_start sub_0208F7F8
sub_0208F7F8: ; 0x0208F7F8
	mov r0, #0x59
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208F7F8

	thumb_func_start sub_0208F800
sub_0208F800: ; 0x0208F800
	add r1, #0x88
	ldr r2, [r1]
	mov r1, #0x23
	lsl r1, r1, #8
	add r2, r2, r1
	mov r1, #0x59
	lsl r1, r1, #4
	mul r1, r0
	add r0, r2, r1
	bx lr
	thumb_func_end sub_0208F800

	thumb_func_start sub_0208F814
sub_0208F814: ; 0x0208F814
	ldr r3, _0208F820 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _0208F824 ; =_021054B4
	mov r1, #0x6e
	bx r3
	nop
_0208F820: .word sub_0203410C
_0208F824: .word _021054B4
	thumb_func_end sub_0208F814

	thumb_func_start sub_0208F828
sub_0208F828: ; 0x0208F828
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0208F886
	mov r3, #0xfb
	lsl r3, r3, #2
	ldrb r2, [r5, r3]
	sub r0, r3, #4
	add r1, r2, #0
	mul r1, r0
	mov r0, #0xe1
	lsl r0, r0, #6
	cmp r1, r0
	ldr r2, _0208F8B4 ; =0x000043D0
	ble _0208F85C
	add r2, r4, r2
	add r1, r2, r1
	mov r2, #0x19
	add r0, r5, #0
	lsl r2, r2, #4
	bl MIi_CpuCopyFast
	b _0208F868
_0208F85C:
	add r2, r4, r2
	add r1, r2, r1
	add r0, r5, #0
	sub r2, r3, #4
	bl MIi_CpuCopyFast
_0208F868:
	mov r1, #0xb5
	ldr r0, _0208F8B4 ; =0x000043D0
	lsl r1, r1, #2
	mov r2, #0xe1
	ldr r1, [r4, r1]
	add r0, r4, r0
	lsl r2, r2, #6
	bl MIi_CpuCopyFast
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r4, r0
	bl CopyWindowToVram
	pop {r3, r4, r5, pc}
_0208F886:
	ldr r1, _0208F8B8 ; =0x000043CC
	mov r0, #0xfa
	ldr r2, [r4, r1]
	lsl r0, r0, #2
	add r3, r2, #0
	mul r3, r0
	mov r0, #0xe1
	lsl r0, r0, #6
	cmp r3, r0
	bge _0208F8A8
	add r0, r2, #1
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl sub_0208FAF8
	pop {r3, r4, r5, pc}
_0208F8A8:
	mov r1, #0
	mov r0, #0x7c
	add r2, r1, #0
	bl sub_02037108
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208F8B4: .word 0x000043D0
_0208F8B8: .word 0x000043CC
	thumb_func_end sub_0208F828

	thumb_func_start sub_0208F8BC
sub_0208F8BC: ; 0x0208F8BC
	push {r3, r4}
	cmp r0, #0
	beq _0208F8DA
	add r4, r0, #0
	mov r1, #0xa
	mul r4, r1
	ldr r0, _0208F8E0 ; =0x000093BD
	add r3, r3, r4
	add r3, r3, r0
_0208F8CE:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _0208F8CE
_0208F8DA:
	pop {r3, r4}
	bx lr
	nop
_0208F8E0: .word 0x000093BD
	thumb_func_end sub_0208F8BC

	thumb_func_start sub_0208F8E4
sub_0208F8E4: ; 0x0208F8E4
	push {r4, r5, r6, r7}
	cmp r3, #0
	beq _0208F90E
	cmp r0, #0
	bne _0208F90E
	ldr r0, _0208F914 ; =0x00004382
	mov r7, #0
_0208F8F2:
	add r6, r2, #0
	add r5, r3, r0
	mov r4, #0xa
_0208F8F8:
	ldrb r1, [r6]
	add r6, r6, #1
	strb r1, [r5]
	add r5, r5, #1
	sub r4, r4, #1
	bne _0208F8F8
	add r7, r7, #1
	add r2, #0xa
	add r3, #0xa
	cmp r7, #5
	blt _0208F8F2
_0208F90E:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0208F914: .word 0x00004382
	thumb_func_end sub_0208F8E4

	thumb_func_start sub_0208F918
sub_0208F918: ; 0x0208F918
	push {r4, lr}
	add r4, r3, #0
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov37_021E6FC8
	ldr r1, _0208F958 ; =0x000043D0
	mov r2, #0xe1
	mov r0, #0
	add r1, r4, r1
	lsl r2, r2, #6
	bl MIi_CpuClearFast
	bl sub_0203769C
	cmp r0, #0
	bne _0208F956
	bl sub_02037454
	mov r1, #0xc6
	lsl r1, r1, #2
	str r0, [r4, r1]
	bl sub_02033250
	mov r1, #0xc7
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0208F95C ; =0x000093F4
	mov r1, #1
	str r1, [r4, r0]
_0208F956:
	pop {r4, pc}
	.balign 4, 0
_0208F958: .word 0x000043D0
_0208F95C: .word 0x000093F4
	thumb_func_end sub_0208F918

	thumb_func_start sub_0208F960
sub_0208F960: ; 0x0208F960
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r6, #0
	beq _0208F9FA
	bl sub_0203769C
	cmp r0, #0
	bne _0208FA44
	ldrb r0, [r5]
	add r1, sp, #0
	strb r0, [r1]
	ldrb r0, [r5, #1]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	strb r0, [r1, #2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #3]
	mov r0, #0xc6
	strb r6, [r1]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0208F99C
	cmp r0, #1
	b _0208F9EC
_0208F99C:
	bl sub_02037454
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, r0
	bne _0208F9CA
	bl ov37_021E75E0
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, r0
	bne _0208F9CA
	bl sub_02033250
	bl MATH_CountPopulation
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, r0
	beq _0208F9D2
_0208F9CA:
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #3]
	b _0208F9EC
_0208F9D2:
	ldr r0, _0208FA48 ; =0x000093B4
	mov r1, #1
	add r2, r1, #0
	ldr r3, [r4, r0]
	lsl r2, r6
	orr r2, r3
	str r2, [r4, r0]
	add r0, sp, #0
	strb r1, [r0, #3]
	bl sub_02037454
	bl sub_02038C1C
_0208F9EC:
	mov r0, #0x7e
	add r1, sp, #0
	mov r2, #4
	bl sub_02037108
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208F9FA:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0208FA08
	cmp r0, #1
	beq _0208FA3A
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FA08:
	ldrb r6, [r5]
	bl sub_0203769C
	cmp r6, r0
	bne _0208FA44
	ldrb r0, [r5, #3]
	cmp r0, #0
	bne _0208FA26
	add r0, r4, #0
	mov r1, #9
	add r2, r6, #0
	bl ov37_021E6FC8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FA26:
	ldrb r1, [r5, #1]
	ldr r0, _0208FA4C ; =0x000093B8
	strh r1, [r4, r0]
	ldrb r2, [r5]
	add r0, r4, #0
	mov r1, #8
	bl ov37_021E6FC8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FA3A:
	ldrb r2, [r5]
	add r0, r4, #0
	mov r1, #0x15
	bl ov37_021E6FC8
_0208FA44:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0208FA48: .word 0x000093B4
_0208FA4C: .word 0x000093B8
	thumb_func_end sub_0208F960

	thumb_func_start sub_0208FA50
sub_0208FA50: ; 0x0208FA50
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FA50

	thumb_func_start sub_0208FA54
sub_0208FA54: ; 0x0208FA54
	push {r4, lr}
	ldrb r2, [r2]
	add r4, r3, #0
	add r0, r4, #0
	mov r1, #1
	bl ov37_021E6FC8
	bl sub_0203769C
	cmp r0, #0
	bne _0208FA82
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0208FA82
	ldr r1, _0208FA84 ; =0x000043CC
	mov r0, #0
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl sub_0208FAF8
_0208FA82:
	pop {r4, pc}
	.balign 4, 0
_0208FA84: .word 0x000043CC
	thumb_func_end sub_0208FA54

	thumb_func_start sub_0208FA88
sub_0208FA88: ; 0x0208FA88
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FA88

	thumb_func_start sub_0208FA8C
sub_0208FA8C: ; 0x0208FA8C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FA8C

	thumb_func_start sub_0208FA90
sub_0208FA90: ; 0x0208FA90
	push {r4, lr}
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0208FAA6
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0
	bl ov37_021E6FC8
_0208FAA6:
	pop {r4, pc}
	thumb_func_end sub_0208FA90

	thumb_func_start sub_0208FAA8
sub_0208FAA8: ; 0x0208FAA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0208FABA
	bl GF_AssertFail
_0208FABA:
	bl sub_0203769C
	cmp r0, #0
	bne _0208FADE
	ldr r0, _0208FAE8 ; =0x000093FC
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0208FADA
	add r0, sp, #0
	strb r5, [r0]
	mov r0, #0x7b
	add r1, sp, #0
	mov r2, #1
	bl sub_02037108
	b _0208FADE
_0208FADA:
	mov r1, #1
	str r1, [r4, r0]
_0208FADE:
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208FAE8: .word 0x000093FC
	thumb_func_end sub_0208FAA8

	thumb_func_start sub_0208FAEC
sub_0208FAEC: ; 0x0208FAEC
	ldr r0, _0208FAF4 ; =0x000093F4
	mov r1, #1
	str r1, [r3, r0]
	bx lr
	.balign 4, 0
_0208FAF4: .word 0x000093F4
	thumb_func_end sub_0208FAEC

	thumb_func_start sub_0208FAF8
sub_0208FAF8: ; 0x0208FAF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb5
	mov r2, #0xfa
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	lsl r2, r2, #2
	add r0, r4, #0
	mul r0, r2
	add r0, r1, r0
	ldr r1, _0208FB44 ; =0x00007C10
	add r1, r5, r1
	bl MIi_CpuCopyFast
	ldr r0, _0208FB44 ; =0x00007C10
	mov r2, #0
	add r1, r2, #0
	add r3, r5, r0
_0208FB1E:
	ldr r0, [r3]
	add r1, r1, #1
	eor r2, r0
	add r3, r3, #4
	cmp r1, #0xfa
	blt _0208FB1E
	ldr r0, _0208FB48 ; =0x00007FF8
	ldr r1, _0208FB44 ; =0x00007C10
	str r2, [r5, r0]
	add r0, r0, #4
	mov r2, #0x3f
	strb r4, [r5, r0]
	mov r0, #0x76
	add r1, r5, r1
	lsl r2, r2, #4
	bl sub_02037088
	pop {r3, r4, r5, pc}
	nop
_0208FB44: .word 0x00007C10
_0208FB48: .word 0x00007FF8
	thumb_func_end sub_0208FAF8

	thumb_func_start sub_0208FB4C
sub_0208FB4C: ; 0x0208FB4C
	mov r2, #2
	lsl r2, r2, #0xe
	add r2, r1, r2
	mov r1, #0x3f
	lsl r1, r1, #4
	mul r1, r0
	add r0, r2, r1
	bx lr
	thumb_func_end sub_0208FB4C

	thumb_func_start sub_0208FB5C
sub_0208FB5C: ; 0x0208FB5C
	mov r0, #4
	bx lr
	thumb_func_end sub_0208FB5C

	thumb_func_start sub_0208FB60
sub_0208FB60: ; 0x0208FB60
	mov r0, #4
	bx lr
	thumb_func_end sub_0208FB60

	thumb_func_start sub_0208FB64
sub_0208FB64: ; 0x0208FB64
	ldr r3, _0208FB70 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _0208FB74 ; =_021059DC
	mov r1, #0x6e
	bx r3
	nop
_0208FB70: .word sub_0203410C
_0208FB74: .word _021059DC
	thumb_func_end sub_0208FB64

	thumb_func_start sub_0208FB78
sub_0208FB78: ; 0x0208FB78
	ldr r0, _0208FB84 ; =0x00004A08
	ldr r1, [r3, r0]
	add r1, r1, #1
	str r1, [r3, r0]
	bx lr
	nop
_0208FB84: .word 0x00004A08
	thumb_func_end sub_0208FB78

	thumb_func_start sub_0208FB88
sub_0208FB88: ; 0x0208FB88
	cmp r0, #0
	bne _0208FB92
	ldrb r1, [r2]
	ldr r0, _0208FB94 ; =0x00004A10
	str r1, [r3, r0]
_0208FB92:
	bx lr
	.balign 4, 0
_0208FB94: .word 0x00004A10
	thumb_func_end sub_0208FB88

	thumb_func_start sub_0208FB98
sub_0208FB98: ; 0x0208FB98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0208FBD8 ; =0x00004A08
	add r4, r3, #0
	mov r1, #0
	str r1, [r4, r0]
	mov r1, #1
	add r0, #0xc
	strb r1, [r4, r0]
	bl sub_0203769C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208FD3C
	add r0, r4, #0
	bl ov73_021E6B98
	lsl r2, r5, #0x18
	add r0, r4, #0
	mov r1, #0x19
	lsr r2, r2, #0x18
	bl ov73_021E705C
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	ldr r0, _0208FBDC ; =0x00000657
	bl PlaySE
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208FBD8: .word 0x00004A08
_0208FBDC: .word 0x00000657
	thumb_func_end sub_0208FB98

	thumb_func_start sub_0208FBE0
sub_0208FBE0: ; 0x0208FBE0
	add r0, r3, #0
	ldr r3, _0208FBEC ; =ov73_021E705C
	mov r1, #2
	mov r2, #0
	bx r3
	nop
_0208FBEC: .word ov73_021E705C
	thumb_func_end sub_0208FBE0

	thumb_func_start sub_0208FBF0
sub_0208FBF0: ; 0x0208FBF0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r6, #0
	beq _0208FC86
	bl sub_0203769C
	cmp r0, #0
	bne _0208FCD0
	ldrb r0, [r5]
	add r1, sp, #0
	strb r0, [r1]
	ldrb r0, [r5, #1]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	strb r0, [r1, #2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #3]
	ldr r0, _0208FCD4 ; =0x00004A1C
	strb r6, [r1]
	ldr r0, [r4, r0]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0208FC2A
	cmp r0, #1
	b _0208FC78
_0208FC2A:
	bl sub_02037454
	ldr r1, _0208FCD4 ; =0x00004A1C
	ldr r1, [r4, r1]
	cmp r1, r0
	bne _0208FC52
	bl ov73_021E7488
	ldr r1, _0208FCD4 ; =0x00004A1C
	ldr r1, [r4, r1]
	cmp r1, r0
	bne _0208FC52
	bl sub_02033250
	bl MATH_CountPopulation
	ldr r1, _0208FCD4 ; =0x00004A1C
	ldr r2, [r4, r1]
	cmp r2, r0
	beq _0208FC5A
_0208FC52:
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #3]
	b _0208FC78
_0208FC5A:
	add r0, r1, #0
	add r0, #8
	mov r2, #1
	ldr r3, [r4, r0]
	add r0, r2, #0
	lsl r0, r6
	orr r0, r3
	add r1, #8
	str r0, [r4, r1]
	add r0, sp, #0
	strb r2, [r0, #3]
	bl sub_02037454
	bl sub_02038C1C
_0208FC78:
	mov r0, #0x70
	add r1, sp, #0
	mov r2, #4
	bl sub_02037030
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FC86:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0208FC94
	cmp r0, #1
	beq _0208FCC6
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FC94:
	ldrb r6, [r5]
	bl sub_0203769C
	cmp r6, r0
	bne _0208FCD0
	ldrb r0, [r5, #3]
	cmp r0, #0
	bne _0208FCB2
	add r0, r4, #0
	mov r1, #8
	add r2, r6, #0
	bl ov73_021E705C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FCB2:
	ldrb r1, [r5, #1]
	ldr r0, _0208FCD8 ; =0x00004A30
	strh r1, [r4, r0]
	ldrb r2, [r5]
	add r0, r4, #0
	mov r1, #7
	bl ov73_021E705C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0208FCC6:
	ldrb r2, [r5]
	add r0, r4, #0
	mov r1, #0x13
	bl ov73_021E705C
_0208FCD0:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0208FCD4: .word 0x00004A1C
_0208FCD8: .word 0x00004A30
	thumb_func_end sub_0208FBF0

	thumb_func_start sub_0208FCDC
sub_0208FCDC: ; 0x0208FCDC
	push {r4, lr}
	ldrb r2, [r2]
	add r4, r3, #0
	add r0, r4, #0
	mov r1, #1
	bl ov73_021E7120
	bl sub_0203769C
	cmp r0, #0
	bne _0208FCFA
	mov r0, #0xe1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0208FCFA:
	pop {r4, pc}
	thumb_func_end sub_0208FCDC

	thumb_func_start sub_0208FCFC
sub_0208FCFC: ; 0x0208FCFC
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FCFC

	thumb_func_start sub_0208FD00
sub_0208FD00: ; 0x0208FD00
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208FD00

	thumb_func_start sub_0208FD04
sub_0208FD04: ; 0x0208FD04
	push {r4, lr}
	add r4, r3, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0208FD1A
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	bl ov73_021E705C
_0208FD1A:
	pop {r4, pc}
	thumb_func_end sub_0208FD04

	thumb_func_start sub_0208FD1C
sub_0208FD1C: ; 0x0208FD1C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _0208FD38
	add r0, sp, #0
	strb r4, [r0]
	mov r0, #0x6e
	add r1, sp, #0
	mov r2, #1
	bl sub_02037030
_0208FD38:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0208FD1C

	thumb_func_start sub_0208FD3C
sub_0208FD3C: ; 0x0208FD3C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0xe2
	mov r3, #0
	lsl r0, r0, #2
	add r5, r4, r0
	add r2, r3, #0
	sub r0, #0x9a
_0208FD4C:
	ldr r1, [r5]
	add r2, r2, #1
	eor r3, r1
	add r5, r5, #4
	cmp r2, r0
	blt _0208FD4C
	mov r0, #0x3d
	lsl r0, r0, #6
	str r3, [r4, r0]
	bl LCRandom
	ldr r1, _0208FD78 ; =0x00000F44
	mov r2, #0x2f
	str r0, [r4, r1]
	mov r1, #0xe2
	lsl r1, r1, #2
	mov r0, #0x74
	add r1, r4, r1
	lsl r2, r2, #6
	bl sub_02036FD8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208FD78: .word 0x00000F44
	thumb_func_end sub_0208FD3C

	thumb_func_start sub_0208FD7C
sub_0208FD7C: ; 0x0208FD7C
	mov r0, #0
	bx lr
	thumb_func_end sub_0208FD7C

	thumb_func_start sub_0208FD80
sub_0208FD80: ; 0x0208FD80
	mov r0, #1
	bx lr
	thumb_func_end sub_0208FD80

	thumb_func_start sub_0208FD84
sub_0208FD84: ; 0x0208FD84
	mov r0, #4
	bx lr
	thumb_func_end sub_0208FD84

	thumb_func_start sub_0208FD88
sub_0208FD88: ; 0x0208FD88
	ldr r2, _0208FD98 ; =0x00000F48
	add r2, r1, r2
	mov r1, #0x2f
	lsl r1, r1, #6
	mul r1, r0
	add r0, r2, r1
	bx lr
	nop
_0208FD98: .word 0x00000F48
	thumb_func_end sub_0208FD88

	.rodata

_0210125C:
	.byte 0x03, 0x04, 0x04, 0x04
_02101260:
	.word ov91_0225C540, ov91_0225C58C, ov91_0225C9EC, SDK_OVERLAY_OVY_91_ID
_02101270:
	.word ov92_0225CAB4, ov92_0225CDF4, ov92_0225D36C, SDK_OVERLAY_OVY_92_ID
_02101280:
	.word ov44_02232EA8, ov44_02232F64, ov44_022330A8, SDK_OVERLAY_OVY_44_ID
_02101290:
	.word ov44_0222A4B4, ov44_0222A60C, ov44_0222A758, SDK_OVERLAY_OVY_44_ID
_021012A0:
	.word ov93_0225C540, ov93_0225C574, ov93_0225C6C0, SDK_OVERLAY_OVY_93_ID
_021012B0:
	.byte 0x01, 0x03, 0x1A, 0x03, 0x01, 0x0A, 0x1A, 0x0A, 0x01, 0x11, 0x1A, 0x11
_021012BC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021012CC:
	.byte 0x00, 0x02, 0x04, 0x01, 0x03, 0x05
	.byte 0x01, 0x03, 0x05, 0x00, 0x02, 0x04
	.byte 0x04, 0x02, 0x00, 0x05, 0x03, 0x01
	.byte 0x05, 0x03, 0x01, 0x04, 0x02, 0x00
_021012E4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101300:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210131C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101338:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02101354:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101370:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210138C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021013A8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021013C4:
	.short 0x000F, 0x0013, 0x0039, 0x0046, 0x00F9, 0x007F
	.short 0x01AF, 0x00FA, 0x0094, 0x0064, 0x005B, 0x00E6, 0x01C0, 0x001D
	.short 0x00D0, 0x0087
_021013E4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_0210140C:
	.byte 0x40, 0x19, 0x00, 0x00
	.byte 0x07, 0x02, 0x07, 0x01, 0xC0, 0x21, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02, 0x40, 0x49, 0x00, 0x00
	.byte 0x00, 0x04, 0x01, 0x03, 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04, 0x40, 0x79, 0x00, 0x00
	.byte 0x02, 0x07, 0x03, 0x05, 0xC0, 0x81, 0x00, 0x00, 0x03, 0x07, 0x04, 0x07, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x01, 0x05, 0x00
_0210144C:
	.byte 0x40, 0x19, 0x00, 0x00
	.byte 0x04, 0x02, 0x01, 0x01, 0xC0, 0x19, 0x00, 0x00, 0x07, 0x03, 0x00, 0x00, 0x40, 0x49, 0x00, 0x00
	.byte 0x00, 0x04, 0x03, 0x03, 0xC0, 0x49, 0x00, 0x00, 0x01, 0x05, 0x02, 0x02, 0x40, 0x79, 0x00, 0x00
	.byte 0x02, 0x00, 0x05, 0x05, 0xC0, 0x79, 0x00, 0x00, 0x03, 0x07, 0x04, 0x04, 0xE0, 0xA8, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x01, 0xFF, 0xFF
_0210148C:
	.byte 0x40, 0x19, 0x00, 0x00
	.byte 0x07, 0x02, 0x07, 0x01, 0xC0, 0x21, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02, 0x40, 0x49, 0x00, 0x00
	.byte 0x00, 0x04, 0x01, 0x03, 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04, 0x40, 0x79, 0x00, 0x00
	.byte 0x02, 0x06, 0x03, 0x05, 0xC0, 0x81, 0x00, 0x00, 0x03, 0x06, 0x04, 0x06, 0xE0, 0xA8, 0x00, 0x00
	.byte 0x05, 0x07, 0x05, 0x07, 0xE0, 0xB8, 0x00, 0x00, 0x06, 0x01, 0x06, 0x00
_021014CC:
	.byte 0x40, 0x19, 0x00, 0x00
	.byte 0x05, 0x02, 0x05, 0x01, 0xC0, 0x21, 0x00, 0x00, 0x05, 0x03, 0x00, 0x02, 0x40, 0x49, 0x00, 0x00
	.byte 0x00, 0x04, 0x01, 0x03, 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04, 0x40, 0x79, 0x00, 0x00
	.byte 0x02, 0x00, 0x03, 0x05, 0xC0, 0x81, 0x00, 0x00, 0x03, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210150C:
	.short 0x0000, 0x0000, 0x001E
	.short 0x0010, 0x0010, 0x000E
	.short 0x0010, 0x0001, 0x009E
	.short 0x0018, 0x0090, 0x0016
	.short 0x0000, 0x0006, 0x001E
	.short 0x0040, 0x0010, 0x003E
	.short 0x0010, 0x0007, 0x009E
	.short 0x0048, 0x0090, 0x0046
	.short 0x0000, 0x000C, 0x001E
	.short 0x0070, 0x0010, 0x006E
	.short 0x0010, 0x000D, 0x009E
	.short 0x0078, 0x0090, 0x0076
_02101554:
	.short 0x0000, 0x0000, 0x001E
	.short 0x0010, 0x0010, 0x000E
	.short 0x0010, 0x0000, 0x009E
	.short 0x0010, 0x0090, 0x000E
	.short 0x0000, 0x0006, 0x001E
	.short 0x0040, 0x0010, 0x003E
	.short 0x0010, 0x0006, 0x009E
	.short 0x0040, 0x0090, 0x003E
	.short 0x0000, 0x000C, 0x001E
	.short 0x0070, 0x0010, 0x006E
	.short 0x0010, 0x000C, 0x009E
	.short 0x0070, 0x0090, 0x006E
	.public _0210159C
_0210159C:
	.word sub_02078E30, sub_02079034, sub_020795E0, 0xFFFFFFFF
_021015AC:
	.short 0, 2, 6, 8, 3, 5, 1, 7
_021015BC:
	.short 0x0008, 0x0002, 0x0014, 0x000E
	.short 0x0009, 0x0003, 0x0015, 0x000F
	.short 0x000A, 0x0004, 0x0016, 0x0010
	.short 0x000B, 0x0005, 0x0017, 0x0011
	.short 0x000C, 0x0006, 0x0018, 0x0012
	.short 0x000D, 0x0007, 0x0019, 0x0013
_021015EC:
	.byte 0x10, 0x03, 0x10, 0x04
	.byte 0x10, 0x07, 0x10, 0x04
	.byte 0x10, 0x0B, 0x10, 0x04
	.byte 0x00, 0x02, 0x10, 0x04
	.byte 0x00, 0x06, 0x10, 0x04
	.byte 0x00, 0x0A, 0x10, 0x04
	.byte 0x00, 0x0E, 0x10, 0x04
	.byte 0x19, 0x13, 0x07, 0x05
	.byte 0x10, 0x02, 0x10, 0x04
	.byte 0x10, 0x06, 0x10, 0x04
	.byte 0x10, 0x0A, 0x10, 0x04
	.byte 0x10, 0x0E, 0x10, 0x04
_0210161C:
	.byte 0x01, 0x1A, 0x15, 0x05, 0x02, 0x00, 0x80, 0x01
_02101624:
	.byte 0x01, 0x19, 0x14, 0x07, 0x02, 0x00, 0x8A, 0x01
_0210162C:
	.byte 0x00, 0x02, 0x15, 0x14, 0x02, 0x0D, 0x98, 0x01
_02101634:
	.byte 0x00, 0x02, 0x13, 0x0D, 0x04, 0x0D, 0xC0, 0x01
_0210163C:
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0xF4, 0x01
_02101644:
	.byte 0x00, 0x13, 0x11, 0x0C, 0x06, 0x00, 0x60, 0x02
_0210164C:
	.byte 0x00, 0x13, 0x0F, 0x0C, 0x08, 0x00, 0x60, 0x02
_02101654:
	.byte 0x00, 0x11, 0x04, 0x0E, 0x02, 0x02, 0x60, 0x02
	.byte 0x00, 0x11, 0x08, 0x0E, 0x02, 0x02, 0x7C, 0x02
	.byte 0x00, 0x11, 0x0C, 0x0E, 0x02, 0x02, 0x98, 0x02
	.byte 0x00, 0x01, 0x03, 0x0E, 0x02, 0x02, 0xB4, 0x02
	.byte 0x00, 0x01, 0x07, 0x0E, 0x02, 0x02, 0xD0, 0x02
	.byte 0x00, 0x01, 0x0B, 0x0E, 0x02, 0x02, 0xEC, 0x02
	.byte 0x00, 0x01, 0x0F, 0x0E, 0x02, 0x02, 0x08, 0x03
	.byte 0x00, 0x1A, 0x14, 0x05, 0x03, 0x02, 0x24, 0x03
	.byte 0x00, 0x11, 0x03, 0x0E, 0x02, 0x02, 0x60, 0x02
	.byte 0x00, 0x11, 0x07, 0x0E, 0x02, 0x02, 0x7C, 0x02
	.byte 0x00, 0x11, 0x0B, 0x0E, 0x02, 0x02, 0x98, 0x02
	.byte 0x00, 0x11, 0x0F, 0x0E, 0x02, 0x02, 0xB4, 0x02
_021016B4:
	.byte 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x0A, 0x07, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x07, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0xFF, 0xFF
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x08, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0xFF
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x08, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0x06
	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0x06
_02101734:
// struct WindowTemplate[][5]
	.byte 0x01, 0x06, 0x01, 0x09, 0x02, 0x00, 0x48, 0x00
	.byte 0x01, 0x00, 0x04, 0x06, 0x02, 0x00, 0x5A, 0x00
	.byte 0x01, 0x07, 0x04, 0x08, 0x02, 0x00, 0x66, 0x00
	.byte 0x01, 0x08, 0x03, 0x06, 0x01, 0x03, 0x76, 0x00
	.byte 0x01, 0x06, 0x04, 0x0A, 0x02, 0x00, 0x66, 0x00
; 0x0210175C
	.byte 0x01, 0x16, 0x02, 0x09, 0x02, 0x00, 0x7C, 0x00
	.byte 0x01, 0x10, 0x05, 0x06, 0x02, 0x00, 0x8E, 0x00
	.byte 0x01, 0x17, 0x05, 0x08, 0x02, 0x00, 0x9A, 0x00
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
	.byte 0x01, 0x16, 0x05, 0x0A, 0x02, 0x00, 0x9A, 0x00
; 0x02101784
	.byte 0x01, 0x06, 0x07, 0x09, 0x02, 0x00, 0xB0, 0x00
	.byte 0x01, 0x00, 0x0A, 0x06, 0x02, 0x00, 0xC2, 0x00
	.byte 0x01, 0x07, 0x0A, 0x08, 0x02, 0x00, 0xCE, 0x00
	.byte 0x01, 0x08, 0x09, 0x06, 0x01, 0x05, 0xDE, 0x00
	.byte 0x01, 0x06, 0x0A, 0x0A, 0x02, 0x00, 0xCE, 0x00
; 0x021017AC
	.byte 0x01, 0x16, 0x08, 0x09, 0x02, 0x00, 0xE4, 0x00
	.byte 0x01, 0x10, 0x0B, 0x06, 0x02, 0x00, 0xF6, 0x00
	.byte 0x01, 0x17, 0x0B, 0x08, 0x02, 0x00, 0x02, 0x01
	.byte 0x01, 0x18, 0x0A, 0x06, 0x01, 0x06, 0x12, 0x01
	.byte 0x01, 0x16, 0x0B, 0x0A, 0x02, 0x00, 0x02, 0x01
; 0x021017D4
	.byte 0x01, 0x06, 0x0D, 0x09, 0x02, 0x00, 0x18, 0x01
	.byte 0x01, 0x00, 0x10, 0x06, 0x02, 0x00, 0x2A, 0x01
	.byte 0x01, 0x07, 0x10, 0x08, 0x02, 0x00, 0x36, 0x01
	.byte 0x01, 0x08, 0x0F, 0x06, 0x01, 0x07, 0x46, 0x01
	.byte 0x01, 0x06, 0x10, 0x0A, 0x02, 0x00, 0x36, 0x01
; 0x021017FC
	.byte 0x01, 0x16, 0x0E, 0x09, 0x02, 0x00, 0x4C, 0x01
	.byte 0x01, 0x10, 0x11, 0x06, 0x02, 0x00, 0x5E, 0x01
	.byte 0x01, 0x17, 0x11, 0x08, 0x02, 0x00, 0x6A, 0x01
	.byte 0x01, 0x18, 0x10, 0x06, 0x01, 0x08, 0x7A, 0x01
	.byte 0x01, 0x16, 0x11, 0x0A, 0x02, 0x00, 0x6A, 0x01
; 0x02101824
	.byte 0x01, 0x16, 0x01, 0x09, 0x02, 0x00, 0x7C, 0x00
	.byte 0x01, 0x11, 0x05, 0x05, 0x02, 0x00, 0x8E, 0x00
	.byte 0x01, 0x17, 0x05, 0x08, 0x02, 0x00, 0x9A, 0x00
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
; 0x0210184C
	.byte 0x01, 0x16, 0x08, 0x09, 0x02, 0x00, 0xE4, 0x00
	.byte 0x01, 0x11, 0x0B, 0x05, 0x02, 0x00, 0xF6, 0x00
	.byte 0x01, 0x17, 0x0B, 0x08, 0x02, 0x00, 0x02, 0x01
	.byte 0x01, 0x18, 0x0A, 0x06, 0x01, 0x06, 0x12, 0x01
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
; 0x02101874
	.byte 0x01, 0x16, 0x0E, 0x09, 0x02, 0x00, 0x4C, 0x01
	.byte 0x01, 0x11, 0x11, 0x05, 0x02, 0x00, 0x5E, 0x01
	.byte 0x01, 0x17, 0x11, 0x08, 0x02, 0x00, 0x6A, 0x01
	.byte 0x01, 0x18, 0x10, 0x06, 0x01, 0x08, 0x7A, 0x01
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04, 0xAA, 0x00
; 0x0210189C
	.byte 0x06, 0x07, 0x18, 0x0A, 0x02, 0x02, 0x01, 0x00
	.byte 0x06, 0x11, 0x18, 0x06, 0x02, 0x02, 0x15, 0x00
	.byte 0x06, 0x11, 0x1A, 0x0C, 0x03, 0x02, 0x21, 0x00
_021018B4:
	.short 0x0032, 0x0033, 0x0031, 0x0030, 0xFFFF, 0xFFFF, 0x0054, 0x0000
_021018C4:
	.byte 0x23, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
_021018D8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
_021018F8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101920:
	.byte 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x48, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101948:
	.byte 0x02, 0x00, 0x00, 0x00, 0xE8, 0x00, 0xA8, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101970:
	.byte 0x02, 0x00, 0x00, 0x00, 0xE8, 0x00, 0xB8, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101998:
	.byte 0x03, 0x00, 0x00, 0x00, 0x24, 0x00, 0x2C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x021019C0
	.byte 0x03, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x021019E8
	.byte 0x03, 0x00, 0x00, 0x00, 0x24, 0x00, 0x5C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x02101A10
	.byte 0x03, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x02101A38
	.byte 0x03, 0x00, 0x00, 0x00, 0x24, 0x00, 0x8C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
; 0x02101A60
	.byte 0x03, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101C68:
	.byte 0x0B, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101C90:
	.byte 0x03, 0x00, 0x00, 0x00, 0x32, 0x00, 0x94, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101CB8:
	.word sub_0207FB0C
	.word sub_02080768
	.word sub_0207F438
	.word sub_0207F4FC
	.word sub_0207F520
	.word sub_0207F73C
	.word sub_0207F800
	.word sub_0207F824
	.word sub_0207FA3C
	.word 0xFFFFFFFE
	.word 0xFFFFFFFE
	.word sub_0208050C
	.word sub_0208063C
	.word sub_02080728
	.word sub_02080788
	.word sub_02080748
	.word sub_020808D0
	.word sub_02080948
	.word sub_02080918
	.word sub_02080900
	.word sub_020808E8
	.word sub_02080960
	.word sub_02080930
	.word sub_02080978
	.word sub_02080990
	.word sub_020809A8
	.word sub_020809C0
	.word sub_020809D8
	.word sub_020809F0
	.word sub_02080A40
	.word sub_02080A08
	.word sub_02080A24
	.word 0xFFFFFFFE
_02101D3C:
	.byte 0x60, 0x68, 0x50, 0x58
_02101D40:
	.byte 0x04, 0x07, 0x0D, 0x0A
_02101D44:
	.byte 0x03, 0x06, 0x0C, 0x09, 0x09, 0x00, 0x00, 0x00
_02101D4C:
	.byte 0x28, 0x28, 0x28, 0x28
	.byte 0x29, 0x29, 0x29, 0x00
_02101D54:
	.byte 0x70, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00
_02101D60:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101D70:
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
_02101D80:
	.byte 0x19, 0x00, 0x39, 0x00, 0x59, 0x00, 0x61, 0x00, 0x7A, 0x00, 0x9E, 0x00, 0xC6, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x2B, 0x00, 0x20, 0x00, 0x2F, 0x00, 0x01, 0x00, 0x2B, 0x00, 0x3F, 0x00, 0x09, 0x00
	.byte 0x30, 0x00, 0xE2, 0x00, 0xFF, 0xFF, 0x8D, 0x00, 0x74, 0x00, 0x60, 0x00, 0x6A, 0x00, 0x2F, 0x00
	.byte 0x01, 0x00, 0x2B, 0x00, 0x3F, 0x00, 0x09, 0x00, 0x30, 0x00, 0xE2, 0x00, 0xFF, 0xFF
_02101DBE:
	.byte 0x02, 0xE0
	.byte 0x02, 0xE0, 0x03, 0xE0, 0x03, 0xE0, 0x04, 0xE0, 0x04, 0xE0, 0x04, 0xD0, 0x04, 0xD0, 0x07, 0xE0
	.byte 0x07, 0xE0, 0x07, 0xE0, 0x08, 0xE0, 0x08, 0xE0
_02101DD8:
	.byte 0x04, 0xD0, 0x04, 0xD0, 0x04, 0xD0, 0x04, 0xD0
	.byte 0x04, 0xD0, 0x04, 0xD0, 0x04, 0xD0, 0x04, 0xD0, 0x07, 0xE0, 0x07, 0xE0, 0x07, 0xE0, 0x08, 0xE0
	.byte 0x08, 0xE0
_02101DF2:
	.short 0x00E3, 0x00E4, 0x00F9, 0x00F8, 0x00E5, 0x00E6, 0x00F5
	.short 0x00F6, 0x00F7, 0x00E7, 0x0001, 0x00EE, 0x00EF, 0xFFFF, 0x0000
_02101E10:
	.short 0x0000, 0x0000, 0x0000, 0x0000, 0x0800, 0x0000, 0x0000, 0x0000
	.short 0x0001, 0x041F, 0x0000, 0x0000, 0x0000, 0x0000
_02101E2C:
	.short 0x01DE, 0x01DE
	.short 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE
	.short 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02101E48:
	.short 0x0107, 0x0108, 0x0109, 0x010A
	.short 0x010B, 0x010C, 0x010D, 0x010E, 0x0111, 0x010F, 0x0110, 0x0001
	.short 0x0001, 0xFFFF
_02101E64:
	.short 0x0121, 0x0122, 0x0123, 0x0124, 0x0125, 0x0126
	.short 0x0127, 0x0128, 0x0129, 0x012A, 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02101E80:
	.short 0x012B, 0x012C, 0x012D, 0x012E, 0x012F, 0x0130, 0x0131, 0x0132
	.short 0x0133, 0x0134, 0x01DE, 0x01AD, 0x01AE, 0xFFFF
_02101E9C:
	.short 0x0135, 0x0136, 0x0137, 0x0138, 0x0139, 0x013A, 0x013B, 0x013C, 0x013D, 0x013E, 0x01DE, 0x01B3, 0x01BE, 0xFFFF
_02101EB8:
	.short 0x013F, 0x0140, 0x0141, 0x0142, 0x0143, 0x0144, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01BB, 0x01BC, 0xFFFF
_02101ED4:
	.short 0x0000, 0x0000, 0x0000, 0x0000, 0x1000, 0x0000, 0x0000, 0x0000, 0x0003, 0x041E, 0x0100, 0x0000, 0x0000, 0x0000
_02101EF0:
	.short 0x0145, 0x0146, 0x0147, 0x0148, 0x0149, 0x014A, 0x014B, 0x014C, 0x014D, 0x014E, 0x01DE, 0x01AD, 0x01AE, 0xFFFF
_02101F0C:
	.short 0x014F, 0x0150, 0x0151, 0x0152, 0x0153, 0x0154, 0x0155, 0x0156, 0x0157, 0x0158, 0x01DE, 0x01B3, 0x01BE, 0xFFFF
_02101F28:
	.short 0x00FF, 0x0100, 0x0101, 0x0102, 0x0103, 0x00FC, 0x00FA, 0x00FD, 0x00FB, 0x00FE, 0x0105, 0x0001, 0x0001, 0xFFFF
_02101F44:
	.short 0x00E8, 0x00E9, 0x00EA, 0x00EB, 0x00EC, 0x00ED, 0x00F0, 0x00F1, 0x00F2, 0x00F3, 0x00F4, 0x0106, 0x0104, 0xFFFF
_02101F60:
	.short 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02101F7C:
	.short 0x00A2, 0x00A3, 0x00A4, 0x00A5, 0x00A6, 0x00A7, 0x00A8, 0x00A9, 0x00AA, 0x00AB, 0x0001, 0x00E1, 0x00E2, 0xFFFF
_02101F98:
	.short 0x01AD, 0x01AE, 0x01C4, 0x01C5, 0x01AB, 0x01AC, 0x01DE, 0x01DE, 0x01DE, 0x01BB, 0x01BC, 0x01DE, 0x01DE, 0xFFFF
_02101FB4:
	.short 0x0000, 0x0000, 0x0000, 0x0000, 0x1000, 0x0000, 0x0000, 0x0000, 0x0003, 0x041C, 0x0200, 0x0000, 0x0000, 0x0000
_02101FD0:
	.short 0x01B4, 0x01B5, 0x01B2, 0x01B3, 0x01B9, 0x01BA, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02101FEC:
	.short 0x01AF, 0x01B0, 0x01C3, 0x01D0, 0x01C0, 0x01D2, 0x01BD, 0x01BE, 0x01BF, 0x01B1, 0x01C1, 0x01DE, 0x01DE, 0xFFFF
_02102008:
	.short 0x01CB, 0x01CC, 0x01CD, 0x01CE, 0x01CF, 0x01C6, 0x01C8, 0x01C9, 0x01C7, 0x01CA, 0x01D1, 0x01DE, 0x01DE, 0xFFFF
_02102024:
	.short 0x0121, 0x0122, 0x0123, 0x0124, 0x0125, 0x0126, 0x0127, 0x0128, 0x0129, 0x012A, 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02102040:
	.short 0x01D3, 0x01D4, 0x01D5, 0x01D6, 0x01D7, 0x01D8, 0x01D9, 0x01DA, 0x01DD, 0x01DB, 0x01DC, 0x01DE, 0x01DE, 0xFFFF
_0210205C:
	.short 0x0159, 0x015A, 0x015B, 0x015C, 0x015D, 0x015E, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01BB, 0x01BC, 0xFFFF
_02102078:
	.short 0x0000, 0x0000, 0x0000, 0x0000, 0x0800, 0x0000, 0x0000, 0x0000, 0x0001, 0x001A, 0x0300, 0x0000, 0x0000, 0x0000, 0x008E, 0x0062, 0x0093, 0x00A1, 0x002F, 0x0001, 0x007C, 0x0074, 0x0060, 0x007E, 0x00F1, 0x0091, 0x0030, 0x00E2, 0xFFFF
	.balign 4, 0
_021020B4:
	.short 0x0000, 0x0000, 0x0001, 0x0000, 0x0002, 0x0000, 0x0003, 0x0000, 0x0004, 0x0000, 0x0005, 0x0000, 0x0006, 0x0000, 0x0008, 0x0000
_021020D4:
	.short 0x0121, 0x0122, 0x0123, 0x0124, 0x0125, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0xFFFF
_021020F8:
	.short 0x0126, 0x0127, 0x0128, 0x0129, 0x012A, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0xFFFF
_0210211C:
	.short 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0xFFFF
_02102140:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102168:
	.word  0,  0
	.word  0, -1
	.word  0,  1
	.word -1,  0
	.word  1,  0
_02102190:
	.short 0x0031, 0x0032
	.short 0x0034, 0x0035
	.short 0x0037, 0x0038
	.short 0x003A, 0x003B
	.short 0x003D, 0x003E
	.short 0x0081, 0x0082
	.short 0x0084, 0x0085
	.short 0x0087, 0x0088
	.short 0x008A, 0x008B
	.short 0x008D, 0x008E
_021021B8:
	.short 0x0024, 0x0026
	.short 0x0074, 0x0076
	.short 0x0032, 0x0031
	.short 0x0035, 0x0034
	.short 0x0038, 0x0037
	.short 0x003B, 0x003A
	.short 0x003E, 0x003D
	.short 0x0082, 0x0081
	.short 0x0085, 0x0084
	.short 0x0088, 0x0087
	.short 0x008B, 0x008A
	.short 0x008E, 0x008D
_021021E8:
	.byte 0x04, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x44, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_02102218:
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x65, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_02102238:
	.byte 0x88, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xB0, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102278:
	.byte 0x19, 0x3C, 0x00, 0x00, 0x00, 0x00, 0x39, 0x3C, 0x00, 0x00, 0x02, 0x00, 0x59, 0x3C, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x04, 0x00, 0x9D, 0x3C, 0x01, 0x00, 0x08, 0x00, 0xC5, 0x3C
	.byte 0x01, 0x00, 0x0B, 0x00, 0x1C, 0x58, 0x02, 0x00, 0x00, 0x01, 0x2C, 0x58, 0x02, 0x00, 0x01, 0x01
_021022A8:
	.short 0x583C, 0x0002, 0x0102
	.short 0x584C, 0x0002, 0x0103
	.short 0x585C, 0x0002, 0x0104
	.short 0x586C, 0x0002, 0x0105
	.short 0x587C, 0x0002, 0x0106
	.short 0x588C, 0x0002, 0x0107
	.short 0x589C, 0x0002, 0x0108
	.short 0x58AC, 0x0002, 0x0109
	.short 0x58BC, 0x0002, 0x010A
	.short 0x58CC, 0x0002, 0x010B
	.short 0x58DC, 0x0002, 0x010C
	.short 0x6B1C, 0x0002, 0x0200
	.short 0x6B2C, 0x0002, 0x0201
	.short 0x6B3C, 0x0002, 0x0202
	.short 0x6B4C, 0x0002, 0x0203
	.short 0x6B5C, 0x0002, 0x0204
	.short 0x6B6C, 0x0002, 0x0205
	.short 0x6B7C, 0x0002, 0x0206
	.short 0x6B8C, 0x0002, 0x0207
	.short 0x6B9C, 0x0002, 0x0208
	.short 0x6BAC, 0x0002, 0x0209
	.short 0x6BBC, 0x0002, 0x020A
	.short 0x6BCC, 0x0002, 0x020B
	.short 0x6BDC, 0x0002, 0x020C
	.short 0x7E1C, 0x0002, 0x0300
	.short 0x7E2C, 0x0002, 0x0301
	.short 0x7E3C, 0x0002, 0x0302
	.short 0x7E4C, 0x0002, 0x0303
	.short 0x7E5C, 0x0002, 0x0304
	.short 0x7E6C, 0x0002, 0x0305
	.short 0x7E7C, 0x0002, 0x0306
	.short 0x7E8C, 0x0002, 0x0307
	.short 0x7E9C, 0x0002, 0x0308
	.short 0x7EAC, 0x0002, 0x0309
	.short 0x7EBC, 0x0002, 0x030A
	.short 0x7ECC, 0x0002, 0x030B
	.short 0x7EDC, 0x0002, 0x030C
	.short 0x911C, 0x0002, 0x0400
	.short 0x912C, 0x0002, 0x0401
	.short 0x913C, 0x0002, 0x0402
	.short 0x914C, 0x0002, 0x0403
	.short 0x915C, 0x0002, 0x0404
	.short 0x916C, 0x0002, 0x0405
	.short 0x917C, 0x0002, 0x0406
	.short 0x918C, 0x0002, 0x0407
	.short 0x919C, 0x0002, 0x0408
	.short 0x91AC, 0x0002, 0x0409
	.short 0x91BC, 0x0002, 0x040A
	.short 0x91CC, 0x0002, 0x040B
	.short 0x91DC, 0x0002, 0x040C
	.short 0xA41C, 0x0002, 0x0500
	.short 0xA42C, 0x0002, 0x0501
	.short 0xA43C, 0x0002, 0x0502
	.short 0xA44C, 0x0002, 0x0503
	.short 0xA45C, 0x0002, 0x0504
	.short 0xA46C, 0x0002, 0x0505
	.short 0xA47C, 0x0002, 0x0506
	.short 0xA48C, 0x0002, 0x0507
	.short 0xA49C, 0x0002, 0x0508
	.short 0xA4AC, 0x0002, 0x0509
	.short 0xA4BC, 0x0002, 0x050A
	.short 0xA4CC, 0x0002, 0x050B
	.short 0xA4DC, 0x0002, 0x050C
_02102422:
	.short 0x0003, 0x0001, 0x0002
	.short 0x0005, 0x0001, 0x0004
	.short 0x0007, 0x0001, 0x0006
	.short 0x0009, 0x0001, 0x0008
	.short 0x000B, 0x0001, 0x000A
	.short 0x0053, 0x0001, 0x0052
	.short 0x0055, 0x0001, 0x0054
	.short 0x0057, 0x0001, 0x0056
	.short 0x0059, 0x0001, 0x0058
	.short 0x005B, 0x0001, 0x005A
	.short 0x0045, 0x0001, 0x0044
	.short 0x0047, 0x0001, 0x0046
	.short 0x0049, 0x0001, 0x0048
	.short 0x0095, 0x0001, 0x0094
	.short 0x0097, 0x0001, 0x0096
	.short 0x0099, 0x0001, 0x0098
	.short 0x00AC, 0x0001, 0x00C6
	.short 0x00AD, 0x0001, 0x00C7
	.short 0x00AE, 0x0001, 0x00C8
	.short 0x00AF, 0x0001, 0x00C9
	.short 0x00B0, 0x0001, 0x00CA
	.short 0x00B1, 0x0001, 0x00CB
	.short 0x00B2, 0x0001, 0x00CC
	.short 0x00B3, 0x0001, 0x00CD
	.short 0x00B4, 0x0001, 0x00CE
	.short 0x00B5, 0x0001, 0x00CF
	.short 0x00B6, 0x0001, 0x00D0
	.short 0x00B7, 0x0001, 0x00D1
	.short 0x00B8, 0x0001, 0x00D2
	.short 0x00B9, 0x0001, 0x00D3
	.short 0x00BA, 0x0001, 0x00D4
	.short 0x00BB, 0x0001, 0x00D5
	.short 0x00BC, 0x0001, 0x00D6
	.short 0x00BD, 0x0001, 0x00D7
	.short 0x00BE, 0x0001, 0x00D8
	.short 0x00BF, 0x0001, 0x00D9
	.short 0x00C0, 0x0001, 0x00DA
	.short 0x00C1, 0x0001, 0x00DB
	.short 0x00C2, 0x0001, 0x00DC
	.short 0x00C3, 0x0001, 0x00DD
	.short 0x00C4, 0x0001, 0x00DE
	.short 0x00C5, 0x0001, 0x00DF
	.short 0x0025, 0x0026, 0x0024
	.short 0x0075, 0x0076, 0x0074
	.short 0x000C, 0x000D, 0x0001
	.short 0x000E, 0x000F, 0x0001
	.short 0x0010, 0x0011, 0x0001
	.short 0x0012, 0x0013, 0x0001
	.short 0x0014, 0x0015, 0x0001
	.short 0x0016, 0x0017, 0x0001
	.short 0x0018, 0x0019, 0x0001
	.short 0x001A, 0x001B, 0x0001
	.short 0x001C, 0x001D, 0x0001
	.short 0x001E, 0x001F, 0x0001
	.short 0x0020, 0x0021, 0x0001
	.short 0x0022, 0x0023, 0x0001
	.short 0x0027, 0x0028, 0x0001
	.short 0x0029, 0x002A, 0x0001
	.short 0x005C, 0x005D, 0x0001
	.short 0x005E, 0x005F, 0x0001
	.short 0x0060, 0x0061, 0x0001
	.short 0x0062, 0x0063, 0x0001
	.short 0x0064, 0x0065, 0x0001
	.short 0x0066, 0x0067, 0x0001
	.short 0x0068, 0x0069, 0x0001
	.short 0x006A, 0x006B, 0x0001
	.short 0x006C, 0x006D, 0x0001
	.short 0x006E, 0x006F, 0x0001
	.short 0x0070, 0x0071, 0x0001
	.short 0x0072, 0x0073, 0x0001
	.short 0x0077, 0x0078, 0x0001
	.short 0x0079, 0x007A, 0x0001
	.short 0x0030, 0x0031, 0x0032
	.short 0x0033, 0x0034, 0x0035
	.short 0x0036, 0x0037, 0x0038
	.short 0x0039, 0x003A, 0x003B
	.short 0x003C, 0x003D, 0x003E
	.short 0x0080, 0x0081, 0x0082
	.short 0x0083, 0x0084, 0x0085
	.short 0x0086, 0x0087, 0x0088
	.short 0x0089, 0x008A, 0x008B
	.short 0x008C, 0x008D, 0x008E

	.balign 4, 0
	.public _02102610
_02102610:
	.word sub_02082908, sub_02082B20, sub_02082EE8, 0xFFFFFFFF
_02102620:
	.word sub_020850F4, sub_0208524C, sub_0208527C, 0xFFFFFFFF
_02102630:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_02102658:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x06, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021026AC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210271C:
	.word sub_02085820
	.word sub_02085938
	.word sub_02085974
	.word sub_020858DC
_0210272C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
_02102768:
	.short 0x0020, 0x0050, 0x0014, 0x0014
	.short 0x0050, 0x0050, 0x0014, 0x0014
	.short 0x0080, 0x0050, 0x0014, 0x0014
	.short 0x00B0, 0x0050, 0x0014, 0x0014
	.short 0x00E0, 0x0050, 0x0014, 0x0014
	.short 0x0020, 0x0080, 0x0014, 0x0014
	.short 0x0050, 0x0080, 0x0014, 0x0014
	.short 0x0080, 0x0080, 0x0014, 0x0014
	.short 0x00B0, 0x0080, 0x0014, 0x0014
	.short 0x00E0, 0x0080, 0x0014, 0x0014
	.short 0x0040, 0x00B0, 0x003C, 0x000C
	.short 0x00C0, 0x00B0, 0x003C, 0x000C
_021027C8:
	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00
_021027DC:
	.byte 0x60, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00
_021027F4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00
_02102814:
	.word 0x61
	.word 0x62
	.word 0x63
	.word 0x64
	.word 0x65
	.word 0x80
	.word 0x85
_02102830:
	.word sub_02087B10, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102840:
	.word sub_02087B58, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102850:
	.word sub_02087B4C, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102860:
	.word sub_02087B40, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102870:
	.word sub_02087B34, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102880:
	.word sub_02087B28, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_02102890:
	.word sub_02087B1C, sub_02087B64, sub_02087BAC, 0xFFFFFFFF
_021028A0:
	.word 0x61
	.word 0x63
	.word 0x64
	.word 0x65
	.word 0x66
_021028B4:
	.word sub_02087EF8, sub_02087F10, sub_02087F2C, SDK_OVERLAY_OVY_40_ID
_021028C4:
	.word sub_02087F04, sub_02087F10, sub_02087F2C, SDK_OVERLAY_OVY_40_ID
_021028D4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x83, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102988:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x82, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102A3C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102AF0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02102BA4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102F28
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102C58
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xE7, 0x03, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102A3C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102C58:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x82, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102D0C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x2D, 0x01, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xE7, 0x03, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102988
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102DC0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xE7, 0x03, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102988
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02102E74:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xE7, 0x03, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102AF0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102F28:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102FDC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xE7, 0x03, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB
_02103044:
	.word _021028D4
_02103048:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103090:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02103144:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x2E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02103090
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021031F8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02103144
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021032AC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103360:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB
	.word _021032AC
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02103414:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021034C8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02103414
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02103360
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210357C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _021034C8
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103630:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
_02103650:
	.word _021034C8
_02103654:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021036E4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x3A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xE7, 0x03, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.word _021028D4
	.byte 0x00, 0x00, 0x00, 0x00
_02103754:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
_021037B8:
	.word _02103630
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _021031F8
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102BA4
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102D0C
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102E74
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _02102FDC
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB, 0xFB
	.word _021036E4
_02103894:
	.short 0x20, 0x80, 0x200, 0x800, 0x40, 0x80, 0x100, 0x400, 0x40, 0x80, 0x100, 0x400
_021038AC:
	.byte 0xA5, 0xBC, 0xBE, 0xF9
_021038B0:
	.byte 0x88, 0x97, 0x08, 0x57
_021038B4:
	.byte 0x98, 0xB7, 0x08, 0x7F
_021038B8:
	.byte 0x28, 0x3F, 0xC0, 0xEF, 0x68, 0x7F, 0xC0, 0xEF
	.byte 0xFF, 0x00, 0x00, 0x00
_021038C4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_021038D4:
	.byte 0x08, 0x27, 0x08, 0x7F, 0x28, 0x47, 0x08, 0x7F, 0x48, 0x67, 0x08, 0x7F
	.byte 0x68, 0x87, 0x08, 0x7F, 0xFF, 0x00, 0x00, 0x00
_021038E8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02103904:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x1B, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103920:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1A, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210393C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103958:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02103974:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02103990:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_021039B8:
	.word 13, 12, 14
	.word 19, 17, 18
	.word 10, 9, 9
	.word 13, 12, 12
_021039E8:
	.byte 0x08, 0x27, 0x10, 0x2F, 0x08, 0x27, 0x30, 0x4F
	.byte 0x08, 0x27, 0x50, 0x70, 0x30, 0x4F, 0x10, 0x2F, 0x30, 0x4F, 0x30, 0x4F, 0x30, 0x4F, 0x50, 0x70
	.byte 0x58, 0x77, 0x10, 0x2F, 0x58, 0x77, 0x30, 0x4F, 0x58, 0x77, 0x50, 0x70, 0x0C, 0x33, 0x74, 0x8B
	.byte 0x4C, 0x73, 0x74, 0x8B, 0xB0, 0xBF, 0xD0, 0xFF, 0xFF, 0x00, 0x00, 0x00
_02103A1C:
	.word sub_02088298, sub_02088424, sub_0208856C, 0xFFFFFFFF
_02103A2C:
	.byte 0x36, 0x00, 0x37, 0x00
	.byte 0x35, 0x00, 0x34, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x55, 0x00, 0x00, 0x00
_02103A3C:
	.byte 0x73, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
_02103A50:
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
_02103A70:
	.byte 0x01, 0x00, 0x00, 0x00, 0x80, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x18, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x18, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x18, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x44, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x44, 0x00, 0x18, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x96, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x96, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0xD8, 0x00, 0x96, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x96, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x96, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x96, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x98, 0x00, 0xA8, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0xA0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0xA8, 0x00, 0xA8, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0xB0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0xB8, 0x00, 0xA8, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0xC0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0xC8, 0x00, 0xA8, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0xD8, 0x00, 0xA8, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0xE8, 0x00, 0xA8, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0xF0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x30, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0xD8, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x90, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x88, 0x00, 0x58, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x84, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00, 0x20, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x40, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x60, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x20, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1D, 0x00, 0x00, 0x00, 0x40, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x60, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x21, 0x00, 0x00, 0x00, 0x60, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x20, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x80, 0x00, 0x20, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x80, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x94, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x20, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x20, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x20, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x20, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x20, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0xE4, 0x00, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x32, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x27, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x52, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x72, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x7A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x40, 0x00, 0x30, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x60, 0x00, 0x30, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x70, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x80, 0x00, 0x30, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x40, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0x50, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x60, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x70, 0x00, 0x50, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x80, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x40, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x60, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x70, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x80, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x40, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0x90, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x60, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x70, 0x00, 0x90, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x80, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x40, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x60, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x70, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x80, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x50, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x5B, 0x00, 0xB6, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x65, 0x00, 0xB6, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x6F, 0x00, 0xB6, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x79, 0x00, 0xB6, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x83, 0x00, 0xB6, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x6F, 0x00, 0xB6, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02104C68:
	.byte 0x02, 0x00, 0x02, 0x02, 0x00, 0x01, 0x01, 0x01
	.byte 0x01, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x02, 0x00, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A
	.byte 0x0B, 0x00, 0x00, 0x00
_02104C84:
	.byte 0x04, 0x0D, 0x11, 0x05, 0x02, 0x0D, 0x1F, 0x02, 0x04, 0x01, 0x10, 0x15
	.byte 0x02, 0x0D, 0x29, 0x02, 0x04, 0x01, 0x12, 0x1E, 0x04, 0x0D, 0x53, 0x02, 0x01, 0x01, 0x03, 0x0A
	.byte 0x02, 0x0D, 0x1F, 0x02, 0x01, 0x01, 0x07, 0x0A, 0x02, 0x0D, 0x33, 0x02, 0x01, 0x01, 0x0B, 0x0A
	.byte 0x02, 0x0D, 0x47, 0x02, 0x01, 0x01, 0x0F, 0x0A, 0x02, 0x0D, 0x5B, 0x02, 0x01, 0x01, 0x13, 0x0A
	.byte 0x02, 0x0D, 0x6F, 0x02
_02104CC4:
	.byte 0x04, 0x0C, 0x01, 0x03, 0x02, 0x0D, 0x1F, 0x02, 0x04, 0x09, 0x03, 0x09
	.byte 0x02, 0x0D, 0x27, 0x02, 0x04, 0x09, 0x07, 0x09, 0x02, 0x0D, 0x39, 0x02, 0x04, 0x0B, 0x09, 0x05
	.byte 0x02, 0x0D, 0x4B, 0x02, 0x04, 0x0A, 0x0D, 0x07, 0x02, 0x0D, 0x55, 0x02, 0x04, 0x0B, 0x11, 0x06
	.byte 0x02, 0x0D, 0x63, 0x02, 0x01, 0x00, 0x03, 0x12, 0x12, 0x0D, 0x1F, 0x02, 0x01, 0x01, 0x16, 0x0B
	.byte 0x02, 0x0D, 0x63, 0x03
_02104D04:
	.byte 0x01, 0x0B, 0x03, 0x07, 0x02, 0x0D, 0x1F, 0x02, 0x01, 0x0D, 0x06, 0x03
	.byte 0x02, 0x0D, 0x2D, 0x02, 0x01, 0x0D, 0x08, 0x03, 0x02, 0x0D, 0x33, 0x02, 0x01, 0x0D, 0x0A, 0x03
	.byte 0x02, 0x0D, 0x39, 0x02, 0x01, 0x0D, 0x0C, 0x03, 0x02, 0x0D, 0x3F, 0x02, 0x01, 0x0D, 0x0E, 0x03
	.byte 0x02, 0x0D, 0x45, 0x02, 0x01, 0x09, 0x11, 0x09, 0x02, 0x0D, 0x4B, 0x02, 0x01, 0x00, 0x13, 0x13
	.byte 0x04, 0x0D, 0x5D, 0x02, 0x04, 0x05, 0x01, 0x0B, 0x04, 0x0D, 0x1F, 0x02, 0x04, 0x05, 0x05, 0x0B
	.byte 0x04, 0x0D, 0x4B, 0x02, 0x04, 0x05, 0x09, 0x0B, 0x04, 0x0D, 0x77, 0x02, 0x04, 0x05, 0x0D, 0x0B
	.byte 0x04, 0x0D, 0xA3, 0x02, 0x04, 0x05, 0x13, 0x0B, 0x04, 0x0D, 0xCF, 0x02, 0x04, 0x1B, 0x06, 0x03
	.byte 0x02, 0x0D, 0xFB, 0x02, 0x04, 0x1B, 0x08, 0x03, 0x02, 0x0D, 0x01, 0x03, 0x04, 0x11, 0x0A, 0x0F
	.byte 0x0A, 0x0D, 0x07, 0x03, 0x04, 0x01, 0x14, 0x0F, 0x02, 0x0D, 0x9D, 0x03, 0x04, 0x01, 0x11, 0x0A
	.byte 0x02, 0x0D, 0x9D, 0x03
_02104D94:
	.byte 0x04, 0x14, 0x01, 0x0B, 0x02, 0x0D, 0x01, 0x00, 0x01, 0x14, 0x01, 0x0B
	.byte 0x02, 0x0D, 0x17, 0x00, 0x01, 0x14, 0x01, 0x0B, 0x02, 0x0D, 0x2D, 0x00, 0x01, 0x01, 0x00, 0x0B
	.byte 0x02, 0x0D, 0x43, 0x00, 0x04, 0x14, 0x01, 0x0B, 0x02, 0x0D, 0x59, 0x00, 0x01, 0x14, 0x01, 0x0B
	.byte 0x02, 0x0D, 0x6F, 0x00, 0x01, 0x14, 0x14, 0x06, 0x02, 0x0D, 0x85, 0x00, 0x04, 0x01, 0x01, 0x09
	.byte 0x02, 0x0D, 0x91, 0x00, 0x04, 0x01, 0x03, 0x05, 0x02, 0x0D, 0xA3, 0x00, 0x04, 0x01, 0x05, 0x05
	.byte 0x02, 0x0D, 0xAD, 0x00, 0x04, 0x01, 0x07, 0x05, 0x02, 0x0D, 0xB7, 0x00, 0x04, 0x01, 0x09, 0x05
	.byte 0x02, 0x0D, 0xC1, 0x00, 0x04, 0x01, 0x0B, 0x0F, 0x02, 0x0D, 0xCB, 0x00, 0x04, 0x01, 0x0F, 0x0C
	.byte 0x02, 0x0D, 0xE9, 0x00, 0x04, 0x06, 0x11, 0x03, 0x02, 0x0D, 0x01, 0x01, 0x01, 0x05, 0x03, 0x02
	.byte 0x02, 0x0D, 0x07, 0x01, 0x01, 0x03, 0x06, 0x06, 0x02, 0x0D, 0x0B, 0x01, 0x01, 0x03, 0x08, 0x06
	.byte 0x02, 0x0D, 0x17, 0x01, 0x01, 0x03, 0x0A, 0x06, 0x02, 0x0D, 0x23, 0x01, 0x01, 0x03, 0x0C, 0x06
	.byte 0x02, 0x0D, 0x2F, 0x01, 0x01, 0x03, 0x0E, 0x06, 0x02, 0x0D, 0x3B, 0x01, 0x01, 0x00, 0x11, 0x07
	.byte 0x02, 0x0D, 0x47, 0x01, 0x01, 0x01, 0x16, 0x06, 0x02, 0x0D, 0x47, 0x01, 0x04, 0x19, 0x15, 0x05
	.byte 0x02, 0x0D, 0x53, 0x01, 0x04, 0x12, 0x04, 0x06, 0x02, 0x0D, 0x5D, 0x01, 0x04, 0x12, 0x06, 0x06
	.byte 0x02, 0x0D, 0x69, 0x01, 0x04, 0x12, 0x08, 0x08, 0x02, 0x0D, 0x75, 0x01, 0x01, 0x12, 0x0B, 0x09
	.byte 0x02, 0x0D, 0x85, 0x01, 0x01, 0x02, 0x0D, 0x0C, 0x02, 0x0D, 0x97, 0x01, 0x04, 0x01, 0x11, 0x0C
	.byte 0x02, 0x0D, 0xAF, 0x01, 0x04, 0x14, 0x01, 0x0B, 0x02, 0x0D, 0xC7, 0x01, 0x01, 0x14, 0x16, 0x0C
	.byte 0x02, 0x0D, 0xDD, 0x01, 0x01, 0x14, 0x06, 0x06, 0x02, 0x0D, 0xF5, 0x01, 0x01, 0x16, 0x04, 0x09
	.byte 0x02, 0x0D, 0x01, 0x02
_02104EA4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
_02104EB0:
	.byte 0x12, 0x14, 0xC8, 0x0E, 0x00, 0x00, 0x12, 0x14, 0xDF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00
	.byte 0x00, 0x00
_02104EC2:
	.byte 0x98, 0x20, 0xC5, 0x03, 0x00, 0x00, 0xA2, 0x15, 0x7F, 0x01, 0x00, 0x00, 0x0B, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
_02104ED4:
	.byte 0xA7, 0x1B, 0x75, 0xF4, 0x00, 0x00, 0x04, 0x15, 0x96, 0xFF, 0x00, 0x00
	.byte 0x07, 0x00, 0xF5, 0xFF, 0x00, 0x00
_02104EE6:
	.byte 0x12, 0x14, 0x2C, 0x01, 0x00, 0x00, 0x12, 0x14, 0x2C, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02104EF8:
	.byte 0x33, 0x07, 0xC5, 0x03, 0x00, 0x00, 0x25, 0x12
	.byte 0x7F, 0x01, 0x00, 0x00, 0xF5, 0xFF, 0x02, 0x00, 0x00, 0x00
_02104F0A:
	.byte 0xB5, 0x13, 0xC8, 0x0E, 0x00, 0x00
	.byte 0xB5, 0x13, 0xDF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
_02104F1C:
	.byte 0xB5, 0x13, 0x2C, 0x01
	.byte 0x00, 0x00, 0xB5, 0x13, 0x2C, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02104F2E:
	.byte 0x22, 0x0C
	.byte 0x75, 0xF4, 0x00, 0x00, 0xC3, 0x12, 0x96, 0xFF, 0x00, 0x00, 0xF9, 0xFF, 0xF5, 0xFF, 0x00, 0x00
_02104F40:
	.byte 0x33, 0x07, 0xC5, 0x03, 0x00, 0x00, 0x25, 0x12, 0x7F, 0x01, 0x00, 0x00, 0xF5, 0xFF, 0x02, 0x00
	.byte 0x00, 0x00
_02104F52:
	.byte 0xB5, 0x13, 0x2C, 0x01, 0x00, 0x00, 0xB5, 0x13, 0x2C, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02104F64:
	.byte 0xA7, 0x1B, 0x75, 0xF4, 0x00, 0x00, 0xB3, 0x14, 0x96, 0xFF, 0x00, 0x00
	.byte 0x07, 0x00, 0xF5, 0xFF, 0x00, 0x00
_02104F76:
	.byte 0x22, 0x0C, 0x75, 0xF4, 0x00, 0x00, 0xC3, 0x12, 0x96, 0xFF
	.byte 0x00, 0x00, 0xF9, 0xFF, 0xF5, 0xFF, 0x00, 0x00
_02104F88:
	.byte 0x12, 0x14, 0x2C, 0x01, 0x00, 0x00, 0x12, 0x14
	.byte 0x2C, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02104F9A:
	.byte 0x98, 0x20, 0xC5, 0x03, 0x00, 0x00
	.byte 0xA2, 0x15, 0x7F, 0x01, 0x00, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x00, 0x00
_02104FAC:
	.byte 0xA7, 0x1B, 0x75, 0xF4
	.byte 0x00, 0x00, 0x04, 0x15, 0x96, 0xFF, 0x00, 0x00, 0x07, 0x00, 0xF5, 0xFF, 0x00, 0x00
_02104FBE:
	.byte 0x22, 0x0C
	.byte 0x75, 0xF4, 0x00, 0x00, 0x14, 0x13, 0x96, 0xFF, 0x00, 0x00, 0xF9, 0xFF, 0xF5, 0xFF, 0x00, 0x00
_02104FD0:
	.byte 0x00, 0x01, 0x01, 0x04, 0x01, 0x02, 0x05, 0x0F, 0x02, 0x04, 0x19, 0x0A, 0x03, 0x04, 0x1A, 0x04
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_02104FFC:
	.byte 0xA5, 0xBF, 0x02, 0x2D
	.byte 0xA5, 0xBF, 0x30, 0x60, 0xA5, 0xBF, 0x63, 0x8C, 0xA5, 0xBF, 0xBD, 0xFA, 0x26, 0x42, 0xA5, 0xCB
	.byte 0x2E, 0x4A, 0xCD, 0xF3, 0x46, 0x62, 0xA5, 0xCB, 0x4E, 0x6A, 0xCD, 0xF3, 0x66, 0x82, 0xA5, 0xCB
	.byte 0x6E, 0x8A, 0xCD, 0xF3, 0xFF, 0x00, 0x00, 0x00
_02105028:
	.word 0x00000062
	.short 0x0048, 0x0000, 0x0000, 0x0050
	.word 0x0000004E
	.short 0x0049, 0x0000, 0x0001, 0x0051
	.word 0x0000004F
	.short 0x004A, 0x0000, 0x0002, 0x0052
	.word 0x00000050
	.short 0x004B, 0x0000, 0x0003, 0x0053
	.word 0x00000051
	.short 0x004C, 0x0000, 0x0004, 0x0054
	.word 0x00000052
	.short 0x0049, 0x0001, 0x0005, 0x0055
	.word 0x00000053
	.short 0x004A, 0x0001, 0x0006, 0x0056
	.word 0x00000054
	.short 0x004B, 0x0001, 0x0007, 0x0057
	.word 0x00000055
	.short 0x004C, 0x0001, 0x0008, 0x0058
	.word 0x00000056
	.short 0x0049, 0x0002, 0x0009, 0x0059
	.word 0x00000057
	.short 0x004A, 0x0002, 0x000A, 0x005A
	.word 0x00000058
	.short 0x004B, 0x0002, 0x000B, 0x005B
	.word 0x00000059
	.short 0x004C, 0x0002, 0x000C, 0x005C
	.word 0x0000005A
	.short 0x0049, 0x0003, 0x000D, 0x005D
	.word 0x0000005B
	.short 0x004A, 0x0003, 0x000E, 0x005E
	.word 0x0000005C
	.short 0x004B, 0x0003, 0x000F, 0x005F
	.word 0x0000005D
	.short 0x004C, 0x0003, 0x0010, 0x0060
	.word 0x0000005E
	.short 0x0049, 0x0004, 0x0011, 0x0061
	.word 0x0000005F
	.short 0x004A, 0x0004, 0x0012, 0x0062
	.word 0x00000060
	.short 0x004B, 0x0004, 0x0013, 0x0063
	.word 0x00000061
	.short 0x004C, 0x0004, 0x0014, 0x0064
	.word 0x00000063
	.short 0x004E, 0x0000, 0x0015, 0x0065
	.word 0x00000064
	.short 0x004D, 0x0000, 0x0016, 0x0066
	.word 0x00000065
	.short 0x004F, 0x0001, 0x0017, 0x0067
	.word 0x00000066
	.short 0x0050, 0x0002, 0x0018, 0x0068
	.word 0x00000067
	.short 0x0051, 0x0001, 0x0019, 0x8000
	.word 0x00000068
	.short 0x0051, 0x0003, 0x001A, 0x8001
	.word 0x00000069
	.short 0x0051, 0x0004, 0x001B, 0x8002
	.word 0x0000006A
	.short 0x0052, 0x0003, 0x001C, 0x00B2
	.word 0x0000006B
	.short 0x0052, 0x0004, 0x001D, 0x00BE
	.word 0x0000006C
	.short 0x0053, 0x0000, 0x001E, 0x00BF
	.word 0x0000006D
	.short 0x0053, 0x0001, 0x001F, 0x00B2
	.word 0x00000019
	.short 0x0058, 0x0000, 0x0020, 0x0069
	.word 0x0000007B
	.short 0x0059, 0x0000, 0x0021, 0x006A
	.word 0x0000007C
	.short 0x005A, 0x0000, 0x0022, 0x006B
	.word 0x0000007D
	.short 0x005B, 0x0000, 0x0023, 0x006C
	.word 0x0000007E
	.short 0x005C, 0x0000, 0x0024, 0x006D
	.word 0x0000007F
	.short 0x0059, 0x0001, 0x0025, 0x006E
	.word 0x00000080
	.short 0x005A, 0x0001, 0x0026, 0x006F
	.word 0x00000081
	.short 0x005B, 0x0001, 0x0027, 0x0070
	.word 0x00000082
	.short 0x005C, 0x0001, 0x0028, 0x0071
	.word 0x00000083
	.short 0x0059, 0x0002, 0x0029, 0x0072
	.word 0x00000084
	.short 0x005A, 0x0002, 0x002A, 0x0073
	.word 0x00000085
	.short 0x005B, 0x0002, 0x002B, 0x0074
	.word 0x00000086
	.short 0x005C, 0x0002, 0x002C, 0x0075
	.word 0x00000087
	.short 0x0059, 0x0003, 0x002D, 0x0076
	.word 0x00000088
	.short 0x005A, 0x0003, 0x002E, 0x0077
	.word 0x00000089
	.short 0x005B, 0x0003, 0x002F, 0x0078
	.word 0x0000008A
	.short 0x005C, 0x0003, 0x0030, 0x0079
	.word 0x0000008B
	.short 0x0059, 0x0004, 0x0031, 0x007A
	.word 0x0000008C
	.short 0x005A, 0x0004, 0x0032, 0x007B
	.word 0x0000008D
	.short 0x005B, 0x0004, 0x0033, 0x007C
	.word 0x0000008E
	.short 0x005C, 0x0004, 0x0034, 0x007D
	.word 0x0000001A
	.short 0x005D, 0x0000, 0x0035, 0x007E
	.word 0x0000001B
	.short 0x005E, 0x0000, 0x0036, 0x007F
	.word 0x0000001C
	.short 0x005F, 0x0000, 0x0037, 0x0080
	.word 0x0000001D
	.short 0x0060, 0x0000, 0x0038, 0x0081
	.word 0x0000001E
	.short 0x0061, 0x0000, 0x0039, 0x0082
	.word 0x0000001F
	.short 0x0062, 0x0000, 0x003A, 0x0083
	.word 0x00000020
	.short 0x0063, 0x0002, 0x003B, 0x0084
	.word 0x00000021
	.short 0x0064, 0x0000, 0x003C, 0x0085
	.word 0x00000022
	.short 0x0065, 0x0001, 0x003D, 0x0086
	.word 0x00000023
	.short 0x0066, 0x0002, 0x003E, 0x0087
	.word 0x00000024
	.short 0x0067, 0x0003, 0x003F, 0x0088
	.word 0x00000025
	.short 0x0068, 0x0000, 0x0040, 0x0089
	.word 0x00000026
	.short 0x0069, 0x0002, 0x0041, 0x008A
	.word 0x00000027
	.short 0x006A, 0x0001, 0x0042, 0x008B
	.word 0x00000028
	.short 0x006B, 0x0003, 0x0043, 0x008C
	.word 0x00000029
	.short 0x006C, 0x0000, 0x0044, 0x008D
	.word 0x0000002A
	.short 0x006D, 0x0000, 0x0045, 0x008E
	.word 0x0000002B
	.short 0x006E, 0x0001, 0x0046, 0x008F
	.word 0x0000002C
	.short 0x006F, 0x0003, 0x0047, 0x0090
	.word 0x0000002D
	.short 0x0070, 0x0000, 0x0048, 0x0091
	.word 0x0000002E
	.short 0x0071, 0x0000, 0x0049, 0x8007
	.word 0x0000002F
	.short 0x0072, 0x0003, 0x004A, 0x8008
	.word 0x00000030
	.short 0x0073, 0x0001, 0x004B, 0x8009
	.word 0x00000031
	.short 0x0074, 0x0001, 0x004C, 0x800A
	.word 0x00000032
	.short 0x0075, 0x0000, 0x004D, 0x800B
	.word 0x00000033
	.short 0x0076, 0x0001, 0x004E, 0x800C
	.word 0x00000034
	.short 0x0077, 0x0000, 0x004F, 0x800D
_021053E8:
	.byte 0x46, 0x00, 0x41, 0x00, 0x42, 0x00, 0x43, 0x00
	.byte 0x44, 0x00, 0x45, 0x00
_021053F4:
	.byte 0x47, 0x00, 0x48, 0x00, 0x49, 0x00, 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00
	.byte 0x4D, 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x51, 0x00, 0x52, 0x00, 0x53, 0x00, 0x54, 0x00
	.byte 0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00, 0x5B, 0x00, 0x5C, 0x00
	.byte 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x61, 0x00, 0x62, 0x00, 0x63, 0x00, 0x64, 0x00
_02105430:
	.word sub_0208F680, sub_0208F7F8, sub_0208F800
	.word sub_0208F6F4, sub_020342C4, 0
	.word sub_0208F714, sub_020342C4, 0
	.word sub_0208F724, sub_020342C4, 0
	.word sub_0208F728, sub_020342C4, 0
	.word sub_0208F72C, sub_020342C4, 0
	.word sub_0208F77C, sub_0208F7F4, sub_0208F800
	.word sub_0208F7A8, sub_0208F7E8, sub_0208F800
	.word sub_0208F738, sub_020342C0, 0
	.word sub_0208F73C, sub_020342C4, 0
	.word sub_0208F74C, sub_0208F7F0, 0
_021054B4:
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_0208FB5C, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_0208F828, sub_02091598, sub_0208FB4C
	.word sub_0208F8BC, sub_020915A0, 0
	.word sub_0208F8E4, sub_020915A4, 0
	.word sub_0208FA88, sub_020342C4, 0
	.word sub_0208FA8C, sub_020342C4, 0
	.word sub_0208FA54, sub_020342C4, 0
	.word sub_0208F918, sub_020342C0, 0
	.word sub_0208FA50, sub_020342C0, 0
	.word sub_0208F960, sub_0208FB60, 0
	.word sub_0208FA90, sub_020342C0, 0
	.word sub_0208FAA8, sub_020342C0, 0
	.word sub_0208FAEC, sub_020342C0, 0
	.word sub_02091570, sub_020342C4, 0
	.word sub_02091570, sub_020342C4, 0
_021059DC:
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_0208FCFC, sub_0208FD80, 0
	.word sub_0208FD00, sub_0208FD80, 0
	.word sub_0208FCDC, sub_0208FD80, 0
	.word sub_0208FBE0, sub_0208FD7C, 0
	.word sub_0208FBF0, sub_0208FD84, 0
	.word sub_0208FD04, sub_0208FD7C, 0
	.word sub_0208FD1C, sub_0208FD7C, 0
	.word sub_0208FB98, sub_0208FD7C, 0
	.word sub_0208FB78, sub_02091590, sub_0208FD88
	.word sub_0208FB88, sub_0208FD80, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0
	.word sub_02091570, sub_0208FD7C, 0

	.data

_02110104:
	.byte 0x00, 0x30, 0x00, 0x80, 0x08, 0x38, 0x80, 0x00, 0x30, 0x60, 0x00, 0x80
	.byte 0x38, 0x68, 0x80, 0x00, 0x60, 0x90, 0x00, 0x80, 0x68, 0x98, 0x80, 0x00, 0xB0, 0xC0, 0xC8, 0x00
	.byte 0xA0, 0xB0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00
_02110128:
	.byte 0x00, 0x30, 0x00, 0x80, 0x08, 0x38, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80, 0x38, 0x68, 0x80, 0x00, 0x60, 0x90, 0x00, 0x80, 0x68, 0x98, 0x80, 0x00
	.byte 0x98, 0xC0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x80, 0x00, 0x30, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80, 0x30, 0x60, 0x80, 0x00, 0x60, 0x90, 0x00, 0x80, 0x60, 0x90, 0x80, 0x00
	.byte 0x98, 0xC0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00
_02110168:
	.byte 0x10, 0x30, 0x80, 0x00, 0x30, 0x50, 0x80, 0x00
	.byte 0x50, 0x70, 0x80, 0x00, 0x70, 0x90, 0x80, 0x00, 0x98, 0xC0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00
_02110180:
	.byte 0x18, 0x38, 0x80, 0x00, 0x38, 0x58, 0x80, 0x00, 0x58, 0x78, 0x80, 0x00, 0x10, 0x30, 0x00, 0x80
	.byte 0x30, 0x50, 0x00, 0x80, 0x50, 0x70, 0x00, 0x80, 0x70, 0x90, 0x00, 0x80, 0x98, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00
_021101A4:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02110244:
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x06, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x07, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
_021104E4:
	.word _02101DBE
	.word _02101DBE
	.word _02101DBE
	.word _02101DBE
	.word _02101DD8
_021104F8:
	.word _02101E80
	.word _02101E9C
	.word _02101EB8
	.word _02101E2C
	.word _02101E64
	.word _02101EF0
	.word _02101F0C
	.word _0210205C
	.word _02101F60
	.word _02102024
	.word _02101F98
	.word _02101FD0
	.word _02101FEC
	.word _02102008
	.word _02102040
	.word _02101F7C
	.word _02101DF2
	.word _02101F44
	.word _02101F28
	.word _02101E48
	.word _021020D4
	.word _021020F8
	.word _0210211C
	.word _0210211C
	.word _0210211C
_0211055C:
	.byte 0x00, 0x00, 0x00, 0x3F
	.byte 0xCD, 0xCC, 0x4C, 0x3E, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x9A, 0x99, 0x99, 0x3F
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F
_02110578:
	.byte 0xCD, 0xCC, 0x4C, 0x3F, 0x9A, 0x99, 0x19, 0x3F
	.byte 0xCD, 0xCC, 0xCC, 0x3E, 0xCD, 0xCC, 0x4C, 0x3E, 0xCD, 0xCC, 0x4C, 0x3F, 0x00, 0x00, 0x80, 0x3F
	.byte 0x00, 0x00, 0x80, 0x3F
_02110594:
	.word _02102830
	.word _02102890
	.word _02102880
	.word _02102870
	.word _02102860
	.word _02102850
	.word _02102840
_021105B0:
	.byte 0xB7, 0x37
	.byte 0xDF, 0x3F
	.byte 0xB7, 0x57
	.byte 0xDF, 0x5F
	.byte 0xB7, 0x77
	.byte 0xDF, 0x7F
