	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02018030
sub_02018030: ; 0x02018030
	push {r3, r4, r5, lr}
	mov r4, #0
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	str r4, [sp]
	add r2, r4, #0
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5]
	add r0, r5, #0
	bl sub_02018324
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02018030

	thumb_func_start sub_0201804C
sub_0201804C: ; 0x0201804C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl AllocAndLoad3dTexResources
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl Bind3dModelSet
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0201804C

	thumb_func_start sub_02018068
sub_02018068: ; 0x02018068
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02018098
	add r1, sp, #4
	add r2, sp, #0
	bl NNS_G3dTexReleaseTexKey
	ldr r1, _020180B4 ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r0, [sp, #4]
	ldr r1, [r1]
	blx r1
	ldr r1, _020180B4 ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r0, [sp]
	ldr r1, [r1]
	blx r1
	ldr r0, [r4, #0xc]
	bl NNS_G3dPlttReleasePlttKey
	ldr r1, _020180B8 ; =NNS_GfdDefaultFuncFreePlttVram
	ldr r1, [r1]
	blx r1
_02018098:
	ldr r0, [r4]
	cmp r0, #0
	beq _020180A2
	bl FreeToHeap
_020180A2:
	mov r1, #0x10
	mov r0, #0
_020180A6:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _020180A6
	add sp, #8
	pop {r4, pc}
	nop
_020180B4: .word NNS_GfdDefaultFuncFreeTexVram
_020180B8: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end sub_02018068

	thumb_func_start sub_020180BC
sub_020180BC: ; 0x020180BC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	mov r6, #0
	add r1, r3, #0
	add r5, r0, #0
	add r0, r2, #0
	ldr r3, [sp, #0x18]
	add r2, r6, #0
	str r6, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	add r2, r0, #0
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020182F8
	add r0, r6, #0
	str r0, [r5, #0x10]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020180BC

	thumb_func_start sub_020180E8
sub_020180E8: ; 0x020180E8
	push {r4, lr}
	add r4, r0, #0
	bl sub_020182F8
	mov r0, #1
	str r0, [r4, #0x10]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020180E8

	thumb_func_start sub_020180F8
sub_020180F8: ; 0x020180F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02018116
	add r0, r1, #0
	ldr r1, [r4, #8]
	bl NNS_G3dFreeAnmObj
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _02018116
	ldr r0, [r4]
	bl FreeToHeap
_02018116:
	mov r1, #0x14
	mov r0, #0
_0201811A:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _0201811A
	pop {r4, pc}
	thumb_func_end sub_020180F8

	thumb_func_start sub_02018124
sub_02018124: ; 0x02018124
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	ldr r0, [r0, #8]
	ldrh r0, [r0, #4]
	lsl r2, r0, #0xc
	cmp r1, #0
	ble _02018142
	ldr r0, [r4, #0xc]
	add r0, r0, r1
	add r1, r2, #0
	bl _s32_div_f
	str r1, [r4, #0xc]
	b _02018154
_02018142:
	ldr r0, [r4, #0xc]
	add r3, r4, #0
	add r3, #0xc
	add r0, r0, r1
	str r0, [r4, #0xc]
	bpl _02018154
	ldr r0, [r3]
	add r0, r0, r2
	str r0, [r3]
_02018154:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	str r1, [r0]
	pop {r4, pc}
	thumb_func_end sub_02018124

	thumb_func_start sub_0201815C
sub_0201815C: ; 0x0201815C
	push {r3, r4}
	ldr r2, [r0, #8]
	ldr r3, [r0, #0xc]
	ldr r2, [r2, #8]
	ldrh r2, [r2, #4]
	lsl r4, r2, #0xc
	mov r2, #0
	cmp r1, #0
	ble _0201817E
	add r1, r3, r1
	cmp r1, r4
	bge _02018178
	str r1, [r0, #0xc]
	b _0201818A
_02018178:
	str r4, [r0, #0xc]
	mov r2, #1
	b _0201818A
_0201817E:
	add r1, r3, r1
	bmi _02018186
	str r1, [r0, #0xc]
	b _0201818A
_02018186:
	str r2, [r0, #0xc]
	mov r2, #1
_0201818A:
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #8]
	str r1, [r0]
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201815C

	thumb_func_start sub_02018198
sub_02018198: ; 0x02018198
	str r1, [r0, #0xc]
	ldr r0, [r0, #8]
	str r1, [r0]
	bx lr
	thumb_func_end sub_02018198

	thumb_func_start sub_020181A0
sub_020181A0: ; 0x020181A0
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_020181A0

	thumb_func_start sub_020181A4
sub_020181A4: ; 0x020181A4
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	ldrh r0, [r0, #4]
	lsl r0, r0, #0xc
	bx lr
	.balign 4, 0
	thumb_func_end sub_020181A4

	thumb_func_start sub_020181B0
sub_020181B0: ; 0x020181B0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0
	mov r2, #0x78
	add r4, r0, #0
	bl memset
	ldr r1, [r5, #8]
	add r0, r4, #0
	bl NNS_G3dRenderObjInit
	mov r0, #1
	str r0, [r4, #0x6c]
	lsl r0, r0, #0xc
	str r0, [r4, #0x60]
	str r0, [r4, #0x64]
	str r0, [r4, #0x68]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020181B0

	thumb_func_start sub_020181D4
sub_020181D4: ; 0x020181D4
	ldr r3, _020181DC ; =NNS_G3dRenderObjAddAnmObj
	ldr r1, [r1, #8]
	bx r3
	nop
_020181DC: .word NNS_G3dRenderObjAddAnmObj
	thumb_func_end sub_020181D4

	thumb_func_start sub_020181E0
sub_020181E0: ; 0x020181E0
	ldr r3, _020181E8 ; =NNS_G3dRenderObjRemoveAnmObj
	ldr r1, [r1, #8]
	bx r3
	nop
_020181E8: .word NNS_G3dRenderObjRemoveAnmObj
	thumb_func_end sub_020181E0

	thumb_func_start sub_020181EC
sub_020181EC: ; 0x020181EC
	push {r4, lr}
	sub sp, #0x48
	add r4, r0, #0
	ldr r0, [r4, #0x6c]
	cmp r0, #0
	beq _02018280
	add r0, sp, #0x24
	bl MTX_Identity33_
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	ldr r3, _02018284 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotX33_
	add r1, sp, #0x24
	add r0, sp, #0
	add r2, r1, #0
	bl MTX_Concat33
	add r0, r4, #0
	add r0, #0x74
	ldrh r0, [r0]
	ldr r3, _02018284 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r1, sp, #0x24
	add r0, sp, #0
	add r2, r1, #0
	bl MTX_Concat33
	add r0, r4, #0
	add r0, #0x72
	ldrh r0, [r0]
	ldr r3, _02018284 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotY33_
	add r1, sp, #0x24
	add r0, sp, #0
	add r2, r1, #0
	bl MTX_Concat33
	add r1, r4, #0
	add r0, r4, #0
	add r4, #0x60
	add r1, #0x54
	add r2, sp, #0x24
	add r3, r4, #0
	bl Draw3dModel
_02018280:
	add sp, #0x48
	pop {r4, pc}
	.balign 4, 0
_02018284: .word FX_SinCosTable_
	thumb_func_end sub_020181EC

	thumb_func_start sub_02018288
sub_02018288: ; 0x02018288
	push {r3, lr}
	add r2, r1, #0
	ldr r1, [r0, #0x6c]
	cmp r1, #0
	beq _0201829E
	add r1, r0, #0
	add r3, r0, #0
	add r1, #0x54
	add r3, #0x60
	bl Draw3dModel
_0201829E:
	pop {r3, pc}
	thumb_func_end sub_02018288

	thumb_func_start sub_020182A0
sub_020182A0: ; 0x020182A0
	str r1, [r0, #0x6c]
	bx lr
	thumb_func_end sub_020182A0

	thumb_func_start sub_020182A4
sub_020182A4: ; 0x020182A4
	ldr r0, [r0, #0x6c]
	bx lr
	thumb_func_end sub_020182A4

	thumb_func_start sub_020182A8
sub_020182A8: ; 0x020182A8
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	str r3, [r0, #0x5c]
	bx lr
	thumb_func_end sub_020182A8

	thumb_func_start sub_020182B0
sub_020182B0: ; 0x020182B0
	push {r3, r4}
	ldr r4, [r0, #0x54]
	str r4, [r1]
	ldr r1, [r0, #0x58]
	str r1, [r2]
	ldr r0, [r0, #0x5c]
	str r0, [r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020182B0

	thumb_func_start sub_020182C4
sub_020182C4: ; 0x020182C4
	str r1, [r0, #0x60]
	str r2, [r0, #0x64]
	str r3, [r0, #0x68]
	bx lr
	thumb_func_end sub_020182C4

	thumb_func_start sub_020182CC
sub_020182CC: ; 0x020182CC
	push {r3, r4}
	ldr r4, [r0, #0x60]
	str r4, [r1]
	ldr r1, [r0, #0x64]
	str r1, [r2]
	ldr r0, [r0, #0x68]
	str r0, [r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020182CC

	thumb_func_start sub_020182E0
sub_020182E0: ; 0x020182E0
	lsl r2, r2, #1
	add r0, r0, r2
	add r0, #0x70
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020182E0

	thumb_func_start sub_020182EC
sub_020182EC: ; 0x020182EC
	lsl r1, r1, #1
	add r0, r0, r1
	add r0, #0x70
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020182EC

	thumb_func_start sub_020182F8
sub_020182F8: ; 0x020182F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	str r2, [r5]
	add r0, r2, #0
	mov r1, #0
	add r6, r3, #0
	bl NNS_G3dGetAnmByIdx
	str r0, [r5, #4]
	ldr r1, [r5, #4]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5, #8]
	ldr r1, [r5, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl NNS_G3dAnmObjInit
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020182F8

	thumb_func_start sub_02018324
sub_02018324: ; 0x02018324
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02018332
	bl GF_AssertFail
_02018332:
	ldr r0, [r4]
	bl NNS_G3dGetMdlSet
	str r0, [r4, #4]
	cmp r0, #0
	beq _0201835E
	add r2, r0, #0
	add r2, #8
	beq _02018352
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _02018352
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _02018354
_02018352:
	mov r1, #0
_02018354:
	cmp r1, #0
	beq _0201835E
	ldr r1, [r1]
	add r0, r0, r1
	b _02018360
_0201835E:
	mov r0, #0
_02018360:
	str r0, [r4, #8]
	ldr r0, [r4]
	bl NNS_G3dGetTex
	str r0, [r4, #0xc]
	cmp r0, #0
	beq _0201837A
	mov r2, #1
	ldr r0, _0201837C ; =sub_0201804C
	add r1, r4, #0
	lsl r2, r2, #0xa
	bl sub_0200E374
_0201837A:
	pop {r4, pc}
	.balign 4, 0
_0201837C: .word sub_0201804C
	thumb_func_end sub_02018324
