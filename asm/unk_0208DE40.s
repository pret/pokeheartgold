#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
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
	bl GF_Camera_Create
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
	bl GF_Camera_SetClipBounds
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02023234
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl GF_Camera_RegisterToStaticPtr
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
	bl GetBoxmonSpriteCharAndPlttNarcIds
	b _0208E3E4
_0208E3DE:
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
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
