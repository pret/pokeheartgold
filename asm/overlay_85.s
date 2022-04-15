	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov85_021E5900
ov85_021E5900: ; 0x021E5900
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #2
	bl sub_0201A728
	mov r2, #2
	mov r0, #3
	mov r1, #0x66
	lsl r2, r2, #0x12
	bl CreateHeap
	ldr r1, _021E5A28 ; =0x00000DCC
	add r0, r5, #0
	mov r2, #0x66
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E5A28 ; =0x00000DCC
	add r6, r0, #0
	mov r1, #0
	bl memset
	add r0, r6, #0
	str r6, [r4, #0x34]
	add r0, #0xcc
	str r4, [r0]
	add r0, r6, #0
	ldr r1, [r4, #0x30]
	add r0, #0xd0
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xcc
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bl SavArray_PlayerParty_get
	str r0, [r6, #0x24]
	mov r0, #0xbb
	mov r1, #0x66
	bl NARC_ctor
	mov r1, #0x36
	lsl r1, r1, #6
	str r0, [r6, r1]
	mov r0, #8
	mov r1, #0x66
	bl GF_CreateVramTransferManager
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r6, #0
	bl ov85_021E678C
	ldr r0, _021E5A2C ; =ov85_021E6764
	add r1, r6, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl ov85_021E752C
	add r0, r6, #0
	bl ov85_021E7650
	mov r4, #0
	add r5, r4, #0
	bl sub_0203769C
	add r1, r6, #0
	add r1, #0xd4
	mov ip, r1
	add r1, r6, #0
	add r1, #0xcc
	ldr r7, [r1]
	mov r3, #1
	ldr r1, [r7, #0xc]
_021E59B6:
	add r2, r3, #0
	lsl r2, r4
	tst r2, r1
	beq _021E59C4
	cmp r4, r0
	beq _021E59CA
	add r5, r5, #1
_021E59C4:
	add r4, r4, #1
	cmp r4, #5
	blt _021E59B6
_021E59CA:
	ldr r1, [r7, #8]
	mov r0, #0xa
	add r2, r1, #0
	mul r2, r0
	ldr r0, _021E5A30 ; =ov85_021EA788
	lsl r1, r5, #1
	add r0, r0, r2
	ldrh r0, [r1, r0]
	lsl r1, r0, #0xc
	mov r0, ip
	str r1, [r0, #0x40]
	bl GF_GetCurrentPlayingBGM
	str r0, [r6, #0x1c]
	add r0, r6, #0
	bl ov85_021E7D08
	add r0, r6, #0
	bl ov85_021E7E3C
	add r0, r6, #0
	bl ov85_021E7F74
	add r0, r6, #0
	bl ov85_021E80E0
	add r0, r6, #0
	bl ov85_021E82F8
	add r0, r6, #0
	bl ov85_021E83E0
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x66
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E5A28: .word 0x00000DCC
_021E5A2C: .word ov85_021E6764
_021E5A30: .word ov85_021EA788
	thumb_func_end ov85_021E5900

	thumb_func_start ov85_021E5A34
ov85_021E5A34: ; 0x021E5A34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_02021238
	cmp r0, #1
	beq _021E5A4A
	bl GF_AssertFail
_021E5A4A:
	add r0, r4, #0
	bl ov85_021E7D40
	add r0, r4, #0
	bl ov85_021E7E78
	add r0, r4, #0
	bl ov85_021E7FB0
	add r0, r4, #0
	bl ov85_021E8118
	add r0, r4, #0
	bl ov85_021E833C
	add r0, r4, #0
	bl ov85_021E8418
	add r0, r4, #0
	bl ov85_021E75B8
	add r0, r4, #0
	bl ov85_021E7658
	add r0, r4, #0
	bl ov85_021E67CC
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl GF_DestroyVramTransferManager
	mov r0, #0x36
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl NARC_dtor
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x66
	bl DestroyHeap
	mov r0, #2
	bl sub_0201A738
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E5A34

	thumb_func_start ov85_021E5AAC
ov85_021E5AAC: ; 0x021E5AAC
	push {r3, r4, r5, lr}
	bl OverlayManager_GetData
	add r5, r0, #0
	bl ov85_021E74AC
	ldr r4, _021E5AEC ; =ov85_021EA800
_021E5ABA:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _021E5ABA
	cmp r0, #2
	bne _021E5AD0
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5AD0:
	add r0, r5, #0
	bl ov85_021E75C8
	add r0, r5, #0
	bl ov85_021E7798
	add r0, r5, #0
	bl ov85_021E67F4
	add r0, r5, #0
	bl ov85_021E5AF0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5AEC: .word ov85_021EA800
	thumb_func_end ov85_021E5AAC

	thumb_func_start ov85_021E5AF0
ov85_021E5AF0: ; 0x021E5AF0
	mov r1, #0
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bx lr
	thumb_func_end ov85_021E5AF0

	thumb_func_start ov85_021E5AF8
ov85_021E5AF8: ; 0x021E5AF8
	push {r4, lr}
	mov r1, #0
	add r4, r0, #0
	bl ov85_021E7194
	mov r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5AF8

	thumb_func_start ov85_021E5B0C
ov85_021E5B0C: ; 0x021E5B0C
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5B2C
	bl sub_0203769C
	cmp r0, #0
	bne _021E5B24
	mov r0, #2
	b _021E5B26
_021E5B24:
	mov r0, #8
_021E5B26:
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E5B2C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5B0C

	thumb_func_start ov85_021E5B30
ov85_021E5B30: ; 0x021E5B30
	push {r4, lr}
	add r4, r0, #0
	bl ov85_021E8628
	cmp r0, #0
	beq _021E5B44
	mov r0, #3
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E5B44:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5B30

	thumb_func_start ov85_021E5B48
ov85_021E5B48: ; 0x021E5B48
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #1
	add r0, sp, #0
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #8
	add r2, sp, #0
	mov r3, #2
	bl sub_02096D4C
	cmp r0, #1
	bne _021E5B72
	mov r0, #4
	str r0, [r4]
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_021E5B72:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov85_021E5B48

	thumb_func_start ov85_021E5B78
ov85_021E5B78: ; 0x021E5B78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov85_021E8660
	add r5, r0, #1
	bl sub_02037454
	cmp r5, r0
	beq _021E5B8E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5B8E:
	mov r0, #5
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5B78

	thumb_func_start ov85_021E5B98
ov85_021E5B98: ; 0x021E5B98
	push {r4, lr}
	add r4, r0, #0
	bl ov85_021E8660
	add r0, r0, #1
	str r0, [r4, #0x30]
	add r0, r4, #0
	add r0, #0xd0
	add r2, r4, #0
	ldr r0, [r0]
	mov r1, #0xd
	add r2, #0x30
	mov r3, #4
	bl sub_02096D4C
	cmp r0, #1
	bne _021E5BC2
	mov r0, #0
	str r0, [r4, #0x14]
	mov r0, #6
	str r0, [r4]
_021E5BC2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5B98

	thumb_func_start ov85_021E5BC8
ov85_021E5BC8: ; 0x021E5BC8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r3, [r4, #0x14]
	cmp r3, #0
	bne _021E5BFC
	mov r1, #0
	add r0, sp, #0
	strh r1, [r0, #2]
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #0xc
	add r2, sp, #0
	mov r3, #4
	bl sub_02096D4C
	cmp r0, #1
	bne _021E5BF6
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
_021E5BF6:
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_021E5BFC:
	add r2, r4, #0
	add r2, #0xd0
	ldr r2, [r2]
	mov r0, #1
	add r2, #0x42
	ldrh r2, [r2]
	add r1, r0, #0
	add r5, r0, #0
_021E5C0C:
	add r6, r5, #0
	lsl r6, r0
	tst r6, r2
	beq _021E5C3E
	cmp r1, r3
	blt _021E5C3C
	add r1, sp, #0
	strh r0, [r1, #2]
	ldr r0, [r4, #0x14]
	add r2, sp, #0
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #0xc
	mov r3, #4
	bl sub_02096D4C
	cmp r0, #1
	bne _021E5C44
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	b _021E5C44
_021E5C3C:
	add r1, r1, #1
_021E5C3E:
	add r0, r0, #1
	cmp r0, #5
	blt _021E5C0C
_021E5C44:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	blt _021E5C50
	mov r0, #7
	str r0, [r4]
_021E5C50:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5BC8

	thumb_func_start ov85_021E5C58
ov85_021E5C58: ; 0x021E5C58
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #8
	add r0, sp, #0
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r2, sp, #0
	mov r3, #2
	bl sub_02096D4C
	cmp r0, #1
	bne _021E5C7A
	mov r0, #0xa
	str r0, [r4]
_021E5C7A:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov85_021E5C58

	thumb_func_start ov85_021E5C80
ov85_021E5C80: ; 0x021E5C80
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xd0
	mov r2, #0
	ldr r0, [r0]
	mov r1, #9
	add r3, r2, #0
	bl sub_02096D4C
	cmp r0, #1
	bne _021E5CA0
	mov r0, #0
	str r0, [r4, #0x10]
	mov r1, #9
	str r1, [r4]
	pop {r4, pc}
_021E5CA0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5C80

	thumb_func_start ov85_021E5CA4
ov85_021E5CA4: ; 0x021E5CA4
	push {r4, lr}
	mov r1, #8
	add r4, r0, #0
	bl ov85_021E8614
	cmp r0, #1
	bne _021E5CCA
	ldr r0, [r4, #0x30]
	cmp r0, #2
	bge _021E5CBC
	bl GF_AssertFail
_021E5CBC:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _021E5CC6
	bl GF_AssertFail
_021E5CC6:
	mov r0, #0xa
	str r0, [r4]
_021E5CCA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5CA4

	thumb_func_start ov85_021E5CD0
ov85_021E5CD0: ; 0x021E5CD0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xca
	bl sub_02037AC0
	mov r0, #0xb
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5CD0

	thumb_func_start ov85_021E5CE4
ov85_021E5CE4: ; 0x021E5CE4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xca
	bl sub_02037B38
	cmp r0, #0
	beq _021E5CF6
	mov r0, #0xc
	str r0, [r4]
_021E5CF6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5CE4

	thumb_func_start ov85_021E5CFC
ov85_021E5CFC: ; 0x021E5CFC
	push {r4, lr}
	add r4, r0, #0
	add r2, r4, #0
	add r2, #0xcc
	add r0, #0xd0
	ldr r2, [r2]
	ldr r0, [r0]
	mov r1, #0xe
	add r2, r2, #4
	mov r3, #4
	bl sub_02096D4C
	cmp r0, #0
	beq _021E5D1C
	mov r0, #0xd
	str r0, [r4]
_021E5D1C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5CFC

	thumb_func_start ov85_021E5D20
ov85_021E5D20: ; 0x021E5D20
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0x59
	ldr r1, [r4, #0x24]
	mov r0, #0x83
	lsl r2, r2, #4
	bl sub_02036FD8
	cmp r0, #0
	beq _021E5D38
	mov r0, #0xe
	str r0, [r4]
_021E5D38:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5D20

	thumb_func_start ov85_021E5D3C
ov85_021E5D3C: ; 0x021E5D3C
	push {r4, lr}
	add r4, r0, #0
	bl ov85_021E8720
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bne _021E5D7E
	add r0, r4, #0
	bl ov85_021E8834
	cmp r0, #1
	bne _021E5D6A
	add r0, r4, #0
	add r0, #0xd0
	mov r2, #0
	ldr r0, [r0]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_02096D4C
	mov r0, #0x2e
	str r0, [r4]
	b _021E5D7E
_021E5D6A:
	add r0, r4, #0
	add r0, #0xd0
	mov r2, #0
	ldr r0, [r0]
	mov r1, #0x11
	add r3, r2, #0
	bl sub_02096D4C
	mov r0, #0xf
	str r0, [r4]
_021E5D7E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5D3C

	thumb_func_start ov85_021E5D84
ov85_021E5D84: ; 0x021E5D84
	push {r4, lr}
	add r4, r0, #0
	bl ov85_021E8898
	cmp r0, #1
	bne _021E5D96
	mov r0, #0x2e
	str r0, [r4]
	b _021E5DA6
_021E5D96:
	add r0, r4, #0
	bl ov85_021E8878
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bne _021E5DA6
	mov r0, #0x10
	str r0, [r4]
_021E5DA6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5D84

	thumb_func_start ov85_021E5DAC
ov85_021E5DAC: ; 0x021E5DAC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r1, #0x18
	bl ov85_021E85F0
	add r7, r0, #0
	ldr r0, [r6, #0x2c]
	ldr r2, _021E5E28 ; =ov85_021EA788
	str r0, [r7, #0x10]
	ldr r1, [r6, #0x30]
	mov r0, #0xa
	add r3, r1, #0
	str r1, [r7, #0x14]
	mul r3, r0
	ldr r0, [r6, #0x2c]
	mov r4, #0
	lsl r1, r0, #1
	add r0, r2, r3
	ldrh r0, [r1, r0]
	add r5, r6, #0
	str r0, [r7, #4]
_021E5DD6:
	add r0, r6, #0
	add r1, r4, #0
	bl ov85_021E86B0
	cmp r0, #0
	beq _021E5DFE
	add r0, r4, #0
	bl sub_02034818
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x84
	add r1, #0x98
	ldr r0, [r0]
	ldr r1, [r1]
	bl PlayerName_FlatToString
_021E5DFE:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _021E5DD6
	ldr r0, [r7, #4]
	mov r2, #1
	lsl r1, r0, #0xc
	mov r0, #0x45
	lsl r0, r0, #2
	str r1, [r6, r0]
	mov r0, #0x11
	str r0, [r6]
	ldr r1, _021E5E2C ; =0x00000483
	mov r0, #0xf
	bl sub_02004EC4
	add r0, r6, #0
	bl ov85_021E72E8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5E28: .word ov85_021EA788
_021E5E2C: .word 0x00000483
	thumb_func_end ov85_021E5DAC

	thumb_func_start ov85_021E5E30
ov85_021E5E30: ; 0x021E5E30
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #0xc]
	sub r1, r1, #1
	str r1, [r5, #0xc]
	cmp r1, #0
	ble _021E5E46
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021E5E46:
	mov r1, #0xf
	str r1, [r5, #0xc]
	bl ov85_021E8610
	add r4, r0, #0
	ldr r1, [r4, #0x14]
	mov r0, #0xa
	add r3, r1, #0
	ldr r2, [r4, #0x10]
	mul r3, r0
	ldr r0, _021E5EB0 ; =ov85_021EA7C4
	lsl r1, r2, #1
	add r0, r0, r3
	ldrh r0, [r1, r0]
	str r0, [sp]
	ldr r0, [r4, #4]
	str r0, [sp, #4]
	mov r0, #0x2d
	lsl r0, r0, #4
	add r1, r5, r0
	mov r0, #0xb0
	mul r0, r2
	add r0, r1, r0
	str r0, [sp, #8]
	lsl r1, r2, #2
	add r1, r5, r1
	add r1, #0x72
	ldrh r1, [r1]
	ldr r3, [r4]
	add r0, r5, #0
	bl ov85_021E7B40
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	bl _s32_div_f
	str r1, [r4, #0x10]
	ldr r0, [r4]
	add r1, r0, #1
	str r1, [r4]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021E5EA8
	mov r0, #0
	str r0, [r5, #0xc]
	mov r0, #0x12
	str r0, [r5]
_021E5EA8:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E5EB0: .word ov85_021EA7C4
	thumb_func_end ov85_021E5E30

	thumb_func_start ov85_021E5EB4
ov85_021E5EB4: ; 0x021E5EB4
	push {r3, r4, r5, r6}
	mov r1, #0x19
	mov r3, #0
	lsl r1, r1, #4
	add r6, r0, r1
	ldr r5, [r0, #0x30]
	add r4, r3, #0
	sub r1, #0x48
_021E5EC4:
	ldr r2, [r6, r1]
	cmp r2, #1
	bne _021E5ECC
	add r4, r4, #1
_021E5ECC:
	add r3, r3, #1
	add r6, #0xb0
	cmp r3, r5
	blt _021E5EC4
	cmp r4, r5
	bne _021E5EE2
	mov r1, #0x13
	str r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_021E5EE2:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov85_021E5EB4

	thumb_func_start ov85_021E5EE8
ov85_021E5EE8: ; 0x021E5EE8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x1e
	ble _021E5F0C
	mov r0, #0
	str r0, [r4, #0xc]
	bl sub_0203769C
	cmp r0, #0
	bne _021E5F08
	mov r0, #0x14
	str r0, [r4]
	b _021E5F0C
_021E5F08:
	mov r0, #0x15
	str r0, [r4]
_021E5F0C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5EE8

	thumb_func_start ov85_021E5F10
ov85_021E5F10: ; 0x021E5F10
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #4
	add r0, sp, #0
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #8
	add r2, sp, #0
	mov r3, #2
	bl sub_02096D4C
	cmp r0, #1
	bne _021E5F34
	mov r0, #0x16
	str r0, [r4]
_021E5F34:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5F10

	thumb_func_start ov85_021E5F3C
ov85_021E5F3C: ; 0x021E5F3C
	push {r4, lr}
	mov r1, #4
	add r4, r0, #0
	bl ov85_021E8614
	cmp r0, #1
	bne _021E5F52
	mov r0, #0x16
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E5F52:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5F3C

	thumb_func_start ov85_021E5F58
ov85_021E5F58: ; 0x021E5F58
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xca
	bl sub_02037AC0
	mov r0, #0x17
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5F58

	thumb_func_start ov85_021E5F6C
ov85_021E5F6C: ; 0x021E5F6C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xca
	bl sub_02037B38
	cmp r0, #0
	beq _021E5F7E
	mov r0, #0x18
	str r0, [r4]
_021E5F7E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5F6C

	thumb_func_start ov85_021E5F84
ov85_021E5F84: ; 0x021E5F84
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	bl ov85_021E84EC
	add r0, r4, #0
	bl ov85_021E81E0
	mov r0, #0x19
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5F84

	thumb_func_start ov85_021E5F9C
ov85_021E5F9C: ; 0x021E5F9C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0x5f
	bge _021E5FAE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5FAE:
	ldr r0, [r5, #0x30]
	mov r4, #0
	cmp r0, #0
	ble _021E5FC6
_021E5FB6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov85_021E7400
	ldr r0, [r5, #0x30]
	add r4, r4, #1
	cmp r4, r0
	blt _021E5FB6
_021E5FC6:
	mov r0, #0
	str r0, [r5, #0xc]
	mov r1, #0x1a
	str r1, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E5F9C

	thumb_func_start ov85_021E5FD0
ov85_021E5FD0: ; 0x021E5FD0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203769C
	mov r0, #0x1b
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E5FD0

	thumb_func_start ov85_021E5FE0
ov85_021E5FE0: ; 0x021E5FE0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov85_021E8570
	cmp r0, #1
	bne _021E6002
	add r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6002
	mov r0, #0x1d
	str r0, [r4]
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6002:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _021E6018
	add r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6018
	add r0, r4, #0
	bl ov85_021E8128
_021E6018:
	add r0, r4, #0
	bl ov85_021E834C
	cmp r0, #0
	bne _021E6046
	add r0, r4, #0
	bl ov85_021E750C
	cmp r0, #1
	bne _021E6046
	add r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6040
	add r0, r4, #0
	bl ov85_021E8128
	mov r0, #1
	str r0, [r4, #0x38]
_021E6040:
	add r0, r4, #0
	bl ov85_021E8358
_021E6046:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _021E6068
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	add r2, r4, #0
	ldr r0, [r0, #0x30]
	mov r1, #0xa
	add r2, #0x38
	mov r3, #1
	bl sub_02096D4C
	cmp r0, #1
	bne _021E6068
	mov r0, #0
	str r0, [r4, #0x38]
_021E6068:
	add r0, r4, #0
	mov r1, #0x4b
	ldr r2, [r4, #8]
	add r0, #0xd4
	lsl r1, r1, #2
	cmp r2, r1
	ldr r2, [r0, #0x48]
	bge _021E6088
	mov r1, #0xe
	add r2, #0xbf
	lsl r1, r1, #0xc
	str r2, [r0, #0x48]
	cmp r2, r1
	blt _021E6096
	str r1, [r0, #0x48]
	b _021E6096
_021E6088:
	mov r1, #1
	sub r2, #0xbf
	lsl r1, r1, #0xe
	str r2, [r0, #0x48]
	cmp r2, r1
	bge _021E6096
	str r1, [r0, #0x48]
_021E6096:
	ldr r5, [r0, #0x48]
	add r0, r4, #0
	bl ov85_021E8144
	cmp r0, #1
	bne _021E60AE
	add r0, r4, #0
	add r0, #0xd4
	lsl r1, r5, #1
	bl ov85_021E7644
	b _021E60B6
_021E60AE:
	add r0, r4, #0
	add r1, r5, #0
	bl ov85_021E8558
_021E60B6:
	ldr r0, [r4, #8]
	add r2, sp, #0
	mov r1, #0x47
	strh r0, [r2, #2]
	lsl r1, r1, #2
	ldr r3, [r4, r1]
	sub r1, #0xc
	asr r0, r3, #0xb
	lsr r0, r0, #0x14
	add r0, r3, r0
	asr r0, r0, #0xc
	strh r0, [r2, #4]
	ldr r1, [r4, r1]
	add r4, #0xd0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r2, #6]
	ldr r0, [r4]
	mov r1, #0xb
	add r2, sp, #0
	mov r3, #8
	bl sub_02096D4C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E5FE0

	thumb_func_start ov85_021E60F0
ov85_021E60F0: ; 0x021E60F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #1
	bne _021E611A
	add r0, r4, #0
	add r0, #0x5e
	ldrh r0, [r0]
	lsl r1, r0, #0xc
	mov r0, #0x11
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0x5c
	ldrsh r1, [r4, r0]
	add r0, #0xc0
	lsl r1, r1, #0xc
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x5a
	ldrh r0, [r0]
	str r0, [r4, #8]
_021E611A:
	add r0, r4, #0
	bl ov85_021E8570
	cmp r0, #1
	bne _021E6136
	add r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6136
	mov r0, #0x1d
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E6136:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _021E614C
	add r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E614C
	add r0, r4, #0
	bl ov85_021E8128
_021E614C:
	add r0, r4, #0
	bl ov85_021E834C
	cmp r0, #0
	bne _021E617A
	add r0, r4, #0
	bl ov85_021E750C
	cmp r0, #1
	bne _021E617A
	add r0, r4, #0
	bl ov85_021E8150
	cmp r0, #0
	bne _021E6174
	add r0, r4, #0
	bl ov85_021E8128
	mov r0, #1
	str r0, [r4, #0x38]
_021E6174:
	add r0, r4, #0
	bl ov85_021E8358
_021E617A:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _021E619C
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	add r2, r4, #0
	ldr r0, [r0, #0x30]
	mov r1, #0xa
	add r2, #0x38
	mov r3, #1
	bl sub_02096D4C
	cmp r0, #1
	bne _021E619C
	mov r0, #0
	str r0, [r4, #0x38]
_021E619C:
	add r0, r4, #0
	bl ov85_021E8144
	cmp r0, #1
	bne _021E61B8
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r0, #0xd4
	lsl r1, r1, #1
	bl ov85_021E7644
	b _021E61C4
_021E61B8:
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov85_021E8558
_021E61C4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E60F0

	thumb_func_start ov85_021E61C8
ov85_021E61C8: ; 0x021E61C8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl ov85_021E84EC
	add r0, r4, #0
	bl ov85_021E7958
	str r0, [r4, #0x28]
	bl sub_0203769C
	ldr r1, [r4, #0x28]
	ldr r1, [r1, #0xc]
	cmp r1, r0
	bne _021E61EA
	mov r0, #0x1e
	b _021E61EC
_021E61EA:
	mov r0, #0x1f
_021E61EC:
	str r0, [r4]
	ldr r0, _021E61F8 ; =0x000005F1
	bl PlaySE
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021E61F8: .word 0x000005F1
	thumb_func_end ov85_021E61C8

	thumb_func_start ov85_021E61FC
ov85_021E61FC: ; 0x021E61FC
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	lsl r1, r1, #0xe
	bl ov85_021E8558
	add r0, r4, #0
	bl ov85_021E7958
	str r0, [r4, #0x28]
	bl sub_0203769C
	ldr r1, [r4, #0x28]
	ldr r1, [r1, #0xc]
	cmp r1, r0
	beq _021E6220
	mov r0, #0x1f
	str r0, [r4]
_021E6220:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E61FC

	thumb_func_start ov85_021E6224
ov85_021E6224: ; 0x021E6224
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	ldr r0, [r6, #0x28]
	ldr r2, [r6, #0x30]
	ldr r1, [r0, #0x1c]
	ldr r3, [r6, #0x2c]
	mov r0, #0xa
	mul r0, r2
	ldr r4, _021E629C ; =ov85_021EA7C4
	lsl r2, r3, #1
	add r0, r4, r0
	ldrh r0, [r2, r0]
	mov r5, #1
	lsl r5, r5, #0xe
	lsl r4, r0, #0xc
	str r1, [sp]
	sub r2, r4, r1
	bpl _021E6252
	mov r0, #0x5a
	lsl r0, r0, #0xe
	add r0, r4, r0
	sub r2, r0, r1
_021E6252:
	mov r0, #1
	lsl r0, r0, #0x10
	cmp r2, r0
	bgt _021E625C
	asr r5, r5, #1
_021E625C:
	cmp r2, r5
	bge _021E6262
	add r5, r2, #0
_021E6262:
	add r0, r6, #0
	add r0, #0xd4
	add r1, r5, #0
	bl ov85_021E7644
	add r0, r6, #0
	add r1, r5, #0
	bl ov85_021E78A4
	add r0, sp, #0
	add r1, r5, #0
	bl ov85_021E8530
	ldr r1, [sp]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r1, r0, #0xc
	asr r0, r4, #0xb
	lsr r0, r0, #0x14
	add r0, r4, r0
	asr r0, r0, #0xc
	cmp r1, r0
	bne _021E6296
	mov r0, #0x20
	str r0, [r6]
_021E6296:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E629C: .word ov85_021EA7C4
	thumb_func_end ov85_021E6224

	thumb_func_start ov85_021E62A0
ov85_021E62A0: ; 0x021E62A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xca
	bl sub_02037AC0
	mov r0, #0x21
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E62A0

	thumb_func_start ov85_021E62B4
ov85_021E62B4: ; 0x021E62B4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xca
	bl sub_02037B38
	cmp r0, #0
	beq _021E62D4
	bl sub_0203769C
	cmp r0, #0
	bne _021E62D0
	mov r0, #0x22
	str r0, [r4]
	b _021E62D4
_021E62D0:
	mov r0, #0x23
	str r0, [r4]
_021E62D4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E62B4

	thumb_func_start ov85_021E62D8
ov85_021E62D8: ; 0x021E62D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	mov r7, #0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r1, r0, #0xc
	add r0, sp, #0
	strh r1, [r0]
	str r7, [r5, #0x20]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	ble _021E6346
	mov r0, #0x2d
	lsl r0, r0, #4
	add r6, r5, #0
	add r4, r5, r0
	add r6, #0x20
_021E6304:
	ldr r0, [r4]
	cmp r0, #0
	bne _021E630E
	bl GF_AssertFail
_021E630E:
	ldr r1, [r4, #0x1c]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	ldr r1, [r4, #0x10]
	asr r0, r0, #0xc
	lsl r2, r1, #1
	add r1, sp, #0
	add r1, r1, r2
	strh r0, [r1, #4]
	ldr r1, [r4, #0x1c]
	ldr r2, [r5, #0x30]
	add r0, r5, #0
	bl ov85_021E8764
	cmp r0, #1
	bne _021E633C
	ldr r2, [r4, #0xc]
	mov r1, #1
	ldr r0, [r6]
	lsl r1, r2
	orr r0, r1
	str r0, [r6]
_021E633C:
	ldr r0, [r5, #0x30]
	add r7, r7, #1
	add r4, #0xb0
	cmp r7, r0
	blt _021E6304
_021E6346:
	ldr r1, [r5, #0x20]
	add r0, sp, #0
	strh r1, [r0, #2]
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #0xf
	add r2, sp, #0
	mov r3, #0x10
	bl sub_02096D4C
	cmp r0, #1
	bne _021E6364
	mov r0, #0x24
	str r0, [r5]
_021E6364:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov85_021E62D8

	thumb_func_start ov85_021E636C
ov85_021E636C: ; 0x021E636C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	cmp r0, #1
	bne _021E63D2
	add r0, r5, #0
	add r0, #0x60
	ldrh r0, [r0]
	add r7, r5, #0
	add r7, #0x60
	lsl r1, r0, #0xc
	mov r0, #0x11
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r5, #0x30]
	mov r6, #0
	cmp r0, #0
	ble _021E63B6
	mov r0, #0x2d
	lsl r0, r0, #4
	add r4, r5, r0
_021E6396:
	ldr r0, [r4]
	cmp r0, #0
	bne _021E63A0
	bl GF_AssertFail
_021E63A0:
	ldr r0, [r4, #0x10]
	add r6, r6, #1
	lsl r0, r0, #1
	add r0, r7, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0xc
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x30]
	add r4, #0xb0
	cmp r6, r0
	blt _021E6396
_021E63B6:
	ldrh r0, [r7, #2]
	str r0, [r5, #0x20]
	add r0, r5, #0
	bl ov85_021E75C8
	add r0, r5, #0
	bl ov85_021E7798
	add r0, r5, #0
	bl ov85_021E7958
	str r0, [r5, #0x28]
	mov r0, #0x24
	str r0, [r5]
_021E63D2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov85_021E636C

	thumb_func_start ov85_021E63D8
ov85_021E63D8: ; 0x021E63D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	mov r6, #0
	ldr r4, [r0, #0x10]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	ble _021E6416
_021E63E8:
	mov r0, #0xb0
	mul r0, r4
	add r1, r5, r0
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r3, [r1, r0]
	add r0, r5, #0
	lsl r1, r3, #2
	add r1, r5, r1
	add r1, #0x98
	ldr r1, [r1]
	add r2, r6, #0
	bl ov85_021E73D4
	ldr r7, [r5, #0x30]
	add r0, r4, #1
	add r1, r7, #0
	bl _s32_div_f
	add r6, r6, #1
	add r4, r1, #0
	cmp r6, r7
	blt _021E63E8
_021E6416:
	mov r0, #0
	str r0, [r5, #0xc]
	mov r1, #0x25
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E63D8

	thumb_func_start ov85_021E6420
ov85_021E6420: ; 0x021E6420
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0x78
	bge _021E6432
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E6432:
	mov r4, #0
	str r4, [r5, #0xc]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	ble _021E644C
_021E643C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov85_021E7400
	ldr r0, [r5, #0x30]
	add r4, r4, #1
	cmp r4, r0
	blt _021E643C
_021E644C:
	ldr r2, [r5, #0x28]
	add r0, r5, #0
	ldr r2, [r2, #0xc]
	mov r1, #2
	lsl r2, r2, #2
	add r2, r5, r2
	add r2, #0x84
	ldr r2, [r2]
	bl ov85_021E71EC
	ldr r0, _021E6470 ; =0x000004A1
	bl PlayFanfare
	mov r0, #0x26
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6470: .word 0x000004A1
	thumb_func_end ov85_021E6420

	thumb_func_start ov85_021E6474
ov85_021E6474: ; 0x021E6474
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0x78
	bge _021E6484
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _021E6494
_021E6484:
	bl IsFanfarePlaying
	cmp r0, #0
	bne _021E6494
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #0x27
	str r0, [r4]
_021E6494:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E6474

	thumb_func_start ov85_021E6498
ov85_021E6498: ; 0x021E6498
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov85_021E8454
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x20]
	ldr r0, [r0, #0xc]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	tst r0, r1
	bne _021E64B8
	mov r0, #0x2b
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E64B8:
	ldr r0, [r5, #0x30]
	lsl r6, r0, #3
	ldr r0, _021E6520 ; =ov85_021EA728
	ldr r4, [r0, r6]
	ldr r0, _021E6524 ; =ov85_021EA72C
	ldr r7, [r0, r6]
	bl LCRandom
	sub r1, r7, r4
	add r1, r1, #1
	bl _u32_div_f
	ldr r0, _021E6520 ; =ov85_021EA728
	add r4, r4, r1
	ldr r0, [r0, r6]
	cmp r4, r0
	bhs _021E64DE
	add r4, r0, #0
	b _021E64E4
_021E64DE:
	cmp r4, r7
	bls _021E64E4
	add r4, r7, #0
_021E64E4:
	add r0, r5, #0
	mov r1, #3
	add r2, r4, #0
	bl ov85_021E7274
	add r0, r5, #0
	add r0, #0xcc
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bl Sav2_Bag_get
	lsl r1, r4, #0x10
	lsr r1, r1, #0x10
	mov r2, #1
	mov r3, #0x66
	bl Bag_AddItem
	add r4, r0, #0
	ldr r0, _021E6528 ; =0x000004A1
	bl PlayFanfare
	cmp r4, #1
	bne _021E6516
	mov r0, #0x28
	b _021E6518
_021E6516:
	mov r0, #0x29
_021E6518:
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6520: .word ov85_021EA728
_021E6524: .word ov85_021EA72C
_021E6528: .word 0x000004A1
	thumb_func_end ov85_021E6498

	thumb_func_start ov85_021E652C
ov85_021E652C: ; 0x021E652C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0x78
	bge _021E653C
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _021E654C
_021E653C:
	bl IsFanfarePlaying
	cmp r0, #0
	bne _021E654C
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #0x2b
	str r0, [r4]
_021E654C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E652C

	thumb_func_start ov85_021E6550
ov85_021E6550: ; 0x021E6550
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0x78
	bge _021E6560
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _021E6578
_021E6560:
	bl IsFanfarePlaying
	cmp r0, #0
	bne _021E6578
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #0x28
	str r0, [r4]
	add r0, r4, #0
	mov r1, #4
	bl ov85_021E7194
_021E6578:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E6550

	thumb_func_start ov85_021E657C
ov85_021E657C: ; 0x021E657C
	ldr r1, [r0, #0xc]
	cmp r1, #0x78
	bge _021E6588
	add r1, r1, #1
	str r1, [r0, #0xc]
	b _021E6590
_021E6588:
	mov r1, #0
	str r1, [r0, #0xc]
	mov r1, #0x2b
	str r1, [r0]
_021E6590:
	mov r0, #0
	bx lr
	thumb_func_end ov85_021E657C

	thumb_func_start ov85_021E6594
ov85_021E6594: ; 0x021E6594
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xcc
	ldr r0, [r0]
	mov r1, #0x78
	ldr r0, [r0, #0x28]
	bl GameStats_Inc
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	mov r1, #0x22
	ldr r0, [r0, #0x28]
	bl GameStats_AddSpecial
	add r0, r4, #0
	mov r1, #0xb
	bl ov85_021E7194
	mov r0, #0xca
	bl sub_02037AC0
	ldr r0, _021E65D0 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #0xc]
	mov r0, #0x2c
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	nop
_021E65D0: .word gSystem + 0x60
	thumb_func_end ov85_021E6594

	thumb_func_start ov85_021E65D4
ov85_021E65D4: ; 0x021E65D4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xca
	bl sub_02037B38
	cmp r0, #0
	beq _021E6604
	ldr r1, [r4, #0x28]
	add r0, r4, #0
	ldr r1, [r1, #0xc]
	bl ov85_021E86CC
	add r0, r4, #4
	bl sub_02039EAC
	ldr r0, _021E6608 ; =0x00000CA8
	mov r1, #0xa
	add r0, r4, r0
	bl sub_0200F0AC
	ldr r1, _021E660C ; =0x00000DC8
	str r0, [r4, r1]
	mov r0, #0x2d
	str r0, [r4]
_021E6604:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E6608: .word 0x00000CA8
_021E660C: .word 0x00000DC8
	thumb_func_end ov85_021E65D4

	thumb_func_start ov85_021E6610
ov85_021E6610: ; 0x021E6610
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xcc
	ldr r0, [r0]
	mov r1, #2
	ldr r0, [r0, #0x1c]
	add r2, r4, #4
	bl sub_02039EB4
	cmp r0, #0
	beq _021E6638
	ldr r0, _021E663C ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #0xc]
	ldr r0, _021E6640 ; =0x00000DC8
	ldr r0, [r4, r0]
	bl sub_0200F450
	mov r0, #0x30
	str r0, [r4]
_021E6638:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E663C: .word gSystem + 0x60
_021E6640: .word 0x00000DC8
	thumb_func_end ov85_021E6610

	thumb_func_start ov85_021E6644
ov85_021E6644: ; 0x021E6644
	push {r4, lr}
	mov r1, #0xc
	add r4, r0, #0
	bl ov85_021E7194
	mov r0, #0x2f
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E6644

	thumb_func_start ov85_021E6658
ov85_021E6658: ; 0x021E6658
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	cmp r1, #0x78
	blt _021E666E
	mov r1, #0
	str r1, [r0, #0xc]
	mov r1, #0x30
	str r1, [r0]
	mov r0, #1
	bx lr
_021E666E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E6658

	thumb_func_start ov85_021E6674
ov85_021E6674: ; 0x021E6674
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _021E6684
	mov r0, #0xca
	bl sub_02037AC0
_021E6684:
	add r0, r4, #0
	mov r1, #0xa
	bl ov85_021E7194
	mov r0, #0x31
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E6674

	thumb_func_start ov85_021E6694
ov85_021E6694: ; 0x021E6694
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _021E66C0
	mov r0, #0xca
	bl sub_02037B38
	cmp r0, #0
	beq _021E66EE
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_02038C1C
	bl sub_02037FF0
	mov r0, #0x32
	str r0, [r4]
	b _021E66EE
_021E66C0:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x78
	blt _021E66EE
	mov r0, #0
	add r1, r4, #0
	str r0, [r4, #0xc]
	add r1, #0xd0
	ldr r1, [r1]
	ldr r1, [r1, #0x3c]
	cmp r1, #0
	bne _021E66EA
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #1
	bl sub_02038C1C
	bl sub_02037FF0
_021E66EA:
	mov r0, #0x32
	str r0, [r4]
_021E66EE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E6694

	thumb_func_start ov85_021E66F4
ov85_021E66F4: ; 0x021E66F4
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037454
	cmp r0, #1
	bgt _021E6708
	mov r0, #0x33
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E6708:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E66F4

	thumb_func_start ov85_021E670C
ov85_021E670C: ; 0x021E670C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #8
	mov r1, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x66
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	ldr r5, [r4, #0x1c]
	bl GF_GetCurrentPlayingBGM
	cmp r5, r0
	beq _021E673E
	lsl r1, r5, #0x10
	mov r0, #0
	lsr r1, r1, #0x10
	bl sub_02055198
_021E673E:
	mov r0, #0x34
	str r0, [r4]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov85_021E670C

	thumb_func_start ov85_021E6748
ov85_021E6748: ; 0x021E6748
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E675C
	mov r0, #0x35
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E675C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov85_021E6748

	thumb_func_start ov85_021E6760
ov85_021E6760: ; 0x021E6760
	mov r0, #2
	bx lr
	thumb_func_end ov85_021E6760

	thumb_func_start ov85_021E6764
ov85_021E6764: ; 0x021E6764
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r0, _021E6784 ; =0x00000D9C
	ldr r0, [r4, r0]
	bl sub_0200398C
	ldr r0, _021E6788 ; =0x00000D84
	ldr r0, [r4, r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	pop {r4, pc}
	nop
_021E6784: .word 0x00000D9C
_021E6788: .word 0x00000D84
	thumb_func_end ov85_021E6764

	thumb_func_start ov85_021E678C
ov85_021E678C: ; 0x021E678C
	push {r4, lr}
	add r4, r0, #0
	bl ov85_021E6854
	add r0, r4, #0
	bl ov85_021E6980
	add r0, r4, #0
	bl ov85_021E7424
	add r0, r4, #0
	bl ov85_021E6A2C
	add r0, r4, #0
	bl ov85_021E6E14
	add r0, r4, #0
	bl ov85_021E6ECC
	add r0, r4, #0
	bl ov85_021E6B68
	add r0, r4, #0
	bl ov85_021E705C
	add r0, r4, #0
	bl ov85_021E6F6C
	add r0, r4, #0
	bl ov85_021E6874
	pop {r4, pc}
	thumb_func_end ov85_021E678C

	thumb_func_start ov85_021E67CC
ov85_021E67CC: ; 0x021E67CC
	push {r4, lr}
	add r4, r0, #0
	bl ov85_021E692C
	add r0, r4, #0
	bl ov85_021E7024
	add r0, r4, #0
	bl ov85_021E7148
	add r0, r4, #0
	bl ov85_021E6D68
	add r0, r4, #0
	bl ov85_021E6E6C
	add r0, r4, #0
	bl ov85_021E749C
	pop {r4, pc}
	thumb_func_end ov85_021E67CC

	thumb_func_start ov85_021E67F4
ov85_021E67F4: ; 0x021E67F4
	push {r4, lr}
	add r4, r0, #0
	bl sub_02026E48
	bl sub_02023154
	mov r0, #0
	ldr r2, _021E6848 ; =0xFFFFF000
	add r1, r0, #0
	add r3, r0, #0
	bl NNS_G3dGlbLightVector
	ldr r1, _021E684C ; =0x00007FFF
	mov r0, #0
	bl NNS_G3dGlbLightColor
	ldr r0, _021E684C ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _021E684C ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	add r0, r4, #0
	bl ov85_021E7628
	add r0, r4, #0
	bl ov85_021E782C
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	ldr r0, _021E6850 ; =0x00000D98
	ldr r0, [r4, r0]
	bl sub_0200D020
	pop {r4, pc}
	nop
_021E6848: .word 0xFFFFF000
_021E684C: .word 0x00007FFF
_021E6850: .word 0x00000D98
	thumb_func_end ov85_021E67F4

	thumb_func_start ov85_021E6854
ov85_021E6854: ; 0x021E6854
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6870 ; =ov85_021EA700
	add r3, sp, #0
	mov r2, #5
_021E685E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E685E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E6870: .word ov85_021EA700
	thumb_func_end ov85_021E6854

	thumb_func_start ov85_021E6874
ov85_021E6874: ; 0x021E6874
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, _021E6924 ; =0x04000008
	mov r4, #3
	ldrh r1, [r0]
	mov r2, #1
	mov r3, #2
	bic r1, r4
	orr r1, r2
	strh r1, [r0]
	ldrh r1, [r0, #2]
	mov r5, #3
	bic r1, r4
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	bic r1, r4
	orr r1, r3
	strh r1, [r0, #4]
	ldrh r1, [r0, #6]
	bic r1, r4
	orr r1, r5
	strh r1, [r0, #6]
	ldr r1, _021E6928 ; =0x04001008
	ldrh r6, [r1]
	bic r6, r4
	strh r6, [r1]
	ldrh r6, [r1, #2]
	bic r6, r4
	orr r2, r6
	strh r2, [r1, #2]
	ldrh r2, [r1, #4]
	bic r2, r4
	orr r2, r3
	strh r2, [r1, #4]
	ldrh r2, [r1, #6]
	bic r2, r4
	orr r2, r5
	strh r2, [r1, #6]
	mov r1, #0xa
	str r1, [sp]
	add r0, #0x48
	mov r1, #4
	mov r2, #0x28
	mov r3, #0xb
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E6924: .word 0x04000008
_021E6928: .word 0x04001008
	thumb_func_end ov85_021E6874

	thumb_func_start ov85_021E692C
ov85_021E692C: ; 0x021E692C
	push {r3, lr}
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	pop {r3, pc}
	thumb_func_end ov85_021E692C

	thumb_func_start ov85_021E6980
ov85_021E6980: ; 0x021E6980
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	ldr r0, _021E6A10 ; =0x04000060
	ldr r1, _021E6A14 ; =0xFFFFCFFD
	ldrh r2, [r0]
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021E6A18 ; =0x0000CFFB
	and r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #8
	orr r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	add r3, r4, #0
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	mov r0, #0xda
	ldr r1, _021E6A1C ; =0x00001084
	mov r2, #0
	lsl r0, r0, #4
_021E69CE:
	add r2, r2, #1
	strh r1, [r3, r0]
	add r3, r3, #2
	cmp r2, #8
	blt _021E69CE
	mov r0, #0xda
	lsl r0, r0, #4
	add r0, r4, r0
	bl G3X_SetEdgeColorTable
	ldr r0, _021E6A20 ; =0x00007FFF
	mov r1, #0
	add r2, r0, #0
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	ldr r1, _021E6A24 ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _021E6A28 ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021E6A10: .word 0x04000060
_021E6A14: .word 0xFFFFCFFD
_021E6A18: .word 0x0000CFFB
_021E6A1C: .word 0x00001084
_021E6A20: .word 0x00007FFF
_021E6A24: .word 0x04000540
_021E6A28: .word 0xBFFF0000
	thumb_func_end ov85_021E6980

	thumb_func_start ov85_021E6A2C
ov85_021E6A2C: ; 0x021E6A2C
	push {r4, r5, lr}
	sub sp, #0x9c
	add r4, r0, #0
	mov r0, #0x66
	bl BgConfig_Alloc
	ldr r1, _021E6B48 ; =0x00000D84
	ldr r2, _021E6B4C ; =0x04000304
	str r0, [r4, r1]
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	ldr r5, _021E6B50 ; =ov85_021EA538
	orr r0, r1
	strh r0, [r2]
	add r3, sp, #0x8c
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E6B54 ; =ov85_021EA60C
	add r3, sp, #0x70
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	ldr r0, _021E6B48 ; =0x00000D84
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E6B48 ; =0x00000D84
	mov r1, #1
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x66
	bl BG_ClearCharDataRange
	ldr r5, _021E6B58 ; =ov85_021EA628
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	ldr r0, _021E6B48 ; =0x00000D84
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E6B48 ; =0x00000D84
	mov r1, #2
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6B5C ; =ov85_021EA644
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, _021E6B48 ; =0x00000D84
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E6B48 ; =0x00000D84
	mov r1, #3
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6B60 ; =ov85_021EA660
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	ldr r0, _021E6B48 ; =0x00000D84
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E6B48 ; =0x00000D84
	mov r1, #6
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6B64 ; =ov85_021EA67C
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #7
	str r0, [r3]
	ldr r0, _021E6B48 ; =0x00000D84
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E6B48 ; =0x00000D84
	mov r1, #7
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E6B48: .word 0x00000D84
_021E6B4C: .word 0x04000304
_021E6B50: .word ov85_021EA538
_021E6B54: .word ov85_021EA60C
_021E6B58: .word ov85_021EA628
_021E6B5C: .word ov85_021EA644
_021E6B60: .word ov85_021EA660
_021E6B64: .word ov85_021EA67C
	thumb_func_end ov85_021E6A2C

	thumb_func_start ov85_021E6B68
ov85_021E6B68: ; 0x021E6B68
	push {r3, r4, r5, lr}
	mov r1, #0x11
	mov r2, #0
	add r4, r0, #0
	bl ov85_021E8588
	mov r1, #0xd9
	lsl r1, r1, #4
	add r1, r4, r1
	add r5, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	mov r0, #0x40
	mov r2, #0
	ldr r1, _021E6D54 ; =0x00000D9C
	str r0, [sp]
	ldr r0, [r4, r1]
	sub r1, #0xc
	ldr r1, [r4, r1]
	add r3, r2, #0
	ldr r1, [r1, #0xc]
	bl PaletteData_LoadPalette
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #0
	bl ov85_021E8588
	mov r1, #0xd9
	lsl r1, r1, #4
	add r1, r4, r1
	add r5, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	mov r0, #0x40
	ldr r1, _021E6D54 ; =0x00000D9C
	str r0, [sp]
	ldr r0, [r4, r1]
	sub r1, #0xc
	ldr r1, [r4, r1]
	mov r2, #1
	ldr r1, [r1, #0xc]
	mov r3, #0
	bl PaletteData_LoadPalette
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E6D54 ; =0x00000D9C
	ldr r2, _021E6D58 ; =0x0000FFFF
	ldr r0, [r4, r0]
	mov r1, #1
	mov r3, #8
	bl sub_02003EA4
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D5C ; =0x00000D8C
	add r5, r0, #0
	add r1, r4, r1
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, _021E6D5C ; =0x00000D8C
	mov r1, #0
	ldr r3, [r4, r0]
	sub r0, #8
	str r1, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4, r0]
	ldr r3, [r3, #0x10]
	mov r1, #3
	bl BG_LoadCharTilesData
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0
	bl ov85_021E8588
	add r5, r0, #0
	ldr r1, _021E6D5C ; =0x00000D8C
	add r1, r4, r1
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, _021E6D5C ; =0x00000D8C
	mov r1, #0
	ldr r3, [r4, r0]
	sub r0, #8
	str r1, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4, r0]
	ldr r3, [r3, #0x10]
	mov r1, #6
	bl BG_LoadCharTilesData
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D5C ; =0x00000D8C
	add r5, r0, #0
	add r1, r4, r1
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, _021E6D5C ; =0x00000D8C
	mov r1, #0
	ldr r3, [r4, r0]
	sub r0, #8
	str r1, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4, r0]
	ldr r3, [r3, #0x10]
	mov r1, #7
	bl BG_LoadCharTilesData
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D60 ; =0x00000D88
	add r5, r0, #0
	add r1, r4, r1
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, _021E6D60 ; =0x00000D88
	mov r1, #2
	ldr r3, [r4, r0]
	sub r0, r0, #4
	add r2, r3, #0
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, _021E6D64 ; =0x00000D84
	mov r1, #2
	ldr r0, [r4, r0]
	bl BgCommitTilemapBufferToVram
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D60 ; =0x00000D88
	add r5, r0, #0
	add r1, r4, r1
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, _021E6D60 ; =0x00000D88
	mov r1, #3
	ldr r3, [r4, r0]
	sub r0, r0, #4
	add r2, r3, #0
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, _021E6D64 ; =0x00000D84
	mov r1, #3
	ldr r0, [r4, r0]
	bl BgCommitTilemapBufferToVram
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D60 ; =0x00000D88
	add r5, r0, #0
	add r1, r4, r1
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, _021E6D60 ; =0x00000D88
	mov r1, #6
	ldr r3, [r4, r0]
	sub r0, r0, #4
	add r2, r3, #0
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, _021E6D64 ; =0x00000D84
	mov r1, #6
	ldr r0, [r4, r0]
	bl BgCommitTilemapBufferToVram
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0x17
	mov r2, #0
	bl ov85_021E8588
	ldr r1, _021E6D60 ; =0x00000D88
	add r5, r0, #0
	add r1, r4, r1
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, _021E6D60 ; =0x00000D88
	mov r1, #7
	ldr r3, [r4, r0]
	sub r0, r0, #4
	add r2, r3, #0
	ldr r0, [r4, r0]
	ldr r3, [r3, #8]
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, _021E6D64 ; =0x00000D84
	mov r1, #7
	ldr r0, [r4, r0]
	bl BgCommitTilemapBufferToVram
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	nop
_021E6D54: .word 0x00000D9C
_021E6D58: .word 0x0000FFFF
_021E6D5C: .word 0x00000D8C
_021E6D60: .word 0x00000D88
_021E6D64: .word 0x00000D84
	thumb_func_end ov85_021E6B68

	thumb_func_start ov85_021E6D68
ov85_021E6D68: ; 0x021E6D68
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6DA8 ; =0x00000D84
	mov r1, #1
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E6DA8 ; =0x00000D84
	mov r1, #2
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E6DA8 ; =0x00000D84
	mov r1, #3
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E6DA8 ; =0x00000D84
	mov r1, #6
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E6DA8 ; =0x00000D84
	mov r1, #7
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E6DA8 ; =0x00000D84
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
_021E6DA8: .word 0x00000D84
	thumb_func_end ov85_021E6D68

	thumb_func_start ov85_021E6DAC
ov85_021E6DAC: ; 0x021E6DAC
	push {r3, r4, r5, lr}
	mov r2, #0
	add r5, r0, #0
	bl ov85_021E8588
	ldr r1, _021E6DE8 ; =0x00000D88
	add r4, r0, #0
	add r1, r5, r1
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, _021E6DE8 ; =0x00000D88
	mov r1, #6
	ldr r3, [r5, r0]
	sub r0, r0, #4
	add r2, r3, #0
	ldr r0, [r5, r0]
	ldr r3, [r3, #8]
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, _021E6DEC ; =0x00000D84
	mov r1, #6
	ldr r0, [r5, r0]
	bl BgCommitTilemapBufferToVram
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	nop
_021E6DE8: .word 0x00000D88
_021E6DEC: .word 0x00000D84
	thumb_func_end ov85_021E6DAC

	thumb_func_start ov85_021E6DF0
ov85_021E6DF0: ; 0x021E6DF0
	ldr r3, _021E6DF8 ; =ov85_021E6DAC
	mov r1, #0x1a
	bx r3
	nop
_021E6DF8: .word ov85_021E6DAC
	thumb_func_end ov85_021E6DF0

	thumb_func_start ov85_021E6DFC
ov85_021E6DFC: ; 0x021E6DFC
	ldr r3, _021E6E04 ; =ov85_021E6DAC
	mov r1, #0x18
	bx r3
	nop
_021E6E04: .word ov85_021E6DAC
	thumb_func_end ov85_021E6DFC

	thumb_func_start ov85_021E6E08
ov85_021E6E08: ; 0x021E6E08
	ldr r3, _021E6E10 ; =ov85_021E6DAC
	mov r1, #0x19
	bx r3
	nop
_021E6E10: .word ov85_021E6DAC
	thumb_func_end ov85_021E6E08

	thumb_func_start ov85_021E6E14
ov85_021E6E14: ; 0x021E6E14
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	bl sub_020030E8
	ldr r1, _021E6E68 ; =0x00000D9C
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl sub_02003B50
	ldr r0, _021E6E68 ; =0x00000D9C
	mov r2, #2
	ldr r0, [r4, r0]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x66
	bl PaletteData_AllocBuffers
	ldr r0, _021E6E68 ; =0x00000D9C
	mov r1, #2
	ldr r0, [r4, r0]
	lsl r2, r1, #8
	mov r3, #0x66
	bl PaletteData_AllocBuffers
	ldr r0, _021E6E68 ; =0x00000D9C
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r2, r1, #9
	mov r3, #0x66
	bl PaletteData_AllocBuffers
	ldr r0, _021E6E68 ; =0x00000D9C
	mov r2, #2
	ldr r0, [r4, r0]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #0x66
	bl PaletteData_AllocBuffers
	pop {r4, pc}
	.balign 4, 0
_021E6E68: .word 0x00000D9C
	thumb_func_end ov85_021E6E14

	thumb_func_start ov85_021E6E6C
ov85_021E6E6C: ; 0x021E6E6C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6EA4 ; =0x00000D9C
	mov r1, #0
	ldr r0, [r4, r0]
	bl PaletteData_FreeBuffers
	ldr r0, _021E6EA4 ; =0x00000D9C
	mov r1, #2
	ldr r0, [r4, r0]
	bl PaletteData_FreeBuffers
	ldr r0, _021E6EA4 ; =0x00000D9C
	mov r1, #1
	ldr r0, [r4, r0]
	bl PaletteData_FreeBuffers
	ldr r0, _021E6EA4 ; =0x00000D9C
	mov r1, #3
	ldr r0, [r4, r0]
	bl PaletteData_FreeBuffers
	ldr r0, _021E6EA4 ; =0x00000D9C
	ldr r0, [r4, r0]
	bl sub_02003104
	pop {r4, pc}
	nop
_021E6EA4: .word 0x00000D9C
	thumb_func_end ov85_021E6E6C

	thumb_func_start ov85_021E6EA8
ov85_021E6EA8: ; 0x021E6EA8
	push {r3, lr}
	add r3, r1, #0
	mov r1, #0
	str r1, [sp]
	ldr r1, _021E6EC4 ; =0x00000D9C
	lsl r3, r3, #0x18
	ldr r0, [r0, r1]
	ldr r2, _021E6EC8 ; =0x0000FFFF
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	pop {r3, pc}
	nop
_021E6EC4: .word 0x00000D9C
_021E6EC8: .word 0x0000FFFF
	thumb_func_end ov85_021E6EA8

	thumb_func_start ov85_021E6ECC
ov85_021E6ECC: ; 0x021E6ECC
	push {r3, r4, lr}
	sub sp, #0x4c
	ldr r3, _021E6F58 ; =ov85_021EA6B8
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x2c
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _021E6F5C ; =ov85_021EA56C
	add r2, sp, #0x18
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0x66
	bl sub_0200CF18
	ldr r1, _021E6F60 ; =0x00000D94
	add r2, sp, #0x18
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0x2c
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _021E6F64 ; =ov85_021EA594
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, _021E6F60 ; =0x00000D94
	ldr r0, [r4, r0]
	bl sub_0200CF38
	ldr r1, _021E6F68 ; =0x00000D98
	mov r2, #0xff
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl sub_0200CFF4
	cmp r0, #0
	bne _021E6F3C
	bl GF_AssertFail
_021E6F3C:
	ldr r1, _021E6F60 ; =0x00000D94
	add r2, sp, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D3F8
	cmp r0, #0
	bne _021E6F52
	bl GF_AssertFail
_021E6F52:
	add sp, #0x4c
	pop {r3, r4, pc}
	nop
_021E6F58: .word ov85_021EA6B8
_021E6F5C: .word ov85_021EA56C
_021E6F60: .word 0x00000D94
_021E6F64: .word ov85_021EA594
_021E6F68: .word 0x00000D98
	thumb_func_end ov85_021E6ECC

	thumb_func_start ov85_021E6F6C
ov85_021E6F6C: ; 0x021E6F6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r2, _021E7020 ; =0x00000D94
	add r1, r2, #4
	ldr r6, [r0, r2]
	add r2, #8
	ldr r5, [r0, r1]
	ldr r7, [r0, r2]
	mov r0, #1
	bl sub_0200A080
	mov r0, #0xd9
	mov r1, #0x66
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0x10
	bl sub_0200D504
	str r4, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #5
	str r0, [sp, #0x14]
	add r0, r7, #0
	mov r1, #2
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0x11
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0x12
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	bl sub_0203A880
	mov r0, #0x66
	bl sub_0203A4AC
	add r1, sp, #0x18
	add r4, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	mov r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x18]
	add r0, r7, #0
	ldr r1, [r1, #0xc]
	mov r2, #2
	mov r3, #0xe0
	bl PaletteData_LoadPalette
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7020: .word 0x00000D94
	thumb_func_end ov85_021E6F6C

	thumb_func_start ov85_021E7024
ov85_021E7024: ; 0x021E7024
	push {r4, lr}
	ldr r1, _021E7040 ; =0x00000D94
	add r4, r0, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D998
	ldr r0, _021E7040 ; =0x00000D94
	ldr r0, [r4, r0]
	bl sub_0200D108
	pop {r4, pc}
	nop
_021E7040: .word 0x00000D94
	thumb_func_end ov85_021E7024

	thumb_func_start ov85_021E7044
ov85_021E7044: ; 0x021E7044
	add r2, r1, #0
	ldr r1, _021E7054 ; =0x00000D94
	add r3, r0, #0
	ldr r0, [r3, r1]
	add r1, r1, #4
	ldr r1, [r3, r1]
	ldr r3, _021E7058 ; =sub_0200D734
	bx r3
	.balign 4, 0
_021E7054: .word 0x00000D94
_021E7058: .word sub_0200D734
	thumb_func_end ov85_021E7044

	thumb_func_start ov85_021E705C
ov85_021E705C: ; 0x021E705C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, _021E7138 ; =0x00000C9C
	mov r1, #0
	str r1, [sp]
	mov r1, #0x66
	add r4, r6, r0
	str r1, [sp, #4]
	add r0, #0xe8
	mov r1, #1
	ldr r0, [r6, r0]
	add r2, r1, #0
	mov r3, #0xf
	bl LoadUserFrameGfx1
	add r0, r6, #0
	add r0, #0xcc
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0, #0x18]
	mov r2, #0xa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x66
	str r0, [sp, #4]
	ldr r0, _021E713C ; =0x00000D84
	mov r3, #0xe
	ldr r0, [r6, r0]
	bl LoadUserFrameGfx2
	add r0, r6, #0
	add r0, #0xcc
	ldr r0, [r0]
	ldr r0, [r0, #0x18]
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	ldr r0, _021E7140 ; =0x00000D9C
	mov r1, #0x26
	ldr r0, [r6, r0]
	mov r3, #0x66
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xf0
	str r0, [sp, #8]
	ldr r0, _021E7140 ; =0x00000D9C
	mov r1, #0x10
	ldr r0, [r6, r0]
	mov r2, #8
	mov r3, #0x66
	bl PaletteData_LoadNarc
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xce
	mov r3, #0x66
	bl NewMsgDataFromNarc
	str r0, [r4, #4]
	mov r0, #0x66
	bl ScrStrBufs_new
	str r0, [r4, #8]
	ldr r0, _021E713C ; =0x00000D84
	add r1, r4, #0
	ldr r0, [r6, r0]
	ldr r2, _021E7144 ; =ov85_021EA4FC
	add r1, #0xc
	bl AddWindow
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x66
	bl String_ctor
	str r0, [r4, #0x6c]
	mov r4, #0
	add r5, r6, #0
	mov r7, #8
_021E7112:
	add r0, r7, #0
	mov r1, #0x66
	bl String_ctor
	add r1, r5, #0
	add r1, #0x98
	add r4, r4, #1
	add r5, r5, #4
	str r0, [r1]
	cmp r4, #5
	blt _021E7112
	add r0, r6, #0
	add r6, #0xcc
	ldr r1, [r6]
	ldr r1, [r1, #8]
	bl ov85_021E730C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7138: .word 0x00000C9C
_021E713C: .word 0x00000D84
_021E7140: .word 0x00000D9C
_021E7144: .word ov85_021EA4FC
	thumb_func_end ov85_021E705C

	thumb_func_start ov85_021E7148
ov85_021E7148: ; 0x021E7148
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021E7190 ; =0x00000C9C
	add r4, r5, r0
	add r6, r4, #0
	add r6, #0xc
	add r0, r6, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r6, #0
	bl RemoveWindow
	add r0, r5, #0
	bl ov85_021E7350
	ldr r0, [r4, #4]
	bl DestroyMsgData
	ldr r0, [r4, #8]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x6c]
	bl String_dtor
	mov r4, #0
_021E717A:
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _021E717A
	pop {r4, r5, r6, pc}
	nop
_021E7190: .word 0x00000C9C
	thumb_func_end ov85_021E7148

	thumb_func_start ov85_021E7194
ov85_021E7194: ; 0x021E7194
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	ldr r1, _021E71E8 ; =0x00000C9C
	add r4, r0, r1
	add r5, r4, #0
	add r5, #0xc
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xa
	mov r3, #0xe
	bl DrawFrameAndWindow2
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x6c]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r4, #0x6c]
	add r0, r5, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E71E8: .word 0x00000C9C
	thumb_func_end ov85_021E7194

	thumb_func_start ov85_021E71EC
ov85_021E71EC: ; 0x021E71EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	ldr r1, _021E7270 ; =0x00000C9C
	add r6, r2, #0
	add r4, r0, r1
	add r5, r4, #0
	add r5, #0xc
	bl sub_0203769C
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #1
	bl BufferPlayersName
	ldr r0, [r4, #8]
	mov r1, #2
	add r2, r6, #0
	bl BufferPlayersName
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x66
	bl String_ctor
	add r6, r0, #0
	ldr r0, [r4, #4]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x6c]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xa
	mov r3, #0xe
	bl DrawFrameAndWindow2
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r4, #0x6c]
	add r0, r5, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7270: .word 0x00000C9C
	thumb_func_end ov85_021E71EC

	thumb_func_start ov85_021E7274
ov85_021E7274: ; 0x021E7274
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	ldr r1, _021E72E4 ; =0x00000C9C
	add r4, r0, r1
	add r5, r4, #0
	ldr r0, [r4, #8]
	mov r1, #0
	add r5, #0xc
	bl BufferItemName
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x66
	bl String_ctor
	add r6, r0, #0
	ldr r0, [r4, #4]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x6c]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xa
	mov r3, #0xe
	bl DrawFrameAndWindow2
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r4, #0x6c]
	add r0, r5, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E72E4: .word 0x00000C9C
	thumb_func_end ov85_021E7274

	thumb_func_start ov85_021E72E8
ov85_021E72E8: ; 0x021E72E8
	push {r3, r4, r5, lr}
	ldr r4, _021E7308 ; =0x00000CA8
	add r5, r0, #0
	add r0, r5, r4
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, pc}
	nop
_021E7308: .word 0x00000CA8
	thumb_func_end ov85_021E72E8

	thumb_func_start ov85_021E730C
ov85_021E730C: ; 0x021E730C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	add r7, r0, #0
	ldr r0, [sp]
	ldr r1, _021E7344 ; =0x00000C9C
	lsl r2, r0, #2
	ldr r0, _021E7348 ; =ov85_021EA5AC
	mov r6, #0
	ldr r4, [r0, r2]
	ldr r0, [sp]
	str r0, [r7, r1]
	cmp r0, #0
	ble _021E7342
	add r5, r7, r1
	add r5, #0x1c
_021E732A:
	ldr r0, _021E734C ; =0x00000D84
	add r1, r5, #0
	ldr r0, [r7, r0]
	add r2, r4, #0
	bl AddWindow
	ldr r0, [sp]
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, r0
	blt _021E732A
_021E7342:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7344: .word 0x00000C9C
_021E7348: .word ov85_021EA5AC
_021E734C: .word 0x00000D84
	thumb_func_end ov85_021E730C

	thumb_func_start ov85_021E7350
ov85_021E7350: ; 0x021E7350
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _021E737C ; =0x00000C9C
	add r6, r0, #0
	ldr r0, [r6, r7]
	mov r4, #0
	cmp r0, #0
	ble _021E7378
	add r5, r6, r7
	add r5, #0x1c
_021E7362:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _021E7362
_021E7378:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E737C: .word 0x00000C9C
	thumb_func_end ov85_021E7350

	thumb_func_start ov85_021E7380
ov85_021E7380: ; 0x021E7380
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	ldr r1, _021E73D0 ; =0x00000CB8
	lsl r4, r2, #4
	add r5, r0, r1
	mov r1, #1
	add r7, r3, #0
	add r0, r5, r4
	add r2, r1, #0
	mov r3, #0xe
	bl DrawFrameAndWindow1
	add r0, r5, r4
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	mov r3, #0x40
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	add r0, r5, r4
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E73D0: .word 0x00000CB8
	thumb_func_end ov85_021E7380

	thumb_func_start ov85_021E73D4
ov85_021E73D4: ; 0x021E73D4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp]
	add r5, r3, #0
	ldr r4, _021E73FC ; =0x00010200
	bl sub_0203769C
	cmp r5, r0
	bne _021E73EC
	mov r4, #0xc1
	lsl r4, r4, #0xa
_021E73EC:
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r7, #0
	add r3, r4, #0
	bl ov85_021E7380
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E73FC: .word 0x00010200
	thumb_func_end ov85_021E73D4

	thumb_func_start ov85_021E7400
ov85_021E7400: ; 0x021E7400
	push {r3, r4, r5, lr}
	ldr r2, _021E7420 ; =0x00000CB8
	lsl r4, r1, #4
	add r5, r0, r2
	add r0, r5, r4
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7420: .word 0x00000CB8
	thumb_func_end ov85_021E7400

	thumb_func_start ov85_021E7424
ov85_021E7424: ; 0x021E7424
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _021E748C ; =0x00000D0C
	add r4, r5, r0
	mov r0, #0x66
	bl GF_Camera_Create
	str r0, [r4, #0x1c]
	mov r2, #0
	str r2, [r4, #8]
	str r2, [r4, #0xc]
	ldr r0, _021E7490 ; =0x0000E93F
	str r2, [r4, #0x10]
	strh r0, [r4, #0x14]
	strh r2, [r4, #0x16]
	ldr r0, _021E7494 ; =0x00143000
	ldr r1, _021E748C ; =0x00000D0C
	strh r2, [r4, #0x18]
	str r0, [r5, r1]
	ldr r0, _021E7498 ; =0x00000444
	str r0, [r4, #4]
	str r2, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r3, [r4, #4]
	add r0, r4, #0
	lsl r3, r3, #0x10
	ldr r1, [r5, r1]
	add r0, #8
	add r2, #0x14
	lsr r3, r3, #0x10
	bl GF_Camera_InitFromTargetDistanceAndAngle
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #0x14]
	ldr r1, [r4, #0x1c]
	add r0, sp, #0xc
	bl GF_Camera_SetBindTarget
	ldr r0, [r4, #0x1c]
	bl GF_Camera_RegisterToStaticPtr
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E748C: .word 0x00000D0C
_021E7490: .word 0x0000E93F
_021E7494: .word 0x00143000
_021E7498: .word 0x00000444
	thumb_func_end ov85_021E7424

	thumb_func_start ov85_021E749C
ov85_021E749C: ; 0x021E749C
	ldr r1, _021E74A4 ; =0x00000D28
	ldr r3, _021E74A8 ; =sub_02023120
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021E74A4: .word 0x00000D28
_021E74A8: .word sub_02023120
	thumb_func_end ov85_021E749C

	thumb_func_start ov85_021E74AC
ov85_021E74AC: ; 0x021E74AC
	push {r4, r5, r6, lr}
	ldr r1, _021E74EC ; =0x00000D2C
	mov r6, #0
	add r5, r0, r1
	add r0, r5, #0
	add r0, #0x10
	mov r1, #2
	add r2, r6, #0
	mov r4, #3
	bl sub_02021280
	add r2, r5, #0
	add r2, #0x18
	mov r0, #1
_021E74C8:
	ldrh r1, [r2, #0x16]
	cmp r1, #1
	bne _021E74D8
	ldrh r1, [r2, #0x12]
	add r6, r0, #0
	str r1, [r5]
	ldrh r1, [r2, #0x14]
	str r1, [r5, #4]
_021E74D8:
	sub r2, #8
	sub r4, r4, #1
	bpl _021E74C8
	ldr r0, [r5, #0xc]
	eor r0, r6
	and r0, r6
	str r0, [r5, #8]
	str r6, [r5, #0xc]
	pop {r4, r5, r6, pc}
	nop
_021E74EC: .word 0x00000D2C
	thumb_func_end ov85_021E74AC

	thumb_func_start ov85_021E74F0
ov85_021E74F0: ; 0x021E74F0
	ldr r1, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0x20
	blt _021E7508
	cmp r0, #0x9f
	bgt _021E7508
	cmp r1, #0x40
	blt _021E7508
	cmp r1, #0xbf
	bgt _021E7508
	mov r0, #1
	bx lr
_021E7508:
	mov r0, #0
	bx lr
	thumb_func_end ov85_021E74F0

	thumb_func_start ov85_021E750C
ov85_021E750C: ; 0x021E750C
	push {r3, lr}
	ldr r1, _021E7528 ; =0x00000D2C
	add r0, r0, r1
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _021E7524
	bl ov85_021E74F0
	cmp r0, #1
	bne _021E7524
	mov r0, #1
	pop {r3, pc}
_021E7524:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021E7528: .word 0x00000D2C
	thumb_func_end ov85_021E750C

	thumb_func_start ov85_021E752C
ov85_021E752C: ; 0x021E752C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	add r0, #0xcc
	ldr r0, [r0]
	add r4, r6, #0
	ldr r0, [r0, #8]
	mov r2, #0x36
	lsl r5, r0, #2
	mov r0, #0x66
	ldr r3, _021E75AC ; =ov85_021EA5C4
	str r0, [sp]
	mov r1, #0
	add r4, #0xd4
	add r0, r4, #0
	str r1, [sp, #4]
	lsl r2, r2, #6
	ldr r2, [r6, r2]
	ldr r3, [r3, r5]
	add r0, #0x54
	bl sub_020696C4
	add r0, r4, #0
	add r0, #0x54
	bl sub_02069714
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x54
	bl sub_02069978
	ldr r1, _021E75B0 ; =ov85_021EA5DC
	mov r0, #0
	add r2, r4, #0
	ldr r1, [r1, r5]
	str r0, [r4, #0x3c]
	str r1, [r4, #0x44]
	mov r1, #1
	lsl r1, r1, #0xc
	str r1, [r4, #0x18]
	str r1, [r4, #0x1c]
	str r1, [r4, #0x20]
	add r1, r4, #0
	add r1, #0x4c
	strh r0, [r1]
	add r1, r4, #0
	add r1, #0x4e
	strh r0, [r1]
	add r1, r4, #0
	add r1, #0x50
	strh r0, [r1]
	add r6, #0xd4
	ldr r1, _021E75B4 ; =0xFFFDC000
	str r0, [r6]
	str r1, [r4, #4]
	str r0, [r4, #8]
	ldmia r4!, {r0, r1}
	add r2, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E75AC: .word ov85_021EA5C4
_021E75B0: .word ov85_021EA5DC
_021E75B4: .word 0xFFFDC000
	thumb_func_end ov85_021E752C

	thumb_func_start ov85_021E75B8
ov85_021E75B8: ; 0x021E75B8
	mov r1, #0x4a
	lsl r1, r1, #2
	ldr r3, _021E75C4 ; =sub_02069784
	add r0, r0, r1
	bx r3
	nop
_021E75C4: .word sub_02069784
	thumb_func_end ov85_021E75B8

	thumb_func_start ov85_021E75C8
ov85_021E75C8: ; 0x021E75C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0xd4
	ldr r0, [r4, #0x3c]
	str r0, [sp]
	ldr r1, [r4, #0x40]
	add r0, sp, #0
	bl ov85_021E8530
	ldr r1, [r4, #0x44]
	add r0, sp, #0
	bl ov85_021E8530
	ldr r1, [sp]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	mov r1, #0x5a
	asr r0, r0, #0xc
	lsl r1, r1, #2
	sub r0, r1, r0
	bl _s32_div_f
	add r0, r4, #0
	add r0, #0x4e
	strh r1, [r0]
	add r5, #0xd4
	ldr r1, [r5]
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x24]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x34]
	ldr r2, [r4, #0x28]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x38]
	ldr r2, [r4, #0x2c]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [r4, #0x14]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E75C8

	thumb_func_start ov85_021E7628
ov85_021E7628: ; 0x021E7628
	push {r3, lr}
	add r3, r0, #0
	add r3, #0xd4
	add r0, r3, #0
	add r1, r3, #0
	add r2, r3, #0
	add r0, #0x68
	add r1, #0xc
	add r2, #0x18
	add r3, #0x4c
	bl sub_020699D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov85_021E7628

	thumb_func_start ov85_021E7644
ov85_021E7644: ; 0x021E7644
	ldr r3, _021E764C ; =ov85_021E8530
	add r0, #0x3c
	bx r3
	nop
_021E764C: .word ov85_021E8530
	thumb_func_end ov85_021E7644

	thumb_func_start ov85_021E7650
ov85_021E7650: ; 0x021E7650
	ldr r3, _021E7654 ; =ov85_021E7660
	bx r3
	.balign 4, 0
_021E7654: .word ov85_021E7660
	thumb_func_end ov85_021E7650

	thumb_func_start ov85_021E7658
ov85_021E7658: ; 0x021E7658
	ldr r3, _021E765C ; =ov85_021E7734
	bx r3
	.balign 4, 0
_021E765C: .word ov85_021E7734
	thumb_func_end ov85_021E7658

	thumb_func_start ov85_021E7660
ov85_021E7660: ; 0x021E7660
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	mov r0, #0x66
	mov r1, #0
	str r0, [sp]
	mov r2, #0x36
	mov r5, #0x19
	lsl r5, r5, #4
	str r1, [sp, #4]
	lsl r2, r2, #6
	ldr r2, [r7, r2]
	add r0, r7, r5
	add r3, r1, #0
	bl sub_020696C4
	add r0, r7, r5
	bl sub_02069714
	mov r0, #0x66
	str r0, [sp]
	mov r1, #0
	mov r2, #0x36
	add r0, r7, r5
	str r1, [sp, #4]
	lsl r2, r2, #6
	ldr r2, [r7, r2]
	add r0, #0x14
	mov r3, #5
	bl sub_020696C4
	add r0, r7, r5
	add r0, #0x14
	bl sub_02069714
	add r4, r7, r5
	ldr r0, _021E772C ; =ov85_021EA558
	add r4, #0x28
	str r0, [sp, #0xc]
	ldr r0, _021E7730 ; =ov85_021EA580
	add r5, r7, r5
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0x10]
	add r5, #0x8c
	add r6, r4, #0
_021E76BC:
	mov r0, #0x66
	str r0, [sp]
	mov r0, #0
	mov r2, #0x36
	str r0, [sp, #4]
	ldr r3, [sp, #0xc]
	lsl r2, r2, #6
	ldr r2, [r7, r2]
	ldr r3, [r3]
	add r0, r4, #0
	mov r1, #0
	bl sub_020696C4
	add r0, r4, #0
	bl sub_02069714
	mov r0, #0x66
	str r0, [sp]
	mov r0, #0
	mov r2, #0x36
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	lsl r2, r2, #6
	ldr r2, [r7, r2]
	ldr r3, [r3]
	add r0, r5, #0
	mov r1, #0
	bl sub_020697DC
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x66
	bl sub_02069864
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02069884
	ldr r0, [sp, #0x10]
	add r4, #0x14
	add r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r5, #0x24
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r6, #0x14
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #5
	blt _021E76BC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E772C: .word ov85_021EA558
_021E7730: .word ov85_021EA580
	thumb_func_end ov85_021E7660

	thumb_func_start ov85_021E7734
ov85_021E7734: ; 0x021E7734
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x19
	add r5, r0, #0
	lsl r7, r7, #4
	add r0, r5, r7
	bl sub_02069784
	add r0, r5, r7
	add r0, #0x14
	bl sub_02069784
	add r4, r5, r7
	add r5, r5, r7
	mov r6, #0
	add r4, #0x28
	add r5, #0x8c
_021E7754:
	add r0, r4, #0
	bl sub_02069784
	add r0, r5, #0
	bl sub_02069818
	add r6, r6, #1
	add r4, #0x14
	add r5, #0x24
	cmp r6, #5
	blt _021E7754
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E7734

	thumb_func_start ov85_021E776C
ov85_021E776C: ; 0x021E776C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x19
	add r5, r0, #0
	add r0, r4, #0
	lsl r1, r1, #4
	add r0, #0x5c
	add r1, r5, r1
	bl sub_02069978
	mov r0, #1
	str r0, [r4, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl ov85_021E7A20
	add r0, r5, #0
	add r1, r4, #0
	bl ov85_021E7AC8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E776C

	thumb_func_start ov85_021E7798
ov85_021E7798: ; 0x021E7798
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x30]
	mov r1, #0x19
	lsl r1, r1, #4
	add r4, r5, r1
	str r0, [sp, #0xc]
	cmp r0, #0
	ble _021E7824
	sub r1, #0x50
	add r0, r4, r1
	str r0, [sp, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r4, r0
	str r0, [sp]
	ldr r0, _021E7828 ; =0x0000071C
	str r4, [sp, #4]
	add r7, r4, #0
	add r6, r4, r0
_021E77C6:
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E77DC
	mov r1, #0x41
	lsl r1, r1, #2
	ldr r0, [sp, #8]
	add r1, r5, r1
	bl ov85_021E78D8
_021E77DC:
	mov r0, #0x4b
	ldr r1, [sp, #4]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021E77F0
	ldr r1, [sp]
	add r0, r5, #0
	bl ov85_021E7A54
_021E77F0:
	ldr r0, _021E7828 ; =0x0000071C
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _021E7800
	add r0, r5, #0
	add r1, r6, #0
	bl ov85_021E7B04
_021E7800:
	ldr r0, [sp, #8]
	add r4, #0xb0
	add r0, #0xb0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r7, #0x68
	add r0, #0x7c
	str r0, [sp, #4]
	ldr r0, [sp]
	add r6, #0x68
	add r0, #0x7c
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _021E77C6
_021E7824:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7828: .word 0x0000071C
	thumb_func_end ov85_021E7798

	thumb_func_start ov85_021E782C
ov85_021E782C: ; 0x021E782C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x30]
	mov r7, #0
	str r1, [sp]
	mov r1, #0x19
	lsl r1, r1, #4
	add r2, r0, r1
	mov r0, #0x4b
	lsl r0, r0, #4
	add r4, r2, r0
	ldr r0, _021E78A0 ; =0x0000071C
	sub r1, #0x50
	add r5, r2, r0
	ldr r0, [sp]
	add r6, r2, r1
	cmp r0, #0
	ble _021E789E
_021E784E:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _021E7868
	add r0, r6, #0
	add r1, r6, #0
	add r2, r6, #0
	add r3, r6, #0
	add r0, #0x5c
	add r1, #0x44
	add r2, #0x38
	add r3, #0x24
	bl sub_020699D0
_021E7868:
	ldr r0, [r4]
	cmp r0, #0
	beq _021E7880
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, #0
	add r0, #0x24
	add r1, #0x18
	add r2, #0xc
	add r3, r4, #4
	bl sub_020699D0
_021E7880:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7890
	add r0, r5, #0
	add r0, #0x10
	add r1, r5, #4
	bl sub_020699BC
_021E7890:
	ldr r0, [sp]
	add r7, r7, #1
	add r6, #0xb0
	add r4, #0x7c
	add r5, #0x68
	cmp r7, r0
	blt _021E784E
_021E789E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E78A0: .word 0x0000071C
	thumb_func_end ov85_021E782C

	thumb_func_start ov85_021E78A4
ov85_021E78A4: ; 0x021E78A4
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r7, [r0, #0x30]
	mov r6, #0
	add r4, r0, r1
	cmp r7, #0
	ble _021E78D6
	sub r1, #0x34
	add r5, r4, r1
_021E78BA:
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E78CC
	ldr r1, [sp]
	add r0, r5, #0
	bl ov85_021E8530
_021E78CC:
	add r6, r6, #1
	add r4, #0xb0
	add r5, #0xb0
	cmp r6, r7
	blt _021E78BA
_021E78D6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E78A4

	thumb_func_start ov85_021E78D8
ov85_021E78D8: ; 0x021E78D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	add r4, r1, #0
	str r0, [sp]
	ldr r1, [r5, #0x20]
	add r0, sp, #0
	bl ov85_021E8530
	ldr r1, [sp]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r6, r0, #0x10
	add r0, r6, #0
	bl GF_CosDegNoWrap
	ldr r2, [r5, #0x50]
	ldr r1, [r4]
	add r2, r2, r1
	mov r1, #0x16
	mul r1, r0
	add r0, r2, r1
	str r0, [r5, #0x44]
	mov r0, #6
	ldr r1, [r5, #0x54]
	lsl r0, r0, #0xc
	sub r1, r1, r0
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r5, #0x48]
	add r0, r6, #0
	bl GF_SinDegNoWrap
	ldr r2, [r5, #0x58]
	ldr r1, [r4, #8]
	add r2, r2, r1
	mov r1, #0x16
	mul r1, r0
	add r0, r2, r1
	str r0, [r5, #0x4c]
	ldr r1, [r5, #0x2c]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r5, #0x24]
	ldr r1, [r5, #0x30]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r5, #0x26]
	ldr r1, [r5, #0x34]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	strh r0, [r5, #0x28]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov85_021E78D8

	thumb_func_start ov85_021E7958
ov85_021E7958: ; 0x021E7958
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	mov r1, #0x19
	ldr r6, [r0, #0x30]
	lsl r1, r1, #4
	add r1, r0, r1
	mov lr, r1
	ldr r0, [r0, #0x2c]
	mov r1, #0xa
	add r2, r6, #0
	mul r2, r1
	ldr r1, _021E7A18 ; =ov85_021EA7C4
	lsl r4, r0, #1
	add r0, r1, r2
	ldrh r0, [r4, r0]
	mov r3, #0
	add r1, sp, #4
	lsl r5, r0, #0xc
	ldr r0, _021E7A1C ; =0x0000FFFF
	add r2, sp, #0x18
_021E7980:
	stmia r1!, {r3}
	add r3, r3, #1
	stmia r2!, {r0}
	cmp r3, r6
	blt _021E7980
	mov r3, #0
	cmp r6, #0
	ble _021E79B8
	mov r0, #0x5a
	lsl r0, r0, #0xe
	mov r1, lr
	add r2, sp, #0x18
	add r7, r5, r0
_021E799A:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r4, [r1, r0]
	sub r0, r5, r4
	bpl _021E79A6
	sub r0, r7, r4
_021E79A6:
	asr r4, r0, #0xb
	lsr r4, r4, #0x14
	add r4, r0, r4
	asr r0, r4, #0xc
	add r3, r3, #1
	stmia r2!, {r0}
	add r1, #0xb0
	cmp r3, r6
	blt _021E799A
_021E79B8:
	mov r7, #1
	cmp r6, #1
	ble _021E7A02
	add r0, sp, #8
	str r0, [sp]
	add r5, sp, #0x18
_021E79C4:
	ldr r0, [sp]
	add r2, sp, #4
	ldr r0, [r0]
	mov ip, r0
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	sub r0, r7, #1
	lsl r3, r0, #2
	add r2, r2, r3
	b _021E79DE
_021E79D8:
	str r3, [r2, #4]
	sub r2, r2, #4
	sub r0, r0, #1
_021E79DE:
	cmp r0, #0
	blt _021E79EC
	ldr r3, [r2]
	lsl r4, r3, #2
	ldr r4, [r5, r4]
	cmp r4, r1
	bgt _021E79D8
_021E79EC:
	lsl r1, r0, #2
	add r0, sp, #4
	add r1, r0, r1
	mov r0, ip
	str r0, [r1, #4]
	ldr r0, [sp]
	add r7, r7, #1
	add r0, r0, #4
	str r0, [sp]
	cmp r7, r6
	blt _021E79C4
_021E7A02:
	mov r1, #5
	lsl r1, r1, #6
	mov r0, lr
	add r2, r0, r1
	ldr r1, [sp, #4]
	mov r0, #0xb0
	mul r0, r1
	add r0, r2, r0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_021E7A18: .word ov85_021EA7C4
_021E7A1C: .word 0x0000FFFF
	thumb_func_end ov85_021E7958

	thumb_func_start ov85_021E7A20
ov85_021E7A20: ; 0x021E7A20
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x19
	lsl r0, r0, #4
	add r3, r5, r0
	mov r0, #0x4b
	lsl r0, r0, #4
	add r2, r3, r0
	ldr r4, [r1, #0x10]
	mov r0, #0x7c
	mul r0, r4
	mov r6, #1
	add r4, r2, r0
	str r6, [r2, r0]
	add r0, r4, #0
	add r3, #0x14
	str r1, [r4, #0x78]
	add r0, #0x24
	add r1, r3, #0
	bl sub_02069978
	add r0, r5, #0
	add r1, r4, #0
	bl ov85_021E7A54
	pop {r4, r5, r6, pc}
	thumb_func_end ov85_021E7A20

	thumb_func_start ov85_021E7A54
ov85_021E7A54: ; 0x021E7A54
	push {r4, r5}
	add r3, r1, #0
	mov r0, #0
	strh r0, [r3, #4]
	strh r0, [r3, #6]
	strh r0, [r3, #8]
	ldr r5, [r3, #0x78]
	add r4, r3, #0
	add r5, #0x44
	add r4, #0x18
	ldmia r5!, {r0, r1}
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	ldr r0, [r3, #0x78]
	ldr r1, [r2]
	ldr r0, [r0, #0x50]
	sub r0, r1, r0
	str r0, [r2]
	ldr r0, [r3, #0x78]
	ldr r1, [r3, #0x1c]
	ldr r0, [r0, #0x54]
	sub r0, r1, r0
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x78]
	ldr r1, [r3, #0x20]
	ldr r0, [r0, #0x58]
	sub r0, r1, r0
	str r0, [r3, #0x20]
	mov r0, #2
	ldr r1, [r3, #0x1c]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x78]
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bge _021E7AA4
	neg r1, r1
_021E7AA4:
	asr r0, r1, #6
	lsr r0, r0, #0x19
	add r0, r1, r0
	asr r1, r0, #7
	mov r0, #2
	lsl r0, r0, #0xa
	cmp r1, r0
	ble _021E7AB6
	add r1, r0, #0
_021E7AB6:
	mov r0, #1
	lsl r0, r0, #0xc
	sub r0, r0, r1
	str r0, [r3, #0xc]
	str r0, [r3, #0x10]
	str r0, [r3, #0x14]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E7A54

	thumb_func_start ov85_021E7AC8
ov85_021E7AC8: ; 0x021E7AC8
	push {r3, r4, r5, lr}
	mov r2, #0x19
	lsl r2, r2, #4
	add r3, r0, r2
	ldr r0, _021E7B00 ; =0x0000071C
	ldr r4, [r1, #0x10]
	add r2, r3, r0
	add r5, r4, #0
	mov r0, #0x68
	mul r5, r0
	mov r4, #1
	str r4, [r2, r5]
	add r4, r3, #0
	add r0, r2, r5
	str r1, [r0, #0x64]
	ldr r2, [r1, #0x10]
	mov r1, #0x14
	add r4, #0x28
	mul r1, r2
	add r1, r4, r1
	mov r4, #0x24
	add r3, #0x8c
	mul r4, r2
	add r0, #0x10
	add r2, r3, r4
	bl sub_02069998
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7B00: .word 0x0000071C
	thumb_func_end ov85_021E7AC8

	thumb_func_start ov85_021E7B04
ov85_021E7B04: ; 0x021E7B04
	push {r3, r4, r5, lr}
	add r2, r1, #0
	ldr r5, [r2, #0x64]
	add r3, r0, #0
	add r5, #0x44
	ldmia r5!, {r0, r1}
	add r4, r2, #4
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	mov r0, #5
	ldr r1, [r2, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [r2, #8]
	mov r0, #0x87
	lsl r0, r0, #2
	add r3, r3, r0
	ldr r0, [r2, #0x64]
	mov r2, #1
	ldr r1, [r0, #0x10]
	mov r0, #0x24
	mul r0, r1
	mov r1, #1
	add r0, r3, r0
	lsl r1, r1, #0xc
	bl sub_020698E8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E7B04

	thumb_func_start ov85_021E7B40
ov85_021E7B40: ; 0x021E7B40
	push {r3, r4, r5, lr}
	ldr r4, [sp, #0x18]
	add r5, r0, #0
	str r1, [r4, #0xc]
	str r2, [r4, #0x10]
	ldr r0, [sp, #0x10]
	str r3, [r4, #0x14]
	str r2, [r4, #0x18]
	lsl r0, r0, #0xc
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x14]
	mov r1, #0x18
	lsl r0, r0, #0xc
	str r0, [r4, #0x20]
	mov r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #0x66
	bl AllocFromHeapAtEnd
	add r1, r0, #0
	add r3, r1, #0
	mov r2, #0x18
	mov r0, #0
_021E7B72:
	strb r0, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _021E7B72
	ldr r0, _021E7B88 ; =ov85_021E7B8C
	str r5, [r1, #0x14]
	mov r2, #0
	str r4, [r1, #0x10]
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7B88: .word ov85_021E7B8C
	thumb_func_end ov85_021E7B40

	thumb_func_start ov85_021E7B8C
ov85_021E7B8C: ; 0x021E7B8C
	push {r4, r5, r6, lr}
	ldr r4, _021E7BBC ; =ov85_021EA51C
	add r6, r0, #0
	add r5, r1, #0
_021E7B94:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _021E7B94
	cmp r0, #2
	bne _021E7BB8
	ldr r0, [r5, #0x10]
	mov r1, #1
	str r1, [r0, #8]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_021E7BB8:
	pop {r4, r5, r6, pc}
	nop
_021E7BBC: .word ov85_021EA51C
	thumb_func_end ov85_021E7B8C

	thumb_func_start ov85_021E7BC0
ov85_021E7BC0: ; 0x021E7BC0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	ldr r1, [r4, #0x10]
	lsl r0, r0, #0xc
	str r0, [r1, #0x38]
	str r0, [r1, #0x3c]
	str r0, [r1, #0x40]
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [r1, #0x54]
	ldr r0, [r4, #0x14]
	bl ov85_021E776C
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E7BC0

	thumb_func_start ov85_021E7BEC
ov85_021E7BEC: ; 0x021E7BEC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x54]
	sub r0, r1, r0
	str r0, [r4, #0x54]
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _021E7C14
	mov r0, #0x1a
	ldr r1, [r4, #0x54]
	lsl r0, r0, #0xe
	cmp r1, r0
	bgt _021E7C14
	mov r0, #1
	str r0, [r5, #8]
	ldr r0, _021E7C28 ; =0x0000064F
	bl PlaySE
_021E7C14:
	mov r0, #2
	ldr r1, [r4, #0x54]
	lsl r0, r0, #0x10
	cmp r1, r0
	bgt _021E7C24
	str r0, [r4, #0x54]
	mov r0, #2
	str r0, [r5]
_021E7C24:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7C28: .word 0x0000064F
	thumb_func_end ov85_021E7BEC

	thumb_func_start ov85_021E7C2C
ov85_021E7C2C: ; 0x021E7C2C
	push {r3, lr}
	mov r1, #1
	ldr r3, [r0, #0xc]
	lsl r1, r1, #0xc
	ldr r2, [r0, #0x10]
	cmp r3, r1
	ble _021E7C44
	sub r3, r3, r1
	str r3, [r0, #0xc]
	cmp r3, r1
	bge _021E7C44
	str r1, [r0, #0xc]
_021E7C44:
	ldr r3, [r2, #0x54]
	ldr r1, [r0, #0xc]
	sub r1, r3, r1
	str r1, [r2, #0x54]
	cmp r1, #0
	bgt _021E7C6A
	mov r1, #0
	str r1, [r2, #0x54]
	ldr r3, [r2, #0xc]
	ldr r0, [r0, #0x14]
	lsl r1, r3, #2
	add r1, r0, r1
	add r1, #0x98
	ldr r1, [r1]
	ldr r2, [r2, #0x14]
	bl ov85_021E73D4
	mov r0, #2
	pop {r3, pc}
_021E7C6A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov85_021E7C2C

	thumb_func_start ov85_021E7C70
ov85_021E7C70: ; 0x021E7C70
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5, #4]
	add r6, r0, #0
	ldr r4, [r5, #0x1c]
	cmp r1, #0
	beq _021E7C84
	cmp r1, #1
	beq _021E7C9A
	pop {r4, r5, r6, pc}
_021E7C84:
	add r1, r4, #0
	bl ov85_021E7E88
	mov r0, #1
	lsl r0, r0, #0xe
	str r0, [r5, #0x10]
	ldr r0, _021E7CDC ; =0xFFFFFBBC
	str r0, [r5, #0x14]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
_021E7C9A:
	ldr r1, [r4, #0x54]
	ldr r0, [r5, #0x10]
	add r0, r1, r0
	str r0, [r4, #0x54]
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #0x14]
	add r0, r1, r0
	str r0, [r5, #0x10]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #0xf
	blt _021E7CDA
	mov r1, #0
	str r1, [r5, #8]
	str r1, [r5, #0x10]
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _021E7CC6
	mov r0, #1
	str r0, [r5, #0xc]
	pop {r4, r5, r6, pc}
_021E7CC6:
	str r1, [r4, #0x54]
	add r0, r6, #0
	add r1, r4, #0
	bl ov85_021E7FC0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x20
	bl memset
_021E7CDA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E7CDC: .word 0xFFFFFBBC
	thumb_func_end ov85_021E7C70

	thumb_func_start ov85_021E7CE0
ov85_021E7CE0: ; 0x021E7CE0
	push {r4, r5, r6, lr}
	ldr r0, _021E7D04 ; =0x00000AB4
	add r6, r1, #0
	add r5, r6, r0
	mov r4, #0
_021E7CEA:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7CF8
	add r0, r6, #0
	add r1, r5, #0
	bl ov85_021E7C70
_021E7CF8:
	add r4, r4, #1
	add r5, #0x20
	cmp r4, #5
	blt _021E7CEA
	pop {r4, r5, r6, pc}
	nop
_021E7D04: .word 0x00000AB4
	thumb_func_end ov85_021E7CE0

	thumb_func_start ov85_021E7D08
ov85_021E7D08: ; 0x021E7D08
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E7D38 ; =0x00000AB4
	mov r1, #0
	add r0, r4, r0
	mov r2, #0xa0
	bl memset
	mov r2, #1
	ldr r0, _021E7D3C ; =ov85_021E7CE0
	add r1, r4, #0
	lsl r2, r2, #8
	bl CreateSysTask
	mov r1, #0xdb
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E7D34
	bl GF_AssertFail
_021E7D34:
	pop {r4, pc}
	nop
_021E7D38: .word 0x00000AB4
_021E7D3C: .word ov85_021E7CE0
	thumb_func_end ov85_021E7D08

	thumb_func_start ov85_021E7D40
ov85_021E7D40: ; 0x021E7D40
	mov r1, #0xdb
	lsl r1, r1, #4
	ldr r3, _021E7D4C ; =sub_0200E390
	ldr r0, [r0, r1]
	bx r3
	nop
_021E7D4C: .word DestroySysTask
	thumb_func_end ov85_021E7D40

	thumb_func_start ov85_021E7D50
ov85_021E7D50: ; 0x021E7D50
	push {r3, lr}
	ldr r2, _021E7D74 ; =0x00000AB4
	add r3, r0, r2
	mov r2, #0
_021E7D58:
	ldr r0, [r3]
	cmp r0, #0
	bne _021E7D66
	mov r0, #1
	str r0, [r3]
	str r1, [r3, #0x1c]
	pop {r3, pc}
_021E7D66:
	add r2, r2, #1
	add r3, #0x20
	cmp r2, #5
	blt _021E7D58
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
_021E7D74: .word 0x00000AB4
	thumb_func_end ov85_021E7D50

	thumb_func_start ov85_021E7D78
ov85_021E7D78: ; 0x021E7D78
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x19
	lsl r1, r1, #4
	add r4, r0, r1
	sub r1, #0x50
	ldr r7, [r0, #0x30]
	str r0, [sp]
	mov r6, #0
	add r5, r4, r1
_021E7D8A:
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7D9C
	ldr r0, [sp]
	add r1, r5, #0
	bl ov85_021E7D50
_021E7D9C:
	add r6, r6, #1
	add r4, #0xb0
	add r5, #0xb0
	cmp r6, r7
	blt _021E7D8A
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E7D78

	thumb_func_start ov85_021E7DA8
ov85_021E7DA8: ; 0x021E7DA8
	ldr r1, _021E7DC4 ; =0x00000AB4
	add r2, r0, r1
	mov r1, #0
_021E7DAE:
	ldr r0, [r2]
	cmp r0, #0
	beq _021E7DB8
	mov r0, #1
	bx lr
_021E7DB8:
	add r1, r1, #1
	add r2, #0x20
	cmp r1, #5
	blt _021E7DAE
	mov r0, #0
	bx lr
	.balign 4, 0
_021E7DC4: .word 0x00000AB4
	thumb_func_end ov85_021E7DA8

	thumb_func_start ov85_021E7DC8
ov85_021E7DC8: ; 0x021E7DC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r5, #0x10]
	cmp r0, #0
	beq _021E7DDA
	cmp r0, #1
	beq _021E7DEA
	pop {r3, r4, r5, pc}
_021E7DDA:
	mov r0, #6
	lsl r0, r0, #0xe
	str r0, [r5, #0xc]
	mov r0, #0
	str r0, [r4, #0x30]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
_021E7DEA:
	add r0, r4, #0
	ldr r1, [r5, #0xc]
	add r0, #0x30
	bl ov85_021E8530
	mov r0, #1
	ldr r1, [r4, #0x30]
	lsl r0, r0, #0xe
	cmp r1, r0
	bge _021E7E16
	ldr r1, [r5, #0xc]
	lsr r1, r1, #1
	str r1, [r5, #0xc]
	cmp r1, r0
	bge _021E7E16
	mov r1, #0
	str r1, [r4, #0x30]
	mov r0, #0x14
_021E7E0E:
	strb r1, [r5]
	add r5, r5, #1
	sub r0, r0, #1
	bne _021E7E0E
_021E7E16:
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E7DC8

	thumb_func_start ov85_021E7E18
ov85_021E7E18: ; 0x021E7E18
	push {r3, r4, r5, lr}
	ldr r0, _021E7E38 ; =0x00000B54
	mov r4, #0
	add r5, r1, r0
_021E7E20:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7E2C
	add r0, r5, #0
	bl ov85_021E7DC8
_021E7E2C:
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #5
	blt _021E7E20
	pop {r3, r4, r5, pc}
	nop
_021E7E38: .word 0x00000B54
	thumb_func_end ov85_021E7E18

	thumb_func_start ov85_021E7E3C
ov85_021E7E3C: ; 0x021E7E3C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E7E68 ; =0x00000B54
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x64
	bl memset
	ldr r0, _021E7E6C ; =ov85_021E7E18
	ldr r2, _021E7E70 ; =0x00000101
	add r1, r4, #0
	bl CreateSysTask
	ldr r1, _021E7E74 ; =0x00000DB4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E7E64
	bl GF_AssertFail
_021E7E64:
	pop {r4, pc}
	nop
_021E7E68: .word 0x00000B54
_021E7E6C: .word ov85_021E7E18
_021E7E70: .word 0x00000101
_021E7E74: .word 0x00000DB4
	thumb_func_end ov85_021E7E3C

	thumb_func_start ov85_021E7E78
ov85_021E7E78: ; 0x021E7E78
	ldr r1, _021E7E80 ; =0x00000DB4
	ldr r3, _021E7E84 ; =sub_0200E390
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021E7E80: .word 0x00000DB4
_021E7E84: .word DestroySysTask
	thumb_func_end ov85_021E7E78

	thumb_func_start ov85_021E7E88
ov85_021E7E88: ; 0x021E7E88
	push {r4, lr}
	ldr r2, _021E7ECC ; =0x00000B54
	mov r3, #0
	add r0, r0, r2
	add r4, r0, #0
_021E7E92:
	ldr r2, [r4]
	cmp r2, #1
	bne _021E7EA4
	ldr r2, [r4, #0x10]
	cmp r2, r1
	bne _021E7EA4
	mov r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
_021E7EA4:
	add r3, r3, #1
	add r4, #0x14
	cmp r3, #5
	blt _021E7E92
	mov r3, #0
_021E7EAE:
	ldr r2, [r0]
	cmp r2, #0
	bne _021E7EBC
	mov r2, #1
	str r2, [r0]
	str r1, [r0, #0x10]
	pop {r4, pc}
_021E7EBC:
	add r3, r3, #1
	add r0, #0x14
	cmp r3, #5
	blt _021E7EAE
	bl GF_AssertFail
	pop {r4, pc}
	nop
_021E7ECC: .word 0x00000B54
	thumb_func_end ov85_021E7E88

	thumb_func_start ov85_021E7ED0
ov85_021E7ED0: ; 0x021E7ED0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r5, #0x14]
	cmp r0, #0
	beq _021E7EE2
	cmp r0, #1
	beq _021E7EFA
	pop {r4, r5, r6, pc}
_021E7EE2:
	mov r0, #0
	str r0, [r4, #0x34]
	str r0, [r5, #0x10]
	mov r0, #0x1e
	lsl r0, r0, #0xc
	str r0, [r5, #8]
	mov r0, #5
	lsl r0, r0, #0xe
	str r0, [r5, #0xc]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
_021E7EFA:
	ldr r1, [r5, #0x10]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	ldr r2, [r5, #8]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r2, r1, #0xc
	add r1, r2, #0
	mul r1, r0
	mov r0, #0
	str r0, [r4, #0x34]
	add r0, r4, #0
	add r0, #0x34
	bl ov85_021E8530
	add r0, r5, #0
	ldr r1, [r5, #0xc]
	add r0, #0x10
	ldr r6, [r5, #0x10]
	bl ov85_021E8530
	ldr r0, [r5, #0x10]
	cmp r0, r6
	bge _021E7F4C
	ldr r0, [r5, #8]
	lsr r0, r0, #1
	str r0, [r5, #8]
	bne _021E7F4C
	mov r1, #0
	str r1, [r4, #0x34]
	mov r0, #0x18
_021E7F44:
	strb r1, [r5]
	add r5, r5, #1
	sub r0, r0, #1
	bne _021E7F44
_021E7F4C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov85_021E7ED0

	thumb_func_start ov85_021E7F50
ov85_021E7F50: ; 0x021E7F50
	push {r3, r4, r5, lr}
	ldr r0, _021E7F70 ; =0x00000BB8
	mov r4, #0
	add r5, r1, r0
_021E7F58:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7F64
	add r0, r5, #0
	bl ov85_021E7ED0
_021E7F64:
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #5
	blt _021E7F58
	pop {r3, r4, r5, pc}
	nop
_021E7F70: .word 0x00000BB8
	thumb_func_end ov85_021E7F50

	thumb_func_start ov85_021E7F74
ov85_021E7F74: ; 0x021E7F74
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E7FA0 ; =0x00000BB8
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x78
	bl memset
	ldr r0, _021E7FA4 ; =ov85_021E7F50
	ldr r2, _021E7FA8 ; =0x00000102
	add r1, r4, #0
	bl CreateSysTask
	ldr r1, _021E7FAC ; =0x00000DB8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E7F9C
	bl GF_AssertFail
_021E7F9C:
	pop {r4, pc}
	nop
_021E7FA0: .word 0x00000BB8
_021E7FA4: .word ov85_021E7F50
_021E7FA8: .word 0x00000102
_021E7FAC: .word 0x00000DB8
	thumb_func_end ov85_021E7F74

	thumb_func_start ov85_021E7FB0
ov85_021E7FB0: ; 0x021E7FB0
	ldr r1, _021E7FB8 ; =0x00000DB8
	ldr r3, _021E7FBC ; =sub_0200E390
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021E7FB8: .word 0x00000DB8
_021E7FBC: .word DestroySysTask
	thumb_func_end ov85_021E7FB0

	thumb_func_start ov85_021E7FC0
ov85_021E7FC0: ; 0x021E7FC0
	push {r4, lr}
	ldr r2, _021E8004 ; =0x00000BB8
	mov r3, #0
	add r0, r0, r2
	add r4, r0, #0
_021E7FCA:
	ldr r2, [r4]
	cmp r2, #1
	bne _021E7FDC
	ldr r2, [r4, #0x14]
	cmp r2, r1
	bne _021E7FDC
	mov r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
_021E7FDC:
	add r3, r3, #1
	add r4, #0x18
	cmp r3, #5
	blt _021E7FCA
	mov r3, #0
_021E7FE6:
	ldr r2, [r0]
	cmp r2, #0
	bne _021E7FF4
	mov r2, #1
	str r2, [r0]
	str r1, [r0, #0x14]
	pop {r4, pc}
_021E7FF4:
	add r3, r3, #1
	add r0, #0x18
	cmp r3, #5
	blt _021E7FE6
	bl GF_AssertFail
	pop {r4, pc}
	nop
_021E8004: .word 0x00000BB8
	thumb_func_end ov85_021E7FC0

	thumb_func_start ov85_021E8008
ov85_021E8008: ; 0x021E8008
	push {r4, lr}
	add r4, r1, #0
	ldr r2, [r4]
	add r1, r0, #0
	add r1, #0xd4
	cmp r2, #5
	bhi _021E80C6
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E8022: ; jump table
	.short _021E80C6 - _021E8022 - 2 ; case 0
	.short _021E802E - _021E8022 - 2 ; case 1
	.short _021E803E - _021E8022 - 2 ; case 2
	.short _021E8056 - _021E8022 - 2 ; case 3
	.short _021E807C - _021E8022 - 2 ; case 4
	.short _021E80AE - _021E8022 - 2 ; case 5
_021E802E:
	mov r0, #1
	lsl r0, r0, #0xe
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0xc]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021E803E:
	mov r0, #1
	ldr r2, [r1, #0x34]
	lsl r0, r0, #0xc
	sub r2, r2, r0
	ldr r0, _021E80C8 ; =0xFFFF8000
	str r2, [r1, #0x34]
	cmp r2, r0
	bgt _021E80C6
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_021E8056:
	mov r2, #2
	ldr r3, [r1, #0x34]
	lsl r2, r2, #0xc
	add r2, r3, r2
	str r2, [r1, #0x34]
	bmi _021E80C6
	mov r2, #0
	str r2, [r1, #0x34]
	bl ov85_021E7D78
	mov r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldr r0, _021E80CC ; =0x00000656
	bl PlaySE
	pop {r4, pc}
_021E807C:
	ldr r0, [r4, #0x10]
	str r0, [r1, #0x28]
	ldr r0, [r4, #0x10]
	neg r0, r0
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	add r2, r0, #1
	mov r0, #3
	str r2, [r4, #0xc]
	tst r0, r2
	bne _021E80C6
	mov r0, #1
	ldr r2, [r4, #0x10]
	lsl r0, r0, #0xc
	cmp r2, r0
	bgt _021E80A8
	mov r0, #0
	str r0, [r1, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_021E80A8:
	asr r0, r2, #1
	str r0, [r4, #0x10]
	pop {r4, pc}
_021E80AE:
	bl ov85_021E7DA8
	cmp r0, #0
	bne _021E80C6
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #4]
	str r0, [r4]
	mov r0, #0x63
	lsl r0, r0, #4
	bl PlaySE
_021E80C6:
	pop {r4, pc}
	.balign 4, 0
_021E80C8: .word 0xFFFF8000
_021E80CC: .word 0x00000656
	thumb_func_end ov85_021E8008

	thumb_func_start ov85_021E80D0
ov85_021E80D0: ; 0x021E80D0
	mov r2, #0xc3
	ldr r3, _021E80DC ; =ov85_021E8008
	lsl r2, r2, #4
	add r0, r1, #0
	add r1, r1, r2
	bx r3
	.balign 4, 0
_021E80DC: .word ov85_021E8008
	thumb_func_end ov85_021E80D0

	thumb_func_start ov85_021E80E0
ov85_021E80E0: ; 0x021E80E0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xc3
	lsl r0, r0, #4
	add r2, r4, r0
	mov r1, #0x14
	mov r0, #0
_021E80EE:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E80EE
	ldr r0, _021E8110 ; =ov85_021E80D0
	add r1, r4, #0
	mov r2, #0xff
	bl CreateSysTask
	ldr r1, _021E8114 ; =0x00000DBC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E810E
	bl GF_AssertFail
_021E810E:
	pop {r4, pc}
	.balign 4, 0
_021E8110: .word ov85_021E80D0
_021E8114: .word 0x00000DBC
	thumb_func_end ov85_021E80E0

	thumb_func_start ov85_021E8118
ov85_021E8118: ; 0x021E8118
	ldr r1, _021E8120 ; =0x00000DBC
	ldr r3, _021E8124 ; =sub_0200E390
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021E8120: .word 0x00000DBC
_021E8124: .word DestroySysTask
	thumb_func_end ov85_021E8118

	thumb_func_start ov85_021E8128
ov85_021E8128: ; 0x021E8128
	push {r4, lr}
	mov r1, #0xc3
	lsl r1, r1, #4
	add r4, r0, r1
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E813A
	bl GF_AssertFail
_021E813A:
	mov r0, #1
	str r0, [r4, #8]
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E8128

	thumb_func_start ov85_021E8144
ov85_021E8144: ; 0x021E8144
	ldr r1, _021E814C ; =0x00000C34
	ldr r0, [r0, r1]
	bx lr
	nop
_021E814C: .word 0x00000C34
	thumb_func_end ov85_021E8144

	thumb_func_start ov85_021E8150
ov85_021E8150: ; 0x021E8150
	ldr r1, _021E8158 ; =0x00000C38
	ldr r0, [r0, r1]
	bx lr
	nop
_021E8158: .word 0x00000C38
	thumb_func_end ov85_021E8150

	thumb_func_start ov85_021E815C
ov85_021E815C: ; 0x021E815C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8172
	cmp r0, #1
	beq _021E81C6
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E8172:
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bge _021E81A8
	ldr r5, _021E81DC ; =ov85_021EA528
	add r3, sp, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0
	bgt _021E81A8
	mov r0, #0x1e
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
_021E81A8:
	mov r1, #6
	ldr r0, [r4, #0x14]
	lsl r1, r1, #0xa
	bl sub_0200DC34
	ldr r0, [r4, #0x14]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021E81D8
	ldr r0, [r4]
	add sp, #0x10
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E81C6:
	ldr r0, [r4, #0x14]
	bl sub_0200D9DC
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_021E81D8:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E81DC: .word ov85_021EA528
	thumb_func_end ov85_021E815C

	thumb_func_start ov85_021E81E0
ov85_021E81E0: ; 0x021E81E0
	push {r4, r5, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #0x66
	mov r1, #0x18
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x18
	mov r0, #0
_021E81F6:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E81F6
	mov r1, #0x80
	add r0, sp, #0
	strh r1, [r0]
	mov r1, #0x64
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x14]
	mov r0, #5
	str r0, [sp, #0x18]
	mov r0, #6
	str r0, [sp, #0x1c]
	mov r0, #7
	str r0, [sp, #0x20]
	sub r0, #8
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x2c]
	str r1, [sp, #0x30]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, #0
	add r1, sp, #0
	bl ov85_021E7044
	str r0, [r4, #0x14]
	bl sub_0200DC18
	ldr r0, _021E8258 ; =ov85_021E815C
	add r1, r4, #0
	mov r2, #0
	str r5, [r4, #0x10]
	bl CreateSysTask
	add r4, r0, #0
	bne _021E8252
	bl GF_AssertFail
_021E8252:
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, pc}
	.balign 4, 0
_021E8258: .word ov85_021E815C
	thumb_func_end ov85_021E81E0

	thumb_func_start ov85_021E825C
ov85_021E825C: ; 0x021E825C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrh r1, [r4]
	add r5, r0, #0
	cmp r1, #4
	bhi _021E82DC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E8274: ; jump table
	.short _021E82DC - _021E8274 - 2 ; case 0
	.short _021E827E - _021E8274 - 2 ; case 1
	.short _021E8292 - _021E8274 - 2 ; case 2
	.short _021E82AE - _021E8274 - 2 ; case 3
	.short _021E82C8 - _021E8274 - 2 ; case 4
_021E827E:
	bl ov85_021E6DF0
	ldr r0, _021E82E0 ; =0x000005E4
	bl PlaySE
	mov r0, #0
	str r0, [r4, #4]
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021E8292:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #2
	blt _021E82DC
	mov r0, #0
	str r0, [r4, #4]
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	add r0, r5, #0
	bl ov85_021E6E08
	pop {r3, r4, r5, pc}
_021E82AE:
	ldr r1, [r4, #4]
	add r1, r1, #1
	str r1, [r4, #4]
	cmp r1, #4
	blt _021E82DC
	bl ov85_021E6DF0
	mov r0, #0
	str r0, [r4, #4]
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	pop {r3, r4, r5, pc}
_021E82C8:
	ldr r1, [r4, #4]
	add r1, r1, #1
	str r1, [r4, #4]
	cmp r1, #2
	blt _021E82DC
	bl ov85_021E6DFC
	mov r0, #0
	strh r0, [r4, #2]
	strh r0, [r4]
_021E82DC:
	pop {r3, r4, r5, pc}
	nop
_021E82E0: .word 0x000005E4
	thumb_func_end ov85_021E825C

	thumb_func_start ov85_021E82E4
ov85_021E82E4: ; 0x021E82E4
	ldr r2, _021E82F0 ; =0x00000C44
	ldr r3, _021E82F4 ; =ov85_021E825C
	add r0, r1, #0
	add r1, r1, r2
	bx r3
	nop
_021E82F0: .word 0x00000C44
_021E82F4: .word ov85_021E825C
	thumb_func_end ov85_021E82E4

	thumb_func_start ov85_021E82F8
ov85_021E82F8: ; 0x021E82F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E8330 ; =0x00000C44
	ldr r2, _021E8334 ; =0x00000103
	add r1, r4, r0
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	ldr r0, _021E8338 ; =ov85_021E82E4
	add r1, r4, #0
	bl CreateSysTask
	mov r1, #0x37
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E832C
	bl GF_AssertFail
_021E832C:
	pop {r4, pc}
	nop
_021E8330: .word 0x00000C44
_021E8334: .word 0x00000103
_021E8338: .word ov85_021E82E4
	thumb_func_end ov85_021E82F8

	thumb_func_start ov85_021E833C
ov85_021E833C: ; 0x021E833C
	mov r1, #0x37
	lsl r1, r1, #6
	ldr r3, _021E8348 ; =sub_0200E390
	ldr r0, [r0, r1]
	bx r3
	nop
_021E8348: .word DestroySysTask
	thumb_func_end ov85_021E833C

	thumb_func_start ov85_021E834C
ov85_021E834C: ; 0x021E834C
	ldr r1, _021E8354 ; =0x00000C46
	ldrh r0, [r0, r1]
	bx lr
	nop
_021E8354: .word 0x00000C46
	thumb_func_end ov85_021E834C

	thumb_func_start ov85_021E8358
ov85_021E8358: ; 0x021E8358
	push {r4, lr}
	ldr r1, _021E8370 ; =0x00000C44
	add r4, r0, r1
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _021E8368
	bl GF_AssertFail
_021E8368:
	mov r0, #1
	strh r0, [r4, #2]
	strh r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_021E8370: .word 0x00000C44
	thumb_func_end ov85_021E8358

	thumb_func_start ov85_021E8374
ov85_021E8374: ; 0x021E8374
	ldr r0, [r1]
	cmp r0, #0
	beq _021E83BA
	cmp r0, #1
	beq _021E8384
	cmp r0, #2
	beq _021E83A8
	bx lr
_021E8384:
	ldr r0, [r1, #4]
	lsl r2, r0, #2
	ldr r0, _021E83BC ; =_021EAA80
	ldr r0, [r0, r2]
	lsl r2, r0, #0xc
	ldr r0, [r1, #0xc]
	str r2, [r0, #0x54]
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
	cmp r0, #0x10
	blt _021E83BA
	mov r0, #0
	str r0, [r1, #4]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
	bx lr
_021E83A8:
	ldr r0, [r1, #8]
	add r0, r0, #1
	str r0, [r1, #8]
	cmp r0, #0xf
	blt _021E83BA
	mov r0, #0
	str r0, [r1, #8]
	mov r0, #1
	str r0, [r1]
_021E83BA:
	bx lr
	.balign 4, 0
_021E83BC: .word _021EAA80
	thumb_func_end ov85_021E8374

	thumb_func_start ov85_021E83C0
ov85_021E83C0: ; 0x021E83C0
	push {r4, r5, r6, lr}
	ldr r0, _021E83DC ; =0x00000C4C
	add r6, r1, #0
	add r5, r6, r0
	mov r4, #0
_021E83CA:
	add r0, r6, #0
	add r1, r5, #0
	bl ov85_021E8374
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #5
	blt _021E83CA
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E83DC: .word 0x00000C4C
	thumb_func_end ov85_021E83C0

	thumb_func_start ov85_021E83E0
ov85_021E83E0: ; 0x021E83E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E840C ; =0x00000C4C
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x50
	bl memset
	mov r2, #0x41
	ldr r0, _021E8410 ; =ov85_021E83C0
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	ldr r1, _021E8414 ; =0x00000DC4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E840A
	bl GF_AssertFail
_021E840A:
	pop {r4, pc}
	.balign 4, 0
_021E840C: .word 0x00000C4C
_021E8410: .word ov85_021E83C0
_021E8414: .word 0x00000DC4
	thumb_func_end ov85_021E83E0

	thumb_func_start ov85_021E8418
ov85_021E8418: ; 0x021E8418
	ldr r1, _021E8420 ; =0x00000DC4
	ldr r3, _021E8424 ; =sub_0200E390
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021E8420: .word 0x00000DC4
_021E8424: .word DestroySysTask
	thumb_func_end ov85_021E8418

	thumb_func_start ov85_021E8428
ov85_021E8428: ; 0x021E8428
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r1, _021E8450 ; =0x00000C4C
	ldr r2, [r5, #0xc]
	add r1, r0, r1
	lsl r0, r2, #4
	add r4, r1, r0
	cmp r2, #5
	blt _021E843E
	bl GF_AssertFail
_021E843E:
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8448
	bl GF_AssertFail
_021E8448:
	mov r0, #1
	str r0, [r4]
	str r5, [r4, #0xc]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8450: .word 0x00000C4C
	thumb_func_end ov85_021E8428

	thumb_func_start ov85_021E8454
ov85_021E8454: ; 0x021E8454
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	ldr r0, [r0, #0x20]
	mov r1, #0x19
	str r0, [sp, #4]
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r7, [r0, #0x30]
	mov r6, #0
	add r4, r0, r1
	cmp r7, #0
	ble _021E84A0
	sub r1, #0x50
	add r5, r4, r1
_021E8472:
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E8496
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #1
	add r2, r0, #0
	lsl r2, r1
	ldr r0, [sp, #4]
	tst r0, r2
	beq _021E8496
	ldr r0, [sp]
	add r1, r5, #0
	bl ov85_021E8428
_021E8496:
	add r6, r6, #1
	add r4, #0xb0
	add r5, #0xb0
	cmp r6, r7
	blt _021E8472
_021E84A0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov85_021E8454

	thumb_func_start ov85_021E84A4
ov85_021E84A4: ; 0x021E84A4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #4]
	mov r4, #0
	cmp r0, #1
	ldr r0, [r5, #8]
	bne _021E84C2
	sub r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #0
	bgt _021E84D0
	str r4, [r5, #8]
	mov r4, #1
	b _021E84D0
_021E84C2:
	add r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #8
	blt _021E84D0
	mov r0, #8
	str r0, [r5, #8]
	mov r4, #1
_021E84D0:
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov85_021E6EA8
	cmp r4, #1
	bne _021E84E8
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_021E84E8:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov85_021E84A4

	thumb_func_start ov85_021E84EC
ov85_021E84EC: ; 0x021E84EC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021E8528 ; =ov85_021EA4F0
	add r4, r1, #0
	ldr r1, [r0, #0x1c]
	ldr r0, [r0, #0x20]
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0x66
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r1, r0, #0
	str r5, [r1]
	lsl r2, r4, #2
	add r0, sp, #0
	ldr r0, [r0, r2]
	str r4, [r1, #4]
	str r0, [r1, #8]
	ldr r0, _021E852C ; =ov85_021E84A4
	mov r2, #0
	bl CreateSysTask
	cmp r0, #0
	bne _021E8524
	bl GF_AssertFail
_021E8524:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8528: .word ov85_021EA4F0
_021E852C: .word ov85_021E84A4
	thumb_func_end ov85_021E84EC

	thumb_func_start ov85_021E8530
ov85_021E8530: ; 0x021E8530
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	add r0, r0, r1
	str r0, [r4]
	bpl _021E8548
	mov r0, #0x5a
	lsl r0, r0, #0xe
_021E8540:
	ldr r1, [r4]
	add r1, r1, r0
	str r1, [r4]
	bmi _021E8540
_021E8548:
	mov r1, #0x5a
	ldr r0, [r4]
	lsl r1, r1, #0xe
	bl _s32_div_f
	str r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E8530

	thumb_func_start ov85_021E8558
ov85_021E8558: ; 0x021E8558
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0xd4
	bl ov85_021E7644
	add r0, r5, #0
	add r1, r4, #0
	bl ov85_021E78A4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E8558

	thumb_func_start ov85_021E8570
ov85_021E8570: ; 0x021E8570
	ldr r1, [r0, #8]
	add r2, r1, #1
	mov r1, #0x96
	lsl r1, r1, #2
	str r2, [r0, #8]
	cmp r2, r1
	bge _021E8582
	mov r0, #0
	bx lr
_021E8582:
	str r1, [r0, #8]
	mov r0, #1
	bx lr
	thumb_func_end ov85_021E8570

	thumb_func_start ov85_021E8588
ov85_021E8588: ; 0x021E8588
	push {r4, r5, r6, lr}
	add r4, r0, #0
	mov r0, #0x36
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r6, r1, #0
	add r5, r2, #0
	bl NARC_GetMemberSize
	add r1, r0, #0
	cmp r5, #1
	bne _021E85A8
	mov r0, #0x66
	bl AllocFromHeap
	b _021E85AE
_021E85A8:
	mov r0, #0x66
	bl AllocFromHeapAtEnd
_021E85AE:
	add r5, r0, #0
	mov r0, #0x36
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, r6, #0
	add r2, r5, #0
	bl NARC_ReadWholeMember
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov85_021E8588

	thumb_func_start ov85_021E85C4
ov85_021E85C4: ; 0x021E85C4
	cmp r1, #0
	beq _021E85CA
	str r1, [r0, #0x34]
_021E85CA:
	bx lr
	thumb_func_end ov85_021E85C4

	thumb_func_start ov85_021E85CC
ov85_021E85CC: ; 0x021E85CC
	mov r2, #1
	str r2, [r0, #0x3c]
	ldrh r3, [r1]
	add r2, r0, #0
	add r2, #0x58
	strh r3, [r2]
	add r2, r0, #0
	ldrh r3, [r1, #2]
	add r2, #0x5a
	strh r3, [r2]
	add r2, r0, #0
	ldrh r3, [r1, #4]
	add r2, #0x5c
	add r0, #0x5e
	strh r3, [r2]
	ldrh r1, [r1, #6]
	strh r1, [r0]
	bx lr
	thumb_func_end ov85_021E85CC

	thumb_func_start ov85_021E85F0
ov85_021E85F0: ; 0x021E85F0
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0x20
	blo _021E85FC
	bl GF_AssertFail
_021E85FC:
	add r0, r4, #0
	add r0, #0xac
	mov r1, #0
	mov r2, #0x20
	bl memset
	add r4, #0xac
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E85F0

	thumb_func_start ov85_021E8610
ov85_021E8610: ; 0x021E8610
	add r0, #0xac
	bx lr
	thumb_func_end ov85_021E8610

	thumb_func_start ov85_021E8614
ov85_021E8614: ; 0x021E8614
	add r0, #0xd0
	ldr r0, [r0]
	add r0, #0x40
	ldrh r0, [r0]
	tst r0, r1
	beq _021E8624
	mov r0, #1
	bx lr
_021E8624:
	mov r0, #0
	bx lr
	thumb_func_end ov85_021E8614

	thumb_func_start ov85_021E8628
ov85_021E8628: ; 0x021E8628
	push {r3, r4}
	add r1, r0, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r1, #0xcc
	ldr r1, [r1]
	add r0, #0x42
	ldr r1, [r1, #8]
	ldrh r4, [r0]
	mov r2, #0
	sub r3, r1, #1
	cmp r4, #0
	beq _021E864E
	mov r0, #1
_021E8644:
	add r1, r4, #0
	and r1, r0
	add r2, r2, r1
	lsr r4, r4, #1
	bne _021E8644
_021E864E:
	cmp r2, r3
	blt _021E8658
	mov r0, #1
	pop {r3, r4}
	bx lr
_021E8658:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E8628

	thumb_func_start ov85_021E8660
ov85_021E8660: ; 0x021E8660
	add r0, #0xd0
	ldr r0, [r0]
	mov r2, #0
	add r0, #0x42
	ldrh r3, [r0]
	cmp r3, #0
	beq _021E867A
	mov r0, #1
_021E8670:
	add r1, r3, #0
	and r1, r0
	add r2, r2, r1
	lsr r3, r3, #1
	bne _021E8670
_021E867A:
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E8660

	thumb_func_start ov85_021E8680
ov85_021E8680: ; 0x021E8680
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4]
	lsl r2, r0, #2
	add r0, r5, r2
	add r0, #0x70
	strh r1, [r0]
	add r0, r5, r2
	ldrh r1, [r4, #2]
	add r0, #0x72
	strh r1, [r0]
	bl sub_0203769C
	ldrh r1, [r4, #2]
	cmp r1, r0
	bne _021E86A8
	ldrh r0, [r4]
	str r0, [r5, #0x2c]
_021E86A8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E8680

	thumb_func_start ov85_021E86AC
ov85_021E86AC: ; 0x021E86AC
	str r1, [r0, #0x30]
	bx lr
	thumb_func_end ov85_021E86AC

	thumb_func_start ov85_021E86B0
ov85_021E86B0: ; 0x021E86B0
	cmp r1, #0
	beq _021E86C8
	add r0, #0xd0
	ldr r0, [r0]
	add r0, #0x42
	ldrh r2, [r0]
	mov r0, #1
	lsl r0, r1
	tst r0, r2
	bne _021E86C8
	mov r0, #0
	bx lr
_021E86C8:
	mov r0, #1
	bx lr
	thumb_func_end ov85_021E86B0

	thumb_func_start ov85_021E86CC
ov85_021E86CC: ; 0x021E86CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r5, r1, #0
	ldr r6, [r4, #0x24]
	bl sub_02097018
	add r7, r0, #0
	lsl r0, r5, #2
	add r0, r4, r0
	add r4, #0xcc
	ldr r1, [r4]
	ldr r5, [r0, #0x44]
	ldr r1, [r1, #4]
	add r0, r6, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	bl sub_0203769C
	bl sub_02034818
	add r1, r0, #0
	mov r0, #0xb
	str r0, [sp]
	add r0, r5, #0
	mov r2, #5
	mov r3, #0
	bl MonSetTrainerMemo
	add r0, r5, #0
	add r1, r4, #0
	bl CopyPokemonToPokemon
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov85_021E86CC

	thumb_func_start ov85_021E8720
ov85_021E8720: ; 0x021E8720
	add r0, #0xd0
	ldr r1, [r0]
	mov r0, #0x46
	ldrsh r3, [r1, r0]
	mov r2, #0
	cmp r3, #0
	beq _021E873A
	mov r0, #1
_021E8730:
	add r1, r3, #0
	and r1, r0
	add r2, r2, r1
	lsr r3, r3, #1
	bne _021E8730
_021E873A:
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E8720

	thumb_func_start ov85_021E8740
ov85_021E8740: ; 0x021E8740
	lsl r1, r1, #2
	add r0, r0, r1
	str r2, [r0, #0x44]
	bx lr
	thumb_func_end ov85_021E8740

	thumb_func_start ov85_021E8748
ov85_021E8748: ; 0x021E8748
	push {r3, r4}
	add r4, r0, #0
	add r4, #0x60
	mov r3, #8
_021E8750:
	ldrh r2, [r1]
	add r1, r1, #2
	strh r2, [r4]
	add r4, r4, #2
	sub r3, r3, #1
	bne _021E8750
	mov r1, #1
	str r1, [r0, #0x40]
	pop {r3, r4}
	bx lr
	thumb_func_end ov85_021E8748

	thumb_func_start ov85_021E8764
ov85_021E8764: ; 0x021E8764
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	mov r1, #0x11
	add r3, r0, #0
	lsl r1, r1, #4
	ldr r1, [r3, r1]
	add r0, sp, #0x14
	neg r1, r1
	add r4, r2, #0
	bl ov85_021E8530
	ldr r0, [sp, #0x14]
	ldr r1, _021E87E8 ; =0xFFFFC000
	str r0, [sp]
	add r0, sp, #0
	bl ov85_021E8530
	ldr r1, [sp]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r5, r0, #0xc
	ldr r0, [sp, #0x14]
	mov r1, #5
	str r0, [sp]
	add r0, sp, #0
	lsl r1, r1, #0xc
	bl ov85_021E8530
	ldr r1, [sp]
	ldr r2, _021E87EC ; =ov85_021EA758
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	lsl r1, r4, #3
	add r3, r2, r1
	ldr r2, [r2, r1]
	asr r0, r0, #0xc
	ldr r3, [r3, #4]
	cmp r2, #0
	beq _021E87DC
_021E87B6:
	ldrh r4, [r3]
	cmp r5, r4
	blo _021E87C2
	ldrh r1, [r3, #2]
	cmp r5, r1
	bls _021E87CC
_021E87C2:
	cmp r0, r4
	blo _021E87D6
	ldrh r1, [r3, #2]
	cmp r0, r1
	bhi _021E87D6
_021E87CC:
	mov r0, #1
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
_021E87D6:
	add r3, r3, #4
	sub r2, r2, #1
	bne _021E87B6
_021E87DC:
	mov r0, #0
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_021E87E8: .word 0xFFFFC000
_021E87EC: .word ov85_021EA758
	thumb_func_end ov85_021E8764

	thumb_func_start ov85_021E87F0
ov85_021E87F0: ; 0x021E87F0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _021E882E
_021E8800:
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _021E8828
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _021E8828
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E8828:
	add r5, r5, #1
	cmp r5, r6
	blt _021E8800
_021E882E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov85_021E87F0

	thumb_func_start ov85_021E8834
ov85_021E8834: ; 0x021E8834
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x24]
	bl ov85_021E87F0
	cmp r0, #1
	bne _021E8846
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E8846:
	mov r4, #0
_021E8848:
	add r0, r5, #0
	add r1, r4, #0
	bl ov85_021E86B0
	cmp r0, #0
	beq _021E886C
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_02097018
	bl ov85_021E87F0
	cmp r0, #1
	bne _021E886C
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E886C:
	add r4, r4, #1
	cmp r4, #5
	blt _021E8848
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E8834

	thumb_func_start ov85_021E8878
ov85_021E8878: ; 0x021E8878
	add r0, #0xd0
	ldr r0, [r0]
	mov r2, #0
	add r0, #0x4a
	ldrh r3, [r0]
	cmp r3, #0
	beq _021E8892
	mov r0, #1
_021E8888:
	add r1, r3, #0
	and r1, r0
	add r2, r2, r1
	lsr r3, r3, #1
	bne _021E8888
_021E8892:
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E8878

	thumb_func_start ov85_021E8898
ov85_021E8898: ; 0x021E8898
	add r0, #0xd0
	ldr r0, [r0]
	add r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	beq _021E88A8
	mov r0, #1
	bx lr
_021E88A8:
	mov r0, #0
	bx lr
	thumb_func_end ov85_021E8898

	thumb_func_start ov85_021E88AC
ov85_021E88AC: ; 0x021E88AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	add r6, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _021E88C8
	cmp r0, #1
	bne _021E88C6
	b _021E89E4
_021E88C6:
	b _021E89EE
_021E88C8:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E89F4 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E89F8 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #3
	mov r1, #0x66
	lsl r2, r2, #7
	bl CreateHeap
	mov r0, #0xd9
	mov r1, #0x66
	bl NARC_ctor
	add r7, r0, #0
	bne _021E890A
	bl GF_AssertFail
_021E890A:
	ldr r1, _021E89FC ; =0x00004AB0
	add r0, r4, #0
	mov r2, #0x66
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E89FC ; =0x00004AB0
	add r4, r0, #0
	mov r1, #0
	bl memset
	str r4, [r6, #0x38]
	str r6, [r4, #0xc]
	ldr r0, [r6, #0x30]
	str r0, [r4, #0x10]
	mov r0, #0x66
	bl BgConfig_Alloc
	str r0, [r4, #0x14]
	mov r0, #0x66
	bl ScrStrBufs_new
	str r0, [r4, #0x34]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xcf
	mov r3, #0x66
	bl NewMsgDataFromNarc
	str r0, [r4, #0x38]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	bl ov85_021E8C3C
	ldr r0, [r4, #0x14]
	bl ov85_021E8C5C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x66
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #0x11
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	add r1, r7, #0
	bl ov85_021E8E6C
	ldr r0, _021E8A00 ; =ov85_021E8C14
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	add r1, r7, #0
	bl ov85_021E8D64
	bl ov85_021E8F58
	add r0, r4, #0
	add r1, r7, #0
	bl ov85_021E8F88
	add r0, r4, #0
	bl ov85_021E9084
	add r0, r4, #0
	bl ov85_021E9160
	mov r1, #0
	mov r0, #0x34
	add r2, r1, #0
	bl sub_02004EC4
	ldr r0, [r6, #0x30]
	bl sub_02096CE0
	bl sub_0203897C
	mov r0, #3
	bl sub_02038C1C
	bl sub_0203769C
	cmp r0, #0
	bne _021E89C6
	mov r0, #0xd
	bl sub_0205A904
_021E89C6:
	bl sub_0203A880
	ldr r0, _021E8A04 ; =ov85_021E8BB0
	add r1, r4, #0
	mov r2, #5
	bl sub_0200E33C
	str r0, [r4, #0x30]
	add r0, r7, #0
	bl NARC_dtor
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E89EE
_021E89E4:
	mov r0, #0
	str r0, [r5]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E89EE:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E89F4: .word 0xFFFFE0FF
_021E89F8: .word 0x04001000
_021E89FC: .word 0x00004AB0
_021E8A00: .word ov85_021E8C14
_021E8A04: .word ov85_021E8BB0
	thumb_func_end ov85_021E88AC

	thumb_func_start ov85_021E8A08
ov85_021E8A08: ; 0x021E8A08
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E8A1E
	ldr r0, _021E8AFC ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
_021E8A1E:
	bl sub_0203769C
	cmp r0, #0
	bne _021E8A3A
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _021E8A3A
	bl sub_02033250
	ldr r2, [r4, #0x10]
	ldr r1, [r2, #0x30]
	and r0, r1
	str r0, [r2, #0x30]
_021E8A3A:
	ldr r1, [r4]
	cmp r1, #3
	bhi _021E8AF0
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E8A4C: ; jump table
	.short _021E8A54 - _021E8A4C - 2 ; case 0
	.short _021E8A7E - _021E8A4C - 2 ; case 1
	.short _021E8ACC - _021E8A4C - 2 ; case 2
	.short _021E8AE4 - _021E8A4C - 2 ; case 3
_021E8A54:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E8AF0
	mov r0, #1
	str r0, [r4]
	bl sub_0203769C
	cmp r0, #0
	beq _021E8AF0
	bl ov85_021E9FD0
	cmp r0, #2
	ble _021E8AF0
	mov r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #4
	add r3, r2, #0
	bl sub_02096D4C
	b _021E8AF0
_021E8A7E:
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r2, r0, #2
	ldr r0, _021E8B00 ; =ov85_021EA9E0
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E8A94
	add r0, r4, #0
	blx r2
	str r0, [r4]
_021E8A94:
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _021E8AAC
	mov r0, #0xaa
	lsl r0, r0, #2
	ldr r2, _021E8B04 ; =0x00010300
	add r0, r4, r0
	mov r1, #0
	add r3, r4, #0
	bl ov85_021E9EC0
_021E8AAC:
	add r0, r4, #0
	bl ov85_021EA1AC
	bl sub_0203769C
	cmp r0, #0
	bne _021E8AF0
	add r0, r4, #0
	mov r1, #1
	bl ov85_021EA3F0
	ldr r1, [r4]
	cmp r1, #1
	bne _021E8AF0
	str r0, [r4]
	b _021E8AF0
_021E8ACC:
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r2, r0, #2
	ldr r0, _021E8B00 ; =ov85_021EA9E0
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E8AF0
	add r0, r4, #0
	blx r2
	str r0, [r4]
	b _021E8AF0
_021E8AE4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E8AF0
	mov r0, #1
	pop {r4, pc}
_021E8AF0:
	ldr r0, [r4, #0x60]
	bl sub_0202457C
	mov r0, #0
	pop {r4, pc}
	nop
_021E8AFC: .word gSystem
_021E8B00: .word ov85_021EA9E0
_021E8B04: .word 0x00010300
	thumb_func_end ov85_021E8A08

	thumb_func_start ov85_021E8B08
ov85_021E8B08: ; 0x021E8B08
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r6, r0, #0
	ldr r0, [r6, #0x30]
	bl DestroySysTask
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r7, #0x63
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021E8B34:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E8B34
	ldr r0, [r6, #0x60]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	add r0, r6, #0
	bl ov85_021E9288
	ldr r0, [r6, #0x14]
	bl ov85_021E8E38
	ldr r0, [r6, #0x38]
	bl DestroyMsgData
	ldr r0, [r6, #0x34]
	bl ScrStrBufs_delete
	ldr r2, _021E8BAC ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldr r1, [r6, #8]
	ldr r0, [r6, #0xc]
	str r1, [r0, #0x10]
	bl ov85_021E9FD0
	ldr r1, [r6, #0xc]
	str r0, [r1, #8]
	bl ov85_021E9FEC
	ldr r1, [r6, #0xc]
	str r0, [r1, #0xc]
	add r0, r6, #0
	bl ov85_021E8E00
	ldr r0, [sp]
	bl OverlayManager_FreeData
	mov r0, #0x66
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8BAC: .word 0x04000304
	thumb_func_end ov85_021E8B08

	thumb_func_start ov85_021E8BB0
ov85_021E8BB0: ; 0x021E8BB0
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x1c]
	add r1, #0x1c
	cmp r0, #0
	beq _021E8C0A
	ldr r0, [r1, #4]
	ldr r3, [r1, #8]
	lsl r2, r0, #1
	ldr r0, _021E8C0C ; =ov85_021EA8EA
	ldrb r0, [r0, r2]
	cmp r3, r0
	ble _021E8BFA
	mov r0, #0
	str r0, [r1, #8]
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	lsl r3, r2, #1
	ldr r2, _021E8C10 ; =ov85_021EA8EB
	ldrb r2, [r2, r3]
	cmp r2, #0xff
	bne _021E8BE0
	str r0, [r1, #4]
_021E8BE0:
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0xc]
	lsl r2, r1, #1
	ldr r1, _021E8C10 ; =ov85_021EA8EB
	ldrb r1, [r1, r2]
	mov r2, #0x20
	lsl r1, r1, #5
	add r0, r0, r1
	mov r1, #0
	bl GX_LoadOBJPltt
	b _021E8C00
_021E8BFA:
	ldr r0, [r4, #0x24]
	add r0, r0, #1
	str r0, [r4, #0x24]
_021E8C00:
	mov r0, #0xed
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov85_021E9E58
_021E8C0A:
	pop {r4, pc}
	.balign 4, 0
_021E8C0C: .word ov85_021EA8EA
_021E8C10: .word ov85_021EA8EB
	thumb_func_end ov85_021E8BB0

	thumb_func_start ov85_021E8C14
ov85_021E8C14: ; 0x021E8C14
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	add r0, r4, #0
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E8C34 ; =0x027E0000
	ldr r1, _021E8C38 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E8C34: .word 0x027E0000
_021E8C38: .word 0x00003FF8
	thumb_func_end ov85_021E8C14

	thumb_func_start ov85_021E8C3C
ov85_021E8C3C: ; 0x021E8C3C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E8C58 ; =ov85_021EA9B8
	add r3, sp, #0
	mov r2, #5
_021E8C46:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E8C46
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E8C58: .word ov85_021EA9B8
	thumb_func_end ov85_021E8C3C

	thumb_func_start ov85_021E8C5C
ov85_021E8C5C: ; 0x021E8C5C
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _021E8D4C ; =ov85_021EA8F4
	add r3, sp, #0x8c
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E8D50 ; =ov85_021EA980
	add r3, sp, #0x70
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E8D54 ; =ov85_021EA99C
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E8D58 ; =ov85_021EA92C
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E8D5C ; =ov85_021EA948
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E8D60 ; =ov85_021EA964
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x66
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x66
	bl BG_ClearCharDataRange
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E8D4C: .word ov85_021EA8F4
_021E8D50: .word ov85_021EA980
_021E8D54: .word ov85_021EA99C
_021E8D58: .word ov85_021EA92C
_021E8D5C: .word ov85_021EA948
_021E8D60: .word ov85_021EA964
	thumb_func_end ov85_021E8C5C

	thumb_func_start ov85_021E8D64
ov85_021E8D64: ; 0x021E8D64
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	str r1, [sp]
	mov r6, #0
	add r4, r7, #0
	add r5, r7, #0
_021E8D70:
	mov r0, #8
	mov r1, #0x66
	bl String_ctor
	str r0, [r4, #0x3c]
	mov r0, #0xdd
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
	mov r0, #0xe7
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r6, r6, #1
	add r4, r4, #4
	add r5, #8
	cmp r6, #5
	blt _021E8D70
	mov r0, #0xb4
	mov r1, #0x66
	bl String_ctor
	str r0, [r7, #0x54]
	mov r0, #0x28
	mov r1, #0x66
	bl String_ctor
	str r0, [r7, #0x58]
	mov r0, #0xd5
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r7, r0]
	ldr r0, [r7, #0x38]
	ldr r2, [r7, #0x58]
	mov r1, #0x11
	bl ReadMsgDataIntoString
	ldr r1, [sp]
	add r0, r7, #0
	bl ov85_021EA2C0
	mov r0, #0x66
	bl sub_0205B4A4
	mov r1, #0xee
	lsl r1, r1, #2
	str r0, [r7, r1]
	mov r0, #0
	str r0, [r7, #0x1c]
	str r0, [r7, #0x24]
	str r0, [r7, #0x20]
	add r2, r7, #0
	ldr r0, [sp]
	mov r1, #1
	add r2, #0x2c
	mov r3, #0x66
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	str r0, [r7, #0x28]
	ldr r0, _021E8DFC ; =0x00004A44
	mov r1, #0
	str r1, [r7, r0]
	mov r0, #0x33
	lsl r0, r0, #4
	str r1, [r7, r0]
	ldr r0, [r7, #0x10]
	mov r1, #2
	str r1, [r0, #0x2c]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8DFC: .word 0x00004A44
	thumb_func_end ov85_021E8D64

	thumb_func_start ov85_021E8E00
ov85_021E8E00: ; 0x021E8E00
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov85_021EA368
	ldr r0, [r6, #0x28]
	bl FreeToHeap
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r4, #0
	add r5, r6, #0
_021E8E1C:
	ldr r0, [r5, #0x3c]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _021E8E1C
	ldr r0, [r6, #0x58]
	bl String_dtor
	ldr r0, [r6, #0x54]
	bl String_dtor
	pop {r4, r5, r6, pc}
	thumb_func_end ov85_021E8E00

	thumb_func_start ov85_021E8E38
ov85_021E8E38: ; 0x021E8E38
	push {r4, lr}
	add r4, r0, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E8E38

	thumb_func_start ov85_021E8E6C
ov85_021E8E6C: ; 0x021E8E6C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #2
	ldr r4, [r5, #0x14]
	lsl r0, r0, #8
	add r6, r1, #0
	mov r1, #0
	str r0, [sp]
	mov r0, #0x66
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r1, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x66
	str r0, [sp, #4]
	mov r0, #0xe
	mov r1, #0x47
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x66
	bl LoadFontPal1
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x66
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x66
	str r0, [sp, #0xc]
	mov r0, #0xe
	mov r1, #0xa
	add r2, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x66
	str r0, [sp, #0xc]
	mov r0, #0xe
	mov r1, #0xb
	add r2, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x66
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #2
	add r2, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x66
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #3
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x66
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x66
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov85_021E8E6C

	thumb_func_start ov85_021E8F58
ov85_021E8F58: ; 0x021E8F58
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E8F84 ; =ov85_021EA904
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x66
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E8F84: .word ov85_021EA904
	thumb_func_end ov85_021E8F58

	thumb_func_start ov85_021E8F88
ov85_021E8F88: ; 0x021E8F88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	str r1, [sp, #0x14]
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x66
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	add r1, r6, #0
	mov r0, #0x1e
	add r1, #0x64
	mov r2, #0x66
	bl G2dRenderer_Init
	str r0, [r6, #0x60]
	cmp r0, #0
	bne _021E8FC2
	bl GF_AssertFail
_021E8FC2:
	add r0, r6, #0
	mov r2, #1
	add r0, #0x64
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0x63
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021E8FD8:
	mov r0, #3
	add r1, r4, #0
	mov r2, #0x66
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E8FD8
	mov r0, #2
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x66
	str r0, [sp, #8]
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x14]
	mov r2, #0xc
	bl AddCharResObjFromOpenNarc
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #2
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #0xf
	str r0, [sp, #8]
	mov r0, #0x66
	sub r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #7
	lsl r1, r1, #6
	str r0, [r6, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x66
	sub r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	mov r2, #0xd
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x71
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x66
	str r0, [sp, #8]
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x14]
	mov r2, #0xe
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r6, r1]
	sub r1, #0xc
	ldr r0, [r6, r1]
	bl sub_0200ACF0
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	bl sub_0200AF94
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov85_021E8F88

	thumb_func_start ov85_021E9084
ov85_021E9084: ; 0x021E9084
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #2
	add r5, r0, #0
	str r1, [sp]
	sub r0, r1, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	mov r3, #0x63
	str r0, [sp, #0xc]
	mov r2, #1
	lsl r3, r3, #2
	str r2, [sp, #0x10]
	ldr r2, [r5, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r5, r2]
	add r3, #0x88
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x60]
	mov r6, #0
	str r0, [sp, #0x2c]
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x30]
	mov r0, #1
	lsl r0, r0, #0xc
	mov r7, #0x8f
	str r6, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r6, [r0, #0x20]
	mov r0, #1
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	mov r0, #0x66
	ldr r4, _021E915C ; =ov85_021EA914
	str r0, [sp, #0x58]
	lsl r7, r7, #2
_021E90F8:
	ldrh r0, [r4, #4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrh r0, [r4, #6]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0x8f
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x8f
	lsl r0, r0, #2
	sub r1, r6, #1
	lsl r1, r1, #1
	ldr r0, [r5, r0]
	add r1, #0x1b
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r7]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #5
	blt _021E90F8
	mov r0, #6
	lsl r0, r0, #0xe
	str r0, [sp, #0x34]
	mov r0, #0x1a
	lsl r0, r0, #0x10
	str r0, [sp, #0x38]
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E915C: .word ov85_021EA914
	thumb_func_end ov85_021E9084

	thumb_func_start ov85_021E9160
ov85_021E9160: ; 0x021E9160
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x14
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021E923C ; =0x000001C3
	mov r1, #0xc2
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r4, #0x14]
	add r1, r4, r1
	mov r2, #5
	mov r3, #0x1a
	bl AddWindowParameterized
	mov r0, #0xc2
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	mov r1, #0xbe
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r4, #0x14]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x94
	mov r1, #0xc6
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r4, #0x14]
	add r1, r4, r1
	mov r2, #0
	mov r3, #3
	bl AddWindowParameterized
	mov r0, #0xc6
	lsl r0, r0, #2
	ldr r1, [r4, #0x58]
	add r0, r4, r0
	mov r2, #0
	bl ov85_021E9244
	mov r0, #6
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0xc8
	mov r1, #0xaa
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r4, #0x14]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0xaa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xaa
	lsl r0, r0, #2
	ldr r2, _021E9240 ; =0x00010300
	add r0, r4, r0
	mov r1, #0
	add r3, r4, #0
	bl ov85_021E9EC0
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021E923C: .word 0x000001C3
_021E9240: .word 0x00010300
	thumb_func_end ov85_021E9160

	thumb_func_start ov85_021E9244
ov85_021E9244: ; 0x021E9244
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r2, #0
	mov r0, #1
	mov r2, #0
	add r7, r1, #0
	bl FontID_String_GetWidth
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #1
	str r1, [sp]
	mov r0, #0x41
	mov r3, #0xd0
	str r4, [sp, #4]
	sub r4, r3, r6
	lsl r0, r0, #0xa
	lsr r3, r4, #0x1f
	str r0, [sp, #8]
	mov r0, #0
	add r3, r4, r3
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r7, #0
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9244

	thumb_func_start ov85_021E9288
ov85_021E9288: ; 0x021E9288
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xaa
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0xc6
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0xc2
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9288

	thumb_func_start ov85_021E92B8
ov85_021E92B8: ; 0x021E92B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	bl sub_0203769C
	cmp r0, #0
	bne _021E92E2
	bl sub_02037454
	cmp r0, #2
	blt _021E92EC
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl ov85_021EA0EC
	b _021E92EC
_021E92E2:
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov85_021EA0EC
_021E92EC:
	add r0, r5, #0
	mov r1, #3
	bl ov85_021E9458
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E92B8

	thumb_func_start ov85_021E92F8
ov85_021E92F8: ; 0x021E92F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov85_021E9324
	bl sub_0203769C
	cmp r0, #0
	bne _021E931A
	bl ov85_021E9EA4
	cmp r0, #1
	beq _021E9320
	add r0, r5, #0
	bl ov85_021E9FCC
	b _021E9320
_021E931A:
	add r0, r5, #0
	bl ov85_021E9FCC
_021E9320:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E92F8

	thumb_func_start ov85_021E9324
ov85_021E9324: ; 0x021E9324
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021E9430 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021E9384
	bl sub_0203769C
	cmp r0, #0
	bne _021E942E
	ldr r5, [r4, #0x10]
	bl ov85_021E9FD0
	ldr r1, [r5, #0x2c]
	cmp r1, r0
	bne _021E937C
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _021E937C
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov85_021EA0EC
	add r0, r4, #0
	mov r1, #0x16
	bl ov85_021E9458
	add r2, sp, #0
	ldr r0, [r4, #0x10]
	mov r1, #7
	add r2, #2
	mov r3, #1
	bl sub_02096D4C
	add r0, r4, #0
	mov r1, #0
	bl ov85_021EA39C
	pop {r3, r4, r5, pc}
_021E937C:
	ldr r0, _021E9434 ; =0x000005F2
	bl PlaySE
	pop {r3, r4, r5, pc}
_021E9384:
	mov r0, #2
	tst r0, r1
	beq _021E9400
	bl sub_0203769C
	cmp r0, #0
	beq _021E93B6
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x28]
	cmp r0, #0
	bne _021E93AE
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov85_021EA0EC
	add r0, r4, #0
	mov r1, #4
	bl ov85_021E9458
	pop {r3, r4, r5, pc}
_021E93AE:
	ldr r0, _021E9434 ; =0x000005F2
	bl PlaySE
	pop {r3, r4, r5, pc}
_021E93B6:
	ldr r5, [r4, #0x10]
	bl sub_02037454
	ldr r1, [r5, #0x2c]
	cmp r1, r0
	bne _021E93F8
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _021E93F8
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #1]
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov85_021EA0EC
	add r0, r4, #0
	mov r1, #4
	bl ov85_021E9458
	add r2, sp, #0
	ldr r0, [r4, #0x10]
	mov r1, #7
	add r2, #1
	mov r3, #1
	bl sub_02096D4C
	add r0, r4, #0
	mov r1, #0
	bl ov85_021EA39C
	pop {r3, r4, r5, pc}
_021E93F8:
	ldr r0, _021E9434 ; =0x000005F2
	bl PlaySE
	pop {r3, r4, r5, pc}
_021E9400:
	ldr r0, _021E9438 ; =0x00004A48
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E942E
	bl sub_0203769C
	cmp r0, #0
	bne _021E942E
	bl sub_02037454
	ldr r1, [r4, #0x10]
	ldr r1, [r1, #0x2c]
	cmp r1, r0
	bne _021E942E
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0]
	ldr r0, [r4, #0x10]
	mov r1, #7
	add r2, sp, #0
	mov r3, #1
	bl sub_02096D4C
_021E942E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9430: .word gSystem
_021E9434: .word 0x000005F2
_021E9438: .word 0x00004A48
	thumb_func_end ov85_021E9324

	thumb_func_start ov85_021E943C
ov85_021E943C: ; 0x021E943C
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E943C

	thumb_func_start ov85_021E9440
ov85_021E9440: ; 0x021E9440
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #2
	bl ov85_021E9458
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9440

	thumb_func_start ov85_021E9458
ov85_021E9458: ; 0x021E9458
	mov r2, #0xd5
	mov r3, #0x1e
	lsl r2, r2, #2
	str r3, [r0, r2]
	add r2, r2, #4
	str r1, [r0, r2]
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E9458

	thumb_func_start ov85_021E9468
ov85_021E9468: ; 0x021E9468
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x5c]
	add r4, r1, #0
	bl ov85_021EA17C
	cmp r0, #0
	beq _021E9482
	mov r0, #0xd6
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	sub r0, r0, #4
	str r1, [r5, r0]
_021E9482:
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9468

	thumb_func_start ov85_021E948C
ov85_021E948C: ; 0x021E948C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E94AA
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #7
	add r2, sp, #0
	mov r3, #1
	bl sub_02096D4C
_021E94AA:
	mov r0, #0xd5
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E948C

	thumb_func_start ov85_021E94BC
ov85_021E94BC: ; 0x021E94BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x66
	add r4, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, _021E94E8 ; =ov85_021EA8D8
	mov r2, #0x1f
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x33
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #5
	add r1, #0x24
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E94E8: .word ov85_021EA8D8
	thumb_func_end ov85_021E94BC

	thumb_func_start ov85_021E94EC
ov85_021E94EC: ; 0x021E94EC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0203769C
	cmp r0, #0
	ldr r0, [r5, #0x10]
	beq _021E9520
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _021E9542
	ldr r0, _021E9608 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E9514
	ldr r0, _021E960C ; =0x000005F2
	bl PlaySE
_021E9514:
	add r0, r5, #0
	bl ov85_021E943C
	add sp, #8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021E9520:
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _021E9542
	ldr r0, _021E9608 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E9536
	ldr r0, _021E960C ; =0x000005F2
	bl PlaySE
_021E9536:
	add r0, r5, #0
	bl ov85_021E943C
	add sp, #8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021E9542:
	bl ov85_021E9FD0
	add r4, r0, #0
	bl sub_02037454
	cmp r4, r0
	beq _021E955C
	add r0, r5, #0
	bl ov85_021E943C
	add sp, #8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021E955C:
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x66
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E95FC
	sub r1, r1, #1
	cmp r0, r1
	bne _021E95A0
	bl sub_0203769C
	cmp r0, #0
	bne _021E9596
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #7
	add r2, sp, #4
	mov r3, #1
	bl sub_02096D4C
	add r0, r5, #0
	mov r1, #1
	bl ov85_021EA39C
_021E9596:
	add r0, r5, #0
	mov r1, #0
	bl ov85_021E9458
	b _021E95F4
_021E95A0:
	bl sub_0203769C
	cmp r0, #0
	bne _021E95BC
	add r0, r5, #0
	mov r1, #0xb
	bl ov85_021E9458
	add r0, r5, #0
	mov r1, #0xe
	mov r2, #0
	bl ov85_021EA0EC
	b _021E95F4
_021E95BC:
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #2]
	bl sub_0203769C
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _021E9610 ; =0x00004A50
	mov r1, #1
	strb r1, [r5, r0]
	mov r1, #0
	add r0, #0xc
	strh r1, [r5, r0]
	mov r0, #0xd5
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, #0x10]
	mov r1, #2
	add r2, sp, #0
	mov r3, #4
	bl sub_02096D4C
_021E95F4:
	mov r0, #0x33
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_021E95FC:
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r6, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E9608: .word gSystem
_021E960C: .word 0x000005F2
_021E9610: .word 0x00004A50
	thumb_func_end ov85_021E94EC

	thumb_func_start ov85_021E9614
ov85_021E9614: ; 0x021E9614
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _021E9628 ; =0x00004A5C
	mov r2, #0
	strh r2, [r0, r1]
	bl ov85_021E943C
	add r0, r4, #0
	pop {r4, pc}
	nop
_021E9628: .word 0x00004A5C
	thumb_func_end ov85_021E9614

	thumb_func_start ov85_021E962C
ov85_021E962C: ; 0x021E962C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037454
	ldr r1, [r5, #0x10]
	ldrh r1, [r1, #0x38]
	cmp r1, r0
	bne _021E964A
	bl ov85_021E9FD0
	ldr r1, [r5, #0x10]
	ldrh r1, [r1, #0x38]
	cmp r1, r0
	beq _021E9662
_021E964A:
	ldr r0, _021E96AC ; =0x00004A5C
	mov r1, #0
	strh r1, [r5, r0]
	mov r0, #0xd5
	mov r1, #8
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021E9662:
	ldr r0, _021E96AC ; =0x00004A5C
	ldrsh r1, [r5, r0]
	add r1, r1, #1
	strh r1, [r5, r0]
	ldrsh r0, [r5, r0]
	cmp r0, #0x1e
	ble _021E96A2
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	bl sub_0203769C
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	mov r1, #2
	add r2, sp, #0
	mov r3, #4
	bl sub_02096D4C
	ldr r0, _021E96AC ; =0x00004A5C
	mov r1, #0
	strh r1, [r5, r0]
	mov r0, #0xd5
	mov r1, #9
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E96A2:
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E96AC: .word 0x00004A5C
	thumb_func_end ov85_021E962C

	thumb_func_start ov85_021E96B0
ov85_021E96B0: ; 0x021E96B0
	push {r3, r4, r5, lr}
	ldr r2, _021E96CC ; =0x00004A50
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	strb r1, [r5, r2]
	bl ov85_021E9458
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E96CC: .word 0x00004A50
	thumb_func_end ov85_021E96B0

	thumb_func_start ov85_021E96D0
ov85_021E96D0: ; 0x021E96D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x66
	add r4, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, _021E96FC ; =ov85_021EA8D8
	mov r2, #0x1f
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x33
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0x17
	add r1, #0x24
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E96FC: .word ov85_021EA8D8
	thumb_func_end ov85_021E96D0

	thumb_func_start ov85_021E9700
ov85_021E9700: ; 0x021E9700
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r4, [r5, #0x10]
	add r6, r1, #0
	bl ov85_021E9FD0
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bne _021E971A
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _021E9736
_021E971A:
	ldr r0, _021E97AC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E972A
	ldr r0, _021E97B0 ; =0x000005F2
	bl PlaySE
_021E972A:
	add r0, r5, #0
	bl ov85_021E943C
	add sp, #4
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E9736:
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x66
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E979E
	sub r1, r1, #1
	cmp r0, r1
	bne _021E9772
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #7
	add r2, sp, #0
	mov r3, #1
	bl sub_02096D4C
	add r0, r5, #0
	mov r1, #1
	bl ov85_021EA39C
	add r0, r5, #0
	mov r1, #0
	bl ov85_021E9458
	b _021E9796
_021E9772:
	bl sub_0203769C
	cmp r0, #0
	bne _021E9792
	mov r0, #0xd5
	mov r1, #0x18
	lsl r0, r0, #2
	str r1, [r5, r0]
	bl ov85_021E9FD0
	ldr r1, _021E97B4 ; =0x00004A52
	strb r0, [r5, r1]
	mov r0, #0xc
	bl sub_0205A904
	b _021E9796
_021E9792:
	bl GF_AssertFail
_021E9796:
	mov r0, #0x33
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_021E979E:
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r6, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E97AC: .word gSystem
_021E97B0: .word 0x000005F2
_021E97B4: .word 0x00004A52
	thumb_func_end ov85_021E9700

	thumb_func_start ov85_021E97B8
ov85_021E97B8: ; 0x021E97B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E97E4 ; =0x00004A53
	add r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E97DE
	mov r2, #0
	ldr r0, [r5, #0x10]
	mov r1, #5
	add r3, r2, #0
	bl sub_02096D4C
	cmp r0, #1
	bne _021E97DE
	mov r0, #0xd5
	mov r1, #0x1f
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E97DE:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E97E4: .word 0x00004A53
	thumb_func_end ov85_021E97B8

	thumb_func_start ov85_021E97E8
ov85_021E97E8: ; 0x021E97E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E97FA
	bl sub_02037454
_021E97FA:
	bl sub_02037454
	ldr r1, [r5, #0x10]
	ldr r1, [r1, #0x20]
	cmp r1, r0
	bne _021E980E
	mov r0, #0xd5
	mov r1, #0x1f
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E980E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E97E8

	thumb_func_start ov85_021E9814
ov85_021E9814: ; 0x021E9814
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	mov r1, #0x3e
	lsl r1, r1, #6
	ldr r0, [r0, #0x1c]
	add r1, r5, r1
	bl ov85_021EA4EC
	mov r0, #0xd5
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9814

	thumb_func_start ov85_021E9834
ov85_021E9834: ; 0x021E9834
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _021E9860 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #0xc]
	ldr r0, [r5, #0xc]
	mov r1, #0x13
	ldr r0, [r0, #0x28]
	bl GameStats_AddSpecial
	mov r0, #0x3b
	lsl r0, r0, #4
	add r0, r5, r0
	bl sub_02039EAC
	mov r0, #0xd5
	mov r1, #0x1c
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9860: .word gSystem + 0x60
	thumb_func_end ov85_021E9834

	thumb_func_start ov85_021E9864
ov85_021E9864: ; 0x021E9864
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E9876
	bl sub_02037454
_021E9876:
	ldr r0, [r5, #0xc]
	mov r2, #0x3b
	lsl r2, r2, #4
	ldr r0, [r0, #0x1c]
	mov r1, #2
	add r2, r5, r2
	bl sub_02039EB4
	cmp r0, #0
	beq _021E98B6
	ldr r0, _021E98BC ; =0x00000657
	mov r1, #8
	bl StopSE
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0
	bl ov85_021EA0EC
	add r0, r5, #0
	mov r1, #0x1d
	bl ov85_021E9458
	mov r1, #0
	mov r0, #0x36
	str r1, [r5, #0x1c]
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r0, _021E98C0 ; =gSystem + 0x60
	strb r1, [r0, #0xc]
	ldr r0, [r5, #0x10]
	str r1, [r0, #0x24]
_021E98B6:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E98BC: .word 0x00000657
_021E98C0: .word gSystem + 0x60
	thumb_func_end ov85_021E9864

	thumb_func_start ov85_021E98C4
ov85_021E98C4: ; 0x021E98C4
	push {r3, r4}
	mov r2, #0x36
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	add r3, r4, #1
	str r3, [r0, r2]
	cmp r4, #0x3c
	ble _021E98DA
	mov r3, #0xf
	sub r2, #0xc
	str r3, [r0, r2]
_021E98DA:
	add r0, r1, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov85_021E98C4

	thumb_func_start ov85_021E98E0
ov85_021E98E0: ; 0x021E98E0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #5
	mov r2, #0
	bl ov85_021EA0EC
	add r0, r5, #0
	mov r1, #0xa
	bl ov85_021E9458
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E98E0

	thumb_func_start ov85_021E9900
ov85_021E9900: ; 0x021E9900
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x36
	lsl r0, r0, #4
	add r4, r1, #0
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0x3c
	ble _021E9930
	mov r1, #0x10
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x66
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r4, #3
_021E9930:
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov85_021E9900

	thumb_func_start ov85_021E993C
ov85_021E993C: ; 0x021E993C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x66
	add r4, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x14]
	ldr r1, _021E9968 ; =ov85_021EA8D8
	mov r2, #0x1f
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x33
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0xc
	add r1, #0x24
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9968: .word ov85_021EA8D8
	thumb_func_end ov85_021E993C

	thumb_func_start ov85_021E996C
ov85_021E996C: ; 0x021E996C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r4, [r5, #0x10]
	add r6, r1, #0
	bl ov85_021E9FD0
	ldr r1, [r4, #0x2c]
	cmp r1, r0
	bne _021E9986
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _021E99A2
_021E9986:
	ldr r0, _021E9A14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E9996
	ldr r0, _021E9A18 ; =0x000005F2
	bl PlaySE
_021E9996:
	add r0, r5, #0
	bl ov85_021E943C
	add sp, #4
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E99A2:
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x66
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E9A08
	sub r1, r1, #1
	cmp r0, r1
	bne _021E99DC
	mov r1, #0
	mov r0, #0xd5
	str r1, [sp]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, #0x10]
	mov r1, #7
	add r2, sp, #0
	mov r3, #1
	bl sub_02096D4C
	add r0, r5, #0
	mov r1, #1
	bl ov85_021EA39C
	b _021E9A00
_021E99DC:
	mov r0, #0xd5
	mov r1, #0xd
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r2, #0
	ldr r0, [r5, #0x10]
	mov r1, #3
	add r3, r2, #0
	bl sub_02096D4C
	mov r0, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x34]
	mov r1, #0
	bl BufferPlayersName
_021E9A00:
	mov r0, #0x33
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_021E9A08:
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r6, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E9A14: .word gSystem
_021E9A18: .word 0x000005F2
	thumb_func_end ov85_021E996C

	thumb_func_start ov85_021E9A1C
ov85_021E9A1C: ; 0x021E9A1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E9A36
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl ov85_021EA0EC
	b _021E9A50
_021E9A36:
	mov r0, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x34]
	mov r1, #0
	bl BufferPlayersName
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov85_021EA0EC
_021E9A50:
	add r0, r5, #0
	mov r1, #0xe
	bl ov85_021E9458
	mov r0, #0x36
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9A1C

	thumb_func_start ov85_021E9A6C
ov85_021E9A6C: ; 0x021E9A6C
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x36
	lsl r1, r1, #4
	ldr r2, [r0, r1]
	add r2, r2, #1
	str r2, [r0, r1]
	ldr r2, [r0, r1]
	cmp r2, #0x2d
	ble _021E9A86
	mov r2, #0xf
	sub r1, #0xc
	str r2, [r0, r1]
_021E9A86:
	bl ov85_021E943C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9A6C

	thumb_func_start ov85_021E9A90
ov85_021E9A90: ; 0x021E9A90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xca
	add r4, r1, #0
	bl sub_02037AC0
	mov r0, #0xd5
	mov r1, #0x10
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9A90

	thumb_func_start ov85_021E9AB0
ov85_021E9AB0: ; 0x021E9AB0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0xca
	add r5, r1, #0
	bl sub_02037B38
	cmp r0, #0
	beq _021E9AE2
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	mov r1, #0x10
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x66
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r5, #3
_021E9AE2:
	add r0, r4, #0
	bl ov85_021E943C
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9AB0

	thumb_func_start ov85_021E9AF0
ov85_021E9AF0: ; 0x021E9AF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x5c]
	add r4, r1, #0
	bl ov85_021EA17C
	cmp r0, #0
	beq _021E9B0A
	add r0, r5, #0
	mov r1, #9
	mov r2, #0
	bl ov85_021EA0EC
_021E9B0A:
	mov r0, #0xd5
	mov r1, #0x12
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9AF0

	thumb_func_start ov85_021E9B1C
ov85_021E9B1C: ; 0x021E9B1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x5c]
	add r4, r1, #0
	bl ov85_021EA17C
	cmp r0, #0
	beq _021E9B34
	mov r0, #0xd5
	mov r1, #0xa
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E9B34:
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9B1C

	thumb_func_start ov85_021E9B40
ov85_021E9B40: ; 0x021E9B40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x5c]
	add r4, r1, #0
	cmp r0, #0xff
	beq _021E9B5E
	bl ov85_021EA17C
	cmp r0, #0
	bne _021E9B5E
	ldr r0, [r5, #0x5c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_021E9B5E:
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #1
	bl ov85_021EA0EC
	mov r0, #0xd5
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r5, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _021E9B80
	add r0, r5, #0
	mov r1, #0
	bl ov85_021EA39C
_021E9B80:
	bl sub_02037454
	ldr r1, _021E9B9C ; =0x00004A58
	mov r2, #0x4b
	str r0, [r5, r1]
	lsl r2, r2, #2
	sub r0, r1, #4
	str r2, [r5, r0]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E9B9C: .word 0x00004A58
	thumb_func_end ov85_021E9B40

	thumb_func_start ov85_021E9BA0
ov85_021E9BA0: ; 0x021E9BA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E9BD8 ; =0x00004A58
	add r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9BBE
	bl sub_02037454
	ldr r1, _021E9BD8 ; =0x00004A58
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E9BBE
	mov r0, #0
	str r0, [r5, r1]
_021E9BBE:
	mov r0, #0xd5
	mov r1, #0x15
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0
	add r0, #0xc
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E9BD8: .word 0x00004A58
	thumb_func_end ov85_021E9BA0

	thumb_func_start ov85_021E9BDC
ov85_021E9BDC: ; 0x021E9BDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E9C48 ; =0x00004A58
	add r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9BFA
	bl sub_02037454
	ldr r1, _021E9C48 ; =0x00004A58
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E9BFA
	mov r0, #0
	str r0, [r5, r1]
_021E9BFA:
	ldr r0, _021E9C4C ; =0x00004A54
	ldr r1, [r5, r0]
	sub r1, r1, #1
	str r1, [r5, r0]
	ldr r1, [r5, r0]
	cmp r1, #0
	bge _021E9C0E
	mov r1, #0
	add r0, r0, #4
	str r1, [r5, r0]
_021E9C0E:
	mov r1, #0x36
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #0x3c
	ble _021E9C3C
	ldr r0, _021E9C48 ; =0x00004A58
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E9C3C
	mov r0, #0
	sub r1, #0xc
	str r0, [r5, r1]
	bl sub_0203769C
	cmp r0, #0
	bne _021E9C3C
	add r0, r5, #0
	mov r1, #1
	bl ov85_021EA39C
_021E9C3C:
	add r0, r5, #0
	bl ov85_021E943C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E9C48: .word 0x00004A58
_021E9C4C: .word 0x00004A54
	thumb_func_end ov85_021E9BDC

	thumb_func_start ov85_021E9C50
ov85_021E9C50: ; 0x021E9C50
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0xc
	bl sub_0205A904
	mov r1, #0x10
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x66
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	bl ov85_021E943C
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9C50

	thumb_func_start ov85_021E9C84
ov85_021E9C84: ; 0x021E9C84
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x13
	bgt _021E9CAC
	bge _021E9D12
	cmp r4, #8
	bgt _021E9CA6
	cmp r4, #2
	blt _021E9D92
	beq _021E9CBA
	cmp r4, #7
	beq _021E9D8C
	cmp r4, #8
	beq _021E9D8C
	pop {r4, r5, r6, pc}
_021E9CA6:
	cmp r4, #0xd
	beq _021E9CC0
	pop {r4, r5, r6, pc}
_021E9CAC:
	cmp r4, #0x19
	bgt _021E9CB4
	beq _021E9CDA
	pop {r4, r5, r6, pc}
_021E9CB4:
	cmp r4, #0x1f
	beq _021E9D60
	pop {r4, r5, r6, pc}
_021E9CBA:
	bl ov85_021EA19C
	b _021E9D8C
_021E9CC0:
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9D8C
	mov r1, #0x66
	bl Clear2dMenuWindowAndDelete
	mov r0, #0x33
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _021E9D8C
_021E9CDA:
	ldr r0, [r5, #0x5c]
	bl ov85_021EA17C
	cmp r0, #0
	bne _021E9CEE
	ldr r0, [r5, #0x5c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_021E9CEE:
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	bl ov85_021EA0EC
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9D8C
	mov r1, #0x66
	bl Clear2dMenuWindowAndDelete
	mov r0, #0x33
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _021E9D8C
_021E9D12:
	ldr r0, _021E9D94 ; =0x00004A50
	ldrb r0, [r5, r0]
	cmp r0, #1
	beq _021E9D92
	add r0, r6, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x34]
	mov r1, #0
	bl BufferPlayersName
	bl sub_0203769C
	cmp r6, r0
	beq _021E9D92
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9D4A
	mov r1, #0x66
	bl Clear2dMenuWindowAndDelete
	mov r0, #0x33
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_021E9D4A:
	bl sub_0203769C
	cmp r0, #0
	bne _021E9D8C
	ldr r2, [r5, #0x10]
	ldr r0, _021E9D98 ; =0x0000FFFF
	ldr r1, [r2, #0x30]
	eor r0, r6
	and r0, r1
	str r0, [r2, #0x30]
	b _021E9D8C
_021E9D60:
	ldr r0, [r5, #0x5c]
	bl ov85_021EA17C
	cmp r0, #0
	bne _021E9D74
	ldr r0, [r5, #0x5c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_021E9D74:
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9D8C
	mov r1, #0x66
	bl Clear2dMenuWindowAndDelete
	mov r0, #0x33
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_021E9D8C:
	mov r0, #0xd5
	lsl r0, r0, #2
	str r4, [r5, r0]
_021E9D92:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E9D94: .word 0x00004A50
_021E9D98: .word 0x0000FFFF
	thumb_func_end ov85_021E9C84

	thumb_func_start ov85_021E9D9C
ov85_021E9D9C: ; 0x021E9D9C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #3
	bne _021E9E3E
	cmp r4, #1
	beq _021E9DBA
	cmp r4, #0x13
	beq _021E9E00
	b _021E9E36
_021E9DBA:
	add r0, r6, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x34]
	mov r1, #0
	bl BufferPlayersName
	add r0, r5, #0
	mov r1, #1
	bl ov85_021EA39C
	mov r0, #0xd5
	lsl r0, r0, #2
	str r4, [r5, r0]
	bl sub_02037454
	ldr r1, [r5, #0x10]
	str r0, [r1, #0x2c]
	ldr r0, [r5, #0x10]
	mov r1, #0
	str r1, [r0, #0x30]
	bl sub_0203769C
	cmp r0, #0
	bne _021E9E50
	mov r3, #1
	str r3, [sp]
	ldr r0, [r5, #0x10]
	mov r1, #7
	add r2, sp, #0
	bl sub_02096D4C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021E9E00:
	add r0, r6, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x34]
	mov r1, #0
	bl BufferPlayersName
	bl sub_0203769C
	cmp r6, r0
	beq _021E9E50
	bl sub_0203769C
	cmp r0, #0
	bne _021E9E2C
	ldr r2, [r5, #0x10]
	ldr r0, _021E9E54 ; =0x0000FFFF
	ldr r1, [r2, #0x30]
	eor r0, r6
	and r0, r1
	str r0, [r2, #0x30]
_021E9E2C:
	mov r0, #0xd5
	lsl r0, r0, #2
	add sp, #4
	str r4, [r5, r0]
	pop {r3, r4, r5, r6, pc}
_021E9E36:
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021E9E3E:
	cmp r4, #1
	bne _021E9E50
	ldr r0, [r5, #0x10]
	mov r1, #0
	str r1, [r0, #0x30]
	bl sub_02037454
	ldr r1, [r5, #0x10]
	str r0, [r1, #0x2c]
_021E9E50:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E9E54: .word 0x0000FFFF
	thumb_func_end ov85_021E9D9C

	thumb_func_start ov85_021E9E58
ov85_021E9E58: ; 0x021E9E58
	push {r3, lr}
	ldrh r1, [r0]
	add r1, #0xa
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r2, r1
	bls _021E9E6E
	mov r1, #0
	strh r1, [r0]
_021E9E6E:
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xa
	add r2, r0, #0
	mul r2, r1
	asr r0, r2, #0xb
	lsr r0, r0, #0x14
	add r0, r2, r0
	asr r0, r0, #0xc
	add r0, #0xf
	lsl r2, r0, #5
	mov r0, #0x1d
	orr r2, r0
	add r0, sp, #0
	strh r2, [r0]
	add r0, sp, #0
	mov r2, #2
	bl GX_LoadOBJPltt
	add r0, sp, #0
	mov r1, #0x2a
	mov r2, #2
	bl GX_LoadOBJPltt
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9E58

	thumb_func_start ov85_021E9EA4
ov85_021E9EA4: ; 0x021E9EA4
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_021E9EAA:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _021E9EB6
	add r5, r5, #1
_021E9EB6:
	add r4, r4, #1
	cmp r4, #5
	blt _021E9EAA
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9EA4

	thumb_func_start ov85_021E9EC0
ov85_021E9EC0: ; 0x021E9EC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r3, [sp, #0x14]
	add r6, r0, #0
	str r2, [sp, #0x10]
	bl sub_0203769C
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	bl ov85_021EA010
	cmp r0, #0
	bne _021E9EE0
	add sp, #0x28
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9EE0:
	add r0, r6, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r7, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x20]
	add r4, r7, #0
	mov r5, #1
_021E9EF2:
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _021E9FAC
	bl PlayerProfile_GetTrainerID_VisibleHalf
	str r0, [sp, #0x24]
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	ldr r1, [r4, #0x3c]
	bl PlayerName_FlatToString
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x24]
	ldr r0, [r0, #0x34]
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #0x34]
	ldr r1, [r1, #0x38]
	mov r2, #1
	mov r3, #0x66
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	str r5, [sp]
	bne _021E9F74
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E9FC8 ; =0x00020300
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x3c]
	add r0, r6, #0
	mov r3, #5
	bl AddTextPrinterParameterized2
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E9FC8 ; =0x00020300
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0
	mov r3, #0x46
	bl AddTextPrinterParameterized2
	b _021E9FA6
_021E9F74:
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x3c]
	add r0, r6, #0
	mov r3, #5
	bl AddTextPrinterParameterized2
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0
	mov r3, #0x46
	bl AddTextPrinterParameterized2
_021E9FA6:
	ldr r0, [sp, #0x18]
	bl String_dtor
_021E9FAC:
	ldr r0, [sp, #0x20]
	add r7, #8
	add r0, r0, #1
	add r4, r4, #4
	add r5, #0x12
	str r0, [sp, #0x20]
	cmp r0, #5
	blt _021E9EF2
	add r0, r6, #0
	bl CopyWindowToVram
	mov r0, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9FC8: .word 0x00020300
	thumb_func_end ov85_021E9EC0

	thumb_func_start ov85_021E9FCC
ov85_021E9FCC: ; 0x021E9FCC
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021E9FCC

	thumb_func_start ov85_021E9FD0
ov85_021E9FD0: ; 0x021E9FD0
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_021E9FD6:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _021E9FE2
	add r5, r5, #1
_021E9FE2:
	add r4, r4, #1
	cmp r4, #5
	blt _021E9FD6
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov85_021E9FD0

	thumb_func_start ov85_021E9FEC
ov85_021E9FEC: ; 0x021E9FEC
	push {r4, r5, r6, lr}
	mov r5, #0
	add r4, r5, #0
	mov r6, #1
_021E9FF4:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _021EA004
	add r0, r6, #0
	lsl r0, r4
	orr r5, r0
_021EA004:
	add r4, r4, #1
	cmp r4, #5
	blt _021E9FF4
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov85_021E9FEC

	thumb_func_start ov85_021EA010
ov85_021EA010: ; 0x021EA010
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	str r4, [sp]
	add r6, r7, #0
	add r5, r7, #0
_021EA01C:
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	add r0, r0, #4
	str r1, [r6, r0]
	add r0, r4, #0
	bl sub_02034818
	mov r1, #0xdd
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _021EA0E0 ; =0x00004A60
	ldr r2, _021EA0E4 ; =0x00004A68
	ldr r1, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	str r1, [r5, r2]
	add r1, r2, #4
	str r0, [r5, r1]
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021EA05A
	bl PlayerProfile_GetTrainerID
	ldr r1, _021EA0E0 ; =0x00004A60
	str r0, [r5, r1]
	mov r1, #1
	ldr r0, _021EA0E8 ; =0x00004A64
	b _021EA064
_021EA05A:
	add r0, r2, #0
	mov r1, #0
	sub r0, #8
	str r1, [r5, r0]
	sub r0, r2, #4
_021EA064:
	add r4, r4, #1
	str r1, [r5, r0]
	add r6, #8
	add r5, #0x10
	cmp r4, #5
	blt _021EA01C
	mov r4, #0
	add r2, r7, #0
	add r3, r7, #0
_021EA076:
	mov r0, #0xdd
	mov r1, #0xde
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r7, r0]
	ldr r1, [r7, r1]
	cmp r1, r0
	beq _021EA0A0
	mov r1, #1
	str r1, [sp]
	cmp r0, #0
	bne _021EA098
	mov r0, #0xe7
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r2, r0]
	b _021EA0D0
_021EA098:
	mov r0, #0xe7
	lsl r0, r0, #2
	str r1, [r2, r0]
	b _021EA0D0
_021EA0A0:
	ldr r0, _021EA0E0 ; =0x00004A60
	ldr r5, _021EA0E4 ; =0x00004A68
	ldr r1, [r3, r0]
	ldr r6, [r3, r5]
	add r0, r0, #4
	add r5, r5, #4
	ldr r0, [r3, r0]
	ldr r5, [r3, r5]
	eor r1, r6
	eor r5, r0
	orr r1, r5
	beq _021EA0D0
	mov r1, #1
	str r1, [sp]
	cmp r0, #0
	bne _021EA0CA
	mov r0, #0xe7
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r2, r0]
	b _021EA0D0
_021EA0CA:
	mov r0, #0xe7
	lsl r0, r0, #2
	str r1, [r2, r0]
_021EA0D0:
	add r4, r4, #1
	add r7, #8
	add r2, r2, #4
	add r3, #0x10
	cmp r4, #5
	blt _021EA076
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA0E0: .word 0x00004A60
_021EA0E4: .word 0x00004A68
_021EA0E8: .word 0x00004A64
	thumb_func_end ov85_021EA010

	thumb_func_start ov85_021EA0EC
ov85_021EA0EC: ; 0x021EA0EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0xb4
	mov r1, #0x66
	add r6, r2, #0
	bl String_ctor
	add r4, r0, #0
	ldr r0, [r5, #0x38]
	add r1, r7, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x54]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0xbe
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	cmp r6, #0
	bne _021EA15C
	add r0, r5, #0
	bl ov85_021EA398
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r2, [r5, #0x54]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	add sp, #0xc
	str r0, [r5, #0x5c]
	pop {r4, r5, r6, r7, pc}
_021EA15C:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r2, [r5, #0x54]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r0, #0xff
	str r0, [r5, #0x5c]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov85_021EA0EC

	thumb_func_start ov85_021EA17C
ov85_021EA17C: ; 0x021EA17C
	push {r3, lr}
	cmp r0, #0xff
	bne _021EA186
	mov r0, #1
	pop {r3, pc}
_021EA186:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021EA196
	mov r0, #1
	pop {r3, pc}
_021EA196:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov85_021EA17C

	thumb_func_start ov85_021EA19C
ov85_021EA19C: ; 0x021EA19C
	mov r1, #0xbe
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r3, _021EA1A8 ; =ClearFrameAndWindow2
	mov r1, #0
	bx r3
	.balign 4, 0
_021EA1A8: .word ClearFrameAndWindow2
	thumb_func_end ov85_021EA19C

	thumb_func_start ov85_021EA1AC
ov85_021EA1AC: ; 0x021EA1AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0xcf
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x14]
	mov r0, #0xd3
	lsl r0, r0, #2
	mov r4, #0
	add r0, r5, r0
	str r4, [sp, #8]
	add r6, r5, #0
	mov r7, #0x1c
	str r0, [sp, #0x18]
_021EA1CE:
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #3
	bhi _021EA29A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EA1E4: ; jump table
	.short _021EA29A - _021EA1E4 - 2 ; case 0
	.short _021EA1EC - _021EA1E4 - 2 ; case 1
	.short _021EA29A - _021EA1E4 - 2 ; case 2
	.short _021EA262 - _021EA1E4 - 2 ; case 3
_021EA1EC:
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _021EA1FA
	bl GF_AssertFail
_021EA1FA:
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl PlayerProfile_GetTrainerGender
	str r0, [sp, #0xc]
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl PlayerProfile_GetAvatar
	str r0, [sp, #0x10]
	bl sub_0203769C
	cmp r4, r0
	bne _021EA22C
	mov r0, #0x8f
	ldr r1, [sp, #0xc]
	lsl r0, r0, #2
	lsl r1, r1, #1
	ldr r0, [r5, r0]
	add r1, #0x26
	bl Set2dSpriteAnimSeqNo
	b _021EA248
_021EA22C:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	add r2, r4, #0
	bl ov85_021EA324
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	bl Set2dSpriteAnimSeqNo
_021EA248:
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xe7
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	str r0, [sp, #8]
	b _021EA29A
_021EA262:
	bl sub_0203769C
	cmp r4, r0
	bne _021EA286
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	mov r0, #0x8f
	lsl r0, r0, #2
	lsl r1, r1, #1
	ldr r0, [r5, r0]
	add r1, #0x27
	bl Set2dSpriteAnimSeqNo
	b _021EA292
_021EA286:
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
_021EA292:
	mov r0, #0xe7
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_021EA29A:
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r0, r0, #2
	add r5, r5, #4
	add r6, #8
	add r7, r7, #2
	str r0, [sp, #4]
	cmp r4, #5
	blt _021EA1CE
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021EA2B8
	ldr r0, _021EA2BC ; =0x0000064E
	bl PlaySE
_021EA2B8:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA2BC: .word 0x0000064E
	thumb_func_end ov85_021EA1AC

	thumb_func_start ov85_021EA2C0
ov85_021EA2C0: ; 0x021EA2C0
	push {r3, r4, r5, lr}
	mov r2, #0xd3
	add r5, r0, #0
	lsl r2, r2, #2
	add r4, r1, #0
	mov r0, #0x64
	mov r1, #9
	add r2, r5, r2
	mov r3, #0x66
	bl GfGfxLoader_GetPlttData
	mov r2, #0xd1
	lsl r2, r2, #2
	str r0, [r5, r2]
	add r2, #0xc
	add r0, r4, #0
	mov r1, #7
	add r2, r5, r2
	mov r3, #0x66
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	mov r3, #0xd2
	lsl r3, r3, #2
	str r0, [r5, r3]
	mov r0, #0x66
	sub r3, #0xc
	str r0, [sp]
	mov r0, #0x64
	mov r1, #0x2b
	mov r2, #1
	add r3, r5, r3
	bl GfGfxLoader_GetCharData
	mov r3, #0xcd
	lsl r3, r3, #2
	str r0, [r5, r3]
	mov r0, #0x66
	add r3, #0xc
	str r0, [sp]
	add r0, r4, #0
	mov r1, #9
	mov r2, #1
	add r3, r5, r3
	bl GfGfxLoader_GetCharDataFromOpenNarc
	mov r1, #0xce
	lsl r1, r1, #2
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov85_021EA2C0

	thumb_func_start ov85_021EA324
ov85_021EA324: ; 0x021EA324
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	ldr r0, [sp, #0x18]
	add r1, r3, #0
	add r5, r2, #0
	bl sub_0205B464
	add r4, r0, #0
	ldr r0, [r6, #4]
	mov r2, #6
	ldr r6, [r0, #0xc]
	ldr r0, [r7, #4]
	lsl r2, r2, #8
	ldr r1, [r0, #0x14]
	add r0, r4, #0
	mul r0, r2
	add r0, r1, r0
	ldr r1, _021EA364 ; =ov85_021EA8E0
	lsl r3, r5, #1
	ldrh r1, [r1, r3]
	bl GX_LoadOBJ
	lsl r0, r4, #5
	add r1, r5, #7
	add r0, r6, r0
	lsl r1, r1, #5
	mov r2, #0x20
	bl GX_LoadOBJPltt
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA364: .word ov85_021EA8E0
	thumb_func_end ov85_021EA324

	thumb_func_start ov85_021EA368
ov85_021EA368: ; 0x021EA368
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov85_021EA368

	thumb_func_start ov85_021EA398
ov85_021EA398: ; 0x021EA398
	mov r0, #1
	bx lr
	thumb_func_end ov85_021EA398

	thumb_func_start ov85_021EA39C
ov85_021EA39C: ; 0x021EA39C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021EA3E8
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _021EA3BA
	mov r0, #1
	bl sub_02038C1C
	b _021EA3CA
_021EA3BA:
	bl sub_02037454
	add r0, r4, r0
	cmp r0, #5
	ble _021EA3C6
	mov r0, #5
_021EA3C6:
	bl sub_02038C1C
_021EA3CA:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	ldr r0, _021EA3EC ; =0x00004A51
	bne _021EA3DA
	mov r1, #2
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
_021EA3DA:
	cmp r4, #0
	bne _021EA3E4
	mov r1, #1
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
_021EA3E4:
	mov r1, #0
	strb r1, [r5, r0]
_021EA3E8:
	pop {r3, r4, r5, pc}
	nop
_021EA3EC: .word 0x00004A51
	thumb_func_end ov85_021EA39C

	thumb_func_start ov85_021EA3F0
ov85_021EA3F0: ; 0x021EA3F0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	add r6, r1, #0
	bl ov85_021E9FD0
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0x2c]
	cmp r5, r0
	ble _021EA41A
	mov r3, #1
	add r0, sp, #0
	strb r3, [r0]
	ldr r0, [r4, #0x10]
	mov r1, #7
	add r2, sp, #0
	bl sub_02096D4C
	mov r1, #1
	b _021EA41C
_021EA41A:
	mov r1, #0
_021EA41C:
	ldr r0, _021EA4E4 ; =0x00004A48
	str r1, [r4, r0]
	ldr r0, _021EA4E8 ; =0x00004A44
	ldr r0, [r4, r0]
	cmp r5, r0
	bne _021EA42E
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021EA42E:
	cmp r5, #5
	bhi _021EA4D4
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EA43E: ; jump table
	.short _021EA4D4 - _021EA43E - 2 ; case 0
	.short _021EA44A - _021EA43E - 2 ; case 1
	.short _021EA48E - _021EA43E - 2 ; case 2
	.short _021EA48E - _021EA43E - 2 ; case 3
	.short _021EA48E - _021EA43E - 2 ; case 4
	.short _021EA4C6 - _021EA43E - 2 ; case 5
_021EA44A:
	bl sub_02037454
	cmp r0, #1
	bgt _021EA45A
	bl sub_02033250
	cmp r0, #1
	bls _021EA460
_021EA45A:
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021EA460:
	mov r0, #0xd5
	mov r1, #0x11
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	sub r1, #0x12
	bl ov85_021EA39C
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021EA488
	mov r1, #0x66
	bl Clear2dMenuWindowAndDelete
	mov r0, #0x33
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
_021EA488:
	add sp, #4
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021EA48E:
	mov r0, #0xd
	bl sub_0205A904
	ldr r0, _021EA4E8 ; =0x00004A44
	ldr r1, [r4, r0]
	cmp r5, r1
	bge _021EA4D4
	add r0, #0xd
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _021EA4AA
	cmp r0, #1
	beq _021EA4B4
	b _021EA4BC
_021EA4AA:
	add r0, r4, #0
	add r1, r6, #0
	bl ov85_021EA39C
	b _021EA4BC
_021EA4B4:
	add r0, r4, #0
	mov r1, #0
	bl ov85_021EA39C
_021EA4BC:
	bl sub_02037454
	ldr r1, [r4, #0x10]
	str r0, [r1, #0x2c]
	b _021EA4D4
_021EA4C6:
	mov r0, #0xc
	bl sub_0205A904
	add r0, r4, #0
	add r1, r6, #0
	bl ov85_021EA39C
_021EA4D4:
	bl ov85_021E9FD0
	ldr r1, _021EA4E8 ; =0x00004A44
	str r0, [r4, r1]
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EA4E4: .word 0x00004A48
_021EA4E8: .word 0x00004A44
	thumb_func_end ov85_021EA3F0

	thumb_func_start ov85_021EA4EC
ov85_021EA4EC: ; 0x021EA4EC
	bx lr
	.balign 4, 0
	thumb_func_end ov85_021EA4EC

	.rodata

ov85_021EA4F0:
	.byte 0x00, 0x00, 0xB4, 0x00

ov85_021EA4F4:
	.byte 0x00, 0x00, 0xC6, 0x00, 0x56, 0x01, 0x67, 0x01

ov85_021EA4FC: ; 0x021EA4FC
	.byte 0x01, 0x02, 0x13, 0x1A
	.byte 0x04, 0x0F, 0x28, 0x00

ov85_021EA504:
	.byte 0x00, 0x00, 0xD7, 0x00, 0x43, 0x01, 0x67, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00

ov85_021EA514:
	.byte 0x25, 0x00, 0x8E, 0x00, 0xD7, 0x00, 0x43, 0x01

ov85_021EA51C: ; 0x021EA51C
	.word ov85_021E7BC0, ov85_021E7BEC, ov85_021E7C2C

ov85_021EA528: ; 0x021EA528
	.byte 0xDD, 0x05, 0x00, 0x00, 0xDD, 0x05, 0x00, 0x00
	.byte 0xDD, 0x05, 0x00, 0x00, 0x42, 0x06, 0x00, 0x00

ov85_021EA538: ; 0x021EA538
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov85_021EA548:
	.byte 0x01, 0x0C, 0x12, 0x08, 0x02, 0x0F, 0x94, 0x00
	.byte 0x01, 0x0C, 0x06, 0x08, 0x02, 0x0F, 0xBC, 0x00

ov85_021EA558: ; 0x021EA558
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov85_021EA56C: ; 0x021EA56C
	.byte 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00

ov85_021EA580: ; 0x021EA580
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00

ov85_021EA594: ; 0x021EA594
	.byte 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov85_021EA5AC: ; 0x021EA5AC
	.word 0
	.word 0
	.word ov85_021EA548
	.word ov85_021EA5F4
	.word ov85_021EA698
	.word ov85_021EA6D8

ov85_021EA5C4: ; 0x021EA5C4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov85_021EA5DC: ; 0x021EA5DC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xF4, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00

ov85_021EA5F4:
	.byte 0x01, 0x0C, 0x12, 0x08, 0x02, 0x0F, 0x94, 0x00, 0x01, 0x05, 0x0A, 0x08
	.byte 0x02, 0x0F, 0xBC, 0x00, 0x01, 0x13, 0x0A, 0x08, 0x02, 0x0F, 0xE4, 0x00

ov85_021EA60C: ; 0x021EA60C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA628: ; 0x021EA628
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov85_021EA644: ; 0x021EA644
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA660: ; 0x021EA660
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA67C: ; 0x021EA67C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x07
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA698:
	.byte 0x01, 0x0C, 0x12, 0x08, 0x02, 0x0F, 0x94, 0x00
	.byte 0x01, 0x04, 0x0D, 0x08, 0x02, 0x0F, 0xBC, 0x00, 0x01, 0x0C, 0x06, 0x08, 0x02, 0x0F, 0xE4, 0x00
	.byte 0x01, 0x14, 0x0D, 0x08, 0x02, 0x0F, 0x0C, 0x01

ov85_021EA6B8: ; 0x021EA6B8
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov85_021EA6D8:
	.byte 0x01, 0x0C, 0x13, 0x08, 0x02, 0x0F, 0x94, 0x00
	.byte 0x01, 0x04, 0x0E, 0x08, 0x02, 0x0F, 0xBC, 0x00, 0x01, 0x06, 0x09, 0x08, 0x02, 0x0F, 0xE4, 0x00
	.byte 0x01, 0x12, 0x09, 0x08, 0x02, 0x0F, 0x0C, 0x01, 0x01, 0x14, 0x0E, 0x08, 0x02, 0x0F, 0x34, 0x01

ov85_021EA700: ; 0x021EA700
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00

ov85_021EA728: ; 0x021EA728
	.byte 0x00, 0x00, 0x00, 0x00

ov85_021EA72C: ; 0x021EA72C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00
	.byte 0x9F, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00
	.byte 0xAF, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x00, 0x00

ov85_021EA758: ; 0x021EA758
	.word 0, 0
	.word 0, 0
	.word 1, ov85_021EA4F0
	.word 2, ov85_021EA4F4
	.word 2, ov85_021EA514
	.word 2, ov85_021EA504

ov85_021EA788: ; 0x021EA788
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB4, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0E, 0x01, 0xB4, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x01, 0xD8, 0x00
	.byte 0x90, 0x00, 0x48, 0x00

ov85_021EA7C4: ; 0x021EA7C4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x0E, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x5A, 0x00, 0xD2, 0x00, 0x4A, 0x01, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00, 0xB4, 0x00
	.byte 0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00, 0xA2, 0x00, 0xEA, 0x00, 0x32, 0x01, 0x12, 0x00

ov85_021EA800: ; 0x021EA800
	.word ov85_021E5AF8
	.word ov85_021E5B0C
	.word ov85_021E5B30
	.word ov85_021E5B48
	.word ov85_021E5B78
	.word ov85_021E5B98
	.word ov85_021E5BC8
	.word ov85_021E5C58
	.word ov85_021E5C80
	.word ov85_021E5CA4
	.word ov85_021E5CD0
	.word ov85_021E5CE4
	.word ov85_021E5CFC
	.word ov85_021E5D20
	.word ov85_021E5D3C
	.word ov85_021E5D84
	.word ov85_021E5DAC
	.word ov85_021E5E30
	.word ov85_021E5EB4
	.word ov85_021E5EE8
	.word ov85_021E5F10
	.word ov85_021E5F3C
	.word ov85_021E5F58
	.word ov85_021E5F6C
	.word ov85_021E5F84
	.word ov85_021E5F9C
	.word ov85_021E5FD0
	.word ov85_021E5FE0
	.word ov85_021E60F0
	.word ov85_021E61C8
	.word ov85_021E61FC
	.word ov85_021E6224
	.word ov85_021E62A0
	.word ov85_021E62B4
	.word ov85_021E62D8
	.word ov85_021E636C
	.word ov85_021E63D8
	.word ov85_021E6420
	.word ov85_021E6474
	.word ov85_021E6498
	.word ov85_021E652C
	.word ov85_021E6550
	.word ov85_021E657C
	.word ov85_021E6594
	.word ov85_021E65D4
	.word ov85_021E6610
	.word ov85_021E6644
	.word ov85_021E6658
	.word ov85_021E6674
	.word ov85_021E6694
	.word ov85_021E66F4
	.word ov85_021E670C
	.word ov85_021E6748
	.word ov85_021E6760

ov85_021EA8D8: ; 0x021EA8D8
	.byte 0x00, 0x17, 0x0D, 0x07, 0x04, 0x0D, 0x78, 0x01

ov85_021EA8E0: ; 0x021EA8E0
	.byte 0xA0, 0x01, 0xA0, 0x07, 0xA0, 0x0D, 0xA0, 0x13, 0xA0, 0x19

ov85_021EA8EA: ; 0x021EA8EA
	.byte 0x08

ov85_021EA8EB: ; 0x021EA8EB
	.byte 0x02, 0x08, 0x03, 0x08, 0x04
	.byte 0x18, 0x00, 0x00, 0xFF

ov85_021EA8F4: ; 0x021EA8F4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov85_021EA904: ; 0x021EA904
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00

ov85_021EA914: ; 0x021EA914
	.byte 0xCC, 0x00, 0x54, 0x00, 0xCC, 0x00, 0x35, 0x00, 0xE9, 0x00, 0x48, 0x00
	.byte 0xDF, 0x00, 0x67, 0x00, 0xB8, 0x00, 0x67, 0x00, 0xAE, 0x00, 0x48, 0x00

ov85_021EA92C: ; 0x021EA92C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA948: ; 0x021EA948
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov85_021EA964: ; 0x021EA964
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA980: ; 0x021EA980
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA99C: ; 0x021EA99C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA9B8: ; 0x021EA9B8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov85_021EA9E0: ; 0x021EA9E0
	.word ov85_021E92B8
	.word ov85_021E9440
	.word ov85_021E948C
	.word ov85_021E92F8
	.word ov85_021E94BC
	.word ov85_021E94EC
	.word ov85_021E9614
	.word ov85_021E962C
	.word ov85_021E96B0
	.word ov85_021E98E0
	.word ov85_021E9900
	.word ov85_021E993C
	.word ov85_021E996C
	.word ov85_021E9A1C
	.word ov85_021E9A6C
	.word ov85_021E9A90
	.word ov85_021E9AB0
	.word ov85_021E9AF0
	.word ov85_021E9B1C
	.word ov85_021E9B40
	.word ov85_021E9BA0
	.word ov85_021E9BDC
	.word ov85_021E96D0
	.word ov85_021E9700
	.word ov85_021E97B8
	.word ov85_021E97E8
	.word ov85_021E9814
	.word ov85_021E9834
	.word ov85_021E9864
	.word ov85_021E98C4
	.word ov85_021E9468
	.word ov85_021E9C50

	.data

_021EAA80:
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x021EAAC0
