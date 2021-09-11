	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F67DC:
	.short 0x0001, 0x0001
	.short 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0002, 0x0002, 0x0002
	.short 0x0002, 0x0003, 0x0003, 0x0007, 0x0007, 0x0007, 0x000A, 0x000A
	.short 0x000B, 0x000B, 0x000B, 0x0014, 0x001E, 0x0023, 0x0028, 0x01F4
	.short 0x2710, 0x0007, 0x0007, 0x0007, 0x0007, 0x03E8, 0x000B, 0x0014
	.short 0x000A, 0x000F, 0x000B, 0x000B, 0x000A, 0x000A

	.text

	thumb_func_start GameStats_sizeof
GameStats_sizeof: ; 0x0202CF1C
	mov r0, #7
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end GameStats_sizeof

	thumb_func_start GameStats_init
GameStats_init: ; 0x0202CF24
	push {r4, lr}
	add r4, r0, #0
	mov r2, #7
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #6
	bl MIi_CpuClear32
	ldr r1, _0202CF4C ; =0x027FFC3C ; HW_VBLANK_COUNT_BUF
	ldr r0, [r1]
	ldr r1, [r1]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0202CF50 ; =0x000001BE
	strh r1, [r4, r0]
	add r0, r4, #0
	mov r1, #2
	bl sub_0202CF60
	pop {r4, pc}
	.balign 4, 0
_0202CF4C: .word 0x027FFC3C ; HW_VBLANK_COUNT_BUF
_0202CF50: .word 0x000001BE
	thumb_func_end GameStats_init

	thumb_func_start Sav2_GameStats_get
Sav2_GameStats_get: ; 0x0202CF54
	ldr r3, _0202CF5C ; =SavArray_get
	mov r1, #0x10
	bx r3
	nop
_0202CF5C: .word SavArray_get
	thumb_func_end Sav2_GameStats_get

	thumb_func_start sub_0202CF60
sub_0202CF60: ; 0x0202CF60
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	ble _0202CF8E
	mov r1, #0x6d
	add r0, #8
	lsl r1, r1, #2
	bl sub_0201FF28
	mov r3, #0x6f
	lsl r3, r3, #2
	strh r0, [r4, r3]
	add r1, r3, #0
	ldrh r2, [r4, r3]
	add r3, r3, #2
	ldrh r3, [r4, r3]
	add r0, r4, #0
	add r0, #8
	lsl r3, r3, #0x10
	sub r1, #8
	add r2, r2, r3
	bl sub_0201FF44
_0202CF8E:
	pop {r4, pc}
	thumb_func_end sub_0202CF60

	thumb_func_start sub_0202CF90
sub_0202CF90: ; 0x0202CF90
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	ble _0202CFB2
	mov r1, #0x6d
	lsl r1, r1, #2
	add r2, r1, #0
	add r2, #8
	ldrh r3, [r4, r2]
	add r2, r1, #0
	add r2, #0xa
	ldrh r2, [r4, r2]
	add r0, #8
	lsl r2, r2, #0x10
	add r2, r3, r2
	bl sub_0201FF70
_0202CFB2:
	pop {r4, pc}
	thumb_func_end sub_0202CF90

	thumb_func_start sub_0202CFB4
sub_0202CFB4: ; 0x0202CFB4
	push {r3, lr}
	cmp r1, #0x48
	bge _0202CFC0
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	pop {r3, pc}
_0202CFC0:
	cmp r1, #0x95
	bge _0202CFD2
	sub r1, #0x48
	lsl r1, r1, #1
	add r1, r0, r1
	mov r0, #0x12
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	pop {r3, pc}
_0202CFD2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202CFB4

	thumb_func_start sub_0202CFDC
sub_0202CFDC: ; 0x0202CFDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x48
	bge _0202CFEC
	lsl r0, r4, #2
	str r2, [r5, r0]
	b _0202D004
_0202CFEC:
	cmp r4, #0x95
	bge _0202D000
	add r0, r4, #0
	sub r0, #0x48
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0x12
	lsl r0, r0, #4
	strh r2, [r1, r0]
	b _0202D004
_0202D000:
	bl GF_AssertFail
_0202D004:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFB4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202CFDC

	thumb_func_start sub_0202D010
sub_0202D010: ; 0x0202D010
	push {r3, lr}
	cmp r0, #0x48
	bge _0202D026
	ldr r1, _0202D044 ; =0x0210F864
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0202D022
	ldr r0, _0202D048 ; =0x3B9AC9FF
	pop {r3, pc}
