#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_0208805C.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_0208805C
sub_0208805C: ; 0x0208805C
	lsl r1, r0, #1
	ldr r0, _02088064 ; =_02103894
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_02088064: .word _02103894
	thumb_func_end sub_0208805C

	thumb_func_start RatioToInt
RatioToInt: ; 0x02088068
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
	thumb_func_end RatioToInt

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
	bl RatioToInt
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
	bl BeginNormalPaletteFade
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
	bl BeginNormalPaletteFade
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
	ldr r2, _02088208 ; =gSystem
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
_02088208: .word gSystem
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
	bl GfGfxLoader_LoadCharDataFromOpenNarc
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
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
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
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r4, r5, r6, pc}
_02088276:
	str r1, [sp, #4]
	add r0, r2, #0
	add r1, r4, #0
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208820C

	.rodata

_02103894:
	.short 0x20, 0x80, 0x200, 0x800, 0x40, 0x80, 0x100, 0x400, 0x40, 0x80, 0x100, 0x400

	; File boundary
