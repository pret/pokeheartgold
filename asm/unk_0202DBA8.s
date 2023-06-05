	.include "asm/macros.inc"
	.include "unk_0202DBA8.inc"
	.include "global.inc"

	.bss

sMysteryGiftData:
	.space 0x4

	.text

	thumb_func_start Save_MysteryGift_sizeof
Save_MysteryGift_sizeof: ; 0x0202DBA8
	mov r0, #0x5a
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end Save_MysteryGift_sizeof

	thumb_func_start Save_MysteryGift_Init
Save_MysteryGift_Init: ; 0x0202DBB0
	ldr r3, _0202DBB8 ; =SaveSubstruct_UpdateCRC
	mov r0, #0x1b
	bx r3
	nop
_0202DBB8: .word SaveSubstruct_UpdateCRC
	thumb_func_end Save_MysteryGift_Init

	thumb_func_start MysteryGiftTagIsValid
MysteryGiftTagIsValid: ; 0x0202DBBC
	cmp r0, #0
	beq _0202DBC8
	cmp r0, #0x10
	bhs _0202DBC8
	mov r0, #1
	bx lr
_0202DBC8:
	mov r0, #0
	bx lr
	thumb_func_end MysteryGiftTagIsValid

	thumb_func_start SaveMysteryGift_GetByIdx
SaveMysteryGift_GetByIdx: ; 0x0202DBCC
	push {r3, r4, r5, lr}
	cmp r1, #0
	blt _0202DBF0
	cmp r1, #8
	bge _0202DBF0
	mov r2, #1
	lsl r2, r2, #8
	add r4, r0, r2
	lsl r0, r1, #6
	add r0, r1, r0
	lsl r5, r0, #2
	ldrh r0, [r4, r5]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	beq _0202DBF0
	add r0, r4, r5
	pop {r3, r4, r5, pc}
_0202DBF0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end SaveMysteryGift_GetByIdx

	thumb_func_start SaveMysteryGift_CardGetByIdx
SaveMysteryGift_CardGetByIdx: ; 0x0202DBF4
	push {r3, r4, r5, lr}
	cmp r1, #0
	blt _0202DC1A
	cmp r1, #3
	bge _0202DC1A
	mov r2, #0x92
	lsl r2, r2, #4
	add r4, r0, r2
	mov r0, #0xd6
	lsl r0, r0, #2
	add r5, r1, #0
	mul r5, r0
	ldrh r0, [r4, r5]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	beq _0202DC24
	add r0, r4, r5
	pop {r3, r4, r5, pc}
_0202DC1A:
	cmp r1, #4
	bne _0202DC24
	ldr r1, _0202DC28 ; =0x00001328
	add r0, r0, r1
	pop {r3, r4, r5, pc}
_0202DC24:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202DC28: .word 0x00001328
	thumb_func_end SaveMysteryGift_CardGetByIdx

	thumb_func_start sub_0202DC2C
sub_0202DC2C: ; 0x0202DC2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	mov r1, #0
	str r0, [sp]
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	bl SaveMysteryGift_FindAvailable
	cmp r0, #0
	bne _0202DC48
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202DC48:
	mov r7, #0x41
	lsl r7, r7, #2
	ldr r5, [sp]
	mov r4, #0
	sub r6, r7, #4
