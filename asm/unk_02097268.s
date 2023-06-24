#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02097268.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02097268
sub_02097268: ; 0x02097268
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0x18
	blt _02097278
	bl GF_AssertFail
	mov r1, #0
_02097278:
	lsl r0, r1, #1
	add r2, r1, r0
	ldr r0, _020972A0 ; =_02108EEE
	add r1, r0, r2
	ldrb r0, [r0, r2]
	strb r0, [r5]
	ldrb r0, [r1, #1]
	strb r0, [r5, #1]
	ldrb r0, [r1, #2]
	strb r0, [r5, #2]
	ldrb r0, [r5, #1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0209729E
	cmp r4, #1
	bne _0209729E
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
_0209729E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020972A0: .word _02108EEE
	thumb_func_end sub_02097268

	thumb_func_start sub_020972A4
sub_020972A4: ; 0x020972A4
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	bne _020972BC
	ldrh r3, [r0, #4]
	ldrh r2, [r1, #4]
	cmp r3, r2
	bne _020972BC
	ldrh r2, [r0, #6]
	ldrh r0, [r1, #6]
	cmp r2, r0
	beq _020972C0
_020972BC:
	mov r0, #0
	bx lr
_020972C0:
	mov r0, #1
	bx lr
	thumb_func_end sub_020972A4

	thumb_func_start sub_020972C4
sub_020972C4: ; 0x020972C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r6, #0
_020972CC:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020972A4
	cmp r0, #0
	bne _020972DC
	mov r0, #0
	pop {r4, r5, r6, pc}
_020972DC:
	add r6, r6, #1
	add r4, #8
	add r5, #8
	cmp r6, #0xa
	blt _020972CC
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020972C4

	thumb_func_start sub_020972EC
sub_020972EC: ; 0x020972EC
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _02097306
_020972F4:
	ldrb r3, [r1, r4]
	cmp r0, r3
	bne _02097300
	mov r0, #1
	pop {r3, r4}
	bx lr
_02097300:
	add r4, r4, #1
	cmp r4, r2
	blt _020972F4
_02097306:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_020972EC

	thumb_func_start sub_0209730C
sub_0209730C: ; 0x0209730C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xb0
	add r4, r0, #0
	str r1, [sp, #4]
	bl SaveData_GetMomsSavingsAddr
	str r0, [sp, #0x2c]
	add r0, r4, #0
	bl Save_SafariZone_Get
	str r0, [sp, #0x28]
	mov r1, #0
	bl SafariZone_GetAreaSet
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x28]
	bl sub_0202F720
	cmp r0, #0
	beq _0209733A
	ldr r0, [sp, #4]
	cmp r0, #0
	bgt _0209733C
_0209733A:
	b _020974BC
_0209733C:
	add r0, r4, #0
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_CheckSafariSysFlag
	cmp r0, #0
	beq _02097364
	ldr r0, [sp, #0x28]
	bl sub_0202F6AC
	add r2, r0, #0
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r2, r1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0202F6A0
	add sp, #0xb0
	pop {r3, r4, r5, r6, r7, pc}
_02097364:
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	add r0, sp, #0x30
	mov r2, #6
	bl MI_CpuFill8
	add r0, sp, #0x38
	mov r1, #0
	mov r2, #0x78
	bl MI_CpuFill8
	add r0, sp, #0x38
	mov r6, #0
	str r0, [sp, #0xc]
_02097382:
	ldr r0, _020974C0 ; =0x0000FFFF
	ldr r5, [sp, #0xc]
	asr r0, r6
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1d
	mov r4, #0
	add r7, r0, #1
_02097390:
	mov r0, #0xb
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0
	bl sub_020974C4
	add r4, r4, #1
	stmia r5!, {r0}
	cmp r4, r7
	blt _02097390
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r0, #0x14
	str r0, [sp, #0xc]
	cmp r6, #6
	blt _02097382
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #4]
	bl sub_0202F6B8
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x18]
	add r0, sp, #0x38
	str r0, [sp, #0x14]
_020973C8:
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x20]
	ldrb r7, [r0]
	lsl r2, r2, #0x18
	add r1, sp, #0x30
	add r0, r7, #0
	lsr r2, r2, #0x18
	bl sub_020972EC
	cmp r0, #0
	bne _02097442
	ldr r1, _020974C0 ; =0x0000FFFF
	ldr r0, [sp, #8]
	ldr r4, [sp, #0x14]
	asr r1, r0
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1d
	add r0, r0, #1
	mov r5, #0
	str r0, [sp, #0x10]
_020973F0:
	mov r0, #0xb
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #8]
	add r2, r5, #0
	mov r3, #0
	bl sub_020974C4
	add r6, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_020972C4
	cmp r0, #0
	beq _02097416
	add r0, r6, #0
	bl FreeToHeap
	b _02097438
_02097416:
	ldr r2, [sp, #0x20]
	add r0, r7, #0
	lsl r2, r2, #0x18
	add r1, sp, #0x30
	lsr r2, r2, #0x18
	bl sub_020972EC
	cmp r0, #0
	bne _02097432
	ldr r0, [sp, #0x20]
	add r1, sp, #0x30
	strb r7, [r1, r0]
	add r0, r0, #1
	str r0, [sp, #0x20]
_02097432:
	add r0, r6, #0
	bl FreeToHeap
_02097438:
	ldr r0, [sp, #0x10]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blt _020973F0
_02097442:
	ldr r0, [sp, #0x18]
	add r0, #0x7a
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #6
	blt _020973C8
	add r0, sp, #0x38
	mov r7, #0
	str r0, [sp, #0x1c]
_0209745E:
	ldr r0, _020974C0 ; =0x0000FFFF
	ldr r4, [sp, #0x1c]
	asr r0, r7
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1d
	mov r5, #0
	add r6, r0, #1
_0209746C:
	ldr r0, [r4]
	cmp r0, #0
	beq _02097476
	bl FreeToHeap
_02097476:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r6
	blt _0209746C
	ldr r0, [sp, #0x1c]
	add r7, r7, #1
	add r0, #0x14
	str r0, [sp, #0x1c]
	cmp r7, #6
	blt _0209745E
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _020974A6
	ldr r0, [sp, #0x2c]
	mov r1, #6
	bl sub_0202F050
	mov r1, #0
	ldr r0, [sp, #0x2c]
	add r2, r1, #0
	bl sub_0202F300
	add sp, #0xb0
	pop {r3, r4, r5, r6, r7, pc}
_020974A6:
	ldr r0, [sp, #0x2c]
	mov r1, #6
	bl sub_0202F01C
	ldr r2, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	lsl r2, r2, #0x18
	add r1, sp, #0x30
	lsr r2, r2, #0x18
	bl sub_0202F300
_020974BC:
	add sp, #0xb0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020974C0: .word 0x0000FFFF
	thumb_func_end sub_0209730C

	thumb_func_start sub_020974C4
sub_020974C4: ; 0x020974C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r1, [sp, #8]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r1, #0x7a
	add r7, r0, #0
	ldr r0, [sp, #0x48]
	mul r7, r1
	mov r1, #0x50
	add r4, r2, #0
	str r3, [sp, #0xc]
	str r0, [sp, #0x14]
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x20]
	mov r5, #0
	add r6, r0, #0
	mov r2, #0x81
	mov r3, #0x13
	mov r1, #5
_020974EE:
	cmp r4, #0
	bne _020974F6
	str r3, [r6]
	b _020974F8
_020974F6:
	str r2, [r6]
_020974F8:
	strh r1, [r6, #6]
	ldrh r0, [r6, #6]
	add r5, r5, #1
	strh r0, [r6, #4]
	add r6, #8
	cmp r5, #0xa
	blt _020974EE
	mov r0, #1
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r3, [sp, #0x14]
	ldrb r1, [r1, r7]
	mov r0, #0xe8
	mov r2, #0
	bl GfGfxLoader_LoadFromNarc
	add r5, r0, #0
	bne _02097522
	ldr r0, [sp, #0x20]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
_02097522:
	ldr r0, [sp, #0x14]
	mov r1, #0x64
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	mov r0, #8
	mov r2, #0
_02097532:
	add r3, r5, r0
	add r0, #0x78
	str r3, [r1]
	add r3, r5, r0
	str r3, [r1, #4]
	ldrb r3, [r5, r2]
	add r2, r2, #1
	lsl r6, r3, #2
	strb r3, [r1, #0x10]
	lsl r3, r6, #1
	add r3, r6, r3
	add r0, r0, r3
	str r6, [r1, #0xc]
	add r3, r5, r0
	str r3, [r1, #8]
	ldrb r3, [r1, #0x10]
	add r1, #0x14
	lsl r3, r3, #2
	add r0, r0, r3
	cmp r2, #5
	blt _02097532
	ldr r0, [sp, #0x1c]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0209757C
	cmp r4, #0
	ble _0209757C
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp, #0x20]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
_0209757C:
	ldr r0, [sp, #0xc]
	mov r2, #0x14
	add r7, r0, #0
	mov r1, #0xa
	mul r2, r4
	ldr r3, [sp, #0x1c]
	mul r7, r1
	ldr r0, [sp, #0x20]
	mov r1, #0
	str r2, [sp, #0x10]
	add r4, r3, r2
_02097592:
	add r2, r7, r1
	ldr r3, [r4]
	lsl r2, r2, #2
	add r6, r3, r2
	ldrh r2, [r3, r2]
	add r1, r1, #1
	str r2, [r0]
	ldrh r2, [r6, #2]
	strh r2, [r0, #6]
	strh r2, [r0, #4]
	add r0, #8
	cmp r1, #0xa
	blt _02097592
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r2, sp, #0x2c
	bl sub_02097694
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	mov r2, #0
	add r0, r1, r0
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	ble _0209763C
	add r1, r2, #0
_020975CA:
	ldr r3, [r4, #8]
	ldrb r6, [r3, r1]
	add r0, r3, r1
	add r3, sp, #0x2c
	add r3, r3, r6
	sub r3, r3, #1
	ldrb r6, [r3]
	ldrb r3, [r0, #1]
	cmp r6, r3
	blo _02097632
	ldrb r6, [r0, #2]
	cmp r6, #0
	beq _020975F2
	add r3, sp, #0x2c
	add r3, r3, r6
	sub r3, r3, #1
	ldrb r3, [r3]
	ldrb r0, [r0, #3]
	cmp r3, r0
	blo _02097632
_020975F2:
	ldrb r3, [r4, #0x10]
	ldr r0, [sp, #0xc]
	mul r3, r0
	add r0, r2, r3
	lsl r0, r0, #2
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x20]
	lsl r0, r0, #3
	mov ip, r0
	add r7, r3, r0
	ldr r3, [r4, #4]
	ldr r0, [sp, #0x28]
	mov r6, ip
	ldrh r0, [r3, r0]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #0x24]
	str r3, [r0, r6]
	ldr r3, [r4, #4]
	ldr r0, [sp, #0x28]
	add r0, r3, r0
	ldrh r0, [r0, #2]
	strh r0, [r7, #6]
	strh r0, [r7, #4]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	cmp r0, #9
	bhi _0209763C
_02097632:
	ldrb r0, [r4, #0x10]
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, r0
	blt _020975CA
_0209763C:
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp, #0x20]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020974C4

	thumb_func_start sub_02097650
sub_02097650: ; 0x02097650
	push {r3, r4}
	cmp r1, #0
	bne _0209765C
	mov r0, #0
	pop {r3, r4}
	bx lr
_0209765C:
	sub r2, r1, #1
	lsl r1, r2, #2
	ldr r3, _02097690 ; =_02108EDA
	add r1, r2, r1
	mov r4, #0
	add r2, r3, r1
_02097668:
	ldrb r1, [r2]
	cmp r0, r1
	bhs _02097678
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4}
	bx lr
_02097678:
	add r4, r4, #1
	add r2, r2, #1
	cmp r4, #5
	blt _02097668
	cmp r0, #0x19
	bhs _0209768A
	mov r0, #6
	pop {r3, r4}
	bx lr
_0209768A:
	mov r0, #7
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02097690: .word _02108EDA
	thumb_func_end sub_02097650

	thumb_func_start sub_02097694
sub_02097694: ; 0x02097694
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r2, #0
	mov r2, #0x7a
	mul r2, r1
	add r1, r0, r2
	str r1, [sp]
	ldrb r1, [r0, r2]
	add r1, r0, r1
	mov r0, #0xb7
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [sp]
	mov r4, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	ble _0209771A
	ldr r5, [sp]
	add r7, sp, #8
_020976D0:
	ldrb r1, [r5, #2]
	add r0, sp, #8
	mov r2, #2
	bl sub_02097268
	ldrb r0, [r7, #2]
	cmp r0, #0
	beq _0209770E
	add r0, r6, r0
	add r0, r0, #4
	sub r0, r0, #1
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	ldrb r1, [r7, #2]
	ldr r0, [sp, #4]
	bl sub_02097650
	add r3, r0, #0
	ldrb r0, [r7, #2]
	add r0, r6, r0
	sub r0, r0, #1
	ldrb r1, [r0]
	add r2, r3, r1
	cmp r2, #0xff
	ble _0209770A
	mov r1, #0xff
	strb r1, [r0]
	b _0209770E
_0209770A:
	add r1, r1, r3
	strb r1, [r0]
_0209770E:
	ldr r0, [sp]
	add r4, r4, #1
	ldrb r0, [r0, #1]
	add r5, r5, #4
	cmp r4, r0
	blt _020976D0
_0209771A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02097694

	.rodata

_02108ED8:
	.byte 0xFF, 0xFF
_02108EDA:
	.byte 0x01, 0x05, 0x0A, 0x0F, 0x14
	.byte 0x02, 0x06, 0x0B, 0x10, 0x15
	.byte 0x03, 0x07, 0x0C, 0x11, 0x16
	.byte 0x04, 0x08, 0x0D, 0x12, 0x17
_02108EEE:
	.byte 0xBD, 0x12, 0x01
	.byte 0xBE, 0x12, 0x01
	.byte 0xBF, 0x12, 0x01
	.byte 0xC0, 0x24, 0x02
	.byte 0xC1, 0x24, 0x02
	.byte 0xC2, 0x24, 0x02
	.byte 0xC3, 0x12, 0x03
	.byte 0xC4, 0x24, 0x03
	.byte 0xC5, 0x24, 0x03
	.byte 0xC6, 0x24, 0x04
	.byte 0xC7, 0x25, 0x04
	.byte 0xC8, 0x24, 0x04
	.byte 0xC9, 0x14, 0x00
	.byte 0xCA, 0x12, 0x00
	.byte 0xCB, 0x12, 0x00
	.byte 0xCC, 0x14, 0x00
	.byte 0xCD, 0x22, 0x00
	.byte 0xCE, 0x12, 0x00
	.byte 0xCF, 0x92, 0x00
	.byte 0xD1, 0x92, 0x00
	.byte 0xD3, 0x12, 0x00
	.byte 0xD4, 0x12, 0x00
	.byte 0xD5, 0x12, 0x00
	.byte 0xD6, 0x12, 0x00
