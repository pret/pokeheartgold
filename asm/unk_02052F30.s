	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC5CC:
	.byte 0x01, 0x00, 0x10, 0x00
	.byte 0x00, 0x40, 0x0C, 0x00, 0x21, 0x00, 0x10, 0x00, 0x00, 0x40, 0x0C, 0x00, 0x03, 0x00, 0x10, 0x00
	.byte 0x00, 0x40, 0x0C, 0x00, 0x11, 0x01, 0x11, 0x01, 0x00, 0x40, 0x0C, 0x00, 0x11, 0x01, 0x11, 0x01
	.byte 0x00, 0x00, 0x0A, 0x00, 0x06, 0x00, 0x10, 0x00, 0x00, 0x40, 0x0C, 0x00

	.text

	thumb_func_start sub_02052F30
sub_02052F30: ; 0x02052F30
	ldr r1, [r0, #0x20]
	ldr r3, _02052F8C ; =0x0000010F
	ldr r1, [r1]
	mov r2, #0
	cmp r1, r3
	bgt _02052F5C
	sub r3, r3, #6
	sub r3, r1, r3
	bmi _02052F6A
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_02052F4E: ; jump table
	.short _02052F68 - _02052F4E - 2 ; case 0
	.short _02052F68 - _02052F4E - 2 ; case 1
	.short _02052F68 - _02052F4E - 2 ; case 2
	.short _02052F68 - _02052F4E - 2 ; case 3
	.short _02052F68 - _02052F4E - 2 ; case 4
	.short _02052F68 - _02052F4E - 2 ; case 5
	.short _02052F68 - _02052F4E - 2 ; case 6
_02052F5C:
	ldr r3, _02052F90 ; =0x00000165
	cmp r1, r3
	bne _02052F6A
	mov r1, #1
	str r1, [r0, #0x70]
	bx lr
_02052F68:
	mov r2, #1
_02052F6A:
	ldr r1, [r0, #0x70]
	cmp r1, #1
	bne _02052F74
	mov r1, #0
	str r1, [r0, #0x70]
_02052F74:
	cmp r2, #0
	bne _02052F82
	ldr r1, [r0, #0x70]
	cmp r1, #4
	bne _02052F82
	mov r1, #0
	str r1, [r0, #0x70]
_02052F82:
	cmp r2, #0
	beq _02052F8A
	mov r1, #4
	str r1, [r0, #0x70]
_02052F8A:
	bx lr
	.balign 4, 0
_02052F8C: .word 0x0000010F
_02052F90: .word 0x00000165
	thumb_func_end sub_02052F30

	thumb_func_start sub_02052F94
sub_02052F94: ; 0x02052F94
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl sub_0203B9C4
	add r6, r0, #0
	bl sub_0203B960
	add r2, r0, #0
	cmp r4, #0
	beq _02052FC8
	ldr r3, [r5, #0x20]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r2, [r5, #0x20]
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
_02052FC8:
	ldr r1, [r5, #0x20]
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_0203B648
	ldr r0, [r5, #0x20]
	ldr r1, [r0, #4]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _02053016
	add r0, r5, #0
	bl sub_0203B6E8
	ldrh r2, [r0]
	ldr r1, [r5, #0x20]
	str r2, [r1, #8]
	ldrh r2, [r0, #2]
	ldr r1, [r5, #0x20]
	str r2, [r1, #0xc]
	ldrh r1, [r0, #6]
	mov r0, #1
	lsl r0, r0, #8
	cmp r1, r0
	bne _02053016
	add r0, r6, #0
	bl sub_0203B968
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0203B95C
	add r2, r0, #0
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
_02053016:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02052F94

	thumb_func_start sub_02053018
sub_02053018: ; 0x02053018
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x70]
	cmp r0, #6
	blt _02053026
	bl GF_AssertFail
_02053026:
	ldr r0, [r4, #0x74]
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x1c
	ldr r0, _02053034 ; =gMain + 0x60
	strb r1, [r0, #9]
	pop {r4, pc}
	.balign 4, 0
_02053034: .word gMain + 0x60
	thumb_func_end sub_02053018

	thumb_func_start sub_02053038
sub_02053038: ; 0x02053038
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	add r6, r1, #0
	ldr r7, [r0]
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_02054F4C
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	bne _02053062
	add r0, r4, #0
	bl ClearTempFieldEventData
_02053062:
	cmp r6, #0
	bne _0205306E
	add r0, r4, #0
	bl sub_02067AE4
	b _02053074
_0205306E:
	add r0, r4, #0
	bl sub_02067A88
_02053074:
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	bne _02053088
	cmp r6, #0
	bne _02053088
	add r0, r4, #0
	bl sub_02055418
_02053088:
	cmp r6, #0
	bne _020530A6
	ldr r0, [r4, #0xc]
	bl sub_0202A998
	bl sub_0202AE8C
	ldr r0, [r4, #0xc]
	add r1, r7, #0
	bl sub_0203B114
	add r1, r0, #0
	ldr r0, [r4, #0x30]
	bl sub_0203B16C
_020530A6:
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0203BBB4
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [sp]
	mov r1, #1
	bl sub_02066C74
	cmp r0, #0
	beq _020530CC
	cmp r7, #0x58
	bne _020530CC
	mov r5, #0
_020530CC:
	cmp r5, #9
	bne _020530DC
	ldr r0, [sp]
	bl sub_02066920
	cmp r0, #1
	bne _020530DC
	mov r5, #0
_020530DC:
	cmp r5, #0xb
	bne _020530EC
	ldr r0, [sp]
	bl sub_020668F0
	cmp r0, #1
	bne _020530EC
	mov r5, #0xc
_020530EC:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl sub_0203B98C
	cmp r6, #0
	beq _02053110
	ldr r0, [sp, #4]
	bl sub_0203B9A4
	add r5, r0, #0
	add r0, r7, #0
	bl MapHeader_GetCameraType
	cmp r5, r0
	beq _0205311E
	bl GF_AssertFail
	b _0205311E
_02053110:
	add r0, r7, #0
	bl MapHeader_GetCameraType
	add r1, r0, #0
	ldr r0, [sp, #4]
	bl sub_0203B9AC
_0205311E:
	cmp r6, #0
	bne _02053134
	add r0, r7, #0
	bl sub_0203BB20
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	beq _02053134
	ldr r0, [sp, #4]
	bl sub_0203B99C
_02053134:
	add r0, r4, #0
	mov r1, #2
	bl sub_02040750
	add r0, r4, #0
	mov r1, #0
	add r0, #0x7e
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x7c
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x78
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	bl sub_0202ED34
	mov r1, #0
	bl sub_0202ED58
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl sub_02066A2C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02053038

	thumb_func_start sub_0205316C
sub_0205316C: ; 0x0205316C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	cmp r1, #0
	beq _020531B2
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	bl sub_0203B9B4
	ldr r3, [r4, #0x20]
	ldr r1, [r0, #4]
	str r1, [sp]
	str r5, [sp, #4]
	mov r1, #2
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x3c]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x10]
	bl sub_0205C390
	add sp, #0x10
	str r0, [r4, #0x40]
	pop {r3, r4, r5, pc}
_020531B2:
	mov r1, #0x40
	mov r2, #5
	bl sub_0205E0BC
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	bl sub_0203B9B4
	ldr r3, [r4, #0x20]
	ldr r1, [r0, #4]
	str r1, [sp]
	str r5, [sp, #4]
	mov r1, #2
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x3c]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x10]
	bl sub_0205C390
	str r0, [r4, #0x40]
	ldr r3, [r4, #0x20]
	ldr r0, [r3]
	str r0, [sp]
	ldr r0, [r4, #0x3c]
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #0x10]
	bl sub_020699F8
	add r0, r4, #0
	bl sub_0203B6B0
	ldr r0, [r4, #0x3c]
	bl sub_0205F55C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205316C

	thumb_func_start sub_02053210
sub_02053210: ; 0x02053210
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq _02053224
	ldr r0, [r4, #0x40]
	bl sub_0205C4CC
	pop {r4, pc}
_02053224:
	bl sub_02056E38
	ldr r0, [r4, #0x40]
	bl sub_0205C4C4
	ldr r0, [r4, #0x3c]
	bl sub_0205E494
	ldr r0, [r4, #0x3c]
	bl sub_0205E0E8
	pop {r4, pc}
	thumb_func_end sub_02053210

	thumb_func_start sub_0205323C
sub_0205323C: ; 0x0205323C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r1, #0x40
	mov r2, #5
	bl sub_0205E0BC
	str r0, [r4, #0x3c]
	add r0, r4, #0
	bl sub_0203B9F4
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	bl sub_0203B9B4
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	add r2, r0, #0
	ldr r0, [r4, #0x3c]
	add r1, r5, #0
	bl sub_0205C408
	str r0, [r4, #0x40]
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #0x3c]
	ldr r1, [r1]
	bl sub_02069B74
	ldr r0, [r4, #0x3c]
	bl sub_0205F55C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205323C

	thumb_func_start sub_02053284
sub_02053284: ; 0x02053284
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_02052F30
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _02053296
	bl GF_AssertFail
_02053296:
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x30]
	ldr r0, [r0]
	bl MapMatrix_Load
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	mov r1, #0
	add r5, r0, #0
	bl sub_02066C74
	cmp r0, #0
	beq _020532B8
	ldr r0, [r4, #0x30]
	bl sub_0203B0F4
_020532B8:
	add r0, r5, #0
	mov r1, #1
	bl sub_02066C74
	add r1, r0, #0
	ldr r0, [r4, #0x30]
	bl sub_0203B16C
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0xc]
	bl sub_0203B1FC
	ldr r0, [r4, #0x70]
	cmp r0, #6
	blt _020532DA
	bl GF_AssertFail
_020532DA:
	ldr r0, [r4, #0x70]
	ldr r1, _02053320 ; =0x020FC5CC
	lsl r0, r0, #3
	add r0, r1, r0
	str r0, [r4, #0x74]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x74]
	ldr r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	str r0, [r4, #0x18]
	ldr r1, [r4, #0x74]
	add r0, r4, #0
	ldr r1, [r1]
	add r0, #0x60
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1c
	bl sub_0205489C
	ldr r0, [r4, #0x74]
	ldr r1, [r0]
	lsl r0, r1, #0xc
	lsr r0, r0, #0x1c
	beq _0205331C
	lsr r1, r1, #0x18
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_02054514
_0205331C:
	pop {r3, r4, r5, pc}
	nop
_02053320: .word 0x020FC5CC
	thumb_func_end sub_02053284

	thumb_func_start sub_02053324
sub_02053324: ; 0x02053324
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x60]
	cmp r0, #0
	bne _02053332
	bl GF_AssertFail
_02053332:
	mov r0, #0
	str r0, [r4, #0x60]
	mov r0, #7
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x74]
	ldr r0, [r0]
	lsl r0, r0, #0xc
	lsr r0, r0, #0x1c
	beq _0205334A
	add r0, r4, #0
	bl sub_0205453C
_0205334A:
	mov r0, #0
	str r0, [r4, #0x74]
	pop {r4, pc}
	thumb_func_end sub_02053324

	thumb_func_start sub_02053350
sub_02053350: ; 0x02053350
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C688
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C67C
	ldr r1, [r4, #0x20]
	ldr r1, [r1]
	str r1, [r5]
	mov r1, #0
	mvn r1, r1
	str r1, [r5, #4]
	str r0, [r5, #8]
	str r6, [r5, #0xc]
	mov r0, #1
	str r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02053350

	thumb_func_start sub_0205337C
sub_0205337C: ; 0x0205337C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_MapIsPokemonCenter
	cmp r0, #0
	beq _0205339E
	ldr r1, [r4, #0x20]
	ldr r0, [r1, #8]
	cmp r0, #6
	bne _0205339E
	ldr r0, [r1, #0xc]
	cmp r0, #6
	bne _0205339E
	mov r0, #1
	pop {r4, pc}
_0205339E:
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_MapIsPokemonLeagueLobby
	cmp r0, #0
	beq _020533BC
	ldr r1, [r4, #0x20]
	ldr r0, [r1, #8]
	cmp r0, #3
	bne _020533BC
	ldr r0, [r1, #0xc]
	cmp r0, #0xf
	bne _020533BC
	mov r0, #1
	pop {r4, pc}
_020533BC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0205337C

	thumb_func_start sub_020533C0
sub_020533C0: ; 0x020533C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B968
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_MapIsPokemonLeagueLobby
	cmp r0, #1
	ldr r0, [r5, #0x20]
	bne _020533FC
	ldr r0, [r0]
	str r0, [r4]
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	mov r0, #4
	str r0, [r4, #8]
	mov r0, #0xb
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_020533FC:
	ldr r0, [r0]
	str r0, [r4]
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	mov r0, #7
	str r0, [r4, #8]
	mov r0, #2
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020533C0

	thumb_func_start sub_02053414
sub_02053414: ; 0x02053414
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02053436
	cmp r0, #1
	beq _0205345A
	cmp r0, #2
	beq _02053468
	b _0205346C
_02053436:
	ldr r1, [r5, #0x20]
	add r0, r5, #0
	bl sub_02052F94
	add r0, r5, #0
	bl sub_02053284
	add r0, r5, #0
	mov r1, #0
	bl sub_02053038
	add r0, r5, #0
	bl sub_0205316C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205346C
_0205345A:
	add r0, r6, #0
	bl sub_02055408
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205346C
_02053468:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205346C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02053414

	thumb_func_start sub_02053470
sub_02053470: ; 0x02053470
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	str r1, [r4, #0x70]
	bl RunPokemonCenterScriptsInNewContext
	ldr r1, _02053488 ; =sub_02053414
	add r0, r4, #0
	mov r2, #0
	bl sub_020504F0
	pop {r4, pc}
	.balign 4, 0
_02053488: .word sub_02053414
	thumb_func_end sub_02053470

	thumb_func_start sub_0205348C
sub_0205348C: ; 0x0205348C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	add r7, r0, #0
	add r0, r6, #0
	bl sub_02050654
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _020534B6
	cmp r0, #2
	beq _02053528
	cmp r0, #3
	beq _02053534
	b _02053538
_020534B6:
	add r0, r7, #0
	bl sub_02066800
	cmp r0, #0
	beq _02053502
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205337C
	cmp r0, #0
	beq _020534D8
	add r0, r4, #0
	bl sub_020533C0
_020534D8:
	add r0, r7, #0
	bl sub_020667F0
	add r0, r6, #0
	bl sub_0203B968
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02052F94
	add r0, r4, #0
	bl sub_02053284
	add r0, r4, #0
	mov r1, #0
	bl sub_02053038
	add r0, r4, #0
	bl sub_0205316C
	b _0205351C
_02053502:
	add r0, r4, #0
	mov r1, #0
	bl sub_02052F94
	add r0, r4, #0
	bl sub_02053284
	add r0, r4, #0
	bl sub_02055418
	add r0, r4, #0
	bl sub_0205323C
_0205351C:
	add r0, r4, #0
	bl sub_02067BE8
	mov r0, #2
	str r0, [r5]
	b _02053538
_02053528:
	add r0, r6, #0
	bl sub_02055408
	mov r0, #3
	str r0, [r5]
	b _02053538
_02053534:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02053538:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205348C

	thumb_func_start sub_0205353C
sub_0205353C: ; 0x0205353C
	ldr r3, _02053548 ; =sub_020504F0
	mov r2, #0
	str r2, [r0, #0x70]
	ldr r1, _0205354C ; =sub_0205348C
	bx r3
	nop
_02053548: .word sub_020504F0
_0205354C: .word sub_0205348C
	thumb_func_end sub_0205353C

	thumb_func_start sub_02053550
sub_02053550: ; 0x02053550
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r0, r7, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #5
	bhi _0205361C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02053582: ; jump table
	.short _0205358E - _02053582 - 2 ; case 0
	.short _020535A6 - _02053582 - 2 ; case 1
	.short _020535CA - _02053582 - 2 ; case 2
	.short _020535F2 - _02053582 - 2 ; case 3
	.short _02053606 - _02053582 - 2 ; case 4
	.short _02053612 - _02053582 - 2 ; case 5
_0205358E:
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205361C
_020535A6:
	add r0, r5, #0
	add r1, r6, #4
	bl sub_02052F94
	add r0, r5, #0
	bl sub_02053284
	add r0, r5, #0
	mov r1, #0
	bl sub_02053038
	add r0, r5, #0
	bl sub_0205316C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205361C
_020535CA:
	add r0, r5, #0
	bl sub_02059DB0
	add r1, r5, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205AC88
	add r5, #0x84
	str r0, [r5]
	add r0, r7, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205361C
_020535F2:
	mov r1, #0
	str r1, [r6]
	add r0, r5, #0
	add r2, r6, #0
	bl ov01_021F35C4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205361C
_02053606:
	ldr r1, [r6]
	cmp r1, #0
	beq _0205361C
	add r0, r0, #1
	str r0, [r4]
	b _0205361C
_02053612:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205361C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02053550

	thumb_func_start sub_02053620
sub_02053620: ; 0x02053620
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_MapIsUnionRoom
	cmp r0, #0
	bne _02053658
	add r0, r4, #0
	bl sub_0205337C
	cmp r0, #0
	beq _02053650
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020533C0
	add r0, r5, #0
	bl sub_020667E0
	b _02053658
_02053650:
	add r0, r4, #0
	bl sub_0205353C
	pop {r3, r4, r5, pc}
_02053658:
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r3, #0
	mov r1, #2
	str r3, [r2]
	str r1, [r2, #4]
	sub r0, r1, #3
	str r0, [r2, #8]
	mov r0, #8
	str r0, [r2, #0xc]
	mov r0, #0xe
	str r0, [r2, #0x10]
	str r3, [r2, #0x14]
	str r1, [r4, #0x70]
	ldr r1, _02053684 ; =sub_02053550
	add r0, r4, #0
	bl sub_020504F0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02053684: .word sub_02053550
	thumb_func_end sub_02053620

	thumb_func_start sub_02053688
sub_02053688: ; 0x02053688
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #3
	bhi _02053708
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020536AC: ; jump table
	.short _020536B4 - _020536AC - 2 ; case 0
	.short _020536D0 - _020536AC - 2 ; case 1
	.short _020536E0 - _020536AC - 2 ; case 2
	.short _02053700 - _020536AC - 2 ; case 3
_020536B4:
	ldr r0, _0205370C ; =0x00000602
	bl PlaySE
	ldr r1, [r4, #4]
	add r0, r6, #0
	bl sub_020550E4
	add r0, r5, #0
	bl sub_020553B0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053708
_020536D0:
	add r0, r5, #0
	add r1, r4, #4
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053708
_020536E0:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02053708
	ldr r1, [r4, #4]
	add r0, r6, #0
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_02055408
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053708
_02053700:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02053708:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0205370C: .word 0x00000602
	thumb_func_end sub_02053688

	thumb_func_start sub_02053710
sub_02053710: ; 0x02053710
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldmia r4!, {r0, r1}
	add r3, r2, #4
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r1, _0205373C ; =sub_02053688
	str r0, [r3]
	add r0, r5, #0
	bl sub_02050530
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0205373C: .word sub_02053688
	thumb_func_end sub_02053710

	thumb_func_start sub_02053740
sub_02053740: ; 0x02053740
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02053762
	cmp r0, #1
	beq _02053776
	cmp r0, #2
	beq _02053794
	b _020537A4
_02053762:
	add r0, r5, #0
	bl sub_02053210
	add r0, r5, #0
	bl sub_02053324
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020537A4
_02053776:
	add r0, r5, #0
	add r1, r4, #4
	bl sub_02052F94
	add r0, r5, #0
	bl sub_02053284
	add r0, r5, #0
	mov r1, #0
	bl sub_02053038
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020537A4
_02053794:
	add r0, r5, #0
	bl sub_0205316C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_020537A4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02053740

	thumb_func_start sub_020537A8
sub_020537A8: ; 0x020537A8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl sub_0205064C
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r7, #0
	bl sub_0203DF7C
	cmp r0, #0
	beq _020537CE
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_020537CE:
	mov r0, #0
	str r0, [r4]
	ldmia r5!, {r0, r1}
	add r2, r4, #4
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	ldr r1, _020537EC ; =sub_02053740
	str r0, [r2]
	add r0, r6, #0
	add r2, r4, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020537EC: .word sub_02053740
	thumb_func_end sub_020537A8

	thumb_func_start sub_020537F0
sub_020537F0: ; 0x020537F0
	push {lr}
	sub sp, #0x14
	str r1, [sp]
	ldr r1, [sp, #0x18]
	str r2, [sp, #4]
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x1c]
	str r3, [sp, #8]
	str r1, [sp, #0x10]
	add r1, sp, #0
	bl sub_020537A8
	add sp, #0x14
	pop {pc}
	thumb_func_end sub_020537F0

	thumb_func_start sub_0205380C
sub_0205380C: ; 0x0205380C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #3
	bhi _02053886
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02053830: ; jump table
	.short _02053838 - _02053830 - 2 ; case 0
	.short _0205384E - _02053830 - 2 ; case 1
	.short _0205385E - _02053830 - 2 ; case 2
	.short _0205387E - _02053830 - 2 ; case 3
_02053838:
	ldr r1, [r4, #4]
	add r0, r6, #0
	bl sub_020550E4
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053886
_0205384E:
	add r0, r5, #0
	add r1, r4, #4
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053886
_0205385E:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02053886
	ldr r1, [r4, #4]
	add r0, r6, #0
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053886
_0205387E:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02053886:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205380C

	thumb_func_start sub_0205388C
sub_0205388C: ; 0x0205388C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x18
	add r4, r2, #0
	add r6, r3, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	str r5, [r2, #4]
	str r4, [r2, #8]
	ldr r0, [sp, #0x18]
	str r6, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [sp, #0x1c]
	ldr r1, _020538BC ; =sub_0205380C
	str r0, [r2, #0x14]
	add r0, r7, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020538BC: .word sub_0205380C
	thumb_func_end sub_0205388C

	thumb_func_start sub_020538C0
sub_020538C0: ; 0x020538C0
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	str r1, [sp]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	mov r1, #0x20
	str r0, [sp, #0x10]
	mov r0, #0xb
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	add r3, r2, #0
	add r5, sp, #0
	str r0, [r2, #4]
	ldmia r5!, {r0, r1}
	add r3, #8
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	ldr r1, _02053904 ; =sub_02053950
	str r0, [r3]
	add r0, r4, #0
	bl sub_020504F0
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02053904: .word sub_02053950
	thumb_func_end sub_020538C0

	thumb_func_start sub_02053908
sub_02053908: ; 0x02053908
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	str r1, [sp]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	mov r1, #0x20
	str r0, [sp, #0x10]
	mov r0, #0xb
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	add r3, r2, #0
	add r5, sp, #0
	str r0, [r2, #4]
	ldmia r5!, {r0, r1}
	add r3, #8
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	ldr r1, _0205394C ; =sub_02053950
	str r0, [r3]
	add r0, r4, #0
	bl sub_02050510
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0205394C: .word sub_02053950
	thumb_func_end sub_02053908

	thumb_func_start sub_02053950
sub_02053950: ; 0x02053950
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	add r1, r4, #0
	ldr r2, [r4]
	add r1, #8
	cmp r2, #3
	bhi _020539D4
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02053978: ; jump table
	.short _02053980 - _02053978 - 2 ; case 0
	.short _02053996 - _02053978 - 2 ; case 1
	.short _020539B0 - _02053978 - 2 ; case 2
	.short _020539CC - _02053978 - 2 ; case 3
_02053980:
	ldr r1, [r1]
	add r0, r6, #0
	bl sub_020550E4
	add r0, r5, #0
	bl sub_020539D8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020539D4
_02053996:
	ldr r0, [r6, #0x40]
	mov r1, #0
	bl sub_0205C6E4
	add r1, r4, #0
	add r0, r5, #0
	add r1, #8
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020539D4
_020539B0:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _020539D4
	add r0, r6, #0
	bl sub_02067B88
	add r0, r5, #0
	bl sub_02053A14
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020539D4
_020539CC:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_020539D4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02053950

	thumb_func_start sub_020539D8
sub_020539D8: ; 0x020539D8
	ldr r3, _020539E0 ; =sub_02050530
	ldr r1, _020539E4 ; =sub_020539E8
	mov r2, #0
	bx r3
	.balign 4, 0
_020539E0: .word sub_02050530
_020539E4: .word sub_020539E8
	thumb_func_end sub_020539D8

	thumb_func_start sub_020539E8
sub_020539E8: ; 0x020539E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _020539FE
	cmp r0, #1
	beq _02053A0C
	b _02053A10
_020539FE:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053A10
_02053A0C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02053A10:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020539E8

	thumb_func_start sub_02053A14
sub_02053A14: ; 0x02053A14
	push {r4, lr}
	add r4, r0, #0
	bl sub_02050650
	add r2, r0, #0
	ldr r1, _02053A28 ; =sub_02053A2C
	add r0, r4, #0
	bl sub_02050530
	pop {r4, pc}
	.balign 4, 0
_02053A28: .word sub_02053A2C
	thumb_func_end sub_02053A14

	thumb_func_start sub_02053A2C
sub_02053A2C: ; 0x02053A2C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02050654
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02053A4E
	cmp r0, #1
	beq _02053A5C
	cmp r0, #2
	beq _02053A98
	b _02053A9C
_02053A4E:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053A9C
_02053A5C:
	mov r0, #5
	mov r1, #0xa
	bl sub_0200615C
	mov r0, #0
	mov r1, #0x80
	mov r2, #0xf
	bl GF_SndHandleMoveVolume
	mov r1, #0
	add r0, r6, #0
	mvn r1, r1
	add r0, #0xc4
	str r1, [r0]
	ldr r1, [r6, #0x20]
	add r0, r6, #0
	ldr r1, [r1]
	mov r2, #1
	bl sub_02055110
	add r0, r6, #0
	bl ov01_021EFAF8
	add r0, r5, #0
	bl sub_02053AA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053A9C
_02053A98:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02053A9C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02053A2C

	thumb_func_start sub_02053AA0
sub_02053AA0: ; 0x02053AA0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203DF7C
	cmp r0, #0
	bne _02053AC2
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_02053AC2:
	ldr r0, [r5, #0x40]
	bl sub_0205C724
	add r1, r0, #0
	add r0, r5, #0
	bl ov02_0224B418
	str r0, [r4, #4]
	ldr r1, _02053AE0 ; =sub_02053AE4
	add r0, r6, #0
	add r2, r4, #0
	bl sub_02050530
	pop {r4, r5, r6, pc}
	nop
_02053AE0: .word sub_02053AE4
	thumb_func_end sub_02053AA0

	thumb_func_start sub_02053AE4
sub_02053AE4: ; 0x02053AE4
	push {r4, lr}
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov02_0224B43C
	cmp r0, #1
	bne _02053B00
	ldr r0, [r4, #4]
	bl ov02_0224B448
	mov r0, #1
	pop {r4, pc}
_02053B00:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02053AE4

	thumb_func_start sub_02053B04
sub_02053B04: ; 0x02053B04
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x20
	add r4, r2, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	str r4, [r2, #4]
	str r0, [r2, #8]
	add r3, r2, #0
	ldmia r5!, {r0, r1}
	add r3, #0xc
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	ldr r1, _02053B38 ; =sub_02053B3C
	str r0, [r3]
	add r0, r6, #0
	bl sub_02050510
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02053B38: .word sub_02053B3C
	thumb_func_end sub_02053B04

	thumb_func_start sub_02053B3C
sub_02053B3C: ; 0x02053B3C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r4, r0, #0
	add r6, r4, #0
	ldr r1, [r4]
	add r6, #0xc
	cmp r1, #3
	bhi _02053BE2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02053B64: ; jump table
	.short _02053B6C - _02053B64 - 2 ; case 0
	.short _02053B82 - _02053B64 - 2 ; case 1
	.short _02053B9C - _02053B64 - 2 ; case 2
	.short _02053BDA - _02053B64 - 2 ; case 3
_02053B6C:
	ldr r1, [r6]
	add r0, r5, #0
	bl sub_020550E4
	add r0, r7, #0
	bl sub_02053BE8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053BE2
_02053B82:
	ldr r0, [r5, #0x40]
	mov r1, #0
	bl sub_0205C6E4
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0xc
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053BE2
_02053B9C:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02053BE2
	ldr r1, [r6]
	add r0, r5, #0
	mov r2, #0
	bl sub_02055110
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _02053BBC
	add r0, r5, #0
	bl sub_02067BA4
	b _02053BCC
_02053BBC:
	cmp r0, #1
	bhi _02053BC8
	add r0, r5, #0
	bl sub_02067BC0
	b _02053BCC
_02053BC8:
	bl GF_AssertFail
_02053BCC:
	add r0, r7, #0
	bl sub_02053C24
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053BE2
_02053BDA:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02053BE2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02053B3C

	thumb_func_start sub_02053BE8
sub_02053BE8: ; 0x02053BE8
	ldr r3, _02053BF0 ; =sub_02050530
	ldr r1, _02053BF4 ; =sub_02053BF8
	mov r2, #0
	bx r3
	.balign 4, 0
_02053BF0: .word sub_02050530
_02053BF4: .word sub_02053BF8
	thumb_func_end sub_02053BE8

	thumb_func_start sub_02053BF8
sub_02053BF8: ; 0x02053BF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02053C0E
	cmp r0, #1
	beq _02053C1C
	b _02053C20
_02053C0E:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053C20
_02053C1C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02053C20:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02053BF8

	thumb_func_start sub_02053C24
sub_02053C24: ; 0x02053C24
	push {r4, lr}
	add r4, r0, #0
	bl sub_02050650
	add r2, r0, #0
	ldr r1, _02053C38 ; =sub_02053C3C
	add r0, r4, #0
	bl sub_02050530
	pop {r4, pc}
	.balign 4, 0
_02053C38: .word sub_02053C3C
	thumb_func_end sub_02053C24

	thumb_func_start sub_02053C3C
sub_02053C3C: ; 0x02053C3C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02050654
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	ldr r0, [r4]
	cmp r0, #0
	beq _02053C64
	cmp r0, #1
	beq _02053C72
	cmp r0, #2
	beq _02053C86
	b _02053C8A
_02053C64:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053C8A
_02053C72:
	add r0, r6, #0
	bl ov01_021EFAF8
	add r0, r5, #0
	bl sub_02053C90
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053C8A
_02053C86:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02053C8A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02053C3C

	thumb_func_start sub_02053C90
sub_02053C90: ; 0x02053C90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0203DF7C
	cmp r0, #0
	bne _02053CB2
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_02053CB2:
	ldr r2, [r6, #4]
	add r0, r4, #0
	mov r1, #4
	bl ov02_0224C1D8
	add r2, r0, #0
	ldr r1, _02053CC8 ; =0x0224C1F9
	add r0, r5, #0
	bl sub_02050530
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02053CC8: .word 0x0224C1F9
	thumb_func_end sub_02053C90

	thumb_func_start sub_02053CCC
sub_02053CCC: ; 0x02053CCC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r4, r0, #0
	add r6, r4, #0
	ldr r1, [r4]
	add r6, #8
	cmp r1, #7
	bls _02053CEA
	b _02053E02
_02053CEA:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02053CF6: ; jump table
	.short _02053D06 - _02053CF6 - 2 ; case 0
	.short _02053D3E - _02053CF6 - 2 ; case 1
	.short _02053D5E - _02053CF6 - 2 ; case 2
	.short _02053D7A - _02053CF6 - 2 ; case 3
	.short _02053D8A - _02053CF6 - 2 ; case 4
	.short _02053DAA - _02053CF6 - 2 ; case 5
	.short _02053DEE - _02053CF6 - 2 ; case 6
	.short _02053DFA - _02053CF6 - 2 ; case 7
_02053D06:
	mov r0, #0
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02053D36
	add r0, r5, #0
	bl ov01_022057C4
	cmp r0, #0
	bne _02053D36
	ldr r0, [r5, #0x40]
	bl sub_0205C700
	cmp r0, #1
	beq _02053D36
	add r0, r5, #0
	bl sub_02069D68
	mov r1, #1
	bl ov01_0220329C
	str r0, [r4, #0x1c]
_02053D36:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053E02
_02053D3E:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02053D4C
	bl sub_02068CCC
	cmp r0, #0
	bne _02053E02
_02053D4C:
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #4
	bl ov01_021F35C4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053E02
_02053D5E:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02053E02
	ldr r1, [r6]
	add r0, r5, #0
	bl sub_020550E4
	add r0, r7, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053E02
_02053D7A:
	add r0, r7, #0
	add r1, r6, #0
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053E02
_02053D8A:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02053E02
	ldr r1, [r6]
	add r0, r5, #0
	mov r2, #0
	bl sub_02055110
	add r0, r7, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053E02
_02053DAA:
	mov r1, #0
	add r0, r5, #0
	add r2, r4, #4
	str r1, [r4, #4]
	bl ov01_021F35C4
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02053DE6
	add r0, r5, #0
	bl sub_02069D68
	add r7, r0, #0
	bl sub_02069F7C
	ldr r1, [r6]
	bl sub_02069FF4
	cmp r0, #0
	beq _02053DE6
	add r0, r7, #0
	mov r1, #1
	bl sub_02069E84
	add r0, r5, #0
	mov r1, #1
	bl ov01_02205790
_02053DE6:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053E02
_02053DEE:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02053E02
	add r0, r1, #1
	str r0, [r4]
	b _02053E02
_02053DFA:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02053E02:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02053CCC

	thumb_func_start sub_02053E08
sub_02053E08: ; 0x02053E08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x20
	add r6, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x20
	add r7, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	mov r1, #0
	add r2, r7, #0
	str r4, [sp]
	str r6, [sp, #4]
	add r3, sp, #0
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldmia r3!, {r0, r1}
	add r2, #8
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _02053E58 ; =sub_02053CCC
	str r0, [r2]
	add r0, r5, #0
	add r2, r7, #0
	bl sub_020504F0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02053E58: .word sub_02053CCC
	thumb_func_end sub_02053E08

	thumb_func_start sub_02053E5C
sub_02053E5C: ; 0x02053E5C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205064C
	str r0, [sp]
	add r0, r5, #0
	bl sub_02050650
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r4, r0, #0
	add r6, r7, #0
	ldr r0, [r4]
	add r6, #8
	cmp r0, #5
	bhi _02053F0E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02053E8C: ; jump table
	.short _02053E98 - _02053E8C - 2 ; case 0
	.short _02053EB2 - _02053E8C - 2 ; case 1
	.short _02053EC6 - _02053E8C - 2 ; case 2
	.short _02053ED6 - _02053E8C - 2 ; case 3
	.short _02053EF6 - _02053E8C - 2 ; case 4
	.short _02053F04 - _02053E8C - 2 ; case 5
_02053E98:
	ldr r0, [sp]
	ldr r1, [r6]
	bl sub_020550E4
	ldr r0, [sp]
	mov r1, #1
	add r2, r7, #4
	bl ov01_021F35C4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053F0E
_02053EB2:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _02053F0E
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053F0E
_02053EC6:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053F0E
_02053ED6:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02053F0E
	ldr r0, [sp]
	ldr r1, [r6]
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053F0E
_02053EF6:
	add r0, r5, #0
	bl sub_0205532C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02053F0E
_02053F04:
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02053F0E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02053E5C

	thumb_func_start sub_02053F14
sub_02053F14: ; 0x02053F14
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B968
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	add r2, r6, #0
	ldmia r4!, {r0, r1}
	add r2, #8
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	add r0, r5, #0
	bl sub_02059E04
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	bl sub_0205AD3C
	mov r0, #0
	str r0, [r5, #0x70]
	ldr r1, _02053F6C ; =sub_02053E5C
	add r0, r5, #0
	add r2, r6, #0
	bl sub_020504F0
	mov r0, #0
	add r5, #0x80
	str r0, [r5]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02053F6C: .word sub_02053E5C
	thumb_func_end sub_02053F14

	thumb_func_start sub_02053F70
sub_02053F70: ; 0x02053F70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205064C
	str r0, [sp]
	add r0, r5, #0
	bl sub_02050650
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02050654
	add r4, r0, #0
	add r6, r7, #0
	ldr r0, [r4]
	add r6, #8
	cmp r0, #6
	bhi _0205402C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02053FA0: ; jump table
	.short _02053FAE - _02053FA0 - 2 ; case 0
	.short _02053FC4 - _02053FA0 - 2 ; case 1
	.short _02053FD2 - _02053FA0 - 2 ; case 2
	.short _02053FE2 - _02053FA0 - 2 ; case 3
	.short _02054002 - _02053FA0 - 2 ; case 4
	.short _02054016 - _02053FA0 - 2 ; case 5
	.short _02054022 - _02053FA0 - 2 ; case 6
_02053FAE:
	ldr r0, [sp]
	ldr r1, [r6]
	bl sub_020550E4
	add r0, r5, #0
	bl sub_020552E8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02053FC4:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02053FD2:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02053FE2:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _0205402C
	ldr r0, [sp]
	ldr r1, [r6]
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02054002:
	mov r1, #0
	ldr r0, [sp]
	str r1, [r7, #4]
	add r2, r7, #4
	bl ov01_021F35C4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02054016:
	ldr r1, [r7, #4]
	cmp r1, #0
	beq _0205402C
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02054022:
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205402C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02053F70

	thumb_func_start sub_02054030
sub_02054030: ; 0x02054030
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B968
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r7, #0
	add r1, r5, #0
	bl sub_02053350
	mov r0, #2
	str r0, [r4, #8]
	sub r0, r0, #3
	str r0, [r4, #0xc]
	mov r0, #8
	str r0, [r4, #0x10]
	mov r0, #0xe
	str r0, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #0x18]
	add r0, r5, #0
	bl sub_02059DB0
	add r1, r5, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205AC88
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	mov r0, #2
	str r0, [r5, #0x70]
	ldr r1, _020540A0 ; =sub_02053F70
	add r0, r6, #0
	add r2, r4, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020540A0: .word sub_02053F70
	thumb_func_end sub_02054030

	thumb_func_start sub_020540A4
sub_020540A4: ; 0x020540A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #3
	bhi _02054124
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020540C8: ; jump table
	.short _020540D0 - _020540C8 - 2 ; case 0
	.short _020540EC - _020540C8 - 2 ; case 1
	.short _020540FC - _020540C8 - 2 ; case 2
	.short _0205411C - _020540C8 - 2 ; case 3
_020540D0:
	ldr r0, _02054128 ; =0x00000602
	bl PlaySE
	ldr r1, [r4, #4]
	add r0, r6, #0
	bl sub_020550E4
	add r0, r5, #0
	bl sub_020553B0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02054124
_020540EC:
	add r0, r5, #0
	add r1, r4, #4
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02054124
_020540FC:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02054124
	ldr r1, [r4, #4]
	add r0, r6, #0
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02054124
_0205411C:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02054124:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02054128: .word 0x00000602
	thumb_func_end sub_020540A4

	thumb_func_start sub_0205412C
sub_0205412C: ; 0x0205412C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0205064C
	str r0, [sp]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B968
	ldr r1, [sp]
	bl sub_02053350
	ldr r0, [sp]
	mov r1, #3
	str r1, [r0, #0x70]
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	ldr r0, [sp, #0x30]
	str r4, [sp, #8]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x34]
	str r5, [sp, #4]
	str r0, [sp, #0x14]
	mov r0, #0
	str r6, [sp, #0xc]
	add r4, sp, #4
	str r0, [r2]
	ldmia r4!, {r0, r1}
	add r3, r2, #4
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r1, _0205418C ; =sub_020540A4
	str r0, [r3]
	add r0, r7, #0
	bl sub_02050530
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205418C: .word sub_020540A4
	thumb_func_end sub_0205412C

	thumb_func_start sub_02054190
sub_02054190: ; 0x02054190
	push {r4, lr}
	bl sub_0205064C
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	bl sub_0203B968
	add r1, r0, #0
	mov r0, #0
	str r0, [r4, #0x70]
	ldr r0, [r4, #0x10]
	bl sub_02053710
	pop {r4, pc}
	thumb_func_end sub_02054190
