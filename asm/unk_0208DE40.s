#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

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
	bl BoxmonBelongsToPlayer
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
	bl BoxmonBelongsToPlayer
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
	.word MON_DATA_HOENN_CHAMPION_RIBBON
	.short 0x0048, 0x0000, 0x0000, 0x0050
	.word MON_DATA_HOENN_COOL_RIBBON
	.short 0x0049, 0x0000, 0x0001, 0x0051
	.word MON_DATA_HOENN_COOL_RIBBON_SUPER
	.short 0x004A, 0x0000, 0x0002, 0x0052
	.word MON_DATA_HOENN_COOL_RIBBON_HYPER
	.short 0x004B, 0x0000, 0x0003, 0x0053
	.word MON_DATA_HOENN_COOL_RIBBON_MASTER
	.short 0x004C, 0x0000, 0x0004, 0x0054
	.word MON_DATA_HOENN_BEAUTY_RIBBON
	.short 0x0049, 0x0001, 0x0005, 0x0055
	.word MON_DATA_HOENN_BEAUTY_RIBBON_SUPER
	.short 0x004A, 0x0001, 0x0006, 0x0056
	.word MON_DATA_HOENN_BEAUTY_RIBBON_HYPER
	.short 0x004B, 0x0001, 0x0007, 0x0057
	.word MON_DATA_HOENN_BEAUTY_RIBBON_MASTER
	.short 0x004C, 0x0001, 0x0008, 0x0058
	.word MON_DATA_HOENN_CUTE_RIBBON
	.short 0x0049, 0x0002, 0x0009, 0x0059
	.word MON_DATA_HOENN_CUTE_RIBBON_SUPER
	.short 0x004A, 0x0002, 0x000A, 0x005A
	.word MON_DATA_HOENN_CUTE_RIBBON_HYPER
	.short 0x004B, 0x0002, 0x000B, 0x005B
	.word MON_DATA_HOENN_CUTE_RIBBON_MASTER
	.short 0x004C, 0x0002, 0x000C, 0x005C
	.word MON_DATA_HOENN_SMART_RIBBON
	.short 0x0049, 0x0003, 0x000D, 0x005D
	.word MON_DATA_HOENN_SMART_RIBBON_SUPER
	.short 0x004A, 0x0003, 0x000E, 0x005E
	.word MON_DATA_HOENN_SMART_RIBBON_HYPER
	.short 0x004B, 0x0003, 0x000F, 0x005F
	.word MON_DATA_HOENN_SMART_RIBBON_MASTER
	.short 0x004C, 0x0003, 0x0010, 0x0060
	.word MON_DATA_HOENN_TOUGH_RIBBON
	.short 0x0049, 0x0004, 0x0011, 0x0061
	.word MON_DATA_HOENN_TOUGH_RIBBON_SUPER
	.short 0x004A, 0x0004, 0x0012, 0x0062
	.word MON_DATA_HOENN_TOUGH_RIBBON_HYPER
	.short 0x004B, 0x0004, 0x0013, 0x0063
	.word MON_DATA_HOENN_TOUGH_RIBBON_MASTER
	.short 0x004C, 0x0004, 0x0014, 0x0064
	.word MON_DATA_HOENN_WINNING_RIBBON
	.short 0x004E, 0x0000, 0x0015, 0x0065
	.word MON_DATA_HOENN_VICTORY_RIBBON
	.short 0x004D, 0x0000, 0x0016, 0x0066
	.word MON_DATA_HOENN_ARTIST_RIBBON
	.short 0x004F, 0x0001, 0x0017, 0x0067
	.word MON_DATA_HOENN_EFFORT_RIBBON
	.short 0x0050, 0x0002, 0x0018, 0x0068
	.word MON_DATA_HOENN_MARINE_RIBBON
	.short 0x0051, 0x0001, 0x0019, 0x8000
	.word MON_DATA_HOENN_LAND_RIBBON
	.short 0x0051, 0x0003, 0x001A, 0x8001
	.word MON_DATA_HOENN_SKY_RIBBON
	.short 0x0051, 0x0004, 0x001B, 0x8002
	.word MON_DATA_HOENN_COUNTRY_RIBBON
	.short 0x0052, 0x0003, 0x001C, 0x00B2
	.word MON_DATA_HOENN_NATIONAL_RIBBON
	.short 0x0052, 0x0004, 0x001D, 0x00BE
	.word MON_DATA_HOENN_EARTH_RIBBON
	.short 0x0053, 0x0000, 0x001E, 0x00BF
	.word MON_DATA_HOENN_WORLD_RIBBON
	.short 0x0053, 0x0001, 0x001F, 0x00B2
	.word MON_DATA_SINNOH_CHAMP_RIBBON
	.short 0x0058, 0x0000, 0x0020, 0x0069
	.word MON_DATA_COOL_RIBBON
	.short 0x0059, 0x0000, 0x0021, 0x006A
	.word MON_DATA_COOL_RIBBON_GREAT
	.short 0x005A, 0x0000, 0x0022, 0x006B
	.word MON_DATA_COOL_RIBBON_ULTRA
	.short 0x005B, 0x0000, 0x0023, 0x006C
	.word MON_DATA_COOL_RIBBON_MASTER
	.short 0x005C, 0x0000, 0x0024, 0x006D
	.word MON_DATA_BEAUTY_RIBBON
	.short 0x0059, 0x0001, 0x0025, 0x006E
	.word MON_DATA_BEAUTY_RIBBON_GREAT
	.short 0x005A, 0x0001, 0x0026, 0x006F
	.word MON_DATA_BEAUTY_RIBBON_ULTRA
	.short 0x005B, 0x0001, 0x0027, 0x0070
	.word MON_DATA_BEAUTY_RIBBON_MASTER
	.short 0x005C, 0x0001, 0x0028, 0x0071
	.word MON_DATA_CUTE_RIBBON
	.short 0x0059, 0x0002, 0x0029, 0x0072
	.word MON_DATA_CUTE_RIBBON_GREAT
	.short 0x005A, 0x0002, 0x002A, 0x0073
	.word MON_DATA_CUTE_RIBBON_ULTRA
	.short 0x005B, 0x0002, 0x002B, 0x0074
	.word MON_DATA_CUTE_RIBBON_MASTER
	.short 0x005C, 0x0002, 0x002C, 0x0075
	.word MON_DATA_SMART_RIBBON
	.short 0x0059, 0x0003, 0x002D, 0x0076
	.word MON_DATA_SMART_RIBBON_GREAT
	.short 0x005A, 0x0003, 0x002E, 0x0077
	.word MON_DATA_SMART_RIBBON_ULTRA
	.short 0x005B, 0x0003, 0x002F, 0x0078
	.word MON_DATA_SMART_RIBBON_MASTER
	.short 0x005C, 0x0003, 0x0030, 0x0079
	.word MON_DATA_TOUGH_RIBBON
	.short 0x0059, 0x0004, 0x0031, 0x007A
	.word MON_DATA_TOUGH_RIBBON_GREAT
	.short 0x005A, 0x0004, 0x0032, 0x007B
	.word MON_DATA_TOUGH_RIBBON_ULTRA
	.short 0x005B, 0x0004, 0x0033, 0x007C
	.word MON_DATA_TOUGH_RIBBON_MASTER
	.short 0x005C, 0x0004, 0x0034, 0x007D
	.word MON_DATA_ABILITY_RIBBON
	.short 0x005D, 0x0000, 0x0035, 0x007E
	.word MON_DATA_GREAT_ABILITY_RIBBON
	.short 0x005E, 0x0000, 0x0036, 0x007F
	.word MON_DATA_DOUBLE_ABILITY_RIBBON
	.short 0x005F, 0x0000, 0x0037, 0x0080
	.word MON_DATA_MULTI_ABILITY_RIBBON
	.short 0x0060, 0x0000, 0x0038, 0x0081
	.word MON_DATA_PAIR_ABILITY_RIBBON
	.short 0x0061, 0x0000, 0x0039, 0x0082
	.word MON_DATA_WORLD_ABILITY_RIBBON
	.short 0x0062, 0x0000, 0x003A, 0x0083
	.word MON_DATA_ALERT_RIBBON
	.short 0x0063, 0x0002, 0x003B, 0x0084
	.word MON_DATA_SHOCK_RIBBON
	.short 0x0064, 0x0000, 0x003C, 0x0085
	.word MON_DATA_DOWNCAST_RIBBON
	.short 0x0065, 0x0001, 0x003D, 0x0086
	.word MON_DATA_CARELESS_RIBBON
	.short 0x0066, 0x0002, 0x003E, 0x0087
	.word MON_DATA_RELAX_RIBBON
	.short 0x0067, 0x0003, 0x003F, 0x0088
	.word MON_DATA_SNOOZE_RIBBON
	.short 0x0068, 0x0000, 0x0040, 0x0089
	.word MON_DATA_SMILE_RIBBON
	.short 0x0069, 0x0002, 0x0041, 0x008A
	.word MON_DATA_GORGEOUS_RIBBON
	.short 0x006A, 0x0001, 0x0042, 0x008B
	.word MON_DATA_ROYAL_RIBBON
	.short 0x006B, 0x0003, 0x0043, 0x008C
	.word MON_DATA_GORGEOUS_ROYAL_RIBBON
	.short 0x006C, 0x0000, 0x0044, 0x008D
	.word MON_DATA_FOOTPRINT_RIBBON
	.short 0x006D, 0x0000, 0x0045, 0x008E
	.word MON_DATA_RECORD_RIBBON
	.short 0x006E, 0x0001, 0x0046, 0x008F
	.word MON_DATA_HISTORY_RIBBON
	.short 0x006F, 0x0003, 0x0047, 0x0090
	.word MON_DATA_LEGEND_RIBBON
	.short 0x0070, 0x0000, 0x0048, 0x0091
	.word MON_DATA_RED_RIBBON
	.short 0x0071, 0x0000, 0x0049, 0x8007
	.word MON_DATA_GREEN_RIBBON
	.short 0x0072, 0x0003, 0x004A, 0x8008
	.word MON_DATA_BLUE_RIBBON
	.short 0x0073, 0x0001, 0x004B, 0x8009
	.word MON_DATA_FESTIVAL_RIBBON
	.short 0x0074, 0x0001, 0x004C, 0x800A
	.word MON_DATA_CARNIVAL_RIBBON
	.short 0x0075, 0x0000, 0x004D, 0x800B
	.word MON_DATA_CLASSIC_RIBBON
	.short 0x0076, 0x0001, 0x004E, 0x800C
	.word MON_DATA_PREMIER_RIBBON
	.short 0x0077, 0x0000, 0x004F, 0x800D

	; File boundary

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
