#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov08_0221BE20
ov08_0221BE20: ; 0x0221BE20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x11]
	cmp r0, #5
	bls _0221BE2E
	mov r0, #0
	strb r0, [r5, #0x11]
_0221BE2E:
	ldr r0, _0221BE88 ; =ov08_0221BE98
	ldr r1, _0221BE8C ; =0x00002090
	ldr r3, [r5, #0xc]
	mov r2, #0
	bl sub_02007200
	bl sub_0201F988
	ldr r2, _0221BE8C ; =0x00002090
	add r4, r0, #0
	mov r1, #0
	bl memset
	str r5, [r4]
	ldr r0, [r5, #8]
	bl ov12_0223A7D4
	mov r1, #0x79
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #8]
	bl ov12_0223A938
	mov r1, #0x7a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0221BE90 ; =0x00002078
	mov r1, #0
	strb r1, [r4, r0]
	ldrb r2, [r5, #0x11]
	sub r1, r0, #2
	strb r2, [r4, r1]
	sub r1, r0, #1
	ldrb r2, [r4, r1]
	mov r1, #0xf0
	sub r0, r0, #1
	bic r2, r1
	strb r2, [r4, r0]
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x28]
	bl ov12_0223AB0C
	ldr r1, _0221BE94 ; =0x0000208F
	strb r0, [r4, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221BE88: .word ov08_0221BE98
_0221BE8C: .word 0x00002090
_0221BE90: .word 0x00002078
_0221BE94: .word 0x0000208F
	thumb_func_end ov08_0221BE20

	thumb_func_start ov08_0221BE98
ov08_0221BE98: ; 0x0221BE98
	push {r4, lr}
	ldr r2, _0221C040 ; =0x00002078
	add r4, r1, #0
	ldrb r2, [r4, r2]
	cmp r2, #0x1a
	bls _0221BEA6
	b _0221C028
_0221BEA6:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0221BEB2: ; jump table
	.short _0221BEE8 - _0221BEB2 - 2 ; case 0
	.short _0221BEF4 - _0221BEB2 - 2 ; case 1
	.short _0221BF00 - _0221BEB2 - 2 ; case 2
	.short _0221BF0C - _0221BEB2 - 2 ; case 3
	.short _0221BF18 - _0221BEB2 - 2 ; case 4
	.short _0221BF24 - _0221BEB2 - 2 ; case 5
	.short _0221BF30 - _0221BEB2 - 2 ; case 6
	.short _0221BF3C - _0221BEB2 - 2 ; case 7
	.short _0221BF48 - _0221BEB2 - 2 ; case 8
	.short _0221BF54 - _0221BEB2 - 2 ; case 9
	.short _0221BF60 - _0221BEB2 - 2 ; case 10
	.short _0221BF6C - _0221BEB2 - 2 ; case 11
	.short _0221BF78 - _0221BEB2 - 2 ; case 12
	.short _0221BF84 - _0221BEB2 - 2 ; case 13
	.short _0221BF90 - _0221BEB2 - 2 ; case 14
	.short _0221BF9C - _0221BEB2 - 2 ; case 15
	.short _0221BFA8 - _0221BEB2 - 2 ; case 16
	.short _0221BFB4 - _0221BEB2 - 2 ; case 17
	.short _0221BFC0 - _0221BEB2 - 2 ; case 18
	.short _0221BFCC - _0221BEB2 - 2 ; case 19
	.short _0221BFD8 - _0221BEB2 - 2 ; case 20
	.short _0221BFE4 - _0221BEB2 - 2 ; case 21
	.short _0221BFF0 - _0221BEB2 - 2 ; case 22
	.short _0221BFFC - _0221BEB2 - 2 ; case 23
	.short _0221C008 - _0221BEB2 - 2 ; case 24
	.short _0221C014 - _0221BEB2 - 2 ; case 25
	.short _0221C020 - _0221BEB2 - 2 ; case 26
_0221BEE8:
	add r0, r4, #0
	bl ov08_0221C048
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BEF4:
	add r0, r4, #0
	bl ov08_0221C14C
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF00:
	add r0, r4, #0
	bl ov08_0221C318
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF0C:
	add r0, r4, #0
	bl ov08_0221C3C8
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF18:
	add r0, r4, #0
	bl ov08_0221C488
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF24:
	add r0, r4, #0
	bl ov08_0221C58C
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF30:
	add r0, r4, #0
	bl ov08_0221C918
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF3C:
	add r0, r4, #0
	bl ov08_0221C924
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF48:
	add r0, r4, #0
	bl ov08_0221C930
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF54:
	add r0, r4, #0
	bl ov08_0221C93C
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF60:
	add r0, r4, #0
	bl ov08_0221C948
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF6C:
	add r0, r4, #0
	bl ov08_0221C954
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF78:
	add r0, r4, #0
	bl ov08_0221C978
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF84:
	add r0, r4, #0
	bl ov08_0221C9A4
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF90:
	add r0, r4, #0
	bl ov08_0221C9C8
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF9C:
	add r0, r4, #0
	bl ov08_0221CA08
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFA8:
	add r0, r4, #0
	bl ov08_0221CA20
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFB4:
	add r0, r4, #0
	bl ov08_0221CA34
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFC0:
	add r0, r4, #0
	bl ov08_0221CA50
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFCC:
	add r0, r4, #0
	bl ov08_0221C604
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFD8:
	add r0, r4, #0
	bl ov08_0221C6F8
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFE4:
	add r0, r4, #0
	bl ov08_0221C814
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFF0:
	add r0, r4, #0
	bl ov08_0221CA78
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFFC:
	add r0, r4, #0
	bl ov08_0221CA90
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221C008:
	add r0, r4, #0
	bl ov08_0221CC38
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221C014:
	add r0, r4, #0
	bl ov08_0221CD64
	ldr r1, _0221C040 ; =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221C020:
	bl ov08_0221CD90
	cmp r0, #1
	beq _0221C03C
_0221C028:
	add r0, r4, #0
	bl ov08_0222145C
	ldr r0, _0221C044 ; =0x00001FB4
	ldr r0, [r4, r0]
	bl sub_0200D020
	add r0, r4, #0
	bl ov08_022220FC
_0221C03C:
	pop {r4, pc}
	nop
_0221C040: .word 0x00002078
_0221C044: .word 0x00001FB4
	thumb_func_end ov08_0221BE98

	thumb_func_start ov08_0221C048
ov08_0221C048: ; 0x0221C048
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0221C13C ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5]
	add r0, #0x35
	ldrb r0, [r0]
	cmp r0, #3
	ldr r0, _0221C140 ; =0x0000207A
	bne _0221C068
	mov r1, #6
	strb r1, [r5, r0]
	mov r4, #0x13
	b _0221C06C
_0221C068:
	strb r1, [r5, r0]
	mov r4, #1
_0221C06C:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl ov08_02224B64
	ldr r1, _0221C144 ; =0x00002088
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov08_0221D184
	add r0, r5, #0
	bl ov08_0221CDF8
	add r0, r5, #0
	bl ov08_0221CF38
	add r0, r5, #0
	bl ov08_0221D0F4
	ldr r1, [r5]
	mov r0, #4
	ldr r1, [r1, #0xc]
	bl FontID_Alloc
	ldr r1, _0221C140 ; =0x0000207A
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_0221D8B0
	ldr r1, _0221C140 ; =0x0000207A
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_022221CC
	ldr r1, _0221C140 ; =0x0000207A
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_02222524
	add r0, r5, #0
	bl ov08_022205E0
	ldr r1, _0221C140 ; =0x0000207A
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_02220C5C
	add r0, r5, #0
	bl ov08_0221DC00
	ldr r1, _0221C140 ; =0x0000207A
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_0221DD70
	ldr r0, [r5]
	add r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221C0EC
	ldr r0, _0221C144 ; =0x00002088
	mov r1, #1
	ldr r0, [r5, r0]
	bl ov08_02224B90
_0221C0EC:
	ldr r0, _0221C140 ; =0x0000207A
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0221C106
	add r0, r5, #0
	mov r1, #0
	bl ov08_0221DB24
	cmp r0, #1
	bne _0221C106
	ldr r0, [r5]
	mov r1, #1
	strb r1, [r0, #0x11]
_0221C106:
	ldr r1, _0221C140 ; =0x0000207A
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_0222171C
	ldr r1, _0221C140 ; =0x0000207A
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_0221D6CC
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	lsl r0, r0, #2
	mov r1, #0xa
	add r3, r1, #0
	ldr r0, [r5, r0]
	ldr r2, _0221C148 ; =0x0000FFFF
	sub r3, #0x12
	bl sub_02003370
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0221C13C: .word 0x04001050
_0221C140: .word 0x0000207A
_0221C144: .word 0x00002088
_0221C148: .word 0x0000FFFF
	thumb_func_end ov08_0221C048

	thumb_func_start ov08_0221C14C
ov08_0221C14C: ; 0x0221C14C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02003B44
	cmp r0, #0
	beq _0221C162
	mov r0, #1
	pop {r4, pc}
_0221C162:
	add r0, r4, #0
	bl ov08_0221D438
	cmp r0, #1
	bne _0221C1BA
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	cmp r0, #6
	bne _0221C18E
	add r1, #0x35
	ldrb r0, [r1]
	cmp r0, #1
	beq _0221C1BA
	ldr r0, _0221C1C0 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #6
	bl ov08_022220AC
	mov r0, #0x19
	pop {r4, pc}
_0221C18E:
	ldr r0, _0221C1C0 ; =0x000005DD
	bl PlaySE
	ldr r1, [r4]
	add r0, r4, #0
	ldrb r1, [r1, #0x11]
	bl ov08_022220AC
	ldr r0, [r4]
	add r0, #0x35
	ldrb r0, [r0]
	cmp r0, #2
	bne _0221C1B0
	add r0, r4, #0
	bl ov08_0221C1C8
	pop {r4, pc}
_0221C1B0:
	ldr r0, _0221C1C4 ; =0x00002079
	mov r1, #7
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C1BA:
	mov r0, #1
	pop {r4, pc}
	nop
_0221C1C0: .word 0x000005DD
_0221C1C4: .word 0x00002079
	thumb_func_end ov08_0221C14C

	thumb_func_start ov08_0221C1C8
ov08_0221C1C8: ; 0x0221C1C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5]
	ldrb r1, [r4, #0x11]
	cmp r1, #0
	bne _0221C1DA
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _0221C1E4
_0221C1DA:
	cmp r1, #1
	bne _0221C200
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0221C200
_0221C1E4:
	add r0, r5, #0
	bl ov08_0222057C
	add r0, r5, #0
	bl ov08_022201C0
	ldr r0, [r5]
	mov r1, #6
	strb r1, [r0, #0x11]
	ldr r0, _0221C30C ; =0x00002079
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x11
	pop {r3, r4, r5, pc}
_0221C200:
	ldrh r0, [r4, #0x22]
	ldr r2, [r4, #0xc]
	mov r1, #0x24
	bl GetItemAttr
	cmp r0, #0
	beq _0221C236
	ldrh r0, [r4, #0x22]
	ldr r2, [r4, #0xc]
	mov r1, #0x25
	bl GetItemAttr
	cmp r0, #0
	bne _0221C236
	ldrb r1, [r4, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r0, r5, r0
	ldrb r0, [r0, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0221C236
	ldr r0, _0221C30C ; =0x00002079
	mov r1, #0xd
	strb r1, [r5, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C236:
	ldrh r0, [r4, #0x22]
	mov r3, #0
	str r0, [sp]
	ldrb r2, [r4, #0x11]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x28]
	add r2, r4, r2
	add r2, #0x2c
	ldrb r2, [r2]
	bl ov12_0223AC20
	cmp r0, #1
	bne _0221C2E6
	ldrh r0, [r4, #0x22]
	ldr r2, [r4, #0xc]
	mov r1, #0x25
	bl GetItemAttr
	cmp r0, #0
	beq _0221C266
	ldr r0, _0221C30C ; =0x00002079
	mov r1, #0xd
	strb r1, [r5, r0]
	b _0221C2DC
_0221C266:
	ldrb r1, [r4, #0x11]
	add r0, r5, #0
	bl ov08_0221D5DC
	cmp r0, #1
	bne _0221C2D6
	ldrh r0, [r4, #0x22]
	ldr r2, [r4, #0xc]
	mov r1, #0x17
	bl GetItemAttr
	cmp r0, #0
	bne _0221C2D6
	add r2, r4, #0
	add r2, #0x33
	ldrh r1, [r4, #0x22]
	ldrb r2, [r2]
	ldr r0, [r4, #8]
	ldr r3, [r4, #0xc]
	bl ov08_0221DBCC
	ldrb r2, [r4, #0x11]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x28]
	add r2, r4, r2
	add r2, #0x2c
	ldrb r2, [r2]
	bl ov12_0223A880
	ldrb r2, [r4, #0x11]
	mov r1, #0x50
	add r3, r2, #0
	mul r3, r1
	add r2, r5, r3
	str r0, [r2, #4]
	ldrb r0, [r4, #0x11]
	mov r2, #0
	mul r1, r0
	add r0, r5, r1
	ldr r0, [r0, #4]
	mov r1, #0xa3
	bl GetMonData
	strh r0, [r4, #0x20]
	ldrb r1, [r4, #0x11]
	mov r0, #0x50
	ldrh r2, [r4, #0x20]
	mul r0, r1
	add r0, r5, r0
	ldrh r0, [r0, #0x14]
	mov r1, #0x19
	sub r0, r2, r0
	strh r0, [r4, #0x20]
	ldr r0, _0221C30C ; =0x00002079
	strb r1, [r5, r0]
	b _0221C2DC
_0221C2D6:
	ldr r0, _0221C30C ; =0x00002079
	mov r1, #0x17
	strb r1, [r5, r0]
_0221C2DC:
	ldr r0, _0221C310 ; =0x0000207C
	mov r1, #0
	strb r1, [r5, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C2E6:
	ldr r2, _0221C314 ; =0x00001FA8
	mov r1, #0x51
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl ov08_022201C0
	ldr r0, [r5]
	mov r1, #6
	strb r1, [r0, #0x11]
	ldr r0, _0221C30C ; =0x00002079
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x11
	pop {r3, r4, r5, pc}
	nop
_0221C30C: .word 0x00002079
_0221C310: .word 0x0000207C
_0221C314: .word 0x00001FA8
	thumb_func_end ov08_0221C1C8

	thumb_func_start ov08_0221C318
ov08_0221C318: ; 0x0221C318
	push {r4, lr}
	add r4, r0, #0
	bl ov08_0221D4B0
	cmp r0, #3
	bhi _0221C3BA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221C330: ; jump table
	.short _0221C338 - _0221C330 - 2 ; case 0
	.short _0221C35E - _0221C330 - 2 ; case 1
	.short _0221C380 - _0221C330 - 2 ; case 2
	.short _0221C3A2 - _0221C330 - 2 ; case 3
_0221C338:
	ldr r0, _0221C3C0 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #7
	bl ov08_022220AC
	add r0, r4, #0
	bl ov08_0221D91C
	cmp r0, #1
	bne _0221C354
	mov r0, #0x19
	pop {r4, pc}
_0221C354:
	ldr r0, _0221C3C4 ; =0x00002079
	mov r1, #0xf
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C35E:
	add r0, r4, #0
	bl ov08_0221DAC4
	cmp r0, #1
	beq _0221C3BA
	ldr r0, _0221C3C0 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #8
	bl ov08_022220AC
	ldr r0, _0221C3C4 ; =0x00002079
	mov r1, #8
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C380:
	add r0, r4, #0
	bl ov08_0221DAC4
	cmp r0, #1
	beq _0221C3BA
	ldr r0, _0221C3C0 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xa
	bl ov08_022220AC
	ldr r0, _0221C3C4 ; =0x00002079
	mov r1, #9
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C3A2:
	ldr r0, _0221C3C0 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #6
	bl ov08_022220AC
	ldr r0, _0221C3C4 ; =0x00002079
	mov r1, #6
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C3BA:
	mov r0, #2
	pop {r4, pc}
	nop
_0221C3C0: .word 0x000005DD
_0221C3C4: .word 0x00002079
	thumb_func_end ov08_0221C318

	thumb_func_start ov08_0221C3C8
ov08_0221C3C8: ; 0x0221C3C8
	push {r4, lr}
	add r4, r0, #0
	bl ov08_0221D4F8
	cmp r0, #3
	bhi _0221C478
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221C3E0: ; jump table
	.short _0221C3E8 - _0221C3E0 - 2 ; case 0
	.short _0221C416 - _0221C3E0 - 2 ; case 1
	.short _0221C442 - _0221C3E0 - 2 ; case 2
	.short _0221C45A - _0221C3E0 - 2 ; case 3
_0221C3E8:
	ldr r1, [r4]
	mov r2, #0
	ldrb r1, [r1, #0x11]
	add r0, r4, #0
	mvn r2, r2
	bl ov08_0221D614
	cmp r0, #0xff
	beq _0221C478
	ldr r1, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _0221C47C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xc
	bl ov08_022220AC
	ldr r0, _0221C480 ; =0x00002079
	mov r1, #0xe
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C416:
	ldr r1, [r4]
	add r0, r4, #0
	ldrb r1, [r1, #0x11]
	mov r2, #1
	bl ov08_0221D614
	cmp r0, #0xff
	beq _0221C478
	ldr r1, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _0221C47C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xd
	bl ov08_022220AC
	ldr r0, _0221C480 ; =0x00002079
	mov r1, #0xe
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C442:
	ldr r0, _0221C47C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xb
	bl ov08_022220AC
	ldr r0, _0221C480 ; =0x00002079
	mov r1, #9
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C45A:
	ldr r0, _0221C47C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #6
	bl ov08_022220AC
	ldr r0, _0221C484 ; =0x0000208C
	mov r1, #1
	strb r1, [r4, r0]
	mov r1, #7
	sub r0, #0x13
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r4, pc}
_0221C478:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_0221C47C: .word 0x000005DD
_0221C480: .word 0x00002079
_0221C484: .word 0x0000208C
	thumb_func_end ov08_0221C3C8

	thumb_func_start ov08_0221C488
ov08_0221C488: ; 0x0221C488
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov08_0221D540
	add r5, r0, #0
	cmp r5, #7
	bhi _0221C57A
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221C4A2: ; jump table
	.short _0221C4B2 - _0221C4A2 - 2 ; case 0
	.short _0221C4B2 - _0221C4A2 - 2 ; case 1
	.short _0221C4B2 - _0221C4A2 - 2 ; case 2
	.short _0221C4B2 - _0221C4A2 - 2 ; case 3
	.short _0221C4EA - _0221C4A2 - 2 ; case 4
	.short _0221C518 - _0221C4A2 - 2 ; case 5
	.short _0221C544 - _0221C4A2 - 2 ; case 6
	.short _0221C55C - _0221C4A2 - 2 ; case 7
_0221C4B2:
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r1, r4, r0
	lsl r0, r5, #3
	add r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _0221C57A
	ldr r0, _0221C580 ; =0x000005DD
	bl PlaySE
	add r1, r5, #0
	add r1, #0xe
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov08_022220AC
	ldr r0, [r4]
	mov r1, #0xa
	add r0, #0x34
	strb r5, [r0]
	ldr r0, _0221C584 ; =0x00002079
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C4EA:
	ldr r1, [r4]
	mov r2, #0
	ldrb r1, [r1, #0x11]
	add r0, r4, #0
	mvn r2, r2
	bl ov08_0221D614
	cmp r0, #0xff
	beq _0221C57A
	ldr r1, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _0221C580 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xc
	bl ov08_022220AC
	ldr r0, _0221C584 ; =0x00002079
	mov r1, #0xe
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C518:
	ldr r1, [r4]
	add r0, r4, #0
	ldrb r1, [r1, #0x11]
	mov r2, #1
	bl ov08_0221D614
	cmp r0, #0xff
	beq _0221C57A
	ldr r1, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _0221C580 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xd
	bl ov08_022220AC
	ldr r0, _0221C584 ; =0x00002079
	mov r1, #0xe
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C544:
	ldr r0, _0221C580 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #9
	bl ov08_022220AC
	ldr r0, _0221C584 ; =0x00002079
	mov r1, #8
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C55C:
	ldr r0, _0221C580 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #6
	bl ov08_022220AC
	ldr r0, _0221C588 ; =0x0000208C
	mov r1, #2
	strb r1, [r4, r0]
	mov r1, #7
	sub r0, #0x13
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C57A:
	mov r0, #4
	pop {r3, r4, r5, pc}
	nop
_0221C580: .word 0x000005DD
_0221C584: .word 0x00002079
_0221C588: .word 0x0000208C
	thumb_func_end ov08_0221C488

	thumb_func_start ov08_0221C58C
ov08_0221C58C: ; 0x0221C58C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov08_0221D588
	add r5, r0, #0
	cmp r5, #4
	bhi _0221C5F6
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221C5A6: ; jump table
	.short _0221C5B0 - _0221C5A6 - 2 ; case 0
	.short _0221C5B0 - _0221C5A6 - 2 ; case 1
	.short _0221C5B0 - _0221C5A6 - 2 ; case 2
	.short _0221C5B0 - _0221C5A6 - 2 ; case 3
	.short _0221C5DE - _0221C5A6 - 2 ; case 4
_0221C5B0:
	ldr r1, [r4]
	add r0, r1, #0
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, r5
	beq _0221C5CE
	ldrb r1, [r1, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r1, r4, r0
	lsl r0, r5, #3
	add r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _0221C5F6
_0221C5CE:
	ldr r0, _0221C5FC ; =0x000005DD
	bl PlaySE
	ldr r0, [r4]
	add r0, #0x34
	strb r5, [r0]
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_0221C5DE:
	ldr r0, _0221C5FC ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #6
	bl ov08_022220AC
	ldr r0, _0221C600 ; =0x00002079
	mov r1, #9
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C5F6:
	mov r0, #5
	pop {r3, r4, r5, pc}
	nop
_0221C5FC: .word 0x000005DD
_0221C600: .word 0x00002079
	thumb_func_end ov08_0221C58C

	thumb_func_start ov08_0221C604
ov08_0221C604: ; 0x0221C604
	push {r3, r4, r5, lr}
	ldr r1, _0221C6E0 ; =ov08_02224F3C
	add r4, r0, #0
	bl ov08_0221D5D0
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0221C62E
	ldr r0, _0221C6E4 ; =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224C94
	add r5, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bne _0221C634
	mov r5, #6
	b _0221C634
_0221C62E:
	add r0, r4, #0
	bl ov08_022217C8
_0221C634:
	cmp r5, #6
	bhi _0221C6DC
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221C644: ; jump table
	.short _0221C652 - _0221C644 - 2 ; case 0
	.short _0221C652 - _0221C644 - 2 ; case 1
	.short _0221C652 - _0221C644 - 2 ; case 2
	.short _0221C652 - _0221C644 - 2 ; case 3
	.short _0221C652 - _0221C644 - 2 ; case 4
	.short _0221C67C - _0221C644 - 2 ; case 5
	.short _0221C6BC - _0221C644 - 2 ; case 6
_0221C652:
	lsl r0, r5, #0x18
	lsr r1, r0, #0x18
	ldr r0, [r4]
	add r0, #0x34
	strb r1, [r0]
	ldr r0, _0221C6E8 ; =0x0000208D
	strb r1, [r4, r0]
	ldr r0, _0221C6EC ; =0x000005DD
	bl PlaySE
	add r5, #0x17
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov08_022220AC
	ldr r0, _0221C6F0 ; =0x00002079
	mov r1, #0xc
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C67C:
	ldr r0, _0221C6F4 ; =0x00002077
	ldrb r3, [r4, r0]
	lsl r1, r3, #0x18
	lsr r1, r1, #0x1c
	beq _0221C6DC
	mov r2, #0xf
	add r1, r3, #0
	bic r1, r2
	lsl r2, r3, #0x1c
	lsr r3, r2, #0x1c
	mov r2, #1
	eor r2, r3
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	mov r2, #0xf
	and r2, r3
	orr r1, r2
	strb r1, [r4, r0]
	add r0, #0x16
	strb r5, [r4, r0]
	ldr r0, _0221C6EC ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x12
	bl ov08_022220AC
	ldr r0, _0221C6F0 ; =0x00002079
	mov r1, #0xb
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C6BC:
	ldr r0, [r4]
	mov r1, #4
	add r0, #0x34
	strb r1, [r0]
	ldr r0, _0221C6EC ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #6
	bl ov08_022220AC
	ldr r0, _0221C6F0 ; =0x00002079
	mov r1, #0x19
	strb r1, [r4, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C6DC:
	mov r0, #0x13
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221C6E0: .word ov08_02224F3C
_0221C6E4: .word 0x00002088
_0221C6E8: .word 0x0000208D
_0221C6EC: .word 0x000005DD
_0221C6F0: .word 0x00002079
_0221C6F4: .word 0x00002077
	thumb_func_end ov08_0221C604

	thumb_func_start ov08_0221C6F8
ov08_0221C6F8: ; 0x0221C6F8
	push {r3, r4, r5, lr}
	ldr r1, _0221C7FC ; =ov08_02224E44
	add r5, r0, #0
	bl ov08_0221D5D0
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0221C722
	ldr r0, _0221C800 ; =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bne _0221C728
	mov r4, #2
	b _0221C728
_0221C722:
	add r0, r5, #0
	bl ov08_022217C8
_0221C728:
	cmp r4, #0
	beq _0221C736
	cmp r4, #1
	beq _0221C792
	cmp r4, #2
	beq _0221C7D8
	b _0221C7F6
_0221C736:
	ldr r0, _0221C804 ; =0x000005DD
	bl PlaySE
	ldr r0, _0221C808 ; =0x00002077
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bne _0221C750
	add r0, r5, #0
	mov r1, #0x1c
	bl ov08_022220AC
	b _0221C758
_0221C750:
	add r0, r5, #0
	mov r1, #0x1d
	bl ov08_022220AC
_0221C758:
	add r0, r5, #0
	bl ov08_0221DB54
	cmp r0, #1
	bne _0221C788
	add r0, r5, #0
	bl ov08_0221F220
	ldr r0, _0221C808 ; =0x00002077
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bne _0221C77A
	add r0, r5, #0
	bl ov08_0221DB7C
	b _0221C780
_0221C77A:
	add r0, r5, #0
	bl ov08_0221DBB4
_0221C780:
	ldr r0, _0221C80C ; =0x00002079
	mov r1, #0x14
	strb r1, [r5, r0]
	b _0221C78E
_0221C788:
	ldr r0, _0221C80C ; =0x00002079
	mov r1, #0x19
	strb r1, [r5, r0]
_0221C78E:
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C792:
	ldr r0, _0221C808 ; =0x00002077
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	beq _0221C7F6
	ldr r0, _0221C804 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	mov r1, #0x12
	bl ov08_022220AC
	ldr r2, _0221C808 ; =0x00002077
	mov r1, #0xf
	ldrb r3, [r5, r2]
	add r0, r3, #0
	bic r0, r1
	lsl r1, r3, #0x1c
	lsr r3, r1, #0x1c
	mov r1, #1
	eor r1, r3
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	add r0, r2, #0
	add r0, #0x17
	strb r4, [r5, r0]
	mov r1, #0xc
	add r0, r2, #2
	strb r1, [r5, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C7D8:
	ldr r0, _0221C804 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	mov r1, #6
	bl ov08_022220AC
	ldr r0, _0221C810 ; =0x0000208E
	mov r1, #0
	strb r1, [r5, r0]
	mov r1, #0xb
	sub r0, #0x15
	strb r1, [r5, r0]
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_0221C7F6:
	mov r0, #0x14
	pop {r3, r4, r5, pc}
	nop
_0221C7FC: .word ov08_02224E44
_0221C800: .word 0x00002088
_0221C804: .word 0x000005DD
_0221C808: .word 0x00002077
_0221C80C: .word 0x00002079
_0221C810: .word 0x0000208E
	thumb_func_end ov08_0221C6F8

	thumb_func_start ov08_0221C814
ov08_0221C814: ; 0x0221C814
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	ldr r1, _0221C900 ; =ov08_02224E94
	add r4, r0, #0
	ldr r6, [r4]
	bl ov08_0221D5D0
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0221C842
	ldr r0, _0221C904 ; =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224C94
	add r5, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bne _0221C848
	mov r5, #4
	b _0221C848
_0221C842:
	add r0, r4, #0
	bl ov08_022217C8
_0221C848:
	cmp r5, #4
	bhi _0221C8FA
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221C858: ; jump table
	.short _0221C862 - _0221C858 - 2 ; case 0
	.short _0221C862 - _0221C858 - 2 ; case 1
	.short _0221C862 - _0221C858 - 2 ; case 2
	.short _0221C862 - _0221C858 - 2 ; case 3
	.short _0221C8E0 - _0221C858 - 2 ; case 4
_0221C862:
	ldrb r1, [r6, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r1, r4, r0
	lsl r0, r5, #3
	add r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _0221C8FA
	ldr r0, [r4]
	add r0, #0x34
	strb r5, [r0]
	ldr r0, _0221C908 ; =0x000005DD
	bl PlaySE
	add r1, r5, #0
	add r1, #0x13
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov08_022220AC
	ldrh r0, [r6, #0x22]
	add r3, r5, #0
	str r0, [sp]
	ldrb r2, [r6, #0x11]
	ldr r0, [r6, #8]
	ldr r1, [r6, #0x28]
	add r2, r6, r2
	add r2, #0x2c
	ldrb r2, [r2]
	bl ov12_0223AC20
	cmp r0, #1
	bne _0221C8BA
	ldr r0, _0221C90C ; =0x0000207C
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #0x17
	sub r0, r0, #3
	strb r1, [r4, r0]
	add sp, #4
	mov r0, #0x16
	pop {r3, r4, r5, r6, pc}
_0221C8BA:
	ldr r2, _0221C910 ; =0x00001FA8
	mov r1, #0x51
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl ov08_022201C0
	ldr r0, [r4]
	mov r1, #6
	strb r1, [r0, #0x11]
	ldr r0, _0221C914 ; =0x00002079
	mov r1, #0x19
	strb r1, [r4, r0]
	add sp, #4
	mov r0, #0x11
	pop {r3, r4, r5, r6, pc}
_0221C8E0:
	ldr r0, _0221C908 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #6
	bl ov08_022220AC
	ldr r0, _0221C914 ; =0x00002079
	mov r1, #6
	strb r1, [r4, r0]
	add sp, #4
	mov r0, #0x16
	pop {r3, r4, r5, r6, pc}
_0221C8FA:
	mov r0, #0x15
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0221C900: .word ov08_02224E94
_0221C904: .word 0x00002088
_0221C908: .word 0x000005DD
_0221C90C: .word 0x0000207C
_0221C910: .word 0x00001FA8
_0221C914: .word 0x00002079
	thumb_func_end ov08_0221C814

	thumb_func_start ov08_0221C918
ov08_0221C918: ; 0x0221C918
	push {r3, lr}
	mov r1, #0
	bl ov08_0221D840
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov08_0221C918

	thumb_func_start ov08_0221C924
ov08_0221C924: ; 0x0221C924
	push {r3, lr}
	mov r1, #1
	bl ov08_0221D840
	mov r0, #2
	pop {r3, pc}
	thumb_func_end ov08_0221C924

	thumb_func_start ov08_0221C930
ov08_0221C930: ; 0x0221C930
	push {r3, lr}
	mov r1, #2
	bl ov08_0221D840
	mov r0, #3
	pop {r3, pc}
	thumb_func_end ov08_0221C930

	thumb_func_start ov08_0221C93C
ov08_0221C93C: ; 0x0221C93C
	push {r3, lr}
	mov r1, #3
	bl ov08_0221D840
	mov r0, #4
	pop {r3, pc}
	thumb_func_end ov08_0221C93C

	thumb_func_start ov08_0221C948
ov08_0221C948: ; 0x0221C948
	push {r3, lr}
	mov r1, #4
	bl ov08_0221D840
	mov r0, #5
	pop {r3, pc}
	thumb_func_end ov08_0221C948

	thumb_func_start ov08_0221C954
ov08_0221C954: ; 0x0221C954
	push {r3, lr}
	ldr r1, _0221C974 ; =0x00002077
	ldrb r1, [r0, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bne _0221C968
	mov r1, #6
	bl ov08_0221D840
	b _0221C96E
_0221C968:
	mov r1, #8
	bl ov08_0221D840
_0221C96E:
	mov r0, #0x13
	pop {r3, pc}
	nop
_0221C974: .word 0x00002077
	thumb_func_end ov08_0221C954

	thumb_func_start ov08_0221C978
ov08_0221C978: ; 0x0221C978
	push {r4, lr}
	add r4, r0, #0
	bl ov08_022213C8
	ldr r0, _0221C9A0 ; =0x00002077
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bne _0221C994
	add r0, r4, #0
	mov r1, #7
	bl ov08_0221D840
	b _0221C99C
_0221C994:
	add r0, r4, #0
	mov r1, #9
	bl ov08_0221D840
_0221C99C:
	mov r0, #0x14
	pop {r4, pc}
	.balign 4, 0
_0221C9A0: .word 0x00002077
	thumb_func_end ov08_0221C978

	thumb_func_start ov08_0221C9A4
ov08_0221C9A4: ; 0x0221C9A4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #5
	bl ov08_0221D840
	ldr r2, [r4]
	mov r1, #0x25
	ldrh r0, [r2, #0x22]
	ldr r2, [r2, #0xc]
	bl GetItemAttr
	cmp r0, #0
	beq _0221C9C2
	mov r0, #0x18
	pop {r4, pc}
_0221C9C2:
	mov r0, #0x15
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_0221C9A4

	thumb_func_start ov08_0221C9C8
ov08_0221C9C8: ; 0x0221C9C8
	push {r4, lr}
	ldr r1, _0221CA04 ; =0x0000207A
	add r4, r0, #0
	ldrb r1, [r4, r1]
	bl ov08_02220C5C
	ldr r1, _0221CA04 ; =0x0000207A
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_0221DD70
	ldr r1, _0221CA04 ; =0x0000207A
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_022221CC
	ldr r1, _0221CA04 ; =0x0000207A
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_0221D6CC
	ldr r0, _0221CA04 ; =0x0000207A
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _0221C9FE
	mov r0, #3
	pop {r4, pc}
_0221C9FE:
	mov r0, #4
	pop {r4, pc}
	nop
_0221CA04: .word 0x0000207A
	thumb_func_end ov08_0221C9C8

	thumb_func_start ov08_0221CA08
ov08_0221CA08: ; 0x0221CA08
	push {r4, lr}
	add r4, r0, #0
	bl ov08_022201C0
	ldr r0, _0221CA1C ; =0x00002079
	mov r1, #0x10
	strb r1, [r4, r0]
	mov r0, #0x11
	pop {r4, pc}
	nop
_0221CA1C: .word 0x00002079
	thumb_func_end ov08_0221CA08

	thumb_func_start ov08_0221CA20
ov08_0221CA20: ; 0x0221CA20
	push {r3, lr}
	ldr r1, _0221CA30 ; =0x00002060
	add r0, r0, r1
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #2
	pop {r3, pc}
	.balign 4, 0
_0221CA30: .word 0x00002060
	thumb_func_end ov08_0221CA20

	thumb_func_start ov08_0221CA34
ov08_0221CA34: ; 0x0221CA34
	push {r3, lr}
	ldr r1, _0221CA4C ; =0x0000207B
	ldrb r0, [r0, r1]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0221CA46
	mov r0, #0x12
	pop {r3, pc}
_0221CA46:
	mov r0, #0x11
	pop {r3, pc}
	nop
_0221CA4C: .word 0x0000207B
	thumb_func_end ov08_0221CA34

	thumb_func_start ov08_0221CA50
ov08_0221CA50: ; 0x0221CA50
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221CA70 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0221CA66
	bl System_GetTouchNew
	cmp r0, #1
	bne _0221CA6C
_0221CA66:
	ldr r0, _0221CA74 ; =0x00002079
	ldrb r0, [r4, r0]
	pop {r4, pc}
_0221CA6C:
	mov r0, #0x12
	pop {r4, pc}
	.balign 4, 0
_0221CA70: .word gSystem
_0221CA74: .word 0x00002079
	thumb_func_end ov08_0221CA50

	thumb_func_start ov08_0221CA78
ov08_0221CA78: ; 0x0221CA78
	ldr r1, _0221CA8C ; =0x00001FA3
	ldrb r2, [r0, r1]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1f
	bne _0221CA88
	add r1, #0xd6
	ldrb r0, [r0, r1]
	bx lr
_0221CA88:
	mov r0, #0x16
	bx lr
	.balign 4, 0
_0221CA8C: .word 0x00001FA3
	thumb_func_end ov08_0221CA78

	thumb_func_start ov08_0221CA90
ov08_0221CA90: ; 0x0221CA90
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0221CC28 ; =0x0000207C
	add r4, r0, #0
	ldrb r1, [r4, r7]
	ldr r5, [r4]
	cmp r1, #4
	bls _0221CAA0
	b _0221CC24
_0221CAA0:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221CAAC: ; jump table
	.short _0221CAB6 - _0221CAAC - 2 ; case 0
	.short _0221CB7A - _0221CAAC - 2 ; case 1
	.short _0221CBA2 - _0221CAAC - 2 ; case 2
	.short _0221CBDA - _0221CAAC - 2 ; case 3
	.short _0221CBFA - _0221CAAC - 2 ; case 4
_0221CAB6:
	ldrb r2, [r5, #0x11]
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x28]
	add r2, r5, r2
	add r2, #0x2c
	ldrb r2, [r2]
	bl ov12_0223A880
	ldrb r2, [r5, #0x11]
	mov r1, #0x50
	mul r1, r2
	add r1, r4, r1
	str r0, [r1, #4]
	add r0, r4, #0
	bl ov08_02220224
	sub r0, r7, #2
	ldrb r0, [r4, r0]
	ldrb r1, [r5, #0x11]
	cmp r0, #5
	bne _0221CB00
	mov r0, #0x50
	mul r0, r1
	add r5, #0x34
	ldrb r1, [r5]
	add r0, r4, r0
	ldr r0, [r0, #4]
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	add r1, r7, #4
	strh r0, [r4, r1]
	mov r2, #2
	sub r0, r1, #4
	strb r2, [r4, r0]
	b _0221CB72
_0221CB00:
	mov r0, #0x50
	mul r0, r1
	add r0, r4, r0
	ldr r0, [r0, #4]
	bl sub_0208AD64
	add r6, r0, #0
	ldrb r0, [r5, #0x11]
	add r3, r4, #0
	mov r7, #0x50
	add r2, r0, #0
	add r3, #0x1b
	mul r2, r7
	ldrb r1, [r3, r2]
	mov r0, #0x78
	bic r1, r0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x19
	orr r0, r1
	strb r0, [r3, r2]
	ldrb r0, [r5, #0x11]
	add r1, r0, #0
	mul r1, r7
	add r1, r4, r1
	ldrb r1, [r1, #0x1b]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1c
	cmp r1, #7
	bne _0221CB56
	add r0, #0xd
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0221CC2C ; =0x00001FB8
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldrb r1, [r5, #0x11]
	add r0, r4, #0
	bl ov08_0221F5B0
_0221CB56:
	ldrb r1, [r5, #0x11]
	mov r0, #0x50
	mov r2, #0
	mul r0, r1
	add r0, r4, r0
	ldr r0, [r0, #4]
	mov r1, #0xa3
	bl GetMonData
	ldr r1, _0221CC30 ; =0x0000207E
	mov r2, #4
	strh r0, [r4, r1]
	sub r0, r1, #2
	strb r2, [r4, r0]
_0221CB72:
	ldr r0, _0221CC34 ; =0x000005EC
	bl PlaySE
	b _0221CC24
_0221CB7A:
	ldrb r1, [r5, #0x11]
	add r6, r4, #0
	mov r2, #0x50
	add r3, r1, #0
	add r6, #0x14
	mul r3, r2
	add r1, r7, #2
	ldrh r2, [r4, r1]
	ldrh r1, [r6, r3]
	cmp r2, r1
	beq _0221CB9C
	add r1, r1, #1
	strh r1, [r6, r3]
	ldrb r1, [r5, #0x11]
	bl ov08_0221F550
	b _0221CC24
_0221CB9C:
	mov r0, #3
	strb r0, [r4, r7]
	b _0221CC24
_0221CBA2:
	ldrb r3, [r5, #0x11]
	add r1, r4, #0
	mov r2, #0x50
	add r1, #0x36
	mul r2, r3
	add r6, r1, r2
	add r1, r5, #0
	add r1, #0x34
	ldrb r1, [r1]
	lsl r3, r1, #3
	add r1, r7, #4
	ldrh r2, [r4, r1]
	ldrb r1, [r6, r3]
	cmp r2, r1
	beq _0221CBD4
	add r1, r1, #1
	strb r1, [r6, r3]
	add r5, #0x34
	ldrb r2, [r5]
	add r1, r2, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov08_02220064
	b _0221CC24
_0221CBD4:
	mov r0, #3
	strb r0, [r4, r7]
	b _0221CC24
_0221CBDA:
	add r2, r5, #0
	add r2, #0x33
	ldrh r1, [r5, #0x22]
	ldrb r2, [r2]
	ldr r0, [r5, #8]
	ldr r3, [r5, #0xc]
	bl ov08_0221DBCC
	add r0, r4, #0
	bl ov08_022201C0
	mov r1, #0x19
	sub r0, r7, #3
	strb r1, [r4, r0]
	mov r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_0221CBFA:
	ldrb r1, [r5, #0x11]
	add r3, r4, #0
	mov r2, #0x50
	mul r2, r1
	add r1, r7, #2
	add r3, #0x14
	ldrh r6, [r4, r1]
	ldrh r1, [r3, r2]
	cmp r6, r1
	beq _0221CC1E
	add r1, r1, #1
	strh r1, [r3, r2]
	ldrb r1, [r5, #0x11]
	bl ov08_0221F550
	add r0, r4, #0
	bl ov08_022225A4
_0221CC1E:
	ldr r0, _0221CC28 ; =0x0000207C
	mov r1, #1
	strb r1, [r4, r0]
_0221CC24:
	mov r0, #0x17
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221CC28: .word 0x0000207C
_0221CC2C: .word 0x00001FB8
_0221CC30: .word 0x0000207E
_0221CC34: .word 0x000005EC
	thumb_func_end ov08_0221CA90

	thumb_func_start ov08_0221CC38
ov08_0221CC38: ; 0x0221CC38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	str r0, [sp, #4]
	ldr r0, _0221CD58 ; =0x0000207C
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _0221CC54
	cmp r0, #1
	beq _0221CCBE
	cmp r0, #2
	beq _0221CD28
	b _0221CD50
_0221CC54:
	ldr r2, [sp, #4]
	ldr r0, [sp, #4]
	ldrb r3, [r2, #0x11]
	ldr r1, [sp, #4]
	ldr r0, [r0, #8]
	add r2, r2, r3
	add r2, #0x2c
	ldrb r2, [r2]
	ldr r1, [r1, #0x28]
	bl ov12_0223A880
	ldr r1, [sp, #4]
	mov r7, #0
	ldrb r2, [r1, #0x11]
	mov r1, #0x50
	add r6, r7, #0
	mul r1, r2
	add r1, r5, r1
	str r0, [r1, #4]
	add r4, r5, #0
_0221CC7C:
	ldr r0, [sp, #4]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r1, r5, r0
	add r0, r1, r6
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _0221CCA0
	ldr r0, [r1, #4]
	add r1, r7, #0
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	mov r1, #0x82
	lsl r1, r1, #6
	strh r0, [r4, r1]
_0221CCA0:
	add r7, r7, #1
	add r6, #8
	add r4, r4, #2
	cmp r7, #4
	blo _0221CC7C
	add r0, r5, #0
	bl ov08_02220224
	ldr r0, _0221CD5C ; =0x000005EC
	bl PlaySE
	ldr r0, _0221CD58 ; =0x0000207C
	mov r1, #1
	strb r1, [r5, r0]
	b _0221CD50
_0221CCBE:
	mov r6, #0
	add r4, r6, #0
	str r6, [sp]
	add r7, r5, #0
_0221CCC6:
	ldr r0, [sp, #4]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r1, r5, r0
	ldr r0, [sp]
	add r1, r1, r0
	ldrh r0, [r1, #0x34]
	cmp r0, #0
	bne _0221CCDE
	add r6, r6, #1
	b _0221CD0E
_0221CCDE:
	mov r0, #0x82
	add r2, r1, #0
	lsl r0, r0, #6
	add r2, #0x36
	ldrh r0, [r7, r0]
	ldrb r2, [r2]
	cmp r0, r2
	beq _0221CD0C
	add r0, r1, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r2, r4, #0x10
	add r1, #0x36
	add r0, r0, #1
	strb r0, [r1]
	add r1, r4, #1
	lsl r1, r1, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov08_02220064
	b _0221CD0E
_0221CD0C:
	add r6, r6, #1
_0221CD0E:
	ldr r0, [sp]
	add r4, r4, #1
	add r0, #8
	add r7, r7, #2
	str r0, [sp]
	cmp r4, #4
	blo _0221CCC6
	cmp r6, #4
	bne _0221CD50
	ldr r0, _0221CD58 ; =0x0000207C
	mov r1, #2
	strb r1, [r5, r0]
	b _0221CD50
_0221CD28:
	ldr r2, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [sp, #4]
	add r2, #0x33
	ldr r3, [sp, #4]
	ldrh r1, [r1, #0x22]
	ldrb r2, [r2]
	ldr r0, [r0, #8]
	ldr r3, [r3, #0xc]
	bl ov08_0221DBCC
	add r0, r5, #0
	bl ov08_022201C0
	ldr r0, _0221CD60 ; =0x00002079
	mov r1, #0x19
	strb r1, [r5, r0]
	add sp, #8
	mov r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_0221CD50:
	mov r0, #0x18
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CD58: .word 0x0000207C
_0221CD5C: .word 0x000005EC
_0221CD60: .word 0x00002079
	thumb_func_end ov08_0221CC38

	thumb_func_start ov08_0221CD64
ov08_0221CD64: ; 0x0221CD64
	push {lr}
	sub sp, #0xc
	mov r2, #0
	str r2, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	mov r1, #0x7a
	str r2, [sp, #8]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0xa
	add r3, r1, #0
	ldr r2, _0221CD8C ; =0x0000FFFF
	sub r3, #0x12
	bl sub_02003370
	mov r0, #0x1a
	add sp, #0xc
	pop {pc}
	nop
_0221CD8C: .word 0x0000FFFF
	thumb_func_end ov08_0221CD64

	thumb_func_start ov08_0221CD90
ov08_0221CD90: ; 0x0221CD90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x7a
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02003B44
	cmp r0, #0
	beq _0221CDA8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221CDA8:
	add r0, r4, #0
	bl ov08_0221D14C
	add r0, r4, #0
	bl ov08_02220A50
	add r0, r4, #0
	bl ov08_0221DD40
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov08_0221CF08
	ldr r0, _0221CDF4 ; =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224B8C
	ldr r1, [r4]
	add r1, #0x32
	strb r0, [r1]
	ldr r0, _0221CDF4 ; =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224B7C
	mov r0, #4
	bl FontID_Release
	ldr r0, [r4]
	mov r1, #1
	add r0, #0x36
	strb r1, [r0]
	add r0, r5, #0
	bl sub_02007234
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0221CDF4: .word 0x00002088
	thumb_func_end ov08_0221CD90

	thumb_func_start ov08_0221CDF8
ov08_0221CDF8: ; 0x0221CDF8
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0221CEF4 ; =ov08_02224E34
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	mov r1, #1
	bl SetScreenModeAndDisable
	ldr r5, _0221CEF8 ; =ov08_02224EAC
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #7
	str r0, [r3]
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _0221CEFC ; =ov08_02224EE4
	add r3, sp, #0x38
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
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _0221CF00 ; =ov08_02224F00
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
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0221CF04 ; =ov08_02224EC8
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
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r3, [r4]
	mov r0, #5
	ldr r3, [r3, #0xc]
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #4
	ldr r3, [r3, #0xc]
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221CEF4: .word ov08_02224E34
_0221CEF8: .word ov08_02224EAC
_0221CEFC: .word ov08_02224EE4
_0221CF00: .word ov08_02224F00
_0221CF04: .word ov08_02224EC8
	thumb_func_end ov08_0221CDF8

	thumb_func_start ov08_0221CF08
ov08_0221CF08: ; 0x0221CF08
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_0221CF08

	thumb_func_start ov08_0221CF38
ov08_0221CF38: ; 0x0221CF38
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x47
	ldr r1, [r1, #0xc]
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5]
	mov r2, #0x79
	ldr r1, [r1, #0xc]
	lsl r2, r2, #2
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r1, #0x16
	mov r3, #7
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r2, [r5]
	add r0, r4, #0
	ldr r2, [r2, #0xc]
	mov r1, #0x14
	bl NARC_AllocAndReadWholeMember
	add r1, sp, #0x10
	add r6, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r1, #0xc
	bl ov08_022217F0
	add r0, r6, #0
	bl FreeToHeap
	ldr r2, [r5]
	add r0, r4, #0
	ldr r2, [r2, #0xc]
	mov r1, #0x15
	bl NARC_AllocAndReadWholeMember
	add r1, sp, #0x10
	add r6, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r1, #0xc
	bl ov08_02221B1C
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	str r0, [sp]
	lsl r0, r0, #9
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x7a
	ldr r3, [r5]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r3, #0xc]
	mov r1, #0x47
	mov r2, #0x17
	bl PaletteData_LoadNarc
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl PaletteData_GetUnfadedBuf
	add r2, r0, #0
	ldr r0, _0221D0F0 ; =0x00001F60
	mov r1, #6
	lsl r1, r1, #6
	add r1, r2, r1
	add r0, r5, r0
	mov r2, #0x40
	bl memcpy
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xd0
	str r0, [sp, #8]
	mov r0, #0x7a
	ldr r3, [r5]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r3, #0xc]
	mov r1, #0x10
	mov r2, #7
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xf0
	str r0, [sp, #8]
	ldr r3, [r5]
	add r0, #0xf8
	ldr r0, [r5, r0]
	ldr r3, [r3, #0xc]
	mov r1, #0x10
	mov r2, #8
	bl PaletteData_LoadNarc
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl ov12_0223B708
	add r4, r0, #0
	bl sub_0200E63C
	add r1, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r2, #0x79
	ldr r0, [r0, #0xc]
	lsl r2, r2, #2
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r0, #0x26
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	add r0, r4, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	mov r0, #0x7a
	ldr r3, [r5]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r3, #0xc]
	mov r1, #0x26
	bl PaletteData_LoadNarc
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl PaletteData_GetUnfadedBuf
	add r6, r0, #0
	ldr r0, [r5]
	mov r1, #0x20
	ldr r0, [r0, #0xc]
	bl AllocFromHeap
	mov r1, #0x1a
	lsl r1, r1, #4
	add r1, r6, r1
	mov r2, #0x20
	add r4, r0, #0
	bl memcpy
	mov r0, #0x4d
	lsl r0, r0, #2
	add r1, r6, r0
	ldrb r3, [r1]
	add r2, r4, #0
	add r2, #0xe
	strb r3, [r4, #0xe]
	ldrb r3, [r1, #1]
	strb r3, [r2, #1]
	ldrb r3, [r1, #2]
	strb r3, [r2, #2]
	ldrb r1, [r1, #3]
	mov r3, #0xd0
	strb r1, [r2, #3]
	add r2, r0, #4
	add r1, r0, #4
	ldrb r2, [r6, r2]
	add r1, r6, r1
	add r0, #0xb4
	strb r2, [r4, #6]
	ldrb r2, [r1, #1]
	strb r2, [r4, #7]
	ldrb r2, [r1, #2]
	strb r2, [r4, #8]
	ldrb r1, [r1, #3]
	mov r2, #1
	strb r1, [r4, #9]
	mov r1, #0x20
	str r1, [sp]
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl PaletteData_LoadPalette
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0221D0F0: .word 0x00001F60
	thumb_func_end ov08_0221CF38

	thumb_func_start ov08_0221D0F4
ov08_0221D0F4: ; 0x0221D0F4
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4]
	mov r0, #0
	ldr r3, [r3, #0xc]
	mov r1, #0x1b
	mov r2, #6
	bl NewMsgDataFromNarc
	ldr r1, _0221D13C ; =0x00001FA8
	mov r2, #0
	str r0, [r4, r1]
	ldr r3, [r4]
	mov r0, #0xf
	ldr r3, [r3, #0xc]
	mov r1, #0xe
	bl MessagePrinter_new
	ldr r1, _0221D140 ; =0x00001FA4
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl ScrStrBufs_new
	ldr r1, _0221D144 ; =0x00001FAC
	str r0, [r4, r1]
	ldr r1, [r4]
	mov r0, #2
	ldr r1, [r1, #0xc]
	lsl r0, r0, #8
	bl String_ctor
	ldr r1, _0221D148 ; =0x00001FB0
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_0221D13C: .word 0x00001FA8
_0221D140: .word 0x00001FA4
_0221D144: .word 0x00001FAC
_0221D148: .word 0x00001FB0
	thumb_func_end ov08_0221D0F4

	thumb_func_start ov08_0221D14C
ov08_0221D14C: ; 0x0221D14C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221D174 ; =0x00001FA8
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _0221D178 ; =0x00001FA4
	ldr r0, [r4, r0]
	bl MessagePrinter_delete
	ldr r0, _0221D17C ; =0x00001FAC
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	ldr r0, _0221D180 ; =0x00001FB0
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	nop
_0221D174: .word 0x00001FA8
_0221D178: .word 0x00001FA4
_0221D17C: .word 0x00001FAC
_0221D180: .word 0x00001FB0
	thumb_func_end ov08_0221D14C

	thumb_func_start ov08_0221D184
ov08_0221D184: ; 0x0221D184
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r0, #0
	bgt _0221D19E
	b _0221D432
_0221D19E:
	ldr r0, [sp, #8]
	mov r1, #0x50
	mul r1, r0
	ldr r0, [sp]
	str r1, [sp, #4]
	add r4, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	str r0, [r4, #4]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #0
	bne _0221D1C8
	b _0221D416
_0221D1C8:
	ldr r0, [sp, #8]
	mov r1, #0x50
	add r5, r0, #0
	mul r5, r1
	ldr r0, [sp]
	mov r1, #0xa5
	add r4, r0, r5
	ldr r0, [r4, #4]
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xa]
	ldr r0, [r4, #4]
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xc]
	ldr r0, [r4, #4]
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xe]
	ldr r0, [r4, #4]
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x10]
	ldr r0, [r4, #4]
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x12]
	ldr r0, [r4, #4]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x14]
	ldr r0, [r4, #4]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	strb r0, [r4, #0x18]
	ldr r0, [r4, #4]
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	ldr r6, [sp]
	strb r0, [r4, #0x19]
	ldr r0, [r4, #4]
	add r6, #0x1a
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldrb r1, [r6, r5]
	mov r2, #0x7f
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #0x7f
	and r0, r2
	orr r0, r1
	strb r0, [r6, r5]
	ldr r0, [r4, #4]
	mov r1, #0xb0
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	ldrb r1, [r6, r5]
	bne _0221D278
	mov r0, #0x80
	bic r1, r0
	strb r1, [r6, r5]
	b _0221D27E
_0221D278:
	mov r0, #0x80
	orr r0, r1
	strb r0, [r6, r5]
_0221D27E:
	ldr r0, [sp]
	add r4, r0, r5
	add r6, r0, #0
	ldr r0, [r4, #4]
	add r6, #0x1b
	bl GetMonGender
	ldrb r1, [r6, r5]
	mov r2, #7
	bic r1, r2
	mov r2, #7
	and r0, r2
	orr r0, r1
	strb r0, [r6, r5]
	ldr r0, [r4, #4]
	bl sub_0208AD64
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1c
	ldrb r1, [r6, r5]
	mov r2, #0x78
	lsr r0, r0, #0x19
	bic r1, r2
	orr r0, r1
	strb r0, [r6, r5]
	ldr r0, [r4, #4]
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r6, r5]
	mov r2, #0x80
	lsr r0, r0, #0x18
	bic r1, r2
	orr r0, r1
	strb r0, [r6, r5]
	ldr r0, [r4, #4]
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0x1e]
	ldr r0, [r4, #4]
	mov r1, #8
	mov r2, #0
	bl GetMonData
	ldr r6, [sp]
	str r0, [r4, #0x20]
	add r6, #0x1a
	ldrb r1, [r6, r5]
	ldrh r0, [r4, #8]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	bl GetMonExpBySpeciesAndLevel
	str r0, [r4, #0x24]
	ldrb r0, [r6, r5]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	cmp r1, #0x64
	bne _0221D316
	ldr r0, [sp]
	add r4, r0, r5
	ldr r0, [r4, #0x24]
	b _0221D322
_0221D316:
	ldr r0, [sp]
	add r1, r1, #1
	add r4, r0, r5
	ldrh r0, [r4, #8]
	bl GetMonExpBySpeciesAndLevel
_0221D322:
	str r0, [r4, #0x28]
	ldr r0, [r4, #4]
	mov r1, #0x13
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x2c
	strb r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0x14
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x2d
	strb r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0x15
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x2e
	strb r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0x16
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x2f
	strb r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0x17
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0xa2
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r4, #0x32
	strb r0, [r4]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r1, #0x34
	add r7, r1, r0
	ldr r1, [sp]
	mov r4, #0
	add r6, r1, r0
_0221D3A0:
	lsl r0, r4, #3
	add r1, r4, #0
	str r0, [sp, #0xc]
	add r5, r7, r0
	ldr r0, [r6, #4]
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0xc]
	strh r0, [r7, r1]
	add r0, r1, #0
	ldrh r0, [r7, r0]
	cmp r0, #0
	beq _0221D40C
	add r1, r4, #0
	ldr r0, [r6, #4]
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #2]
	add r1, r4, #0
	ldr r0, [r6, #4]
	add r1, #0x3e
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #3]
	ldrh r0, [r5]
	ldrb r1, [r5, #3]
	bl WazaGetMaxPp
	strb r0, [r5, #3]
	ldrh r0, [r5]
	mov r1, #3
	bl GetWazaAttr
	strb r0, [r5, #4]
	ldrh r0, [r5]
	mov r1, #1
	bl GetWazaAttr
	strb r0, [r5, #5]
	ldrh r0, [r5]
	mov r1, #4
	bl GetWazaAttr
	strb r0, [r5, #6]
	ldrh r0, [r5]
	mov r1, #2
	bl GetWazaAttr
	strb r0, [r5, #7]
_0221D40C:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _0221D3A0
_0221D416:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetPartyCount
	ldr r1, [sp, #8]
	cmp r1, r0
	bge _0221D432
	b _0221D19E
_0221D432:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov08_0221D184

	thumb_func_start ov08_0221D438
ov08_0221D438: ; 0x0221D438
	push {r3, r4, r5, lr}
	ldr r1, _0221D4A8 ; =ov08_02224F1C
	add r4, r0, #0
	bl ov08_0221D5D0
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0221D484
	ldr r0, _0221D4AC ; =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224C94
	add r5, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bne _0221D462
	mov r5, #6
	b _0221D46C
_0221D462:
	add r0, r0, #1
	cmp r5, r0
	bne _0221D46C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221D46C:
	cmp r5, #6
	beq _0221D47C
	add r0, r4, #0
	add r1, r5, #0
	bl ov08_0221D5DC
	cmp r0, #0
	beq _0221D4A2
_0221D47C:
	ldr r0, [r4]
	strb r5, [r0, #0x11]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221D484:
	cmp r5, #6
	beq _0221D494
	add r0, r4, #0
	add r1, r5, #0
	bl ov08_0221D5DC
	cmp r0, #0
	beq _0221D4A2
_0221D494:
	ldr r0, [r4]
	strb r5, [r0, #0x11]
	add r0, r4, #0
	bl ov08_022217C8
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221D4A2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221D4A8: .word ov08_02224F1C
_0221D4AC: .word 0x00002088
	thumb_func_end ov08_0221D438

	thumb_func_start ov08_0221D4B0
ov08_0221D4B0: ; 0x0221D4B0
	push {r3, r4, r5, lr}
	ldr r1, _0221D4F0 ; =ov08_02224E54
	add r5, r0, #0
	bl ov08_0221D5D0
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0221D4E4
	ldr r0, _0221D4F4 ; =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bne _0221D4DA
	mov r4, #3
	b _0221D4EA
_0221D4DA:
	add r0, r0, #1
	cmp r4, r0
	bne _0221D4EA
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0221D4E4:
	add r0, r5, #0
	bl ov08_022217C8
_0221D4EA:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D4F0: .word ov08_02224E54
_0221D4F4: .word 0x00002088
	thumb_func_end ov08_0221D4B0

	thumb_func_start ov08_0221D4F8
ov08_0221D4F8: ; 0x0221D4F8
	push {r3, r4, r5, lr}
	ldr r1, _0221D538 ; =ov08_02224E68
	add r5, r0, #0
	bl ov08_0221D5D0
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0221D52C
	ldr r0, _0221D53C ; =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bne _0221D522
	mov r4, #3
	b _0221D532
_0221D522:
	add r0, r0, #1
	cmp r4, r0
	bne _0221D532
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0221D52C:
	add r0, r5, #0
	bl ov08_022217C8
_0221D532:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D538: .word ov08_02224E68
_0221D53C: .word 0x00002088
	thumb_func_end ov08_0221D4F8

	thumb_func_start ov08_0221D540
ov08_0221D540: ; 0x0221D540
	push {r3, r4, r5, lr}
	ldr r1, _0221D580 ; =ov08_02224F5C
	add r5, r0, #0
	bl ov08_0221D5D0
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0221D574
	ldr r0, _0221D584 ; =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bne _0221D56A
	mov r4, #7
	b _0221D57A
_0221D56A:
	add r0, r0, #1
	cmp r4, r0
	bne _0221D57A
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0221D574:
	add r0, r5, #0
	bl ov08_022217C8
_0221D57A:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D580: .word ov08_02224F5C
_0221D584: .word 0x00002088
	thumb_func_end ov08_0221D540

	thumb_func_start ov08_0221D588
ov08_0221D588: ; 0x0221D588
	push {r3, r4, r5, lr}
	ldr r1, _0221D5C8 ; =ov08_02224E7C
	add r5, r0, #0
	bl ov08_0221D5D0
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0221D5BC
	ldr r0, _0221D5CC ; =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bne _0221D5B2
	mov r4, #4
	b _0221D5C2
_0221D5B2:
	add r0, r0, #1
	cmp r4, r0
	bne _0221D5C2
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0221D5BC:
	add r0, r5, #0
	bl ov08_022217C8
_0221D5C2:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D5C8: .word ov08_02224E7C
_0221D5CC: .word 0x00002088
	thumb_func_end ov08_0221D588

	thumb_func_start ov08_0221D5D0
ov08_0221D5D0: ; 0x0221D5D0
	ldr r3, _0221D5D8 ; =sub_02025224
	add r0, r1, #0
	bx r3
	nop
_0221D5D8: .word sub_02025224
	thumb_func_end ov08_0221D5D0

	thumb_func_start ov08_0221D5DC
ov08_0221D5DC: ; 0x0221D5DC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x50
	add r5, r0, #0
	mul r1, r4
	add r1, r5, r1
	ldrh r1, [r1, #8]
	cmp r1, #0
	bne _0221D5F2
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221D5F2:
	cmp r4, #0
	beq _0221D60C
	bl ov08_0221DAE4
	cmp r0, #0
	bne _0221D608
	add r0, r5, #0
	bl ov08_0221DB04
	cmp r0, #0
	beq _0221D610
_0221D608:
	cmp r4, #1
	bne _0221D610
_0221D60C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221D610:
	mov r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end ov08_0221D5DC

	thumb_func_start ov08_0221D614
ov08_0221D614: ; 0x0221D614
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	add r7, r2, #0
	add r6, r4, #0
	bl ov08_0221DB04
	cmp r0, #1
	bne _0221D68C
	ldr r2, _0221D6C8 ; =_02224E2C
	add r1, sp, #0
	ldrb r3, [r2]
	add r0, sp, #0
	mov r4, #0
	strb r3, [r1]
	ldrb r3, [r2, #1]
	strb r3, [r1, #1]
	ldrb r3, [r2, #2]
	strb r3, [r1, #2]
	ldrb r3, [r2, #3]
	strb r3, [r1, #3]
	ldrb r3, [r2, #4]
	ldrb r2, [r2, #5]
	strb r3, [r1, #4]
	strb r2, [r1, #5]
_0221D648:
	ldrb r1, [r0]
	cmp r6, r1
	beq _0221D656
	add r4, r4, #1
	add r0, r0, #1
	cmp r4, #6
	blt _0221D648
_0221D656:
	add r4, r4, r7
	bpl _0221D65E
	mov r4, #5
	b _0221D664
_0221D65E:
	cmp r4, #6
	blt _0221D664
	mov r4, #0
_0221D664:
	add r0, sp, #0
	ldrb r1, [r0, r4]
	cmp r6, r1
	beq _0221D6C0
	add r0, r5, #0
	bl ov08_0221D5DC
	cmp r0, #0
	beq _0221D656
	add r0, sp, #0
	ldrb r0, [r0, r4]
	mov r1, #0x50
	mul r1, r0
	add r1, r5, r1
	ldrb r1, [r1, #0x1b]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	bne _0221D656
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0221D68C:
	add r4, r4, r7
	bpl _0221D694
	mov r4, #5
	b _0221D69A
_0221D694:
	cmp r4, #6
	blt _0221D69A
	mov r4, #0
_0221D69A:
	cmp r6, r4
	beq _0221D6C0
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_0221D5DC
	cmp r0, #0
	beq _0221D68C
	mov r0, #0x50
	mul r0, r4
	add r0, r5, r0
	ldrb r0, [r0, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0221D68C
	lsl r0, r4, #0x18
	add sp, #8
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0221D6C0:
	mov r0, #0xff
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D6C8: .word _02224E2C
	thumb_func_end ov08_0221D614

	thumb_func_start ov08_0221D6CC
ov08_0221D6CC: ; 0x0221D6CC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	cmp r1, #2
	bne _0221D74A
	ldr r0, [r6]
	add r2, r6, #4
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r0, r2, r0
	ldrb r1, [r0, #0x16]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	cmp r1, #0x64
	bhs _0221D6F6
	ldr r2, [r0, #0x20]
	ldr r1, [r0, #0x24]
	ldr r0, [r0, #0x1c]
	sub r1, r1, r2
	sub r0, r0, r2
	b _0221D6FA
_0221D6F6:
	mov r1, #0
	add r0, r1, #0
_0221D6FA:
	mov r2, #0x40
	bl sub_02088068
	add r4, r0, #0
	mov r5, #0
	mov r7, #0x1e
_0221D706:
	cmp r4, #8
	blo _0221D70E
	add r1, r7, #0
	b _0221D716
_0221D70E:
	add r0, r4, #0
	add r0, #0x16
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
_0221D716:
	add r2, r5, #0
	add r2, #0xa
	lsl r2, r2, #0x10
	add r0, r6, #0
	lsr r2, r2, #0x10
	mov r3, #8
	bl ov08_0221D74C
	cmp r4, #8
	bhs _0221D72E
	mov r4, #0
	b _0221D734
_0221D72E:
	sub r4, #8
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_0221D734:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #8
	blo _0221D706
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
_0221D74A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_0221D6CC

	thumb_func_start ov08_0221D74C
ov08_0221D74C: ; 0x0221D74C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	lsl r1, r3, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	add r4, r2, #0
	str r1, [sp, #8]
	mov r1, #0x10
	str r1, [sp, #0xc]
	mov r1, #0x79
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	lsl r3, r4, #0x18
	mov r1, #7
	add r2, r5, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov08_0221D74C

	thumb_func_start ov08_0221D77C
ov08_0221D77C: ; 0x0221D77C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0xe
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	lsl r6, r2, #1
	add r4, r1, #0
	str r0, [sp, #0xc]
	mov r0, #0x79
	add r7, r6, #2
	lsl r0, r0, #2
	lsl r3, r7, #0x18
	ldr r0, [r5, r0]
	mov r1, #7
	add r2, r4, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	mov r0, #0xe
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x79
	add r6, r6, #3
	lsl r0, r0, #2
	add r2, r4, #1
	lsl r2, r2, #0x10
	lsl r3, r6, #0x18
	ldr r0, [r5, r0]
	mov r1, #7
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	mov r0, #0xf
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x79
	add r2, r4, #0
	lsl r0, r0, #2
	add r2, #0x20
	lsl r2, r2, #0x10
	lsl r3, r7, #0x18
	ldr r0, [r5, r0]
	mov r1, #7
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	mov r0, #0xf
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x79
	lsl r0, r0, #2
	add r4, #0x21
	lsl r2, r4, #0x10
	lsl r3, r6, #0x18
	ldr r0, [r5, r0]
	mov r1, #7
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_0221D77C

	thumb_func_start ov08_0221D81C
ov08_0221D81C: ; 0x0221D81C
	push {r4, r5, r6, lr}
	ldr r6, _0221D83C ; =0x00000125
	add r5, r0, #0
	mov r4, #0
_0221D824:
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov08_0221D77C
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _0221D824
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221D83C: .word 0x00000125
	thumb_func_end ov08_0221D81C

	thumb_func_start ov08_0221D840
ov08_0221D840: ; 0x0221D840
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov08_0221D8B0
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02220C5C
	add r0, r5, #0
	bl ov08_0221DD28
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_0221DC3C
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_0221DD70
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_0221D6CC
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_0222171C
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_022221CC
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02222524
	ldr r0, _0221D8AC ; =0x0000207A
	strb r4, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_0221D8AC: .word 0x0000207A
	thumb_func_end ov08_0221D840

	thumb_func_start ov08_0221D8B0
ov08_0221D8B0: ; 0x0221D8B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r2, _0221D918 ; =ov08_02224F80
	add r5, r0, #0
	lsl r0, r1, #3
	mov r4, #0
	add r6, r2, r0
_0221D8BE:
	ldr r2, [r5]
	ldr r1, [r6]
	ldr r2, [r2, #0xc]
	mov r0, #0x47
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	add r7, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x79
	lsl r0, r0, #2
	add r1, r4, #6
	ldr r2, [sp, #0xc]
	lsl r1, r1, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r2, #0xc
	mov r3, #0
	bl LoadRectToBgTilemapRect
	mov r0, #0x79
	lsl r0, r0, #2
	add r1, r4, #6
	lsl r1, r1, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r0, r7, #0
	bl FreeToHeap
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #2
	blo _0221D8BE
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D918: .word ov08_02224F80
	thumb_func_end ov08_0221D8B0

	thumb_func_start ov08_0221D91C
ov08_0221D91C: ; 0x0221D91C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r2, #0x50
	ldrb r1, [r1, #0x11]
	add r3, r5, #4
	mul r2, r1
	add r4, r3, r2
	bl ov08_0221DB24
	cmp r0, #1
	bne _0221D978
	ldr r0, _0221DAB8 ; =0x00001FA8
	mov r1, #0x50
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	add r4, r0, #0
	ldr r0, [r1, #8]
	ldr r1, [r1, #0x28]
	bl ov12_0223AB6C
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl ov12_0223A9F4
	add r2, r0, #0
	ldr r0, _0221DABC ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferTrainerNameFromDataStruct
	ldr r1, _0221DABC ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221D978:
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	bne _0221D9B4
	ldr r0, _0221DAB8 ; =0x00001FA8
	mov r1, #0x4d
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r4]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0221DABC ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _0221DABC ; =0x00001FAC
	add r2, r6, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221D9B4:
	ldr r2, [r5]
	ldrb r0, [r2, #0x11]
	add r0, r2, r0
	add r0, #0x2c
	ldrb r1, [r0]
	ldrb r0, [r2, #0x14]
	cmp r0, r1
	beq _0221D9CA
	ldrb r0, [r2, #0x15]
	cmp r0, r1
	bne _0221DA00
_0221D9CA:
	ldr r0, _0221DAB8 ; =0x00001FA8
	mov r1, #0x4c
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r4]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0221DABC ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _0221DABC ; =0x00001FAC
	add r2, r6, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DA00:
	add r0, r5, #0
	bl ov08_0221DAC4
	cmp r0, #1
	bne _0221DA1C
	ldr r2, _0221DAB8 ; =0x00001FA8
	mov r1, #0x4f
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DA1C:
	ldr r2, [r5]
	ldrb r1, [r2, #0x12]
	cmp r1, #6
	beq _0221DA6C
	ldrb r4, [r2, #0x11]
	add r0, r2, r4
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r1, r0
	bne _0221DA6C
	ldr r0, _0221DAB8 ; =0x00001FA8
	mov r1, #0x5d
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0x50
	mul r0, r4
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0221DABC ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _0221DABC ; =0x00001FAC
	add r2, r6, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DA6C:
	ldrh r0, [r2, #0x24]
	cmp r0, #0
	beq _0221DAB4
	ldr r1, _0221DAC0 ; =0x00002076
	mov r0, #0x50
	ldrb r2, [r5, r1]
	sub r1, #0xce
	add r4, r5, #4
	add r6, r2, #0
	mul r6, r0
	ldr r0, [r5, r1]
	mov r1, #0x4e
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [r4, r6]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0221DABC ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _0221DABC ; =0x00001FAC
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DAB4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221DAB8: .word 0x00001FA8
_0221DABC: .word 0x00001FAC
_0221DAC0: .word 0x00002076
	thumb_func_end ov08_0221D91C

	thumb_func_start ov08_0221DAC4
ov08_0221DAC4: ; 0x0221DAC4
	ldr r1, [r0]
	ldrb r2, [r1, #0x11]
	mov r1, #0x50
	mul r1, r2
	add r0, r0, r1
	ldrb r0, [r0, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0221DADA
	mov r0, #1
	b _0221DADC
_0221DADA:
	mov r0, #0
_0221DADC:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	.balign 4, 0
	thumb_func_end ov08_0221DAC4

	thumb_func_start ov08_0221DAE4
ov08_0221DAE4: ; 0x0221DAE4
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov12_0223A7E0
	cmp r0, #0x4a
	beq _0221DB00
	cmp r0, #0x4b
	beq _0221DB00
	mov r1, #0x12
	tst r0, r1
	beq _0221DB00
	mov r0, #1
	pop {r3, pc}
_0221DB00:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov08_0221DAE4

	thumb_func_start ov08_0221DB04
ov08_0221DB04: ; 0x0221DB04
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl ov12_0223A7E0
	cmp r0, #0x4a
	beq _0221DB20
	cmp r0, #0x4b
	beq _0221DB20
	mov r1, #8
	tst r0, r1
	beq _0221DB20
	mov r0, #1
	pop {r3, pc}
_0221DB20:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov08_0221DB04

	thumb_func_start ov08_0221DB24
ov08_0221DB24: ; 0x0221DB24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov08_0221DB04
	cmp r0, #1
	bne _0221DB4C
	ldr r0, _0221DB50 ; =0x0000208F
	ldrb r0, [r5, r0]
	cmp r0, #2
	bne _0221DB44
	mov r0, #1
	add r1, r4, #0
	tst r1, r0
	beq _0221DB4C
	pop {r3, r4, r5, pc}
_0221DB44:
	mov r0, #1
	add r1, r4, #0
	tst r1, r0
	beq _0221DB4E
_0221DB4C:
	mov r0, #0
_0221DB4E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221DB50: .word 0x0000208F
	thumb_func_end ov08_0221DB24

	thumb_func_start ov08_0221DB54
ov08_0221DB54: ; 0x0221DB54
	ldr r2, [r0]
	add r1, r2, #0
	add r1, #0x34
	ldrb r3, [r1]
	cmp r3, #4
	bne _0221DB64
	ldrh r0, [r2, #0x24]
	b _0221DB72
_0221DB64:
	ldrb r2, [r2, #0x11]
	mov r1, #0x50
	mul r1, r2
	add r1, r0, r1
	lsl r0, r3, #3
	add r0, r1, r0
	ldrh r0, [r0, #0x34]
_0221DB72:
	ldr r3, _0221DB78 ; =MoveIsHM
	bx r3
	nop
_0221DB78: .word MoveIsHM
	thumb_func_end ov08_0221DB54

	thumb_func_start ov08_0221DB7C
ov08_0221DB7C: ; 0x0221DB7C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221DBAC ; =0x00002020
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCE8
	ldr r0, _0221DBB0 ; =0x00002070
	ldr r0, [r4, r0]
	add r0, #0xa0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0221DBB0 ; =0x00002070
	ldr r0, [r4, r0]
	add r0, #0x60
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _0221DBB0 ; =0x00002070
	ldr r0, [r4, r0]
	add r0, #0x70
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	nop
_0221DBAC: .word 0x00002020
_0221DBB0: .word 0x00002070
	thumb_func_end ov08_0221DB7C

	thumb_func_start ov08_0221DBB4
ov08_0221DBB4: ; 0x0221DBB4
	push {r4, lr}
	add r4, r0, #0
	bl ov08_0221D81C
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_0221DBB4

	thumb_func_start ov08_0221DBCC
ov08_0221DBCC: ; 0x0221DBCC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0x41
	beq _0221DBF0
	cmp r4, #0x43
	beq _0221DBF0
	cmp r4, #0x42
	beq _0221DBF0
	bl ov12_0223AA80
	add r1, r4, #0
	mov r2, #1
	add r3, r7, #0
	bl Bag_TakeItem
_0221DBF0:
	add r0, r5, #0
	bl ov12_0223AA84
	add r1, r4, #0
	add r2, r6, #0
	bl BagCursor_Battle_SetLastUsedItem
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_0221DBCC

	thumb_func_start ov08_0221DC00
ov08_0221DC00: ; 0x0221DC00
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0221DC30 ; =0x00002050
	ldr r4, _0221DC34 ; =ov08_02224FD0
	mov r6, #0
	add r5, r7, r0
_0221DC0C:
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #2
	blo _0221DC0C
	ldr r1, _0221DC38 ; =0x0000207A
	add r0, r7, #0
	ldrb r1, [r7, r1]
	bl ov08_0221DC3C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221DC30: .word 0x00002050
_0221DC34: .word ov08_02224FD0
_0221DC38: .word 0x0000207A
	thumb_func_end ov08_0221DC00

	thumb_func_start ov08_0221DC3C
ov08_0221DC3C: ; 0x0221DC3C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	cmp r1, #9
	bhi _0221DCBC
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221DC50: ; jump table
	.short _0221DC64 - _0221DC50 - 2 ; case 0
	.short _0221DC6E - _0221DC50 - 2 ; case 1
	.short _0221DC78 - _0221DC50 - 2 ; case 2
	.short _0221DC82 - _0221DC50 - 2 ; case 3
	.short _0221DC8C - _0221DC50 - 2 ; case 4
	.short _0221DC96 - _0221DC50 - 2 ; case 5
	.short _0221DCA0 - _0221DC50 - 2 ; case 6
	.short _0221DCAA - _0221DC50 - 2 ; case 7
	.short _0221DCA0 - _0221DC50 - 2 ; case 8
	.short _0221DCB4 - _0221DC50 - 2 ; case 9
_0221DC64:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #6
	ldr r6, _0221DD00 ; =ov08_02225084
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC6E:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #4
	ldr r6, _0221DD04 ; =ov08_0222500C
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC78:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #0x23
	ldr r6, _0221DD08 ; =ov08_0222522C
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC82:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #0xb
	ldr r6, _0221DD0C ; =ov08_022250EC
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC8C:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #0x11
	ldr r6, _0221DD10 ; =ov08_022251A4
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC96:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #5
	ldr r6, _0221DD14 ; =ov08_0222502C
	strb r1, [r4, r0]
	b _0221DCBC
_0221DCA0:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #6
	ldr r6, _0221DD18 ; =ov08_02225054
	strb r1, [r4, r0]
	b _0221DCBC
_0221DCAA:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #0xc
	ldr r6, _0221DD1C ; =ov08_02225144
	strb r1, [r4, r0]
	b _0221DCBC
_0221DCB4:
	ldr r0, _0221DCFC ; =0x00002074
	mov r1, #7
	ldr r6, _0221DD20 ; =ov08_022250B4
	strb r1, [r4, r0]
_0221DCBC:
	ldr r1, _0221DCFC ; =0x00002074
	ldr r0, [r4]
	ldrb r1, [r4, r1]
	ldr r0, [r0, #0xc]
	bl AllocWindows
	ldr r1, _0221DD24 ; =0x00002070
	mov r5, #0
	str r0, [r4, r1]
	add r0, r1, #4
	ldrb r0, [r4, r0]
	cmp r0, #0
	bls _0221DCFA
	add r7, r1, #4
_0221DCD8:
	ldr r1, _0221DD24 ; =0x00002070
	mov r0, #0x79
	ldr r2, [r4, r1]
	lsl r0, r0, #2
	lsl r1, r5, #4
	add r1, r2, r1
	lsl r2, r5, #3
	ldr r0, [r4, r0]
	add r2, r6, r2
	bl AddWindow
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldrb r0, [r4, r7]
	cmp r5, r0
	blo _0221DCD8
_0221DCFA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221DCFC: .word 0x00002074
_0221DD00: .word ov08_02225084
_0221DD04: .word ov08_0222500C
_0221DD08: .word ov08_0222522C
_0221DD0C: .word ov08_022250EC
_0221DD10: .word ov08_022251A4
_0221DD14: .word ov08_0222502C
_0221DD18: .word ov08_02225054
_0221DD1C: .word ov08_02225144
_0221DD20: .word ov08_022250B4
_0221DD24: .word 0x00002070
	thumb_func_end ov08_0221DC3C

	thumb_func_start ov08_0221DD28
ov08_0221DD28: ; 0x0221DD28
	ldr r1, _0221DD38 ; =0x00002070
	add r2, r0, #0
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r3, _0221DD3C ; =WindowArray_dtor
	ldrb r1, [r2, r1]
	bx r3
	nop
_0221DD38: .word 0x00002070
_0221DD3C: .word WindowArray_dtor
	thumb_func_end ov08_0221DD28

	thumb_func_start ov08_0221DD40
ov08_0221DD40: ; 0x0221DD40
	push {r3, r4, r5, lr}
	ldr r1, _0221DD68 ; =0x00002070
	add r5, r0, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldrb r1, [r5, r1]
	bl WindowArray_dtor
	ldr r0, _0221DD6C ; =0x00002050
	mov r4, #0
	add r5, r5, r0
_0221DD56:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blo _0221DD56
	pop {r3, r4, r5, pc}
	nop
_0221DD68: .word 0x00002070
_0221DD6C: .word 0x00002050
	thumb_func_end ov08_0221DD40

	thumb_func_start ov08_0221DD70
ov08_0221DD70: ; 0x0221DD70
	push {r3, lr}
	cmp r1, #9
	bhi _0221DDCA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221DD82: ; jump table
	.short _0221DD96 - _0221DD82 - 2 ; case 0
	.short _0221DD9C - _0221DD82 - 2 ; case 1
	.short _0221DDA2 - _0221DD82 - 2 ; case 2
	.short _0221DDA8 - _0221DD82 - 2 ; case 3
	.short _0221DDAE - _0221DD82 - 2 ; case 4
	.short _0221DDB4 - _0221DD82 - 2 ; case 5
	.short _0221DDBA - _0221DD82 - 2 ; case 6
	.short _0221DDC0 - _0221DD82 - 2 ; case 7
	.short _0221DDBA - _0221DD82 - 2 ; case 8
	.short _0221DDC6 - _0221DD82 - 2 ; case 9
_0221DD96:
	bl ov08_0221F4A4
	pop {r3, pc}
_0221DD9C:
	bl ov08_0221F5D0
	pop {r3, pc}
_0221DDA2:
	bl ov08_0221F900
	pop {r3, pc}
_0221DDA8:
	bl ov08_0221F7C0
	pop {r3, pc}
_0221DDAE:
	bl ov08_0221FB18
	pop {r3, pc}
_0221DDB4:
	bl ov08_0221FF70
	pop {r3, pc}
_0221DDBA:
	bl ov08_0221FC7C
	pop {r3, pc}
_0221DDC0:
	bl ov08_0221FDA4
	pop {r3, pc}
_0221DDC6:
	bl ov08_02220084
_0221DDCA:
	pop {r3, pc}
	thumb_func_end ov08_0221DD70

	thumb_func_start ov08_0221DDCC
ov08_0221DDCC: ; 0x0221DDCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	ldr r0, _0221DF5C ; =0x00002070
	str r3, [sp, #0x14]
	ldr r5, [r6, r0]
	lsl r4, r1, #4
	ldr r0, [sp, #0x14]
	mov r1, #0x50
	mul r1, r0
	add r7, r6, #4
	add r0, r7, r1
	str r1, [sp, #0x24]
	ldr r1, [r6]
	str r0, [sp, #0x20]
	ldr r1, [r1, #0xc]
	mov r0, #0xc
	str r2, [sp, #0x10]
	bl String_ctor
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x1c]
	ldr r0, _0221DF60 ; =0x00001FA8
	lsl r2, r1, #2
	ldr r1, _0221DF64 ; =ov08_02224FF4
	ldr r0, [r6, r0]
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	ldr r0, [r7, r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0221DF68 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r6, r0]
	bl BufferBoxMonNickname
	ldr r0, _0221DF68 ; =0x00001FAC
	ldr r1, [sp, #0x1c]
	ldr r0, [r6, r0]
	ldr r2, [sp, #0x18]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x10]
	add r3, sp, #0x38
	cmp r0, #0
	bne _0221DE4E
	ldrb r7, [r3, #0x14]
	mov r0, #0xff
	ldr r1, [sp, #0x10]
	str r7, [sp]
	str r0, [sp, #4]
	ldr r0, _0221DF6C ; =0x000F0E00
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x10]
	add r0, r5, r4
	bl AddTextPrinterParameterized2
	b _0221DE6A
_0221DE4E:
	ldrb r7, [r3, #0x14]
	mov r0, #0xff
	ldr r1, [sp, #0x10]
	str r7, [sp]
	str r0, [sp, #4]
	ldr r0, _0221DF70 ; =0x00070809
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x10]
	add r0, r5, r4
	bl AddTextPrinterParameterized2
_0221DE6A:
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [sp, #0x20]
	ldrb r0, [r0, #0x16]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0221DF50
	ldr r0, [sp, #0x20]
	ldrb r0, [r0, #0x17]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1f
	bne _0221DF50
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	bne _0221DEEE
	ldr r0, _0221DF60 ; =0x00001FA8
	mov r1, #0x10
	ldr r0, [r6, r0]
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, r4
	bl GetWindowWidth
	str r0, [sp, #0x28]
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	ldr r1, [sp, #0x28]
	str r7, [sp]
	lsl r1, r1, #3
	sub r3, r1, r0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0221DED2
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221DF74 ; =0x00070800
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	b _0221DEE6
_0221DED2:
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221DF78 ; =0x000A0B00
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0221DEE6:
	add r0, r6, #0
	bl String_dtor
	b _0221DF50
_0221DEEE:
	cmp r0, #1
	bne _0221DF50
	ldr r0, _0221DF60 ; =0x00001FA8
	mov r1, #0x11
	ldr r0, [r6, r0]
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, r4
	bl GetWindowWidth
	str r0, [sp, #0x2c]
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	ldr r1, [sp, #0x2c]
	str r7, [sp]
	lsl r1, r1, #3
	sub r3, r1, r0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0221DF36
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	mov r1, #0
	add r0, r5, r4
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	b _0221DF4A
_0221DF36:
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221DF7C ; =0x000C0D00
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0221DF4A:
	add r0, r6, #0
	bl String_dtor
_0221DF50:
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221DF5C: .word 0x00002070
_0221DF60: .word 0x00001FA8
_0221DF64: .word ov08_02224FF4
_0221DF68: .word 0x00001FAC
_0221DF6C: .word 0x000F0E00
_0221DF70: .word 0x00070809
_0221DF74: .word 0x00070800
_0221DF78: .word 0x000A0B00
_0221DF7C: .word 0x000C0D00
	thumb_func_end ov08_0221DDCC

	thumb_func_start ov08_0221DF80
ov08_0221DF80: ; 0x0221DF80
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221DFC4 ; =0x00002070
	lsl r4, r1, #4
	ldr r1, [r5, r0]
	add r3, #8
	add r1, r1, r4
	str r1, [sp, #4]
	str r3, [sp, #8]
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	mov r3, #0x50
	mul r3, r2
	str r1, [sp, #0xc]
	add r2, r5, r3
	ldrb r2, [r2, #0x1a]
	sub r0, #0xcc
	ldr r0, [r5, r0]
	lsl r2, r2, #0x19
	mov r1, #1
	lsr r2, r2, #0x19
	mov r3, #3
	bl sub_0200CE7C
	ldr r0, _0221DFC4 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221DFC4: .word 0x00002070
	thumb_func_end ov08_0221DF80

	thumb_func_start ov08_0221DFC8
ov08_0221DFC8: ; 0x0221DFC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x50
	add r7, r3, #0
	mul r0, r2
	add r3, r5, #4
	add r0, r3, r0
	str r0, [sp, #0xc]
	add r0, sp, #0x18
	ldrb r6, [r0, #0x10]
	ldr r0, _0221E040 ; =0x00002070
	lsl r4, r1, #4
	ldr r1, [r5, r0]
	sub r0, #0xcc
	add r1, r1, r4
	str r1, [sp]
	str r7, [sp, #4]
	str r6, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r0, [r5, r0]
	ldrh r1, [r1, #0x10]
	mov r2, #3
	mov r3, #1
	bl sub_0200CDF0
	add r3, r7, #0
	ldr r2, _0221E044 ; =0x00001FA4
	str r6, [sp]
	ldr r0, [r5, r2]
	add r2, #0xcc
	ldr r2, [r5, r2]
	mov r1, #0
	add r2, r2, r4
	add r3, #0x18
	bl sub_0200CDAC
	ldr r0, _0221E040 ; =0x00002070
	add r7, #0x20
	ldr r1, [r5, r0]
	sub r0, #0xcc
	add r1, r1, r4
	str r1, [sp]
	str r7, [sp, #4]
	str r6, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r0, [r5, r0]
	ldrh r1, [r1, #0x12]
	mov r2, #3
	mov r3, #0
	bl sub_0200CDF0
	ldr r0, _0221E040 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E040: .word 0x00002070
_0221E044: .word 0x00001FA4
	thumb_func_end ov08_0221DFC8

	thumb_func_start ov08_0221E048
ov08_0221E048: ; 0x0221E048
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x50
	str r1, [sp, #8]
	mul r0, r2
	add r1, r4, #4
	str r3, [sp, #0xc]
	add r5, r1, r0
	ldrh r0, [r5, #0x10]
	ldrh r1, [r5, #0x12]
	mov r2, #0x30
	mov r7, #1
	bl sub_02088068
	str r0, [sp, #0x14]
	ldrh r0, [r5, #0x10]
	ldrh r1, [r5, #0x12]
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _0221E0A6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E082: ; jump table
	.short _0221E08C - _0221E082 - 2 ; case 0
	.short _0221E0A4 - _0221E082 - 2 ; case 1
	.short _0221E0A0 - _0221E082 - 2 ; case 2
	.short _0221E09E - _0221E082 - 2 ; case 3
	.short _0221E09E - _0221E082 - 2 ; case 4
_0221E08C:
	ldr r0, _0221E11C ; =0x00002070
	ldr r1, [r4, r0]
	ldr r0, [sp, #8]
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0221E09E:
	b _0221E0A6
_0221E0A0:
	mov r7, #3
	b _0221E0A6
_0221E0A4:
	mov r7, #5
_0221E0A6:
	add r0, sp, #0x20
	ldrb r6, [r0, #0x10]
	add r0, r7, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	lsl r5, r0, #4
	ldr r0, [sp, #0x14]
	add r3, r6, #1
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E11C ; =0x00002070
	lsl r1, r1, #0x18
	ldr r0, [r4, r0]
	lsl r3, r3, #0x10
	ldr r2, [sp, #0xc]
	add r0, r0, r5
	lsr r1, r1, #0x18
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	ldr r0, [sp, #0x14]
	add r3, r6, #2
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0221E11C ; =0x00002070
	lsl r3, r3, #0x10
	ldr r0, [r4, r0]
	ldr r2, [sp, #0xc]
	add r0, r0, r5
	add r1, r7, #0
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E11C ; =0x00002070
	add r3, r6, #4
	ldr r0, [r4, r0]
	lsl r1, r1, #0x18
	lsl r3, r3, #0x10
	ldr r2, [sp, #0xc]
	add r0, r0, r5
	lsr r1, r1, #0x18
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	ldr r0, _0221E11C ; =0x00002070
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E11C: .word 0x00002070
	thumb_func_end ov08_0221E048

	thumb_func_start ov08_0221E120
ov08_0221E120: ; 0x0221E120
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	mov r0, #0x10
	ldr r1, [r1, #0xc]
	add r7, r2, #0
	bl String_ctor
	add r6, r0, #0
	ldr r0, _0221E198 ; =0x00001FA8
	mov r1, #8
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	mov r2, #0x50
	mul r2, r7
	str r0, [sp, #0x10]
	ldr r0, _0221E19C ; =0x00001FAC
	add r2, r5, r2
	ldrh r2, [r2, #0x1c]
	ldr r0, [r5, r0]
	mov r1, #0
	bl BufferAbilityName
	ldr r0, _0221E19C ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E1A0 ; =0x000F0E00
	lsl r4, r4, #4
	str r0, [sp, #8]
	ldr r0, _0221E1A4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r2, r6, #0
	add r0, r0, r4
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E1A4 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E198: .word 0x00001FA8
_0221E19C: .word 0x00001FAC
_0221E1A0: .word 0x000F0E00
_0221E1A4: .word 0x00002070
	thumb_func_end ov08_0221E120

	thumb_func_start ov08_0221E1A8
ov08_0221E1A8: ; 0x0221E1A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x50
	add r7, r1, #0
	add r1, r4, #4
	mul r0, r2
	add r5, r1, r0
	ldrh r0, [r5, #0x1a]
	cmp r0, #0
	bne _0221E1CC
	ldr r0, _0221E234 ; =0x00001FA8
	mov r1, #0x14
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	add r6, r0, #0
	b _0221E202
_0221E1CC:
	ldr r1, [r4]
	mov r0, #0x12
	ldr r1, [r1, #0xc]
	bl String_ctor
	add r6, r0, #0
	ldr r0, _0221E234 ; =0x00001FA8
	mov r1, #9
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	ldr r0, _0221E238 ; =0x00001FAC
	ldrh r2, [r5, #0x1a]
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferItemName
	ldr r0, _0221E238 ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x10]
	bl String_dtor
_0221E202:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E23C ; =0x000F0E00
	lsl r5, r7, #4
	str r0, [sp, #8]
	ldr r0, _0221E240 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	add r2, r6, #0
	add r0, r0, r5
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E240 ; =0x00002070
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E234: .word 0x00001FA8
_0221E238: .word 0x00001FAC
_0221E23C: .word 0x000F0E00
_0221E240: .word 0x00002070
	thumb_func_end ov08_0221E1A8

	thumb_func_start ov08_0221E244
ov08_0221E244: ; 0x0221E244
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r1, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, _0221E2DC ; =0x00002070
	ldr r1, [r1, #0xc]
	ldr r4, [r5, r0]
	mov r0, #0x10
	str r3, [sp, #0x14]
	lsl r6, r2, #4
	bl String_ctor
	add r7, r0, #0
	ldr r0, _0221E2E0 ; =0x00001FA8
	ldr r1, [sp, #0x14]
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	ldr r0, _0221E2E4 ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	mov r1, #0
	bl BufferMoveName
	ldr r0, _0221E2E4 ; =0x00001FAC
	ldr r2, [sp, #0x18]
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl StringExpandPlaceholders
	add r0, sp, #0x20
	ldrh r0, [r0, #0x10]
	cmp r0, #4
	bne _0221E2A8
	add r0, r4, r6
	bl GetWindowWidth
	add r5, r0, #0
	add r0, sp, #0x20
	ldrh r0, [r0, #0x10]
	add r1, r7, #0
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r1, r5, #3
	sub r0, r1, r0
	lsr r3, r0, #1
	b _0221E2AA
_0221E2A8:
	mov r3, #0
_0221E2AA:
	add r1, sp, #0x20
	ldrh r0, [r1, #0x14]
	add r2, r7, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrh r1, [r1, #0x10]
	add r0, r4, r6
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E2DC: .word 0x00002070
_0221E2E0: .word 0x00001FA8
_0221E2E4: .word 0x00001FAC
	thumb_func_end ov08_0221E244

	thumb_func_start ov08_0221E2E8
ov08_0221E2E8: ; 0x0221E2E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, _0221E334 ; =0x00001FA8
	str r2, [sp, #0x10]
	add r5, r1, #0
	ldr r0, [r4, r0]
	add r6, r3, #0
	mov r1, #0xe
	bl NewString_ReadMsgData
	add r7, r0, #0
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E338 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0221E33C ; =0x00002070
	lsl r5, r5, #4
	ldr r0, [r4, r0]
	ldr r3, [sp, #0x10]
	add r0, r0, r5
	add r2, r7, #0
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	ldr r0, _0221E33C ; =0x00002070
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0221E334: .word 0x00001FA8
_0221E338: .word 0x000F0E00
_0221E33C: .word 0x00002070
	thumb_func_end ov08_0221E2E8

	thumb_func_start ov08_0221E340
ov08_0221E340: ; 0x0221E340
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0221E398 ; =0x00002050
	add r5, r1, #0
	mov r1, #1
	add r0, r4, r0
	add r2, r1, #0
	mov r3, #0xe
	bl DrawFrameAndWindow2
	ldr r0, _0221E398 ; =0x00002050
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	ldr r0, _0221E39C ; =0x00001FA8
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E3A0 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	ldr r0, _0221E398 ; =0x00002050
	add r2, r5, #0
	add r0, r4, r0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	ldr r0, _0221E398 ; =0x00002050
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221E398: .word 0x00002050
_0221E39C: .word 0x00001FA8
_0221E3A0: .word 0x00010200
	thumb_func_end ov08_0221E340

	thumb_func_start ov08_0221E3A4
ov08_0221E3A4: ; 0x0221E3A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r3, _0221E400 ; =0x00002070
	lsl r4, r1, #4
	ldr r5, [r0, r3]
	sub r3, #0xc8
	ldr r0, [r0, r3]
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #4
	add r1, r7, #0
	mov r2, #0
	bl FontID_String_GetWidth
	add r6, r0, #0
	add r0, r5, r4
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #5
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E404 ; =0x00070809
	lsl r3, r3, #3
	str r0, [sp, #8]
	mov r0, #0
	sub r3, r3, r6
	str r0, [sp, #0xc]
	add r0, r5, r4
	mov r1, #4
	add r2, r7, #0
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E400: .word 0x00002070
_0221E404: .word 0x00070809
	thumb_func_end ov08_0221E3A4

	thumb_func_start ov08_0221E408
ov08_0221E408: ; 0x0221E408
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0x50
	mul r0, r1
	add r2, r5, #4
	add r4, r2, r0
	ldr r1, _0221E5C4 ; =0x00002075
	mov r0, #0x16
	ldrb r2, [r5, r1]
	sub r1, #0xcd
	mul r0, r2
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [r5, r1]
	mov r1, #0x17
	bl NewString_ReadMsgData
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0221E5C8 ; =0x000F0E00
	add r0, #0x31
	str r2, [sp, #8]
	ldr r2, _0221E5CC ; =0x00002070
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r3, r1, #0
	add r0, r2, r0
	add r2, r7, #0
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	ldr r0, _0221E5D0 ; =0x00001FA8
	mov r1, #0x18
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x18]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	str r0, [sp, #0x1c]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r2, [r4, #0x16]
	ldr r0, _0221E5D4 ; =0x00001FAC
	mov r3, #3
	lsl r2, r2, #0x19
	ldr r0, [r5, r0]
	lsr r2, r2, #0x19
	bl BufferIntegerAsString
	ldr r0, _0221E5D4 ; =0x00001FAC
	ldr r1, [sp, #0x1c]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x18]
	bl StringExpandPlaceholders
	mov r1, #0
	add r0, r6, #0
	add r0, #0xb
	lsl r7, r0, #4
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E5C8 ; =0x000F0E00
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	ldr r0, _0221E5CC ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r3, r1, #0
	add r0, r0, r7
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, _0221E5D0 ; =0x00001FA8
	mov r1, #0x19
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	mov r1, #0
	str r0, [sp, #0x20]
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0221E5C8 ; =0x000F0E00
	add r0, #0x41
	str r2, [sp, #8]
	ldr r2, _0221E5CC ; =0x00002070
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r3, r1, #0
	add r0, r2, r0
	ldr r2, [sp, #0x20]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	bl String_dtor
	ldr r0, _0221E5D0 ; =0x00001FA8
	mov r1, #0x1a
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x14]
	ldr r1, [r1, #0xc]
	mov r0, #0xe
	bl String_ctor
	str r0, [sp, #0x10]
	ldrb r0, [r4, #0x16]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	cmp r0, #0x64
	bhs _0221E528
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221E5D4 ; =0x00001FAC
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x1c]
	ldr r0, [r5, r0]
	sub r2, r2, r3
	mov r1, #0
	mov r3, #6
	bl BufferIntegerAsString
	b _0221E53C
_0221E528:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221E5D4 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	mov r3, #6
	bl BufferIntegerAsString
_0221E53C:
	ldr r0, _0221E5D4 ; =0x00001FAC
	ldr r1, [sp, #0x10]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x14]
	bl StringExpandPlaceholders
	ldr r0, _0221E5CC ; =0x00002070
	add r6, #0xc
	ldr r0, [r5, r0]
	lsl r4, r6, #4
	add r0, r0, r4
	bl GetWindowWidth
	add r6, r0, #0
	mov r0, #0
	ldr r1, [sp, #0x10]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r1, r6, #3
	sub r0, r1, r0
	lsl r0, r0, #0x10
	mov r1, #0
	lsr r3, r0, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E5D8 ; =0x00010200
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, _0221E5CC ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
	ldr r0, [sp, #0x10]
	bl String_dtor
	ldr r0, _0221E5CC ; =0x00002070
	ldr r1, [r5, r0]
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221E5CC ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r7
	bl ScheduleWindowCopyToVram
	ldr r0, _0221E5CC ; =0x00002070
	ldr r1, [r5, r0]
	mov r0, #5
	lsl r0, r0, #6
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221E5CC ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E5C4: .word 0x00002075
_0221E5C8: .word 0x000F0E00
_0221E5CC: .word 0x00002070
_0221E5D0: .word 0x00001FA8
_0221E5D4: .word 0x00001FAC
_0221E5D8: .word 0x00010200
	thumb_func_end ov08_0221E408

	thumb_func_start ov08_0221E5DC
ov08_0221E5DC: ; 0x0221E5DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r5, r0, #0
	ldr r1, _0221E6C0 ; =0x00002075
	mov r0, #0x16
	ldrb r2, [r5, r1]
	sub r1, #0xcd
	mul r0, r2
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [r5, r1]
	mov r1, #0x20
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E6C4 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E6C8 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r3, r1, #0
	add r0, #0xe0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E6CC ; =0x00001FA8
	mov r1, #0x21
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	mov r2, #0x50
	add r6, r0, #0
	mul r2, r7
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E6D0 ; =0x00001FAC
	add r2, r5, r2
	ldrh r2, [r2, #0xa]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221E6D0 ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r4, #5
	lsl r4, r0, #4
	ldr r0, _0221E6C8 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r7
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r3, r0, #0x18
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E6D4 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E6C8 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E6C8 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0xe0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221E6C8 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0221E6C0: .word 0x00002075
_0221E6C4: .word 0x000F0E00
_0221E6C8: .word 0x00002070
_0221E6CC: .word 0x00001FA8
_0221E6D0: .word 0x00001FAC
_0221E6D4: .word 0x00010200
	thumb_func_end ov08_0221E5DC

	thumb_func_start ov08_0221E6D8
ov08_0221E6D8: ; 0x0221E6D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r5, r0, #0
	ldr r1, _0221E7BC ; =0x00002075
	mov r0, #0x16
	ldrb r2, [r5, r1]
	sub r1, #0xcd
	mul r0, r2
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [r5, r1]
	mov r1, #0x22
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E7C0 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E7C4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r3, r1, #0
	add r0, #0xf0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E7C8 ; =0x00001FA8
	mov r1, #0x23
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	mov r2, #0x50
	add r6, r0, #0
	mul r2, r7
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E7CC ; =0x00001FAC
	add r2, r5, r2
	ldrh r2, [r2, #0xc]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221E7CC ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r4, #6
	lsl r4, r0, #4
	ldr r0, _0221E7C4 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r7
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r3, r0, #0x18
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E7D0 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E7C4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E7C4 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0xf0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221E7C4 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0221E7BC: .word 0x00002075
_0221E7C0: .word 0x000F0E00
_0221E7C4: .word 0x00002070
_0221E7C8: .word 0x00001FA8
_0221E7CC: .word 0x00001FAC
_0221E7D0: .word 0x00010200
	thumb_func_end ov08_0221E6D8

	thumb_func_start ov08_0221E7D4
ov08_0221E7D4: ; 0x0221E7D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r5, r0, #0
	ldr r1, _0221E8BC ; =0x00002075
	mov r0, #0x16
	ldrb r2, [r5, r1]
	sub r1, #0xcd
	mul r0, r2
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [r5, r1]
	mov r1, #0x28
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0221E8C0 ; =0x000F0E00
	add r2, r2, #1
	str r0, [sp, #8]
	ldr r0, _0221E8C4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r3, r1, #0
	add r0, r0, r2
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E8C8 ; =0x00001FA8
	mov r1, #0x29
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	mov r2, #0x50
	add r6, r0, #0
	mul r2, r7
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E8CC ; =0x00001FAC
	add r2, r5, r2
	ldrh r2, [r2, #0xe]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221E8CC ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r4, #7
	lsl r4, r0, #4
	ldr r0, _0221E8C4 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r7
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r3, r0, #0x18
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E8D0 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E8C4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E8C4 ; =0x00002070
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221E8C4 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E8BC: .word 0x00002075
_0221E8C0: .word 0x000F0E00
_0221E8C4: .word 0x00002070
_0221E8C8: .word 0x00001FA8
_0221E8CC: .word 0x00001FAC
_0221E8D0: .word 0x00010200
	thumb_func_end ov08_0221E7D4

	thumb_func_start ov08_0221E8D4
ov08_0221E8D4: ; 0x0221E8D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r4, r0, #0
	ldr r1, _0221E9BC ; =0x00002075
	mov r0, #0x16
	ldrb r2, [r4, r1]
	sub r1, #0xcd
	mul r0, r2
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [r4, r1]
	mov r1, #0x24
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0221E9C0 ; =0x000F0E00
	add r0, #0x11
	str r2, [sp, #8]
	ldr r2, _0221E9C4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	add r3, r1, #0
	add r0, r2, r0
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E9C8 ; =0x00001FA8
	mov r1, #0x25
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	ldr r1, [r4]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	mov r2, #0x50
	add r6, r0, #0
	mul r2, r7
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E9CC ; =0x00001FAC
	add r2, r4, r2
	ldrh r2, [r2, #0x10]
	ldr r0, [r4, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221E9CC ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, _0221E9C4 ; =0x00002070
	add r5, #8
	ldr r0, [r4, r0]
	lsl r5, r5, #4
	add r0, r0, r5
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r7
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r3, r0, #0x18
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E9D0 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E9C4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221E9C4 ; =0x00002070
	ldr r1, [r4, r0]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221E9C4 ; =0x00002070
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E9BC: .word 0x00002075
_0221E9C0: .word 0x000F0E00
_0221E9C4: .word 0x00002070
_0221E9C8: .word 0x00001FA8
_0221E9CC: .word 0x00001FAC
_0221E9D0: .word 0x00010200
	thumb_func_end ov08_0221E8D4

	thumb_func_start ov08_0221E9D4
ov08_0221E9D4: ; 0x0221E9D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r4, r0, #0
	ldr r1, _0221EABC ; =0x00002075
	mov r0, #0x16
	ldrb r2, [r4, r1]
	sub r1, #0xcd
	mul r0, r2
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [r4, r1]
	mov r1, #0x26
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0221EAC0 ; =0x000F0E00
	add r0, #0x21
	str r2, [sp, #8]
	ldr r2, _0221EAC4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	add r3, r1, #0
	add r0, r2, r0
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221EAC8 ; =0x00001FA8
	mov r1, #0x27
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	ldr r1, [r4]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	mov r2, #0x50
	add r6, r0, #0
	mul r2, r7
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EACC ; =0x00001FAC
	add r2, r4, r2
	ldrh r2, [r2, #0x12]
	ldr r0, [r4, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221EACC ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, _0221EAC4 ; =0x00002070
	add r5, #9
	ldr r0, [r4, r0]
	lsl r5, r5, #4
	add r0, r0, r5
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r7
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r3, r0, #0x18
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EAD0 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221EAC4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221EAC4 ; =0x00002070
	ldr r1, [r4, r0]
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221EAC4 ; =0x00002070
	ldr r0, [r4, r0]
	add r0, r0, r5
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EABC: .word 0x00002075
_0221EAC0: .word 0x000F0E00
_0221EAC4: .word 0x00002070
_0221EAC8: .word 0x00001FA8
_0221EACC: .word 0x00001FAC
_0221EAD0: .word 0x00010200
	thumb_func_end ov08_0221E9D4

	thumb_func_start ov08_0221EAD4
ov08_0221EAD4: ; 0x0221EAD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	mov r0, #0x50
	mul r0, r1
	add r2, r5, #4
	add r7, r2, r0
	ldr r1, _0221EC54 ; =0x00002075
	mov r0, #0x16
	ldrb r2, [r5, r1]
	sub r1, #0xcd
	mul r0, r2
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [r5, r1]
	mov r1, #0x1c
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC58 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221EC5C ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r3, r1, #0
	add r0, #0xd0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, _0221EC60 ; =0x00001FA8
	mov r1, #0x1f
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	mov r0, #0
	ldr r1, [sp, #0x10]
	add r2, r0, #0
	bl FontID_String_GetWidth
	str r0, [sp, #0x14]
	ldr r0, _0221EC5C ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x40
	bl GetWindowWidth
	lsl r1, r0, #3
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	sub r0, r1, r0
	lsl r0, r0, #0xf
	lsr r6, r0, #0x10
	add r0, r4, #4
	mov r1, #0
	lsl r4, r0, #4
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC64 ; =0x00010200
	add r3, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221EC5C ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	ldr r0, _0221EC60 ; =0x00001FA8
	mov r1, #0x1d
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x18]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	str r0, [sp, #0x1c]
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EC68 ; =0x00001FAC
	ldrh r2, [r7, #0x10]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221EC68 ; =0x00001FAC
	ldr r1, [sp, #0x1c]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x18]
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [sp, #0x1c]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC64 ; =0x00010200
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	ldr r0, _0221EC5C ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	sub r3, r6, r3
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, _0221EC60 ; =0x00001FA8
	mov r1, #0x1e
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x20]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	str r0, [sp, #0x24]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EC68 ; =0x00001FAC
	ldrh r2, [r7, #0x12]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221EC68 ; =0x00001FAC
	ldr r1, [sp, #0x24]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x20]
	bl StringExpandPlaceholders
	mov r1, #0
	ldr r3, [sp, #0x14]
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC64 ; =0x00010200
	ldr r2, [sp, #0x24]
	str r0, [sp, #8]
	ldr r0, _0221EC5C ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r3, r6, r3
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	bl String_dtor
	ldr r0, [sp, #0x24]
	bl String_dtor
	ldr r0, _0221EC5C ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0xd0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221EC5C ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EC54: .word 0x00002075
_0221EC58: .word 0x000F0E00
_0221EC5C: .word 0x00002070
_0221EC60: .word 0x00001FA8
_0221EC64: .word 0x00010200
_0221EC68: .word 0x00001FAC
	thumb_func_end ov08_0221EAD4

	thumb_func_start ov08_0221EC6C
ov08_0221EC6C: ; 0x0221EC6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0221ECD8 ; =0x00002075
	add r6, r1, #0
	ldrb r1, [r5, r0]
	ldr r3, [r5]
	mov r0, #0x16
	add r4, r1, #0
	mul r4, r0
	ldr r2, _0221ECDC ; =0x000002D2
	ldr r3, [r3, #0xc]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	mov r1, #0x50
	mul r1, r6
	add r1, r5, r1
	ldrh r1, [r1, #0x1c]
	add r7, r0, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r1, #0
	add r0, r4, #2
	lsl r4, r0, #4
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221ECE0 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221ECE4 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r3, r1, #0
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, _0221ECE4 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221ECD8: .word 0x00002075
_0221ECDC: .word 0x000002D2
_0221ECE0: .word 0x00010200
_0221ECE4: .word 0x00002070
	thumb_func_end ov08_0221EC6C

	thumb_func_start ov08_0221ECE8
ov08_0221ECE8: ; 0x0221ECE8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r2, _0221ED28 ; =0x00002070
	lsl r4, r1, #4
	ldr r5, [r0, r2]
	sub r2, #0xc8
	ldr r0, [r0, r2]
	mov r1, #0x33
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221ED2C ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221ED28: .word 0x00002070
_0221ED2C: .word 0x000F0E00
	thumb_func_end ov08_0221ECE8

	thumb_func_start ov08_0221ED30
ov08_0221ED30: ; 0x0221ED30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r2, [sp, #0x10]
	add r5, r0, #0
	ldr r2, _0221EE0C ; =0x00002070
	ldr r0, [sp, #0x10]
	lsl r6, r1, #4
	ldr r4, [r5, r2]
	cmp r0, #0
	bne _0221ED8A
	sub r2, #0xc8
	ldr r0, [r5, r2]
	mov r1, #0x32
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, r6
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r5
	lsl r0, r0, #0x10
	mov r1, #0
	lsr r3, r0, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE10 ; =0x00010200
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	b _0221EE00
_0221ED8A:
	sub r2, #0xc8
	ldr r0, [r5, r2]
	mov r1, #0x34
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x14]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EE14 ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221EE14 ; =0x00001FAC
	ldr r2, [sp, #0x14]
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, r6
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r5
	lsl r0, r0, #0x10
	mov r1, #0
	lsr r3, r0, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE10 ; =0x00010200
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
_0221EE00:
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221EE0C: .word 0x00002070
_0221EE10: .word 0x00010200
_0221EE14: .word 0x00001FAC
	thumb_func_end ov08_0221ED30

	thumb_func_start ov08_0221EE18
ov08_0221EE18: ; 0x0221EE18
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r2, _0221EE58 ; =0x00002070
	lsl r4, r1, #4
	ldr r5, [r0, r2]
	sub r2, #0xc8
	ldr r0, [r0, r2]
	mov r1, #0x30
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE5C ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221EE58: .word 0x00002070
_0221EE5C: .word 0x000F0E00
	thumb_func_end ov08_0221EE18

	thumb_func_start ov08_0221EE60
ov08_0221EE60: ; 0x0221EE60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r2, [sp, #0x10]
	add r5, r0, #0
	ldr r2, _0221EF3C ; =0x00002070
	ldr r0, [sp, #0x10]
	lsl r6, r1, #4
	ldr r4, [r5, r2]
	cmp r0, #1
	bhi _0221EEBA
	sub r2, #0xc8
	ldr r0, [r5, r2]
	mov r1, #0x32
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, r6
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r5
	lsl r0, r0, #0x10
	mov r1, #0
	lsr r3, r0, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EF40 ; =0x00010200
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	b _0221EF30
_0221EEBA:
	sub r2, #0xc8
	ldr r0, [r5, r2]
	mov r1, #0x31
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x14]
	ldr r1, [r1, #0xc]
	mov r0, #8
	bl String_ctor
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EF44 ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221EF44 ; =0x00001FAC
	ldr r2, [sp, #0x14]
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, r6
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r5
	lsl r0, r0, #0x10
	mov r1, #0
	lsr r3, r0, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EF40 ; =0x00010200
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
_0221EF30:
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221EF3C: .word 0x00002070
_0221EF40: .word 0x00010200
_0221EF44: .word 0x00001FAC
	thumb_func_end ov08_0221EE60

	thumb_func_start ov08_0221EF48
ov08_0221EF48: ; 0x0221EF48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r3, r0, #0
	ldr r0, _0221EF9C ; =0x00002070
	add r6, r2, #0
	ldr r5, [r3, r0]
	ldr r3, [r3]
	lsl r4, r1, #4
	ldr r2, _0221EFA0 ; =0x000002ED
	ldr r3, [r3, #0xc]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r1, r6, #0
	add r7, r0, #0
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EFA4 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EF9C: .word 0x00002070
_0221EFA0: .word 0x000002ED
_0221EFA4: .word 0x00010200
	thumb_func_end ov08_0221EF48

	thumb_func_start ov08_0221EFA8
ov08_0221EFA8: ; 0x0221EFA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r2, _0221F004 ; =0x00002070
	lsl r4, r1, #4
	ldr r5, [r0, r2]
	sub r2, #0xc8
	ldr r0, [r0, r2]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r5, r4
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r1, r0, r6
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	mov r1, #0
	lsr r3, r0, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F008 ; =0x000F0E00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r5, r4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F004: .word 0x00002070
_0221F008: .word 0x000F0E00
	thumb_func_end ov08_0221EFA8

	thumb_func_start ov08_0221F00C
ov08_0221F00C: ; 0x0221F00C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r3, _0221F074 ; =0x00002070
	lsl r4, r1, #4
	ldr r5, [r0, r3]
	cmp r2, #0
	beq _0221F024
	cmp r2, #1
	beq _0221F032
	cmp r2, #2
	beq _0221F040
	b _0221F04C
_0221F024:
	sub r3, #0xc8
	ldr r0, [r0, r3]
	mov r1, #0x36
	bl NewString_ReadMsgData
	add r6, r0, #0
	b _0221F04C
_0221F032:
	sub r3, #0xc8
	ldr r0, [r0, r3]
	mov r1, #0x38
	bl NewString_ReadMsgData
	add r6, r0, #0
	b _0221F04C
_0221F040:
	sub r3, #0xc8
	ldr r0, [r0, r3]
	mov r1, #0x37
	bl NewString_ReadMsgData
	add r6, r0, #0
_0221F04C:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F078 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221F074: .word 0x00002070
_0221F078: .word 0x00010200
	thumb_func_end ov08_0221F00C

	thumb_func_start ov08_0221F07C
ov08_0221F07C: ; 0x0221F07C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, _0221F1A0 ; =0x00002070
	lsl r6, r1, #4
	ldr r4, [r5, r0]
	sub r0, #0xc8
	ldr r0, [r5, r0]
	mov r1, #0x2e
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	mov r0, #0
	ldr r1, [sp, #0x18]
	add r2, r0, #0
	bl FontID_String_GetWidth
	str r0, [sp, #0x1c]
	add r0, r4, r6
	bl GetWindowWidth
	lsl r1, r0, #3
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	sub r0, r1, r0
	lsr r7, r0, #1
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F1A4 ; =0x000F0E00
	add r3, r7, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, _0221F1A8 ; =0x00001FA8
	mov r1, #0x2c
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x20]
	ldr r1, [r1, #0xc]
	mov r0, #6
	bl String_ctor
	mov r1, #0
	str r0, [sp, #0x24]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221F1AC ; =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221F1AC ; =0x00001FAC
	ldr r1, [sp, #0x24]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x20]
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [sp, #0x24]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F1A4 ; =0x000F0E00
	ldr r2, [sp, #0x24]
	str r0, [sp, #8]
	add r0, r4, r6
	sub r3, r7, r3
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	bl String_dtor
	ldr r0, [sp, #0x24]
	bl String_dtor
	ldr r0, _0221F1A8 ; =0x00001FA8
	mov r1, #0x2d
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	ldr r1, [r5]
	str r0, [sp, #0x28]
	ldr r1, [r1, #0xc]
	mov r0, #6
	bl String_ctor
	mov r1, #0
	str r0, [sp, #0x2c]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221F1AC ; =0x00001FAC
	ldr r2, [sp, #0x14]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, _0221F1AC ; =0x00001FAC
	ldr r1, [sp, #0x2c]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x28]
	bl StringExpandPlaceholders
	mov r1, #0
	ldr r3, [sp, #0x1c]
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F1A4 ; =0x000F0E00
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	add r0, r4, r6
	add r3, r7, r3
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x28]
	bl String_dtor
	ldr r0, [sp, #0x2c]
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F1A0: .word 0x00002070
_0221F1A4: .word 0x000F0E00
_0221F1A8: .word 0x00001FA8
_0221F1AC: .word 0x00001FAC
	thumb_func_end ov08_0221F07C

	thumb_func_start ov08_0221F1B0
ov08_0221F1B0: ; 0x0221F1B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsl r4, r1, #4
	ldr r1, [r0]
	ldr r2, _0221F218 ; =0x00002070
	add r1, #0x34
	ldrb r1, [r1]
	ldr r5, [r0, r2]
	cmp r1, #4
	bne _0221F1D0
	sub r2, #0xc8
	ldr r0, [r0, r2]
	mov r1, #0x3b
	bl NewString_ReadMsgData
	b _0221F1DA
_0221F1D0:
	sub r2, #0xc8
	ldr r0, [r0, r2]
	mov r1, #0x3a
	bl NewString_ReadMsgData
_0221F1DA:
	add r6, r0, #0
	mov r0, #4
	add r1, r6, #0
	mov r2, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	mov r0, #5
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F21C ; =0x00070809
	mov r3, #0x60
	str r0, [sp, #8]
	mov r0, #0
	sub r3, r3, r7
	str r0, [sp, #0xc]
	add r0, r5, r4
	mov r1, #4
	add r2, r6, #0
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F218: .word 0x00002070
_0221F21C: .word 0x00070809
	thumb_func_end ov08_0221F1B0

	thumb_func_start ov08_0221F220
ov08_0221F220: ; 0x0221F220
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0221F278 ; =0x0000207A
	ldrb r1, [r4, r0]
	cmp r1, #7
	bne _0221F236
	sub r0, #0xa
	ldr r5, [r4, r0]
	add r5, #0x80
	b _0221F23C
_0221F236:
	sub r0, #0xa
	ldr r5, [r4, r0]
	add r5, #0x50
_0221F23C:
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221F27C ; =0x00001FA8
	mov r1, #0x3c
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F280 ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221F278: .word 0x0000207A
_0221F27C: .word 0x00001FA8
_0221F280: .word 0x00010200
	thumb_func_end ov08_0221F220

	thumb_func_start ov08_0221F284
ov08_0221F284: ; 0x0221F284
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	str r1, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, _0221F3C0 ; =0x00002070
	ldr r1, [r1, #0xc]
	ldr r4, [r5, r0]
	mov r0, #6
	lsl r6, r2, #4
	bl String_ctor
	add r7, r0, #0
	ldr r0, _0221F3C4 ; =0x00001FA8
	mov r1, #0x2b
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F3C8 ; =0x000F0E00
	ldr r2, [sp, #0x14]
	str r0, [sp, #8]
	mov r1, #0
	add r0, r4, r6
	mov r3, #0x28
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
	ldr r0, _0221F3C4 ; =0x00001FA8
	mov r1, #0x2e
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	mov r0, #0
	ldr r1, [sp, #0x18]
	add r2, r0, #0
	bl FontID_String_GetWidth
	str r0, [sp, #0x1c]
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F3C8 ; =0x000F0E00
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r1, #0
	add r0, r4, r6
	mov r3, #0x50
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, _0221F3C4 ; =0x00001FA8
	mov r1, #0x2d
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	mov r1, #0
	str r0, [sp, #0x20]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	ldr r0, _0221F3CC ; =0x00001FAC
	ldrb r2, [r2, #3]
	ldr r0, [r5, r0]
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, _0221F3CC ; =0x00001FAC
	ldr r2, [sp, #0x20]
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F3C8 ; =0x000F0E00
	ldr r3, [sp, #0x1c]
	str r0, [sp, #8]
	mov r1, #0
	add r3, #0x50
	add r0, r4, r6
	add r2, r7, #0
	str r1, [sp, #0xc]
	str r3, [sp, #0x1c]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	bl String_dtor
	ldr r0, _0221F3C4 ; =0x00001FA8
	mov r1, #0x2c
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	mov r1, #0
	str r0, [sp, #0x24]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	ldr r0, _0221F3CC ; =0x00001FAC
	ldrb r2, [r2, #2]
	ldr r0, [r5, r0]
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, _0221F3CC ; =0x00001FAC
	ldr r2, [sp, #0x24]
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r5, r0, #0
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F3C8 ; =0x000F0E00
	mov r3, #0x50
	str r0, [sp, #8]
	mov r1, #0
	add r0, r4, r6
	add r2, r7, #0
	sub r3, r3, r5
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x24]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F3C0: .word 0x00002070
_0221F3C4: .word 0x00001FA8
_0221F3C8: .word 0x000F0E00
_0221F3CC: .word 0x00001FAC
	thumb_func_end ov08_0221F284

	thumb_func_start ov08_0221F3D0
ov08_0221F3D0: ; 0x0221F3D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r1, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, _0221F494 ; =0x00002070
	ldr r1, [r1, #0xc]
	ldr r4, [r5, r0]
	mov r0, #6
	lsl r6, r2, #4
	bl String_ctor
	str r0, [sp, #0x14]
	ldr r0, _0221F498 ; =0x00001FA8
	mov r1, #0x2b
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	mov r0, #0
	ldr r1, [sp, #0x18]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r7, #0x28
	mov r0, #0x50
	sub r0, r0, r7
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0x10
	lsl r2, r7, #0x10
	str r0, [sp, #4]
	add r0, r4, r6
	mov r1, #0
	lsr r2, r2, #0x10
	mov r3, #0x18
	bl FillWindowPixelRect
	ldr r0, _0221F498 ; =0x00001FA8
	mov r1, #0x2c
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	ldr r0, _0221F49C ; =0x00001FAC
	ldrb r2, [r2, #2]
	ldr r0, [r5, r0]
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, _0221F49C ; =0x00001FAC
	ldr r1, [sp, #0x14]
	ldr r0, [r5, r0]
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [sp, #0x14]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r5, r0, #0
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F4A0 ; =0x000F0E00
	mov r3, #0x50
	str r0, [sp, #8]
	mov r1, #0
	ldr r2, [sp, #0x14]
	add r0, r4, r6
	sub r3, r3, r5
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0221F494: .word 0x00002070
_0221F498: .word 0x00001FA8
_0221F49C: .word 0x00001FAC
_0221F4A0: .word 0x000F0E00
	thumb_func_end ov08_0221F3D0

	thumb_func_start ov08_0221F4A4
ov08_0221F4A4: ; 0x0221F4A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	mov r4, #0
	ldr r0, [r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0221F52A
	add r0, r4, #0
	add r7, r5, #0
	str r0, [sp, #8]
	add r6, r5, #0
	add r7, #0x1b
_0221F4C2:
	ldr r0, _0221F54C ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #8]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrh r0, [r6, #8]
	cmp r0, #0
	beq _0221F512
	mov r0, #0x20
	str r0, [sp]
	mov r0, #7
	lsl r3, r4, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #4
	lsr r3, r3, #0x10
	bl ov08_0221DDCC
	ldrb r0, [r7]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0221F4FE
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov08_0221F550
_0221F4FE:
	ldr r0, [r6, #4]
	bl sub_0208AD64
	cmp r0, #7
	bne _0221F512
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov08_0221F5B0
_0221F512:
	ldr r0, [sp, #8]
	add r6, #0x50
	add r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r5]
	add r7, #0x50
	ldr r0, [r0]
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0221F4C2
_0221F52A:
	ldr r0, [r5]
	add r0, #0x35
	ldrb r0, [r0]
	cmp r0, #2
	bne _0221F540
	add r0, r5, #0
	mov r1, #7
	bl ov08_0221E340
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221F540:
	add r0, r5, #0
	mov r1, #6
	bl ov08_0221E340
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F54C: .word 0x00002070
	thumb_func_end ov08_0221F4A4

	thumb_func_start ov08_0221F550
ov08_0221F550: ; 0x0221F550
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x18
	str r0, [sp]
	mov r0, #8
	add r6, r1, #0
	str r0, [sp, #4]
	ldr r0, _0221F5AC ; =0x00002070
	lsl r4, r6, #4
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, r0, r4
	mov r2, #0x38
	mov r3, #0x20
	bl FillWindowPixelRect
	mov r2, #0x40
	str r2, [sp]
	mov r0, #8
	str r0, [sp, #4]
	ldr r0, _0221F5AC ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	mov r3, #0x18
	add r0, r0, r4
	bl FillWindowPixelRect
	mov r0, #0x20
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r6, #0
	mov r3, #0x38
	bl ov08_0221DFC8
	mov r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r6, #0
	mov r3, #0x40
	bl ov08_0221E048
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221F5AC: .word 0x00002070
	thumb_func_end ov08_0221F550

	thumb_func_start ov08_0221F5B0
ov08_0221F5B0: ; 0x0221F5B0
	push {r3, lr}
	mov r2, #0x50
	mul r2, r1
	add r2, r0, r2
	ldrb r2, [r2, #0x1b]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1f
	bne _0221F5CC
	mov r2, #0x20
	str r2, [sp]
	add r2, r1, #0
	mov r3, #0
	bl ov08_0221DF80
_0221F5CC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov08_0221F5B0

	thumb_func_start ov08_0221F5D0
ov08_0221F5D0: ; 0x0221F5D0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221F654 ; =0x00002070
	mov r1, #0
	ldr r0, [r4, r0]
	bl FillWindowPixelBuffer
	ldr r0, _0221F654 ; =0x00002070
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x10
	bl FillWindowPixelBuffer
	ldr r0, _0221F654 ; =0x00002070
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x20
	bl FillWindowPixelBuffer
	ldr r0, _0221F654 ; =0x00002070
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x30
	bl FillWindowPixelBuffer
	ldr r1, [r4]
	add r0, r4, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221F658
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xf
	bl ov08_0221E3A4
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r0, r4, r0
	ldrb r0, [r0, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0221F63E
	add r0, r4, #0
	mov r1, #2
	mov r2, #0x12
	bl ov08_0221E3A4
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x13
	bl ov08_0221E3A4
	pop {r4, pc}
_0221F63E:
	ldr r0, _0221F654 ; =0x00002070
	ldr r0, [r4, r0]
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	ldr r0, _0221F654 ; =0x00002070
	ldr r0, [r4, r0]
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	.balign 4, 0
_0221F654: .word 0x00002070
	thumb_func_end ov08_0221F5D0

	thumb_func_start ov08_0221F658
ov08_0221F658: ; 0x0221F658
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r0, _0221F7A4 ; =0x00002070
	add r6, r1, #0
	ldr r0, [r4, r0]
	ldr r1, [r4]
	str r0, [sp, #0x18]
	mov r0, #0x50
	add r7, r6, #0
	add r5, r4, #4
	mul r7, r0
	add r0, r5, r7
	str r0, [sp, #0x14]
	ldr r1, [r1, #0xc]
	mov r0, #0xc
	bl String_ctor
	str r0, [sp, #0x10]
	ldr r0, _0221F7A8 ; =0x00001FA8
	ldr r1, _0221F7AC ; =ov08_02224FF4
	lsl r2, r6, #2
	ldr r0, [r4, r0]
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r5, r7]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0221F7B0 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r0, _0221F7B0 ; =0x00001FAC
	ldr r1, [sp, #0x10]
	ldr r0, [r4, r0]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	mov r5, #0
	ldrb r0, [r0, #0x16]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0221F6EC
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #0x17]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1f
	bne _0221F6EC
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	bne _0221F6DC
	ldr r0, _0221F7A8 ; =0x00001FA8
	mov r1, #0x10
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0221F6EC
_0221F6DC:
	cmp r0, #1
	bne _0221F6EC
	ldr r0, _0221F7A8 ; =0x00001FA8
	mov r1, #0x11
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	add r5, r0, #0
_0221F6EC:
	ldr r1, [sp, #0x10]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r5, #0
	bne _0221F704
	mov r7, #0
	add r4, r7, #0
	b _0221F714
_0221F704:
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	mov r4, #8
_0221F714:
	ldr r0, [sp, #0x18]
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r6
	sub r0, r0, r7
	sub r1, r0, r4
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0x17
	lsr r7, r0, #0x18
	mov r0, #7
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F7B4 ; =0x00070809
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	mov r1, #4
	add r3, r7, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	cmp r5, #0
	beq _0221F79A
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #0x17]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	bne _0221F778
	mov r0, #8
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F7B8 ; =0x000A0B00
	add r3, r7, r6
	str r0, [sp, #8]
	mov r1, #0
	ldr r0, [sp, #0x18]
	add r2, r5, #0
	add r3, r4, r3
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	b _0221F794
_0221F778:
	mov r0, #8
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F7BC ; =0x000C0D00
	add r3, r7, r6
	str r0, [sp, #8]
	mov r1, #0
	ldr r0, [sp, #0x18]
	add r2, r5, #0
	add r3, r4, r3
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0221F794:
	add r0, r5, #0
	bl String_dtor
_0221F79A:
	ldr r0, [sp, #0x18]
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F7A4: .word 0x00002070
_0221F7A8: .word 0x00001FA8
_0221F7AC: .word ov08_02224FF4
_0221F7B0: .word 0x00001FAC
_0221F7B4: .word 0x00070809
_0221F7B8: .word 0x000A0B00
_0221F7BC: .word 0x000C0D00
	thumb_func_end ov08_0221F658

	thumb_func_start ov08_0221F7C0
ov08_0221F7C0: ; 0x0221F7C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	ldr r0, _0221F8F0 ; =0x00002075
	mov r1, #6
	ldrb r2, [r5, r0]
	sub r0, r0, #5
	mul r1, r2
	lsl r1, r1, #0x10
	lsr r6, r1, #0x10
	ldr r1, [r5, r0]
	lsl r0, r6, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #1
	lsl r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, _0221F8F4 ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x18]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #2
	lsl r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, _0221F8F4 ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #3
	lsl r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, _0221F8F4 ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #4
	lsl r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, _0221F8F4 ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221F8F4 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r3, [r5]
	add r0, r5, #0
	ldrb r3, [r3, #0x11]
	add r1, r6, #0
	bl ov08_0221DDCC
	add r0, r5, #0
	str r0, [sp, #0x1c]
	add r0, #0x34
	mov r4, #0
	add r7, r6, #1
	str r0, [sp, #0x1c]
_0221F85A:
	ldr r0, [r5]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x1c]
	lsl r1, r4, #3
	add r0, r0, r2
	str r1, [sp, #0x20]
	ldrh r1, [r0, r1]
	str r0, [sp, #0x24]
	cmp r1, #0
	beq _0221F89C
	mov r0, #4
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	ldr r0, _0221F8F8 ; =0x00070809
	ldr r3, _0221F8FC ; =ov08_02224FE0
	lsl r6, r4, #2
	str r0, [sp, #8]
	ldr r3, [r3, r6]
	add r0, r5, #0
	add r2, r7, r4
	bl ov08_0221E244
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	add r1, r1, r2
	add r2, r7, r4
	bl ov08_0221F284
_0221F89C:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _0221F85A
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x12
	bl ov08_0221E3A4
	ldr r0, _0221F8F4 ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x18]
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221F8F4 ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221F8F4 ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _0221F8F4 ; =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	ldr r1, _0221F8F0 ; =0x00002075
	mov r0, #1
	ldrb r2, [r5, r1]
	eor r0, r2
	strb r0, [r5, r1]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F8F0: .word 0x00002075
_0221F8F4: .word 0x00002070
_0221F8F8: .word 0x00070809
_0221F8FC: .word ov08_02224FE0
	thumb_func_end ov08_0221F7C0

	thumb_func_start ov08_0221F900
ov08_0221F900: ; 0x0221F900
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0221FB10 ; =0x00002075
	mov r1, #0x16
	ldrb r2, [r5, r0]
	sub r0, r0, #5
	add r4, r2, #0
	mul r4, r1
	ldr r1, [r5, r0]
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	mov r0, #5
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0xe0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0xf0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	mov r0, #0x12
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0xd0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	lsl r0, r4, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #0
	add r0, #0xa
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #0
	add r0, #0xb
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #0
	add r0, #0xc
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #5
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #6
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #7
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #0
	add r0, #8
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #0
	add r0, #9
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #1
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #2
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FB14 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #3
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r3, [r5]
	add r0, r5, #0
	ldrb r3, [r3, #0x11]
	add r1, r4, #0
	bl ov08_0221DDCC
	ldr r1, [r5]
	add r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221EAD4
	mov r3, #0
	str r3, [sp]
	ldr r2, [r5]
	add r1, r4, #0
	ldrb r2, [r2, #0x11]
	add r0, r5, #0
	add r1, #0xa
	bl ov08_0221E048
	ldr r1, [r5]
	add r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E408
	ldr r1, [r5]
	add r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E5DC
	ldr r1, [r5]
	add r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E6D8
	ldr r1, [r5]
	add r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E7D4
	ldr r1, [r5]
	add r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E8D4
	ldr r1, [r5]
	add r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E9D4
	ldr r2, [r5]
	add r0, r5, #0
	ldrb r2, [r2, #0x11]
	add r1, r4, #1
	bl ov08_0221E120
	ldr r2, [r5]
	add r0, r5, #0
	ldrb r2, [r2, #0x11]
	add r1, r4, #3
	bl ov08_0221E1A8
	ldr r1, [r5]
	add r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221EC6C
	add r0, r5, #0
	mov r1, #0x15
	mov r2, #0x13
	bl ov08_0221E3A4
	ldr r1, _0221FB10 ; =0x00002075
	mov r0, #1
	ldrb r2, [r5, r1]
	eor r0, r2
	strb r0, [r5, r1]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221FB10: .word 0x00002075
_0221FB14: .word 0x00002070
	thumb_func_end ov08_0221F900

	thumb_func_start ov08_0221FB18
ov08_0221FB18: ; 0x0221FB18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0221FC6C ; =0x00002075
	mov r1, #0xb
	ldrb r2, [r5, r0]
	sub r0, r0, #5
	ldr r0, [r5, r0]
	add r4, r2, #0
	mul r4, r1
	add r0, #0x60
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x70
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x80
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x90
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0xa0
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #1
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	ldr r1, [r5, r0]
	lsl r0, r4, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #2
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #3
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #5
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0221FC70 ; =0x00002070
	ldr r1, [r5, r0]
	add r0, r4, #4
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	add r2, r5, #0
	ldrb r3, [r0, #0x11]
	add r0, #0x34
	ldrb r0, [r0]
	mov r1, #0x50
	add r2, #0x34
	mul r1, r3
	add r1, r2, r1
	lsl r0, r0, #3
	add r7, r1, r0
	mov r2, #0
	str r2, [sp]
	add r0, r5, #0
	mov r1, #6
	str r2, [sp, #4]
	bl ov08_0221DDCC
	mov r2, #0
	add r0, r5, #0
	mov r1, #7
	add r3, r2, #0
	bl ov08_0221E2E8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221FC74 ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r3, [r5]
	ldrh r1, [r7]
	add r3, #0x34
	ldrb r3, [r3]
	add r0, r5, #0
	lsl r6, r3, #2
	ldr r3, _0221FC78 ; =ov08_02224FE0
	ldr r3, [r3, r6]
	bl ov08_0221E244
	add r0, r5, #0
	mov r1, #8
	bl ov08_0221ECE8
	ldrb r2, [r7, #6]
	add r0, r5, #0
	add r1, r4, #2
	bl ov08_0221ED30
	add r0, r5, #0
	mov r1, #9
	bl ov08_0221EE18
	ldrb r2, [r7, #7]
	add r0, r5, #0
	add r1, r4, #3
	bl ov08_0221EE60
	ldrh r2, [r7]
	add r0, r5, #0
	add r1, r4, #4
	bl ov08_0221EF48
	add r0, r5, #0
	mov r1, #0xa
	bl ov08_0221EFA8
	ldrb r2, [r7, #5]
	add r0, r5, #0
	add r1, r4, #5
	bl ov08_0221F00C
	ldrb r2, [r7, #2]
	ldrb r3, [r7, #3]
	add r0, r5, #0
	add r1, r4, #1
	bl ov08_0221F07C
	ldr r1, _0221FC6C ; =0x00002075
	mov r0, #1
	ldrb r2, [r5, r1]
	eor r0, r2
	strb r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221FC6C: .word 0x00002075
_0221FC70: .word 0x00002070
_0221FC74: .word 0x000F0E00
_0221FC78: .word ov08_02224FE0
	thumb_func_end ov08_0221FB18

	thumb_func_start ov08_0221FC7C
ov08_0221FC7C: ; 0x0221FC7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0221FD98 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	bl FillWindowPixelBuffer
	ldr r0, _0221FD98 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x10
	bl FillWindowPixelBuffer
	ldr r0, _0221FD98 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x20
	bl FillWindowPixelBuffer
	ldr r0, _0221FD98 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x30
	bl FillWindowPixelBuffer
	ldr r0, _0221FD98 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x40
	bl FillWindowPixelBuffer
	ldr r0, _0221FD98 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x50
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r3, [r5]
	add r0, r5, #0
	ldrb r3, [r3, #0x11]
	add r2, r1, #0
	bl ov08_0221DDCC
	add r0, r5, #0
	mov r6, #0
	str r0, [sp, #0x10]
	add r0, #0x34
	ldr r7, _0221FD9C ; =ov08_02224FE0
	add r4, r6, #0
	str r0, [sp, #0x10]
_0221FCE8:
	ldr r0, [r5]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x10]
	add r0, r0, r2
	ldrh r1, [r0, r4]
	str r0, [sp, #0xc]
	cmp r1, #0
	beq _0221FD20
	mov r0, #4
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	ldr r0, _0221FDA0 ; =0x00070809
	add r2, r6, #1
	str r0, [sp, #8]
	ldr r3, [r7]
	add r0, r5, #0
	bl ov08_0221E244
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	add r1, r1, r4
	add r2, r6, #1
	bl ov08_0221F284
_0221FD20:
	add r6, r6, #1
	add r4, #8
	add r7, r7, #4
	cmp r6, #4
	blo _0221FCE8
	mov r0, #4
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	ldr r0, _0221FDA0 ; =0x00070809
	mov r2, #5
	str r0, [sp, #8]
	ldr r1, [r5]
	add r0, r5, #0
	ldrh r1, [r1, #0x24]
	mov r3, #0x49
	bl ov08_0221E244
	ldr r0, [r5]
	mov r1, #5
	ldrh r0, [r0, #0x24]
	bl GetWazaAttr
	add r1, sp, #0x14
	strb r0, [r1, #2]
	ldrb r0, [r1, #2]
	mov r2, #5
	strb r0, [r1, #3]
	add r0, r5, #0
	add r1, sp, #0x14
	bl ov08_0221F284
	ldr r0, _0221FD98 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	ldr r0, _0221FD98 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	ldr r0, _0221FD98 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	ldr r0, _0221FD98 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x40
	bl ScheduleWindowCopyToVram
	ldr r0, _0221FD98 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0221FD98: .word 0x00002070
_0221FD9C: .word ov08_02224FE0
_0221FDA0: .word 0x00070809
	thumb_func_end ov08_0221FC7C

	thumb_func_start ov08_0221FDA4
ov08_0221FDA4: ; 0x0221FDA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x20
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x30
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x10
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x40
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x60
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x50
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x70
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x90
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0xa0
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x80
	bl FillWindowPixelBuffer
	ldr r0, _0221FF64 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0xb0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r3, [r5]
	add r0, r5, #0
	ldrb r3, [r3, #0x11]
	add r2, r1, #0
	bl ov08_0221DDCC
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl ov08_0221E2E8
	add r0, r5, #0
	mov r1, #4
	bl ov08_0221ECE8
	add r0, r5, #0
	mov r1, #5
	bl ov08_0221EE18
	add r0, r5, #0
	mov r1, #9
	bl ov08_0221EFA8
	ldr r1, [r5]
	add r0, r1, #0
	add r0, #0x34
	ldrb r3, [r0]
	cmp r3, #4
	bhs _0221FEE0
	ldrb r1, [r1, #0x11]
	add r2, r5, #0
	mov r0, #0x50
	add r2, #0x34
	mul r0, r1
	add r7, r2, r0
	lsl r0, r3, #3
	str r0, [sp, #0xc]
	add r4, r7, r0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221FF68 ; =0x000F0E00
	lsl r6, r3, #2
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, _0221FF6C ; =ov08_02224FE0
	ldrh r1, [r7, r1]
	ldr r3, [r3, r6]
	add r0, r5, #0
	mov r2, #1
	bl ov08_0221E244
	ldrb r2, [r4, #6]
	add r0, r5, #0
	mov r1, #6
	bl ov08_0221ED30
	ldrb r2, [r4, #7]
	add r0, r5, #0
	mov r1, #7
	bl ov08_0221EE60
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	ldrh r2, [r7, r2]
	mov r1, #8
	bl ov08_0221EF48
	ldrb r2, [r4, #5]
	add r0, r5, #0
	mov r1, #0xa
	bl ov08_0221F00C
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	mov r1, #3
	bl ov08_0221F07C
	b _0221FF56
_0221FEE0:
	ldrh r0, [r1, #0x24]
	mov r1, #5
	bl GetWazaAttr
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221FF68 ; =0x000F0E00
	mov r2, #1
	str r0, [sp, #8]
	ldr r1, [r5]
	add r0, r5, #0
	ldrh r1, [r1, #0x24]
	mov r3, #0x49
	bl ov08_0221E244
	ldr r2, [r5]
	add r0, r5, #0
	ldrh r2, [r2, #0x24]
	mov r1, #8
	bl ov08_0221EF48
	ldr r0, [r5]
	mov r1, #4
	ldrh r0, [r0, #0x24]
	bl GetWazaAttr
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #6
	bl ov08_0221ED30
	ldr r0, [r5]
	mov r1, #2
	ldrh r0, [r0, #0x24]
	bl GetWazaAttr
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #7
	bl ov08_0221EE60
	ldr r0, [r5]
	mov r1, #1
	ldrh r0, [r0, #0x24]
	bl GetWazaAttr
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0xa
	bl ov08_0221F00C
	add r0, r5, #0
	mov r1, #3
	add r2, r4, #0
	add r3, r4, #0
	bl ov08_0221F07C
_0221FF56:
	add r0, r5, #0
	mov r1, #0xb
	bl ov08_0221F1B0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221FF64: .word 0x00002070
_0221FF68: .word 0x000F0E00
_0221FF6C: .word ov08_02224FE0
	thumb_func_end ov08_0221FDA4

	thumb_func_start ov08_0221FF70
ov08_0221FF70: ; 0x0221FF70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, _02220058 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	bl FillWindowPixelBuffer
	ldr r0, _02220058 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x10
	bl FillWindowPixelBuffer
	ldr r0, _02220058 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x20
	bl FillWindowPixelBuffer
	ldr r0, _02220058 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x30
	bl FillWindowPixelBuffer
	ldr r0, _02220058 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x40
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r3, [r5]
	add r0, r5, #0
	ldrb r3, [r3, #0x11]
	add r2, r1, #0
	bl ov08_0221DDCC
	add r0, r5, #0
	mov r6, #0
	str r0, [sp, #0x10]
	add r0, #0x34
	ldr r7, _0222005C ; =ov08_02224FE0
	add r4, r6, #0
	str r0, [sp, #0x10]
_0221FFD0:
	ldr r0, [r5]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x10]
	add r0, r0, r2
	ldrh r1, [r0, r4]
	str r0, [sp, #0xc]
	cmp r1, #0
	beq _02220008
	mov r0, #4
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	ldr r0, _02220060 ; =0x00070809
	add r2, r6, #1
	str r0, [sp, #8]
	ldr r3, [r7]
	add r0, r5, #0
	bl ov08_0221E244
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	add r1, r1, r4
	add r2, r6, #1
	bl ov08_0221F284
_02220008:
	add r6, r6, #1
	add r4, #8
	add r7, r7, #4
	cmp r6, #4
	blo _0221FFD0
	ldr r2, [r5]
	mov r1, #0x25
	ldrh r0, [r2, #0x22]
	ldr r2, [r2, #0xc]
	bl GetItemAttr
	cmp r0, #0
	bne _0222002A
	add r0, r5, #0
	mov r1, #0x5e
	bl ov08_0221E340
_0222002A:
	ldr r0, _02220058 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	ldr r0, _02220058 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	ldr r0, _02220058 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	ldr r0, _02220058 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x40
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02220058: .word 0x00002070
_0222005C: .word ov08_02224FE0
_02220060: .word 0x00070809
	thumb_func_end ov08_0221FF70

	thumb_func_start ov08_02220064
ov08_02220064: ; 0x02220064
	push {r3, r4, r5, lr}
	ldr r4, [r0]
	add r3, r1, #0
	ldrb r5, [r4, #0x11]
	add r1, r0, #0
	mov r4, #0x50
	add r1, #0x34
	mul r4, r5
	add r4, r1, r4
	lsl r1, r2, #3
	add r1, r4, r1
	add r2, r3, #0
	bl ov08_0221F3D0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov08_02220064

	thumb_func_start ov08_02220084
ov08_02220084: ; 0x02220084
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _022201B0 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	bl FillWindowPixelBuffer
	ldr r0, _022201B0 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x20
	bl FillWindowPixelBuffer
	ldr r0, _022201B0 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x30
	bl FillWindowPixelBuffer
	ldr r0, _022201B0 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x10
	bl FillWindowPixelBuffer
	ldr r0, _022201B0 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x40
	bl FillWindowPixelBuffer
	ldr r0, _022201B0 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x50
	bl FillWindowPixelBuffer
	ldr r0, _022201B0 ; =0x00002070
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x60
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r3, [r5]
	add r0, r5, #0
	ldrb r3, [r3, #0x11]
	add r2, r1, #0
	bl ov08_0221DDCC
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl ov08_0221E2E8
	ldr r0, _022201B4 ; =0x00001FA8
	mov r1, #0x39
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022201B8 ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _022201B0 ; =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r3, r1, #0
	add r0, #0x40
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	ldr r0, _022201B0 ; =0x00002070
	ldr r0, [r5, r0]
	add r0, #0x40
	bl ScheduleWindowCopyToVram
	ldr r1, [r5]
	add r0, r1, #0
	add r0, #0x34
	ldrb r3, [r0]
	cmp r3, #4
	bhs _02220176
	ldrb r1, [r1, #0x11]
	add r2, r5, #0
	mov r0, #0x50
	mul r0, r1
	add r2, #0x34
	add r2, r2, r0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _022201B8 ; =0x000F0E00
	lsl r1, r3, #3
	str r0, [sp, #8]
	lsl r6, r3, #2
	ldr r3, _022201BC ; =ov08_02224FE0
	add r4, r2, r1
	ldrh r1, [r2, r1]
	ldr r3, [r3, r6]
	add r0, r5, #0
	mov r2, #1
	bl ov08_0221E244
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	mov r1, #3
	bl ov08_0221F07C
	b _022201A4
_02220176:
	ldrh r0, [r1, #0x24]
	mov r1, #5
	bl GetWazaAttr
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _022201B8 ; =0x000F0E00
	mov r2, #1
	str r0, [sp, #8]
	ldr r1, [r5]
	add r0, r5, #0
	ldrh r1, [r1, #0x24]
	mov r3, #0x49
	bl ov08_0221E244
	add r0, r5, #0
	mov r1, #3
	add r2, r4, #0
	add r3, r4, #0
	bl ov08_0221F07C
_022201A4:
	add r0, r5, #0
	mov r1, #6
	bl ov08_0221F1B0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022201B0: .word 0x00002070
_022201B4: .word 0x00001FA8
_022201B8: .word 0x000F0E00
_022201BC: .word ov08_02224FE0
	thumb_func_end ov08_02220084

	thumb_func_start ov08_022201C0
ov08_022201C0: ; 0x022201C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _022201E4 ; =0x00002060
	mov r1, #1
	add r0, r4, r0
	add r2, r1, #0
	mov r3, #0xe
	bl DrawFrameAndWindow2
	ldr r0, _022201E4 ; =0x00002060
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ov08_022201E8
	pop {r4, pc}
	.balign 4, 0
_022201E4: .word 0x00002060
	thumb_func_end ov08_022201C0

	thumb_func_start ov08_022201E8
ov08_022201E8: ; 0x022201E8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl ov12_0223B718
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r2, _0222021C ; =0x00002060
	str r3, [sp, #8]
	add r0, r4, r2
	sub r2, #0xb0
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _02220220 ; =0x0000207B
	strb r0, [r4, r1]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0222021C: .word 0x00002060
_02220220: .word 0x0000207B
	thumb_func_end ov08_022201E8

	thumb_func_start ov08_02220224
ov08_02220224: ; 0x02220224
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	ldrh r0, [r0, #0x22]
	ldr r2, [r2, #0xc]
	bl LoadItemDataOrGfx
	ldr r2, [sp, #0xc]
	add r6, r0, #0
	ldrb r3, [r2, #0x11]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	add r2, r2, r3
	add r2, #0x2c
	ldrb r2, [r2]
	ldr r0, [r0, #8]
	ldr r1, [r1, #0x28]
	bl ov12_0223A880
	mov r1, #0xa3
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #0xf
	mov r4, #0
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02220278
	mov r0, #1
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02220278:
	add r0, r6, #0
	mov r1, #0x10
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0222028C
	mov r0, #2
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0222028C:
	add r0, r6, #0
	mov r1, #0x11
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _022202A0
	mov r0, #4
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_022202A0:
	add r0, r6, #0
	mov r1, #0x12
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _022202B4
	mov r0, #8
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_022202B4:
	add r0, r6, #0
	mov r1, #0x13
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _022202C8
	mov r0, #0x10
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_022202C8:
	add r0, r6, #0
	mov r1, #0x14
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _022202DC
	mov r0, #0x20
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_022202DC:
	add r0, r6, #0
	mov r1, #0x15
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _022202F0
	mov r0, #0x40
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_022202F0:
	ldr r0, [sp, #0xc]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r0, r5, r0
	ldrh r1, [r0, #0x14]
	cmp r1, #0
	bne _0222033A
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0222033A
	ldr r0, _02220574 ; =0x00001FA8
	mov r1, #0x58
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_0222033A:
	ldr r0, [sp, #8]
	cmp r0, r1
	beq _02220396
	ldr r0, _02220574 ; =0x00001FA8
	mov r1, #0x52
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r2, [sp, #0xc]
	str r1, [sp, #4]
	ldrb r3, [r2, #0x11]
	mov r2, #0x50
	ldr r0, _02220578 ; =0x00001FAC
	mul r2, r3
	add r2, r5, r2
	ldrh r3, [r2, #0x14]
	ldr r2, [sp, #8]
	ldr r0, [r5, r0]
	sub r2, r2, r3
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_02220396:
	add r0, r6, #0
	mov r1, #0x24
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _022203AE
	add r0, r6, #0
	mov r1, #0x25
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _022203BE
_022203AE:
	ldr r2, _02220574 ; =0x00001FA8
	mov r1, #0x57
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	b _0222056A
_022203BE:
	cmp r4, #1
	ldr r0, _02220574 ; =0x00001FA8
	bne _022203F6
	ldr r0, [r5, r0]
	mov r1, #0x5c
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_022203F6:
	cmp r4, #2
	bne _0222042C
	ldr r0, [r5, r0]
	mov r1, #0x53
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_0222042C:
	cmp r4, #4
	bne _02220462
	ldr r0, [r5, r0]
	mov r1, #0x55
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_02220462:
	cmp r4, #8
	bne _02220498
	ldr r0, [r5, r0]
	mov r1, #0x56
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_02220498:
	cmp r4, #0x10
	bne _022204CE
	ldr r0, [r5, r0]
	mov r1, #0x54
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_022204CE:
	cmp r4, #0x20
	bne _02220504
	ldr r0, [r5, r0]
	mov r1, #0x5a
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_02220504:
	cmp r4, #0x40
	bne _0222053A
	ldr r0, [r5, r0]
	mov r1, #0x5b
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	b _0222056A
_0222053A:
	ldr r0, [r5, r0]
	mov r1, #0x59
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02220578 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r1, _02220578 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
_0222056A:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02220574: .word 0x00001FA8
_02220578: .word 0x00001FAC
	thumb_func_end ov08_02220224

	thumb_func_start ov08_0222057C
ov08_0222057C: ; 0x0222057C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r3, [r5]
	ldrb r2, [r3, #0x11]
	ldr r0, [r3, #8]
	ldr r1, [r3, #0x28]
	add r2, r3, r2
	add r2, #0x2c
	ldrb r2, [r2]
	bl ov12_0223A880
	add r6, r0, #0
	ldr r0, _022205D4 ; =0x00001FA8
	mov r1, #0x5f
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _022205D8 ; =0x00001FAC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r0, _022205D8 ; =0x00001FAC
	ldr r2, _022205DC ; =MOVE_EMBARGO
	ldr r0, [r5, r0]
	mov r1, #1
	bl BufferMoveName
	ldr r1, _022205D8 ; =0x00001FAC
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022205D4: .word 0x00001FA8
_022205D8: .word 0x00001FAC
_022205DC: .word MOVE_EMBARGO
	thumb_func_end ov08_0222057C

	thumb_func_start ov08_022205E0
ov08_022205E0: ; 0x022205E0
	push {r4, lr}
	add r4, r0, #0
	bl ov08_0222061C
	add r0, r4, #0
	bl ov08_02220668
	add r0, r4, #0
	bl ov08_02220750
	add r0, r4, #0
	bl ov08_02220800
	add r0, r4, #0
	bl ov08_02220878
	add r0, r4, #0
	bl ov08_02220928
	add r0, r4, #0
	bl ov08_02220A28
	add r0, r4, #0
	bl ov08_0222162C
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	pop {r4, pc}
	thumb_func_end ov08_022205E0

	thumb_func_start ov08_0222061C
ov08_0222061C: ; 0x0222061C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02220660 ; =ov08_0222541C
	add r2, sp, #0
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	add r4, r0, #0
	bl sub_0200CF38
	ldr r1, _02220664 ; =0x00001FB4
	mov r2, #0x2b
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	add r0, r4, #0
	bl sub_0200CFF4
	ldr r1, _02220664 ; =0x00001FB4
	add r0, r4, #0
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl sub_0200D3F8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_02220660: .word ov08_0222541C
_02220664: .word 0x00001FB4
	thumb_func_end ov08_0222061C

	thumb_func_start ov08_02220668
ov08_02220668: ; 0x02220668
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	ldr r1, [r6]
	mov r0, #0x14
	ldr r1, [r1, #0xc]
	bl NARC_ctor
	add r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	str r0, [sp, #0x18]
	bl sub_02074490
	str r7, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _02220748 ; =0x0000B007
	ldr r3, _0222074C ; =0x00001FB4
	str r0, [sp, #0x14]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r2, [sp, #0x18]
	ldr r3, [r6, r3]
	bl sub_0200D68C
	bl sub_02074498
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02220748 ; =0x0000B007
	ldr r1, _0222074C ; =0x00001FB4
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	add r2, r7, #0
	bl sub_0200D6EC
	bl sub_020744A4
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02220748 ; =0x0000B007
	ldr r1, _0222074C ; =0x00001FB4
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	add r2, r7, #0
	bl sub_0200D71C
	mov r4, #0
	add r5, r6, #0
_022206E4:
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _0222070E
	ldr r0, [r5, #4]
	bl Pokemon_GetIconNaix
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02220748 ; =0x0000B007
	ldr r1, _0222074C ; =0x00001FB4
	add r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	add r2, r7, #0
	bl sub_0200D504
	b _02220734
_0222070E:
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl GetMonIconNaixEx
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02220748 ; =0x0000B007
	ldr r1, _0222074C ; =0x00001FB4
	add r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	add r2, r7, #0
	bl sub_0200D504
_02220734:
	add r4, r4, #1
	add r5, #0x50
	cmp r4, #6
	blo _022206E4
	add r0, r7, #0
	bl NARC_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02220748: .word 0x0000B007
_0222074C: .word 0x00001FB4
	thumb_func_end ov08_02220668

	thumb_func_start ov08_02220750
ov08_02220750: ; 0x02220750
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	ldr r1, [r5]
	add r4, r0, #0
	ldr r1, [r1, #0xc]
	mov r0, #0x27
	bl NARC_ctor
	add r6, r0, #0
	bl sub_0208AD58
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _022207F4 ; =0x0000B008
	ldr r3, _022207F8 ; =0x00001FB4
	str r0, [sp, #0x14]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	mov r1, #3
	add r2, r4, #0
	bl sub_0200D68C
	bl sub_0208AD5C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _022207F4 ; =0x0000B008
	ldr r1, _022207F8 ; =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	add r0, r4, #0
	add r2, r6, #0
	bl sub_0200D6EC
	bl sub_0208AD60
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _022207F4 ; =0x0000B008
	ldr r1, _022207F8 ; =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	add r0, r4, #0
	add r2, r6, #0
	bl sub_0200D71C
	bl sub_0208AD54
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022207FC ; =0x0000B00D
	ldr r1, _022207F8 ; =0x00001FB4
	str r0, [sp, #8]
	ldr r1, [r5, r1]
	add r0, r4, #0
	add r2, r6, #0
	bl sub_0200D504
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_022207F4: .word 0x0000B008
_022207F8: .word 0x00001FB4
_022207FC: .word 0x0000B00D
	thumb_func_end ov08_02220750

	thumb_func_start ov08_02220800
ov08_02220800: ; 0x02220800
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	add r6, r0, #0
	mov r0, #2
	str r0, [sp]
	ldr r0, _02220868 ; =0x0000B009
	ldr r3, _0222086C ; =0x00001FB4
	str r0, [sp, #4]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	mov r1, #3
	add r2, r6, #0
	bl sub_02077720
	ldr r1, _0222086C ; =0x00001FB4
	ldr r2, _02220868 ; =0x0000B009
	ldr r1, [r5, r1]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_0207775C
	ldr r4, _02220870 ; =0x0000B00E
	add r7, r4, #6
_0222083C:
	ldr r1, _0222086C ; =0x00001FB4
	str r4, [sp]
	ldr r1, [r5, r1]
	add r0, r6, #0
	mov r2, #2
	mov r3, #0
	bl sub_020776B8
	add r4, r4, #1
	cmp r4, r7
	bls _0222083C
	ldr r0, _02220874 ; =0x0000B015
	ldr r1, _0222086C ; =0x00001FB4
	str r0, [sp]
	ldr r1, [r5, r1]
	add r0, r6, #0
	mov r2, #2
	mov r3, #0
	bl sub_02077834
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02220868: .word 0x0000B009
_0222086C: .word 0x00001FB4
_02220870: .word 0x0000B00E
_02220874: .word 0x0000B015
	thumb_func_end ov08_02220800

	thumb_func_start ov08_02220878
ov08_02220878: ; 0x02220878
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x15
	ldr r1, [r1, #0xc]
	bl NARC_ctor
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	add r6, r0, #0
	bl sub_0207CAA0
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0222091C ; =0x0000B00A
	ldr r3, _02220920 ; =0x00001FB4
	str r0, [sp, #0x14]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	mov r1, #3
	add r2, r6, #0
	bl sub_0200D68C
	bl sub_0207CAA4
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222091C ; =0x0000B00A
	ldr r1, _02220920 ; =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	add r0, r6, #0
	add r2, r4, #0
	bl sub_0200D6EC
	bl sub_0207CAA8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222091C ; =0x0000B00A
	ldr r1, _02220920 ; =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	add r0, r6, #0
	add r2, r4, #0
	bl sub_0200D71C
	bl sub_0207CA9C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02220924 ; =0x0000B016
	ldr r1, _02220920 ; =0x00001FB4
	str r0, [sp, #8]
	ldr r1, [r5, r1]
	add r0, r6, #0
	add r2, r4, #0
	bl sub_0200D504
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_0222091C: .word 0x0000B00A
_02220920: .word 0x00001FB4
_02220924: .word 0x0000B016
	thumb_func_end ov08_02220878

	thumb_func_start ov08_02220928
ov08_02220928: ; 0x02220928
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	add r4, r0, #0
	mov r0, #0x47
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _022209AC ; =0x0000B00B
	ldr r3, _022209B0 ; =0x00001FB4
	str r0, [sp, #0x14]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	mov r1, #3
	add r2, r4, #0
	bl sub_0200D644
	mov r0, #0
	str r0, [sp]
	ldr r0, _022209AC ; =0x0000B00B
	ldr r1, _022209B0 ; =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	add r0, r4, #0
	mov r2, #0x47
	mov r3, #0x19
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _022209AC ; =0x0000B00B
	ldr r1, _022209B0 ; =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	add r0, r4, #0
	mov r2, #0x47
	mov r3, #0x18
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022209B4 ; =0x0000B017
	ldr r1, _022209B0 ; =0x00001FB4
	str r0, [sp, #8]
	ldr r1, [r5, r1]
	add r0, r4, #0
	mov r2, #0x47
	mov r3, #0x1a
	bl sub_0200D4A4
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022209AC: .word 0x0000B00B
_022209B0: .word 0x00001FB4
_022209B4: .word 0x0000B017
	thumb_func_end ov08_02220928

	thumb_func_start ov08_022209B8
ov08_022209B8: ; 0x022209B8
	push {r4, r5, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	mov r2, #0
	add r1, sp, #0
	strh r2, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	mov r1, #0x14
	ldr r3, _02220A10 ; =ov08_02225654
	mul r1, r4
	ldr r3, [r3, r1]
	str r2, [sp, #0xc]
	str r3, [sp, #8]
	mov r3, #2
	str r3, [sp, #0x10]
	ldr r3, _02220A14 ; =ov08_02225644
	str r2, [sp, #0x30]
	ldr r3, [r3, r1]
	add r2, sp, #0
	str r3, [sp, #0x14]
	ldr r3, _02220A18 ; =ov08_02225648
	ldr r3, [r3, r1]
	str r3, [sp, #0x18]
	ldr r3, _02220A1C ; =ov08_0222564C
	ldr r3, [r3, r1]
	str r3, [sp, #0x1c]
	ldr r3, _02220A20 ; =ov08_02225650
	ldr r1, [r3, r1]
	str r1, [sp, #0x20]
	mov r1, #1
	str r1, [sp, #0x2c]
	ldr r1, _02220A24 ; =0x00001FB4
	ldr r1, [r5, r1]
	bl sub_0200D734
	add sp, #0x34
	pop {r4, r5, pc}
	.balign 4, 0
_02220A10: .word ov08_02225654
_02220A14: .word ov08_02225644
_02220A18: .word ov08_02225648
_02220A1C: .word ov08_0222564C
_02220A20: .word ov08_02225650
_02220A24: .word 0x00001FB4
	thumb_func_end ov08_022209B8

	thumb_func_start ov08_02220A28
ov08_02220A28: ; 0x02220A28
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, _02220A4C ; =0x00001FB8
	mov r4, #0
	add r5, r6, #0
_02220A32:
	add r0, r6, #0
	add r1, r4, #0
	bl ov08_022209B8
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x26
	blo _02220A32
	add r0, r6, #0
	bl ov08_02220AAC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02220A4C: .word 0x00001FB8
	thumb_func_end ov08_02220A28

	thumb_func_start ov08_02220A50
ov08_02220A50: ; 0x02220A50
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	ldr r6, _02220A84 ; =0x00001FB8
	str r0, [sp]
	mov r4, #0
	add r5, r7, #0
_02220A64:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x26
	blo _02220A64
	add r0, r7, #0
	bl ov08_02221698
	ldr r1, _02220A88 ; =0x00001FB4
	ldr r0, [sp]
	ldr r1, [r7, r1]
	bl sub_0200D998
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02220A84: .word 0x00001FB8
_02220A88: .word 0x00001FB4
	thumb_func_end ov08_02220A50

	thumb_func_start ov08_02220A8C
ov08_02220A8C: ; 0x02220A8C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	mov r1, #1
	add r6, r0, #0
	bl sub_0200DCE8
	lsl r1, r5, #0x10
	lsl r2, r4, #0x10
	add r0, r6, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov08_02220A8C

	thumb_func_start ov08_02220AAC
ov08_02220AAC: ; 0x02220AAC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r5, #0
	mov r7, #0
	add r4, #0x1b
	add r6, r5, #0
_02220AB8:
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _02220AD8
	add r1, r5, #0
	ldrb r2, [r4]
	add r1, #0x32
	ldrb r1, [r1]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1f
	bl GetMonIconPaletteEx
	add r1, r0, #0
	ldr r0, _02220AE8 ; =0x00001FD4
	ldr r0, [r6, r0]
	bl sub_0200DD10
_02220AD8:
	add r7, r7, #1
	add r5, #0x50
	add r4, #0x50
	add r6, r6, #4
	cmp r7, #6
	blt _02220AB8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02220AE8: .word 0x00001FD4
	thumb_func_end ov08_02220AAC

	thumb_func_start ov08_02220AEC
ov08_02220AEC: ; 0x02220AEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r3, #0
	ldr r0, [r0, #8]
	add r7, r1, #0
	add r4, r2, #0
	bl ov12_0223A8E4
	str r0, [sp, #8]
	bl sub_020776B4
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl sub_02077678
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r1, _02220B38 ; =0x00001FB4
	str r4, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0xc]
	bl sub_0200E248
	add r0, r6, #0
	bl sub_0207769C
	add r1, r0, #0
	add r0, r7, #0
	add r1, r1, #4
	bl sub_0200DD10
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02220B38: .word 0x00001FB4
	thumb_func_end ov08_02220AEC

	thumb_func_start ov08_02220B3C
ov08_02220B3C: ; 0x02220B3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r2, #0
	ldr r0, [r0, #8]
	add r6, r1, #0
	bl ov12_0223A8E4
	add r7, r0, #0
	bl sub_02077830
	str r0, [sp, #8]
	add r0, r4, #0
	bl sub_02077800
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _02220B88 ; =0x0000B015
	ldr r1, _02220B8C ; =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	ldr r2, [sp, #8]
	add r0, r7, #0
	bl sub_0200E248
	add r0, r4, #0
	bl sub_02077818
	add r1, r0, #0
	add r0, r6, #0
	add r1, r1, #4
	bl sub_0200DD10
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02220B88: .word 0x0000B015
_02220B8C: .word 0x00001FB4
	thumb_func_end ov08_02220B3C

	thumb_func_start ov08_02220B90
ov08_02220B90: ; 0x02220B90
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	cmp r6, #7
	beq _02220BB0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0200DC4C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov08_02220A8C
_02220BB0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov08_02220B90

	thumb_func_start ov08_02220BB4
ov08_02220BB4: ; 0x02220BB4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, _02220BF8 ; =0x00002004
	add r5, r0, #0
	add r6, r2, #0
	ldrb r3, [r4, #0x14]
	ldr r1, [r5, r1]
	ldr r2, _02220BFC ; =0x0000B00E
	bl ov08_02220AEC
	ldr r0, _02220BF8 ; =0x00002004
	ldr r1, [r6]
	ldr r0, [r5, r0]
	ldr r2, [r6, #4]
	bl ov08_02220A8C
	ldrb r3, [r4, #0x15]
	ldrb r0, [r4, #0x14]
	cmp r0, r3
	beq _02220BF4
	ldr r1, _02220C00 ; =0x00002008
	ldr r2, _02220C04 ; =0x0000B00F
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov08_02220AEC
	ldr r0, _02220C00 ; =0x00002008
	ldr r1, [r6, #8]
	ldr r0, [r5, r0]
	ldr r2, [r6, #0xc]
	bl ov08_02220A8C
_02220BF4:
	pop {r4, r5, r6, pc}
	nop
_02220BF8: .word 0x00002004
_02220BFC: .word 0x0000B00E
_02220C00: .word 0x00002008
_02220C04: .word 0x0000B00F
	thumb_func_end ov08_02220BB4

	thumb_func_start ov08_02220C08
ov08_02220C08: ; 0x02220C08
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _02220C38
	bl ItemIdIsMail
	cmp r0, #1
	bne _02220C26
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DC4C
	b _02220C2E
_02220C26:
	add r0, r5, #0
	mov r1, #0
	bl sub_0200DC4C
_02220C2E:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov08_02220A8C
_02220C38:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov08_02220C08

	thumb_func_start ov08_02220C3C
ov08_02220C3C: ; 0x02220C3C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _02220C5A
	add r0, r5, #0
	mov r1, #2
	bl sub_0200DC4C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov08_02220A8C
_02220C5A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov08_02220C3C

	thumb_func_start ov08_02220C5C
ov08_02220C5C: ; 0x02220C5C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, _02220CF0 ; =0x00001FB8
	str r1, [sp]
	mov r5, #0
	add r4, r6, #0
_02220C68:
	ldr r0, [r4, r7]
	mov r1, #0
	bl sub_0200DCE8
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x26
	blo _02220C68
	ldr r0, [sp]
	cmp r0, #9
	bhi _02220CEC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02220C8A: ; jump table
	.short _02220C9E - _02220C8A - 2 ; case 0
	.short _02220CA6 - _02220C8A - 2 ; case 1
	.short _02220CAE - _02220C8A - 2 ; case 2
	.short _02220CB6 - _02220C8A - 2 ; case 3
	.short _02220CBE - _02220C8A - 2 ; case 4
	.short _02220CC6 - _02220C8A - 2 ; case 5
	.short _02220CCE - _02220C8A - 2 ; case 6
	.short _02220CD6 - _02220C8A - 2 ; case 7
	.short _02220CDE - _02220C8A - 2 ; case 8
	.short _02220CE6 - _02220C8A - 2 ; case 9
_02220C9E:
	add r0, r6, #0
	bl ov08_02220CF4
	pop {r3, r4, r5, r6, r7, pc}
_02220CA6:
	add r0, r6, #0
	bl ov08_02220D90
	pop {r3, r4, r5, r6, r7, pc}
_02220CAE:
	add r0, r6, #0
	bl ov08_02220DE8
	pop {r3, r4, r5, r6, r7, pc}
_02220CB6:
	add r0, r6, #0
	bl ov08_02220E80
	pop {r3, r4, r5, r6, r7, pc}
_02220CBE:
	add r0, r6, #0
	bl ov08_02220F58
	pop {r3, r4, r5, r6, r7, pc}
_02220CC6:
	add r0, r6, #0
	bl ov08_0222114C
	pop {r3, r4, r5, r6, r7, pc}
_02220CCE:
	add r0, r6, #0
	bl ov08_0222101C
	pop {r3, r4, r5, r6, r7, pc}
_02220CD6:
	add r0, r6, #0
	bl ov08_02221088
	pop {r3, r4, r5, r6, r7, pc}
_02220CDE:
	add r0, r6, #0
	bl ov08_02221230
	pop {r3, r4, r5, r6, r7, pc}
_02220CE6:
	add r0, r6, #0
	bl ov08_022211B8
_02220CEC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02220CF0: .word 0x00001FB8
	thumb_func_end ov08_02220C5C

	thumb_func_start ov08_02220CF4
ov08_02220CF4: ; 0x02220CF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, r6, #0
	str r0, [sp]
	add r0, #0x1b
	ldr r4, _02220D78 ; =ov08_02225534
	ldr r7, _02220D7C ; =ov08_02225564
	add r5, r6, #0
	str r0, [sp]
_02220D0C:
	ldrh r0, [r6, #8]
	cmp r0, #0
	beq _02220D5A
	ldr r0, _02220D80 ; =0x00001FD4
	ldr r1, [r4]
	ldr r0, [r5, r0]
	ldr r2, [r4, #4]
	bl ov08_02220A8C
	ldr r0, [sp]
	ldr r1, _02220D84 ; =0x00001FEC
	ldrb r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [r7]
	lsl r0, r0, #0x19
	ldr r3, [r7, #4]
	lsr r0, r0, #0x1c
	bl ov08_02220B90
	ldr r1, _02220D88 ; =0x00001FB8
	ldr r2, [r4]
	ldr r3, [r4, #4]
	ldrh r0, [r6, #0x1e]
	ldr r1, [r5, r1]
	add r2, #8
	add r3, #8
	bl ov08_02220C08
	add r0, r6, #0
	add r0, #0x31
	ldr r1, _02220D8C ; =0x00002038
	ldr r2, [r4]
	ldr r3, [r4, #4]
	ldrb r0, [r0]
	ldr r1, [r5, r1]
	add r2, #0x10
	add r3, #8
	bl ov08_02220C3C
_02220D5A:
	ldr r0, [sp]
	add r6, #0x50
	add r0, #0x50
	str r0, [sp]
	ldr r0, [sp, #4]
	add r4, #8
	add r0, r0, #1
	add r5, r5, #4
	add r7, #8
	str r0, [sp, #4]
	cmp r0, #6
	blt _02220D0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02220D78: .word ov08_02225534
_02220D7C: .word ov08_02225564
_02220D80: .word 0x00001FD4
_02220D84: .word 0x00001FEC
_02220D88: .word 0x00001FB8
_02220D8C: .word 0x00002038
	thumb_func_end ov08_02220CF4

	thumb_func_start ov08_02220D90
ov08_02220D90: ; 0x02220D90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r1, r5, #4
	ldrb r2, [r0, #0x11]
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02220DE4 ; =0x00001FB8
	mov r2, #0x48
	ldr r0, [r1, r0]
	mov r1, #0x80
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	mov r3, #0x50
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02220DE4 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x88
	bl ov08_02220C08
	ldr r1, [r5]
	add r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	mov r3, #0x50
	add r1, #0x20
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02220DE4 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x90
	bl ov08_02220C3C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02220DE4: .word 0x00001FB8
	thumb_func_end ov08_02220D90

	thumb_func_start ov08_02220DE8
ov08_02220DE8: ; 0x02220DE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r1, r5, #4
	ldrb r2, [r0, #0x11]
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02220E74 ; =0x00001FB8
	mov r2, #0xc
	ldr r0, [r1, r0]
	mov r1, #0x18
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrb r0, [r4, #0x17]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r0, r0, #0x19
	add r1, #0xd
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02220E74 ; =0x00001FB8
	lsr r0, r0, #0x1c
	ldr r1, [r2, r1]
	mov r2, #0xc6
	bl ov08_02220B90
	ldr r2, _02220E78 ; =ov08_022253F4
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02220BB4
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02220E74 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	add r0, r4, #0
	ldrb r1, [r1, #0x11]
	add r0, #0x2d
	ldrb r0, [r0]
	add r1, #0x20
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02220E74 ; =0x00001FB8
	mov r3, #0x14
	ldr r1, [r2, r1]
	mov r2, #0x28
	bl ov08_02220C3C
	ldr r1, _02220E7C ; =0x00001FD0
	ldrh r0, [r4, #0x1a]
	ldr r1, [r5, r1]
	mov r2, #0x14
	mov r3, #0x84
	bl ov08_02220C08
	pop {r3, r4, r5, pc}
	nop
_02220E74: .word 0x00001FB8
_02220E78: .word ov08_022253F4
_02220E7C: .word 0x00001FD0
	thumb_func_end ov08_02220DE8

	thumb_func_start ov08_02220E80
ov08_02220E80: ; 0x02220E80
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0]
	ldrb r2, [r0, #0x11]
	ldr r0, [sp]
	add r1, r0, #4
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r1, r0, #2
	ldr r0, [sp]
	mov r2, #0xc
	add r1, r0, r1
	ldr r0, _02220F44 ; =0x00001FB8
	ldr r0, [r1, r0]
	mov r1, #0x18
	bl ov08_02220A8C
	ldr r1, [sp]
	ldrb r0, [r4, #0x17]
	ldr r1, [r1]
	mov r3, #0x14
	ldrb r1, [r1, #0x11]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1c
	add r1, #0xd
	lsl r2, r1, #2
	ldr r1, [sp]
	add r2, r1, r2
	ldr r1, _02220F44 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0xc6
	bl ov08_02220B90
	ldr r0, [sp]
	ldr r2, _02220F48 ; =ov08_022253D4
	add r1, r4, #0
	bl ov08_02220BB4
	ldr r1, [sp]
	ldrh r0, [r4, #0x1a]
	ldr r1, [r1]
	mov r3, #0x14
	ldrb r1, [r1, #0x11]
	lsl r2, r1, #2
	ldr r1, [sp]
	add r2, r1, r2
	ldr r1, _02220F44 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x20
	bl ov08_02220C08
	ldr r1, [sp]
	add r0, r4, #0
	ldr r1, [r1]
	add r0, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r0]
	mov r3, #0x14
	add r1, #0x20
	lsl r2, r1, #2
	ldr r1, [sp]
	add r2, r1, r2
	ldr r1, _02220F44 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x28
	bl ov08_02220C3C
	ldr r5, [sp]
	ldr r6, _02220F4C ; =ov08_02225454
	mov r7, #0
_02220F10:
	ldrh r0, [r4, #0x30]
	cmp r0, #0
	beq _02220F36
	add r3, r4, #0
	ldr r1, _02220F50 ; =0x0000200C
	add r3, #0x34
	ldr r2, _02220F54 ; =0x0000B010
	ldrb r3, [r3]
	ldr r0, [sp]
	ldr r1, [r5, r1]
	add r2, r7, r2
	bl ov08_02220AEC
	ldr r0, _02220F50 ; =0x0000200C
	ldr r1, [r6]
	ldr r0, [r5, r0]
	ldr r2, [r6, #4]
	bl ov08_02220A8C
_02220F36:
	add r7, r7, #1
	add r4, #8
	add r5, r5, #4
	add r6, #8
	cmp r7, #4
	blo _02220F10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02220F44: .word 0x00001FB8
_02220F48: .word ov08_022253D4
_02220F4C: .word ov08_02225454
_02220F50: .word 0x0000200C
_02220F54: .word 0x0000B010
	thumb_func_end ov08_02220E80

	thumb_func_start ov08_02220F58
ov08_02220F58: ; 0x02220F58
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r1, r5, #4
	ldrb r2, [r0, #0x11]
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02221010 ; =0x00001FB8
	mov r2, #0xc
	ldr r0, [r1, r0]
	mov r1, #0x18
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrb r0, [r4, #0x17]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r0, r0, #0x19
	add r1, #0xd
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221010 ; =0x00001FB8
	lsr r0, r0, #0x1c
	ldr r1, [r2, r1]
	mov r2, #0xc6
	bl ov08_02220B90
	ldr r2, _02221014 ; =ov08_022253E4
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02220BB4
	ldr r0, [r5]
	mov r2, #0x30
	add r0, #0x34
	ldrb r0, [r0]
	add r0, #0x15
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02221010 ; =0x00001FB8
	ldr r0, [r1, r0]
	mov r1, #0x88
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221010 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	add r0, r4, #0
	ldrb r1, [r1, #0x11]
	add r0, #0x2d
	ldrb r0, [r0]
	add r1, #0x20
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221010 ; =0x00001FB8
	mov r3, #0x14
	ldr r1, [r2, r1]
	mov r2, #0x28
	bl ov08_02220C3C
	ldr r2, [r5]
	ldr r1, _02221018 ; =0x00002020
	add r2, #0x34
	ldrb r2, [r2]
	ldr r1, [r5, r1]
	add r0, r5, #0
	lsl r2, r2, #3
	add r2, r4, r2
	add r2, #0x35
	ldrb r2, [r2]
	bl ov08_02220B3C
	ldr r0, _02221018 ; =0x00002020
	mov r1, #0x18
	ldr r0, [r5, r0]
	mov r2, #0x58
	bl ov08_02220A8C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221010: .word 0x00001FB8
_02221014: .word ov08_022253E4
_02221018: .word 0x00002020
	thumb_func_end ov08_02220F58

	thumb_func_start ov08_0222101C
ov08_0222101C: ; 0x0222101C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r1, r5, #4
	ldrb r2, [r0, #0x11]
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02221080 ; =0x00001FB8
	mov r2, #0xc
	ldr r0, [r1, r0]
	mov r1, #0x18
	bl ov08_02220A8C
	ldr r2, _02221084 ; =ov08_022253C4
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02220BB4
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221080 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	add r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	mov r3, #0x14
	add r1, #0x20
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221080 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x28
	bl ov08_02220C3C
	add r0, r5, #0
	bl ov08_022213C8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221080: .word 0x00001FB8
_02221084: .word ov08_022253C4
	thumb_func_end ov08_0222101C

	thumb_func_start ov08_02221088
ov08_02221088: ; 0x02221088
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r1, r5, #4
	ldrb r2, [r0, #0x11]
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02221140 ; =0x00001FB8
	mov r2, #0xc
	ldr r0, [r1, r0]
	mov r1, #0x18
	bl ov08_02220A8C
	ldr r2, _02221144 ; =ov08_022253B4
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02220BB4
	ldr r0, [r5]
	mov r2, #0x30
	add r0, #0x34
	ldrb r0, [r0]
	add r0, #0x15
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02221140 ; =0x00001FB8
	ldr r0, [r1, r0]
	mov r1, #0x88
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221140 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	add r0, r4, #0
	ldrb r1, [r1, #0x11]
	add r0, #0x2d
	ldrb r0, [r0]
	add r1, #0x20
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221140 ; =0x00001FB8
	mov r3, #0x14
	ldr r1, [r2, r1]
	mov r2, #0x28
	bl ov08_02220C3C
	ldr r1, [r5]
	add r0, r1, #0
	add r0, #0x34
	ldrb r2, [r0]
	cmp r2, #4
	bhs _0222111E
	lsl r2, r2, #3
	add r2, r4, r2
	ldr r1, _02221148 ; =0x00002020
	add r2, #0x35
	ldrb r2, [r2]
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov08_02220B3C
	b _02221132
_0222111E:
	ldrh r0, [r1, #0x24]
	mov r1, #1
	bl GetWazaAttr
	ldr r1, _02221148 ; =0x00002020
	add r2, r0, #0
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov08_02220B3C
_02221132:
	ldr r0, _02221148 ; =0x00002020
	mov r1, #0x18
	ldr r0, [r5, r0]
	mov r2, #0x58
	bl ov08_02220A8C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221140: .word 0x00001FB8
_02221144: .word ov08_022253B4
_02221148: .word 0x00002020
	thumb_func_end ov08_02221088

	thumb_func_start ov08_0222114C
ov08_0222114C: ; 0x0222114C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r1, r5, #4
	ldrb r2, [r0, #0x11]
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _022211B0 ; =0x00001FB8
	mov r2, #0xc
	ldr r0, [r1, r0]
	mov r1, #0x18
	bl ov08_02220A8C
	ldr r2, _022211B4 ; =ov08_022253C4
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02220BB4
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _022211B0 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	add r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	mov r3, #0x14
	add r1, #0x20
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _022211B0 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x28
	bl ov08_02220C3C
	add r0, r5, #0
	bl ov08_022213C8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022211B0: .word 0x00001FB8
_022211B4: .word ov08_022253C4
	thumb_func_end ov08_0222114C

	thumb_func_start ov08_022211B8
ov08_022211B8: ; 0x022211B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r1, r5, #4
	ldrb r2, [r0, #0x11]
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0222122C ; =0x00001FB8
	mov r2, #0xc
	ldr r0, [r1, r0]
	mov r1, #0x18
	bl ov08_02220A8C
	ldr r0, [r5]
	mov r2, #0x48
	add r0, #0x34
	ldrb r0, [r0]
	add r0, #0x15
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0222122C ; =0x00001FB8
	ldr r0, [r1, r0]
	mov r1, #0x88
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _0222122C ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	add r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	mov r3, #0x14
	add r1, #0x20
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _0222122C ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x28
	bl ov08_02220C3C
	add r0, r5, #0
	bl ov08_02221500
	pop {r3, r4, r5, pc}
	nop
_0222122C: .word 0x00001FB8
	thumb_func_end ov08_022211B8

	thumb_func_start ov08_02221230
ov08_02221230: ; 0x02221230
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r1, r5, #4
	ldrb r2, [r0, #0x11]
	mov r0, #0x50
	mul r0, r2
	add r4, r1, r0
	add r0, r2, #7
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _02221290 ; =0x00001FB8
	mov r2, #0xc
	ldr r0, [r1, r0]
	mov r1, #0x18
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	mov r3, #0x14
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221290 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	add r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	mov r3, #0x14
	add r1, #0x20
	lsl r1, r1, #2
	add r2, r5, r1
	ldr r1, _02221290 ; =0x00001FB8
	ldr r1, [r2, r1]
	mov r2, #0x28
	bl ov08_02220C3C
	add r0, r5, #0
	bl ov08_022213C8
	add r0, r5, #0
	bl ov08_02221500
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221290: .word 0x00001FB8
	thumb_func_end ov08_02221230

	thumb_func_start ov08_02221294
ov08_02221294: ; 0x02221294
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	add r2, r6, #4
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mov r4, #0
	mul r0, r1
	add r0, r2, r0
	str r0, [sp]
_022212A8:
	ldr r0, [sp]
	lsl r5, r4, #3
	add r3, r0, r5
	ldrh r0, [r3, #0x30]
	cmp r0, #0
	beq _022212DC
	lsl r0, r4, #2
	add r3, #0x34
	add r7, r6, r0
	ldr r1, _02221314 ; =0x0000200C
	ldr r2, _02221318 ; =0x0000B010
	ldrb r3, [r3]
	ldr r1, [r7, r1]
	add r0, r6, #0
	add r2, r4, r2
	bl ov08_02220AEC
	ldr r0, _0222131C ; =ov08_0222550C
	ldr r1, _0222131C ; =ov08_0222550C
	add r2, r0, r5
	ldr r0, _02221314 ; =0x0000200C
	ldr r1, [r1, r5]
	ldr r0, [r7, r0]
	ldr r2, [r2, #4]
	bl ov08_02220A8C
_022212DC:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _022212A8
	ldr r0, [r6]
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _02221312
	mov r1, #3
	bl GetWazaAttr
	add r3, r0, #0
	ldr r1, _02221320 ; =0x0000201C
	lsl r3, r3, #0x18
	ldr r1, [r6, r1]
	ldr r2, _02221324 ; =0x0000B014
	add r0, r6, #0
	lsr r3, r3, #0x18
	bl ov08_02220AEC
	ldr r0, _02221320 ; =0x0000201C
	mov r1, #0x58
	ldr r0, [r6, r0]
	mov r2, #0xb0
	bl ov08_02220A8C
_02221312:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02221314: .word 0x0000200C
_02221318: .word 0x0000B010
_0222131C: .word ov08_0222550C
_02221320: .word 0x0000201C
_02221324: .word 0x0000B014
	thumb_func_end ov08_02221294

	thumb_func_start ov08_02221328
ov08_02221328: ; 0x02221328
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	add r2, r7, #4
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mov r4, #0
	mul r0, r1
	add r0, r2, r0
	str r0, [sp]
_0222133C:
	ldr r0, [sp]
	lsl r5, r4, #3
	add r0, r0, r5
	ldrh r0, [r0, #0x30]
	cmp r0, #0
	beq _0222137A
	lsl r1, r4, #2
	add r6, r7, r1
	mov r1, #0xb
	bl GetWazaAttr
	add r3, r0, #0
	ldr r1, _022213B4 ; =0x0000200C
	ldr r2, _022213B8 ; =0x0000B010
	add r3, #0x12
	lsl r3, r3, #0x18
	ldr r1, [r6, r1]
	add r0, r7, #0
	add r2, r4, r2
	lsr r3, r3, #0x18
	bl ov08_02220AEC
	ldr r0, _022213BC ; =ov08_0222550C
	ldr r1, _022213BC ; =ov08_0222550C
	add r2, r0, r5
	ldr r0, _022213B4 ; =0x0000200C
	ldr r1, [r1, r5]
	ldr r0, [r6, r0]
	ldr r2, [r2, #4]
	bl ov08_02220A8C
_0222137A:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _0222133C
	ldr r0, [r7]
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _022213B2
	mov r1, #0xb
	bl GetWazaAttr
	add r3, r0, #0
	ldr r1, _022213C0 ; =0x0000201C
	add r3, #0x12
	lsl r3, r3, #0x18
	ldr r1, [r7, r1]
	ldr r2, _022213C4 ; =0x0000B014
	add r0, r7, #0
	lsr r3, r3, #0x18
	bl ov08_02220AEC
	ldr r0, _022213C0 ; =0x0000201C
	mov r1, #0x58
	ldr r0, [r7, r0]
	mov r2, #0xb0
	bl ov08_02220A8C
_022213B2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022213B4: .word 0x0000200C
_022213B8: .word 0x0000B010
_022213BC: .word ov08_0222550C
_022213C0: .word 0x0000201C
_022213C4: .word 0x0000B014
	thumb_func_end ov08_02221328

	thumb_func_start ov08_022213C8
ov08_022213C8: ; 0x022213C8
	push {r3, lr}
	ldr r1, _022213E0 ; =0x00002077
	ldrb r1, [r0, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bne _022213DA
	bl ov08_02221294
	pop {r3, pc}
_022213DA:
	bl ov08_02221328
	pop {r3, pc}
	.balign 4, 0
_022213E0: .word 0x00002077
	thumb_func_end ov08_022213C8

	thumb_func_start ov08_022213E4
ov08_022213E4: ; 0x022213E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0200DC64
	cmp r4, r0
	beq _02221402
	add r0, r5, #0
	mov r1, #0
	bl sub_0200DCC0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0200DC4C
_02221402:
	pop {r3, r4, r5, pc}
	thumb_func_end ov08_022213E4

	thumb_func_start ov08_02221404
ov08_02221404: ; 0x02221404
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #0x10]
	cmp r0, #0
	bne _02221412
	mov r0, #0
	pop {r3, pc}
_02221412:
	ldrb r1, [r2, #0x17]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1c
	cmp r1, #7
	beq _02221424
	cmp r1, #6
	beq _02221424
	mov r0, #5
	pop {r3, pc}
_02221424:
	ldrh r1, [r2, #0x12]
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _02221456
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222143C: ; jump table
	.short _02221456 - _0222143C - 2 ; case 0
	.short _02221452 - _0222143C - 2 ; case 1
	.short _0222144E - _0222143C - 2 ; case 2
	.short _0222144A - _0222143C - 2 ; case 3
	.short _02221446 - _0222143C - 2 ; case 4
_02221446:
	mov r0, #1
	pop {r3, pc}
_0222144A:
	mov r0, #2
	pop {r3, pc}
_0222144E:
	mov r0, #3
	pop {r3, pc}
_02221452:
	mov r0, #4
	pop {r3, pc}
_02221456:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov08_02221404

	thumb_func_start ov08_0222145C
ov08_0222145C: ; 0x0222145C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r4, #0
	ldr r0, [r0]
	bl GetPartyCount
	cmp r0, #0
	ble _022214B4
	add r7, r5, #4
_02221470:
	mov r0, #0x50
	add r1, r4, #0
	mul r1, r0
	add r0, r5, r1
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _022214A2
	add r0, r7, r1
	bl ov08_02221404
	add r1, r0, #0
	lsl r0, r4, #2
	add r6, r5, r0
	ldr r0, _022214B8 ; =0x00001FD4
	lsl r1, r1, #0x18
	ldr r0, [r6, r0]
	lsr r1, r1, #0x18
	bl ov08_022213E4
	ldr r0, _022214B8 ; =0x00001FD4
	mov r1, #1
	ldr r0, [r6, r0]
	lsl r1, r1, #0xc
	bl sub_0200DC34
_022214A2:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetPartyCount
	cmp r4, r0
	blt _02221470
_022214B4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022214B8: .word 0x00001FD4
	thumb_func_end ov08_0222145C

	thumb_func_start ov08_022214BC
ov08_022214BC: ; 0x022214BC
	push {r4, lr}
	add r4, r2, #0
	cmp r4, r1
	ble _022214E2
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
_022214E2:
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
	thumb_func_end ov08_022214BC

	thumb_func_start ov08_02221500
ov08_02221500: ; 0x02221500
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	add r5, r6, #4
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	add r4, r1, #0
	mul r4, r0
	ldr r0, _02221618 ; =0x00002024
	mov r1, #0
	ldr r0, [r6, r0]
	bl ov08_022213E4
	ldr r0, _0222161C ; =0x00002028
	mov r1, #1
	ldr r0, [r6, r0]
	bl ov08_022213E4
	ldr r0, _02221620 ; =0x0000202C
	mov r1, #3
	ldr r0, [r6, r0]
	bl ov08_022213E4
	ldr r0, _02221624 ; =0x00002030
	mov r1, #4
	ldr r0, [r6, r0]
	bl ov08_022213E4
	ldr r0, _02221628 ; =0x00002034
	mov r1, #2
	ldr r0, [r6, r0]
	bl ov08_022213E4
	add r0, r5, r4
	add r0, #0x28
	mov r1, #0x90
	ldrb r0, [r0]
	add r2, r1, #0
	bl ov08_022214BC
	add r7, r0, #0
	add r0, r5, r4
	add r0, #0x28
	ldrb r0, [r0]
	mov r1, #2
	mov r2, #0x18
	bl ov08_022214BC
	add r2, r0, #0
	ldr r0, _02221618 ; =0x00002024
	add r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	add r0, r5, r4
	add r0, #0x29
	ldrb r0, [r0]
	mov r1, #0xa4
	mov r2, #0x90
	bl ov08_022214BC
	add r7, r0, #0
	add r0, r5, r4
	add r0, #0x29
	ldrb r0, [r0]
	mov r1, #0x10
	mov r2, #0x18
	bl ov08_022214BC
	add r2, r0, #0
	ldr r0, _0222161C ; =0x00002028
	add r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	add r0, r5, r4
	add r0, #0x2a
	ldrb r0, [r0]
	mov r1, #0x9c
	mov r2, #0x90
	bl ov08_022214BC
	add r7, r0, #0
	add r0, r5, r4
	add r0, #0x2a
	ldrb r0, [r0]
	mov r1, #0x29
	mov r2, #0x18
	bl ov08_022214BC
	add r2, r0, #0
	ldr r0, _02221620 ; =0x0000202C
	add r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	add r0, r5, r4
	add r0, #0x2b
	ldrb r0, [r0]
	mov r1, #0x83
	mov r2, #0x8f
	bl ov08_022214BC
	add r7, r0, #0
	add r0, r5, r4
	add r0, #0x2b
	ldrb r0, [r0]
	mov r1, #0x29
	mov r2, #0x18
	bl ov08_022214BC
	add r2, r0, #0
	ldr r0, _02221624 ; =0x00002030
	add r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	add r0, r5, r4
	add r0, #0x2c
	ldrb r0, [r0]
	mov r1, #0x7b
	mov r2, #0x8f
	bl ov08_022214BC
	add r7, r0, #0
	add r0, r5, r4
	add r0, #0x2c
	ldrb r0, [r0]
	mov r1, #0x10
	mov r2, #0x18
	bl ov08_022214BC
	add r2, r0, #0
	ldr r0, _02221628 ; =0x00002034
	add r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02221618: .word 0x00002024
_0222161C: .word 0x00002028
_02221620: .word 0x0000202C
_02221624: .word 0x00002030
_02221628: .word 0x00002034
	thumb_func_end ov08_02221500

	thumb_func_start ov08_0222162C
ov08_0222162C: ; 0x0222162C
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl ov12_0223A8E4
	ldr r1, _02221688 ; =0x0000B018
	mov r2, #0x7a
	str r1, [sp]
	sub r1, #0xc
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r1, _0222168C ; =0x00001FB4
	ldr r3, [r5]
	lsl r2, r2, #2
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r3, [r3, #0xc]
	add r4, r0, #0
	bl ov12_0226B8FC
	ldr r3, _02221690 ; =0x0000B00C
	mov r0, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r1, _0222168C ; =0x00001FB4
	ldr r2, [r5]
	ldr r1, [r5, r1]
	ldr r2, [r2, #0xc]
	add r0, r4, #0
	add r3, #0xc
	bl ov12_0226B9A4
	add r1, r0, #0
	ldr r0, _02221694 ; =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224B94
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_02221688: .word 0x0000B018
_0222168C: .word 0x00001FB4
_02221690: .word 0x0000B00C
_02221694: .word 0x00002088
	thumb_func_end ov08_0222162C

	thumb_func_start ov08_02221698
ov08_02221698: ; 0x02221698
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _022216C0 ; =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224B84
	bl ov12_0226BA28
	ldr r2, _022216C4 ; =0x0000B00C
	ldr r0, _022216C8 ; =0x00001FB4
	str r2, [sp]
	add r1, r2, #0
	ldr r0, [r4, r0]
	add r1, #0xc
	add r3, r2, #0
	bl ov12_0226B97C
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_022216C0: .word 0x00002088
_022216C4: .word 0x0000B00C
_022216C8: .word 0x00001FB4
	thumb_func_end ov08_02221698

	thumb_func_start ov08_022216CC
ov08_022216CC: ; 0x022216CC
	push {r3, lr}
	ldr r1, _022216F0 ; =0x00002077
	ldrb r2, [r0, r1]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	bne _022216E4
	add r1, #0x11
	ldr r0, [r0, r1]
	mov r1, #0x5f
	bl ov08_02224BF8
	pop {r3, pc}
_022216E4:
	add r1, #0x11
	ldr r0, [r0, r1]
	mov r1, #0x7f
	bl ov08_02224BF8
	pop {r3, pc}
	.balign 4, 0
_022216F0: .word 0x00002077
	thumb_func_end ov08_022216CC

	thumb_func_start ov08_022216F4
ov08_022216F4: ; 0x022216F4
	push {r3, lr}
	ldr r1, _02221718 ; =0x00002077
	ldrb r2, [r0, r1]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	bne _0222170C
	add r1, #0x11
	ldr r0, [r0, r1]
	mov r1, #5
	bl ov08_02224BF8
	pop {r3, pc}
_0222170C:
	add r1, #0x11
	ldr r0, [r0, r1]
	mov r1, #7
	bl ov08_02224BF8
	pop {r3, pc}
	.balign 4, 0
_02221718: .word 0x00002077
	thumb_func_end ov08_022216F4

	thumb_func_start ov08_0222171C
ov08_0222171C: ; 0x0222171C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, _022217BC ; =0x00002088
	ldr r1, _022217C0 ; =ov08_022254BC
	lsl r2, r5, #2
	ldr r0, [r4, r0]
	ldr r1, [r1, r2]
	bl ov08_02224BCC
	cmp r5, #9
	bhi _022217BA
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02221740: ; jump table
	.short _02221754 - _02221740 - 2 ; case 0
	.short _0222176E - _02221740 - 2 ; case 1
	.short _022217BA - _02221740 - 2 ; case 2
	.short _02221784 - _02221740 - 2 ; case 3
	.short _02221784 - _02221740 - 2 ; case 4
	.short _022217BA - _02221740 - 2 ; case 5
	.short _02221794 - _02221740 - 2 ; case 6
	.short _022217A8 - _02221740 - 2 ; case 7
	.short _02221794 - _02221740 - 2 ; case 8
	.short _022217A8 - _02221740 - 2 ; case 9
_02221754:
	ldr r1, [r4]
	ldr r0, _022217BC ; =0x00002088
	ldrb r1, [r1, #0x11]
	ldr r0, [r4, r0]
	bl ov08_02224B98
	ldr r0, _022217C4 ; =0x0000208C
	mov r1, #0
	strb r1, [r4, r0]
	ldr r0, [r4]
	add r0, #0x34
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_0222176E:
	ldr r1, _022217BC ; =0x00002088
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldrb r1, [r4, r1]
	bl ov08_02224B98
	ldr r0, [r4]
	mov r1, #0
	add r0, #0x34
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02221784:
	ldr r1, [r4]
	ldr r0, _022217BC ; =0x00002088
	add r1, #0x34
	ldrb r1, [r1]
	ldr r0, [r4, r0]
	bl ov08_02224B98
	pop {r3, r4, r5, pc}
_02221794:
	add r0, r4, #0
	bl ov08_022216CC
	ldr r1, _022217BC ; =0x00002088
	ldr r0, [r4, r1]
	add r1, r1, #5
	ldrb r1, [r4, r1]
	bl ov08_02224B98
	pop {r3, r4, r5, pc}
_022217A8:
	add r0, r4, #0
	bl ov08_022216F4
	ldr r1, _022217BC ; =0x00002088
	ldr r0, [r4, r1]
	add r1, r1, #6
	ldrb r1, [r4, r1]
	bl ov08_02224B98
_022217BA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022217BC: .word 0x00002088
_022217C0: .word ov08_022254BC
_022217C4: .word 0x0000208C
	thumb_func_end ov08_0222171C

	thumb_func_start ov08_022217C8
ov08_022217C8: ; 0x022217C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _022217EC ; =0x00002088
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov08_02224B90
	ldr r0, _022217EC ; =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224BC0
	ldr r0, _022217EC ; =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224B84
	bl ov12_0226BB68
	pop {r4, pc}
	.balign 4, 0
_022217EC: .word 0x00002088
	thumb_func_end ov08_022217C8

	thumb_func_start ov08_022217F0
ov08_022217F0: ; 0x022217F0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0x7b
	lsl r0, r0, #2
	mov r2, #0
	add r0, r5, r0
	add r3, r2, #0
	add r4, r1, #0
	bl ov08_02221BD0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xab
	lsl r0, r0, #2
	mov r3, #6
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	str r3, [sp, #4]
	bl ov08_02221BD0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0xdb
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	mov r3, #0xc
	bl ov08_02221BD0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, _02221AB0 ; =0x0000042C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x12
	bl ov08_02221BD0
	mov r2, #0x10
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, _02221AB4 ; =0x000004EC
	add r1, r4, #0
	add r0, r5, r0
	mov r3, #0
	bl ov08_02221BD0
	ldr r0, _02221AB8 ; =0x000005AC
	mov r2, #0x10
	str r2, [sp]
	mov r3, #6
	add r0, r5, r0
	add r1, r4, #0
	str r3, [sp, #4]
	bl ov08_02221BD0
	mov r2, #0x10
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, _02221ABC ; =0x0000066C
	add r1, r4, #0
	add r0, r5, r0
	mov r3, #0xc
	bl ov08_02221BD0
	mov r2, #0x10
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, _02221AC0 ; =0x0000072C
	add r1, r4, #0
	add r0, r5, r0
	mov r3, #0x12
	bl ov08_02221BD0
	mov r0, #0xd
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r0, _02221AC4 ; =0x000007EC
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x27
	bl ov08_02221BD0
	mov r0, #0xd
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r0, _02221AC8 ; =0x0000086E
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x2c
	bl ov08_02221BD0
	mov r2, #0xd
	str r2, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #0x8f
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0x27
	bl ov08_02221BD0
	mov r2, #0xd
	str r2, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r0, _02221ACC ; =0x00000972
	add r1, r4, #0
	add r0, r5, r0
	mov r3, #0x2c
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AD0 ; =0x000009F4
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x31
	bl ov08_02221BD0
	ldr r0, _02221AD4 ; =0x00000A26
	mov r2, #5
	str r2, [sp]
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0x31
	str r2, [sp, #4]
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AD8 ; =0x00000A58
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xa
	mov r3, #0x31
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221ADC ; =0x00000A8A
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xf
	mov r3, #0x31
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AE0 ; =0x00000ABC
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x36
	bl ov08_02221BD0
	ldr r0, _02221AE4 ; =0x00000AEE
	mov r2, #5
	str r2, [sp]
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0x36
	str r2, [sp, #4]
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xb2
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0xa
	mov r3, #0x36
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AE8 ; =0x00000B52
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xf
	mov r3, #0x36
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AEC ; =0x00000B84
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x1a
	mov r3, #0x18
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AF0 ; =0x00000BB6
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x1a
	mov r3, #0x1d
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AF4 ; =0x00000BE8
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x1a
	mov r3, #0x22
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AF8 ; =0x00000C1A
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x1a
	mov r3, #0x27
	bl ov08_02221BD0
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #0x6d
	lsl r0, r0, #6
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	mov r3, #0x18
	bl ov08_02221BD0
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r0, _02221AFC ; =0x00001C44
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x1d
	bl ov08_02221BD0
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r0, _02221B00 ; =0x00001D48
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x22
	bl ov08_02221BD0
	mov r0, #9
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02221B04 ; =0x00001E4C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x14
	mov r3, #0x31
	bl ov08_02221BD0
	mov r0, #9
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02221B08 ; =0x00001E94
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x14
	mov r3, #0x35
	bl ov08_02221BD0
	mov r0, #9
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02221B0C ; =0x00001EDC
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x14
	mov r3, #0x39
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02221B10 ; =0x00001F24
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x3b
	bl ov08_02221BD0
	mov r2, #5
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02221B14 ; =0x00001F38
	add r1, r4, #0
	add r0, r5, r0
	mov r3, #0x3b
	bl ov08_02221BD0
	mov r0, #5
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02221B18 ; =0x00001F4C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xa
	mov r3, #0x3b
	bl ov08_02221BD0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02221AB0: .word 0x0000042C
_02221AB4: .word 0x000004EC
_02221AB8: .word 0x000005AC
_02221ABC: .word 0x0000066C
_02221AC0: .word 0x0000072C
_02221AC4: .word 0x000007EC
_02221AC8: .word 0x0000086E
_02221ACC: .word 0x00000972
_02221AD0: .word 0x000009F4
_02221AD4: .word 0x00000A26
_02221AD8: .word 0x00000A58
_02221ADC: .word 0x00000A8A
_02221AE0: .word 0x00000ABC
_02221AE4: .word 0x00000AEE
_02221AE8: .word 0x00000B52
_02221AEC: .word 0x00000B84
_02221AF0: .word 0x00000BB6
_02221AF4: .word 0x00000BE8
_02221AF8: .word 0x00000C1A
_02221AFC: .word 0x00001C44
_02221B00: .word 0x00001D48
_02221B04: .word 0x00001E4C
_02221B08: .word 0x00001E94
_02221B0C: .word 0x00001EDC
_02221B10: .word 0x00001F24
_02221B14: .word 0x00001F38
_02221B18: .word 0x00001F4C
	thumb_func_end ov08_022217F0

	thumb_func_start ov08_02221B1C
ov08_02221B1C: ; 0x02221B1C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x1e
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	ldr r0, _02221BC4 ; =0x00000C4C
	mov r2, #0
	add r0, r5, r0
	add r3, r2, #0
	add r4, r1, #0
	bl ov08_02221BD0
	mov r0, #0x1e
	str r0, [sp]
	ldr r0, _02221BC8 ; =0x00001048
	mov r3, #0x11
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	str r3, [sp, #4]
	bl ov08_02221BD0
	mov r0, #0x1e
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	ldr r0, _02221BCC ; =0x00001444
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x22
	bl ov08_02221BD0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0x61
	lsl r0, r0, #6
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	mov r3, #0x33
	bl ov08_02221BD0
	mov r2, #0x10
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0x19
	lsl r0, r0, #8
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0x33
	bl ov08_02221BD0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0x67
	lsl r0, r0, #6
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	mov r3, #0x39
	bl ov08_02221BD0
	mov r2, #0x10
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0x6a
	lsl r0, r0, #6
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0x39
	bl ov08_02221BD0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02221BC4: .word 0x00000C4C
_02221BC8: .word 0x00001048
_02221BCC: .word 0x00001444
	thumb_func_end ov08_02221B1C

	thumb_func_start ov08_02221BD0
ov08_02221BD0: ; 0x02221BD0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r0, sp, #8
	mov lr, r3
	ldrb r3, [r0, #0x14]
	mov r6, #0
	mov ip, r3
	cmp r3, #0
	ble _02221C1C
	ldrb r3, [r0, #0x10]
	lsl r2, r2, #1
	add r7, r1, r2
_02221BE8:
	mov r2, #0
	cmp r3, #0
	ble _02221C10
	mov r0, lr
	add r0, r0, r6
	lsl r0, r0, #6
	add r5, r7, r0
	add r0, r6, #0
	mul r0, r3
	lsl r1, r0, #1
	ldr r0, [sp]
	add r4, r0, r1
_02221C00:
	lsl r1, r2, #1
	ldrh r0, [r5, r1]
	strh r0, [r4, r1]
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	cmp r2, r3
	blt _02221C00
_02221C10:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	mov r0, ip
	cmp r6, r0
	blt _02221BE8
_02221C1C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov08_02221BD0

	thumb_func_start ov08_02221C20
ov08_02221C20: ; 0x02221C20
	cmp r1, #0x21
	bhi _02221D06
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02221C30: ; jump table
	.short _02221C74 - _02221C30 - 2 ; case 0
	.short _02221C74 - _02221C30 - 2 ; case 1
	.short _02221C74 - _02221C30 - 2 ; case 2
	.short _02221C74 - _02221C30 - 2 ; case 3
	.short _02221C74 - _02221C30 - 2 ; case 4
	.short _02221C74 - _02221C30 - 2 ; case 5
	.short _02221C92 - _02221C30 - 2 ; case 6
	.short _02221C9E - _02221C30 - 2 ; case 7
	.short _02221CAC - _02221C30 - 2 ; case 8
	.short _02221CAC - _02221C30 - 2 ; case 9
	.short _02221CAC - _02221C30 - 2 ; case 10
	.short _02221CAC - _02221C30 - 2 ; case 11
	.short _02221CB8 - _02221C30 - 2 ; case 12
	.short _02221CC4 - _02221C30 - 2 ; case 13
	.short _02221CD0 - _02221C30 - 2 ; case 14
	.short _02221CD0 - _02221C30 - 2 ; case 15
	.short _02221CD0 - _02221C30 - 2 ; case 16
	.short _02221CD0 - _02221C30 - 2 ; case 17
	.short _02221CEE - _02221C30 - 2 ; case 18
	.short _02221CD0 - _02221C30 - 2 ; case 19
	.short _02221CD0 - _02221C30 - 2 ; case 20
	.short _02221CD0 - _02221C30 - 2 ; case 21
	.short _02221CD0 - _02221C30 - 2 ; case 22
	.short _02221CD0 - _02221C30 - 2 ; case 23
	.short _02221CD0 - _02221C30 - 2 ; case 24
	.short _02221CD0 - _02221C30 - 2 ; case 25
	.short _02221CD0 - _02221C30 - 2 ; case 26
	.short _02221CD0 - _02221C30 - 2 ; case 27
	.short _02221CDE - _02221C30 - 2 ; case 28
	.short _02221CDE - _02221C30 - 2 ; case 29
	.short _02221CFA - _02221C30 - 2 ; case 30
	.short _02221CFA - _02221C30 - 2 ; case 31
	.short _02221CFA - _02221C30 - 2 ; case 32
	.short _02221CFA - _02221C30 - 2 ; case 33
_02221C74:
	cmp r3, #0
	bne _02221C86
	mov r1, #0x7b
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0xc0
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221C86:
	ldr r1, _02221D0C ; =0x000004EC
	add r1, r0, r1
	mov r0, #0xc0
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221C92:
	ldr r1, _02221D10 ; =0x00000B84
	add r1, r0, r1
	mov r0, #0x32
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221C9E:
	ldr r1, _02221D14 ; =0x00000C4C
	add r1, r0, r1
	mov r0, #0xff
	lsl r0, r0, #2
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221CAC:
	ldr r1, _02221D18 ; =0x000007EC
	add r1, r0, r1
	mov r0, #0x82
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221CB8:
	ldr r1, _02221D1C ; =0x000009F4
	add r1, r0, r1
	mov r0, #0x32
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221CC4:
	ldr r1, _02221D20 ; =0x00000ABC
	add r1, r0, r1
	mov r0, #0x32
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221CD0:
	mov r1, #0x61
	lsl r1, r1, #6
	add r1, r0, r1
	mov r0, #0xc0
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221CDE:
	mov r1, #0x6d
	lsl r1, r1, #6
	add r1, r0, r1
	lsl r0, r2, #6
	add r0, r2, r0
	lsl r0, r0, #2
	add r0, r1, r0
	bx lr
_02221CEE:
	ldr r1, _02221D24 ; =0x00001E4C
	add r1, r0, r1
	mov r0, #0x48
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221CFA:
	ldr r1, _02221D28 ; =0x00001F24
	add r1, r0, r1
	mov r0, #0x14
	mul r0, r2
	add r0, r1, r0
	bx lr
_02221D06:
	mov r0, #0
	bx lr
	nop
_02221D0C: .word 0x000004EC
_02221D10: .word 0x00000B84
_02221D14: .word 0x00000C4C
_02221D18: .word 0x000007EC
_02221D1C: .word 0x000009F4
_02221D20: .word 0x00000ABC
_02221D24: .word 0x00001E4C
_02221D28: .word 0x00001F24
	thumb_func_end ov08_02221C20

	thumb_func_start ov08_02221D2C
ov08_02221D2C: ; 0x02221D2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r2, #0
	add r2, r3, #0
	add r3, sp, #0x10
	add r4, r1, #0
	ldrb r3, [r3, #0x10]
	add r1, r7, #0
	str r0, [sp]
	bl ov08_02221C20
	add r1, r0, #0
	ldr r2, _02221E60 ; =ov08_02225A56
	lsl r0, r7, #2
	ldrb r6, [r2, r0]
	ldr r2, _02221E64 ; =ov08_02225A57
	ldrb r0, [r2, r0]
	add r5, r6, #0
	mul r5, r0
	add r0, r4, #0
	lsl r2, r5, #1
	bl memcpy
	cmp r7, #5
	bgt _02221D7A
	cmp r7, #0
	blt _02221E5C
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02221D6E: ; jump table
	.short _02221D82 - _02221D6E - 2 ; case 0
	.short _02221D82 - _02221D6E - 2 ; case 1
	.short _02221D82 - _02221D6E - 2 ; case 2
	.short _02221D82 - _02221D6E - 2 ; case 3
	.short _02221D82 - _02221D6E - 2 ; case 4
	.short _02221D82 - _02221D6E - 2 ; case 5
_02221D7A:
	cmp r7, #0x1b
	beq _02221E3C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02221D82:
	mov r0, #0x50
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp]
	add r0, r0, r1
	ldrh r1, [r0, #8]
	cmp r1, #0
	beq _02221E5C
	ldrb r1, [r0, #0x1b]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	beq _02221DE2
	lsl r2, r6, #1
	add r0, r2, #5
	lsl r0, r0, #1
	ldrh r1, [r4, r0]
	add r0, sp, #4
	strh r1, [r0]
	add r1, r6, r2
	add r1, r1, #5
	lsl r1, r1, #1
	ldrh r1, [r4, r1]
	strh r1, [r0, #2]
	mov r1, #0
	add r0, sp, #4
_02221DB4:
	add r5, r1, #2
	lsl r3, r1, #1
	add r7, r5, #0
	mul r7, r6
	lsl r5, r7, #1
	ldrh r3, [r0, r3]
	mov r2, #0
	add r5, r4, r5
_02221DC4:
	lsl r7, r2, #1
	add r2, r2, #1
	lsl r2, r2, #0x18
	add r7, r5, r7
	lsr r2, r2, #0x18
	strh r3, [r7, #0xc]
	cmp r2, #9
	blo _02221DC4
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #2
	blo _02221DB4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02221DE2:
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	bne _02221E0C
	mov r1, #0
	cmp r5, #0
	ble _02221E5C
	mov r3, #2
	ldr r2, _02221E68 ; =0x00000FFF
	lsl r3, r3, #0xc
_02221DF4:
	lsl r0, r1, #1
	ldrh r6, [r4, r0]
	and r6, r2
	orr r6, r3
	strh r6, [r4, r0]
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, r5
	blt _02221DF4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02221E0C:
	lsl r1, r7, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	bl ov08_0221DB24
	cmp r0, #1
	bne _02221E5C
	mov r1, #0
	cmp r5, #0
	ble _02221E5C
	ldr r2, _02221E68 ; =0x00000FFF
	add r3, r2, #1
_02221E24:
	lsl r0, r1, #1
	ldrh r6, [r4, r0]
	and r6, r2
	orr r6, r3
	strh r6, [r4, r0]
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, r5
	blt _02221E24
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02221E3C:
	mov r1, #0
	cmp r5, #0
	ble _02221E5C
	mov r3, #0xa
	ldr r2, _02221E68 ; =0x00000FFF
	lsl r3, r3, #0xc
_02221E48:
	lsl r0, r1, #1
	ldrh r6, [r4, r0]
	and r6, r2
	orr r6, r3
	strh r6, [r4, r0]
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, r5
	blt _02221E48
_02221E5C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02221E60: .word ov08_02225A56
_02221E64: .word ov08_02225A57
_02221E68: .word 0x00000FFF
	thumb_func_end ov08_02221D2C

	thumb_func_start ov08_02221E6C
ov08_02221E6C: ; 0x02221E6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	add r5, r0, #0
	ldr r0, [sp, #0xc]
	lsl r4, r0, #2
	ldr r0, _02221ED8 ; =ov08_02225A57
	ldrb r7, [r0, r4]
	ldr r0, _02221EDC ; =ov08_02225A56
	ldrb r6, [r0, r4]
	ldr r0, [r5]
	add r1, r6, #0
	mul r1, r7
	ldr r0, [r0, #0xc]
	lsl r1, r1, #1
	bl AllocFromHeap
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	bl ov08_02221D2C
	ldr r0, _02221EE0 ; =ov08_02225A55
	ldr r3, _02221EE4 ; =ov08_02225A54
	ldrb r0, [r0, r4]
	ldrb r3, [r3, r4]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	str r6, [sp, #4]
	mov r0, #0x79
	str r7, [sp, #8]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl LoadRectToBgTilemapRect
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [sp, #0x18]
	bl FreeToHeap
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02221ED8: .word ov08_02225A57
_02221EDC: .word ov08_02225A56
_02221EE0: .word ov08_02225A55
_02221EE4: .word ov08_02225A54
	thumb_func_end ov08_02221E6C

	thumb_func_start ov08_02221EE8
ov08_02221EE8: ; 0x02221EE8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02221F88 ; =ov08_022259CC
	lsl r3, r1, #2
	ldr r6, [r0, r3]
	cmp r6, #0
	beq _02221F86
	cmp r1, #5
	bhi _02221F02
	ldr r0, _02221F8C ; =ov08_022259BC
	ldrb r0, [r0, r2]
	str r0, [sp]
	b _02221F08
_02221F02:
	ldr r0, _02221F90 ; =ov08_022259AC
	ldrb r0, [r0, r2]
	str r0, [sp]
_02221F08:
	cmp r2, #0
	beq _02221F16
	cmp r2, #1
	beq _02221F1A
	cmp r2, #2
	beq _02221F1E
	b _02221F20
_02221F16:
	mov r7, #1
	b _02221F20
_02221F1A:
	mov r7, #0
	b _02221F20
_02221F1E:
	mov r7, #1
_02221F20:
	cmp r1, #0xe
	blo _02221F54
	cmp r1, #0x11
	bhi _02221F54
	ldr r1, _02221F94 ; =0x00002070
	ldr r2, [sp]
	ldr r0, [r5, r1]
	add r1, r1, #5
	ldrb r1, [r5, r1]
	mov r3, #0
	ldrb r1, [r6, r1]
	lsl r1, r1, #4
	add r0, r0, r1
	add r1, r7, #0
	bl ScrollWindow
	ldr r1, _02221F94 ; =0x00002070
	ldr r0, [r5, r1]
	add r1, r1, #5
	ldrb r1, [r5, r1]
	ldrb r1, [r6, r1]
	lsl r1, r1, #4
	add r0, r0, r1
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, r6, r7, pc}
_02221F54:
	mov r4, #0
_02221F56:
	ldrb r2, [r6, r4]
	cmp r2, #0xff
	beq _02221F86
	ldr r0, _02221F94 ; =0x00002070
	mov r3, #0
	ldr r1, [r5, r0]
	lsl r0, r2, #4
	add r0, r1, r0
	ldr r2, [sp]
	add r1, r7, #0
	bl ScrollWindow
	ldr r0, _02221F94 ; =0x00002070
	ldr r1, [r5, r0]
	ldrb r0, [r6, r4]
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #8
	blo _02221F56
_02221F86:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02221F88: .word ov08_022259CC
_02221F8C: .word ov08_022259BC
_02221F90: .word ov08_022259AC
_02221F94: .word 0x00002070
	thumb_func_end ov08_02221EE8

	thumb_func_start ov08_02221F98
ov08_02221F98: ; 0x02221F98
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x1b
	bhi _0222209C
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02221FAE: ; jump table
	.short _02221FE6 - _02221FAE - 2 ; case 0
	.short _02221FE6 - _02221FAE - 2 ; case 1
	.short _02221FE6 - _02221FAE - 2 ; case 2
	.short _02221FE6 - _02221FAE - 2 ; case 3
	.short _02221FE6 - _02221FAE - 2 ; case 4
	.short _02221FE6 - _02221FAE - 2 ; case 5
	.short _0222209C - _02221FAE - 2 ; case 6
	.short _02222024 - _02221FAE - 2 ; case 7
	.short _0222209C - _02221FAE - 2 ; case 8
	.short _0222209C - _02221FAE - 2 ; case 9
	.short _0222209C - _02221FAE - 2 ; case 10
	.short _0222209C - _02221FAE - 2 ; case 11
	.short _0222209C - _02221FAE - 2 ; case 12
	.short _0222209C - _02221FAE - 2 ; case 13
	.short _02222056 - _02221FAE - 2 ; case 14
	.short _02222056 - _02221FAE - 2 ; case 15
	.short _02222056 - _02221FAE - 2 ; case 16
	.short _02222056 - _02221FAE - 2 ; case 17
	.short _0222209C - _02221FAE - 2 ; case 18
	.short _0222206E - _02221FAE - 2 ; case 19
	.short _0222206E - _02221FAE - 2 ; case 20
	.short _0222206E - _02221FAE - 2 ; case 21
	.short _0222206E - _02221FAE - 2 ; case 22
	.short _02222086 - _02221FAE - 2 ; case 23
	.short _02222086 - _02221FAE - 2 ; case 24
	.short _02222086 - _02221FAE - 2 ; case 25
	.short _02222086 - _02221FAE - 2 ; case 26
	.short _02222086 - _02221FAE - 2 ; case 27
_02221FE6:
	ldr r0, _022220A0 ; =ov08_022259C6
	lsl r1, r2, #1
	ldrsh r6, [r0, r1]
	add r0, r5, #0
	add r0, #0xd
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _022220A4 ; =0x00001FB8
	add r2, r6, #0
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DED0
	lsl r0, r5, #2
	add r1, r4, r0
	ldr r0, _022220A4 ; =0x00001FB8
	add r2, r6, #0
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DED0
	add r0, r5, #7
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _022220A4 ; =0x00001FB8
	add r2, r6, #0
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DED0
	pop {r4, r5, r6, pc}
_02222024:
	ldr r0, _022220A8 ; =ov08_022259C0
	lsl r1, r2, #1
	ldrsh r5, [r0, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	add r2, r5, #0
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _022220A4 ; =0x00001FB8
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DED0
	ldr r0, [r4]
	add r2, r5, #0
	ldrb r0, [r0, #0x11]
	add r0, r0, #7
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _022220A4 ; =0x00001FB8
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DED0
	pop {r4, r5, r6, pc}
_02222056:
	add r0, r5, #7
	lsl r0, r0, #2
	lsl r3, r2, #1
	ldr r2, _022220A8 ; =ov08_022259C0
	add r1, r4, r0
	ldr r0, _022220A4 ; =0x00001FB8
	ldrsh r2, [r2, r3]
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DED0
	pop {r4, r5, r6, pc}
_0222206E:
	add r0, r5, #2
	lsl r0, r0, #2
	lsl r3, r2, #1
	ldr r2, _022220A8 ; =ov08_022259C0
	add r1, r4, r0
	ldr r0, _022220A4 ; =0x00001FB8
	ldrsh r2, [r2, r3]
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DED0
	pop {r4, r5, r6, pc}
_02222086:
	sub r0, r5, #2
	lsl r0, r0, #2
	lsl r3, r2, #1
	ldr r2, _022220A8 ; =ov08_022259C0
	add r1, r4, r0
	ldr r0, _022220A4 ; =0x00001FB8
	ldrsh r2, [r2, r3]
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DED0
_0222209C:
	pop {r4, r5, r6, pc}
	nop
_022220A0: .word ov08_022259C6
_022220A4: .word 0x00001FB8
_022220A8: .word ov08_022259C0
	thumb_func_end ov08_02221F98

	thumb_func_start ov08_022220AC
ov08_022220AC: ; 0x022220AC
	push {r4, r5, r6, lr}
	ldr r3, _022220F4 ; =0x00001FA3
	add r5, r0, #0
	ldrb r6, [r5, r3]
	mov r2, #0x70
	add r4, r1, #0
	bic r6, r2
	strb r6, [r5, r3]
	cmp r4, #5
	bhi _022220D6
	bl ov08_0221D5DC
	cmp r0, #2
	bne _022220D6
	ldr r1, _022220F4 ; =0x00001FA3
	mov r0, #0x70
	ldrb r2, [r5, r1]
	bic r2, r0
	mov r0, #0x10
	orr r0, r2
	strb r0, [r5, r1]
_022220D6:
	ldr r0, _022220F8 ; =0x00001FA0
	mov r2, #0
	strb r2, [r5, r0]
	add r1, r0, #1
	strb r2, [r5, r1]
	add r1, r0, #2
	strb r4, [r5, r1]
	add r1, r0, #3
	ldrb r2, [r5, r1]
	mov r1, #0x80
	add r0, r0, #3
	orr r1, r2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
	nop
_022220F4: .word 0x00001FA3
_022220F8: .word 0x00001FA0
	thumb_func_end ov08_022220AC

	thumb_func_start ov08_022220FC
ov08_022220FC: ; 0x022220FC
	push {r4, lr}
	ldr r2, _022221C0 ; =0x00001FA3
	add r4, r0, #0
	ldrb r3, [r4, r2]
	lsl r1, r3, #0x18
	lsr r1, r1, #0x1f
	beq _022221BC
	sub r1, r2, #3
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0222211C
	cmp r1, #1
	beq _02222150
	cmp r1, #2
	beq _02222184
	pop {r4, pc}
_0222211C:
	sub r1, r2, #1
	ldrb r1, [r4, r1]
	lsl r3, r3, #0x19
	mov r2, #1
	lsr r3, r3, #0x1d
	bl ov08_02221E6C
	ldr r1, _022221C4 ; =0x00001FA2
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r2, #1
	bl ov08_02221EE8
	ldr r1, _022221C4 ; =0x00001FA2
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r2, #1
	bl ov08_02221F98
	ldr r0, _022221C8 ; =0x00001FA1
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #1
	sub r0, r0, #1
	strb r1, [r4, r0]
	pop {r4, pc}
_02222150:
	sub r1, r2, #1
	ldrb r1, [r4, r1]
	lsl r3, r3, #0x19
	mov r2, #2
	lsr r3, r3, #0x1d
	bl ov08_02221E6C
	ldr r1, _022221C4 ; =0x00001FA2
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r2, #2
	bl ov08_02221EE8
	ldr r1, _022221C4 ; =0x00001FA2
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r2, #2
	bl ov08_02221F98
	ldr r0, _022221C8 ; =0x00001FA1
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #2
	sub r0, r0, #1
	strb r1, [r4, r0]
	pop {r4, pc}
_02222184:
	sub r1, r2, #1
	ldrb r1, [r4, r1]
	lsl r3, r3, #0x19
	mov r2, #0
	lsr r3, r3, #0x1d
	bl ov08_02221E6C
	ldr r1, _022221C4 ; =0x00001FA2
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r2, #0
	bl ov08_02221EE8
	ldr r1, _022221C4 ; =0x00001FA2
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r2, #0
	bl ov08_02221F98
	ldr r0, _022221C8 ; =0x00001FA1
	mov r1, #0
	strb r1, [r4, r0]
	add r1, r0, #2
	ldrb r2, [r4, r1]
	mov r1, #0x80
	add r0, r0, #2
	bic r2, r1
	strb r2, [r4, r0]
_022221BC:
	pop {r4, pc}
	nop
_022221C0: .word 0x00001FA3
_022221C4: .word 0x00001FA2
_022221C8: .word 0x00001FA1
	thumb_func_end ov08_022220FC

	thumb_func_start ov08_022221CC
ov08_022221CC: ; 0x022221CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	cmp r1, #9
	bls _022221D6
	b _0222251E
_022221D6:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022221E2: ; jump table
	.short _022221F6 - _022221E2 - 2 ; case 0
	.short _0222226E - _022221E2 - 2 ; case 1
	.short _022222CA - _022221E2 - 2 ; case 2
	.short _0222231E - _022221E2 - 2 ; case 3
	.short _022223BC - _022221E2 - 2 ; case 4
	.short _02222408 - _022221E2 - 2 ; case 5
	.short _02222460 - _022221E2 - 2 ; case 6
	.short _022224C0 - _022221E2 - 2 ; case 7
	.short _02222460 - _022221E2 - 2 ; case 8
	.short _022224F0 - _022221E2 - 2 ; case 9
_022221F6:
	mov r5, #0
	mov r6, #3
	mov r7, #1
_022221FC:
	add r0, r4, #0
	add r1, r5, #0
	bl ov08_0221D5DC
	cmp r0, #0
	bne _02222218
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl ov08_02221E6C
	b _0222223E
_02222218:
	cmp r0, #1
	bne _0222222C
	lsl r1, r5, #0x18
	mov r2, #0
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl ov08_02221E6C
	b _0222223E
_0222222C:
	cmp r0, #2
	bne _0222223E
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #0
	mov r3, #1
	bl ov08_02221E6C
_0222223E:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #6
	blo _022221FC
	ldr r0, [r4]
	add r0, #0x35
	ldrb r0, [r0]
	cmp r0, #1
	bne _02222260
	add r0, r4, #0
	mov r1, #6
	mov r2, #3
	mov r3, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_02222260:
	mov r2, #0
	add r0, r4, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_0222226E:
	mov r2, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #7
	add r3, r2, #0
	bl ov08_02221E6C
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	mov r0, #0x50
	mul r0, r1
	add r0, r4, r0
	ldrb r0, [r0, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _022222B0
	add r0, r4, #0
	mov r1, #8
	mov r2, #3
	mov r3, #0
	bl ov08_02221E6C
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #3
	mov r3, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022222B0:
	mov r2, #0
	add r0, r4, #0
	mov r1, #8
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xa
	add r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022222CA:
	bl ov08_02222564
	cmp r0, #1
	bne _022222EC
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xc
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xd
	add r3, r2, #0
	bl ov08_02221E6C
	b _02222304
_022222EC:
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #3
	mov r3, #0
	bl ov08_02221E6C
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #3
	mov r3, #0
	bl ov08_02221E6C
_02222304:
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xb
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_0222231E:
	bl ov08_02222564
	cmp r0, #1
	bne _02222340
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xc
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xd
	add r3, r2, #0
	bl ov08_02221E6C
	b _02222358
_02222340:
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #3
	mov r3, #0
	bl ov08_02221E6C
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #3
	mov r3, #0
	bl ov08_02221E6C
_02222358:
	mov r5, #0
	mov r7, #3
	mov r6, #0x50
_0222235E:
	ldr r0, [r4]
	lsl r1, r5, #3
	ldrb r0, [r0, #0x11]
	add r2, r0, #0
	mul r2, r6
	add r0, r4, r2
	add r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _02222386
	add r1, r5, #0
	add r1, #0xe
	lsl r1, r1, #0x18
	mov r2, #0
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl ov08_02221E6C
	b _02222398
_02222386:
	add r1, r5, #0
	add r1, #0xe
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r2, r7, #0
	mov r3, #0
	bl ov08_02221E6C
_02222398:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #4
	blo _0222235E
	mov r2, #0
	add r0, r4, #0
	mov r1, #9
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022223BC:
	mov r2, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	mov r5, #0
	mov r6, #2
	add r7, r5, #0
_022223CC:
	ldr r0, [r4]
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, r5
	bne _022223EA
	add r1, r5, #0
	add r1, #0x1e
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl ov08_02221E6C
	b _022223FC
_022223EA:
	add r1, r5, #0
	add r1, #0x1e
	lsl r1, r1, #0x18
	mov r2, #0
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl ov08_02221E6C
_022223FC:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #4
	blo _022223CC
	pop {r3, r4, r5, r6, r7, pc}
_02222408:
	mov r5, #0
	mov r7, #3
	mov r6, #0x50
_0222240E:
	ldr r0, [r4]
	lsl r1, r5, #3
	ldrb r0, [r0, #0x11]
	add r2, r0, #0
	mul r2, r6
	add r0, r4, r2
	add r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _02222436
	add r1, r5, #0
	add r1, #0x13
	lsl r1, r1, #0x18
	mov r2, #0
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl ov08_02221E6C
	b _02222448
_02222436:
	add r1, r5, #0
	add r1, #0x13
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r2, r7, #0
	mov r3, #0
	bl ov08_02221E6C
_02222448:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #4
	blo _0222240E
	mov r2, #0
	add r0, r4, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_02222460:
	mov r2, #0
	mov r1, #0x17
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x18
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x19
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x1a
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x1b
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	ldr r0, _02222520 ; =0x00002077
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _0222251E
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x12
	add r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022224C0:
	mov r2, #0
	mov r1, #0x1c
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	ldr r0, _02222520 ; =0x00002077
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _0222251E
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x12
	add r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022224F0:
	mov r2, #0
	mov r1, #0x1d
	add r3, r2, #0
	bl ov08_02221E6C
	mov r2, #0
	add r0, r4, #0
	mov r1, #6
	add r3, r2, #0
	bl ov08_02221E6C
	ldr r0, _02222520 ; =0x00002077
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	bne _0222251E
	mov r2, #0
	add r0, r4, #0
	mov r1, #0x12
	add r3, r2, #0
	bl ov08_02221E6C
_0222251E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02222520: .word 0x00002077
	thumb_func_end ov08_022221CC

	thumb_func_start ov08_02222524
ov08_02222524: ; 0x02222524
	push {r3, lr}
	add r2, r0, #0
	cmp r1, #3
	bne _02222546
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x7a
	lsl r0, r0, #2
	mov r1, #0x7e
	lsl r1, r1, #6
	ldr r0, [r2, r0]
	add r1, r2, r1
	mov r2, #1
	mov r3, #0xc0
	bl PaletteData_LoadPalette
	pop {r3, pc}
_02222546:
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r1, _02222560 ; =0x00001F60
	ldr r0, [r2, r0]
	add r1, r2, r1
	mov r2, #1
	mov r3, #0xc0
	bl PaletteData_LoadPalette
	pop {r3, pc}
	nop
_02222560: .word 0x00001F60
	thumb_func_end ov08_02222524

	thumb_func_start ov08_02222564
ov08_02222564: ; 0x02222564
	push {r4, r5}
	mov r2, #0
	add r1, r2, #0
	mov r3, #0x50
_0222256C:
	add r4, r1, #0
	mul r4, r3
	add r5, r0, r4
	ldrh r4, [r5, #8]
	cmp r4, #0
	beq _02222586
	ldrb r4, [r5, #0x1b]
	lsl r4, r4, #0x18
	lsr r4, r4, #0x1f
	bne _02222586
	add r2, r2, #1
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
_02222586:
	add r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #6
	blo _0222256C
	cmp r2, #2
	blo _02222598
	mov r0, #1
	b _0222259A
_02222598:
	mov r0, #0
_0222259A:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov08_02222564

	thumb_func_start ov08_022225A4
ov08_022225A4: ; 0x022225A4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldrb r1, [r1, #0x11]
	bl ov08_0221D5DC
	cmp r0, #2
	bne _022225C4
	ldr r1, [r4]
	add r0, r4, #0
	ldrb r1, [r1, #0x11]
	mov r2, #0
	mov r3, #1
	bl ov08_02221E6C
	pop {r4, pc}
_022225C4:
	ldr r1, [r4]
	mov r2, #0
	ldrb r1, [r1, #0x11]
	add r0, r4, #0
	add r3, r2, #0
	bl ov08_02221E6C
	pop {r4, pc}
	thumb_func_end ov08_022225A4

	thumb_func_start ov08_022225D4
ov08_022225D4: ; 0x022225D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02222664 ; =ov08_02222670
	ldr r1, _02222668 ; =0x0000115C
	ldr r3, [r5, #0xc]
	mov r2, #0x64
	bl sub_02007200
	bl sub_0201F988
	ldr r2, _02222668 ; =0x0000115C
	add r4, r0, #0
	mov r1, #0
	bl memset
	str r5, [r4]
	ldr r0, [r5]
	bl ov12_0223A7D4
	str r0, [r4, #4]
	ldr r0, [r5]
	bl ov12_0223A938
	str r0, [r4, #8]
	ldr r0, _0222266C ; =0x0000114A
	mov r1, #0
	strb r1, [r4, r0]
	ldr r0, [r5]
	bl ov12_0223AA84
	add r6, r0, #0
	mov r5, #0
_02222614:
	ldr r3, [r4]
	add r0, r6, #0
	add r2, r3, #0
	add r2, #0x27
	add r3, #0x2c
	add r1, r5, #0
	add r2, r2, r5
	add r3, r3, r5
	bl BagCursor_Battle_PocketGetPosition
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #5
	blo _02222614
	add r0, r6, #0
	bl BagCursor_Battle_GetLastUsedItem
	ldr r1, [r4]
	strh r0, [r1, #0x20]
	add r0, r6, #0
	bl BagCursor_Battle_GetLastUsedPocket
	ldr r1, [r4]
	strb r0, [r1, #0x1f]
	add r0, r4, #0
	bl ov08_02223B78
	ldr r0, [r4]
	ldr r0, [r0]
	bl ov12_0223A7E0
	mov r1, #1
	lsl r1, r1, #0xa
	tst r0, r1
	beq _02222662
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x14]
_02222662:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02222664: .word ov08_02222670
_02222668: .word 0x0000115C
_0222266C: .word 0x0000114A
	thumb_func_end ov08_022225D4

	thumb_func_start ov08_02222670
ov08_02222670: ; 0x02222670
	push {r4, lr}
	ldr r2, _02222768 ; =0x0000114A
	add r4, r1, #0
	ldrb r2, [r4, r2]
	cmp r2, #0xe
	bhi _02222756
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02222688: ; jump table
	.short _022226A6 - _02222688 - 2 ; case 0
	.short _022226B2 - _02222688 - 2 ; case 1
	.short _022226BE - _02222688 - 2 ; case 2
	.short _022226CA - _02222688 - 2 ; case 3
	.short _022226D6 - _02222688 - 2 ; case 4
	.short _022226E2 - _02222688 - 2 ; case 5
	.short _022226EE - _02222688 - 2 ; case 6
	.short _022226FA - _02222688 - 2 ; case 7
	.short _02222706 - _02222688 - 2 ; case 8
	.short _02222712 - _02222688 - 2 ; case 9
	.short _0222271E - _02222688 - 2 ; case 10
	.short _0222272A - _02222688 - 2 ; case 11
	.short _02222736 - _02222688 - 2 ; case 12
	.short _02222742 - _02222688 - 2 ; case 13
	.short _0222274E - _02222688 - 2 ; case 14
_022226A6:
	add r0, r4, #0
	bl ov08_0222276C
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226B2:
	add r0, r4, #0
	bl ov08_02222840
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226BE:
	add r0, r4, #0
	bl ov08_02222918
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226CA:
	add r0, r4, #0
	bl ov08_02222AF0
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226D6:
	add r0, r4, #0
	bl ov08_02222D78
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226E2:
	add r0, r4, #0
	bl ov08_02222D84
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226EE:
	add r0, r4, #0
	bl ov08_02222D90
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226FA:
	add r0, r4, #0
	bl ov08_02222A78
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_02222706:
	add r0, r4, #0
	bl ov08_02222D9C
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_02222712:
	add r0, r4, #0
	bl ov08_02222DAC
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_0222271E:
	add r0, r4, #0
	bl ov08_02222DC4
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_0222272A:
	add r0, r4, #0
	bl ov08_02222DEC
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_02222736:
	add r0, r4, #0
	bl ov08_02222EC4
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_02222742:
	add r0, r4, #0
	bl ov08_02222E04
	ldr r1, _02222768 ; =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_0222274E:
	bl ov08_02222E2C
	cmp r0, #1
	beq _02222766
_02222756:
	add r0, r4, #0
	bl ov08_02224974
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D020
_02222766:
	pop {r4, pc}
	.balign 4, 0
_02222768: .word 0x0000114A
	thumb_func_end ov08_02222670

	thumb_func_start ov08_0222276C
ov08_0222276C: ; 0x0222276C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _02222830 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl ov08_02224B64
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl ov08_02223000
	add r0, r4, #0
	bl ov08_022230F4
	add r0, r4, #0
	bl ov08_022231E8
	ldr r1, [r4]
	mov r0, #4
	ldr r1, [r1, #0xc]
	bl FontID_Alloc
	ldr r0, [r4]
	ldr r0, [r0]
	bl ov12_0223AA84
	bl BagCursor_Battle_GetPocket
	ldr r1, _02222834 ; =0x0000114D
	strb r0, [r4, r1]
	add r0, r4, #0
	bl ov08_02223BF4
	ldr r1, _02222838 ; =0x0000114C
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02224A50
	add r0, r4, #0
	bl ov08_022233B8
	ldr r1, _02222838 ; =0x0000114C
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02223480
	add r0, r4, #0
	bl ov08_02223D08
	ldr r1, _02222838 ; =0x0000114C
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02223F94
	ldr r0, [r4]
	add r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _022227F0
	ldr r0, [r4, #0x34]
	mov r1, #1
	bl ov08_02224B90
_022227F0:
	ldr r1, _02222838 ; =0x0000114C
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02224134
	ldr r1, _02222838 ; =0x0000114C
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_0222421C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r1, #0xa
	str r0, [sp, #8]
	add r3, r1, #0
	ldr r0, [r4, #8]
	ldr r2, _0222283C ; =0x0000FFFF
	sub r3, #0x12
	bl sub_02003370
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _0222282A
	add sp, #0xc
	mov r0, #0xc
	pop {r3, r4, pc}
_0222282A:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02222830: .word 0x04001050
_02222834: .word 0x0000114D
_02222838: .word 0x0000114C
_0222283C: .word 0x0000FFFF
	thumb_func_end ov08_0222276C

	thumb_func_start ov08_02222840
ov08_02222840: ; 0x02222840
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_02003B44
	cmp r0, #0
	beq _02222852
	mov r0, #1
	pop {r3, r4, r5, pc}
_02222852:
	ldr r1, _0222290C ; =ov08_02225B4C
	add r0, r4, #0
	bl ov08_02223368
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _02222878
	ldr r0, [r4, #0x34]
	bl ov08_02224C94
	add r5, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r5, r0
	bne _0222287E
	mov r5, #5
	b _0222287E
_02222878:
	add r0, r4, #0
	bl ov08_0222417C
_0222287E:
	cmp r5, #5
	bhi _02222908
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222288E: ; jump table
	.short _0222289A - _0222288E - 2 ; case 0
	.short _0222289A - _0222288E - 2 ; case 1
	.short _0222289A - _0222288E - 2 ; case 2
	.short _0222289A - _0222288E - 2 ; case 3
	.short _022228BA - _0222288E - 2 ; case 4
	.short _022228EA - _0222288E - 2 ; case 5
_0222289A:
	ldr r0, _02222910 ; =0x000005DD
	bl PlaySE
	lsl r0, r5, #0x18
	lsr r1, r0, #0x18
	ldr r0, _02222914 ; =0x0000114D
	mov r2, #5
	strb r1, [r4, r0]
	sub r0, r0, #2
	strb r2, [r4, r0]
	add r0, r4, #0
	mov r2, #0
	bl ov08_02224938
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_022228BA:
	ldr r0, [r4]
	ldrh r0, [r0, #0x20]
	cmp r0, #0
	beq _02222908
	ldr r0, _02222910 ; =0x000005DD
	bl PlaySE
	ldr r0, [r4]
	ldrb r1, [r0, #0x1f]
	ldr r0, _02222914 ; =0x0000114D
	strb r1, [r4, r0]
	mov r1, #6
	sub r0, r0, #2
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov08_02223BA8
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov08_02224938
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_022228EA:
	ldr r0, _02222910 ; =0x000005DD
	bl PlaySE
	ldr r0, [r4]
	mov r2, #0
	strh r2, [r0, #0x1c]
	ldr r0, [r4]
	mov r1, #4
	strb r1, [r0, #0x1e]
	add r0, r4, #0
	mov r1, #5
	bl ov08_02224938
	mov r0, #0xd
	pop {r3, r4, r5, pc}
_02222908:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222290C: .word ov08_02225B4C
_02222910: .word 0x000005DD
_02222914: .word 0x0000114D
	thumb_func_end ov08_02222840

	thumb_func_start ov08_02222918
ov08_02222918: ; 0x02222918
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02222A64 ; =ov08_02225B68
	add r4, r0, #0
	bl ov08_02223368
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0222298C
	ldr r0, [r4, #0x34]
	bl ov08_02224B8C
	add r6, r0, #0
	ldr r0, [r4, #0x34]
	bl ov08_02224B88
	add r7, r0, #0
	ldr r0, [r4, #0x34]
	bl ov08_02224C94
	add r5, r0, #0
	ldr r0, [r4, #0x34]
	bl ov08_02224B88
	mov r1, #1
	mvn r1, r1
	cmp r5, r1
	bne _02222956
	mov r5, #6
	b _02222992
_02222956:
	cmp r6, #1
	bne _02222992
	cmp r7, r0
	bne _02222992
	ldr r1, _02222A68 ; =gSystem
	mov r2, #0x20
	ldr r1, [r1, #0x4c]
	tst r2, r1
	beq _02222976
	cmp r0, #0
	beq _02222974
	cmp r0, #2
	beq _02222974
	cmp r0, #4
	bne _02222976
_02222974:
	mov r5, #7
_02222976:
	mov r2, #0x10
	tst r1, r2
	beq _02222992
	cmp r0, #1
	beq _02222988
	cmp r0, #3
	beq _02222988
	cmp r0, #5
	bne _02222992
_02222988:
	mov r5, #8
	b _02222992
_0222298C:
	add r0, r4, #0
	bl ov08_0222417C
_02222992:
	cmp r5, #8
	bhi _02222A60
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022229A2: ; jump table
	.short _022229B4 - _022229A2 - 2 ; case 0
	.short _022229B4 - _022229A2 - 2 ; case 1
	.short _022229B4 - _022229A2 - 2 ; case 2
	.short _022229B4 - _022229A2 - 2 ; case 3
	.short _022229B4 - _022229A2 - 2 ; case 4
	.short _022229B4 - _022229A2 - 2 ; case 5
	.short _022229EA - _022229A2 - 2 ; case 6
	.short _02222A04 - _022229A2 - 2 ; case 7
	.short _02222A32 - _022229A2 - 2 ; case 8
_022229B4:
	add r0, r4, #0
	add r1, r5, #0
	bl ov08_02223CD4
	cmp r0, #0
	beq _02222A60
	ldr r0, _02222A6C ; =0x000005DD
	bl PlaySE
	ldr r0, _02222A70 ; =0x0000114D
	ldr r2, [r4]
	ldrb r1, [r4, r0]
	sub r0, r0, #2
	add r1, r2, r1
	add r1, #0x27
	strb r5, [r1]
	mov r1, #6
	strb r1, [r4, r0]
	add r1, r5, #6
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov08_02224938
	mov r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_022229EA:
	ldr r0, _02222A6C ; =0x000005DD
	bl PlaySE
	ldr r0, _02222A74 ; =0x0000114B
	mov r1, #4
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl ov08_02224938
	mov r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_02222A04:
	ldr r0, _02222A70 ; =0x0000114D
	ldrb r1, [r4, r0]
	add r0, r0, #7
	add r1, r4, r1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02222A60
	ldr r0, _02222A6C ; =0x000005DD
	bl PlaySE
	ldr r0, _02222A74 ; =0x0000114B
	mov r1, #7
	strb r1, [r4, r0]
	sub r1, #8
	add r0, r0, #3
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0
	bl ov08_02224938
	mov r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_02222A32:
	ldr r0, _02222A70 ; =0x0000114D
	ldrb r1, [r4, r0]
	add r0, r0, #7
	add r1, r4, r1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02222A60
	ldr r0, _02222A6C ; =0x000005DD
	bl PlaySE
	ldr r0, _02222A74 ; =0x0000114B
	mov r1, #7
	strb r1, [r4, r0]
	mov r1, #1
	add r0, r0, #3
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	bl ov08_02224938
	mov r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_02222A60:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02222A64: .word ov08_02225B68
_02222A68: .word gSystem
_02222A6C: .word 0x000005DD
_02222A70: .word 0x0000114D
_02222A74: .word 0x0000114B
	thumb_func_end ov08_02222918

	thumb_func_start ov08_02222A78
ov08_02222A78: ; 0x02222A78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02222AE8 ; =0x0000114D
	ldr r1, [r4]
	ldrb r2, [r4, r0]
	mov r3, #0
	add r5, r1, r2
	mov r1, #0x2c
	ldrsb r2, [r5, r1]
	add r5, #0x27
	add r1, r0, #1
	strb r3, [r5]
	ldrsb r1, [r4, r1]
	add r1, r2, r1
	lsl r1, r1, #0x18
	asr r2, r1, #0x18
	ldrb r1, [r4, r0]
	add r0, r0, #7
	add r5, r4, r1
	ldrb r5, [r5, r0]
	cmp r2, r5
	ble _02222AAE
	ldr r0, [r4]
	add r0, r0, r1
	add r0, #0x2c
	strb r3, [r0]
	b _02222AC2
_02222AAE:
	cmp r2, #0
	ldr r0, [r4]
	bge _02222ABC
	add r0, r0, r1
	add r0, #0x2c
	strb r5, [r0]
	b _02222AC2
_02222ABC:
	add r0, r0, r1
	add r0, #0x2c
	strb r2, [r0]
_02222AC2:
	add r0, r4, #0
	bl ov08_0222377C
	add r0, r4, #0
	bl ov08_022237C4
	ldr r1, _02222AEC ; =0x0000114C
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02223F94
	ldr r1, _02222AEC ; =0x0000114C
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02224A50
	mov r0, #2
	pop {r3, r4, r5, pc}
	nop
_02222AE8: .word 0x0000114D
_02222AEC: .word 0x0000114C
	thumb_func_end ov08_02222A78

	thumb_func_start ov08_02222AF0
ov08_02222AF0: ; 0x02222AF0
	push {r3, r4, r5, lr}
	ldr r1, _02222B7C ; =ov08_02225ADC
	add r5, r0, #0
	bl ov08_02223368
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _02222B18
	ldr r0, [r5, #0x34]
	bl ov08_02224C94
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bne _02222B1E
	mov r4, #1
	b _02222B1E
_02222B18:
	add r0, r5, #0
	bl ov08_0222417C
_02222B1E:
	cmp r4, #0
	beq _02222B28
	cmp r4, #1
	beq _02222B5E
	b _02222B78
_02222B28:
	ldr r0, _02222B80 ; =0x000005DD
	bl PlaySE
	ldr r1, _02222B84 ; =0x0000114D
	ldr r2, [r5]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	add r1, r2, r1
	add r1, #0x27
	ldrb r1, [r1]
	bl ov08_02223CD4
	ldr r1, [r5]
	mov r2, #0
	strh r0, [r1, #0x1c]
	ldr r0, _02222B84 ; =0x0000114D
	ldrb r1, [r5, r0]
	ldr r0, [r5]
	strb r1, [r0, #0x1e]
	add r0, r5, #0
	mov r1, #0xf
	bl ov08_02224938
	add r0, r5, #0
	bl ov08_02222B8C
	pop {r3, r4, r5, pc}
_02222B5E:
	ldr r0, _02222B80 ; =0x000005DD
	bl PlaySE
	ldr r0, _02222B88 ; =0x0000114B
	mov r1, #5
	strb r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov08_02224938
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_02222B78:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02222B7C: .word ov08_02225ADC
_02222B80: .word 0x000005DD
_02222B84: .word 0x0000114D
_02222B88: .word 0x0000114B
	thumb_func_end ov08_02222AF0

	thumb_func_start ov08_02222B8C
ov08_02222B8C: ; 0x02222B8C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02222D6C ; =0x0000114D
	add r5, r0, #0
	ldrb r1, [r5, r1]
	ldr r4, [r5]
	cmp r1, #3
	beq _02222B9C
	b _02222CB6
_02222B9C:
	bl ov08_02223374
	add r7, r0, #0
	ldrh r0, [r4, #0x1c]
	ldr r2, [r4, #0xc]
	mov r1, #7
	bl GetItemAttr
	add r6, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02222C0E
	ldrh r0, [r4, #0x1c]
	cmp r0, #0x37
	beq _02222C0E
	cmp r6, #3
	beq _02222C0E
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	add r2, r7, #0
	bl ov12_0223A880
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	mov r1, #0x2e
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r0, [r5, #0x14]
	ldr r2, _02222D70 ; =MOVE_EMBARGO
	mov r1, #1
	bl BufferMoveName
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 ; =0x0000114B
	mov r1, #8
	strb r1, [r5, r0]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222C0E:
	ldrh r0, [r4, #0x1c]
	add r2, r7, #0
	mov r3, #0
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl ov12_0223AC20
	cmp r0, #1
	bne _02222C34
	ldr r2, _02222D6C ; =0x0000114D
	ldrh r1, [r4, #0x1c]
	ldrb r2, [r5, r2]
	ldr r0, [r4]
	ldr r3, [r4, #0xc]
	bl ov08_02223390
	mov r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
_02222C34:
	cmp r6, #3
	bne _02222C9C
	ldr r0, [r4]
	bl ov12_0223A7E0
	mov r1, #1
	tst r0, r1
	bne _02222C56
	ldr r2, _02222D6C ; =0x0000114D
	ldrh r1, [r4, #0x1c]
	ldrb r2, [r5, r2]
	ldr r0, [r4]
	ldr r3, [r4, #0xc]
	bl ov08_02223390
	mov r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
_02222C56:
	ldr r3, [r4, #0xc]
	add r0, r1, #0
	mov r1, #0x1b
	mov r2, #0x28
	bl NewMsgDataFromNarc
	mov r1, #0x25
	add r7, r0, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r5, #0x14]
	ldr r2, [r4, #4]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 ; =0x0000114B
	mov r1, #8
	strb r1, [r5, r0]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222C9C:
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	mov r1, #0x22
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 ; =0x0000114B
	mov r1, #8
	strb r1, [r5, r0]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222CB6:
	cmp r1, #2
	bne _02222D66
	add r0, r4, #0
	add r0, #0x22
	ldrb r0, [r0]
	cmp r0, #1
	bne _02222CDE
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	mov r1, #0x2c
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 ; =0x0000114B
	mov r1, #8
	strb r1, [r5, r0]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222CDE:
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	bne _02222D02
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	mov r1, #0x2f
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 ; =0x0000114B
	mov r1, #8
	strb r1, [r5, r0]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222D02:
	add r0, r4, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _02222D26
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	mov r1, #0x30
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 ; =0x0000114B
	mov r1, #8
	strb r1, [r5, r0]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222D26:
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl ov12_0223A7F4
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223AB3C
	add r4, r0, #0
	add r0, r6, #0
	bl GetPartyCount
	cmp r0, #6
	bne _02222D66
	add r0, r4, #0
	bl PCStorage_FindFirstBoxWithEmptySlot
	cmp r0, #0x12
	bne _02222D66
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	mov r1, #0x2d
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 ; =0x0000114B
	mov r1, #8
	strb r1, [r5, r0]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222D66:
	mov r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222D6C: .word 0x0000114D
_02222D70: .word MOVE_EMBARGO
_02222D74: .word 0x0000114B
	thumb_func_end ov08_02222B8C

	thumb_func_start ov08_02222D78
ov08_02222D78: ; 0x02222D78
	push {r3, lr}
	mov r1, #0
	bl ov08_02223300
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov08_02222D78

	thumb_func_start ov08_02222D84
ov08_02222D84: ; 0x02222D84
	push {r3, lr}
	mov r1, #1
	bl ov08_02223300
	mov r0, #2
	pop {r3, pc}
	thumb_func_end ov08_02222D84

	thumb_func_start ov08_02222D90
ov08_02222D90: ; 0x02222D90
	push {r3, lr}
	mov r1, #2
	bl ov08_02223300
	mov r0, #3
	pop {r3, pc}
	thumb_func_end ov08_02222D90

	thumb_func_start ov08_02222D9C
ov08_02222D9C: ; 0x02222D9C
	push {r3, lr}
	add r0, #0x1c
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov08_02222D9C

	thumb_func_start ov08_02222DAC
ov08_02222DAC: ; 0x02222DAC
	push {r3, lr}
	add r0, #0x32
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02222DBE
	mov r0, #0xa
	pop {r3, pc}
_02222DBE:
	mov r0, #9
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov08_02222DAC

	thumb_func_start ov08_02222DC4
ov08_02222DC4: ; 0x02222DC4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02222DE4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02222DDA
	bl System_GetTouchNew
	cmp r0, #1
	bne _02222DE0
_02222DDA:
	ldr r0, _02222DE8 ; =0x0000114B
	ldrb r0, [r4, r0]
	pop {r4, pc}
_02222DE0:
	mov r0, #0xa
	pop {r4, pc}
	.balign 4, 0
_02222DE4: .word gSystem
_02222DE8: .word 0x0000114B
	thumb_func_end ov08_02222DC4

	thumb_func_start ov08_02222DEC
ov08_02222DEC: ; 0x02222DEC
	ldr r1, _02222E00 ; =0x0000113E
	ldrb r2, [r0, r1]
	cmp r2, #2
	bne _02222DFA
	add r1, #0xd
	ldrb r0, [r0, r1]
	bx lr
_02222DFA:
	mov r0, #0xb
	bx lr
	nop
_02222E00: .word 0x0000113E
	thumb_func_end ov08_02222DEC

	thumb_func_start ov08_02222E04
ov08_02222E04: ; 0x02222E04
	push {lr}
	sub sp, #0xc
	mov r2, #0
	str r2, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r1, #0xa
	add r3, r1, #0
	ldr r0, [r0, #8]
	ldr r2, _02222E28 ; =0x0000FFFF
	sub r3, #0x12
	bl sub_02003370
	mov r0, #0xe
	add sp, #0xc
	pop {pc}
	nop
_02222E28: .word 0x0000FFFF
	thumb_func_end ov08_02222E04

	thumb_func_start ov08_02222E2C
ov08_02222E2C: ; 0x02222E2C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #8]
	bl sub_02003B44
	cmp r0, #0
	beq _02222E40
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02222E40:
	add r0, r5, #0
	bl ov08_02223F34
	add r0, r5, #0
	bl ov08_02223464
	add r0, r5, #0
	bl ov08_02223228
	ldr r0, [r5, #4]
	bl ov08_022230CC
	ldr r0, [r5, #0x34]
	bl ov08_02224B8C
	ldr r1, [r5]
	add r1, #0x25
	strb r0, [r1]
	ldr r0, [r5, #0x34]
	bl ov08_02224B7C
	mov r0, #4
	bl FontID_Release
	ldr r1, [r5]
	ldrh r0, [r1, #0x1c]
	cmp r0, #0
	beq _02222EAC
	ldr r0, [r1]
	bl ov12_0223AA84
	add r6, r0, #0
	mov r4, #0
_02222E82:
	ldr r3, [r5]
	add r0, r6, #0
	add r2, r3, r4
	add r3, r3, r4
	add r2, #0x27
	add r3, #0x2c
	ldrb r2, [r2]
	ldrb r3, [r3]
	add r1, r4, #0
	bl BagCursor_Battle_PocketSetPosition
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _02222E82
	ldr r1, _02222EC0 ; =0x0000114D
	add r0, r6, #0
	ldrb r1, [r5, r1]
	bl BagCursor_Battle_SetPocket
_02222EAC:
	ldr r0, [r5]
	mov r1, #1
	add r0, #0x26
	strb r1, [r0]
	add r0, r7, #0
	bl sub_02007234
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222EC0: .word 0x0000114D
	thumb_func_end ov08_02222E2C

	thumb_func_start ov08_02222EC4
ov08_02222EC4: ; 0x02222EC4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_02003B44
	cmp r0, #0
	beq _02222ED6
	mov r0, #0xc
	pop {r4, pc}
_02222ED6:
	ldr r0, _02222FF0 ; =0x00001159
	ldrb r0, [r4, r0]
	cmp r0, #4
	bls _02222EE0
	b _02222FEA
_02222EE0:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02222EEC: ; jump table
	.short _02222EF6 - _02222EEC - 2 ; case 0
	.short _02222F38 - _02222EEC - 2 ; case 1
	.short _02222F48 - _02222EEC - 2 ; case 2
	.short _02222F92 - _02222EEC - 2 ; case 3
	.short _02222FA2 - _02222EEC - 2 ; case 4
_02222EF6:
	ldr r0, [r4, #0x38]
	bl ov12_0226BD50
	cmp r0, #1
	bne _02222F2E
	ldr r0, _02222FF4 ; =0x000005DD
	bl PlaySE
	ldr r0, _02222FF8 ; =0x0000114D
	mov r1, #2
	strb r1, [r4, r0]
	mov r2, #0xc
	sub r0, r0, #2
	strb r2, [r4, r0]
	add r0, r4, #0
	mov r2, #0
	bl ov08_02224938
	ldr r0, _02222FFC ; =0x0000115A
	mov r1, #0
	strb r1, [r4, r0]
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #0xb
	pop {r4, pc}
_02222F2E:
	ldr r0, _02222FFC ; =0x0000115A
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02222FEA
_02222F38:
	add r0, r4, #0
	bl ov08_02222D84
	ldr r0, _02222FF0 ; =0x00001159
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02222FEA
_02222F48:
	ldr r0, [r4, #0x38]
	bl ov12_0226BD50
	cmp r0, #1
	bne _02222F88
	ldr r0, _02222FF4 ; =0x000005DD
	bl PlaySE
	ldr r0, _02222FF8 ; =0x0000114D
	ldr r3, [r4]
	ldrb r1, [r4, r0]
	mov r2, #0
	sub r0, r0, #2
	add r1, r3, r1
	add r1, #0x27
	strb r2, [r1]
	mov r1, #0xc
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #6
	bl ov08_02224938
	ldr r0, _02222FFC ; =0x0000115A
	mov r1, #0
	strb r1, [r4, r0]
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #0xb
	pop {r4, pc}
_02222F88:
	ldr r0, _02222FFC ; =0x0000115A
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02222FEA
_02222F92:
	add r0, r4, #0
	bl ov08_02222D90
	ldr r0, _02222FF0 ; =0x00001159
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02222FEA
_02222FA2:
	ldr r0, [r4, #0x38]
	bl ov12_0226BD50
	cmp r0, #1
	bne _02222FE2
	ldr r0, _02222FF4 ; =0x000005DD
	bl PlaySE
	ldr r1, _02222FF8 ; =0x0000114D
	ldr r2, [r4]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	add r1, r2, r1
	add r1, #0x27
	ldrb r1, [r1]
	bl ov08_02223CD4
	ldr r1, [r4]
	mov r2, #0
	strh r0, [r1, #0x1c]
	ldr r0, _02222FF8 ; =0x0000114D
	ldrb r1, [r4, r0]
	ldr r0, [r4]
	strb r1, [r0, #0x1e]
	add r0, r4, #0
	mov r1, #0xf
	bl ov08_02224938
	add r0, r4, #0
	bl ov08_02222B8C
	pop {r4, pc}
_02222FE2:
	ldr r0, _02222FFC ; =0x0000115A
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
_02222FEA:
	mov r0, #0xc
	pop {r4, pc}
	nop
_02222FF0: .word 0x00001159
_02222FF4: .word 0x000005DD
_02222FF8: .word 0x0000114D
_02222FFC: .word 0x0000115A
	thumb_func_end ov08_02222EC4

	thumb_func_start ov08_02223000
ov08_02223000: ; 0x02223000
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _022230BC ; =ov08_02225AE8
	add r3, sp, #0x54
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	mov r1, #1
	bl SetScreenModeAndDisable
	ldr r5, _022230C0 ; =ov08_02225B30
	add r3, sp, #0x38
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _022230C4 ; =ov08_02225B14
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #4]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022230C8 ; =ov08_02225AF8
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #4]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r3, [r4]
	mov r0, #5
	ldr r3, [r3, #0xc]
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #4
	ldr r3, [r3, #0xc]
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r0, [r4, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x64
	pop {r4, r5, pc}
	.balign 4, 0
_022230BC: .word ov08_02225AE8
_022230C0: .word ov08_02225B30
_022230C4: .word ov08_02225B14
_022230C8: .word ov08_02225AF8
	thumb_func_end ov08_02223000

	thumb_func_start ov08_022230CC
ov08_022230CC: ; 0x022230CC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x17
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_022230CC

	thumb_func_start ov08_022230F4
ov08_022230F4: ; 0x022230F4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x4d
	ldr r1, [r1, #0xc]
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5]
	mov r3, #6
	ldr r1, [r1, #0xc]
	add r4, r0, #0
	str r1, [sp, #0xc]
	ldr r2, [r5, #4]
	mov r1, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5]
	mov r3, #6
	ldr r0, [r0, #0xc]
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r2, [r5]
	add r0, r4, #0
	ldr r2, [r2, #0xc]
	mov r1, #1
	bl NARC_AllocAndReadWholeMember
	add r1, sp, #0x10
	add r6, r0, #0
	bl NNS_G2dGetUnpackedScreenData
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r1, #0xc
	bl ov08_02224254
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r3, [r5]
	ldr r0, [r5, #8]
	ldr r3, [r3, #0xc]
	mov r1, #0x4d
	mov r2, #3
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xf0
	str r0, [sp, #8]
	ldr r3, [r5]
	ldr r0, [r5, #8]
	ldr r3, [r3, #0xc]
	mov r1, #0x10
	mov r2, #8
	bl PaletteData_LoadNarc
	ldr r0, [r5]
	ldr r0, [r0]
	bl ov12_0223B708
	add r4, r0, #0
	bl sub_0200E63C
	add r1, r0, #0
	ldr r0, _022231E4 ; =0x000003E2
	mov r3, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	mov r0, #0x26
	bl GfGfxLoader_LoadCharData
	add r0, r4, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	ldr r3, [r5]
	ldr r0, [r5, #8]
	ldr r3, [r3, #0xc]
	mov r1, #0x26
	bl PaletteData_LoadNarc
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022231E4: .word 0x000003E2
	thumb_func_end ov08_022230F4

	thumb_func_start ov08_022231E8
ov08_022231E8: ; 0x022231E8
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4]
	mov r0, #0
	ldr r3, [r3, #0xc]
	mov r1, #0x1b
	mov r2, #5
	bl NewMsgDataFromNarc
	str r0, [r4, #0x10]
	ldr r3, [r4]
	mov r0, #0xf
	ldr r3, [r3, #0xc]
	mov r1, #0xe
	mov r2, #0
	bl MessagePrinter_new
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl ScrStrBufs_new
	str r0, [r4, #0x14]
	ldr r1, [r4]
	mov r0, #2
	ldr r1, [r1, #0xc]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [r4, #0x18]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_022231E8

	thumb_func_start ov08_02223228
ov08_02223228: ; 0x02223228
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl DestroyMsgData
	ldr r0, [r4, #0xc]
	bl MessagePrinter_delete
	ldr r0, [r4, #0x14]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x18]
	bl String_dtor
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_02223228

	thumb_func_start ov08_02223248
ov08_02223248: ; 0x02223248
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _0222325A
	cmp r1, #1
	beq _02223274
	cmp r1, #2
	beq _02223290
	pop {r4, pc}
_0222325A:
	mov r2, #0
	ldr r0, [r4, #4]
	mov r1, #6
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4, #4]
	mov r1, #6
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	pop {r4, pc}
_02223274:
	mov r1, #6
	add r3, r1, #0
	ldr r0, [r4, #4]
	mov r2, #0
	add r3, #0xfa
	bl ScheduleSetBgPosText
	ldr r0, [r4, #4]
	mov r1, #6
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	pop {r4, pc}
_02223290:
	mov r2, #0
	ldr r0, [r4, #4]
	mov r1, #6
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #4]
	mov r1, #6
	add r3, #0xfd
	bl ScheduleSetBgPosText
	pop {r4, pc}
	thumb_func_end ov08_02223248

	thumb_func_start ov08_022232AC
ov08_022232AC: ; 0x022232AC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	cmp r1, #2
	bne _022232F6
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _022232FC ; =0x0000114D
	mov r1, #6
	ldrb r0, [r4, r0]
	mov r2, #2
	mov r3, #0x23
	add r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	bl BgTilemapRectChangePalette
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	ldr r0, _022232FC ; =0x0000114D
	mov r1, #6
	ldrb r0, [r4, r0]
	mov r2, #2
	mov r3, #0x28
	add r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	bl BgTilemapRectChangePalette
_022232F6:
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_022232FC: .word 0x0000114D
	thumb_func_end ov08_022232AC

	thumb_func_start ov08_02223300
ov08_02223300: ; 0x02223300
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov08_022232AC
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02223248
	ldr r0, [r5, #4]
	mov r1, #4
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	ldr r0, [r5, #4]
	mov r1, #5
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	add r0, r5, #0
	bl ov08_02223454
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_022233DC
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02223480
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02224A50
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02224134
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_0222421C
	ldr r1, _02223364 ; =0x0000114C
	add r0, r5, #0
	strb r4, [r5, r1]
	ldrb r1, [r5, r1]
	bl ov08_02223F94
	pop {r3, r4, r5, pc}
	nop
_02223364: .word 0x0000114C
	thumb_func_end ov08_02223300

	thumb_func_start ov08_02223368
ov08_02223368: ; 0x02223368
	ldr r3, _02223370 ; =sub_02025224
	add r0, r1, #0
	bx r3
	nop
_02223370: .word sub_02025224
	thumb_func_end ov08_02223368

	thumb_func_start ov08_02223374
ov08_02223374: ; 0x02223374
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	bl ov12_0223A7E4
	add r1, r0, #0
	ldr r0, [r5]
	ldr r3, [r4, #0x10]
	ldr r0, [r0]
	mov r2, #2
	bl ov12_022581D4
	pop {r3, r4, r5, pc}
	thumb_func_end ov08_02223374

	thumb_func_start ov08_02223390
ov08_02223390: ; 0x02223390
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r3, #0
	add r6, r0, #0
	add r7, r2, #0
	bl ov12_0223AA80
	add r1, r5, #0
	mov r2, #1
	add r3, r4, #0
	bl Bag_TakeItem
	add r0, r6, #0
	bl ov12_0223AA84
	add r1, r5, #0
	add r2, r7, #0
	bl BagCursor_Battle_SetLastUsedItem
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_02223390

	thumb_func_start ov08_022233B8
ov08_022233B8: ; 0x022233B8
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	ldr r0, [r4, #4]
	ldr r2, _022233D4 ; =ov08_02225B90
	add r1, #0x1c
	bl AddWindow
	ldr r1, _022233D8 ; =0x0000114C
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_022233DC
	pop {r4, pc}
	.balign 4, 0
_022233D4: .word ov08_02225B90
_022233D8: .word 0x0000114C
	thumb_func_end ov08_022233B8

	thumb_func_start ov08_022233DC
ov08_022233DC: ; 0x022233DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r1, #0
	beq _022233EE
	cmp r1, #1
	beq _022233F8
	cmp r1, #2
	beq _02223402
	b _0222340A
_022233EE:
	mov r1, #5
	add r0, #0x30
	ldr r6, _02223448 ; =ov08_02225BB8
	strb r1, [r0]
	b _0222340A
_022233F8:
	mov r1, #0x1a
	add r0, #0x30
	ldr r6, _0222344C ; =ov08_02225C10
	strb r1, [r0]
	b _0222340A
_02223402:
	ldr r6, _02223450 ; =ov08_02225B98
	mov r1, #4
	add r0, #0x30
	strb r1, [r0]
_0222340A:
	add r1, r5, #0
	ldr r0, [r5]
	add r1, #0x30
	ldrb r1, [r1]
	ldr r0, [r0, #0xc]
	bl AllocWindows
	str r0, [r5, #0x2c]
	add r0, r5, #0
	add r0, #0x30
	ldrb r0, [r0]
	mov r4, #0
	cmp r0, #0
	bls _02223446
_02223426:
	ldr r2, [r5, #0x2c]
	lsl r1, r4, #4
	add r1, r2, r1
	lsl r2, r4, #3
	ldr r0, [r5, #4]
	add r2, r6, r2
	bl AddWindow
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r0, #0x30
	ldrb r0, [r0]
	cmp r4, r0
	blo _02223426
_02223446:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02223448: .word ov08_02225BB8
_0222344C: .word ov08_02225C10
_02223450: .word ov08_02225B98
	thumb_func_end ov08_022233DC

	thumb_func_start ov08_02223454
ov08_02223454: ; 0x02223454
	add r1, r0, #0
	ldr r0, [r1, #0x2c]
	add r1, #0x30
	ldr r3, _02223460 ; =WindowArray_dtor
	ldrb r1, [r1]
	bx r3
	.balign 4, 0
_02223460: .word WindowArray_dtor
	thumb_func_end ov08_02223454

	thumb_func_start ov08_02223464
ov08_02223464: ; 0x02223464
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x30
	ldrb r1, [r1]
	ldr r0, [r4, #0x2c]
	bl WindowArray_dtor
	add r4, #0x1c
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_02223464

	thumb_func_start ov08_02223480
ov08_02223480: ; 0x02223480
	push {r3, lr}
	cmp r1, #0
	beq _02223490
	cmp r1, #1
	beq _02223496
	cmp r1, #2
	beq _0222349C
	pop {r3, pc}
_02223490:
	bl ov08_022234FC
	pop {r3, pc}
_02223496:
	bl ov08_022239B4
	pop {r3, pc}
_0222349C:
	bl ov08_02223AA0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov08_02223480

	thumb_func_start ov08_022234A4
ov08_022234A4: ; 0x022234A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r5, [r0, #0x2c]
	lsl r4, r1, #4
	ldr r0, [r0, #0x10]
	add r1, r2, #0
	add r6, r3, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	mov r2, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	add r0, r5, r4
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r7
	lsr r3, r0, #1
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r6, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, r4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov08_022234A4

	thumb_func_start ov08_022234FC
ov08_022234FC: ; 0x022234FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
	add r7, r6, #0
_02223508:
	ldr r0, [r5, #0x2c]
	add r1, r7, #0
	add r0, r0, r4
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #5
	blo _02223508
	mov r0, #7
	str r0, [sp]
	ldr r0, _022235D0 ; =0x00030201
	mov r1, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #4
	bl ov08_022234A4
	mov r0, #0x17
	str r0, [sp]
	ldr r0, _022235D0 ; =0x00030201
	mov r1, #0
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #1
	mov r3, #4
	bl ov08_022234A4
	mov r0, #7
	str r0, [sp]
	ldr r0, _022235D0 ; =0x00030201
	mov r1, #1
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #2
	mov r3, #4
	bl ov08_022234A4
	mov r0, #0x17
	str r0, [sp]
	ldr r0, _022235D0 ; =0x00030201
	mov r1, #1
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #3
	mov r3, #4
	bl ov08_022234A4
	mov r2, #7
	ldr r0, _022235D0 ; =0x00030201
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #2
	mov r3, #4
	bl ov08_022234A4
	mov r0, #7
	str r0, [sp]
	ldr r0, _022235D0 ; =0x00030201
	mov r1, #3
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #6
	mov r3, #4
	bl ov08_022234A4
	ldr r0, [r5]
	ldrh r0, [r0, #0x20]
	cmp r0, #0
	beq _022235CC
	ldr r0, [r5, #0x10]
	mov r1, #8
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #5
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022235D0 ; =0x00030201
	mov r3, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	mov r1, #4
	add r0, #0x40
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	ldr r0, [r5, #0x2c]
	add r0, #0x40
	bl ScheduleWindowCopyToVram
_022235CC:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022235D0: .word 0x00030201
	thumb_func_end ov08_022234FC

	thumb_func_start ov08_022235D4
ov08_022235D4: ; 0x022235D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r4, [r5, #0x2c]
	lsl r6, r3, #4
	add r7, r1, #0
	add r0, r4, r6
	mov r1, #0
	str r2, [sp, #0x10]
	bl FillWindowPixelBuffer
	ldr r0, _02223670 ; =0x0000114D
	lsl r7, r7, #2
	ldrb r1, [r5, r0]
	mov r0, #0x90
	mul r0, r1
	add r0, r5, r0
	add r0, r0, r7
	ldrh r0, [r0, #0x3c]
	cmp r0, #0
	beq _02223666
	ldr r1, [sp, #0x10]
	ldr r0, [r5, #0x10]
	lsl r2, r1, #3
	ldr r1, _02223674 ; =ov08_02225BE0
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	ldr r2, _02223670 ; =0x0000114D
	str r0, [sp, #0x14]
	ldrb r3, [r5, r2]
	mov r2, #0x90
	ldr r0, [r5, #0x14]
	mul r2, r3
	add r2, r5, r2
	add r2, r2, r7
	ldrh r2, [r2, #0x3c]
	mov r1, #0
	bl BufferItemName
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r2, [sp, #0x14]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x30]
	ldr r1, [r5, #0x18]
	mov r2, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	add r0, r4, r6
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r7
	lsr r3, r0, #1
	mov r0, #7
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r4, r6
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
_02223666:
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223670: .word 0x0000114D
_02223674: .word ov08_02225BE0
	thumb_func_end ov08_022235D4

	thumb_func_start ov08_02223678
ov08_02223678: ; 0x02223678
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r4, [r5, #0x2c]
	lsl r7, r3, #4
	add r6, r1, #0
	add r0, r4, r7
	mov r1, #0
	str r2, [sp, #0x10]
	bl FillWindowPixelBuffer
	ldr r0, _02223704 ; =0x0000114D
	lsl r6, r6, #2
	ldrb r1, [r5, r0]
	mov r0, #0x90
	mul r0, r1
	add r0, r5, r0
	add r0, r0, r6
	ldrh r0, [r0, #0x3e]
	cmp r0, #0
	beq _022236FA
	ldr r1, [sp, #0x10]
	ldr r0, [r5, #0x10]
	lsl r2, r1, #3
	ldr r1, _02223708 ; =ov08_02225BE4
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	mov r1, #0
	str r0, [sp, #0x14]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, _02223704 ; =0x0000114D
	ldr r0, [r5, #0x14]
	ldrb r3, [r5, r2]
	mov r2, #0x90
	mul r2, r3
	add r2, r5, r2
	add r2, r2, r6
	ldrh r2, [r2, #0x3e]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r2, [sp, #0x14]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x34]
	mov r3, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x30]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r4, r7
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
_022236FA:
	add r0, r4, r7
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223704: .word 0x0000114D
_02223708: .word ov08_02225BE4
	thumb_func_end ov08_02223678

	thumb_func_start ov08_0222370C
ov08_0222370C: ; 0x0222370C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, _02223770 ; =0x0000114D
	add r5, r1, #0
	ldrb r0, [r6, r0]
	ldr r1, [r6]
	add r0, r1, r0
	add r0, #0x2c
	ldrb r1, [r0]
	mov r0, #6
	mul r0, r1
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _02223734
	mov r4, #0
	b _02223736
_02223734:
	mov r4, #0xc
_02223736:
	mov r0, #4
	str r0, [sp]
	ldr r0, _02223774 ; =0x00030201
	ldr r1, [sp, #0xc]
	lsl r7, r5, #1
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, r1
	add r2, r5, #0
	add r3, r4, r7
	bl ov08_022235D4
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02223778 ; =0x00010200
	ldr r1, [sp, #0xc]
	add r3, r4, #1
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, r1
	add r2, r5, #0
	add r3, r3, r7
	bl ov08_02223678
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223770: .word 0x0000114D
_02223774: .word 0x00030201
_02223778: .word 0x00010200
	thumb_func_end ov08_0222370C

	thumb_func_start ov08_0222377C
ov08_0222377C: ; 0x0222377C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x13
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	mov r1, #5
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r5, #0
_0222379E:
	add r0, r4, #0
	add r1, r5, #0
	bl ov08_0222370C
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #6
	blo _0222379E
	add r0, r4, #0
	add r0, #0x31
	ldrb r1, [r0]
	mov r0, #1
	add r4, #0x31
	eor r0, r1
	strb r0, [r4]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov08_0222377C

	thumb_func_start ov08_022237C4
ov08_022237C4: ; 0x022237C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x19
	ldr r1, [r5, #0x2c]
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x10]
	mov r1, #0x1c
	ldr r4, [r5, #0x2c]
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	mov r0, #0
	ldr r1, [sp, #0x10]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, r0, r7
	lsr r6, r0, #1
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022238EC ; =0x00010200
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	mov r0, #0x19
	lsl r0, r0, #4
	mov r1, #0
	add r0, r4, r0
	add r3, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	ldr r0, [r5, #0x10]
	mov r1, #0x1d
	bl NewString_ReadMsgData
	mov r1, #0
	str r0, [sp, #0x14]
	ldr r3, _022238F0 ; =0x0000114D
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, _022238F0 ; =0x0000114D
	add r3, r3, #7
	ldrb r2, [r5, r2]
	ldr r0, [r5, #0x14]
	add r2, r5, r2
	ldrb r2, [r2, r3]
	mov r3, #2
	add r2, r2, #1
	bl BufferIntegerAsString
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r2, [sp, #0x14]
	bl StringExpandPlaceholders
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022238EC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r2, [r5, #0x18]
	add r0, r4, r0
	add r3, r6, r7
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
	ldr r0, [r5, #0x10]
	mov r1, #0x1e
	bl NewString_ReadMsgData
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r3, _022238F0 ; =0x0000114D
	ldr r2, [r5]
	ldrb r3, [r5, r3]
	ldr r0, [r5, #0x14]
	add r2, r2, r3
	add r2, #0x2c
	ldrb r2, [r2]
	mov r3, #2
	add r2, r2, #1
	bl BufferIntegerAsString
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [r5, #0x18]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022238EC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r2, [r5, #0x18]
	add r0, r4, r0
	sub r3, r6, r3
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022238EC: .word 0x00010200
_022238F0: .word 0x0000114D
	thumb_func_end ov08_022237C4

	thumb_func_start ov08_022238F4
ov08_022238F4: ; 0x022238F4
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #6
	ldr r1, [r4, #0x2c]
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _022239AC ; =0x0000114D
	ldrb r0, [r4, r0]
	cmp r0, #3
	bhi _022239A8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222391C: ; jump table
	.short _02223924 - _0222391C - 2 ; case 0
	.short _02223950 - _0222391C - 2 ; case 1
	.short _0222397C - _0222391C - 2 ; case 2
	.short _02223994 - _0222391C - 2 ; case 3
_02223924:
	mov r0, #4
	str r0, [sp]
	ldr r0, _022239B0 ; =0x00010200
	mov r1, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x16
	mov r3, #0
	bl ov08_022234A4
	mov r0, #0x14
	str r0, [sp]
	ldr r0, _022239B0 ; =0x00010200
	mov r1, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x17
	mov r3, #0
	bl ov08_022234A4
	add sp, #8
	pop {r4, pc}
_02223950:
	mov r0, #4
	str r0, [sp]
	ldr r0, _022239B0 ; =0x00010200
	mov r1, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0
	bl ov08_022234A4
	mov r0, #0x14
	str r0, [sp]
	ldr r0, _022239B0 ; =0x00010200
	mov r1, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x19
	mov r3, #0
	bl ov08_022234A4
	add sp, #8
	pop {r4, pc}
_0222397C:
	mov r0, #0xc
	str r0, [sp]
	ldr r0, _022239B0 ; =0x00010200
	mov r1, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1a
	mov r3, #0
	bl ov08_022234A4
	add sp, #8
	pop {r4, pc}
_02223994:
	mov r0, #0xc
	str r0, [sp]
	ldr r0, _022239B0 ; =0x00010200
	mov r1, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1b
	mov r3, #0
	bl ov08_022234A4
_022239A8:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_022239AC: .word 0x0000114D
_022239B0: .word 0x00010200
	thumb_func_end ov08_022238F4

	thumb_func_start ov08_022239B4
ov08_022239B4: ; 0x022239B4
	push {r4, lr}
	add r4, r0, #0
	bl ov08_0222377C
	add r0, r4, #0
	bl ov08_022238F4
	add r0, r4, #0
	bl ov08_022237C4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_022239B4

	thumb_func_start ov08_022239CC
ov08_022239CC: ; 0x022239CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r6, r1, #0
	mov r1, #9
	ldr r4, [r5, #0x2c]
	bl NewString_ReadMsgData
	ldr r2, _02223A34 ; =0x0000114D
	add r7, r0, #0
	ldrb r3, [r5, r2]
	mov r2, #0x90
	ldr r0, [r5, #0x14]
	mul r2, r3
	add r2, r5, r2
	lsl r3, r6, #2
	add r2, r2, r3
	ldrh r2, [r2, #0x3c]
	mov r1, #0
	bl BufferItemName
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	add r2, r7, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02223A38 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223A34: .word 0x0000114D
_02223A38: .word 0x00010200
	thumb_func_end ov08_022239CC

	thumb_func_start ov08_02223A3C
ov08_02223A3C: ; 0x02223A3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	ldr r1, [r5]
	ldr r4, [r5, #0x2c]
	ldr r1, [r1, #0xc]
	mov r0, #0x82
	add r4, #0x20
	bl String_ctor
	ldr r1, _02223A98 ; =0x0000114D
	add r7, r0, #0
	ldrb r2, [r5, r1]
	mov r1, #0x90
	mul r1, r2
	add r2, r5, r1
	lsl r1, r6, #2
	add r1, r2, r1
	ldr r2, [r5]
	ldrh r1, [r1, #0x3c]
	ldr r2, [r2, #0xc]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl GetItemDescIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02223A9C ; =0x00010200
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r3, #4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223A98: .word 0x0000114D
_02223A9C: .word 0x00010200
	thumb_func_end ov08_02223A3C

	thumb_func_start ov08_02223AA0
ov08_02223AA0: ; 0x02223AA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
	add r7, r6, #0
_02223AAC:
	ldr r0, [r5, #0x2c]
	add r1, r7, #0
	add r0, r0, r4
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #4
	blo _02223AAC
	ldr r0, _02223B14 ; =0x0000114D
	ldr r1, [r5]
	ldrb r2, [r5, r0]
	add r0, r1, r2
	add r0, #0x27
	ldrb r4, [r0]
	add r0, r1, r2
	add r0, #0x2c
	ldrb r1, [r0]
	mov r0, #6
	add r6, r1, #0
	mul r6, r0
	add r0, r5, #0
	add r1, r4, r6
	bl ov08_022239CC
	mov r2, #0
	str r2, [sp]
	ldr r0, _02223B18 ; =0x00010200
	str r2, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, r6
	mov r3, #1
	bl ov08_02223678
	add r0, r5, #0
	add r1, r4, r6
	bl ov08_02223A3C
	mov r0, #5
	str r0, [sp]
	ldr r0, _02223B1C ; =0x00030201
	mov r1, #3
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0x1f
	mov r3, #4
	bl ov08_022234A4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02223B14: .word 0x0000114D
_02223B18: .word 0x00010200
_02223B1C: .word 0x00030201
	thumb_func_end ov08_02223AA0

	thumb_func_start ov08_02223B20
ov08_02223B20: ; 0x02223B20
	push {r4, lr}
	ldr r2, _02223B44 ; =0x000003E2
	add r4, r0, #0
	add r0, #0x1c
	mov r1, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	add r0, r4, #0
	add r0, #0x1c
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ov08_02223B48
	pop {r4, pc}
	nop
_02223B44: .word 0x000003E2
	thumb_func_end ov08_02223B20

	thumb_func_start ov08_02223B48
ov08_02223B48: ; 0x02223B48
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	ldr r0, [r4]
	ldr r0, [r0]
	bl ov12_0223B718
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r4, #0
	ldr r2, [r4, #0x18]
	add r0, #0x1c
	mov r1, #1
	bl AddTextPrinterParameterized
	add r4, #0x32
	strb r0, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov08_02223B48

	thumb_func_start ov08_02223B78
ov08_02223B78: ; 0x02223B78
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4]
	ldrh r1, [r3, #0x20]
	cmp r1, #0
	bne _02223B88
	mov r0, #0
	pop {r4, pc}
_02223B88:
	ldr r0, [r3, #8]
	ldr r3, [r3, #0xc]
	mov r2, #1
	bl Bag_HasItem
	cmp r0, #0
	bne _02223BA2
	ldr r1, [r4]
	mov r0, #0
	strh r0, [r1, #0x20]
	ldr r1, [r4]
	strb r0, [r1, #0x1f]
	pop {r4, pc}
_02223BA2:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_02223B78

	thumb_func_start ov08_02223BA8
ov08_02223BA8: ; 0x02223BA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02223BF0 ; =0x0000114D
	ldr r6, [r5]
	ldrb r7, [r5, r0]
	mov r0, #0x90
	ldrh r2, [r6, #0x20]
	mul r0, r7
	mov r4, #0
	add r1, r5, r0
_02223BBC:
	ldrh r0, [r1, #0x3c]
	cmp r2, r0
	bne _02223BE6
	add r0, r4, #0
	mov r1, #6
	bl _u32_div_f
	add r0, r6, r7
	add r0, #0x27
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #6
	bl _u32_div_f
	ldr r1, _02223BF0 ; =0x0000114D
	ldr r2, [r5]
	ldrb r1, [r5, r1]
	add r1, r2, r1
	add r1, #0x2c
	strb r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
_02223BE6:
	add r4, r4, #1
	add r1, r1, #4
	cmp r4, #0x24
	blo _02223BBC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223BF0: .word 0x0000114D
	thumb_func_end ov08_02223BA8

	thumb_func_start ov08_02223BF4
ov08_02223BF4: ; 0x02223BF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
_02223BFE:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
_02223C0A:
	ldr r0, [r4]
	ldr r2, [sp]
	ldr r0, [r0, #8]
	lsl r2, r2, #0x10
	ldr r1, [sp, #8]
	lsr r2, r2, #0x10
	bl Bag_GetPocketSlotN
	add r5, r0, #0
	beq _02223C7C
	ldrh r0, [r5]
	cmp r0, #0
	beq _02223C74
	ldrh r1, [r5, #2]
	cmp r1, #0
	beq _02223C74
	ldr r2, [r4]
	mov r1, #0xd
	ldr r2, [r2, #0xc]
	bl GetItemAttr
	add r7, r0, #0
	ldr r1, _02223CC8 ; =ov08_02225CE0
	mov r0, #0
_02223C3A:
	mov r2, #1
	lsl r2, r0
	tst r2, r7
	beq _02223C6C
	ldrb r2, [r1]
	mov r3, #0x90
	add r6, r2, #0
	mul r6, r3
	add r3, r4, r2
	ldr r2, _02223CCC ; =0x0000114F
	ldrb r2, [r3, r2]
	add r3, r4, r6
	lsl r2, r2, #2
	add r2, r2, r3
	ldrh r3, [r5]
	strh r3, [r2, #0x3c]
	ldrh r3, [r5, #2]
	strh r3, [r2, #0x3e]
	ldrb r2, [r1]
	add r6, r4, r2
	ldr r2, _02223CCC ; =0x0000114F
	ldrb r2, [r6, r2]
	add r3, r2, #1
	ldr r2, _02223CCC ; =0x0000114F
	strb r3, [r6, r2]
_02223C6C:
	add r0, r0, #1
	add r1, r1, #1
	cmp r0, #5
	blo _02223C3A
_02223C74:
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	b _02223C0A
_02223C7C:
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #8
	blo _02223BFE
	mov r5, #0
	add r7, r5, #0
_02223C8A:
	ldr r0, _02223CCC ; =0x0000114F
	add r6, r4, r5
	ldrb r0, [r6, r0]
	cmp r0, #0
	bne _02223C9A
	ldr r0, _02223CD0 ; =0x00001154
	strb r7, [r6, r0]
	b _02223CA6
_02223C9A:
	sub r0, r0, #1
	mov r1, #6
	bl _s32_div_f
	ldr r1, _02223CD0 ; =0x00001154
	strb r0, [r6, r1]
_02223CA6:
	ldr r1, [r4]
	ldr r0, _02223CD0 ; =0x00001154
	add r2, r1, r5
	add r2, #0x2c
	ldrb r0, [r6, r0]
	ldrb r2, [r2]
	cmp r0, r2
	bhs _02223CBC
	add r1, r1, r5
	add r1, #0x2c
	strb r0, [r1]
_02223CBC:
	add r5, r5, #1
	cmp r5, #5
	blo _02223C8A
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02223CC8: .word ov08_02225CE0
_02223CCC: .word 0x0000114F
_02223CD0: .word 0x00001154
	thumb_func_end ov08_02223BF4

	thumb_func_start ov08_02223CD4
ov08_02223CD4: ; 0x02223CD4
	push {r3, r4}
	ldr r2, _02223D04 ; =0x0000114D
	ldr r3, [r0]
	ldrb r2, [r0, r2]
	add r3, r3, r2
	add r3, #0x2c
	ldrb r4, [r3]
	mov r3, #6
	mul r3, r4
	add r1, r1, r3
	lsl r3, r1, #2
	mov r1, #0x90
	mul r1, r2
	add r0, r0, r1
	add r1, r0, r3
	ldrh r0, [r1, #0x3c]
	cmp r0, #0
	beq _02223CFE
	ldrh r1, [r1, #0x3e]
	cmp r1, #0
	bne _02223D00
_02223CFE:
	mov r0, #0
_02223D00:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02223D04: .word 0x0000114D
	thumb_func_end ov08_02223CD4

	thumb_func_start ov08_02223D08
ov08_02223D08: ; 0x02223D08
	push {r4, lr}
	add r4, r0, #0
	bl ov08_02223D34
	add r0, r4, #0
	bl ov08_02223D80
	add r0, r4, #0
	bl ov08_02223F14
	add r0, r4, #0
	bl ov08_022240A8
	add r0, r4, #0
	bl ov08_0222419C
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_02223D08

	thumb_func_start ov08_02223D34
ov08_02223D34: ; 0x02223D34
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02223D7C ; =ov08_02225D14
	add r2, sp, #0
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	ldr r0, [r0]
	bl ov12_0223A8E4
	add r4, r0, #0
	bl sub_0200CF38
	mov r1, #0xc3
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	add r0, r4, #0
	mov r2, #0xc
	bl sub_0200CFF4
	mov r1, #0xc3
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r4, #0
	add r2, sp, #0
	bl sub_0200D3F8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_02223D7C: .word ov08_02225D14
	thumb_func_end ov08_02223D34

	thumb_func_start ov08_02223D80
ov08_02223D80: ; 0x02223D80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	ldr r1, [r6]
	mov r0, #0x12
	ldr r1, [r1, #0xc]
	bl NARC_ctor
	add r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl ov12_0223A8E4
	str r0, [sp, #0x18]
	mov r4, #0
_02223D9E:
	ldr r0, _02223E38 ; =0x0000B4B7
	add r5, r4, r0
	mov r0, #1
	add r1, r0, #0
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0xc3
	str r5, [sp, #8]
	lsl r1, r1, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	add r2, r7, #0
	bl sub_0200D504
	mov r0, #1
	mov r1, #2
	bl GetItemIndexMapping
	str r7, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r3, #0xc3
	str r5, [sp, #0x14]
	lsl r3, r3, #2
	ldr r0, [r6, #8]
	ldr r2, [sp, #0x18]
	ldr r3, [r6, r3]
	mov r1, #3
	bl sub_0200D68C
	add r4, r4, #1
	cmp r4, #6
	blo _02223D9E
	bl GetItemIconCell
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02223E38 ; =0x0000B4B7
	mov r1, #0xc3
	str r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	add r2, r7, #0
	bl sub_0200D6EC
	bl GetItemIconAnim
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02223E38 ; =0x0000B4B7
	mov r1, #0xc3
	str r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	add r2, r7, #0
	bl sub_0200D71C
	add r0, r7, #0
	bl NARC_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02223E38: .word 0x0000B4B7
	thumb_func_end ov08_02223D80

	thumb_func_start ov08_02223E3C
ov08_02223E3C: ; 0x02223E3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	ldr r0, [r0]
	add r4, r2, #0
	bl ov12_0223A8E4
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #0xc3
	str r4, [sp, #4]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r7, #0
	mov r2, #0x12
	bl sub_0200E248
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov08_02223E3C

	thumb_func_start ov08_02223E74
ov08_02223E74: ; 0x02223E74
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #2
	add r4, r2, #0
	bl GetItemIndexMapping
	add r2, r0, #0
	mov r0, #3
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r4, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r3, [r5]
	ldr r0, [r5, #8]
	ldr r3, [r3, #0xc]
	mov r1, #0x12
	bl PaletteData_LoadNarc
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov08_02223E74

	thumb_func_start ov08_02223EA4
ov08_02223EA4: ; 0x02223EA4
	push {r4, r5, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0]
	bl ov12_0223A8E4
	mov r2, #0
	add r1, sp, #0
	strh r2, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	mov r1, #0x14
	ldr r3, _02223F00 ; =ov08_02225DEC
	mul r1, r4
	ldr r3, [r3, r1]
	str r2, [sp, #0xc]
	str r3, [sp, #8]
	mov r3, #2
	str r3, [sp, #0x10]
	ldr r3, _02223F04 ; =ov08_02225DDC
	str r2, [sp, #0x30]
	ldr r3, [r3, r1]
	add r2, sp, #0
	str r3, [sp, #0x14]
	ldr r3, _02223F08 ; =ov08_02225DE0
	ldr r3, [r3, r1]
	str r3, [sp, #0x18]
	ldr r3, _02223F0C ; =ov08_02225DE4
	ldr r3, [r3, r1]
	str r3, [sp, #0x1c]
	ldr r3, _02223F10 ; =ov08_02225DE8
	ldr r1, [r3, r1]
	str r1, [sp, #0x20]
	mov r1, #1
	str r1, [sp, #0x2c]
	mov r1, #0xc3
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	bl sub_0200D734
	add sp, #0x34
	pop {r4, r5, pc}
	nop
_02223F00: .word ov08_02225DEC
_02223F04: .word ov08_02225DDC
_02223F08: .word ov08_02225DE0
_02223F0C: .word ov08_02225DE4
_02223F10: .word ov08_02225DE8
	thumb_func_end ov08_02223EA4

	thumb_func_start ov08_02223F14
ov08_02223F14: ; 0x02223F14
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0x31
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #4
_02223F20:
	add r0, r6, #0
	add r1, r4, #0
	bl ov08_02223EA4
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blo _02223F20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_02223F14

	thumb_func_start ov08_02223F34
ov08_02223F34: ; 0x02223F34
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl ov12_0223A8E4
	mov r6, #0x31
	str r0, [sp]
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #4
_02223F4A:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blo _02223F4A
	add r0, r7, #0
	bl ov08_02224108
	add r0, r7, #0
	bl ov08_022241F4
	mov r1, #0xc3
	lsl r1, r1, #2
	ldr r0, [sp]
	ldr r1, [r7, r1]
	bl sub_0200D998
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov08_02223F34

	thumb_func_start ov08_02223F74
ov08_02223F74: ; 0x02223F74
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	mov r1, #1
	add r6, r0, #0
	bl sub_0200DCE8
	lsl r1, r5, #0x10
	lsl r2, r4, #0x10
	add r0, r6, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov08_02223F74

	thumb_func_start ov08_02223F94
ov08_02223F94: ; 0x02223F94
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0x31
	str r0, [sp]
	add r7, r1, #0
	mov r4, #0
	add r5, r0, #0
	lsl r6, r6, #4
_02223FA2:
	ldr r0, [r5, r6]
	mov r1, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blo _02223FA2
	cmp r7, #0
	beq _02223FC0
	cmp r7, #1
	beq _02223FC8
	cmp r7, #2
	beq _02223FD0
	pop {r3, r4, r5, r6, r7, pc}
_02223FC0:
	ldr r0, [sp]
	bl ov08_02223FD8
	pop {r3, r4, r5, r6, r7, pc}
_02223FC8:
	ldr r0, [sp]
	bl ov08_0222400C
	pop {r3, r4, r5, r6, r7, pc}
_02223FD0:
	ldr r0, [sp]
	bl ov08_02224064
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_02223F94

	thumb_func_start ov08_02223FD8
ov08_02223FD8: ; 0x02223FD8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldrh r1, [r1, #0x20]
	cmp r1, #0
	beq _02224006
	ldr r2, _02224008 ; =0x0000B4B7
	bl ov08_02223E3C
	ldr r1, [r4]
	ldr r3, _02224008 ; =0x0000B4B7
	ldrh r1, [r1, #0x20]
	add r0, r4, #0
	mov r2, #0
	bl ov08_02223E74
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x18
	mov r2, #0xb2
	bl ov08_02223F74
_02224006:
	pop {r4, pc}
	.balign 4, 0
_02224008: .word 0x0000B4B7
	thumb_func_end ov08_02223FD8

	thumb_func_start ov08_0222400C
ov08_0222400C: ; 0x0222400C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r6, _0222405C ; =ov08_02225D74
	mov r4, #0
	add r7, r5, #0
_02224016:
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02223CD4
	str r0, [sp]
	cmp r0, #0
	beq _0222404E
	ldr r2, _02224060 ; =0x0000B4B7
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r4, r2
	bl ov08_02223E3C
	ldr r3, _02224060 ; =0x0000B4B7
	lsl r2, r4, #0x10
	ldr r1, [sp]
	add r0, r5, #0
	lsr r2, r2, #0x10
	add r3, r4, r3
	bl ov08_02223E74
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	ldr r1, [r6]
	ldr r2, [r6, #4]
	bl ov08_02223F74
_0222404E:
	add r4, r4, #1
	add r6, #8
	add r7, r7, #4
	cmp r4, #6
	blo _02224016
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222405C: .word ov08_02225D74
_02224060: .word 0x0000B4B7
	thumb_func_end ov08_0222400C

	thumb_func_start ov08_02224064
ov08_02224064: ; 0x02224064
	push {r3, r4, r5, lr}
	ldr r1, _022240A0 ; =0x0000114D
	add r4, r0, #0
	ldrb r1, [r4, r1]
	ldr r2, [r4]
	add r1, r2, r1
	add r1, #0x27
	ldrb r1, [r1]
	bl ov08_02223CD4
	add r5, r0, #0
	ldr r2, _022240A4 ; =0x0000B4B7
	add r0, r4, #0
	add r1, r5, #0
	bl ov08_02223E3C
	ldr r3, _022240A4 ; =0x0000B4B7
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov08_02223E74
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x28
	mov r2, #0x2c
	bl ov08_02223F74
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022240A0: .word 0x0000114D
_022240A4: .word 0x0000B4B7
	thumb_func_end ov08_02224064

	thumb_func_start ov08_022240A8
ov08_022240A8: ; 0x022240A8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl ov12_0223A8E4
	ldr r1, _02224104 ; =0x0000B4BE
	add r4, r0, #0
	str r1, [sp]
	str r1, [sp, #4]
	sub r1, r1, #5
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	mov r1, #0xc3
	ldr r3, [r5]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r5, #8]
	ldr r3, [r3, #0xc]
	bl ov12_0226B8FC
	ldr r3, _02224104 ; =0x0000B4BE
	mov r1, #0xc3
	str r3, [sp]
	sub r0, r3, #5
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r2, #0xc]
	add r0, r4, #0
	bl ov12_0226B9A4
	add r1, r0, #0
	ldr r0, [r5, #0x34]
	bl ov08_02224B94
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02224104: .word 0x0000B4BE
	thumb_func_end ov08_022240A8

	thumb_func_start ov08_02224108
ov08_02224108: ; 0x02224108
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov08_02224B84
	bl ov12_0226BA28
	ldr r3, _02224130 ; =0x0000B4B9
	mov r0, #0xc3
	add r1, r3, #5
	str r3, [sp]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl ov12_0226B97C
	add sp, #4
	pop {r3, r4, pc}
	nop
_02224130: .word 0x0000B4B9
	thumb_func_end ov08_02224108

	thumb_func_start ov08_02224134
ov08_02224134: ; 0x02224134
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _02224174 ; =ov08_02225CF8
	lsl r2, r4, #2
	ldr r0, [r5, #0x34]
	ldr r1, [r1, r2]
	bl ov08_02224BCC
	cmp r4, #0
	beq _02224152
	cmp r4, #1
	beq _0222415E
	cmp r4, #2
	pop {r3, r4, r5, pc}
_02224152:
	ldr r1, _02224178 ; =0x0000114D
	ldr r0, [r5, #0x34]
	ldrb r1, [r5, r1]
	bl ov08_02224B98
	pop {r3, r4, r5, pc}
_0222415E:
	ldr r1, _02224178 ; =0x0000114D
	ldr r2, [r5]
	ldrb r1, [r5, r1]
	ldr r0, [r5, #0x34]
	add r1, r2, r1
	add r1, #0x27
	ldrb r1, [r1]
	bl ov08_02224B98
	pop {r3, r4, r5, pc}
	nop
_02224174: .word ov08_02225CF8
_02224178: .word 0x0000114D
	thumb_func_end ov08_02224134

	thumb_func_start ov08_0222417C
ov08_0222417C: ; 0x0222417C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl ov08_02224B90
	ldr r0, [r4, #0x34]
	bl ov08_02224BC0
	ldr r0, [r4, #0x34]
	bl ov08_02224B84
	bl ov12_0226BB68
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov08_0222417C

	thumb_func_start ov08_0222419C
ov08_0222419C: ; 0x0222419C
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl ov12_0223A8E4
	ldr r1, _022241F0 ; =0x0000B4BD
	add r4, r0, #0
	str r1, [sp]
	str r1, [sp, #4]
	sub r1, r1, #5
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	mov r1, #0xc3
	ldr r2, [r5]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r2, #0xc]
	ldr r3, [r5, #8]
	bl ov12_0226BBC4
	ldr r3, _022241F0 ; =0x0000B4BD
	mov r1, #0xc3
	str r3, [sp]
	sub r0, r3, #5
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r2, [r5]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r2, #0xc]
	add r0, r4, #0
	bl ov12_0226BC68
	str r0, [r5, #0x38]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_022241F0: .word 0x0000B4BD
	thumb_func_end ov08_0222419C

	thumb_func_start ov08_022241F4
ov08_022241F4: ; 0x022241F4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	bl ov12_0226BCE4
	ldr r3, _02224218 ; =0x0000B4B8
	mov r0, #0xc3
	add r1, r3, #5
	str r3, [sp]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl ov12_0226BC40
	add sp, #4
	pop {r3, r4, pc}
	nop
_02224218: .word 0x0000B4B8
	thumb_func_end ov08_022241F4

	thumb_func_start ov08_0222421C
ov08_0222421C: ; 0x0222421C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _02224242
	lsl r3, r1, #3
	ldr r1, _0222424C ; =ov08_02225D2C
	ldr r2, _02224250 ; =ov08_02225D30
	ldr r0, [r4, #0x38]
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	bl ov12_0226BD2C
	ldr r0, [r4, #0x38]
	mov r1, #0x3c
	bl ov12_0226BD4C
	pop {r4, pc}
_02224242:
	ldr r0, [r4, #0x38]
	bl ov12_0226BD38
	pop {r4, pc}
	nop
_0222424C: .word ov08_02225D2C
_02224250: .word ov08_02225D30
	thumb_func_end ov08_0222421C

	thumb_func_start ov08_02224254
ov08_02224254: ; 0x02224254
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #0xca
	lsl r0, r0, #2
	mov r2, #0
	add r0, r5, r0
	add r3, r2, #0
	add r4, r1, #0
	bl ov08_0222458C
	mov r0, #0x10
	str r0, [sp]
	ldr r0, _02224510 ; =0x00000448
	mov r3, #9
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	str r3, [sp, #4]
	bl ov08_0222458C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	ldr r0, _02224514 ; =0x00000568
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x12
	bl ov08_0222458C
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r0, _02224518 ; =0x00000688
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x1b
	bl ov08_0222458C
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r0, _0222451C ; =0x0000078C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x20
	bl ov08_0222458C
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #0x89
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0
	mov r3, #0x25
	bl ov08_0222458C
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	ldr r0, _02224520 ; =0x00000994
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x2a
	bl ov08_0222458C
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224524 ; =0x00000A98
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x39
	bl ov08_0222458C
	ldr r0, _02224528 ; =0x00000ACA
	mov r2, #5
	str r2, [sp]
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0x39
	str r2, [sp, #4]
	bl ov08_0222458C
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222452C ; =0x00000AFC
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xa
	mov r3, #0x39
	bl ov08_0222458C
	mov r2, #0x10
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, _02224530 ; =0x00000B2E
	add r1, r4, #0
	add r0, r5, r0
	mov r3, #0
	bl ov08_0222458C
	ldr r0, _02224534 ; =0x00000BEE
	mov r2, #0x10
	str r2, [sp]
	mov r3, #6
	add r0, r5, r0
	add r1, r4, #0
	str r3, [sp, #4]
	bl ov08_0222458C
	mov r2, #0x10
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, _02224538 ; =0x00000CAE
	add r1, r4, #0
	add r0, r5, r0
	mov r3, #0xc
	bl ov08_0222458C
	mov r2, #0x10
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, _0222453C ; =0x00000D6E
	add r1, r4, #0
	add r0, r5, r0
	mov r3, #0x12
	bl ov08_0222458C
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224540 ; =0x00000E2E
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x2f
	bl ov08_0222458C
	mov r0, #0xe6
	mov r2, #5
	lsl r0, r0, #4
	str r2, [sp]
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0x2f
	str r2, [sp, #4]
	bl ov08_0222458C
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224544 ; =0x00000E92
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xa
	mov r3, #0x2f
	bl ov08_0222458C
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224548 ; =0x00000EC4
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xf
	mov r3, #0x2f
	bl ov08_0222458C
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222454C ; =0x00000EF6
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0
	mov r3, #0x34
	bl ov08_0222458C
	ldr r0, _02224550 ; =0x00000F28
	mov r2, #5
	str r2, [sp]
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0x34
	str r2, [sp, #4]
	bl ov08_0222458C
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224554 ; =0x00000F5A
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xa
	mov r3, #0x34
	bl ov08_0222458C
	mov r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224558 ; =0x00000F8C
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xf
	mov r3, #0x34
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222455C ; =0x00000FBE
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x14
	mov r3, #0x2f
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224560 ; =0x00000FDE
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x18
	mov r3, #0x2f
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224564 ; =0x00000FFE
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x1c
	mov r3, #0x2f
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224568 ; =0x0000101E
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x14
	mov r3, #0x33
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222456C ; =0x0000103E
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x18
	mov r3, #0x33
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224570 ; =0x0000105E
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x1c
	mov r3, #0x33
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224574 ; =0x0000107E
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x14
	mov r3, #0x37
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224578 ; =0x0000109E
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x18
	mov r3, #0x37
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222457C ; =0x000010BE
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x1c
	mov r3, #0x37
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224580 ; =0x000010DE
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x14
	mov r3, #0x3b
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224584 ; =0x000010FE
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x18
	mov r3, #0x3b
	bl ov08_0222458C
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224588 ; =0x0000111E
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0x1c
	mov r3, #0x3b
	bl ov08_0222458C
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02224510: .word 0x00000448
_02224514: .word 0x00000568
_02224518: .word 0x00000688
_0222451C: .word 0x0000078C
_02224520: .word 0x00000994
_02224524: .word 0x00000A98
_02224528: .word 0x00000ACA
_0222452C: .word 0x00000AFC
_02224530: .word 0x00000B2E
_02224534: .word 0x00000BEE
_02224538: .word 0x00000CAE
_0222453C: .word 0x00000D6E
_02224540: .word 0x00000E2E
_02224544: .word 0x00000E92
_02224548: .word 0x00000EC4
_0222454C: .word 0x00000EF6
_02224550: .word 0x00000F28
_02224554: .word 0x00000F5A
_02224558: .word 0x00000F8C
_0222455C: .word 0x00000FBE
_02224560: .word 0x00000FDE
_02224564: .word 0x00000FFE
_02224568: .word 0x0000101E
_0222456C: .word 0x0000103E
_02224570: .word 0x0000105E
_02224574: .word 0x0000107E
_02224578: .word 0x0000109E
_0222457C: .word 0x000010BE
_02224580: .word 0x000010DE
_02224584: .word 0x000010FE
_02224588: .word 0x0000111E
	thumb_func_end ov08_02224254

	thumb_func_start ov08_0222458C
ov08_0222458C: ; 0x0222458C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r0, sp, #8
	mov lr, r3
	ldrb r3, [r0, #0x14]
	mov r6, #0
	mov ip, r3
	cmp r3, #0
	ble _022245D8
	ldrb r3, [r0, #0x10]
	lsl r2, r2, #1
	add r7, r1, r2
_022245A4:
	mov r2, #0
	cmp r3, #0
	ble _022245CC
	mov r0, lr
	add r0, r0, r6
	lsl r0, r0, #6
	add r5, r7, r0
	add r0, r6, #0
	mul r0, r3
	lsl r1, r0, #1
	ldr r0, [sp]
	add r4, r0, r1
_022245BC:
	lsl r1, r2, #1
	ldrh r0, [r5, r1]
	strh r0, [r4, r1]
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	cmp r2, r3
	blt _022245BC
_022245CC:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	mov r0, ip
	cmp r6, r0
	blt _022245A4
_022245D8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov08_0222458C

	thumb_func_start ov08_022245DC
ov08_022245DC: ; 0x022245DC
	cmp r1, #0x10
	bhi _0222466A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022245EC: ; jump table
	.short _0222460E - _022245EC - 2 ; case 0
	.short _0222460E - _022245EC - 2 ; case 1
	.short _0222460E - _022245EC - 2 ; case 2
	.short _0222460E - _022245EC - 2 ; case 3
	.short _0222461E - _022245EC - 2 ; case 4
	.short _0222462C - _022245EC - 2 ; case 5
	.short _02224638 - _022245EC - 2 ; case 6
	.short _02224638 - _022245EC - 2 ; case 7
	.short _02224638 - _022245EC - 2 ; case 8
	.short _02224638 - _022245EC - 2 ; case 9
	.short _02224638 - _022245EC - 2 ; case 10
	.short _02224638 - _022245EC - 2 ; case 11
	.short _02224644 - _022245EC - 2 ; case 12
	.short _02224650 - _022245EC - 2 ; case 13
	.short _0222462C - _022245EC - 2 ; case 14
	.short _0222465C - _022245EC - 2 ; case 15
	.short _0222462C - _022245EC - 2 ; case 16
_0222460E:
	mov r1, #0xca
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x12
	lsl r0, r0, #4
	mul r0, r2
	add r0, r1, r0
	bx lr
_0222461E:
	ldr r1, _02224670 ; =0x00000688
	add r1, r0, r1
	lsl r0, r2, #6
	add r0, r2, r0
	lsl r0, r0, #2
	add r0, r1, r0
	bx lr
_0222462C:
	ldr r1, _02224674 ; =0x00000A98
	add r1, r0, r1
	mov r0, #0x32
	mul r0, r2
	add r0, r1, r0
	bx lr
_02224638:
	ldr r1, _02224678 ; =0x00000B2E
	add r1, r0, r1
	mov r0, #0xc0
	mul r0, r2
	add r0, r1, r0
	bx lr
_02224644:
	ldr r1, _0222467C ; =0x00000E2E
	add r1, r0, r1
	mov r0, #0x32
	mul r0, r2
	add r0, r1, r0
	bx lr
_02224650:
	ldr r1, _02224680 ; =0x00000EF6
	add r1, r0, r1
	mov r0, #0x32
	mul r0, r2
	add r0, r1, r0
	bx lr
_0222465C:
	ldr r1, _02224670 ; =0x00000688
	add r1, r0, r1
	lsl r0, r2, #6
	add r0, r2, r0
	lsl r0, r0, #2
	add r0, r1, r0
	bx lr
_0222466A:
	mov r0, #0
	bx lr
	nop
_02224670: .word 0x00000688
_02224674: .word 0x00000A98
_02224678: .word 0x00000B2E
_0222467C: .word 0x00000E2E
_02224680: .word 0x00000EF6
	thumb_func_end ov08_022245DC

	thumb_func_start ov08_02224684
ov08_02224684: ; 0x02224684
	cmp r2, #3
	bne _0222468C
	mov r0, #5
	bx lr
_0222468C:
	cmp r1, #0x10
	bhi _022246EA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222469C: ; jump table
	.short _022246BE - _0222469C - 2 ; case 0
	.short _022246BE - _0222469C - 2 ; case 1
	.short _022246BE - _0222469C - 2 ; case 2
	.short _022246BE - _0222469C - 2 ; case 3
	.short _022246C2 - _0222469C - 2 ; case 4
	.short _022246C6 - _0222469C - 2 ; case 5
	.short _022246CA - _0222469C - 2 ; case 6
	.short _022246CA - _0222469C - 2 ; case 7
	.short _022246CA - _0222469C - 2 ; case 8
	.short _022246CA - _0222469C - 2 ; case 9
	.short _022246CA - _0222469C - 2 ; case 10
	.short _022246CA - _0222469C - 2 ; case 11
	.short _022246C6 - _0222469C - 2 ; case 12
	.short _022246C6 - _0222469C - 2 ; case 13
	.short _022246C6 - _0222469C - 2 ; case 14
	.short _022246D6 - _0222469C - 2 ; case 15
	.short _022246C6 - _0222469C - 2 ; case 16
_022246BE:
	mov r0, #0
	bx lr
_022246C2:
	mov r0, #3
	bx lr
_022246C6:
	mov r0, #2
	bx lr
_022246CA:
	ldr r1, _022246F0 ; =0x0000114D
	ldrb r0, [r0, r1]
	add r0, #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
_022246D6:
	cmp r3, #2
	bne _022246E6
	ldr r1, _022246F0 ; =0x0000114D
	ldrb r0, [r0, r1]
	add r0, #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
_022246E6:
	mov r0, #1
	bx lr
_022246EA:
	mov r0, #0
	bx lr
	nop
_022246F0: .word 0x0000114D
	thumb_func_end ov08_02224684

	thumb_func_start ov08_022246F4
ov08_022246F4: ; 0x022246F4
	push {r4, r5, r6, r7}
	cmp r2, #0
	bne _02224704
	ldr r2, _02224758 ; =0x00000FBE
	add r2, r0, r2
	lsl r0, r3, #5
	add r0, r2, r0
	b _0222472C
_02224704:
	cmp r2, #1
	bne _02224712
	ldr r2, _0222475C ; =0x0000101E
	add r2, r0, r2
	lsl r0, r3, #5
	add r0, r2, r0
	b _0222472C
_02224712:
	cmp r2, #2
	bne _02224720
	ldr r2, _02224760 ; =0x0000107E
	add r2, r0, r2
	lsl r0, r3, #5
	add r0, r2, r0
	b _0222472C
_02224720:
	cmp r2, #3
	bne _02224754
	ldr r2, _02224764 ; =0x000010DE
	add r2, r0, r2
	lsl r0, r3, #5
	add r0, r2, r0
_0222472C:
	mov r2, #0
_0222472E:
	lsl r4, r2, #3
	lsl r5, r2, #5
	mov r3, #0
	add r4, r0, r4
	add r5, r1, r5
_02224738:
	lsl r6, r3, #1
	ldrh r7, [r4, r6]
	add r3, r3, #1
	lsl r3, r3, #0x10
	add r6, r5, r6
	lsr r3, r3, #0x10
	strh r7, [r6, #0xc]
	cmp r3, #4
	blo _02224738
	add r2, r2, #1
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	cmp r2, #4
	blo _0222472E
_02224754:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_02224758: .word 0x00000FBE
_0222475C: .word 0x0000101E
_02224760: .word 0x0000107E
_02224764: .word 0x000010DE
	thumb_func_end ov08_022246F4

	thumb_func_start ov08_02224768
ov08_02224768: ; 0x02224768
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r5, r1, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	str r0, [sp]
	bl ov08_022245DC
	add r3, sp, #0x10
	add r4, r0, #0
	ldrb r3, [r3, #0x10]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ov08_02224684
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x10
	ldr r0, [sp, #4]
	ldr r6, _022247D4 ; =ov08_02225E9F
	lsl r3, r0, #2
	ldr r0, _022247D8 ; =ov08_02225E9E
	ldrb r6, [r6, r3]
	ldrb r0, [r0, r3]
	mov r1, #0
	mul r6, r0
	cmp r6, #0
	ble _022247C4
	ldr r0, _022247DC ; =ov08_02225E9C
	ldr r7, _022247E0 ; =0x00000FFF
	add r3, r0, r3
_022247AA:
	lsl r0, r1, #1
	ldrh r6, [r4, r0]
	and r6, r7
	orr r6, r2
	strh r6, [r5, r0]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldrb r6, [r3, #2]
	ldrb r0, [r3, #3]
	mul r0, r6
	cmp r1, r0
	blt _022247AA
_022247C4:
	ldr r0, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r1, r5, #0
	bl ov08_022246F4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022247D4: .word ov08_02225E9F
_022247D8: .word ov08_02225E9E
_022247DC: .word ov08_02225E9C
_022247E0: .word 0x00000FFF
	thumb_func_end ov08_02224768

	thumb_func_start ov08_022247E4
ov08_022247E4: ; 0x022247E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	add r5, r0, #0
	ldr r0, [sp, #0xc]
	lsl r4, r0, #2
	ldr r0, _02224848 ; =ov08_02225E9F
	ldrb r7, [r0, r4]
	ldr r0, _0222484C ; =ov08_02225E9E
	ldrb r6, [r0, r4]
	ldr r0, [r5]
	add r1, r6, #0
	mul r1, r7
	ldr r0, [r0, #0xc]
	lsl r1, r1, #1
	bl AllocFromHeap
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	bl ov08_02224768
	ldr r0, _02224850 ; =ov08_02225E9D
	ldr r3, _02224854 ; =ov08_02225E9C
	ldrb r0, [r0, r4]
	ldrb r3, [r3, r4]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [r5, #4]
	mov r1, #6
	bl LoadRectToBgTilemapRect
	ldr r0, [r5, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [sp, #0x18]
	bl FreeToHeap
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02224848: .word ov08_02225E9F
_0222484C: .word ov08_02225E9E
_02224850: .word ov08_02225E9D
_02224854: .word ov08_02225E9C
	thumb_func_end ov08_022247E4

	thumb_func_start ov08_02224858
ov08_02224858: ; 0x02224858
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	cmp r1, #6
	blo _02224876
	cmp r1, #0xb
	bhi _02224876
	add r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _02224876
	add r1, #0xb
	ldr r0, _022248CC ; =ov08_02225EE0
	lsl r1, r1, #2
	ldr r4, [r0, r1]
	b _0222487C
_02224876:
	ldr r0, _022248CC ; =ov08_02225EE0
	lsl r1, r1, #2
	ldr r4, [r0, r1]
_0222487C:
	cmp r4, #0
	beq _022248C8
	cmp r2, #0
	beq _0222488C
	cmp r2, #1
	beq _02224894
	cmp r2, #2
	bne _0222489A
_0222488C:
	mov r0, #1
	str r0, [sp]
	mov r7, #2
	b _0222489A
_02224894:
	mov r0, #0
	str r0, [sp]
	mov r7, #4
_0222489A:
	mov r5, #0
_0222489C:
	ldrb r0, [r4, r5]
	cmp r0, #0xff
	beq _022248C8
	ldr r1, [r6, #0x2c]
	lsl r0, r0, #4
	add r0, r1, r0
	ldr r1, [sp]
	add r2, r7, #0
	mov r3, #0
	bl ScrollWindow
	ldrb r0, [r4, r5]
	ldr r1, [r6, #0x2c]
	lsl r0, r0, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #8
	blo _0222489C
_022248C8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022248CC: .word ov08_02225EE0
	thumb_func_end ov08_02224858

	thumb_func_start ov08_022248D0
ov08_022248D0: ; 0x022248D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r2, [sp]
	cmp r1, #6
	blo _022248EC
	cmp r1, #0xb
	bhi _022248EC
	sub r0, r1, #6
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r6, [r1, r0]
	b _02224910
_022248EC:
	cmp r1, #4
	bne _02224934
	mov r7, #0x31
	mov r4, #0
	lsl r7, r7, #4
_022248F6:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r6, [r0, r7]
	add r0, r6, #0
	bl sub_0200DCFC
	cmp r0, #0
	bne _02224910
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _022248F6
_02224910:
	ldr r0, [sp]
	cmp r0, #0
	beq _0222491E
	cmp r0, #1
	beq _0222492A
	cmp r0, #2
	bne _02224934
_0222491E:
	add r0, r6, #0
	mov r1, #0
	mov r2, #2
	bl sub_0200DED0
	pop {r3, r4, r5, r6, r7, pc}
_0222492A:
	mov r1, #0
	add r0, r6, #0
	sub r2, r1, #4
	bl sub_0200DED0
_02224934:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov08_022248D0

	thumb_func_start ov08_02224938
ov08_02224938: ; 0x02224938
	push {r4, r5}
	ldr r3, _02224970 ; =0x0000113E
	mov r5, #0
	strb r5, [r0, r3]
	add r4, r3, #1
	strb r5, [r0, r4]
	add r4, r3, #2
	strb r1, [r0, r4]
	add r1, r3, #3
	ldrb r4, [r0, r1]
	mov r1, #0xf0
	bic r4, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x18
	add r2, r4, #0
	orr r2, r1
	add r1, r3, #3
	strb r2, [r0, r1]
	ldrb r2, [r0, r1]
	mov r1, #0xf
	bic r2, r1
	mov r1, #1
	orr r2, r1
	add r1, r3, #3
	strb r2, [r0, r1]
	pop {r4, r5}
	bx lr
	nop
_02224970: .word 0x0000113E
	thumb_func_end ov08_02224938

	thumb_func_start ov08_02224974
ov08_02224974: ; 0x02224974
	push {r4, lr}
	ldr r3, _02224A48 ; =0x00001141
	add r4, r0, #0
	ldrb r1, [r4, r3]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	beq _02224A44
	sub r1, r3, #3
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _02224994
	cmp r1, #1
	beq _022249CC
	cmp r1, #2
	beq _02224A04
	pop {r4, pc}
_02224994:
	sub r1, r3, #1
	add r3, #0xb
	ldrb r1, [r4, r1]
	ldrb r3, [r4, r3]
	mov r2, #1
	bl ov08_022247E4
	mov r1, #0x45
	lsl r1, r1, #6
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	bl ov08_02224858
	mov r1, #0x45
	lsl r1, r1, #6
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	bl ov08_022248D0
	ldr r0, _02224A4C ; =0x0000113F
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #1
	sub r0, r0, #1
	strb r1, [r4, r0]
	pop {r4, pc}
_022249CC:
	sub r1, r3, #1
	add r3, #0xb
	ldrb r1, [r4, r1]
	ldrb r3, [r4, r3]
	mov r2, #2
	bl ov08_022247E4
	mov r1, #0x45
	lsl r1, r1, #6
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mov r2, #2
	bl ov08_02224858
	mov r1, #0x45
	lsl r1, r1, #6
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mov r2, #2
	bl ov08_022248D0
	ldr r0, _02224A4C ; =0x0000113F
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #2
	sub r0, r0, #1
	strb r1, [r4, r0]
	pop {r4, pc}
_02224A04:
	sub r1, r3, #1
	add r3, #0xb
	ldrb r1, [r4, r1]
	ldrb r3, [r4, r3]
	mov r2, #0
	bl ov08_022247E4
	mov r1, #0x45
	lsl r1, r1, #6
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0
	bl ov08_02224858
	mov r1, #0x45
	lsl r1, r1, #6
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0
	bl ov08_022248D0
	ldr r0, _02224A4C ; =0x0000113F
	mov r2, #0
	strb r2, [r4, r0]
	sub r1, r0, #1
	strb r2, [r4, r1]
	add r1, r0, #2
	ldrb r2, [r4, r1]
	mov r1, #0xf
	add r0, r0, #2
	bic r2, r1
	strb r2, [r4, r0]
_02224A44:
	pop {r4, pc}
	nop
_02224A48: .word 0x00001141
_02224A4C: .word 0x0000113F
	thumb_func_end ov08_02224974

	thumb_func_start ov08_02224A50
ov08_02224A50: ; 0x02224A50
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	beq _02224A62
	cmp r6, #1
	beq _02224AC0
	cmp r6, #2
	beq _02224B46
	pop {r3, r4, r5, r6, r7, pc}
_02224A62:
	mov r1, #0
	add r2, r1, #0
	add r3, r6, #0
	bl ov08_022247E4
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
	add r0, r5, #0
	mov r1, #3
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
	ldr r0, [r5]
	ldrh r0, [r0, #0x20]
	cmp r0, #0
	bne _02224AA6
	add r0, r5, #0
	mov r1, #4
	mov r2, #3
	add r3, r6, #0
	bl ov08_022247E4
	b _02224AB2
_02224AA6:
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
_02224AB2:
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
	pop {r3, r4, r5, r6, r7, pc}
_02224AC0:
	mov r4, #0
	mov r7, #3
_02224AC4:
	add r0, r5, #0
	add r1, r4, #0
	bl ov08_02223CD4
	cmp r0, #0
	bne _02224AE2
	add r1, r4, #6
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r7, #0
	add r3, r6, #0
	bl ov08_022247E4
	b _02224AF2
_02224AE2:
	add r1, r4, #6
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
_02224AF2:
	add r4, r4, #1
	cmp r4, #6
	blo _02224AC4
	ldr r0, _02224B60 ; =0x0000114D
	ldrb r1, [r5, r0]
	add r0, r0, #7
	add r1, r5, r1
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02224B20
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #3
	add r3, r6, #0
	bl ov08_022247E4
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #3
	add r3, r6, #0
	bl ov08_022247E4
	b _02224B38
_02224B20:
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
_02224B38:
	add r0, r5, #0
	mov r1, #0xe
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
	pop {r3, r4, r5, r6, r7, pc}
_02224B46:
	mov r1, #0xf
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	add r3, r6, #0
	bl ov08_022247E4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02224B60: .word 0x0000114D
	thumb_func_end ov08_02224A50

	thumb_func_start ov08_02224B64
ov08_02224B64: ; 0x02224B64
	push {r3, lr}
	mov r1, #0x10
	bl AllocFromHeap
	add r3, r0, #0
	mov r2, #0x10
	mov r1, #0
_02224B72:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _02224B72
	pop {r3, pc}
	thumb_func_end ov08_02224B64

	thumb_func_start ov08_02224B7C
ov08_02224B7C: ; 0x02224B7C
	ldr r3, _02224B80 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02224B80: .word FreeToHeap
	thumb_func_end ov08_02224B7C

	thumb_func_start ov08_02224B84
ov08_02224B84: ; 0x02224B84
	ldr r0, [r0]
	bx lr
	thumb_func_end ov08_02224B84

	thumb_func_start ov08_02224B88
ov08_02224B88: ; 0x02224B88
	ldrb r0, [r0, #9]
	bx lr
	thumb_func_end ov08_02224B88

	thumb_func_start ov08_02224B8C
ov08_02224B8C: ; 0x02224B8C
	ldrb r0, [r0, #8]
	bx lr
	thumb_func_end ov08_02224B8C

	thumb_func_start ov08_02224B90
ov08_02224B90: ; 0x02224B90
	strb r1, [r0, #8]
	bx lr
	thumb_func_end ov08_02224B90

	thumb_func_start ov08_02224B94
ov08_02224B94: ; 0x02224B94
	str r1, [r0]
	bx lr
	thumb_func_end ov08_02224B94

	thumb_func_start ov08_02224B98
ov08_02224B98: ; 0x02224B98
	push {r3, r4, lr}
	sub sp, #4
	strb r1, [r0, #9]
	ldrb r1, [r0, #8]
	cmp r1, #1
	bne _02224BBC
	ldrb r1, [r0, #9]
	ldr r2, [r0, #4]
	lsl r4, r1, #3
	add r3, r2, r4
	ldrb r1, [r3, #3]
	str r1, [sp]
	ldrb r1, [r2, r4]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #1]
	ldr r0, [r0]
	bl ov12_0226BAFC
_02224BBC:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov08_02224B98

	thumb_func_start ov08_02224BC0
ov08_02224BC0: ; 0x02224BC0
	mov r1, #0
	strb r1, [r0, #9]
	mov r1, #0xff
	strb r1, [r0, #0xa]
	bx lr
	.balign 4, 0
	thumb_func_end ov08_02224BC0

	thumb_func_start ov08_02224BCC
ov08_02224BCC: ; 0x02224BCC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl ov08_02224BC0
	mov r0, #0
	str r5, [r4, #4]
	mvn r0, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #8]
	cmp r0, #1
	bne _02224BF6
	ldr r3, [r4, #4]
	ldrb r0, [r3, #3]
	str r0, [sp]
	ldrb r1, [r3]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #1]
	ldr r0, [r4]
	bl ov12_0226BAFC
_02224BF6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov08_02224BCC

	thumb_func_start ov08_02224BF8
ov08_02224BF8: ; 0x02224BF8
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov08_02224BF8

	thumb_func_start ov08_02224BFC
ov08_02224BFC: ; 0x02224BFC
	push {r3, r4, lr}
	sub sp, #4
	ldrb r1, [r0, #8]
	cmp r1, #1
	bne _02224C0C
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_02224C0C:
	ldr r1, _02224C40 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #0xf3
	tst r1, r2
	beq _02224C38
	mov r1, #1
	strb r1, [r0, #8]
	ldrb r1, [r0, #9]
	ldr r2, [r0, #4]
	lsl r4, r1, #3
	add r3, r2, r4
	ldrb r1, [r3, #3]
	str r1, [sp]
	ldrb r1, [r2, r4]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #1]
	ldr r0, [r0]
	bl ov12_0226BAFC
	ldr r0, _02224C44 ; =0x000005DC
	bl PlaySE
_02224C38:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_02224C40: .word gSystem
_02224C44: .word 0x000005DC
	thumb_func_end ov08_02224BFC

	thumb_func_start ov08_02224C48
ov08_02224C48: ; 0x02224C48
	cmp r1, #3
	bhi _02224C90
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02224C58: ; jump table
	.short _02224C60 - _02224C58 - 2 ; case 0
	.short _02224C6C - _02224C58 - 2 ; case 1
	.short _02224C78 - _02224C58 - 2 ; case 2
	.short _02224C84 - _02224C58 - 2 ; case 3
_02224C60:
	ldrb r1, [r0, #5]
	mov r0, #0x80
	tst r0, r1
	beq _02224C90
	mov r0, #1
	bx lr
_02224C6C:
	ldrb r1, [r0, #4]
	mov r0, #0x80
	tst r0, r1
	beq _02224C90
	mov r0, #1
	bx lr
_02224C78:
	ldrb r1, [r0, #7]
	mov r0, #0x80
	tst r0, r1
	beq _02224C90
	mov r0, #1
	bx lr
_02224C84:
	ldrb r1, [r0, #6]
	mov r0, #0x80
	tst r0, r1
	beq _02224C90
	mov r0, #1
	bx lr
_02224C90:
	mov r0, #0
	bx lr
	thumb_func_end ov08_02224C48

	thumb_func_start ov08_02224C94
ov08_02224C94: ; 0x02224C94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl ov08_02224BFC
	cmp r0, #0
	bne _02224CAA
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02224CAA:
	ldr r0, _02224E20 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02224CCE
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #9]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r4, r0, #0
	mov r6, #0
	b _02224D36
_02224CCE:
	mov r1, #0x80
	tst r1, r0
	beq _02224CF0
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #9]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r4, r0, #0
	mov r6, #1
	b _02224D36
_02224CF0:
	mov r1, #0x20
	tst r1, r0
	beq _02224D12
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #9]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r4, r0, #0
	mov r6, #2
	b _02224D36
_02224D12:
	mov r1, #0x10
	tst r0, r1
	beq _02224D34
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #9]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r4, r0, #0
	mov r6, #3
	b _02224D36
_02224D34:
	mov r4, #0xff
_02224D36:
	cmp r4, #0xff
	beq _02224DF6
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #0x80
	add r1, r4, #0
	tst r1, r0
	beq _02224D56
	ldrb r1, [r5, #0xa]
	cmp r1, #0xff
	beq _02224D50
	add r4, r1, #0
	b _02224D56
_02224D50:
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02224D56:
	mov r7, #0
_02224D58:
	mov r0, #1
	ldr r1, [r5, #0xc]
	lsl r0, r4
	tst r0, r1
	bne _02224D90
	str r7, [sp, #0xc]
	str r7, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r2, r7, #0
	add r3, r7, #0
	bl sub_02020A24
	mov r1, #0x7f
	and r0, r1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, r4
	beq _02224D88
	ldrb r0, [r5, #9]
	cmp r1, r0
	bne _02224D8C
_02224D88:
	ldrb r4, [r5, #9]
	b _02224D90
_02224D8C:
	add r4, r1, #0
	b _02224D58
_02224D90:
	ldrb r0, [r5, #9]
	cmp r0, r4
	beq _02224DEE
	ldr r0, [r5, #4]
	lsl r7, r4, #3
	add r1, sp, #0x10
	add r2, sp, #0x10
	add r0, r0, r7
	add r1, #3
	add r2, #2
	bl sub_02020A0C
	ldr r0, [r5, #4]
	add r1, sp, #0x10
	add r0, r0, r7
	add r1, #1
	add r2, sp, #0x10
	bl sub_02020A18
	ldr r0, [r5, #4]
	add r1, r6, #0
	add r0, r0, r7
	bl ov08_02224C48
	cmp r0, #1
	bne _02224DD0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02224DD0
	ldrb r0, [r5, #9]
	strb r0, [r5, #0xa]
	b _02224DD4
_02224DD0:
	mov r0, #0xff
	strb r0, [r5, #0xa]
_02224DD4:
	strb r4, [r5, #9]
	add r3, sp, #0x10
	ldrb r0, [r3]
	str r0, [sp]
	ldrb r1, [r3, #3]
	ldrb r2, [r3, #1]
	ldrb r3, [r3, #2]
	ldr r0, [r5]
	bl ov12_0226BAFC
	ldr r0, _02224E24 ; =0x000005DC
	bl PlaySE
_02224DEE:
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02224DF6:
	ldr r0, _02224E20 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02224E06
	add sp, #0x14
	ldrb r0, [r5, #9]
	pop {r4, r5, r6, r7, pc}
_02224E06:
	mov r0, #2
	tst r1, r0
	beq _02224E1A
	ldr r0, _02224E28 ; =0x000005DD
	bl PlaySE
	mov r0, #1
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02224E1A:
	sub r0, r0, #3
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02224E20: .word gSystem
_02224E24: .word 0x000005DC
_02224E28: .word 0x000005DD
	thumb_func_end ov08_02224C94

	.rodata

_02224E2C:
	.byte 0x00, 0x02, 0x04, 0x01
	.byte 0x03, 0x05, 0x00, 0x00

ov08_02224E34: ; 0x02224E34
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov08_02224E44: ; 0x02224E44
	.byte 0x98, 0xBF, 0x00, 0xCF, 0x00, 0x27, 0xB8, 0xFF, 0x98, 0xBF, 0xD8, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov08_02224E54: ; 0x02224E54
	.byte 0x08, 0x8F, 0x08, 0xF7, 0x98, 0xBF, 0x00, 0x67, 0x98, 0xBF, 0x68, 0xCF
	.byte 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov08_02224E68: ; 0x02224E68
	.byte 0x98, 0xBF, 0x00, 0x27, 0x98, 0xBF, 0x28, 0x4F
	.byte 0x98, 0xBF, 0x60, 0xC7, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov08_02224E7C: ; 0x02224E7C
	.byte 0x98, 0xA7, 0x58, 0x7F
	.byte 0x98, 0xA7, 0x80, 0xA7, 0xA8, 0xB7, 0x58, 0x7F, 0xA8, 0xB7, 0x80, 0xA7, 0x98, 0xBF, 0xD8, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov08_02224E94: ; 0x02224E94
	.byte 0x30, 0x5F, 0x00, 0x7F, 0x30, 0x5F, 0x80, 0xFF, 0x60, 0x8F, 0x00, 0x7F
	.byte 0x60, 0x8F, 0x80, 0xFF, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov08_02224EAC: ; 0x02224EAC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02
	.byte 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov08_02224EC8: ; 0x02224EC8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov08_02224EE4: ; 0x02224EE4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov08_02224F00: ; 0x02224F00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov08_02224F1C: ; 0x02224F1C
	.byte 0x00, 0x2F, 0x00, 0x7F
	.byte 0x08, 0x37, 0x80, 0xFF, 0x30, 0x5F, 0x00, 0x7F, 0x38, 0x67, 0x80, 0xFF, 0x60, 0x8F, 0x00, 0x7F
	.byte 0x68, 0x97, 0x80, 0xFF, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov08_02224F3C: ; 0x02224F3C
	.byte 0x30, 0x5F, 0x00, 0x7F
	.byte 0x30, 0x5F, 0x80, 0xFF, 0x60, 0x8F, 0x00, 0x7F, 0x60, 0x8F, 0x80, 0xFF, 0x90, 0xBF, 0x40, 0xBF
	.byte 0x00, 0x27, 0xB8, 0xFF, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov08_02224F5C: ; 0x02224F5C
	.byte 0x30, 0x5F, 0x00, 0x7F
	.byte 0x30, 0x5F, 0x80, 0xFF, 0x60, 0x8F, 0x00, 0x7F, 0x60, 0x8F, 0x80, 0xFF, 0x98, 0xBF, 0x00, 0x27
	.byte 0x98, 0xBF, 0x28, 0x4F, 0x98, 0xBF, 0x60, 0xC7, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov08_02224F80: ; 0x02224F80
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov08_02224FD0: ; 0x02224FD0
	.byte 0x04, 0x02, 0x15, 0x16, 0x02, 0x0F, 0x1F, 0x00, 0x04, 0x02, 0x13, 0x1B, 0x04, 0x0F, 0x1F, 0x00

ov08_02224FE0: ; 0x02224FE0
	.byte 0x3D, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x00, 0x00

ov08_02224FF4: ; 0x02224FF4
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov08_0222500C: ; 0x0222500C
	.byte 0x05, 0x0A, 0x04, 0x0C
	.byte 0x03, 0x09, 0x01, 0x00, 0x05, 0x0B, 0x0C, 0x0A, 0x03, 0x09, 0x25, 0x00, 0x05, 0x01, 0x14, 0x0B
	.byte 0x03, 0x09, 0x43, 0x00, 0x05, 0x0E, 0x14, 0x0B, 0x03, 0x09, 0x64, 0x00

ov08_0222502C: ; 0x0222502C
	.byte 0x04, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x8B, 0x00, 0x04, 0x01, 0x06, 0x0E, 0x05, 0x09, 0x9D, 0x00, 0x04, 0x11, 0x06, 0x0E
	.byte 0x05, 0x09, 0xE3, 0x00, 0x04, 0x01, 0x0C, 0x0E, 0x05, 0x09, 0x29, 0x01, 0x04, 0x11, 0x0C, 0x0E
	.byte 0x05, 0x09, 0x6F, 0x01

ov08_02225054: ; 0x02225054
	.byte 0x04, 0x05, 0x01, 0x09, 0x02, 0x0D, 0x85, 0x00, 0x04, 0x01, 0x06, 0x0E
	.byte 0x05, 0x09, 0x97, 0x00, 0x04, 0x11, 0x06, 0x0E, 0x05, 0x09, 0xDD, 0x00, 0x04, 0x01, 0x0C, 0x0E
	.byte 0x05, 0x09, 0x23, 0x01, 0x04, 0x11, 0x0C, 0x0E, 0x05, 0x09, 0x69, 0x01, 0x04, 0x09, 0x12, 0x0E
	.byte 0x05, 0x09, 0xAF, 0x01

ov08_02225084: ; 0x02225084
	.byte 0x05, 0x00, 0x00, 0x0F, 0x05, 0x09, 0x85, 0x00, 0x05, 0x10, 0x01, 0x0F
	.byte 0x05, 0x09, 0xD0, 0x00, 0x05, 0x00, 0x06, 0x0F, 0x05, 0x09, 0x1B, 0x01, 0x05, 0x10, 0x07, 0x0F
	.byte 0x05, 0x09, 0x66, 0x01, 0x05, 0x00, 0x0C, 0x0F, 0x05, 0x09, 0xB1, 0x01, 0x05, 0x10, 0x0D, 0x0F
	.byte 0x05, 0x09, 0xFC, 0x01

ov08_022250B4: ; 0x022250B4
	.byte 0x05, 0x05, 0x01, 0x09, 0x02, 0x0D, 0x01, 0x00, 0x05, 0x04, 0x08, 0x0B
	.byte 0x02, 0x0D, 0x13, 0x00, 0x05, 0x14, 0x08, 0x02, 0x02, 0x0D, 0x29, 0x00, 0x05, 0x17, 0x08, 0x05
	.byte 0x02, 0x0D, 0x2D, 0x00, 0x05, 0x02, 0x0B, 0x0C, 0x02, 0x0D, 0x45, 0x01, 0x05, 0x10, 0x0B, 0x0F
	.byte 0x06, 0x0D, 0x5D, 0x01, 0x05, 0x07, 0x14, 0x0C, 0x03, 0x09, 0x37, 0x00

ov08_022250EC: ; 0x022250EC
	.byte 0x05, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x25, 0x01, 0x05, 0x01, 0x06, 0x0E, 0x05, 0x09, 0x49, 0x01, 0x05, 0x11, 0x06, 0x0E
	.byte 0x05, 0x09, 0x8F, 0x01, 0x05, 0x01, 0x0C, 0x0E, 0x05, 0x09, 0xD5, 0x01, 0x05, 0x11, 0x0C, 0x0E
	.byte 0x05, 0x09, 0x1B, 0x02, 0x05, 0x0D, 0x14, 0x0B, 0x03, 0x09, 0x04, 0x01, 0x05, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x37, 0x01, 0x05, 0x01, 0x06, 0x0E, 0x05, 0x09, 0x61, 0x02, 0x05, 0x11, 0x06, 0x0E
	.byte 0x05, 0x09, 0xA7, 0x02, 0x05, 0x01, 0x0C, 0x0E, 0x05, 0x09, 0xED, 0x02, 0x05, 0x11, 0x0C, 0x0E
	.byte 0x05, 0x09, 0x33, 0x03

ov08_02225144: ; 0x02225144
	.byte 0x05, 0x05, 0x01, 0x09, 0x02, 0x0D, 0x01, 0x00, 0x05, 0x04, 0x05, 0x0B
	.byte 0x02, 0x0D, 0x13, 0x00, 0x05, 0x14, 0x05, 0x02, 0x02, 0x0D, 0x29, 0x00, 0x05, 0x17, 0x05, 0x05
	.byte 0x02, 0x0D, 0x2D, 0x00, 0x05, 0x01, 0x10, 0x08, 0x02, 0x0D, 0x5B, 0x00, 0x05, 0x01, 0x0D, 0x08
	.byte 0x02, 0x0D, 0x6B, 0x00, 0x05, 0x0A, 0x10, 0x03, 0x02, 0x0D, 0x7B, 0x00, 0x05, 0x0A, 0x0D, 0x03
	.byte 0x02, 0x0D, 0x81, 0x00, 0x05, 0x10, 0x08, 0x0F, 0x0A, 0x0D, 0x87, 0x00, 0x05, 0x01, 0x08, 0x0C
	.byte 0x02, 0x0D, 0x1D, 0x01, 0x05, 0x06, 0x0A, 0x08, 0x02, 0x0D, 0x35, 0x01, 0x05, 0x07, 0x14, 0x0C
	.byte 0x03, 0x09, 0x37, 0x00

ov08_022251A4: ; 0x022251A4
	.byte 0x04, 0x04, 0x05, 0x0B, 0x02, 0x0D, 0x9D, 0x00, 0x04, 0x17, 0x05, 0x05
	.byte 0x02, 0x0D, 0xB7, 0x00, 0x04, 0x0A, 0x10, 0x03, 0x02, 0x0D, 0xE1, 0x00, 0x04, 0x0A, 0x0D, 0x03
	.byte 0x02, 0x0D, 0xE7, 0x00, 0x04, 0x10, 0x08, 0x0F, 0x0A, 0x0D, 0xED, 0x00, 0x04, 0x06, 0x0A, 0x08
	.byte 0x02, 0x0D, 0x9B, 0x01, 0x04, 0x05, 0x01, 0x09, 0x02, 0x0D, 0x8B, 0x00, 0x04, 0x14, 0x05, 0x02
	.byte 0x02, 0x0D, 0xB3, 0x00, 0x04, 0x01, 0x10, 0x08, 0x02, 0x0D, 0xC1, 0x00, 0x04, 0x01, 0x0D, 0x08
	.byte 0x02, 0x0D, 0xD1, 0x00, 0x04, 0x01, 0x08, 0x0C, 0x02, 0x0D, 0x83, 0x01, 0x04, 0x04, 0x05, 0x0B
	.byte 0x02, 0x0D, 0xAB, 0x01, 0x04, 0x17, 0x05, 0x05, 0x02, 0x0D, 0xC1, 0x01, 0x04, 0x0A, 0x10, 0x03
	.byte 0x02, 0x0D, 0xCB, 0x01, 0x04, 0x0A, 0x0D, 0x03, 0x02, 0x0D, 0xD1, 0x01, 0x04, 0x10, 0x08, 0x0F
	.byte 0x0A, 0x0D, 0xD7, 0x01, 0x04, 0x06, 0x0A, 0x08, 0x02, 0x0D, 0x6D, 0x02

ov08_0222522C: ; 0x0222522C
	.byte 0x05, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x25, 0x01, 0x05, 0x01, 0x09, 0x0B, 0x02, 0x0D, 0x49, 0x01, 0x05, 0x01, 0x0B, 0x12
	.byte 0x04, 0x0D, 0x5F, 0x01, 0x05, 0x04, 0x10, 0x0C, 0x02, 0x0D, 0xA7, 0x01, 0x05, 0x18, 0x04, 0x07
	.byte 0x02, 0x0D, 0xBF, 0x01, 0x05, 0x1C, 0x07, 0x03, 0x02, 0x0D, 0xCD, 0x01, 0x05, 0x1C, 0x09, 0x03
	.byte 0x02, 0x0D, 0xD3, 0x01, 0x05, 0x1C, 0x0F, 0x03, 0x02, 0x0D, 0xD9, 0x01, 0x05, 0x1C, 0x0B, 0x03
	.byte 0x02, 0x0D, 0xDF, 0x01, 0x05, 0x1C, 0x0D, 0x03, 0x02, 0x0D, 0xE5, 0x01, 0x05, 0x19, 0x06, 0x06
	.byte 0x01, 0x09, 0xEB, 0x01, 0x05, 0x05, 0x04, 0x03, 0x02, 0x0D, 0xF1, 0x01, 0x05, 0x0D, 0x06, 0x06
	.byte 0x02, 0x0D, 0xF7, 0x01, 0x05, 0x15, 0x04, 0x02, 0x02, 0x0D, 0x85, 0x00, 0x05, 0x15, 0x07, 0x06
	.byte 0x02, 0x0D, 0x89, 0x00, 0x05, 0x15, 0x09, 0x06, 0x02, 0x0D, 0x95, 0x00, 0x05, 0x15, 0x0F, 0x06
	.byte 0x02, 0x0D, 0xA1, 0x00, 0x05, 0x15, 0x0B, 0x06, 0x02, 0x0D, 0xAD, 0x00, 0x05, 0x15, 0x0D, 0x06
	.byte 0x02, 0x0D, 0xB9, 0x00, 0x05, 0x01, 0x04, 0x04, 0x02, 0x0D, 0xC5, 0x00, 0x05, 0x01, 0x06, 0x0B
	.byte 0x02, 0x0D, 0xCD, 0x00, 0x05, 0x0D, 0x14, 0x0B, 0x03, 0x09, 0xE3, 0x00, 0x05, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x37, 0x01, 0x05, 0x01, 0x09, 0x0B, 0x02, 0x0D, 0x61, 0x02, 0x05, 0x01, 0x0B, 0x12
	.byte 0x04, 0x0D, 0x77, 0x02, 0x05, 0x04, 0x10, 0x0C, 0x02, 0x0D, 0xBF, 0x02, 0x05, 0x18, 0x04, 0x07
	.byte 0x02, 0x0D, 0xD7, 0x02, 0x05, 0x1C, 0x07, 0x03, 0x02, 0x0D, 0xE5, 0x02, 0x05, 0x1C, 0x09, 0x03
	.byte 0x02, 0x0D, 0xEB, 0x02, 0x05, 0x1C, 0x0F, 0x03, 0x02, 0x0D, 0xF1, 0x02, 0x05, 0x1C, 0x0B, 0x03
	.byte 0x02, 0x0D, 0xF7, 0x02, 0x05, 0x1C, 0x0D, 0x03, 0x02, 0x0D, 0xFD, 0x02, 0x05, 0x19, 0x06, 0x06
	.byte 0x01, 0x09, 0x03, 0x03, 0x05, 0x05, 0x04, 0x03, 0x02, 0x0D, 0x09, 0x03, 0x05, 0x0D, 0x06, 0x06
	.byte 0x02, 0x0D, 0x0F, 0x03, 0x18, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00

ov08_022253B4: ; 0x022253B4
	.byte 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov08_022253C4: ; 0x022253C4
	.byte 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov08_022253D4: ; 0x022253D4
	.byte 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov08_022253E4: ; 0x022253E4
	.byte 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov08_022253F4: ; 0x022253F4
	.byte 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov08_02225404:
	.byte 0x08, 0xA0, 0xC8, 0xB8, 0x01, 0x00, 0x00, 0x02, 0xC0, 0x08, 0xF8, 0x18
	.byte 0x01, 0x82, 0x00, 0x01, 0xE0, 0xA0, 0xF8, 0xB8, 0x01, 0x02, 0x00, 0x02

ov08_0222541C: ; 0x0222541C
	.byte 0x12, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov08_02225434:
	.byte 0x08, 0xA0, 0x20, 0xB8, 0x00, 0x00, 0x00, 0x01, 0x30, 0xA0, 0x48, 0xB8
	.byte 0x01, 0x01, 0x00, 0x02, 0x68, 0xA0, 0xC0, 0xB8, 0x02, 0x02, 0x01, 0x03, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x03, 0x03, 0x02, 0x03

ov08_02225454: ; 0x02225454
	.byte 0x18, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00

ov08_02225474:
	.byte 0x10, 0x10, 0xF0, 0x88, 0x00, 0x81, 0x00, 0x00, 0x08, 0xA0, 0x60, 0xB8
	.byte 0x00, 0x01, 0x01, 0x02, 0x70, 0xA0, 0xC8, 0xB8, 0x00, 0x02, 0x01, 0x03, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x00, 0x03, 0x02, 0x03

ov08_02225494:
	.byte 0x5C, 0x9D, 0x7C, 0xA5, 0x00, 0x02, 0x00, 0x01, 0x84, 0x9D, 0xA4, 0xA5
	.byte 0x01, 0x03, 0x00, 0x04, 0x5C, 0xAD, 0x7C, 0xB5, 0x00, 0x02, 0x02, 0x03, 0x84, 0xAD, 0xA4, 0xB5
	.byte 0x01, 0x03, 0x02, 0x04, 0xE0, 0xA0, 0xF8, 0xB8, 0x04, 0x04, 0x83, 0x04

ov08_022254BC: ; 0x022254BC
	.word ov08_02225594
	.word ov08_02225474
	.word ov08_02225434
	.word ov08_02225604
	.word ov08_02225494
	.word ov08_022254E4
	.word ov08_022255CC
	.word ov08_02225404
	.word ov08_022255CC
	.word ov08_02225404

ov08_022254E4:
	.byte 0x08, 0x38, 0x78, 0x58, 0x00, 0x02, 0x00, 0x01, 0x88, 0x38, 0xF8, 0x58
	.byte 0x01, 0x03, 0x00, 0x01, 0x08, 0x68, 0x78, 0x88, 0x00, 0x04, 0x02, 0x03, 0x88, 0x68, 0xF8, 0x88
	.byte 0x01, 0x04, 0x02, 0x03, 0xE0, 0xA0, 0xF8, 0xB8, 0x83, 0x04, 0x04, 0x04

ov08_0222550C: ; 0x0222550C
	.byte 0x18, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00
	.byte 0xB0, 0x00, 0x00, 0x00

ov08_02225534: ; 0x02225534
	.byte 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00

ov08_02225564: ; 0x02225564
	.byte 0x1C, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00

ov08_02225594:
	.byte 0x08, 0x08, 0x78, 0x28, 0x06, 0x02, 0x06, 0x01, 0x88, 0x10, 0xF8, 0x30
	.byte 0x04, 0x03, 0x00, 0x02, 0x08, 0x38, 0x78, 0x58, 0x00, 0x04, 0x01, 0x03, 0x88, 0x40, 0xF8, 0x60
	.byte 0x01, 0x05, 0x02, 0x04, 0x08, 0x68, 0x78, 0x88, 0x02, 0x01, 0x03, 0x05, 0x88, 0x70, 0xF8, 0x90
	.byte 0x03, 0x06, 0x04, 0x06, 0xE0, 0xA0, 0xF8, 0xB8, 0x05, 0x00, 0x05, 0x00

ov08_022255CC:
	.byte 0x08, 0x38, 0x78, 0x58
	.byte 0x05, 0x02, 0x00, 0x01, 0x88, 0x38, 0xF8, 0x58, 0x05, 0x03, 0x00, 0x01, 0x08, 0x68, 0x78, 0x88
	.byte 0x00, 0x04, 0x02, 0x03, 0x88, 0x68, 0xF8, 0x88, 0x01, 0x06, 0x02, 0x03, 0x48, 0x98, 0xB8, 0xB8
	.byte 0x02, 0x04, 0x04, 0x06, 0xC0, 0x08, 0xF8, 0x18, 0x05, 0x81, 0x00, 0x05, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x03, 0x06, 0x04, 0x06

ov08_02225604:
	.byte 0x08, 0x38, 0x78, 0x58, 0x00, 0x02, 0x00, 0x01, 0x88, 0x38, 0xF8, 0x58
	.byte 0x01, 0x03, 0x00, 0x01, 0x08, 0x68, 0x78, 0x88, 0x00, 0x84, 0x02, 0x03, 0x88, 0x68, 0xF8, 0x88
	.byte 0x01, 0x87, 0x02, 0x03, 0x08, 0xA0, 0x20, 0xB8, 0x02, 0x04, 0x04, 0x05, 0x30, 0xA0, 0x48, 0xB8
	.byte 0x02, 0x05, 0x04, 0x06, 0x68, 0xA0, 0xC0, 0xB8, 0x03, 0x06, 0x05, 0x07, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x03, 0x07, 0x06, 0x07

ov08_02225644: ; 0x02225644
	.byte 0x16, 0xB0, 0x00, 0x00

ov08_02225648: ; 0x02225648
	.byte 0x0A, 0xB0, 0x00, 0x00

ov08_0222564C: ; 0x0222564C
	.byte 0x0A, 0xB0, 0x00, 0x00

ov08_02225650: ; 0x02225650
	.byte 0x0A, 0xB0, 0x00, 0x00

ov08_02225654: ; 0x02225654
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0B, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0C, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0D, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0E, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x17, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x17, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00
	.byte 0x0B, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00
	.byte 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0xB0, 0x00, 0x00
	.byte 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x17, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov08_02225950:
	.byte 0x02, 0xFF, 0x00, 0x00

ov08_02225954:
	.byte 0x03, 0xFF, 0x00, 0x00

ov08_02225958:
	.byte 0x04, 0xFF, 0x00, 0x00

ov08_0222595C:
	.byte 0x01, 0xFF, 0x00, 0x00

ov08_02225960:
	.byte 0x01, 0xFF, 0x00, 0x00

ov08_02225964:
	.byte 0x0B, 0xFF, 0x00, 0x00

ov08_02225968:
	.byte 0x00, 0xFF, 0x00, 0x00

ov08_0222596C:
	.byte 0x03, 0xFF, 0x00, 0x00

ov08_02225970:
	.byte 0x05, 0xFF, 0x00, 0x00

ov08_02225974:
	.byte 0x02, 0xFF, 0x00, 0x00

ov08_02225978:
	.byte 0x06, 0xFF, 0x00, 0x00

ov08_0222597C:
	.byte 0x04, 0xFF, 0x00, 0x00

ov08_02225980:
	.byte 0x03, 0xFF, 0x00, 0x00

ov08_02225984:
	.byte 0x02, 0xFF, 0x00, 0x00

ov08_02225988:
	.byte 0x05, 0xFF, 0x00, 0x00

ov08_0222598C:
	.byte 0x01, 0xFF, 0x00, 0x00

ov08_02225990:
	.byte 0x04, 0xFF, 0x00, 0x00

ov08_02225994:
	.byte 0x02, 0xFF, 0x00, 0x00

ov08_02225998:
	.byte 0x03, 0xFF, 0x00, 0x00

ov08_0222599C:
	.byte 0x05, 0xFF, 0x00, 0x00

ov08_022259A0:
	.byte 0x15, 0xFF, 0x00, 0x00

ov08_022259A4:
	.byte 0x00, 0x01, 0xFF, 0x00

ov08_022259A8:
	.byte 0x07, 0x01, 0xFF, 0x00

ov08_022259AC: ; 0x022259AC
	.byte 0x02, 0x04, 0x02, 0x00

ov08_022259B0:
	.byte 0x08, 0x02, 0xFF, 0x00

ov08_022259B4:
	.byte 0x09, 0x03, 0xFF, 0x00

ov08_022259B8:
	.byte 0x0A, 0x04, 0xFF, 0x00

ov08_022259BC: ; 0x022259BC
	.byte 0x02, 0x03, 0x01, 0x00

ov08_022259C0: ; 0x022259C0
	.byte 0x02, 0x00, 0xFC, 0xFF, 0x02, 0x00

ov08_022259C6: ; 0x022259C6
	.byte 0x02, 0x00, 0xFD, 0xFF, 0x01, 0x00

ov08_022259CC: ; 0x022259CC
	.word ov08_02225968
	.word ov08_02225960
	.word ov08_02225994
	.word ov08_0222596C
	.word ov08_02225958
	.word ov08_02225970
	.word 0
	.word ov08_022259A4
	.word ov08_02225950
	.word ov08_0222599C
	.word ov08_02225954
	.word ov08_022259A0
	.word 0
	.word 0
	.word ov08_022259A8
	.word ov08_022259B0
	.word ov08_022259B4
	.word ov08_022259B8
	.word 0
	.word ov08_0222598C
	.word ov08_02225984
	.word ov08_02225980
	.word ov08_0222597C
	.word ov08_0222595C
	.word ov08_02225974
	.word ov08_02225998
	.word ov08_02225990
	.word ov08_02225988
	.word ov08_02225964
	.word ov08_02225978
	.word 0
	.word 0
	.word 0
	.word 0

ov08_02225A54: ; 0x02225A54
	.byte 0x00

ov08_02225A55: ; 0x02225A55
	.byte 0x00

ov08_02225A56: ; 0x02225A56
	.byte 0x10

ov08_02225A57: ; 0x02225A57
	.byte 0x06, 0x10, 0x01, 0x10, 0x06, 0x00, 0x06, 0x10, 0x06
	.byte 0x10, 0x07, 0x10, 0x06, 0x00, 0x0C, 0x10, 0x06, 0x10, 0x0D, 0x10, 0x06, 0x1B, 0x13, 0x05, 0x05
	.byte 0x01, 0x01, 0x1E, 0x11, 0x00, 0x13, 0x0D, 0x05, 0x0C, 0x13, 0x0D, 0x05, 0x0D, 0x13, 0x0D, 0x05
	.byte 0x0C, 0x13, 0x0D, 0x05, 0x00, 0x13, 0x05, 0x05, 0x05, 0x13, 0x05, 0x05, 0x00, 0x06, 0x10, 0x06
	.byte 0x10, 0x06, 0x10, 0x06, 0x00, 0x0C, 0x10, 0x06, 0x10, 0x0C, 0x10, 0x06, 0x17, 0x00, 0x09, 0x04
	.byte 0x00, 0x06, 0x10, 0x06, 0x10, 0x06, 0x10, 0x06, 0x00, 0x0C, 0x10, 0x06, 0x10, 0x0C, 0x10, 0x06
	.byte 0x00, 0x06, 0x10, 0x06, 0x10, 0x06, 0x10, 0x06, 0x00, 0x0C, 0x10, 0x06, 0x10, 0x0C, 0x10, 0x06
	.byte 0x08, 0x12, 0x10, 0x06, 0x00, 0x13, 0x1A, 0x05, 0x00, 0x13, 0x1A, 0x05, 0x0B, 0x13, 0x05, 0x02
	.byte 0x10, 0x13, 0x05, 0x02, 0x0B, 0x15, 0x05, 0x02, 0x10, 0x15, 0x05, 0x02

ov08_02225ADC: ; 0x02225ADC
	.byte 0x98, 0xBF, 0x00, 0xCF
	.byte 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov08_02225AE8: ; 0x02225AE8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov08_02225AF8: ; 0x02225AF8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov08_02225B14: ; 0x02225B14
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov08_02225B30: ; 0x02225B30
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x1A, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov08_02225B4C: ; 0x02225B4C
	.byte 0x08, 0x4F, 0x00, 0x7F
	.byte 0x50, 0x97, 0x00, 0x7F, 0x08, 0x4F, 0x80, 0xFF, 0x50, 0x97, 0x80, 0xFF, 0x98, 0xBF, 0x00, 0xCF
	.byte 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov08_02225B68: ; 0x02225B68
	.byte 0x08, 0x37, 0x00, 0x7F, 0x08, 0x37, 0x80, 0xFF
	.byte 0x38, 0x67, 0x00, 0x7F, 0x38, 0x67, 0x80, 0xFF, 0x68, 0x97, 0x00, 0x7F, 0x68, 0x97, 0x80, 0xFF
	.byte 0x98, 0xBF, 0xD8, 0xFF, 0x98, 0xBF, 0x00, 0x27, 0x98, 0xBF, 0x28, 0x4F, 0xFF, 0x00, 0x00, 0x00

ov08_02225B90: ; 0x02225B90
	.byte 0x04, 0x02, 0x13, 0x1B, 0x04, 0x0F, 0x76, 0x03

ov08_02225B98: ; 0x02225B98
	.byte 0x05, 0x07, 0x04, 0x0C, 0x02, 0x04, 0xC7, 0x02
	.byte 0x05, 0x14, 0x04, 0x04, 0x02, 0x04, 0xDF, 0x02, 0x05, 0x02, 0x09, 0x1C, 0x06, 0x04, 0xE7, 0x02
	.byte 0x05, 0x08, 0x14, 0x0A, 0x03, 0x00, 0x8F, 0x03

ov08_02225BB8: ; 0x02225BB8
	.byte 0x04, 0x02, 0x04, 0x0C, 0x05, 0x00, 0xCE, 0x02
	.byte 0x04, 0x02, 0x0D, 0x0C, 0x05, 0x00, 0x0A, 0x03, 0x04, 0x12, 0x05, 0x0C, 0x03, 0x00, 0x86, 0x02
	.byte 0x04, 0x12, 0x0E, 0x0C, 0x03, 0x00, 0xAA, 0x02, 0x04, 0x05, 0x14, 0x14, 0x03, 0x00, 0x4A, 0x02

ov08_02225BE0: ; 0x02225BE0
	.byte 0x09, 0x00, 0x00, 0x00

ov08_02225BE4: ; 0x02225BE4
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov08_02225C10: ; 0x02225C10
	.byte 0x05, 0x01, 0x01, 0x0E, 0x03, 0x00, 0x01, 0x00, 0x05, 0x08, 0x04, 0x04, 0x03, 0x04, 0x2B, 0x00
	.byte 0x05, 0x11, 0x01, 0x0E, 0x03, 0x00, 0x37, 0x00, 0x05, 0x18, 0x04, 0x04, 0x03, 0x04, 0x61, 0x00
	.byte 0x05, 0x01, 0x07, 0x0E, 0x03, 0x00, 0x6D, 0x00, 0x05, 0x08, 0x0A, 0x04, 0x03, 0x04, 0x97, 0x00
	.byte 0x05, 0x11, 0x07, 0x0E, 0x03, 0x00, 0xA3, 0x00, 0x05, 0x18, 0x0A, 0x04, 0x03, 0x04, 0xCD, 0x00
	.byte 0x05, 0x01, 0x0D, 0x0E, 0x03, 0x00, 0xD9, 0x00, 0x05, 0x08, 0x10, 0x04, 0x03, 0x04, 0x03, 0x01
	.byte 0x05, 0x11, 0x0D, 0x0E, 0x03, 0x00, 0x0F, 0x01, 0x05, 0x18, 0x10, 0x04, 0x03, 0x04, 0x39, 0x01
	.byte 0x05, 0x01, 0x01, 0x0E, 0x03, 0x00, 0x45, 0x01, 0x05, 0x08, 0x04, 0x04, 0x03, 0x04, 0x6F, 0x01
	.byte 0x05, 0x11, 0x01, 0x0E, 0x03, 0x00, 0x7B, 0x01, 0x05, 0x18, 0x04, 0x04, 0x03, 0x04, 0xA5, 0x01
	.byte 0x05, 0x01, 0x07, 0x0E, 0x03, 0x00, 0xB1, 0x01, 0x05, 0x08, 0x0A, 0x04, 0x03, 0x04, 0xDB, 0x01
	.byte 0x05, 0x11, 0x07, 0x0E, 0x03, 0x00, 0xE7, 0x01, 0x05, 0x18, 0x0A, 0x04, 0x03, 0x04, 0x11, 0x02
	.byte 0x05, 0x01, 0x0D, 0x0E, 0x03, 0x00, 0x1D, 0x02, 0x05, 0x08, 0x10, 0x04, 0x03, 0x04, 0x47, 0x02
	.byte 0x05, 0x11, 0x0D, 0x0E, 0x03, 0x00, 0x53, 0x02, 0x05, 0x18, 0x10, 0x04, 0x03, 0x04, 0x7D, 0x02
	.byte 0x05, 0x0B, 0x13, 0x0A, 0x05, 0x04, 0x89, 0x02, 0x05, 0x16, 0x14, 0x04, 0x03, 0x04, 0xBB, 0x02
ov08_02225CE0:
	.byte 0x02, 0x03, 0x00, 0x01, 0x00

	.balign 4
ov08_02225CE8:
	.byte 0x28, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0xB2, 0x00, 0x00, 0x00

ov08_02225CF8: ; 0x02225CF8
	.word ov08_02225D44
	.word ov08_02225DA4
	.word ov08_02225D04

ov08_02225D04:
	.byte 0x08, 0xA0, 0xC8, 0xB8, 0x00, 0x00, 0x00, 0x01, 0xE0, 0xA0, 0xF8, 0xB8, 0x01, 0x01, 0x00, 0x01

ov08_02225D14: ; 0x02225D14
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov08_02225D2C: ; 0x02225D2C
	.byte 0xC0, 0x00, 0x00, 0x00

ov08_02225D30: ; 0x02225D30
	.byte 0x18, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00
	.byte 0x98, 0x00, 0x00, 0x00

ov08_02225D44:
	.byte 0x08, 0x10, 0x78, 0x48, 0x00, 0x01, 0x00, 0x02, 0x08, 0x58, 0x78, 0x90
	.byte 0x00, 0x04, 0x01, 0x03, 0x88, 0x10, 0xF8, 0x48, 0x02, 0x03, 0x00, 0x02, 0x88, 0x58, 0xF8, 0x90
	.byte 0x02, 0x05, 0x01, 0x03, 0x08, 0xA0, 0xC8, 0xB8, 0x01, 0x04, 0x04, 0x05, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x83, 0x05, 0x04, 0x05

ov08_02225D74: ; 0x02225D74
	.byte 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x8D, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00
	.byte 0x8D, 0x00, 0x00, 0x00

ov08_02225DA4:
	.byte 0x08, 0x10, 0x78, 0x30, 0x00, 0x02, 0x00, 0x01, 0x88, 0x10, 0xF8, 0x30
	.byte 0x01, 0x03, 0x00, 0x01, 0x08, 0x40, 0x78, 0x60, 0x00, 0x04, 0x02, 0x03, 0x88, 0x40, 0xF8, 0x60
	.byte 0x01, 0x05, 0x02, 0x03, 0x08, 0x70, 0x78, 0x90, 0x02, 0x06, 0x04, 0x05, 0x88, 0x70, 0xF8, 0x90
	.byte 0x03, 0x06, 0x04, 0x05, 0xE0, 0xA0, 0xF8, 0xB8, 0x85, 0x06, 0x06, 0x06

ov08_02225DDC: ; 0x02225DDC
	.byte 0xB7, 0xB4, 0x00, 0x00

ov08_02225DE0: ; 0x02225DE0
	.byte 0xB7, 0xB4, 0x00, 0x00

ov08_02225DE4: ; 0x02225DE4
	.byte 0xB7, 0xB4, 0x00, 0x00

ov08_02225DE8: ; 0x02225DE8
	.byte 0xB7, 0xB4, 0x00, 0x00

ov08_02225DEC: ; 0x02225DEC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0xB8, 0xB4, 0x00, 0x00, 0xB8, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xB9, 0xB4, 0x00, 0x00, 0xB9, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00
	.byte 0xB7, 0xB4, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBA, 0xB4, 0x00, 0x00, 0xBA, 0xB4, 0x00, 0x00
	.byte 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBB, 0xB4, 0x00, 0x00
	.byte 0xBB, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xBC, 0xB4, 0x00, 0x00, 0xBC, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov08_02225E54:
	.byte 0x03, 0xFF, 0x00, 0x00

ov08_02225E58:
	.byte 0x03, 0xFF, 0x00, 0x00

ov08_02225E5C:
	.byte 0x01, 0xFF, 0x00, 0x00

ov08_02225E60:
	.byte 0x04, 0xFF, 0x00, 0x00

ov08_02225E64:
	.byte 0x02, 0xFF, 0x00, 0x00

ov08_02225E68:
	.byte 0x00, 0xFF, 0x00, 0x00

ov08_02225E6C:
	.byte 0x0E, 0x0F, 0xFF, 0x00

ov08_02225E70:
	.byte 0x10, 0x11, 0xFF, 0x00

ov08_02225E74:
	.byte 0x16, 0x17, 0xFF, 0x00

ov08_02225E78:
	.byte 0x06, 0x07, 0xFF, 0x00

ov08_02225E7C:
	.byte 0x04, 0x05, 0xFF, 0x00

ov08_02225E80:
	.byte 0x02, 0x03, 0xFF, 0x00

ov08_02225E84:
	.byte 0x00, 0x01, 0xFF, 0x00

ov08_02225E88:
	.byte 0x08, 0x09, 0xFF, 0x00

ov08_02225E8C:
	.byte 0x12, 0x13, 0xFF, 0x00

ov08_02225E90:
	.byte 0x0A, 0x0B, 0xFF, 0x00

ov08_02225E94:
	.byte 0x0C, 0x0D, 0xFF, 0x00

ov08_02225E98:
	.byte 0x14, 0x15, 0xFF, 0x00

ov08_02225E9C: ; 0x02225E9C
	.byte 0x00

ov08_02225E9D: ; 0x02225E9D
	.byte 0x01

ov08_02225E9E: ; 0x02225E9E
	.byte 0x10

ov08_02225E9F: ; 0x02225E9F
	.byte 0x09
	.byte 0x00, 0x0A, 0x10, 0x09, 0x10, 0x01, 0x10, 0x09, 0x10, 0x0A, 0x10, 0x09, 0x00, 0x13, 0x1A, 0x05
	.byte 0x1B, 0x13, 0x05, 0x05, 0x20, 0x01, 0x10, 0x06, 0x30, 0x01, 0x10, 0x06, 0x20, 0x07, 0x10, 0x06
	.byte 0x30, 0x07, 0x10, 0x06, 0x20, 0x0D, 0x10, 0x06, 0x30, 0x0D, 0x10, 0x06, 0x20, 0x13, 0x05, 0x05
	.byte 0x25, 0x13, 0x05, 0x05, 0x3B, 0x13, 0x05, 0x05, 0x00, 0x33, 0x1A, 0x05, 0x1B, 0x33, 0x05, 0x05

ov08_02225EE0: ; 0x02225EE0
	.word ov08_02225E68
	.word ov08_02225E5C
	.word ov08_02225E64
	.word ov08_02225E54
	.word ov08_02225E60
	.word 0
	.word ov08_02225E84
	.word ov08_02225E80
	.word ov08_02225E7C
	.word ov08_02225E78
	.word ov08_02225E88
	.word ov08_02225E90
	.word 0
	.word 0
	.word 0
	.word ov08_02225E58
	.word 0
	.word ov08_02225E94
	.word ov08_02225E6C
	.word ov08_02225E70
	.word ov08_02225E8C
	.word ov08_02225E98
	.word ov08_02225E74
