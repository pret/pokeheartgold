	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02069660
sub_02069660: ; 0x02069660
	mov r2, #0x14
	mov r1, #0
_02069664:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _02069664
	bx lr
	.balign 4, 0
	thumb_func_end sub_02069660

	thumb_func_start sub_02069670
sub_02069670: ; 0x02069670
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02069660
	str r4, [r5, #4]
	mov r0, #0
	str r0, [r5]
	add r0, r4, #0
	bl NNS_G3dGetMdlSet
	str r0, [r5, #8]
	cmp r0, #0
	beq _020696B6
	add r2, r0, #0
	add r2, #8
	beq _020696AA
	ldrb r1, [r0, #9]
	cmp r6, r1
	bhs _020696AA
	ldrh r3, [r0, #0xe]
	add r1, r2, r3
	ldrh r2, [r2, r3]
	add r1, r1, #4
	add r3, r2, #0
	mul r3, r6
	add r1, r1, r3
	b _020696AC
_020696AA:
	mov r1, #0
_020696AC:
	cmp r1, #0
	beq _020696B6
	ldr r1, [r1]
	add r0, r0, r1
	b _020696B8
_020696B6:
	mov r0, #0
_020696B8:
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl NNS_G3dGetTex
	str r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02069670

	thumb_func_start sub_020696C4
sub_020696C4: ; 0x020696C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x14]
	add r4, r1, #0
	add r1, r3, #0
	str r0, [sp]
	add r0, r2, #0
	ldr r3, [sp, #0x10]
	mov r2, #0
	bl GfGfxLoader_LoadFromOpenNarc
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_02069670
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020696C4

	thumb_func_start sub_020696E8
sub_020696E8: ; 0x020696E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl AllocAndLoad3dTexResources
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	bl NNS_G3dBindMdlSet
	mov r0, #1
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_020696E8

	thumb_func_start sub_02069700
sub_02069700: ; 0x02069700
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_020696E8
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02069700

	thumb_func_start sub_02069714
sub_02069714: ; 0x02069714
	push {r3, lr}
	add r1, r0, #0
	ldr r0, _0206972C ; =sub_02069700
	ldr r2, _02069730 ; =0x0000FFFF
	bl sub_0200E33C
	cmp r0, #0
	bne _02069728
	bl GF_AssertFail
_02069728:
	pop {r3, pc}
	nop
_0206972C: .word sub_02069700
_02069730: .word 0x0000FFFF
	thumb_func_end sub_02069714

	thumb_func_start sub_02069734
sub_02069734: ; 0x02069734
	push {r3, lr}
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02069740
	bl FreeToHeap
_02069740:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02069734

	thumb_func_start sub_02069744
sub_02069744: ; 0x02069744
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02069778
	add r1, sp, #4
	add r2, sp, #0
	bl NNS_G3dTexReleaseTexKey
	ldr r1, _0206977C ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r0, [sp, #4]
	ldr r1, [r1]
	blx r1
	ldr r1, _0206977C ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r0, [sp]
	ldr r1, [r1]
	blx r1
	ldr r0, [r4, #0x10]
	bl NNS_G3dPlttReleasePlttKey
	ldr r1, _02069780 ; =NNS_GfdDefaultFuncFreePlttVram
	ldr r1, [r1]
	blx r1
	mov r0, #0
	str r0, [r4, #0x10]
_02069778:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0206977C: .word NNS_GfdDefaultFuncFreeTexVram
_02069780: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end sub_02069744

	thumb_func_start sub_02069784
sub_02069784: ; 0x02069784
	push {r4, lr}
	add r4, r0, #0
	bl sub_02069744
	add r0, r4, #0
	bl sub_02069734
	add r0, r4, #0
	bl sub_02069660
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02069784
