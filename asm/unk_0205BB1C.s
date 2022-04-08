#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

sRegiSpecies:
	.short SPECIES_REGIROCK
	.short SPECIES_REGICE
	.short SPECIES_REGISTEEL

	.text

	thumb_func_start sub_0205BB1C
sub_0205BB1C: ; 0x0205BB1C
	push {r4, lr}
	mov r1, #0xa
	add r4, r0, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0205BB2E
	mov r0, #1
	pop {r4, pc}
_0205BB2E:
	add r0, r4, #0
	mov r1, #0x64
	bl _u32_div_f
	cmp r0, #0
	bne _0205BB3E
	mov r0, #2
	pop {r4, pc}
_0205BB3E:
	mov r1, #0xfa
	add r0, r4, #0
	lsl r1, r1, #2
	bl _u32_div_f
	cmp r0, #0
	bne _0205BB50
	mov r0, #3
	pop {r4, pc}
_0205BB50:
	ldr r1, _0205BBA4 ; =0x00002710
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0205BB60
	mov r0, #4
	pop {r4, pc}
_0205BB60:
	ldr r1, _0205BBA8 ; =0x000186A0
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0205BB70
	mov r0, #5
	pop {r4, pc}
_0205BB70:
	ldr r1, _0205BBAC ; =0x000F4240
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0205BB80
	mov r0, #6
	pop {r4, pc}
_0205BB80:
	ldr r1, _0205BBB0 ; =0x00989680
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0205BB90
	mov r0, #7
	pop {r4, pc}
_0205BB90:
	ldr r1, _0205BBB4 ; =0x05F5E100
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0205BBA0
	mov r0, #8
	pop {r4, pc}
_0205BBA0:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0205BBA4: .word 0x00002710
_0205BBA8: .word 0x000186A0
_0205BBAC: .word 0x000F4240
_0205BBB0: .word 0x00989680
_0205BBB4: .word 0x05F5E100
	thumb_func_end sub_0205BB1C

	thumb_func_start ItemIsTMOrHM
ItemIsTMOrHM: ; 0x0205BBB8
	mov r1, #0x52
	lsl r1, r1, #2
	cmp r0, r1
	blo _0205BBCA
	add r1, #0x63
	cmp r0, r1
	bhi _0205BBCA
	mov r0, #1
	bx lr
_0205BBCA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ItemIsTMOrHM

	thumb_func_start sub_0205BBD0
sub_0205BBD0: ; 0x0205BBD0
	ldr r3, _0205BC74 ; =0x000004AA
	cmp r0, #9
	strh r3, [r2]
	bhi _0205BBDC
	mov r0, #0x1c
	bx lr
_0205BBDC:
	cmp r0, #0x13
	bhi _0205BBE4
	mov r0, #0x1d
	bx lr
_0205BBE4:
	cmp r0, #0x22
	bhi _0205BBEC
	mov r0, #0x1e
	bx lr
_0205BBEC:
	cmp r0, #0x31
	bhi _0205BBF4
	mov r0, #0x1f
	bx lr
_0205BBF4:
	cmp r0, #0x40
	bhi _0205BBFC
	mov r0, #0x20
	bx lr
_0205BBFC:
	cmp r0, #0x4f
	bhi _0205BC04
	mov r0, #0x21
	bx lr
_0205BC04:
	cmp r0, #0x5e
	bhi _0205BC0C
	mov r0, #0x22
	bx lr
_0205BC0C:
	cmp r0, #0x6d
	bhi _0205BC14
	mov r0, #0x23
	bx lr
_0205BC14:
	cmp r0, #0x7c
	bhi _0205BC1C
	mov r0, #0x24
	bx lr
_0205BC1C:
	cmp r0, #0x8b
	bhi _0205BC24
	mov r0, #0x25
	bx lr
_0205BC24:
	cmp r0, #0x9a
	bhi _0205BC2C
	mov r0, #0x26
	bx lr
_0205BC2C:
	cmp r0, #0xa9
	bhi _0205BC34
	mov r0, #0x27
	bx lr
_0205BC34:
	cmp r0, #0xb8
	bhi _0205BC3C
	mov r0, #0x28
	bx lr
_0205BC3C:
	cmp r0, #0xc7
	bhi _0205BC44
	mov r0, #0x29
	bx lr
_0205BC44:
	cmp r0, #0xd6
	bhi _0205BC4C
	mov r0, #0x2a
	bx lr
