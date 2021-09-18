	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC3B4:
	.short 0x58F3, 0x5CF4, 0x60F5, 0x68F9, 0x64FA, 0x6D7F
	.short 0x6D7E, 0x6D80, 0x7096, 0x717D, 0x717C
_020FC3CA:
	.short 0x0042, 0x0443, 0x0846
	.short 0x0C48, 0x104A, 0x144B, 0x1849, 0x1C4C, 0x2062, 0x2467, 0x2868
	.short 0x2C69, 0x306A, 0x346B, 0x386C, 0x3C6E, 0x4057, 0x4459, 0x4870
	.short 0x4C58, 0x5056, 0x5417, 0x5477, 0x8074, 0x8472, 0x7C75, 0x7876
	.short 0x887C, 0x7437, 0x743E, 0xAC2F, 0xB06D
_020FC40A:
	.short 0x000C, 0x045E
	.short 0x000D, 0x045E
	.short 0x000E, 0x045E
	.short 0x000F, 0x045E
	.short 0x0010, 0x045E
	.short 0x0011, 0x045E
	.short 0x0012, 0x045E
	.short 0x0013, 0x045E
	.short 0x0014, 0x0467
	.short 0x0015, 0x0467
	.short 0x0016, 0x0467
	.short 0x0017, 0x0467
	.short 0x0018, 0x0467
	.short 0x0019, 0x0467
	.short 0x001A, 0x0467
	.short 0x001B, 0x0467
	.short 0x001D, 0x045E
	.short 0x001E, 0x045E
	.short 0x001F, 0x045E
	.short 0x0020, 0x045E
	.short 0x0021, 0x0464
	.short 0x001C, 0x045F
	.short 0xFFFF, 0x0463
	.short 0xFFFF, 0x0462
	.short 0xFFFF, 0x0461
	.short 0x0023, 0x046C
	.short 0x0024, 0x046D
	.short 0x0022, 0x0496
	.short 0x0022, 0x0465
	.short 0x0027, 0x0460
	.short 0x0028, 0x0460
	.short 0x0029, 0x0460
	.short 0x002A, 0x0460
	.short 0x002B, 0x0460
	.short 0x002C, 0x0460
	.short 0x0025, 0x045D
	.short 0x0025, 0x045D
	.short 0x0026, 0x045D
	.short 0x0026, 0x045C
	.short 0x0025, 0x047B
	.short 0x0026, 0x045E
	.short 0xFFFF, 0x045D
	.short 0xFFFF, 0x045C
	.short 0x002D, 0x045D
	.short 0x002E, 0x0464

	.text

	thumb_func_start sub_020517A4
sub_020517A4: ; 0x020517A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0x2d
	blo _020517B2
	bl GF_AssertFail
_020517B2:
	ldr r0, _020517C8 ; =_020FC40A
	lsl r1, r5, #2
	ldrh r0, [r0, r1]
	ldr r1, _020517CC ; =0x0000FFFF
	cmp r0, r1
	bne _020517C4
	add r0, r4, #0
	bl ov01_021F0D20
_020517C4:
	pop {r3, r4, r5, pc}
	nop
_020517C8: .word _020FC40A
_020517CC: .word 0x0000FFFF
	thumb_func_end sub_020517A4

	thumb_func_start sub_020517D0
sub_020517D0: ; 0x020517D0
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x2d
	blo _020517DC
	bl GF_AssertFail
_020517DC:
	ldr r0, _020517E4 ; =_020FC40A + 2
	lsl r1, r4, #2
	ldrh r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_020517E4: .word _020FC40A + 2
	thumb_func_end sub_020517D0

	thumb_func_start sub_020517E8
sub_020517E8: ; 0x020517E8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02051738
	add r1, r4, #0
	bl sub_020517A4
	pop {r4, pc}
	thumb_func_end sub_020517E8

	thumb_func_start sub_020517F8
sub_020517F8: ; 0x020517F8
	mov r0, #1
	bx lr
	thumb_func_end sub_020517F8

	thumb_func_start sub_020517FC
sub_020517FC: ; 0x020517FC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02051738
	add r1, r5, #0
	add r6, r0, #0
	bl sub_020517D0
	add r4, r0, #0
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl SavArray_Flags_get
	mov r1, #2
	mov r2, #5
	bl sub_02066930
	cmp r0, #1
	bne _0205185C
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl MapHeader_IsKanto
	cmp r0, #0
	beq _0205185C
	ldr r1, _02051860 ; =0x0000045C
	cmp r4, r1
	bne _0205183E
	add r4, r1, #0
	add r4, #9
	b _0205185C
_0205183E:
	add r0, r1, #1
	cmp r4, r0
	bne _0205184A
	add r4, r1, #0
	add r4, #0xa
	b _0205185C
_0205184A:
	add r0, r1, #2
	cmp r4, r0
	bne _0205185C
	add r0, r6, #0
	bl sub_020517F8
	cmp r0, #0
	bne _0205185C
	ldr r4, _02051864 ; =0x00000467
_0205185C:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02051860: .word 0x0000045C
_02051864: .word 0x00000467
	thumb_func_end sub_020517FC

	thumb_func_start sub_02051868
sub_02051868: ; 0x02051868
	ldr r3, _02051890 ; =_020FC3CA
	mov r2, #0
_0205186C:
	ldrh r1, [r3]
	lsl r1, r1, #0x16
	lsr r1, r1, #0x16
	cmp r0, r1
	bne _02051882
	ldr r0, _02051890 ; =_020FC3CA
	lsl r1, r2, #1
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1a
	bx lr
_02051882:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x20
	blo _0205186C
	mov r0, #0x29
	bx lr
	nop
_02051890: .word _020FC3CA
	thumb_func_end sub_02051868

	thumb_func_start sub_02051894
sub_02051894: ; 0x02051894
	push {r4, lr}
	add r4, r1, #0
	bl GetFirstAliveMonInParty_CrashIfNone
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r4, #0x6d
	bne _020518AC
	mov r0, #0x2a
	pop {r4, pc}
_020518AC:
	ldr r3, _020518D4 ; =_020FC3B4
	mov r2, #0
_020518B0:
	ldrh r1, [r3]
	lsl r1, r1, #0x16
	lsr r1, r1, #0x16
	cmp r0, r1
	bne _020518C6
	ldr r0, _020518D4 ; =_020FC3B4
	lsl r1, r2, #1
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1a
	pop {r4, pc}
_020518C6:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0xb
	blo _020518B0
	mov r0, #0x2a
	pop {r4, pc}
	nop
_020518D4: .word _020FC3B4
	thumb_func_end sub_02051894
