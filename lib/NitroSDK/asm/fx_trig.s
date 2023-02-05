	.include "asm/macros.inc"
	.include "fx_trig.inc"
	.include "global.inc"
	.text

	arm_func_start FX_SinFx64c_internal
FX_SinFx64c_internal: ; 0x020CD2FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov lr, #0
	cmp r1, #1
	cmpeq r0, #0
	mov r2, #1
	moveq r1, lr
	ldreq r0, _020CD3CC ; =0xB504F334
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	umull r3, ip, r0, r0
	mla ip, r0, r1, ip
	mla ip, r1, r0, ip
	ldr r4, _020CD3D0 ; =0x02317888
	ldr r5, _020CD3D4 ; =0x03C2857C
	umull r3, r8, ip, r4
	umull r3, r7, ip, r5
	mla r8, ip, lr, r8
	mov r3, lr
	mla r7, ip, lr, r7
	mla r8, r3, r4, r8
	subs sb, lr, r8
	mla r7, r3, r5, r7
	umull r4, r5, sb, r7
	mla r5, sb, r3, r5
	sbc r8, r2, #0
	mla r5, r8, r7, r5
	subs r8, lr, r5
	ldr r6, _020CD3D8 ; =0x07E54B84
	sbc r7, r2, #0
	umull r4, r5, ip, r6
	mla r5, ip, lr, r5
	mla r5, r3, r6, r5
	umull r4, r6, r8, r5
	mla r6, r8, r3, r6
	mla r6, r7, r5, r6
	subs r8, lr, r6
	sbc r7, r2, #0
	ldr r2, _020CD3DC ; =0x14ABBCE6
	ldr r6, _020CD3E0 ; =0xC90FDAA2
	umull r4, r5, ip, r2
	mla r5, ip, lr, r5
	mla r5, r3, r2, r5
	umull r2, r4, r8, r5
	mla r4, r8, r3, r4
	mla r4, r7, r5, r4
	subs r6, r6, r4
	umull r2, r4, r6, r0
	mla r4, r6, r1, r4
	sbc r5, lr, #0
	mla r4, r5, r0, r4
	mov r0, r4
	mov r1, r3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020CD3CC: .word 0xB504F334
_020CD3D0: .word 0x02317888
_020CD3D4: .word 0x03C2857C
_020CD3D8: .word 0x07E54B84
_020CD3DC: .word 0x14ABBCE6
_020CD3E0: .word 0xC90FDAA2
	arm_func_end FX_SinFx64c_internal

	arm_func_start FX_CosFx64c_internal
FX_CosFx64c_internal: ; 0x020CD3E4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov ip, #0
	cmp r1, #1
	cmpeq r0, #0
	mov r2, #1
	moveq r1, ip
	ldreq r0, _020CD49C ; =0xB504F334
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	umull r4, r3, r0, r0
	mla r3, r0, r1, r3
	mla r3, r1, r0, r3
	ldr r1, _020CD4A0 ; =0x02D1E41D
	ldr lr, _020CD4A4 ; =0x054387AD
	umull r0, r6, r3, r1
	umull r0, r5, r3, lr
	mla r6, r3, ip, r6
	mov r0, ip
	mla r5, r3, ip, r5
	mla r6, r0, r1, r6
	subs r8, ip, r6
	mla r5, r0, lr, r5
	umull r1, r6, r8, r5
	ldr r4, _020CD4A8 ; =0x0D28D331
	mla r6, r8, r0, r6
	umull r1, lr, r3, r4
	mla lr, r3, ip, lr
	sbc r7, r2, #0
	mla r6, r7, r5, r6
	subs r6, ip, r6
	mla lr, r0, r4, lr
	umull r1, r4, r6, lr
	mla r4, r6, r0, r4
	sbc r5, r2, #0
	mla r4, r5, lr, r4
	subs r6, ip, r4
	ldr r1, _020CD4AC ; =0x4EF4F327
	sbc r5, r2, #0
	umull r4, lr, r3, r1
	mla lr, r3, ip, lr
	mla lr, r0, r1, lr
	umull r1, r3, r6, lr
	mla r3, r6, r0, r3
	mla r3, r5, lr, r3
	subs r0, ip, r3
	sbc r1, r2, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020CD49C: .word 0xB504F334
_020CD4A0: .word 0x02D1E41D
_020CD4A4: .word 0x054387AD
_020CD4A8: .word 0x0D28D331
_020CD4AC: .word 0x4EF4F327
	arm_func_end FX_CosFx64c_internal

	arm_func_start FX_SinFx64c
FX_SinFx64c: ; 0x020CD4B0
	stmdb sp!, {r4, lr}
	cmp r0, #0
	bge _020CD4D0
	rsb r0, r0, #0
	bl FX_SinFx64c
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, pc}
_020CD4D0:
	ldr r1, _020CD544 ; =0x45F306DD
	mov r2, #1
	umull ip, lr, r0, r1
	mla lr, r0, r2, lr
	mov r0, r0, asr #0x1f
	mla lr, r0, r1, lr
	mov r3, #0
	mov ip, ip, lsr #0xc
	mov r4, lr, asr #0xc
	orr ip, ip, lr, lsl #20
	sub r0, r3, #1
	tst r4, #1
	and r1, r3, lr, asr #12
	and r0, ip, r0
	beq _020CD514
	subs r0, r3, r0
	sbc r1, r2, r1
_020CD514:
	add r2, r4, #1
	tst r2, #2
	beq _020CD528
	bl FX_CosFx64c_internal
	b _020CD52C
_020CD528:
	bl FX_SinFx64c_internal
_020CD52C:
	and r2, r4, #7
	cmp r2, #3
	ldmleia sp!, {r4, pc}
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CD544: .word 0x45F306DD
	arm_func_end FX_SinFx64c

	arm_func_start FX_CosFx64c
FX_CosFx64c: ; 0x020CD548
	stmdb sp!, {r4, lr}
	cmp r0, #0
	bge _020CD560
	rsb r0, r0, #0
	bl FX_CosFx64c
	ldmia sp!, {r4, pc}
_020CD560:
	ldr r1, _020CD5D8 ; =0x45F306DD
	mov r2, #1
	umull ip, lr, r0, r1
	mla lr, r0, r2, lr
	mov r0, r0, asr #0x1f
	mla lr, r0, r1, lr
	mov r3, #0
	mov ip, ip, lsr #0xc
	mov r4, lr, asr #0xc
	orr ip, ip, lr, lsl #20
	sub r0, r3, #1
	tst r4, #1
	and r1, r3, lr, asr #12
	and r0, ip, r0
	beq _020CD5A4
	subs r0, r3, r0
	sbc r1, r2, r1
_020CD5A4:
	add r2, r4, #1
	tst r2, #2
	beq _020CD5B8
	bl FX_SinFx64c_internal
	b _020CD5BC
_020CD5B8:
	bl FX_CosFx64c_internal
_020CD5BC:
	add r2, r4, #2
	and r2, r2, #7
	cmp r2, #3
	ldmleia sp!, {r4, pc}
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CD5D8: .word 0x45F306DD
	arm_func_end FX_CosFx64c