_0205BC4C:
	cmp r0, #0xe5
	bhi _0205BC54
	mov r0, #0x2b
	bx lr
_0205BC54:
	cmp r0, #0xf4
	bhi _0205BC5C
	mov r0, #0x2c
	bx lr
_0205BC5C:
	cmp r0, #0xfd
	bhi _0205BC64
	mov r0, #0x2d
	bx lr
_0205BC64:
	add r0, r3, #5
	strh r0, [r2]
	cmp r1, #0
	beq _0205BC70
	mov r0, #0x17
	bx lr
_0205BC70:
	mov r0, #0x16
	bx lr
	.balign 4, 0
_0205BC74: .word 0x000004AA
	thumb_func_end sub_0205BBD0

	thumb_func_start sub_0205BC78
sub_0205BC78: ; 0x0205BC78
	push {r4, r5}
	ldr r4, _0205BD1C ; =0x000004AA
	cmp r0, #0x64
	strh r4, [r2]
	bhi _0205BC88
	mov r0, #0x2e
	pop {r4, r5}
	bx lr
_0205BC88:
	cmp r0, #0x96
	bhi _0205BC92
	mov r0, #0x2f
	pop {r4, r5}
	bx lr
_0205BC92:
	cmp r0, #0xc8
	bhi _0205BC9C
	mov r0, #0x30
	pop {r4, r5}
	bx lr
_0205BC9C:
	cmp r0, #0xfa
	bhi _0205BCA6
	mov r0, #0x31
	pop {r4, r5}
	bx lr
_0205BCA6:
	mov r3, #0x4b
	lsl r3, r3, #2
	cmp r0, r3
	bhi _0205BCB4
	mov r0, #0x32
	pop {r4, r5}
	bx lr
_0205BCB4:
	add r5, r3, #0
	add r5, #0x32
	cmp r0, r5
	bhi _0205BCC2
	mov r0, #0x33
	pop {r4, r5}
	bx lr
_0205BCC2:
	add r5, r3, #0
	add r5, #0x64
	cmp r0, r5
	bhi _0205BCD0
	mov r0, #0x34
	pop {r4, r5}
	bx lr
_0205BCD0:
	add r5, r3, #0
	add r5, #0x87
	cmp r0, r5
	bhi _0205BCDE
	mov r0, #0x35
	pop {r4, r5}
	bx lr
_0205BCDE:
	add r5, r3, #0
	add r5, #0xa5
	cmp r0, r5
	bhi _0205BCEC
	mov r0, #0x36
	pop {r4, r5}
	bx lr
_0205BCEC:
	add r5, r3, #0
	add r5, #0xaf
	cmp r0, r5
	bhi _0205BCFA
	mov r0, #0x37
	pop {r4, r5}
	bx lr
_0205BCFA:
	add r3, #0xb7
	cmp r0, r3
	bhi _0205BD06
	mov r0, #0x38
	pop {r4, r5}
	bx lr
_0205BD06:
	add r0, r4, #5
	strh r0, [r2]
	cmp r1, #0
	beq _0205BD14
	mov r0, #0x19
	pop {r4, r5}
	bx lr
_0205BD14:
	mov r0, #0x18
	pop {r4, r5}
	bx lr
	nop
_0205BD1C: .word 0x000004AA
	thumb_func_end sub_0205BC78

	thumb_func_start Save_GetPartyLead
Save_GetPartyLead: ; 0x0205BD20
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r4, _0205BD60 ; =0x00000000
	beq _0205BD5C
	mov r7, #0x4c
_0205BD36:
	add r0, r6, #0
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0205BD52
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205BD52:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r5
	blo _0205BD36
_0205BD5C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205BD60: .word 0x00000000
	thumb_func_end Save_GetPartyLead

	thumb_func_start Save_GetPartyLeadAlive
Save_GetPartyLeadAlive: ; 0x0205BD64
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r5, _0205BDB4 ; =0x00000000
	beq _0205BDAE
_0205BD78:
	add r0, r7, #0
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0205BDA4
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0205BDA4
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205BDA4:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r6
	blo _0205BD78
_0205BDAE:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0205BDB4: .word 0x00000000
	thumb_func_end Save_GetPartyLeadAlive

	thumb_func_start Save_PlayerHasRegiInParty
Save_PlayerHasRegiInParty: ; 0x0205BDB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, #0
	bl SavArray_PlayerParty_get
	str r0, [sp]
	bl GetPartyCount
	add r4, r0, #0
	add r6, r7, #0
	cmp r4, #0
	ble _0205BDEC
	add r5, sp, #4
