	.include "asm/macros.inc"
	.include "nitrocrypto.inc"
	.include "global.inc"

	; rc4s-arm4cw.o

	.text

	arm_func_start CRYPTO_RC4Encrypt
CRYPTO_RC4Encrypt: ; 0x0223706C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	ldrb r7, [r0]
	ldrb r6, [r0, #1]
	add r0, r0, #4
	mov lr, #0x1000000
	add r7, lr, r7, lsl #24
	mov r6, r6, lsl #0x18
	ldrb sb, [r0, r7, lsr #24]
	subs r2, r2, #1
	bmi _022370CC
_02237094:
	add r6, r6, sb, lsl #24
	subs r2, r2, #1
	ldrb r8, [r0, r6, lsr #24]
	ldrb r5, [r1], #1
	strb r8, [r0, r7, lsr #24]
	strb sb, [r0, r6, lsr #24]
	add r4, sb, r8
	and r4, r4, #0xff
	add r7, r7, lr
	ldrb r4, [r0, r4]
	ldrb sb, [r0, r7, lsr #24]
	eor r5, r5, r4
	strb r5, [r3], #1
	bge _02237094
_022370CC:
	sub r7, r7, lr
	mov r7, r7, lsr #0x18
	mov r6, r6, lsr #0x18
	strb r7, [r0, #-4]
	strb r6, [r0, #-3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CRYPTO_RC4Encrypt

	; sign.o

	.rodata

TEMPNAME__$p16:
	.byte 0x00, 0x08, 0x01, 0x01
	.byte 0x01, 0x10, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

TEMPNAME__$p2:
	.byte 0x00, 0x08, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

TEMPNAME__$p4:
	.byte 0x00, 0x08, 0x01, 0x01
	.byte 0x01, 0x04, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

bits$7808:
	.byte 0x00, 0x01, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04

shift:
	.byte 0x06, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x05, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00
	.byte 0x02, 0x00
	.byte 0x01
	.byte 0x00

	.data

shift_val:
	.word shift + 0x3F
	.word shift + 0x3E
	.word shift + 0x3C
	.word shift + 0x38
	.word shift + 0x30
	.word shift + 0x20
	.word shift

	.text

	arm_func_start CRYPTO_VerifySignature
CRYPTO_VerifySignature: ; 0x022370E4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov ip, r0
	mov r4, r1
	mov r5, r2
	mov r2, r4
	add r0, sp, #0
	mov r1, ip
	mov r4, r3
	bl MATH_CalcSHA1
	add r0, sp, #0
	mov r1, r5
	mov r2, r4
	bl CRYPTO_VerifySignatureWithHash
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end CRYPTO_VerifySignature

	arm_func_start CRYPTO_VerifySignatureWithHash
CRYPTO_VerifySignatureWithHash: ; 0x02237128
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x120
	mov r3, #0
	str r3, [sp, #0x10]
	str r3, [sp, #0x18]
	str r2, [sp]
	mov r3, #0x80
	mov r4, r0
	mov r2, r1
	ldr ip, _02237224 ; =0x00010001
	str r3, [sp, #4]
	add r0, sp, #0x1c
	mov r1, #0x100
	str ip, [sp, #8]
	bl CRYPTOi_RSA
	mov r1, r0
	add r0, sp, #0x1c
	add r2, sp, #0xc
	add r3, sp, #0x10
	bl SkipPadding
	cmp r0, #0
	addeq sp, sp, #0x120
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	bxeq lr
	add r1, sp, #0x14
	add r0, sp, #0x18
	str r1, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	mov r3, r2
	bl ParseSignHash
	cmp r0, #0
	addeq sp, sp, #0x120
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	bxeq lr
	ldr r0, [sp, #0x18]
	cmp r0, #0x14
	addne sp, sp, #0x120
	movne r0, #0
	ldmneia sp!, {r4, lr}
	bxne lr
	ldr r2, [sp, #0x14]
	mov r3, #0
_022371E4:
	ldrb r1, [r2]
	ldrb r0, [r4]
	cmp r1, r0
	addne sp, sp, #0x120
	movne r0, #0
	ldmneia sp!, {r4, lr}
	bxne lr
	add r3, r3, #1
	cmp r3, #0x14
	add r4, r4, #1
	add r2, r2, #1
	blt _022371E4
	mov r0, #1
	add sp, sp, #0x120
	ldmia sp!, {r4, lr}
	bx lr
	.balign 4, 0
_02237224: .word 0x00010001
	arm_func_end CRYPTO_VerifySignatureWithHash

	arm_func_start ParseSignHash
ParseSignHash: ; 0x02237228
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r2
	mov r4, r3
	add r0, sp, #0x10
	add r1, sp, #0x14
	mov r2, #0x30
	mov r3, #0
	bl ASN1Skip
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r0, sp, #0x10
	add r1, sp, #0x14
	mov r2, #0x30
	mov r3, #0
	bl ASN1Skip
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r0, sp, #0x10
	add r1, sp, #0x14
	add r3, sp, #0
	mov r2, #6
	bl ASN1Skip
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r5, #0
	ldrne r0, [sp, #0x10]
	strne r0, [r5]
	cmp r4, #0
	ldrne r0, [sp]
	strne r0, [r4]
	ldr r2, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r0, r0, r2
	str r0, [sp, #0x10]
	cmp r1, r2
	addlo sp, sp, #4
	movlo r0, #0
	ldmloia sp!, {r4, r5, lr}
	addlo sp, sp, #0x10
	bxlo lr
	sub ip, r1, r2
	add r0, sp, #0x10
	add r1, sp, #0x14
	add r3, sp, #0
	mov r2, #5
	str ip, [sp, #0x14]
	bl ASN1Skip
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r2, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r0, r0, r2
	str r0, [sp, #0x10]
	cmp r1, r2
	addlo sp, sp, #4
	movlo r0, #0
	ldmloia sp!, {r4, r5, lr}
	addlo sp, sp, #0x10
	bxlo lr
	sub ip, r1, r2
	add r0, sp, #0x10
	add r1, sp, #0x14
	add r3, sp, #0
	mov r2, #4
	str ip, [sp, #0x14]
	bl ASN1Skip
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r1, [sp, #0x20]
	cmp r1, #0
	ldrne r0, [sp, #0x10]
	strne r0, [r1]
	ldr r1, [sp, #0x24]
	cmp r1, #0
	ldrne r0, [sp]
	strne r0, [r1]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ParseSignHash

	arm_func_start SkipPadding
SkipPadding: ; 0x022373CC
	stmdb sp!, {lr}
	sub sp, sp, #4
	cmp r1, #0xa
	addlo sp, sp, #4
	movlo r0, #0
	ldmloia sp!, {lr}
	bxlo lr
	ldrb ip, [r0]
	add lr, r0, r1
	cmp ip, #1
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {lr}
	bxne lr
	add ip, r0, #1
	mov r1, #0
_0223740C:
	ldrb r0, [ip], #1
	cmp r0, #0xff
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {lr}
	bxne lr
	add r1, r1, #1
	cmp r1, #8
	blt _0223740C
	cmp ip, lr
	beq _02237450
_02237438:
	ldrb r0, [ip]
	cmp r0, #0xff
	bne _02237450
	add ip, ip, #1
	cmp ip, lr
	bne _02237438
_02237450:
	cmp ip, lr
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {lr}
	bxeq lr
	ldrb r0, [ip]
	cmp r0, #0
	movne r0, #0
	addeq r0, ip, #1
	subeq r1, lr, r0
	streq r1, [r3]
	streq r0, [r2]
	moveq r0, #1
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	arm_func_end SkipPadding

	arm_func_start ASN1Skip
ASN1Skip: ; 0x02237490
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, [r0]
	mov r6, #0
	ldrb r4, [r5]
	add r5, r5, #1
	mov ip, r6
	cmp r4, r2
	ldr r2, [r1]
	movne r0, r6
	ldmneia sp!, {r4, r5, r6, lr}
	bxne lr
	cmp r2, #1
	movlo r0, r6
	ldmloia sp!, {r4, r5, r6, lr}
	bxlo lr
	ldrb lr, [r5]
	sub r4, r2, #1
	ands r2, lr, #0x80
	beq _0223752C
	and r2, lr, #0x7f
	and lr, r2, #0xff
	add r2, lr, #1
	cmp r4, r2
	movlo r0, r6
	ldmloia sp!, {r4, r5, r6, lr}
	bxlo lr
	cmp r3, #0
	sub r6, r4, lr
	beq _02237524
	ldrb r2, [r5, #1]
	add r5, r5, #1
	and r4, r2, #0x7f
_02237510:
	sub r2, lr, #1
	add ip, r4, ip, lsl #7
	ands lr, r2, #0xff
	bne _02237510
	b _02237548
_02237524:
	add r5, r5, lr
	b _02237548
_0223752C:
	add r5, r5, #1
	cmp r4, #1
	mov ip, lr
	movlo r0, r6
	ldmloia sp!, {r4, r5, r6, lr}
	bxlo lr
	sub r6, r4, #1
_02237548:
	str r5, [r0]
	str r6, [r1]
	cmp r3, #0
	strne ip, [r3]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end ASN1Skip

	arm_func_start CRYPTOi_RSA
CRYPTOi_RSA: ; 0x02237564
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x58
	movs r6, r0
	mov r5, r1
	mov r8, r2
	mov r7, r3
	beq _02237594
	cmp r8, #0
	beq _02237594
	ldr r0, [sp, #0x70]
	cmp r0, #0
	bne _022375A4
_02237594:
	add sp, sp, #0x58
	mvn r0, #2
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
_022375A4:
	bl BN_CTX_new
	mov r4, r0
	add r0, sp, #4
	bl BN_init
	add r0, sp, #0x18
	bl BN_init
	add r0, sp, #0x2c
	bl BN_init
	add r0, sp, #0x40
	bl BN_init
	cmp r4, #0
	mvneq r5, #1
	beq _02237680
	add r2, sp, #4
	mov r0, r8
	mov r1, r7
	bl BN_bin2bn
	cmp r0, #0
	mvneq r5, #1
	beq _02237680
	ldr r1, [sp, #0x78]
	add r0, sp, #0x2c
	bl BN_set_word
	cmp r0, #0
	mvneq r5, #1
	beq _02237680
	ldr r0, [sp, #0x70]
	ldr r1, [sp, #0x74]
	add r2, sp, #0x40
	bl BN_bin2bn
	cmp r0, #0
	mvneq r5, #1
	beq _02237680
	add r0, sp, #0x18
	add r1, sp, #4
	add r2, sp, #0x2c
	add r3, sp, #0x40
	str r4, [sp]
	bl BN_mod_exp
	cmp r0, #0
	mvneq r5, #1
	beq _02237680
	add r0, sp, #0x18
	bl BN_num_bits
	add r1, r0, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	cmp r0, r5
	mvngt r5, #0
	bgt _02237680
	add r0, sp, #0x18
	mov r1, r6
	bl BN_bn2bin
	mov r5, r0
_02237680:
	add r0, sp, #4
	bl BN_free
	add r0, sp, #0x18
	bl BN_free
	add r0, sp, #0x2c
	bl BN_free
	add r0, sp, #0x40
	bl BN_free
	cmp r4, #0
	beq _022376B0
	mov r0, r4
	bl BN_CTX_free
_022376B0:
	mov r0, r5
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end CRYPTOi_RSA

	arm_func_start BN_mod_exp_mont
BN_mod_exp_mont: ; 0x022376C0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x7c
	mov r4, #0
	mov r5, r3
	mov r3, r4
	str r3, [sp, #0x34]
	ldr r3, [r5]
	str r0, [sp, #4]
	mov r0, r4
	ldr r3, [r3]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	ands r0, r3, #1
	ldr r0, [sp, #0xa0]
	str r4, [sp, #8]
	str r0, [sp, #0xa0]
	mov r7, r1
	mov r6, r2
	addeq sp, sp, #0x7c
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r1, [r7, #4]
	ldr r0, [r0]
	cmp r1, #0
	str r0, [sp, #0xc]
	beq _02237744
	cmp r1, #1
	bne _02237760
	ldr r0, [r7]
	ldr r0, [r0]
	cmp r0, #0
	bne _02237760
_02237744:
	ldr r0, [sp, #4]
	mov r1, #0
	bl BN_set_word
	add sp, sp, #0x7c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02237760:
	ldr r1, [r6, #4]
	cmp r1, #0
	beq _02237784
	cmp r1, #1
	bne _022377A0
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	bne _022377A0
_02237784:
	ldr r0, [sp, #4]
	mov r1, #1
	bl BN_set_word
	add sp, sp, #0x7c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022377A0:
	cmp r1, #1
	bne _022377D4
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #1
	bne _022377D4
	ldr r0, [sp, #4]
	mov r1, r7
	bl BN_copy
	add sp, sp, #0x7c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022377D4:
	ldr r0, [sp, #0xa4]
	str r0, [sp, #0x18]
	cmp r0, #0
	bne _02237808
	bl BN_MONT_CTX_new
	str r0, [sp, #0x18]
	cmp r0, #0
	beq _02237E64
	ldr r2, [sp, #0xa0]
	mov r1, r5
	bl BN_MONT_CTX_set_word
	cmp r0, #0
	beq _02237E64
_02237808:
	ldr r3, [sp, #0xa0]
	add r1, sp, #0x34
	mov r4, r3
	ldr r4, [r4, #0x10c]
	mov r0, r6
	mov r2, #0
	str r4, [sp, #0x1c]
	bl BN_gen_exp_bits
	cmp r0, #0
	beq _02237E64
	ldr r0, [sp, #0xa0]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0xa0]
	str r1, [r0]
	ldr r0, [sp, #0x34]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	str r0, [sp, #0x10]
	add r0, r1, #0x3f
	bl _s32_div_f
	ldr r1, [sp, #0x34]
	mov r4, r0
	add r0, r1, #4
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x18]
	ldr r3, [r7, #4]
	ldr sl, [r0, #0x24]
	cmp r3, sl
	bne _022378A0
	ldr r1, [r7]
	sub r2, sl, #1
	ldr r0, [r5]
	ldr r1, [r1, r2, lsl #2]
	ldr r0, [r0, r2, lsl #2]
	cmp r1, r0
	strlo r7, [sp, #0x14]
	blo _02237958
_022378A0:
	cmp r3, sl
	bge _02237914
	ldr r0, [sp, #0xa0]
	ldr r3, [r0]
	add r1, r0, #4
	add r2, r3, #1
	str r2, [r0]
	mov r0, #0x14
	mla r0, r3, r0, r1
	ldr r2, [r7, #4]
	mov r1, r0
	str r2, [r1, #4]
	mov r1, sl
	str r0, [sp, #0x14]
	bl bn_zexpand
	ldr r0, [r7, #4]
	mov r2, #0
	cmp r0, #0
	ble _02237958
_022378EC:
	ldr r1, [r7]
	ldr r0, [sp, #0x14]
	ldr r1, [r1, r2, lsl #2]
	ldr r0, [r0]
	str r1, [r0, r2, lsl #2]
	ldr r0, [r7, #4]
	add r2, r2, #1
	cmp r2, r0
	blt _022378EC
	b _02237958
_02237914:
	ldr r0, [sp, #0xa0]
	mov r2, r5
	ldr r3, [r0]
	mov r1, r7
	add r5, r3, #1
	str r5, [r0]
	add r5, r0, #4
	mov r0, #0x14
	mla r0, r3, r0, r5
	ldr r3, [sp, #0xa0]
	str r0, [sp, #0x14]
	bl BN_mod
	cmp r0, #0
	beq _02237E64
	ldr r0, [sp, #0x14]
	mov r1, sl
	bl bn_zexpand
_02237958:
	ldr r0, [sp, #0xa0]
	ldr r3, [r0]
	ldr r0, [r6, #4]
	add r1, r3, #1
	mul r2, r0, r4
	ldr r0, [sp, #0xa0]
	mov r4, r2, lsl #1
	str r1, [r0]
	ldr r1, [r0]
	add r4, r4, #7
	add r2, r1, #1
	str r2, [r0]
	ldr r2, [sp, #0x10]
	ldr r0, [r0]
	mul r5, r2, sl
	mov r2, r4, asr #1
	add r2, r4, r2, lsr #30
	add r5, r5, r2, asr #2
	ldr r2, [sp, #0xa0]
	mov r6, #0x14
	add r2, r2, #4
	mla r8, r1, r6, r2
	mla r4, r3, r6, r2
	ldr r1, [sp, #0xa0]
	add r3, r0, #1
	mla r7, r0, r6, r2
	str r3, [r1]
	mov r0, r1
	ldr r0, [r0]
	mla r6, r0, r6, r2
	add r1, r0, #1
	ldr r0, [sp, #0xa0]
	str r1, [r0]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	cmp sl, r0
	ldrle r0, [sp, #4]
	ble _022379FC
	ldr r0, [sp, #4]
	mov r1, sl
	bl bn_expand2
_022379FC:
	cmp r0, #0
	beq _02237E64
	ldr r0, [r8, #8]
	mov r1, sl, lsl #2
	cmp r1, r0
	movle r0, r8
	ble _02237A20
	mov r0, r8
	bl bn_expand2
_02237A20:
	cmp r0, #0
	beq _02237E64
	ldr r1, [r7, #8]
	mov r0, sl, lsl #1
	str r0, [sp, #0x24]
	cmp r0, r1
	movle r0, r7
	ble _02237A4C
	ldr r1, [sp, #0x24]
	mov r0, r7
	bl bn_expand2
_02237A4C:
	cmp r0, #0
	beq _02237E64
	ldr r0, [r4, #8]
	cmp r5, r0
	movle r0, r4
	ble _02237A70
	mov r1, r5
	mov r0, r4
	bl bn_expand2
_02237A70:
	cmp r0, #0
	beq _02237E64
	ldr r1, [r6, #8]
	ldr r0, [sp, #0x24]
	cmp r0, r1
	movle r0, r6
	ble _02237A98
	ldr r1, [sp, #0x24]
	mov r0, r6
	bl bn_expand2
_02237A98:
	cmp r0, #0
	beq _02237E64
	ldr r0, [sp, #0x18]
	ldr fp, [r8]
	ldr r8, [r7]
	ldr r6, [r6]
	ldr r1, [r4]
	ldr r7, [r0, #0x48]
	ldr r5, [r0, #0x20]
	ldr r3, [sp, #0x18]
	str r1, [sp, #0x38]
	str sl, [sp]
	ldr r1, [sp, #0x14]
	ldr r3, [r3, #0xc]
	ldr r1, [r1]
	mov r0, r6
	mov r2, sl
	bl bn_mul_normal
	str r7, [sp]
	ldr r0, [sp, #0x38]
	mov r1, r6
	mov r2, r5
	mov r3, sl
	bl bn_from_montgomery_words
	ldr r0, [sp, #0x10]
	cmp r0, #1
	ble _02237BA0
	ldr r1, [sp, #0x38]
	mov r0, r6
	mov r2, sl
	mov r3, fp
	bl bn_sqr_normal
	mov r0, fp
	mov r1, r6
	mov r2, r5
	mov r3, sl
	str r7, [sp]
	bl bn_from_montgomery_words
	ldr r0, [sp, #0x10]
	mov r4, #1
	cmp r0, #1
	ble _02237BA0
	mov r0, sl, lsl #2
	str r0, [sp, #0x28]
	add sb, sp, #0x38
_02237B4C:
	sub r3, r4, #1
	ldr r2, [sb, r3, lsl #2]
	ldr r1, [sp, #0x28]
	mov r0, r6
	add r1, r2, r1
	str r1, [sb, r4, lsl #2]
	str sl, [sp]
	ldr r1, [sb, r3, lsl #2]
	mov r2, sl
	mov r3, fp
	bl bn_mul_normal
	str r7, [sp]
	ldr r0, [sb, r4, lsl #2]
	mov r1, r6
	mov r2, r5
	mov r3, sl
	bl bn_from_montgomery_words
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	cmp r4, r0
	blt _02237B4C
_02237BA0:
	ldr r3, [sp, #0x34]
	add r0, r3, #1
	str r0, [sp, #0x34]
	add r2, r0, #1
	ldrb r1, [r3]
	str r2, [sp, #0x34]
	ldrb sb, [r3, #1]
	cmp sb, #0xff
	bne _02237C20
	cmp r1, #0
	bne _02237C20
	add r0, r2, #1
	str r0, [sp, #0x34]
	ldrb r1, [r2]
	b _02237BF0
_02237BDC:
	add sb, sb, #0x100
	ldr r1, [sp, #0x34]
	add r1, r1, #2
	str r1, [sp, #0x34]
	ldrb r1, [r0, #1]
_02237BF0:
	ldr r0, [sp, #0x34]
	ldrb r2, [r0]
	cmp r2, #0xff
	bne _02237C08
	cmp r1, #0
	beq _02237BDC
_02237C08:
	ldr r2, [sp, #0x34]
	add r2, r2, #1
	str r2, [sp, #0x34]
	ldrb r0, [r0]
	add r0, r0, #1
	add sb, sb, r0
_02237C20:
	mov r2, r1, asr #1
	add r0, sp, #0x38
	ldr r0, [r0, r2, lsl #2]
	mov r1, r8
	mov r2, sl, lsl #2
	bl MI_CpuCopy8
	cmp sb, #0
	beq _02237DF8
	mov r0, #0xff
	str r0, [sp, #0x2c]
	mov r0, #0
	str r0, [sp, #0x30]
_02237C50:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _02237C84
	mov r3, r0
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	ldr r3, [r3]
	blx r3
	cmp r0, #0
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	bne _02237E64
_02237C84:
	ldr r0, [sp, #0xa0]
	ldr r0, [r0, #0x108]
	ands r0, r0, #0x4000
	bne _02237E64
	cmp sb, #0
	ldr r4, [sp, #0x30]
	ble _02237CD8
_02237CA0:
	mov r0, r6
	mov r1, r8
	mov r2, sl
	mov r3, fp
	bl bn_sqr_normal
	str r7, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, sl
	bl bn_from_montgomery_words
	add r4, r4, #1
	cmp r4, sb
	blt _02237CA0
_02237CD8:
	ldr r2, [sp, #0x34]
	add r0, r2, #1
	str r0, [sp, #0x34]
	add r1, r0, #1
	ldrb r0, [r2]
	str r1, [sp, #0x34]
	ldrb sb, [r2, #1]
	cmp sb, #0xff
	bne _02237D58
	cmp r0, #0
	bne _02237D58
	add r0, r1, #1
	str r0, [sp, #0x34]
	ldrb r0, [r1]
	b _02237D28
_02237D14:
	add sb, sb, #0x100
	ldr r0, [sp, #0x34]
	add r0, r0, #2
	str r0, [sp, #0x34]
	ldrb r0, [r1, #1]
_02237D28:
	ldr r1, [sp, #0x34]
	ldrb r2, [r1]
	cmp r2, #0xff
	bne _02237D40
	cmp r0, #0
	beq _02237D14
_02237D40:
	ldr r2, [sp, #0x34]
	add r2, r2, #1
	str r2, [sp, #0x34]
	ldrb r1, [r1]
	add r1, r1, #1
	add sb, sb, r1
_02237D58:
	cmp r0, #0
	bne _02237D68
	cmp sb, #0
	beq _02237DF8
_02237D68:
	cmp sb, #0
	bne _02237D78
	cmp r0, #1
	beq _02237DB4
_02237D78:
	mov r1, r0, asr #1
	str sl, [sp]
	add r0, sp, #0x38
	ldr r3, [r0, r1, lsl #2]
	mov r0, r6
	mov r1, r8
	mov r2, sl
	bl bn_mul_normal
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, sl
	str r7, [sp]
	bl bn_from_montgomery_words
	b _02237DF0
_02237DB4:
	ldr r0, [sp, #0x14]
	str sl, [sp]
	ldr r3, [r0]
	mov r0, r6
	mov r1, r8
	mov r2, sl
	bl bn_mul_normal
	ldr r0, [sp, #4]
	str r7, [sp]
	ldr r0, [r0]
	mov r1, r6
	mov r2, r5
	mov r3, sl
	bl bn_from_montgomery_words
	b _02237E3C
_02237DF0:
	cmp sb, #0
	bne _02237C50
_02237DF8:
	ldr r0, [sp, #0x24]
	mov r2, sl
	cmp sl, r0
	bge _02237E20
	mov r1, #0
_02237E0C:
	ldr r0, [sp, #0x24]
	str r1, [r8, r2, lsl #2]
	add r2, r2, #1
	cmp r2, r0
	blt _02237E0C
_02237E20:
	ldr r0, [sp, #4]
	str r7, [sp]
	ldr r0, [r0]
	mov r1, r8
	mov r2, r5
	mov r3, sl
	bl bn_from_montgomery_words
_02237E3C:
	ldr r0, [sp, #0xa0]
	ldr r0, [r0, #0x108]
	ands r0, r0, #0x4000
	bne _02237E64
	ldr r0, [sp, #4]
	mov r1, r0
	str sl, [r1, #4]
	bl bn_fix_top
	mov r0, #1
	str r0, [sp, #8]
_02237E64:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _02237E8C
	ldr r3, [r0]
	mov r1, #0xff
	mvn r2, #0
	blx r3
	cmp r0, #0
	movne r0, #0
	strne r0, [sp, #8]
_02237E8C:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bne _02237EA8
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02237EA8
	bl BN_MONT_CTX_free
_02237EA8:
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0xa0]
	ldr r0, [sp, #8]
	str r2, [r1]
	add sp, sp, #0x7c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end BN_mod_exp_mont

	arm_func_start BN_mod_exp_recp
BN_mod_exp_recp: ; 0x02237EC4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18c
	mov sl, r0
	mov r0, #0
	str r0, [sp, #8]
	mov r5, r1
	ldr r1, [sp, #8]
	mov r0, r2
	str r2, [sp, #4]
	mov r4, r3
	str r1, [sp, #0xc]
	ldr sb, [sp, #0x1b0]
	bl BN_num_bits
	ldr r1, [r5, #4]
	mov r8, r0
	cmp r1, #0
	beq _02237F20
	cmp r1, #1
	bne _02237F3C
	ldr r0, [r5]
	ldr r0, [r0]
	cmp r0, #0
	bne _02237F3C
_02237F20:
	mov r0, sl
	mov r1, #0
	bl BN_set_word
	add sp, sp, #0x18c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02237F3C:
	ldr r0, [sp, #4]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02237F64
	cmp r1, #1
	bne _02237F80
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _02237F80
_02237F64:
	mov r0, sl
	mov r1, #1
	bl BN_set_word
	add sp, sp, #0x18c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02237F80:
	cmp r1, #1
	bne _02237FB8
	ldr r0, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bne _02237FB8
	mov r0, sl
	mov r1, r5
	bl BN_copy
	add sp, sp, #0x18c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02237FB8:
	add r0, sp, #0x18
	bl BN_RECP_CTX_init
	add r0, sp, #0x18
	mov r1, r4
	mov r2, sb
	bl BN_RECP_CTX_set
	cmp r0, #0
	ble _02238204
	add r0, sp, #0x4c
	bl BN_init
	ldr r2, [sb]
	add r1, sb, #4
	mov r0, #0x14
	mla r6, r2, r0, r1
	add r1, r2, #1
	str r1, [sb]
	mov r2, r4
	mov r4, #1
	add r0, sp, #0x4c
	mov r1, r5
	mov r3, sb
	str r4, [sp, #0xc]
	bl BN_mod
	cmp r0, #0
	beq _02238204
	add r1, sp, #0x4c
	add r3, sp, #0x18
	mov r0, r6
	mov r2, r1
	str sb, [sp]
	bl BN_mod_mul_reciprocal
	cmp r0, #0
	beq _02238204
	cmp r8, #0x11
	movle fp, r4
	ble _02238060
	cmp r8, #0x100
	movge fp, #5
	bge _02238060
	cmp r8, #0x80
	movge fp, #4
	movlt fp, #3
_02238060:
	sub r0, fp, #1
	mov r4, #1
	mov r7, r4, lsl r0
	cmp r7, #1
	ble _022380BC
	add r5, sp, #0x60
_02238078:
	mov r0, r5
	bl BN_init
	sub r3, r4, #1
	mov r2, #0x14
	add r1, sp, #0x4c
	mla r1, r3, r2, r1
	mov r0, r5
	mov r2, r6
	add r3, sp, #0x18
	str sb, [sp]
	bl BN_mod_mul_reciprocal
	cmp r0, #0
	beq _02238204
	add r4, r4, #1
	cmp r4, r7
	add r5, r5, #0x14
	blt _02238078
_022380BC:
	mov r5, #1
	mov r0, sl
	mov r1, r5
	str r4, [sp, #0xc]
	sub r8, r8, #1
	bl BN_set_word
	cmp r0, #0
	beq _02238204
	mov r0, r5
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
_022380EC:
	ldr r0, [sp, #4]
	mov r1, r8
	bl BN_is_bit_set
	cmp r0, #0
	bne _02238138
	cmp r5, #0
	bne _02238128
	mov r0, sl
	mov r1, sl
	mov r2, sl
	add r3, sp, #0x18
	str sb, [sp]
	bl BN_mod_mul_reciprocal
	cmp r0, #0
	beq _02238204
_02238128:
	cmp r8, #0
	beq _022381FC
	sub r8, r8, #1
	b _022380EC
_02238138:
	ldr r6, [sp, #0x10]
	ldr r7, [sp, #0x14]
	cmp fp, #1
	mov r4, r6
	ble _0223817C
_0223814C:
	subs r1, r8, r4
	bmi _0223817C
	ldr r0, [sp, #4]
	bl BN_is_bit_set
	cmp r0, #0
	subne r0, r4, r7
	movne r0, r6, lsl r0
	movne r7, r4
	add r4, r4, #1
	orrne r6, r0, #1
	cmp r4, fp
	blt _0223814C
_0223817C:
	cmp r5, #0
	add r5, r7, #1
	bne _022381C0
	cmp r5, #0
	ldr r4, [sp, #0x14]
	ble _022381C0
_02238194:
	mov r0, sl
	mov r1, sl
	mov r2, sl
	add r3, sp, #0x18
	str sb, [sp]
	bl BN_mod_mul_reciprocal
	cmp r0, #0
	beq _02238204
	add r4, r4, #1
	cmp r4, r5
	blt _02238194
_022381C0:
	mov r3, r6, asr #1
	mov r1, #0x14
	add r0, sp, #0x4c
	mla r2, r3, r1, r0
	mov r0, sl
	mov r1, sl
	add r3, sp, #0x18
	str sb, [sp]
	bl BN_mod_mul_reciprocal
	cmp r0, #0
	beq _02238204
	add r0, r7, #1
	ldr r5, [sp, #0x14]
	subs r8, r8, r0
	bpl _022380EC
_022381FC:
	mov r0, #1
	str r0, [sp, #8]
_02238204:
	ldr r0, [sp, #0xc]
	ldr r1, [sb]
	cmp r0, #0
	sub r0, r1, #1
	str r0, [sb]
	mov r4, #0
	ble _02238240
	add r5, sp, #0x4c
_02238224:
	mov r0, r5
	bl BN_clear_free
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	cmp r4, r0
	add r5, r5, #0x14
	blt _02238224
_02238240:
	add r0, sp, #0x18
	bl BN_RECP_CTX_free
	ldr r0, [sp, #8]
	add sp, sp, #0x18c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end BN_mod_exp_recp

	arm_func_start bn_div_words
bn_div_words: ; 0x02238258
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	movs r8, r2
	mov sl, r0
	mov sb, r1
	mov fp, #0
	mov r5, #2
	addeq sp, sp, #4
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	mov r0, r8
	bl BN_num_bits_word
	cmp r0, #0x20
	beq _022382AC
	mov r1, #1
	cmp sl, r1, lsl r0
	addhi sp, sp, #4
	movhi r0, fp
	ldmhiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxhi lr
_022382AC:
	cmp sl, r8
	rsb r2, r0, #0x20
	subhs sl, sl, r8
	cmp r2, #0
	movne r1, sl, lsl r2
	rsbne r0, r2, #0x20
	orrne sl, r1, sb, lsr r0
	movne r8, r8, lsl r2
	ldr r4, _02238394 ; =0x0000FFFF
	movne sb, sb, lsl r2
	and r7, r4, r8, lsr #16
	and r6, r8, r4
_022382DC:
	mov r0, sl, lsr #0x10
	cmp r0, r7
	moveq r0, r4
	beq _022382F8
	mov r0, sl
	mov r1, r7
	bl _u32_div_f
_022382F8:
	mul ip, r0, r7
	mul r3, r0, r6
	and r2, r4, sb, lsr #16
_02238304:
	mov lr, #0x10000
	sub r1, sl, ip
	rsb lr, lr, #0
	ands lr, r1, lr
	bne _02238330
	add r1, r2, r1, lsl #16
	cmp r3, r1
	subhi ip, ip, r7
	subhi r3, r3, r6
	subhi r0, r0, #1
	bhi _02238304
_02238330:
	mul r2, r0, r6
	and r1, r2, r4
	mul r3, r0, r7
	mov r1, r1, lsl #0x10
	cmp sb, r1
	add r2, r3, r2, lsr #16
	addlo r2, r2, #1
	cmp sl, r2
	addlo sl, sl, r8
	sub sb, sb, r1
	sublo r0, r0, #1
	sub r1, sl, r2
	subs r5, r5, #1
	beq _02238384
	and r2, r0, r4
	mov r1, r1, lsl #0x10
	and r0, sb, r4
	orr sl, r1, sb, lsr #16
	mov fp, r2, lsl #0x10
	mov sb, r0, lsl #0x10
	b _022382DC
_02238384:
	orr r0, fp, r0
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.balign 4, 0
_02238394: .word 0x0000FFFF
	arm_func_end bn_div_words

	arm_func_start BN_reciprocal
BN_reciprocal: ; 0x02238398
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r8, r0
	add r0, sp, #4
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mvn r4, #0
	bl BN_init
	add r0, sp, #4
	mov r1, #0
	bl BN_set_word
	add r0, sp, #4
	mov r1, r6
	bl BN_set_bit
	cmp r0, #0
	beq _022383FC
	add r2, sp, #4
	mov r0, r8
	mov r3, r7
	mov r1, #0
	str r5, [sp]
	bl BN_div
	cmp r0, #0
	movne r4, r6
_022383FC:
	add r0, sp, #4
	bl BN_free
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end BN_reciprocal

	arm_func_start BN_div_recp
BN_div_recp: ; 0x02238414
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r6, [sp, #0x30]
	mov sb, r1
	ldr fp, [r6]
	movs sl, r0
	add r0, fp, #1
	str r0, [r6]
	ldr r7, [r6]
	add r4, r6, #4
	mov r0, #0x14
	mla r5, fp, r0, r4
	add ip, r7, #1
	mov r1, #0
	str r5, [sp, #4]
	mla r5, r7, r0, r4
	str ip, [r6]
	str r1, [sp]
	ldreq r1, [r6]
	mov r8, r2
	mlaeq sl, r1, r0, r4
	addeq r0, r1, #1
	streq r0, [r6]
	mov r7, r3
	cmp sb, #0
	bne _02238494
	ldr r2, [r6]
	add r1, r6, #4
	mov r0, #0x14
	mla sb, r2, r0, r1
	add r0, r2, #1
	str r0, [r6]
_02238494:
	mov r0, r8
	mov r1, r7
	bl BN_ucmp
	cmp r0, #0
	bge _022384D4
	mov r0, sl
	mov r1, #0
	bl BN_set_word
	mov r0, sb
	mov r1, r8
	bl BN_copy
	add sp, sp, #0xc
	str fp, [r6]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022384D4:
	mov r0, r8
	bl BN_num_bits
	ldr r1, [r7, #0x28]
	mov r2, r0
	mov r0, r1, lsl #1
	cmp r0, r2
	movgt r2, r0
	suble r0, r2, r0
	movgt r4, #0
	addle r0, r0, r0, lsr #31
	movle r4, r0, asr #1
	ldr r1, [r7, #0x2c]
	add r0, r2, r2, lsr #31
	mov r0, r0, asr #1
	cmp r2, r1
	str r0, [sp, #8]
	beq _0223852C
	mov r1, r7
	mov r3, r6
	add r0, r7, #0x14
	bl BN_reciprocal
	str r0, [r7, #0x2c]
_0223852C:
	ldr r2, [sp, #8]
	ldr r0, [sp, #4]
	mov r1, r8
	sub r2, r2, r4
	bl BN_rshift
	cmp r0, #0
	beq _0223867C
	ldr r1, [sp, #4]
	mov r0, r5
	mov r3, r6
	add r2, r7, #0x14
	bl BN_mul
	cmp r0, #0
	beq _0223867C
	ldr r2, [sp, #8]
	mov r0, sl
	mov r1, r5
	add r2, r2, r4
	bl BN_rshift
	cmp r0, #0
	beq _0223867C
	mov r4, #0
	mov r0, r5
	mov r1, r7
	mov r2, sl
	mov r3, r6
	str r4, [sl, #0xc]
	bl BN_mul
	cmp r0, #0
	beq _0223867C
	mov r0, sb
	mov r1, r8
	mov r2, r5
	bl BN_usub
	cmp r0, #0
	beq _0223867C
	mov r5, r4
	mov r0, sb
	mov r1, r7
	str r5, [sb, #0xc]
	bl BN_ucmp
	cmp r0, #0
	blt _02238628
	mov r4, #1
_022385DC:
	cmp r5, #2
	add r5, r5, #1
	bgt _0223867C
	mov r0, sb
	mov r1, sb
	mov r2, r7
	bl BN_usub
	cmp r0, #0
	beq _0223867C
	mov r0, sl
	mov r1, r4
	bl BN_add_word
	cmp r0, #0
	beq _0223867C
	mov r0, sb
	mov r1, r7
	bl BN_ucmp
	cmp r0, #0
	bge _022385DC
_02238628:
	ldr r0, [sb, #4]
	mov r1, #1
	cmp r0, #0
	beq _02238654
	cmp r0, #1
	bne _02238650
	ldr r0, [sb]
	ldr r0, [r0]
	cmp r0, #0
	beq _02238654
_02238650:
	mov r1, #0
_02238654:
	cmp r1, #0
	movne r0, #0
	ldreq r0, [r8, #0xc]
	str r0, [sb, #0xc]
	mov r0, #1
	ldr r2, [r8, #0xc]
	ldr r1, [r7, #0xc]
	str r0, [sp]
	eor r0, r2, r1
	str r0, [sl, #0xc]
_0223867C:
	ldr r0, [sp]
	str fp, [r6]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end BN_div_recp

	arm_func_start BN_mod_mul_reciprocal
BN_mod_mul_reciprocal: ; 0x02238690
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r4, [sp, #0x20]
	mov ip, #0x14
	ldr r5, [r4]
	add lr, r4, #4
	mla r6, r5, ip, lr
	add ip, r5, #1
	mov r8, r0
	mov r7, r3
	str ip, [r4]
	cmp r2, #0
	mov r5, #0
	beq _02238700
	cmp r1, r2
	bne _022386E8
	mov r0, r6
	mov r2, r4
	bl BN_sqr
	cmp r0, #0
	bne _02238704
	b _02238720
_022386E8:
	mov r0, r6
	mov r3, r4
	bl BN_mul
	cmp r0, #0
	bne _02238704
	b _02238720
_02238700:
	mov r6, r1
_02238704:
	mov r1, r8
	mov r2, r6
	mov r3, r7
	mov r0, #0
	str r4, [sp]
	bl BN_div_recp
	mov r5, #1
_02238720:
	ldr r1, [r4]
	mov r0, r5
	sub r1, r1, #1
	str r1, [r4]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end BN_mod_mul_reciprocal

	arm_func_start BN_RECP_CTX_set
BN_RECP_CTX_set: ; 0x0223873C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r4, r1
	bl BN_copy
	add r0, r5, #0x14
	mov r1, #0
	bl BN_set_word
	mov r0, r4
	bl BN_num_bits
	str r0, [r5, #0x28]
	mov r0, #0
	str r0, [r5, #0x2c]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end BN_RECP_CTX_set

	arm_func_start BN_RECP_CTX_free
BN_RECP_CTX_free: ; 0x02238780
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl BN_free
	add r0, r4, #0x14
	bl BN_free
	ldr r0, [r4, #0x30]
	ands r0, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	mov r0, r4
	bl CRYPTOi_MyFree
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_RECP_CTX_free

	arm_func_start BN_RECP_CTX_init
BN_RECP_CTX_init: ; 0x022387B4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl BN_init
	add r0, r4, #0x14
	bl BN_init
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_RECP_CTX_init

	arm_func_start BN_MONT_CTX_free
BN_MONT_CTX_free: ; 0x022387DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0xc
	bl BN_free
	add r0, r4, #0x20
	bl BN_free
	add r0, r4, #0x34
	bl BN_free
	ldr r0, [r4, #0x4c]
	ands r0, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	mov r0, r4
	bl CRYPTOi_MyFree
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_MONT_CTX_free

	arm_func_start BN_MONT_CTX_init
BN_MONT_CTX_init: ; 0x0223881C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	str r1, [r4]
	add r0, r4, #0xc
	str r1, [r4, #8]
	bl BN_init
	add r0, r4, #0x20
	bl BN_init
	add r0, r4, #0x34
	bl BN_init
	mov r0, #0
	str r0, [r4, #0x4c]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_MONT_CTX_init

	arm_func_start BN_MONT_CTX_new
BN_MONT_CTX_new: ; 0x02238858
	stmdb sp!, {r4, lr}
	mov r0, #0x50
	bl CRYPTOi_MyAlloc
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	bxeq lr
	bl BN_MONT_CTX_init
	mov r1, #1
	mov r0, r4
	str r1, [r4, #0x4c]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_MONT_CTX_new

	arm_func_start BN_MONT_CTX_set_word
BN_MONT_CTX_set_word: ; 0x0223888C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r6, r1
	ldr r3, [r6, #4]
	mov r7, r0
	cmp r3, #0
	mov r5, r2
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	add r0, r7, #0x20
	add r4, r7, #0xc
	bl BN_copy
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	add r0, sp, #0
	bl BN_init
	mov r1, #1
	mov r0, r6
	str r1, [r7]
	bl BN_num_bits
	add r1, r0, #0x1f
	mov r0, r1, asr #4
	add r0, r1, r0, lsr #27
	mov r2, r0, asr #5
	mov r0, r4
	mov r1, #0
	str r2, [r7, #8]
	bl BN_set_word
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	mov r0, r4
	mov r1, #0x20
	bl BN_set_bit
	cmp r0, #0
	beq _02238A30
	ldr r0, [r6]
	ldr r4, [r0]
	mov r0, r4
	bl BN_mod_inverse_word
	mov r1, r0
	add r0, sp, #0
	bl BN_set_word
	cmp r0, #0
	beq _02238A30
	add r0, sp, #0
	mov r2, #0x20
	mov r1, r0
	bl BN_lshift
	cmp r0, #0
	beq _02238A30
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _022389A8
	cmp r0, #1
	bne _02238998
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	beq _022389A8
_02238998:
	add r0, sp, #0
	mov r1, #1
	bl BN_sub_word
	b _022389BC
_022389A8:
	add r0, sp, #0
	mvn r1, #0
	bl BN_set_word
	cmp r0, #0
	beq _02238A30
_022389BC:
	ldr r2, [sp, #4]
	cmp r2, #1
	ldrge r0, [sp]
	ldrge r1, [r0]
	movlt r1, #0
	cmp r2, #2
	ldrge r0, [sp]
	mov r2, r4
	ldrge r0, [r0, #4]
	movlt r0, #0
	bl bn_div_words
	str r0, [r7, #0x48]
	add r0, r7, #0xc
	mov r1, #0
	bl BN_set_word
	ldr r1, [r7, #8]
	add r0, r7, #0xc
	mov r1, r1, lsl #6
	bl BN_set_bit
	cmp r0, #0
	beq _02238A30
	add r0, r7, #0xc
	mov r1, r0
	mov r3, r5
	add r2, r7, #0x20
	bl BN_mod
	ldr r1, [r7, #8]
	add r0, r7, #0xc
	bl bn_zexpand
_02238A30:
	add r0, sp, #0
	bl BN_free
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end BN_MONT_CTX_set_word

	arm_func_start BN_gen_exp_string
BN_gen_exp_string: ; 0x02238A48
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r4, r2
	mov r7, r1
	cmp r4, #6
	mov r5, r0
	movgt r4, #6
	mov r1, #1
	mov r2, r1, lsl r4
	ldr r0, [r7, #4]
	sub r2, r2, #1
	add r0, r4, r0, lsl #5
	ldr r3, _02238C1C ; =shift_val
	str r2, [sp]
	ldr r2, [r3, r4, lsl #2]
	mov r1, r4
	sub r0, r0, #1
	str r2, [sp, #4]
	mov r6, #0
	bl _s32_div_f
	mov ip, #0
	mov r0, r0, lsl #1
	add r0, r0, #2
	mov r8, r6
	add r1, r5, r0
	strb r8, [r5, r0]
	strb r8, [r1, #-1]
	ldr r0, [r7]
	ldr r2, [r7, #4]
	ldr r7, [r0]
	add lr, r0, #4
	cmp r2, #1
	sub sb, r1, #2
	ldrgt r8, [lr], #4
	mov sl, r7
	mov r0, ip
	str ip, [sp, #8]
	mov r1, #0xff
	mov fp, ip
_02238AE4:
	ldr r3, [sp]
	and r3, sl, r3
	ldr sl, [sp, #4]
	ldrb sl, [sl, r3]
	cmp sl, #0
	beq _02238B44
	add ip, ip, sl
	add r6, r6, sl
	cmp r6, #0x20
	blo _02238B2C
	cmp r2, #1
	ble _02238B44
	sub r2, r2, #1
	mov r7, r8
	cmp r2, #1
	movle r8, fp
	ldrgt r8, [lr], #4
	sub r6, r6, #0x20
_02238B2C:
	cmp r6, #0
	moveq sl, r7
	movne sl, r7, lsr r6
	rsbne r3, r6, #0x20
	orrne sl, sl, r8, lsl r3
	b _02238AE4
_02238B44:
	cmp r3, #0
	beq _02238BC8
	strb ip, [sb]
	strb r3, [sb, #-1]
	cmp ip, #0x100
	sub sb, sb, #2
	blo _02238B80
	cmp ip, #0x100
	blo _02238B80
_02238B68:
	strb r1, [sb]
	sub ip, ip, #0x100
	strb r0, [sb, #-1]
	sub sb, sb, #2
	cmp ip, #0x100
	bhs _02238B68
_02238B80:
	mov ip, r4
	add r6, r6, r4
	cmp r6, #0x20
	blo _02238BB0
	cmp r2, #1
	ble _02238BC8
	sub r2, r2, #1
	mov r7, r8
	cmp r2, #1
	ldrle r8, [sp, #8]
	sub r6, r6, #0x20
	ldrgt r8, [lr], #4
_02238BB0:
	cmp r6, #0
	moveq sl, r7
	movne sl, r7, lsr r6
	rsbne r3, r6, #0x20
	orrne sl, sl, r8, lsl r3
	b _02238AE4
_02238BC8:
	add sb, sb, #1
	mov r0, #2
	b _02238BEC
_02238BD4:
	strb r2, [r5]
	ldrb r1, [sb, #1]
	add sb, sb, #2
	add r0, r0, #2
	strb r1, [r5, #1]
	add r5, r5, #2
_02238BEC:
	ldrb r2, [sb]
	cmp r2, #0
	bne _02238BD4
	ldrb r1, [sb, #1]
	cmp r1, #0
	bne _02238BD4
	mov r1, #0
	strb r1, [r5]
	strb r1, [r5, #1]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.balign 4, 0
_02238C1C: .word shift_val
	arm_func_end BN_gen_exp_string

	arm_func_start BN_gen_exp_bits
BN_gen_exp_bits: ; 0x02238C20
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	ldr r5, [r3], #4
	mov r2, #0x14
	mla r4, r5, r2, r3
	mov sb, r0
	ldr r0, [sb, #4]
	mov r8, r1
	cmp r0, #0
	mov r5, #0
	mov r1, r0, lsl #5
	addeq sp, sp, #4
	moveq r0, r5
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	cmp r0, #1
	bne _02238CC0
	cmp r0, #1
	bne _02238C84
	ldr r2, [sb]
	ldr r1, _02238D84 ; =0x00010001
	ldr r2, [r2]
	cmp r2, r1
	ldreq r5, _02238D88 ; =TEMPNAME__$p16
	beq _02238CB0
_02238C84:
	ldr r1, [sb]
	ldr r1, [r1]
	cmp r1, #0x11
	bne _02238CA0
	cmp r0, #1
	ldreq r5, _02238D8C ; =TEMPNAME__$p4
	beq _02238CB0
_02238CA0:
	cmp r1, #3
	bne _02238CB0
	cmp r0, #1
	ldreq r5, _02238D90 ; =TEMPNAME__$p2
_02238CB0:
	mov r7, #1
	mov r6, r7
	mov r1, #0x20
	b _02238CF0
_02238CC0:
	cmp r1, #0x100
	movge r7, #5
	movge r6, #0x10
	movge r1, #7
	bge _02238CF0
	cmp r1, #0x80
	movge r6, #8
	movge r1, r6
	movge r7, #4
	movlt r7, #3
	movlt r6, #4
	movlt r1, #0xb
_02238CF0:
	mul r1, r0, r1
	mov r0, r1, lsl #1
	add r1, r0, #7
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	cmp r5, #0
	mov r1, r0, asr #2
	bne _02238D6C
	ldr r0, [r4, #8]
	cmp r1, r0
	movle r0, r4
	ble _02238D28
	mov r0, r4
	bl bn_expand2
_02238D28:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	ldr r5, [r4]
	mov r1, sb
	mov r2, r7
	add r0, r5, #4
	bl BN_gen_exp_string
	add r1, r0, #2
	mov r0, r1, asr #8
	strb r0, [r5]
	strb r1, [r5, #1]
	strb r7, [r5, #2]
	strb r6, [r5, #3]
	b _02238D70
_02238D6C:
	mov r1, #8
_02238D70:
	str r5, [r8]
	add r0, r1, #2
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.balign 4, 0
_02238D84: .word 0x00010001
_02238D88: .word TEMPNAME__$p16
_02238D8C: .word TEMPNAME__$p4
_02238D90: .word TEMPNAME__$p2
	arm_func_end BN_gen_exp_bits

	arm_func_start BN_mod_inverse_word
BN_mod_inverse_word: ; 0x02238D94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov r1, sl
	rsb r0, sl, #0
	bl _u32_div_f
	movs r8, r1
	mov r7, sl
	mov r5, #0
	mov r6, #1
	mvn r4, #0
	beq _02238DFC
_02238DC0:
	mov r0, r7
	mov r1, r8
	bl _u32_div_f
	mov sb, r1
	mov r0, r7
	mov r1, r8
	bl _u32_div_f
	mla r1, r0, r6, r5
	mov r5, r6
	mov r7, r8
	mov r6, r1
	mov r8, sb
	cmp sb, #0
	rsb r4, r4, #0
	bne _02238DC0
_02238DFC:
	cmp r4, #0
	sublt r5, sl, r5
	cmp r7, #1
	movne r1, #0
	bne _02238E1C
	mov r0, r5
	mov r1, sl
	bl _u32_div_f
_02238E1C:
	mov r0, r1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end BN_mod_inverse_word

	arm_func_start bn_from_montgomery_words
bn_from_montgomery_words: ; 0x02238E28
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r7, r3
	mov sb, r1
	mov r6, #0
	mov sl, r0
	mov r8, r2
	mov r4, r6
	cmp r7, #0
	add r5, sb, r7, lsl #2
	ldr fp, [sp, #0x30]
	ble _02238EB8
	mov r0, #1
	str r6, [sp, #4]
	str r0, [sp]
_02238E64:
	ldr r1, [sb]
	mov r0, sb
	mul r3, r1, fp
	mov r1, r8
	mov r2, r7
	bl bn_mul_add_words
	add r1, r0, r6
	ldr r0, [r5]
	cmp r1, r6
	ldrlo r6, [sp]
	add r0, r0, r1
	str r0, [r5]
	ldr r0, [r5]
	ldrhs r6, [sp, #4]
	cmp r0, r1
	add r4, r4, #1
	addlo r6, r6, #1
	cmp r4, r7
	add sb, sb, #4
	add r5, r5, #4
	blt _02238E64
_02238EB8:
	cmp r6, #0
	sub r2, r7, #1
	bne _02238F0C
	ldr r1, [sb, r2, lsl #2]
	ldr r0, [r8, r2, lsl #2]
	cmp r1, r0
	bne _02238EF8
	cmp r2, #0
	ble _02238EF8
_02238EDC:
	ldr r1, [sb, r2, lsl #2]
	ldr r0, [r8, r2, lsl #2]
	cmp r1, r0
	bne _02238EF8
	sub r2, r2, #1
	cmp r2, #0
	bgt _02238EDC
_02238EF8:
	ldr r1, [sb, r2, lsl #2]
	ldr r0, [r8, r2, lsl #2]
	cmp r1, r0
	movhs r6, #1
	movlo r6, #0
_02238F0C:
	cmp r6, #0
	beq _02238F34
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r7
	bl bn_sub_words
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02238F34:
	cmp r7, #0
	addle sp, sp, #0xc
	mov r1, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
_02238F48:
	ldr r0, [sb, r1, lsl #2]
	str r0, [sl, r1, lsl #2]
	add r1, r1, #1
	cmp r1, r7
	blt _02238F48
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end bn_from_montgomery_words

	arm_func_start bn_sqr_normal
bn_sqr_normal: ; 0x02238F68
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	mov fp, r2
	mov r6, fp, lsl #1
	mov sl, r0
	mov r7, fp
	mov sb, r1
	sub r7, r7, #1
	sub r2, r6, #1
	mov r0, #0
	str r0, [sl, r2, lsl #2]
	ldr r0, [sl, r2, lsl #2]
	str r3, [sp]
	mov r5, sb
	str r0, [sl]
	cmp r7, #0
	add r4, sl, #4
	ble _02238FD0
	add r5, r5, #4
	ldr r3, [sb]
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl bn_mul_words
	str r0, [r4, r7, lsl #2]
	add r4, r4, #8
_02238FD0:
	sub r8, fp, #2
	cmp r8, #0
	ble _02239010
_02238FDC:
	mov r0, r5
	sub r7, r7, #1
	add r5, r5, #4
	ldr r3, [r0]
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl bn_mul_add_words
	sub r8, r8, #1
	str r0, [r4, r7, lsl #2]
	cmp r8, #0
	add r4, r4, #8
	bgt _02238FDC
_02239010:
	mov r0, sl
	mov r1, sl
	mov r2, sl
	mov r3, r6
	bl bn_add_words
	ldr r0, [sp]
	mov r1, sb
	mov r2, fp
	bl bn_sqr_words
	ldr r2, [sp]
	mov r0, sl
	mov r1, sl
	mov r3, r6
	bl bn_add_words
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end bn_sqr_normal

	arm_func_start BN_sqr
BN_sqr: ; 0x02239054
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x64
	ldr r5, [r2]
	mov sb, r0
	mov r8, r1
	cmp r8, sb
	add r3, r2, #4
	mov r2, #0x14
	movne r7, sb
	addeq r0, r5, #1
	mla r4, r5, r2, r3
	mlaeq r7, r0, r2, r3
	ldr r5, [r8, #4]
	cmp r5, #0
	movle r0, #0
	strle r0, [sb, #4]
	addle sp, sp, #0x64
	movle r0, #1
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r0, [r7, #8]
	mov r6, r5, lsl #1
	cmp r6, r0
	movle r0, r7
	ble _022390C4
	mov r0, r7
	mov r1, r6
	bl bn_expand2
_022390C4:
	cmp r0, #0
	addeq sp, sp, #0x64
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	str r6, [r7, #4]
	mov r0, #0
	str r0, [r7, #0xc]
	cmp r5, #4
	bne _02239104
	ldr r0, [r7]
	ldr r1, [r8]
	add r3, sp, #0
	mov r2, #4
	bl bn_sqr_normal
	b _02239168
_02239104:
	cmp r5, #8
	bne _02239124
	ldr r0, [r7]
	ldr r1, [r8]
	add r3, sp, #0x20
	mov r2, #8
	bl bn_sqr_normal
	b _02239168
_02239124:
	ldr r0, [r4, #8]
	cmp r6, r0
	movle r0, r4
	ble _02239140
	mov r0, r4
	mov r1, r6
	bl bn_expand2
_02239140:
	cmp r0, #0
	addeq sp, sp, #0x64
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	ldr r0, [r7]
	ldr r1, [r8]
	ldr r3, [r4]
	mov r2, r5
	bl bn_sqr_normal
_02239168:
	cmp r6, #0
	ble _0223918C
	ldr r1, [r7]
	sub r0, r6, #1
	ldr r0, [r1, r0, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #4]
	subeq r0, r0, #1
	streq r0, [r7, #4]
_0223918C:
	cmp r7, sb
	beq _022391A0
	mov r0, sb
	mov r1, r7
	bl BN_copy
_022391A0:
	mov r0, #1
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end BN_sqr

	arm_func_start BN_mod_exp
BN_mod_exp: ; 0x022391B0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [r3, #4]
	cmp ip, #0
	ble _022391F4
	ldr ip, [r3]
	ldr ip, [ip]
	ands ip, ip, #1
	beq _022391F4
	ldr lr, [sp, #0x10]
	mov ip, #0
	str lr, [sp]
	str ip, [sp, #4]
	bl BN_mod_exp_mont
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
_022391F4:
	ldr ip, [sp, #0x10]
	str ip, [sp]
	bl BN_mod_exp_recp
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	arm_func_end BN_mod_exp

	arm_func_start BN_mod
BN_mod: ; 0x0223920C
	stmdb sp!, {lr}
	sub sp, sp, #4
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0
	bl BN_div
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	arm_func_end BN_mod

	arm_func_start BN_div
BN_div: ; 0x02239240
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	mov r6, r3
	ldr r3, [r6, #4]
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	cmp r3, #0
	ldr r4, [sp, #0x70]
	beq _02239280
	cmp r3, #1
	bne _02239290
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	bne _02239290
_02239280:
	add sp, sp, #0x4c
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_02239290:
	ldr r0, [sp, #4]
	mov r1, r6
	bl BN_ucmp
	cmp r0, #0
	bge _022392F0
	ldr r0, [sp]
	cmp r0, #0
	beq _022392CC
	ldr r1, [sp, #4]
	bl BN_copy
	cmp r0, #0
	addeq sp, sp, #0x4c
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
_022392CC:
	cmp r8, #0
	beq _022392E0
	mov r0, r8
	mov r1, #0
	bl BN_set_word
_022392E0:
	add sp, sp, #0x4c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022392F0:
	ldr r3, [r4]
	add r0, r4, #4
	mov r2, #0x14
	mla r1, r3, r2, r0
	mov r3, #0
	str r3, [r1, #0xc]
	ldr r5, [r4]
	str r1, [sp, #0x14]
	add r4, r5, #1
	mla r1, r4, r2, r0
	add r3, r5, #2
	str r1, [sp, #0x18]
	mla r1, r3, r2, r0
	cmp r8, #0
	str r1, [sp, #0x1c]
	addeq r1, r5, #3
	mlaeq r8, r1, r2, r0
	mov r0, r6
	bl BN_num_bits
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #27
	add r0, r1, r0, ror #27
	rsb r0, r0, #0x20
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #8]
	mov r1, r6
	bl BN_lshift
	cmp r0, #0
	addeq sp, sp, #0x4c
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #4]
	ldr r3, [sp, #0x1c]
	mov r4, #0
	add r2, r2, #0x20
	str r4, [r3, #0xc]
	bl BN_lshift
	cmp r0, #0
	addeq sp, sp, #0x4c
	moveq r0, r4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r0, [sp, #0x18]
	mov r1, r4
	str r1, [r0, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #4]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x28]
	ldr r4, [r0, #4]
	add r0, sp, #0x38
	sub r1, r4, r1
	str r1, [sp, #0x10]
	bl BN_init
	ldr r0, [sp, #0x18]
	ldr r2, [r0]
	ldr r0, [sp, #0x28]
	sub r1, r0, #1
	ldr r0, [sp, #0x10]
	add r0, r2, r0, lsl #2
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x28]
	cmp r0, #1
	add r0, r2, #1
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x1c]
	moveq r5, #0
	ldr r2, [r0]
	ldr r0, [r2, r1, lsl #2]
	str r0, [sp, #0x24]
	ldrne r0, [sp, #0x28]
	subne r0, r0, #2
	ldrne r5, [r2, r0, lsl #2]
	ldr r0, [sp, #0x18]
	ldr r2, [r8, #8]
	ldr r1, [r0]
	sub r0, r4, #1
	add r7, r1, r0, lsl #2
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	cmp r1, r2
	movle r0, r8
	ble _02239468
	mov r0, r8
	bl bn_expand2
_02239468:
	cmp r0, #0
	beq _022397CC
	ldr r0, [sp, #4]
	ldr r1, [r6, #0xc]
	ldr r3, [r0, #0xc]
	ldr r0, [sp, #0x10]
	sub r2, r0, #1
	eor r0, r3, r1
	str r0, [r8, #0xc]
	ldr r0, [sp, #0x10]
	str r0, [r8, #4]
	ldr r0, [sp, #0x28]
	ldr r3, [r8]
	add r1, r0, #1
	add r0, r3, r2, lsl #2
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #8]
	cmp r1, r0
	ldrle r0, [sp, #0x14]
	ble _022394C4
	ldr r0, [sp, #0x14]
	bl bn_expand2
_022394C4:
	cmp r0, #0
	beq _022397CC
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x38
	bl BN_ucmp
	cmp r0, #0
	blt _02239518
	add r0, sp, #0x38
	ldr r2, [sp, #0x1c]
	mov r1, r0
	bl BN_usub
	cmp r0, #0
	beq _022397CC
	ldr r0, [sp, #0x20]
	mov r2, #1
	str r2, [r0]
	ldr r0, [r8, #4]
	ldr r1, [r8]
	sub r0, r0, #1
	str r2, [r1, r0, lsl #2]
	b _02239524
_02239518:
	ldr r0, [r8, #4]
	sub r0, r0, #1
	str r0, [r8, #4]
_02239524:
	ldr r0, [sp, #0x10]
	sub r1, r0, #1
	ldr r0, [sp, #0x20]
	cmp r1, #0
	sub r0, r0, #4
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0xc]
	ble _02239774
	ldr r8, _022397DC ; =0x0000FFFF
	cmp r1, #0
	and r0, r5, r8
	str r0, [sp, #0x2c]
	and r0, r8, r5, lsr #16
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x24]
	and r4, r0, r8
	ble _02239774
	and sb, r8, r0, lsr #16
	mvn r0, #0
	str r0, [sp, #0x34]
_02239578:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	sub r1, r1, #4
	add r0, r0, #1
	str r0, [sp, #0x3c]
	str r1, [sp, #0x38]
	ldr fp, [r7]
	ldr r0, [sp, #0x24]
	ldr r5, [r7, #-4]
	cmp fp, r0
	ldreq r6, [sp, #0x34]
	beq _022395BC
	ldr r2, [sp, #0x24]
	mov r0, fp
	mov r1, r5
	bl bn_div_words
	mov r6, r0
_022395BC:
	ldr r0, [sp, #0x2c]
	and r2, r6, r8
	mul ip, r0, r2
	ldr r0, [sp, #0x30]
	and lr, r8, r6, lsr #16
	ldr r1, [sp, #0x30]
	mul r0, r2, r0
	mul r3, r1, lr
	ldr r1, [sp, #0x2c]
	mul sl, sb, lr
	mla r1, lr, r1, r0
	cmp r1, r0
	addlo r3, r3, #0x10000
	and r0, r8, r1, lsr #16
	add r3, r3, r0
	and r0, r1, r8
	add ip, ip, r0, lsl #16
	cmp ip, r0, lsl #16
	mul r0, r2, sb
	mul r1, r4, r2
	mla r2, lr, r4, r0
	addlo r3, r3, #1
	cmp r2, r0
	addlo sl, sl, #0x10000
	and r0, r8, r2, lsr #16
	add sl, sl, r0
	and r0, r2, r8
	add r1, r1, r0, lsl #16
	cmp r1, r0, lsl #16
	addlo sl, sl, #1
	sub r1, r5, r1
	cmp r1, r5
	addhi sl, sl, #1
	subs r0, fp, sl
	bne _0223966C
	cmp r3, r1
	blo _0223966C
	cmp r3, r1
	bne _02239664
	ldr r0, [r7, #-8]
	cmp ip, r0
	bls _0223966C
_02239664:
	sub r6, r6, #1
	b _022395BC
_0223966C:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [sp, #0x28]
	mov r3, r6
	bl bn_mul_words
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x28]
	ldr r3, [r1]
	ldr r1, [sp, #0x28]
	str r0, [r3, r2, lsl #2]
	add r1, r1, #1
	cmp r1, #0
	ble _022396CC
	ldr r0, [sp, #0x14]
	ldr r2, [r0]
_022396B0:
	sub r0, r1, #1
	ldr r0, [r2, r0, lsl #2]
	cmp r0, #0
	bne _022396CC
	sub r1, r1, #1
	cmp r1, #0
	bgt _022396B0
_022396CC:
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x14]
	str r1, [r0, #4]
	add r0, sp, #0x38
	mov r1, r0
	ldr r5, [sp, #0x3c]
	bl BN_sub
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x3c]
	add r0, r1, r0
	sub r1, r0, r5
	ldr r0, [sp, #0x18]
	str r1, [r0, #4]
	ldr r0, [sp, #0x44]
	cmp r0, #0
	beq _02239744
	add r0, sp, #0x38
	ldr r2, [sp, #0x1c]
	mov r1, r0
	sub r6, r6, #1
	ldr r5, [sp, #0x3c]
	bl BN_add
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x3c]
	sub r0, r0, r5
	add r1, r1, r0
	ldr r0, [sp, #0x18]
	str r1, [r0, #4]
_02239744:
	ldr r0, [sp, #0x20]
	sub r7, r7, #4
	str r6, [r0], #-4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	sub r1, r0, #1
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _02239578
_02239774:
	ldr r0, [sp, #0x18]
	bl bn_fix_top
	ldr r0, [sp]
	cmp r0, #0
	beq _022397BC
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	ldr r1, [sp, #0x18]
	add r2, r2, #0x20
	ldr r4, [r3, #0xc]
	bl BN_rshift
	cmp r0, #0
	addeq sp, sp, #0x4c
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	ldr r0, [sp]
	str r4, [r0, #0xc]
_022397BC:
	add sp, sp, #0x4c
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_022397CC:
	mov r0, #0
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.balign 4, 0
_022397DC: .word 0x0000FFFF
	arm_func_end BN_div

	arm_func_start bn_mul_normal
bn_mul_normal: ; 0x022397E0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	ldr r5, [sp, #0x20]
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r6, r3
	cmp r7, r5
	bge _0223981C
	mov r1, r7
	mov r0, r8
	mov r7, r5
	mov r8, r6
	mov r5, r1
	mov r6, r0
_0223981C:
	ldr r3, [r6]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	add r4, sb, r7, lsl #2
	bl bn_mul_words
	str r0, [sb, r7, lsl #2]
_02239838:
	sub r0, r5, #1
	cmp r0, #0
	addle sp, sp, #4
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r3, [r6, #4]
	mov r1, r8
	mov r2, r7
	add r0, sb, #4
	bl bn_mul_add_words
	sub r1, r5, #2
	cmp r1, #0
	addle sp, sp, #4
	str r0, [r4, #4]
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r3, [r6, #8]
	mov r1, r8
	mov r2, r7
	add r0, sb, #8
	bl bn_mul_add_words
	sub r1, r5, #3
	cmp r1, #0
	addle sp, sp, #4
	str r0, [r4, #8]
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r3, [r6, #0xc]
	mov r1, r8
	mov r2, r7
	add r0, sb, #0xc
	bl bn_mul_add_words
	sub r5, r5, #4
	cmp r5, #0
	addle sp, sp, #4
	str r0, [r4, #0xc]
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r3, [r6, #0x10]
	mov r1, r8
	mov r2, r7
	add r0, sb, #0x10
	bl bn_mul_add_words
	str r0, [r4, #0x10]
	add r4, r4, #0x10
	add sb, sb, #0x10
	add r6, r6, #0x10
	b _02239838
_022398F8:
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end bn_mul_normal

	arm_func_start BN_mul
BN_mul: ; 0x02239904
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #4
	mov sb, r1
	ldr r6, [sb, #4]
	mov r8, r2
	mov sl, r0
	cmp r6, #0
	ldr r5, [r8, #4]
	beq _02239930
	cmp r5, #0
	bne _0223994C
_02239930:
	mov r0, sl
	mov r1, #0
	bl BN_set_word
	add sp, sp, #4
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
_0223994C:
	ldr r1, [sb, #0xc]
	ldr r0, [r8, #0xc]
	cmp sl, sb
	add r7, r6, r5
	eor fp, r1, r0
	beq _0223996C
	cmp sl, r8
	bne _02239984
_0223996C:
	ldr r0, [r3]
	add r2, r3, #4
	add r1, r0, #1
	mov r0, #0x14
	mla r4, r1, r0, r2
	b _02239988
_02239984:
	mov r4, sl
_02239988:
	ldr r0, [r4, #8]
	cmp r7, r0
	movle r0, r4
	ble _022399A4
	mov r0, r4
	mov r1, r7
	bl bn_expand2
_022399A4:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxeq lr
	str r7, [r4, #4]
	str r5, [sp]
	ldr r0, [r4]
	ldr r1, [sb]
	ldr r3, [r8]
	mov r2, r6
	bl bn_mul_normal
	mov r0, r4
	str fp, [sl, #0xc]
	bl bn_fix_top
	cmp sl, r4
	beq _022399F4
	mov r0, sl
	mov r1, r4
	bl BN_copy
_022399F4:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end BN_mul

	arm_func_start BN_sub
BN_sub: ; 0x02239A04
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r6, r1
	ldr r1, [r6, #0xc]
	mov r3, #0
	mov r7, r0
	mov r5, r2
	mov r4, r3
	cmp r1, #0
	beq _02239A4C
	ldr r0, [r5, #0xc]
	cmp r0, #0
	movne r0, r6
	moveq r3, #1
	movne r6, r5
	movne r5, r0
	moveq r4, r3
	b _02239A58
_02239A4C:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	movne r3, #1
_02239A58:
	cmp r3, #0
	beq _02239A8C
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl BN_uadd
	cmp r0, #0
	moveq r0, #0
	add sp, sp, #4
	strne r4, [r7, #0xc]
	movne r0, #1
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_02239A8C:
	ldr r0, [r5, #4]
	ldr r1, [r6, #4]
	cmp r1, r0
	movle r1, r0
	ldr r0, [r7, #8]
	cmp r1, r0
	movle r0, r7
	ble _02239AB4
	mov r0, r7
	bl bn_expand2
_02239AB4:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	mov r0, r6
	mov r1, r5
	bl BN_ucmp
	cmp r0, #0
	bge _02239B0C
	mov r0, r7
	mov r1, r5
	mov r2, r6
	bl BN_usub
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	mov r0, #1
	str r0, [r7, #0xc]
	b _02239B38
_02239B0C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl BN_usub
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	mov r0, #0
	str r0, [r7, #0xc]
_02239B38:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end BN_sub

	arm_func_start BN_usub
BN_usub: ; 0x02239B48
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r1
	mov r7, r2
	ldr r5, [r7, #4]
	ldr r6, [r8, #4]
	mov r4, r0
	cmp r6, r5
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxlt lr
	ldr r1, [r4, #8]
	cmp r6, r1
	ble _02239B84
	mov r1, r6
	bl bn_expand2
_02239B84:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	mov r3, #0
	mov r0, r3
	cmp r5, #0
	ldr r2, [r8]
	ldr sb, [r7]
	ldr r1, [r4]
	ble _02239C04
	mov ip, r3
	mov r7, r3
	mov lr, #1
_02239BBC:
	cmp r3, #0
	ldr sl, [r2], #4
	ldr r8, [sb], #4
	beq _02239BE4
	cmp sl, r8
	movls r3, lr
	sub r8, sl, r8
	movhi r3, ip
	sub sl, r8, #1
	b _02239BF4
_02239BE4:
	cmp sl, r8
	movlo r3, lr
	movhs r3, r7
	sub sl, sl, r8
_02239BF4:
	add r0, r0, #1
	cmp r0, r5
	str sl, [r1], #4
	blt _02239BBC
_02239C04:
	cmp r3, #0
	beq _02239C34
	cmp r0, r6
	bge _02239C34
_02239C14:
	ldr r5, [r2], #4
	add r0, r0, #1
	sub r3, r5, #1
	cmp r5, r3
	str r3, [r1], #4
	bhi _02239C34
	cmp r0, r6
	blt _02239C14
_02239C34:
	cmp r1, r2
	beq _02239C94
_02239C3C:
	cmp r0, r6
	bge _02239C94
	ldr r5, [r2]
	add r3, r0, #1
	str r5, [r1]
	cmp r3, r6
	bge _02239C94
	ldr r5, [r2, #4]
	add r3, r0, #2
	str r5, [r1, #4]
	cmp r3, r6
	bge _02239C94
	ldr r5, [r2, #8]
	add r3, r0, #3
	str r5, [r1, #8]
	cmp r3, r6
	ldrlt r3, [r2, #0xc]
	add r0, r0, #4
	strlt r3, [r1, #0xc]
	addlt r2, r2, #0x10
	addlt r1, r1, #0x10
	blt _02239C3C
_02239C94:
	mov r0, r4
	str r6, [r4, #4]
	bl bn_fix_top
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end BN_usub

	arm_func_start BN_uadd
BN_uadd: ; 0x02239CAC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	mov r4, r1
	mov r8, r2
	ldr r2, [r4, #4]
	ldr r1, [r8, #4]
	mov sb, r0
	cmp r2, r1
	movlt r0, r4
	movlt r4, r8
	movlt r8, r0
	ldr r6, [r4, #4]
	ldr r0, [sb, #8]
	add r1, r6, #1
	cmp r1, r0
	ldr r7, [r8, #4]
	movle r0, sb
	ble _02239CFC
	mov r0, sb
	bl bn_expand2
_02239CFC:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxeq lr
	str r6, [sb, #4]
	ldr r5, [r4]
	ldr r4, [sb]
	ldr r2, [r8]
	mov r0, r4
	mov r1, r5
	mov r3, r7
	bl bn_add_words
	cmp r0, #0
	add r4, r4, r7, lsl #2
	add r5, r5, r7, lsl #2
	beq _02239D94
	cmp r7, r6
	bge _02239D74
_02239D48:
	ldr r2, [r5], #4
	mov r3, r4
	add r1, r2, #1
	str r1, [r4], #4
	ldr r1, [r3]
	add r7, r7, #1
	cmp r1, r2
	movhs r0, #0
	bhs _02239D74
	cmp r7, r6
	blt _02239D48
_02239D74:
	cmp r7, r6
	blt _02239D94
	cmp r0, #0
	movne r0, #1
	strne r0, [r4], #4
	ldrne r0, [sb, #4]
	addne r0, r0, #1
	strne r0, [sb, #4]
_02239D94:
	cmp r4, r5
	beq _02239DB8
	cmp r7, r6
	bge _02239DB8
_02239DA4:
	ldr r0, [r5], #4
	add r7, r7, #1
	cmp r7, r6
	str r0, [r4], #4
	blt _02239DA4
_02239DB8:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end BN_uadd

	arm_func_start BN_add
BN_add: ; 0x02239DC8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	ldr r2, [r5, #0xc]
	ldr r1, [r4, #0xc]
	mov r6, r0
	eors r0, r2, r1
	beq _02239E6C
	cmp r2, #0
	movne r0, r5
	movne r5, r4
	movne r4, r0
	mov r0, r5
	mov r1, r4
	bl BN_ucmp
	cmp r0, #0
	bge _02239E38
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl BN_usub
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	mov r0, #1
	str r0, [r6, #0xc]
	b _02239E60
_02239E38:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl BN_usub
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	mov r0, #0
	str r0, [r6, #0xc]
_02239E60:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_02239E6C:
	cmp r2, #0
	movne r0, #1
	strne r0, [r6, #0xc]
	moveq r0, #0
	streq r0, [r6, #0xc]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl BN_uadd
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end BN_add

	arm_func_start BN_sub_word
BN_sub_word: ; 0x02239EA4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	movs r4, r1
	mov r5, r0
	addeq sp, sp, #4
	moveq r0, #1
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
	ldr r2, [r5, #0xc]
	cmp r2, #0
	beq _02239EF0
	mov r2, #0
	str r2, [r5, #0xc]
	bl BN_add_word
	mov r1, #1
	add sp, sp, #4
	str r1, [r5, #0xc]
	ldmia sp!, {r4, r5, lr}
	bx lr
_02239EF0:
	ldr r1, [r5, #4]
	cmp r1, #1
	bgt _02239F94
	cmp r1, #0
	bne _02239F4C
	ldr r1, [r5, #8]
	cmp r1, #1
	bge _02239F18
	mov r1, #1
	bl bn_expand2
_02239F18:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
	ldr r1, [r5]
	mov r0, #1
	str r4, [r1]
	str r0, [r5, #0xc]
	add sp, sp, #4
	str r0, [r5, #4]
	ldmia sp!, {r4, r5, lr}
	bx lr
_02239F4C:
	ldr r2, [r5]
	ldr r1, [r2]
	cmp r1, r4
	moveq r0, #0
	streq r0, [r5, #4]
	beq _02239F84
	cmp r1, r4
	subhi r0, r1, r4
	strhi r0, [r2]
	movls r0, #1
	strls r0, [r5, #0xc]
	ldrls r0, [r5]
	subls r1, r4, r1
	strls r1, [r0]
_02239F84:
	add sp, sp, #4
	mov r0, #1
	ldmia sp!, {r4, r5, lr}
	bx lr
_02239F94:
	mov r0, #0
	mov r1, #1
_02239F9C:
	ldr ip, [r5]
	mov r3, r0, lsl #2
	ldr r2, [ip, r0, lsl #2]
	cmp r2, r4
	ldrhs r1, [ip, r3]
	subhs r1, r1, r4
	strhs r1, [ip, r3]
	bhs _02239FD4
	ldr r2, [ip, r3]
	add r0, r0, #1
	sub r2, r2, r4
	mov r4, r1
	str r2, [ip, r3]
	b _02239F9C
_02239FD4:
	ldr r1, [r5]
	ldr r1, [r1, r3]
	cmp r1, #0
	bne _02239FF4
	ldr r1, [r5, #4]
	sub r1, r1, #1
	cmp r0, r1
	streq r1, [r5, #4]
_02239FF4:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end BN_sub_word

	arm_func_start BN_add_word
BN_add_word: ; 0x0223A004
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	movs r4, r1
	mov r5, r0
	addeq sp, sp, #4
	moveq r0, #1
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
	ldr r2, [r5, #0xc]
	cmp r2, #0
	beq _0223A0AC
	ldr r2, [r5, #4]
	cmp r2, #1
	ble _0223A05C
	mov r2, #0
	str r2, [r5, #0xc]
	bl BN_sub_word
	mov r1, #1
	add sp, sp, #4
	str r1, [r5, #0xc]
	ldmia sp!, {r4, r5, lr}
	bx lr
_0223A05C:
	ldr r2, [r5]
	ldr r1, [r2]
	cmp r1, r4
	subhi r0, r1, r4
	strhi r0, [r2]
	bhi _0223A09C
	cmp r1, r4
	movhs r0, #0
	strhs r0, [r5, #0xc]
	strhs r0, [r5, #4]
	bhs _0223A09C
	mov r0, #0
	str r0, [r5, #0xc]
	ldr r0, [r5]
	sub r1, r4, r1
	str r1, [r0]
_0223A09C:
	add sp, sp, #4
	mov r0, #1
	ldmia sp!, {r4, r5, lr}
	bx lr
_0223A0AC:
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r1, r1, #1
	cmp r1, r2
	ble _0223A0C4
	bl bn_expand2
_0223A0C4:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
	ldr r1, [r5]
	ldr r0, [r5, #4]
	mov r3, #0
	str r3, [r1, r0, lsl #2]
	mov r0, #1
_0223A0EC:
	ldr r2, [r5]
	ldr r1, [r2, r3, lsl #2]
	add r1, r4, r1
	cmp r4, r1
	str r1, [r2, r3, lsl #2]
	movhi r4, r0
	addhi r3, r3, #1
	bhi _0223A0EC
	ldr r0, [r5, #4]
	cmp r3, r0
	addge r0, r0, #1
	strge r0, [r5, #4]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end BN_add_word

	arm_func_start BN_rshift
BN_rshift: ; 0x0223A12C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r1, r2, asr #4
	mov r3, r2, lsr #0x1f
	add r1, r2, r1, lsr #27
	rsb r2, r3, r2, lsl #27
	add r4, r3, r2, ror #27
	ldr r2, [r7, #4]
	mov r6, r1, asr #5
	mov r8, r0
	cmp r6, r2
	rsb r5, r4, #0x20
	ble _0223A174
	mov r1, #0
	bl BN_set_word
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
_0223A174:
	cmp r8, r7
	beq _0223A1AC
	sub r1, r2, r6
	ldr r2, [r8, #8]
	add r1, r1, #2
	cmp r1, r2
	ble _0223A194
	bl bn_expand2
_0223A194:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r0, [r7, #0xc]
	str r0, [r8, #0xc]
_0223A1AC:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	add r2, r0, r6, lsl #2
	ldr r0, [r8]
	sub r7, r1, r6
	mov r6, r2
	str r7, [r8, #4]
	cmp r4, #0
	bne _0223A1F4
	add r2, r7, #1
	cmp r2, #0
	ble _0223A234
_0223A1DC:
	ldr r1, [r6], #4
	sub r2, r2, #1
	cmp r2, #0
	str r1, [r0], #4
	bgt _0223A1DC
	b _0223A234
_0223A1F4:
	cmp r7, #1
	add r6, r2, #4
	ldr r3, [r2]
	mov r2, #1
	ble _0223A224
_0223A208:
	mov r1, r3, lsr r4
	ldr r3, [r6], #4
	add r2, r2, #1
	orr r1, r1, r3, lsl r5
	cmp r2, r7
	str r1, [r0], #4
	blt _0223A208
_0223A224:
	mov r1, r3, lsr r4
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
_0223A234:
	mov r0, r8
	bl bn_fix_top
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end BN_rshift

	arm_func_start BN_lshift
BN_lshift: ; 0x0223A248
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, r1
	mov r7, r2
	mov r1, r7, asr #4
	mov r5, r0
	add r2, r7, r1, lsr #27
	ldr r1, [r4, #4]
	ldr r3, [r5, #8]
	add r1, r1, r2, asr #5
	add r1, r1, #1
	cmp r1, r3
	mov r6, r2, asr #5
	ble _0223A280
	bl bn_expand2
_0223A280:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxeq lr
	ldr r0, [r4, #0xc]
	mov r1, r7, lsr #0x1f
	str r0, [r5, #0xc]
	ldr r3, [r4, #4]
	rsb r0, r1, r7, lsl #27
	adds ip, r1, r0, ror #27
	ldr r2, [r4]
	ldr r0, [r5]
	add r1, r3, r6
	mov r3, #0
	str r3, [r0, r1, lsl #2]
	rsb r3, ip, #0x20
	bne _0223A2E8
	ldr r1, [r4, #4]
	subs r7, r1, #1
	bmi _0223A31C
_0223A2D0:
	ldr r3, [r2, r7, lsl #2]
	add r1, r6, r7
	str r3, [r0, r1, lsl #2]
	subs r7, r7, #1
	bpl _0223A2D0
	b _0223A31C
_0223A2E8:
	ldr r1, [r4, #4]
	subs r1, r1, #1
	bmi _0223A31C
_0223A2F4:
	add sb, r6, r1
	add r8, sb, #1
	ldr sl, [r2, r1, lsl #2]
	ldr lr, [r0, r8, lsl #2]
	mov r7, sl, lsl ip
	orr lr, lr, sl, lsr r3
	str lr, [r0, r8, lsl #2]
	str r7, [r0, sb, lsl #2]
	subs r1, r1, #1
	bpl _0223A2F4
_0223A31C:
	mov r2, r6, lsl #2
	mov r1, #0
	bl MI_CpuFill8
	ldr r1, [r4, #4]
	mov r0, r5
	add r1, r1, r6
	add r1, r1, #1
	str r1, [r5, #4]
	bl bn_fix_top
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end BN_lshift

	arm_func_start bn_sub_words
bn_sub_words: ; 0x0223A34C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	cmp r3, #0
	movle r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bxle lr
	mov r6, #0
	mov r4, r6
	mov lr, r6
	mov ip, r6
	mov r7, r6
	mov r5, #1
_0223A378:
	ldr sl, [r1]
	ldr sb, [r2]
	sub r8, sl, sb
	sub r8, r8, r6
	str r8, [r0]
	cmp sl, sb
	beq _0223A3A0
	cmp sl, sb
	movlo r6, r5
	movhs r6, r4
_0223A3A0:
	sub r8, r3, #1
	cmp r8, #0
	ble _0223A454
	ldr sl, [r1, #4]
	ldr sb, [r2, #4]
	sub r8, sl, sb
	sub r8, r8, r6
	str r8, [r0, #4]
	cmp sl, sb
	beq _0223A3D4
	cmp sl, sb
	movlo r6, r5
	movhs r6, lr
_0223A3D4:
	sub r8, r3, #2
	cmp r8, #0
	ble _0223A454
	ldr sl, [r1, #8]
	ldr sb, [r2, #8]
	sub r8, sl, sb
	sub r8, r8, r6
	str r8, [r0, #8]
	cmp sl, sb
	beq _0223A408
	cmp sl, sb
	movlo r6, r5
	movhs r6, ip
_0223A408:
	sub r8, r3, #3
	cmp r8, #0
	ble _0223A454
	ldr sl, [r1, #0xc]
	ldr sb, [r2, #0xc]
	sub r8, sl, sb
	sub r8, r8, r6
	str r8, [r0, #0xc]
	cmp sl, sb
	beq _0223A43C
	cmp sl, sb
	movlo r6, r5
	movhs r6, r7
_0223A43C:
	sub r3, r3, #4
	cmp r3, #0
	addgt r1, r1, #0x10
	addgt r2, r2, #0x10
	addgt r0, r0, #0x10
	bgt _0223A378
_0223A454:
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	arm_func_end bn_sub_words

	arm_func_start bn_add_words
bn_add_words: ; 0x0223A460
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	cmp r3, #0
	addle sp, sp, #0xc
	movle r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bxle lr
	mov ip, #0
	mov r7, ip
	mov r6, ip
	mov r5, ip
	mov r4, ip
	mov lr, ip
	mov fp, ip
	str ip, [sp]
	str ip, [sp, #4]
	mov r8, #1
_0223A4A4:
	ldr sb, [r1]
	add sl, sb, ip
	ldr sb, [r2]
	cmp sl, ip
	movlo ip, r8
	add sb, sl, sb
	movhs ip, r7
	cmp sb, sl
	movlo sl, r8
	movhs sl, r6
	str sb, [r0]
	sub sb, r3, #1
	add ip, ip, sl
	cmp sb, #0
	ble _0223A5A0
	ldr sb, [r1, #4]
	ldr sl, [r2, #4]
	add sb, sb, ip
	cmp sb, ip
	movlo ip, r8
	add sl, sb, sl
	movhs ip, r5
	cmp sl, sb
	movlo sb, r8
	movhs sb, r4
	add ip, ip, sb
	sub sb, r3, #2
	str sl, [r0, #4]
	cmp sb, #0
	ble _0223A5A0
	ldr sb, [r1, #8]
	ldr sl, [r2, #8]
	add sb, sb, ip
	cmp sb, ip
	movlo ip, r8
	add sl, sb, sl
	movhs ip, lr
	cmp sl, sb
	movlo sb, r8
	movhs sb, fp
	add ip, ip, sb
	sub sb, r3, #3
	str sl, [r0, #8]
	cmp sb, #0
	ble _0223A5A0
	ldr sb, [r1, #0xc]
	ldr sl, [r2, #0xc]
	add sb, sb, ip
	cmp sb, ip
	movlo ip, r8
	add sl, sb, sl
	ldrhs ip, [sp]
	cmp sl, sb
	movlo sb, r8
	ldrhs sb, [sp, #4]
	sub r3, r3, #4
	cmp r3, #0
	str sl, [r0, #0xc]
	add ip, ip, sb
	addgt r1, r1, #0x10
	addgt r2, r2, #0x10
	addgt r0, r0, #0x10
	bgt _0223A4A4
_0223A5A0:
	mov r0, ip
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end bn_add_words

	arm_func_start bn_sqr_words
bn_sqr_words: ; 0x0223A5B0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	cmp r2, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, lr}
	bxle lr
	mov r3, #0x8000
	ldr lr, _0223A700 ; =0x0000FFFF
	rsb ip, r3, #0
_0223A5CC:
	ldr r5, [r1]
	mov r3, #0x8000
	and r4, r5, lr
	and r7, lr, r5, lsr #16
	mul r6, r4, r7
	mul r5, r4, r4
	and r4, r6, lr
	add r8, r5, r4, lsl #17
	rsb r3, r3, #0
	mul r5, r7, r7
	and r3, r6, r3
	add r3, r5, r3, lsr #15
	cmp r8, r4, lsl #17
	addlo r3, r3, #1
	str r8, [r0]
	str r3, [r0, #4]
	subs r3, r2, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r4, [r1, #4]
	and r7, lr, r4, lsr #16
	and r3, r4, lr
	mul r6, r3, r7
	mul r4, r3, r3
	and r3, r6, lr
	add r8, r4, r3, lsl #17
	mul r5, r7, r7
	and r4, r6, ip
	cmp r8, r3, lsl #17
	add r3, r5, r4, lsr #15
	addlo r3, r3, #1
	str r8, [r0, #8]
	str r3, [r0, #0xc]
	subs r3, r2, #2
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r5, [r1, #8]
	mov r3, #0x8000
	and r4, r5, lr
	and r7, lr, r5, lsr #16
	mul r6, r4, r7
	mul r5, r4, r4
	and r4, r6, lr
	add r8, r5, r4, lsl #17
	rsb r3, r3, #0
	mul r5, r7, r7
	and r3, r6, r3
	add r3, r5, r3, lsr #15
	cmp r8, r4, lsl #17
	addlo r3, r3, #1
	str r8, [r0, #0x10]
	str r3, [r0, #0x14]
	subs r3, r2, #3
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	bxeq lr
	ldr r5, [r1, #0xc]
	mov r3, #0x8000
	and r4, r5, lr
	and r7, lr, r5, lsr #16
	mul r6, r4, r7
	mul r5, r4, r4
	and r4, r6, lr
	add r8, r5, r4, lsl #17
	rsb r3, r3, #0
	mul r5, r7, r7
	and r3, r6, r3
	add r3, r5, r3, lsr #15
	cmp r8, r4, lsl #17
	addlo r3, r3, #1
	str r8, [r0, #0x18]
	subs r2, r2, #4
	str r3, [r0, #0x1c]
	addne r1, r1, #0x10
	addne r0, r0, #0x20
	bne _0223A5CC
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.balign 4, 0
_0223A700: .word 0x0000FFFF
	arm_func_end bn_sqr_words

	arm_func_start bn_mul_words
bn_mul_words: ; 0x0223A704
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	cmp r2, #0
	mov r4, #0
	addle sp, sp, #4
	movle r0, r4
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r5, _0223A8A0 ; =0x0000FFFF
	and lr, r3, r5
	and ip, r5, r3, lsr #16
_0223A730:
	ldr r3, [r1]
	and r7, r5, r3, lsr #16
	mul r6, lr, r7
	and r3, r3, r5
	mla sb, ip, r3, r6
	mul r8, r3, lr
	mul r3, r7, ip
	cmp sb, r6
	and r6, sb, r5
	addlo r3, r3, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r3, r3, r7
	add r6, r8, r4
	addlo r3, r3, #1
	cmp r6, r4
	addlo r3, r3, #1
	str r6, [r0]
	mov r4, r3
	subs r6, r2, #1
	beq _0223A890
	ldr r4, [r1, #4]
	and r7, r5, r4, lsr #16
	mul r6, lr, r7
	and r4, r4, r5
	mla sb, ip, r4, r6
	mul r8, r4, lr
	mul r4, r7, ip
	cmp sb, r6
	and r6, sb, r5
	addlo r4, r4, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r4, r4, r7
	add r6, r8, r3
	addlo r4, r4, #1
	cmp r6, r3
	addlo r4, r4, #1
	str r6, [r0, #4]
	subs r3, r2, #2
	beq _0223A890
	ldr r3, [r1, #8]
	and r7, r5, r3, lsr #16
	mul r6, lr, r7
	and r3, r3, r5
	mla sb, ip, r3, r6
	mul r8, r3, lr
	mul r3, r7, ip
	cmp sb, r6
	and r6, sb, r5
	addlo r3, r3, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r3, r3, r7
	add r6, r8, r4
	addlo r3, r3, #1
	cmp r6, r4
	addlo r3, r3, #1
	str r6, [r0, #8]
	mov r4, r3
	subs r6, r2, #3
	beq _0223A890
	ldr r4, [r1, #0xc]
	and r7, r5, r4, lsr #16
	mul r6, lr, r7
	and r4, r4, r5
	mla sb, ip, r4, r6
	mul r8, r4, lr
	mul r4, r7, ip
	cmp sb, r6
	and r6, sb, r5
	addlo r4, r4, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r4, r4, r7
	add r6, r8, r3
	addlo r4, r4, #1
	cmp r6, r3
	addlo r4, r4, #1
	subs r2, r2, #4
	str r6, [r0, #0xc]
	addne r1, r1, #0x10
	addne r0, r0, #0x10
	bne _0223A730
_0223A890:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.balign 4, 0
_0223A8A0: .word 0x0000FFFF
	arm_func_end bn_mul_words

	arm_func_start bn_mul_add_words
bn_mul_add_words: ; 0x0223A8A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #4
	cmp r2, #0
	mov ip, #0
	addle sp, sp, #4
	movle r0, ip
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bxle lr
	ldr r5, _0223AA80 ; =0x0000FFFF
	and r4, r3, r5
	and lr, r5, r3, lsr #16
_0223A8D0:
	ldr r3, [r1]
	and r7, r5, r3, lsr #16
	mul r6, r4, r7
	and r3, r3, r5
	mla sb, lr, r3, r6
	mul r8, r3, r4
	mul r3, r7, lr
	cmp sb, r6
	and r6, sb, r5
	addlo r3, r3, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r3, r3, r7
	ldr r6, [r0]
	addlo r3, r3, #1
	add r7, r8, ip
	cmp r7, ip
	add r7, r7, r6
	addlo r3, r3, #1
	cmp r7, r6
	addlo r3, r3, #1
	mov ip, r3
	str r7, [r0]
	subs r6, r2, #1
	beq _0223AA70
	ldr ip, [r1, #4]
	and r7, r5, ip, lsr #16
	mul r6, r4, r7
	and ip, ip, r5
	mla sb, lr, ip, r6
	mul r8, ip, r4
	mul ip, r7, lr
	cmp sb, r6
	and r6, sb, r5
	addlo ip, ip, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add ip, ip, r7
	add r6, r8, r3
	addlo ip, ip, #1
	cmp r6, r3
	ldr r3, [r0, #4]
	addlo ip, ip, #1
	add r6, r6, r3
	cmp r6, r3
	addlo ip, ip, #1
	str r6, [r0, #4]
	subs r3, r2, #2
	beq _0223AA70
	ldr r3, [r1, #8]
	and r7, r5, r3, lsr #16
	mul r6, r4, r7
	and r3, r3, r5
	mla sb, lr, r3, r6
	mul r8, r3, r4
	mul r3, r7, lr
	cmp sb, r6
	and r6, sb, r5
	addlo r3, r3, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add r3, r3, r7
	ldr r6, [r0, #8]
	addlo r3, r3, #1
	add r7, r8, ip
	cmp r7, ip
	add r7, r7, r6
	addlo r3, r3, #1
	cmp r7, r6
	addlo r3, r3, #1
	mov ip, r3
	str r7, [r0, #8]
	subs r6, r2, #3
	beq _0223AA70
	ldr ip, [r1, #0xc]
	and r7, r5, ip, lsr #16
	mul r6, r4, r7
	and ip, ip, r5
	mla sb, lr, ip, r6
	mul r8, ip, r4
	mul ip, r7, lr
	cmp sb, r6
	and r6, sb, r5
	addlo ip, ip, #0x10000
	and r7, r5, sb, lsr #16
	add r8, r8, r6, lsl #16
	cmp r8, r6, lsl #16
	add ip, ip, r7
	add r6, r8, r3
	addlo ip, ip, #1
	cmp r6, r3
	ldr r3, [r0, #0xc]
	addlo ip, ip, #1
	add r6, r6, r3
	cmp r6, r3
	addlo ip, ip, #1
	subs r2, r2, #4
	str r6, [r0, #0xc]
	addne r1, r1, #0x10
	addne r0, r0, #0x10
	bne _0223A8D0
_0223AA70:
	mov r0, ip
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.balign 4, 0
_0223AA80: .word 0x0000FFFF
	arm_func_end bn_mul_add_words

	arm_func_start BN_is_bit_set
BN_is_bit_set: ; 0x0223AA84
	stmdb sp!, {lr}
	sub sp, sp, #4
	cmp r1, #0
	addlt sp, sp, #4
	movlt r0, #0
	ldmltia sp!, {lr}
	bxlt lr
	mov r2, r1, asr #4
	add r2, r1, r2, lsr #27
	mov r3, r1, lsr #0x1f
	ldr ip, [r0, #4]
	mov lr, r2, asr #5
	cmp ip, lr
	rsb r1, r3, r1, lsl #27
	addle sp, sp, #4
	add r2, r3, r1, ror #27
	movle r0, #0
	ldmleia sp!, {lr}
	bxle lr
	ldr r1, [r0]
	mov r0, #1
	mov r2, r0, lsl r2
	ldr r1, [r1, lr, lsl #2]
	ands r1, r2, r1
	moveq r0, #0
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	arm_func_end BN_is_bit_set

	arm_func_start BN_set_bit
BN_set_bit: ; 0x0223AAF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r2, r1, asr #4
	add r2, r1, r2, lsr #27
	mov r3, r1, lsr #0x1f
	rsb r1, r3, r1, lsl #27
	ldr r4, [r6, #4]
	mov r5, r2, asr #5
	cmp r4, r5
	add r4, r3, r1, ror #27
	bgt _0223AB74
	ldr r2, [r6, #8]
	add r1, r5, #1
	cmp r1, r2
	ble _0223AB34
	bl bn_expand2
_0223AB34:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	ldr r3, [r6, #4]
	add r2, r5, #1
	cmp r3, r2
	bge _0223AB6C
	mov r1, #0
_0223AB58:
	ldr r0, [r6]
	str r1, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, r2
	blt _0223AB58
_0223AB6C:
	add r0, r5, #1
	str r0, [r6, #4]
_0223AB74:
	ldr r2, [r6]
	mov r0, #1
	ldr r1, [r2, r5, lsl #2]
	orr r1, r1, r0, lsl r4
	str r1, [r2, r5, lsl #2]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end BN_set_bit

	arm_func_start BN_ucmp
BN_ucmp: ; 0x0223AB90
	ldr r3, [r0, #4]
	ldr r2, [r1, #4]
	subs r2, r3, r2
	movne r0, r2
	bxne lr
	subs r2, r3, #1
	ldr ip, [r0]
	ldr r3, [r1]
	bmi _0223ABDC
_0223ABB4:
	ldr r1, [ip, r2, lsl #2]
	ldr r0, [r3, r2, lsl #2]
	cmp r1, r0
	beq _0223ABD4
	cmp r1, r0
	movhi r0, #1
	mvnls r0, #0
	bx lr
_0223ABD4:
	subs r2, r2, #1
	bpl _0223ABB4
_0223ABDC:
	mov r0, #0
	bx lr
	arm_func_end BN_ucmp

	arm_func_start BN_bn2bin
BN_bn2bin: ; 0x0223ABE4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r4, r1
	bl BN_num_bits
	add r1, r0, #7
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r0, r0, asr #3
	cmp r0, #0
	addle sp, sp, #4
	sub ip, r0, #1
	ldmleia sp!, {r4, r5, lr}
	bxle lr
_0223AC1C:
	mov r3, ip, lsr #0x1f
	mov r1, ip, asr #1
	rsb r2, r3, ip, lsl #30
	add r1, ip, r1, lsr #30
	add r2, r3, r2, ror #30
	ldr r3, [r5]
	mov r1, r1, asr #2
	ldr r3, [r3, r1, lsl #2]
	mov r1, r2, lsl #3
	mov r1, r3, lsr r1
	cmp ip, #0
	strb r1, [r4], #1
	sub ip, ip, #1
	bgt _0223AC1C
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end BN_bn2bin

	arm_func_start BN_bin2bn
BN_bin2bn: ; 0x0223AC60
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	movs r5, r2
	mov r7, r0
	mov r6, r1
	bne _0223AC80
	bl BN_new
	mov r5, r0
_0223AC80:
	cmp r5, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	cmp r6, #0
	mov r4, #0
	addeq sp, sp, #4
	moveq r0, r5
	streq r4, [r5, #4]
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	add r0, r6, #2
	mov r2, r0, lsl #3
	add r1, r2, #0x1f
	mov r0, r1, asr #4
	add r0, r1, r0, lsr #27
	ldr r1, [r5, #8]
	mov r0, r0, asr #5
	cmp r0, r1
	movle r0, r5
	ble _0223ACF0
	mov r0, r2, asr #4
	add r0, r2, r0, lsr #27
	mov r1, r0, asr #5
	mov r0, r5
	add r1, r1, #1
	bl bn_expand2
_0223ACF0:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	sub r0, r6, #1
	mov r1, r0, lsr #2
	add ip, r1, #1
	cmp r6, #0
	str ip, [r5, #4]
	and r3, r0, #3
	sub r6, r6, #1
	beq _0223AD5C
	mov r1, #0
	mov r0, #3
_0223AD2C:
	ldrb r2, [r7], #1
	cmp r3, #0
	sub r3, r3, #1
	orr r4, r2, r4, lsl #8
	ldreq r2, [r5]
	subeq ip, ip, #1
	streq r4, [r2, ip, lsl #2]
	moveq r4, r1
	moveq r3, r0
	cmp r6, #0
	sub r6, r6, #1
	bne _0223AD2C
_0223AD5C:
	mov r0, r5
	bl bn_fix_top
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end BN_bin2bn

	arm_func_start BN_set_word
BN_set_word: ; 0x0223AD74
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r2, [r4, #8]
	mov r5, r1
	cmp r2, #1
	bge _0223AD98
	mov r1, #2
	bl bn_expand2
_0223AD98:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
	mov r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #4]
	ldr r0, [r4]
	str r5, [r0]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	strne r0, [r4, #4]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end BN_set_word

	arm_func_start BN_clear
BN_clear: ; 0x0223ADE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0223AE08
	ldr r2, [r4, #8]
	mov r1, #0
	mov r2, r2, lsl #2
	bl MI_CpuFill8
_0223AE08:
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0xc]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_clear

	arm_func_start BN_copy
BN_copy: ; 0x0223AE1C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r4, r1
	cmp r5, r4
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
	ldr r1, [r4, #4]
	ldr r2, [r5, #8]
	cmp r1, r2
	ble _0223AE50
	bl bn_expand2
_0223AE50:
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
	ldr r2, [r4, #4]
	ldr r0, [r4]
	ldr r1, [r5]
	mov r2, r2, lsl #2
	bl MI_CpuCopy8
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0223AE9C
	ldr r1, [r5]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1]
_0223AE9C:
	ldr r1, [r4, #0xc]
	mov r0, r5
	str r1, [r5, #0xc]
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end BN_copy

	arm_func_start bn_expand2
bn_expand2: ; 0x0223AEB4
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5, #8]
	mov r4, r1
	cmp r4, r0
	ble _0223AF28
	ldr r0, [r5, #0x10]
	ands r0, r0, #2
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, lr}
	bxne lr
	add r0, r4, #1
	mov r0, r0, lsl #2
	bl CRYPTOi_MyAlloc
	movs r6, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	ldr r0, [r5]
	cmp r0, #0
	beq _0223AF20
	ldr r2, [r5, #4]
	mov r1, r6
	mov r2, r2, lsl #2
	bl MI_CpuCopy8
	ldr r0, [r5]
	bl CRYPTOi_MyFree
_0223AF20:
	str r6, [r5]
	str r4, [r5, #8]
_0223AF28:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end bn_expand2

	arm_func_start BN_CTX_free
BN_CTX_free: ; 0x0223AF34
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	add r4, r6, #4
	mov r5, #0
_0223AF44:
	mov r0, r4
	bl BN_clear_free
	add r5, r5, #1
	cmp r5, #0xc
	add r4, r4, #0x14
	blt _0223AF44
	ldr r0, [r6, #0x108]
	ands r0, r0, #1
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	mov r0, r6
	bl CRYPTOi_MyFree
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end BN_CTX_free

	arm_func_start BN_CTX_init
BN_CTX_init: ; 0x0223AF7C
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x110
	mov r4, r0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0x108]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_CTX_init

	arm_func_start BN_CTX_new
BN_CTX_new: ; 0x0223AFA4
	stmdb sp!, {r4, lr}
	mov r0, #0x110
	bl CRYPTOi_MyAlloc
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	bxeq lr
	bl BN_CTX_init
	mov r1, #1
	mov r0, r4
	str r1, [r4, #0x108]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_CTX_new

	arm_func_start BN_new
BN_new: ; 0x0223AFD8
	stmdb sp!, {lr}
	sub sp, sp, #4
	mov r0, #0x14
	bl CRYPTOi_MyAlloc
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {lr}
	bxeq lr
	mov r1, #1
	str r1, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	str r1, [r0]
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	arm_func_end BN_new

	arm_func_start BN_init
BN_init: ; 0x0223B024
	ldr ip, _0223B034 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x14
	bx ip
	.balign 4, 0
_0223B034: .word MI_CpuFill8
	arm_func_end BN_init

	arm_func_start bn_fix_top
bn_fix_top: ; 0x0223B038
	ldr r3, [r0, #4]
	cmp r3, #0
	bxle lr
	ldr r2, [r0]
	sub r1, r3, #1
	cmp r3, #0
	add r3, r2, r1, lsl #2
	bxle lr
	add r2, r0, #4
_0223B05C:
	ldr r1, [r3], #-4
	cmp r1, #0
	bxne lr
	ldr r1, [r2]
	sub r1, r1, #1
	str r1, [r2]
	ldr r1, [r0, #4]
	cmp r1, #0
	bgt _0223B05C
	bx lr
	arm_func_end bn_fix_top

	arm_func_start bn_zexpand
bn_zexpand: ; 0x0223B084
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r2, [r5, #4]
	mov r4, r1
	cmp r2, r4
	addge sp, sp, #4
	ldmgeia sp!, {r4, r5, lr}
	bxge lr
	ldr r2, [r5, #8]
	cmp r4, r2
	ble _0223B0B8
	bl bn_expand2
_0223B0B8:
	ldr r0, [r5]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r4, r5, lr}
	bxeq lr
	ldr r2, [r5, #4]
	cmp r2, r4
	addge sp, sp, #4
	ldmgeia sp!, {r4, r5, lr}
	bxge lr
	mov r1, #0
_0223B0E4:
	ldr r0, [r5]
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, r4
	blt _0223B0E4
	add sp, sp, #4
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end bn_zexpand

	arm_func_start BN_free
BN_free: ; 0x0223B104
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, lr}
	bxeq lr
	ldr r0, [r4]
	cmp r0, #0
	beq _0223B130
	ldr r1, [r4, #0x10]
	ands r1, r1, #2
	bne _0223B130
	bl CRYPTOi_MyFree
_0223B130:
	ldr r0, [r4, #0x10]
	orr r0, r0, #0x8000
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x10]
	ands r0, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	mov r0, r4
	bl CRYPTOi_MyFree
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_free

	arm_func_start BN_clear_free
BN_clear_free: ; 0x0223B15C
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, lr}
	bxeq lr
	bl BN_clear
	mov r0, r4
	bl BN_free
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_clear_free

	arm_func_start BN_num_bits
BN_num_bits: ; 0x0223B180
	stmdb sp!, {r4, lr}
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	bxeq lr
	ldr r0, [r0]
	sub r4, r1, #1
	ldr r0, [r0, r4, lsl #2]
	bl BN_num_bits_word
	add r0, r0, r4, lsl #5
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end BN_num_bits

	arm_func_start BN_num_bits_word
BN_num_bits_word: ; 0x0223B1B4
	mov r1, #0x10000
	rsb r1, r1, #0
	ands r1, r0, r1
	beq _0223B1D4
	ands r1, r0, #0xff000000
	movne r2, #0x18
	moveq r2, #0x10
	b _0223B1E0
_0223B1D4:
	ands r1, r0, #0xff00
	movne r2, #8
	moveq r2, #0
_0223B1E0:
	mov r1, r0, lsr r2
	ands r0, r1, #0xf0
	ldreq r0, _0223B210 ; =bits$7808
	ldreqsb r0, [r0, r1]
	addeq r0, r0, r2
	bxeq lr
	ldr r0, _0223B210 ; =bits$7808
	mov r1, r1, lsr #4
	ldrsb r0, [r0, r1]
	add r0, r0, r2
	add r0, r0, #4
	bx lr
	.balign 4, 0
_0223B210: .word bits$7808
	arm_func_end BN_num_bits_word

	; util.o

	.text

	arm_func_start CRYPTO_SetAllocator
CRYPTO_SetAllocator: ; 0x0223B214
	ldr r3, _0223B228 ; =CRYPTOi_MyAllocFunc
	ldr r2, _0223B22C ; =CRYPTOi_MyFreeFunc
	str r0, [r3]
	str r1, [r2]
	bx lr
	.balign 4, 0
_0223B228: .word CRYPTOi_MyAllocFunc
_0223B22C: .word CRYPTOi_MyFreeFunc
	arm_func_end CRYPTO_SetAllocator

	arm_func_start CRYPTOi_MyFree
CRYPTOi_MyFree: ; 0x0223B230
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r1, _0223B274 ; =CRYPTOi_MyFreeFunc
	mov r2, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _0223B25C
	blx r1
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
_0223B25C:
	mov r0, #0
	mvn r1, #0
	bl OS_FreeToHeap
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.balign 4, 0
_0223B274: .word CRYPTOi_MyFreeFunc
	arm_func_end CRYPTOi_MyFree

	arm_func_start CRYPTOi_MyAlloc
CRYPTOi_MyAlloc: ; 0x0223B278
	stmdb sp!, {lr}
	sub sp, sp, #4
	ldr r1, _0223B2BC ; =CRYPTOi_MyAllocFunc
	mov r2, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _0223B2A4
	blx r1
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
_0223B2A4:
	mov r0, #0
	mvn r1, #0
	bl OS_AllocFromHeap
	add sp, sp, #4
	ldmia sp!, {lr}
	bx lr
	.balign 4, 0
_0223B2BC: .word CRYPTOi_MyAllocFunc
	arm_func_end CRYPTOi_MyAlloc

	.bss

CRYPTOi_MyAllocFunc:
	.space 0x4

CRYPTOi_MyFreeFunc:
	.space 0x4
