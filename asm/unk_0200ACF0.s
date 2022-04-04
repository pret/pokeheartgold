	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.public Add2DGfxResObjFromHeader
	.public sub_0200A8A0
	.public sub_0200A8B0
	.public sub_0200A8DC
	.public sub_0200AA9C

	thumb_func_start sub_0200ACF0
sub_0200ACF0: ; 0x0200ACF0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bne _0200ACFC
	bl GF_AssertFail
_0200ACFC:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #0
	beq _0200AD0A
	bl GF_AssertFail
_0200AD0A:
	add r0, r4, #0
	bl sub_0200A810
	str r0, [sp]
	add r0, r4, #0
	bl sub_0200A8B0
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0200A7FC
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl sub_02021758
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0200ACF0

	thumb_func_start sub_0200AD30
sub_0200AD30: ; 0x0200AD30
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bne _0200AD3A
	bl GF_AssertFail
_0200AD3A:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0200AD62
	add r4, r6, #0
_0200AD44:
	ldr r0, [r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0200AD58
	bl sub_0200ACF0
	cmp r0, #0
	bne _0200AD58
	bl GF_AssertFail
_0200AD58:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0200AD44
_0200AD62:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0200AD30

	thumb_func_start sub_0200AD64
sub_0200AD64: ; 0x0200AD64
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bne _0200AD70
	bl GF_AssertFail
_0200AD70:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #0
	beq _0200AD7E
	bl GF_AssertFail
_0200AD7E:
	add r0, r4, #0
	bl sub_0200A810
	str r0, [sp]
	add r0, r4, #0
	bl sub_0200A8B0
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0200A7FC
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl sub_020217B0
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0200AD64

	thumb_func_start sub_0200ADA4
sub_0200ADA4: ; 0x0200ADA4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bne _0200ADB0
	bl GF_AssertFail
_0200ADB0:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #0
	beq _0200ADBE
	bl GF_AssertFail
_0200ADBE:
	add r0, r4, #0
	bl sub_0200A810
	str r0, [sp]
	add r0, r4, #0
	bl sub_0200A8B0
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0200A7FC
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl sub_02021758
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0200ADA4

	thumb_func_start sub_0200ADE4
sub_0200ADE4: ; 0x0200ADE4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bne _0200ADEE
	bl GF_AssertFail
_0200ADEE:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0200AE16
	add r4, r6, #0
_0200ADF8:
	ldr r0, [r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0200AE0C
	bl sub_0200ADA4
	cmp r0, #0
	bne _0200AE0C
	bl GF_AssertFail
_0200AE0C:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0200ADF8
_0200AE16:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0200ADE4

	thumb_func_start sub_0200AE18
sub_0200AE18: ; 0x0200AE18
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bne _0200AE24
	bl GF_AssertFail
_0200AE24:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #0
	beq _0200AE32
	bl GF_AssertFail
_0200AE32:
	add r0, r4, #0
	bl sub_0200A810
	str r0, [sp]
	add r0, r4, #0
	bl sub_0200A8B0
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0200A7FC
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl sub_020217B0
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0200AE18

	thumb_func_start sub_0200AE58
sub_0200AE58: ; 0x0200AE58
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bne _0200AE62
	bl GF_AssertFail
_0200AE62:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0200AE8A
	add r4, r6, #0
_0200AE6C:
	ldr r0, [r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0200AE80
	bl sub_0200AE18
	cmp r0, #0
	bne _0200AE80
	bl GF_AssertFail
_0200AE80:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0200AE6C
_0200AE8A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0200AE58

	thumb_func_start sub_0200AE8C
sub_0200AE8C: ; 0x0200AE8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bne _0200AE96
	bl GF_AssertFail
_0200AE96:
	add r0, r5, #0
	bl sub_0200A7FC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0200A810
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202183C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200AE8C

	thumb_func_start sub_0200AEB0
sub_0200AEB0: ; 0x0200AEB0
	push {r4, lr}
	add r4, r0, #0
	bne _0200AEBA
	bl GF_AssertFail
_0200AEBA:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #0
	beq _0200AEC8
	bl GF_AssertFail
_0200AEC8:
	add r0, r4, #0
	bl sub_0200A7FC
	bl sub_02021884
	pop {r4, pc}
	thumb_func_end sub_0200AEB0

	thumb_func_start sub_0200AED4
sub_0200AED4: ; 0x0200AED4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bne _0200AEDE
	bl GF_AssertFail
_0200AEDE:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0200AEFE
	add r4, r6, #0
_0200AEE8:
	ldr r0, [r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0200AEF4
	bl sub_0200AEB0
_0200AEF4:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0200AEE8
_0200AEFE:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0200AED4

	thumb_func_start sub_0200AF00
sub_0200AF00: ; 0x0200AF00
	push {r4, lr}
	add r4, r0, #0
	bne _0200AF0A
	bl GF_AssertFail
_0200AF0A:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #0
	beq _0200AF18
	bl GF_AssertFail
_0200AF18:
	add r0, r4, #0
	bl sub_0200A7FC
	bl sub_02021910
	pop {r4, pc}
	thumb_func_end sub_0200AF00

	thumb_func_start sub_0200AF24
sub_0200AF24: ; 0x0200AF24
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _0200AF32
	bl GF_AssertFail
_0200AF32:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #0
	beq _0200AF40
	bl GF_AssertFail
_0200AF40:
	cmp r5, #0
	bne _0200AF48
	bl GF_AssertFail
_0200AF48:
	add r0, r5, #0
	bl sub_0200A8A0
	cmp r0, #2
	beq _0200AF56
	bl GF_AssertFail
_0200AF56:
	add r0, r4, #0
	bl sub_0200A7FC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0200A840
	add r1, r0, #0
	ldr r1, [r1, #0xc]
	add r0, r4, #0
	ldr r1, [r1]
	bl sub_02021934
	cmp r0, #0
	bne _0200AF7E
	add r0, r4, #0
	bl sub_02021910
	bl sub_020219B8
_0200AF7E:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200AF24

	thumb_func_start sub_0200AF80
sub_0200AF80: ; 0x0200AF80
	push {r4, lr}
	add r4, r0, #0
	bne _0200AF8A
	bl GF_AssertFail
_0200AF8A:
	add r0, r4, #0
	bl sub_02021A50
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0200AF80

	thumb_func_start sub_0200AF94
sub_0200AF94: ; 0x0200AF94
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bne _0200AFA0
	bl GF_AssertFail
_0200AFA0:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #1
	beq _0200AFAE
	bl GF_AssertFail
_0200AFAE:
	add r0, r4, #0
	bl sub_0200A828
	str r0, [sp]
	add r0, r4, #0
	bl sub_0200A8B0
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0200A7FC
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl sub_0200A8DC
	str r0, [sp, #8]
	add r0, sp, #0
	bl sub_02022660
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0200AF94

	thumb_func_start sub_0200AFD8
sub_0200AFD8: ; 0x0200AFD8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bne _0200AFE2
	bl GF_AssertFail
_0200AFE2:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0200B00A
	add r4, r6, #0
_0200AFEC:
	ldr r0, [r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0200B000
	bl sub_0200AF94
	cmp r0, #0
	bne _0200B000
	bl GF_AssertFail
_0200B000:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0200AFEC
_0200B00A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0200AFD8

	thumb_func_start sub_0200B00C
sub_0200B00C: ; 0x0200B00C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bne _0200B018
	bl GF_AssertFail
_0200B018:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #1
	beq _0200B026
	bl GF_AssertFail
_0200B026:
	add r0, r4, #0
	bl sub_0200A828
	str r0, [sp]
	add r0, r4, #0
	bl sub_0200A8B0
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0200A7FC
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl sub_0200A8DC
	str r0, [sp, #8]
	add r0, sp, #0
	bl sub_020226A4
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_0200B00C

	thumb_func_start sub_0200B050
sub_0200B050: ; 0x0200B050
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bne _0200B05A
	bl GF_AssertFail
_0200B05A:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0200B082
	add r4, r6, #0
_0200B064:
	ldr r0, [r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0200B078
	bl sub_0200B00C
	cmp r0, #0
	bne _0200B078
	bl GF_AssertFail
_0200B078:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0200B064
_0200B082:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0200B050

	thumb_func_start sub_0200B084
sub_0200B084: ; 0x0200B084
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bne _0200B08E
	bl GF_AssertFail
_0200B08E:
	add r0, r5, #0
	bl sub_0200A7FC
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0200A828
	add r1, r0, #0
	add r0, r4, #0
	bl sub_020226E4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200B084

	thumb_func_start sub_0200B0A8
sub_0200B0A8: ; 0x0200B0A8
	push {r4, lr}
	add r4, r0, #0
	bne _0200B0B2
	bl GF_AssertFail
_0200B0B2:
	add r0, r4, #0
	bl sub_0200A8A0
	cmp r0, #1
	beq _0200B0C0
	bl GF_AssertFail
_0200B0C0:
	add r0, r4, #0
	bl sub_0200A7FC
	bl sub_02022744
	pop {r4, pc}
	thumb_func_end sub_0200B0A8

	thumb_func_start sub_0200B0CC
sub_0200B0CC: ; 0x0200B0CC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bne _0200B0D6
	bl GF_AssertFail
_0200B0D6:
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _0200B0F6
	add r4, r6, #0
_0200B0E0:
	ldr r0, [r5]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0200B0EC
	bl sub_0200B0A8
_0200B0EC:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0200B0E0
_0200B0F6:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0200B0CC

	thumb_func_start sub_0200B0F8
sub_0200B0F8: ; 0x0200B0F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0200B106
	bl GF_AssertFail
_0200B106:
	add r0, r5, #0
	bl sub_0200A8A0
	cmp r0, #1
	beq _0200B114
	bl GF_AssertFail
_0200B114:
	add r0, r5, #0
	bl sub_0200A7FC
	cmp r4, #0
	beq _0200B126
	add r1, r4, #0
	bl sub_020227D4
	pop {r3, r4, r5, pc}
_0200B126:
	bl sub_020227AC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200B0F8

	thumb_func_start sub_0200B12C
sub_0200B12C: ; 0x0200B12C
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0
	bl sub_0200B0F8
	add r1, r4, #0
	bl NNS_G2dGetImagePaletteLocation
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0200B14C
	asr r1, r0, #4
	lsr r1, r1, #0x1b
	add r1, r0, r1
	asr r0, r1, #5
_0200B14C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0200B12C