_0205BDD2:
	ldr r0, [sp]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r5]
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, r4
	blt _0205BDD2
_0205BDEC:
	ldr r2, _0205BE24 ; =sRegiSpecies
	mov r6, #0
_0205BDF0:
	mov r1, #0
	cmp r4, #0
	ble _0205BE0C
	ldrh r5, [r2]
	add r3, sp, #4
_0205BDFA:
	ldrh r0, [r3]
	cmp r0, r5
	bne _0205BE04
	add r7, r7, #1
	b _0205BE0C
_0205BE04:
	add r1, r1, #1
	add r3, r3, #2
	cmp r1, r4
	blt _0205BDFA
_0205BE0C:
	add r6, r6, #1
	add r2, r2, #2
	cmp r6, #3
	blt _0205BDF0
	cmp r7, #3
	bne _0205BE1E
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205BE1E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205BE24: .word sRegiSpecies
	thumb_func_end Save_PlayerHasRegiInParty

	thumb_func_start sub_0205BE28
sub_0205BE28: ; 0x0205BE28
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetSys
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [sp]
	str r0, [sp, #8]
	ldrh r0, [r4, #0xe]
	ldr r5, [r4, #4]
	bl GF_SinDegNoWrap
	asr r1, r0, #0x1f
	asr r3, r5, #0x1f
	add r2, r5, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [sp]
	ldrh r0, [r4, #0xe]
	ldr r5, [r4, #8]
	bl GF_SinDegNoWrap
	asr r1, r0, #0x1f
	asr r3, r5, #0x1f
	add r2, r5, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [sp, #8]
	str r3, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0
	bl sub_0205F9A0
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0x10]
	add r0, r1, r0
	strh r0, [r4, #0xe]
	mov r0, #0x5a
	ldrh r1, [r4, #0xe]
	lsl r0, r0, #2
	cmp r1, r0
	blo _0205BEB0
	mov r0, #0
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	sub r0, r0, #1
	strh r0, [r4, #0xc]
_0205BEB0:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _0205BED2
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #4]
	str r0, [sp]
	ldr r0, [r4]
	add r1, sp, #0
	bl sub_0205F9A0
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0205BED2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_0205BE28

	thumb_func_start sub_0205BED8
sub_0205BED8: ; 0x0205BED8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl TaskManager_GetSys
	str r0, [sp]
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x14
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, sp, #8
	ldrh r0, [r0, #0x10]
	cmp r0, #0
	beq _0205BF12
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0205BF20
_0205BF12:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0205BF20:
	bl _ffix
	str r0, [r4, #4]
	add r0, sp, #8
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	beq _0205BF40
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0205BF4E
_0205BF40:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0205BF4E:
	bl _ffix
	str r0, [r4, #8]
	strh r6, [r4, #0xc]
	strh r7, [r4, #0x10]
	ldr r0, [sp]
	str r5, [r4]
	ldr r0, [r0, #0x10]
	ldr r1, _0205BF68 ; =sub_0205BE28
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205BF68: .word sub_0205BE28
	thumb_func_end sub_0205BED8

	thumb_func_start sub_0205BF6C
sub_0205BF6C: ; 0x0205BF6C
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl sub_0205F690
	ldrb r1, [r4, #8]
	add r0, r1, #1
	strb r0, [r4, #8]
	ldrh r0, [r4, #6]
	cmp r1, r0
	blt _0205BFB0
	ldrb r1, [r4, #9]
	mov r0, #1
	eor r0, r1
	strb r0, [r4, #9]
	mov r0, #0
	strb r0, [r4, #8]
	ldrh r1, [r4, #4]
	sub r0, r1, #1
	strh r0, [r4, #4]
	cmp r1, #0
	bne _0205BFB0
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_0205BFB0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0205BF6C

	thumb_func_start sub_0205BFB4
sub_0205BFB4: ; 0x0205BFB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl TaskManager_GetSys
	str r0, [sp]
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	strh r6, [r4, #4]
	strh r7, [r4, #6]
	str r5, [r4]
	mov r0, #0
	strb r0, [r4, #9]
	ldr r0, [sp]
	ldr r1, _0205BFEC ; =sub_0205BF6C
	ldr r0, [r0, #0x10]
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205BFEC: .word sub_0205BF6C
	thumb_func_end sub_0205BFB4
