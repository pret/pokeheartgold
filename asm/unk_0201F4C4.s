	.include "asm/macros.inc"
	.include "global.inc"

	.public NNS_G3dGlb
    .public NNS_G3dGlb

	.bss

_021D15A0:
	.space 0x4

	.text

	thumb_func_start sub_0201F4C4
sub_0201F4C4: ; 0x0201F4C4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5]
	bl NNS_G3dGetTex
	cmp r0, #0
	beq _0201F4EA
	bl sub_0201F53C
	cmp r0, #0
	bne _0201F4EA
	ldr r0, [r5]
	ldr r1, [r0, #8]
	bl DC_FlushRange
	ldr r0, [r5]
	bl NNS_G3dResDefaultSetup
_0201F4EA:
	ldr r0, [r5]
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _0201F514
	add r2, r0, #0
	add r2, #8
	beq _0201F508
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0201F508
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0201F50A
_0201F508:
	mov r1, #0
_0201F50A:
	cmp r1, #0
	beq _0201F514
	ldr r1, [r1]
	add r0, r0, r1
	b _0201F516
_0201F514:
	mov r0, #0
_0201F516:
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201F4C4

	thumb_func_start sub_0201F51C
sub_0201F51C: ; 0x0201F51C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, r2, #0
	bl sub_0201F4C4
	cmp r4, #0
	bne _0201F532
	bl GF_AssertFail
_0201F532:
	ldr r1, [r4]
	add r0, r5, #0
	bl NNS_G3dRenderObjInit
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0201F51C

	thumb_func_start sub_0201F53C
sub_0201F53C: ; 0x0201F53C
	ldrh r2, [r0, #0x10]
	mov r1, #1
	tst r2, r1
	bne _0201F54A
	ldrh r0, [r0, #0x20]
	tst r0, r1
	beq _0201F54E
_0201F54A:
	mov r0, #1
	bx lr
_0201F54E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201F53C

	thumb_func_start Draw3dModel
Draw3dModel: ; 0x0201F554
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl NNS_G3dGlbSetBaseTrans
	ldr r1, _0201F588 ; =NNS_G3dGlb + 0xBC
	add r0, r4, #0
	bl MI_Copy36B
	ldr r1, _0201F58C ; =NNS_G3dGlb + 0x80
	mov r0, #0xa4
	ldr r2, [r1, #0x7c]
	bic r2, r0
	add r0, r6, #0
	str r2, [r1, #0x7c]
	bl NNS_G3dGlbSetBaseScale
	bl NNS_G3dGlbFlushP
	add r0, r5, #0
	bl NNS_G3dDraw
	pop {r4, r5, r6, pc}
	nop
_0201F588: .word NNS_G3dGlb + 0xBC
_0201F58C: .word NNS_G3dGlb + 0x80
	thumb_func_end Draw3dModel

	thumb_func_start sub_0201F590
sub_0201F590: ; 0x0201F590
	push {r3, lr}
	sub sp, #8
	mov r1, #4
	str r1, [sp]
	ldr r1, _0201F5B0 ; =sub_0201F5B8
	mov r2, #2
	str r1, [sp, #4]
	mov r1, #0
	add r3, r1, #0
	bl GF_3DVramMan_Create
	ldr r1, _0201F5B4 ; =_021D15A0
	str r0, [r1]
	add sp, #8
	pop {r3, pc}
	nop
_0201F5B0: .word sub_0201F5B8
_0201F5B4: .word _021D15A0
	thumb_func_end sub_0201F590

	thumb_func_start sub_0201F5B8
sub_0201F5B8: ; 0x0201F5B8
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0201F624 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0201F628 ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0201F62C ; =0x0000CFFB
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
	ldr r2, _0201F630 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _0201F634 ; =0xBFFF0000
	ldr r0, _0201F638 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_0201F624: .word 0x04000008
_0201F628: .word 0xFFFFCFFD
_0201F62C: .word 0x0000CFFB
_0201F630: .word 0x00007FFF
_0201F634: .word 0xBFFF0000
_0201F638: .word 0x04000580
	thumb_func_end sub_0201F5B8

	thumb_func_start sub_0201F63C
sub_0201F63C: ; 0x0201F63C
	ldr r0, _0201F644 ; =_021D15A0
	ldr r3, _0201F648 ; =GF_3DVramMan_Delete
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0201F644: .word _021D15A0
_0201F648: .word GF_3DVramMan_Delete
	thumb_func_end sub_0201F63C

	thumb_func_start Bind3dModelSet
Bind3dModelSet: ; 0x0201F64C
	push {r4, lr}
	add r4, r1, #0
	bl NNS_G3dGetMdlSet
	cmp r4, #0
	beq _0201F662
	add r1, r4, #0
	bl NNS_G3dBindMdlSet
	mov r0, #1
	pop {r4, pc}
_0201F662:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Bind3dModelSet

	thumb_func_start AllocAndLoad3dTexResources
AllocAndLoad3dTexResources: ; 0x0201F668
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bne _0201F676
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0201F676:
	mov r1, #0
	str r1, [r5, #8]
	mov r1, #1
	str r1, [sp, #8]
	str r1, [sp, #4]
	str r1, [sp]
	cmp r5, #0
	beq _0201F774
	bl NNS_G3dTexGetRequiredSize
	add r6, r0, #0
	add r0, r5, #0
	bl NNS_G3dTex4x4GetRequiredSize
	add r4, r0, #0
	add r0, r5, #0
	bl NNS_G3dPlttGetRequiredSize
	str r0, [sp, #0xc]
	cmp r6, #0
	beq _0201F6B6
	ldr r3, _0201F77C ; =NNS_GfdDefaultFuncAllocTexVram
	mov r1, #0
	ldr r3, [r3]
	add r0, r6, #0
	add r2, r1, #0
	blx r3
	add r7, r0, #0
	bne _0201F6B8
	mov r0, #0
	str r0, [sp, #8]
	b _0201F6B8
_0201F6B6:
	mov r7, #0
_0201F6B8:
	cmp r4, #0
	beq _0201F6D2
	ldr r3, _0201F77C ; =NNS_GfdDefaultFuncAllocTexVram
	add r0, r4, #0
	ldr r3, [r3]
	mov r1, #1
	mov r2, #0
	blx r3
	add r6, r0, #0
	bne _0201F6D4
	mov r0, #0
	str r0, [sp, #4]
	b _0201F6D4
_0201F6D2:
	mov r6, #0
_0201F6D4:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0201F6F4
	ldr r3, _0201F780 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #2
	ldrh r2, [r5, #0x20]
	lsl r1, r1, #0xe
	ldr r3, [r3]
	and r1, r2
	mov r2, #0
	blx r3
	add r4, r0, #0
	bne _0201F6F6
	mov r0, #0
	str r0, [sp]
	b _0201F6F6
_0201F6F4:
	mov r4, #0
_0201F6F6:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0201F712
	ldr r1, _0201F784 ; =NNS_GfdDefaultFuncFreeTexVram
	add r0, r7, #0
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	beq _0201F70C
	bl GF_AssertFail
_0201F70C:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0201F712:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0201F72E
	ldr r1, _0201F784 ; =NNS_GfdDefaultFuncFreeTexVram
	add r0, r6, #0
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	beq _0201F728
	bl GF_AssertFail
_0201F728:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0201F72E:
	ldr r0, [sp]
	cmp r0, #0
	bne _0201F74A
	ldr r1, _0201F788 ; =NNS_GfdDefaultFuncFreePlttVram
	add r0, r4, #0
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	beq _0201F744
	bl GF_AssertFail
_0201F744:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0201F74A:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	bl NNS_G3dTexSetTexKey
	add r0, r5, #0
	add r1, r4, #0
	bl NNS_G3dPlttSetPlttKey
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl DC_FlushRange
	add r0, r5, #0
	mov r1, #1
	bl Call_NNS_G3dTexLoad
	add r0, r5, #0
	mov r1, #1
	bl Call_NNS_G3dPlttLoad
_0201F774:
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0201F77C: .word NNS_GfdDefaultFuncAllocTexVram
_0201F780: .word NNS_GfdDefaultFuncAllocPlttVram
_0201F784: .word NNS_GfdDefaultFuncFreeTexVram
_0201F788: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end AllocAndLoad3dTexResources

	thumb_func_start Call_NNS_G3dTexLoad
Call_NNS_G3dTexLoad: ; 0x0201F78C
	ldr r3, _0201F790 ; =NNS_G3dTexLoad
	bx r3
	.balign 4, 0
_0201F790: .word NNS_G3dTexLoad
	thumb_func_end Call_NNS_G3dTexLoad

	thumb_func_start Call_NNS_G3dPlttLoad
Call_NNS_G3dPlttLoad: ; 0x0201F794
	ldr r3, _0201F798 ; =NNS_G3dPlttLoad
	bx r3
	.balign 4, 0
_0201F798: .word NNS_G3dPlttLoad
	thumb_func_end Call_NNS_G3dPlttLoad