_0202DC52:
	ldrh r0, [r5, r6]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	bne _0202DC94
	lsl r0, r4, #6
	mov r2, #1
	add r0, r4, r0
	lsl r4, r0, #2
	ldr r1, [sp]
	lsl r2, r2, #8
	add r1, r1, r2
	ldr r0, [sp, #4]
	add r1, r1, r4
	add r2, r2, #4
	bl MI_CpuCopy8
	ldr r1, _0202DCA8 ; =0x00000102
	ldr r0, [sp]
	mov r2, #3
	add r1, r0, r1
	ldrh r0, [r1, r4]
	bic r0, r2
	ldr r2, [sp, #8]
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	mov r2, #3
	and r2, r3
	orr r0, r2
	strh r0, [r1, r4]
	mov r0, #1
	str r0, [sp, #0xc]
	b _0202DC9C
_0202DC94:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #8
	blt _0202DC52
_0202DC9C:
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202DCA8: .word 0x00000102
	thumb_func_end sub_0202DC2C

	thumb_func_start sub_0202DCAC
sub_0202DCAC: ; 0x0202DCAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #8]
	bl SaveMysteryGift_CardFindAvailable
	cmp r0, #0
	bne _0202DCC6
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0202DCC6:
	ldr r1, _0202DD44 ; =0x00000152
	ldr r0, [sp, #4]
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0202DCE4
	ldr r0, [sp]
	bl SaveMysteryGift_FindAvailable
	cmp r0, #0
	bne _0202DCE4
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0202DCE4:
	mov r7, #0xd6
	mov r6, #0x92
	ldr r5, [sp]
	mov r4, #0
	lsl r7, r7, #2
	lsl r6, r6, #4
_0202DCF0:
	ldrh r0, [r5, r6]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	bne _0202DD30
	mov r2, #0x92
	ldr r1, [sp]
	lsl r2, r2, #4
	add r3, r1, r2
	mov r2, #0xd6
	lsl r2, r2, #2
	add r1, r4, #0
	mul r1, r2
	ldr r0, [sp, #4]
	add r1, r3, r1
	bl MI_CpuCopy8
	ldr r1, _0202DD44 ; =0x00000152
	ldr r0, [sp, #4]
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0202DD2A
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl sub_0202DC2C
_0202DD2A:
	mov r0, #1
	str r0, [sp, #8]
	b _0202DD38
_0202DD30:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #3
	blt _0202DCF0
_0202DD38:
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0202DD44: .word 0x00000152
	thumb_func_end sub_0202DCAC

	thumb_func_start sub_0202DD48
sub_0202DD48: ; 0x0202DD48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0202DD78 ; =0x00001328
	add r4, r1, #0
	ldrh r0, [r5, r0]
	bl MysteryGiftTagIsValid
	cmp r0, #1
	bne _0202DD5E
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202DD5E:
	ldr r1, _0202DD78 ; =0x00001328
	mov r2, #0xd6
	add r0, r4, #0
	add r1, r5, r1
	lsl r2, r2, #2
	bl MI_CpuCopy8
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0202DD78: .word 0x00001328
	thumb_func_end sub_0202DD48

	thumb_func_start SaveMysteryGiftI_SetReceived
SaveMysteryGiftI_SetReceived: ; 0x0202DD7C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #8
	blt _0202DD8A
	bl GF_AssertFail
_0202DD8A:
	lsl r0, r5, #6
	add r0, r5, r0
	lsl r0, r0, #2
	mov r1, #1
	mov r3, #0
	add r2, r4, r0
	lsl r1, r1, #8
	strh r3, [r2, r1]
	add r1, r1, #2
	add r3, r4, r1
	ldrh r2, [r3, r0]
	mov r1, #3
	bic r2, r1
	strh r2, [r3, r0]
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end SaveMysteryGiftI_SetReceived

	thumb_func_start sub_0202DDB0
sub_0202DDB0: ; 0x0202DDB0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0202DDBE
	bl GF_AssertFail
_0202DDBE:
	mov r0, #0xd6
	lsl r0, r0, #2
	mul r0, r4
	add r2, r5, r0
	mov r0, #0x92
	mov r1, #0
	lsl r0, r0, #4
	strh r1, [r2, r0]
	mov r1, #0xa7
	lsl r1, r1, #4
	ldrh r1, [r2, r1]
	add r0, r5, #0
	bl sub_0202DFDC
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202DF38
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DDB0

	thumb_func_start sub_0202DDEC
sub_0202DDEC: ; 0x0202DDEC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0202DDFA
	bl GF_AssertFail
_0202DDFA:
	mov r0, #0xd6
	lsl r0, r0, #2
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x92
	mov r2, #0
	lsl r0, r0, #4
	strh r2, [r1, r0]
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DDEC

	thumb_func_start SaveMysteryGift_FindAvailable
SaveMysteryGift_FindAvailable: ; 0x0202DE14
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x41
	lsl r7, r7, #2
	add r5, r0, #0
	mov r4, #0
	sub r6, r7, #4
_0202DE20:
	ldrh r0, [r5, r6]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	bne _0202DE2E
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202DE2E:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #8
	blt _0202DE20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end SaveMysteryGift_FindAvailable

	thumb_func_start SaveMysteryGift_CardFindAvailable
SaveMysteryGift_CardFindAvailable: ; 0x0202DE3C
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0xd6
	mov r6, #0x92
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #2
	lsl r6, r6, #4
_0202DE4A:
	ldrh r0, [r5, r6]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	bne _0202DE58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202DE58:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #3
	blt _0202DE4A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end SaveMysteryGift_CardFindAvailable

	thumb_func_start SaveMysteryGiftI_TagIsValid
SaveMysteryGiftI_TagIsValid: ; 0x0202DE64
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _0202DE72
	bl GF_AssertFail
_0202DE72:
	lsl r0, r4, #6
	add r0, r4, r0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #1
	lsl r0, r0, #8
	ldrh r0, [r1, r0]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	beq _0202DE8C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202DE8C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end SaveMysteryGiftI_TagIsValid

	thumb_func_start sub_0202DE90
sub_0202DE90: ; 0x0202DE90
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	blt _0202DE9E
	bl GF_AssertFail
_0202DE9E:
	mov r0, #0xd6
	lsl r0, r0, #2
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x92
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	beq _0202DEB8
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202DEB8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DE90

	thumb_func_start sub_0202DEBC
sub_0202DEBC: ; 0x0202DEBC
	push {r3, lr}
	ldr r1, _0202DED4 ; =0x00001328
	ldrh r0, [r0, r1]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	beq _0202DECE
	mov r0, #1
	pop {r3, pc}
_0202DECE:
	mov r0, #0
	pop {r3, pc}
	nop
_0202DED4: .word 0x00001328
	thumb_func_end sub_0202DEBC

	thumb_func_start sub_0202DED8
sub_0202DED8: ; 0x0202DED8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0202DEDE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202DE90
	cmp r0, #1
	bne _0202DEEE
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202DEEE:
	add r4, r4, #1
	cmp r4, #3
	blt _0202DEDE
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DED8

	thumb_func_start sub_0202DEF8
sub_0202DEF8: ; 0x0202DEF8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0202DF34 ; =0x00000102
	add r7, r1, #0
	mov r6, #0
	add r4, r5, r0
_0202DF04:
	mov r0, #1
	lsl r0, r0, #8
	ldrh r0, [r5, r0]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	beq _0202DF20
	ldrh r0, [r4]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r7, r0
	bne _0202DF20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202DF20:
	mov r0, #0x41
	lsl r0, r0, #2
	add r6, r6, #1
	add r5, r5, r0
	add r4, r4, r0
	cmp r6, #8
	blt _0202DF04
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202DF34: .word 0x00000102
	thumb_func_end sub_0202DEF8

	thumb_func_start sub_0202DF38
sub_0202DF38: ; 0x0202DF38
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r1, _0202DF78 ; =0x00000102
	str r0, [sp]
	mov r6, #0
	add r4, r0, #0
	add r5, r0, r1
_0202DF46:
	mov r0, #1
	lsl r0, r0, #8
	ldrh r0, [r4, r0]
	bl MysteryGiftTagIsValid
	cmp r0, #0
	beq _0202DF68
	ldrh r0, [r5]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r7, r0
	bne _0202DF68
	ldr r0, [sp]
	add r1, r6, #0
	bl SaveMysteryGiftI_SetReceived
	pop {r3, r4, r5, r6, r7, pc}
_0202DF68:
	mov r0, #0x41
	lsl r0, r0, #2
	add r6, r6, #1
	add r4, r4, r0
	add r5, r5, r0
	cmp r6, #8
	blt _0202DF46
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202DF78: .word 0x00000102
	thumb_func_end sub_0202DF38

	thumb_func_start sub_0202DF7C
sub_0202DF7C: ; 0x0202DF7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	add r4, r1, #0
	lsl r0, r0, #0xa
	cmp r4, r0
	blt _0202DF8E
	bl GF_AssertFail
_0202DF8E:
	mov r0, #1
	mov r1, #7
	add r2, r4, #0
	and r2, r1
	add r1, r0, #0
	lsl r1, r2
	asr r2, r4, #2
	lsr r2, r2, #0x1d
	add r2, r4, r2
	asr r2, r2, #3
	ldrb r2, [r5, r2]
	tst r1, r2
	bne _0202DFAA
	mov r0, #0
_0202DFAA:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DF7C

	thumb_func_start sub_0202DFAC
sub_0202DFAC: ; 0x0202DFAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	add r4, r1, #0
	lsl r0, r0, #0xa
	cmp r4, r0
	blt _0202DFBE
	bl GF_AssertFail
_0202DFBE:
	asr r0, r4, #2
	lsr r0, r0, #0x1d
	add r0, r4, r0
	asr r1, r0, #3
	mov r2, #7
	ldrb r0, [r5, r1]
	mov r3, #1
	and r2, r4
	lsl r3, r2
	orr r0, r3
	strb r0, [r5, r1]
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202DFAC

	thumb_func_start sub_0202DFDC
sub_0202DFDC: ; 0x0202DFDC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #1
	mov r0, #7
	and r0, r4
	add r2, r1, #0
	lsl r2, r0
	mvn r0, r2
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	lsl r0, r1, #0xb
	cmp r4, r0
	blt _0202DFFC
	bl GF_AssertFail
_0202DFFC:
	asr r0, r4, #2
	lsr r0, r0, #0x1d
	add r0, r4, r0
	asr r1, r0, #3
	ldrb r0, [r5, r1]
	and r0, r6
	strb r0, [r5, r1]
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202DFDC

	thumb_func_start sub_0202E014
sub_0202E014: ; 0x0202E014
	ldr r3, _0202E01C ; =sub_0202DF7C
	ldr r1, _0202E020 ; =0x000007FF
	bx r3
	nop
_0202E01C: .word sub_0202DF7C
_0202E020: .word 0x000007FF
	thumb_func_end sub_0202E014

	thumb_func_start sub_0202E024
sub_0202E024: ; 0x0202E024
	ldr r3, _0202E02C ; =sub_0202DFAC
	ldr r1, _0202E030 ; =0x000007FF
	bx r3
	nop
_0202E02C: .word sub_0202DFAC
_0202E030: .word 0x000007FF
	thumb_func_end sub_0202E024

	thumb_func_start GetStaticPointerToSaveMysteryGift
GetStaticPointerToSaveMysteryGift: ; 0x0202E034
	push {r3, lr}
	ldr r1, _0202E050 ; =sMysteryGiftData
	ldr r1, [r1]
	cmp r1, #0
	bne _0202E046
	bl Save_MysteryGift_Get
	ldr r1, _0202E050 ; =sMysteryGiftData
	str r0, [r1]
_0202E046:
	mov r0, #0x1b
	bl SaveSubstruct_UpdateCRC
	pop {r3, pc}
	nop
_0202E050: .word sMysteryGiftData
	thumb_func_end GetStaticPointerToSaveMysteryGift

	thumb_func_start DeleteStaticPointerToMysteryGift
DeleteStaticPointerToMysteryGift: ; 0x0202E054
	ldr r0, _0202E064 ; =sMysteryGiftData
	ldr r1, [r0]
	cmp r1, #0
	beq _0202E060
	mov r1, #0
	str r1, [r0]
_0202E060:
	bx lr
	nop
_0202E064: .word sMysteryGiftData
	thumb_func_end DeleteStaticPointerToMysteryGift

	thumb_func_start GetFirstQueuedMysteryGiftIdx
GetFirstQueuedMysteryGiftIdx: ; 0x0202E068
	push {r3, r4, r5, lr}
	ldr r4, _0202E08C ; =sMysteryGiftData
	mov r5, #0
_0202E06E:
	ldr r0, [r4]
	add r1, r5, #0
	bl SaveMysteryGiftI_TagIsValid
	cmp r0, #1
	bne _0202E07E
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_0202E07E:
	add r5, r5, #1
	cmp r5, #8
	blt _0202E06E
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_0202E08C: .word sMysteryGiftData
	thumb_func_end GetFirstQueuedMysteryGiftIdx

	thumb_func_start GetMysteryGiftTagByIdx
GetMysteryGiftTagByIdx: ; 0x0202E090
	push {r3, lr}
	add r1, r0, #0
	ldr r0, _0202E0A8 ; =sMysteryGiftData
	ldr r0, [r0]
	bl SaveMysteryGift_GetByIdx
	cmp r0, #0
	beq _0202E0A4
	ldrh r0, [r0]
	pop {r3, pc}
_0202E0A4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0202E0A8: .word sMysteryGiftData
	thumb_func_end GetMysteryGiftTagByIdx

	thumb_func_start GetMysteryGiftDataByIdx
GetMysteryGiftDataByIdx: ; 0x0202E0AC
	push {r3, lr}
	add r1, r0, #0
	ldr r0, _0202E0C4 ; =sMysteryGiftData
	ldr r0, [r0]
	bl SaveMysteryGift_GetByIdx
	cmp r0, #0
	beq _0202E0C0
	add r0, r0, #4
	pop {r3, pc}
_0202E0C0:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0202E0C4: .word sMysteryGiftData
	thumb_func_end GetMysteryGiftDataByIdx

	thumb_func_start SetMysteryGiftReceivedByIdx
SetMysteryGiftReceivedByIdx: ; 0x0202E0C8
	add r1, r0, #0
	ldr r0, _0202E0D4 ; =sMysteryGiftData
	ldr r3, _0202E0D8 ; =SaveMysteryGiftI_SetReceived
	ldr r0, [r0]
	bx r3
	nop
_0202E0D4: .word sMysteryGiftData
_0202E0D8: .word SaveMysteryGiftI_SetReceived
	thumb_func_end SetMysteryGiftReceivedByIdx