_0202D022:
	ldr r0, _0202D04C ; =0x000F423F
	pop {r3, pc}
_0202D026:
	cmp r0, #0x95
	bge _0202D03A
	ldr r1, _0202D044 ; =0x0210F864
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0202D036
	ldr r0, _0202D050 ; =0x0000FFFF
	pop {r3, pc}
_0202D036:
	ldr r0, _0202D054 ; =0x0000270F
	pop {r3, pc}
_0202D03A:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_0202D044: .word 0x0210F864
_0202D048: .word 0x3B9AC9FF
_0202D04C: .word 0x000F423F
_0202D050: .word 0x0000FFFF
_0202D054: .word 0x0000270F
	thumb_func_end sub_0202D010

	thumb_func_start sub_0202D058
sub_0202D058: ; 0x0202D058
	lsl r1, r0, #1
	ldr r0, _0202D060 ; =_020F67DC
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_0202D060: .word _020F67DC
	thumb_func_end sub_0202D058

	thumb_func_start sub_0202D064
sub_0202D064: ; 0x0202D064
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl sub_0202D010
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF90
	cmp r6, r7
	bhs _0202D08C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202CFDC
	b _0202D096
_0202D08C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_0202CFDC
_0202D096:
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF60
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202D064

	thumb_func_start sub_0202D0A4
sub_0202D0A4: ; 0x0202D0A4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r7, r2, #0
	bl sub_0202D010
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202CF90
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202CFB4
	str r0, [sp]
	cmp r7, r4
	bls _0202D0CC
	add r7, r4, #0
_0202D0CC:
	ldr r0, [sp]
	cmp r0, r7
	bhs _0202D0E0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl sub_0202CFDC
	str r0, [sp]
	b _0202D0F0
_0202D0E0:
	cmp r0, r4
	bls _0202D0F0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0202CFDC
	str r0, [sp]
_0202D0F0:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202CF60
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202D0A4

	thumb_func_start sub_0202D0FC
sub_0202D0FC: ; 0x0202D0FC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0202D010
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF90
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFB4
	add r2, r0, #1
	cmp r2, r6
	bhs _0202D12A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFDC
	b _0202D134
_0202D12A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202CFDC
_0202D134:
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF60
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202D0FC

	thumb_func_start sub_0202D144
sub_0202D144: ; 0x0202D144
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r7, r2, #0
	bl sub_0202D010
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF90
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFB4
	add r2, r0, r7
	cmp r2, r6
	bhs _0202D174
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CFDC
	b _0202D17E
_0202D174:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202CFDC
_0202D17E:
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202CF60
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202D144

	thumb_func_start sub_0202D18C
sub_0202D18C: ; 0x0202D18C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	bl sub_0202D010
	add r4, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0202CF90
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0202CFB4
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0202CF60
	cmp r6, r4
	bhi _0202D1BA
	add r4, r6, #0
_0202D1BA:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202D18C

	thumb_func_start sub_0202D1C0
sub_0202D1C0: ; 0x0202D1C0
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #0x28
	blt _0202D1CE
	bl GF_AssertFail
_0202D1CE:
	add r0, r5, #0
	mov r1, #2
	bl sub_0202D18C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202D058
	ldr r2, _0202D204 ; =0x05F5E0FF
	add r0, r4, r0
	cmp r0, r2
	bls _0202D1F0
	add r0, r5, #0
	mov r1, #2
	bl sub_0202D064
	pop {r4, r5, r6, pc}
_0202D1F0:
	add r0, r6, #0
	bl sub_0202D058
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl sub_0202D144
	pop {r4, r5, r6, pc}
	nop
_0202D204: .word 0x05F5E0FF
	thumb_func_end sub_0202D1C0

	thumb_func_start sub_0202D208
sub_0202D208: ; 0x0202D208
	ldr r3, _0202D210 ; =sub_0202D18C
	mov r1, #2
	bx r3
	nop
_0202D210: .word sub_0202D18C
	thumb_func_end sub_0202D208

	thumb_func_start GameStats_IncSpeciesCaught
GameStats_IncSpeciesCaught: ; 0x0202D214
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	bne _0202D22C
	add r0, r4, #0
	mov r1, #0x15
	bl sub_0202D1C0
_0202D22C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GameStats_IncSpeciesCaught
